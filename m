Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1FA1606A325
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 14:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=j5hZfhWp;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=N4jfmheK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=7VWEQkQ/Bv3OVKC6H48yzpBhMJARpLfAxd56jKkS5oA=; b=j5hZfhWpMK1Wgs
	2GszZK4HCrnycqqQsDHqXFGdTudii9iWys5aY0CEacBjjIVbyIvgyRVKgNapKUigrX8TVyGmDu3cu
	oGVvt/XYzQy5qI6uVhFLCww6jI7Mg3VvT7n4BtQA8sb5ZsLXbI0Qr+tvlP/OdnOlan3Uxahgyr57H
	rZRX2O+4oi/dzJImeX/eJmgBG6395S1C5kZoVrnjRi3GJvrm/OFxa4rDoEevI5dd35mKOCLFCk/x6
	l1abO8R8p8/yMH42Bsmsu451w7d/Ri4rpV0x8e5KREj8dEa0q0Hri+k5M1PyPH1Fuu1joxQph0dSN
	qVF3VPkp8CiKSv4jVu8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU2q0-0000000CB1z-2dUb;
	Thu, 19 Nov 2026 14:10:08 +0000
Received: from m16.mail.163.com ([220.197.31.5])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU2pw-0000000CAzh-3NHP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 14:10:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=7V
	WEQkQ/Bv3OVKC6H48yzpBhMJARpLfAxd56jKkS5oA=; b=N4jfmheKU8J7Ko8Ir2
	4WvCdbsALllVXMJjCyEreqGAppHJba1QcaWDKYOFz8FVuhI7CNUEMg00+lxC8is8
	KbIjEipCdhPtY6H2Y1QdzBikuBIV3fKaHJuIdJ5Yc89x8XEcI+qaAuBy/jZvoZM9
	fGDlkK4hlHnYci0JQ8TJviRLo=
Received: from 4CV529F122.company.local (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wB3Zjj_Av9qQc93Iw--.13924S3;
	Thu, 19 Nov 2026 22:09:24 +0800 (CST)
From: Ding Hui <dinghui1111@163.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	netdev@vger.kernel.org (open list:STMMAC ETHERNET DRIVER),
	linux-stm32@st-md-mailman.stormreply.com (moderated list:ARM/STM32 ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/STM32 ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Cc: dinghui@lixiang.com,
	xiasanbo@lixiang.com,
	yangchen11@lixiang.com,
	liuxuanjun@lixiang.com,
	fujiahui@lixiang.com,
	zhoujing3@lixiang.com
Subject: [PATCH net v8 1/4] net: stmmac: honor allocation flags when initializing RX buffers
Date: Thu, 19 Nov 2026 22:08:57 +0800
Message-Id: <fb64c1eec47363e697f640834e249a047ca7f58c.1795096430.git.dinghui@lixiang.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1795096430.git.dinghui@lixiang.com>
References: <cover.1795096430.git.dinghui@lixiang.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wB3Zjj_Av9qQc93Iw--.13924S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7Kw4Dtw1rZrWxWr17WrWxWFg_yoW8GrWfpa
	9rAa4j9r1kXr17Jw4DGw4xuFW3KayUKFW5uw4xGFW3ZF4xKF90qryaqFyUZr1xCr48ZFWS
	qr4jk3s8uF1UAwUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07b8FAJUUUUU=
X-CM-SenderInfo: pglqwx1xlriiqr6rljoofrz/xtbC9BRgjGr-AxQ-IwAA3S
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_061005_379992_301EE587 
X-CRM114-Status: GOOD (  11.25  )
X-Spam-Score: -1.8 (-)
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
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ding Hui <dinghui@lixiang.com>

stmmac_init_rx_buffers() accepts allocation flags but stopped using them
when RX buffers were converted to page_pool. As a result, callers passing
GFP_KERNEL still allocate with GFP_ATOMIC | __GFP_NOWARN and cannot use
reclaim to satisfy an allocation.

Use the supplied flags while retaining GFP_DMA32 for hardware without
64-bit DMA addressing. This also allows the resume path to allocate
missing RX pages with GFP_KERNEL.

Fixes: 2af6106ae949 ("net: stmmac: Introducing support for Page Pool")
Signed-off-by: Ding Hui <dinghui@lixiang.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 25894771e9e9..8bd244046195 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1689,7 +1689,7 @@ static int stmmac_init_rx_buffers(struct stmmac_priv *priv,
 {
 	struct stmmac_rx_queue *rx_q = &dma_conf->rx_queue[queue];
 	struct stmmac_rx_buffer *buf = &rx_q->buf_pool[i];
-	gfp_t gfp = (GFP_ATOMIC | __GFP_NOWARN);
+	gfp_t gfp = flags;
 
 	if (priv->dma_cap.host_dma_width <= 32)
 		gfp |= GFP_DMA32;
-- 
2.34.1


