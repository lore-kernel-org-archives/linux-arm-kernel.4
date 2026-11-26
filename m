Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76F84606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 12:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ghBrZ0rU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=REOzMMTPDLDlLUvCKX/dzO9sL/SNpW9z3fgnSLvxTe4=; b=ghBrZ0rUYsvGOCXxTaEC9D1lkN
	IaL5g7Ft3kgWshmCqqw2FdU1v2glfpm9FHUW7j4jRaMlmiJj2SoJsYm5jmOChM4a3Qs6PnRsi24SE
	EU13Btc1nbN6vgtkjAJctJMzJfB0qBiYqvoXTZ96XDQYQCXXMfu4iE+m80ZNeBCQcM/N/8Bmhst3b
	HVUX1ZAqay9GAETmFEzQ+Yeee088kIclMwLN8cGmYiAs/AduGOJsZzaPEDsXhovK396vQvyGd6n+d
	kgsE99cJDvr6D4B3MK1CCP9WitJ0f1atd4NLD8V1yxdQxY8+89p/uXfM/32xLU7LI2tjZSc2cMcU0
	pi1F6msg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWZ1i-0000000DGDA-0Xtm;
	Thu, 26 Nov 2026 12:56:38 +0000
Received: from mail-pg1-f176.google.com ([209.85.215.176])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWZ1Y-0000000DG9Q-4358
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 12:56:34 +0000
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cdb628232d2so3884617a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 04:56:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795697788; x=1796302588;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=REOzMMTPDLDlLUvCKX/dzO9sL/SNpW9z3fgnSLvxTe4=;
        b=HmxWnpyga/TYjiE6C2QU/VtxKmrHfZxOJ/lEngKj7C4aoOu0InzCl8qS4vhsJk6lTp
         KDQ+rYXNVPQ7exVvi/2071AA36yJpHEUU12xp6znEfCP93PF4H57Mq9sxG9Kc4isiz1H
         z3J3C5NSZ1IsD64rdji7051lDrvSqAGqFL3fN4UtkxdHhoZ2Lut6Ji8s0c4FlIwlknEQ
         Hwbb/XUiByqGKQ8/Lh0pWF+zeM4ZhflXzri/UaTlUFfc3kSaEmE/G1d/TMXtDYY94rRS
         KA+c3cZhJfXwMwCXwmm8rT2TC7aaJa4w61a57naKyG2osKGWnZELF2CTum2FpdzdwkgS
         bpzg==
X-Forwarded-Encrypted: i=1; AL+hErHIKQHYjN5Lu4zuDkKwRhQTTQ+3En8Ja+TxH7bqCMLhtDyVBoSLmhfGyy/xghmOT/0GesWKuIvKmsrlUdtwdYTN@lists.infradead.org
X-Gm-Message-State: APuU4Z+W1bEf7hGiNmY3f02qMEwNNb0erckFVKkHFU+Fjo1kPJBNfwKS
	JBS/Yjc/af910vr9q1zTbzgBYV46rnVSC+K2cnpS+C1KYH6Bi7sPbzXulWiu15yApnY=
X-Gm-Gg: AZFdTZfqwDpc5zithcoBxd9YEnX4JARrVxgoE+5vDebUlKUixBdHP7PFaOTOUKqqLOl
	3aY3noo+U7VBVwi74LroXuZqoD3B84oW0Zj7pCatgXRxBSzwwmWwcsP8jUA3Grm15NZH+gNeKjt
	5AUW2WtPzxHGyEE3bkICr4Rx53pDOmirS7G9UUn70TrEObtyjmARJRkHVYDJfRUnfjb9kxvTDy1
	kNcjC8G2e2aM9gr9gZzh13OXI6HJ8VV9IJH6uRQxz25r+bCsOFCtQrO/pW2rYYXJvbPurJ/VEOR
	fS0ybEOgrv11zd8ZbUzd0hpe441AjierKQTZnWoMCkLfO+p2S6ahrkFatTGsgY0OLJDnSsEQt2W
	IzKitbT89b/I6dIdzcXYlB3XNvorBTcn5KiIZIGi35PewRm6yj0p1Phs/O5nMZOT265ipxWjim7
	/1D88C1Z2yhoYUqsYqkFOtZ3KglHWTPaG8WO6cXq+sJ55xHjdhKXg8NKJfoJJcR+5yveNsrrUbQ
	YclfNJK2MOZKLhEX6CWVPxCUvWMpZ2ZdsBjtrHTLKfCK05VISjwxTcthKaF+dIs7ErwKLPaYoQA
	XAcVqc/ftTuywvUC2Up+DbEpRnGm3sF9J3VXmswwcPUg8HF96XZc5jjfV3rcUQlxY/OrzK5o2Ja
	xcbPZDiMNeK9tuptwH9cLNuvuK+K4RjU73uB5nRydc1DZtE/S7G6WglgdKQ==
X-Received: by 2002:a05:6372:a70f:b0:400:27cc:c397 with SMTP id adf61e73a8af0-4014e35c5b0mr18271921637.58.1795697787791;
        Thu, 26 Nov 2026 04:56:27 -0800 (PST)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com. [209.85.214.178])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87285c89dsm10598539b3a.13.2026.11.26.04.56.27
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 04:56:27 -0800 (PST)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2f04bea9a93so61647595ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 04:56:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHhzhsXSvs+psqbKaOY79bySYNpLN9E76WWgPfOTAyT2Kx4sdAstT6JGNfDHZ31KV2AGCcKHAFknHIEU0cF4QwF@lists.infradead.org
X-Received: by 2002:a05:690c:c15:b0:8b3:27b8:2bd2 with SMTP id
 00721157ae682-8b52042f569mr88911427b3.10.1795697331984; Thu, 26 Nov 2026
 04:48:51 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261121213102.143130-4-tanure@linux.com> <179561837659.3135.6655031502321722558@kernel.org>
In-Reply-To: <179561837659.3135.6655031502321722558@kernel.org>
From: Lucas Tanure <tanure@linux.com>
Date: Thu, 26 Nov 2026 12:48:41 +0000
X-Gmail-Original-Message-ID: <CAJX_Q+0MtVhPHAW_DSHJQMXSPgtJ=H1mKqGSR_09UOqAkgLexQ@mail.gmail.com>
X-Gm-Features: Aa3M54pUuxKwHlhmSM8ws03XH7rNC1f2K4BBc-Hnx_WBDraHYgmAijaXPXLQFsA
Message-ID: <CAJX_Q+0MtVhPHAW_DSHJQMXSPgtJ=H1mKqGSR_09UOqAkgLexQ@mail.gmail.com>
Subject: Re: [PATCH v8 3/4] arm64: dts: amlogic: t7: add the ethernet controller
To: netdev-bot+sashiko@kernel.org
Cc: xianwei.zhao@amlogic.com, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org, 
	khilman@baylibre.com, jbrunet@baylibre.com, 
	martin.blumenstingl@googlemail.com, maxime.chevallier@bootlin.com, 
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_045631_446961_F91FAEB0 
X-CRM114-Status: GOOD (  48.30  )
X-Spam-Score: -0.8 (/)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: tanure@linux.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 25, 2026 at 2:53=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wro=
te:
>
> Thank you for your contribution! Sashiko AI review found 3 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 2 =C2=B7 Medium: 1 =C2=B7 Low: 0
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [High] No driver or binding in the tree accepts the new ethmac node's
>   compatible pair, "amlogic,t7-dwmac" + "snps,dwmac-5.10a".

They are in net-next since 2026-11-20, from v7 of this series:
18029931478b ("dt-bindings: net: add amlogic,t7-dwmac") documents the
compatible pair and the five clocks, and c4c851a3325e ("net: stmmac:
dwmac-meson8b: add support for the Amlogic T7") matches
amlogic,t7-dwmac. The cover letter lists all four commits. This
device tree patch goes through the Amlogic tree.

> - [High] The commit message names two problems and claims this patch
>   handles them: 1.

Same commits: the driver claims the pipeline clock with
devm_clk_get_enabled(), and the stmmac core takes "pclk" in
stmmac_probe_config_dt() and enables it in stmmac_bus_clks_config().
Once the MAC probes, the node holds both clocks; the multiplexer's own
reference to pclk is no longer the only one.

> - [Medium] The T7 MAC is declared as "snps,dwmac-5.10a".

It is a 5.10a core. The A311D2 datasheet (section 14.3) says so, the
version register at 0x110 reads 0x1251 on the VIM4 (User ID 0x12,
Synopsys ID 0x51, printed by stmmac at probe), and the GMAC4/5 DMA
and descriptor layout moves 941/944 Mbit/s with no error. The S4 node
describes another SoC.

pw-bot: cr

>
> --
>
> arm64: dts: amlogic: t7: add the ethernet controller
>
> This patch adds the T7 Synopsys MAC node, its PRG_ETH glue registers, and
> a g12a-compatible MDIO multiplexer to amlogic-t7.dtsi. The multiplexer
> also gets an internal PHY bus. The MAC, the multiplexer and the internal
> PHY bus are all disabled by default.
>
> > diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/b=
oot/dts/amlogic/amlogic-t7.dtsi
> > index 7bd53ec166071..eb7f46c98b0b4 100644
> > --- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> > +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> > @@ -250,6 +250,31 @@ gic: interrupt-controller@fff01000 {
> >                       interrupts =3D <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(8)=
 | IRQ_TYPE_LEVEL_HIGH)>;
> >               };
> >
> > +             ethmac: ethernet@fdc00000 {
> > +                     compatible =3D "amlogic,t7-dwmac", "snps,dwmac-5.=
10a";
>
> [Severity: High]
> Which driver is expected to bind this node? I can't find anything in the
> tree that accepts either compatible string.
>
> meson8b_dwmac_match[] in drivers/net/ethernet/stmicro/stmmac/dwmac-meson8=
b.c
> lists only the meson8b, meson8m2, meson-gxbb, meson-axg and meson-g12a
> compatibles. This node has no G12A or AXG fallback.
>
> dwmac_generic_match[] in dwmac-generic.c stops at snps,dwmac-4.10a. The
> only use of "snps,dwmac-5.10a" is the stmmac_gmac4_compats[]
> feature-detection list in stmmac_platform.c. That list is only consulted
> after some driver has already bound.
>
> The later patch "arm64: dts: amlogic: t7: khadas-vim4: enable the
> ethernet port" sets ethmac and eth_phy to okay. Wouldn't the board then
> end up without ethernet?
>
> meson8b_init_rgmii_delays(), set_phy_mode() and meson8b_init_prg_eth()
> only run from meson8b_dwmac_probe(). So the PRG_ETH registers at
> 0xfe024000 keep the bootloader's interface mode and delays.
>
> The stmmac MDIO bus for mdio0 is never registered either. That makes
> g12a_mdio_mux_probe()->mdio_mux_init() on mdio-parent-bus =3D <&mdio0>
> return -EPROBE_DEFER forever.
>
> The node also looks like it fails dtbs_check against
> amlogic,meson-dwmac.yaml:
>
> - select has no T7 string.
> - The fallback contains list only allows snps,dwmac-3.70a or snps,dwmac.
> - clock-names is fixed to stmmaceth/clkin0/clkin1/timing-adjustment.
>
> The commit message says the multiplexer "probes after the controller has
> programmed them" and that "unless the controller holds that clock, the
> writes are lost". No driver in the tree does that for this node, and this
> series only adds a T7 binding for the MDIO mux.
>
> Is there a dt-bindings patch and a driver match patch that this depends
> on and should mention?
>
> [Severity: Medium]
> Is snps,dwmac-5.10a the right IP version for this MAC? The string is in
> stmmac_gmac4_compats[], so stmmac would drive the core with the GMAC4/5
> register map and descriptor format.
>
> The S4 node in meson-s4.dtsi seems to describe the same block. It has:
>
> - the MAC at 0xfdc00000 and the glue at 0xfe024000
> - macirq on GIC_SPI 74
> - the same rx and tx fifo depths
> - an ETH power domain
> - a g12a-compatible mux at apb+0x28000
>
> But it declares the core as 3.70a:
>
>         compatible =3D "amlogic,meson-axg-dwmac",
>                      "snps,dwmac-3.70a",
>                      "snps,dwmac";
>
> If the T7 core is also 3.70a, then once a driver binds, stmmac would read
> the version register at the wrong offset. It would also use the wrong DMA
> and descriptor layout.
>
> Could the version be checked against the hardware version register (0x20
> on 3.x, 0x110 on 4.x and later) and stated in the commit message?
>
> > +                     reg =3D <0x0 0xfdc00000 0x0 0x10000>,
> > +                           <0x0 0xfe024000 0x0 0x8>;
> > +                     interrupts =3D <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
> > +                     interrupt-names =3D "macirq";
> > +                     clocks =3D <&clkc_periphs CLKID_SYS_ETH>,
> > +                              <&scmi_clk CLKID_FCLK_DIV2>,
> > +                              <&mpll CLKID_MPLL2>,
> > +                              <&clkc_periphs CLKID_SYS_AMPIPE_ETH>,
> > +                              <&clkc_periphs CLKID_SYS_ETHPHY>;
> > +                     clock-names =3D "stmmaceth", "clkin0", "clkin1", =
"pipeline",
> > +                                   "pclk";
>
> [Severity: High]
> The commit message says the pipeline gate "is switched off as unused",
> and that the controller has to hold the clock it shares with the glue
> registers. Does listing these two clocks here keep either of them
> enabled?
>
> Nothing under drivers/net requests a "pipeline" clock:
>
> - stmmac_probe_config_dt() only gets stmmaceth, pclk and ptp_ref.
> - meson8b_dwmac_probe() only gets "timing-adjustment", plus clkin0 and
>   clkin1 as mux parents.
>
> The only "pipeline" consumer in the tree is meson-gx-mmc.c, and it claims
> the clock explicitly with devm_clk_get_enabled().
>
> Also, t7_sys_ampipe_eth is declared without CLK_IGNORE_UNUSED:
>
> drivers/clk/meson/t7-peripherals.c:
> static T7_SYS_PCLK(sys_ampipe_eth,      SYS_CLK_EN0_REG0, 20,   0);
>
> Even after a T7 entry is added to dwmac-meson8b, wouldn't
> clk_disable_unused still gate CLKID_SYS_AMPIPE_ETH? That would cut the
> MAC's DMA path to memory.
>
> For CLKID_SYS_ETHPHY, the mux is the only holder until a MAC driver binds
> this node:
>
> drivers/net/mdio/mdio-mux-meson-g12a.c:g12a_mdio_mux_probe() {
>     ...
>         pclk =3D devm_clk_get_enabled(dev, "pclk");
>     ...
> }
>
> That reference is dropped whenever the mux probe defers or fails. This
> looks like the same ordering hazard the commit message says it closes.
>
> The five-entry clock-names list also doesn't match
> amlogic,meson-dwmac.yaml. That schema allows at most four entries, with
> index 3 being timing-adjustment.
>
> [ ... ]
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20261121213102.143130-1-tanure%40linux.com

