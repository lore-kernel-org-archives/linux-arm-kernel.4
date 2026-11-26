Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A75D606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 14:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JmaD2RyZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=iCeQ/db20QjGcTEZMmDdadaK9BiQoJcNEDJPAm9EXfU=; b=JmaD2RyZ/ZHui4Rq0IthtgAYDU
	bmm4zLdPsy+f8IQLldQSta63fP01OEKpkihZ7JkOovzJtsFuy4AeCm8VWy3UFi/9v3InriKt5txSV
	J8RoyjolYnWC1KDWZXMG4F6jSb1dme/4oosyXvXk+3jtNLGiNdb85nOPumb9mxBvnryalQKQLsnJy
	moDTxAFxUaPke4pD7DjaNEAEgDhj8hNJ8GDbRezag8VHX7kz5eiHoF0vJ9Cy3FK2qye9EoGo3wcKL
	kr5Vi3qNGMvwjk7uJ7HJ+2DqGIoZUqUyeTjabYIhGcsCOFAXxbVhJRqZ55aBxnmtuZswZpPgzu101
	tJ0qQEjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWZ1i-0000000DGCz-09C6;
	Thu, 26 Nov 2026 12:56:38 +0000
Received: from mail-qt1-f182.google.com ([209.85.160.182])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWZ1X-0000000DG7n-0Jta
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 12:56:28 +0000
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-53664b4860bso76332981cf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 04:56:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795697786; x=1796302586;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iCeQ/db20QjGcTEZMmDdadaK9BiQoJcNEDJPAm9EXfU=;
        b=Bzg1jIUvjutasb8MsW1SSOcVfFB4Yk2zCDrCuBPJox8dfCprmVPkAoruQL4iT0BJrO
         QntJ4kgmrbTUcpBSs5F3wZ10AsoTyRsQDPdf7m2Jiw3FRpt7Nz/UQRAtnoCM6RC/SfSW
         rD+i4LQZbA+5vIkEhWmanZUUwDCqrQsWJ5q+SF60CmxaTO/xssjW6TH6mCPY4xwWNmEG
         R6A76m8jKKjdQVenWwYFD+cuOviMexH2JOGo/9SqnBZcZyj5VMJmC6LXL2GEqP94LlpQ
         /XOET7ZILaGocrFN7ryO50n/C8LTGYLxUXyKKWL56uL6sJ3HbOG43hMhS+GiVXRzHIUD
         zqeg==
X-Forwarded-Encrypted: i=1; AL+hErE9IQn3Q1CxYLI6ATyqmVLv3BRFML/5Jo7J/mj8IGypc7D4GVSUps5+TDwk02aaMSemIB7xb1MYhKfN/XYMCDbU@lists.infradead.org
X-Gm-Message-State: APuU4Z99F+aNSWvtLRFrEPPcrNTQz5M5PoAKqtvJxKgqtGgUk+rrPwOx
	H2KS6HssWhR11oSANkNrHpRepzUfe3Q0FQtOPFUTJs7bkW/wAOnwXEnohyr5XbBRgAY=
X-Gm-Gg: AZFdTZc4S4nE4QqlZYq/GxlyXbpW6qkP+K8Ok1A7KTUBdYBPElJOwY4jxTOlMv6+UsT
	+DoqsYeybSlATogb5SqEfHqsq0xQl14Lq6tL/6lnMrZ7agQhkwVlhG+WbXX1MAPCMv/SIlteiv2
	MLK0NBIUMVttyRgfKXxpNgxVDjgsrpUch0S+NzsLX5R7hkLlUfSMWSGDDOk0EW+uXfatTfasA3A
	FUkK4YPrOMUhIrIeYV/yaEXG5VYikMdNbMMS6disSn2RI8UHoE4uvlnwlHCbAgIPumnoizi0FzN
	NROD9fuwG1/Emz6ADRDXfgT9oCKcSgqQQzc0kBBjD1dytdT1E5iBBuys7x7/bjF/bNSk1QVNzLG
	A4fbemfe+hAo4YONhfrDByPAW6GU+XZoaGLK8aU6CYJHizUD6xm/vACC34Gg1g+v4KOowTGwFCR
	Fy1tubA2LiBx4tsTrLRmJN4CKtHemjdSnUTBUoeXvxsgc2bCDmPjaE53kubjsILh1SSuTZpRQFs
	ttWrRbQX14nUoh4t8ByJHK0equFsD+UFqeCnjQTeA1UiVn7qzzrMinqHU3bj0FDGOcnapCmH12n
	VHu8qF2e0foXtdOx7sqdP5K5IkaUPYWdvpHKJHMDMddGGIWcx1ag566Za79S2RLKLQYPYV1r0k7
	6sY2KF0B5WZKhzAZbWIomTvDrZ2qJUU5JWBvEvbD50hOmbuB214etdmZIBA==
X-Received: by 2002:a05:622a:580b:b0:537:a19c:aaad with SMTP id d75a77b69052e-55d76adb4f5mr332088491cf.65.1795697785636;
        Thu, 26 Nov 2026 04:56:25 -0800 (PST)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com. [209.85.160.171])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d78812968sm182205671cf.9.2026.11.26.04.56.25
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 04:56:25 -0800 (PST)
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-53664b4860bso76332901cf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 04:56:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErG72CWwl0dZtZfO8plJ494bxAjGadaSeNxseFtOT/GBHyDK0liwEpnL+8OYBhg4L+S9Gr23s8dGhhCZGOgs0NL7@lists.infradead.org
X-Received: by 2002:a05:690c:6c8d:b0:8b3:2d65:2c72 with SMTP id
 00721157ae682-8b52047a894mr79381047b3.42.1795697368796; Thu, 26 Nov 2026
 04:49:28 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261121213102.143130-5-tanure@linux.com> <179561837863.3135.7453763060716815613@kernel.org>
In-Reply-To: <179561837863.3135.7453763060716815613@kernel.org>
From: Lucas Tanure <tanure@linux.com>
Date: Thu, 26 Nov 2026 12:49:17 +0000
X-Gmail-Original-Message-ID: <CAJX_Q+3yLJbKUKh9ZqbJTm5QY+5jGedaST8aFJvHQvU6mu3oNg@mail.gmail.com>
X-Gm-Features: Aa3M54rVCY5vVqL26ka6o_i4OGggk-NPYkWlLazpuMdrAcDWKkBH6Cp6PaCVWDk
Message-ID: <CAJX_Q+3yLJbKUKh9ZqbJTm5QY+5jGedaST8aFJvHQvU6mu3oNg@mail.gmail.com>
Subject: Re: [PATCH v8 4/4] arm64: dts: amlogic: t7: khadas-vim4: enable the
 ethernet port
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
X-CRM114-CacheID: sfid-20261126_045627_143318_AACE2654 
X-CRM114-Status: GOOD (  31.84  )
X-Spam-Score: -0.7 (/)
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
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 =C2=B7 Low: 0
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [Medium] The commit says it enables the Khadas VIM4 ethernet port.
>
> --
>
> arm64: dts: amlogic: t7: khadas-vim4: enable the ethernet port
>
> This patch enables the T7 ethernet MAC and the MDIO multiplexer on the
> Khadas VIM4. It also describes the RTL8211F RGMII PHY at address 1 on the
> external MDIO bus, with its interrupt on GPIOH_6. With phy-mode =3D
> "rgmii-id", the PHY adds both RGMII delays.
>
> > diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.=
dts b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> > index 0fa83362b4179..7b86ab2579aaa 100644
> > --- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> > +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
>
> [ ... ]
>
> > @@ -256,6 +257,28 @@ xtal: xtal-clk {
> >       };
> >  };
> >
> > +&ethmac {
> > +     status =3D "okay";
> > +     pinctrl-0 =3D <&eth_pins>, <&eth_rgmii_pins>;
> > +     pinctrl-names =3D "default";
> > +     phy-mode =3D "rgmii-id";
> > +     phy-handle =3D <&external_phy>;
> > +};
> > +
> > +&eth_phy {
> > +     status =3D "okay";
> > +};
>
> [Severity: Medium]
> Can any driver at this revision bind to the ethmac node this enables?

Yes. c4c851a3325e ("net: stmmac: dwmac-meson8b: add support for the
Amlogic T7"), in net-next since 2026-11-20, matches amlogic,t7-dwmac,
and 18029931478b documents it; the cover letter lists both. Tested on
this board on top of them: the PHY attaches at mdio_mux-0.0:01 and
iperf3 runs at 941/944 Mbit/s.

>
> The node in amlogic-t7.dtsi has:
>
> arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi:
>                 ethmac: ethernet@fdc00000 {
>                         compatible =3D "amlogic,t7-dwmac", "snps,dwmac-5.=
10a";
>
> The amlogic,t7-dwmac string appears only in amlogic-t7.dtsi. The Amlogic
> glue driver's match table, meson8b_dwmac_match[] in dwmac-meson8b.c, ends
> at g12a:
>
>         {
>                 .compatible =3D "amlogic,meson-g12a-dwmac",
>                 .data =3D &meson_g12a_dwmac_data,
>         },
>         { }
>
> dwmac_generic_match[] in dwmac-generic.c ends at snps,dwmac-4.10a, plus
> snps,dwmac and the snps,dwxgmac entries. Under drivers/, the only place
> that names snps,dwmac-5.10a is stmmac_gmac4_compats[] in
> stmmac_platform.c. That list detects the core version. It is not an
> of_match_table.
>
> If nothing probes ethmac, its mdio0 child bus is never registered. The
> eth_phy mux enabled just above binds through the amlogic,g12a-mdio-mux
> fallback and has mdio-parent-bus =3D <&mdio0>. So mdio_mux_init() would
> defer on every attempt:
>
> drivers/net/mdio/mdio-mux.c:mdio_mux_init() {
>     ...
>                 parent_bus =3D of_mdio_find_bus(parent_bus_node);
>                 if (!parent_bus) {
>                         ret_val =3D -EPROBE_DEFER;
>                         goto err_parent_bus;
>                 }
>     ...
> }
>
> Wouldn't that leave ext_mdio and external_phy unregistered, so that
> phy-handle never resolves?
>
> Also, nothing would program the PRG_ETH glue window, which is the second
> reg region at 0xfe024000. That window holds the RGMII mode select, the
> clkin0/clkin1 TX clock mux and the MAC-side delays.
>
> Nothing would claim the pipeline clock (CLKID_SYS_AMPIPE_ETH) either. The
> previous patch in the series, "arm64: dts: amlogic: t7: add the ethernet
> controller", says this gate is otherwise turned off as unused. It also
> says the port keeps the bootloader's delays unless the controller
> programs them.
>
> amlogic,meson-dwmac.yaml does not document amlogic,t7-dwmac, so
> dtbs_check would report the now-enabled node as undocumented.
>
> Does this patch depend on a separate glue driver and binding series? If
> so, could the commit message name that prerequisite, or could this patch
> be sent together with it?
>
> [ ... ]
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20261121213102.143130-1-tanure%40linux.com

