Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62BE6606C19E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 01:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PQFhwdUR;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aT7++EO9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=d8lqiiQWmFDMr3ziUW0LFQK6YamiVydDqobn4zGIQSY=; b=PQFhwdUR6eyU37
	zGPK8s75KMLYA00cbf6GoWRzSMg9M1bqOG+Xlhk6+s7NSOIR3QRQ1u0SEsiswoZoJ/qyCdyG51lX9
	eAc4tYrNdP6YgH1JZLaQRn6jsaqXS7ocQ6F8YSqGSh0UTKcxVtiv/HJitCPIkAiDc0uLhq0Y84oyO
	Bsbv0BaEUz9tGCYsZangu/eo2NQDUOnjEllNPmOOTSX/t/R20/jv/5d7GtYSHy95IcfomdZQKJHre
	5fSc2vKbo7cMbXTjWKHwHrh0Ne9aDkHOrZZhdRYibUO22/dXmizcQ3PO5Vj0RaVPEyRjdshv+666m
	NWzbbotTinfudcP9XKOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJcV-00000008Lje-1qdU;
	Thu, 12 Nov 2026 01:28:55 +0000
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJcL-00000008LMz-1Vdk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 01:28:49 +0000
Received: by mail-oi1-x230.google.com with SMTP id 5614622812f47-4d198f1a591so2460818b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 17:28:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794446924; x=1795051724; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d8lqiiQWmFDMr3ziUW0LFQK6YamiVydDqobn4zGIQSY=;
        b=aT7++EO9NPHlL1St/DUsq4IY7N0NcwgMXRmR7qN8vbO7RfkqDtTiRYJly/hpVHFl7i
         XRBUWtZzvLcXpo7w7pVOVnWqVeN8GXoCnGO7Q6lV1Q2QSjt/djWzqR9HseipcxOfVmNV
         yDnn3qkiFKTHEzTbbIzcwl+spLfq3XfhnKg7NnyRoab8ED/wIuO4mrqM7hhrX19IszYw
         7CJGrH8iS16DMXbqw49GtgD/sp4ex+F+xF/KJXIga2tTiLJTUyX5ma5/6zjtHZ2blYTF
         aRY52cGBKCzvnHKuPPHu3XayowEwL1UFXfFaICCa6gt7K0d5pGJXUKnbmE6KJUSDEyQ6
         ecXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446924; x=1795051724;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d8lqiiQWmFDMr3ziUW0LFQK6YamiVydDqobn4zGIQSY=;
        b=pCWPlOh1pJfjrvzZr3D4svPnd94mmaRqqLlQpZfWhjQZG942cIkvRyEZ4DcZLGLHEt
         f2zCUGR2+5Mh461H3QrsfjnMYFMFQACyJG7Lp5PhYH3N0KOhUuIhvISgysjGTag3ogTM
         KSZEMz1bOWd1fyOn2YHMPTJhg2hn63scx0D3hsKsLAKam//j1hFHxoNEIzAeHOKrT0B/
         9+VJU/WXZR+M2fs3t/hEwxR3jzUXgTH1qyTvw2HsbJnTIftQjWqGh0M/GiRNvH+0ik3P
         Qq+RvXGTN1gc3N6+cFhQPxQiCJHEU48EKwzeDJFroa1TuzmeF8hjVsFlvxECVaeq30nU
         XNxw==
X-Forwarded-Encrypted: i=1; AL+hErEZBGrq1OCxADJNt+T9hhim8pl53T9V3tOU5qnw5qdXwhtzUGSblC1NtBBzbOCrcrDBDfEJx0Aty5LfJomuEYOv@lists.infradead.org
X-Gm-Message-State: APuU4Z/GGg1YZLLrVqMLXTjk7CDChuP9TW6qZMdmvFCZnPj8Cx1iJqMc
	alGGEh11hJUG/hj1XZA+qoWxrn3bbDEk6X+jX68VFhfVZ0+2VT5c/A0I
X-Gm-Gg: AYBFou1/UcqZLKK9cC7i8Rym3fd7N93l7Fkin6dLm3/rqodpqf7pFeKTyzPsUznmeMd
	1o0SxR0WdtyD8ehcleGiJstglzwL8eKnXbkHSOU9c+HiYn2mGsIGXwLJFDhvoC6zOSR6BQ31hPB
	So8h/k+QQL98o+W8Ipx42VeImKfx9C3FQ/LdYSHxv3w0IQn7Ps702cue0qNO2uvcPO0Q1/Lrdvi
	25mYse8+cnlP2blZFXwTfO6NR+oOZPD0M43WjOt/usq9V5K7FhtxU14osw62nwm5T6FXjAOnxgV
	3BOf1yGw62z7j0PLK546PlOYqrZajsosOUqMxMlaA7R6RMdbTcYeWD/uNRxyZmJdLGqYay9z7iW
	3EEdv62DX/r8qPMpKjn7JUfrrxjmc2X+eMl/GpD1AMhYXymejVCh9xjOFTgIPNrz+3BaRO/imcf
	jHkex0WbNfyltQfksYkFDPBWxtVgUCfDO45cSXkQRQ443hYcuKBXiDPt9CCsEqAu1LeBvpJS+3n
	avuMdkeQvn9X1Qozg317U9quAn4yU50RmEr9Wp4WlDwbdhSn69i4g4GVq8pBEugVGrbYh0p840D
	9FPFqqg7acE42fg3PoGIFkGv0JBcTO16Tfx9suf5fWh3/8Jk3iteM2KZROa8V/PJD2tyQGKpiSY
	Dw2RpiZVClelcABRCm9WbJs0eH3fGsZzI5N5f4ds81L7jte5olXM5e3SqmNQ1i216GnUZ2S8PeG
	RXfkVBbdXXfcSACI5kWA2g8G6lyTbKOkvyp4jizmXEXH+gH3qceVH9
X-Received: by 2002:a05:6808:198f:b0:4ea:18f:64b0 with SMTP id 5614622812f47-56b98c1b3e4mr4154573b6e.67.1794446919315;
        Wed, 11 Nov 2026 17:28:39 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905738049sm6823481b6e.10.2026.11.11.17.28.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:28:38 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 18:27:49 -0700
Subject: [PATCH v3 10/58] mtd: rawnand: stm32_fmc2: retain open-handle
 state on removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-10-ce537999741d@gmail.com>
References: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
In-Reply-To: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Christophe Kerello <christophe.kerello@st.com>, 
 linux-arm-kernel@lists.infradead.org, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_172845_408193_04860E12 
X-CRM114-Status: GOOD (  15.50  )
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

Keep the embedded NAND chip and controller serialization state alive for
MTD references that survive unbind. Disconnect operations before
releasing DMA channels and scatterlists and asserting write protection;
run NAND cleanup during disconnection and retain the core-owned layout
and controller storage until the final reference.

Preserve immediate cleanup before publication and use the retained
lifetime after MTD registration has been attempted.

Fixes: 2cd457f328c1 ("mtd: rawnand: stm32_fmc2: add STM32 FMC2 NAND flash controller driver")
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Boris Brezillon <bbrezillon@kernel.org>
Cc: Christophe Kerello <christophe.kerello@st.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/stm32_fmc2_nand.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/stm32_fmc2_nand.c b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
index 78af58d87960..2b8c0b467f7b 100644
--- a/drivers/mtd/nand/raw/stm32_fmc2_nand.c
+++ b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
@@ -1915,12 +1915,14 @@ static int stm32_fmc2_nfc_probe(struct platform_device *pdev)
 	int chip_cs, mem_region, ret, irq;
 	int start_region = 0;
 
-	nfc = devm_kzalloc(dev, sizeof(*nfc), GFP_KERNEL);
+	nfc = kzalloc_obj(*nfc);
 	if (!nfc)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(dev, &nfc->base, nfc);
+	if (ret)
+		return ret;
 
 	nfc->dev = dev;
-	nand_controller_init(&nfc->base);
 	nfc->base.ops = &stm32_fmc2_nfc_controller_ops;
 
 	nfc->data = of_device_get_match_data(dev);
@@ -2024,9 +2026,15 @@ static int stm32_fmc2_nfc_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_wp_enable;
 
-	ret = mtd_device_register(mtd, NULL, 0);
+	ret = nand_set_lifetime(chip, NULL);
 	if (ret)
 		goto err_nand_cleanup;
+	ret = mtd_device_register(mtd, NULL, 0);
+	if (ret) {
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
+		goto err_wp_enable;
+	}
 
 	platform_set_drvdata(pdev, nfc);
 
@@ -2061,7 +2069,7 @@ static void stm32_fmc2_nfc_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 
 	if (nfc->dma_ecc_ch)
 		dma_release_channel(nfc->dma_ecc_ch);
@@ -2074,6 +2082,7 @@ static void stm32_fmc2_nfc_remove(struct platform_device *pdev)
 	sg_free_table(&nfc->dma_ecc_sg);
 
 	stm32_fmc2_nfc_wp_enable(nand);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static int stm32_fmc2_nfc_suspend(struct device *dev)

-- 
2.53.0


