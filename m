Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55DCD606A330
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 09:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OO5EByeg;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=QR5YYnp4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=JnmMVbIw83ezki5KT6mW7oV1wFkBAGupagQ9VIbFe4Y=; b=OO5EByegbVuUg95XZ0YZlxHzu3
	jemaS5SiH0E0IUyThluIYj7sUCkm72EJF3NeorMC66rmhsNri7lv5vs/DVKuSfEuJm+wTTI59ggH2
	UNM3Ct4YzA6lAegkHHHvbhnvFOANhzAXZkVLatWy0eOSHqsgxzgWCALWMIlYLhioc/Z9IHGDCmsZo
	LDzZ31JqDa9vqq6Ofas0x6sre1ZRSMTolwZ/vzAMwByUzlkt4HWAo6vxxo4ZFabO9FC/qvNWwk8+i
	Xrpq3fKTBAto3H5C5Zr/j7HaDPjRFRm9rEVaZhKv8RmB96uTZ+wHoOPkDZU8PTLU/w78MZ53rHJO7
	xPtuTJnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTFN5-000000053QF-17Ud;
	Tue, 17 Nov 2026 09:20:59 +0000
Received: from m16.mail.163.com ([220.197.31.5])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTFN2-000000053O2-1UIV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 09:20:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Jn
	mMVbIw83ezki5KT6mW7oV1wFkBAGupagQ9VIbFe4Y=; b=QR5YYnp4TeJxrlToAy
	ZbcwPUfpR2BPI1UsWO121vDgVUCcMvXmPHpxwRlru4KIAdEAVmgx2I0K+RcMF88T
	gU6SS5Hl+yAVuN7bZIUM2HuQCZCJRP8LLPjwTC69LpqLGKSlt4EAekQl6Ev2b24s
	ryGBc4joDFXey0/dQGyCUW2hI=
Received: from SYPC (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wD3_3ZvHPxqa8ngIA--.50000S2;
	Tue, 17 Nov 2026 17:20:48 +0800 (CST)
From: Yang Siyuan <hsyysy@163.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>
Cc: linux-watchdog@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] watchdog: sunxi_wdt: stop the watchdog across system suspend
Date: Tue, 17 Nov 2026 17:20:36 +0800
Message-ID: <20261117092036.12192-1-hsyysy@163.com>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3_3ZvHPxqa8ngIA--.50000S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxCr1ruryrGFyUZF4Dtr43Jrb_yoW5AFWUpF
	4Yya4FkrWjqr4avr43Aw1DAF1rG34vgrW7AryxG34fA3Z8Gr1rGF18tryjy3ZxGFyrGF1r
	GF1jq3yxGayj9a7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jI_M3UUUUU=
X-CM-SenderInfo: 5kv152r16rljoofrz/xtbC7RD8MWr8HHBv5QAA3A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_012056_711341_56912644 
X-CRM114-Status: GOOD (  15.96  )
X-Spam-Score: 0.4 (/)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The H616 watchdog has a maximum timeout of 16 seconds.  systemd keeps
/dev/watchdog0 open with RuntimeWatchdogSec=16s, but during system
suspend all userspace is frozen and the watchdog core only cancels its
ping worker; it does not stop the hardware.  A suspend longer than the
timeout therefore resets the board before it can resume.

Add system sleep PM ops to stop the watchdog before suspend and restart
it after resume if it was running.  The driver did not store its private
data in the platform device, so add platform_set_drvdata() for the PM
callbacks.

Tested on an Anbernic RG35XX-SP: a 30-second s2idle suspend resumes
without the 16-second watchdog reset, and /dev/watchdog0 keeps working
afterwards.

Signed-off-by: Yang Siyuan <hsyysy@163.com>
---
 drivers/watchdog/sunxi_wdt.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/watchdog/sunxi_wdt.c b/drivers/watchdog/sunxi_wdt.c
index a6500eb..23b50cb 100644
--- a/drivers/watchdog/sunxi_wdt.c
+++ b/drivers/watchdog/sunxi_wdt.c
@@ -55,6 +55,7 @@ struct sunxi_wdt_dev {
 	struct watchdog_device wdt_dev;
 	void __iomem *wdt_base;
 	const struct sunxi_wdt_reg *wdt_regs;
+	bool running_at_suspend;
 };
 
 /*
@@ -225,6 +226,36 @@ static int sunxi_wdt_start(struct watchdog_device *wdt_dev)
 	return 0;
 }
 
+/*
+ * The hardware watchdog has a maximum timeout of 16 seconds.  A system
+ * suspend easily lasts longer than that, and the watchdog core only cancels
+ * its ping worker during suspend; it does not stop the timer.  Stop the
+ * watchdog explicitly while suspended and re-arm it on resume.
+ */
+static int sunxi_wdt_suspend(struct device *dev)
+{
+	struct sunxi_wdt_dev *sunxi_wdt = dev_get_drvdata(dev);
+
+	sunxi_wdt->running_at_suspend = sunxi_wdt_is_running(&sunxi_wdt->wdt_dev);
+	sunxi_wdt_stop(&sunxi_wdt->wdt_dev);
+
+	return 0;
+}
+
+static int sunxi_wdt_resume(struct device *dev)
+{
+	struct sunxi_wdt_dev *sunxi_wdt = dev_get_drvdata(dev);
+
+	if (sunxi_wdt->running_at_suspend)
+		sunxi_wdt_start(&sunxi_wdt->wdt_dev);
+
+	return 0;
+}
+
+static const struct dev_pm_ops sunxi_wdt_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(sunxi_wdt_suspend, sunxi_wdt_resume)
+};
+
 static const struct watchdog_info sunxi_wdt_info = {
 	.identity	= DRV_NAME,
 	.options	= WDIOF_SETTIMEOUT |
@@ -307,6 +338,8 @@ static int sunxi_wdt_probe(struct platform_device *pdev)
 	if (IS_ERR(sunxi_wdt->wdt_base))
 		return PTR_ERR(sunxi_wdt->wdt_base);
 
+	platform_set_drvdata(pdev, sunxi_wdt);
+
 	sunxi_wdt->wdt_dev.info = &sunxi_wdt_info;
 	sunxi_wdt->wdt_dev.ops = &sunxi_wdt_ops;
 	sunxi_wdt->wdt_dev.timeout = WDT_MAX_TIMEOUT;
@@ -348,6 +381,7 @@ static struct platform_driver sunxi_wdt_driver = {
 	.driver		= {
 		.name		= DRV_NAME,
 		.of_match_table	= sunxi_wdt_dt_ids,
+		.pm		= &sunxi_wdt_pm_ops,
 	},
 };
 

base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
-- 
2.56.1


