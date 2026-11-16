Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A5A5606A329
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 08:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2zjkCqcz;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=iRrTV024
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=jDMEgU3pAAkuzBbptHC17mrC+iYnBOL0PE3ezJSQuwQ=; b=2zjkCqczrlFQpX
	bMCaoFeZGowf1u2Vu3yIhmor5cEWczwm/SDToESftr75cpIv+lxgnnmb/C0Rpv/S7Q5eYd78t1HZL
	QqSF4B6np+LcRujw+BJ6/alEaXSsPHAcBIgqiDXbfwuQ7J2vTtZg0oWNyxDYzhE0o2lTui0YAXaTf
	Aw7cXBv2AffiuDQv6fZFtikP8DN7dsaAxzpCyQ9wxFcPIFOFY++YRztdNvharq1kBp8DdBXJWk8GJ
	ND/j8W8XSonTdSNfyE++/muaRlKzdKmW3UJ3i21/8fjO7CrgS/zUA0hWpRR5eg+4q9rtZZ5/kGxXA
	BV/c/DHIIroijftG6FOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSsKV-00000001eFA-3xHh;
	Mon, 16 Nov 2026 08:44:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSsKO-00000001eCs-41Wz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 08:44:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 336051713;
	Mon, 16 Nov 2026 00:44:37 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D4A643F673;
	Mon, 16 Nov 2026 00:44:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794818680; bh=MVIVrVn+MfbtQKO5pcUer4ZuZBQC3obEsrNsqTq1eow=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iRrTV024bR3xM4wt4Y+GDGzJFOIok626HqtD6WoUf8mZVHKvYoa7IChfyBlzt3IAg
	 MFSZkEqCAUAMSHtBMt/3O0oCdMzJfe0UNoXDBaNvmM6DbxSbmGVP+eNgbqHjbDuTEf
	 P5YJs8DqtKPk5YD3LEzs5LybhlQABZLk6yIerVsQ=
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org
Cc: sudeep.holla@kernel.org,
	philip.radford@arm.com,
	Chengyu Liu <lui2012qwq@gmail.com>,
	stable@vger.kernel.org,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH 1/2] firmware: arm_scmi: Fix deadlock between reboot notifier and forceful work
Date: Mon, 16 Nov 2026 08:42:10 +0000
Message-ID: <20261116084211.3066460-2-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261116084211.3066460-1-cristian.marussi@arm.com>
References: <20261116084211.3066460-1-cristian.marussi@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_004441_076216_7F52B46A 
X-CRM114-Status: GOOD (  18.02  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Chengyu Liu <lui2012qwq@gmail.com>

scmi_reboot_notifier() calls cancel_delayed_work_sync() while holding
sc->state_mtx, but the work it waits on - scmi_forceful_work_func() -
takes the same mutex.  If a forceful transition work is in flight when
the reboot notifier fires, the notifier holds the lock and waits for
the callback while the callback waits for the lock: deadlock, and the
reboot wedges.

Moving the cancel outside the lock is not sufficient on its own, as the
callback also calls unregister_reboot_notifier() unconditionally, which
blocks on the reboot chain rwsem (down_write vs. the in-progress
chain's down_read) while the notifier waits for the callback - the
deadlock would just move to a different lock.  Fix both sides:

- Notifier: compute the decision under state_mtx, drop the lock, then
  cancel.  A callback that slips in between sees state ==
  SCMI_SYSPOWER_REBOOTING (not IN_PROGRESS), skips the forceful
  request and finishes, so the cancel cannot miss it.  (The callback's
  own system_state early-return does not cover a work item that
  started before the reboot began: kernel_restart_prepare() runs the
  notifier chain before setting system_state.)

- Callback: only unregister the reboot notifier when actually forcing
  the transition - that is the only case that needs it, because the
  forceful kernel_restart()/kernel_power_off() would otherwise
  re-enter scmi_reboot_notifier and self-deadlock on state_mtx.  When
  the state is not IN_PROGRESS there is nothing to force, and skipping
  the unregister keeps the callback from blocking on the reboot chain
  rwsem while the notifier waits for it.

Found by static analysis.

Cc: stable@vger.kernel.org
Fixes: 2c4b97fee94a ("firmware: arm_scmi: Add SCMI System Power Control driver")
Signed-off-by: Chengyu Liu <lui2012qwq@gmail.com>
[Cristian: drop lock before triggering forceful reboot (needs_forceful)]
Tested-by: Cristian Marussi <cristian.marussi@arm.com>
Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
 .../firmware/arm_scmi/scmi_power_control.c    | 26 ++++++++++++++-----
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/drivers/firmware/arm_scmi/scmi_power_control.c b/drivers/firmware/arm_scmi/scmi_power_control.c
index e791a206768c..e0680e33180e 100644
--- a/drivers/firmware/arm_scmi/scmi_power_control.c
+++ b/drivers/firmware/arm_scmi/scmi_power_control.c
@@ -121,6 +121,7 @@ static int scmi_reboot_notifier(struct notifier_block *nb,
 				unsigned long reason, void *__unused)
 {
 	struct scmi_syspower_conf *sc = reboot_nb_to_sconf(nb);
+	bool cancel_work;
 
 	mutex_lock(&sc->state_mtx);
 	switch (reason) {
@@ -138,11 +139,18 @@ static int scmi_reboot_notifier(struct notifier_block *nb,
 		break;
 	}
 
-	if (sc->state == SCMI_SYSPOWER_REBOOTING) {
+	cancel_work = sc->state == SCMI_SYSPOWER_REBOOTING;
+	mutex_unlock(&sc->state_mtx);
+
+	if (cancel_work) {
 		dev_dbg(sc->dev, "Reboot in progress...cancel delayed work.\n");
+		/*
+		 * cancel_delayed_work_sync() waits for a running
+		 * scmi_forceful_work_func(), which takes state_mtx - it must
+		 * not be called with the lock held.
+		 */
 		cancel_delayed_work_sync(&sc->forceful_work);
 	}
-	mutex_unlock(&sc->state_mtx);
 
 	return NOTIFY_OK;
 }
@@ -181,6 +189,7 @@ static void scmi_forceful_work_func(struct work_struct *work)
 {
 	struct scmi_syspower_conf *sc;
 	struct delayed_work *dwork;
+	bool needs_forceful;
 
 	if (system_state > SYSTEM_RUNNING)
 		return;
@@ -188,13 +197,16 @@ static void scmi_forceful_work_func(struct work_struct *work)
 	dwork = to_delayed_work(work);
 	sc = dwork_to_sconf(dwork);
 
-	dev_dbg(sc->dev, "Graceful request timed out...forcing !\n");
 	mutex_lock(&sc->state_mtx);
-	/* avoid deadlock by unregistering reboot notifier first */
-	unregister_reboot_notifier(&sc->reboot_nb);
-	if (sc->state == SCMI_SYSPOWER_IN_PROGRESS)
-		scmi_request_forceful_transition(sc);
+	needs_forceful = sc->state == SCMI_SYSPOWER_IN_PROGRESS;
 	mutex_unlock(&sc->state_mtx);
+
+	if (needs_forceful) {
+		dev_dbg(sc->dev, "Graceful request timed out...forcing !\n");
+		/* avoid deadlock by unregistering reboot notifier first */
+		unregister_reboot_notifier(&sc->reboot_nb);
+		scmi_request_forceful_transition(sc);
+	}
 }
 
 /**
-- 
2.54.0


