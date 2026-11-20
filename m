Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11323606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 16:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sgLyqWz4;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Whd2P3jW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=nmGAkRQuZY1WnXUxjgDk5sO5Kth0S7mM5PEwkEwxFCo=; b=sgLyqWz47RHlwkkUcDaucCBTL2
	2h7CbcN/OF1NHGAUvlYgj0Epddcu7CHVbc948HNEy+qc4aY0y7/qic1iYK4mT7TPa6mHZ99/mpmNh
	AhqXLSBjMrTxDTKTUbfQxTv/SEaRvgjBhVf6gXsfK1NzB//iYq+lwsC0FfkZvgx8fqPd3OhrkKgkz
	220dlZkIiQEpyXxVBQHUCdXBCxnxhkixdE+GRoHNRzE+kR1n39Q2JiZy/jqV1HUBgrFImv/3iu5da
	dm0NAdkURAdyqlMK1K0W/WRwARhWFlO14KxLuCUOb7ACiy89xM0OG8oE+oUhcSWeS3vs4/rznW7G7
	OPN4JJkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUR72-0000000FVmu-1HOn;
	Fri, 20 Nov 2026 16:05:20 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUR6z-0000000FVmR-2lAA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 16:05:18 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-3b155f50c24so1005902a91.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 08:05:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795190715; x=1795795515; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nmGAkRQuZY1WnXUxjgDk5sO5Kth0S7mM5PEwkEwxFCo=;
        b=Whd2P3jWQpR1IUBQ5Mlp8Lq7HdSWhYPKZAuSgF4cOkhu/q7nrLaFBVu0gVWv04fx2B
         sTBuiknEhuS78GHG5R9ACWxowQb2FQmQVFicdGQ8JVImOK0rVM4DI0JMiqnWwPKGurq2
         ETg1+bJepe2n87TD5xvYaD6pNhYLqOpalhh8DU/ifwvaC1mUG42BVsAQfu5VQ51JqyRA
         wRjDXAdYgXaGVVMy48YGN3PmcYQ6hlvUfc9FHPGp2Ltj3es0t1NLnbmMWf24h4qqGuFz
         GPcf4GEWps3nIhQu1jcVnmpHfnUWko7DwI9iSvdknwKeCbs9rxjW8vHBFgzBqf0gAQCI
         HvzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795190715; x=1795795515;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=nmGAkRQuZY1WnXUxjgDk5sO5Kth0S7mM5PEwkEwxFCo=;
        b=nSzSRfQEiWcrpVQ+IPIxeIF7EyKNNGB9VxqWUVc8uFrJpYEo7+IiOHiK4A1xaltzlC
         eONmAbhAEUVPRnktMb83aTeRK+IWPSrUH1qhzKHhweTHbi+Y4tZG6sTYQqm1bZivT3C+
         RbaDEG69FANLD1SZZ1m1uEnssWTUUPGbc/XqqvLgf/WJ2QakweABqOvDwaZk7gvWTn1/
         JmaQlj9cAxL7kNqubFitQF0paLcfzG8CmMu9k2aAXR/CQQ2ZJ5LnaLm+2XDOljoLxgqT
         p55FcuzjPicHgoA3NXrc0jbmCqMj1Yoo/RwRQpTlr2TTJumw8bL2re3aPy5PlezD47Xj
         jg0Q==
X-Forwarded-Encrypted: i=1; AL+hErGAcBeuDLzOO+uHmCqM6RhvrN0lpob7v4KrZr0+cepQ9uAx/PiXkFce/GDA0H3vhoSW4feJYBhdD0UhZb2uCWmL@lists.infradead.org
X-Gm-Message-State: APuU4Z/C5Zsm9SHOTItfYHI/vNydsdtxH8iuCuWqO14kTChAiDun61lq
	VCARZSOava249XD4EWtFeRUIRHIv2cxTHAB0tFHr3M62ljG5NOjnIwaT
X-Gm-Gg: AZFdTZeauEedHu0jeNk63GRT+4HIzKXSaXzTOXtavS1INRrM7VuAZW3kx08SVXZaIXh
	dRLPevyLZfoUMV0PCRHgbW3DTdbO/VPmEclok/ohiGy6djg2qMasejjCIhuFbFt12W7ZgNGt0nI
	S5pOgplv0Kc84iiwnE98LengGBzAxFjp+6SBFj5pF6EaDDkMYoL1HCNJnywFvEgtdAdLLA2UcI6
	xYCEA/bV8t3pmeFzrO313iuqN/zTb2X+XQGSQVB8LrU7nKYrGybTjVjyU/QhOE6BKibUg+IrOnm
	1O2u11VE4mZuQxEfJ3hec/0t6cB2CDRrqPOaRRSAgxxxLW5K0vW8UFR2qgf4kz29XGrmVGTnvTA
	I/T3sAIZEYP5s9O5wsm5uU3b9Rnnn+Wehgk7qdGr0O7UyKxdfPC3gvmyDWxI3T2kOS2/XIQW0jq
	CmH6oaHX2uhzoNIO+dJ7SVmk1xYL725qtRz59sLvtGLI7G99udVpVZIMLg3fHWNuXBkG1c4ET6y
	xdiRJt3mZkPrpxJI8EaeIFrQTMlCacdklda5iEXkDA4C66tUB8mJhfH1emR2/LoBkLtTsJHuXk/
	iqwx9mQWqBL3NW3zb+y4Qte9gTdG/3IFeD9f7BMAOPdR7Tawiy2aaw76Vh+Y2OAKUlzRMPIsACe
	tgkskn0K4Dz8aju1LuaibKxQ=
X-Received: by 2002:a17:90b:1dcd:b0:3b0:9e2c:9b57 with SMTP id 98e67ed59e1d1-3b41c7c7a57mr3608641a91.4.1795190715046;
        Fri, 20 Nov 2026 08:05:15 -0800 (PST)
Received: from junjungu-PC.localdomain ([2408:820c:9009:b6e2:dea:3892:877:4c42])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-cde6c9c7dcbsm1603907a12.0.2026.11.20.08.05.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 08:05:14 -0800 (PST)
From: Felix Gu <ustc.gu@gmail.com>
Date: Sat, 21 Nov 2026 00:05:02 +0800
Subject: [PATCH] spi: sun6i: Release TX DMA channel when RX is unavailable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261121-sun6i-v1-1-ce211aace0e8@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ5AMBCF4avIrDVpS0tcRSyowViUdBCJuLti+
 SX/excwBkKGKrkg4EFMi49QaQJuav2Igvpo0FJbpbQUvHtLwmRYmrbIO4cSYrsGHOj8furmN+/
 djG57x3DfDwoQw2ZpAAAA
X-Change-ID: 20261120-sun6i-53e85a74bce0
To: Mark Brown <broonie@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795190709; l=989;
 i=ustc.gu@gmail.com; s=20261030; h=from:subject:message-id;
 bh=g4Lb6UCytjHFAliWTA0cYV0Jre5Cf+YcZAPH67r/ocE=;
 b=Dd0N3HYfVymgF6axdUG4tzKPVuPJMdg0NT7r/hxBQv1Vpr01tfeYh4tAlWsi7ze8GekFVwrPw
 Uixubio1FDTBDj0Lc4F9ZG/XqRxTfDJo76IjmmUeBFAlPEllNz/WoOP
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjDJtbnSeysEBjmOfNYqYUUDS6g7Tfov9W5oGngTBfo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_080517_851258_FE6C19B4 
X-CRM114-Status: GOOD (  12.32  )
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

If requesting the RX DMA channel fails, the controller falls back to PIO
because DMA is enabled only when both channels are available.

Release the TX channel acquired earlier so it is not held unused until
driver removal

Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/spi/spi-sun6i.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/spi/spi-sun6i.c b/drivers/spi/spi-sun6i.c
index e9fce8618299..f6d1699f1116 100644
--- a/drivers/spi/spi-sun6i.c
+++ b/drivers/spi/spi-sun6i.c
@@ -709,6 +709,10 @@ static int sun6i_spi_probe(struct platform_device *pdev)
 		}
 		dev_warn(&pdev->dev, "Failed to request RX DMA channel\n");
 		host->dma_rx = NULL;
+		if (host->dma_tx) {
+			dma_release_channel(host->dma_tx);
+			host->dma_tx = NULL;
+		}
 	}
 
 	if (host->dma_tx && host->dma_rx) {

---
base-commit: adcad7f4e6332cff3d6d7165f41584899f598534
change-id: 20261120-sun6i-53e85a74bce0

Best regards,
--  
Felix Gu <ustc.gu@gmail.com>


