Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CF3E606A324
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 01:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=r5+dfcE9;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e1xcaNCH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=TzoPIqBa9k2I9QI6NU/CHmPt/04WBehyiDuNsGP1QHg=; b=r5+dfcE9iSLayI
	lDrr1kDJdxRSi8qR4QY15Dtg3v78Hp/CS3F7nD4rbaJ3k4wBFa5mx7jnsp6NcfRoDd4bvHKxBfE5b
	KYRAo9D0yFHoYVNi0fUyulhs/jU3dm8LJoh7IXmTbXJ88S1MApEz8UIi7KiLkZqMeyqWhsgOS+8W1
	KW4lG3dPvXfU4ycnMf3LPpzv+o1H4XEa+zw+SGhvM9qYJbGCCjFEDGI0oX/ihAGbCKvzqg+kHp/l0
	4dSy+/Rg5Pt4GQlE03WsKtFk4nxV3VYmXIdRNLfWboj9oRc+iOfe1qOJ2Lpj6MoOMNq/3dBZjM3yk
	xM+/6oBo+G9+FrYFgaqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJdp-00000008O9r-14rk;
	Thu, 12 Nov 2026 01:30:17 +0000
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJcv-00000008MWK-10P1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 01:29:35 +0000
Received: by mail-ot1-x32c.google.com with SMTP id 46e09a7af769-843b6f8e2c7so3946075a34.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 17:29:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794446960; x=1795051760; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TzoPIqBa9k2I9QI6NU/CHmPt/04WBehyiDuNsGP1QHg=;
        b=e1xcaNCHspvKdAjm3qLU2cajsziGNCPTKsd16jd/qmMxRtDEeX5hYcazHNeeHGbYPX
         LMwajYsLmE7XiMdj3mWJ8NQ/AmhcCBjGG4LXr2x41p7VHnPALZz7ifWtLT64V8dBMoSt
         eiGyhF0M6kH0Q191BXqMQ+qtYBl3ABIYb8lmQ5bglvPH0M0REDz5pe/9hya9ya86o+Jm
         4C/VkXclp7a1Meu2QjX5Mvg8US42s2nkrWLPryDSwqJ4+kHaNgLztosoltlPMP/Mu9Cd
         xB0yQq2rHy9heK9l2OzVX2m1ouzyxybnmDFD7WWCPvEaGkedyOvA1hl11YS2RwD3p4lv
         Qd+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446960; x=1795051760;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TzoPIqBa9k2I9QI6NU/CHmPt/04WBehyiDuNsGP1QHg=;
        b=KiH6QupebqCARKD1xpL0ZkkmC2KE+Z7aTxw8vSMP4HMFtn1RzigGq60WY4fqX7QErI
         /xFlO3O57vgCb62tIZMfwhmwxHk2TqLBvnI6O8wdVlGMLqHfC0OFKWVSzohNsPgpdhnB
         IBGh6DblyuJUEmpUM2OacZk5R7VkXRCHEor0TUkkdo32Q8hTfJ+0fHyfEt4ueq8PZgv+
         0w2o9rWdUw+5+IrDmDvBq9T05ZTOcHhTq1PV0HPtqKZRQgPWMOXFj9jI2sJhhiG39tJy
         9Wdn3CgyDOX57ioid4uhvElwalT2ZpDICPoyrgsDRwwANMUZd/JXGPG/eF1DctsX6e+j
         jWNA==
X-Forwarded-Encrypted: i=1; AL+hErHDt3Y2apzQIu32EppRQXRwxIf43nQDavjH/JezzKt4qVPl46SZprif6Lx9xM9H+r7GwNacpWtX8/V3gKpCSi+r@lists.infradead.org
X-Gm-Message-State: APuU4Z9Jv8wFAgcrzHS4jlQXW7ltvPUUhtg8mwydpuxtiEF5REQlqgD0
	TXUw4JBbOveDA9tkyRwbyKbBgl2ZEPuShjpE2cdO7o/sMtf1PdC2cm4X
X-Gm-Gg: AYBFou09Ma9yq++mS1QohG1nnIIUtSTSrrDCAFZ2UkseF8nw7HWAQ4mc5qWSlkz40Qp
	5H7+LV3ALbL/2pAM1JR5OhX+vmXHxmTOy+1TCEI2ZL5W6siTV0EzTIXp3DK2+VdlBM3tfTTy19O
	xf1H0KBSBOz6DIeTXE9beB2/mucuvHquGcPE1r26Vx+ZSpLxUNJtaCYymkKbbwfSjHIvzXY8QmF
	Q0wGQGs+FeGJQuH+/aon5HuQ/wMQj4Ta3QVoTmrC2E2Ql9rECP+BrPtVMb2HYLlUMbJ+gsAyI1a
	WwawQNUFEanSAb7X6qZghq/CEvS2vO8AAvlJYDi+HVRQ9YCsyYN7d0vh1GaMtaZftPwO+T4Kvcp
	f1qolHetAGNlc6uMKyZgz0gitkS5h0vBPKk8VvwJ6evyMG+r74E9Tuj3KC3pR9qa3cAt25lCKbn
	wz13LTXr/kKICAg4FHBWWZIEj/g6f4OQu5tPCcCVM5Ek0CQuZvqLKtKm23RpTfEf7hk1uNtVaA0
	AFXpeX5DfrKDjeWGAjgPTXzOpGkiQ6hvRDXRHc9VIVzWbmNyORVkRFJI/ok8wm9dxYKRITMrBKa
	A8MMvjym3KcwTQXPw8TVaGwzds/kEzSYyOCC4vmb2bZj0akFBbr8wZDwXwKUBoQoR3b/SzAcD7A
	uulvKBQ2A7NkHPbzLovsmFU5/OkFSQd/CG9QaQhUnjsd/vJw6V87cHisH//OUTZB9Fq4lLuWi+4
	IgUJzljIGt3g0e58i5u05Buv0JwMqed8Q3EqmzoFg34Md/XYFGLaaU
X-Received: by 2002:a05:6808:c123:b0:4f4:b62c:a3d8 with SMTP id 5614622812f47-56b9751ceebmr4316576b6e.33.1794446960103;
        Wed, 11 Nov 2026 17:29:20 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905738049sm6823481b6e.10.2026.11.11.17.29.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:29:19 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 18:28:26 -0700
Subject: [PATCH v3 47/58] mtd: rawnand: lpc32xx_mlc: retain chip state
 across removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-47-ce537999741d@gmail.com>
References: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
In-Reply-To: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 Vladimir Zapolskiy <vz@mleia.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_172921_424067_A8FE8C41 
X-CRM114-Status: GOOD (  15.41  )
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


