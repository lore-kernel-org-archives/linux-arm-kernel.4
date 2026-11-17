Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E2E2606A323
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 13:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=a5aaKTEs;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Bd5JfgQd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=fUllIm/XDuS2iQlbpNvDQdzHZZVdN5n8PCpoG/kMHUU=; b=a5aaKTEsXMJRvY
	EwUF5Mp3tucRpthInIswUG4YPpURfm5mM9ux25MHx6RQgxRaTI0Sx6O022MUI/j92e4QLYWOHkrVH
	Wn98dGOk84EHRq5ZvwyRfMO3shBKNgrVt2yrNM1q5zlbNO2rRZtYaSbBt5EOY2/Jp65yfZu1U/oJJ
	45ne1JimbNAH+P9NzdvrxIUv70n/C6abAMDj1MooaiMLYmwhVbLdy2TFODa+nrjRPfZX+YVJEdk6q
	4DMMXOPyMJsBR+N0UolMDvqvzKn+mIjXhHHK0EvZ2IVaTJzv3jjjGgncTnY1KD6I5HykPmCqlFiQj
	ivXUI8PbLm1AlGSv1GUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTJCj-00000005vIZ-31le;
	Tue, 17 Nov 2026 13:26:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTJCa-00000005vF1-1tj4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 13:26:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5E78314BF;
	Tue, 17 Nov 2026 05:26:20 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2E4423F632;
	Tue, 17 Nov 2026 05:26:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794921983; bh=tlMKluP7fnFNOnJbtIoCp+QmSdDQQUNSb1mvylnQg2I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Bd5JfgQdqrGCHSDAmZBwZyEFFczg+m54B75B6qdcgN6QeZZEF0ZtN6Ca1a/nIyopq
	 xi71wVG/GzWAELjA1qWizLw0dGP+rLU84NSdxf6RMG3gnynw4/UREkhGoajd0FuyAS
	 D43A4I0dbhDB4vSf0mrRUI2M4dXv4bQwxO+3IdE8=
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org
Cc: sudeep.holla@kernel.org,
	philip.radford@arm.com,
	Cristian Marussi <cristian.marussi@arm.com>,
	Chengyu Liu <lui2012qwq@gmail.com>
Subject: [PATCH v2 1/2] firmware: arm_scmi: Fix deadlock between reboot notifier and forceful work
Date: Tue, 17 Nov 2026 13:23:10 +0000
Message-ID: <20261117132311.291199-2-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261117132311.291199-1-cristian.marussi@arm.com>
References: <20261117132311.291199-1-cristian.marussi@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_052624_531080_60D60F5C 
X-CRM114-Status: GOOD (  10.42  )
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

When an ongoing reboot is detected scmi_reboot_notifier() cancels the
scheduled pending delayed work by calling cancel_delayed_work_sync():
this is done while holding sc->state_mtx which is also taken by the
worker is trying to synchronously cancel.

Such locking, though, guarantees mutual exclusion between the conflicting
activities carried on by the two threads.

Stop synchronously waiting for the cancellation so as to avoid deadlock.

Fixes: 2c4b97fee94a ("firmware: arm_scmi: Add SCMI System Power Control driver")
Reported-by: Chengyu Liu <lui2012qwq@gmail.com>
Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
 drivers/firmware/arm_scmi/scmi_power_control.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/firmware/arm_scmi/scmi_power_control.c b/drivers/firmware/arm_scmi/scmi_power_control.c
index e791a206768c..bbccebe834c3 100644
--- a/drivers/firmware/arm_scmi/scmi_power_control.c
+++ b/drivers/firmware/arm_scmi/scmi_power_control.c
@@ -140,7 +140,7 @@ static int scmi_reboot_notifier(struct notifier_block *nb,
 
 	if (sc->state == SCMI_SYSPOWER_REBOOTING) {
 		dev_dbg(sc->dev, "Reboot in progress...cancel delayed work.\n");
-		cancel_delayed_work_sync(&sc->forceful_work);
+		cancel_delayed_work(&sc->forceful_work);
 	}
 	mutex_unlock(&sc->state_mtx);
 
@@ -188,12 +188,13 @@ static void scmi_forceful_work_func(struct work_struct *work)
 	dwork = to_delayed_work(work);
 	sc = dwork_to_sconf(dwork);
 
-	dev_dbg(sc->dev, "Graceful request timed out...forcing !\n");
 	mutex_lock(&sc->state_mtx);
-	/* avoid deadlock by unregistering reboot notifier first */
-	unregister_reboot_notifier(&sc->reboot_nb);
-	if (sc->state == SCMI_SYSPOWER_IN_PROGRESS)
+	if (sc->state == SCMI_SYSPOWER_IN_PROGRESS) {
+		dev_dbg(sc->dev, "Graceful request timed out...forcing !\n");
+		/* avoid deadlock by unregistering reboot notifier first */
+		unregister_reboot_notifier(&sc->reboot_nb);
 		scmi_request_forceful_transition(sc);
+	}
 	mutex_unlock(&sc->state_mtx);
 }
 
-- 
2.54.0


