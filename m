Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D6DA606A697
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 07:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TI3WnSoI;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LH8fsxLA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=nUaNgcTUDEPyq+ELt5mHzYxdOi1l+iUjqzlMWdA9j6w=; b=TI3WnSoI9BFhO0
	VXm+1fU8JEutvCW8zgus69yOJ6Q4QPDmT3J2a5CX05phaUMbGLvNByYZ01WXsP+XTjlxsOnRfxFw1
	SFmUKhH2xKeGMc5xzk4Nd/n52FwQQEEnZdmEe3/nxYpDtViJjEIOYzQRXy8bhDKw38Xr3U2CQv2K2
	WLon+tLs3hl7454yA1OrDTa6OaQHcau57qAqq7Jn/xDoec9AF6GouP+Hh5GwxKGzQXXyi037nTz8s
	Bh4fnTWWbS4t17Ia0mNQvu8NQ2pYMpN+0guIN5gy2yPxtdm05M5m3NSrQkY0fR8OfYsCi1bz0AnsW
	gQ48gzhAZg3kLlAFXRlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW7JG-00000008qCo-0m2G;
	Wed, 25 Nov 2026 07:20:54 +0000
Received: from mail-dy1-x1336.google.com ([2607:f8b0:4864:20::1336])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW7J5-00000008q8I-1cb9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 07:20:45 +0000
Received: by mail-dy1-x1336.google.com with SMTP id 5a478bee46e88-380c28f9e35so6588860eec.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 23:20:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795591242; x=1796196042; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nUaNgcTUDEPyq+ELt5mHzYxdOi1l+iUjqzlMWdA9j6w=;
        b=LH8fsxLAZGTZZtSjKEcsl2OXUgQhs2brcbdyddpmtw3kXpRXI9fO7Uu0PmV3/JA9hL
         OocrpnHcM6f16GGix4zDHjq2VqWn/NL7i4x/zQv3U/3rcBTeQhAj3C/hEpsixDTvHEg0
         tyBg70+7/ftxjN+BwLCdfjLGbbqXOa2fvuKv2GtNv2966TN6mVAHSyRxIGOhOAU7IcZy
         2bCb2YNk/Oz9DvgSkF68R+7aUuMBnX4tbX2idaqmLI0Z8oR2xgv09A7JBpU0yISazNXN
         QPG4uIv6qOqnqcg6ll4HwTeMwDgoEKtk1hIL0UpYs6USXRIpET7e+si1HJrRT1P6Yfhu
         yzIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795591242; x=1796196042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nUaNgcTUDEPyq+ELt5mHzYxdOi1l+iUjqzlMWdA9j6w=;
        b=eBgUUHyXY/ZjHLvwL2RAwfVQzgR09s5Koq4LiCUTRgkAch82M4PFC8KbYSecHLetz7
         K1xBUyJTrE1S5KopuC5DDE2A4+7PS5Dyy+BwDEm907YabYN+WLKE9S1e6bgBls284Wv0
         TC/XASu4x/gcM9V+iLCFJF+kivdr3lCCn/t8MbkNyfEvEgAK4ge7cdtJZpl0vwzVNIih
         dzBKgVr4L5ofg/XneWAVRjXaXvU/7kTIYO7+CON4xxWeOOZkS1J8jWHw2mqb2LdnXBhg
         BPUGH0NiqXAgnxMT+P/ii3s2RZGKtPzALw9QhGOMF+hlsfOoczOdKrbYGfv1PnYe7YG6
         bBVg==
X-Forwarded-Encrypted: i=1; AL+hErEiDGaI8ceGfM87cVdyhXutEvGkEI0vU4DtCbKKhEv6lzkNG+brzzH3X6eJGmki1r4Y5yqFZ08v6JZSa/JyFjLN@lists.infradead.org
X-Gm-Message-State: APuU4Z+ueOS4a5ow8TaLrPiAoigv/lxxYAJ3Sn/cch5IhnF+GxmMr9wX
	ywGFmzWJTnbvjXD9MIxq9BVmUZbCFdRbzRmKGE4oHT8HPKWSa0njoUiw
X-Gm-Gg: AZFdTZcOq1z3np+gPvlf90drQo+uJDa4IvOY7rBUp7sIXqWb73skL+lpJ6m2So/lsfx
	me50VFpRXKMKJ5PDFLPMUdHd79XIVC7pqC4q0AHJyoczqGuL21MOaesajGMZtWMexRkD15nlUHS
	GJBqVQrjRD4CO63VzJXibrnAUKkBUjtYqYMkvDEIgsj+F4CkYuaA9szG9iPE+XuWD40mKANJmeF
	Nffaox+NNRetuqds2ZhmBcbgKaixouB7P4IP3Lye1RHuS11wa7bmYzO4FJG2YltA27VgL8I3w9K
	2/jEMSZmkCUzxyMeYooj99oM8qRJ/wGeINkLy07gDLrPabvpGhYP1VLrVVCs4816tmGxr8X4WfB
	bFHUGD2yJvghdoGmAp1xXtkRMqoQPm5A9nxdNzmjCg0ZDFOePN67Vh7ckA17iATCYlILLNdPJjA
	miVMIPEWaFVNafM6RlrZhXOjbX9cvzfwiZtKHPbFTZwkvQ6GaJED2KJUCKQY4EMkdM598usGGvQ
	/y8JY2dnrJzvsATc7Dy+yMJdUSUS2GA2hQ2AzvHO16g6oSejc4HO8C3caGXHSx1aEAjgChNwPc8
	py7FDn0/mn2tqkW5ePbnxFyuni51nGtYyS5REQ39lTPLDgOq/Tphf9a+E0SmuUOO
X-Received: by 2002:a05:7301:7309:b0:382:2ae3:b1d0 with SMTP id 5a478bee46e88-384b3e788a3mr19263978eec.13.1795591242157;
        Tue, 24 Nov 2026 23:20:42 -0800 (PST)
Received: from prasanth.alps.lineo.co.jp (vpn1.lineo.co.jp. [203.141.200.204])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567abb870sm42767121eec.25.2026.11.24.23.20.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 23:20:41 -0800 (PST)
From: Prasanth R <ragaprasanth@gmail.com>
X-Google-Original-From: Prasanth R <prasanth.r@lineo.co.jp>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org
Cc: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Paul Cercueil <paul@crapouillou.net>,
	CL Wang <cl634@andestech.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	Prasanth R <ragaprasanth@gmail.com>,
	Prasanth R <prasanth.r@lineo.co.jp>
Subject: [PATCH 01/12] rtc: snvs: clear the wake IRQ on unbind
Date: Wed, 25 Nov 2026 16:20:15 +0900
Message-Id: <20261125072026.2997493-2-prasanth.r@lineo.co.jp>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261125072026.2997493-1-prasanth.r@lineo.co.jp>
References: <20261125072026.2997493-1-prasanth.r@lineo.co.jp>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_232043_659158_CA76990B 
X-CRM114-Status: GOOD (  13.39  )
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

From: Prasanth R <ragaprasanth@gmail.com>

The driver has no remove callback, so the wake IRQ set with
dev_pm_set_wake_irq() and the wakeup source enabled with
device_init_wakeup() are never released on unbind.

When the driver is bound again, dev_pm_set_wake_irq() finds the old
wake IRQ, warns "wake irq already initialized" and returns -EEXIST, so
the driver prints "failed to enable irq wake".

Use the device-managed variants so both are released on unbind.

Tested on an i.MX6Q SABRE-SD board by unbinding and binding the driver
through sysfs.

I used an AI assistant (Claude) to find this and write the change.

Fixes: e7afddb2b4d2 ("rtc: snvs: use dev_pm_set_wake_irq() to simplify code")
Signed-off-by: Prasanth R <prasanth.r@lineo.co.jp>
---
 drivers/rtc/rtc-snvs.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-snvs.c b/drivers/rtc/rtc-snvs.c
index d99a352d6..647952dcd 100644
--- a/drivers/rtc/rtc-snvs.c
+++ b/drivers/rtc/rtc-snvs.c
@@ -383,8 +383,11 @@ static int snvs_rtc_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	device_init_wakeup(&pdev->dev, true);
-	ret = dev_pm_set_wake_irq(&pdev->dev, data->irq);
+	ret = devm_device_init_wakeup(&pdev->dev);
+	if (ret)
+		dev_err(&pdev->dev, "failed to init wakeup, %d\n", ret);
+
+	ret = devm_pm_set_wake_irq(&pdev->dev, data->irq);
 	if (ret)
 		dev_err(&pdev->dev, "failed to enable irq wake\n");
 
-- 
2.43.0


