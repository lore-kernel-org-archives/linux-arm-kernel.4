Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E79F60A260A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 10:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TgEU2aA4;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aHzdJmhr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=eA5bJYl2DX4B2F944LFo8gIjbAOwIGsts+2iJmGpa8o=; b=TgEU2aA4sYXdnwMGHTfE2xcF//
	nfQ/shk9DldOvn9cLz5vzW0DuBH9RrSfMRYR5UGNJAllIgB3g9MvSV/7ywcr7aRg/+k6RUtRZiS9N
	cIT5t54kWfMQJ9PTTL9FM3qwaEP4LSreHcZvMiw4iL5Rqxyd39oU+zBhY9UYPlafsrMlNebU7/d7p
	Qf0YJLePOUYkd5idlLtZrLOyQ0ZniP0bhEKKlLzk0/jmaCwhJ1oYtU8gwWsDlA+2vjKpFYCtxuSNz
	h93HJ3unaxuRojpZs80/NLz5VxD9H0m2xi8H1NxcLsOWOFfY5xlJ6HWSn3UoK700R9+oBQH2ovMEF
	8PtfKvOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTd6X-00000008aw7-0R7z;
	Wed, 18 Nov 2026 10:41:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTd6V-00000008avI-3gWc;
	Wed, 18 Nov 2026 10:41:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4F5FA430AF;
	Wed, 18 Nov 2026 10:41:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 050011F000C4;
	Wed, 18 Nov 2026 10:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794998487;
	bh=eA5bJYl2DX4B2F944LFo8gIjbAOwIGsts+2iJmGpa8o=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=aHzdJmhrk8AvQMP52KBWR3kJhhJe6X/JHFc7uTrs9EDvrY43MMWzcSg5DDKNd2TY5
	 6o2+AfxvyYC0wvWPhtioeeS0TzXrzwWBeqs4qeehRlvKjTFHoihcYFt2rJyz3FOJ22
	 Mdx+krFvoBCZYVDZZo/aZrQMAxJCfP46uOBojDxMd58fnNCzkhB1hUeGBypRZRzuk7
	 ZjZtgXSsIL5Hexl/KsBsLkpP+UD5XrRX0Z+GIhhXcpKvC9oOh9SxGH8qo0vp6w/mYt
	 soRJFkgckm2aA04YpxiUPCsy/LEeKZ+g5LJEkC1NYrxwuiqH7Qfb22CTIHU40+qbpi
	 Yq01+xFRqcPzg==
Subject: Re: [PATCH net-next v3 1/2] dt-bindings: net: rockchip-dwmac: Add RK3572
From: netdev-bot+sashiko@kernel.org
To: 1579567540@qq.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, heiko@sntech.de, david.wu@rock-chips.com,
 alexandre.torgue@foss.st.com, peppe.cavallaro@st.com, joabreu@synopsys.com,
 maxime.chevallier@bootlin.com, mcoquelin.stm32@gmail.com,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Date: Wed, 18 Nov 2026 10:41:25 +0000
Message-ID: <179499848555.3136.11343853995146230295@kernel.org>
In-Reply-To: <20261116-add-board-ok3572-c-net-v3-1-a957fdcd9c7a@qq.com>
References: <20261116-add-board-ok3572-c-net-v3-1-a957fdcd9c7a@qq.com>
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

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] In rockchip-dwmac.yaml, this patch adds an allOf block that
  sets `rx_delay: false` and `tx_delay: false` for rockchip,rk3572-gmac.
- [Low] Under the subject "Add RK3572", the patch adds `deprecated: true`
  to the top-level tx_delay and rx_delay definitions in rockchip-…

--

dt-bindings: net: rockchip-dwmac: Add RK3572

This adds the rockchip,rk3572-gmac compatible, with snps,dwmac-4.20a as
the fallback, and requires rockchip,php-grf for it. It also marks
tx_delay and rx_delay as deprecated and disallows them for RK3572.

> diff --git a/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml b/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
> index e8dda1961ab31..d7b7bb0082357 100644
> --- a/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml

[ ... ]

> @@ -112,6 +114,7 @@ properties:
>      minimum: 0
>      maximum: 0x7F
>      default: 0x30
> +    deprecated: true
>  
>    rx_delay:
>      description: Delay value for RXD timing.
> @@ -119,6 +122,7 @@ properties:
>      minimum: 0
>      maximum: 0x7F
>      default: 0x10
> +    deprecated: true

[Severity: Low]
These deprecated: true lines are on the top-level tx_delay and rx_delay
definitions. Doesn't that deprecate them for every Rockchip GMAC compatible
(px30, rk3128 through rk3588, rv1108, rv1126), and not only for RK3572?

The binding doesn't name a replacement. dwmac-rk.c also doesn't read any
standard alternative such as rx-internal-delay-ps or tx-internal-delay-ps.
On the older SoCs, a board that needs MAC-side RGMII delay has no
non-deprecated way to describe it.

If a DT leaves the properties out, rk_gmac_setup() logs errors and falls
back to hidden defaults:

drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c:rk_gmac_setup() {
    ...
	ret = of_property_read_u32(dev->of_node, "tx_delay", &value);
	if (ret) {
		bsp_priv->tx_delay = 0x30;
		dev_err(dev, "Can not read property: tx_delay.");
    ...
}

Could this binding-wide deprecation go in a separate patch with a rationale
and a successor that the driver supports? Alternatively, could it be limited
to compatibles where a replacement exists?

> @@ -141,11 +145,22 @@ required:
>  allOf:
>    - $ref: snps,dwmac.yaml#
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: rockchip,rk3572-gmac
> +    then:
> +      properties:
> +        rx_delay: false
> +        tx_delay: false

[Severity: Medium]
With rx_delay and tx_delay set to false, how does an RK3572 board control
the MAC-side RGMII delay? phy-mode isn't restricted, so "rgmii",
"rgmii-rxid" and "rgmii-txid" still pass validation.

The companion commit "net: stmmac: dwmac-rk: Add RK3572 support" binds
rockchip,rk3572-gmac to rk3572_ops. That uses the shared rk_gmac_setup()
and rk_gmac_powerup() paths. rk_gmac_setup() always reads both properties.
On a valid RK3572 DT they are always missing, so it falls back to 0x30/0x10:

drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c:rk_gmac_setup() {
    ...
	ret = of_property_read_u32(dev->of_node, "tx_delay", &value);
	if (ret) {
		bsp_priv->tx_delay = 0x30;
		dev_err(dev, "Can not read property: tx_delay.");
		dev_err(dev, "set tx_delay to 0x%x\n",
			bsp_priv->tx_delay);
    ...
	ret = of_property_read_u32(dev->of_node, "rx_delay", &value);
	if (ret) {
		bsp_priv->rx_delay = 0x10;
    ...
}

That gives four dev_err() lines on every probe of every RK3572 GMAC,
rgmii-id included.

Then the set_mode switch in rk_gmac_powerup() passes those fallbacks into
ops->set_to_rgmii():

	case PHY_INTERFACE_MODE_RGMII:
		...
			bsp_priv->ops->set_to_rgmii(bsp_priv,
						    bsp_priv->tx_delay,
						    bsp_priv->rx_delay);
	...
	case PHY_INTERFACE_MODE_RGMII_RXID:
		...
						    bsp_priv->tx_delay, 0);
	...
	case PHY_INTERFACE_MODE_RGMII_TXID:
		...
						    0, bsp_priv->rx_delay);

In the companion commit, rk3572_set_to_rgmii() does:

	u32 val = GRF_FIELD(14, 8, rx_delay) | GRF_FIELD(6, 0, tx_delay) |
		  GRF_FIELD(15, 15, !!rx_delay) | GRF_FIELD(7, 7, !!tx_delay);

So the non-zero fallbacks switch on the php_grf IOC delay lines. The delay
values are fixed, and the DT can't tune them or turn them off. Before this
change, tx_delay = <0> was how to turn the delay off, and the schema now
rejects that. Only phy-mode = "rgmii-id" ends up with zero MAC delay.

The commit message says the goal is "so new designs do not use the legacy
delay properties". The schema does that, but the driver still applies
legacy delay values through its hidden defaults.

The standard tx-internal-delay-ps and rx-internal-delay-ps properties
validate through snps,dwmac.yaml and ethernet-controller.yaml. But
dwmac-rk.c never reads them, so setting them does nothing and gives no
error.

Would it make sense to either restrict RK3572 to rgmii-id (with the driver
skipping the reads and dev_err() calls for RK3572), or to add driver
support for tx-internal-delay-ps and rx-internal-delay-ps before banning
the legacy properties?

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261116-add-board-ok3572-c-net-v3-0-a957fdcd9c7a%40qq.com

