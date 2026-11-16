Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17E75606A322
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 15:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=N8PJYrop;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ziyao.cc header.i=@ziyao.cc header.a=rsa-sha256 header.s=zmail header.b=AFaqHAup
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=pKtllUb24DfLjvXDwRNM1UEMN040e8zEO8RULkM6i44=; b=N8PJYrop4+PTqz3AEgU7bdw1tK
	hme5vavfRVK3A9mB5/rXj+qVnbe11WcH3i1wfZ8FY6E6k8Rr9bnM7ISOYr9NoohcMX+DXJ/VI0y24
	W/wRUWMM2wXi9vFV89Sc1elTKJ8cLOBXL94XtgxmOn0CdzPHYSv9ENTdVh07BJzf8AumqBp+DXdSy
	18T81V5z6lNaH1QxrOtEHiJ5eIvyhP61H6zavukvCJic2rF3RFfpnO5m+ftUYVzw0KWe21X9JX7nd
	Js1fkyA/2vMizHgN6dbQSkFIoYSlYu9AtOmp/u3l5dYToJHhTv3lNAQo0C7Gb1WGjlpuOqVbEOyMY
	tQjV7ssg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSySZ-000000031OK-2Gfk;
	Mon, 16 Nov 2026 15:17:31 +0000
Received: from sender5-op-o15.zoho.com ([165.173.182.15])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSySX-000000031NL-28Zx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 15:17:30 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1794842228; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=DbxC62yWl1KNmfowR70rdGrZi+jCnrkzysH8KmbGo8EqnMBVky4V7Asu73XVNdsuC3LBNC3YlAlmlxGe15/anmR96P//+EJWiv2HJYWxMIWGj12u5JzeYIa94E9hoizT4jT9k7TDq2gk85eH5a/jMqX7loHuoDVuV38hvn1O5s0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794842228; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=pKtllUb24DfLjvXDwRNM1UEMN040e8zEO8RULkM6i44=; 
	b=N1DrfHmK3RnFYNhid+id7GC6rVntY7WljErE67OasB6b08J1+gIyNXA2cDZi7AfI4P2Ur98WYYpIGn17UbQu7j5GrYf+9e5uXMaOSlTZA7IjKuXCXmhphX/TAflDhP8WS+Uzeu2fWdV9JNGRIpXhaAVDXNO2NrrRNeIr4ek/rSw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ziyao.cc;
	spf=pass  smtp.mailfrom=me@ziyao.cc;
	dmarc=pass header.from=<me@ziyao.cc>
DKIM-Signature: a=rsa-sha256; b=AFaqHAupFsJN/VJazoE4LYC6a1638cmd9CW92FweqOn6B7EuhqxTCPIJPGXyDD+gNGjvd0v32X0QiD3akko+LR56dPHz5yGYBz6aE9ELk9tfQhq7UXQQUQu8AlWMCbsgR845IjRxQ2sm+0gEpMXmlInXp7YFbzgXeSO1JGJDLSQ=; c=relaxed/relaxed; s=zmail; d=ziyao.cc; v=1; bh=pKtllUb24DfLjvXDwRNM1UEMN040e8zEO8RULkM6i44=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794842226489579.9379874741966;
	Mon, 16 Nov 2026 07:17:06 -0800 (PST)
Date: Mon, 16 Nov 2026 15:17:00 +0000
From: Yao Zi <me@ziyao.cc>
To: Magnus Leatti <magnusleatti@kernelriot.com>, me@ziyao.cc,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Giuseppe Nespolino <g.nespolino@gmail.com>, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 2/2] net: stmmac: dwmac-motorcomm: support
 Wake-on-LAN from S5
Message-ID: <avsebFtnIASV-KpV@pie>
References: <20261116091757.1656602-1-magnusleatti@kernelriot.com>
 <20261116091757.1656602-3-magnusleatti@kernelriot.com>
 <avscVrGbi7mFicuz@pie>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <avscVrGbi7mFicuz@pie>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/294.637.76
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_071729_573644_10D9E1BA 
X-CRM114-Status: GOOD (  43.35  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 16, 2026 at 03:08:06PM +0000, Yao Zi wrote:
> On Mon, Nov 16, 2026 at 06:17:57AM -0300, Magnus Leatti wrote:
> > The driver reports "Supports Wake-on: ug" and accepts "wol g", but a
> > YT6801 in S5 ignores magic packets. At power-off stmmac_suspend() arms
> > the PMT register, but the chip's out-of-band WoL block stays disabled
> > as motorcomm_init() leaves it, the packet wake bit in WOL_CTRL is clear
> > and PME is turned off.
> > 
> > When powering off with Wake-on-LAN set, the interface up and wakeup
> > enabled for the device, keep PME enabled and arm the chip after
> > stmmac_suspend():
> > 
> >  - Enable OOB WoL. Without it the chip does not wake.
> >  - Write the MAC address in use to the first address filter again.
> >    Enabling OOB WoL reloads the factory address there. Without the
> >    rewrite the chip wakes on the factory address and ignores the one
> >    in use. The rewrite follows a 2 ms wait, as in the vendor driver:
> >    without the wait the reload lands after the rewrite.
> >  - Set the packet wake enable bit in WOL_CTRL. Without it the chip
> >    does not wake.
> > 
> > The sequence follows the vendor driver, with two differences. The
> > vendor also sets bit 9 of LPW_CTRL. The chip wakes without it, so it is
> > left alone. The vendor puts the function in D3hot. Here it stays in D0.
> > With MAC Wake-on-LAN phylink keeps the PHY running and phylib keeps
> > polling it until power is removed. In D3hot the MDIO registers read as
> > all-ones, the poll fails with -EBUSY and phylib warns from
> > phy_error_precise(). That warning was seen 111 ms after entering D3hot
> > on a normal power-off.
> > 
> > The PHY is left at the negotiated speed. Reboot and kexec are not
> > armed: OOB WoL can only be disabled again by a chip reset, so it is
> > enabled only when powering off, and the next probe resets the chip. If
> > the interface is down at power-off, the system does not wake.
> > 
> > Suspend is not changed. Hibernation that powers off through the
> > shutdown path arms the chip the same way. Neither was tested.
> > 
> > Tested on a Celeron N3350 mini PC, magic packets sent from another host
> > 75 s after power-off:
> > 
> >   net-next  wol g                         no wake, 3 of 3
> >   patched   wol g                         wake, 8 of 8 (28-31 s to ping)
> >   patched   wol u                         wake on unicast, 1 of 1
> >   patched   wol d                         no wake, 3 of 3
> >   patched   wol g, interface down         no wake, 1 of 1
> >   patched   wol g, power/wakeup disabled  no wake, 1 of 1
> >   patched   wol g, reboot                 reboots, link back, 3 of 3
> > 
> > The kernel log of each of these shutdowns, read back after the next
> > boot, shows no warning from the shutdown path.
> > 
> > A second board, a PSJ8500-N97 mini PC (Intel N97), behaves the same.
> > 
> > Signed-off-by: Magnus Leatti <magnusleatti@kernelriot.com>
> > ---
> >  .../ethernet/stmicro/stmmac/dwmac-motorcomm.c | 68 ++++++++++++++++++-
> >  1 file changed, 65 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-motorcomm.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-motorcomm.c
> > index 1e142ad39e33..034547ad1e98 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-motorcomm.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-motorcomm.c
> 
> [...]
> 
> > @@ -204,9 +207,51 @@ static int motorcomm_resume(struct device *dev, void *bsp_priv)
> >  	return 0;
> >  }
> >  
> > +/*
> > + * Arm the chip to wake the system from S5. stmmac_suspend() has already
> > + * programmed the PMT register of the GMAC. The rest lives in the wrapper.
> > + */
> > +static void motorcomm_arm_s5_wake(struct net_device *ndev)
> > +{
> > +	struct stmmac_priv *spriv = netdev_priv(ndev);
> > +	struct dwmac_motorcomm_priv *priv = spriv->plat->bsp_priv;
> > +	u32 reg;
> > +
> > +	/*
> > +	 * motorcomm_init() disables OOB WoL right after the chip reset, as
> > +	 * normal operation requires. With it disabled the chip ignores wake
> > +	 * packets once the system is off. Once it has been enabled, only a
> > +	 * chip reset disables it again, so enable it only when powering off.
> > +	 */
> > +	reg = readl(priv->base + OOB_WOL_CTRL);
> > +	reg &= ~OOB_WOL_CTRL_DIS;
> > +	writel(reg, priv->base + OOB_WOL_CTRL);
> > +
> > +	/*
> > +	 * Enabling OOB WoL reloads the address from eFuse into the first
> > +	 * MAC address filter. Write the address in use again, or the chip
> > +	 * wakes on the factory address only. The reload is not immediate:
> > +	 * without the wait, taken from the vendor driver, it overwrites
> > +	 * the address written here.
> > +	 */
> > +	usleep_range(2000, 3000);
> > +
> > +	rtnl_lock();
> > +	phylink_rx_clk_stop_block(spriv->phylink);
> > +	stmmac_set_umac_addr(spriv, spriv->hw, ndev->dev_addr, 0);
> 
> Does the chip automatically enables WoL and loads MAC from eFuse on
> power-on? If so, the driver's WoL behavior would vary if the software

Aside from a clean power-on, its behavior on reset also matters. If the
NIC falls into WoL on both power-on and reset with a reasonable MAC
address set already, we might probably call stmmac_dvr_remove() in
.shutdown() to detach the NIC from kernel's infrastructure, then reset
it with SYS_RESET to get a functional WoL state in S5.

> alternates the NIC's MAC address, depending whether it's a cold boot or
> a warm one.
> 
> Please confirm the chip's behavior on reset.
> 
> > +	phylink_rx_clk_stop_unblock(spriv->phylink);
> > +	rtnl_unlock();
> > +
> > +	reg = readl(priv->base + WOL_CTRL);
> > +	reg |= WOL_CTRL_PKT_EN;
> > +	writel(reg, priv->base + WOL_CTRL);
> > +}
> 
> [...]
> 
> -- 
> Thanks,
> Yao Zi
> 
> Meow-mrrp-mrow, I'm a cat.

-- 
Thanks,
Yao Zi

Meow-mrrp-mrow, I'm a cat.

