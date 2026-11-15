Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AD96606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 10:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Lmlw5Ng9;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JFbrhBwC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=7DTQ+ilab30T+Zv/iDCe98ocWkWdeLKP4PE9a5e/7Dw=; b=Lmlw5Ng9ixfoB0bZxA4hD1K6jQ
	+o0YPcSbisf1UBCiIaDkFsoiR/dTBxsoKjVIkkYtkCYZcGluvXTxyB6prebba+VEmO6RWjT4g3jeL
	xaDU3NJ8QRbnHtKyWROWDxiVBF7pOkDYuCE7b5XILOv92nLE+94FftVHcDzlKRtpq6GBERpLlxaEG
	/x+1L7bIG/NbqfwcDOjykGW9kFnqaGGmPFbyUeKZiZYtGb/OPM9nNW75W4Ei3znyquy9voJMgBwtL
	47P+idBuz0/ugX7gm6i5CtuGd0zskgkD/lTRSzNMNX4+yIXKP8X2vMbsKyeolavSYgKHkRk+7VaxZ
	/Rb2T1jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSXpX-0000000HPi9-428l;
	Sun, 15 Nov 2026 10:51:27 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSXpW-0000000HPi2-1JrB
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 10:51:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D573D456F0
	for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 10:51:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA55D1F000CC
	for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 10:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794739885;
	bh=7DTQ+ilab30T+Zv/iDCe98ocWkWdeLKP4PE9a5e/7Dw=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=JFbrhBwCSgbkxt7pujKUY9zMMDpruMpZPoGoVimkLdFTRt+YMaPEQxmHjxjG0+gSw
	 yFrzjsl8fgqFOYnsTQ7pFT8QAEeXDFeoblGeAMmxN+8jx0naXanE7y2kjubAcJqMo6
	 1Zq5KpHe1OtMJTK8SObA5BHtEA2AMwPlp/v1Gz/PChsEN3MeOWH2GaAIWBrcJvlPOe
	 +P7H7cNxSbrX0e4xodkKjkrTrKvHdMRX5a8em6RsoTuoBjUs/4VuYxu7wI1BSRR6Ld
	 wjHmPIRu9vNB4K2xxOrmE9VPnZVvb24wINjOGKAtoVCt+1O1vHmt98BZ8AFT5tWI3m
	 yEHbsxKYuD5FA==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3ae25d9e2fdso29232031fa.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 02:51:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEf8NEnEhWYtDT200KbYdnzU5AH4+eUZXSTf9fm8n+dj8H/jYzYPiE5efh4iuVjWBAMqzdqiU5fZfmqxZQVBO1g@lists.infradead.org
X-Gm-Message-State: APuU4Z9bV3v/wZHo3cc4EYECB1uObYZZIJU9IvadG3mTM/iacctT02+1
	OuQpweDSrUC+estuM49vmwfSvEMk3CmwpWx3s3sK31xJaveC5vT4pCXmP3QfJuaxXZbzRMtofDC
	6Yuae3MYHbCE3i5/htd9UpGMJFlikess=
X-Received: by 2002:a05:651c:1544:b0:3a6:70bf:622e with SMTP id
 38308e7fff4ca-3ae2b5373femr23084821fa.4.1794739884136; Sun, 15 Nov 2026
 02:51:24 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261112-h616-zero2-dt-v3-0-1cd2664230c8@gmail.com> <20261112-h616-zero2-dt-v3-2-1cd2664230c8@gmail.com>
In-Reply-To: <20261112-h616-zero2-dt-v3-2-1cd2664230c8@gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sun, 15 Nov 2026 18:51:10 +0800
X-Gmail-Original-Message-ID: <CAGb2v65Jw5zPWG0HD75_nJQLRD7QJhHRw4Zs3fvFxyOFFUuGew@mail.gmail.com>
X-Gm-Features: AclHuK8Xtqejh0T-mPLGkGVR4M7UNRwaVG1Eqq6UzreOqahz90WQKJmVFXxqRSg
Message-ID: <CAGb2v65Jw5zPWG0HD75_nJQLRD7QJhHRw4Zs3fvFxyOFFUuGew@mail.gmail.com>
Subject: Re: [PATCH v3 2/7] arm64: dts: allwinner: orangepi-zero2: Let the PHY
 add the RX delay
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
> The Orange Pi Zero2 describes its RTL8211F link as "rgmii", with the
> whole RX clock delay (3100 ps, the maximum the H616 EMAC syscon can
> add) inserted by the MAC. With "rgmii" the Realtek PHY driver also
> clears the PHY's own RX delay bit, so RX sampling relies on the MAC
> delay alone and sits at the edge of the window.
>
> On the board this shows up as intermittent boots with a dead receive
> path, after cold and warm resets alike: the link comes up at
> 1000/full and frames are transmitted and seen by the peer, but nothing
> is ever received and the EMAC raises no RX interrupt. All EMAC clock,
> pinmux, drive strength and syscon registers are the same on good and
> bad boots. On a bad boot, setting the PHY RX delay bit and clearing
> the syscon RX delay restores reception at once, without a link reset.
>
> Use "rgmii-rxid" (RX delay in the PHY, none in the MAC), as the Orange
> Pi Zero3 with the same PHY already does, and as the vendor BSP does.

Flagged by my review agent, and documents reviewed by me:

The Orange Pi Zero3 uses a different PHY, but the pin strapping is the
same, and has the same meaning: the PHY provides the RX delays, while
the MAC provides the TX delays.

I can fix up the commit message when applying.

> The 700 ps MAC TX delay is kept. With this change 10 of 10 cold boots
> had a working receive path.
>
> Fixes: 5a378f9f2b15 ("arm64: dts: allwinner: h616: Add OrangePi Zero 2 bo=
ard support")
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
> ---
>  arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts=
 b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
> index f2e3300e078a..1fdf2d3c1a87 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
> @@ -18,9 +18,9 @@ &cpu0 {
>  };
>
>  &emac0 {
> -       allwinner,rx-delay-ps =3D <3100>;
>         allwinner,tx-delay-ps =3D <700>;
> -       phy-mode =3D "rgmii";
> +       /* RX delay is added by the PHY, TX delay by the EMAC */
> +       phy-mode =3D "rgmii-rxid";
>         phy-supply =3D <&reg_dcdce>;
>  };
>
>
> --
> 2.55.0
>
>

