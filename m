Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55C6E60A2637
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 06:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rQ3xoG2c;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o9yIlOHv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=d8lqiiQWmFDMr3ziUW0LFQK6YamiVydDqobn4zGIQSY=; b=rQ3xoG2cJPcLfK
	ZU/npNVwVQetXz5WIHXoS9hMNZ6D55HtGmpHfvXtAAcl4ryvQexAiwtWUo9r3yGAlTaJKCpysjxSI
	NX8NQY6/b/2qxgS1SSML8/fKtDnlQ1N3M8Eghskf6SY8L1wz3bK7Px7voDfjOJgbxem/UD6dYkiSR
	hSR4aQE86N9x2CZ4kIR7lpin1T9RXN+4K9Rq9xRPg3iROp9ZmD97DawrWv9zhhrRPqgqost6QHPDu
	bKKIYNEZE4BOnN5A5+FyRQsyeruAZEB7/mWQsNxbYoD5ET2Nr/btWBmQtE3nNVta6k015lFMBP4oN
	xOOkZ/07+JIj5Q7xA97g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqED-00000001FCh-19IF;
	Mon, 16 Nov 2026 06:30:09 +0000
Received: from mail-oo1-xc29.google.com ([2607:f8b0:4864:20::c29])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqE1-00000001EnS-4ACW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 06:30:01 +0000
Received: by mail-oo1-xc29.google.com with SMTP id 006d021491bc7-71ab5e64742so2622257eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 22:29:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794810597; x=1795415397; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d8lqiiQWmFDMr3ziUW0LFQK6YamiVydDqobn4zGIQSY=;
        b=o9yIlOHv9AqSK6NUrfr2IJy67BC6po2KfvmxNcrz0J+41aI4YhTbSLadNoWAZFSJEk
         nOsm/9V+cT7n8S10cmCCzTjqES2Ebsa0RZI/Rxqk94wbmn58Ls+l1asV0fmD+HGnTim0
         lW3OCw2eccmLMwUk96qVSizVz/eeliulNd9h4HYGa626HwLFqAxlZ2Fjus80O+LAE5XG
         ozj3h6uNLw3/hEHrSz/DM9qFQXadh0km8OjZitO0pVVVEta23d1Vq7G0sVYCZgomeXIf
         OuIpD76aZI20aGDgDHVYoqQcxR3CnWa12c+wQ91r5iOa0+nQsOwbJEXJkwNggObgSbNq
         CpDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794810597; x=1795415397;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d8lqiiQWmFDMr3ziUW0LFQK6YamiVydDqobn4zGIQSY=;
        b=YgEfF2QQbnp7nmN+OZEIHds3YvD+7nak2wHDmNGOaxB9HqMUk75lZxUOVi/Qxws4K7
         nxy4V7ukkOtTvmWqNDFuzimUcQRZk96Ix80/p70QZ3FdAJFnY0ZXhgOfJqcWWoFXp7v5
         JbL3JDEFVms4uJ987sXcvMiVJmf9sHxXReDrvBR+vSOSmpkk66KhqMuMf5bTj4vUx5Sd
         E8EnPTmD46f3bLonehB/BdZQcXISvwA/zzp3t/Dz9en1DfVSKgCUDbRTqwU9V+0kHoZR
         RMqtOiQCBmv1tO26F7eGhNF21jqeiNKPDeHQmyQtHsWWb4BuJwzb8QpRZx9VWumrwVvb
         cGkA==
X-Forwarded-Encrypted: i=1; AL+hErFtPmqritjwaBKCCgzGOgXqbncEerY3F1eut83frM8zO49DVmMd/SRBFtDLJsLN5M10zbU/r9pe1KiQAjcXyC35@lists.infradead.org
X-Gm-Message-State: APuU4Z/CpyV23KY4I/49qHIVo/qj72PO5ke+113z9C4DnLsy2TYTrREF
	l0awdu4P7DfSqbQKOwLZFJ2UQcFbmcGk53Yjj92AYMDovZrUlsBoNNVx
X-Gm-Gg: AYBFou3iycsiBq4WBqwr7AYyubVLXS+nRCNVB7u/PrdmbYglyx6UgcRYY7HGMCQkg6j
	sVpIdVzbo0DW2pndibO+JiEVBmReIRh3xXNo3hHP7Jdy+20J4MYkj531fu58IRRf8/6Gq+BzrMI
	AUbgGuG93UjbPZHvMPjOLhvhvxvSB8Tr9gdLpM+EZHGRO1FBAzuAQQXSwfD+Q0gOS9PdEqC+R1m
	EKD8GolTOELypiv/EJKpzGkG3mvluTiiG01PXqV5A36NPedLt3oA15+I9vPVxHtNDDZXDAOs6cV
	rO2Y9ELS7qNmN+1Ug3lLjeJG2r0ugpWYi2okMvoufz8H/y72NmG5JUnsbvYdYctsoXIkdlq1+ss
	guTtuQH8JEL87qiUFwp1C45QaegmsX2fkb6+umJWdH+G3UxrFEzI585621ccaE2cLSW1dI3Zh6L
	lbDF13FS1epiT9E5OHQAi7q1oNMbprBKSzuef1bJ+GtRXTkIi/3NJqEk+ST6ORgp6v9OObhJXla
	9FMI517/4d+Khz0s4yvj4TWz9hqw5aZ1VVlBRE7RpURYnrCT0d7NVdIg9rc0c9fsMTXI05LUWeM
	mRzStnrziQ9ZM8zkLfzfZM6bOHo9cdxnYnoyd3yb99rKhlqAdRi9MW2vfWQtC1b10Pc7eVd5pVJ
	JiMLR+NjhbqxHS/32r9Vfm2guzD+LIRJrvWUuGsYa8bMGOZ5V0fq6BuLSOwxtL+PdfrpIRJMvlN
	+1qp398Xy30u4Tp4lts2sFBkgHpolwt6Me5CT/3bnNZe4HrHXPO36e9VftVIqBiFieNyjPalaf
X-Received: by 2002:a05:6820:a287:20b0:6cd:3ffc:e336 with SMTP id 006d021491bc7-71ab51d7135mr4392333eaf.84.1794810597121;
        Sun, 15 Nov 2026 22:29:57 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab42c41e9sm7994558eaf.6.2026.11.15.22.29.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:29:56 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 23:29:25 -0700
Subject: [PATCH v5 10/58] mtd: rawnand: stm32_fmc2: retain open-handle
 state on removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-10-cbc49c5c5e74@gmail.com>
References: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
In-Reply-To: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
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
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_222958_053339_4BC36205 
X-CRM114-Status: GOOD (  15.15  )
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


