Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA87F606C5A2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 18:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hZ6qIvIx;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=F2kFrfR1;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oMCawrgF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=LrtOIEPB5plIuB+N6495+WStqcrxnWFNx4kPBP0QSG4=; b=hZ6qIvIxT7KHN9
	0l/C4zp50Q19Qr1la6yH1sNfuZrGOE9DSvH1jMDiUZM6Vb5h8L1/HsnbfVwussuHF8MFV9/aosMBm
	HHgmOouGz/PH/+HO6J8Io4TIaZbwwpwY4qqYXAXjFmC2n1C7npN/Q2qFaLwyoBmzkWfpaC24x7ZTW
	rvrUUd+djxP7v+JclFRz8SrA6ngigDzgyl7m84L00oiKPOQyK33K51odnBppKLATBaCninR5DZAYQ
	rWjfHmzodh3OPQ/mLXxEa8Bqijj0bTu0YuXY86nwVoxNJ9sjYnE/2dpDsqGo4zX3u0eh6x04mxXTi
	E0j0cK9AJ/OVE4JWjKXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvoT-0000000DrFK-3JPp;
	Fri, 13 Nov 2026 18:15:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvoK-0000000Dqw8-3ilG
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 13 Nov 2026 18:15:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=LrtOIEPB5plIuB+N6495+WStqcrxnWFNx4kPBP0QSG4=; b=F2kFrfR14i57X3+BCDIcO9wihn
	XpViTjXPhO2bYgxU22fF/iD8vteli8/62M74MrcTZIWcQZLmd1lECqQo44OQ5v3qcdJAx/2WMr4Ui
	vPO1MEFC3Fb4WxKJX6/sKm04OAdcgf9k764SeNlMKdAEQIujOJ85gD/S0z1uahKlPglzd+HLXphnS
	l1B5ydERKbTY6GQwjfhj8VJ2KIk+lrKXV0cOK2h3hdimPeF+FJBC3O5cEh2jQTBmueveTCMrvZouR
	SUiBe+pAfnnJ+ErhzE0FQa2tIJ0nIA5BxZt2Q0RR8vh8G6JNhx/p+6RMpXQ5Z744pa3vvLY4oY+aO
	Pfh9AOyg==;
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvoH-0000000Bdes-12et
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 18:15:39 +0000
Received: by mail-ot1-x335.google.com with SMTP id 46e09a7af769-8628b63dd60so389975a34.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 10:15:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794593735; x=1795198535; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LrtOIEPB5plIuB+N6495+WStqcrxnWFNx4kPBP0QSG4=;
        b=oMCawrgFDRyEna7pQS5AI7kFTcO2TbPRm+ANE2eTlD6M4odEntZpVtAmo/GSD+qs+C
         eknjZ6PhUn80LGnRev945DY4QHZN7099iUEex9mSJoeITad1IhoQTEc+peFkWcpXsHbo
         e7SVySpZKe/aHX4/qXniDOV3D4pXqE8OUTKO+WBbFkDLkNDKQbAmrQwXOqYfybu8tR74
         DSDmcmG/zg0ej4g99CtzLeywWTCbb766WkK0K5JPbkEM4ZPgc9515EolWp5V5S3T0yH0
         vPelG8JoqXFdK4BxIZ19jkV5+pdP0wyDwpEPUG2DrsUYyzQvbmoE4d/aFbcaCXvaYN4K
         gdUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794593735; x=1795198535;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LrtOIEPB5plIuB+N6495+WStqcrxnWFNx4kPBP0QSG4=;
        b=h4bKpoz/DUgIjjjlJ0Z5mRZ2V9pDCyteh9OnBvCbW8J0Nmc9N9JEWYnycbOgOz3Eo/
         l5lL7d7+lHQIimD6E5SOIIJup+1N8xHyct9f4mrla4FuZtR0Fm6JxJwocNcu3XcQxNEg
         A9P+Eju2cH8vH8g1iApgb0wUUb+eUKSuknI8wdY9aboQ6QIn/1pgV+McW3j9U4v54WU6
         vsJKM2JOKrZqeUDZjOt3vyzd0A1as8XG6KKNERVEI7iMyeYBzHoj6zXQncgH3yx6WMRt
         Pef0DaAwwlHoxtfz6mS9WJCoPVY4wdstWqD/XRO/1UpOzMsxP/kzdnj1Auh30XTD8CMX
         CztQ==
X-Forwarded-Encrypted: i=1; AL+hErEjOKDJl8QpNM+GTr6JhLCxclZc+Q23EtqWZhCEKpajeLKh5AYaXcPB8ZIaD2KCG2J9W217CZD2sHZGj66cjz+y@lists.infradead.org
X-Gm-Message-State: APuU4Z+yZu19MaX2vnNLyv708gT1gAfVcnuKKYqK28uC24MbqspcQoTW
	kRZE72Eq7979STIY1a532yzQUFAEDTzLTCttNk15ZrBYQtu+Pm1IFRtb
X-Gm-Gg: AYBFou2OZVSfxOGfnUb/Ye7odSpgyrdSBEXfk/THSG+K3tHvgbIgmU66vxq2dXnk5PC
	zY+KgTFGDRkLDffgIMvg5yYAkSoWe35Si2165HQCLt4cp9q3FmcmpU86w/KJBgw+gn1/XCB8LPK
	EHjWweR+SsqTaQsYxqMtX0a9cnVec/Aferqls07DPM6DXrq15g2ALH7moqNH3VPjHfGvkJepGTY
	kLbtq90YnJk2UhqiOm7RGCWrsTqnL61KwGfr+1YkK3GQWaeYqUhX+iwy+cQCguK/olQGky/Wqj7
	h2h4poXcNjhs1Bp9VE5UhY1mGaYzwLT3SZ0GK6T1gvs6BS4vPB1QV4z4uYJe2UEv+re8uwAcnOe
	XULHHC1cCmSV4+2sEXkYgpnEBs21PO3v+Yj4JqCk+sQMbPi54cK1z38r1/loWTm+BcWXISLYFuo
	cjCnq6tdzKfkIUsn25m87ldmgb20gmhYfLG/KnCjX6JD8wwW2ns2N5MZp8mtTu9tkJdQPb/B/xe
	dVl+/apYT43XouGRogRP2SWZY7uEuAIcQtTbWdqUSeO4frseJhQFUpC5u9LE9HVPIcltL/pfyCT
	WbHWLsEMfYAXaPF38U7fYmlxcC6q6H8w4C0U/h/c7IEw7iZe7zD9NMqRYWRUa//U6bPos8b3Fdc
	raht+RcD52A1kT9x9NGNs77EZUOxitX7FeD+DNfQTXsIt/GLxh/DqpE0fj2toLcq53fGFnuuuLV
	/0d2MSI9JAbPw3hR/9qJQSFU7mVaP5r5ltHdMOMh/qO1z8YUGgnec=
X-Received: by 2002:a05:6830:7192:b0:814:8259:781e with SMTP id 46e09a7af769-8628979ea24mr2976379a34.1.1794593735257;
        Fri, 13 Nov 2026 10:15:35 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8628817d979sm3253414a34.22.2026.11.13.10.15.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:15:34 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 11:14:32 -0700
Subject: [PATCH v4 16/58] mtd: rawnand: mtk: retain chips across controller
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-16-556b1d7c6221@gmail.com>
References: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
In-Reply-To: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
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
X-CRM114-CacheID: sfid-20261113_181537_413385_5255B4FB 
X-CRM114-Status: GOOD (  16.36  )
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


