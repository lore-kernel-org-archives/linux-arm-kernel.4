Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 004A6606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 17:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bYJM1vVq;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=nKVEVYog
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=xewmcd1sRaXw7lWObsFUBw4FbcUqkt5Mw98oDGjzbD8=; b=bYJM1vVq387ssc
	GQXdtr59+zxrcZ2D2nXvvwjRpZ9G0W8cx6hs1UGDrUoafst7X9XoymECsbYUUYGYXIqykidezwD/w
	IRnCzhO/LMJAUlnFTjyi0zOFnaRmBWLkwFgeYFe+DiOjG7k2/ha3F8hJWxn+wYc6XJk9n0zET+CqJ
	KYWjNwOJFBZuBpMPw5b8sLeG+xJaFj3hVF/Sk0z5xAJCjKBOMU6yl+Go8AfTF2HgwvA1EUCmkq6cx
	E423RqRz1qGKjFAtczi5bTwdD/405sDlpILRP0DNIksY4S3XV0i8x4m9Dy/+V1LwNTr3h1eQV5ExO
	k9CGbFjqeLz55YZOcYOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWyAm-0000000GuFY-3E2k;
	Fri, 27 Nov 2026 15:47:40 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWyAj-0000000GuEH-2e3B
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 15:47:39 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C696D4E417C6;
	Fri, 27 Nov 2026 15:47:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 895D76049C;
	Fri, 27 Nov 2026 15:47:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2D13811E90C56;
	Fri, 27 Nov 2026 16:47:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795794454; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=xewmcd1sRaXw7lWObsFUBw4FbcUqkt5Mw98oDGjzbD8=;
	b=nKVEVYogTIBJEQhHWS+ofSAhtVNrPnLTARl8t82BupdvGrZQstmssMeCDNtNJPwOCjbIyY
	EHxHi6e3uOo1n7SBwr+BKQo6ujFormYFzQR3hszdMjHixUdzjy0BrsMhNI+SPTyAsoEewJ
	j5kbKtjTYHjIC3fUj/NUHaSL6Wupk79Va5/y5KHOnYVzMdcLoz98A0SJfgjqvskONqvZCT
	PaK1+00YrrpJnnAfLSeiyViKMjSHy8QvV8jde5RtFkIbjJhyTi4r8FyurtQDgEvZeg/4ok
	Nc9AvAxeNazIqJGZqw4Dj+wXrnsye7acmEesMAmLXdeqvLzN7DVTZ2SVpvNgUw==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Rosen Penev <rosenp@gmail.com>, devicetree@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Dennis Gilmore <dennis@ausil.us>, "moderated
 list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,..."
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 6/7] ARM: dts: helios4: use hyphens in fan pinctrl node
 names
In-Reply-To: <20261126023856.767961-7-rosenp@gmail.com>
References: <20261126023856.767961-1-rosenp@gmail.com>
 <20261126023856.767961-7-rosenp@gmail.com>
Date: Fri, 27 Nov 2026 16:47:32 +0100
Message-ID: <877bhy1dkb.fsf@BLaptop.bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_074738_081018_854E7CA8 
X-CRM114-Status: GOOD (  12.39  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello Rosen Penev,

> dtc W=3D1 warns about the underscores in the fan pinctrl group node
> names:
>
>   Warning (node_name_chars_strict): .../helios_fan1_pins: Character '_' n=
ot recommended in node name
>
> Use hyphens like every other pin group in this file. The labels are
> unchanged, so no references need updating.
>
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  arch/arm/boot/dts/marvell/armada-388-helios4.dts | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/boot/dts/marvell/armada-388-helios4.dts b/arch/arm/=
boot/dts/marvell/armada-388-helios4.dts
> index d4ed47ae73c5..b62730b949a4 100644
> --- a/arch/arm/boot/dts/marvell/armada-388-helios4.dts
> +++ b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
> @@ -300,11 +300,11 @@ helios_io_led_pins: helios-io-led-pins {
>  						       "mpp54";
>  					marvell,function =3D "gpio";
>  				};

A small nit with this change: please move the nodes to keep the
alphabetic order. They should be placed before helios-io-led-pins`.

> -				helios_fan1_pins: helios_fan1_pins {
> +				helios_fan1_pins: helios-fan1-pins {
>  					marvell,pins =3D "mpp41", "mpp43";
>  					marvell,function =3D "gpio";
>  				};
> -				helios_fan2_pins: helios_fan2_pins {
> +				helios_fan2_pins: helios-fan2-pins {
>  					marvell,pins =3D "mpp48", "mpp55";
>  					marvell,function =3D "gpio";
>  				};
> --=20
> 2.56.1
>

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

