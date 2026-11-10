Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D73606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 05:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dqTWmmQ6;
	dkim=pass (2048-bit key, unprotected) header.d=alistair23.me header.i=@alistair23.me header.a=rsa-sha256 header.s=fm3 header.b=KpDOjiBE;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=spYI1GwE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=T2nhlnktC6+vpOu5LGFXVvKIRUFvwweE0CgD5SaybwE=; b=dqTWmmQ6MZpw9cLzfzZVRVCHtT
	s7ZqnFFQDbXgX87nJ5JCAtpeZaT1GysUzutpPLfSEQG1iET1+6cx+6cgKeQJiG6KJaReWkn2hXBhX
	eLUAT0AtKvay19PKTTFng2P0vGjnjtbitpQ8Ixxm4ovYLL+hbvDbWkMj52tdFlfvnHLqOR8bwWmxy
	P4zuB5+RMNyd/fTWP/pMSa3fAXqcqT9Fp8XljsgPFRkU0Gj7fOmZJlbdr23wnrJfboIyqjO9Tmr/l
	NZk+Z1cewrvW+vscVF5NBVNFam5mYr+jp0kp7p85B6LXb9rKtMUA4vC6rE9eVD9c8kQq+syGYcRSg
	knT3Eb5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQeKC-00000002WIs-0BhK;
	Tue, 10 Nov 2026 05:23:16 +0000
Received: from fout-a5-smtp.messagingengine.com ([103.168.172.148])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQeK9-00000002WIS-1shJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 05:23:15 +0000
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
	by mailfout.phl.internal (Postfix) with ESMTP id EFDFCEC0589
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 00:23:09 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-08.internal (MEProxy); Tue, 10 Nov 2026 00:23:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm3;
	 t=1794288189; x=1794374589; bh=T2nhlnktC6+vpOu5LGFXVvKIRUFvwweE
	0CgD5SaybwE=; b=KpDOjiBEiB7vsZmFL7JvlaPk6xFRjfR7mbmcnM17kwpF3ouI
	zX1qon5dXBs9+KBoaA9bpajzXYdWX/ktCF6u3Zi2Hnv+VCYcFlhNKMkpxGy4N/Th
	evd+PUpzSaxBkmHG9rZ2WYqLyw/Tgx9Qas1hCWKJMEP2qKS3FcmtxrHAh2x40l1L
	uH6nWGelKjYAT7c1piGdODFwMcZPulYthymkxLoC1ApdYqeSsKvDrV4wqRJMrWFW
	vY0waDVbebDFiwtc7d3vEpQhIoBnRAnNNTuDbT4NppzToF3VcuysnSeFUO6NWIV5
	GUKPg8jiyBvIluzK71/CaJjVtbeXzf1Jr7NGLw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1794288189; x=
	1794374589; bh=T2nhlnktC6+vpOu5LGFXVvKIRUFvwweE0CgD5SaybwE=; b=s
	pYI1GwEwOjfIvH6g/LdRbVe+fcnLM6lx15N4bzckstQQg/2h36PH4J1mGRBbZ+MH
	em9ZJTHc//jBsJu11QNfXZNIBec6iAiqEmymLkuCGe//JZeja362+hx8PFWRxjpF
	eqwN3EgUKFD3FmKPz/aTbm+JCLGdCHsbDZPKztYEXQXMmvjrpZbhqeBX0s+O1Rdz
	UYmuQI4y4hyD5gXYot6QPR1BsYBuhW67zAosW8M1sdKs2XT8waoFT6Da4yHbIe0j
	KPv6dT0Ozk5S+BJXwx0L6cvlqlXfnCIPTbaPhxdgjNuv03UnzYSDj6PfVfPuWTm8
	U6wcW9KOkN/VWim3JOrsg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=alistair23.me a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794288189; d=alistair23.me;
	mf=PGFsaXN0YWlyQGFsaXN0YWlyMjMubWU+;
	rt=PGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZz4=;
	s=fm3:rsa-sha256:AaG42//2Qfik9eCkf2qsUFD3Qh3Gb1hgfUWr+8epqDqg2py
	u08uxVCtw7k/cf29JHroCGxWB7YOkIdllqnvyd/l8f7g1FoMpmVnG/0d95OF4AXs
	DYFT9gczg4C0SFJqCX/lsgqMT5XQcezxuy5Iffi0r1QV0HeLuxMzKLMAQcaq+4I0
	g7yO44QxFGjYEC2McVXDxPn1XH6xMkvnWDd+gxpKVoQunqF066ZI/wMQpTunq1CZ
	D5IPN3ftGfk/3OlrYmR/vOvaa3/KQRLXIKMAepgLisMGoPgazvmPta1fy/6BySmu
	ojbdUmHdqItyrkrEV3t19L6Qyndb8Z8yHvD+NEw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=13;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to,
	user-agent;
Message-Instance: m=1; h=sha256:E9+F5HLFgZz19ViFV5KDWazPCgNCMAv0N6wh6U3+dn8=:T2nhlnktC6+vpOu5LGFXVvKIRUFvwweE0CgD5SaybwE=;
X-ME-Sender: <xms:ParyalWRKmx3UJdOU-2UBPwUvO0Db-9bVZ75xtAGz2yf3PFZxHe9bQ>
    <xme:Paryas2MhcRegoaQm7kJZ4IPMR09DJhXCmH59PphafexnRlFySd5A6hathStutdID
    hS8wdpngmga-57FXGlvOBroyvx5plb3zrDxJYmS1rgN4BYAth6Zv2SL>
X-ME-Received: <xmr:ParyasRo2Wx4VSHn9RZNkjYdflzznlmN_gzsGhPTQhHsdGL1ckZ9RC4fWrKC1u-r0GM92GEdSCtV_UjMCvSLl-6mP-g>
X-ME-Proxy-Cause: dmFkZTGqBuX4sZN2nDVJ/px5UrVJdztRnTOsNRAZSLYCUlxw3NGhJBNfRM2geYvMl4kkOr
    SaBD5eouIGLmXMXQy/gPLzuOSxSGKPMH1YTTkqzmjrV0L5Z2fwgFCkXmwhX6En2hzACDDF
    Ttd3rLZMjjKFiMf2Su56kvxmJZIvBcwFxmrCmbfTQt424EpyDiIGluHPzJp0V38RE3hvao
    3FPOFjU7AG74YWVlN6nZk0XV3VtKwHvHjSPw1Bl7G7BvgwodmfRWKfFBcT7oJisCRKTnwZ
    u9rVSrscMMhvArtCLbp1XiZ2d786Y7p7DGwYj9omuiY1kohetrPilohm0iIepp7y+uuqSQ
    zKfV4yP/etu6tdXXzwRm/nqWdER6Q5VkdoN5CKcsBPRsHBzYaWO9J3FwlEyhxNwnt9xF97
    mJ4hySDnUwvWQtDQH+VCF36rsCF3yCVt88fdBvY8mLzT3CKTNuH6UlCVD8ySQppJFyoIZV
    O+UrxuLxdGuuvp1UgBNWWhdy5u5PSfmqV1AgaeQ8UmV9LAfjTLgXRLfBiBVte2RnY6Kj3d
    6sQ76rDsQj4ecOscz0xEDyiY+9kGFSCyRfLQx1cTF0gZvjlUjlpcblOV4feOdi/wpDx64V
    7EKBJsWCRlXRFWZXh5iQpr7sR5Xe2cEh+ZaJzG/c5dE/LK4Q+CIhJPxMPg2g
X-ME-Proxy: <xmx:ParyaoQ7zFijaKaqh1XsKAo3lbd6HRW2Gut8VpkSdSRxp4n47LjL0A>
    <xmx:ParyalUuPEC9P7wrP2FHkiQd0Q2cUNOVXaKWMCO_wYbVCA_uLIp5bw>
    <xmx:ParyaqKrF7qGEPi6sirlhozKynqY1acy2TxfH_y_3Ab6Y0lWQcTlvg>
    <xmx:ParyaugfgHY0kyPTyO71B_ty4eg-VuXUV4Gq4UOnc8jJ_ziJ0dgHlA>
    <xmx:ParyaiEoObQDdfoLeeGHeYlQRh_PSOqrQ0d1OcpHjZOJE0Vten1fXy2y>
Feedback-ID: ifd214418:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 10 Nov 2026 00:23:05 -0500 (EST)
Message-ID: <54130686e08db48928484e226f48dc31a8c5ee29.camel@alistair23.me>
Subject: Re: [PATCH 1/7] ARM: dts: imx: keep the SY7636A VCOM on
From: Alistair <alistair@alistair23.me>
To: Andreas Kemnade <andreas@kemnade.info>, Pablo Mazzini
 <pmazzini@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley	 <conor+dt@kernel.org>, Pengutronix Kernel Team
 <kernel@pengutronix.de>,  Fabio Estevam <festevam@gmail.com>,
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Tue, 10 Nov 2026 15:23:03 +1000
In-Reply-To: <20261026083058.04173f10@kemnade.info>
References: <20261026003918.155321-1-pmazzini@gmail.com>
		<20261026003918.155321-2-pmazzini@gmail.com>
	 <20261026083058.04173f10@kemnade.info>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.62.1 (by Flathub.org) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_212313_877989_46A967A8 
X-CRM114-Status: GOOD (  21.83  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 2026-10-26 at 08:30 +0100, Andreas Kemnade wrote:
> On Mon, 26 Oct 2026 00:39:12 +0000
> Pablo Mazzini <pmazzini@gmail.com> wrote:
>=20
> > The SY7636A hwmon driver turns VCOM on at probe. The reMarkable 2,
> > Kobo
> > Libra H2O and Tolino Vision 5 have had the rails on so far. Mark
> > VCOM
> > always-on before the driver stops doing it.
> >=20
> > Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
> > ---
> > =C2=A0arch/arm/boot/dts/nxp/imx/e70k02.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1 +
> > =C2=A0arch/arm/boot/dts/nxp/imx/imx7d-remarkable2.dts | 1 +
> > =C2=A02 files changed, 2 insertions(+)
> >=20
> > diff --git a/arch/arm/boot/dts/nxp/imx/e70k02.dtsi
> > b/arch/arm/boot/dts/nxp/imx/e70k02.dtsi
> > index dc7ff108aa85..bd9c6c6fa117 100644
> > --- a/arch/arm/boot/dts/nxp/imx/e70k02.dtsi
> > +++ b/arch/arm/boot/dts/nxp/imx/e70k02.dtsi
> > @@ -154,6 +154,7 @@ sy7636: pmic@62 {
> > =C2=A0=09=09regulators {
> > =C2=A0=09=09=09reg_epdpmic: vcom {
> > =C2=A0=09=09=09=09regulator-name =3D "vcom";
> > +=09=09=09=09regulator-always-on;
> > =C2=A0=09=09=09};
> > =C2=A0=09=09};
> > =C2=A0=09};
> No, please not. That regulator is in practice used with a not yet
> upstreamed
> driver for the EPDC on that platform used to deal with the current
> kernels
> fp9931 / tps65185 drivers. So it is very welcome to have it not
> always turned
> on.
>=20
>=20
> > diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-remarkable2.dts
> > b/arch/arm/boot/dts/nxp/imx/imx7d-remarkable2.dts
> > index ff9d50942884..6cf5603c0752 100644
> > --- a/arch/arm/boot/dts/nxp/imx/imx7d-remarkable2.dts
> > +++ b/arch/arm/boot/dts/nxp/imx/imx7d-remarkable2.dts
> > @@ -327,6 +327,7 @@ sy7636a: pmic@62 {
> > =C2=A0=09=09regulators {
> > =C2=A0=09=09=09reg_epdpmic: vcom {
> > =C2=A0=09=09=09=09regulator-name =3D "vcom";
> > +=09=09=09=09regulator-always-on;
> > =C2=A0=09=09=09=09regulator-boot-on;
> > =C2=A0=09=09=09};
> > =C2=A0=09=09};
>=20
>=20
> Here the situation is a bit different. If I remember correctly, there
> is some special EPD logic in userspace on top of some ordinary kernel
> display driver. But thesse things are missing is devicetree?! But

Yeah, the kernel just exposes a framebuffer and a special secret sauce
userspace program writes to that.

> that might need to learn to deal with regulator enabling/disabling.
>=20
> Regulator always on is probably not desired here, either.

Yeah, I **think** we don't need that

Alistair

>=20
> Regards,
> Andreas

