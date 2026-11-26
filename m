Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2A58606A330
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 13:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cBn4L7tE;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g4/lf+by
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=8TkSQkMemxAC+Z4MDsNep+8WjC8qCTW9Z0nTYgNEgXU=; b=cBn4L7tEqQ5y4J
	krumg6a9/F9pfifoQKexZcuXbZMVgYVja5xYMCqE6rY22X/uQyGh+vv91Q7QPLsuyg68DJVVFLuHm
	Dn6nn2kf4SmIi3Ik5Kcc4T3FfpQ8X3sCkaVlerjX/dOUZiI/ElvCrSMO2t+k5eQOOX0MXA7ATYQI0
	1gbrwC3AuQ/29GXLkRruURZUOHKwD3M3toj8xR7rdrex0fh2jh8OpGOy2SaI7UrkskFpkUmrZ7lk8
	6ry6OdeHyuGOv9kTt/Qn7LpwEZbizQCZbXcWLyqe9fFNIyEDddbfbU2NsM8FQHiOfnlAJqoaqujsR
	iemuT5usajBKk45JtHGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWZ92-0000000DI70-3bwA;
	Thu, 26 Nov 2026 13:04:12 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWZ8f-0000000DHvT-2Xt8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 13:03:52 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-498f5fa4f70so5720922f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 05:03:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795698228; x=1796303028; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8TkSQkMemxAC+Z4MDsNep+8WjC8qCTW9Z0nTYgNEgXU=;
        b=g4/lf+byUnY4zjgMAGjvAx5RvhUdO3cdeAJm7+4kZtSXk9V867AJuLJwiFx4FC462O
         RhCx9zgSZUDlcUeAPsUw8ZQ/lfLrmbIeLYWt1ZA5Nw8nqMMK/yZN5lb49aWvCFNWUKyu
         k/K3KSCWkCvmOA9QOhKHz3Tg82qfFmCsVsNolWvPGHom/dA5KA6iP1XaypEzNFb8fQ7s
         Ez7SPYy5B1n5lBiZf6z/DOK/L0USOQk2k2S3NWVlfJQwR/Vg8lqNgAWCGMPf02QmCYNC
         QQ/Bm8ReI0/hIcSDhscw+83zZ/Ji+JcEFF5vQ09uyx2TrBG3oad9LehfbxegCM4TiETp
         DU9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795698228; x=1796303028;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8TkSQkMemxAC+Z4MDsNep+8WjC8qCTW9Z0nTYgNEgXU=;
        b=yEFwwNBxGMDla4JnGUttQ0Zzek+LxMLgBY24uLjh6pY17ZMy77RYsMhUpZ8wdaTHf0
         /dzXjodud08OF9BQ0yMAFqoWVJ0xg8MABR7jbh5vsl3KphVqZmF87S5YaeOUJjYy5A9q
         1L6AX0iiyLBP0++bolm/4XzMiVHHLTPMUEshCoXtPVAzbqSiCj69TxzjmsDX/dhba1Qe
         o1jjHC6zMa/EnKfB6k0VlMzkXXf+00BXbyoAQq3zZlpV5lx5vPsRfkHQwpAvV9TCPuEt
         DZC6TWj/6CID4Aa2M4svMaN3S19uI371M6SpDIR1Zio19xkOoP75/5NVi8Mm0C/T8SrN
         DWNA==
X-Forwarded-Encrypted: i=1; AL+hErH00jOByPLUCoeW12u3DBlx2r8sbUzySH5YZselJGYXzQxU5cAdFl/Qt6iA+I+hovDsurCGxlhDOT09/QPGWJw8@lists.infradead.org
X-Gm-Message-State: APuU4Z/2uMdzTKl5p2G6rQYvzykp8nVyyZY3QKgjXE1x2lt4JbmD2/C1
	rJdlMEOp/zRjDnemrIGDWLFzYEeD6SFfE7R9c2SergO0QSFp1OTOXS7J
X-Gm-Gg: AZFdTZdu//pQd7f8fxKWZEXP+2F0Znn5AlqD99xz0GQBl+J7AmLAnvR7TPy1LICFRhk
	M2t14PRXNYuvRHo2DKIb36LYACcUxC9F5O6/ctCPLUeiBSoCTF747vcQgetD6h9Dx5S6Sw2/pFR
	ArXf2tf2I1SnF0Tf5ViEfaxqAmbihf0Hv4KwKbOGZ75oLEvgpMPzlea9gUP2sXVnMNQlt1gBYJ3
	KMorDC+q4/z2c2Fv2sjJAP1o7/p/qkKJLELosjGUkvTbQFQHrCLQtal8rqjj1WNTpMohwhdifHO
	jUqaIoDDCMGtv8VNlrcgnveq02/1gubxzlYJBhIy2Aiel5obw6+2OQcIoSGT6N7v+TbSMIMocRb
	+T+EPKGfZy6LTVt4JDqI1e7y94VxYlorSNumsSryrsjmUf9NOSut4bwUHH1OkqZaPiNfEBwN7od
	rJHurV8jv0qrG2svo8J3DA/kiyvbrbs/Xf2S8CN/qTg5gqW2vID1dS+A7oLQEUXZJzW0nNcfDVv
	Of0QGHZN3dV9SfIdsKAGk28nbWFMFEtmjnM9HaOWmnhZZ0z3Gxs1NYBEmAfxq4c8HHe3pDcYQmb
	Vfikg72B2hDHOiSQU9zgIDlFrUQ//NokCKFzK3SplmHsFvYdJLfqs2jh1hro2loX0H7fESmFKoj
	/lpP6fzAxTz4omPc6GqTH6dgIdSgVtX6MVEZO
X-Received: by 2002:a05:6000:2903:b0:49d:7e8c:e8a2 with SMTP id ffacd0b85a97d-4abb244870cmr45744040f8f.33.1795698227412;
        Thu, 26 Nov 2026 05:03:47 -0800 (PST)
Received: from zeus.unificl3slsbnxe8mz.com (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6ae2dd55sm39331425f8f.30.2026.11.26.05.03.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 05:03:47 -0800 (PST)
From: Sander Speetjens <sander.speetjens@gmail.com>
Date: Thu, 26 Nov 2026 14:03:30 +0100
Subject: [PATCH v5 2/3] firmware: raspberrypi: Register PMIC hwmon driver
 on Pi 5
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-hwmon-da9091-v5-2-0c3570ba9133@gmail.com>
References: <20261126-hwmon-da9091-v5-0-0c3570ba9133@gmail.com>
In-Reply-To: <20261126-hwmon-da9091-v5-0-0c3570ba9133@gmail.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Stefan Wahren <wahrenst@gmx.net>, Guenter Roeck <linux@roeck-us.net>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org, 
 linux-doc@vger.kernel.org, Peter Robinson <pbrobinson@gmail.com>, 
 Sander Speetjens <sander.speetjens@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2172;
 i=sander.speetjens@gmail.com; h=from:subject:message-id;
 bh=QX7uRGP2jWG84enlhwxfyWe+s9o7Z32PX6pW6x1r3aU=;
 b=owEBbQKS/ZANAwAKAXjNeEUMBchnAcsmYgBrCC4xetf6hc9yk9GlDHpxKF8KJKG4DJ0Yfo95h
 tWd0n4aFUGJAjMEAAEKAB0WIQRWUkqLABoRw+7JUQF4zXhFDAXIZwUCawguMQAKCRB4zXhFDAXI
 Z5jED/9aBU4WlCVfXB+PsNCOFLUJZl9506vsDabSXLzTn3Xk88xdDjnN99nkstV7sEG4+ju8PJz
 MPini3NNQSOyVjivSP3C8GkSHyvHGEnoCkNobYB6hAgiahT1SRmiC/lPjhkAfV0qOXZmUQGXA2S
 rEmZZ4rISFs2lGH3AsN9WxhclXZh179ylEls45Nzjai3fI3anY9e8qsahNWoGeMOqVhjaJdazRH
 as2xOwV74dZ8Lcy8KgwrkRYB6cHLJJie+hlGVbMeNO/Nq7Dvg4RUa0L+2hf+7M2w3ouKgKXmPo9
 D1c/dRYxI6AD3bWEGoACZEOehX2PoCIhg9ZWeYx1SPSBMSmogjFpc4D7DzKuzFf9dbGDR5GmEqk
 DGhs83Tj2a1HdvoC5bveLy20PnQ4S4T9IN1tOMhRs9qT0QyT9PPi90O5JQme6wksDvg+wGVjSLU
 w31LzGeMMBKRH9IYP/guUpzgekiozJNjWqfaMpfxeDljpihvnlrXTB3f5fzaXW1AhEQzxww0tE6
 SJXLVjGPMztHBkC4m8S5L9aJrceEi9k1RwBvcl8l91ZQ2F7Q/w/IA588nxFnbqnY0Jd29jWEZDt
 y8qO3oNV54o6VzlkJFqvr8hvR6VDO7EjQHe2HT66XoLRiH936a1i05StW4U48XehgRbjFJZLLGc
 JAJAA4zcbyAsM+g==
X-Developer-Key: i=sander.speetjens@gmail.com; a=openpgp;
 fpr=56524A8B001A11C3EEC9510178CD78450C05C867
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_050349_679828_5C46150B 
X-CRM114-Status: GOOD (  14.68  )
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


