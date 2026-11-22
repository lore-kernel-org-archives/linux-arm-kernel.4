Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CEAE606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 08:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UcgCnaOc;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x9elYPAl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=SR1QHOHLnA6O+j3b87UO0XVNyCNb+8YNztvTvFnfbDI=; b=UcgCnaOcMKN+vKamhHYR6TEqEI
	0VjXPU7VqidRgJuz6XZRnK7qA4U+ldI+gWflRZg9K1leeog5zoIwYtIng+1z5MpIUBeDambLLaPYb
	xy1OUisXHv4GJ7TNZhGuf979niJJ836Is1q6PLWuDaeWZdmP7APQTSdRYbpb54So6oiL3G3xp1aXq
	P1OPEim2rXYCLnNstygHQVx/7qpRu+8ITBFAR5D4ItNPnjpPIU6dLDGhSKs2lQcEqo7sEz+jWTc/z
	Cb+sMkWOH93SKyUIAllOv9sLxUbu0+tI+zM+NI47oYN0dmwEoF3YquuIgcilA4mXjO3jmhSCjuO0L
	ZJYxi5tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV2gA-00000000qxO-3dbo;
	Sun, 22 Nov 2026 08:12:06 +0000
Received: from mail-oo1-xc2a.google.com ([2607:f8b0:4864:20::c2a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV2g7-00000000qx2-3UNH
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 08:12:05 +0000
Received: by mail-oo1-xc2a.google.com with SMTP id 006d021491bc7-71acdd32a53so927777eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 00:12:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795335123; x=1795939923; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SR1QHOHLnA6O+j3b87UO0XVNyCNb+8YNztvTvFnfbDI=;
        b=x9elYPAl10LrFn3aqAg0lbZOsXQoGDq+c3qv7Nhc6RhuvSR7E1rvOeH6bT7Nohh2Ll
         5mtoGGs6lOiTZeMCtgYJgoTlK7v8EDE6lQWZLaCACY6/ZoLa8zAqAVhyp59sj3i7WHv/
         t64bU0N6dkQ83yHXy1ggLo1om3iumwYUd+Ke+5/0I/F63mplvxEnqTBbcodPoktub8D/
         gBiV5Y6G+YtCl61CJmaURJAI1+XEZB8BIqmefW363MvmVEhpxR0vcLItYn9z0lxsFXzA
         Cmq6d9bdpZWS5THOQxjSFVqac8KAk6fx6tf/NeYYwwRgvXGzWSMY2pE8jyMeY6Dw2cHo
         1JCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795335123; x=1795939923;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=SR1QHOHLnA6O+j3b87UO0XVNyCNb+8YNztvTvFnfbDI=;
        b=Sr8FK66ud7TO1BBOkqZ1u/L4MhGB1s1dtJ/Pjo2BY53EOGB2I4Tw4mdwRoT4yeWCKE
         yNHGWvUwpSVVAM5zYHPG7Ml6YJtksCgwKJC/3D3oaAu6TOGTXu7e9hXwr2LJyM7Z+y9I
         OVL6bfBbyW+m1v2BwLxyJF9deJz5Ovwy9e3Kn4fIXAim7zA8Cicg3eexe1lFfTHG9gyw
         02e8LYWuLhLcQ3KL8eJFUpcnmjNdsAp231A/fObfJNrZvDZTamRkaIdLhIxvLShyNO9o
         GKenxosNaJ1cOoGWJgxSHoa0c2oWvIKjcVXR0RBYca2JAmL0pBiWGlML4KB/arfWwQsq
         ePxQ==
X-Gm-Message-State: APuU4Z/zGbDTG0icZmLEe8gVcFuwUDueH5MeV4XZkc1Cpm2ij8B1Pvuc
	rlfBgkE45JIaG2S8j/5pq+1/M8pUOXlm4rmxOe73sSXH+YgWrQe/CVK+
X-Gm-Gg: AZFdTZe7GGTAY34bNnte4DD/4v6h6vD/pU2DZE41RdZqoiRrWlXg//lFSodHvoGiJbM
	AGksADduz2/ryE80FBBnaA+7aeFtTJcLFtU0SOYncV2OSAdGk1isvGlfyga9rFJ8iqGkMhw01ac
	X11OFQbbMs1zomL/B19MHQcwsdv4nuLfhTGQyobzmNN56EAMe3c0iUKqFnzKz+3pKVZvwBkqDsh
	Tf/Nnh9J1GsJxEIsWnvSBPFSQCltQasJgPZIiqFR1jYImW79XP+yJ2oqxpDyNF4fKaUUmqy+oeE
	rW4MPLvdLNvYEM9yCtqMBZ4EwnIl/RFFhVwTYSdMW/Ky7qEWvrl2kSk3lXMXbg16aGlB6Pvd+6Z
	ABVlPudo3IwODRSBK27COx6+UeZF3KWk9WRQnQeK9Rp8EoacjwA6L1hJzwXUBj69S0SEs+KlMCx
	SDzJquYZ83nudL8+QZ2KjY9bgjC6GMSamoAeWyG/hT6PXIW037jdwa4WEO4ejHgS87nmacULOD4
	ANeqUbjBPNnioAgpTvjJkzeTwqw0YAgdPB8msShSVIfILNlMgqMFGFelCuPfNo+Rf4RjEa5KDPM
	K5lTpTUhUzZX+GdA7INkOewcyOku9jrP20uLRJ9FJbmwitew90h6twb1/BLlj3KzTHOo5yx8KeQ
	faTzM3bS1WQ9sRwDVX40HJOZcgKOlClVPPCMd79in5RVck7v/Va+giVmq4jKycGMDA5dt5p2z8q
	8sDmdCDPaB3hFMxMdKNNmbemvCh0y9YSkxBQv200PYpBMK0ffhZmJvJ1N07n3Tf2QKo24btlyh
X-Received: by 2002:a05:6820:a098:b0:71a:de33:922c with SMTP id 006d021491bc7-71b394b4a81mr4884048eaf.45.1795335122136;
        Sun, 22 Nov 2026 00:12:02 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b38058102sm4871236eaf.6.2026.11.22.00.12.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 00:12:01 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 22 Nov 2026 01:11:31 -0700
Subject: [PATCH net v4] net: stmmac: preserve RX checksum capability when
 offload is disabled
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261122-submit-stmmac-rx-checksum-capability-v1-v4-1-b729bef2695d@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5XOsQ7CIBCA4VcxzGIKtAhOvodxoHjYU2kbwEZj+
 u7SujROmrAcuXz/vUiEgBDJbvUiAQaM2LV5KNcrYhvTnoHiKc+EF1wyxioa77XHRGPy3lgaHtQ
 2YK/x7qk1vanxhulJB0bBSVlWW6W05iRrfQCHj7l0IC0kcvx8Zu8CNk2Naa3BmLrwnO8Z2Lz8d
 zq/3DdcOiOk0jXsz97gbWM7P1cHvnS3v7s8u0WlnS61tkLJb1csXF787orpXg3MnVTlhCqW7ji
 Ob3lYyBClAQAA
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
X-CRM114-CacheID: sfid-20261122_001204_067805_F34F7611 
X-CRM114-Status: GOOD (  27.40  )
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
MAC. Check the result of an enable before allowing RX to mark packets
CHECKSUM_UNNECESSARY, including when the checker is first enabled on a
running interface.

If the MAC fails to enable the checker, mask RXCSUM in feature
negotiation until the next MAC reset. This leaves unrelated changes,
such as VLAN stripping, available even when RXCSUM is still requested.
On open and resume, reconcile the active features before starting RX
so ethtool reports a failed enable as off and a reset can restore
offload if it is still wanted.

Found while investigating RX checksum offload on H616. Maxime
Chevallier reproduced the capability loss on AgileX5, CycloneV and
STM32MP1.

A host test with mocked MAC registers confirmed that RX checksum offload
could be re-enabled after opening the interface with offload disabled.
When the mock rejected checksum enable, a pending VLAN stripping request
remained unapplied on open and resume without the second feature update.
With the fix, both paths enabled VLAN stripping and left RXCSUM off.

Fixes: d2afb5bdffde3 ("stmmac: fix the rx csum feature")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
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
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  | 119 ++++++++++++++-------
 8 files changed, 91 insertions(+), 49 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
index 2ece7ba9dd73..d7dd6c5d95d4 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
@@ -699,7 +699,7 @@ static void sun8i_dwmac_get_umac_addr(struct mac_device_info *hw,
 }
 
 /* caution this function must return non 0 to work */
-static int sun8i_dwmac_rx_ipc_enable(struct mac_device_info *hw)
+static int sun8i_dwmac_rx_ipc_enable(struct mac_device_info *hw, bool enable)
 {
 	void __iomem *ioaddr = hw->pcsr;
 	u32 v;
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
index 8ae95e91a36a..e7eeaa83acfb 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
@@ -319,8 +319,8 @@ struct stmmac_ops {
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
index a685ce4638f6..739c6aca447e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3675,25 +3675,51 @@ static bool stmmac_tso_channel_permitted(struct stmmac_priv *priv,
 	return !(priv->dma_conf.tx_queue[chan].tbs & STMMAC_TBS_AVAIL);
 }
 
+static int stmmac_set_rx_csum(struct stmmac_priv *priv, unsigned int rx_csum)
+{
+	int ret;
+
+	if (!rx_csum) {
+		WRITE_ONCE(priv->hw->rx_csum, 0);
+		stmmac_rx_ipc(priv, priv->hw, false);
+		return 0;
+	}
+
+	ret = stmmac_rx_ipc(priv, priv->hw, true);
+	if (ret <= 0) {
+		WRITE_ONCE(priv->hw->rx_csum, 0);
+		priv->rx_csum_failed = true;
+		return ret ?: -EIO;
+	}
+
+	WRITE_ONCE(priv->hw->rx_csum, rx_csum);
+	return 0;
+}
+
+/* Recheck the wanted features if this reset clears or uncovers a failure. */
+static bool stmmac_init_rx_csum(struct net_device *dev)
+{
+	struct stmmac_priv *priv = netdev_priv(dev);
+	bool was_failed = priv->rx_csum_failed;
+	unsigned int rx_csum;
+
+	priv->rx_csum_failed = false;
+	rx_csum = dev->features & NETIF_F_RXCSUM ? priv->plat->rx_coe : 0;
+	if (stmmac_set_rx_csum(priv, rx_csum))
+		netdev_warn(dev, "RX IPC Checksum Offload disabled\n");
+
+	return was_failed || priv->rx_csum_failed;
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
@@ -4216,6 +4244,12 @@ static int __stmmac_open(struct net_device *dev,
 		netdev_err(priv->dev, "%s: Hw setup failed\n", __func__);
 		return ret;
 	}
+	if (stmmac_init_rx_csum(dev)) {
+		netdev_update_features(dev);
+		if (priv->rx_csum_failed)
+			netdev_update_features(dev);
+	}
+	stmmac_hw_start(dev);
 
 	ret = stmmac_setup_ptp(priv);
 	if (ret)
@@ -5233,7 +5267,7 @@ static unsigned int stmmac_rx_buf1_len(struct stmmac_priv *priv,
 				       int status, unsigned int len)
 {
 	unsigned int plen = 0, hlen = 0;
-	int coe = priv->hw->rx_csum;
+	int coe = READ_ONCE(priv->hw->rx_csum);
 
 	/* Not first descriptor, SPH enabled: buffer1 only carries the
 	 * split header of the first descriptor, so it is zero here.
@@ -5264,7 +5298,7 @@ static unsigned int stmmac_rx_buf2_len(struct stmmac_priv *priv,
 				       struct dma_desc *p,
 				       int status, unsigned int len)
 {
-	int coe = priv->hw->rx_csum;
+	int coe = READ_ONCE(priv->hw->rx_csum);
 	unsigned int plen = 0;
 
 	if (!stmmac_rx_check_buf2_cap(priv))
@@ -5569,7 +5603,7 @@ static void stmmac_dispatch_skb_zc(struct stmmac_priv *priv, u32 queue,
 	struct stmmac_channel *ch = &priv->channel[queue];
 	unsigned int len = xdp->data_end - xdp->data;
 	enum pkt_hash_types hash_type;
-	int coe = priv->hw->rx_csum;
+	int coe = READ_ONCE(priv->hw->rx_csum);
 	struct sk_buff *skb;
 	u32 hash;
 
@@ -5872,7 +5906,7 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 	unsigned int next_entry = rx_q->cur_rx;
 	bool in_progress = rx_q->state_saved;
 	enum dma_data_direction dma_dir;
-	int coe = priv->hw->rx_csum;
+	int coe = READ_ONCE(priv->hw->rx_csum);
 	unsigned int desc_size;
 	struct sk_buff *skb = NULL;
 	struct stmmac_xdp_buff ctx;
@@ -6372,7 +6406,7 @@ static netdev_features_t stmmac_fix_features(struct net_device *dev,
 {
 	struct stmmac_priv *priv = netdev_priv(dev);
 
-	if (priv->plat->rx_coe == STMMAC_RX_COE_NONE)
+	if (!priv->plat->rx_coe || priv->rx_csum_failed)
 		features &= ~NETIF_F_RXCSUM;
 
 	if (!priv->plat->tx_coe)
@@ -6400,18 +6434,18 @@ static int stmmac_set_features(struct net_device *netdev,
 			       netdev_features_t features)
 {
 	struct stmmac_priv *priv = netdev_priv(netdev);
+	bool running = netif_running(netdev);
+	unsigned int rx_csum;
+	int ret;
 
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
+	if (running && rx_csum != priv->hw->rx_csum) {
+		ret = stmmac_set_rx_csum(priv, rx_csum);
+		if (ret)
+			return ret;
+	}
 
-	if (priv->sph_capable) {
+	if (running && priv->sph_capable) {
 		bool sph_en = (priv->hw->rx_csum > 0) && priv->sph_active;
 		u8 chan;
 
@@ -7650,10 +7684,9 @@ static int stmmac_hw_init(struct stmmac_priv *priv)
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
@@ -8575,6 +8608,14 @@ int stmmac_resume(struct device *dev)
 		netdev_err(priv->dev, "%s: Hw setup failed\n", __func__);
 		goto error_unlock;
 	}
+	if (stmmac_init_rx_csum(ndev)) {
+		mutex_unlock(&priv->lock);
+		netdev_update_features(ndev);
+		if (priv->rx_csum_failed)
+			netdev_update_features(ndev);
+		mutex_lock(&priv->lock);
+	}
+	stmmac_hw_start(ndev);
 
 	if (priv->ptp_enabled) {
 		if (stmmac_init_ptp_clk_freq(priv))

---
base-commit: af6737b9066832a2017c281159950ba92385ce00
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net.git main
change-id: 20261115-submit-stmmac-rx-checksum-capability-v1-ef6645788992

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


