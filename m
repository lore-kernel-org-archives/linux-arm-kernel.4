Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B25A2606A331
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 16:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jWgbn2i8;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HT1/YGw1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=62rquUBvOVvyiVKieMKcgUO9ltoC8VqQS3BayNI9r78=; b=jWgbn2i84kglA1WcPEoto+sNmB
	tzZL5HIUeRAPcdNSPp+hqz1Fh13029vgIIdTvD5AKQj7cKmP8eysXVIe8a2vrg5A/x956P5cfBbOK
	gPn0hFCKutuhElcj/73j4UTJQ2Yp1mpA1yvquN3ptxpSUYdu6Egh/mdwopyYWMIJ7WQKqxJ9v6/Xc
	5lDTdRzsMW9zjW+aopK5HeXSgxcU3E7G62vL1IjqYtivKEeRkPRXhM+e3Xy4khB5T3rid6Oz5MZvl
	cRMmYtf9vzksTkLH0yaGlDU8a5Gx0Djc84fl+OBWOkXnCqZ6pd0eUnAginFfpz4P5YTgL/5h3JCoO
	fBAj9Gog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVtdi-00000007AVx-1prA;
	Tue, 24 Nov 2026 16:45:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVtdb-00000007APA-3aVY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 16:44:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8352444E75
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 16:44:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46CD71F000E1
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 16:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795538699;
	bh=62rquUBvOVvyiVKieMKcgUO9ltoC8VqQS3BayNI9r78=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=HT1/YGw13Dv+iFvg8OAdS0pdI96Vn5LQHK6b0IPxIgdQ2mADdN8a60bD8ORpPmlCK
	 sYjbRnWmX3nMsfStBlMQ/B3y5whRvGe2EKBVwbJ5ic1ZYy98gYotUTa+s/yZxoWgMg
	 1KaW2ArbiDHBM7bJCTQF5A2sqJdFlTJLhZEIhJgw6TWfb6TDFsS3fkk+r2+W74Hz4w
	 /dsI6ulH7LbwYALPeqdmauGEHVqnbwX0DeytLlXWmo/YgGyjTX3qbiOfL6hUK7seFn
	 xXpCd1feqAYqvSFD2hB1tjiYV6a8roxoO7KnCiWFKtJ4GTfGeFBEQBCIj0y7Wy3jEL
	 8z0wjhfM9ia8w==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3ae25dcbd81so41281671fa.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 08:44:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErG4awREigZF04GvQbOmioyGUqvTJnnJzaKzo4oE1qLjiCK3j/gNtrgxdKquOSS+vszH+DsyPGBdKZdoAJRfeN+G@lists.infradead.org
X-Gm-Message-State: APuU4Z9t3aepXw5RjDqEii38h9zeSAgeITqnqM5rY+hh7Ebs09Gbd3Ia
	evmP6S6n/68cqfws4V5kDseQVx3wUcKadGhcqZpE0xse4YGVk/NLpkgif0C5b5Hz7/5vRugcdm+
	ZN/pQA1lo7wavOgZuUs+jEyhFGgw29NU=
X-Received: by 2002:a2e:a807:0:b0:3ae:7ef0:6b69 with SMTP id
 38308e7fff4ca-3ae7fa11df0mr42946551fa.12.1795538697678; Tue, 24 Nov 2026
 08:44:57 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261121-a733-cubie-a7s-dt-v5-0@gmail.com> <20261121-a733-cubie-a7s-dt-v5-2@gmail.com>
In-Reply-To: <20261121-a733-cubie-a7s-dt-v5-2@gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Wed, 25 Nov 2026 00:44:44 +0800
X-Gmail-Original-Message-ID: <CAGb2v64c5oirvfq7R3a1CWQCydfOOipcRD7dhSFAb=zczRdTHw@mail.gmail.com>
X-Gm-Features: Aa3M54qViXTA9PWqHy7JAagF_gxHMQbq3GygFoih888wxMeSNrx03SeafMdIrGc
Message-ID: <CAGb2v64c5oirvfq7R3a1CWQCydfOOipcRD7dhSFAb=zczRdTHw@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] arm64: dts: allwinner: add A733 SoC description
To: Enzo Adriano <enzo.adriano.code@gmail.com>
Cc: andre.przywara@arm.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, jernej.skrabec@gmail.com, samuel@sholland.org, 
	Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Junhui Liu <junhui.liu@pigmoral.tech>, 
	Jerome Brunet <jbrunet@baylibre.com>, Pablo Mazzini <pmazzini@gmail.com>, 
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>, Alexander Sverdlin <alex@sverdlin.org>, 
	Jun Yan <jerrysteve1101@gmail.com>, Lukas Schmid <lukas.schmid@netcube.li>
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

On Tue, Nov 24, 2026 at 1:42=E2=80=AFAM Enzo Adriano
<enzo.adriano.code@gmail.com> wrote:
>
> Provide the SoC description needed by the initial Cubie A7S DTS for its
> console, PMIC, EEPROM and microSD. Describe the CPUs, PSCI, architectural
> timers, GIC, RTC, main and always-on clock/reset and pin controllers.
> Include the main and R-domain UART/I2C instances and MMC0-2 with their

> pin groups. Use mux 6 for I2C0 on PG8/PG9, as in Radxa's BSP pinctrl
> driver and its Cubie A7S device tree.

This should be evident from the schematic itself (the pins are used for
I2C). And then the datasheet would tell you which mux value it is.

Just saying, trust the datasheet and schematic a little more than the BSP.
And one really should write the device tree based on the schematic. The
BSP is there in case something doesn't work, to look for existing quirks
or workarounds.

> The GIC maintenance PPI 9 and ARMv8.2 EL2 virtual-timer PPI 12 follow
> the A733 User Manual v1.00, section 12.2.3. The GICD/GICR/ITS windows
> and noncoherent attributes follow Andre Przywara's public A733
> reference and the A523 precedent. The CPUX interconnect diagram in
> section 5.1.2 supports noncoherency as an integration inference. The
> ITS stays disabled pending its clock/reset and MSI integration.
>
> Describe the single DynamIQ unit and shared L3 shown in section 5.1.2
> (figure 5-1). The big and little DVFS groups can be described by their
> clocks, OPP tables and supplies. Partition PPI 7 (section 12.2.3,
> table 12-1) between the Cortex-A55 and Cortex-A76 PMUs so each probes
> its own core type. Defer capacity-dmips-mhz until it is measured on A733.
>
> Link: https://gist.githubusercontent.com/apritzel/60fd7379b9560a15b8b3529=
86b69d39f/raw/efd9cdf8f26ba5b0c7e138f093af44a1cf322469/sun60i-a733.dts
> Link: https://github.com/radxa/allwinner-bsp/blob/2045a3ca2a01f088c0314dc=
924bda59d154e363e/drivers/pinctrl/pinctrl-sun60iw2.c#L1591-L1610
> Signed-off-by: Enzo Adriano <enzo.adriano.code@gmail.com>
> ---
>
> v4 -> v5: Rename osc to hosc and add the I2C0 PG8/PG9 group. Keep the
> one-cluster CPU map and the two PMU partitions.
>
> Untested on v5: physical CPU/cache topology, PMU counting, EL2
> interrupt delivery and ITS/MSI.

Someone please test the PMU.

>  .../arm64/boot/dts/allwinner/sun60i-a733.dtsi | 663 ++++++++++++++++++
>  1 file changed, 663 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi
>
> diff --git a/arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi b/arch/arm64/=
boot/dts/allwinner/sun60i-a733.dtsi
> new file mode 100644
> index 000000000000..8a258f16751e
> --- /dev/null
> +++ b/arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi
> @@ -0,0 +1,663 @@

[...]

> +               uart0: serial@2500000 {
> +                       compatible =3D "allwinner,sun60i-a733-uart",
> +                                    "snps,dw-apb-uart";

We can't merge this because the bindings haven't been merged. And they seem
to still be going through a lot of churn?


ChenYu

