Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9865E606A326
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 07:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=w3+cnYPu;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ljZAlWjZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=/7jA1mdGjpdRHZ3a5Ter91k3t1QA732PAZu5RAALnms=; b=w3+cnYPuALbx8ZVk9wr5VtW1TV
	dXAlSHeANpC7c+LPGOwxWIvc6CmegfFFE1prmpwyheOrNsqzgScqkXbOeMk2z2Fj6efnG/Rq8hVc9
	UG4nVxzNYJ5yIRD8HgJro2VdIU4ieGs4qKxy8IADip0WcJJWzmdZ4BKXPhOTMsa1TiNVvAolyOYv0
	+30UWJvBVQOzqMx0PK3ZXtgZRIz0pE+A3dlwy7RxaFksTojYotrpe3dKGlFlYpiqNdRwk5X8r8OB6
	4orJqRx7V1oBDMtKPi8DJqvBcjbMokmtdSlhT5mqQh1lJp636f8mWdr7f9/DSQ+wPWGnt2Pz4cigU
	9tnEpcTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTwV4-0000000B3gr-2OBf;
	Thu, 19 Nov 2026 07:24:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTwV4-0000000B3ga-01P4;
	Thu, 19 Nov 2026 07:24:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A313C46B97;
	Thu, 19 Nov 2026 07:24:05 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795073045;
	b=oyIupMk56tF5ZC1P0iaGj8bptwKlBaUJxRjZk1MZZG+RaxALRE+CGHTwHp+CBjyFlY6w
	 m0lHJRSvpw79If0xWpxUbgjgBOdiLKmlyts1jeNczoxWTu0Exwfxp8RkIES3nR6g0bwDl
	 v7MkvMtwZcPN2eQXs5WkU3pHP8YsQTb0THa5DoVNAWa95TpG4EYl3HpD4UemXGDJ1ZvSS
	 +BWBcxWf0gQqElKcvWcNRZomSSUlapDpN0ggpZqH4EhJOJKmGDdnIj/urxhLDPini5M0K
	 Yi1r2X5mPmFdI10mnsLh9AF+pWc2O/drpmCvH8dFWkaNlElq7T1WTvLaoG4QgJ3D6Gg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795073045;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=/7jA1mdGjpdRHZ3a5Ter91k3t1QA732PAZu5RAALnms=;
	b=s2H8wwmMzUEvCL0KVBrj/UdtnEZyvYp3WiFTKr3B/X+YuOiBq+0nXvj8PaToV0ZYeO+o
	 XIlp9njo+B5VjrcDhYvmEP8aum2FiojWzEq8rK2hJioAGkzT8hOGVPwp76p0dXIJ53D2S
	 CBX7HzQb2OMvmlGkef9H6vhbySz8lzp7LNexyGoBaaY791vSKVaoaEbGJ9VleojQbiXS1
	 GBgV/c4/m1ej08BQ/UhRsKeD8WSAp17Stsxko3VwJ6tXHmMIqee+t+VDDwzdj65suZdmA
	 awn2hBtU9kjDurbvl2TnsEnVhCvGyvbnfxLLMmPSNqRVgXgnBA2pUeFwiCqSCl3ieRA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6DCC21F000C8;
	Thu, 19 Nov 2026 07:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795073045;
	bh=/7jA1mdGjpdRHZ3a5Ter91k3t1QA732PAZu5RAALnms=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=ljZAlWjZaELtUmdrKMoiOcoEHH0iUq3qtxHAScLAtnUTNevsFvPnfqR3euUVT5V7W
	 MMpWGz7scyVEGWBBux5Ox50KcZi4EfWwimnoR/qciu/J/5KhfCwTg98XC6/EntPNKp
	 TJPDGJFlO53H4y56tDewE6X8Uk/BdJ4LqcXNECGE09+aFCffVcJLBbV32Tkqvg4JJO
	 6TfQf7n6a/jxLDyVGWnQ8fNIiAxOAucLH/ml/iNmYYL2rZauhGZRrK2QRj2x5sDhoQ
	 DCL0K3reAH5PvRjrbrWqQg7HQkVEGGJJETOQOHdkvWZ4iaNpZjpRQQadCyStdDPU1Y
	 FloSDxAI6bQvw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 015004B169;
	Thu, 19 Nov 2026 07:24:04 +0000 (UTC)
From: Igor Velkov via B4 Relay <devnull+iav.iav.lv@kernel.org>
Date: Thu, 19 Nov 2026 07:23:59 +0000
Subject: [PATCH net v7 3/5] net: phy: stop postponing PHY interrupts when
 phy_suspend() fails
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261119-b4-phylib-mac-pm-irq-v3-v7-3-d8b8f43b5a62@iav.lv>
References: <20261119-b4-phylib-mac-pm-irq-v3-v7-0-d8b8f43b5a62@iav.lv>
In-Reply-To: <20261119-b4-phylib-mac-pm-irq-v3-v7-0-d8b8f43b5a62@iav.lv>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Thomas Gleixner <tglx@kernel.org>, linux-pm@vger.kernel.org, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2032; i=iav@iav.lv;
 h=from:subject:message-id;
 bh=+A2hLcXVzSFgT2M5CYC4xlPO/kE1CSINjgk6/JEhbKI=;
 b=owGbwMvMwCVmNH1q96v4SmbG02pJDFn/lghOjFq7xNrV8U3Y5A+Lrx4tsry8p7Gv1+g0G/9v4
 xaLui0HO0pZGMS4GGTFFFkmHNK4lbHk6l9/D/MHMHNYmUCGMHBxCsBEMj4x/C9L2niVU95cLkVn
 9p3ra3IXR6Qs0EqYpWfEs7ZD7S1X8RZGhnV7/72td/kZsHTxpC2dN1YEzwneln/k0py+7Pnnel3
 Sz/ADAA==
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

When phy_suspend() fails in mdio_bus_phy_suspend(), irq_suspended
stays set and the state machine stays stopped: the PM core does not
resume a device whose suspend callback failed, and the next PHY
interrupt disables the line until the next resume.

Undo the postponing and restart the state machine when phy_suspend()
fails. Set suspended_by_mdio_bus only after phy_suspend() succeeds.
Set before it, the flag outlived a failed suspend, and in a later cycle
where mdio_bus_phy_may_suspend() returns false, mdio_bus_phy_resume()
ran phy_init_hw() and phy_resume() on a PHY that the MDIO bus had not
suspended.

Fixes: 1758bde2e4aa ("net: phy: Don't trigger state machine while in suspend")
Signed-off-by: Igor Velkov <iav@iav.lv>
---
Haoning Cheng's Tested-by on v5 is not carried: this patch no longer
changes the resume error path.
---
 drivers/net/phy/phy_device.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index f2e2370b4be7..2d2058c29f30 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -368,6 +368,7 @@ static __maybe_unused void mdio_bus_phy_resume_irq(struct phy_device *phydev)
 static __maybe_unused int mdio_bus_phy_suspend(struct device *dev)
 {
 	struct phy_device *phydev = to_phy_device(dev);
+	int ret;
 
 	if (phydev->mac_managed_pm)
 		return 0;
@@ -385,9 +386,20 @@ static __maybe_unused int mdio_bus_phy_suspend(struct device *dev)
 	if (!mdio_bus_phy_may_suspend(phydev))
 		return 0;
 
+	ret = phy_suspend(phydev);
+	if (ret) {
+		/* The PM core skips the resume callback of a device whose
+		 * suspend callback failed.
+		 */
+		mdio_bus_phy_resume_irq(phydev);
+		if (phy_uses_state_machine(phydev))
+			phy_start_machine(phydev);
+		return ret;
+	}
+
 	phydev->suspended_by_mdio_bus = 1;
 
-	return phy_suspend(phydev);
+	return 0;
 }
 
 static __maybe_unused int mdio_bus_phy_resume(struct device *dev)

-- 
2.43.0



