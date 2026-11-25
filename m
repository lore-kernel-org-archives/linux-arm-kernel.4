Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63133606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 11:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ai+fvqzZ;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t4jTDD/V
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=54Q8WEaghzr0x5dXE2Tr0PsueUBDI7m/C/zlZIA9lFU=; b=Ai+fvqzZ8eEW/i+eNnU0RQOMLh
	2qXgNtoSsRUb1xnI7XFVFGrOnFKx/ISgytCvA8AXnMIyL7d9OxYNgJ7hMNF3tTYGlX7xXaXp5GO40
	rLK5oADAJPGZBx1aV90N6sDuWDbIzTidntuJ33yEoiVXDIrcNPPoiaZA09E2szAYK65oeaDzATSvq
	N02mggEq62yRQVtRRA3RTuFhU4Be4kwF7M8Qj4KeBOhCOV+jpw8s8kIz9SxkFHrj6NplpvMt3haf0
	q6fvbOJZdHZkDNT0uG775mbE7J5Nz0y7UZeC7HHUCE0gn+rx1fDvRTCrTaWW6lpNimxa3H5Qs/sn+
	ccYqXckQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWB2M-00000009Za8-2edP;
	Wed, 25 Nov 2026 11:19:42 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWB2J-00000009ZZA-4A4U
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 11:19:41 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2f04e3bf46dso40462875ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 03:19:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795605579; x=1796210379; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=54Q8WEaghzr0x5dXE2Tr0PsueUBDI7m/C/zlZIA9lFU=;
        b=t4jTDD/VpZX5JDf+KgU8/3XWorIxJfFY0bTDCez5T5LLNG34dc7cL7HIRqYpLUQbd8
         77FUsRHn+CHsPo2JhrrkPyWkHRYhJ+4y+wf+Ax+sl/Itqjuq4+m+Fhhr7C0EWZ9dNuYh
         kgleAKPBJVP1b8hqgJkWQrFu7uGcgHis+l6crEmFzxpWP0TCypC4tUvIq3c8AgJ2aAoa
         luOwrx7ksUcsu+eaDb+mfhWTUznHkhRubfQUFWu9TQDHV2/JCcwhDZShDmK5xxVDvkJk
         WtANH6XQsMEXqwD1/6LSKRRCK3sCdGoPd5VRvHrpDiRbp3d3HgFa07GJaah5/dKqzte6
         T4Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795605579; x=1796210379;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=54Q8WEaghzr0x5dXE2Tr0PsueUBDI7m/C/zlZIA9lFU=;
        b=L4MSKMvWVupigudtsNyVfpLd7o8diPogkWKXSKgI2U7W1zd0IwSVxOkWop76AJs2gy
         gdDvJANp3fAYU8xr+kW3dNnL2y/sFO54dAxtYlDzxLUUehi2kHe/zeV6Xshs7t2C4MiM
         6d2HWGbqGVg3Qstvym/t7VVzOVmWxUJ1aVrVuIeImCXoREDmwKO21olpNI+euYI3Kq4S
         GZckeEFBsoN/Te0jffmnP8M6voUjS+MXbH1Z5kuO3j5rbTYHMsq8/o1r8mXD5bIs/B/p
         6XwqyqljW5h/VqEkPYVQRkDUV14lcpsWuV4MaOi8+xGJZunPqZAYCANns8Z9vsWX5lGp
         T5lQ==
X-Forwarded-Encrypted: i=1; AL+hErEUsb7EnsbxS01aZ8UXYbuayjWnYQjFzs78qu7UfS/ddADLZr7Dc6A2PI/LFQDYT3AL249LbpE24m/FL5qVnZTF@lists.infradead.org
X-Gm-Message-State: APuU4Z9g8HJj0Ib53S/dsvfxK2vq7Rhs+m6OFR3EALJVWcsDbZWtYshV
	Nk7oAYPdH1YmD7mw7QpYueKMj6vMtnJuFXNZIKLHlGz0PfvN0w18dDFJ
X-Gm-Gg: AZFdTZdlyfgEjXBWK/Vxr3KKClHLbUfcCerjA1XjMhxCoq6gkG1cn3ssEDZPEvtUrAZ
	+K+9ogahW3YThff9NuZ2DwyWhzzDuLNf+i94TS4xvpi9cYPF8r/+b/d5x2KZ1ARurFWzY9MdEQC
	+qyLYbx7iklKw9TTAQyuSaSRAJue9m18WxeYzOS6I6kQZ8Oa03JyUwIfc407q5c6ZJ1X+4ExCW3
	NAmzzTKsKv2Uf6yEc0JUgrLykuK488JsrBB6gMBI3ve4k6uads4C90+ehcyaq2+n54g+G6IJtsB
	Sc65U1rlCQuGwblockZJCpF63rVBD+yMuFbXUs9IeecVc/TgrBWlBOoS2cPiuhJzMOc9DLJp/Je
	S4zNNOGImKZGgENZG579OHAbL+YYeJRu42QXSdbS4/khKkuqB3LbneWu/sr6rnM1z8h0yyTRMHj
	rcfeLPA/hAcP/qAfTq47DTlJIAyMBOlczyG5TNwkypm8d3gXoyu5V1qUqFZv+t/MGUL9TUsA244
	cvHtYYJF4n1LQ4BrTvHjLtUWgK75ol6bPhvEO7rhGS2emAYcbqGCNw1JM+t369JY5Pgie4K92CE
	ksCcweJbivLPWFpATVBU0HGpo7BL
X-Received: by 2002:a17:903:2a86:b0:2f0:4168:fb28 with SMTP id d9443c01a7336-2f04168fde0mr207349275ad.27.1795605578936;
        Wed, 25 Nov 2026 03:19:38 -0800 (PST)
Received: from server227.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f070a12491sm60973245ad.8.2026.11.25.03.19.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:19:38 -0800 (PST)
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
Subject: [PATCH net-next v5] net: stmmac: program the FSM timeout timer
Date: Wed, 25 Nov 2026 19:19:29 +0800
Message-Id: <20261125111929.3395740-1-zxyan0222@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_031940_039733_BE67DEFF 
X-CRM114-Status: GOOD (  23.30  )
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
TMR field (CSR clocks per 1us tic) from the CSR clock rate and using a
4s timeout.  4s is chosen because a PAUSE frame with the maximum 0xffff
quanta stalls the transmitter for about 3.36s at 10 Mb/s, and a shorter
timeout could wrongly report a flow-control stall as a stuck FSM.

The NTMRMD field holds a power-of-two microsecond timeout per the
databook: 0x0 disables it, and 0x1..0xa encode 1us, 1.024ms (~1ms),
16.384ms (~16ms), 65.536ms (~64ms), 262.144ms (~256ms), 1.048s (~1s),
4.194s (~4s), 16.777s (~16s), 33.554s (~32s), 67.108s (~64s).

The issue was hit in testing on dwmac4 and dwxgmac, where a stuck FSM was
not reported through the safety interrupt despite TMOUTEN being set.

Signed-off-by: Zxyan Zhu <zxyan0222@gmail.com>
---
v5:
- Make the dwxgmac3 timer write unconditional, matching the unconditional
  XGMAC_TMOUTEN set, so NULL-config XGMAC platforms program it too.
- Bump the hardcoded timeout from 1s to 4s to cover a 10 Mb/s PAUSE stall
  (up to ~3.36s).

v4: https://lore.kernel.org/netdev/20261118025528.2703790-1-zxyan0222@gmail.com/
v3: https://lore.kernel.org/netdev/20261116114923.1157920-1-zxyan0222@gmail.com/
v2: https://lore.kernel.org/netdev/20261112053321.1103678-1-zxyan0222@gmail.com/
v1: https://lore.kernel.org/netdev/20261111143322.2234321-1-zxyan0222@gmail.com/

 drivers/net/ethernet/stmicro/stmmac/dwmac5.c   | 17 ++++++++++++++++-
 drivers/net/ethernet/stmicro/stmmac/dwmac5.h   |  6 +++++-
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h |  3 +++
 .../ethernet/stmicro/stmmac/dwxgmac2_core.c    | 18 +++++++++++++++++-
 drivers/net/ethernet/stmicro/stmmac/hwif.h     |  3 ++-
 .../net/ethernet/stmicro/stmmac/stmmac_main.c  |  8 +++++++-
 include/linux/stmmac.h                         | 12 ++++++++++++
 7 files changed, 62 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac5.c b/drivers/net/ethernet/stmicro/stmmac/dwmac5.c
index f1bb981cab7c..37e70b82c8b5 100644
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
@@ -245,6 +247,19 @@ int dwmac5_safety_feat_config(void __iomem *ioaddr, unsigned int asp,
 		value |= TMOUTEN; /* FSM Timeout Feature */
 	writel(value, ioaddr + MAC_FSM_CONTROL);
 
+	/* Program the FSM active timer so the timeout checker actually fires.
+	 * TMR is the number of CSR clocks per 1us tic, i.e. csr_clk in MHz.
+	 * Use a 4s timeout.
+	 */
+	if (safety_feat_cfg->tmouten && csr_clk_mhz) {
+		value = readl(ioaddr + MAC_FSM_ACT_TIMER);
+		value &= ~(MAC_FSM_ACT_TIMER_NTMRMD | MAC_FSM_ACT_TIMER_TMR);
+		value |= FIELD_PREP(MAC_FSM_ACT_TIMER_NTMRMD,
+				    STMMAC_NTMRMD_4SEC) |
+			 FIELD_PREP(MAC_FSM_ACT_TIMER_TMR, csr_clk_mhz);
+		writel(value, ioaddr + MAC_FSM_ACT_TIMER);
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
index 09194b9d8322..d5bcbd6dfadf 100644
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
 
@@ -873,6 +875,20 @@ dwxgmac3_safety_feat_config(void __iomem *ioaddr, unsigned int asp,
 	value |= XGMAC_TMOUTEN; /* FSM Timeout Feature */
 	writel(value, ioaddr + XGMAC_MAC_FSM_CONTROL);
 
+	/* Program the FSM active timer so the timeout checker actually fires.
+	 * TMR is the number of CSR clocks per 1us tic, i.e. csr_clk in MHz.
+	 * Use a 4s timeout.
+	 */
+	if (csr_clk_mhz) {
+		value = readl(ioaddr + XGMAC_MAC_FSM_ACT_TIMER);
+		value &= ~(XGMAC_MAC_FSM_ACT_TIMER_NTMRMD |
+			   XGMAC_MAC_FSM_ACT_TIMER_TMR);
+		value |= FIELD_PREP(XGMAC_MAC_FSM_ACT_TIMER_NTMRMD,
+				    STMMAC_NTMRMD_4SEC) |
+			 FIELD_PREP(XGMAC_MAC_FSM_ACT_TIMER_TMR, csr_clk_mhz);
+		writel(value, ioaddr + XGMAC_MAC_FSM_ACT_TIMER);
+	}
+
 	/* 5. Enable Data Path Parity Protection */
 	value = readl(ioaddr + XGMAC_MTL_DPP_CONTROL);
 	/* already enabled by default, explicit enable it again */
diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
index 047bda5cbd92..6895ae21f918 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
@@ -380,7 +380,8 @@ struct stmmac_ops {
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
index ca4c7fb11b73..4ee4952a1427 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3707,10 +3707,16 @@ static void stmmac_mtl_configuration(struct stmmac_priv *priv)
 
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
index 00be2df63d22..659f5db528d3 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -170,6 +170,18 @@ struct stmmac_safety_feature_cfg {
 	u32 tmouten;
 };
 
+/* MAC_FSM_ACT_Timer.NTMRMD timeout durations */
+#define STMMAC_NTMRMD_1US		0x1
+#define STMMAC_NTMRMD_1MS		0x2
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


