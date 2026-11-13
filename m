Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63D0A606A331
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 05:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=n2kLZASk;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aA1FJUQW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=LANplOGl/IujYksPR/YOrSZcasHgqJlzVsMCgKPcbSc=; b=n2kLZASkN+gdSUKPzN2slfn80G
	+Hu6fUMba+sW6A4xs3e0QoqM9xcuKMd4YMmPLHs5Qk2qHKLA81ZgnG9ePj8VXG8lY52M2vEcKy12u
	D/UdXK99fHoCPGXA2BtRFLl/ioSHLX1vnVTh+hORlgLUh7t8iJXnKePQZrAmhW1CQRQTsWWrYGwc3
	m4sgiFkYGV6MQD1Tq2AvwSgb/9OVXm0s8BV/WxhQ84gYWoKP1NDmYTJGWHEhXT/XCD8/QnxLjhbpK
	kLpGKOVJfbqhSEwrYF/aA97IOEtGZqn+FeeYkICrCvjL6wy7pLRX6Bd0ZRkqbXt+oeCvubw7dG3JF
	Rb6K5jXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRkCM-0000000BiyY-2kIu;
	Fri, 13 Nov 2026 05:51:42 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRkCC-0000000Biu3-0UOw;
	Fri, 13 Nov 2026 05:51:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8C66B62530;
	Fri, 13 Nov 2026 05:51:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44BD41F00925;
	Fri, 13 Nov 2026 05:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794549091;
	bh=LANplOGl/IujYksPR/YOrSZcasHgqJlzVsMCgKPcbSc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=aA1FJUQWvmVyKCMaGNbnhQ/CSPlv+LzHzApYMzxMhm3zkyQb3k4PVjqJjprnP5yhL
	 MPaOl4dvJh04hFrFS7m+9tMYXnn3RktAnoy1dg87CCjB5E6Lt6Myc/slDGxih3KiV8
	 OVBLZQlz5P/YXiKTJFbNbxri4tJN/IWUjIxlHnHDzrAg3TPnCR34iAWBsaWtiY3I5W
	 TuIK6AYitM9SSD1djcQj65gyICIua5A89ZdTxgYW75TwDd9xxvsiytCvLrRkkJBZm8
	 3ufPL4LPvMoFKOeW+ow4l/0+6TSt/Yf/5TqXnaAtbUaWWQXXSM6DzFccAcbe2Vi/7w
	 PDF9CDEughw5A==
Subject: Re: [PATCH net v5 4/4] net: phy: postpone PHY interrupts during sleep
 with MAC-managed PM
From: netdev-bot+sashiko@kernel.org
To: iav@iav.lv
Cc: andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 maxime.chevallier@bootlin.com, lukas@wunner.de, rafael.j.wysocki@intel.com,
 wei.fang@nxp.com, niklas.soderlund@ragnatech.se, paul@pbarker.dev,
 florian.fainelli@broadcom.com, opendmb@gmail.com, Thangaraj.S@microchip.com,
 shenwei.wang@nxp.com, Haoning.CHENG@cn.bosch.com, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Date: Fri, 13 Nov 2026 05:51:29 +0000
Message-ID: <179454908985.2199510.13649467977536691436@kernel.org>
In-Reply-To: <20261111-b4-phylib-mac-pm-irq-v3-v5-4-bbfdb5afb7d3@iav.lv>
References: <20261111-b4-phylib-mac-pm-irq-v3-v5-4-bbfdb5afb7d3@iav.lv>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The new wakeup policy treats every postponed PHY interrupt as
  a system wakeup whenever phy_may_wakeup() is true, including link-…

--

net: phy: postpone PHY interrupts during sleep with MAC-managed PM

This commit sets irq_suspended for PHYs whose MAC manages PHY PM. With it
set, phy_interrupt() postpones the PHY driver's handler for the whole
sleep transition instead of accessing an MDIO bus that may be powered
down. The wakeup event a postponed interrupt reports is now decided in
mdio_bus_phy_suspend() and stored in the new irq_wake field.

> diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
> index 110c9dfcbd916..2dc13dd1afb66 100644
> --- a/drivers/net/phy/phy_device.c
> +++ b/drivers/net/phy/phy_device.c
> @@ -332,6 +332,44 @@ static bool mdio_bus_phy_may_suspend(struct phy_device *phydev)
>  	return !phydev->suspended;
>  }
>  
> +static __maybe_unused enum phy_irq_wake
> +phy_irq_wake_source(struct phy_device *phydev)
> +{
> +	struct net_device *netdev = phydev->attached_dev;
> +	bool phy_wol;
> +
> +	if (!netdev)
> +		return PHY_IRQ_WAKE_NONE;
> +
> +	/* phy_suspend() cached the answer of a suspended PHY, which may
> +	 * not be reachable over MDIO.
> +	 */
> +	if (phydev->suspended && !phy_can_wakeup(phydev))
> +		phy_wol = phydev->wol_phy;
> +	else
> +		phy_wol = phy_may_wakeup(phydev);
> +
> +	if (phy_wol)
> +		return PHY_IRQ_WAKE_SYSTEM;
> +
> +	/* With MAC-managed PM, only Wake-on-LAN in the PHY makes its
> +	 * interrupt a wakeup: the MAC stops the PHY itself.
> +	 */
> +	if (phydev->mac_managed_pm)
> +		return PHY_IRQ_WAKE_NONE;

[Severity: Medium]
Can a link-change interrupt caused by the MAC's own suspend path abort
system suspend here?

Take a MAC-managed PHY where phy_may_wakeup() is true. The phy_may_wakeup()
check comes before the mac_managed_pm check, so irq_wake is set to
PHY_IRQ_WAKE_SYSTEM. This happens in mdio_bus_phy_suspend(), which runs
before the MAC's suspend callback.

With stmmac, which sets config->wol_phy_speed_ctrl = true, the MAC
suspend then does:

stmmac_suspend()
  phylink_suspend()
    phylink_stop()
    phylink_speed_down(pl, false)    /* gated on phy_may_wakeup() */
      phy_speed_down(phydev, false)
        phy_config_aneg()            /* restarts autoneg, link drops */

phy_stop() does not mask the PHY interrupt. On PHYs whose INT pin carries
both link and WoL events, the link-fail interrupt then fires while
irq_suspended is set, and phy_interrupt() does:

		case PHY_IRQ_WAKE_SYSTEM:
			pm_system_wakeup();
			break;

This runs without reading the interrupt status, so a link change cannot be
told apart from a PME/WoL event. The phy_speed_down() kernel-doc already
warns about this:

  WARNING: Setting sync to false may cause the system being unable to suspend
  in case the PHY generates an interrupt when finishing the autonegotiation.

Resume speeds the link back up and the next suspend speeds it down again.
Wouldn't every retry abort in the same way?

Two configurations where this looks reachable:

AR8031/AR8035 (at803x) with WoL enabled. AT803X_INTR_ENABLE_WOL shares
AT803X_INTR_ENABLE and the INT pin with the link fail/success bits. These
PHYs lack PHY_ALWAYS_CALL_SUSPEND, so phy_suspend() returns -EBUSY and the
link interrupts are never masked.

BCM54xx with a DT interrupt and no WoL configured. bcm54xx_phy_probe()
calls device_init_wakeup(&phydev->mdio.dev, true) whenever
bcm54xx_phy_can_wakeup() is true, which is whenever
phy_interrupt_is_valid(). So phy_may_wakeup() is true by default, and the
speed-down and PHY_IRQ_WAKE_SYSTEM apply on every suspend.

Before this patch, MAC-managed PHYs never reported a wakeup from
phy_interrupt(). The driver handler read the status, and handlers such as
rtl8211f_handle_interrupt() report a wakeup only on the PME bit.

This also seems to contradict the commit message:

  ... and the MAC device may
  wake the system on its own, so a link interrupt the MAC causes must not
  abort suspend.

The Helios64 result ("no suspend aborted") seems to depend on
rtl8211f_suspend() writing RTL8211F_INER_PME to RTL821x_INER before the
speed-down. That masks the link interrupt, and other PHY drivers do not do
the same.

The postponed path also never reads or clears the status. Doesn't that
leave a level-triggered INT asserted, with the line disabled by
disable_irq_nosync() until resume?

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261111-b4-phylib-mac-pm-irq-v3-v5-0-bbfdb5afb7d3%40iav.lv

