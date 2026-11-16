Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EDEF606B5D2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 06:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=M3DQrsEr;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=OGYPw/Se;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h82NC3E+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=dp0wbdBRn/fRaDPrI/jgYSie3bI1euecSYoHfiE/X9s=; b=M3DQrsErg0AVTJ
	Tx5lKIeDjHT2BbQ0JdW+2NVXnsPPBBTBvE/bDrAbAHMOr3Ygk4TiJRisOHThVQFfTijaAMKVaekpc
	xWbq3L9pLqbCM49b5cwdMGPJ0BRu1IPuWZ3VWGj7L2xUD9KToDnPs7tWTciDlr1XRcRGoJiYvKsiR
	+HFaC0HAEixBJ7utPL5BMeXU8K/fG6fzZcQEE9sj6kpscUO11xt3wz2j+OHMSyBRKo7OEic3lYqZm
	YokVhUvtpPaR0vo7PbooShR2i3zkpVa0finR6sKySiCxemRlgEiUinAE03sWXmhjMTo+hfOBSgcWc
	Fvl0w+FaJxhSms7hmnkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqEV-00000001Fiw-2y0b;
	Mon, 16 Nov 2026 06:30:27 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqEN-00000001FUh-11Ha
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 16 Nov 2026 06:30:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=dp0wbdBRn/fRaDPrI/jgYSie3bI1euecSYoHfiE/X9s=; b=OGYPw/SeO6f7kPyTEDcGwzxvi9
	o/lbPuod6KcjNmh9Ni7IOvU61zpHizeGt+xPI0MLrG/x3NUWARHzp0tou32Mw3fe4YMWHMnmxUbhz
	7vBq/haTp/YakjWl/vpxmJHBEmCnaFOrY0za+r/Al+mcDzVv33dFv6GMXYmCgFMGjUtQPdj5u1JL2
	IYi0AJq3yCOXJcbshirn3dc/Max4WIUYJ/uTPmO/3fRUIbCdEPqdm7PwdzQ1+Ome9F7vcykcskL98
	W43+no1Em4IYe/YUAKsvERVuWf0MxZL+xVNsRHo5vAsN3HT6fF0w1BWQRnhnlpw4WwyQFzMoTQTkD
	uSoxKaiA==;
Received: from mail-oo1-xc29.google.com ([2607:f8b0:4864:20::c29])
	by casper.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqED-0000000CeKo-3pYR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 06:30:17 +0000
Received: by mail-oo1-xc29.google.com with SMTP id 006d021491bc7-6df7f544919so2398629eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 22:30:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794810607; x=1795415407; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dp0wbdBRn/fRaDPrI/jgYSie3bI1euecSYoHfiE/X9s=;
        b=h82NC3E+a3p1HCgySQCAfwcNkgbk81NwsAZOg3v7KWuXP1kZF52sttSgpKV3mgbV/I
         pLjM8T3uAftIIsxOXHz1AAE7KmTVLn5/RbzUecHDw3p2g4qXdAOIgfcrZuvrXuN4AqkU
         PEsUDYXoMbdPCFlDYh+XKmBuD2AVFh7Mh+NRYpqGERkFvluZj3ALErQu01dSGM2QfhD6
         z5VYZMT29k8Ofbw2FjTBe5f0tFvRbAXE95llKgerEvMuN4sZkLBf3k2D6cObsbQbBklg
         i3e1ph7cRhbX81SIWgnl5BZDSFwv35YdsPrRy/mhh0sgMXpgxkm64WyG8YyM78dOf9UQ
         dR3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794810607; x=1795415407;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dp0wbdBRn/fRaDPrI/jgYSie3bI1euecSYoHfiE/X9s=;
        b=BMM6xD0cmO6YaMt8p8JkTNNLR2HtQuB+matIipj5EBDIgZD7yPbZMgO+9gwEJEtTqq
         pmxX39DeFIULR2gAYHgvA5eYns4ShRcVD+sHOWk4N8baaShyI3Ury9V1fE1KyVzwIb3M
         ysK/b3G46YtQmNOR5g7LUI5CZbhgt2EavotyXkr/TO8sfK8kGQea1wqWZ3U0OT8elVZT
         8brUnh6l2DGzmgM07ueRw3UWLM0oZEe9rWeX/PGnrTTw4esV3qQmlOqpAS7jjQaydEOM
         GU/zPqruFYyJfJM32BdQkN6b819xMFwJPJzPorkpn694HtzlmV2Xdhe3Za5hih65zoPj
         j+Vw==
X-Forwarded-Encrypted: i=1; AL+hErHVzi5dkIbXa0defVxrSQXUHlGb6DKOT/tX4ztCXyheGa5hi1+jUVWTQvVHr53VHpKN3CChJbLH4ByXau0M/llP@lists.infradead.org
X-Gm-Message-State: APuU4Z84DAINrXgNJktYGN/TNNa6HNuTRvFlUaZGXLOgC4N3YuYojYZQ
	pKu6zu5NHIG7hqPtyispA2b55Lq/TuHymjOy5bGUg3XPCUJRU3CQu/YE
X-Gm-Gg: AYBFou2bdv80dIIQOmPypfGmP2e8N9blmtA2e5bRVfHLoKnrgz+MQpczRMhR8aN+iRK
	BJ9GEgwJMuxZZoB9CQrgmcCa4i1TIoIiYJ4U09gfWmbW9BFxofk1AdEa+fswNEBEX3YoyfKg0aG
	YaN8Ww2+UW2hKjI+eSvHgdMCQkvuxT4UuDUpsNveSTOOLnv3osdteyVjF0hzaEqfVPiMR9uS80y
	BWxGeaw2L+dmAtItC7BA1/GzU6+B7NNhe/5g8msFn+uWx7lrONPF2U+qwyfYTlWtm4/AZldQJ4u
	H6xcGvMPpAKFGUrGTQML82O3xLgo5ExGX+8snF/dZiF9x+i0KbINJiYB7IElEvVA3+BSfYI1YfF
	paMVxu74PHaBmcXXNgwzkKaPAGMBIECOjnE9heXJIjx1nMyklwhWRn+XlP69emJIr242Ycs3F7x
	t5A2e8K/Xz+fns32FBkm83zkQJYaLIdV5FjumMUEjmvBF7KVtN0YTBDEgrRekTXf2Eo6jOzhAHa
	8Roqmg9Q3S7V6mMlxJrtFGBnaiEeGGPb2DrWfvqDTPZ3qqPzGZnlspM2FNjYBBBUMY/GzClw/zQ
	PN66oK1vuWysp95jmbocgyK0cGZwog5llhK/PKt4cx8uhEaLQDfafdIhc9jKqFnoi3t2Hy/c7ck
	U/fYViTjdIgobrJhqrsP5lNQLKSDXyoBBMN6HlKHdy/ZeqZUYXKHj7v9MaDa5pRW9UStoxsEIP3
	12V+J0eaBYdecqpL0ZAmR6S0dDuNL+eadljCm3mB85FO7O2ELrBzg=
X-Received: by 2002:a05:6820:16a4:b0:71a:d76b:fb39 with SMTP id 006d021491bc7-71ad76c0212mr3490029eaf.2.1794810607608;
        Sun, 15 Nov 2026 22:30:07 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab42c41e9sm7994558eaf.6.2026.11.15.22.30.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:30:07 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 23:29:33 -0700
Subject: [PATCH v5 18/58] mtd: rawnand: atmel: retain chips across
 controller removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-18-cbc49c5c5e74@gmail.com>
References: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
In-Reply-To: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
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
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_063010_683988_7313A12D 
X-CRM114-Status: GOOD (  17.15  )
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


