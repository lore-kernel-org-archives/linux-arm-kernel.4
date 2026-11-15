Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A40D606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 11:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4ZTUvm1u;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n03mFvQ/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=kX53oJXe6zh6Wm0f/NLw/xzJgNuI7GT7tZ/9xrnt5WI=; b=4ZTUvm1u+IMM29ToRAyrR185+D
	e+UICcScZBqRaKxUIGf8EBiK4odGaoPLiRSy68ARMUXpktMirIH8rAXMlSvFmd2kZ1ejlAPZ650dX
	d8bcIf655wCTrgpcIkqjKuWzqtlZ+vloeY1Ua+JSQSSPnHSc15rtqnThg+Y8OcyoBCxP9Bb/oocRb
	35uc3rlt5k5h6xX3f9tUudO7FQAPiLZqmSumTsVKK6n8Mr2W7swOGvKarXvS6mASCcTLPqw6/Xx7A
	TXvs7pK04awteMDsGF6IM6razno5UkdBVBGCpPUX8Hky+P0aOOYHm4aUqLUZSm1uClaYyoKvdFDKG
	4uxWGrnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSYKg-0000000HRQJ-0MRI;
	Sun, 15 Nov 2026 11:23:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSYKc-0000000HRQA-1dXt
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 11:23:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BE293456F3
	for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 11:23:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A68C91F000CB
	for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 11:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794741813;
	bh=kX53oJXe6zh6Wm0f/NLw/xzJgNuI7GT7tZ/9xrnt5WI=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=n03mFvQ/1EXrpr5LWQJtiZYHd03TFTWFjfs47QxSHRguTJtgURTEOt8VLNSFJQc7V
	 8L1ioyNBXKcSCdeXyzO3Zbbq7rjPZUO5cdi/KH5O4/8SmNHFf8+dhb++ZDR9jqF3XN
	 eQFMiMpw558ksTpnDxbW1Uoyf7SrURXsJJQ0NdakMTHtLX9GYnKsAyAcFTWDVL5PDQ
	 a/d4B9e/Eyv/g1jr0gu0oHnuMdcm9UInKtOVUPZKT16D06n3S52QgoPjw78i2DiGFZ
	 vrwsvnDFcXKLM5i39Jx18tUFh+8lkX1DtcjgfTRdaOPBvKEB8tN0IQtjsJEAqkI/0h
	 pWRFQtnQ60VhA==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3accd1ff4c3so24323001fa.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 03:23:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHOcnyETzFPZ56Dv3IiYkuAij7JB+YzDQEqiFbiH1sMBFaaNtav2+DJv8L8/4qMy7mu8uNQ/yFBdfN7lgxXyf+V@lists.infradead.org
X-Gm-Message-State: APuU4Z9FAWOxElzp0DzEAkEinFja39rJpMRNOGGfIhRiF1UBI1Pj319g
	9azmKpEjeo0csmJ0QfYfztDX+6K94fiypaCzn+E5N+jW6unEslZjqhSOmJdcSCIxr5zMov4ZC9D
	idqbt/1mLGnYVi/9iNVbRSXgSeSQLTBQ=
X-Received: by 2002:a05:651c:a142:b0:3ab:3bf3:1610 with SMTP id
 38308e7fff4ca-3ae2b4cb4a9mr19055231fa.10.1794741811994; Sun, 15 Nov 2026
 03:23:31 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261112-h616-zero2-dt-v3-0-1cd2664230c8@gmail.com> <20261112-h616-zero2-dt-v3-3-1cd2664230c8@gmail.com>
In-Reply-To: <20261112-h616-zero2-dt-v3-3-1cd2664230c8@gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sun, 15 Nov 2026 19:23:18 +0800
X-Gmail-Original-Message-ID: <CAGb2v66AtwrqViwOdwd9SwXAxXKv7U1za72pj2BqcdqegVnYpA@mail.gmail.com>
X-Gm-Features: AclHuK8ZAVIclElCusS8bGm9wRGMlekW6DfDLlnWFEB8TeBA8l91MdVQ65LV97I
Message-ID: <CAGb2v66AtwrqViwOdwd9SwXAxXKv7U1za72pj2BqcdqegVnYpA@mail.gmail.com>
Subject: Re: [PATCH v3 3/7] arm64: dts: allwinner: h616: Add GPU OPP table
To: aiyengar1990@gmail.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Ryan Walklin <ryan@testtoast.com>, 
	Andre Przywara <andre.przywara@arm.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-20.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 12, 2026 at 5:22=E2=80=AFPM Arun Iyengar via B4 Relay
<devnull+aiyengar1990.gmail.com@kernel.org> wrote:
>
> From: Arun Iyengar <aiyengar1990@gmail.com>
>
> Add the operating points of the H616/H618 Mali-G31, so that boards can
> enable GPU DVFS through panfrost devfreq: 306 to 600 MHz at 810 to
> 950 mV. The table is the one of the vendor images (as recovered from a
> KickPi K2B image, also carried by Armbian). Like the H6 GPU OPP table,

FTR I found https://github.com/armbian/build/commit/3432b23f09c4a3fe74d6760=
b42ff01cfff8dfe1b
which probably came from https://github.com/armbian/build/pull/10902.

It says it was from an KickPi K2B v2.2 image. However the latest source
tree dump from KickPi doesn't seem to contain a GPU OPP. I can't tell if
the v2.2 refers to the board revision or the SDK version.


Note that OrangePi seems to use a different table:

https://github.com/orangepi-xunlong/linux-orangepi/blob/orange-pi-6.1-sun50=
iw9/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi#L1520

But anyway, if it works, that's fine.

> it uses <target target max> voltage triplets with a common 990 mV
> maximum: a board whose GPU supply cannot reach an OPP's target voltage
> loses that OPP, while a board whose supply minimum is above the target
> of the lower OPPs keeps them, as their [target, max] range still
> overlaps the supply's range.
>
> Like sun50i-h616-cpu-opp.dtsi, the table is in a separate file that
> boards include once their GPU supply is described.
>
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
> ---
>  .../boot/dts/allwinner/sun50i-h616-gpu-opp.dtsi    | 62 ++++++++++++++++=
++++++
>  1 file changed, 62 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-gpu-opp.dtsi b/arc=
h/arm64/boot/dts/allwinner/sun50i-h616-gpu-opp.dtsi
> new file mode 100644
> index 000000000000..18989d11c832
> --- /dev/null
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-gpu-opp.dtsi
> @@ -0,0 +1,62 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +// Copyright (C) 2026 Arun Iyengar <aiyengar1990@gmail.com>
> +
> +/ {
> +       gpu_opp_table: opp-table-gpu {
> +               compatible =3D "operating-points-v2";
> +
> +               opp-306000000 {
> +                       opp-hz =3D /bits/ 64 <306000000>;
> +                       opp-microvolt =3D <810000 810000 990000>;
> +               };
> +
> +               opp-336000000 {
> +                       opp-hz =3D /bits/ 64 <336000000>;
> +                       opp-microvolt =3D <810000 810000 990000>;
> +               };
> +
> +               opp-360000000 {
> +                       opp-hz =3D /bits/ 64 <360000000>;
> +                       opp-microvolt =3D <820000 820000 990000>;
> +               };
> +
> +               opp-384000000 {
> +                       opp-hz =3D /bits/ 64 <384000000>;
> +                       opp-microvolt =3D <830000 830000 990000>;
> +               };
> +
> +               opp-420000000 {
> +                       opp-hz =3D /bits/ 64 <420000000>;
> +                       opp-microvolt =3D <850000 850000 990000>;
> +               };
> +
> +               opp-456000000 {
> +                       opp-hz =3D /bits/ 64 <456000000>;
> +                       opp-microvolt =3D <870000 870000 990000>;
> +               };
> +
> +               opp-504000000 {
> +                       opp-hz =3D /bits/ 64 <504000000>;
> +                       opp-microvolt =3D <890000 890000 990000>;
> +               };
> +
> +               opp-540000000 {
> +                       opp-hz =3D /bits/ 64 <540000000>;
> +                       opp-microvolt =3D <910000 910000 990000>;
> +               };
> +
> +               opp-576000000 {
> +                       opp-hz =3D /bits/ 64 <576000000>;
> +                       opp-microvolt =3D <930000 930000 990000>;
> +               };
> +
> +               opp-600000000 {
> +                       opp-hz =3D /bits/ 64 <600000000>;
> +                       opp-microvolt =3D <950000 950000 990000>;
> +               };
> +       };
> +};
> +
> +&gpu {
> +       operating-points-v2 =3D <&gpu_opp_table>;
> +};
>
> --
> 2.55.0
>
>

