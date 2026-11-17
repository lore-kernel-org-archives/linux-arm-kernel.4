Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62E0E606A323
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 12:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=T2NSUZmL;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Hrl8GYuq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=PvhRwGpG/bx47LbZ5+rPkxTM1RKyVIDPm5XEYb7/QQc=; b=T2NSUZmLR+b+bgrcNEUyhuMd2y
	RyfiJhrWw0tPccKgUrar2FQ4zpbiEpIMocD/sD1fs1073xBj5YsZ3EWDpUrDhVPkAvdtJA7x/m/LP
	xgAw8mV+xdrZFkHrkjuwCfHoynSegChXc3EMVqfbsI/oQP3pDbXlsMlzDikUSb1mnEDC4oeUg/7eU
	b5weDUIbGSZxJk723Yb8ZsH2k6nw1mMt9s4KE18o6A1/0FxmIKSFj6IrP3BC6npC7+6VbtEGVDLQa
	D1kICl7vXeR3L5iV7YDvmajf+1PzY5tkONqfEZyWsbTJB6+XH7Vn5x9xm+1j5kJlNlpDH5zCGBIfE
	F/mo8zVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTI0m-00000005ac7-3Oa1;
	Tue, 17 Nov 2026 12:10:08 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTI0f-00000005aWq-2WCv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 12:10:05 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so10876405e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 04:10:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794917400; x=1795522200; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PvhRwGpG/bx47LbZ5+rPkxTM1RKyVIDPm5XEYb7/QQc=;
        b=Hrl8GYuqAF2jQgKjELJcbFYnUs7/1aAslrhNRyl3roAwzEmgsTTIWC27/mbfS8dmka
         8gusHtcNogQLREUO/vfljH454LT+dsnfkCGxA92PvmR+ypAZxCy+SxLV2tm0VpGP+Bg9
         bD3QT4ZWINnc8e0efgN+Q1u7d1xu36yqMm6urE/wvTkDJ+3v7CnUsGnmEIF7LyX4aauo
         B3uq3tJrhrC1ffT/oo79M1XLRlPx46VCzdkKhKEQa75C9YWZq41lgRaNh3UAe/xASVmp
         7Trk8lcO+EPNwaF6C1l8cBKein65ldOm+WZygvIBmAMgt4jiQxdkXMf0A2B/Wb6KrF3p
         V+1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794917400; x=1795522200;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PvhRwGpG/bx47LbZ5+rPkxTM1RKyVIDPm5XEYb7/QQc=;
        b=RZbb5YKFalTKSaNU6+hLknfhhEofA0jdngSh9sxOjsDk6JLx6TZTwLPjw8D3aNvSeV
         ajVeCuO3ekJGXLUYDBYwnH8+J2nVbdR1kKAODF/HyiX6DFAMxdYyQBqdz9FB0eXjPUZU
         bGx7tsMLncXQkEHaizsetI0Bjo4gytDUwcn7Em+Lu/HU+N5NfNpJjmyaxrQlfLHLNx5w
         9ZTnUOqKyVf0Un/5MrUX5qlDBTJkzFzakfm/ROp1Tmc8vmMiJ3VxZT+sTqkstg7qL97K
         JHB36FPTLrsd+yKoBAdcyTwZyACR+JvRg1RTHT8ZgmDgfa3ziN6LHaHgkE2yb8L1nW+6
         JclA==
X-Forwarded-Encrypted: i=1; AL+hErE0InkJWe4ONaC8YuvGyQKhEtC7iB3ijLlqKvM5L1yNJbYJtKEZ5t07uj3vb1Ts3sNYih2Af54jej+HufdXuy1V@lists.infradead.org
X-Gm-Message-State: APuU4Z8IjG0blK2sN9163HbjQBg2K0X0in1iaqjbIm/GqwZm37Zh3vDA
	yWaJkHEK6k3wmU/0o0Scivbd16yCPGQMAu9Q2WilnbZ2OvN1F0YRlWVV
X-Gm-Gg: AYBFou0ZJitS6n8wnNbSF0sO3aExZsXPe2GbwjJxtw2jS16n9Mty540u3BZ2Yzyd52p
	KFkGuz7C+VG3Y9vXyjHtUlOUo0WNyOokNtmfHgSLzMbDOdn/MMQA2RlESgkOqagPnqhkeM/K4Xf
	DYOb9Vy4aAOlGxljSTVaJQX78tLUtmF7xUpL7B0uuWJGg8vso/KZJfrAGSWBMnNP/Cl7uFFrm+P
	UwRfPwejrCXskiekx38yRiZXa3jJtyuJRoVUEAEgU9KRLYphT92kwtdbxk6eVuxY7BHkVIYxDLE
	3drz9KodK/CcST1/eawaUns6rxt/OonpE879uPN2uNTLWA+ypwYWNMQ2lIaZxmo4TrU5P2F3mnI
	jZRHKrCT6ps+tCfThlIJyd12yyJVaFt/S4dJQqUQpEtwMiwpdsih48dmdBXGAh9b8YrvQFoaG1j
	jf2EqY2QrWdsSW9YFvzkewrGC/1bK/0dDYrIxN5vtK2MoMYYCCc3zaFQqUKx1W9g6mDaU096v2n
	Rfc2VlnqfGn7rZ5meSFjbUrx9LYJnDjGD4vSBv1jUAnbL6eUnFZ+eqjJzNJ7Mcju6zX381qVFXy
	KGGBcItpQtHlZxv3biGW/faB8q+4bySoDaTebuZ5t10hRg==
X-Received: by 2002:a05:600c:3493:b0:4ba:4928:8aec with SMTP id 5b1f17b1804b1-4bb78381293mr54280755e9.9.1794917399581;
        Tue, 17 Nov 2026 04:09:59 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb783e9288sm66515085e9.15.2026.11.17.04.09.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 04:09:59 -0800 (PST)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2] soc: mediatek: mt8167-mmsys: fix errors in multiple-output display paths
Date: Tue, 17 Nov 2026 13:09:12 +0100
Message-ID: <20261117120934.728612-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_041003_842715_BBDAE499 
X-CRM114-Status: GOOD (  14.25  )
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
Fixes: 96c2b43b1fb3 ("soc: mediatek: mt8167-mmsys: add routes for all display paths")
---
Changes in v2:
- Added Fixes tag

v1: [1]

[1] https://lore.kernel.org/linux-mediatek/20261117113402.728183-1-l.scorcia@gmail.com/

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


