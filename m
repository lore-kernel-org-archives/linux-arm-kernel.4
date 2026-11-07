Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F334606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 18:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UJ78OEQr;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lih/R/Ko
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=BYbBpOX1ICSydHDClkzINp6GH4fkbXId2tUAz3RtG28=; b=UJ78OEQrHUAYlz
	1v1nYFcBbojujRp0vXZn0aLakEG6JjvXiUZi2P9mzLEwI9xbUOK+zEZhJvZIn0VsCNKRZCYwlTlC9
	r9DhJ5Pb7fMo4CpkWSa5dnLHahwpNyWdISwtfkJaI7VZQu1zUND/5WveqFkgacE7oq5kP1JkNZL25
	UlYIP5hbg/O99WYEE2KckXbASDXDuB+OoA6VFdJQxEYoQpwZRrBs4+pSyJkiX/e9eoFIGzfNpZ/PF
	2wIX2zPZn/6ne/9qYrA0kF3JEuaRTihrO22nqwpBJlZXjxx/ZZclaaaoZe8ZgCXUQy87XtaO1TGVF
	1EIgGArUQ9zJzR3ZYaQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPl3q-0000000FA8d-0FFK;
	Sat, 07 Nov 2026 18:22:42 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPl3U-0000000F9qI-2WGT
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 18:22:25 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so14542495e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Nov 2026 10:22:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794075739; x=1794680539; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BYbBpOX1ICSydHDClkzINp6GH4fkbXId2tUAz3RtG28=;
        b=lih/R/KoMwYW/LkfxA3BqQMQ5i/s2uW4RLwQHxOF68dGawdzr8M3oiIbm7CiycLbr1
         QSyM7RJlNSg2vxN9HItqI+YKESaTi/TFI6bGnlb1aTc4H/BZeR4rAvYc0t95nHMXXxwD
         zl/Z8eXKtc6Cd/Xz9jQ7OVK8iovOL6Zr65c+CpgqzndVbgVuwE/WtASf0LfGszyz/Bz5
         DM19C1c7B5jahiKN+pgBLBZ1n+r7qz846n+tKV6QdqK+tjdrdoNYwIGg2K55IIDY66MO
         CLMiDD9jI/CkBV09Ge816CuvwTRj2gKlnx3VutkFBugP3j/YJxewD5ur9T8jPtDbBwBu
         azEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794075739; x=1794680539;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BYbBpOX1ICSydHDClkzINp6GH4fkbXId2tUAz3RtG28=;
        b=2ce7p0X0K8mzOzvCF4/89aPwu5v5EugOB/ObwzqnDQea31FdI5ylI5IlxjSFdi5+dw
         4DeDgNFQjaqXoWxDikEZ53WL7tDGtxA7zTL29YfuOR5dHmznU1NWRyC7z61NkHHRhQ7E
         aTnZ2nvkpW4DROk+orYKlhhBlQgqfDR2R96r66rT3IptQuEwaui4Rfg2G2X8FK154daC
         FxMh/Fd1gWHgOZ8PKomT8tB9T3cBp1wgnEj7G02ne7wYOUYY4HW6E5xYqcuby2XN1qRf
         zLq0OKQ0s3rcV5PLZOzz8EFnHiU3T1EJoJZwn84zq/i4gey1tuGKzyREZOK51nGSZnC0
         O8yg==
X-Forwarded-Encrypted: i=1; AKwUvByDidC5BqBJydjFaDp3LYIEl5WF/g1XKtR+rvrEkfIGCO9z/yxKopPPXSjeLWNHjySGzR+agKXLV16emjnpSaLw@lists.infradead.org
X-Gm-Message-State: APuU4Z91vW6VkE2YIpvlWMCnMnKiNcW/k3GlfcaYii3sS7Lh7qLfAItt
	vsjHy6QRV6z/CJ5BPAVk2QdlKn4sBmMq3510XYBMXNIkqmFq20kDdcR3
X-Gm-Gg: AYBFou1/jK9qI+zoOj7VgHrkXsb3jGVP/S+eedS6Ooi07gveAnbnblwMWMVu5Btadbj
	WTOuZv9t26qouiwDfuhk6CFB1N3boGKDlQ9gMdLmOo6UzUfNe7WCcuijvoKkwrlCxWsaNIbFxuo
	7GuLkAalIGv4FSBZsqRo6i3WoqjpPRtUhUd+RywDdk9FjlNFvDiyAuEiFmydrWI8dwF4T9sXBfL
	d3Wo0JxqDQBtFU89SYwYwFo5SCYcZ+izKI8pWfe3oqdCo5VcwbnHrXR/8O6mPsbI5ePY3qAT/NZ
	oh+3DYRO6MWd+t7i+PBYueVmrHwQuuPKo5+NouFCDIWHIlD9tPuLW36pTQJ65qW0nWQPtM5lOMz
	2/NnjfH/b/LCgc5m1xH+mCsR+Hy0gUX9iGCsEFkoY/JAUuNe+MwybilrNQrbikRYb4JY7SrVRYW
	SNAoeVGxrHICOObk9CK1WL0Y2KKXdIZom7beI4C1gi8Yk9QgBJzpcaFfDwQuXs5G2HQquqIQzne
	tCHe8TRuaL4r4j3p1cjFsk5amvisIHb27T19PApUny8qxSe8CkHIIlQ67E7zqsTm5eeyn79QqNu
	IM294zsI4C5diU4HrVbJmUGxdwpNvDXeA8Lu3fD+Dteq1bPw31SuNwN4jm1AG4vStbMwiZks2zo
	M+KRs5NHlWiBSjVc=
X-Received: by 2002:a05:600c:621b:b0:4a2:190f:cf6a with SMTP id 5b1f17b1804b1-4b6dfbab213mr101294005e9.35.1794075738943;
        Sat, 07 Nov 2026 10:22:18 -0800 (PST)
Received: from zeus.unificl3slsbnxe8mz.com (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b76cbd082dsm59551055e9.1.2026.11.07.10.22.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 10:22:18 -0800 (PST)
From: Sander Speetjens <sander.speetjens@gmail.com>
Date: Sat, 07 Nov 2026 19:21:36 +0100
Subject: [PATCH v2 6/6] firmware: raspberrypi: Store child devices in
 struct rpi_firmware
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261107-fix-raspberrypi-firmware-v2-6-5bfe605a5cc5@gmail.com>
References: <20261107-fix-raspberrypi-firmware-v2-0-5bfe605a5cc5@gmail.com>
In-Reply-To: <20261107-fix-raspberrypi-firmware-v2-0-5bfe605a5cc5@gmail.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Eric Anholt <eric@anholt.net>, Stefan Wahren <wahrenst@gmx.net>, 
 Stephen Boyd <sboyd@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 sander.speetjens@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4093;
 i=sander.speetjens@gmail.com; h=from:subject:message-id;
 bh=wnTc0W2BT1b0hDhYdyzMhCioXM95BZxCQUV9L0U+rtQ=;
 b=owEBbQKS/ZANAwAKAXjNeEUMBchnAcsmYgBq72xVTOn9p+UeYx1LoZfu9GlsXkE40Y6WNtsSS
 +MImAgLElGJAjMEAAEKAB0WIQRWUkqLABoRw+7JUQF4zXhFDAXIZwUCau9sVQAKCRB4zXhFDAXI
 Z8GkD/98oNq7SqOLXbbquxf4gMviUgoSLFQIpBCwWLeMzTHstaWkDzT8DAmIGfoFooxSqx3nUXZ
 jRRcV2BxL4jrVswFW3UySET4koaqLh45TQThXdpLsVoiNis4Es9lc/oxAFjzidIs+itmuCPd0DH
 1WXGWka9c/kPkSVNSkeLEVNC5MXjOE8U/XtazhLIzt46eIA/8nmwdOEt7bDlvlRgPVkoyH8WPgK
 1XSHj0+5GduiIXKVJvQ9+tFpmckHpr/MDjSoZNLho2zhRMGLLaj0kcvjQjaL5gvyKBHYWs0gWPV
 94lm+wp7TGVT8aRmBKFDXLmhfgOrbaJU/JTjGIhEUr7SStg0Nq761acSzyMPCOpnkcPPyK93yQb
 oefehFGxZQ7qx7R4UdIxQvgJNF3+ek4uLZzFKoYLUh/e170jbI0ZhCZe1whEERMf3dNiqGyb2sJ
 aeD/9mdj4Z6RRTuegz+PyakZR6+2gGIv7eR7q2Oj7HTs0JVBPGOjpJUN9ZttHvvpcj3VRtE2pqw
 81+mNdg6N4jF+iV0NDG6RzOgPXjXnCTD32o5rbqWyFvxzVu6G8+loVLioFxfb9KwQRqEaS88znp
 MU70kuVjyh/if7TpGIsRenUwLZyC/00FtsM3VIToNM4lBa0S8ReKFkAUcXy+4v0hOr0711cWWBE
 IVBHnyDCbn9Swfw==
X-Developer-Key: i=sander.speetjens@gmail.com; a=openpgp;
 fpr=56524A8B001A11C3EEC9510178CD78450C05C867
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_102220_693001_7FCF2019 
X-CRM114-Status: GOOD (  17.17  )
X-Spam-Score: -2.1 (--)
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
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The hwmon and clock platform devices were kept in global variables.
Move them into struct rpi_firmware so each instance owns its own
children and their lifetimes are correctly paired with the parent.

Also check the return value of platform_device_register_data() so that
an error pointer is never stored.  The child devices are optional; do
not propagate registration failures so the main firmware interface
remains available.

Signed-off-by: Sander Speetjens <sander.speetjens@gmail.com>
---
 drivers/firmware/raspberrypi.c | 50 ++++++++++++++++++++++++++----------------
 1 file changed, 31 insertions(+), 19 deletions(-)

diff --git a/drivers/firmware/raspberrypi.c b/drivers/firmware/raspberrypi.c
index 57f21e4e65d6..d44b2c9f0d96 100644
--- a/drivers/firmware/raspberrypi.c
+++ b/drivers/firmware/raspberrypi.c
@@ -22,10 +22,6 @@
 #define MBOX_DATA28(msg)		((msg) & ~0xf)
 #define MBOX_CHAN_PROPERTY		8
 
-static struct platform_device *rpi_hwmon;
-static struct platform_device *rpi_clk;
-static struct platform_device *rpi_rtc;
-
 struct rpi_firmware {
 	struct mbox_client cl;
 	struct mbox_chan *chan; /* The property channel. */
@@ -33,6 +29,10 @@ struct rpi_firmware {
 	u32 enabled;
 
 	struct kref consumers;
+
+	struct platform_device *hwmon_dev;
+	struct platform_device *clk_dev;
+	struct platform_device *rtc_dev;
 };
 
 static DEFINE_MUTEX(transaction_lock);
@@ -203,6 +203,7 @@ rpi_firmware_print_firmware_revision(struct rpi_firmware *fw)
 static void
 rpi_register_hwmon_driver(struct device *dev, struct rpi_firmware *fw)
 {
+	struct platform_device *pdev;
 	u32 packet;
 	int ret = rpi_firmware_property(fw, RPI_FIRMWARE_GET_THROTTLED,
 					&packet, sizeof(packet));
@@ -210,13 +211,19 @@ rpi_register_hwmon_driver(struct device *dev, struct rpi_firmware *fw)
 	if (ret)
 		return;
 
-	rpi_hwmon = platform_device_register_data(dev, "raspberrypi-hwmon",
-						  -1, NULL, 0);
+	pdev = platform_device_register_data(dev, "raspberrypi-hwmon",
+					     -1, NULL, 0);
+
+	if (IS_ERR(pdev))
+		return;
+
+	 fw->hwmon_dev = pdev;
 }
 
-static void rpi_register_clk_driver(struct device *dev)
+static void rpi_register_clk_driver(struct device *dev, struct rpi_firmware *fw)
 {
 	struct device_node *firmware;
+	struct platform_device *pdev;
 
 	/*
 	 * Earlier DTs don't have a node for the firmware clocks but
@@ -230,11 +237,16 @@ static void rpi_register_clk_driver(struct device *dev)
 		return;
 	}
 
-	rpi_clk = platform_device_register_data(dev, "raspberrypi-clk",
-						-1, NULL, 0);
+	pdev = platform_device_register_data(dev, "raspberrypi-clk",
+					     -1, NULL, 0);
+
+	if (IS_ERR(pdev))
+		return;
+
+	 fw->clk_dev = pdev;
 }
 
-static void rpi_register_rtc_driver(struct device *dev)
+static void rpi_register_rtc_driver(struct device *dev, struct rpi_firmware *fw)
 {
 	struct platform_device *pdev;
 
@@ -251,7 +263,7 @@ static void rpi_register_rtc_driver(struct device *dev)
 	if (IS_ERR(pdev))
 		return;
 
-	rpi_rtc = pdev;
+	 fw->rtc_dev = pdev;
 }
 
 unsigned int rpi_firmware_clk_get_max_rate(struct rpi_firmware *fw, unsigned int id)
@@ -328,8 +340,8 @@ static int rpi_firmware_probe(struct platform_device *pdev)
 
 	rpi_firmware_print_firmware_revision(fw);
 	rpi_register_hwmon_driver(dev, fw);
-	rpi_register_clk_driver(dev);
-	rpi_register_rtc_driver(dev);
+	rpi_register_clk_driver(dev, fw);
+	rpi_register_rtc_driver(dev, fw);
 
 	return 0;
 }
@@ -348,12 +360,12 @@ static void rpi_firmware_remove(struct platform_device *pdev)
 {
 	struct rpi_firmware *fw = platform_get_drvdata(pdev);
 
-	platform_device_unregister(rpi_hwmon);
-	rpi_hwmon = NULL;
-	platform_device_unregister(rpi_clk);
-	rpi_clk = NULL;
-	platform_device_unregister(rpi_rtc);
-	rpi_rtc = NULL;
+	platform_device_unregister(fw->hwmon_dev);
+	fw->hwmon_dev = NULL;
+	platform_device_unregister(fw->clk_dev);
+	fw->clk_dev = NULL;
+	platform_device_unregister(fw->rtc_dev);
+	fw->rtc_dev = NULL;
 
 	rpi_firmware_put(fw);
 }

-- 
2.56.0


