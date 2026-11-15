Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A5DC606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 07:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2LovsWud;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=icenowy.me header.i=@icenowy.me header.a=rsa-sha256 header.s=zmail2 header.b=HXT89uKD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=uLrkbNalekNKLkCB0XNj+22wcuzKD0fuIFqvheTwm3o=; b=2LovsWudLL9cVbeNXreRmG3pT1
	Cv/PK/gE59Fa47Maya7d3BgvUAW6RN4+Eq7D3YsLg3u5ZRUWA8o6HPMvmQoG4/ox5OgoMVe23XFcb
	M3Gw2Yw24tHWoWCJ5YllHZudzO1F5XNqv+pKbdChS3HXCtW6RM53yzA+uZw7SoeXKc2jzlN9o522+
	QIxVft4bzGKVK/hiBmRSndIctjS+B2oe+Vc738OByglZp3wHNpvx8S8qJH/dUNf/7o9BPrre4P7N/
	2XfuGOSztAH4UcWTL0GQrf9PlModlZZTs6w1no/AWQSUamy2EO40pD/GHRyaI5MZWiKmI2dFIt3Oc
	aTIjmAoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSV5B-0000000HCLb-20Mx;
	Sun, 15 Nov 2026 07:55:25 +0000
Received: from sender6-op-o15.zoho.com ([165.173.180.15])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSV57-0000000HCL5-2yu0;
	Sun, 15 Nov 2026 07:55:23 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1794729276; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=PzpbNvrjLiWmMMQpYIFs6kNtE5aAFPG95KjK5KvlXphkFJSQWxIkxHJ4ewsm4PYP3Mu0PpJusYSynaTno95IPepvJSuojmDTtnqDPrMUmq4G0/DTo6yfAJQOclFVYQvcm8r9jx8WmNHum1iqeQh818u9gkDKzaozdGAAGHtdC0Q=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794729276; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=uLrkbNalekNKLkCB0XNj+22wcuzKD0fuIFqvheTwm3o=; 
	b=UY3QFzh2y8YKc6dOyLqCWIN0cb0Dg83WZRST7n5TKEVlzHkytkmluI80+r9b3AeVwHbIKNNmnJpUiRGJWOlG6Oq0XE7DX4O/OVg10DOFJm/HQlxdTTmMviT9RldpbxtRZK4bQjwZBY01n70Wg4cSQz26p/LS7DENhlA37eiS7S0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: a=rsa-sha256; b=HXT89uKDo45p/IEIvQZmTbsoA3f6lkwMkgKc83FYWPHSHvSS15qcZRoGwBJLRFlK3r88KFW6epg9hZH4+rukeSGfXRkgyl8GBU8U4o+d67P6qUoaL0v4Yb7iW8sEeP4dCB5mNz08q3mkik23j6b8f3x9/z9Dkdu91sV4nbhUU124g6M50i1ZHcaboD1mp9kVDGqn16XGZ+iuOyT5ZYmtQIVLzVE5ONA+HqL48LJIG0cJqY2hBYAiW7gg5VRq1n3xH9RaU8xdBXCa6d97Jg67wDJu+K4XcnskstUIPVU0vYe8dbOM1UW5DzEoRv1CsSaC6v3iV3GdQZsrqRdYtx57OQ==; c=relaxed/relaxed; s=zmail2; d=icenowy.me; v=1; bh=uLrkbNalekNKLkCB0XNj+22wcuzKD0fuIFqvheTwm3o=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794728372584790.9071811696919;
	Sat, 14 Nov 2026 23:39:32 -0800 (PST)
Message-ID: <a6b616df57285440326043f5546affe9a64fd1ca.camel@icenowy.me>
Subject: Re: [PATCH 19/19] MAINTAINERS: add an entry for the Allwinner V861
 SoC
From: Icenowy Zheng <uwu@icenowy.me>
To: Jernej =?gb2312?Q?=810=947krabec?= <jernej.skrabec@gmail.com>, 
	gaohan@iscas.ac.cn, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt	
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti	
 <alex@ghiti.fr>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski	
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Guo Ren	
 <guoren@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Radu Rendec	
 <radu@rendec.net>, Samuel Holland <samuel.holland@sifive.com>, Daniel
 Lezcano	 <daniel.lezcano@kernel.org>, Anup Patel <anup@brainfault.org>,
 Stephen Boyd	 <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet	 <jbrunet+clk@baylibre.com>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland	 <samuel@sholland.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Maxime Ripard <mripard@kernel.org>, Linus
 Walleij	 <linusw@kernel.org>, Andre Przywara <andre.przywara@arm.com>, 
	linux-sunxi@lists.linux.dev
Cc: Han Gao <rabenda.cn@gmail.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>,
 devicetree@vger.kernel.org, 	linux-csky@vger.kernel.org,
 linux-clk@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 linux-rtc@vger.kernel.org, 	linux-gpio@vger.kernel.org
Date: Sun, 15 Nov 2026 15:39:17 +0800
In-Reply-To: <G7_h6i47RcuqvaGeHxw_dw@gmail.com>
References: <20261114-v861-v1-0-eb71ec3ee523@iscas.ac.cn>
	 <20261114-v861-v1-19-eb71ec3ee523@iscas.ac.cn>
	 <45f41ca4bcc76a6c5d0b9180c6492308ec3e85c9.camel@icenowy.me>
	 <G7_h6i47RcuqvaGeHxw_dw@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_235521_790986_624379B0 
X-CRM114-Status: GOOD (  15.97  )
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

=E5=9C=A8 2026-11-15=E6=97=A5=E7=9A=84 08:32 +0100=EF=BC=8CJernej =C5=A0kra=
bec=E5=86=99=E9=81=93=EF=BC=9A
> Dne nedelja, 15. november 2026 ob 06:11:31 Srednjeevropski standardni
> =C4=8Das je Icenowy Zheng napisal(a):
> > =E5=9C=A8 2026-11-14=E5=85=AD=E7=9A=84 06:33 +0800=EF=BC=8CHan Gao via =
B4 Relay=E5=86=99=E9=81=93=EF=BC=9A
> > > From: Han Gao <gaohan@iscas.ac.cn>
> > >=20
> > > Add myself as maintainer for the V861 bindings, clock and pin
> > > control
> > > drivers and device trees.
> >=20
> > I think traditionally sunxi do not add maintainers for specific
> > SoCs.
> >=20
> > Maybe you should patch the regexp of "ARM/Allwinner sunXi SoC
> > support"
> > item instead.
>=20
> Usually no entries are added at all.
>=20

The N: clause in "ARM/Allwinner sunXi SoC support" currently only
contains `sun[25]0i` for two-digit IDs, so I think sun55i/sun60i is
also not matched yet?

BTW a random thought: should sunXiwN be accepted name now? I found that
qcom now speaks SoC codenames (e.g. nord, kodiak, etc) instead of
market names, and this might help pre-launch mainlining (well, if
Allwinner, or at least some contractor, is going to do it...).

Thanks,
Icenowy

>=20
> Best regards,
> Jernej
>=20
> >=20
> > Thanks,
> > Icenowy
> >=20
> > >=20
> > > Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> > > ---
> > > =C2=A0MAINTAINERS | 12 ++++++++++++
> > > =C2=A01 file changed, 12 insertions(+)
> > >=20
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index 93abbb315065..dfc300dc1eb2 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -24031,6 +24031,18 @@ F:	drivers/irqchip/irq-riscv-intc.c
> > > =C2=A0F:	include/linux/irqchip/riscv-aplic.h
> > > =C2=A0F:	include/linux/irqchip/riscv-imsic.h
> > > =C2=A0
> > > +RISC-V ALLWINNER V861 SoC SUPPORT
> > > +M:	Han Gao <gaohan@iscas.ac.cn>
> > > +L:	linux-riscv@lists.infradead.org
> > > +L:	linux-sunxi@lists.linux.dev
> > > +S:	Maintained
> > > +F:	Documentation/devicetree/bindings/clock/allwinner,sun252
> > > i-
> > > v861-ccu.yaml
> > > +F:	arch/riscv/boot/dts/allwinner/sun252i-v861*
> > > +F:	drivers/clk/sunxi-ng/ccu-sun252i-v861*.c
> > > +F:	drivers/pinctrl/sunxi/pinctrl-sun252i-v861*.c
> > > +F:	include/dt-bindings/clock/sun252i-v861*.h
> > > +F:	include/dt-bindings/reset/sun252i-v861*.h
> > > +
> > > =C2=A0RISC-V ANDES SoC Support
> > > =C2=A0M:	Ben Zong-You Xie <ben717@andestech.com>
> > > =C2=A0S:	Maintained
> >=20
> >=20
>=20
>=20
>=20

