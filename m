Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D5436073FDE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 01:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZBc4Im4l;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eBkNMRPQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=dp0wbdBRn/fRaDPrI/jgYSie3bI1euecSYoHfiE/X9s=; b=ZBc4Im4lLBKoFy
	M9Y4IlpdintUHTlour648hUA4Wk7lrOnFEAfcI00tJpVOymLmTWOHujeoN3VPEQ0n07mtzFpzc0mw
	m4wHBCheTEhfomxOt5cmu5EfYDPqHB7BadzF10CISsp8faLBGJCgMe04iLjenVAesV7php0vrfYT0
	qFC+GzKKKgLiX+0ywutoQEAJehGAVMsmugQB1Gur1G2PiiKi91NIWbsxbjgc/80kURZdPNRtXoxYJ
	knbQ1GQyFVxg7UhApdS5iT6UeWCgRctZW8w34A8cjS/ll148PVR90ioFN5lx0TY88TGNmyn0h5ucx
	7BoTZ7OMAwfRO83S0VHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJcx-00000008McC-1OVw;
	Thu, 12 Nov 2026 01:29:24 +0000
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJcU-00000008LgR-47Rx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 01:29:06 +0000
Received: by mail-oi1-x22b.google.com with SMTP id 5614622812f47-4b28d9537bcso295979b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 17:28:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794446934; x=1795051734; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dp0wbdBRn/fRaDPrI/jgYSie3bI1euecSYoHfiE/X9s=;
        b=eBkNMRPQdVG0M3wbGFuWlsFABe964mQko6j0K2bkeg81riJPrRCtuDN+AMlGhaHqpO
         B8XH196lV2PTFt53htXUA3M+cgYb442c9rEM8GD+2dRgqX64qbRsoPQr+9VF/KMcW/Fe
         loYGSUJ06mm97Ud8w7Q7HW+OpJnTwa1www/I88ScB0T1NBRsszSFCnmwNxiRrW1W3Pxe
         osyTSXF/KVHeG1soBUxF36IIItrzhnrN0/sjJjObAlHbGX/z++wYmPgVcI+EsUsaubB8
         FCHQm1ktBkeBC32l6up0WcVsj9JcqdoW/d3V5lmNwg/gfw14AA58Kis/RbqgZmHytEW/
         GEwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446934; x=1795051734;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dp0wbdBRn/fRaDPrI/jgYSie3bI1euecSYoHfiE/X9s=;
        b=lo1/DRAtTilhK6snceVKmQ1ETmef3T8y6m41gqO34p7N0aPeBEwAaQ+NJBfJjtyxgo
         1JM5SOMBTD/BNQtvrqOpzjcmb67oZx4EKJwHp+Jy/MnSod+U0V6WNs2i9AFmG9NhAsl0
         YaPVstNP8BTgmhtkiEjdiBxLu8E7q7A8e+g7MJ4BSjPpL/F5OnBAfAeWoQOJ2TTNX5qe
         +eHn9nPe3RI3/WIpF+jzUV9iwg88Phl9JnRe+11HPseujpzxqPOArmk6m7QME+hO2Vi6
         vQgcw+mAQNNM5uPltdtFjjV1t2bNEcKdxjuPgUEcqBg8KMahBtk/Qh5zNkfcZuR20eLj
         QLdw==
X-Forwarded-Encrypted: i=1; AL+hErH3NcdktGzzWUV4bB2160AtrQib0xiyt/325bukepAZGLi1mDc5TNeXfQOg7QLQvRQbcPfaEsoD7ohA8/BwqSpa@lists.infradead.org
X-Gm-Message-State: APuU4Z9CBhfAdY3H00fOTthls+lJ/KIJw+c8yMWJMd3o25kdaqsBuz6m
	OiL5FPpRTI8GQbgm5wwI8D4+MGidxtXQSPJb9kCOgNjlcKVTexbtQZUc
X-Gm-Gg: AYBFou2IW17Ox9QiRGkehFsog84ioLmIjWgL6iT78/fIr2qb5LWDKstU1SxCRPcRbtK
	w3z9GJ0+TSLD8MwZIM541BuCQ1jhtr7kctPms/bxAfeW3ZbyMg8cwdsB/GEgDQTld+jgSEG92UG
	nZgz799Mx31Vwhli8FLL2RrzdlRzpe8WE6T3ins15url1nkGsZ4xJY4aZD1nlXEPcA96lhcft+F
	73FbGkldK//PfyCuDWdxtm2lOJyznUAcLdXhcXtPuBn2xRhOGw0aOxtPyRJw/2iuprHSZa+qzyi
	e4HKn/2m8ZxZ2cMS/0b6TXZJaGdMtP5wE3El7bqKttwuDM7J6FnhMwJTQ8yUT+S85OCCfO+pFK8
	2SoetMLmn7XPhik3ffbMtijmuB5k8YUJyqVTs2cEOyUETD9doGXdeN2obKMg3wMtTiBcbgczev4
	M3abL3ir/z4SvqPg4TaW4OXFxKKwkr9JxzQ1N5VAFVtBN0VmW0tBZqpYwOtFgmPE/0pyvn550ja
	Uvnw2gbuatxU176LwuPKdFtaGq7cj4Yd8RpteMWUj03QG/RqREDzqP0gmB/589eQxxiaRyTShc0
	tAuXnnEMvZN1r16PFP88Pvqp7dRbZCfamXO2nU3/X/jUjteEnEttHJ3TwoEq2ZX7JqBf6BkNaTU
	ZdWVeTOsZhhiUSAjDr/W05MacJJr2Jp2/UGqtTRw78DchGsuaL5olRCBFhiww0IhY0hiZMtTBGR
	+R0tzANfmq/uqI1Ho48wvUsKrukTLJy3wiwnYGqdOC0gSFXkbWCplp
X-Received: by 2002:a05:6808:bd1:b0:50d:26fc:e6d3 with SMTP id 5614622812f47-56cd8dd564bmr1052007b6e.43.1794446928946;
        Wed, 11 Nov 2026 17:28:48 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905738049sm6823481b6e.10.2026.11.11.17.28.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:28:48 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 18:27:57 -0700
Subject: [PATCH v3 18/58] mtd: rawnand: atmel: retain chips across
 controller removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-18-ce537999741d@gmail.com>
References: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
In-Reply-To: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
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
X-CRM114-CacheID: sfid-20261111_172855_159737_B3F764F2 
X-CRM114-Status: GOOD (  17.81  )
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


