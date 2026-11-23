Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C37D606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 13:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KlpmLcih;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WG78Xect
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=2Y8yOTbhtoK28NXLx6+AHEKOz4plE0kM1KVQW0HkT0E=; b=KlpmLcihD0mWYB0vi/0MzIPrLj
	eai2V4JRFg/0ClwkuiKuCTkD+UrPgIDmbnegARsC3Hld1zfNqab8hW3Qnt/9zwiQg7hTIaM8MQHvE
	fjuY11QSvuqffnWK0tDiE+p0cF8Npq/GMJlNYsoZrGRpEVPi9QAKINKIr5cfYrTAW/4SNfY7+AF77
	olbYTcrYQ9r6orGBHTnixcqgIpBW8WvKJdQ5hFiX2XiRJhIrwKowRe/MjQ7kWk4zRxjds/MzJRtqk
	U+McmdNoiOEn9ukJD90U8+dv67pP79JsoeHWwghgbf8NGCO/FxFj/pjHYrhpnA/JAwdFlz/suIPp/
	ZkyEk8cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVUB0-00000003agM-26MO;
	Mon, 23 Nov 2026 13:33:46 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVUAz-00000003afj-1qx2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 13:33:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9075461D42;
	Mon, 23 Nov 2026 13:33:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5F4A1F000D2;
	Mon, 23 Nov 2026 13:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795440824;
	bh=2Y8yOTbhtoK28NXLx6+AHEKOz4plE0kM1KVQW0HkT0E=;
	h=From:To:Cc:Subject:Date;
	b=WG78XectP2FyDqthO37ScnDRMWI+8ex8igW/DoTTOhQMzC3nK+X/oyztCZxCKs7cW
	 SJ8JYe19WT+SzK9KyY8RbsIoKEg4OBOvYk1XG45pA8m7CDeyVoB8Hf+uhg7pzSnNy1
	 5jSJSxvCZQOOkyE/ryVDHK7yrStJZs1Q1Kkm7ZeJjxNH6WUDDWWgN61qhDT3yiz8cA
	 JsyGiC0zGZFtJ89UqMTkpOjO5EEZEpftdeDhihn4SqRMeuTn/R2aLrKvWoPU1FH0SM
	 aLysckbtOMHghFhpab7G+ooTL4pC8h2NWChExh+UL6aOcPQgzhfjcXVlcOIK/qaHma
	 KPAgy7rY2ClPg==
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
Subject: [PATCH] net: stmmac: fix uninitialized axi_blen array
Date: Mon, 23 Nov 2026 21:13:26 +0800
Message-ID: <20261123131326.7105-1-jszhang@kernel.org>
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

If platform doesn't provide a valid "snps,blen" property, the
axi_blen[] array will contain random value from stack, then the array
will be converted to mask which will be written to DMA_AXI_BUS_MODE
reg later. Fix it by initializing the array.

Fixes: efd3c8cc52bb ("net: stmmac: remove axi_blen array")
Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
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


