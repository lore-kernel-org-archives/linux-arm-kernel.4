Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F95606A321
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 19:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=j2tzlyaw;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r0jTCy/m
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=/q8f729eKxMWvV8pzxhn9Gn25ubKt4vbGrfRah8m1Uk=; b=j2tzlyawZpQH5o
	z5+quAKMzb0Ks3YPRdTzX8Q2On/fm8EI3ekEeIGMH8ZsWMHKZUA5wkM88/DaU0UWsn+AnneKFOEjd
	6eyEyskw1ekZFkCylhJ7QQdY7lJS6xBCU2+t/dNdFB2arwSMG6mLtFEUK5X87ckP7JMhTdBuujF3k
	zRAzm0A3QdaO0cCYrzgijJrRT5mPrmBxz2mvytEXAH+c0VlXL3l4YPqqFCKdURoPwhAeAGVf7Q/d1
	5ioJIWL72ycQXclwVkafWgQ3jeDLspol2n1nI0KWPUBY+Gp0uwX1kaeA5W7PA1DTW1kOsgXF2p/kV
	bBt7fgMBfeubXdFBUjmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWeES-0000000EB6h-2HMr;
	Thu, 26 Nov 2026 18:30:09 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWeEC-0000000EB1R-1UKA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 18:29:53 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-4a9be758734so4654791f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 10:29:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795717790; x=1796322590; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/q8f729eKxMWvV8pzxhn9Gn25ubKt4vbGrfRah8m1Uk=;
        b=r0jTCy/mD/sbPWHqq1pFBc5q1/vZnaG4/DWlfJIVEQKiA8bA/8CUDeo3CSzGRby3vT
         LlHl04KdYGLTDfsKeO5kzP+S12EXp35C9bRGp+w5IMDnW1+dbsdXLHeYZn/R0xf4V3iN
         r2Dp0b+C1A8DUyQn352nB9+0NArCgnuEoSEeWAoMMFI1wg1cePNMdYOh7ByfRa3VMh0w
         9p+Xh9xzQV8IyrXgrOfkkUeqi7ukdODJ8bqsQooL+kM4306NPcrF9uIzsRNPhhwxDSX8
         YarEu6GDhrnfJuh1xTdU89TM0wN2Sk3gixDW6O1RLOtn+ZTT39DIBe4KcnssNABnlZ+/
         t67g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795717790; x=1796322590;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/q8f729eKxMWvV8pzxhn9Gn25ubKt4vbGrfRah8m1Uk=;
        b=fbXEjvWZNIcQh3Yqzk57UywLSA3HDNSddQyW4EklD0uFmRhWKbFqsEVWLZUl9p2pQV
         xscPlDudm/p4B2z0Uu+TkiQdKUaBOTVaeZDf860/RNrCUh95qbna+pidrn1Cp79xxaM4
         Nz8PPCETJscI1Mdo1PQBfrCKKKwsuzzfr50uByyjnWPOmtHSgtLHShYgTAB6qe9mtsHn
         X6GpltMZ3G9KaCPxS6T1dEzrzV4NETGKK138FroRirXwCZlQtc6rRAITlnS9XHA5Fk3X
         AyQx/1avh3wHb+xDhFeqra3QhWClV8e1VwHCMkZVjnLlI9fdKgAjVih6srLEpFXyoOYU
         ZQvQ==
X-Forwarded-Encrypted: i=1; AL+hErHAs+cKP6SAOThejnZmyHtgYypA3d5XwL0ZesVkKkKY4xfBphgpkq7pDrg956iDYgaXrsl+JRcnTOQXn2Z5XL/K@lists.infradead.org
X-Gm-Message-State: APuU4Z+TasDeFMwODCMHqWSg8MmPg7CR/EwhQWPPiDSOcsMaqqS12jLY
	HbhYiuTxCXIJEnGv5mrKR2P/b9SVsbm/dxSKhrSjmcJoEOZz4y5IESwX
X-Gm-Gg: AZFdTZdVPS7t3auka6kXt09SCOfgX95q/o7yJJ7WPsIoG8m2jVnY4Fbbkx7OCiB58TT
	qL54SzVwgUgzR4nbQtYBIzmVeBnlzs7KOAJj3BjMZcXH7O8UXDvFdxIbCREMxaD9EZ8fT34+Bpy
	owv0xXXslULrJvN6WH2vLmdCTc2Ogca07HJZ/TvpYhZhvUFguV2LpHpqWp0IG7gLaAr/x6G2OMB
	gpmaliL6KkEkyg7U6pFhwtf4P4iotalQXtHFET0pZ7WMZ5GAi9U1JO9HMhwACS8D4ckOHlbt5lh
	rzcG7zIxdK8AgwDBzMVkN8kZOM3gCzgSwiyS4tLauYfzwl2NDgraC1hvvCdK3DnpZRk8pw3e77C
	hwaVLgBmBqScWnVOLVo4a6UUqMwWv4sYAITFe/ttzolTrwbbKWyl7M2W+3PQloggh/LBkc0PLi9
	mVMgH8pATC54efJmMx4Ac9lWvfPRx1X+psvSLPPkR1I9VwtigNKTkB+Gj0H2dbCSsok54jEYYND
	WLUIfEo8WuuEaTaLR2l4w4hio7OykASsWellJauj5GzZHE5lB1+GV0t2DWswLqrv9I/0MkWpdtm
	W79035iIECExtTWEJQKfc6F7aLRiH9TkALj7bLShMlPDFPN4+OsKOvN0GpGL0Wol8Iw6hV/RkxK
	GiH+aLRx4QqTm6gvK9t2W72yiT2PO2ORhIOEtXevLlvF0avsps98qG01UVaNy5WhGMCXXMwqOV7
	4ISEyqklWuvmUhn2G3cLN2OuC8xG3uSQ1xl3xdwmzh/HH25SsEZWlCtOb35R1sfrbbR3Xu/hcRa
	GW3RUtY3rvzEeQQP5fN2BXBIUkP04MF+elRs0DQGA==
X-Received: by 2002:a05:6000:200f:b0:4b7:6dcb:e906 with SMTP id ffacd0b85a97d-4b76dcbea3emr16532367f8f.43.1795717790229;
        Thu, 26 Nov 2026 10:29:50 -0800 (PST)
Received: from jernej-laptop (77-38-7-250.dynamic.telemach.net. [77.38.7.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b2052c8sm42382159f8f.41.2026.11.26.10.29.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 10:29:49 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Ulf Hansson <ulfh@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Anfernee Cao <anferneemelokc5@gmail.com>,
	linux-mmc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 1/3] mmc: sunxi: Set the IDMA DMA mask
Date: Thu, 26 Nov 2026 19:29:42 +0100
Message-ID: <20261126182944.3136900-2-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126182944.3136900-1-jernej.skrabec@gmail.com>
References: <20261126182944.3136900-1-jernej.skrabec@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_102952_417879_559757C1 
X-CRM114-Status: GOOD (  13.94  )
X-Spam-Score: -2.1 (--)
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

Controllers with a non-zero idma_des_shift (D1, A100 and H616) store
buffer and descriptor addresses shifted right by two, so they can
address 34 bits of physical memory. The driver never sets a DMA mask,
so the default 32-bit mask applies. On boards with DRAM above 4 GiB,
like H616 boards with 4 GiB of DRAM starting at 0x40000000, every
buffer above that limit is needlessly bounced through SWIOTLB.

Set the DMA mask to the range the controller can address. For the
other controllers, it stays at 32 bits.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/mmc/host/sunxi-mmc.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mmc/host/sunxi-mmc.c b/drivers/mmc/host/sunxi-mmc.c
index c7fda9c66537..c53d47576864 100644
--- a/drivers/mmc/host/sunxi-mmc.c
+++ b/drivers/mmc/host/sunxi-mmc.c
@@ -1390,6 +1390,11 @@ static int sunxi_mmc_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	ret = dma_set_mask_and_coherent(&pdev->dev,
+					DMA_BIT_MASK(32 + host->cfg->idma_des_shift));
+	if (ret)
+		goto error_disable_mmc;
+
 	host->sg_cpu = dma_alloc_coherent(&pdev->dev, PAGE_SIZE,
 					  &host->sg_dma, GFP_KERNEL);
 	if (!host->sg_cpu) {
-- 
2.43.0


