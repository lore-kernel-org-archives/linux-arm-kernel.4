Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A9736074E70
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 01:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xgQfIu8G;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=lGYFhkQ0;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W4jEdYEY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=7gO+W8gGsjCf9Pzr83AlTVVS6n8V9bVZ/U6f8F6rCC4=; b=xgQfIu8GDqcsFO
	h3Ueu4p04YTV8Zyv381dbeMP0pMUIaprHrVSmxaEoy0o/AL6FmOc4A+p9JoA19PlV1p4UQaaB9cfn
	LU8J7bEAQZBHz3evYQwlke6ZG/40GJ6Kw9RUVxilCMy5azaDnzj0C+QTz+/Nh0pE6Psf94iqOaq3D
	Wx+EcGHrDLMTf2pD01WPW1Lzec79eLU9hGT5ouxzAY8LdsHWFZOPW0qZxhdKUwRGs6QuMzuCaxGkl
	UKasIffrwsEHwfRkhlQn8fvkHUwKzVw7qnpStNfEz74aEy8T10QijqmT0KrcJcwnlKF54BpoO5Hd/
	UT0OfDeYNs0gpm/Iry5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJdW-00000008NZQ-1fzl;
	Thu, 12 Nov 2026 01:29:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJcs-00000008MQS-3vSw
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 12 Nov 2026 01:29:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=7gO+W8gGsjCf9Pzr83AlTVVS6n8V9bVZ/U6f8F6rCC4=; b=lGYFhkQ0KiY/kT3m+UCqc90vtY
	TYXFcLNrypg1mAtP7JAdBUuzwlYNPPTOZW8gvGzOP3BG+TJhRLh25mDabKdfAqSjpGYe5JeeCH4V4
	we8CSb2BmjiUUN0v2OgeOfo+KMz++SFJvkfTcAUrhNmwVYrZOM3QXMy72fi5/JeKtGVRW04QQLf0Q
	E5nqvXKlomS3MCS3WaISLyrwn5YwQYWnVdo8LZvuQ2vJ90C8BWAq7XNFoM8ipJ69UVn7grIRt3Cr+
	YcxjZCHs2t6liReqpWI3q/LC88qGvKOmPlfjjxYBvtIzmN8N+JC19EmxWXMB5xkVOU/bJ7WtPpRjd
	iS+gYxLg==;
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJcq-00000009mtg-0SVX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 01:29:17 +0000
Received: by mail-oi1-x22f.google.com with SMTP id 5614622812f47-55650fe1f0dso1933868b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 17:29:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794446954; x=1795051754; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7gO+W8gGsjCf9Pzr83AlTVVS6n8V9bVZ/U6f8F6rCC4=;
        b=W4jEdYEYy9PVc4i4v8X/dPR6KxMXYsc1yaeBwJzyiAQ+w5sJjVavM17psqZPpS+SVt
         QQPFgHRPCvrtAnLpQ+NcMf3xPdw7uFTDBrMlORnTv8V/Y2viwhdBDEPE71hI2WzM3rfG
         Q6ZOOLE2GYquy/l3dVuudiCstrcW281UmqO5n1KuDC+VwjkGsIBbVYWeb1TEJuOV3Sfo
         J+wneKUy/OZQ8H4hi+VnA4XmDwVD1EvQw4Iy30RmFsKbIRgLG4IOHdHj6HuLCdwP5604
         iSH+ZIxZYoPPNcRCh+PUmjQB5YexxuGAdfJkdPAUrZUhIQ2DqbVbF7dFeDBAfaN/84UZ
         /YkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446954; x=1795051754;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7gO+W8gGsjCf9Pzr83AlTVVS6n8V9bVZ/U6f8F6rCC4=;
        b=mXd2oa8aXfiq8suMbw5TO7GlUV74hdL2Nff5MwiQzh9M4fQ4La01EMs8B6WrKPUhF9
         O+PzBCl6vPM6NScxvsYUopJrjLCtyNWGGx0X5F1Iz1354hFPrFNOPuE1CPazeDSMEiQB
         qksJg7Syji0/QYITetEz0oHYH0NwIP/kKjzsrPT23+zd0ulFuoAkespnNPgLRHfm/uhm
         JxS1keMkYApPzyYUxnosZ7URcNVy0finbaVpaf5FNN2FN5GS+SGhUAt6Db1e9xmfWcX3
         UlbtoXEOQ3fFfT/I2CeTbcpO4PeuU2DrwGQyfMaz/XQGE//WQoNtSMESabcV1p8hq8oh
         iyXw==
X-Forwarded-Encrypted: i=1; AL+hErGxGq07VRSkSiPLCyc/u4j9gcGPvtFBd9NttK20RqjJJLppbcUWsroFM21D2U/LyfgEc8HxYce26gpYW9obfK9Y@lists.infradead.org
X-Gm-Message-State: APuU4Z90JICvUUilutqscA2W75nd8tQQI60LRr5LnyLtanmNsAvqjrAj
	ZTZZ976K3AB6a+7lM9jv2niEDvJsM1ZNUJHVjzVKk4AL7Jy0NJ+Zbua8
X-Gm-Gg: AYBFou1wQ+DyAOg87p0ylOfGRmWS7e7+HKmcDJiZy2jSZxzOYiaPb0GvC0UizawGF1c
	4xQCv83YTS8t4JNA5+oJvlt9uWGmqG0EcAGfcJ+RDXU3C2+9ApUCWV2gmlrxn/Ypy1InKBNhlvY
	+/0epiUbpV+C7RJlxIsZRe0fzh+nkmoZ/KqhQ4Tz5oM3P9STlc0erUasPZgclnhcdGOa0k6ooy4
	7Yym87Fus1jIWQoCHCInzVL8cfAw266qDYxK8wutTsxU5y9jtnJGJzsWjuXNG61iL/FgI6CtsJ5
	FS1bZ7nuqxPh/VKtPl9YzTKw94/TO5xmjLp2D9UYg+dt4tFdwZ6EZGCgGC+wdj4DDqFWbdzvQMP
	uPHwWhBZzjHdKMwIwLJjbRm1ZHCDfj6ZhlqKoirQ6O+oSN4JUkBLKMn/k+N1F8U32DczP22SRYC
	1FKPNc134qZOzQGPzSKJynAVfuNFQqQqSHPg+m3fyx2/G0Ld7BgfYb04PJ5OuYJHyVcApqERgY7
	LpBlZY5TWCkhR5gCZ5k0deqg0q8fX/Kt3BjxKL9cMPEeNH8/culY+5cUlhjEAYPRYbBU87Cj9Wa
	hgn48RNM3qdde8/CqSRkjLNdmX8GOKv/+iNG1OCodbwT2+ksgoU31KLbktdUcSIDZeuksTWzpuC
	mDpDG6oexvlAU/6fpzg+buPoppdequWJtBMYVO9K2fGDCXHhYnnywC/J5VlIDAjUW1KA9k9whFA
	/C3bnodOCRgMrSy3OJaf4sq3tY9g2cxVHm176JnwM63dXDDljiI24K
X-Received: by 2002:a05:6808:c215:b0:4d6:9222:99f7 with SMTP id 5614622812f47-56b98327045mr3914540b6e.55.1794446949668;
        Wed, 11 Nov 2026 17:29:09 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905738049sm6823481b6e.10.2026.11.11.17.29.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:29:09 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 18:28:16 -0700
Subject: [PATCH v3 37/58] mtd: rawnand: meson: retain open-handle state on
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-37-ce537999741d@gmail.com>
References: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
In-Reply-To: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
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
X-CRM114-CacheID: sfid-20261112_012916_114867_0D32344F 
X-CRM114-Status: GOOD (  16.57  )
X-Spam-Score: 0.1 (/)
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


