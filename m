Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0DA5606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 10:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GpSpgBG0;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TkXI/bUD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=BPDZ7665LmGw0imJR3DrIKXNMITj+LF4ERC2NJv/3Gk=; b=GpSpgBG0XwLf1BeLyJiwoVSw68
	xb3jRd+01Ur3mjCA2Xv6BBqo5e1s28ucJFrBp9lwSLsghvqI1Ve0W49tmaWfuKm/IpUvdWxZ3d2Jk
	U0kBlSUjt9qYGVL3aTeWrK1Q5ufJ0w42Q+LenoZk8X0Q8uoIWHIjNFoE0758qVXD96hpDQrXKEmjX
	GATwacQ/bAJ6VBomMD+55pDq1s1ErCDEtUog95yNp7hb4hmKiJ/7DCdHrIVW2Kghvki71T5rwdWF7
	NKxBMk17pTtxMd1l5IQ3F2cMqGM7fktCQ3EC1ONNp13zbTpmU8gUwnQCjKE34CXQnmTX8dKhOLqIo
	nuZFIVLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSXZZ-0000000HNWk-44Na;
	Sun, 15 Nov 2026 10:34:57 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSXZX-0000000HNWd-2KNq
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 10:34:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 87F54605D5
	for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 10:34:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4187B1F000C4
	for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 10:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794738894;
	bh=BPDZ7665LmGw0imJR3DrIKXNMITj+LF4ERC2NJv/3Gk=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=TkXI/bUDo6WbfTG+7z7cIxZxSyHdVp7OLJJk6kD17Ul01vm/GM2ZaR0WX2JFxveIv
	 ygsGaSCk+u7IfUhHrTMVuv7GhrJQ2gMsxGexvZ+RnPfZzcmxkIyVXtCqBLWb2dwNMF
	 BLalxi2EkDHDlxNtX00iufA8EsIseGiDjbDapZQkhWDuFYGLCyEG0cqozA4KPDJ5Cg
	 3Lu1HwyXKVNXXMOlHfRdmt2yhaIWmBRhaaa0q+0gT+PTFoAlVsdqO6MTtxZoqcGIPv
	 nr+aEe8pnVTUPhpytZ9V7qmufHqYIYUwEioCqMLujmO0V/5pf75qLxD5dekIsvB+qf
	 ORWmRfBHcu/4A==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5be3ed646a5so3666654e87.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 02:34:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErF6a4I2H5HPLe6p2Iw7bQhrXqPUS+bINleWnnqchjZVuyTfqN8fXk7Na6FCl9cme/7IJeAWmosdgKwUOtEq+NCa@lists.infradead.org
X-Gm-Message-State: APuU4Z99mS5ewWmOOwcHXEuTUPo9Wqz3xttTLjp88cZ3VZV8lSxHsuud
	YbrpJbPqrz9XOoT+fRmCQQTzLXQ/bEzpzhcUlktTzcx2NsrK+UfztrFE8j/Y8czJUYZeAEjbji3
	4N/na0clFVUckN/tHKf3nET9BVXtEdPo=
X-Received: by 2002:a2e:bcc6:0:b0:3ac:d178:4fab with SMTP id
 38308e7fff4ca-3ae2b4cd914mr23856181fa.15.1794738892713; Sun, 15 Nov 2026
 02:34:52 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261112-h616-zero2-dt-v3-0-1cd2664230c8@gmail.com> <20261112-h616-zero2-dt-v3-5-1cd2664230c8@gmail.com>
In-Reply-To: <20261112-h616-zero2-dt-v3-5-1cd2664230c8@gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sun, 15 Nov 2026 18:34:38 +0800
X-Gmail-Original-Message-ID: <CAGb2v661N+=LSqXQD9zQWiFv-9CbE-2EzisgeSW2_LQvjr20KA@mail.gmail.com>
X-Gm-Features: AclHuK9-VLtQ9djmgy5KmaFMIxLSYgEBbXZ_e3jCYdzdRhHvuUSs4waIGOFphaY
Message-ID: <CAGb2v661N+=LSqXQD9zQWiFv-9CbE-2EzisgeSW2_LQvjr20KA@mail.gmail.com>
Subject: Re: [PATCH v3 5/7] arm64: dts: allwinner: orangepi-zero2: Keep
 VDD-SYS at or above 900 mV
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
> On the Orange Pi Zero2 the AXP305 DCDCC "vdd-gpu-sys" rail feeds both
> the Mali-G31 and the SoC's VDD-SYS domain, which includes the video
> engine. Its regulator range starts at 810 mV, the lowest GPU operating
> point, so once GPU DVFS is enabled the rail drops to 810 mV whenever
> the GPU is idle. The video engine does not tolerate that: with the VE
> at 600 MHz, 4K H.265 decodes intermittently produce a few corrupted
> CTBs, without any kernel message. Only 6 of 13 runs were bit-exact at
> 810 mV, against 3 of 3 at 890 mV, 3 of 3 at 950 mV, and 3 of 3 at
> 810 mV with the VE clocked down to 432 MHz. The vendor BSP runs every
> GPU operating point at 950 mV, so it never lowers this rail.

Makes me wonder if we need to implement DVFS for the video engine...

> Raise the regulator minimum to 900 mV before GPU DVFS is enabled. The

Why 900 mV? Why not 890 mV?

> H616 GPU operating points use <target min max> triplets with a 990 mV
> maximum, so the regulator core clamps the low-frequency requests into
> [900, 990] mV and devfreq still scales the GPU clock.

For device tree commit messages we typically don't mention implementation
(OS) details. So instead you could simply say that this is still within
the allowed range of the lower GPU OPPs.


ChenYu

> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
> ---
>  arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts=
 b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
> index 1fdf2d3c1a87..719d6dadf7bf 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
> @@ -114,7 +114,7 @@ reg_dcdca: dcdca {
>
>                         reg_dcdcc: dcdcc {
>                                 regulator-always-on;
> -                               regulator-min-microvolt =3D <810000>;
> +                               regulator-min-microvolt =3D <900000>;
>                                 regulator-max-microvolt =3D <990000>;
>                                 regulator-name =3D "vdd-gpu-sys";
>                         };
>
> --
> 2.55.0
>
>
>

