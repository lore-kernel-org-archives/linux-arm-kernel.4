Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7724E60A6F65
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 18:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nL+bY+YO;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SKRJmqkv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=d8lqiiQWmFDMr3ziUW0LFQK6YamiVydDqobn4zGIQSY=; b=nL+bY+YOG22yy0
	K4r8sD9fZTWsCsAKBzl7z6O3e0FIZSULH6fIf+jNKgEA44XI9/tsEGToOsVSefTbfX8MsntrUNXzj
	Qb5rHdnahn5oG6CKskak0CIKrLN1SFMThfI7+XG71wT/OBoObiWX+G+JsJ1b6NE7cBGiLghhgu5WS
	ZeW7B+qvqg0ZN3uJNAOvOgvPESdpknBZmZmbqhHfX84RbYao7mDk/F0r13RhqplN8alP/oVbMNxGr
	hTSg2I81cIdhlwwGcVZrUuumitw6fwEFxqDlH26SDv5ZEM+H4objpLMZA8/WQnrXQSTiBg8II9RoZ
	ww5Y7pA0w3HA2mJy4Mog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvoM-0000000Dr0K-0TR4;
	Fri, 13 Nov 2026 18:15:42 +0000
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvo8-0000000DqeO-07ok
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 18:15:31 +0000
Received: by mail-ot1-x335.google.com with SMTP id 46e09a7af769-8470d7d430fso524846a34.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 10:15:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794593727; x=1795198527; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d8lqiiQWmFDMr3ziUW0LFQK6YamiVydDqobn4zGIQSY=;
        b=SKRJmqkvON4oqF7iISIyY82W4L+7y2C9OBtcSHWKfa9ee8AYuBc64oNlE1sEwxSYGp
         sYXhopcTr6ebPXYV2C9PPBbN4RiyTgB2FgtoyZtQVDPFjafANBw0N5wQzEy7rD77Qre3
         pt1TbdI+GvlgSmjcOeXRE07rUIO83eLKufjTCCwIGhFdB5u4b+YymbpcjRGNnQy7wDyi
         6Oc0exWOgWEbdTBdJDzNNKLjS4PR7K4eSIAFW8YegoiNm0omOcixsM5d7+si5hJQhh4P
         TlaoLg6fwONfkur6X/O2zYPC2YvEtn7/c90Pf5y8UC1BqxLAsVVnlzWDQKCk5dajTVKB
         IPgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794593727; x=1795198527;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d8lqiiQWmFDMr3ziUW0LFQK6YamiVydDqobn4zGIQSY=;
        b=k0tT+OXk160jRD02VSVS+PsJz6TOBn1DvYaKcXriBgLkZ+A1EMdeUWzO3rZKvS4Y7F
         2i3Twzm2R9TLNiE41w9je3NS09PO2/CWnn51lwsn2U/TqSqgysCnipgtCBvqw4rH8xUC
         KSxTiSBgFPk5jsXu+86lIuTW7jNvz66l3CFip61gsozdAr8hyQr/ik8mIM/MxQ0F+MGZ
         Cp2tR80ngdODfhleP96/VOm8HIVmxY/nRb3kvkLe/IF1yd7rY6h+ss0a4sXgJHPH91Xs
         k7RzgrVMWQHhLLVFrdiy75Fe3lDorfYK1rkdQvAZuQPM0anuAUmVOclamgqs/DbBE8/x
         tDtg==
X-Forwarded-Encrypted: i=1; AL+hErFlhEugyGCVGXPtIsKDPYe+BUwrjzWYIsJNDLGl2onZEqdL5yL1e3zti1PI6Sz2oKl3s+j3r/9aM3vQ4dRiwa2u@lists.infradead.org
X-Gm-Message-State: APuU4Z9m9AJShcEel/xl2tkRmR28WQR99MeiTpnRCO6LJl5AYxyAEfnM
	5mZF6w1Q8bIjmdiAaFtDUSM/N0JmJ7QUUqZofzmSHOI0r4LMqHnASf24
X-Gm-Gg: AYBFou0O44PUnJrwU42kxpYeVbWsA1eB8Yo8fY8YmuQ6LbkgXUIi8ik1brnBDNfgd2m
	eiOYDqPFvFMHSHTx5R9SvHawTTB6fOtsykWWaK539Oyg5GrPyQwyrI/TUDslvTRu6iTtL2W5SIp
	2VA9wddnzuG7EHPSVlGJKH9cXYLXRNMXbcMUGXoUqWewlygDw59elTpNklx0wNK7E1Mt/o4L94N
	oTLIPd4eHrdAhA/BnaTM5kWhuGMXMBrkZeUUJ7ih663JIZRT5M4Mw2WHzvLzr2TrVcBrHOcmwJm
	j/ewZB5a+dpRM9Q4fYznOQgui46aaEqDDVHN37Ezoo6E9FMqY/0INFbSLi851L4lO3p1gm219Br
	qwybyYzRsljPDfL9rLnnMQGtQq2SXNrOCRmP2shatBxB6A/keAO/WORyK4x1kXvtsuRwOmbgJJq
	Hg/u46bUhaXyXcDvcQlRkrNjuXHiVqfkTzW8rLQdm3/RQAPoutxGD4CM5otFn3/NjUeNIseCsKv
	aEdZRUSXr6kslR89NmOS2dQ7GykWQpVpjAPc6C0gPrFR/zX8fMLiwWCn7cU8JIxZ/U1F+lDIpK8
	qUqC1gpZu9Rx3siI2gVPth8ehgUfRffj+4rNCP/NGrerG5AHtoBfgKQIShKetwIS5+Td8kruAvT
	geOyewEBgCco2x6WQxOBmrjV7PyGHN9er90Pua1UUbL5U7Mv2HapqrVasjAhjoRj0vPg6LOhMFg
	uU4VOf7bLSSoa7sSsljIhV0OypDUZsK8rRn50bJcx/6F+yiyhtm7k=
X-Received: by 2002:a05:6830:924:b0:7dc:c7aa:22c7 with SMTP id 46e09a7af769-862895381c3mr3936909a34.0.1794593727221;
        Fri, 13 Nov 2026 10:15:27 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8628817d979sm3253414a34.22.2026.11.13.10.15.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:15:24 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 11:14:26 -0700
Subject: [PATCH v4 10/58] mtd: rawnand: stm32_fmc2: retain open-handle
 state on removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-10-556b1d7c6221@gmail.com>
References: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
In-Reply-To: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
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
X-CRM114-CacheID: sfid-20261113_101528_697646_D17CD6E9 
X-CRM114-Status: GOOD (  15.25  )
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


