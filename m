Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE375606A881
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 18:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mN0DbFV9;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bE7DwJHZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=7gO+W8gGsjCf9Pzr83AlTVVS6n8V9bVZ/U6f8F6rCC4=; b=mN0DbFV9MuoJIf
	PGGneL2fEbwb9zpfg+prC8T7QLqz+TucYNm6FX0V3KvjURLZYDpz53vhm64eH/DGiUBnh+N1xqQJ6
	umUDjz3P3W32vn583fE2qYca2pSyajQplo22JIrbr4UcP8QVxJhpc0t5B/h5vCqbGEahTWVbxbECV
	lSmEgaSHzk14QF2gZBTyYZlPtmKpbkmiUqFjCT/5pDFCz2vkvsWnDA4s7Mhs6sW6ymcWPjqEQ0H1x
	JKUnf12LjlRXgxREOLqLQKp5gVUrfNUD4l78+D/OAzAJZ1/7v26CSoqbPedI+aVxHlM8GMPWA78dS
	LgvWzCUn3DVOc0PeAiIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvpP-0000000DsrI-07NY;
	Fri, 13 Nov 2026 18:16:47 +0000
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvot-0000000DrwW-477b
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 18:16:20 +0000
Received: by mail-ot1-x32b.google.com with SMTP id 46e09a7af769-7f84a55cc06so1486742a34.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 10:16:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794593775; x=1795198575; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7gO+W8gGsjCf9Pzr83AlTVVS6n8V9bVZ/U6f8F6rCC4=;
        b=bE7DwJHZ82NUuilqyJASpshIATi6gARk857VTgbhlgjMd8barfI/K8JgDrm4MuvbIM
         /YRGFMNpmWY2cnycHVIycUg85Wv+npzablfko2km6+uJUEPJQnLQsGagNC9L8AOiJqvt
         qa+CSQIdwKOTgq+tKr5P1ttWqcmGBJsXOnACp54KcNBIv2RUTfUQ9pPvPmz08mjCYAh8
         aFh4Vpdj7jbRfjsCL4+8ivb9Wjc8aCpPa91HtuXIzVASLc7ROMF09EIoGGc4zXOEcpFm
         CYNUK2zKv2CVxi79SaBBEu4lFiukEKN1+sP9UhQ2SchSRo9M7N75yPiyAjB6NWlLiD2g
         wnig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794593775; x=1795198575;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7gO+W8gGsjCf9Pzr83AlTVVS6n8V9bVZ/U6f8F6rCC4=;
        b=C5Lw41iwSm2WOmXhmhrRVJfCd6S8DyJeM8gozNZQFFd9HsBI6X2NuQ8bIFNv1vGWDg
         cLPIRm+qNGBo2LuaEAk5Va1SqNvW9nGlF+mIKJGz84gLB2qI43niXThtK8IAV1UcHFim
         TWX+4edsfcJkvfqyESiWKYVOcrdQA6VnwebsO3TlrwvVCSMSzHVne9oN57KNh3Y2RvFv
         tDhAWC7F4qxiGETY70318HEZqnkhuUW1CHqtqL/6Tvbz2MVG+vFcLTJJKErv71cfTomS
         gMCTaW14IQB8Yb+ZYjsnn8B8OTL8O1DGJE7qY3SUgTDtE+irHxTstNEEcmPdDyqGGR+N
         +9KQ==
X-Forwarded-Encrypted: i=1; AL+hErHFdhBVUhPShFOybpv/5r1a6y7X6WTZzOxrAYCd88IZtbyiiulgG0L/3szT7skjmYopZwdVZP1bhICrnp9Z+GYJ@lists.infradead.org
X-Gm-Message-State: APuU4Z+65+GsCZLqUuoZ6cr9Urg7ogJ/ucgwO9dkDWjanLlO58uMsqiu
	6kqgceVf2Zt69pefQfUKFeEXapF/WKULXiGd7U7ponSwzi6Sw+4glBRu
X-Gm-Gg: AYBFou0WmBsQK3oXKVQ2DBkgz8dtPlMV1g+NNoM6JIPC/uyl1wi87AePmcMdwz5cMB4
	Ac6d7WLjUPWNlIGtavX7KY4I7/Ots4nYr5EVitFFpapE/pWHzxlU7suMGVKi/1X+hE8Aad9YqQp
	ySoLxJpI6vBVJxslzhWy8xBdkd/fQeRiHH9jaLyHaDHICs6ek/BXONQBBEotzzpuGTrVsIvKalZ
	CHPjI6d8Skl4NrBxNqo6cc6uhMyD/Lz0JuuIROPQGHd8Z9BbmqT2n3xO78ojs5GIo1X0+5vkGj5
	nsONyVD9Q1dxhNtXtP/Wrdjv/Azf4WxSI0DeuIGSeinrNLqYsgjNslBEnTl2Yi3cykJ0rnWLUyi
	vu4vm6WEThDCPljdn2yAC/1ODrWobd53LaL80bdEfyO4Sidf5OSsYHDmX+fk0JNzq4LPfsr3pFy
	o7BHAtAV6gJUtgciQPXuF3chqvb6OnmM0g5EAFGHo5lQ7qDTIneJnuduF9ZWQqACzSGY3vT6xW+
	Xwfy7kTVbmrk89PKiLeeL5ko34BbAhS94cIAesqn09t4mSEDc+qM4Mdz27j+6rN1MriNz3lqOe7
	7XWNHJlQ2oVV8eN//GMmLm2+Q6RX308enRTmeXHW8wqYYAd7CWkq6vSK2a6DL+iflCalTn3nzGy
	Aw9vNMbtoYITZdSAisdTgL3DLlF2zArxQuqwvMl+iuBrY3g+tY980WV6Jz0ZrvpszmmCW4ZvBrZ
	jn46SDRhHgaUxDa7ESUQRuKHi3Ny4vIhTOmPtrccBjIPDExTQ4md0=
X-Received: by 2002:a05:6830:4489:b0:81c:37e2:2012 with SMTP id 46e09a7af769-86289870d4bmr3052287a34.15.1794593774827;
        Fri, 13 Nov 2026 10:16:14 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8628817d979sm3253414a34.22.2026.11.13.10.16.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:16:14 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 11:14:53 -0700
Subject: [PATCH v4 37/58] mtd: rawnand: meson: retain open-handle state on
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-37-556b1d7c6221@gmail.com>
References: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
In-Reply-To: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Liang Yang <liang.yang@amlogic.com>, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_101616_267126_1F028D3E 
X-CRM114-Status: GOOD (  15.42  )
X-Spam-Score: -1.9 (-)
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

Keep chip metadata and controller storage alive until the final MTD
reference is released. Unregister and disconnect each published chip
before releasing the resources used by its hardware operations.

Free transfer buffers in the synchronous NAND detach callback.

Cc: Jerome Brunet <jbrunet@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>
Cc: Liang Yang <liang.yang@amlogic.com>
Cc: linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/meson_nand.c | 47 +++++++++++++++++++++++++--------------
 1 file changed, 30 insertions(+), 17 deletions(-)

diff --git a/drivers/mtd/nand/raw/meson_nand.c b/drivers/mtd/nand/raw/meson_nand.c
index 2a554f62a25e..871dc5e22759 100644
--- a/drivers/mtd/nand/raw/meson_nand.c
+++ b/drivers/mtd/nand/raw/meson_nand.c
@@ -1398,8 +1398,7 @@ meson_nfc_nand_chip_init(struct device *dev,
 		return -EINVAL;
 	}
 
-	meson_chip = devm_kzalloc(dev, struct_size(meson_chip, sels, nsels),
-				  GFP_KERNEL);
+	meson_chip = kzalloc(struct_size(meson_chip, sels, nsels), GFP_KERNEL);
 	if (!meson_chip)
 		return -ENOMEM;
 
@@ -1410,12 +1409,13 @@ meson_nfc_nand_chip_init(struct device *dev,
 		if (ret) {
 			dev_err(dev, "could not retrieve register property: %d\n",
 				ret);
-			return ret;
+			goto free_chip;
 		}
 
 		if (test_and_set_bit(tmp, &nfc->assigned_cs)) {
 			dev_err(dev, "CS %d already assigned\n", tmp);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto free_chip;
 		}
 	}
 
@@ -1427,21 +1427,23 @@ meson_nfc_nand_chip_init(struct device *dev,
 
 	nand->options |= NAND_USES_DMA;
 	mtd = nand_to_mtd(nand);
-	mtd->owner = THIS_MODULE;
+
 	mtd->parent_dev = dev;
 
 	ret = of_property_read_u32(np, "nand-rb", &nand_rb_val);
 	if (ret == -EINVAL)
 		nfc->no_rb_pin = true;
 	else if (ret)
-		return ret;
+		goto free_chip;
 
-	if (nand_rb_val)
-		return -EINVAL;
+	if (nand_rb_val) {
+		ret = -EINVAL;
+		goto free_chip;
+	}
 
 	ret = nand_scan(nand, nsels);
 	if (ret)
-		return ret;
+		goto free_chip;
 
 	if (nand->options & NAND_IS_BOOT_MEDIUM) {
 		ret = of_property_read_u32(np, "amlogic,boot-pages",
@@ -1449,8 +1451,7 @@ meson_nfc_nand_chip_init(struct device *dev,
 		if (ret) {
 			dev_err(dev, "could not retrieve 'amlogic,boot-pages' property: %d",
 				ret);
-			nand_cleanup(nand);
-			return ret;
+			goto cleanup_nand;
 		}
 
 		ret = of_property_read_u32(np, "amlogic,boot-page-step",
@@ -1458,21 +1459,30 @@ meson_nfc_nand_chip_init(struct device *dev,
 		if (ret) {
 			dev_err(dev, "could not retrieve 'amlogic,boot-page-step' property: %d",
 				ret);
-			nand_cleanup(nand);
-			return ret;
+			goto cleanup_nand;
 		}
 	}
 
+	ret = nand_set_lifetime(nand, to_meson_nand(nand));
+	if (ret)
+		goto cleanup_nand;
 	ret = mtd_device_register(mtd, NULL, 0);
 	if (ret) {
 		dev_err(dev, "failed to register MTD device: %d\n", ret);
-		nand_cleanup(nand);
+		nand_disconnect(nand);
+		mtd_put_master(mtd);
 		return ret;
 	}
 
 	list_add_tail(&meson_chip->node, &nfc->chips);
 
 	return 0;
+
+cleanup_nand:
+	nand_cleanup(nand);
+free_chip:
+	kfree(meson_chip);
+	return ret;
 }
 
 static void meson_nfc_nand_chips_cleanup(struct meson_nfc *nfc)
@@ -1486,8 +1496,9 @@ static void meson_nfc_nand_chips_cleanup(struct meson_nfc *nfc)
 		mtd = nand_to_mtd(&meson_chip->nand);
 		WARN_ON(mtd_device_unregister(mtd));
 
-		nand_cleanup(&meson_chip->nand);
+		nand_disconnect(&meson_chip->nand);
 		list_del(&meson_chip->node);
+		mtd_put_master(mtd);
 	}
 }
 
@@ -1550,15 +1561,17 @@ static int meson_nfc_probe(struct platform_device *pdev)
 	struct meson_nfc *nfc;
 	int ret, irq;
 
-	nfc = devm_kzalloc(dev, sizeof(*nfc), GFP_KERNEL);
+	nfc = kzalloc_obj(*nfc);
 	if (!nfc)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(dev, &nfc->controller, nfc);
+	if (ret)
+		return ret;
 
 	nfc->data = of_device_get_match_data(&pdev->dev);
 	if (!nfc->data)
 		return -ENODEV;
 
-	nand_controller_init(&nfc->controller);
 	INIT_LIST_HEAD(&nfc->chips);
 	init_completion(&nfc->completion);
 

-- 
2.53.0


