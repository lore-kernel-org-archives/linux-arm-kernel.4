Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACA3460A2636
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 18:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SfcR/7WV;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UNTufocY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=dp0wbdBRn/fRaDPrI/jgYSie3bI1euecSYoHfiE/X9s=; b=SfcR/7WVyiKa9F
	gso6fRzitEB4ZrYT9F3ntlwZ2XDBj8zLIeN0sHp/Jo5Vb1eKjyctMpW4v/YOSWteTLAO92SZramBK
	7fdrLEaaDvgQXD0cmtPVRZDu/sySCH4h8uYbEyy7s977Ze+vKnY776yE7z+HAx6BqtbkEoXPnWA8o
	x1OWdadbFxlkrUV924AA3OoMk3bheywKXid3jZzBpCTqgaY8Hq/Iy8qKySi3q1iR0m53liprXQsPr
	XimvXVhT/NskpFb61EOaHnUg9fM2yMnpFCjhwOLJKFBKsrY+HTnW5QHU4VqhKz75rKb8Hl8uXyPx5
	ortnBsVBMBvhzKqhLTyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvoi-0000000DrbO-2efZ;
	Fri, 13 Nov 2026 18:16:04 +0000
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvoI-0000000Dqss-2JBG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 18:15:44 +0000
Received: by mail-ot1-x32c.google.com with SMTP id 46e09a7af769-843cf077f10so2769094a34.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 10:15:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794593737; x=1795198537; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dp0wbdBRn/fRaDPrI/jgYSie3bI1euecSYoHfiE/X9s=;
        b=UNTufocY0gphIJDxh1Sb7/ANeeVV2t4PVnRxEP+QRVB1LUHKUEM4XkeEF6NowkmW0j
         V/ej2c7NwZvJJslKQN/Vd9c0lBeQIYqZD1jBbv4q/rX0YFXFs3FS8fPmvHqDbW2IRYLC
         q7AYsaJgRHHz+b+qAXhaV5sJ3FwJh8c5W10yBTcEPPexVp2fF/nUwqJXC0s3wpC4mF+l
         Rk2S0JP4gTHDyG0ardbHPoPd/7umFPvoSyZuMx5wQ8T7SCclioJhKVps9TGwNZi4Y+Wr
         9CPLgYnkQj9oUDsXpBvrk7/LsJlr+R1FXhCL1Y+5RJZMIR4hliLxZvO+ZzAEFRQd3JEP
         6x0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794593737; x=1795198537;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dp0wbdBRn/fRaDPrI/jgYSie3bI1euecSYoHfiE/X9s=;
        b=EnC/ruUi4ah9WJnz3VOqLd0YcuOvoef2hseqFWJenLs6k2sAjXPY4Zcs6dbr1FW7J0
         jU3SJ/IxCc6xZPNyBCu+Trr8PHjMQB6G4qN0S6H41fYwsar8dkJi9wAkSPZ/mrswiuBU
         oAwehQKQHVyXACZmeyDkzQd+eRV3Y9QUEli/gbbILkVQ7nuTdjPnWo9M6DdtQHWDHBNF
         e+pVl9YnAW4EMuQqWxhN9M/TuoE6F+138FV+ykJIxOfBl+cYHWrrqb3uIk2haWZghmON
         2uvpq2fanc/QA3kflbm6nHFJgmgYmVx+kiw8GP8VKMmbfIi61GtMCzsJJUoZRrWEYmcr
         XNEA==
X-Forwarded-Encrypted: i=1; AL+hErFvqlIk8Dmua9Ew1q13PHC2IH/v1JOftIn/39ud/Lrpnw7zVrPhf5/vSh9VBh/HLc6c8jNJQkucpo8PYWv3vd0m@lists.infradead.org
X-Gm-Message-State: APuU4Z8A6r5MGRUis9FR/pjb03RJgARABVtsbDpi++njufzMiQR7yG1J
	Bv0k/eMku4lOtGBXL6CTlRaCXf02pSlkitKOq0v5r4CrL/hKR1pCv12U
X-Gm-Gg: AYBFou3JHdXv2+FGYhK9CDfDWNzaJehC24PQrKA94O20bcBme2cq4GR8L6ks5SOiTxs
	ftmOBsTJ6Z+NTfFALyKH7Umfg8jzsyD6tMPzsL4wngigA9sfYsWYV3ZOG5v7NnneM11msXqD7U5
	LJA8CqsFVgPmPZPKJ3l54kHFMvaqHKIgIFgX3TomYMEHvb+/VbvzgDFre0oRBtkL3P54DnV0DLz
	AIrfALUxZvCsOM8WhkjLoJqN9tQOaigHoaOW/QcqUsfsgkrbnzTDwMwZpuNyyEMMmrqtTRUcEE5
	icezKEi+1gwxtgNRwZEuc68DnpWZ3u8Oycu8LlIep7YMEpNDqXSca20x1LWNUCIjgXglLgeNzP0
	bZgzSPrpPLi68CDtMjn55T/uwbnP6O5f5VI8GNSGVQ4H822Y/FN7Td61WL8nHU2bOdOONdz39o5
	xFAKfYSBJ0uzJMURodl59WkBRaLDUilc+hAflwtTDeEskCRnPckA8CNewjj5mzE4WBETGnQOpp2
	CAdeQLpwC60g1BMf3EbqxH88LS1raCpNXsUYogVgN6ClAqPSM2DhNumSoScgXNdGmT8kLvS+H+A
	fJ3Qse5vY2FpGtw9DobyqeuGEvCpPPU3zSXvHVUCuJjeqkPoLUChVTGJShz7Bs49usDDIeyqZ8p
	7/fo4GBj2PukVP11vEzXpq5jF/52/v6rSznJJ6mubo9To02FB5JXHIovekpz6lVY7UUyJ4P9ifK
	+Hs4ezPNkMzXEr28tgqKBDQJC5kA0D53yDvXZ/bsySHFdFAtH84uEI
X-Received: by 2002:a05:6830:4489:b0:81c:37e2:2012 with SMTP id 46e09a7af769-86289870d4bmr3049997a34.15.1794593737543;
        Fri, 13 Nov 2026 10:15:37 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8628817d979sm3253414a34.22.2026.11.13.10.15.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:15:37 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 11:14:34 -0700
Subject: [PATCH v4 18/58] mtd: rawnand: atmel: retain chips across
 controller removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-18-556b1d7c6221@gmail.com>
References: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
In-Reply-To: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 linux-arm-kernel@lists.infradead.org, 
 Nicolas Ferre <nicolas.ferre@microchip.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_101538_670706_573813FA 
X-CRM114-Status: GOOD (  17.46  )
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

Keep NAND chip metadata and SMC or HSMC controller storage until
retained MTD references have been released. Disconnect registered chips
before releasing DMA, SRAM and clock resources. Give chip initialization
ownership of its allocation on both success and failure, including
absent SmartMedia cards.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Fixes: f88fc122cc34 ("mtd: nand: Cleanup/rework the atmel_nand driver")
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Boris Brezillon <bbrezillon@kernel.org>
Cc: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-arm-kernel@lists.infradead.org
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/atmel/nand-controller.c | 42 ++++++++++++++++++++--------
 1 file changed, 30 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/raw/atmel/nand-controller.c b/drivers/mtd/nand/raw/atmel/nand-controller.c
index 0c79d30b9e30..087b7b5fe987 100644
--- a/drivers/mtd/nand/raw/atmel/nand-controller.c
+++ b/drivers/mtd/nand/raw/atmel/nand-controller.c
@@ -62,6 +62,7 @@
 #include <linux/iopoll.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
+#include <linux/slab.h>
 #include <soc/at91/atmel-sfr.h>
 
 #include "pmecc.h"
@@ -1629,8 +1630,9 @@ static int atmel_nand_controller_remove_nand(struct atmel_nand *nand)
 	if (ret)
 		return ret;
 
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 	list_del(&nand->node);
+	mtd_put_master(mtd);
 
 	return 0;
 }
@@ -1639,7 +1641,6 @@ static struct atmel_nand *atmel_nand_create(struct atmel_nand_controller *nc,
 					    struct device_node *np,
 					    int reg_cells)
 {
-	struct atmel_nand *nand;
 	struct gpio_desc *gpio;
 	int numcs, ret, i;
 
@@ -1650,7 +1651,8 @@ static struct atmel_nand *atmel_nand_create(struct atmel_nand_controller *nc,
 		return ERR_PTR(-EINVAL);
 	}
 
-	nand = devm_kzalloc(nc->dev, struct_size(nand, cs, numcs), GFP_KERNEL);
+	struct atmel_nand *nand __free(kfree) =
+		kzalloc(struct_size(nand, cs, numcs), GFP_KERNEL);
 	if (!nand)
 		return ERR_PTR(-ENOMEM);
 
@@ -1735,7 +1737,7 @@ static struct atmel_nand *atmel_nand_create(struct atmel_nand_controller *nc,
 
 	nand_set_flash_node(&nand->base, np);
 
-	return nand;
+	return_ptr(nand);
 }
 
 static int
@@ -1749,6 +1751,7 @@ atmel_nand_controller_add_nand(struct atmel_nand_controller *nc,
 	/* No card inserted, skip this NAND. */
 	if (nand->cdgpio && gpiod_get_value(nand->cdgpio)) {
 		dev_info(nc->dev, "No SmartMedia card inserted.\n");
+		kfree(nand);
 		return 0;
 	}
 
@@ -1757,19 +1760,29 @@ atmel_nand_controller_add_nand(struct atmel_nand_controller *nc,
 	ret = nand_scan(chip, nand->numcs);
 	if (ret) {
 		dev_err(nc->dev, "NAND scan failed: %d\n", ret);
-		return ret;
+		goto free_chip;
 	}
 
+	ret = nand_set_lifetime(chip, to_atmel_nand(chip));
+	if (ret) {
+		nand_cleanup(chip);
+		goto free_chip;
+	}
 	ret = mtd_device_register(mtd, NULL, 0);
 	if (ret) {
 		dev_err(nc->dev, "Failed to register mtd device: %d\n", ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
 		return ret;
 	}
 
 	list_add_tail(&nand->node, &nc->chips);
 
 	return 0;
+
+free_chip:
+	kfree(nand);
+	return ret;
 }
 
 static int
@@ -1792,7 +1805,6 @@ atmel_nand_controller_legacy_add_nands(struct atmel_nand_controller *nc)
 {
 	struct device *dev = nc->dev;
 	struct platform_device *pdev = to_platform_device(dev);
-	struct atmel_nand *nand;
 	struct gpio_desc *gpio;
 	struct resource *res;
 
@@ -1800,7 +1812,8 @@ atmel_nand_controller_legacy_add_nands(struct atmel_nand_controller *nc)
 	 * Legacy bindings only allow connecting a single NAND with a unique CS
 	 * line to the controller.
 	 */
-	nand = devm_kzalloc(nc->dev, struct_size(nand, cs, 1), GFP_KERNEL);
+	struct atmel_nand *nand __free(kfree) =
+		kzalloc(struct_size(nand, cs, 1), GFP_KERNEL);
 	if (!nand)
 		return -ENOMEM;
 
@@ -1858,7 +1871,7 @@ atmel_nand_controller_legacy_add_nands(struct atmel_nand_controller *nc)
 
 	nand_set_flash_node(&nand->base, nc->dev->of_node);
 
-	return atmel_nand_controller_add_nand(nc, nand);
+	return atmel_nand_controller_add_nand(nc, no_free_ptr(nand));
 }
 
 static int atmel_nand_controller_add_nands(struct atmel_nand_controller *nc)
@@ -2044,7 +2057,6 @@ static int atmel_nand_controller_init(struct atmel_nand_controller *nc,
 	struct device_node *np = dev->of_node;
 	int ret;
 
-	nand_controller_init(&nc->base);
 	nc->base.ops = &atmel_nand_controller_ops;
 	INIT_LIST_HEAD(&nc->chips);
 	nc->dev = dev;
@@ -2360,9 +2372,12 @@ static int atmel_hsmc_nand_controller_probe(struct platform_device *pdev,
 	struct atmel_hsmc_nand_controller *nc;
 	int ret;
 
-	nc = devm_kzalloc(dev, sizeof(*nc), GFP_KERNEL);
+	nc = kzalloc_obj(*nc);
 	if (!nc)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(dev, &nc->base.base, nc);
+	if (ret)
+		return ret;
 
 	ret = atmel_nand_controller_init(&nc->base, pdev, caps);
 	if (ret)
@@ -2439,9 +2454,12 @@ static int atmel_smc_nand_controller_probe(struct platform_device *pdev,
 	struct atmel_smc_nand_controller *nc;
 	int ret;
 
-	nc = devm_kzalloc(dev, sizeof(*nc), GFP_KERNEL);
+	nc = kzalloc_obj(*nc);
 	if (!nc)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(dev, &nc->base.base, nc);
+	if (ret)
+		return ret;
 
 	ret = atmel_nand_controller_init(&nc->base, pdev, caps);
 	if (ret)

-- 
2.53.0


