Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5671606A331
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 21:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qRBvmtyb;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hsf450GX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=h/4SHi4LN8fNNp2z6R0vX1bx1HpB7Z0CG0RIgc56EBM=; b=qRBvmtybOBFlOT5L1Sa7Gi2il2
	kzXD6lIc8csl0o5wDKQ77z+2CcyoDbFDIa46pW+ZK/bwd2IXQOtPp6XZKekDTx4tOPlRkISzdLtiD
	+WWnFM+VDkljNO51jiRlrAUais1LUdD0cSfLASW6RI6m66lRtHkBLuMKdc/YY74f2Rp+8NGPhkv8N
	CW28grYk8Xs2Uyn2qX13xnUOXNQEDq+wVKxTPDGncSkVCL4/SPGsHtMARlXX7VwGU8rdp+wQa3SgP
	nTeC0/hYsTThJUyF/giiOVXFc32QX1wtKGqIahVSiSakDgi1R+247cvy5p7iz+Wmer4fKrXU6cKDv
	q6vy2x1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRyU6-0000000EWIn-3Cwd;
	Fri, 13 Nov 2026 21:06:58 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRyTr-0000000EW7i-3dxL;
	Fri, 13 Nov 2026 21:06:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B8F2D63170;
	Fri, 13 Nov 2026 21:06:42 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794604002;
	b=kRpJN0uA/3n1s8UnLRdIgi5ir+FWXK9BehSn1sprnq2efdHGDmURwfDR7xN1Ttxc78kk
	 LPaZj17jpVaUI1oWgy7Op2ZoC8rw6umKe3ZYyU3aO1UO36nPi2OvOs1bd8mqRAhRZ6wLy
	 ffkgDWleyHeHxk2CkcfYpTyI1rqXqBA/+gPULzm9Lm3kXwuRmpvU3DfwxEb4ukVo0Dade
	 2+pee6zZbTFV91fJllSNdLdIPkfUOUexgQArEqtCqSmq9roxV2F7Kefta5x2L/IAYyUSH
	 vuNQArxnSuWTvSalLzEQWBakasr4fsDM11ptgotP5nngXk1XT93UGcPdaHy0uKgQOIw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794604002;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=h/4SHi4LN8fNNp2z6R0vX1bx1HpB7Z0CG0RIgc56EBM=;
	b=CD+5toAq40kSOEgG5juLembnQK2xBDkUiWVreurLPM27bfWnr0HDMbXUdif1Mp0FHNec
	 9KzERPF9Oj3rtTGFwtsY15xecroW/8xsnUUNzBPiPQ10zvD4FEEEvCaVU0mbDR66d+H/h
	 wBtYswalYk7g9BgkQs+YZ9ZpARR0IHQi8QQ2y9TrtrshQzu/BqRkYqnmC1vneiOM6oKvW
	 UsIBpoPjHrQMi1zQS1b8bz1alirESH7iXfzUKVr6fcpAL59nc1ZYy0Sg8rFbN+emg8rEr
	 0djEriq0y4f37B5zQOg2mL4034wjbjpvx1B3WhiJognXh8+Yxn469WSx36rut223UfQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 022C91F000C8;
	Fri, 13 Nov 2026 21:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794604002;
	bh=h/4SHi4LN8fNNp2z6R0vX1bx1HpB7Z0CG0RIgc56EBM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=hsf450GXnmYA9U2gkl3JelKBL0QEvTMTeF4ao/LNgod1BNO7mis7sBmGZwA3Sr7az
	 i4iPbFvmwqV+AzdYXOo3xNzVecofbgpQR0vQL/9r5gQBSKlAGTXOAsTTGHkE2OACQT
	 CrOvA0z7kQGwinZLc3Rzgr291uchZdbPGs0YXXk5QqSpGkfv8Y7Rt6FTrHqgW9NMSn
	 2f7ItWPVHMcxj+rQCGEW88+cMReeM5GLAULeS5us+OLJu1mGDfLsUlyBG97EFkzgLH
	 q2uo0y5v1TBTZZtkCk1gD2uUHisMeW0ZW62xyrFE29ewGYBDZwpfZLifrjDTDGdqnx
	 3rtYJ/C4Hdujg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 85D7C49B02;
	Fri, 13 Nov 2026 21:06:40 +0000 (UTC)
From: Igor Velkov via B4 Relay <devnull+iav.iav.lv@kernel.org>
Date: Fri, 13 Nov 2026 21:06:38 +0000
Subject: [PATCH net v6 4/4] net: phy: postpone PHY interrupts during sleep
 with MAC-managed PM
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261113-b4-phylib-mac-pm-irq-v3-v6-4-05af2503cb23@iav.lv>
References: <20261113-b4-phylib-mac-pm-irq-v3-v6-0-05af2503cb23@iav.lv>
In-Reply-To: <20261113-b4-phylib-mac-pm-irq-v3-v6-0-05af2503cb23@iav.lv>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Lukas Wunner <lukas@wunner.de>, 
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, 
 Wei Fang <wei.fang@nxp.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Paul Barker <paul@pbarker.dev>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Doug Berger <opendmb@gmail.com>, 
 Thangaraj Samynathan <Thangaraj.S@microchip.com>, 
 Shenwei Wang <shenwei.wang@nxp.com>, 
 Haoning Cheng <Haoning.CHENG@cn.bosch.com>, netdev@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Igor Velkov <iav@iav.lv>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5828; i=iav@iav.lv;
 h=from:subject:message-id;
 bh=KDaI5LsTyEkMYG1JUyhMv85ZeBt5+gr1aiFFihz2t4o=;
 b=owGbwMvMwCVmNH1q96v4SmbG02pJDFnfq+/rXhd4sfc9n1j0CsbnGydY7Z3Lp5YY/K1aPfVgX
 NImzY1HO0pZGMS4GGTFFFkmHNK4lbHk6l9/D/MHMHNYmUCGMHBxCsBELugw/NP7EZwvn+PYWFzT
 vEWxZU/xIs7+mjW1b7ex6R8LcaxxZGX4Hy9vb7l/qx/znfwo6xW/msX65jYu0fwdHnXtTvpn6YY
 CRgA=
X-Developer-Key: i=iav@iav.lv; a=openpgp;
 fpr=90C228DA68A4D5FD4F4837E03297958BEA5F7903
X-Endpoint-Received: by B4 Relay for iav@iav.lv/default with auth_id=1060
X-Original-From: Igor Velkov <iav@iav.lv>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: iav@iav.lv
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Igor Velkov <iav@iav.lv>

mdio_bus_phy_suspend() and mdio_bus_phy_resume() return early when the
MAC driver manages PHY PM, so the PHY never gets irq_suspended and
phy_interrupt() runs the PHY driver's handler at any point of the sleep
transition. If the MAC driver powers the MDIO bus down, the MDIO access
in that handler can stall the CPU. This happens on both sides:

- suspend: the MAC's suspend callback stops the PHY, the link goes
  down, and the handler runs while the MAC powers down;
- resume: resume_device_irqs() re-enables a pending interrupt before
  the MAC resumes.

On Helios64 (dwmac-rk, RTL8211F with its interrupt line described in DT)
both hang the board: the handler reads INSR while the GMAC clocks are
off, after rk_gmac_suspend() or before rk_gmac_resume(). The commit in
the Fixes tag added the postponing after the early return for
MAC-managed PHY PM, and stmmac has set mac_managed_pm since commit
f151c147b3af ("net: stmmac: Enable mac_managed_pm phylink config").

Set irq_suspended for these PHYs too. The PHY device is a child of its
MDIO bus, so mdio_bus_phy_resume() runs after the resume callbacks of
the bus and its parents (with stmmac, the MAC) and replays the postponed
interrupt then. The PM core resumes children of a device whose resume
callback failed, and phylib cannot tell: if the MAC fails to power the
bus up, the replay still reaches the bus. phy_suspend(), phy_resume()
and the state machine stay with the MAC driver, and no MAC driver needs
a change. Doing this in phylink_suspend() instead would miss macb, which
sets mac_managed_pm but suspends with phylink_stop().

A postponed interrupt cannot read the PHY, so it cannot tell Wake-on-LAN
from a link change. A PHY without MAC-managed PM reports what
phy_interrupt() reports today. A PHY with MAC-managed PM reports no
wakeup: the MAC can change the link in its suspend callback, as stmmac
lowers the link speed through phylink_suspend() when the PHY may wake
the system, and a PHY that leaves its link interrupt unmasked would
abort every suspend. Its postponed interrupt still disables the line,
which may then stay masked until resume, so such a PHY may not wake the
system from that sleep, and a magic packet that arrives during the
transition does not abort it.

Tested on Helios64 with 7.3.4, s2idle with the link up:
- no Wake-on-LAN, GMAC clocks off in suspend: 10 of 10 cycles suspended
  and resumed; on 7.3 without this series the same test hung or reset
  the board after the link went down 10 of 10 times;
- MAC power/wakeup enabled, no Wake-on-LAN: 3 of 3 slept;
- Wake-on-LAN in the PHY, so phylink_suspend() also drops the link
  speed: a magic packet woke the board 4 of 4 times, no suspend
  aborted.

Fixes: 1758bde2e4aa ("net: phy: Don't trigger state machine while in suspend")
Signed-off-by: Igor Velkov <iav@iav.lv>
---
Haoning Cheng's Tested-by on v5 is not carried: MAC-managed PHYs no
longer report a wakeup.
---
 drivers/net/phy/phy.c        |  5 ++++-
 drivers/net/phy/phy_device.c | 11 ++++++++---
 include/linux/phy.h          |  4 ++--
 3 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/net/phy/phy.c b/drivers/net/phy/phy.c
index 8e03c99fce8f..ccf0658c4d10 100644
--- a/drivers/net/phy/phy.c
+++ b/drivers/net/phy/phy.c
@@ -1419,7 +1419,10 @@ static irqreturn_t phy_interrupt(int irq, void *phy_dat)
 	if (IS_ENABLED(CONFIG_PM_SLEEP) && READ_ONCE(phydev->irq_suspended)) {
 		struct net_device *netdev = phydev->attached_dev;
 
-		if (netdev) {
+		/* With MAC-managed PM, a postponed interrupt cannot tell
+		 * Wake-on-LAN from a link change the MAC causes.
+		 */
+		if (netdev && !phydev->mac_managed_pm) {
 			struct device *parent = netdev->dev.parent;
 
 			if (netdev->ethtool->wol_enabled)
diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index 39e232a3144a..c043071784f5 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -369,11 +369,14 @@ static __maybe_unused int mdio_bus_phy_suspend(struct device *dev)
 	struct phy_device *phydev = to_phy_device(dev);
 	int ret;
 
+	/* An interrupt can fire while the MAC has the MDIO bus powered
+	 * down, whether or not the MAC manages PHY PM.
+	 */
+	mdio_bus_phy_suspend_irq(phydev);
+
 	if (phydev->mac_managed_pm)
 		return 0;
 
-	mdio_bus_phy_suspend_irq(phydev);
-
 	/* We must stop the state machine manually, otherwise it stops out of
 	 * control, possibly with the phydev->lock held. Upon resume, netdev
 	 * may call phy routines that try to grab the same lock, and that may
@@ -406,8 +409,10 @@ static __maybe_unused int mdio_bus_phy_resume(struct device *dev)
 	struct phy_device *phydev = to_phy_device(dev);
 	int ret;
 
-	if (phydev->mac_managed_pm)
+	if (phydev->mac_managed_pm) {
+		mdio_bus_phy_resume_irq(phydev);
 		return 0;
+	}
 
 	if (!phydev->suspended_by_mdio_bus)
 		goto no_resume;
diff --git a/include/linux/phy.h b/include/linux/phy.h
index 96d14b6b544f..3238432989c3 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -649,8 +649,8 @@ struct phy_oatc14_sqi_capability {
  * @mdix_ctrl: User setting of crossover
  * @pma_extable: Cached value of PMA/PMD Extended Abilities Register
  * @interrupts: Flag interrupts have been enabled
- * @irq_suspended: Flag indicating PHY is suspended and therefore interrupt
- *                 handling shall be postponed until PHY has resumed
+ * @irq_suspended: Flag indicating a system sleep transition, so interrupt
+ *                 handling shall be postponed until the PHY has resumed
  * @irq_rerun: Set by the postponed interrupt that disabled the line
  * @default_timestamp: Flag indicating whether we are using the phy
  *		       timestamp as the default one

-- 
2.43.0



