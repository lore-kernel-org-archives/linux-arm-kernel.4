Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46B21606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 16:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IcbmwMkL;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Thv/2SPh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=uBZHDjcp8OHvO+9HMmytd8ayAJCp+xM1stb3TXPJ8UI=; b=IcbmwMkLRcpJGkNaOu41K2QeUC
	NS5Qae4hFqy4cIzgcVEHX+m/im3je1uZsBmTPF8Shi4B/VB3d5oOfEpa6PkL80uvzEXpvzJQmJHbJ
	lJXViUeRk5oNF1oXZJQt3ILu9bN67KrBN3azIT5E0qyaBXXnuO+PqLP+6AkzPjC/FZ8anZKky0SJx
	eGC6LiP1s7oxkIOWldQ8yhTC67SLeIB9MbirfHEsDSrgQaHjNpMMc7K67vJTVPMO9W24uaIy1G5ue
	06qapm3FahHve+q+44vvVuM/hUSW3rNSPG9t63g/BpepDSYzXXY59LBuBbPRM9jkY4xctqfwMMrw8
	afuHE3qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUR30-0000000FV4x-1oHJ;
	Fri, 20 Nov 2026 16:01:10 +0000
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUR2s-0000000FV1H-1Smc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 16:01:09 +0000
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-4932b13c4ccso656857fac.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 08:01:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795190461; x=1795795261; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uBZHDjcp8OHvO+9HMmytd8ayAJCp+xM1stb3TXPJ8UI=;
        b=Thv/2SPhWfUGFC3BMAZ+Uji4BLKQ2Jt9ZoR0UwNk+kitNswKznlIeODCmIvVnNN1Ti
         iEeHAQn540RodPp+DMtmiB00g5JUlagm8Nd/BsGepXn7O3eI1OEMASg4hCc0QTm192uS
         gjs9xJeWWtxdtUOYNZOPNEeEzWzPCr6hukrEw0VDhU3rEK0gs3OXCGkciwMjnCGhhn2v
         oL3P9VSv14YY0SZWcG3MifWY6sZP0NND/O9Cm9GLDk7bhtkNxugXcSYfk8iXkxxZlpJw
         8+IlVB4kTyICLIjYzmXMyF4a1fdhWoyh54sn77IhXRS0VDjpxWGHfpmhgI6n99R3VXc5
         Lqhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795190461; x=1795795261;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=uBZHDjcp8OHvO+9HMmytd8ayAJCp+xM1stb3TXPJ8UI=;
        b=ijcgtUg/qsEWxXYzM1uf8TPK3ojsZmAvOG2yYVbqJSLoRt3qGgVVk+Lcuay3f71ezj
         JrRsoo0n8TfoX5/y7GRXJ9pd5yUayNG8/9/3h2T5qeRsF6cb6dKW9pWk5HaYJ0yyCrSX
         xsOEjqy+/3oPBdeOsJr4gnEy1klJd0zmJiTtfU+bjtBGEqCifW5CeLMdBWHa1i/Xn6Tj
         u4cnMBKLYalCxY4fCIElCgtIuVCuHsJfvf4hs34VCoFGEu4yHIiuThTP8ksVzKvR2pjG
         rMFZuASFVYBClZFEQ3IBmyQeqccrlKzAAZT3PviIBQb/2+ATb4cERCYVU2yZkCm3Dw7W
         CXTw==
X-Forwarded-Encrypted: i=1; AL+hErF1j/APMeizYijyXThVGw7Ii8z43i4VFfJUnldxijC/RK/dTb5tV+m2XlQXS3LallV4jrYeMzQbdXVuiTnmJl7O@lists.infradead.org
X-Gm-Message-State: APuU4Z/Ax8vNUpA9fSp5mtb6SYe1MzbqQiaaf+iSeB1cqTniSXehqFft
	elL2lU7A7MK1t6NfLained0ygICrcAxbn3kqwoJ3mMnpYAm6VRbSh/kn
X-Gm-Gg: AZFdTZfQeLpxmbwTk97MwI9KbhCa/FugVAELPTRsX4J9SVTOjzmJJGugoI8fAEk+scs
	cL0Tfhk2ulOpTyMiP5Cef7DFoPISUu1XwML15AOwmFffDVjDbmILsBJo0AHHXafMy3OeZlhK7B4
	9zasg8YQdFgAr+RC/yzCeAtQs/HlKbCEmKgzyfoxvwsAQPK/zC5tZjWw1zw6wP8wElkHdtq3mrU
	fhuXNKEQ+BFhQf7Nms4vedFhkPb7GqXV1JRnXJGEwPNggE/pzan/ktxUOvHf5r6RJQ0WW/GJzCw
	GuUBy7ZiwCC0ahDCTqjIpfozwTOwgD/6PDNG/rfmQJEVA8t606U1juXKh92Dw+dXzQPBE65/7iC
	u0BKSHLAvgF4NZPU7SGGbTUHwhfUBDD3Hufw1ZwiKcKVvBQc5ErGH+JERr41X+CBjxG7HAy9VlC
	Orhkb+Uus4qgOQQtb8BU3IqJ+YXTi4G/WgZm5PsTOkDCGOGPwaxW4jnbawm/Z5BaOF1jH4J2I/B
	2/RmXaR9X/lsaALDnl0JfhQ9fNjB9b8ztsRxSpnfhzIibfpeTq8UxxyWhABl/hvIqo31TSHoM18
	loKVVGUA9vbflY6YdrHdzhNF4J6g2MAFMh5OEdHED84g8DdhgCDhzV/kSB4gdwznc7UVAbpdypi
	OFd9E2+1Zc2fn6EfnKCrg/zltXfBa+VKk6EOjDGbcfW1Fc3zUsi5UNqtnjzn8adoxJZVHAhzdlg
	uhQAh3sPhHsj8PXoXwjyAuty3G7GmazaCo7+bqOxWNTbjpey4TfOQ=
X-Received: by 2002:a05:6870:b93:b0:4a9:5bde:8484 with SMTP id 586e51a60fabf-4bc85402f1dmr3040217fac.51.1795190460802;
        Fri, 20 Nov 2026 08:01:00 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4bd044fc4besm2161534fac.7.2026.11.20.08.00.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 08:01:00 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 09:00:53 -0700
Subject: [PATCH v2] mtd: rawnand: atmel: keep the HSMC clock on until the
 NFC IRQ is freed
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-submit-atmel-nand-irq-teardown-v1-v2-1-7460e7c8c163@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42OQQ6CMBBFr0K6doRSgujKexgXpR1hDC3aVtQQ7
 m6LcW8ymz9/8ubNzKMj9OyQzczhRJ5GG0O5yZjqpe0QSMfMyqKsOS924B+toQAyGBzASquB3B0
 CSqfHp4WJw2VflKLYKd7olkXOzeGFXuuP0/mbI+SKKiRwumilR2idtKpPKxN0nsi5xVdIfU8+j
 O69Sk48cX4+zR8+cTiIiteVUI1AFMfOSBq2ajTsvCzLByGyZ7cEAQAA
X-Change-ID: 20261107-submit-atmel-nand-irq-teardown-v1-f902307c18db
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Boris Brezillon <bbrezillon@kernel.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_080104_290390_FF7DD9B2 
X-CRM114-Status: GOOD (  18.67  )
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
X-Spam-Status: No, score=-20.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

When the Atmel NAND driver is unbound on a system using the legacy DT
binding, another device on the shared interrupt line can still cause the
NFC handler to read registers after the HSMC clock has been disabled.
The remove callback turns off the clock, but devres releases the IRQ
only after the callback returns.

Register a clock cleanup action before requesting the IRQ. Devres then
drains the handler before disabling and releasing the clock, both on
removal and when probe fails after requesting the IRQ.

Fixes: f88fc122cc34 ("mtd: nand: Cleanup/rework the atmel_nand driver")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes in v2:
- Use a devres action for clock cleanup so devres releases the IRQ first.
- Link to v1: https://patch.msgid.link/20261108-submit-atmel-nand-irq-teardown-v1-v1-1-341643c83ee3@gmail.com
---
 drivers/mtd/nand/raw/atmel/nand-controller.c | 56 ++++++++++++++--------------
 1 file changed, 28 insertions(+), 28 deletions(-)

diff --git a/drivers/mtd/nand/raw/atmel/nand-controller.c b/drivers/mtd/nand/raw/atmel/nand-controller.c
index b86d080bcb2c..ce5e13276d2e 100644
--- a/drivers/mtd/nand/raw/atmel/nand-controller.c
+++ b/drivers/mtd/nand/raw/atmel/nand-controller.c
@@ -263,9 +263,6 @@ struct atmel_hsmc_nand_controller {
 	struct completion complete;
 	u32 cfg;
 	int irq;
-
-	/* Only used when instantiating from legacy DT bindings. */
-	struct clk *clk;
 };
 
 static inline struct atmel_hsmc_nand_controller *
@@ -2151,6 +2148,14 @@ atmel_smc_nand_controller_init(struct atmel_smc_nand_controller *nc)
 	return 0;
 }
 
+static void atmel_hsmc_nand_clk_cleanup(void *data)
+{
+	struct clk *clk = data;
+
+	clk_disable_unprepare(clk);
+	clk_put(clk);
+}
+
 static int
 atmel_hsmc_nand_controller_legacy_init(struct atmel_hsmc_nand_controller *nc)
 {
@@ -2164,6 +2169,7 @@ atmel_hsmc_nand_controller_legacy_init(struct atmel_hsmc_nand_controller *nc)
 	struct device_node *nand_np, *nfc_np;
 	void __iomem *iomem;
 	struct resource res;
+	struct clk *clk;
 	int ret;
 
 	nand_np = dev->of_node;
@@ -2173,41 +2179,46 @@ atmel_hsmc_nand_controller_legacy_init(struct atmel_hsmc_nand_controller *nc)
 		return -ENODEV;
 	}
 
-	nc->clk = of_clk_get(nfc_np, 0);
-	if (IS_ERR(nc->clk)) {
-		ret = PTR_ERR(nc->clk);
+	clk = of_clk_get(nfc_np, 0);
+	if (IS_ERR(clk)) {
+		ret = PTR_ERR(clk);
 		dev_err(dev, "Failed to retrieve HSMC clock (err = %d)\n",
 			ret);
 		goto out;
 	}
 
-	ret = clk_prepare_enable(nc->clk);
+	ret = clk_prepare_enable(clk);
 	if (ret) {
 		dev_err(dev, "Failed to enable the HSMC clock (err = %d)\n",
 			ret);
-		goto out_put_clk;
+		clk_put(clk);
+		goto out;
 	}
 
+	ret = devm_add_action_or_reset(dev, atmel_hsmc_nand_clk_cleanup, clk);
+	if (ret)
+		goto out;
+
 	nc->irq = of_irq_get(nand_np, 0);
 	if (nc->irq <= 0) {
 		ret = nc->irq ?: -ENXIO;
 		if (ret != -EPROBE_DEFER)
 			dev_err(dev, "Failed to get IRQ number (err = %d)\n",
 				ret);
-		goto out_disable_clk;
+		goto out;
 	}
 
 	ret = of_address_to_resource(nfc_np, 0, &res);
 	if (ret) {
 		dev_err(dev, "Invalid or missing NFC IO resource (err = %d)\n",
 			ret);
-		goto out_disable_clk;
+		goto out;
 	}
 
 	iomem = devm_ioremap_resource(dev, &res);
 	if (IS_ERR(iomem)) {
 		ret = PTR_ERR(iomem);
-		goto out_disable_clk;
+		goto out;
 	}
 
 	regmap_conf.name = "nfc-io";
@@ -2217,20 +2228,20 @@ atmel_hsmc_nand_controller_legacy_init(struct atmel_hsmc_nand_controller *nc)
 		ret = PTR_ERR(nc->io);
 		dev_err(dev, "Could not create NFC IO regmap (err = %d)\n",
 			ret);
-		goto out_disable_clk;
+		goto out;
 	}
 
 	ret = of_address_to_resource(nfc_np, 1, &res);
 	if (ret) {
 		dev_err(dev, "Invalid or missing HSMC resource (err = %d)\n",
 			ret);
-		goto out_disable_clk;
+		goto out;
 	}
 
 	iomem = devm_ioremap_resource(dev, &res);
 	if (IS_ERR(iomem)) {
 		ret = PTR_ERR(iomem);
-		goto out_disable_clk;
+		goto out;
 	}
 
 	regmap_conf.name = "smc";
@@ -2240,30 +2251,24 @@ atmel_hsmc_nand_controller_legacy_init(struct atmel_hsmc_nand_controller *nc)
 		ret = PTR_ERR(nc->base.smc);
 		dev_err(dev, "Could not create NFC IO regmap (err = %d)\n",
 			ret);
-		goto out_disable_clk;
+		goto out;
 	}
 
 	ret = of_address_to_resource(nfc_np, 2, &res);
 	if (ret) {
 		dev_err(dev, "Invalid or missing SRAM resource (err = %d)\n",
 			ret);
-		goto out_disable_clk;
+		goto out;
 	}
 
 	nc->sram.virt = devm_ioremap_resource(dev, &res);
 	if (IS_ERR(nc->sram.virt)) {
 		ret = PTR_ERR(nc->sram.virt);
-		goto out_disable_clk;
+		goto out;
 	}
 
 	nc->sram.dma = res.start;
 
-	goto out;
-
-out_disable_clk:
-	clk_disable_unprepare(nc->clk);
-out_put_clk:
-	clk_put(nc->clk);
 out:
 	of_node_put(nfc_np);
 
@@ -2345,11 +2350,6 @@ atmel_hsmc_nand_controller_remove(struct atmel_nand_controller *nc)
 			      (unsigned long)hsmc_nc->sram.virt,
 			      ATMEL_NFC_SRAM_SIZE);
 
-	if (hsmc_nc->clk) {
-		clk_disable_unprepare(hsmc_nc->clk);
-		clk_put(hsmc_nc->clk);
-	}
-
 	atmel_nand_controller_cleanup(nc);
 
 	return 0;

---
base-commit: ec1e844b9486302a488abc03ea918db60709766e
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next
change-id: 20261107-submit-atmel-nand-irq-teardown-v1-f902307c18db

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


