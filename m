Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA672606A330
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 19:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wiRRCS7z;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q/lI+NRG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=8TkSQkMemxAC+Z4MDsNep+8WjC8qCTW9Z0nTYgNEgXU=; b=wiRRCS7z6n6EfK
	sWiVYoDMNI84jW2m3a1UsDMIoIg6xK8nDlPa94IAgWfWJgdA7jEcRXvvTIntVs5J8gVbay+2jyQmq
	qBdAGnLMsiRKGZC/gULuyKtNLJcxzPStEW4dbF4Q1qqKJSUd2TP+o2whRLAe6VWvCtkfSCUhpgdW+
	RnnIFWo3H0Wlueaw4fCg4LzpAwpmcd9C/lVGr9Vevk2cG7YeWZlT4fPCWgc/VPABEN7eRkd0ljoAP
	bzGYlgA9aFrATuMAZzlmvknYwusdR0PWr+yV5aH7hivF2yDVlY4XBy9RBV7c2+OHwU4cPrHiJZ1Ub
	4O1INZOsso5G11Y/36rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU7Ra-0000000D9GN-2roP;
	Thu, 19 Nov 2026 19:05:14 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU7RC-0000000D96w-1wUk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 19:04:53 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so306585e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 11:04:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795115088; x=1795719888; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8TkSQkMemxAC+Z4MDsNep+8WjC8qCTW9Z0nTYgNEgXU=;
        b=q/lI+NRGe2IPGwWIO1nahU748mm9pQCir6SukgomUYcXs5Wb0eyWnsv1varnKt1wiw
         HJz2p2zIeN/MrU837BT7SUgXuG5F8worUw137a6kAOI+/iHCYEcH4QdIH7dwK8dlRNlx
         lvCPOv1cxSOe6UV4jfDp1sBQBKPzZdm7Mvul/enJ58LFCfHT4zj1bW93yFOaLzsyawC3
         ndfRUyawbgFVBTPMgShhB040z36ARj0k9fpZ9ifSzuOtN6jcRxIeaK4RNcETmobbxL9l
         4YFg0i+oecL9FEM8UecKXM8Dz04TYEhhQ3GsmwI5pUU5RqgMrCUIYEnveOCuDBjfIvjE
         BT/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795115088; x=1795719888;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8TkSQkMemxAC+Z4MDsNep+8WjC8qCTW9Z0nTYgNEgXU=;
        b=P2/fb+bhuqem5MaAdHXbVQb2yVcbM49mcRi8m+K71ji+F1U8QpRKweLVkCi0bRlcL5
         qHtdeH4J+Sjr4hrz2SrHmBQmaKgBJeOXVnIFd6BItbt8Cs+d30k5YGrE5EnQduZcvhEU
         fftKSAi6Gg/0yQA0uXQ30ayw33YlQGrWe8wnWwD+V0SZBgl0JleSZe+lA3leB2tHwtkq
         YlQ4Y5l4dMGZKE5tP4UvKzaOpq9lOq285E15eUOnZRI/TDACpoWeTh0TdSXzcTNSZfUf
         nrOTZ1Jx5gMHC++KyrJZ5ONjhvvxUgSKrGBfeGTmRxGKS9b/EUam7iDDDv3tj6GRghGh
         Ewrw==
X-Forwarded-Encrypted: i=1; AL+hErHlLO9erh4EvQHvyN58I+WJofl4HZ+3ou+tmtGzjyRwDuhCZmm8GTyvZtZfDwHKbeEzx/g0T8rMKKkPIhR5yr3n@lists.infradead.org
X-Gm-Message-State: APuU4Z+Hf10+itk7jeM4VF/TIIL8nkxjoNbcLXwjuNqbnm4PFYZBSzaw
	lATT/+VfzrD6s+uCdW/4XVyxNIL/NjAIwD+zG07PM630q2M5OswwHBX4
X-Gm-Gg: AYBFou22zdYyyYUmGBrHUrs7rRHkkTnMXmt59+Ot27HTrBqE50Sk9rBTOKYECH0U43I
	JwamaYwX2mXGvwRRpR9cl553uQBkbOwC/fe9GkH+s4nuMvzsWl+eJ5Vz8pDwxSDrJH/hDwNnifC
	wDWM/bA1KgjpI3QI8SvBa4tYdNPkr9FilVLYEbdui/S8+ym1SMqBXxEreDvzBlSPHJXiqeT610R
	xiPwxSCSWGNLHVV6qyWodqyFR4IpnI2LQtrC7e8QG3e88kDF6d8O/E4KrSSI05k5dXK0wMvz1/t
	Sc8nmtAul+c9yzuQAdFfX5ubmtkk6tzfHifMyga+REmYH70KR24gfxEsCBHlhID0CgtvUJaRB2X
	GeFEJhY4Z520vp7yKf+evinXTyiMDgkOi3usOPeEOYFe5LphqycrsXhXiWdzqJv35gr7tNcDo3E
	BI5EuhcVw4BD8AvRZZ7bqMVDMDBst1Shtxv1RUNxYZPMmqghOzKkXHC3+31ISDo8PKlWGhSxDAS
	K7GXvlCfRNsc4lZDd0iXjjMw28MeJKqa3BqHlErST06+A7dUSM0bn21T+1wEqSImyB5/jTVLSL0
	YyPpuaexqjSP+YSee8YjsbIQXhPXylxBo0okWhTCa5nkszSPQXxU1FGBL7qZ0ThlJNTnkYC8+mv
	VVcbh8glL00Du91RM
X-Received: by 2002:a05:600c:4753:b0:4a1:cfa7:e968 with SMTP id 5b1f17b1804b1-4bb8880c73emr10830495e9.21.1795115088520;
        Thu, 19 Nov 2026 11:04:48 -0800 (PST)
Received: from zeus.unificl3slsbnxe8mz.com (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849247asm19124775e9.7.2026.11.19.11.04.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 11:04:48 -0800 (PST)
From: Sander Speetjens <sander.speetjens@gmail.com>
Date: Thu, 19 Nov 2026 20:02:24 +0100
Subject: [PATCH v2 2/2] firmware: raspberrypi: Register PMIC hwmon driver
 on Pi 5
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261119-hwmon-da9091-v2-2-d6c624272a9e@gmail.com>
References: <20261119-hwmon-da9091-v2-0-d6c624272a9e@gmail.com>
In-Reply-To: <20261119-hwmon-da9091-v2-0-d6c624272a9e@gmail.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Guenter Roeck <linux@roeck-us.net>, Ray Jui <rjui@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org, 
 linux-doc@vger.kernel.org, Peter Robinson <pbrobinson@gmail.com>, 
 Sander Speetjens <sander.speetjens@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2172;
 i=sander.speetjens@gmail.com; h=from:subject:message-id;
 bh=QX7uRGP2jWG84enlhwxfyWe+s9o7Z32PX6pW6x1r3aU=;
 b=owEBbQKS/ZANAwAKAXjNeEUMBchnAcsmYgBq/0hNFIRxvZnpewtzaaGCmAxJlbTZ6ygiQm+SX
 WvHc3zLIs+JAjMEAAEKAB0WIQRWUkqLABoRw+7JUQF4zXhFDAXIZwUCav9ITQAKCRB4zXhFDAXI
 Z8CxD/9zPkW9kooLjhMMGYwX7WilKkmvysEL+aq8pfEOAhKuRFVnSBxa+QC7SjCaQCs961fQb3Z
 Znuf37UxAT5ksO6Rsoh64QiWTiwL0f1eapWtUhRDVwLQo73vyvLeuV7FiIQahf/krRPcGSPOVE3
 wehAFpieJouLoKHHJHMIwORsCsMOH7624mc1BTx13GzNjw7CUzyKkIOMr4e/mfMJva8B+x9FdU0
 x4K5KWVIhNsH+DjKsdF9YDTDWJxA3AuCJ8gnNfjCCb16CD1XkCArt1EUkuBZsOjNgB4zI3jEKqw
 wgovByXjbUnePgIHHmb/K4GH6e+E6xrRmZhOu6XqnJOvY6lR/1K8JIN0x7KSLhXOfhSRcxknyk2
 JdaaSTl6ByUw5Gc9YeuoHA7c2Rve5RhBXaciU7lrLKr6tuBtF6FTgpZyFmidH3lJ6Mhyi0/88tP
 Ewf7vYpdK9s9z9jGfXtpvvoHDk0tZNqKl3Y7d6FTyFCvnDLRqZiNV4R382NIinhx5/DUkvxdAoi
 adRIjvRCoRm9xwkGeQhA8iaXrVsv2fFiyuSsNtXSj+huwhzCzVpl7AL8hrXG3anUuenoXqU1NAF
 RVPKMZz2spn8g1UzWS/PZ/DuQBV6v6UNQqu7CT9k7V6j92yE2VNua1SXcgmuv2gmjZRLCeCfMQu
 IQoaWdvM6rc3PnA==
X-Developer-Key: i=sander.speetjens@gmail.com; a=openpgp;
 fpr=56524A8B001A11C3EEC9510178CD78450C05C867
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_110450_540807_5730EF94 
X-CRM114-Status: GOOD (  15.31  )
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

Register the raspberrypi-pmic-hwmon platform device
on BCM2712-based Raspberry Pi 5 systems,
including the BCM2712 D0 revision.

Store the registered device in the firmware state
and unregister it during driver removal
to ensure proper resource cleanup.

Signed-off-by: Sander Speetjens <sander.speetjens@gmail.com>
---
 drivers/firmware/raspberrypi.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/firmware/raspberrypi.c b/drivers/firmware/raspberrypi.c
index 68512224e3ce..a694ecc18f9c 100644
--- a/drivers/firmware/raspberrypi.c
+++ b/drivers/firmware/raspberrypi.c
@@ -34,6 +34,7 @@ struct rpi_firmware {
 
 	struct platform_device *hwmon_dev;
 	struct platform_device *clk_dev;
+	struct platform_device *pmic_dev;
 	struct platform_device *rtc_dev;
 };
 
@@ -249,6 +250,23 @@ static void rpi_register_clk_driver(struct device *dev, struct rpi_firmware *fw)
 	fw->clk_dev = pdev;
 }
 
+static void rpi_register_pmic_driver(struct device *dev, struct rpi_firmware *fw)
+{
+	struct platform_device *pdev;
+
+	/* Only present on Pi 5 (bcm2712) */
+	if (!(of_machine_is_compatible("brcm,bcm2712") ||
+	      of_machine_is_compatible("brcm,bcm2712-d0")))
+		return;
+
+	pdev = platform_device_register_data(dev, "raspberrypi-pmic-hwmon",
+					     -1, NULL, 0);
+	if (IS_ERR(pdev))
+		return;
+
+	fw->pmic_dev = pdev;
+}
+
 static void rpi_register_rtc_driver(struct device *dev, struct rpi_firmware *fw)
 {
 	struct platform_device *pdev;
@@ -371,6 +389,7 @@ static int rpi_firmware_probe(struct platform_device *pdev)
 	rpi_firmware_print_firmware_revision(fw);
 	rpi_register_hwmon_driver(dev, fw);
 	rpi_register_clk_driver(dev, fw);
+	rpi_register_pmic_driver(dev, fw);
 	rpi_register_rtc_driver(dev, fw);
 	rpi_register_reboot_mode(dev, fw);
 
@@ -395,6 +414,8 @@ static void rpi_firmware_remove(struct platform_device *pdev)
 	fw->hwmon_dev = NULL;
 	platform_device_unregister(fw->clk_dev);
 	fw->clk_dev = NULL;
+	platform_device_unregister(fw->pmic_dev);
+	fw->pmic_dev = NULL;
 	platform_device_unregister(fw->rtc_dev);
 	fw->rtc_dev = NULL;
 

-- 
2.56.1


