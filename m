Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBFE6606A324
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 19:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QjVT1bua;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SUS42Co+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=8TkSQkMemxAC+Z4MDsNep+8WjC8qCTW9Z0nTYgNEgXU=; b=QjVT1buaX2X0zI
	SrK4OKflLT0tZTXkgPX1PUGaAChrhUyQZdwFBopApc3G99fGKe8RNMkNFfodLR+wx2NieNld/CSlP
	lJ7Ewx+QxOfVNjTJ5lzUVONc3pfF5sVcQ6h+epzzQTiHuhrzwy/qOhFlS3XWXRmbsJW6JbRMkW3lt
	YlMVQyDajuq2vyezax+NSiqQX4i9CUTSNxc4jApKNeMYrg3kLgYhutWOvwFrmiMJL/+k0M5+ghs2v
	1oJlsVgC50yVYkbGW4uIf3THSDJKODVdv7aZ51mvsuEtfDkhmX/8oW3sITSNZWFouIpmbhfcokm8v
	Fwkp5cYdufmHeOTMUBwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU81e-0000000DFVQ-2IsR;
	Thu, 19 Nov 2026 19:42:30 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU811-0000000DF0o-36RO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 19:42:01 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-4a33359c1b3so40377f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 11:41:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795117310; x=1795722110; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8TkSQkMemxAC+Z4MDsNep+8WjC8qCTW9Z0nTYgNEgXU=;
        b=SUS42Co+NtKlvonBEIpGxonaPT9tYDXFkd3baOyc+C/a+lI+NjTvlg6xOn0h/oEuzY
         rqRO5Faj4xPnkVjHg1C6pZ/thywXbuCBRCef9Egi6J4fWHJlCZizvZFhPbCZUnIRLKdH
         J4GQRXsgNf4oo6wZwAk4MXm3QGi7h+dHiLEjZEUrNK/ZxCfftVJCJ0o37KqPODpv3uDk
         ewLj1r6xYFz4Q2tUm4X4/3C8+iJewNzxnLEgTShcIStC2ZrWrJP4LPcaZRU8MA6jqDdy
         MNTIFzwr2/4y9owT5Ct9J9yj+SQRscL91GYzAawnI4chSAsVioI0VH1o3jnGKFR0HaZU
         ojGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795117310; x=1795722110;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8TkSQkMemxAC+Z4MDsNep+8WjC8qCTW9Z0nTYgNEgXU=;
        b=aggW+u39nxURUSlMCZrf4uXfdIqeO+6chvORDVjVGpBJvjnNF8rpVYtvOhpEyakdhl
         AS5MkUR7SLx0+d+GiOaH3Bzea8Xza6ichXkfqsNIKzjTj65tgadKiMOEJZuTOU41mFNt
         rG+P5l7OjG+9enyOlDfN7SrD6Ivlwne0dhTtYRdlKEe2ChTEtNa8RyrVoyGuxTqE+WHb
         fikLkyG99Souo5FR6D6w4r2+3CISsGghJzAoP0AUpI5hEr3XcI6RDpnfi4/ig8FTCYbu
         GDFvx+cWCSAAeM8PDsqq063A0rEiPzwmK4a3aqk7KD9IoOvI6DDct3DZVz82cR/UuF8M
         iW+g==
X-Forwarded-Encrypted: i=1; AL+hErF6DFfsBfwAu65pV16Ex+MY2yFfIukQ+3tbBVIviwVHjWCNMtYj/wzXHRmWxHeewRkaoDEtQNXDrRFinoSYKoGP@lists.infradead.org
X-Gm-Message-State: APuU4Z9Riiz+KnN1eMM02+ZqS4oMZXyUGzh6vI/D+FNDvvvrySTmpuUU
	3qK54PBPhy+CfYtWiiuSkTHWOjsZe/RqrfJywYJtTCrB1lezIa8Pvr3RHFjgquJqCzQ=
X-Gm-Gg: AZFdTZe3vhI982PWsqSbmAoEN8/EWCw+tIU8Mo9LCH2C8ImUEOFDSQVHLpV9j8MfpAZ
	W7mUnnK2hgrCeczTp4RswGVoIwCFwYe96z63Tsetese61VvIRwcTJAr3O8VzD781VkNWQBIDyLu
	ojOJcRM0ofelpWQ3y+dK3tFhr4ILlo1V0PptcbXX5vFfYPBXMz+JYCkRLlYI0Fkb2MdbyV9cEKD
	0AaYsHPrYt6dvzpLsAjDPu13jhufEp8Di0eMDJz9UXlvOmaUCj4HYb6Mp/ZQnqTiaDmXIQJpH53
	fh+fdWKXaGglRsW6Zne4DcXtO216nBP9JypXEoLinnLkY2KEcOrheUCiZrTOGn9045YSt8dtRUn
	Yau7JtLzq6+t7lAXYIjAlBPdvVMPp1HROwiNlSaHbmSdd9xyfdTlqaKPBiv5N4FpMcWJjK7GNgX
	JDx8lVF2eAqh7Jm+6lJ467nnO/7g0WSEespDCu/fAqHA0gjE10/TXCvhYw95e3msDr5jcpREYrd
	hDSVGt+CXQFwNTJIS3ayDhKSVsmAVfptwyCQa0LrfqHiCSSjUCRO6PmtNyYo4xfzr2gcB/vMXOr
	C0Cjy+KXcEXYK/pTMCe4VvO5KkqBzjVIXzYT81HlUkikRRMiAuxkEo4dl0fYT7k1ilt5u+9V6p/
	hIUJdTPqnA+NthNE=
X-Received: by 2002:a05:6000:298e:20b0:488:7496:15b5 with SMTP id ffacd0b85a97d-4abb4c7ab74mr623352f8f.47.1795117310023;
        Thu, 19 Nov 2026 11:41:50 -0800 (PST)
Received: from zeus.unificl3slsbnxe8mz.com (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110d56sm1375537f8f.40.2026.11.19.11.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 11:41:49 -0800 (PST)
From: Sander Speetjens <sander.speetjens@gmail.com>
Date: Thu, 19 Nov 2026 20:41:47 +0100
Subject: [PATCH v3 2/2] firmware: raspberrypi: Register PMIC hwmon driver
 on Pi 5
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261119-hwmon-da9091-v3-2-15956035d7b5@gmail.com>
References: <20261119-hwmon-da9091-v3-0-15956035d7b5@gmail.com>
In-Reply-To: <20261119-hwmon-da9091-v3-0-15956035d7b5@gmail.com>
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
 b=owEBbQKS/ZANAwAKAXjNeEUMBchnAcsmYgBq/1D8hT49gcrO0owQ6GAVVxBPc9dALdWiwmeBh
 7wzQUpOUs2JAjMEAAEKAB0WIQRWUkqLABoRw+7JUQF4zXhFDAXIZwUCav9Q/AAKCRB4zXhFDAXI
 Z3F1D/41fT/30zUKBoREaKGpQ6CcwTaTKbaai06qAahviHvMfc1xgx7/Vvi8BZnNW46KjEDjbKJ
 XpK7WKd3to5oCMOOpSotgCU7nSghiSXrsb7res+QxchabwX9sLdnrMU/HqQO/EXcBgaHw6Vf47u
 Ehz/jcyxmiyws6JcpkJ7eiyZvmKtYCzlK22MJ2lBFnEXcC6xEtbyNUOUs2ZcoM/RTjdVNSI62Tn
 UhQ7H9dJZ8O7lBIahrri0MMvoG4RgO0weyHV6CZzsV3+ZvJ+2xSlCq8p+K9R5WMJN05iN/5Pb/w
 EDOEDc/L0zVKbo9/aOMykkBkEngHrnWOxk/V9rcETZ/ijDSdEo7GlOqXzsvV1bBaz1uqkf9shmY
 R+clSeni1rzCcaYATDChIVTeQ0Z8OvsGkSR25Wz4+xW+asFR8gy5pNY+f50vuh6ITQZHSiJ0sQ8
 5bGCFBkfuwBupgwc+ImE2VynI1rvcNcjjrPP5xk5IjRjjSlrcrtl5Y6mX1vm5h8KJO3TysUCRUK
 H5FN971m85rU6Jras20aTRL+OR2gv9mPNee17i8wYIJM2Y3I/BFstsNV/BckMA0yyn/qBKUobjc
 5FUEpfG5R9a6/+wFLeY3vbG9D/ZDWmgWi7gNj2z+87Fv1qObomrOVZq7scAcC8X+6DB5iMtBLfE
 9rMSTdBO3nht9MA==
X-Developer-Key: i=sander.speetjens@gmail.com; a=openpgp;
 fpr=56524A8B001A11C3EEC9510178CD78450C05C867
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_114151_831895_DC909829 
X-CRM114-Status: GOOD (  15.29  )
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


