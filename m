Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDAED606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 18:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HOZPsTKY;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zrXsSPIL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Ul8avXQobHMQCgtgHYaeZ3hLQKdlpeIZoIBnaJtF8Qg=; b=HOZPsTKYuIxXEStEAmVrHU4YLJ
	I/sP3NDzywzsNA0C2VlrFXfAmIMoVKD3A8L+KYbhV6NRcBFbvxTgW9M2OtqH75fIhIj1lb0Y+s1Sr
	bF+zX0wjKcF/z6WVnDwbjZsnzOirx1xf8VtZLDPIqsNgmOvEH41xcGmL5K+f+cqQ/e1a/sGwTAa82
	FRLWcx2iS+123qMXvUODcMoNBO+fOKxH78qJcKLJHEmefPSqYEjTfDMp1zcKQ5Z/RgTknZbMg+cdO
	6GXjlhaprTvneha+3msp17mh5UJ33AKPrdq8zgHX1QupE/ksMQgX96rTpFKOn6h1Wwh4HKHGP6Ukj
	CpXMwNQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTNsp-00000006kpr-2bBS;
	Tue, 17 Nov 2026 18:26:19 +0000
Received: from mail-dy2-x0a.google.com ([2607:f8b0:4864:36::a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTNsn-00000006kpD-12CP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 18:26:18 +0000
Received: by mail-dy2-x0a.google.com with SMTP id 5a478bee46e88-36d73027aedso36910eec.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 10:26:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794939976; x=1795544776; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ul8avXQobHMQCgtgHYaeZ3hLQKdlpeIZoIBnaJtF8Qg=;
        b=zrXsSPILvXokjVjJNAV/9y+nvQw4jJKHy8rKLOs3xslmF/8MAdR2R2P/wHMvtum2Nl
         TJl+cUDf2zluw4fJELVsVKv2FU/TKDy2X6WTuN5BraTSxUdIhF5uAI+e7RHbv+8UNQBY
         a5sixHmaniFSKww9n3tRfaz/AoZqAZLZHmhiVDxoNDEdDM8ZtaBP4pNdG5vbWhlOPV9R
         U7r+VA3y0goQVvc0SMyhRnIi0TvNVd2m5pF34Q8L5GtHI2H3Qp8XKkkmG6NFpUhtyUE6
         O2tCabGZLIenpLryt06aaGfN7mLgNN/Qh/lu2u9C4lKTD34cXArFJXdH2wqPoS1TzEqq
         UxpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794939976; x=1795544776;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ul8avXQobHMQCgtgHYaeZ3hLQKdlpeIZoIBnaJtF8Qg=;
        b=E2vm0GslMSQ9AUD0e+NuGvvvRaEnDzsLUgMd4UrNFl+0gbl71FELtr4rSSIrKFt+AX
         5F66SQZwK89wC0XaMo/hwL/mixSXHswWvDY4eWhwagIhFmuE+k4qUQfKFYcyBEY9BGe0
         Wa+GJYD5yn3Vb76kfH0gpiGrjjYjHZclzvNhrdQPsDByJ/LcmTBZ/iJRxBDIK1/L9h0r
         NdrW5A3fQmyY0tqL8VPMOXWuhVMD5NxbkufGbZ3Tj2n92YMnGQ8pzty1IdcusrBiynOR
         VBmVJ5QwUyi9gHovJPXr4J4ZbNp6JeX3htuvc9Q8zKB2N1GIlZB0ntDpqx8Qc+yfQWur
         8MEw==
X-Forwarded-Encrypted: i=1; AL+hErFulN3Qk92iizo0xGPn8VBVyg1xK8Rw99ftL0Y4p8u2TqrfpyMLZm9b6p/MduELxQM6Tv/f1tM0RXJ89Qgy8AiU@lists.infradead.org
X-Gm-Message-State: APuU4Z9H85TBWeiDfEVoTOe1TU+NMJAZBowSe55E9KTb/IxbT8azdm7T
	B/jyabZnndnSo2Wvvq8V/SbL8ewLWIz7uldyumkQ0rovMfS6JPZvyPaU
X-Gm-Gg: AZFdTZfbbMd48GjXTsdYKld4gRFV+jmYPhjktXqLTzWXYowCYQYEC5WV17VhKR/YbJk
	W5Tq5i2bQ7f+WMYHy0/YgFIN4DIqPSwkVhN7pu0NRu388/VcduuK/ZxEM6WkJcXmI2APakORrmU
	OlCpqOAhI9HzAaUtM9Y2Lkaten6jOou6NNVQRzFNvbv7H5jvROA6RgIgxay4sRcjuq06l55ig5j
	RXnubqPIn0t+miKOtcbT4gmfZmQp9bTgcajKvC95fYNnDaDSutsUZH6oduIgWNDUlwNULuglFps
	EsbOyYGWtMshJ4dmBJh9e6TVj5FApJO2Fz/TEI37ZmbQCJa41iwEnWl2kdqgufiXl40nnmuZ+qk
	MM6rIkjVulxl9n5feyPfvEJhZjCxr+1fJtRiGCp3rac9PfBWW2UqDvvKyLbEOs3dN5psIpNJ5k0
	Jnhj3IhTbyfegLGmp/ds85pDaMZBLQEZaq4K0JyKhVB+qqXW/Nj/9O94feOh1LEn3N+eEJcJRNA
	YRWyfRx2Gvd5yi85h25qDumvBLb9tGKmp96HzxxzEUC4DB1VWHmjaQY+xgdnbupz97lk9GhAVmI
	VaVQAnTmp460fkuR/Lq/rSo9ujszXSIzbYr4bm626y8TL8icJ8fa5gGVO4o=
X-Received: by 2002:a05:7300:4307:b0:376:c352:2fcb with SMTP id 5a478bee46e88-38281020584mr279305eec.9.1794939976302;
        Tue, 17 Nov 2026 10:26:16 -0800 (PST)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795378d73dsm45641488eec.2.2026.11.17.10.26.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 10:26:15 -0800 (PST)
From: Coia Prant <coiaprant@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	Heiko Stuebner <heiko@sntech.de>,
	netdev@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [PATCH net-next] net: stmmac: dwmac-rk: split gmac_clk_enable into enable/disable
Date: Wed, 18 Nov 2026 02:25:03 +0800
Message-ID: <20261117182502.3045841-2-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_102617_319343_325F12FD 
X-CRM114-Status: GOOD (  16.15  )
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

As the great Linus Torvalds once said in
Documentation/process/coding-style.rst:

  "If you need more than 3 levels of indentation, you're screwed anyway,
   and should fix your program."

The gmac_clk_enable() function previously used a 'bool enable' parameter
to handle both clock enabling and disabling. This resulted in deeply
nested if/else blocks, which made the error handling and rollback paths
cumbersome and prone to bugs.

This complexity has led to bugs, such as the bulk clock leak fixed by
commit 8db67bb6a1ff ("net: ethernet: stmmac: dwmac-rk: fix bulk clock leak when the PHY clock fails").

Split the function into two distinct helpers: gmac_clk_enable() and
gmac_clk_disable(). This flattens the code, removes the boolean flag,
makes the caller's intent much clearer, and simplifies the error
unwinding logic.

Additionally, this refactoring aids compiler inlining and CPU branch
prediction (trust me). The reason is simple: no branch, no prediction.
While the compiler might optimize it, there's no guarantee it will :P

Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 .../net/ethernet/stmicro/stmmac/dwmac-rk.c    | 67 ++++++++++---------
 1 file changed, 36 insertions(+), 31 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
index a37df5767d84..78bc8c71ad10 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
@@ -1178,43 +1178,48 @@ static int rk_gmac_clk_init(struct plat_stmmacenet_data *plat)
 	return 0;
 }
 
-static int gmac_clk_enable(struct rk_priv_data *bsp_priv, bool enable)
+static int gmac_clk_enable(struct rk_priv_data *bsp_priv)
 {
 	int ret;
 
-	if (enable) {
-		if (!bsp_priv->clk_enabled) {
-			ret = clk_bulk_prepare_enable(bsp_priv->num_clks,
-						      bsp_priv->clks);
-			if (ret)
-				return ret;
-
-			ret = clk_prepare_enable(bsp_priv->clk_phy);
-			if (ret) {
-				clk_bulk_disable_unprepare(bsp_priv->num_clks,
-							   bsp_priv->clks);
-				return ret;
-			}
+	if (bsp_priv->clk_enabled)
+		return 0;
 
-			rk_configure_io_clksel(bsp_priv);
-			rk_ungate_rmii_clock(bsp_priv);
+	ret = clk_bulk_prepare_enable(bsp_priv->num_clks,
+				      bsp_priv->clks);
+	if (ret)
+		return ret;
 
-			mdelay(5);
-			bsp_priv->clk_enabled = true;
-		}
-	} else {
-		if (bsp_priv->clk_enabled) {
-			rk_gate_rmii_clock(bsp_priv);
+	ret = clk_prepare_enable(bsp_priv->clk_phy);
+	if (ret)
+		goto err_clk_phy;
 
-			clk_bulk_disable_unprepare(bsp_priv->num_clks,
-						   bsp_priv->clks);
-			clk_disable_unprepare(bsp_priv->clk_phy);
+	rk_configure_io_clksel(bsp_priv);
+	rk_ungate_rmii_clock(bsp_priv);
 
-			bsp_priv->clk_enabled = false;
-		}
-	}
+	mdelay(5);
+	bsp_priv->clk_enabled = true;
 
 	return 0;
+
+err_clk_phy:
+	clk_bulk_disable_unprepare(bsp_priv->num_clks,
+				   bsp_priv->clks);
+	return ret;
+}
+
+static void gmac_clk_disable(struct rk_priv_data *bsp_priv)
+{
+	if (!bsp_priv->clk_enabled)
+		return;
+
+	rk_gate_rmii_clock(bsp_priv);
+
+	clk_bulk_disable_unprepare(bsp_priv->num_clks,
+				   bsp_priv->clks);
+	clk_disable_unprepare(bsp_priv->clk_phy);
+
+	bsp_priv->clk_enabled = false;
 }
 
 static int rk_phy_powerup(struct rk_priv_data *bsp_priv)
@@ -1453,7 +1458,7 @@ static int rk_gmac_powerup(struct rk_priv_data *bsp_priv)
 	if (ret)
 		return ret;
 
-	ret = gmac_clk_enable(bsp_priv, true);
+	ret = gmac_clk_enable(bsp_priv);
 	if (ret)
 		return ret;
 
@@ -1544,7 +1549,7 @@ static int rk_gmac_powerup(struct rk_priv_data *bsp_priv)
 	return 0;
 
 clk_disable:
-	gmac_clk_enable(bsp_priv, false);
+	gmac_clk_disable(bsp_priv);
 	return ret;
 }
 
@@ -1556,7 +1561,7 @@ static void rk_gmac_powerdown(struct rk_priv_data *gmac)
 	pm_runtime_put_sync(gmac->dev);
 
 	rk_phy_powerdown(gmac);
-	gmac_clk_enable(gmac, false);
+	gmac_clk_disable(gmac);
 }
 
 static void rk_get_interfaces(struct stmmac_priv *priv, void *bsp_priv,
-- 
2.47.3


