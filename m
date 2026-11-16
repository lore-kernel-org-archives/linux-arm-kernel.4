Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25FB5606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 08:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XxjJfaSi;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=O1KFWUzH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=hd1aKH1n90Rfgfu+QVPNJhZOsMqkyhkILEACRzGRf3E=; b=XxjJfaSi13omOW
	pDTNxqtNRdOpbYIZo50VmnPH/0h/Kqu+uBJPiUJ1JyhYfk331QwcQpDafKwiCUA+SNHQ3qLU8a99y
	58acRCo4RFZ1GVlhKY3xBe7xCMD/kUhxud22tCO5KrK4MQoau7TvbMdii7w+zacmc47TInx5zjwOx
	Zy0EAD2H4XNzMmdrtGUDXmXSYgzZVPTxGcgA04g4ec02Z3xjSklrRUKs2EUb8IDMHc9TQk0PcectE
	F/a863guiTW73E6tGKS2/yYfcNjQsHk7k1ij5n/EsXPBGUlBpEsCOBB17CygzN14LUIFVWjdj+xFk
	/bSIAUfaLZ/wbpqcLubg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSsKW-00000001eFU-0Fsw;
	Mon, 16 Nov 2026 08:44:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSsKQ-00000001eDm-2oUt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 08:44:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AA71719F0;
	Mon, 16 Nov 2026 00:44:38 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7AD043F673;
	Mon, 16 Nov 2026 00:44:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794818681; bh=7IMvt+u0+btiak1eYmUIolBpcJMAvNwLaS8aeollN2I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=O1KFWUzHuBpfAl9T4SwIgZ4m/l/NTxDP7+tiKsCzt8MMtPBE2dbK7nW8he3bDVmIv
	 MWvBlNJBP36K99V34FdhqNq77JoUCkJFzH0oFQtE9hgIHv1mE92xNKg4wBcR18gBxM
	 CihWhOW1XqAmyiDWtQpIMLAtiWddKMVjGwze4aME=
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org
Cc: sudeep.holla@kernel.org,
	philip.radford@arm.com,
	Cristian Marussi <cristian.marussi@arm.com>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH 2/2] firmware: arm_scmi: Fix SCMI Power Control driver removal
Date: Mon, 16 Nov 2026 08:42:11 +0000
Message-ID: <20261116084211.3066460-3-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261116084211.3066460-1-cristian.marussi@arm.com>
References: <20261116084211.3066460-1-cristian.marussi@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_004442_818130_F5CDE3D2 
X-CRM114-Status: GOOD (  19.84  )
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
 .../firmware/arm_scmi/scmi_power_control.c    | 76 +++++++++++++++++--
 1 file changed, 70 insertions(+), 6 deletions(-)

diff --git a/drivers/firmware/arm_scmi/scmi_power_control.c b/drivers/firmware/arm_scmi/scmi_power_control.c
index e0680e33180e..b0a10fd92fa6 100644
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
 
@@ -123,6 +131,10 @@ static int scmi_reboot_notifier(struct notifier_block *nb,
 	struct scmi_syspower_conf *sc = reboot_nb_to_sconf(nb);
 	bool cancel_work;
 
+	guard(srcu)(&sc->dead_srcu);
+	if (READ_ONCE(sc->dead))
+		return NOTIFY_DONE;
+
 	mutex_lock(&sc->state_mtx);
 	switch (reason) {
 	case SYS_HALT:
@@ -197,6 +209,10 @@ static void scmi_forceful_work_func(struct work_struct *work)
 	dwork = to_delayed_work(work);
 	sc = dwork_to_sconf(dwork);
 
+	guard(srcu)(&sc->dead_srcu);
+	if (READ_ONCE(sc->dead))
+		return;
+
 	mutex_lock(&sc->state_mtx);
 	needs_forceful = sc->state == SCMI_SYSPOWER_IN_PROGRESS;
 	mutex_unlock(&sc->state_mtx);
@@ -236,8 +252,6 @@ static void scmi_request_graceful_transition(struct scmi_syspower_conf *sc,
 		if (!ret) {
 			/* Wait only up to 75% of the advertised timeout */
 			adj_timeout_ms = mult_frac(timeout_ms, 3, 4);
-			INIT_DELAYED_WORK(&sc->forceful_work,
-					  scmi_forceful_work_func);
 			schedule_delayed_work(&sc->forceful_work,
 					      msecs_to_jiffies(adj_timeout_ms));
 		} else {
@@ -296,6 +310,10 @@ static int scmi_userspace_notifier(struct notifier_block *nb,
 	struct scmi_system_power_state_notifier_report *er = data;
 	struct scmi_syspower_conf *sc = userspace_nb_to_sconf(nb);
 
+	guard(srcu)(&sc->dead_srcu);
+	if (READ_ONCE(sc->dead))
+		return NOTIFY_DONE;
+
 	if (er->system_state >= SCMI_SYSTEM_MAX ||
 	    er->system_state == SCMI_SYSTEM_POWERUP) {
 		dev_err(sc->dev, "Ignoring unsupported system_state: 0x%X\n",
@@ -357,6 +375,10 @@ static int scmi_syspower_probe(struct scmi_device *sdev)
 	if (!sc)
 		return -ENOMEM;
 
+	ret = init_srcu_struct(&sc->dead_srcu);
+	if (ret)
+		return ret;
+
 	sc->state = SCMI_SYSPOWER_IDLE;
 	mutex_init(&sc->state_mtx);
 	sc->required_transition = SCMI_SYSTEM_MAX;
@@ -364,12 +386,53 @@ static int scmi_syspower_probe(struct scmi_device *sdev)
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
+	 * Once here any possible in-flight userspace or reboot notifier
+	 * will have completed and further notifiers will bailout immediately.
+	 * Cancel any work which was possibly already scheduled.
+	 */
+	cancel_delayed_work_sync(&sc->forceful_work);
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
@@ -396,6 +459,7 @@ static struct scmi_driver scmi_system_power_driver = {
 	},
 	.name = "scmi-system-power",
 	.probe = scmi_syspower_probe,
+	.remove = scmi_syspower_remove,
 	.id_table = scmi_id_table,
 };
 module_scmi_driver(scmi_system_power_driver);
-- 
2.54.0


