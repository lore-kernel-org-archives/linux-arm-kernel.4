Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5ED160711C0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 07:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TmmarXbC;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cBwN7iJR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=NnAS6WOgFuGwDjvtZJG6FbzuORG3Gs7qMjpBKDa9+4A=; b=TmmarXbCDJ8iN1
	faEKYmjjO94W/XQ7lviwzVZvlCAvPeH/sw55ekkFg24PSot3kO3zTRlCoYzW9IHnnPsT+2Ds7bzzH
	Qbnq1cEWSIEY7iIqeVfq2OvY4C2BMO1RImWkal8wF8PMSuE1pzlbhntQgfJQMdioV/ixsaFauwF1q
	2fq3JcuFU9UdVTzCnZmh1ttVLEM9d9kNpGsEG0NdlvAYfo7DTdgF/RjLB/EDDQI+BXjZp9TfYYOXL
	PdHhwD7jMXeYcFJe7UzPRi9Fguw7UTKGl29PwvPNMMQCuUmPowVzWeuZk0LhPD+dTfKOju7SaiYgB
	rqZwb5ZJDQ4fUfWyg7Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgXG-00000002wez-0Xy0;
	Tue, 10 Nov 2026 07:44:54 +0000
Received: from mail-oi1-f177.google.com ([209.85.167.177])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgX2-00000002wDn-4C7w
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 07:44:51 +0000
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-4af81963f35so775036b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 23:44:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296680; x=1794901480; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NnAS6WOgFuGwDjvtZJG6FbzuORG3Gs7qMjpBKDa9+4A=;
        b=cBwN7iJRWdHNoYTytwGjePCD3rx7AkxTBuZGeQHAJxcVnEdwPK9GvTZDrt8eOQcV7u
         JoxViNqKXeBumfvAq/h0IWLTrvP6Nvv+hRv8/MTbo4q5DMsnw+SElXiT0UrTRrYKgK6Y
         fhePosh7RTE4e72OAu2p74UQ7pVXeAQzlLjJyH2lOOVr3AIyrNe2RE8c62gJzRlksiNZ
         HNNXVy3j8meKJfYWYhBXeoiRQT+PUVMR2IAvCnhJeIMbyC9P/WO9Bl2ZNm1/p5LglIP8
         IJZVfHNPZlHeg3CvV7bOZ4x6H/asgEyh2yRbLMCMlcssA4chqPYmgQXYGiRvsz2A0XM/
         nfcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296680; x=1794901480;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NnAS6WOgFuGwDjvtZJG6FbzuORG3Gs7qMjpBKDa9+4A=;
        b=vDyOGJjlvIn6O2RSQFbq3Uox3m4vg7F4EnCa9b8CuvAWoviPuBNPQbcKTWBzk+Ga/g
         qaMyEcuSl07Ds9H+m6EW8v1nU8bzvFLcsrzo9NjxsGHMP7/iM7oTnppPko+6LyAfPP7+
         zarcMJlzAj8TU0z3iMYwslCrvBlq+/5TJM3MCfw1ukwNLx682rV2UEQ3bwLg4e97Ho37
         SxZyKsZ2mcADuQ5MeCz8TpwjAk3Kzb9GwV+75GYd1aL2mcG1rqxuRbqRB0EmGMd/1q0H
         do8N/S1soh5+jqKQ6kfi6PGABMFKoKobZGXzBXYV0kISgyEqKzSv8TUotfz3rYbin4QC
         0j9w==
X-Forwarded-Encrypted: i=1; AL+hErG96zLQOce1zuhz679ei5ts2gRg1c7/4XpGTo2tdhHk3l1NtXLAikc2U6msPug90UAq7kPEukVmzqtB8hBSHEQa@lists.infradead.org
X-Gm-Message-State: APuU4Z+CNtvGYo06mNXgLw7SQBy8kwMkKC3xKEbPmsHGqli6siQD2MDi
	79aDDu+Hhd2Va1CKYzngnc5uE0gc2bneGpBChl3AkmXoLQO5E6Cg9tIB
X-Gm-Gg: AYBFou0NGZxT2ME/DrEBetOZUMcZd2M1GyLXKkXPqD0sE8b6mBDI3U8E6JijrwdF4Ob
	We6f+Y1INk80efjvSN5ZE2wPHLpbp2pofWSCycxNmlQkeLELVnwuev98sEy3qY9oxGj8YfGahVA
	CrEtwRRwoKdZtoP3Pbyxb2OSOR+MEIpTO0vzCKaXIhtY4xJR3TSAci60jbovmSpJNafczrVd6mC
	pClAKXAgX9xe/OCDSC9GvTtm8bIP8JZsEqIPyO0CxaAxAmBfDUa9C+49l1hiQ0b0lhNNV7eY2vn
	MebEOEbMcFLGMv8Qr0Y5nm8HCRx528ssyCMYIyQ3vEa0AssJDQvKmApIEQOSOmfeM+7fxLwAPFV
	NqIS7My2DGeLHSEP5loYAQUhZeQMm9xMxVj0yb/b4QSljRpWxuMvZ6VdLvdoH441c9pECh2Fjvy
	H4OxZex0qp7dNlmZtraQ400GR9DwrdA/IUf+8wZ7+AKdZvbvpbxyVum8KTlZVDX4Ioa1qYpVm2t
	t5WgqHEfdtQkpmYhl4Ym63Ea2nNl4GsS7v1RKE1Sjw+GrwwGkuY0O69fPukft4+Xd4LBx5r5VGZ
	rkQBT8eTIhwQYgn1qpV1GsPpOFITDqL5jzOrjKZQ0NP5jZZEM6VXJpPMEOpghUjMjHnVgWFh+21
	VHzT0Zr4ybzXn+Bt2QqmEPBbuzf+l++I9tPvKTsHZz8xU6MHXuNn+w47wCz4fIQ1EYDyiqM2fQv
	fa5O++wZ191ea9KwxJTvhgcAceK13ban7a37GgiI6tSlbogLlt7LY=
X-Received: by 2002:a05:6808:3505:b0:531:7f68:842e with SMTP id 5614622812f47-5683c73b48dmr1413961b6e.8.1794296679771;
        Mon, 09 Nov 2026 23:44:39 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm1522804b6e.3.2026.11.09.23.44.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:44:39 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 00:44:20 -0700
Subject: [PATCH v2 17/58] mtd: rawnand: rockchip: retain chips across
 controller removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-17-9137d08f05df@gmail.com>
References: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
In-Reply-To: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Heiko Stuebner <heiko@sntech.de>, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 Yifeng Zhao <yifeng.zhao@rock-chips.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_234441_094789_9E6B96DD 
X-CRM114-Status: GOOD (  17.50  )
X-Spam-Score: -1.8 (-)
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

Fixes: 058e0e847d54 ("mtd: rawnand: rockchip: NFC driver for RK3308, RK2928 and others")
Cc: Heiko Stuebner <heiko@sntech.de>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-rockchip@lists.infradead.org
Cc: Yifeng Zhao <yifeng.zhao@rock-chips.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/rockchip-nand-controller.c | 49 +++++++++++++++++++------
 1 file changed, 37 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/raw/rockchip-nand-controller.c b/drivers/mtd/nand/raw/rockchip-nand-controller.c
index 9444ba02696d..aa31457390cd 100644
--- a/drivers/mtd/nand/raw/rockchip-nand-controller.c
+++ b/drivers/mtd/nand/raw/rockchip-nand-controller.c
@@ -1115,6 +1115,11 @@ static const struct nand_controller_ops rk_nfc_controller_ops = {
 	.setup_interface = rk_nfc_setup_interface,
 };
 
+static void rk_nfc_nand_release(struct nand_chip *chip)
+{
+	kfree(container_of(chip, struct rk_nfc_nand_chip, chip));
+}
+
 static int rk_nfc_nand_chip_init(struct device *dev, struct rk_nfc *nfc,
 				 struct device_node *np)
 {
@@ -1134,8 +1139,7 @@ static int rk_nfc_nand_chip_init(struct device *dev, struct rk_nfc *nfc,
 		return -EINVAL;
 	}
 
-	rknand = devm_kzalloc(dev, struct_size(rknand, sels, nsels),
-			      GFP_KERNEL);
+	rknand = kzalloc(struct_size(rknand, sels, nsels), GFP_KERNEL);
 	if (!rknand)
 		return -ENOMEM;
 
@@ -1144,17 +1148,19 @@ static int rk_nfc_nand_chip_init(struct device *dev, struct rk_nfc *nfc,
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
@@ -1179,14 +1185,15 @@ static int rk_nfc_nand_chip_init(struct device *dev, struct rk_nfc *nfc,
 
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
@@ -1197,16 +1204,26 @@ static int rk_nfc_nand_chip_init(struct device *dev, struct rk_nfc *nfc,
 		rknand->boot_ecc = ret ? chip->ecc.strength : tmp;
 	}
 
+	ret = nand_set_release(chip, rk_nfc_nand_release);
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
@@ -1219,8 +1236,9 @@ static void rk_nfc_chips_cleanup(struct rk_nfc *nfc)
 		chip = &rknand->chip;
 		ret = mtd_device_unregister(nand_to_mtd(chip));
 		WARN_ON(ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
 		list_del(&rknand->node);
+		mtd_put_master(nand_to_mtd(chip));
 	}
 }
 
@@ -1375,17 +1393,24 @@ static const struct of_device_id rk_nfc_id_table[] = {
 };
 MODULE_DEVICE_TABLE(of, rk_nfc_id_table);
 
+static void rk_nfc_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct rk_nfc, controller));
+}
+
 static int rk_nfc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct rk_nfc *nfc;
 	int ret, irq;
 
-	nfc = devm_kzalloc(dev, sizeof(*nfc), GFP_KERNEL);
+	nfc = kzalloc_obj(*nfc);
 	if (!nfc)
 		return -ENOMEM;
 
-	nand_controller_init(&nfc->controller);
+	ret = devm_nand_controller_init(dev, &nfc->controller, rk_nfc_release);
+	if (ret)
+		return ret;
 	INIT_LIST_HEAD(&nfc->chips);
 	nfc->controller.ops = &rk_nfc_controller_ops;
 
@@ -1449,9 +1474,9 @@ static void rk_nfc_remove(struct platform_device *pdev)
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


