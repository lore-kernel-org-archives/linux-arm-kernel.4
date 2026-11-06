Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C541606D83D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 17:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uBu4Ee8k;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d+DHyfJP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=lurkkd2OGVOOshwXjRaBHIBZz8dwYG3EyAmFUfsINIo=; b=uBu4Ee8kfCyV9oTeEti1FQt9hP
	7xyO1g/CRbF3Ha98U8wjwNQ51U9RrLSnFNn4naW0yZLyfSwKB5RkGSkuNbTn+j+6UphAVygZ681Hh
	UOvR0lVo/0u0okuPFHnjH29lIM99/cHhhcHJsjRHf7XbvFRrBqWXD4gRztEY7cToRZmricBQCOJJM
	npT4hhtLciNNyWith3Yrn/NwG/04+4C0NAFQIjP6W0xQaaX5VH5K3Z8Do3lpVBD2vXOVMyhyS0fjm
	YeSPUEc3LXEer25ctHJh3mhEt1isCL/EOrh8flvxc/AkY2HcDSyo5cMAQBvix1OvvIV661iu4LeOJ
	Y2XpNH3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPNaR-0000000DCdD-1Igj;
	Fri, 06 Nov 2026 17:18:47 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPNaP-0000000DCcc-2aHv;
	Fri, 06 Nov 2026 17:18:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3EB4F419DB;
	Fri,  6 Nov 2026 17:18:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DF351F008A1;
	Fri,  6 Nov 2026 17:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793985524;
	bh=lurkkd2OGVOOshwXjRaBHIBZz8dwYG3EyAmFUfsINIo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=d+DHyfJP1XVxmLeTu6Rs3GxgEHaD2aPS5mjiW59JTpG7mymkHHhJ+dkmw1Mzw3u1T
	 NJ2gYwH/82VUGO+TjEoACHFp5kFJHWG24ZAgpLhF6zbZ1wuPl3NZLGhoVNaA2JrBnm
	 syAveCYMogUSmIznSI+upvj26/06Cggp59BMKOWrdigXTOkzWfhH6GDxNlqlgrfaX1
	 53KGMP9iAUU7wIn7x8KNO5aviB95ohxKG6gWP1JozS3lI5qpvz8OJkRtILsYB6XcPd
	 ybdA0CQ5GLRyaR5IiLtcL5qVbJn/Aj7uaP+ptWDZ2yMHNA+pR9/hdHjBaBFV61HqvC
	 xqi/Vo0Xg4y+Q==
Date: Fri, 6 Nov 2026 17:18:39 +0000
From: Conor Dooley <conor@kernel.org>
To: christian.koever-draxl@student.uibk.ac.at
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	neil.armstrong@linaro.org, khilman@baylibre.com,
	jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	Christian Stefan =?iso-8859-1?Q?K=F6v=E9r-Draxl?= <ckoever@outlook.de>
Subject: Re: [PATCH 05/10] arm64: dts: amlogic: meson-s4: add the Mali GPU
Message-ID: <20261106-tutor-multitude-5dc61fce86c7@spud>
References: <20261106104659.54656-1-christian.koever-draxl@student.uibk.ac.at>
 <20261106104659.54656-6-christian.koever-draxl@student.uibk.ac.at>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GX6UbGs9vRp5n+bb"
Content-Disposition: inline
In-Reply-To: <20261106104659.54656-6-christian.koever-draxl@student.uibk.ac.at>
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

--GX6UbGs9vRp5n+bb
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 06, 2026 at 11:46:54AM +0100, christian.koever-draxl@student.ui=
bk.ac.at wrote:
> From: Christian Stefan K=F6v=E9r-Draxl <ckoever@outlook.de>
>=20
> Add the Mali-G31 GPU with its operating points. The GPU rail is not
> switchable, so it scales by frequency only, over the fixed fclk derived
> rates the vendor DVFS table uses as well.
>=20
> Signed-off-by: Christian Stefan K=F6v=E9r-Draxl <ckoever@outlook.de>
> ---
>  arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 55 +++++++++++++++++++++++
>  1 file changed, 55 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/=
dts/amlogic/meson-s4.dtsi
> index 793c7bb9512e..69105c8abf12 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> @@ -126,6 +126,40 @@ vrtc: rtc@fe010288 {
>  		reg =3D <0x0 0xfe010288 0x0 0x4>;
>  	};
> =20
> +	/*
> +	 * The Mali rail is not switchable on this SoC, so the GPU scales by
> +	 * frequency alone. Every rate here is one of the fixed fclk dividers,
> +	 * optionally halved or quartered by the mali divider, which is what
> +	 * the vendor DVFS table uses as well. Its 850 MHz point is left out
> +	 * because it needs GP0 PLL, and the mali mux is not allowed to
> +	 * reprogram its parents.
> +	 */
> +	gpu_opp_table: opp-table-gpu {
> +		compatible =3D "operating-points-v2";
> +
> +		opp-124999998 {
> +			opp-hz =3D /bits/ 64 <124999998>;
> +		};
> +		opp-249999996 {
> +			opp-hz =3D /bits/ 64 <249999996>;
> +		};
> +		opp-285714281 {
> +			opp-hz =3D /bits/ 64 <285714281>;
> +		};
> +		opp-399999994 {
> +			opp-hz =3D /bits/ 64 <399999994>;
> +		};
> +		opp-499999992 {
> +			opp-hz =3D /bits/ 64 <499999992>;
> +		};
> +		opp-666666656 {
> +			opp-hz =3D /bits/ 64 <666666656>;
> +		};
> +		opp-799999988 {
> +			opp-hz =3D /bits/ 64 <799999988>;
> +		};
> +	};
> +
>  	xtal: xtal-clk {
>  		compatible =3D "fixed-clock";
>  		clock-frequency =3D <24000000>;
> @@ -164,6 +198,27 @@ soc {
>  		#size-cells =3D <2>;
>  		ranges;
> =20
> +		gpu: gpu@fe400000 {
> +			compatible =3D "amlogic,meson-g12a-mali", "arm,mali-bifrost";

This is an s4, not a g12a. You need to use a soc-specific comaptible.
pw-bot: changes-requested

Thanks,
Conor.

> +			reg =3D <0x0 0xfe400000 0x0 0x40000>;
> +			interrupt-names =3D "job", "mmu", "gpu";
> +			interrupts =3D <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>;
> +			/*
> +			 * CLKID_MALI is only the system bus gate. The core is
> +			 * fed by the glitch-free mali mux, which is the clock
> +			 * the OPP table scales.
> +			 */
> +			clocks =3D <&clkc_periphs CLKID_MALI_SEL>,
> +				 <&clkc_periphs CLKID_MALI>;
> +			clock-names =3D "core", "bus";
> +			resets =3D <&reset RESET_MALI_APB>, <&reset RESET_MALI>;
> +			operating-points-v2 =3D <&gpu_opp_table>;
> +			#cooling-cells =3D <2>;
> +			status =3D "disabled";
> +		};
> +
>  		gic: interrupt-controller@fff01000 {
>  			compatible =3D "arm,gic-400";
>  			#interrupt-cells =3D <3>;
> --=20
> 2.56.0
>=20

--GX6UbGs9vRp5n+bb
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCau4L7wAKCRB4tDGHoIJi
0rhKAQC9UqpC6wjI5ynGcGEMJuO//BWMDkIn+VQheuuflExlywD+NQNMGMKkUusQ
U3ghrzNdErs/Lz+td+qO68K+yim7IQQ=
=N+HD
-----END PGP SIGNATURE-----

--GX6UbGs9vRp5n+bb--

