Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44CDE606D940
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 06:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YxI1PmeD;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=n/A17ZJS;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jkjD1B8V
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=LrtOIEPB5plIuB+N6495+WStqcrxnWFNx4kPBP0QSG4=; b=YxI1PmeDcjnM2X
	IqEgI3h4at54FyNIdcjri3wd9cIOgofnC3+hZ3SQJtgON1lwBpDy8fiTldsJQMu0grt+lxsUYoi7J
	uUST/R7Sr9QlvjTYhN7WUqN7wasfN/YivFZ7BgZMRtJH4ZOlAaVydV3jaPBqx5gpr16arXgDrK0l/
	+j+PAT53nCZTs1Q/+HVoIyN1Qeoj6qxvVPrRXJcwHoXf8QusbxWAsw8Z4jMm3UEBY3WSREXtAb1oT
	pNj5nbUrfu+/g0Zyq2lZ0s6krDOSZw0C0ASjrpE6VfbAorVGMVXyhFdhZnIdGe5pMvwR+8CCLn2Sw
	UUODfBcTnhCdoudCJMAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqEe-00000001FyY-42Wt;
	Mon, 16 Nov 2026 06:30:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqEO-00000001FYB-3zy3
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 16 Nov 2026 06:30:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=LrtOIEPB5plIuB+N6495+WStqcrxnWFNx4kPBP0QSG4=; b=n/A17ZJS7/iACs42hA5Q+3VjMK
	IS/HCQMxX83drigBIURKzoAzDF/cgvxfam8Wtq220K0J4gSp3gl41BwcXmhaNf7FDyfZjk27TKC8h
	+tgP02JfAb9NCFvmz+8E0RJ3+GR9GO1mpmVe14snm67C8u8Ov07CVgZ3ULYPdCZyEJywFzo5D5QUm
	cHDKbYShNrza/qT5Es0rkbMqDcXxNb8fFr0RfqyXVEm3USA2V2HWAWPgXYhA3u+AfGzicBXRHZKGt
	Jlnf5iS1z9VhGDbTDTM/7oRaZsH0FI+jah8QFRlcyHL/oSI91dxRGBHBxKfTvbRvIKinINhWPnOlk
	EAy2rgrw==;
Received: from mail-oo1-f50.google.com ([209.85.161.50])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqEB-0000000DPA7-36fL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 06:30:13 +0000
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-717080a2d50so3388400eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 22:30:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794810605; x=1795415405; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LrtOIEPB5plIuB+N6495+WStqcrxnWFNx4kPBP0QSG4=;
        b=jkjD1B8VUMr0c+FieDKvT01tRW4NHi337KMWy+y5F1pKHhzRCaSSHkujJrVUaaS0l9
         AfTVSVnOfPc+f6VEgAURxLgYhBg5ktHS53UhQdcgmGZoPtlRFYlYRn6RVI71FSujHdXN
         tf2/KbE4cvP1RBGsCAoNyiMOHpKOpApQisTXUz31vv7S+cURf8uABnABMIJImiypetsx
         AqbI/RbIgXVw/o5Ac3xLXE9ZTdLo4AkWFE68NMCtVVI3/N+pFVpbWRRjjn57I+qQdFm6
         2SgFVGZUsfqWXFDQslyo4jTaVNwABeGDohVHCyzlinxUsneSHP+n/P3JGh1nqfjgVusp
         gscA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794810605; x=1795415405;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LrtOIEPB5plIuB+N6495+WStqcrxnWFNx4kPBP0QSG4=;
        b=txWvT+1K3L+kA48DOpbOumalYyzNu61du1yz5kEXcHXVzao/4rFBSFBFZqOya0ymyt
         n2qSaLuRcuVt5ClYAm+d3KuGsCLazTbipGBjgMqNUgxEZHH9QiqUH9EjRQQ4mmzVp6s5
         UghLP0qVlo/o2r/Xve3Q1C32btXxvPnAfm2NL3ahHKW13g219MXo0EF8pm7JS9yh4klb
         +kHp0SaD+YKFB75AtWB1wpk0fsHyiV6luPX/PqQg1r4mYDtTBzQZ/7Vlm+yyUISjB6JP
         wN3CQR5gtehKukBR+9zNj7mhkqn8l7UljBmWouIG6xOcHEotKiYh9hhz09hap0LTVO9e
         dxWw==
X-Forwarded-Encrypted: i=1; AL+hErEmjE3PJYstOzJk8Mn9FNBENVH4oxyCg9yXniYWEmB4rOhoY9jAYVGVvstw/yJDtxgNcChq9J9l31HxOsfINhaJ@lists.infradead.org
X-Gm-Message-State: APuU4Z8JknHXThzi8LAoWtoNKu7OA9SwcHyhDOnOdN04XGIqSlZbSokj
	Vu3J3q+i8KxnJqeabutZ/V1Wu66YHR04ez9eOJHcxYKyYK4W7tGz0m7g
X-Gm-Gg: AYBFou1Yh6qBhYvi7gikUXp8X+g3vEcRvbFADeN7hMqYjo81fWJ11u1PdqF4fllW69r
	0XfDo/U9k28ITFQ5nUL2pEPbEi8h4WrigNWYqLqkGfcWQwO1uWzw7NfSAoBRDDf8GBE+ZOfRMu4
	2Id+qnc+fGQ6su0CUfy2e0ddlphwtxKZ6bft1TfjW6bth/EhzXq325nedLHQqcPlGFUarcyqepH
	5W0uk4ZuThL29BUFG+agaiQguXhSs+gXPmBQ9nr70cDiJ21MTKmDmhclRmCkOiKlYUptD84mgbp
	F+DMGpKN3oE5/mWY2oXpT96tQycNkKxnmwzWcsBoJS4QnZd/DakLf2J/H0Ek6YmmmrINLREQA5A
	V8bFRVM5pEa7Y7svbn1CNKRuWT0WcGhFXvWyFc1FNN4J36Qcn5YxcetJeI9HP9+up+8WkC68OOS
	KIKY1UKcY4xb4VMIEUZSaG2QrWy//V/XBKXlEI1w5Ba6sAzGamM71qxrYIeOMCIjcXbLTSd6FDf
	7lQluC9TCoJj+QDhD9h2gcGoi85hq+e8azhDpgip6/lywtS1h83TmrafgjW5z4HjcT32AFm3Eo9
	r4wLGq4/6DCUOg37GsnHBPC6L0YuoBZUSqEWr5P/VpM1e0YKqx5CL0HWroU5ffeTzo+KnhAog39
	QmmkGF10/JTHnolO62n4Kq88r/9/BabF45cnrZEowbMwAkcyJ9G/79SixvTVCUpFdcybZFkbYft
	yIheaLFdyMo1LOowRPpmYsNSlit1tj6GAOHnGSKVwPFs++A0s5M4s=
X-Received: by 2002:a05:6820:55d7:20b0:70d:7aa9:8618 with SMTP id 006d021491bc7-71ab5055d01mr4500855eaf.63.1794810605100;
        Sun, 15 Nov 2026 22:30:05 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab42c41e9sm7994558eaf.6.2026.11.15.22.30.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:30:04 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 23:29:31 -0700
Subject: [PATCH v5 16/58] mtd: rawnand: mtk: retain chips across controller
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-16-cbc49c5c5e74@gmail.com>
References: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
In-Reply-To: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
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
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_063008_122484_A8ADA400 
X-CRM114-Status: GOOD (  16.34  )
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


