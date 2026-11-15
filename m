Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 333C8606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 10:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3A/dxJhq;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iMgHHDZg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=0nqnviQtI0zVgBpLZforuUbgldUYw5y4JIwCb3k/byo=; b=3A/dxJhq6HdEVA2OZ64RHk78y/
	3o6TLOBYhYUQL2jmTetVziYjsJGW8HgFz97z0IUF7Av5gOVmIpNT14WZmrqSdmeZNu7tN4f2qVf3Z
	ACHYXLPcntuMVLg5CyhdvZJzb6A6T5WmPqElnfuFEsLzCGnXK4hL+oJbSPneL0GPT+uhWDkGbj4Pp
	qzrMBKXTZsPp1ErJN0QEzet3WVovmlOzWiGU4ShaNR0SBzJkJ+4GlY1pb9kO9+oxEp7ygXjADIH7H
	AOb0NJmjzVEZAMSXCZ55ndax8HcSwOT9M1hWZvQjkxcxNOJOOXLEr6/Yg8pYuakBP/bU6GOEoJSaF
	5H7pDjSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSXht-0000000HNyQ-0sw6;
	Sun, 15 Nov 2026 10:43:33 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSXhs-0000000HNyJ-00MV
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 10:43:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3094D601E1
	for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 10:43:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEE1D1F000C5
	for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 10:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794739410;
	bh=0nqnviQtI0zVgBpLZforuUbgldUYw5y4JIwCb3k/byo=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=iMgHHDZgx9CCeW7jQ7Z0VvGlzs0uRoMnkwXwVYnMkgw3UfmNXwg7BPjCn3iJOmVAg
	 Gg+SZ2dj1i/3RTRPgmZ2y+tJ9mrVdGFL3hC7La7eAhV57oFHczQI4RTSjKH5QnkKxe
	 PRNwbnlancl3/A/4q7NR4LBteog+4r3S4N0arQL7cNeX0B4jXmChzh9wCKpcX1SQrZ
	 o9hAKkK0rA/fb1i9+7UWNHwe0dRLM43LV//ByEEn/kYBRtxmBH4DjyPGew/PLrsyFt
	 f1her53+EUpfBpeTRR6wldUdnPdu+GyEtCsdpiLOQRYeuOxZF5h4pue+tmjkFSCccq
	 +x1FjiSrRjw7A==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3adfc004920so28080271fa.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 02:43:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGbqxkcY5kCCeMoBt+ASudEwoMEDSmAj3Vlaz7iIvKjhsQjGrtNaVjF1+gwDgV1XNeHnpy3Zbr/uimNwAGowN97@lists.infradead.org
X-Gm-Message-State: APuU4Z9eZKzROSsErv0RHp9CU4jF6Il6ZXaliTMbdCG7MZ6/ScZrR9fs
	3kMj4nhj1tV/C6eWY1/yQikIgatZnanZodDDI2q42wfKlGI2o+4Br6p8rc6VJDg0ria1+AUIInr
	tHXSi5HytwiEQKIIlB6IL/fg9oN7Q9TU=
X-Received: by 2002:a2e:a543:0:b0:3ab:1862:25fe with SMTP id
 38308e7fff4ca-3ae2b49f199mr27144831fa.4.1794739409347; Sun, 15 Nov 2026
 02:43:29 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261112-h616-zero2-dt-v3-0-1cd2664230c8@gmail.com> <20261112-h616-zero2-dt-v3-3-1cd2664230c8@gmail.com>
In-Reply-To: <20261112-h616-zero2-dt-v3-3-1cd2664230c8@gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sun, 15 Nov 2026 18:43:16 +0800
X-Gmail-Original-Message-ID: <CAGb2v66CYb5LmHrThjqh4i7kQeG3D=0=om33=mJJUS_u4r=UvQ@mail.gmail.com>
X-Gm-Features: AclHuK8HzeMAHozlJAL7NvuOGHQVO3JAeAx6hsTa0bLpIvwSKJtCAkiSGEitsvM
Message-ID: <CAGb2v66CYb5LmHrThjqh4i7kQeG3D=0=om33=mJJUS_u4r=UvQ@mail.gmail.com>
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
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

Just a note, found by my review agent:

The temporary clock for the GPU module is currently pinned at 400 MHz.
So say you are just jumping between the lower OPPs, you go from
306 MHz -> 400 MHz -> 336 MHz, all the while the voltage could still be
0.81V. This is likely going to cause issues.

I suggest sending a separate patch to increase the pinned divider for
GPU_CLK1 from 3 to 4, which would give a *really* safe clock rate of
300 MHz.


ChenYu

