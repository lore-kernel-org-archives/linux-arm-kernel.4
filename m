Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3543606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 15:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oAUBRxM4;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WKdj8jzQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=uxyciXMxH0bTMNJV4EPthVww46cAkYziyxYSA313rWY=; b=oAUBRxM4IFX4fY75T54ptvJC+1
	5U2Y/ZkI3evzd0xwcfTjaIAwLi6NtsRiuBpshvZS05RFde68KGR7CFtaarv91Cpwb1pDT0QUnCDOq
	194NAIs5lF8TwrOUNlg1N3j4z70L0+T8WQnHqutfn2eftWLgZ941IJgWivStYYMynW4TlIzSvI5sH
	3rA/+kMzK7Sz2J/csQBqLF8f9cCCu2nRlXAOZwPGuyTaBDQcoevL4S0EsxRwuS43D0qSAzEpSWwN8
	1iA5y5QfVX46vtg58wn01hBClGBqY9QR3Qvi8zZPklWIUOVMpcreYWjLNC0lJW8jm16fIU5W/tQLP
	689M2klw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVsLR-00000006sK4-35ss;
	Tue, 24 Nov 2026 15:22:09 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVsLO-00000006sJE-0F4S
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 15:22:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 81A8561F0C;
	Tue, 24 Nov 2026 15:22:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7799E1F000D4;
	Tue, 24 Nov 2026 15:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795533724;
	bh=uxyciXMxH0bTMNJV4EPthVww46cAkYziyxYSA313rWY=;
	h=From:To:Cc:Subject:Date;
	b=WKdj8jzQmCBC24JLo+G90apuiKpN807k7os1v9Bul5WBYH5JXyCZCK2FIItF7Wa1q
	 DLYnPBFJSqgmtJB7nLSN+8nHozkG8r8TfZhZORPwov91A3S8ocKcy6qt7bczUaDHP/
	 ZmdMTB2InQX0Kb1z9MRlBIHo/bG1WSj2wLT3sT+nDcNKDo8mSzBl4ZS8I5r9RCIe4q
	 whgKmmIQYEsF0IbVEGfzB5yfpqSos635oOWEry2XVyd3IXlf2LDfxw4putBtYt5tcC
	 4WXWss88E5bqO1WzmeP33H8YHZ5SKvpxl6e/W6J3vMeq+hiJy26v93vAVbxalW8qpo
	 EyMOOZqMRhAGA==
From: Jisheng Zhang <jszhang@kernel.org>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Russell King <rmk+kernel@armlinux.org.uk>
Cc: netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v2] net: stmmac: fix uninitialized axi_blen array
Date: Tue, 24 Nov 2026 23:01:44 +0800
Message-ID: <20261124150144.7505-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

If platform doesn't provide "snps,blen" property, the axi_blen[] array
will contain random value from stack, then the array will be converted
to mask which will be written to DMA_AXI_BUS_MODE reg later. Fix it by
initializing the array.

Fixes: efd3c8cc52bb ("net: stmmac: remove axi_blen array")
Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
since v1:
 - fix subject title

 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index b3e06aa58fe5..29ead405f449 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -96,7 +96,7 @@ static struct stmmac_axi *stmmac_axi_setup(struct platform_device *pdev)
 {
 	struct device_node *np;
 	struct stmmac_axi *axi;
-	u32 axi_blen[AXI_BLEN];
+	u32 axi_blen[AXI_BLEN] = {};
 
 	np = of_parse_phandle(pdev->dev.of_node, "snps,axi-config", 0);
 	if (!np)
-- 
2.55.0


