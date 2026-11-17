Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 045C0606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 13:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=B32SEFeV;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=lhRXqfF/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=T7T7UGIIkVUgG9LfHoVSYdrZwZAi99AYKs3CGE26d2s=; b=B32SEFeVMkpHi/
	ATR7rHEiLKkmjjqlcXU430vFE9kbtuLhA7yw/Z3TOOIwoydmCYMQ3qaeOulHjsWsrb0olGC1glS/+
	aoc01FzJsv915J3LY33/0IBkwMvlPCunAHttSI9329+5znTP5QdnUQBYiBSinka6xRVC6Y3x9p/8K
	Hl9hYo3buPucjyevefH9IbcvzjTJXRAD6zAwOI/lQsJLTJ7r+X5p5Z0iLp7If4sllQQ2+gwPvxK8n
	+Vtx3QScCu69Agf79NOXYjsO/QFPOw+gBySWSXJ683zAZK2zaTibPlkmTI2UPYcVkWb669TBjXEeq
	zQxlybt9YmwTPDDvOvlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTJCj-00000005vIt-3QJz;
	Tue, 17 Nov 2026 13:26:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTJCb-00000005vFJ-1Sto
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 13:26:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DB3DC1688;
	Tue, 17 Nov 2026 05:26:21 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A6A943F632;
	Tue, 17 Nov 2026 05:26:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794921984; bh=vK/miWmof/8h+vBME1eqAohgMhzjU0W7rnh1mXlNVDw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lhRXqfF/HfCs5Kz9DH6iz6x718uppDib07fhNCokcLhBhJO6WCMyCf2+oH6hWehXz
	 oSZGrC5k5p+5BsoWTwPzPpXPPhWl+nTf0S//JH8psWkz2pQOuCH2L8rqlElL6+7h3A
	 OWD829LtetvxmFbiQBH6ygUmKWsIa3aB+PoM7Mao=
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org
Cc: sudeep.holla@kernel.org,
	philip.radford@arm.com,
	Cristian Marussi <cristian.marussi@arm.com>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v2 2/2] firmware: arm_scmi: Fix SCMI Power Control driver removal
Date: Tue, 17 Nov 2026 13:23:11 +0000
Message-ID: <20261117132311.291199-3-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261117132311.291199-1-cristian.marussi@arm.com>
References: <20261117132311.291199-1-cristian.marussi@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_052625_479274_47C7D41D 
X-CRM114-Status: GOOD (  20.85  )
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

Once a reboot is initiated following a graceful shutdown request received
from the SCMI platform server there are a couple of registered notifiers
and possibly a scheduled delayed work.

Take care to properly stop, unregister and cleanup all such resources
when the driver is unbound.

Fixes: 2c4b97fee94a ("firmware: arm_scmi: Add SCMI System Power Control driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-dbe4eba7-1520-40a1-92e8-8892b6e47c4b
Tested-by: Cristian Marussi <cristian.marussi@arm.com>
Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
 .../firmware/arm_scmi/scmi_power_control.c    | 88 +++++++++++++++++--
 1 file changed, 82 insertions(+), 6 deletions(-)

diff --git a/drivers/firmware/arm_scmi/scmi_power_control.c b/drivers/firmware/arm_scmi/scmi_power_control.c
index bbccebe834c3..82cc6e6bb96f 100644
--- a/drivers/firmware/arm_scmi/scmi_power_control.c
+++ b/drivers/firmware/arm_scmi/scmi_power_control.c
@@ -43,6 +43,7 @@
  * possibly emitted by the platform will be ignored.
  */
 
+#include <linux/cleanup.h>
 #include <linux/math.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
@@ -51,6 +52,7 @@
 #include <linux/reboot.h>
 #include <linux/scmi_protocol.h>
 #include <linux/slab.h>
+#include <linux/srcu.h>
 #include <linux/suspend.h>
 #include <linux/time64.h>
 #include <linux/timer.h>
@@ -75,6 +77,8 @@ enum scmi_syspower_state {
  * @state_mtx: @state related mutex
  * @required_transition: The requested transition as decribed in the received
  *			 SCMI SystemPower notification
+ * @dead_srcu: Am SRCU to protect dead flag
+ * @dead: A boolean flag to be set during driver removal
  * @userspace_nb: The notifier_block registered against the SCMI SystemPower
  *		  notification to start the needed userspace interactions.
  * @reboot_nb: A notifier_block optionally used to track reboot progress
@@ -89,6 +93,10 @@ struct scmi_syspower_conf {
 	struct mutex state_mtx;
 	enum scmi_system_events required_transition;
 
+	/* Protect dead */
+	struct srcu_struct dead_srcu;
+	bool dead;
+
 	struct notifier_block userspace_nb;
 	struct notifier_block reboot_nb;
 
@@ -105,6 +113,9 @@ struct scmi_syspower_conf {
 #define dwork_to_sconf(x)		\
 	container_of(x, struct scmi_syspower_conf, forceful_work)
 
+#define work_to_sconf(x)		\
+	container_of(x, struct scmi_syspower_conf, suspend_work)
+
 /**
  * scmi_reboot_notifier  - A reboot notifier to catch an ongoing successful
  * system transition
@@ -122,6 +133,10 @@ static int scmi_reboot_notifier(struct notifier_block *nb,
 {
 	struct scmi_syspower_conf *sc = reboot_nb_to_sconf(nb);
 
+	guard(srcu)(&sc->dead_srcu);
+	if (READ_ONCE(sc->dead))
+		return NOTIFY_DONE;
+
 	mutex_lock(&sc->state_mtx);
 	switch (reason) {
 	case SYS_HALT:
@@ -188,6 +203,10 @@ static void scmi_forceful_work_func(struct work_struct *work)
 	dwork = to_delayed_work(work);
 	sc = dwork_to_sconf(dwork);
 
+	guard(srcu)(&sc->dead_srcu);
+	if (READ_ONCE(sc->dead))
+		return;
+
 	mutex_lock(&sc->state_mtx);
 	if (sc->state == SCMI_SYSPOWER_IN_PROGRESS) {
 		dev_dbg(sc->dev, "Graceful request timed out...forcing !\n");
@@ -225,8 +244,6 @@ static void scmi_request_graceful_transition(struct scmi_syspower_conf *sc,
 		if (!ret) {
 			/* Wait only up to 75% of the advertised timeout */
 			adj_timeout_ms = mult_frac(timeout_ms, 3, 4);
-			INIT_DELAYED_WORK(&sc->forceful_work,
-					  scmi_forceful_work_func);
 			schedule_delayed_work(&sc->forceful_work,
 					      msecs_to_jiffies(adj_timeout_ms));
 		} else {
@@ -285,6 +302,10 @@ static int scmi_userspace_notifier(struct notifier_block *nb,
 	struct scmi_system_power_state_notifier_report *er = data;
 	struct scmi_syspower_conf *sc = userspace_nb_to_sconf(nb);
 
+	guard(srcu)(&sc->dead_srcu);
+	if (READ_ONCE(sc->dead))
+		return NOTIFY_DONE;
+
 	if (er->system_state >= SCMI_SYSTEM_MAX ||
 	    er->system_state == SCMI_SYSTEM_POWERUP) {
 		dev_err(sc->dev, "Ignoring unsupported system_state: 0x%X\n",
@@ -326,6 +347,14 @@ static int scmi_userspace_notifier(struct notifier_block *nb,
 
 static void scmi_suspend_work_func(struct work_struct *work)
 {
+	struct scmi_syspower_conf *sc;
+
+	sc = work_to_sconf(work);
+
+	guard(srcu)(&sc->dead_srcu);
+	if (READ_ONCE(sc->dead))
+		return;
+
 	pm_suspend(PM_SUSPEND_MEM);
 }
 
@@ -346,6 +375,10 @@ static int scmi_syspower_probe(struct scmi_device *sdev)
 	if (!sc)
 		return -ENOMEM;
 
+	ret = init_srcu_struct(&sc->dead_srcu);
+	if (ret)
+		return ret;
+
 	sc->state = SCMI_SYSPOWER_IDLE;
 	mutex_init(&sc->state_mtx);
 	sc->required_transition = SCMI_SYSTEM_MAX;
@@ -353,12 +386,54 @@ static int scmi_syspower_probe(struct scmi_device *sdev)
 	sc->dev = &sdev->dev;
 	dev_set_drvdata(&sdev->dev, sc);
 
+	INIT_DELAYED_WORK(&sc->forceful_work, scmi_forceful_work_func);
 	INIT_WORK(&sc->suspend_work, scmi_suspend_work_func);
 
-	return handle->notify_ops->devm_event_notifier_register(sdev,
-							   SCMI_PROTOCOL_SYSTEM,
-					 SCMI_EVENT_SYSTEM_POWER_STATE_NOTIFIER,
-						       NULL, &sc->userspace_nb);
+	ret = handle->notify_ops->event_notifier_register(handle, SCMI_PROTOCOL_SYSTEM,
+							  SCMI_EVENT_SYSTEM_POWER_STATE_NOTIFIER,
+							  NULL, &sc->userspace_nb);
+	if (ret) {
+		cleanup_srcu_struct(&sc->dead_srcu);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void scmi_syspower_remove(struct scmi_device *sdev)
+{
+	struct scmi_handle *handle = sdev->handle;
+	struct scmi_syspower_conf *sc;
+	int ret;
+
+	sc = dev_get_drvdata(&sdev->dev);
+	if (!sc)
+		return;
+
+	/* Wait for any notifier to complete and inhibit further processing */
+	WRITE_ONCE(sc->dead, true);
+	synchronize_srcu(&sc->dead_srcu);
+
+	/*
+	 * Once here any possible in-flight notifier will have completed and
+	 * further notifiers will bailout immediately.
+	 * Cancel any work which was possibly already scheduled.
+	 */
+	cancel_delayed_work_sync(&sc->forceful_work);
+	cancel_work_sync(&sc->suspend_work);
+
+	/* Unregister reboot notifier...if any */
+	unregister_reboot_notifier(&sc->reboot_nb);
+
+	/* Unregister userspace notifier */
+	ret = handle->notify_ops->event_notifier_unregister(handle,
+							    SCMI_PROTOCOL_SYSTEM,
+							    SCMI_EVENT_SYSTEM_POWER_STATE_NOTIFIER,
+							    NULL, &sc->userspace_nb);
+	if (ret)
+		dev_warn(sc->dev, "Failed to unregister notifier\n");
+
+	cleanup_srcu_struct(&sc->dead_srcu);
 }
 
 static int scmi_system_power_resume(struct device *dev)
@@ -385,6 +460,7 @@ static struct scmi_driver scmi_system_power_driver = {
 	},
 	.name = "scmi-system-power",
 	.probe = scmi_syspower_probe,
+	.remove = scmi_syspower_remove,
 	.id_table = scmi_id_table,
 };
 module_scmi_driver(scmi_system_power_driver);
-- 
2.54.0


