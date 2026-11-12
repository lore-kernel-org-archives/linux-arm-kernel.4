Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0925606AD59
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 01:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=al8nmoUB;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=npXDQKpw;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DWdBIx47
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=FraXL6TvEduJvf5AaveEnMU+FvEiUNO/y+vqECKLnSg=; b=al8nmoUBtPzRlI
	0VOL1W/Q9UhyUDn257TMurk0bMdL45hxdlfOAlllmMZWTHghxSvNUwD3zoCH9Bun/3FbrvcmElEri
	d/LvqDqUF9hmI38oxWDjhAA10qit2KRGZrO7Yp2NFOFFz16ulKy1MwG0XRyK46fj+UblRnaeYIoit
	5dzpIIJXMh/GDTR120A6MEudRBh17YjGOuQQh17rwbX8McPbcMDbAYZ9guhGM4LdDnhT6QO2mPA1s
	Jz3jdyyI4sUbEeOy/u9980Q2mXgdId7YktXcUvsv5G0OZWSByPw7UfemBt9fo7nAnj74zTSAOHm0I
	TkUqz0xrEhBywptPMwzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJcd-00000008M13-32tU;
	Thu, 12 Nov 2026 01:29:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJcV-00000008Lh7-1VIl
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 12 Nov 2026 01:28:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=FraXL6TvEduJvf5AaveEnMU+FvEiUNO/y+vqECKLnSg=; b=npXDQKpwqTvzcG0MJmpOnqwFn1
	SSxg9Q6u+Pl++nKDAvDeeq3MPqTmFlYfVO8dif7dFVvTxfPoBQuGx3ZD8u0wqAjIeZnssHc5TEv+I
	YhoNUzHuWxmSd6hP9OfKKZzdkNVhibwar7w0n2o1UHW657wEzmZg3oE4pzFeBPKoZRVbnA0QiRlXk
	yd2rcZHMqMLU2rSbBC9rhcf43YA+/H7vfeoGCjAGR7VqdYiT1ghmJP38DA497UsrkispFKX/z0+F5
	HLesHnUWwyi/xwgg2Amv2w20XlAyq5PtEDdOxUVJrJbyw5WN7Vv1avaJlt1SBdouKR815qkEIKrhl
	s7PDPrBg==;
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJcQ-00000009mjc-0Xin
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 01:28:52 +0000
Received: by mail-oa1-x2b.google.com with SMTP id 586e51a60fabf-43bf9548df4so3617254fac.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 17:28:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794446928; x=1795051728; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FraXL6TvEduJvf5AaveEnMU+FvEiUNO/y+vqECKLnSg=;
        b=DWdBIx47OiBwmOY4OLXEF+Urr20hO2V2yN7exjIXna8jA8XtkM41mAXFSfcQdjSlJn
         JIh8YntRXXHSqKAsT5a5qEyzrdXy+6gZmBxejiQ9N/lWV/CdLPAfC0czqv9sKzH8uM/q
         HIoWwWFZ74mjPmSshwDbBW+zOahaoe0zKN7UKFwZ6BqVdQQBtfe5yHxrB4FsxwjJq1lU
         o+h9LdFilUiqtQvyXxrMoybeEttcV0GFVClGnEozg4smh5EGucYzsFeZM4rSPNPxBmCk
         Tp6hlG5iTDv7LX16Jvopml8lpGLfvdU05JZbGwa0kXptutoBSA8c2qluEeuT8x/kJIlM
         Hhlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446928; x=1795051728;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FraXL6TvEduJvf5AaveEnMU+FvEiUNO/y+vqECKLnSg=;
        b=JKSLsH0G4svlzqRy6ABSq/Mov2Dk+0cWYT2Av0yyez0lbhf0PWugOet0kgWIXG9pwC
         iSOdJVVklzlAp5mLc6nGcmGSa0IeRU4a2tbcmg7NlZQ2B7HYoBUK3qwdEZ7ZxviEjdoq
         TetiUf1G3QpEOdOGAwvMWQhnUi4H+Gm+bDG7fQKGbm2QtO0enGljHQexyBu5InWqCbwG
         E57GtSo3a+yW5eSwiYKulSj72CTRJtL+RjNobf5O06DQF1RlWUphc0DF2qjgqo84ckto
         tLu7NFBm9Xq9Saf+msb48jgi15KgDmZO3cgFOiYqSbiMajCNmI+kkIhu0UuMQRQPYvCo
         rIVA==
X-Forwarded-Encrypted: i=1; AL+hErHYz5OCUF1tSbPt9S+h12Kz3fmFPijFqVFwG1zqmg6eedMxAw+RCXV08r+bSSABH+PUBkfLXzodhmRqvd2u0/+5@lists.infradead.org
X-Gm-Message-State: APuU4Z/1SO+KsGIE5apN8mQc7TnXqW7Uyfg0P2Ds7dnGTYpQuOXD7BNZ
	OWBkwHJ1E2TW3x8h3dMpBhE7aOR9hDXgdjctUewqvL03RtK2Xws8FARgZhA1Ah4H
X-Gm-Gg: AYBFou1sCNNzv8vMO9fZ4CeBGUFs3kv2xEpRSos6Oipp9eEKVrR+IlVSz7WOe8s1VSp
	+qmLEKjc7s9zsGkguNlpzLQN/0viDHg+KKLBu59zLeTzvL6SbnI5Oxu5/bPe8pfOwZ2G+JBv81b
	gH+CZgICwke856YwmF61Od+cAISKFH5RqhjOD2X+hLIerG8uVMm5KrS9MDaC0is5FsMBh9CftLs
	iJ+uvX7FYaEWfabTOzY9hObL1uuSSe936I74BICmAorpKzK8zeXirNFCyOszicfujsZpz3q/Lkl
	gQHTRTr3mtdtGabRPojm7PhA9qB7siGE5h/vt1I+xnnlJF9BcD8ulADi1gw/FWvP1OaNQjs8N8A
	NS69P2MwtDxNMycT7aPuytOVDEYzbRiE8Q1bKo+ntsPrZ8jt+YrGZ0hN4h95WPbZfKupLqlFhV4
	gTCoKLhsv9h6xeconH16/3TxMTiNsdoc0uTmmnBxDKKy+RIw7We/Y6hHH6PQpEJCVYbUh+wBCBg
	pp57d6f8i6TXGUnMCdCpHBbA5BYYbnFvqMZRPYQ3qqvLKJ6RVyMANAwMSAVWEy5vzGtN8RPTA3o
	1tfGfsJ/rDx9PKKPtvGGZqrJJYOnvAliHoHzdKDiV1cnrHhLn5wMZNP5L7wANU9m0/IjZFbmFmE
	xo1KlKgGehzVtw/5hqVw6EkMpKWUhaUq1b6L20HqrLSW9YQ54NAmM0kMmuPJ4526MnseGXPx3F5
	EVaLddmxARkLoofZXxysvIiQwYrC2pcg95mCemWudQLUjYBXUrDoV3TOJEZGon+XCc0W/3uehvL
	Q==
X-Received: by 2002:a05:6808:1924:b0:4d6:92b3:5c8d with SMTP id 5614622812f47-56b98d27ee0mr4382489b6e.67.1794446927783;
        Wed, 11 Nov 2026 17:28:47 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905738049sm6823481b6e.10.2026.11.11.17.28.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:28:47 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 18:27:56 -0700
Subject: [PATCH v3 17/58] mtd: rawnand: rockchip: retain chips across
 controller removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-17-ce537999741d@gmail.com>
References: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
In-Reply-To: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Heiko Stuebner <heiko@sntech.de>, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 Yifeng Zhao <yifeng.zhao@rock-chips.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_012850_248441_7ABDB778 
X-CRM114-Status: GOOD (  17.34  )
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

Keep chip metadata and controller storage alive for retained MTD
handles. Disconnect each chip after unregistering it and before
releasing transfer buffers or clocks. This also lets unregister
notifiers finish using those buffers before hardware teardown. Free chip
metadata on the final MTD put.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Fixes: 058e0e847d54 ("mtd: rawnand: rockchip: NFC driver for RK3308, RK2928 and others")
Cc: Heiko Stuebner <heiko@sntech.de>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-rockchip@lists.infradead.org
Cc: Yifeng Zhao <yifeng.zhao@rock-chips.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/rockchip-nand-controller.c | 41 +++++++++++++++++--------
 1 file changed, 28 insertions(+), 13 deletions(-)

diff --git a/drivers/mtd/nand/raw/rockchip-nand-controller.c b/drivers/mtd/nand/raw/rockchip-nand-controller.c
index 1e56e5e41f79..1616c9335e38 100644
--- a/drivers/mtd/nand/raw/rockchip-nand-controller.c
+++ b/drivers/mtd/nand/raw/rockchip-nand-controller.c
@@ -1134,8 +1134,7 @@ static int rk_nfc_nand_chip_init(struct device *dev, struct rk_nfc *nfc,
 		return -EINVAL;
 	}
 
-	rknand = devm_kzalloc(dev, struct_size(rknand, sels, nsels),
-			      GFP_KERNEL);
+	rknand = kzalloc(struct_size(rknand, sels, nsels), GFP_KERNEL);
 	if (!rknand)
 		return -ENOMEM;
 
@@ -1144,17 +1143,19 @@ static int rk_nfc_nand_chip_init(struct device *dev, struct rk_nfc *nfc,
 		ret = of_property_read_u32_index(np, "reg", i, &tmp);
 		if (ret) {
 			dev_err(dev, "reg property failure : %d\n", ret);
-			return ret;
+			goto free_chip;
 		}
 
 		if (tmp >= NFC_MAX_NSELS) {
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
 
 		rknand->sels[i] = tmp;
@@ -1174,19 +1175,20 @@ static int rk_nfc_nand_chip_init(struct device *dev, struct rk_nfc *nfc,
 	chip->ecc.engine_type = NAND_ECC_ENGINE_TYPE_ON_HOST;
 
 	mtd = nand_to_mtd(chip);
-	mtd->owner = THIS_MODULE;
+
 	mtd->parent_dev = dev;
 
 	if (!mtd->name) {
 		dev_err(nfc->dev, "NAND label property is mandatory\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto free_chip;
 	}
 
 	mtd_set_ooblayout(mtd, &rk_nfc_ooblayout_ops);
 	rk_nfc_hw_init(nfc);
 	ret = nand_scan(chip, nsels);
 	if (ret)
-		return ret;
+		goto free_chip;
 
 	if (chip->options & NAND_IS_BOOT_MEDIUM) {
 		ret = of_property_read_u32(np, "rockchip,boot-blks", &tmp);
@@ -1197,16 +1199,26 @@ static int rk_nfc_nand_chip_init(struct device *dev, struct rk_nfc *nfc,
 		rknand->boot_ecc = ret ? chip->ecc.strength : tmp;
 	}
 
+	ret = nand_set_lifetime(chip, container_of(chip, struct rk_nfc_nand_chip, chip));
+	if (ret) {
+		nand_cleanup(chip);
+		goto free_chip;
+	}
 	ret = mtd_device_register(mtd, NULL, 0);
 	if (ret) {
 		dev_err(dev, "MTD parse partition error\n");
-		nand_cleanup(chip);
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
 		return ret;
 	}
 
 	list_add_tail(&rknand->node, &nfc->chips);
 
 	return 0;
+
+free_chip:
+	kfree(rknand);
+	return ret;
 }
 
 static void rk_nfc_chips_cleanup(struct rk_nfc *nfc)
@@ -1219,8 +1231,9 @@ static void rk_nfc_chips_cleanup(struct rk_nfc *nfc)
 		chip = &rknand->chip;
 		ret = mtd_device_unregister(nand_to_mtd(chip));
 		WARN_ON(ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
 		list_del(&rknand->node);
+		mtd_put_master(nand_to_mtd(chip));
 	}
 }
 
@@ -1381,11 +1394,13 @@ static int rk_nfc_probe(struct platform_device *pdev)
 	struct rk_nfc *nfc;
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
 	nfc->controller.ops = &rk_nfc_controller_ops;
 
@@ -1449,9 +1464,9 @@ static void rk_nfc_remove(struct platform_device *pdev)
 {
 	struct rk_nfc *nfc = platform_get_drvdata(pdev);
 
+	rk_nfc_chips_cleanup(nfc);
 	kfree(nfc->page_buf);
 	kfree(nfc->oob_buf);
-	rk_nfc_chips_cleanup(nfc);
 	rk_nfc_disable_clks(nfc);
 }
 

-- 
2.53.0


