Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F05606A881
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 18:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=izvLtvKP;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qptZrROM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=TzoPIqBa9k2I9QI6NU/CHmPt/04WBehyiDuNsGP1QHg=; b=izvLtvKPouo/Mk
	fFVVOUy9L8UsotVKuE1WsYrQ9tph2r/DBGjetbxBv3gopQSYX7KOr8vp6dhM1fJXXDFAw7z8wD988
	CQZtkQlXoNqHdEwaSx4Ru0tCi3+wlM4OQ/V61oLalJz55dTRm1c8eqbxLODMGx8b6aqI+gfA0HMEj
	L+j+qGpAmnL4gHkWjE3BsgaFE7eEPZ+ptoNk3nbCW04aR0QwbaMmBnCVouM8aM1VSKr+AVj+Jvrcm
	gPUr7wGYWWvA/B3KW3+ZVq7+wi5nRsoKjQnHZq2l7HixsQ3Bo59m7JAR81DzXuygD5ozmNXOV9JuA
	9gUFQVzGxjV7ihi7CecA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvpk-0000000DtZ1-3gYx;
	Fri, 13 Nov 2026 18:17:08 +0000
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvpA-0000000DsOw-21tS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 18:16:33 +0000
Received: by mail-ot1-x32e.google.com with SMTP id 46e09a7af769-8628b63dd60so390396a34.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 10:16:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794593791; x=1795198591; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TzoPIqBa9k2I9QI6NU/CHmPt/04WBehyiDuNsGP1QHg=;
        b=qptZrROMW4J66j3hVg5+1gsP1Va47Y6YXIl53xlypFKYcztnmBn5WQQqm34T5MUO/u
         +6xYtUuL56LJOQ7OyzEBlB4nr9pIDCcuxw3x8pddglNl2ywpAGPmlwymyYGUtBIxT8ON
         ETSIn+c6GurkkCHFoZnaVEVEHRhg7WULwnrxXJGWcpaAj/XY4EPz2ME3tHbGv/+7Ioyn
         5hO7/HcHgXTUCwH1Jo0LysTqoPshyTIBRMYPp1nntQ1Ae8Q78YWQbc5sT5jgQUh4IAcr
         66TUkNawL59CPZx6f5tESakqBehOz9nSVXDPVU4yrwt0GYQOG+C2Hu/ASAPHJvHaB0J9
         2drg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794593791; x=1795198591;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TzoPIqBa9k2I9QI6NU/CHmPt/04WBehyiDuNsGP1QHg=;
        b=Pe4TABtYlkTxM1UElKsY8L7nv0cUlEjlsxuSqJYBQyBKdZvdoilhcraZXHp1og+M60
         zZEdP1+P6XSs5vfxz/AieR4LJgi2Mf1dD+XeNbcop0bYiEQXwsgwPOBRg0vwP0UyW3Sq
         sauYpkKsQf+cggynR0WsjI2Axo7mzIpcTeK06LL9blzvcyRD0ERCNJvIUDoP0tX+eowx
         IUjBfA3Xl4DnZfP4+halm/sYKI9in8VdGRg0n2rFMcKGN3nAM2rVBr7xLtHIXED6mwKj
         e8/AGzSmQNrTKq1oLSKfZ0ydlW0SKZbLIoqgkkCFYRmAL1Q9bf69zTP7h5g3JeyTXKRk
         jeqw==
X-Forwarded-Encrypted: i=1; AL+hErEx0lkNRkxmMPKge1TPO1tx+ssTCdPjxJ9NNyxErnVMJHmcExekhqBSphPqPEf0aXJ2bHrmrDCaFeQyDopqpwD0@lists.infradead.org
X-Gm-Message-State: APuU4Z/SSTomknbZXLrbylTPxz2AdFYZoX+Fov9qoklYHPH6ReEAjZSM
	dODEPmCTI/edt0DUMqivw+kMQmiUpCAIuQEADhJ/8sGFjmOY++uN7MKu
X-Gm-Gg: AYBFou1GIEz2OsQn9Q9P8C2eY5VOv1vS6WP3zBmYggSevJfwYrKHkXHo1ycMW//w+UA
	hEn1odT2JxBXKfrBUADdSwJ8fNc9Bi1U6eMyw7Uv9Q3rOjsiX1YN7Z29Qanks155dTc7471DyBr
	kDIF93I5Y0VBU7pkiBUwe721EdXXgSfbGUCtwahLIazrLsCnm2XLnVFLvZizQMor1uJ9PPVuGAV
	6rUGAwX91FYMUFelJHgHKHwGcm1GO0M4RyQTsmEbToWgs1owMM9+s9CDw2hVgav1gNZcjGHHoN0
	UQdMIgBXTEmQZ+Ki0q3zaSyqtWQPuiyOGFvNY7KQUXNzUDdINPxuJzIM9ELCnBAT3Tt2ZysUQMn
	Py8L87Ol8lXU4h7K/RRhfJJOKtVHUYel4AlK9+YhGv+W4/z0fliBjy4QzkZElM0T1rIuro2vnQU
	ZPOgWd65gScrIT29f9izZKW5gWufHHXCIN9aA/HCFmOGLaJuJVFBpAVyjEtLmlP4OrYB51LfAnW
	ZlzGo2FAs8V7pK6V0I/VxjpWo74TDRsjl0o17hfjfSkb4S3pZ9V00X5RpGGbHtAeRCzRs59OTX0
	mCsIfqobo71FTPBJLdahxLiH7pQ3l+AH7aMIfC2PqLg0ptk4hVti4o3MgIKwU1LuWNdB69h1jYd
	5hiwnojeWr03uVoa1iLCRWgOh1GYfgI/BO6SJX65H3YmHlMv+Z3NN9qg4NUdJq5COBxOpuFpPJz
	igeEaTHnoUr6COcYsWrKIHAkb4Tp/qoa7iYpjKeSJCtJzRlNSFYL8=
X-Received: by 2002:a05:6830:640e:b0:861:5b84:4fab with SMTP id 46e09a7af769-862899619c8mr3027224a34.27.1794593791193;
        Fri, 13 Nov 2026 10:16:31 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8628817d979sm3253414a34.22.2026.11.13.10.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:16:29 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 11:15:03 -0700
Subject: [PATCH v4 47/58] mtd: rawnand: lpc32xx_mlc: retain chip state
 across removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-47-556b1d7c6221@gmail.com>
References: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
In-Reply-To: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
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
X-CRM114-CacheID: sfid-20261113_101632_639648_1050C4E4 
X-CRM114-Status: GOOD (  15.17  )
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


