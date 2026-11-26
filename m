Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D573E606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 11:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3kuCb72u;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D6LYF4t2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=iw5DmtVmR75qQzOUUrXqOsqyPHxhpZ76b2+0SQwU8h4=; b=3kuCb72uT6H1C6/aTy5pX3LdJO
	tTB4hLkREuEkSXpmpWo/0/dHFkZU9QHdcMcqZDLDGaFJrycmi+6BKL0fg9x6ImnGSxVyxYoKsgjkA
	bwg9+9vDqqfvIpJDygcOQg27xbP562AeHv5O25zfxinHvGbmu0HJtSQublLpbDEMFey7kjRBxtIZT
	rN/KGPJPwB4xdMoF+SQdh0Upl4+rGhCx0uHrMwezxriaxu8CCwJgzpoNd5CBz8qHVeKW/GV9qAIRl
	2F+y3E05iav7JlP4/h+3zJFA4F7c9/kmw5egvRgc0S2LFHS4zAx/n8Uq/dqidwksim9REilD2MTr5
	Ffewg/Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWY8J-0000000D5s5-1WDE;
	Thu, 26 Nov 2026 11:59:23 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWY8G-0000000D5rN-2Hq0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 11:59:22 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-cde84cb8803so1821191a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 03:59:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795694360; x=1796299160; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iw5DmtVmR75qQzOUUrXqOsqyPHxhpZ76b2+0SQwU8h4=;
        b=D6LYF4t2TnuEvUvR3MjNf8Cz/04EbJzrxIloS0clXNEmqpeGDzO+tsIAXgau+Dng/t
         hUBA+DQBwUAuwxuckanqou5KLs/cfH4fio/SZGbyM0uyO/FW6rBaW5eocq44wkFiRLUQ
         9g0DDxTFqCufqXg9aoTuWZR7KrpP9vwD0ttM2X2AduOYdp2x+6y+cVdSOHN0Qu1YxY6B
         Gwgvo5jorANU5Bxa7TG2q1oY6JJOCxnz91Mj/7ZQ7MCPTEVOjdastTugF6L/K1gXl5J7
         QCrNRnWS4azWcrXNhG6N3R3QwlbRYZIpnn/0TNG0BZb5VRQaFlvZvfGFlJS7BqDLr16q
         Xyjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795694360; x=1796299160;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iw5DmtVmR75qQzOUUrXqOsqyPHxhpZ76b2+0SQwU8h4=;
        b=ftOA1VuazOfF4gChSAriT0kK9gEIchMCF9C3eawLMk6OQHDyk6L5vjuZL4QsFeeAJY
         gQRuZopQeyFPtqn+A/DxvyWJzaC9kXiku0GvEeqZJlN+q87bP8S9Hm/qviCsBGudqVsc
         +tz6Lul1sEKEBtjT5lNz15vPygu+pW+CPUKMP+7D2JsMUf8SSaNvsumrgm/qahOb8wbX
         rvvN/s0j/7xkR6czi1IbtESrkVkUWRagEwjSWM17DdknNJb7paEJZ2avuvW8e6Djxo5U
         ORk+rN8+Bmn0ffYIFDd2TSOKhDHXwUbyUGzplGdyU+0QKNQmrIQgv6DkmTi+aPOkOAJA
         Xgpw==
X-Forwarded-Encrypted: i=1; AL+hErGKD4ljm3mlF/Pk/KtE++SM+JzI5LgQohMk0yrhpg3qElHQB/BwNnvUvt/WUuiCjCCgA+sx/qfmBkXsQ8ylnlCc@lists.infradead.org
X-Gm-Message-State: APuU4Z8boMzoUbi5h4E3DkfA3aQpZGRALVpMOS24gWk+ys2wYDW7rCC3
	Y/q3CHJP+aUhZ+H0VsEFgSB85aUvg5U3obTGNPZg1DGCFPWds4TJiRkk
X-Gm-Gg: AZFdTZdRs3R+/NQJIcRyO/o36ygKcwWkMj2xgDmwdnejBK46MeuGkXF8jU9gbRgmglt
	Bou3PUftwOqXc78lzj3vTfOUNOIwAep0A42+dqMiC4bNm2ZNzXP3eWt3i8uEnRoTXV55i69Xze0
	BkOdZQMpITBThTzkqgt+gNAi2gouQ7TJM7SAxsMfOylvmXM8t6AP+dhI9und686mMK4vxAoI9yC
	zhuuEwMVbAB1fTGzk+5mBQLEgkGlFKTr2NOhJuiPMtUyw6XGgT/w1QRrsDKqq4yC8aZbTbp9pr/
	QyjpEdKGtTvcmOhXqOPTfwZmr27MQaNbe+rBW0DloMi/zvoSekIReg471fty8Q5AK9eara6E9F8
	QxprnDB+n4URr18/6dwn8d0hvhu3aibg8I998ToqWuOxefjJekL4NycfaXQ0hvrLUENzBzbEzPd
	XAi4MNd+vPbUQbPagdHusPUYpCUOCxGXyMN8IG5Twn0n5gf9snXJOIcJ3C40eIVMTy1oZ3iXb74
	kGEupSOPY+wl8gpz+en7zRDbZ1udmZbJpSUqVbWrARrRkwqfZu10moCx66b8Oif23PKlj90OPkZ
	j+TSqjcKksxU+nq4TVMknAzCLaXm
X-Received: by 2002:a17:90a:d2c7:b0:3b4:1a5f:8664 with SMTP id 98e67ed59e1d1-3b41c97aaa0mr18247870a91.65.1795694359616;
        Thu, 26 Nov 2026 03:59:19 -0800 (PST)
Received: from server227.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b6fc28asm15666484a91.1.2026.11.26.03.59.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 03:59:19 -0800 (PST)
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
Subject: [PATCH net-next v6] net: stmmac: program the FSM timeout timer
Date: Thu, 26 Nov 2026 19:59:12 +0800
Message-Id: <20261126115912.3145086-1-zxyan0222@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_035920_592285_8931830E 
X-CRM114-Status: GOOD (  22.19  )
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
Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
v6:
- Move the STMMAC_NTMRMD_* encodings from include/linux/stmmac.h to the
  driver's common.h, and add Maxime's Reviewed-by.

v5: https://lore.kernel.org/netdev/20261125111929.3395740-1-zxyan0222@gmail.com/
v4: https://lore.kernel.org/netdev/20261118025528.2703790-1-zxyan0222@gmail.com/
v3: https://lore.kernel.org/netdev/20261116114923.1157920-1-zxyan0222@gmail.com/
v2: https://lore.kernel.org/netdev/20261112053321.1103678-1-zxyan0222@gmail.com/
v1: https://lore.kernel.org/netdev/20261111143322.2234321-1-zxyan0222@gmail.com/

 drivers/net/ethernet/stmicro/stmmac/common.h   | 12 ++++++++++++
 drivers/net/ethernet/stmicro/stmmac/dwmac5.c   | 17 ++++++++++++++++-
 drivers/net/ethernet/stmicro/stmmac/dwmac5.h   |  6 +++++-
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h |  3 +++
 .../ethernet/stmicro/stmmac/dwxgmac2_core.c    | 18 +++++++++++++++++-
 drivers/net/ethernet/stmicro/stmmac/hwif.h     |  3 ++-
 .../net/ethernet/stmicro/stmmac/stmmac_main.c  |  8 +++++++-
 7 files changed, 62 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/common.h b/drivers/net/ethernet/stmicro/stmmac/common.h
index a972bee66504..17cc0dc7e79d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/common.h
+++ b/drivers/net/ethernet/stmicro/stmmac/common.h
@@ -268,6 +268,18 @@ struct stmmac_safety_stats {
 
 #define	MAC_CSR_H_FRQ_MASK	0x20
 
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
 #define HASH_TABLE_SIZE 64
 #define PAUSE_TIME 0xffff
 
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
-- 
2.34.1


