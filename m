Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ED87606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 17:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jJFONzk+;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y5Sb8ZAR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=uTnztLJQR+fLZMvHR4MbwlpHJ6bGzalLO0Qii68tS/U=; b=jJFONzk+Nr2kyJS/AjG9fQ3RTi
	MB4/d/FDEVeS8qicxPjhvtKfJz0fm6zyKR5hTLi7ZFn0RDGR1ZXSweVrdDkPp1pSxZlKuV+dvHvq5
	50ubrPPGFeEwxzFL3ACi47Ntu5yN/g23EwuU4fR1jybKMjvVL5gb2rNsflQD7yy/gZYf+bF3sfP1A
	avbLyxHD8dJPtA0npyVJWNPm+pN2mAS101KFgpAIXwzckYAF16Aov3KL+U6ysZDm2WL+a7Rupt//U
	fOtZzZVUZPxPD+bHRLBifeWbT1qR0LfBxWbKEFa81LSg04i39f0gndOsktIA2YyzqXABYdNIES/tC
	fpYT1YLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTN6C-00000006bRQ-0FWO;
	Tue, 17 Nov 2026 17:36:04 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTN5V-00000006atx-0atN;
	Tue, 17 Nov 2026 17:35:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BADF545F41;
	Tue, 17 Nov 2026 17:35:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E0311F000CA;
	Tue, 17 Nov 2026 17:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794936920;
	bh=uTnztLJQR+fLZMvHR4MbwlpHJ6bGzalLO0Qii68tS/U=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Y5Sb8ZARbyMp0CDy5GmbW+vgUiAxxXstzq2ccWfFtGNkFwUsypXt9Xq1E4D3HvCex
	 +EAkMKZTwP9zVNnF5D9o7tI4AjaEG7jzeo6mOBZbem7CwjFqFnvRjHlj/VCsgylvli
	 7LpsMxTAhQrZsLALA0oEQqXYpX3qqq4CJZpvOtuLkrle7koKhzTP9ZrEtIy673Fxbx
	 qKwzt2/EjriuQCwcAT7KbWEE3QfV3gaTequXur4i8uD4cvZomYQCm2ca2CwmW3ZaLd
	 16/R3Uh39YuXeBcJFkaePPhmpMaj/Afn1S0/Bs5llNEkbpHJgnhwNNbokI1zY5tICf
	 g6zwCJW9fg6UQ==
Subject: Re: [PATCH 7/9] arm64: dts: rockchip: Add the clock and reset of the
 RK3588 PHP SMMU
From: netdev-bot+sashiko@kernel.org
To: aiyengar1990@gmail.com
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, david.wu@rock-chips.com,
 dlemoal@kernel.org, cassel@kernel.org, fancer.lancer@gmail.com,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org, praan@google.com,
 will@kernel.org, robin.murphy@arm.com, iommu@lists.linux.dev,
 shawn.lin@rock-chips.com, sebastian.reichel@collabora.com
Date: Tue, 17 Nov 2026 17:35:18 +0000
Message-ID: <179493691896.3136.9977830842313145372@kernel.org>
In-Reply-To: <20261113-mmu600-php-v1-7-231196049a3b@gmail.com>
References: <20261113-mmu600-php-v1-7-231196049a3b@gmail.com>
X-sashiko-severity: High
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

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 2 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The patch does not do what its commit message says.
- [Medium] The patch adds `clocks` and `resets` to the mmu600_php node
  (compatible = "arm,smmu-v3"), but…
- [Medium] The commit message says the clock and reset are described "as
  for the PCIe SMMU", but the PCIe SMMU node has neither.

--

arm64: dts: rockchip: Add the clock and reset of the RK3588 PHP SMMU

This commit adds a clocks property (ACLK_MMU_PHP) and a resets property
(SRST_A_MMU_PHP) to the mmu600_php node in rk3588-base.dtsi. The stated
goal is to keep the SMMU clocked while its masters are idle.

> Describe ACLK_MMU_PHP, so the SMMU keeps its clock while its masters
> are idle, and SRST_A_MMU_PHP, as for the PCIe SMMU.

[Severity: Medium]
Is the "as for the PCIe SMMU" reference accurate? The mmu600_pcie node in
rk3588-base.dtsi has no clocks or resets:

	mmu600_pcie: iommu@fc900000 {
		compatible = "arm,smmu-v3";
		reg = <0x0 0xfc900000 0x0 0x200000>;
		interrupts = <GIC_SPI 369 IRQ_TYPE_EDGE_RISING 0>,
		...
		interrupt-names = "eventq", "gerror", "priq", "cmdq-sync";
		#iommu-cells = <1>;
	};

No rockchip DTS uses ACLK_MMU_PCIE or SRST_A_MMU_PCIE. The only MMU_PCIE
or MMU_PHP references are the two lines this patch adds.

mmu600_pcie is enabled by default, and its clock sits in the same place in
clk-rk3588.c. aclk_mmu_pcie is the parent of the aclk_pcie_*_mstr clocks:

	GATE(ACLK_MMU_PCIE, "aclk_mmu_pcie", "aclk_pcie_bridge", 0,
			RK3588_CLKGATE_CON(34), 7, GFLAGS),

Is a matching change for mmu600_pcie missing, or should the commit message
be reworded? If the reasoning is right, why does the PCIe SMMU not need
the same change?

> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
> index 8807ce6193bfc..3bf8d0e4ff332 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
> @@ -570,6 +570,8 @@ mmu600_php: iommu@fcb00000 {
>  			     <GIC_SPI 386 IRQ_TYPE_EDGE_RISING 0>,
>  			     <GIC_SPI 379 IRQ_TYPE_EDGE_RISING 0>;
>  		interrupt-names = "eventq", "gerror", "priq", "cmdq-sync";
> +		clocks = <&cru ACLK_MMU_PHP>;
> +		resets = <&cru SRST_A_MMU_PHP>;

[Severity: High]
Does anything use these properties? mmu600_php binds to the generic
arm-smmu-v3 driver. arm_smmu_device_probe() never gets or enables a clock
and never touches a reset line.

There are no clk, reset_control or pm_runtime calls under
drivers/iommu/arm/arm-smmu-v3/, even at the end of the series. The
platform bus does not enable DT clocks by itself. The node also has no
power-domains that could add a pm_clk.

The gate is registered with flags 0 in clk-rk3588.c:

	GATE(ACLK_MMU_PHP, "aclk_mmu_php", "aclk_php_root", 0,
			RK3588_CLKGATE_CON(34), 8, GFLAGS),

So its enable count still comes only from its children: ACLK_GMAC0/1,
ACLK_SATA0/1/2 and ACLK_USB3OTG2. When the last of those masters disables
its aclk, the gate closes just as it did before this patch. If no master
ever enables it, clk_disable_unused() can close it at late_initcall.
Nothing drives SRST_A_MMU_PHP either.

The later patch "arm64: dts: rockchip: Enable the RK3588 PHP SMMU" removes
status = "disabled". After the series, the SMMU probes on every RK3588
board without the clock hold the commit message describes.

Later SMMU activity can then run with aclk_mmu_php gated, for example
cmdq, CFGI or TLBI commands on attach and detach, or event and gerror
handling. What a gated clock does to the SMMU at that point depends on the
Rockchip clock topology.

Does the SMMU driver need to own the clock and reset instead? That could
be devm_clk_bulk_get_all_enabled() plus reset handling in
arm_smmu_device_probe(), or a Rockchip impl hook behind a SoC-specific
compatible.

[Severity: Medium]
Will these properties pass dtbs_check? The binding
Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml lists neither
clocks nor resets, and it ends with:

additionalProperties: false

dtbs_check also validates disabled nodes. So every DTB that includes
rk3588-base.dtsi would flag 'clocks' and 'resets' as unexpected. No patch
in the series changes the iommu binding.

Would this need a SoC-specific compatible with conditional clocks and
resets in the binding, like the existing nvidia,tegra264-smmu entry, along
with driver support?

>  		#iommu-cells = <1>;
>  		status = "disabled";
>  	};

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261113-mmu600-php-v1-0-231196049a3b%40gmail.com

