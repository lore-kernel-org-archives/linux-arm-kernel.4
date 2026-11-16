Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B64F606A889
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 09:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=llcOm8Be;
	dkim=pass (2048-bit key) header.d=kernelriot.com header.i=@kernelriot.com header.a=rsa-sha256 header.s=kr2026 header.b=oh+sID6m
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=SgJ7BK9z38GBLKp8mxDyHBEYHCSkmLsXlDmIbALFGSI=; b=llcOm8BejtN2L8
	4Sh0lpGgm70OEOrrqbuOOrawhd6LYbkTVvxJ+pZlXQAAplrE/1iUbXIM4eLLsb16lGnZ1/a8QDJ8Z
	qnrpEFqD/3FLrEd7LZ62f7yTUPQ9S5q4L0WcLWtmj5jcUm59p9ZyMlK0IQSzDAELq5sW08ljKEhRw
	cSZVFj/NVvrTnvd8Po8xl+12Jdp/pXGibHhE6u/F1J5YA825V5C8zIhROMMCu0jh5uzn6diwkjb+1
	WvxE3HoCOksPGZAb5KKJ1L37M0AT+ksATp4h0EWhPp4V4WZkz/Navcc/jA6CdzZ948ASN8oLPprlJ
	JghjXs3IvNnpBm5ncXKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSsrF-00000001kOp-2L4g;
	Mon, 16 Nov 2026 09:18:37 +0000
Received: from mail.kernelriot.com ([74.208.142.49])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSsrC-00000001kNR-1yj5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 09:18:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernelriot.com;
	s=kr2026; t=1794820713;
	bh=BPD043+SMPaCp0olzTzGi087fGrg3ldseuRGBtPKZkI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:From;
	b=oh+sID6m3rbTSEXklfmHVTwMLDYbmiOyVThP2nXus5VFX8uJdqUK9+6yCFHArut6f
	 Rl8UZPMKiSYztLrh9x+Xki2BWf8f0/XMj2VZMmb24rTus1jVSjXza0mmiGOOXxYK5/
	 YMp+p4Yg3dSXPWKk3nYrvjrPiUI5m3DC/QZS3szoQOavH2ioau7f3hG1JbxkfiD1l1
	 tzt1esxmFHOO2ZWZu8fyaHZPOUSn7dz5Ag+e14vYoH6/clIdGNcK8mXgnBu52CXpHj
	 32PvhPS4PLRbXtyXY49BYi+uj00ooc3fT3wQ5FAdFqiyWXdXztLGYh5/sILxU9xw9/
	 lp42JVuM4N4nQ==
Received: by mail.kernelriot.com (Postfix, from userid 995)
	id E27AF8D754; Mon, 16 Nov 2026 09:18:33 +0000 (UTC)
From: Magnus Leatti <magnusleatti@kernelriot.com>
To: me@ziyao.cc,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Giuseppe Nespolino <g.nespolino@gmail.com>,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next 2/2] net: stmmac: dwmac-motorcomm: support Wake-on-LAN from S5
Date: Mon, 16 Nov 2026 06:17:57 -0300
Message-ID: <20261116091757.1656602-3-magnusleatti@kernelriot.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116091757.1656602-1-magnusleatti@kernelriot.com>
References: <20261116091757.1656602-1-magnusleatti@kernelriot.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_011834_551386_9FFD0F98 
X-CRM114-Status: GOOD (  27.04  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The driver reports "Supports Wake-on: ug" and accepts "wol g", but a
YT6801 in S5 ignores magic packets. At power-off stmmac_suspend() arms
the PMT register, but the chip's out-of-band WoL block stays disabled
as motorcomm_init() leaves it, the packet wake bit in WOL_CTRL is clear
and PME is turned off.

When powering off with Wake-on-LAN set, the interface up and wakeup
enabled for the device, keep PME enabled and arm the chip after
stmmac_suspend():

 - Enable OOB WoL. Without it the chip does not wake.
 - Write the MAC address in use to the first address filter again.
   Enabling OOB WoL reloads the factory address there. Without the
   rewrite the chip wakes on the factory address and ignores the one
   in use. The rewrite follows a 2 ms wait, as in the vendor driver:
   without the wait the reload lands after the rewrite.
 - Set the packet wake enable bit in WOL_CTRL. Without it the chip
   does not wake.

The sequence follows the vendor driver, with two differences. The
vendor also sets bit 9 of LPW_CTRL. The chip wakes without it, so it is
left alone. The vendor puts the function in D3hot. Here it stays in D0.
With MAC Wake-on-LAN phylink keeps the PHY running and phylib keeps
polling it until power is removed. In D3hot the MDIO registers read as
all-ones, the poll fails with -EBUSY and phylib warns from
phy_error_precise(). That warning was seen 111 ms after entering D3hot
on a normal power-off.

The PHY is left at the negotiated speed. Reboot and kexec are not
armed: OOB WoL can only be disabled again by a chip reset, so it is
enabled only when powering off, and the next probe resets the chip. If
the interface is down at power-off, the system does not wake.

Suspend is not changed. Hibernation that powers off through the
shutdown path arms the chip the same way. Neither was tested.

Tested on a Celeron N3350 mini PC, magic packets sent from another host
75 s after power-off:

  net-next  wol g                         no wake, 3 of 3
  patched   wol g                         wake, 8 of 8 (28-31 s to ping)
  patched   wol u                         wake on unicast, 1 of 1
  patched   wol d                         no wake, 3 of 3
  patched   wol g, interface down         no wake, 1 of 1
  patched   wol g, power/wakeup disabled  no wake, 1 of 1
  patched   wol g, reboot                 reboots, link back, 3 of 3

The kernel log of each of these shutdowns, read back after the next
boot, shows no warning from the shutdown path.

A second board, a PSJ8500-N97 mini PC (Intel N97), behaves the same.

Signed-off-by: Magnus Leatti <magnusleatti@kernelriot.com>
---
 .../ethernet/stmicro/stmmac/dwmac-motorcomm.c | 68 ++++++++++++++++++-
 1 file changed, 65 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-motorcomm.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-motorcomm.c
index 1e142ad39e33..034547ad1e98 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-motorcomm.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-motorcomm.c
@@ -27,6 +27,9 @@
 #define EPHY_CTRL				0x1004
 /* Clearing this bit asserts resets for internal MDIO bus and PHY */
 #define  EPHY_MDIO_PHY_RESET			BIT(0)
+#define WOL_CTRL				0x100c
+/* Magic and remote wake-up packet enable */
+#define  WOL_CTRL_PKT_EN			BIT(1)
 #define OOB_WOL_CTRL				0x1010
 #define  OOB_WOL_CTRL_DIS			BIT(0)
 #define MGMT_INT_CTRL0				0x1100
@@ -204,9 +207,51 @@ static int motorcomm_resume(struct device *dev, void *bsp_priv)
 	return 0;
 }
 
+/*
+ * Arm the chip to wake the system from S5. stmmac_suspend() has already
+ * programmed the PMT register of the GMAC. The rest lives in the wrapper.
+ */
+static void motorcomm_arm_s5_wake(struct net_device *ndev)
+{
+	struct stmmac_priv *spriv = netdev_priv(ndev);
+	struct dwmac_motorcomm_priv *priv = spriv->plat->bsp_priv;
+	u32 reg;
+
+	/*
+	 * motorcomm_init() disables OOB WoL right after the chip reset, as
+	 * normal operation requires. With it disabled the chip ignores wake
+	 * packets once the system is off. Once it has been enabled, only a
+	 * chip reset disables it again, so enable it only when powering off.
+	 */
+	reg = readl(priv->base + OOB_WOL_CTRL);
+	reg &= ~OOB_WOL_CTRL_DIS;
+	writel(reg, priv->base + OOB_WOL_CTRL);
+
+	/*
+	 * Enabling OOB WoL reloads the address from eFuse into the first
+	 * MAC address filter. Write the address in use again, or the chip
+	 * wakes on the factory address only. The reload is not immediate:
+	 * without the wait, taken from the vendor driver, it overwrites
+	 * the address written here.
+	 */
+	usleep_range(2000, 3000);
+
+	rtnl_lock();
+	phylink_rx_clk_stop_block(spriv->phylink);
+	stmmac_set_umac_addr(spriv, spriv->hw, ndev->dev_addr, 0);
+	phylink_rx_clk_stop_unblock(spriv->phylink);
+	rtnl_unlock();
+
+	reg = readl(priv->base + WOL_CTRL);
+	reg |= WOL_CTRL_PKT_EN;
+	writel(reg, priv->base + WOL_CTRL);
+}
+
 static void motorcomm_shutdown(struct pci_dev *pdev)
 {
 	struct net_device *ndev = dev_get_drvdata(&pdev->dev);
+	struct stmmac_priv *spriv = netdev_priv(ndev);
+	bool wake;
 
 	/*
 	 * A failed resume leaves the netdev detached with NAPI disabled, and
@@ -215,14 +260,31 @@ static void motorcomm_shutdown(struct pci_dev *pdev)
 	if (!netif_device_present(ndev))
 		return;
 
-	/* Stop the device before reboot, kexec or power-off */
+	wake = system_state == SYSTEM_POWER_OFF && netif_running(ndev) &&
+	       spriv->wolopts && device_may_wakeup(&pdev->dev);
+
+	/*
+	 * Stop the device before reboot, kexec or power-off. With
+	 * Wake-on-LAN set, this arms the PMT register and keeps the PHY up.
+	 */
 	stmmac_suspend(&pdev->dev);
 
 	/*
 	 * stmmac_pci_plat_suspend() enables PME if wakeup is enabled for the
-	 * device. Nothing arms the chip to wake the system, so undo that.
+	 * device. Keep it only when the chip is armed.
+	 */
+	if (!wake) {
+		pci_wake_from_d3(pdev, false);
+		return;
+	}
+
+	/*
+	 * The device is left in D0. The platform removes main power anyway,
+	 * and with MAC Wake-on-LAN phylib keeps polling the PHY until then:
+	 * in D3hot the MDIO registers read as all-ones and the poll fails
+	 * with a warning.
 	 */
-	pci_wake_from_d3(pdev, false);
+	motorcomm_arm_s5_wake(ndev);
 }
 
 static struct plat_stmmacenet_data *
-- 
2.56.1


