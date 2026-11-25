Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A98606A690
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 09:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=C3tqW/gh;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nBYAu4Fs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=alvCbm7FqE1vwmuUvfPECh4Lqbl9zN0+gRxoSYbt0tY=; b=C3tqW/ghduyGh3HdAp7ITIAwZv
	+ExMFOELcd+QJ3FiKdftMKS8NsgYfeDcJQylZD/6lhTD4oa8dwr56/34sChSvLRuJnPjDLBfoCrW+
	2squrMSHyKCFli3OQJX8GxZHoGKGLLhKy7KTwl2P4zmqShcPzqU5ZFglsKt9O8Gcsi3OqTHFPpzLE
	Y3mtdeqRjCNXoBx0omF5+rjbuAvFX1O3KkXSuOBAxt5gle1GJFjbEjHji45cT7C55igCJaStFAO5e
	XtHFSeJILewshz8NcFbJiFQINfqxAUOy2ZU502bYG5c5PhkQ2pBwK9/QowJUTJ/TEZEvdfjnXavN3
	FfmkpP5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW96X-00000009F1a-26m2;
	Wed, 25 Nov 2026 09:15:53 +0000
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW96R-00000009Ezl-187q
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 09:15:52 +0000
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-483c607ccb4so2891616fac.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 01:15:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795598145; x=1796202945; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=alvCbm7FqE1vwmuUvfPECh4Lqbl9zN0+gRxoSYbt0tY=;
        b=nBYAu4FsquWpanaQx0vPnnVOcN//EAv4yfXZn4BKG3coLv4WroHIsy+30LiHkFABvx
         ln6aAoeyscb6ZBQLDr6ux6NMJtF/ysViZSX6t5LBvXu/FcldCmzn/fRrfB3yoc+/9i2N
         ozKUf74j1LmS/sTDw89BKGqklgizHToUGvtaehnSe3VzCL8ka7+B1Tu+rUH0nQtB8PJ4
         Jg28cKecrMVpD/HRdPl6vpsH1ZaXxPAS7xTmEDG8ku34FVbiLyl3eK/DOYaJ8to+vEpT
         ArbKY8C3zdKEX7pi9upZSvZ+RdPk65QI7XVBcgVfp6iAK7jZOHx6acIDz45yWyV1cTdK
         N7Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795598145; x=1796202945;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=alvCbm7FqE1vwmuUvfPECh4Lqbl9zN0+gRxoSYbt0tY=;
        b=vwIcXpErMbZuA0X0IM+AAw0YchaDSymR4xF4bh7Ch9qSjagEq5r3a3GdrOhOKaVIQZ
         gd5FXk3uqWaAMCg9rJo/SaFvSm695abnspB5pVSTRBdo5mf37p7bOFm1PELfPXR6Z4HR
         6Z6sSovvfIti4XO/E5qh27kLLQOESlg+FltuQQWviue9WfqsxfHye0NsH1IaPav2NTeS
         kfPIbhiJ5HjB3kXqwz1eSH/JimKtx8BJIiFfB3JDMx5vRNSOX3lGk8WaIzMAsyawuTgn
         M5XgjrwLWWPfbu+22cHxcQPGVVCoSWmsua97ba47ztCMem+fFmIE+DNppbuXJJT1hvK8
         o3qA==
X-Gm-Message-State: APuU4Z91c7GEtyztl/KwnvrVC4p/nA5gKjbz9Gj2XFZd7tnHQcwqUwwA
	iabfWn9VWWWZ24kWcsEpOwwFAw1FF2c3S0ClnCt1XrZ4K51bd4xNxbma
X-Gm-Gg: AZFdTZfSu9CLJwoMFUBCWgTLtrL15np8pKu2+CliGAdeTLL12GNtMYhdYCmZ6v8qDPF
	czcZC/eT1w4nKL/k2wwdhQ9Qh2E7uo85Ky5/MGq2cfpCLPEMuQ8UCLph5RCQT9fgv686sz3WcgP
	mTms+LdnoNre4fkUeRuvxEes8vmuuIFSn7jNgWHP6nlEX0LbssTbhA3CaeUIx7Vwue4RAv0XBm6
	R7hjr4IkOIZs42SJdTdJn6XEnJM2RaRGq2ZpyKQ2oohW3QmbUHYbO4eLp4WwkyObgwSuzpK8DH+
	i4ERn3u29/Ka6vttq0NFqkaOBeVvYSatA2uVHLhfEXAU8PUhAryl68JD78na4Kcbwi6g70vMiZv
	ecrHRI26HclNE9BfWSIgcyUxfYEYHSzZJ1KmjtjN3NiopTjUJ4hEY0k2zlph14palJMEoZoOJ3V
	loNEuPYKNYMIy/yDOVXyui336RrDIm87Fl6EAvpC/TeLH9n5/RBuabE8C26D+/d5zgjBdhKgCC7
	6ntXUhMSS7R1WtcCXzgapSRR4bwlXLRhoBup8TXRoEK5kKWV+7w5hmOMjGRc09rjtkL6guSYW5R
	eDvrE4Bmxeb68X1JMyq0uTNlBrGqjxvCDh5ZHc68SOvHbkaI/dWXbnSVGsa//BBM1lAls7Mh3T4
	ULmGshh309R8ZZV/1pGHg5ZgPMMiQYLwvqtZHBbsMAvez9nWFZl2nKTupczd+8JYJqUuwI0uJLA
	OFXoh4JJh17lud68Tq2HchtlQyHSjAYUxlif5rw9K1QwxHRdGiBqWS
X-Received: by 2002:a05:6871:7a5:b0:4b9:fcff:51f8 with SMTP id 586e51a60fabf-4bc7d2763ecmr15690299fac.2.1795598145374;
        Wed, 25 Nov 2026 01:15:45 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4bc5edc52aasm17520587fac.4.2026.11.25.01.15.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 01:15:44 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 25 Nov 2026 02:14:02 -0700
Subject: [PATCH net v5] net: stmmac: preserve RX checksum capability when
 offload is disabled
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-submit-stmmac-rx-checksum-capability-v1-v5-1-5bb1a9e2cb9c@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5WSy27CMBBFfwV5XVfx286q/1GxcJwxuCWBxk4EQ
 vx7JwFVESsqeTMPnXt1x1eSYUiQSb25kgGmlNOxx0K9bUjY+34HNLVYE15xzRhTNI9NlwrNpet
 8oMOZhj2E7zx2NPiTb9IhlQudGIWotVTGWuc4QdppgJjOi9In6aGQ7b2JvC8IZdaY1/Ypl+NwW
 fxMbFn+tzQ+1PdcRy+0dQ187DqfDu/h2C2qE19zzetcjtxKueikc0FY/cwVKy6vXueK2a8DFlu
 rorDVM1euufx1rkRuYzgmELl2ql1zb/f4B/gZ8ejlcZjGZ6A4R369CcFE0GAkM6KKEJV0IK0Ux
 nGLLd0KbqSOFVl/lnrzyNX9+Rx7m2abEXwZ8eKzN8eMASu4Vc7WGNz2dvsFH8TytowCAAA=
X-Change-ID: 20261115-submit-stmmac-rx-checksum-capability-v1-ef6645788992
To: netdev@vger.kernel.org, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Giuseppe CAVALLARO <peppe.cavallaro@st.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-sunxi@lists.linux.dev, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_011550_661653_1F306116 
X-CRM114-Status: GOOD (  27.90  )
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
X-Spam-Status: No, score=-20.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Disabling RX checksum offload with ethtool and reopening the interface
can make it impossible to enable offload again. GMAC, GMAC4 and XGMAC
return the IPC enable bit after programming it. A clear bit is expected
on disable, but stmmac_hw_setup() treats it as a missing capability and
discards the detected checksum type.

Keep the detected type and pass the requested setting directly to the
MAC. Publish a nonzero checksum type only after a successful enable
readback. If the MAC rejects an enable, mask RXCSUM in subsequent
feature negotiation. Finish applying the other features in the same
request and report the resulting active mask. This lets an ethtool
request change VLAN stripping even when it cannot enable RXCSUM.

On open and resume, probe a previously failed checker before starting
reception. If it still fails, the active feature mask already reflects
that and there is nothing to report. If its availability changes, let
the network core reconcile the current request before starting RX.

Found while investigating RX checksum offload on H616. Maxime
Chevallier reproduced the capability loss on AgileX5, CycloneV and
STM32MP1.

In a host test with mocked XGMAC registers, a rejected enable left
only RXCSUM unmet and repeated resets sent no feature notifications.

Fixes: d2afb5bdffde ("stmmac: fix the rx csum feature")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes in v5:
- Base on posted Sun8i checksum-delivery v3 and retain its always-on
  checker while adding the callback's enable argument.
- Apply unrelated features in the same request when a live RX checksum
  enable fails; report the active mask to ethtool.
- Recheck a previously failed checker before RX starts. Recalculate
  features only when the checker's availability changes.
- When merging the RXALL series mentioned below, apply RXALL alongside
  VLAN stripping even if RXCSUM is refused.
- Link to v4: https://patch.msgid.link/20261122-submit-stmmac-rx-checksum-capability-v1-v4-1-b729bef2695d@gmail.com

IPC readback confirms the register state, not whether frames already in
the FIFO or ring were checked. The live NAPI and FIFO transition is
unchanged.

Changes in v4:
- Repeat feature negotiation after a reset-time RX checksum retry fails,
  so RXCSUM is masked before unrelated requested features are applied.
- Link to v3: https://patch.msgid.link/20261120-submit-stmmac-rx-checksum-capability-v1-v3-1-e9e1fd85f380@gmail.com

The sun8i checksum-delivery fix for net [0] renames the RX IPC callback.
When merging, keep its new name and body, and add the bool enable
argument from this patch. The RXALL series for net-next [1] also changes
stmmac_set_features(); apply the RXALL setting after the RX checksum
change succeeds.

[0] https://lore.kernel.org/r/20261122-submit-sun8i-rx-features-v1-v2-1-24a2564f6edf@gmail.com/
[1] https://lore.kernel.org/r/20261122-submit-sun8i-rxall-v1-v1-0-607789772c56@gmail.com/

Changes in v3:
- Check a live enable before reporting hardware-verified checksums;
  defer requests made while down to hardware setup.
- Keep a failed enable from blocking unrelated feature changes and
  recheck the saved request before RX starts on open and resume.
- Pass the requested state directly to the MAC and document the
  callback's return value.
- Link to v2: https://patch.msgid.link/20261117-submit-stmmac-rx-checksum-capability-v1-v2-1-059f9499c386@gmail.com

Changes in v2:
- Correct the Fixes tag to reference the mainline commit.
- Add Maxime Chevallier's Reviewed-by and Tested-by tags.
- Include the discovery and hardware confirmation context.
- Link to v1: https://patch.msgid.link/20261115-submit-stmmac-rx-checksum-capability-v1-v1-1-ea26fa3689be@gmail.com
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c  |   2 +-
 .../net/ethernet/stmicro/stmmac/dwmac1000_core.c   |   4 +-
 .../net/ethernet/stmicro/stmmac/dwmac100_core.c    |   2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c  |   4 +-
 .../net/ethernet/stmicro/stmmac/dwxgmac2_core.c    |   4 +-
 drivers/net/ethernet/stmicro/stmmac/hwif.h         |   4 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac.h       |   1 +
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  | 118 ++++++++++++++-------
 8 files changed, 90 insertions(+), 49 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
index 0ad2203f76c3..ca1183b3a454 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
@@ -703,7 +703,7 @@ static void sun8i_dwmac_get_umac_addr(struct mac_device_info *hw,
 			    EMAC_MACADDR_LO(reg_n));
 }
 
-static int sun8i_dwmac_rx_ipc(struct mac_device_info *hw)
+static int sun8i_dwmac_rx_ipc(struct mac_device_info *hw, bool enable)
 {
 	/* The receiver always records the checksum result, even with RXCSUM off. */
 	return 1;
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
index 66337cfd9824..767836e75a10 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
@@ -77,12 +77,12 @@ static void dwmac1000_irq_modify(struct mac_device_info *hw, u32 disable,
 	spin_unlock_irqrestore(&hw->irq_ctrl_lock, flags);
 }
 
-static int dwmac1000_rx_ipc_enable(struct mac_device_info *hw)
+static int dwmac1000_rx_ipc_enable(struct mac_device_info *hw, bool enable)
 {
 	void __iomem *ioaddr = hw->pcsr;
 	u32 value = readl(ioaddr + GMAC_CONTROL);
 
-	if (hw->rx_csum)
+	if (enable)
 		value |= GMAC_CONTROL_IPC;
 	else
 		value &= ~GMAC_CONTROL_IPC;
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac100_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac100_core.c
index 94d24d355d95..e9492a853c0d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac100_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac100_core.c
@@ -48,7 +48,7 @@ static void dwmac100_dump_mac_regs(struct mac_device_info *hw, u32 *reg_space)
 	reg_space[MAC_VLAN2 / 4] = readl(ioaddr + MAC_VLAN2);
 }
 
-static int dwmac100_rx_ipc_enable(struct mac_device_info *hw)
+static int dwmac100_rx_ipc_enable(struct mac_device_info *hw, bool enable)
 {
 	return 0;
 }
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
index 259e2ebed8c1..87b25b3d9c3b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
@@ -329,12 +329,12 @@ static void dwmac4_dump_regs(struct mac_device_info *hw, u32 *reg_space)
 		reg_space[i] = readl(ioaddr + i * 4);
 }
 
-static int dwmac4_rx_ipc_enable(struct mac_device_info *hw)
+static int dwmac4_rx_ipc_enable(struct mac_device_info *hw, bool enable)
 {
 	void __iomem *ioaddr = hw->pcsr;
 	u32 value = readl(ioaddr + GMAC_CONFIG);
 
-	if (hw->rx_csum)
+	if (enable)
 		value |= GMAC_CONFIG_IPC;
 	else
 		value &= ~GMAC_CONFIG_IPC;
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
index 6b2bfc241109..e76294120bbb 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
@@ -65,13 +65,13 @@ static void dwxgmac2_set_mac(void __iomem *ioaddr, bool enable)
 	writel(rx, ioaddr + XGMAC_RX_CONFIG);
 }
 
-static int dwxgmac2_rx_ipc(struct mac_device_info *hw)
+static int dwxgmac2_rx_ipc(struct mac_device_info *hw, bool enable)
 {
 	void __iomem *ioaddr = hw->pcsr;
 	u32 value;
 
 	value = readl(ioaddr + XGMAC_RX_CONFIG);
-	if (hw->rx_csum)
+	if (enable)
 		value |= XGMAC_CONFIG_IPC;
 	else
 		value &= ~XGMAC_CONFIG_IPC;
diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
index 047d809b8b88..538ab74ca388 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
@@ -317,8 +317,8 @@ struct stmmac_ops {
 	void (*irq_modify)(struct mac_device_info *hw, u32 disable, u32 enable);
 	/* Enable the MAC RX/TX */
 	void (*set_mac)(void __iomem *ioaddr, bool enable);
-	/* Enable and verify that the IPC module is supported */
-	int (*rx_ipc)(struct mac_device_info *hw);
+	/* Configure RX checksum offload and return whether the checker is enabled. */
+	int (*rx_ipc)(struct mac_device_info *hw, bool enable);
 	/* Enable RX Queues */
 	void (*rx_queue_enable)(struct mac_device_info *hw, u8 mode, u32 queue);
 	/* RX Queues Priority */
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index b76acfe0d958..042a78ebbee4 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -269,6 +269,7 @@ struct stmmac_priv {
 	bool tx_path_in_lpi_mode;
 	bool sph_active;
 	bool sph_capable;
+	bool rx_csum_failed;
 	u32 sarc_type;
 	u32 rx_riwt[MTL_MAX_RX_QUEUES];
 	u32 tx_threshold[MTL_MAX_TX_QUEUES];
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 20e9aa7b14f5..87d3905b59e4 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3675,25 +3675,51 @@ static bool stmmac_tso_channel_permitted(struct stmmac_priv *priv,
 	return !(priv->dma_conf.tx_queue[chan].tbs & STMMAC_TBS_AVAIL);
 }
 
+static void stmmac_set_rx_csum(struct stmmac_priv *priv, unsigned int rx_csum)
+{
+	if (!rx_csum) {
+		WRITE_ONCE(priv->hw->rx_csum, 0);
+		stmmac_rx_ipc(priv, priv->hw, false);
+		return;
+	}
+
+	if (stmmac_rx_ipc(priv, priv->hw, true) <= 0) {
+		netdev_warn(priv->dev, "RX IPC Checksum Offload disabled\n");
+		priv->rx_csum_failed = true;
+		rx_csum = 0;
+	}
+	WRITE_ONCE(priv->hw->rx_csum, rx_csum);
+}
+
+/* Recheck the wanted features if this reset clears or uncovers a failure. */
+static bool stmmac_init_rx_csum(struct net_device *dev)
+{
+	struct stmmac_priv *priv = netdev_priv(dev);
+	bool was_failed = priv->rx_csum_failed;
+	unsigned int rx_csum;
+
+	/* Probe a previously rejected enable while RX is stopped. If it
+	 * still fails, the active features already describe the hardware.
+	 */
+	if (was_failed && stmmac_rx_ipc(priv, priv->hw, true) <= 0)
+		return false;
+
+	priv->rx_csum_failed = false;
+	rx_csum = dev->features & NETIF_F_RXCSUM ? priv->plat->rx_coe : 0;
+	stmmac_set_rx_csum(priv, rx_csum);
+
+	return was_failed != priv->rx_csum_failed;
+}
+
 /**
- * stmmac_hw_setup - setup mac in a usable state.
- *  @dev : pointer to the device structure.
- *  Description:
- *  this is the main function to setup the HW in a usable state because the
- *  dma engine is reset, the core registers are configured (e.g. AXI,
- *  Checksum features, timers). The DMA is ready to start receiving and
- *  transmitting.
- *  Return value:
- *  0 on success and an appropriate (-)ve integer as defined in errno.h
- *  file on failure.
+ * stmmac_hw_setup - reset and configure the MAC before starting RX/TX
+ * @dev: network device
+ *
+ * Return: 0 on success or a negative error on failure.
  */
 static int stmmac_hw_setup(struct net_device *dev)
 {
 	struct stmmac_priv *priv = netdev_priv(dev);
-	u8 rx_cnt = priv->plat->rx_queues_to_use;
-	u8 tx_cnt = priv->plat->tx_queues_to_use;
-	bool sph_en;
-	u8 chan;
 	int ret;
 
 	/* Make sure RX clock is enabled */
@@ -3738,12 +3764,16 @@ static int stmmac_hw_setup(struct net_device *dev)
 	/* Initialize Safety Features */
 	stmmac_safety_feat_configuration(priv);
 
-	ret = stmmac_rx_ipc(priv, priv->hw);
-	if (!ret) {
-		netdev_warn(priv->dev, "RX IPC Checksum Offload disabled\n");
-		priv->plat->rx_coe = STMMAC_RX_COE_NONE;
-		priv->hw->rx_csum = 0;
-	}
+	return 0;
+}
+
+static void stmmac_hw_start(struct net_device *dev)
+{
+	struct stmmac_priv *priv = netdev_priv(dev);
+	u8 rx_cnt = priv->plat->rx_queues_to_use;
+	u8 tx_cnt = priv->plat->tx_queues_to_use;
+	bool sph_en;
+	u8 chan;
 
 	/* Enable the MAC Rx/Tx */
 	stmmac_mac_set(priv, priv->ioaddr, true);
@@ -3806,8 +3836,6 @@ static int stmmac_hw_setup(struct net_device *dev)
 	phylink_rx_clk_stop_block(priv->phylink);
 	stmmac_set_hw_vlan_mode(priv, priv->hw);
 	phylink_rx_clk_stop_unblock(priv->phylink);
-
-	return 0;
 }
 
 static void stmmac_free_irq(struct net_device *dev,
@@ -4216,6 +4244,9 @@ static int __stmmac_open(struct net_device *dev,
 		netdev_err(priv->dev, "%s: Hw setup failed\n", __func__);
 		return ret;
 	}
+	if (stmmac_init_rx_csum(dev))
+		netdev_update_features(dev);
+	stmmac_hw_start(dev);
 
 	ret = stmmac_setup_ptp(priv);
 	if (ret)
@@ -5233,7 +5264,7 @@ static unsigned int stmmac_rx_buf1_len(struct stmmac_priv *priv,
 				       int status, unsigned int len)
 {
 	unsigned int plen = 0, hlen = 0;
-	int coe = priv->hw->rx_csum;
+	int coe = READ_ONCE(priv->hw->rx_csum);
 
 	/* Not first descriptor, SPH enabled: buffer1 only carries the
 	 * split header of the first descriptor, so it is zero here.
@@ -5264,7 +5295,7 @@ static unsigned int stmmac_rx_buf2_len(struct stmmac_priv *priv,
 				       struct dma_desc *p,
 				       int status, unsigned int len)
 {
-	int coe = priv->hw->rx_csum;
+	int coe = READ_ONCE(priv->hw->rx_csum);
 	unsigned int plen = 0;
 
 	if (!stmmac_rx_check_buf2_cap(priv))
@@ -5569,7 +5600,7 @@ static void stmmac_dispatch_skb_zc(struct stmmac_priv *priv, u32 queue,
 	struct stmmac_channel *ch = &priv->channel[queue];
 	unsigned int len = xdp->data_end - xdp->data;
 	enum pkt_hash_types hash_type;
-	int coe = priv->hw->rx_csum;
+	int coe = READ_ONCE(priv->hw->rx_csum);
 	struct sk_buff *skb;
 	u32 hash;
 
@@ -5872,7 +5903,7 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 	unsigned int next_entry = rx_q->cur_rx;
 	bool in_progress = rx_q->state_saved;
 	enum dma_data_direction dma_dir;
-	int coe = priv->hw->rx_csum;
+	int coe = READ_ONCE(priv->hw->rx_csum);
 	unsigned int desc_size;
 	struct sk_buff *skb = NULL;
 	struct stmmac_xdp_buff ctx;
@@ -6372,7 +6403,7 @@ static netdev_features_t stmmac_fix_features(struct net_device *dev,
 {
 	struct stmmac_priv *priv = netdev_priv(dev);
 
-	if (priv->plat->rx_coe == STMMAC_RX_COE_NONE)
+	if (!priv->plat->rx_coe || priv->rx_csum_failed)
 		features &= ~NETIF_F_RXCSUM;
 
 	if (!priv->plat->tx_coe)
@@ -6400,18 +6431,14 @@ static int stmmac_set_features(struct net_device *netdev,
 			       netdev_features_t features)
 {
 	struct stmmac_priv *priv = netdev_priv(netdev);
+	bool running = netif_running(netdev);
+	unsigned int rx_csum;
 
-	/* Keep the COE Type in case of csum is supporting */
-	if (features & NETIF_F_RXCSUM)
-		priv->hw->rx_csum = priv->plat->rx_coe;
-	else
-		priv->hw->rx_csum = 0;
-	/* No check needed because rx_coe has been set before and it will be
-	 * fixed in case of issue.
-	 */
-	stmmac_rx_ipc(priv, priv->hw);
+	rx_csum = features & NETIF_F_RXCSUM ? priv->plat->rx_coe : 0;
+	if (running && rx_csum != priv->hw->rx_csum)
+		stmmac_set_rx_csum(priv, rx_csum);
 
-	if (priv->sph_capable) {
+	if (running && priv->sph_capable) {
 		bool sph_en = (priv->hw->rx_csum > 0) && priv->sph_active;
 		u8 chan;
 
@@ -6428,6 +6455,14 @@ static int stmmac_set_features(struct net_device *netdev,
 	stmmac_set_hw_vlan_mode(priv, priv->hw);
 	phylink_rx_clk_stop_unblock(priv->phylink);
 
+	if (rx_csum && priv->rx_csum_failed) {
+		/* Only the RX checksum enable failed. Report all the other
+		 * changes to the core as part of this same feature request.
+		 */
+		netdev->features = features & ~NETIF_F_RXCSUM;
+		return 1;
+	}
+
 	return 0;
 }
 
@@ -7650,10 +7685,9 @@ static int stmmac_hw_init(struct stmmac_priv *priv)
 	}
 
 	if (priv->plat->rx_coe) {
-		priv->hw->rx_csum = priv->plat->rx_coe;
 		dev_info(priv->device, "RX Checksum Offload Engine supported\n");
 		if (priv->synopsys_id < DWMAC_CORE_4_00)
-			dev_info(priv->device, "COE Type %d\n", priv->hw->rx_csum);
+			dev_info(priv->device, "COE Type %d\n", priv->plat->rx_coe);
 	}
 	if (priv->plat->tx_coe)
 		dev_info(priv->device, "TX Checksum insertion supported\n");
@@ -8578,6 +8612,12 @@ int stmmac_resume(struct device *dev)
 		netdev_err(priv->dev, "%s: Hw setup failed\n", __func__);
 		goto error_unlock;
 	}
+	if (stmmac_init_rx_csum(ndev)) {
+		mutex_unlock(&priv->lock);
+		netdev_update_features(ndev);
+		mutex_lock(&priv->lock);
+	}
+	stmmac_hw_start(ndev);
 
 	if (priv->ptp_enabled) {
 		if (stmmac_init_ptp_clk_freq(priv))

---
base-commit: cc7fe6e741730fef549e484379281736d32746f0
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net.git main
change-id: 20261115-submit-stmmac-rx-checksum-capability-v1-ef6645788992
prerequisite-change-id: 20261119-submit-sun8i-rx-features-v1-9177e8328598:v3
prerequisite-patch-id: cfcd83b1605af3856aff1188ef7bdbdbfc19cce0

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


