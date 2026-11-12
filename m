Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA0BB606A324
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 05:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3odvl0ql;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gSp8i10E
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=c252PVeNh2PrNdJdZI7UG6jqVLttaOqimaOV3eONzbI=; b=3odvl0qlJXDfVGNfMMdnnOqe7z
	Mu0m/1rY+vsAg5F+J4Ce7PnSpqGLeiWWgA0D9wba7WumJAmmgjdajVH3k277G3H8Yz6iD0ZGXoGbH
	OS2DFt0ZpeOXfynZi05t7EhdbP4ebwi5iv9LP75/YJYTOy2g1ezVJksqEYQQo/+4R7cmMUcA6LPWz
	r4AVuJf9cBC38URfIFz1NGQteoLyqfgsBEoyNfESeHWMUsM82G2+jISv9Nm2sQMO4LHuD6Daey6V2
	QXP5fI6I+RGcKV7XGJEj8g7cXgzn16lsUDVVab837BMYAb73NF6I1pc5NBRd5hxbqzknxSFrGYard
	ah3Uz4dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRNRx-00000008loe-2Qhn;
	Thu, 12 Nov 2026 05:34:17 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRNRu-00000008lo0-46Uo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 05:34:16 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2ed28bac8d7so2640345ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 21:34:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794461654; x=1795066454; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=c252PVeNh2PrNdJdZI7UG6jqVLttaOqimaOV3eONzbI=;
        b=gSp8i10EhONKyLAqsFiXrYH8uskEwNXdMyx183h/YBs7IAltzq3Zjp1kslwDNdDMkj
         rn+IraZwnv3RCjzZKbytjFdCOfJgDFC2CEC4hFl16Tj2Ck7kTljtVRj5K16KsAiY2MvS
         wMnq0pNLu16fJyv1Mc5rFe5H1d64pO4/apMCwNByN1hC2qUeADPI/rc37+d6ItUFa5TA
         jjwywRxkGQb+Fh5d3jxGxLOuaAub2ZLeez+C0QZjFCtg3chwrQTkiMofYIe7jsFkKpQ+
         3Lx9l8fYJKRl9ZrrsMz9fDGTfYjbFzP1BqV3bbnj5Q6m0BeS1J7GOS7a4rK6BeW/80+3
         UERg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794461654; x=1795066454;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c252PVeNh2PrNdJdZI7UG6jqVLttaOqimaOV3eONzbI=;
        b=nuTan1Kk3sqU7VjdV+jY/CpCqsGMzOml2jgDcdFB26O5rkEn1ZxHYoseM/v/2I41zB
         v64UP4vydUIt0OLrnF51lH0Y7AdWH3ZB6l8u48WVAmxSgQKDsODA+wGHCAfuHaITtyDp
         JgqAi42bgjdmVe7FE3eE2i1E2l6zlGX8LDeLwfkJziDNzL0SV0UJ/v30kxpkwItOEOM+
         lDkWFjbGICGRKhHtZPUao5tBEOVI8WP/3sz6jNnimJP523cQ2geXB6xv5lLFx7ZS8D10
         wFLAr6xOGdSeu7oQ+9JQ3OZrTGbBjeUKq6WfJSmCtD93vVN+WzOKlFxmUjxC04aynQky
         7iYw==
X-Forwarded-Encrypted: i=1; AL+hErENl6EmjDUF/bOPBWHPujSD6mxr+5D+kD7NT6LY8znJuysMuOkE22iueXSOgjIfmCTxJX8lDD3lm5f7pjrtj6sS@lists.infradead.org
X-Gm-Message-State: APuU4Z8MISO8C3LcaGkep0phAdG4i49K/rBKBLlPvTHTWPsEO/annJP1
	7pPdVvgAWT5ye7+EiSGYJmSI1bs2V/zRm02d5u4jwQw2kcj1rB1rleof
X-Gm-Gg: AYBFou0FqM9CGrVkcF/1kSn1Gvy2waSYEj3l1tneQsRhONUBmkZyoqfdV++29HfZcuQ
	imZg5cXcfkzYoeRtxNhJje2WB5AMKCPndIiNWjA8wXXh/lFMy1aleFTlPxc3qhdu4kBKhcINe0F
	DjG3aaozFajPNSOvq/OPfb4P0fYxVjPfXEMzLo3PrduK6ZohL82LaPvuZCjryxczURMak1dhPcd
	quKYij8nXnsCVrE+I1Id0lvOQ4NR4La5KvbQU2l0EMvDApNlCcVzjgePhM/GRIASiwg6+vQTSBc
	T/DDDfGgMbSTn1PdvkJJSD0XFtR8JhzarFZ1iXkTXy/Gdc5xgw5GwmHaHUG3gkCizkm6ndi0vtb
	ZdZCj8nJLpnsBjM8Kk/C5bi6QfsFX4mb43x9G5yB097qjM1rcz5V3A2guA1mGIIsqQuKEYeBXJq
	C/AZ/eV661niXxFK3kCqXr8tv1ZVjgtWSJqJ1UVpa+ksAfdnj8lhVFFoJVOHIFU7bydzYpzERq+
	qM1R9KJCjOtykLz4+07sqkstfc3ehkq6hFL3RiSGo/ci9x7KH7Tl+cw7rQjJ5k1wlg2o090l9hf
	AJswD4nzhCxYz8AwEcLz4/zNQ0TEJHS+mfS1uJ9iMvsYg93vMw==
X-Received: by 2002:a17:903:904:b0:2ed:1fba:e5eb with SMTP id d9443c01a7336-2edf1717c66mr12328345ad.27.1794461653827;
        Wed, 11 Nov 2026 21:34:13 -0800 (PST)
Received: from server227.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ede2847f1fsm12557275ad.54.2026.11.11.21.34.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 21:34:13 -0800 (PST)
From: Zxyan Zhu <zxyan0222@gmail.com>
To: maxime.chevallier@bootlin.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: netdev@vger.kernel.org,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	rmk+kernel@armlinux.org.uk,
	Zxyan Zhu <zxyan0222@gmail.com>
Subject: [PATCH net-next v2] net: stmmac: program the FSM timeout timer
Date: Thu, 12 Nov 2026 13:33:21 +0800
Message-Id: <20261112053321.1103678-1-zxyan0222@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_213415_024637_CCB0F669 
X-CRM114-Status: GOOD (  21.74  )
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

stmmac enables the FSM timeout checker (TMOUTEN) but never programs the
MAC_FSM_ACT_Timer register.  Per the databook the checker only fires once
NTMRMD is programmed with a non-zero duration; NTMRMD == 0 disables the
timer, so with TMOUTEN set but the timer left at reset a stuck FSM is
never reported and the advertised timeout protection is ineffective.

Program MAC_FSM_ACT_Timer right after TMOUTEN is enabled, deriving the
TMR field (CSR clocks per 1us tic) from the CSR clock rate and defaulting
to a 1s timeout.  A platform can override the default through the new
ntmrmd field in stmmac_safety_feature_cfg.

The issue was hit in testing on dwmac4 and dwxgmac, where a stuck FSM was
not reported through the safety interrupt despite TMOUTEN being set.

Signed-off-by: Zxyan Zhu <zxyan0222@gmail.com>
---
v1: https://lore.kernel.org/netdev/20261111143322.2234321-1-zxyan0222@gmail.com/
v2:
- Rebased onto net-next.
- Dropped the Fixes: tags (this never worked, so it's feature completion,
  not a regression fix).
- Specified the tested hardware (dwmac4 and dwxgmac).

 drivers/net/ethernet/stmicro/stmmac/dwmac5.c  | 20 ++++++++++++++++++-
 drivers/net/ethernet/stmicro/stmmac/dwmac5.h  |  6 +++++-
 .../net/ethernet/stmicro/stmmac/dwxgmac2.h    |  3 +++
 .../ethernet/stmicro/stmmac/dwxgmac2_core.c   | 20 ++++++++++++++++++-
 drivers/net/ethernet/stmicro/stmmac/hwif.h    |  3 ++-
 .../net/ethernet/stmicro/stmmac/stmmac_main.c |  8 +++++++-
 include/linux/stmmac.h                        | 17 ++++++++++++++++
 7 files changed, 72 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac5.c b/drivers/net/ethernet/stmicro/stmmac/dwmac5.c
index f1bb981cab7c..4ab7a3df98c6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac5.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac5.c
@@ -2,6 +2,7 @@
 // Copyright (c) 2017 Synopsys, Inc. and/or its affiliates.
 // stmmac Support for 5.xx Ethernet QoS cores

+#include <linux/bitfield.h>
 #include <linux/bitops.h>
 #include <linux/iopoll.h>
 #include "common.h"
@@ -184,7 +185,8 @@ static void dwmac5_handle_dma_err(struct net_device *ndev,
 }

 int dwmac5_safety_feat_config(void __iomem *ioaddr, unsigned int asp,
-			      struct stmmac_safety_feature_cfg *safety_feat_cfg)
+			      struct stmmac_safety_feature_cfg *safety_feat_cfg,
+			      unsigned int csr_clk_mhz)
 {
 	struct stmmac_safety_feature_cfg all_safety_feats = {
 		.tsoee = 1,
@@ -245,6 +247,22 @@ int dwmac5_safety_feat_config(void __iomem *ioaddr, unsigned int asp,
 		value |= TMOUTEN; /* FSM Timeout Feature */
 	writel(value, ioaddr + MAC_FSM_CONTROL);

+	/* Program the FSM active timer so the timeout checker actually fires.
+	 * TMR is the number of CSR clocks per 1us tic, i.e. csr_clk in MHz.
+	 * Default to a 1s timeout when the platform did not select one.
+	 */
+	if (safety_feat_cfg->tmouten && csr_clk_mhz) {
+		u32 ntmrmd = safety_feat_cfg->ntmrmd;
+
+		ntmrmd = (ntmrmd >= STMMAC_NTMRMD_1US &&
+			  ntmrmd <= STMMAC_NTMRMD_64SEC) ?
+			 ntmrmd : STMMAC_NTMRMD_1SEC;
+
+		writel(FIELD_PREP(MAC_FSM_ACT_TIMER_NTMRMD, ntmrmd) |
+		       FIELD_PREP(MAC_FSM_ACT_TIMER_TMR, csr_clk_mhz),
+		       ioaddr + MAC_FSM_ACT_TIMER);
+	}
+
 	/* 4. Enable Data Parity Protection */
 	value = readl(ioaddr + MTL_DPP_CONTROL);
 	if (safety_feat_cfg->edpp)
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac5.h b/drivers/net/ethernet/stmicro/stmmac/dwmac5.h
index 00b151b3b688..734e7630f28d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac5.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac5.h
@@ -8,8 +8,11 @@
 #define MAC_DPP_FSM_INT_STATUS		0x00000140
 #define MAC_AXI_SLV_DPE_ADDR_STATUS	0x00000144
 #define MAC_FSM_CONTROL			0x00000148
+#define MAC_FSM_ACT_TIMER		0x0000014C
 #define PRTYEN				BIT(1)
 #define TMOUTEN				BIT(0)
+#define MAC_FSM_ACT_TIMER_TMR		GENMASK(9, 0)
+#define MAC_FSM_ACT_TIMER_NTMRMD	GENMASK(19, 16)

 #define MAC_PPS_CONTROL			0x00000b70
 #define PPS_MAXIDX(x)			((((x) + 1) * 8) - 1)
@@ -82,7 +85,8 @@
 #define GMAC_INT_FPE_EN			BIT(17)

 int dwmac5_safety_feat_config(void __iomem *ioaddr, unsigned int asp,
-			      struct stmmac_safety_feature_cfg *safety_cfg);
+			      struct stmmac_safety_feature_cfg *safety_cfg,
+			      unsigned int csr_clk_mhz);
 int dwmac5_safety_feat_irq_status(struct net_device *ndev,
 		void __iomem *ioaddr, unsigned int asp,
 		struct stmmac_safety_stats *stats);
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
index f8ab347f7b5b..1fd501728b18 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
@@ -169,8 +169,11 @@
 #define XGMAC_HWFEAT_PCSEL		GENMASK(1, 0)
 #define XGMAC_MAC_DPP_FSM_INT_STATUS	0x00000150
 #define XGMAC_MAC_FSM_CONTROL		0x00000158
+#define XGMAC_MAC_FSM_ACT_TIMER		0x0000015C
 #define XGMAC_PRTYEN			BIT(1)
 #define XGMAC_TMOUTEN			BIT(0)
+#define XGMAC_MAC_FSM_ACT_TIMER_TMR		GENMASK(9, 0)
+#define XGMAC_MAC_FSM_ACT_TIMER_NTMRMD		GENMASK(19, 16)
 #define XGMAC_MDIO_ADDR			0x00000200
 #define XGMAC_MDIO_DATA			0x00000204
 #define XGMAC_MDIO_C22P			0x00000220
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
index 7ad08651675e..dac85431e740 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
@@ -4,6 +4,7 @@
  * stmmac XGMAC support.
  */

+#include <linux/bitfield.h>
 #include <linux/bitrev.h>
 #include <linux/crc32.h>
 #include <linux/iopoll.h>
@@ -837,7 +838,8 @@ static void dwxgmac3_handle_dma_err(struct net_device *ndev,

 static int
 dwxgmac3_safety_feat_config(void __iomem *ioaddr, unsigned int asp,
-			    struct stmmac_safety_feature_cfg *safety_cfg)
+			    struct stmmac_safety_feature_cfg *safety_cfg,
+			    unsigned int csr_clk_mhz)
 {
 	u32 value;

@@ -873,6 +875,22 @@ dwxgmac3_safety_feat_config(void __iomem *ioaddr, unsigned int asp,
 	value |= XGMAC_TMOUTEN; /* FSM Timeout Feature */
 	writel(value, ioaddr + XGMAC_MAC_FSM_CONTROL);

+	/* Program the FSM active timer so the timeout checker actually fires.
+	 * TMR is the number of CSR clocks per 1us tic, i.e. csr_clk in MHz.
+	 * Default to a 1s timeout when the platform did not select one.
+	 */
+	if (safety_cfg && safety_cfg->tmouten && csr_clk_mhz) {
+		u32 ntmrmd = safety_cfg->ntmrmd;
+
+		ntmrmd = (ntmrmd >= STMMAC_NTMRMD_1US &&
+			  ntmrmd <= STMMAC_NTMRMD_64SEC) ?
+			 ntmrmd : STMMAC_NTMRMD_1SEC;
+
+		writel(FIELD_PREP(XGMAC_MAC_FSM_ACT_TIMER_NTMRMD, ntmrmd) |
+		       FIELD_PREP(XGMAC_MAC_FSM_ACT_TIMER_TMR, csr_clk_mhz),
+		       ioaddr + XGMAC_MAC_FSM_ACT_TIMER);
+	}
+
 	/* 5. Enable Data Path Parity Protection */
 	value = readl(ioaddr + XGMAC_MTL_DPP_CONTROL);
 	/* already enabled by default, explicit enable it again */
diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
index 8ae95e91a36a..395655b01ea8 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
@@ -378,7 +378,8 @@ struct stmmac_ops {
 			     bool srgmi_ral);
 	/* Safety Features */
 	int (*safety_feat_config)(void __iomem *ioaddr, unsigned int asp,
-				  struct stmmac_safety_feature_cfg *safety_cfg);
+				  struct stmmac_safety_feature_cfg *safety_cfg,
+				  unsigned int csr_clk_mhz);
 	int (*safety_feat_irq_status)(struct net_device *ndev,
 			void __iomem *ioaddr, unsigned int asp,
 			struct stmmac_safety_stats *stats);
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 552840d29668..1b3dd30db6dc 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3691,10 +3691,16 @@ static void stmmac_mtl_configuration(struct stmmac_priv *priv)

 static void stmmac_safety_feat_configuration(struct stmmac_priv *priv)
 {
+	unsigned int csr_clk_mhz = 0;
+
 	if (priv->dma_cap.asp) {
 		netdev_info(priv->dev, "Enabling Safety Features\n");
+		if (priv->plat->stmmac_clk)
+			csr_clk_mhz = clk_get_rate(priv->plat->stmmac_clk) /
+				      1000000;
 		stmmac_safety_feat_config(priv, priv->ioaddr, priv->dma_cap.asp,
-					  priv->plat->safety_feat_cfg);
+					  priv->plat->safety_feat_cfg,
+					  csr_clk_mhz);
 	} else {
 		netdev_info(priv->dev, "No Safety Features support found\n");
 	}
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index 00be2df63d22..cb470a153bf8 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -168,8 +168,25 @@ struct stmmac_safety_feature_cfg {
 	u32 edpp;
 	u32 prtyen;
 	u32 tmouten;
+	/* FSM normal-mode timeout value (MAC_FSM_ACT_Timer.NTMRMD). The TMR
+	 * field (CSR clocks per 1us) is derived from the CSR clock by stmmac.
+	 * 0 selects the default 1s timeout.
+	 */
+	u32 ntmrmd;
 };

+/* MAC_FSM_ACT_Timer.NTMRMD timeout durations */
+#define STMMAC_NTMRMD_1US		0x1
+#define STMMAC_NTMRMD_4MS		0x2
+#define STMMAC_NTMRMD_16MS		0x3
+#define STMMAC_NTMRMD_64MS		0x4
+#define STMMAC_NTMRMD_256MS		0x5
+#define STMMAC_NTMRMD_1SEC		0x6
+#define STMMAC_NTMRMD_4SEC		0x7
+#define STMMAC_NTMRMD_16SEC		0x8
+#define STMMAC_NTMRMD_32SEC		0x9
+#define STMMAC_NTMRMD_64SEC		0xa
+
 /* Addresses that may be customized by a platform */
 struct dwmac4_addrs {
 	u32 dma_chan;
--
2.34.1

