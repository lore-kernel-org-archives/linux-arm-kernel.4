Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D60606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 15:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Gqa2hA5a;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YNOhNb3i
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=T6IM2hwHTMA/pxCeoMK4wo9s6BDvD9P4Ko0YhtatVM4=; b=Gqa2hA5anfEXO+z4GLMgmIsTJf
	ZsntiYxhgThH7bFI1ZiziqJU5Oisff2pfTU1D6KPs5gyvCUeRj8eW20hUzzgAW4b/TfdfYQpzE6fW
	RCmCcmIvLURL/ZlyGu8NbP6LLrm3TGsNoi/FhdIHm2rmSTSN3V7vDmDQy3YPO+3uwLHM14h2BP4dt
	t1LBkO+c1dSxpkzm/3MFZ/u3PNfowy5XNkOacN+P4AJjbkDvUi0oV7viYzSmKYzmdnMQCm305dMsI
	8qtkp3aYe6ctGFK4EEHQgME5XJ9uj8lyR+T7CpKh733stmu7fsxzkwzRyG7vF1xUxjlsqLIzWawX7
	9TZ9113w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUQdt-0000000FRhD-2ZN9;
	Fri, 20 Nov 2026 15:35:13 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUQdr-0000000FRgl-42aU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 15:35:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 68644618BE
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 15:35:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0F281F000E0
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 15:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795188910;
	bh=T6IM2hwHTMA/pxCeoMK4wo9s6BDvD9P4Ko0YhtatVM4=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=YNOhNb3iyidl8e/8+4SlLOXJ9h4M54YkXrJcpXUHKFnIHJcVCWeuIE0J7ylUBD6/K
	 +AgTutx6MOpAW5KQqW4Vgr4E0fjGSbrxDxaNgYBuhf46CSrt5yIHjoB7EKC3+1HJ4c
	 20R9KNUSifE2ekRXxiExB6s/wQGGNEns0+hYlnSTPur2L9LCNa3d0kHtNEr7Xh+Xz8
	 vWsoghV4TpD5WTshR6o2CAD2fOjy9zqAI4biatkARX0Wh826V8tTvCWLJs3CoRGuor
	 cKT3fIsPCyqfuXWloLIwFg9iy7jp0hcN/nAwr6WSpM5uU3//ZxHEi6vUBhyBN+uCcB
	 jlncilkirXv/w==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3adfc004920so8968531fa.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 07:35:10 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErG1YvGpYEmmUWY1bRp6m8abtVWsAoFhzII3qVemOwVX1QtiADG3r5hIoE0/NxstXgbIMJVZCqIw7UpUagIst0Gn@lists.infradead.org
X-Gm-Message-State: APuU4Z/pskjVDHJzvmZALArkTwqPhtEZrFDVgx7fsuKfhvPpSU0O48eA
	Gnc/LMcw8YEVCxkYvYeiVdC0Zo9FkOtnL93kdOLghoQCd8fGiHDMaHAZiBJ8sDjPqFsPDZxiovK
	xIaqcTSPqOLdBPdh9PxuX5BJlEvwMxRg=
X-Received: by 2002:a05:651c:a184:b0:3ab:1207:bd2f with SMTP id
 38308e7fff4ca-3ae7f9da258mr13361641fa.11.1795188909192; Fri, 20 Nov 2026
 07:35:09 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261120-orangepi-zero-plus2-fixes-v1-0-ecd792189f27@gmail.com> <20261120-orangepi-zero-plus2-fixes-v1-4-ecd792189f27@gmail.com>
In-Reply-To: <20261120-orangepi-zero-plus2-fixes-v1-4-ecd792189f27@gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Fri, 20 Nov 2026 23:34:56 +0800
X-Gmail-Original-Message-ID: <CAGb2v64Tvdcn0rZACYmNr0Ja30u_mQb8eLPNRoU=6DK85nAikg@mail.gmail.com>
X-Gm-Features: Aa3M54oam78LcsG1YLxbfKx9HEBPHDjI2SmmeFo6cqag_BBBoiZ82g26oZ6JYCQ
Message-ID: <CAGb2v64Tvdcn0rZACYmNr0Ja30u_mQb8eLPNRoU=6DK85nAikg@mail.gmail.com>
Subject: Re: [PATCH 4/4] arm64: dts: allwinner: h5: orangepi-zero-plus2: Add
 MMC aliases
To: ipfarher@gmail.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
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

On Fri, Nov 20, 2026 at 7:40=E2=80=AFPM Ivan Pfarher via B4 Relay
<devnull+ipfarher.gmail.com@kernel.org> wrote:
>
> From: Ivan Pfarher <ipfarher@gmail.com>
>
> sunxi-mmc probes asynchronously, so without aliases the microSD card,
> the SDIO WiFi and the eMMC get their mmc numbers in probe order. A boot
> script using root=3D/dev/mmcblk0p2 for the microSD card can then end up
> on the eMMC instead.

For sunxi we do not add MMC aliases. You are encouraged to use UUID or
PARTUUID for specifying root devices.

> Add aliases so that the microSD card is always mmc0 and the eMMC mmc1,
> matching the numbering U-Boot uses on this board, with the SDIO WiFi
> as mmc2.
>
> Tested on an Orange Pi Zero Plus2 (H5) running Linux 6.6.160 with this
> change applied: the microSD card is mmcblk0 and the eMMC mmcblk1,
> booting from either. Build-tested only against current mainline.
>
> This problem was investigated, and the patch drafted, in an interactive
> session with an AI coding assistant (Claude by Anthropic). The submitter
> reviewed the change and ran the tests described above.
>
> Signed-off-by: Ivan Pfarher <ipfarher@gmail.com>
> ---
>  arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.=
dts b/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts
> index 892723b46..4a26863e8 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts
> @@ -13,6 +13,9 @@
>         compatible =3D "xunlong,orangepi-zero-plus2", "allwinner,sun50i-h=
5";
>
>         aliases {
> +               mmc0 =3D &mmc0;
> +               mmc1 =3D &mmc2;
> +               mmc2 =3D &mmc1;
>                 serial0 =3D &uart0;
>         };
>
>
> --
> 2.43.0
>
>

