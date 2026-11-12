Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28B04606A988
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 01:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=su5ekU1s;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KnDB1JKr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=LrtOIEPB5plIuB+N6495+WStqcrxnWFNx4kPBP0QSG4=; b=su5ekU1sOR42Eo
	/L61wPbp+BeNkI1QbAhHhafy5ARXk2ijhrm8VpzPnCAc6+7XD/eRtai2y+ODJtpAmQRBHCOXdLlq4
	OJkB7YEwLqtO6GdGaBQZY7ntE19Hwa2QtmlXqzMVO2WD2UC2/Au9Ws/1LJIBqrwRoBRmRBia3DOq8
	sGcdTj3DfXg2wYP/ZY/30vZm911aMGq+MEra6pD/roUk938XxzbIUE+s5bUBDsJF3pBazKaFXcCZ7
	4iK+hApi6GQ3k1hMDpojaYUo2WXpZIdafE1Kcgbb6Dre+NifK/ugPBT/zdG4+PCO5loDY/wH4YY9e
	YpUwF0aVCCJQo/Tbjozg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJct-00000008MT5-0wwM;
	Thu, 12 Nov 2026 01:29:19 +0000
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJcS-00000008LaJ-08VM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 01:29:02 +0000
Received: by mail-oi1-x236.google.com with SMTP id 5614622812f47-4af81963f35so1874724b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 17:28:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794446931; x=1795051731; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LrtOIEPB5plIuB+N6495+WStqcrxnWFNx4kPBP0QSG4=;
        b=KnDB1JKrzWW/R/wIk1iyyNotKrP0UZNJS8a46KPytH22dbn6VclEoyBZANSnAzY/2M
         CjCQkSEJa6wa4x3GNzLahzqXMIIie21HIhQB9tuANjfyw/HnCdIgl+WLp1QWejJ/d0xc
         QSXMN6NVOaNILOgJdHAq9XHE0qCa5afS0/uKoT3+gqsR3+9TZawucO+P/c0PejA1UPfC
         98vwATa+fArca6ImRqW+ETFoMfXgszXkBSlKryhF7nSc7g3p2pm7ihHPN9Px0SgMXwxp
         /CNaR/14S3sGkcvLkYcF9Dtix+PjFsEDGiPw90fpChHcTaKXjTJQzVorFSgayTIynsp1
         1uXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446931; x=1795051731;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LrtOIEPB5plIuB+N6495+WStqcrxnWFNx4kPBP0QSG4=;
        b=m7OelYJ7BDPTZCWxk8+LqKFTMUcmESPu0HZD7EIkqA0BMYwqN093IxhjRY9R6re8Tu
         zufFGL884r1CS2+Mr9lcK5HUIicwo2rpjEKLp4cLDf/DzaFUpEVzPC3Q4zV6DaMwBU6P
         UGdAS62gNou8g6aEsiFJsuQuNm0Bos3QRCmmT3g0YwlXB4prc18KGigZ84qlZlf6t4s3
         2FlYMCaRGp+0eh1ttxeBkeShEod2b9FbgN94tapHy8VfGfqnh83vlAuuHJRvEhInAC7I
         e0OYfpGYJQslLIVv+z3tEm8ok7CKKrn3a3He4+OcN6lDQC7QjmERjeBKjHiNalFxW+zb
         BQAQ==
X-Forwarded-Encrypted: i=1; AL+hErHMh/EdqQM35MiWcE+lJw8O2mnRaLz3LUUY8SYpJQUngohyQ5QEN4Y5EKz5U3SOkevs8Qmvy/BRwwC9kJespDhO@lists.infradead.org
X-Gm-Message-State: APuU4Z83CXC7N9rs5BtghTdAHP24dAzmz23Z/AyUyTukI5jLHWRfzmtx
	M0UDepihKZ2KIVak3+uckKs/WVPDzmFD8vUBSShJAfmazFKCrqmP1E3v
X-Gm-Gg: AYBFou0t2bXOwFMj2LGWMPiW8IQuaw+FKEGstMPsC2jmqp6SsdrAPjYUvbD9ZH0gbfO
	2uLgHqxpSxVfymJxq4YXcQ7y81ooGt1lpSgN9na6k48ygstVx6ClQ/+DvqtEFbOscqU43CDRzH/
	22J1inKy2RfeoM7LqWDg37M4RZfzfSwcRTkmj9AiDosOC1GhWj4vB5u5x0jbvr3toIfWCKgL4Zc
	+B1YdhYzVT9ORTXXFtKWOY9sAyw5hNcW660TB5hUdDzcz0IG/xNE9ShjeBa8XkHJ1ALgFY6aoni
	ALFEdVQP59nc7SFeDTEcLvQjKyaxRkWSYGx4O1uIzxOnzyAjIc+Yo4gDDBQKRkGVFqdBERH75y9
	Dg4mC2A2ucwR7IAi8utpKNyx5XUQb+vKq6bAKbR1XUlTAV57Ev87SPC8IpFgqoZG7c5DU+nad4/
	zBeOvWNyd2KveIuO0ycRf+CsT5wyu65wnPjqF4Jo0cJhM8BOdFlg8jnb9cw6esbMEJ3J/oQDhhG
	NwemOiyZ0NWiE3H+dcqL6b5nrM6B5Ti6t1qUongdeRowJ07r8n1T7K1KF0GVBCJLoi6G25TeCDx
	8bnQKE+QZnC44283W5HYY/080VxiPWDrTPaKWrj07wKjRwxkm0nPWnKAsCrv3jviQk7BjoXrXIW
	soXAfi0SNBzGQd6XR9MRf6I89speJ7GdF382/s6XJmH2k4RqmfO5sNXZnTg9rbnOfFjaPN/hF4g
	pIS7l0YNy/ZP3iDxYW0L4rrOKV2BmC76CKvaKOUWkGyQwHFG+/frcx
X-Received: by 2002:a05:6808:13c1:b0:52b:7641:33a6 with SMTP id 5614622812f47-56b95164a88mr4069642b6e.14.1794446926299;
        Wed, 11 Nov 2026 17:28:46 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905738049sm6823481b6e.10.2026.11.11.17.28.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:28:45 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 18:27:55 -0700
Subject: [PATCH v3 16/58] mtd: rawnand: mtk: retain chips across controller
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-16-ce537999741d@gmail.com>
References: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
In-Reply-To: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Matthias Brugger <matthias.bgg@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_172852_162981_6B1D63CF 
X-CRM114-Status: GOOD (  15.69  )
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
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Give scanned chips their own storage lifetime and retain the shared
controller until all chip references have been dropped. Unregister and
disconnect each chip before releasing the ECC provider and clocks.
Unlink chips before the final put and unwind unpublished allocations
directly.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Fixes: 1d6b1e464950 ("mtd: mediatek: driver for MTK Smart Device")
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Boris Brezillon <bbrezillon@kernel.org>
Cc: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/mtk_nand.c | 36 +++++++++++++++++++++++++-----------
 1 file changed, 25 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/nand/raw/mtk_nand.c b/drivers/mtd/nand/raw/mtk_nand.c
index a36a82d10aa7..010f614a2da3 100644
--- a/drivers/mtd/nand/raw/mtk_nand.c
+++ b/drivers/mtd/nand/raw/mtk_nand.c
@@ -1356,8 +1356,7 @@ static int mtk_nfc_nand_chip_init(struct device *dev, struct mtk_nfc *nfc,
 		return -EINVAL;
 	}
 
-	chip = devm_kzalloc(dev, struct_size(chip, sels, nsels),
-			    GFP_KERNEL);
+	chip = kzalloc(struct_size(chip, sels, nsels), GFP_KERNEL);
 	if (!chip)
 		return -ENOMEM;
 
@@ -1366,17 +1365,19 @@ static int mtk_nfc_nand_chip_init(struct device *dev, struct mtk_nfc *nfc,
 		ret = of_property_read_u32_index(np, "reg", i, &tmp);
 		if (ret) {
 			dev_err(dev, "reg property failure : %d\n", ret);
-			return ret;
+			goto free_chip;
 		}
 
 		if (tmp >= MTK_NAND_MAX_NSELS) {
 			dev_err(dev, "invalid CS: %u\n", tmp);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto free_chip;
 		}
 
 		if (test_and_set_bit(tmp, &nfc->assigned_cs)) {
 			dev_err(dev, "CS %u already assigned\n", tmp);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto free_chip;
 		}
 
 		chip->sels[i] = tmp;
@@ -1406,7 +1407,7 @@ static int mtk_nfc_nand_chip_init(struct device *dev, struct mtk_nfc *nfc,
 	nand->ecc.read_oob = mtk_nfc_read_oob_std;
 
 	mtd = nand_to_mtd(nand);
-	mtd->owner = THIS_MODULE;
+
 	mtd->parent_dev = dev;
 	mtd->name = MTK_NAME;
 	mtd_set_ooblayout(mtd, &mtk_nfc_ooblayout_ops);
@@ -1415,18 +1416,28 @@ static int mtk_nfc_nand_chip_init(struct device *dev, struct mtk_nfc *nfc,
 
 	ret = nand_scan(nand, nsels);
 	if (ret)
-		return ret;
+		goto free_chip;
+	ret = nand_set_lifetime(nand, chip);
+	if (ret) {
+		nand_cleanup(nand);
+		goto free_chip;
+	}
 
 	ret = mtd_device_register(mtd, NULL, 0);
 	if (ret) {
 		dev_err(dev, "mtd parse partition error\n");
-		nand_cleanup(nand);
+		nand_disconnect(nand);
+		mtd_put_master(mtd);
 		return ret;
 	}
 
 	list_add_tail(&chip->node, &nfc->chips);
 
 	return 0;
+
+free_chip:
+	kfree(chip);
+	return ret;
 }
 
 static void mtk_nfc_nand_chips_cleanup(struct mtk_nfc *nfc)
@@ -1441,8 +1452,9 @@ static void mtk_nfc_nand_chips_cleanup(struct mtk_nfc *nfc)
 		chip = &mtk_chip->nand;
 		ret = mtd_device_unregister(nand_to_mtd(chip));
 		WARN_ON(ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
 		list_del(&mtk_chip->node);
+		mtd_put_master(nand_to_mtd(chip));
 	}
 }
 
@@ -1511,11 +1523,13 @@ static int mtk_nfc_probe(struct platform_device *pdev)
 	struct mtk_nfc *nfc;
 	int ret, irq;
 
-	nfc = devm_kzalloc(dev, sizeof(*nfc), GFP_KERNEL);
+	nfc = kzalloc_obj(*nfc);
 	if (!nfc)
 		return -ENOMEM;
 
-	nand_controller_init(&nfc->controller);
+	ret = devm_nand_controller_init(dev, &nfc->controller, nfc);
+	if (ret)
+		return ret;
 	INIT_LIST_HEAD(&nfc->chips);
 	nfc->controller.ops = &mtk_nfc_controller_ops;
 

-- 
2.53.0


