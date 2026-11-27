Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8658606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 14:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lGNSqN6h;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=asvmTp1e
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=3jNoWnulbrsDpVqqs904fRidVqIbZWsGQHKPgCx74o0=; b=lGNSqN6h/1GJTuHGso24JwVIVG
	zZnpRRo2UhYsbtG9RbC75uQkcu9vmkNAKOL/reCvTq/jO1zm63DvbirmtP8zXK+CBEKBzsSYTz76c
	K5lUObLe9teYnD67JuCA+k2gp0Vtr5UG1Wpzphv3Qp8eEu8+qNBisGYZNJy4yYlnVAkeYvebSXJIm
	IgHs6wB5VsvfpL9ZxoLZAOmxDfioeoLE8KCsA8aQabujM8yfO938tcevlWUNKedVn6ulia7OUCNYD
	e33hHQOfPR/FJooahlfGnLPjs6MEKfdDfnNDoEkPAwgfj4C0X8iNV5tEp6G6/8BOlT08mLU4Uc0rv
	Opb1d6+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxHT-0000000Gcyt-0YM3;
	Fri, 27 Nov 2026 14:50:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxHR-0000000Gcyg-3tem
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 14:50:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id ADD73453E3
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 14:50:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BBA41F00893
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 14:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795791029;
	bh=3jNoWnulbrsDpVqqs904fRidVqIbZWsGQHKPgCx74o0=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=asvmTp1eHdvI/IZXhgvTmgWBGVGWINsxFfv71+oro5tsHYG9zv/HhjEIicEE+VfXz
	 wWDsg9tMFeXqveIKChi3wbKSCL9rVkS5a39EVtZBJu9VHHItnWI9nS1Kp/fAIUDRFl
	 sr2H4J+FeZKJNkfqnwwjRzgmyEUkPEFqwkS2AyozNYOD3Bb52EWAxnjQ9mH0q+H1lb
	 5YFqJLdstQJvsMU+PE4CPe+sP/2cqiTGkMSLJjoQqi8788H/LPlMeLXZpJvFd/aRDb
	 AvzT05/HWtdV6qQ6ZN0pvu90wxtShu3uUc0nri5ZkNZ/iRrbwi8w6QjSrWwYMuu+Xp
	 yWndXD6iO/xaw==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5bcdae234ecso3256737e87.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 06:50:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGm9JtENcSww92jo+IEsw6iW9Q01fvYICn7+cb56W40w82ceZAsBSoqYePAFf32osi7FxeYlLoamDKCJjBfN64g@lists.infradead.org
X-Gm-Message-State: APuU4Z/8NoSrQhO28YtBvbjJPzfNk9NnKD+e8KSjWOPytD6P19+RhoZw
	u4biZ8+KMaWJEKNbXbYO+Phsd5cCqS+Umk1bA4uZYkmxpHR0AsD1jnTh+9uFjhGRICznHIMM6QV
	HNrpum7PHhao6SvpUKlm8S9EDWAYXBZ8=
X-Received: by 2002:a05:6512:2353:b0:5bf:c3e2:41c1 with SMTP id
 2adb3069b0e04-5c1bc809895mr7113918e87.44.1795791027796; Fri, 27 Nov 2026
 06:50:27 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261127080649.1982883-1-alastair@d-silva.org>
 <18637573-d20f-4a58-9e63-6bf71b015cef@arm.com> <d4a41c5cfb33d6d39f0ba927541beca1175ad001.camel@d-silva.org>
In-Reply-To: <d4a41c5cfb33d6d39f0ba927541beca1175ad001.camel@d-silva.org>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Fri, 27 Nov 2026 22:50:15 +0800
X-Gmail-Original-Message-ID: <CAGb2v65KRdVqauuJ0F-fb3Fvtx5HJqv-fUTaFJS+xEsQ+Wb78w@mail.gmail.com>
X-Gm-Features: Aa3M54oOaQujivp7_3Q1utEL14RKW5So41dM2VxpASzKJxC7DwsjG9miI_JHOKg
Message-ID: <CAGb2v65KRdVqauuJ0F-fb3Fvtx5HJqv-fUTaFJS+xEsQ+Wb78w@mail.gmail.com>
Subject: Re: [PATCH 0/3] arm64: dts: allwinner: sun60i-a733: Add simplefb HDMI support
To: "Alastair D'Silva" <alastair@d-silva.org>
Cc: Andre Przywara <andre.przywara@arm.com>, Hans de Goede <hansg@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 27, 2026 at 9:58=E2=80=AFPM Alastair D'Silva <alastair@d-silva.=
org> wrote:
>
>
> On Fri, 2026-11-27 at 10:03 +0000, Andre Przywara wrote:
> > Hi,
> >
> > On 11/27/26 09:06, Alastair D'Silva wrote:
> > > This series adds boot-time simplefb HDMI support for Allwinner A733
> > > (sun60i-a733). U-Boot enables DE3.5, TCON_TV0, and DW-HDMI2.0 and
> >
> > Where does it do that and which U-Boot version does?
> > I don't think we really want simplefb in the mainline DTs any more,
> > unless there is a big blocker or delay for proper Linux DE support (lik=
e
> > there was back in the A64 days).
> > In Jernej's HDMI series he hints about A733 support being pretty
> > straight-forward with the reworked H616 DE code, so chances are we see
> > proper DE3.5 support in DRM rather sooner than later.
> >
> > Cheers,
> > Andre
> >
>
> I think the blocker was firmware for DE for this SoC - it can be ripped o=
ut
> of the Orange Pi OS blobs, but that won't be acceptable for linux-firmwar=
e.
>
> I'm currently reverse engineering the GPU firmware blob, it's not very la=
rge,
> and is a well understood instruction set (MIPs) so that may be a path for=
ward
> without the vendor contributing the blob to linux-firmware themselves.

GPU and DE are completely separate blocks. You don't need the GPU to have
display.

And slow down. You sent out dozens of patches at -rc5 (closing in on -rc6).
Realistically none of them will make it.

