Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A770F606A88C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 08:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RbiUg6Zh;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=GO50dc6/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=DezbHtCd3hypT1eHDNwCunwup1tFxqb9i/BJNZQvL3k=; b=RbiUg6Zhno5q5c/dgvjvhjx7ac
	ufMarXSgT7ijJ98MrPgbvutwH3D1/Lt+k1d3Iejnzg1IGSNGNiTTyoc43OaWpiJtcQwGCnste6gPr
	zCo8LoO3EoRXjfx0Ha4BItA5DPIicFPdR8OxA3SKLpoBfjrcyrSCV3J6bEyFDVxLEE5JSk2VPEg3r
	R200cDEaw9hsgdXJUdX0cz+9e06ODXyzWC7PGfUGAalvbSI55AyHPp7PwX1bAffjfXUbTMJBN8ux+
	IPXL9AcDi5juatx0YFo/JptiCk6UaG6gwlMXAmdD2kfVS8/NBsB1B59L4F3c1pVoA8Q0JOT7AOJqq
	WY3qutKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTEou-00000004vml-2gTW;
	Tue, 17 Nov 2026 08:45:40 +0000
Received: from mout-p-103.mailbox.org ([80.241.56.161])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTEoo-00000004vlg-3VOT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 08:45:39 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4jTJGK3mhYzKnh3;
	Tue, 17 Nov 2026 09:45:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1794905129;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=DezbHtCd3hypT1eHDNwCunwup1tFxqb9i/BJNZQvL3k=;
	b=GO50dc6/HVjeV41229FKdWwES4NpxJJhDlDZigkZ3+vM29imYgmk90hxAjJeH93i73BSH+
	8y7RPFasxVbOKg5+zYF1b3WPdOZIQ30nU/JRGxHW3qXGsWEbh6mPjfBR2lxoLN9A53snN5
	Kmx24gb08ySNfOtBnwMS3gqUMGgbptePByNUwnmZPGhRwCjmKLtsUh3J4UoOu0C9NMKFR4
	gBq74VDdGpfHSExtPn9UaTTnUfBYOnseqMNMY8tGOKkIpdril77Xpyg10cunUnF9YkKn+e
	Uux1WarCFtKCiqIWbos5DwfFOBWYdNgji+sfA2u7tp9ewbCicQQ9o8PHcoIvwA==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Breno Leitao <leitao@debian.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Edward Adam Davis <eadavis@sina.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Kees Cook <kees+treewide@kernel.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Simek <michal.simek@amd.com>,
	Oleg Nesterov <oleg@redhat.com>,
	Pan Chuang <panchuang@vivo.com>,
	Pavel Tikhomirov <ptikhomirov@virtuozzo.com>,
	Petr Mladek <pmladek@suse.com>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	arm-scmi@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	systemd-devel@lists.freedesktop.org
Subject: [PATCH] [RFC] kernel/reboot: Add orderly_suspend() via /sbin/suspend user mode helper
Date: Tue, 17 Nov 2026 09:44:19 +0100
Message-ID: <20261117084523.50711-1-marek.vasut+renesas@mailbox.org>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: f8999e5d1c94626d345
X-MBO-RS-META: rnnwiz1qpbuo1m538wigdx8oazjoq1un
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_004535_340046_66F2CAE7 
X-CRM114-Status: GOOD (  24.51  )
X-Spam-Score: -2.8 (--)
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

Currently, Linux responds to firmware-issued poweroff and reboot requests
by invoking user mode helpers /sbin/poweroff and /sbin/reboot, which give
userspace the ability to perform orderly poweroff and reboot according to
policy set by userspace.

This is not the case for firmware-issued suspend request, which directly
invokes pm_suspend(PM_SUSPEND_MEM), without giving userspace any way to
determine the suspend policy. This is problematic, because the userspace
might not be quite ready to suspend right the instant when the suspend
request from firmware arrives, e.g. because the user is interacting with
the device and the userspace knows that interaction will end in the near
future, at which point the system can be suspended perfectly well.

Introduce a user mode helper, /sbin/suspend, which acts the same way as
the other user mode helpers, and which is invoked when firmware-issued
suspend request arrives. Userspace can use the helper to apply suspend
policy, most likely by invoking init system suspend target. In case the
helper is not present, retain current behavior and suspend immediately.

Note that /sbin/suspend is non-standard. I also considered registering
an input device and sending KEY_SUSPEND via such a device, but that does
not seems nice. I also had a look at wake locks, but I don't think this
is the right tool either. I am sending this as an RFC, because I would
like to get input on this. I am including change for two platforms, SCMI
and ZynqMP, which could benefit from this. Thank you for your input !

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Breno Leitao <leitao@debian.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>
Cc: Edward Adam Davis <eadavis@sina.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Kees Cook <kees+treewide@kernel.org>
Cc: Marco Crivellari <marco.crivellari@suse.com>
Cc: Michal Simek <michal.simek@amd.com>
Cc: Oleg Nesterov <oleg@redhat.com>
Cc: Pan Chuang <panchuang@vivo.com>
Cc: Pavel Tikhomirov <ptikhomirov@virtuozzo.com>
Cc: Petr Mladek <pmladek@suse.com>
Cc: Petr Pavlu <petr.pavlu@suse.com>
Cc: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>
Cc: arm-scmi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-renesas-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: systemd-devel@lists.freedesktop.org
---
 .../firmware/arm/scmi/scmi_power_control.c    | 11 +-----
 drivers/soc/xilinx/zynqmp_power.c             |  4 +--
 include/linux/reboot.h                        |  1 +
 kernel/reboot.c                               | 34 +++++++++++++++++++
 4 files changed, 38 insertions(+), 12 deletions(-)

diff --git a/drivers/firmware/arm/scmi/scmi_power_control.c b/drivers/firmware/arm/scmi/scmi_power_control.c
index e791a206768c2..b61afb46ca7ef 100644
--- a/drivers/firmware/arm/scmi/scmi_power_control.c
+++ b/drivers/firmware/arm/scmi/scmi_power_control.c
@@ -80,7 +80,6 @@ enum scmi_syspower_state {
  * @reboot_nb: A notifier_block optionally used to track reboot progress
  * @forceful_work: A worker used to trigger a forceful transition once a
  *		   graceful has timed out.
- * @suspend_work: A worker used to trigger system suspend
  */
 struct scmi_syspower_conf {
 	struct device *dev;
@@ -93,7 +92,6 @@ struct scmi_syspower_conf {
 	struct notifier_block reboot_nb;
 
 	struct delayed_work forceful_work;
-	struct work_struct suspend_work;
 };
 
 #define userspace_nb_to_sconf(x)	\
@@ -254,7 +252,7 @@ static void scmi_request_graceful_transition(struct scmi_syspower_conf *sc,
 		orderly_reboot();
 		break;
 	case SCMI_SYSTEM_SUSPEND:
-		schedule_work(&sc->suspend_work);
+		orderly_suspend();
 		break;
 	default:
 		break;
@@ -323,11 +321,6 @@ static int scmi_userspace_notifier(struct notifier_block *nb,
 	return NOTIFY_OK;
 }
 
-static void scmi_suspend_work_func(struct work_struct *work)
-{
-	pm_suspend(PM_SUSPEND_MEM);
-}
-
 static int scmi_syspower_probe(struct scmi_device *sdev)
 {
 	int ret;
@@ -352,8 +345,6 @@ static int scmi_syspower_probe(struct scmi_device *sdev)
 	sc->dev = &sdev->dev;
 	dev_set_drvdata(&sdev->dev, sc);
 
-	INIT_WORK(&sc->suspend_work, scmi_suspend_work_func);
-
 	return handle->notify_ops->devm_event_notifier_register(sdev,
 							   SCMI_PROTOCOL_SYSTEM,
 					 SCMI_EVENT_SYSTEM_POWER_STATE_NOTIFIER,
diff --git a/drivers/soc/xilinx/zynqmp_power.c b/drivers/soc/xilinx/zynqmp_power.c
index ce75bc5ca9633..cd1cab58e84ca 100644
--- a/drivers/soc/xilinx/zynqmp_power.c
+++ b/drivers/soc/xilinx/zynqmp_power.c
@@ -112,7 +112,7 @@ static irqreturn_t zynqmp_pm_isr(int irq, void *data)
 			orderly_poweroff(true);
 			break;
 		case SUSPEND_POWER_REQUEST:
-			pm_suspend(PM_SUSPEND_MEM);
+			orderly_suspend();
 			break;
 		default:
 			pr_err("%s Unsupported InitSuspendCb reason code %d\n",
@@ -196,7 +196,7 @@ static void zynqmp_pm_init_suspend_work_fn(struct work_struct *work)
 	if (pm_work->args[0] == SUSPEND_SYSTEM_SHUTDOWN) {
 		orderly_poweroff(true);
 	} else if (pm_work->args[0] == SUSPEND_POWER_REQUEST) {
-		pm_suspend(PM_SUSPEND_MEM);
+		orderly_suspend();
 	} else {
 		pr_err("%s Unsupported InitSuspendCb reason code %d.\n",
 		       __func__, pm_work->args[0]);
diff --git a/include/linux/reboot.h b/include/linux/reboot.h
index aa08c3bbbf59a..c009deb3eb2b6 100644
--- a/include/linux/reboot.h
+++ b/include/linux/reboot.h
@@ -177,6 +177,7 @@ void ctrl_alt_del(void);
 
 extern void orderly_poweroff(bool force);
 extern void orderly_reboot(void);
+extern void orderly_suspend(void);
 
 /**
  * enum hw_protection_action - Hardware protection action
diff --git a/kernel/reboot.c b/kernel/reboot.c
index bc71183d4ad87..1d830051dc920 100644
--- a/kernel/reboot.c
+++ b/kernel/reboot.c
@@ -851,6 +851,7 @@ void ctrl_alt_del(void)
 #define POWEROFF_CMD_PATH_LEN  256
 static char poweroff_cmd[POWEROFF_CMD_PATH_LEN] = "/sbin/poweroff";
 static const char reboot_cmd[] = "/sbin/reboot";
+static const char suspend_cmd[] = "/sbin/suspend";
 
 static int run_cmd(const char *cmd)
 {
@@ -872,6 +873,20 @@ static int run_cmd(const char *cmd)
 	return ret;
 }
 
+static int __orderly_suspend(void)
+{
+	int ret;
+
+	ret = run_cmd(suspend_cmd);
+
+	if (ret) {
+		pr_info("Failed to start orderly suspend: fall back to suspend-to-mem\n");
+		pm_suspend(PM_SUSPEND_MEM);
+	}
+
+	return ret;
+}
+
 static int __orderly_reboot(void)
 {
 	int ret;
@@ -951,6 +966,25 @@ void orderly_reboot(void)
 }
 EXPORT_SYMBOL_GPL(orderly_reboot);
 
+static void suspend_work_func(struct work_struct *work)
+{
+	__orderly_suspend();
+}
+
+static DECLARE_WORK(suspend_work, suspend_work_func);
+
+/**
+ * orderly_suspend - Trigger an orderly system suspend
+ *
+ * This may be called from any context to trigger a system suspend.
+ * If the orderly suspend fails, it will force an immediate suspend.
+ */
+void orderly_suspend(void)
+{
+	schedule_work(&suspend_work);
+}
+EXPORT_SYMBOL_GPL(orderly_suspend);
+
 static const char *hw_protection_action_str(enum hw_protection_action action)
 {
 	switch (action) {
-- 
2.53.0


