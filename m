Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ED1A606C66C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 09:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=L7dkZJFf;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=Jqt+EZjA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=5/I/TK2BRl2LnMysxk0s70GG7ZihlSvhoUVTH7m/jhE=; b=L7dkZJFf3NVU3h
	izKcc8Fxn5UmR6grV+IB0rpRjNxUx+ucC4W0Ofy6m/ZlG11W+5swgknI8ZA9QSLYFLnWRj9A/CfJn
	gttlr8qRiensz931w/iYwYa4joseX9Ki3xBE/W01UPRuHAvNTqzGqLsIeJ9LIow++8Ddqd2XpcFYq
	8fY9YMeglare5ceXiOea9gMBONPE2wQTJAszTMlQUD5+JA0NI8HKfXhEGOGLZyZ8su79nDpncEUyL
	IdXw0Km2ACcCaDs2DehL2d/H2gryTJ3/0NcsODO/hTyDNMP3jDudAxZYrv8oL1K6qzpsGrGWJL6RZ
	Ec1BwoZdBR1EpcA/ar8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQiFf-00000003I1y-28yd;
	Tue, 10 Nov 2026 09:34:51 +0000
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQiFd-00000003I19-0KVM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 09:34:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description;
	bh=5/I/TK2BRl2LnMysxk0s70GG7ZihlSvhoUVTH7m/jhE=; t=1794303288; x=1795512888; 
	b=Jqt+EZjA17kopc7KPqQX9bBLPDgJ6mvvyHlHzw4rSDcMmeq8VUPGdlLcm8fUVhSH95Nu4ZQy4Nh
	vsk0sVx5WGIh0SXdwQPE/gGY3Aypg0daQdKI7Z2DlL333omuB1h4BQV5UvDclPjkOwDvr1aZWpiU6
	fnp2l+H1oePJpvFgNnvLLalimG//GfmiRPf38c8W2t3ne5nFR2d4ChA7KnAISos6HylXe1Jbk7D8P
	xTzubNCHD8yHC1e24qt9Mt+o1sIr3NocUUfWMfVOznbjZd5VSxlY133nfiaQwviiGm59vENFAHx80
	5R/akXu0p89CBV9nHc/prj7Cf+m2JlgG6BpQ==;
Date: Tue, 10 Nov 2026 10:34:05 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Alistair <alistair@alistair23.me>
Cc: Pablo Mazzini <pmazzini@gmail.com>, Frank Li <Frank.Li@nxp.com>, Sascha
 Hauer <s.hauer@pengutronix.de>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley	 <conor+dt@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
 <festevam@gmail.com>, devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/7] ARM: dts: imx: keep the SY7636A VCOM on
Message-ID: <20261110103405.5e0384bb@kemnade.info>
In-Reply-To: <54130686e08db48928484e226f48dc31a8c5ee29.camel@alistair23.me>
References: <20261026003918.155321-1-pmazzini@gmail.com>
	<20261026003918.155321-2-pmazzini@gmail.com>
	<20261026083058.04173f10@kemnade.info>
	<54130686e08db48928484e226f48dc31a8c5ee29.camel@alistair23.me>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_013449_121667_58C18398 
X-CRM114-Status: GOOD (  27.02  )
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 10 Nov 2026 15:23:03 +1000
Alistair <alistair@alistair23.me> wrote:

> On Mon, 2026-10-26 at 08:30 +0100, Andreas Kemnade wrote:
> > On Mon, 26 Oct 2026 00:39:12 +0000
> > Pablo Mazzini <pmazzini@gmail.com> wrote:
> >  =20
> > > The SY7636A hwmon driver turns VCOM on at probe. The reMarkable 2,
> > > Kobo
> > > Libra H2O and Tolino Vision 5 have had the rails on so far. Mark
> > > VCOM
> > > always-on before the driver stops doing it.
> > >=20
> > > Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
> > > ---
> > > =C2=A0arch/arm/boot/dts/nxp/imx/e70k02.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1 +
> > > =C2=A0arch/arm/boot/dts/nxp/imx/imx7d-remarkable2.dts | 1 +
> > > =C2=A02 files changed, 2 insertions(+)
> > >=20
> > > diff --git a/arch/arm/boot/dts/nxp/imx/e70k02.dtsi
> > > b/arch/arm/boot/dts/nxp/imx/e70k02.dtsi
> > > index dc7ff108aa85..bd9c6c6fa117 100644
> > > --- a/arch/arm/boot/dts/nxp/imx/e70k02.dtsi
> > > +++ b/arch/arm/boot/dts/nxp/imx/e70k02.dtsi
> > > @@ -154,6 +154,7 @@ sy7636: pmic@62 {
> > > =C2=A0		regulators {
> > > =C2=A0			reg_epdpmic: vcom {
> > > =C2=A0				regulator-name =3D "vcom";
> > > +				regulator-always-on;
> > > =C2=A0			};
> > > =C2=A0		};
> > > =C2=A0	}; =20
> > No, please not. That regulator is in practice used with a not yet
> > upstreamed
> > driver for the EPDC on that platform used to deal with the current
> > kernels
> > fp9931 / tps65185 drivers. So it is very welcome to have it not
> > always turned
> > on.
> >=20
> >  =20
> > > diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-remarkable2.dts
> > > b/arch/arm/boot/dts/nxp/imx/imx7d-remarkable2.dts
> > > index ff9d50942884..6cf5603c0752 100644
> > > --- a/arch/arm/boot/dts/nxp/imx/imx7d-remarkable2.dts
> > > +++ b/arch/arm/boot/dts/nxp/imx/imx7d-remarkable2.dts
> > > @@ -327,6 +327,7 @@ sy7636a: pmic@62 {
> > > =C2=A0		regulators {
> > > =C2=A0			reg_epdpmic: vcom {
> > > =C2=A0				regulator-name =3D "vcom";
> > > +				regulator-always-on;
> > > =C2=A0				regulator-boot-on;
> > > =C2=A0			};
> > > =C2=A0		}; =20
> >=20
> >=20
> > Here the situation is a bit different. If I remember correctly, there
> > is some special EPD logic in userspace on top of some ordinary kernel
> > display driver. But thesse things are missing is devicetree?! But =20
>=20
> Yeah, the kernel just exposes a framebuffer and a special secret sauce
> userspace program writes to that.

Looking at that processor. It seems to have an EPDC like the i.MX6 has.
Looking even further. The Kobo factory kernel for i.MX6SLL devices specifies
fsl,imx7d-epdc as compatible for that.
So if your display is just connected to that EPDC, then you could probably
wire up things on top of my EPDC driver with DRM interface.

So you still too need to run your own fork for the display?=20

>=20
> > that might need to learn to deal with regulator enabling/disabling.
> >=20
> > Regulator always on is probably not desired here, either. =20
>=20
> Yeah, I **think** we don't need that
>=20
You just need to add logic to enable/disable the regulator (if it is not
wired up yet). But it is nothing from the perspective of mainline to worry
about.

Regards,
Andreas

