Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 014D6606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 22:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0jsJGIHW;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xvp1bFJP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=JXcFHflK0e4wRmdk/kevbkxf3N1Rrm6teC1Baw2ZrKs=; b=0jsJGIHW0pTnPOzGbA6q0s1Y3P
	L45uECaa7MvowkV+UMRqQdqGFd/zJO+SpnXiJYdkkC8gVWSj/VaOcaZ0JKksZtMkOW5h81C72cv+W
	u4PP4FJcN1koqcBA0xvSCE6pYE/6dMIh8YJaCV5oacOyo8B48NjVsSq9Of7xYZ207xw6PRnYI/73z
	5CFQ3EzlUUAp7WsAtC8D5/0NEjz6Pmh/bRgGXaUvAVeseaL5iWykVziJ+kmEkeM1adp8sQ1I0aTOs
	6BEw+WW9lngTcenM/p38pqorzhfuaui+P+rlc3QBSM2MwuLHemzF1PUayAPn7HjZN1dUp2KaxtyFI
	J1NqvLtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVFew-00000001pTv-0SpQ;
	Sun, 22 Nov 2026 22:03:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVFeQ-00000001pHA-2pb2;
	Sun, 22 Nov 2026 22:03:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6CAD844F0F;
	Sun, 22 Nov 2026 22:03:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 135B61F000D0;
	Sun, 22 Nov 2026 22:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795384990;
	bh=JXcFHflK0e4wRmdk/kevbkxf3N1Rrm6teC1Baw2ZrKs=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Xvp1bFJPOAJko1gTYkkHi2xliN+e/SJiZolJ42UqB3t+AJeXOGSOQ5M3gp0cCrTVu
	 WlElUWX8cjccqnKCXUFtDIAOk0UnEjRmvnKjHkuN//tBxB46wH7JtSt4NcYSZdLwHK
	 pabOJlkT5LsHkk8Sz0RrnF48e4UvYvDwd6sfU1Xqxg/ZnQrCm82u32LY4lXfIdKuU4
	 cghezifPWoqfei365GGZxdBoUHa6PoIz9SZSDhoQBd5invBxbyGW6oJlUo16aHhzLc
	 FMIHGF7nKSqNWoMk3DX2e9lrABETD7T1IU3em0tiIs6EzvqHvG/YL7C/l4E+FAg2tZ
	 pZBTp7cixDXjg==
Subject: Re: [PATCH net v7 5/5] net: phy: postpone PHY interrupts during sleep
 with MAC-managed PM
From: netdev-bot+sashiko@kernel.org
To: iav@iav.lv
Cc: andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 tglx@kernel.org, linux-pm@vger.kernel.org, maxime.chevallier@bootlin.com,
 lukas@wunner.de, rafael.j.wysocki@intel.com, wei.fang@nxp.com,
 niklas.soderlund@ragnatech.se, paul@pbarker.dev,
 florian.fainelli@broadcom.com, opendmb@gmail.com, Thangaraj.S@microchip.com,
 shenwei.wang@nxp.com, Haoning.CHENG@cn.bosch.com, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Date: Sun, 22 Nov 2026 22:03:08 +0000
Message-ID: <179538498865.3135.16577116981763828111@kernel.org>
In-Reply-To: <20261119-b4-phylib-mac-pm-irq-v3-v7-5-d8b8f43b5a62@iav.lv>
References: <20261119-b4-phylib-mac-pm-irq-v3-v7-5-d8b8f43b5a62@iav.lv>
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

Critical: 0 · High: 0 · Medium: 1 (1) · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] Two phylib changes interact badly.

Pre-existing issues:
- [Medium] This problem wasn't introduced by this patch, but
  mdio_bus_phy_resume() (drivers/net/phy/phy_device.c:439-445) returns…

--

net: phy: postpone PHY interrupts during sleep with MAC-managed PM

With this commit, mdio_bus_phy_suspend() also sets irq_suspended for PHYs
with MAC-managed PM, so their interrupts are postponed across system
sleep, and phy_interrupt() no longer reports a wakeup for them. It also
adds noirq callbacks. The suspend one re-enables a line that a postponed
interrupt disabled if the line is armed for wakeup. The resume one
disables it again before resume_device_irqs().

> diff --git a/drivers/net/phy/phy.c b/drivers/net/phy/phy.c
> index 6cc94b525e093..45891570a56ee 100644
> --- a/drivers/net/phy/phy.c
> +++ b/drivers/net/phy/phy.c
> @@ -1419,7 +1419,10 @@ static irqreturn_t phy_interrupt(int irq, void *phy_dat)
>  	if (IS_ENABLED(CONFIG_PM_SLEEP) && READ_ONCE(phydev->irq_suspended)) {
>  		struct net_device *netdev = phydev->attached_dev;
>  
> -		if (netdev) {
> +		/* With MAC-managed PM, a postponed interrupt cannot tell
> +		 * Wake-on-LAN from a link change the MAC causes.
> +		 */
> +		if (netdev && !phydev->mac_managed_pm) {
>  			struct device *parent = netdev->dev.parent;
>  
>  			if (netdev->ethtool->wol_enabled)

[ ... ]

> diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
> index 8bc394ff7d2d2..c700b34e40a2c 100644
> --- a/drivers/net/phy/phy_device.c
> +++ b/drivers/net/phy/phy_device.c

[ ... ]

> @@ -377,11 +378,14 @@ static __maybe_unused int mdio_bus_phy_suspend(struct device *dev)
>  	struct phy_device *phydev = to_phy_device(dev);
>  	int ret;
>  
> +	/* An interrupt can fire while the MAC has the MDIO bus powered
> +	 * down, whether or not the MAC manages PHY PM.
> +	 */
> +	mdio_bus_phy_suspend_irq(phydev);
> +
>  	if (phydev->mac_managed_pm)
>  		return 0;
>  
> -	mdio_bus_phy_suspend_irq(phydev);
> -
>  	/* We must stop the state machine manually, otherwise it stops out of
>  	 * control, possibly with the phydev->lock held. Upon resume, netdev
>  	 * may call phy routines that try to grab the same lock, and that may
> @@ -414,8 +418,10 @@ static __maybe_unused int mdio_bus_phy_resume(struct device *dev)
>  	struct phy_device *phydev = to_phy_device(dev);
>  	int ret;
>  
> -	if (phydev->mac_managed_pm)
> +	if (phydev->mac_managed_pm) {
> +		mdio_bus_phy_resume_irq(phydev);
>  		return 0;
> +	}
>  
>  	if (!phydev->suspended_by_mdio_bus)
>  		goto no_resume;

[Severity: Medium]
This is a pre-existing issue, not one introduced by this patch. Further
down in mdio_bus_phy_resume(), the error returns skip
mdio_bus_phy_resume_irq():

drivers/net/phy/phy_device.c:mdio_bus_phy_resume() {
    ...
	ret = phy_init_hw(phydev);
	if (ret < 0)
		return ret;

	ret = phy_resume(phydev);
	if (ret < 0)
		return ret;
no_resume:
	mdio_bus_phy_resume_irq(phydev);
    ...
}

On a PHY without MAC-managed PM, what happens if phy_init_hw() or
phy_resume() fails? irq_suspended would stay true, so every later PHY
interrupt is postponed. If a postponed interrupt had set irq_rerun, its
disable_irq_nosync() would never be undone, which leaves the PHY line
disabled after resume, along with any other users of a shared line. The
state machine is not restarted either.

This lasts until a later suspend/resume cycle completes cleanly. The new
noirq enable/disable pair runs before mdio_bus_phy_resume(), so it stays
balanced and does not make this worse. Should these error paths still go
through mdio_bus_phy_resume_irq()?

> @@ -446,8 +452,46 @@ static __maybe_unused int mdio_bus_phy_resume(struct device *dev)
>  	return 0;
>  }
>  
> -static SIMPLE_DEV_PM_OPS(mdio_bus_phy_pm_ops, mdio_bus_phy_suspend,
> -			 mdio_bus_phy_resume);
> +static __maybe_unused int mdio_bus_phy_suspend_noirq(struct device *dev)
> +{
> +	struct phy_device *phydev = to_phy_device(dev);
> +	struct irq_data *d;
> +
> +	mutex_lock(&phydev->irq_pm_lock);
> +	/* We enable the line a postponed interrupt disabled if the irq core
> +	 * armed it for wakeup, so that it wakes the system.
> +	 */
> +	if (phydev->irq_rerun) {
> +		d = irq_get_irq_data(phydev->irq_rerun_line);
> +		if (d && irqd_irq_disabled(d) && irqd_is_wakeup_armed(d)) {
> +			enable_irq(phydev->irq_rerun_line);
> +			phydev->irq_wake_enabled = true;
> +		}
> +	}

[Severity: Medium]
Can this enable_irq() unmask a line whose PHY interrupt source was never
acked?

The postponed branch of phy_interrupt() does no MDIO access. The PHY's
latched status (BCM54xx ISR, RTL8211F INSR) stays set, and the PHY keeps
INT asserted. With the new !phydev->mac_managed_pm check, no wakeup is
reported either.

Before this patch, MAC-managed PHYs were not postponed. Their
handle_interrupt() ran and acked the status.

On a level-triggered line, would enable_irq() here go straight to
irq_pm_check_wakeup() -> pm_system_irq_wakeup() and abort the suspend?

With stmmac this could happen on every attempt. stmmac sets
wol_phy_speed_ctrl, and phylink_suspend() renegotiates the link after
phylink_stop(). The PHY is a child of the MAC's MDIO bus, so it is
already postponing by then:

drivers/net/phy/phylink.c:phylink_suspend() {
    ...
	} else {
		phylink_stop(pl);
	}

	if (phylink_phy_pm_speed_ctrl(pl))
		phylink_speed_down(pl, false);
}

rtl8211f_suspend() masks link interrupts and reads INSR before this
point, but bcm54xx_suspend() does not when WoL is enabled:

drivers/net/phy/broadcom.c:bcm54xx_suspend() {
    ...
	ret = bcm_phy_read_exp(phydev, BCM54XX_WOL_INT_STATUS);
	if (ret < 0)
		return ret;

	if (phydev->wol_enabled)
		return bcm54xx_set_wakeup_irq(phydev, true);
    ...
}

Meanwhile bcm_phy_set_wol() wake-arms the shared link/WoL line:

	if (phy_interrupt_is_valid(phydev))
		enable_irq_wake(phydev->irq);

On bcmgenet, bcmasp and bcmsysport, which set mac_managed_pm and use
these PHYs, a remote link change inside this window would now abort the
suspend once. Previously the interrupt was simply acked. The commit
message says PHY drivers have to restrict the interrupt to Wake-on-LAN in
their suspend callback. Should the drivers that don't do this be updated
in the series?

On an edge-triggered line, the commit message says:

    An edge the postponed interrupt consumed does not repeat, so
    on an edge-triggered line a magic packet that arrives during the
    transition does not abort it; the next one wakes the system.

Does this hold for PHYs that keep INT asserted until the status register
is read, such as RTL8211F INTB/INSR? The postponed interrupt never reads
the status. After enable_irq() there would be no new edge and nothing
pending to resend, and no wakeup was reported for a MAC-managed PHY. Could
Wake-on-LAN then stay lost for the whole sleep?

These callbacks are also installed as freeze_noirq/thaw_noirq through
SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(), so hibernation image creation looks
exposed to the same aborts.

> +	mutex_unlock(&phydev->irq_pm_lock);
> +
> +	return 0;
> +}

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261119-b4-phylib-mac-pm-irq-v3-v7-0-d8b8f43b5a62%40iav.lv

