Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 799F2606D904
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 23:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oD3G3LZR;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RAcv7B+C
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=402Fe33BaMpiMZSsnw6PGeMiVFZ9HuQ2pUw9tJPCwAU=; b=oD3G3LZRmnJGl3+pLhh1xVwopy
	xH9ov3/w/H+aASEA4m+RzkYREgyYhAzCBQVaGnOPu5OOBpJxR9exY+fSpu3Xln8hBowGaoTbNCVqd
	w6rdK+YeDRqE754G4Z9Dzc2uVTKsp59CKN4AyTD3/8VgSVO8MGNQQfk0xObPeyUeAdKB1QnIEH0Fk
	7qckCHWdHrdlsov/ngAZu/OcQAG1KziWhyOSe9qgjUqFgv61oYaUseKJYCN/As9NwJXngq86P+2Ox
	0NRy+XEBLayN0u7iydJ0vSYIYFD+OGpfg8thyjCy1Nn7tiEK6lwRCDyv7aANZETLzUanD3bCDTON1
	1TZxDEdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRI3U-00000008Avo-3VE3;
	Wed, 11 Nov 2026 23:48:41 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRI3G-00000008AfN-3ZB3;
	Wed, 11 Nov 2026 23:48:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2230A655E1;
	Wed, 11 Nov 2026 23:48:26 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794440905;
	b=ZCMcoPSTHSdyNkeXjslCNVsclsnsJn5uIsoKIRHQrT/8AfqYr2WDXPUgKLtNnNxVpu7w
	 mGlNULidRAsT5cXeMx6dNjbYIzYjf6TiruxWFO8Owhh/3MJKX7dVDHszI7y7UOR6pv6nP
	 jYRMJIAUUAkKiuN+2Ng8zLnQ7F2NaOmiciwG9bZUk+kKSvPs5XQMcjD0QmtFB5zNW9ef4
	 zsvWsWbQTVWh1VSz7vjfDB727ODCIzl+j/Z/klp4ft7JApBEzpKZ4BIKYA9e8NxnQw0Ar
	 p9LNzBnTcLjsIFZK0Sqti/BEH6ly2BgO2lBEKyD7N44QGrgF0DMnWDFV6tb3zF56FAA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794440905;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=402Fe33BaMpiMZSsnw6PGeMiVFZ9HuQ2pUw9tJPCwAU=;
	b=k6s+5PrL0BXJSl2bH9ZeTjfk3i84hSTHCBHCZOvdV4JFBNvqdl1M9yS4/LWvWiJggLo+
	 71OKJCOQxWX9beNLgJrTIfUyFfEYFFcQaeX6KmroCkteDSoJXg+wSKsfUl90DAsxAgzgH
	 ytrTwjkopaNKYdvlOPKpow9jRdtN73+WsHk4pGA+wAZQ4628Gz4imKH3r/qGtnqmAGn4O
	 zrJiyYwKHAWD/c5dy30RG/dbnpGruslWTIhXUcR7EsPRomCJPK0c09Jm5Fr0tW/59AOxF
	 /k4djStgXC25NU5OK2sQ6l0SWzzqA3eC1c/qLmq2MCBqTxFSNHUdWbheh/Ri7m0Uj+g==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C5C291F00A08;
	Wed, 11 Nov 2026 23:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794440905;
	bh=402Fe33BaMpiMZSsnw6PGeMiVFZ9HuQ2pUw9tJPCwAU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=RAcv7B+CCmm4Of2EitJjZfoZ0vcP5W3NvYn+bxa+/k8K0hN0US8HobRpTc9sq6o5V
	 V2ssyRMFSvUvB7fpQJycwKbXRmK+Wa3pZwU/sA9NQ/vpaxA63tfsENypVV3FLbQqoN
	 ikQlaW5Gt/bJkPd+omj3O4xhZ7/FtVVGhe/ZJvHXy+4hnRQXeFDUIth8+yWegoqoKt
	 y7YxtCoMp6hQZmdLTFDtXe547qaIWyWlFQGmVVliSokgBr4MzqQwEgIok6+GGJkEVW
	 Oc8On45CIlvdZTCqapI0U6IvhKbRwTPrTtTTAdBUes5aITRI5JZWnR9DZHWpwvKT7G
	 am2PL72gsn22A==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 4F47B49189;
	Wed, 11 Nov 2026 23:48:24 +0000 (UTC)
From: Igor Velkov via B4 Relay <devnull+iav.iav.lv@kernel.org>
Date: Wed, 11 Nov 2026 23:48:21 +0000
Subject: [PATCH net v5 3/4] net: phy: stop postponing PHY interrupts when a
 PHY PM callback fails
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261111-b4-phylib-mac-pm-irq-v3-v5-3-bbfdb5afb7d3@iav.lv>
References: <20261111-b4-phylib-mac-pm-irq-v3-v5-0-bbfdb5afb7d3@iav.lv>
In-Reply-To: <20261111-b4-phylib-mac-pm-irq-v3-v5-0-bbfdb5afb7d3@iav.lv>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4173; i=iav@iav.lv;
 h=from:subject:message-id;
 bh=ufSlJR1JUWh6LMI/LBIHvZWnCZGjjT9SaXzc2rd3OA0=;
 b=owGbwMvMwCVmNH1q96v4SmbG02pJDFlf/h2b/CJEz0j6Q4P2rmuzmK46PuP0Lr745mKsyDfut
 L1u9WxxHaUsDGJcDLJiiiwTDmncylhy9a+/h/kDmDmsTCBDGLg4BWAiz6cx/K/Tb02WEuhxvTVj
 zQ+mM+XxVTJCS9nNupRV+7gTBSIa8hgZnn0S5JT5NeeXn+i2bSY/rHKDAxw/S0j9LIrYwB5byHq
 NEwA=
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
interrupt disables the line until the next resume. When phy_init_hw()
or phy_resume() fail, mdio_bus_phy_resume() returns before the rerun,
with irq_suspended set and a postponed interrupt left disabled.

Undo the postponing and restart the state machine when phy_suspend()
fails. When phy_init_hw() or phy_resume() fail, stop postponing too, but
leave a line that a postponed interrupt disabled off, as before this
patch: the PHY may be out of reach, and its handler could not quiet a
level-triggered source. The line comes back on the next successful
resume; phy_free_interrupt() gives it back to the other users of a
shared line, and a new request restarts it.

Fixes: 1758bde2e4aa ("net: phy: Don't trigger state machine while in suspend")
Signed-off-by: Igor Velkov <iav@iav.lv>
---
Haoning Cheng's Tested-by on v4 is not carried: a failed resume now
leaves the line disabled.
---
 drivers/net/phy/phy.c        |  2 +-
 drivers/net/phy/phy_device.c | 29 ++++++++++++++++++++++++-----
 2 files changed, 25 insertions(+), 6 deletions(-)

diff --git a/drivers/net/phy/phy.c b/drivers/net/phy/phy.c
index ea22ebb14a83..62b7f428f9da 100644
--- a/drivers/net/phy/phy.c
+++ b/drivers/net/phy/phy.c
@@ -1414,7 +1414,7 @@ static irqreturn_t phy_interrupt(int irq, void *phy_dat)
 	irqreturn_t ret;
 
 	/* Wakeup interrupts may occur during a system sleep transition.
-	 * Postpone handling until the PHY has resumed.
+	 * Postpone handling until the transition ends.
 	 */
 	if (IS_ENABLED(CONFIG_PM_SLEEP) && READ_ONCE(phydev->irq_suspended)) {
 		struct net_device *netdev = phydev->attached_dev;
diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index d3815ee21541..110c9dfcbd91 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -333,8 +333,8 @@ static bool mdio_bus_phy_may_suspend(struct phy_device *phydev)
 }
 
 /* Wakeup interrupts may occur during the system sleep transition when
- * the PHY is inaccessible. Set flag to postpone handling until the PHY
- * has resumed. Wait for concurrent interrupt handler to complete.
+ * the PHY is inaccessible. Set flag to postpone handling until the
+ * transition ends. Wait for concurrent interrupt handler to complete.
  */
 static __maybe_unused void mdio_bus_phy_suspend_irq(struct phy_device *phydev)
 {
@@ -367,6 +367,7 @@ static __maybe_unused void mdio_bus_phy_resume_irq(struct phy_device *phydev)
 static __maybe_unused int mdio_bus_phy_suspend(struct device *dev)
 {
 	struct phy_device *phydev = to_phy_device(dev);
+	int ret;
 
 	if (phydev->mac_managed_pm)
 		return 0;
@@ -384,9 +385,20 @@ static __maybe_unused int mdio_bus_phy_suspend(struct device *dev)
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
@@ -412,11 +424,11 @@ static __maybe_unused int mdio_bus_phy_resume(struct device *dev)
 
 	ret = phy_init_hw(phydev);
 	if (ret < 0)
-		return ret;
+		goto err;
 
 	ret = phy_resume(phydev);
 	if (ret < 0)
-		return ret;
+		goto err;
 no_resume:
 	mdio_bus_phy_resume_irq(phydev);
 
@@ -424,6 +436,13 @@ static __maybe_unused int mdio_bus_phy_resume(struct device *dev)
 		phy_start_machine(phydev);
 
 	return 0;
+
+err:
+	/* Stop postponing, but leave a line that a postponed interrupt
+	 * disabled off: its handler may not reach a PHY that did not resume.
+	 */
+	WRITE_ONCE(phydev->irq_suspended, false);
+	return ret;
 }
 
 static SIMPLE_DEV_PM_OPS(mdio_bus_phy_pm_ops, mdio_bus_phy_suspend,

-- 
2.43.0



