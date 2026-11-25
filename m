Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C60A5606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 14:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gdn/vkFp;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QpjZ6tOI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Noo/1qHPis8a4ZHqIhQBRWowzWTBe2fSXWZTT6D4Yww=; b=gdn/vkFppoj6RyO0gmnW6u+d66
	PPjiMTYQOQ2ZoG1LCYEWOXBkxGCl3A6JaMSRwGigEH3++yu/3SZG0AMmbqjzEsLGrfRqV0PJ/AvLl
	SkmCLDbtQL+sHI6n/x7DN6ZIbxZe9jgGqcP+YPy5eHTLlBVEQlNbE4hNSN5Vn0AvWakHNclH74eo1
	voe63Hp8B1hN+ZYgcttP7u2fzZ1SIXB0G0P3iDHn2GAyGWZjmfCmTjxyGLP8dBtdi70QAVpIRiNGx
	XqTSj5kQMWwNI7PLDWC3+P/6xEribyqSWz8OveKTzpbY1e1eAcbpJ2WSqiCRwbqwEsuknP7MB+yzn
	X94/DkaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWEN1-0000000AFdz-0ZTP;
	Wed, 25 Nov 2026 14:53:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWEMm-0000000AFX1-2Q7T;
	Wed, 25 Nov 2026 14:53:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 55F9844E00;
	Wed, 25 Nov 2026 14:53:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B54D1F000F2;
	Wed, 25 Nov 2026 14:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795618380;
	bh=Noo/1qHPis8a4ZHqIhQBRWowzWTBe2fSXWZTT6D4Yww=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=QpjZ6tOIlUhf+kQlKZgHLxYc2XlcmBaIfPkRV1LIW1ys2U5rcZAujgkg2H5gV/4AM
	 UrnSWvJXDyp/05FTYBkD9R9jSI3uzxxh9YOuNivFJe0w7W4t6HFQzQGxwS1sueI2/e
	 4A3X09csZMChHfVemR3ARVz9gcosJmopth4sAp3aDEvljqiwounqI5SC7WIDvOYSwc
	 Qn4XBn15u+NExx01d+6LUqzqVNOFUvXhpDPZAUnPMI3R/RT/mioKPLRiCmBFRif1mW
	 ZP5DYr/p68hTyp5g61kQA0opzo3ZwejEk3aS4qyAk1hxceeC2doZsic7/j0nI3KZJK
	 yZJ7PrxiCOEsg==
Subject: Re: [PATCH v8 4/4] arm64: dts: amlogic: t7: khadas-vim4: enable the
 ethernet port
From: netdev-bot+sashiko@kernel.org
To: tanure@linux.com
Cc: xianwei.zhao@amlogic.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org,
 khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, maxime.chevallier@bootlin.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Date: Wed, 25 Nov 2026 14:52:58 +0000
Message-ID: <179561837863.3135.7453763060716815613@kernel.org>
In-Reply-To: <20261121213102.143130-5-tanure@linux.com>
References: <20261121213102.143130-5-tanure@linux.com>
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

- [Medium] The commit says it enables the Khadas VIM4 ethernet port.

--

arm64: dts: amlogic: t7: khadas-vim4: enable the ethernet port

This patch enables the T7 ethernet MAC and the MDIO multiplexer on the
Khadas VIM4. It also describes the RTL8211F RGMII PHY at address 1 on the
external MDIO bus, with its interrupt on GPIOH_6. With phy-mode =
"rgmii-id", the PHY adds both RGMII delays.

> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> index 0fa83362b4179..7b86ab2579aaa 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts

[ ... ]

> @@ -256,6 +257,28 @@ xtal: xtal-clk {
>  	};
>  };
>  
> +&ethmac {
> +	status = "okay";
> +	pinctrl-0 = <&eth_pins>, <&eth_rgmii_pins>;
> +	pinctrl-names = "default";
> +	phy-mode = "rgmii-id";
> +	phy-handle = <&external_phy>;
> +};
> +
> +&eth_phy {
> +	status = "okay";
> +};

[Severity: Medium]
Can any driver at this revision bind to the ethmac node this enables?

The node in amlogic-t7.dtsi has:

arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi:
		ethmac: ethernet@fdc00000 {
			compatible = "amlogic,t7-dwmac", "snps,dwmac-5.10a";

The amlogic,t7-dwmac string appears only in amlogic-t7.dtsi. The Amlogic
glue driver's match table, meson8b_dwmac_match[] in dwmac-meson8b.c, ends
at g12a:

	{
		.compatible = "amlogic,meson-g12a-dwmac",
		.data = &meson_g12a_dwmac_data,
	},
	{ }

dwmac_generic_match[] in dwmac-generic.c ends at snps,dwmac-4.10a, plus
snps,dwmac and the snps,dwxgmac entries. Under drivers/, the only place
that names snps,dwmac-5.10a is stmmac_gmac4_compats[] in
stmmac_platform.c. That list detects the core version. It is not an
of_match_table.

If nothing probes ethmac, its mdio0 child bus is never registered. The
eth_phy mux enabled just above binds through the amlogic,g12a-mdio-mux
fallback and has mdio-parent-bus = <&mdio0>. So mdio_mux_init() would
defer on every attempt:

drivers/net/mdio/mdio-mux.c:mdio_mux_init() {
    ...
		parent_bus = of_mdio_find_bus(parent_bus_node);
		if (!parent_bus) {
			ret_val = -EPROBE_DEFER;
			goto err_parent_bus;
		}
    ...
}

Wouldn't that leave ext_mdio and external_phy unregistered, so that
phy-handle never resolves?

Also, nothing would program the PRG_ETH glue window, which is the second
reg region at 0xfe024000. That window holds the RGMII mode select, the
clkin0/clkin1 TX clock mux and the MAC-side delays.

Nothing would claim the pipeline clock (CLKID_SYS_AMPIPE_ETH) either. The
previous patch in the series, "arm64: dts: amlogic: t7: add the ethernet
controller", says this gate is otherwise turned off as unused. It also
says the port keeps the bootloader's delays unless the controller
programs them.

amlogic,meson-dwmac.yaml does not document amlogic,t7-dwmac, so
dtbs_check would report the now-enabled node as undocumented.

Does this patch depend on a separate glue driver and binding series? If
so, could the commit message name that prerequisite, or could this patch
be sent together with it?

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261121213102.143130-1-tanure%40linux.com

