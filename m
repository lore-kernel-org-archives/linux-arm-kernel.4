Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 721BA606A325
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 10:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gA2O1hib;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A7MKf6u5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=wtOLIIGy2V2qdHSm0s3wSDnD9BTWQqmLjRaYH3bZpf0=; b=gA2O1hibv6OQMC03RrZO4GDBuv
	qI0gyyQVgqdZ4tc7aSGhrwg2ZGkzaU0dUp+HoBcUIkLC2MM2EmnDkMDBrXZoOxIwYarhM2giZPdmO
	Yv6NF5hTYOHQxFcacv+MW7xBKM+8qe/m7ReZ372nisMPc43jW+9bvNFC9j+Jrv6mLaHpCoF7Nnh/M
	OCLQt/6DvKzB1tuyCKPZtfsGciRat1veQ8wbJkePgwin5nAuWNCsPPADQSRcKh1/Cg/4poapfbH9z
	yh4TF1UHnRFPkO9rMrozbhDSaD3o+r9L75zdxHh9QHTCst/fIL7hqhVXQ0pIXnbGy5DtqYbEiIKyi
	aEzVlvXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTd6f-00000008b0l-1xxE;
	Wed, 18 Nov 2026 10:41:37 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTd6Y-00000008awT-06nd;
	Wed, 18 Nov 2026 10:41:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 291A2620F4;
	Wed, 18 Nov 2026 10:41:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4AF91F000C4;
	Wed, 18 Nov 2026 10:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794998488;
	bh=wtOLIIGy2V2qdHSm0s3wSDnD9BTWQqmLjRaYH3bZpf0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=A7MKf6u5BHKVv1R+Sujt5r3gCGRPLDpsQh5UyGBQWLTwhrw3HU8TlJiyxwPrUE3mN
	 Huj5qK6DeLVXVLYA4MUu6uJHwaTzAeA+CEXzTZNAu2UhXHdjFUHRIgu8HQrEvGmcEH
	 OBlCpLIIxDmCKpsZGWhV9kZD+3YGtisvctqk2/zqx21lL5Kl7XEBE/EiCYfFE5Mf3W
	 Mv+wRB9fNsgyp1QBEKvscVcTygexfmL0BQqXcGhxQh+OVks8SezcqxTi9vLPCsALop
	 2e37kfKZM7MZLokOefBdu8+tkkdC8OQtDqVyUQGZrbtO7vjktfCYKz3qvR+lrXdGLa
	 f3FGIt0Qr74/Q==
Subject: Re: [PATCH net-next v3 2/2] net: stmmac: dwmac-rk: Add RK3572 support
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
Date: Wed, 18 Nov 2026 10:41:27 +0000
Message-ID: <179499848737.3136.8604402338812509621@kernel.org>
In-Reply-To: <20261116-add-board-ok3572-c-net-v3-2-a957fdcd9c7a@qq.com>
References: <20261116-add-board-ok3572-c-net-v3-2-a957fdcd9c7a@qq.com>
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

- [Medium] RK3572 RGMII delay lines get fixed values that the DT is not
  allowed to describe.

--

net: stmmac: dwmac-rk: Add RK3572 support

This patch adds RK3572 support to the Rockchip dwmac glue driver. It
covers the register layout for the two GMAC controllers in the PHP and
NVM0 GRFs, plus a set_to_rgmii callback that programs the RGMII delay
lines through the IOC.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> index a37df5767d84e..c9d8d8bf51f7b 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c

[ ... ]

> +static void rk3572_set_to_rgmii(struct rk_priv_data *bsp_priv,
> +				int tx_delay, int rx_delay)
> +{
> +	u32 val = GRF_FIELD(14, 8, rx_delay) | GRF_FIELD(6, 0, tx_delay) |
> +		  GRF_FIELD(15, 15, !!rx_delay) | GRF_FIELD(7, 7, !!tx_delay);
> +
> +	if (bsp_priv->id == 1) {
> +		regmap_write(bsp_priv->php_grf, RK3572_VCCIO0_3_VO_IOC_CON1, val);
> +		regmap_write(bsp_priv->php_grf, RK3572_VCCIO5_6_IOC_MISC0, val);
> +	} else {
> +		regmap_write(bsp_priv->php_grf, RK3572_VCCIO1_2_4_VI_IOC_CON1, val);
> +	}
> +}

[Severity: Medium]
Where are the tx_delay and rx_delay values for RK3572 meant to come from?

The companion binding change in rockchip-dwmac.yaml forbids the legacy
properties for this compatible:

  - if:
      properties:
        compatible:
          contains:
            const: rockchip,rk3572-gmac
    then:
      properties:
        rx_delay: false
        tx_delay: false

That means a schema-valid RK3572 node never has them. rk_gmac_setup() then
falls back to the old defaults and logs an error on every probe:

drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c:rk_gmac_setup() {
    ...
	ret = of_property_read_u32(dev->of_node, "tx_delay", &value);
	if (ret) {
		bsp_priv->tx_delay = 0x30;
		dev_err(dev, "Can not read property: tx_delay.");
    ...
	ret = of_property_read_u32(dev->of_node, "rx_delay", &value);
	if (ret) {
		bsp_priv->rx_delay = 0x10;
		dev_err(dev, "Can not read property: rx_delay.");
    ...
}

rk_gmac_powerup() passes these defaults on for "rgmii" (both delays),
"rgmii-rxid" (tx_delay) and "rgmii-txid" (rx_delay). Since bits 15 and 7
are set from !!rx_delay and !!tx_delay, rk3572_set_to_rgmii() switches on
the IOC delay lines with 0x30/0x10 taps for every RGMII mode except
"rgmii-id".

The 0x30/0x10 defaults come from older Rockchip SoCs. Do they match the
RK3572 tap size?

A board can't override them without failing schema validation. The driver
also doesn't read rx-internal-delay-ps or tx-internal-delay-ps.

Consider a board that uses "rgmii" with PCB delays, or a PHY that adds its
own delay. Could this leave the RX/TX sampling skewed, with no supported
way to fix it in DT?

Would it make sense to either zero the MAC-side delays for RK3572 when the
legacy properties are absent, or take them from the standard
*-internal-delay-ps properties? If not, should the binding keep allowing
tx_delay/rx_delay for now?

> +
> +static const struct rk_gmac_ops rk3572_ops = {
> +	.init = rk3572_init,
> +	.set_to_rgmii = rk3572_set_to_rgmii,

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261116-add-board-ok3572-c-net-v3-0-a957fdcd9c7a%40qq.com

