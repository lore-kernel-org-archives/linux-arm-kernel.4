Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E196606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 17:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VJg8CKz2;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZIPaXsJe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ysk2En5dt3U606AzY6P1J/hKMgdqPY85D/NlOep2mDM=; b=VJg8CKz25w5auBhyaIWYjMc9JY
	Whnqok+cMuNtrEEoDMsMZ62GxS0E1oGTgBTqFRjDlrDa2M0/B8CEpBF2cLsJrMmZCKfZmwp0j5Eoj
	51SvyVLGLe8HlgEq8JR29Le6MzQYgvEf8KNSxU0yHkIGQIvBSi8GDvWQhDTxpmQM9qGgfFwvu+/Y/
	F46J59uQ8qt/TFOKYVkoeB8cnkHkJyAcfG0iPoCEeQHTHtSToiCRbHhE80i5BxJH+xY4+u/2YetLW
	eEEzKMQDdWv1BoqTJNzAIlyD7oal+2RLGIu3oI8z6JBJnzUxpVNuwUO6H6QkRiIiSF5DysEAkjmlD
	ye4Ms3QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTN5f-00000006b11-3kGG;
	Tue, 17 Nov 2026 17:35:31 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTN5P-00000006ar1-39KA;
	Tue, 17 Nov 2026 17:35:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 32C3160F3E;
	Tue, 17 Nov 2026 17:35:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 821621F00923;
	Tue, 17 Nov 2026 17:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794936914;
	bh=ysk2En5dt3U606AzY6P1J/hKMgdqPY85D/NlOep2mDM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=ZIPaXsJezFD6AiJqncn2itUrMLKrGXEgbgoPFwcEsq8boZKgknPdwJtMy2wI4sXGr
	 HqQUFqbXQvLNgBq08hK7OekXX3IdsOfggLyQRBeNb7w083up+ru65npI5lUKFQ6xQR
	 a+Yp57ygka+UF3/I9hhXL5MyfBnNacdwqwdYZ0XOeUp5qkcibJMnpYf2b/IK4JOV08
	 b/uLjlkHATw4GCztXNJ40m4zvRjQjMd3RiEFXbBasTWHqLGDome3NANaagIXVkZR0S
	 pOA2fghSKmGiAadVTXL4uHQdXzmgyb6EIt9AdoiWkW8UjTB4rysSlX3tF9GtGv3UB7
	 vhT7ijesUk4PA==
Subject: Re: [PATCH 3/9] dt-bindings: soc: rockchip: grf: Allow a clock for
 the RK3588 PHP GRF
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
Date: Tue, 17 Nov 2026 17:35:13 +0000
Message-ID: <179493691305.3136.16311404541139130213@kernel.org>
In-Reply-To: <20261113-mmu600-php-v1-3-231196049a3b@gmail.com>
References: <20261113-mmu600-php-v1-3-231196049a3b@gmail.com>
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] The RK3588 PHP GRF clock is allowed but not required.

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but there is a
  pre-existing use-after-free in the error unwind of…

--

dt-bindings: soc: rockchip: grf: Allow a clock for the RK3588 PHP GRF

This patch changes the clocks conditional in the Rockchip GRF binding.
The rockchip,rk3588-php-grf compatible is now exempt from "clocks: false",
so the node can describe pclk_php_root and the syscon regmap can enable it.

> diff --git a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
> index e94c83d7c1383..2525eb51f13b0 100644
> --- a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
> +++ b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
> @@ -321,8 +321,16 @@ allOf:
>          - clocks
>  
>      else:
> -      properties:
> -        clocks: false
> +      if:
> +        not:
> +          properties:
> +            compatible:
> +              contains:
> +                const: rockchip,rk3588-php-grf
> +
> +      then:
> +        properties:
> +          clocks: false

[Severity: Low]
Should rockchip,rk3588-php-grf go into the enum in the if: branch above,
so that clocks is required and not just allowed?

The commit message says the PHP GRF is clocked from pclk_php_root, which
gets gated. The later patch "arm64: dts: rockchip: Add the PHP GRF clock on
RK3588" says PHP GRF accesses hang without it.

This block already handles GRFs that need a clock. rockchip,rk3588-vo-grf
and rockchip,rk3576-dcphy-grf are listed in the enum, which both allows and
requires clocks.

As written, a php_grf node without clocks still passes dtbs_check. At
runtime, of_syscon_register() treats a missing clock as optional:

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

On such a DT the regmap would never enable pclk_php_root. The StreamID
restore added later in the series ("soc: rockchip: grf: Restore the RK3588
PHP StreamIDs after system suspend") would also be skipped without any
warning.

If the clock is meant to stay optional for older DTBs, could the commit
message say so? The binding also doesn't say which clock is expected. There
is no items list or description naming pclk_php_root.

[Severity: High]
This is a pre-existing issue and was not introduced by this patch. With
this series, php_grf goes through the clock-attached path in
of_syscon_register(). Is there a use-after-free of the struct clk in that
function's error unwind?

regmap_mmio_attach_clk() stores the clk in the regmap context before it
prepares it:

drivers/base/regmap/regmap-mmio.c:regmap_mmio_attach_clk() {
	ctx->clk = clk;
	ctx->attached_clk = true;

	return clk_prepare(ctx->clk);
}

Two failures reach err_attach_clk: clk_prepare() failing, or
of_reset_control_get_optional_exclusive() returning an error. For example,
the reset lookup returns -EPROBE_DEFER if the reset controller hasn't
probed yet. The unwind is:

err_attach_clk:
	if (!IS_ERR(clk))
		clk_put(clk);
err_clk:
	regmap_exit(regmap);

clk_put() frees the struct clk through __clk_put()->free_clk(). After that,
regmap_exit()->regmap_mmio_free_context() still uses the stored pointer:

	if (!IS_ERR(ctx->clk)) {
		clk_unprepare(ctx->clk);
		...

clk_unprepare() then reads clk->core from the freed object. If
clk_prepare() was the step that failed, it also unprepares a clock that was
never prepared.

Would it fix this to detach the clock from the regmap, or to call
regmap_exit(), before clk_put()?

The php_grf node has no resets, so for php_grf only a clk_prepare() failure
can reach this path. Any syscon node with both clocks and resets is
affected. Syscon registration is retried on every lookup, so the path can
run repeatedly. The unwind comes from a00406b71c5f ("mfd: syscon: Add
optional clock support") and 7d1e3bd94828 ("mfd: syscon: Allow reset
control for syscon devices").

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261113-mmu600-php-v1-0-231196049a3b%40gmail.com

