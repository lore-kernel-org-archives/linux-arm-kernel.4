Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB81A606A883
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 06:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RlR7EFik;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PDsCzf+t
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=7gO+W8gGsjCf9Pzr83AlTVVS6n8V9bVZ/U6f8F6rCC4=; b=RlR7EFikJoc/Cx
	qjuz+DHu9gXCaNTEpXHYYa1dvNnc9jvNN0D3yj+mgrseSvMzCxbpdDp9GuYBWr/v2bR4G5i++u19+
	ohxh0jc3zzpSB1aYGzLPG6VBlMdkQ8o5ttWI2VY75SLn+8HvEHYBeqNqrVqOnDbLdoocOcvaivFkx
	2oXifAoJz3IVKfANbjFpIhloeU11+hj2qmTfKhE8aB+/pYU3GMv/D6eYDdt5EXihjE7yNmJKBAKIn
	odqFyxYPjz4ytB+zsakgD73Kg+z25szQMBOZdjx2ybezoOBxG7FQ7XUA6RxPqJYOJpnQnIRSN80BN
	XJ0WaJFWhB1H7rWOUM0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqFB-00000001GsB-1JND;
	Mon, 16 Nov 2026 06:31:09 +0000
Received: from mail-oo1-xc2c.google.com ([2607:f8b0:4864:20::c2c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqEa-00000001Fpk-0GqW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 06:30:37 +0000
Received: by mail-oo1-xc2c.google.com with SMTP id 006d021491bc7-71ad1db7e31so819370eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 22:30:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794810631; x=1795415431; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7gO+W8gGsjCf9Pzr83AlTVVS6n8V9bVZ/U6f8F6rCC4=;
        b=PDsCzf+tbx8hiiI1BiE/NGSkEYdbf+GqEC29ZI9oFzNKu2ocTKxSEmRWvZvGH3erj9
         SoLFen5+u78SDjYwYrarB335r+0aPD+9j0GguV4FFuTv3mBrJ9Hz4j5jlU9aLVtCSJ4k
         IlUwqC8RC9oQX+0viX2QR1o8F5yh4PJZlXV8V9TnbhsgjOIa5OPpeKlOGR4a0zzhOYom
         epyWOD9gEK826aYwI32yHgfCKNY0aXD3zdiYN59uc7SFDDg6+gFFBXfyAc4oOZQfkU0I
         XNt7mX27EaNGUpAvi6lqs11wVfjxIcfNnWCtpub3p6jXDyKfikAOTZXLroE8fsZ+zK9d
         VXrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794810631; x=1795415431;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7gO+W8gGsjCf9Pzr83AlTVVS6n8V9bVZ/U6f8F6rCC4=;
        b=ZDbVyhzSBYeHBJB652oKKDimS5JvFqtQq8C9SCg5MpI3G187uhHMGC+/jiQ74acTSg
         pUlFfs4sbagsCtvXTGNLnw0JdlVWiO/w7G7ZYm8QGvZVGUHLo1CSFLydM4jrco6HtpRe
         4og1aqcPz3A9MuzzdhA1cG817nWzb0rJoU7uaIVkp9KlBY5A123Gxrh+UddKQxTSd5dm
         Iq/Q4I01JIuIrNFyquW/QD4Q1ZLXIceGG/h9T1QLNoooCMxNfU1BgBGTnZ5PdLn3g64U
         EirQZX96jwp7dGvE7cnMK1dZvYl5+7YfbRf28KoPbm+1n37YBR3XknAVPMmwYhUUZzqW
         BjJw==
X-Forwarded-Encrypted: i=1; AL+hErGNpnpUKUsTVlIME2h5Bi/OBO6fY0pqZbvaF8+yz/y86KKsS4tj06y8QzpEzuQuPNUxR5NEBinUNjVgQkJLnK3j@lists.infradead.org
X-Gm-Message-State: APuU4Z8XS68jlI77jBsEtb7hIfENRz8Daww38L4VNap/fVMjVoqaVPtR
	CF6nl6nWTVgMQpenBAssV4hINKGLrx/wuknI7IcUApdwKu0wkIEQMsn4
X-Gm-Gg: AYBFou3raLk2sNDjTG8PIDXq8XU8jUmWuHaBTs0CBCVykW7I7brIiyGBWMiESIjcAtH
	aQ/XisET+xzDVzeXWlHcxkQIGiHmXs2Nl7SVxVOlR0JWIOWtaINo274fkd0GIGTJtbxn/CW+PnR
	pPxBI80KQHFGqEaP225haDAUKraw128vy8yKl45358bUx2n6WcSDXkOrjEUddF6VH6jT2jSgTlZ
	cnULQ0gGSScAjXl7Q57h0i6gLzc/y45FqVYQRFk6xNxVYftjyqATF4aG5pXVo++mRFNHJyK55jf
	Psfdyho1mAV4KRLnYpYWf5Xa88eIqCy8umSO5Lnfyvx8s/oHxdqR8rSDbP0vTfWNek3ViOYy2Et
	r7hRsKV9Bg8UjAxRhjVwuKSHqxsZ7hrMuJDWiRkTuMpBt21bqS42XfKE3Bk5zZR8x8NQyI+d+Ym
	Nzs+wNZryyV9n4e9aelHjD2CXIyJo/zMtS7Pl+NXJ5gq72rvswQwRudLhW2RNQSMCHUhr/bzmeo
	hJsAuNGXHXrlxEcXIBm4HzHxDfn25+yHuBDVs1baCAdA1g/2qpIJjwrCfxwkVOUc42fzkIKuW4X
	P9T9QeiJAEvO0Ma5UI7WUYFLLSE8aR+zdnk+CSf3XQnriAruGshvDR3hNv6izlGZTowy+X5JBXZ
	uUhCCNk/4pVwqqTDgrvYxYTmkfztMAFq71z7pYm/gfVJt+B3lChHmrAmYjaCq1nMNbaL1YMU8BT
	YuGsVsySNktTsCOnjjbPJUowqGihyU5lU85HnlSmKz9nOgtEI0Lraw
X-Received: by 2002:a05:6820:1c8b:b0:716:b936:7cf6 with SMTP id 006d021491bc7-71ab4d8584bmr5458319eaf.4.1794810631234;
        Sun, 15 Nov 2026 22:30:31 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab42c41e9sm7994558eaf.6.2026.11.15.22.30.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:30:30 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 23:29:52 -0700
Subject: [PATCH v5 37/58] mtd: rawnand: meson: retain open-handle state on
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-37-cbc49c5c5e74@gmail.com>
References: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
In-Reply-To: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
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
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_223034_319997_5E1B8F02 
X-CRM114-Status: GOOD (  15.31  )
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


