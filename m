Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E8A4606A337
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 06:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JrcncAKy;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vz5yYJ0L
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=TzoPIqBa9k2I9QI6NU/CHmPt/04WBehyiDuNsGP1QHg=; b=JrcncAKyadwNFn
	p3szinot0FgdtxdvhJfOaULYOLTRPwskf2H1R2rja1iCVl0VWYqRneMKPJ+uT+T04ANx3t8OmVOWa
	nwK8f4uSI/R4g/RTvh1D5l06WZ/oJ+qd+7fTU0OKuzn48xjW1rxXgKxFxH0I4xKX8NyVsHr7N7n9z
	NG86ymiHjwmRPLDznvspRvxBQOMdCD86rWOw9eQr4U02cz2fgcp7Pp3o8w31i2SUldfm3S5JfNiME
	+nUkSsvX+DdEa1Hllkw/OgWZDJ5lQdYmbyB5d16n0YzHZu025v0JpX7JsOg2F8ncERKSRBlCAFB9g
	lug5n4EuMBcqbeYImJtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqFS-00000001HX7-1SMJ;
	Mon, 16 Nov 2026 06:31:26 +0000
Received: from mail-oo1-f54.google.com ([209.85.161.54])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqEm-00000001GC5-2T79
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 06:30:50 +0000
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-6aa9606ddadso2737872eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 22:30:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794810642; x=1795415442; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TzoPIqBa9k2I9QI6NU/CHmPt/04WBehyiDuNsGP1QHg=;
        b=vz5yYJ0LtwcUjdW2j61qhjSGC3ZrCEWot3ayq9n0krVhSpVmTuOMQ+mm2JtpSBlkxO
         Fl3VBJ0UeEowAF0RzlhIh3mqoOx34nD/Ub27V9MZqDe4r+gtKgRjrIYfNF4L49EM4AiA
         jrU4kT1IrqvT/AJowIs0TOleLd/kxH5F/dsgxgTCZ7Rp/2iSPnvehPYDbMg0xJI795hZ
         zXSzvTxr+VVTPuuk7y3eMZpnl3zeEDL7/JWi4BavKG/NuRFMGiFwtSTwLNg2MnvwFZGO
         BN2x++GQzf93dd1ZdBf8Bbir8W38ZCN10zwmKl6/Kmw2gtjcR9fH/H73I7TSSRrhP6pS
         23vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794810643; x=1795415443;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TzoPIqBa9k2I9QI6NU/CHmPt/04WBehyiDuNsGP1QHg=;
        b=dySOcgQcvWZluR5jyWjDX++KAeXJ+/hlV69YRXIE+ezIg07BcQgYjg9DcVTbuxD4id
         yOqwbOBFwAnVTEMgayVDBy09KSmO4KsOcgRF+9tJQo978dZj+i21iIlJH1r+7Y+oaF2D
         JLu5X9M6ta5xSUxrfNF0cHhT7fR1CCCS+0F1S9zQfpyjQ1MeKW09OzeUkmIz0G1mAL/4
         2nLEfw252xe8yv3XxmGtycuApHFkXmm+9fLgMCm31U6UN2HpsFttCwLIk4sfiX567kGb
         VLSw7pYYLclFRXePkWW3xP+b3hS6DqA2bUnLQ8QUrdr0n6L28ir5EoJh9F3iMO58NEnU
         jZ+Q==
X-Forwarded-Encrypted: i=1; AL+hErFZJ01uMdbAdsohjypEGPCio4sKcqtzOqykJhfEE3BGaD6NqY/thgfl6ycwDmlZiUkMMPnHVdzeV7hQqllBdrO6@lists.infradead.org
X-Gm-Message-State: APuU4Z/9gs6ZPdPJOB9YSOgIRwNnBDz+jv6CWQS4AZTifoHcMx8Z6rYV
	ik2cWLHm/urvtrkyOMWnTrmDnwn2XyYszpIIp/sAy+lwWKk3StNdWGHe
X-Gm-Gg: AYBFou0ZK0Gg9XGgyXsgK8/529ldR9x3Dlw0FBQgHnZ5jS5Z9p0Vk9JDoSaFj4QRuOK
	OmlMnQ0AIXN8YQ+9sMFYAbJqthnb7bmbJs3yochqM4hFoo2EkN+AKlK5zUGWQVj7okKUGIj18Jc
	wpZhdlAk59AW+Njg6UKu9A1VBaZ/bBouvwPmjbze1NyhfVgpC5cQiPUg4bbf2xEoT7RVM1ok6UX
	WJ/j7XHTHOobewCGwoy02ayxlwVKmXDz8E2+oNd84LFEeEzBFAS0ph2sXbmr+8SxN8A+1f695xj
	ui9qnul2D+/ZxOy7siRrAnnRMJQpi3qGT0ZjLYm9FTi5mFshbjwLz/vvC7+SpguTFuJSfSUjfUs
	bRBjr6NZyQle3rHqEDMsDcoqahWoNPKna6LXq4Yvo+w/b+KmEht7/ARwqT1PsXJ8/Erom1v07OY
	p8Pzd5YM0ItlSA9YmrzkZAOZA4YUto6C/T9Gc8775A4a1iGv598fHZ1cMB4L5Jf4rJwiYhjX4F2
	5SuvFMCjtN2p2mRPverbL2ne4a3jgWVU3H1/kuYHVjej8TS6bpEaLOecdTDwqmg99mqMkOzfZEn
	C/DpiLRDKTg/0td8VJvv6v/zzMKQ3iERWr7bpeTowR8wrrAuqzwgAojKU1wZEZw5nC9SGysYXF/
	i6F+MOeAqjE/d1Em0Wxw70WNzY5Z7RvX4Zual+HKLugt6Rf6wvBCiifSg7vuwAF3Ou70LtnqReH
	NHkTrwuYlfZsFGVaTsKYVPDrtcsB6bC18WySSub/urdh702IRYHE8=
X-Received: by 2002:a05:6820:505c:b0:71a:e4a8:bed3 with SMTP id 006d021491bc7-71ae4a8d159mr2908459eaf.77.1794810642654;
        Sun, 15 Nov 2026 22:30:42 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab42c41e9sm7994558eaf.6.2026.11.15.22.30.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:30:42 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 23:30:02 -0700
Subject: [PATCH v5 47/58] mtd: rawnand: lpc32xx_mlc: retain chip state
 across removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-47-cbc49c5c5e74@gmail.com>
References: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
In-Reply-To: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 Vladimir Zapolskiy <vz@mleia.com>
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_223044_753353_7EFEF4B1 
X-CRM114-Status: GOOD (  15.06  )
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

Drain chip operations before releasing interrupts, DMA and controller
resources. Retain the embedded NAND chip and controller until the final
MTD reference releases their metadata.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Cc: linux-arm-kernel@lists.infradead.org
Cc: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Cc: Vladimir Zapolskiy <vz@mleia.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/lpc32xx_mlc.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/lpc32xx_mlc.c b/drivers/mtd/nand/raw/lpc32xx_mlc.c
index 408b2aba2fdd..633d09471760 100644
--- a/drivers/mtd/nand/raw/lpc32xx_mlc.c
+++ b/drivers/mtd/nand/raw/lpc32xx_mlc.c
@@ -687,9 +687,14 @@ static int lpc32xx_nand_probe(struct platform_device *pdev)
 	int res;
 
 	/* Allocate memory for the device structure (and zero it) */
-	host = devm_kzalloc(&pdev->dev, sizeof(*host), GFP_KERNEL);
+	host = kzalloc_obj(*host);
 	if (!host)
 		return -ENOMEM;
+	nand_chip = &host->nand_chip;
+	nand_chip->controller = &nand_chip->legacy.dummy_controller;
+	res = devm_nand_controller_init(&pdev->dev, nand_chip->controller, host);
+	if (res)
+		return res;
 
 	host->pdev = pdev;
 
@@ -794,10 +799,16 @@ static int lpc32xx_nand_probe(struct platform_device *pdev)
 
 	mtd->name = DRV_NAME;
 
-	res = mtd_device_register(mtd, host->ncfg->parts,
-				  host->ncfg->num_parts);
+	res = nand_set_lifetime(nand_chip, NULL);
 	if (res)
 		goto cleanup_nand;
+	res = mtd_device_register(mtd, host->ncfg->parts,
+				  host->ncfg->num_parts);
+	if (res) {
+		nand_disconnect(nand_chip);
+		mtd_put_master(mtd);
+		goto free_irq;
+	}
 
 	return 0;
 
@@ -830,7 +841,7 @@ static void lpc32xx_nand_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 
 	free_irq(host->irq, host);
 	if (use_dma)
@@ -841,6 +852,7 @@ static void lpc32xx_nand_remove(struct platform_device *pdev)
 
 	lpc32xx_wp_enable(host);
 	gpiod_put(host->wp_gpio);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static int lpc32xx_nand_resume(struct platform_device *pdev)

-- 
2.53.0


