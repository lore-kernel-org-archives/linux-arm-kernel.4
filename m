Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5D3C606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 11:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gFr9JH3M;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QWX15aP3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=tybZ8A9gQEPaCmNc6ZBx7xtz6zHhGLsPWUWzuEyVLfQ=; b=gFr9JH3MAKFovRvras6JtwpMFD
	EEJj155gfAdX+4WVYmZXPrs6dcRWlGQTphEZBWrCRNPfk7+VBtcjHqiwBG8AAIjMSCNXg5IU9dq4S
	73viullrdas8IceMm/p13k1LEEvaQKINyucIrby4Gu7uecpTl2TYpS0U687CLVp3NJA9Q7c7M0+gi
	qRA+x9ajItQ5QVtcbeHmzJx9Lg/KXrfDadoQjsRahsCcEl61SgMuRfqYJ3oo95PzLNGiz5i9eVA4a
	mbkS3mnAIgvL02I+76mGDtA8cjWeR5hwOtzk3HBqjs8dot+ui5sV+1E/nXDQLZM8r4MbaIG0D+BQY
	m36BFKJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVoVX-00000006JGM-16TL;
	Tue, 24 Nov 2026 11:16:19 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVoVV-00000006JGF-3rNi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 11:16:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 151C6623C5;
	Tue, 24 Nov 2026 11:16:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D45611F000C0;
	Tue, 24 Nov 2026 11:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795518976;
	bh=tybZ8A9gQEPaCmNc6ZBx7xtz6zHhGLsPWUWzuEyVLfQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=QWX15aP3PT81dY6/DPQL3gVieVvQ6oTnTRBjI50dADq62vH9PBHJZ1bw/kPPeDTe6
	 2WTm2ZTLjFV5Wq0WgxvA68MI3/eT3T0jzYH2ohpsw0qvCZ480OTVKSj4/8Nbi4OIVp
	 J7Y+K3TgTTF0fUcUQ8fI5AOdFwAGYc6f01YD4dqv/LU4qDqlUoqxptNgFGlH6x3xBI
	 xShKmi0u3MFPxWBC6YhhZvTqcsuxXxGuBFDfovKufkrMpgHd+oijxwiKn4UW0+peMb
	 Wpz0+WglLKkwG4AKdGBR1mYuT2bm1UJ2vkGYT3g9RAylLi5lbcmBAHCoAv1gUxk2B1
	 BG8xoxVz6Qa8g==
Subject: Re: [PATCH net-next v4 1/5] net: stmmac: dwmac-sun8i: Put the EPHY
 clock and reset after the MAC
From: netdev-bot+sashiko@kernel.org
To: aiyengar1990@gmail.com
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, wens@kernel.org,
 jernej.skrabec@gmail.com, samuel@sholland.org, p.zabel@pengutronix.de,
 linux@armlinux.org.uk, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org
Date: Tue, 24 Nov 2026 11:16:15 +0000
Message-ID: <179551897540.3135.862711203479532427@kernel.org>
In-Reply-To: <20261120-sun8i-emac-mux-uaf-v4-1-57eba8915f25@gmail.com>
References: <20261120-sun8i-emac-mux-uaf-v4-1-57eba8915f25@gmail.com>
X-sashiko-severity: Low
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] The commit fixes a real use-after-free on the sun8i_dwmac_probe()
  error path but has no Fixes: tag and no Cc: stable, so stable trees…

--

net: stmmac: dwmac-sun8i: Put the EPHY clock and reset after the MAC

This commit moves the reset_control_put() and clk_put() calls for the
internal PHY so they run after stmmac_pltfr_remove(). Before, they ran
before it, both on the sun8i_dwmac_probe() mdio-mux error path and in
sun8i_dwmac_remove(). This fixes a use-after-free because
sun8i_dwmac_exit() still uses ephy_clk and rst_ephy to unpower the
internal PHY.

> net: stmmac: dwmac-sun8i: Put the EPHY clock and reset after the MAC
>
> sun8i_dwmac_exit() unpowers the internal PHY through ephy_clk and
> rst_ephy, but the probe error path and sun8i_dwmac_remove() put both
> before stmmac_pltfr_remove() calls it. If mdio_mux_init() fails after
> the scan of the internal bus has powered the PHY, this is a
> use-after-free.
>
> Put them after stmmac_pltfr_remove(). The explicit unpower in remove()
> is then redundant.
>
> Suggested-by: Chen-Yu Tsai <wens@kernel.org>
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>

[Severity: Low]
Should this have a Fixes: tag, and perhaps Cc: stable? Without them, the
stable trees won't pick up the use-after-free fix automatically.

The ordering problem seems to come from commit 529254216773 ("net: stmmac:
dwmac-sun8i: Balance internal PHY resource references"). That commit added
the puts under the dwmac_mux label, and that error path then called
sun8i_dwmac_exit() explicitly.

Today, the same error path falls through to:

stmmac_pltfr_remove()->stmmac_dvr_remove()->sun8i_dwmac_exit()
    ->sun8i_dwmac_unpower_internal_phy()

When internal_phy_powered is true, that runs clk_disable_unprepare() and
reset_control_assert() on handles that have already been released.

The flag can be true here. mdio_mux_init() scans the internal bus first,
and mdio_mux_syscon_switch_fn()->sun8i_dwmac_power_internal_phy() sets it.
A later child bus can then fail with -EPROBE_DEFER, which is an ordinary
event.

Would something like this be appropriate?

Fixes: 529254216773 ("net: stmmac: dwmac-sun8i: Balance internal PHY resource references")

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> index 2ece7ba9dd73b..9fb398f7cf9ec 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> @@ -1236,7 +1236,7 @@ static int sun8i_dwmac_probe(struct platform_device *pdev)
>  		ret = sun8i_dwmac_register_mdio_mux(priv);
>  		if (ret) {
>  			dev_err(&pdev->dev, "Failed to register mux\n");
> -			goto dwmac_mux;
> +			goto dwmac_remove;
>  		}
>  	}
>
> @@ -1244,12 +1244,11 @@ static int sun8i_dwmac_probe(struct platform_device *pdev)
>
>  	return 0;
>
> -dwmac_mux:
> -	reset_control_put(gmac->rst_ephy);
> -	clk_put(gmac->ephy_clk);
>  dwmac_remove:
>  	pm_runtime_put_noidle(&pdev->dev);
>  	stmmac_pltfr_remove(pdev);
> +	reset_control_put(gmac->rst_ephy);
> +	clk_put(gmac->ephy_clk);
>  dwmac_syscon:
>  	sun8i_dwmac_unset_syscon(gmac);

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261120-sun8i-emac-mux-uaf-v4-0-57eba8915f25%40gmail.com

