Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B2D606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 11:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YeCp8/y6;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v6lXFPff
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=cZ1Q9nQisyzYOcK4GhJrAjo2iUyQx36OfgdeOTkK62o=; b=YeCp8/y6lyOAPYWUJdWpv/AQEw
	IRZeCcEBkNAEXtOLHSngPPdsMUFZqERU5Nsa01vKumGwLrQC84zguqjqDs3AauRgno+e/kPCfth60
	pYtEgC/IivRZybXfT7g3/Gj3VR+35zsnxp/PvD3ckn4rviYOkYgFE6O3LRacVa8n+kMw1zKM+8VBc
	SA3EQ1pFwjHk80z4pvfcZf+69LADLZN3jzF1LCXIE2JODHmMHvO0qVopb7iuqlYh5a6cr+/Tc2Aky
	d6hFvDdCP0R0WvGtfujwJ46h5f0ec60HxYJF50roqfTavIouJKZN54bUwhDAHPRod1AoMEuVw9K1W
	hAFQ6t0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTHSL-00000005SVL-1TK7;
	Tue, 17 Nov 2026 11:34:33 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTHSI-00000005SUN-3GaT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 11:34:31 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso51458375e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 03:34:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794915269; x=1795520069; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cZ1Q9nQisyzYOcK4GhJrAjo2iUyQx36OfgdeOTkK62o=;
        b=v6lXFPffaMniNToVnfNkYATl7vMhWKi1wy7eH6NWsVM+5xLPAqMrACrnywQcTcl5OG
         YhYFF6MnHB3C2ULCk1bbjyMOHM1XgvsgKI7018I+A2Jj+aLYdmcYdq2Fyee5MeH9O0Qh
         c6HkUA974HZWVwbd7CVIij5kSgpSaOl5tKYc+vsvUrbD39V6rjEOBuBSpWf2SjQUet/d
         oITk1INnw2lEJlORTDWrI3MSiYv5M9Fuwgt8tgAYzMahsbk1LeuxA+MMeP7YfnQzdju1
         KH4b5Pe0MvhG7YB7bcDWtupZyIx/mxWJTGbUOgztJqXavVxgpauVF/bXJQlP3Dn5LyHz
         aomw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794915269; x=1795520069;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cZ1Q9nQisyzYOcK4GhJrAjo2iUyQx36OfgdeOTkK62o=;
        b=rajnJ0A8bdJlc7fxUjaCe9qJHKaHo8MrsuJUQASq8m5kF0B1srnGAGBu9YDR1Z4jkk
         54KJ+vcLw2V7XE3yDdHn1khfQzIfklr9nDvrImeD2OWT7EWO0Joe5hLnO3vrICuLxKu/
         807jwHUIv6C4RS39f4h3+y1vld78DbLRxyvkth5jzxUhItBCP2cQ/9Q7u8FyrL26Wt/0
         9LKUVbw6QwWpY1aAgVZ7WczWZ/BRsVYv6fiOJoRnhlr4Zb8ee2oJ0nMS4jBcsPIMQadC
         TsnfQnmGFQGfeJUA6zcgTzcPh4zMvT+W4e1bvqaxEgXLY9Uuhp6PyTH1ySFvFo9fIBDc
         a/eA==
X-Forwarded-Encrypted: i=1; AL+hErFCzE6uLmro75duwS64wzQOSEkeRmnSpyv2jj1VxHoUt+4bBWeZMbntRrFQOfnVZTtkdbwjbayny5YS8jkgIaXJ@lists.infradead.org
X-Gm-Message-State: APuU4Z+zYKey8Jj7bx+4+fH1npC++7dorkJm8U2MfDQN2B7mNqC2ntmH
	acMMsAd/hH9TCRBDIvGBhzcTErQ/cNPGUjVDlCHxRBX76elFgJQsbd10
X-Gm-Gg: AYBFou0tGXcNZZrb8/jHHQtAFnjIoxcLlPzqaozq9xKABM8Ozabsra64fXWS8HUK4Ze
	UsomJxoY4lzG9ap2VZ3o39Z1lyu8wTihlXiD4C8Ds6rxitJ6P7U0kJezGEt1hkEHH0T9Th8CiIK
	wmPVCyYYjwDPdNvY/XSsh4sLqhA4IRo9bD6jQgWspFDtBynzZfj5yzYTgcuvf5TOrlLSUYeAIPt
	u5BJT28W3dziS2IYK2tLtl2i9AP2ZfrXMwj4Rt6benWKPUuqinNUJpzBbu30evf4mpMR7rQScOw
	XJXu0QR5a6ycjZV4RFeL3DBsG6B3Im5Ru1UyyP0Tvh1+ocKXA+wqFDVQdm5gCYWWJsHaxC9zPah
	YN9vBf2YlvvIrhJz8nIL1P4hsaFciG3RISz+J9jojygBTNAYaycl4i61/JVIudne8hgtSi/MApC
	HVUQCJpyju2mADV4OTSx4/zxhqaYlcdoSpZ6GQUDWWGHV0N+084bhtFakSQoreAeoIXQ47fyMNA
	xJeagWRwqpXesY2yPkcfTXPV/SmDnsvnkd+utK9eMF/9cumHSLwb+km9eU/bTcslS3D4w4Rg0oH
	yxFVqlTf920CCkQELLAdYnluwOXHF/5mmmKTV+NIJ1JrTQ==
X-Received: by 2002:a05:600c:1d0e:b0:49f:e772:6ddf with SMTP id 5b1f17b1804b1-4bb55a7f5f3mr289084855e9.32.1794915268704;
        Tue, 17 Nov 2026 03:34:28 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb783f7eecsm109015895e9.3.2026.11.17.03.34.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 03:34:28 -0800 (PST)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] soc: mediatek: mt8167-mmsys: fix errors in multiple-output display paths
Date: Tue, 17 Nov 2026 12:33:47 +0100
Message-ID: <20261117113402.728183-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_033430_842179_753901AD 
X-CRM114-Status: GOOD (  13.50  )
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
	UPPERCASE_50_75,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Some display blocks can be used to define multiple-output pipelines.
The current code uses mtk_mmsys_update_bits to clear the mask bits and
set the desired output block bit when initializing or disconnecting a
pipeline. This breaks multiple output pipelines (only the last one set
produces output).

Fix this by using the block bit alone as mask for multiple output route
components.

Also address some unfortunate copy and paste errors in routes between
OVL<->WDMA0, DITHER0<->UFOE and DITHER0<->WDMA0.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 drivers/soc/mediatek/mt8167-mmsys.h | 32 +++++++++++++++++++----------
 1 file changed, 21 insertions(+), 11 deletions(-)

diff --git a/drivers/soc/mediatek/mt8167-mmsys.h b/drivers/soc/mediatek/mt8167-mmsys.h
index 858779ace895..45df210b5775 100644
--- a/drivers/soc/mediatek/mt8167-mmsys.h
+++ b/drivers/soc/mediatek/mt8167-mmsys.h
@@ -79,7 +79,7 @@
 static const struct mtk_mmsys_routes mt8167_mmsys_routing_table[] = {
 	/* OVL0<->COLOR0 */
 	MMSYS_ROUTE(OVL, 0, COLOR, 0,
-		    MT8167_DISP_REG_CONFIG_DISP_OVL0_MOUT_EN, MT8167_OVL0_MOUT_EN_MASK,
+		    MT8167_DISP_REG_CONFIG_DISP_OVL0_MOUT_EN, MT8167_OVL0_MOUT_EN_COLOR0,
 		    MT8167_OVL0_MOUT_EN_COLOR0),
 	MMSYS_ROUTE(OVL, 0, COLOR, 0,
 		    MT8167_DISP_REG_CONFIG_DISP_COLOR0_SEL_IN, MT8167_COLOR0_SEL_IN_MASK,
@@ -87,26 +87,36 @@ static const struct mtk_mmsys_routes mt8167_mmsys_routing_table[] = {
 
 	/* OVL0<->WDMA0 */
 	MMSYS_ROUTE(OVL, 0, WDMA, 0,
-		    MT8167_DISP_REG_CONFIG_DISP_OVL0_MOUT_EN, MT8167_OVL0_MOUT_EN_MASK,
+		    MT8167_DISP_REG_CONFIG_DISP_OVL0_MOUT_EN, MT8167_OVL0_MOUT_EN_WDMA0,
 		    MT8167_OVL0_MOUT_EN_WDMA0),
 	MMSYS_ROUTE(OVL, 0, WDMA, 0,
-		    MT8167_DISP_REG_CONFIG_DISP_WDMA0_SEL_IN, MT8167_COLOR0_SEL_IN_MASK,
+		    MT8167_DISP_REG_CONFIG_DISP_WDMA0_SEL_IN, MT8167_WDMA0_SEL_IN_MASK,
 		    MT8167_WDMA0_SEL_IN_OVL0),
 
-	/* DITHER0 outputs */
+	/* DITHER0 output to RDMA */
 	MMSYS_ROUTE(DITHER, 0, RDMA, 0,
-		    MT8167_DISP_REG_CONFIG_DISP_DITHER_MOUT_EN, MT8167_DITHER_MOUT_EN_MASK,
+		    MT8167_DISP_REG_CONFIG_DISP_DITHER_MOUT_EN, MT8167_DITHER_MOUT_EN_RDMA0,
 		    MT8167_DITHER_MOUT_EN_RDMA0),
+
+	/* DITHER<->UFOE */
 	MMSYS_ROUTE(DITHER, 0, UFOE, 0,
-		    MT8167_DISP_REG_CONFIG_DISP_DITHER_MOUT_EN, MT8167_DITHER_MOUT_EN_MASK,
+		    MT8167_DISP_REG_CONFIG_DISP_DITHER_MOUT_EN, MT8167_DITHER_MOUT_EN_UFOE,
 		    MT8167_DITHER_MOUT_EN_UFOE),
+	MMSYS_ROUTE(DITHER, 0, UFOE, 0,
+		    MT8167_DISP_REG_CONFIG_DISP_UFOE_SEL_IN, MT8167_UFOE_SEL_IN_MASK,
+		    MT8167_UFOE_SEL_IN_DITHER),
+
+	/* DITHER<->WDMA */
 	MMSYS_ROUTE(DITHER, 0, WDMA, 0,
-		    MT8167_DISP_REG_CONFIG_DISP_DITHER_MOUT_EN, MT8167_DITHER_MOUT_EN_MASK,
+		    MT8167_DISP_REG_CONFIG_DISP_DITHER_MOUT_EN, MT8167_DITHER_MOUT_EN_WDMA0,
 		    MT8167_DITHER_MOUT_EN_WDMA0),
+	MMSYS_ROUTE(DITHER, 0, WDMA, 0,
+		    MT8167_DISP_REG_CONFIG_DISP_WDMA0_SEL_IN, MT8167_WDMA0_SEL_IN_MASK,
+		    MT8167_WDMA0_SEL_IN_DITHER),
 
 	/* UFOE<->DSI0 */
 	MMSYS_ROUTE(UFOE, 0, DSI, 0,
-		    MT8167_DISP_REG_CONFIG_DISP_UFOE_MOUT_EN, MT8167_UFOE_MOUT_EN_MASK,
+		    MT8167_DISP_REG_CONFIG_DISP_UFOE_MOUT_EN, MT8167_UFOE_MOUT_EN_DSI0,
 		    MT8167_UFOE_MOUT_EN_DSI0),
 	MMSYS_ROUTE(UFOE, 0, DSI, 0,
 		    MT8167_DISP_REG_CONFIG_DISP_DSI0_SEL_IN, MT8167_DSI0_SEL_IN_MASK,
@@ -114,7 +124,7 @@ static const struct mtk_mmsys_routes mt8167_mmsys_routing_table[] = {
 
 	/* UFOE<->DPI0 */
 	MMSYS_ROUTE(UFOE, 0, DPI, 0,
-		    MT8167_DISP_REG_CONFIG_DISP_UFOE_MOUT_EN, MT8167_UFOE_MOUT_EN_MASK,
+		    MT8167_DISP_REG_CONFIG_DISP_UFOE_MOUT_EN, MT8167_UFOE_MOUT_EN_DPI0,
 		    MT8167_UFOE_MOUT_EN_DPI0),
 	MMSYS_ROUTE(UFOE, 0, DPI, 0,
 		    MT8167_DISP_REG_CONFIG_DISP_DPI0_SEL_IN, MT8167_DPI0_SEL_IN_MASK,
@@ -122,7 +132,7 @@ static const struct mtk_mmsys_routes mt8167_mmsys_routing_table[] = {
 
 	/* UFOE<->DPI1 */
 	MMSYS_ROUTE(UFOE, 0, DPI, 1,
-		    MT8167_DISP_REG_CONFIG_DISP_UFOE_MOUT_EN, MT8167_UFOE_MOUT_EN_MASK,
+		    MT8167_DISP_REG_CONFIG_DISP_UFOE_MOUT_EN, MT8167_UFOE_MOUT_EN_DPI1,
 		    MT8167_UFOE_MOUT_EN_DPI1),
 	MMSYS_ROUTE(UFOE, 0, DPI, 1,
 		    MT8167_DISP_REG_CONFIG_DISP_DPI1_SEL_IN, MT8167_DPI1_SEL_IN_MASK,
@@ -130,7 +140,7 @@ static const struct mtk_mmsys_routes mt8167_mmsys_routing_table[] = {
 
 	/* UFOE<->WDMA0 */
 	MMSYS_ROUTE(UFOE, 0, WDMA, 0,
-		    MT8167_DISP_REG_CONFIG_DISP_UFOE_MOUT_EN, MT8167_UFOE_MOUT_EN_MASK,
+		    MT8167_DISP_REG_CONFIG_DISP_UFOE_MOUT_EN, MT8167_UFOE_MOUT_EN_WDMA0,
 		    MT8167_UFOE_MOUT_EN_WDMA0),
 	MMSYS_ROUTE(UFOE, 0, WDMA, 0,
 		    MT8167_DISP_REG_CONFIG_DISP_WDMA0_SEL_IN, MT8167_WDMA0_SEL_IN_MASK,
-- 
2.43.0


