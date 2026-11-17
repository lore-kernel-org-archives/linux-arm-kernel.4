Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 451D1606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 17:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=adudm7F2;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f/Rk9Z+/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=xNa0xDXSS+zJh+Kso81OgDVFRXsupSK+qlsYOnCFju8=; b=adudm7F2NOyaL79NCEd6Y6pq2f
	nwScm4SDW40BB42XQvmRvGmulsgRbsRbIpCSlXuZ0PkMnZOFNW02/tJrQ+zolqfrC87KQVZaaSGqx
	eEWOp4G7x6I2oeLELEl/lE5TxAT1Tk/RwLVprqBEn8ZfjD7xQDewvLDnc018dj4XJ4zGjNGLr+eNn
	/v8wK5bV006ESkQpv3SYQloRTfOS0tdnLto5iX1vKKeNcyrW0Z4G5gHj8GPf2egCOz96/ix4nhb6n
	hzCBoCx3SR40XHK7pzoZmbTmTHpCm8d5hrKPt7UxB+oMMp3GaNtw25INOemHFNzZx2hQKHTDXBkxr
	pOlXFKLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTN5q-00000006b8l-0pt0;
	Tue, 17 Nov 2026 17:35:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTN5R-00000006as3-0lAe;
	Tue, 17 Nov 2026 17:35:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D3B0D408CA;
	Tue, 17 Nov 2026 17:35:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78B591F000CC;
	Tue, 17 Nov 2026 17:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794936916;
	bh=xNa0xDXSS+zJh+Kso81OgDVFRXsupSK+qlsYOnCFju8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=f/Rk9Z+/w2sDE60G7c5yxPTEM8K3B3ApYnUWzJ9FKtTrQ0MgX0uDktfKkK95bd83T
	 EHf0Wit/AhL7mxkmpqZJi1f5kTRmMy2cvT84rmk+DxfSpRUyuBL9fqfKfyfwQCJ5oQ
	 RYvwKhBPD5BSvXNEZyY0XkZjHhk9KrlHQXnltMjJdlRGBrfsTjd0uMSEm7f355Qxg1
	 mh+Cse4brl6p2aGfHzWaallLHet7TQYHAn6UzoPdL4XxJVPeAQsX/TGTmoWANB+Vhc
	 VFgLsBmzjBD4Z0vsXINFmchPjf5F77TWPoq3EHaD13BZlzo3ASfzMFsXa5blTcqhom
	 Ajxv+5E12C+hQ==
Subject: Re: [PATCH 5/9] arm64: dts: rockchip: Add the PHP GRF clock on RK3588
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
Date: Tue, 17 Nov 2026 17:35:15 +0000
Message-ID: <179493691507.3136.7881513635093439298@kernel.org>
In-Reply-To: <20261113-mmu600-php-v1-5-231196049a3b@gmail.com>
References: <20261113-mmu600-php-v1-5-231196049a3b@gmail.com>
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

- [Medium] Adding `clocks = <&cru PCLK_PHP_ROOT>` to php_grf creates a DT
  dependency cycle: the cru node has `rockchip,grf = <&php_grf>`…
- [Low] Once the clock is attached, regmap-mmio wraps every PHP GRF
  access in clk_enable()/clk_disable() (regmap_mmio_write lines 157/165,…

--

arm64: dts: rockchip: Add the PHP GRF clock on RK3588

This adds a PCLK_PHP_ROOT clock reference to the php_grf syscon node on
RK3588, so that the syscon regmap enables pclk_php_root around PHP GRF
accesses. The motivation is a deep suspend hang in the syscore resume op
added by the next patch, which ran after the PHP peripherals had gated
pclk_php_root.

> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
> index d0f364547ae55..8807ce6193bfc 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
> @@ -619,6 +619,7 @@ usb_grf: syscon@fd5ac000 {
>  	php_grf: syscon@fd5b0000 {
>  		compatible = "rockchip,rk3588-php-grf", "syscon";
>  		reg = <0x0 0xfd5b0000 0x0 0x1000>;
> +		clocks = <&cru PCLK_PHP_ROOT>;

[Severity: Medium]
Does this create a dependency cycle with the cru node? The cru node in
this same file already has:

	rockchip,grf = <&php_grf>;

and php_grf now references a clock that cru provides.

On RK3588 the CRU looks up its GRF from the CLK_OF_DECLARE_DRIVER hook,
before its own clock provider is registered:

of_clk_init()
  rk3588_clk_early_init()
    rockchip_clk_init_early()
      rockchip_clk_init_base()
        syscon_regmap_lookup_by_phandle(ctx->cru_node, "rockchip,grf")
          of_syscon_register(php_grf, check_res=true)
            of_clk_get(np, 0)   <- now returns -EPROBE_DEFER
    ...
    rockchip_clk_of_add_provider(np, ctx)   <- provider only added here

of_syscon_register() only treats -ENOENT as a missing clock:

drivers/mfd/syscon.c:of_syscon_register() {
    ...
		clk = of_clk_get(np, 0);
		if (IS_ERR(clk)) {
			ret = PTR_ERR(clk);
			/* clock is optional */
			if (ret != -ENOENT)
				goto err_clk;
    ...
}

So the regmap is torn down and nothing is cached. clk_rk3588_probe()
reuses early_ctx and never retries the lookup. Would ctx->grf then stay
ERR_PTR(-EPROBE_DEFER) for good? Before this patch it was a valid php_grf
regmap.

Nothing on RK3588 seems to dereference ctx->grf today. The pll_rk3588 ops
don't use it, and the GATE_GRF branches use grf_type_sys from
aux_grf_table. However, rockchip_clk_register_branches() falls back to it
for grf mux/gate/mmc branches that have no matching aux GRF:

	struct regmap *grf = ctx->grf;

A future branch like that would silently get an error pointer.

There is also a second interaction. Before this patch, the CRU's early
lookup was the first to create and cache the php_grf regmap, and it did so
without a clock. Every later syscon_node_to_regmap() user got that
clockless regmap: rockchip_grf_init(), dwmac-rk via rockchip,php-grf, and
naneng-combphy via rockchip,pipe-grf.

With this patch, the clock only gets attached because the CRU lookup
fails. That failure moves the first successful creation to
rockchip_grf_init() at postcore_initcall, when PCLK_PHP_ROOT is already
available.

If the CRU lookup were moved after provider registration, or some earlier
caller created the regmap without the clock, a clockless regmap would be
cached again. The restore op in the following patch "soc: rockchip: grf:
Restore the RK3588 PHP StreamIDs after system suspend" only checks
of_property_present(np, "clocks"). It doesn't check whether the cached
regmap actually carries the clock. Wouldn't deep suspend hang again in
that case?

Should the commit message describe this ordering dependency and the
effect on ctx->grf?

[Severity: Low]
With the clock attached, regmap-mmio wraps each PHP GRF access in
clk_enable()/clk_disable(). Does this change when pclk_php_root is gated
in hardware?

rockchip_grf_init() runs at postcore_initcall. After the earlier patch
"soc: rockchip: grf: Assign the StreamIDs of the RK3588 PHP SMMU masters",
it writes 12 StreamID registers through this regmap. At that point no PHP
consumer holds pclk_php_root, and the clock is a plain gate with flags 0:

	COMPOSITE_NODIV(PCLK_PHP_ROOT, "pclk_php_root", mux_150m_50m_24m_p, 0,

So each write takes enable_count from 0 to 1 and back to 0:

rockchip_grf_init()
  regmap_write()
    regmap_mmio_write()
      clk_enable()
      ...
      clk_disable()
        clk_core_disable()
          core->ops->disable()
          clk_core_disable(core->parent)

Before this patch, the clock kept its bootloader state until
clk_disable_unused at late_initcall_sync. With clk_ignore_unused it was
never touched. Now it is gated at postcore_initcall, along with any parent
whose count also drops to zero, and this happens even with
clk_ignore_unused.

Could a PHP-domain register access in that window now hang? The same
question applies to an access under clk_ignore_unused that relied on the
bootloader leaving the clock on.

The commit message says the regmap enables the clock. It doesn't mention
that the regmap also gates it this early.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261113-mmu600-php-v1-0-231196049a3b%40gmail.com

