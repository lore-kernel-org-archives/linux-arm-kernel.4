Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6BEE606A320
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 01:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wjPd7BVI;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ivOklNN2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=mZqHayVGS1xgtvg32Na1JhcmVegYW+rmWEW78/lQ8ms=; b=wjPd7BVI04exke
	y2WwMwhAVSbxXx0LZ0XTc0Vff79vqg4JHn0spGefOoAHRMecd9M2AWaHlGftr61CuWzwHcXVrn8fk
	fbOS1JvUp6Ml/FMOurGD0GfaW/EW9T82k1kXO8P0Nvx1GGsWWHFBbsmEzn4VvZ7OmwDnifgphlZx7
	NeqWRIok2yu0Jv3bUgEqhkYtEEUQNE1y4EYKAK97vWGPzkArL3BwM/RQ3LGpaFAP+Kir1PHvh1RdA
	j9rG8zT2dyr6oN97jEg5Go4ITFEgkXKhrEAaMEZKND0dBWty9ucokTZ8rYSrY6NioYer1HDbI7Ctl
	SmhwRpT29O80LmyKQsHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVIk1-000000024Tr-3kfW;
	Mon, 23 Nov 2026 01:21:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVIk0-000000024Td-1Az5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 01:21:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id EAE40410A8
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 01:21:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF9DB1F000C4
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 01:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795396867;
	bh=mZqHayVGS1xgtvg32Na1JhcmVegYW+rmWEW78/lQ8ms=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ivOklNN2KOGbBFBnB9FPVh7Ld7SVUF0l6X/QpLensP7wYUOgIaUzgygVwGuX7E66A
	 wa5iA5ScRg88Zqb2fwPTGVh7+I+j/AmodinTS0CRnmjCVZaKjS6LnTKBWYLWgP5GwZ
	 xyx6e8khX7plnxrs1xYCkPsOtjoHXTksvq1K97EenFi/26xOxfKZzoHNEYrs5boju4
	 MDi3UwugVv1uuAQI7Z7FakahmJbHcb/vEFgHGr65TyzTFcEM+z1N6HzGLxc8EUmc7Z
	 hQr+k3m+qe+pBonf4F92P9FjY+aM5LUrwkzUjMMt+YKdS7APbtTG9F4yBDYve8LJ5y
	 ggDdZwilvsWQw==
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so20220575e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 17:21:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErF1Oj2MB53Azzus9mNzZBBUNVAnCM8NblIzDnszZN4fhOY3Js+t2viVKZIcYZ7NVCDtnGbmhT4okv+cR/jyJpAM@lists.infradead.org
X-Gm-Message-State: APuU4Z9xiuWjyRslet3p5Ypz9ukTIgMWhEFycB2fBoeH0ShDlE/nWOI4
	RyaD7p8a5M3T7lP9kMbXmj/Q++NBuzYYlL8S0jrdBiXIfgRA0+rwvOhiLO8DHxCrAZwIfMtiGOp
	zDR+7rGWhk+0zArjVzcPtTKyUWUr3yQQ=
X-Received: by 2002:a05:600d:600b:b0:4a2:167a:c939 with SMTP id
 5b1f17b1804b1-4bb88815f1fmr209227025e9.21.1795396866520; Sun, 22 Nov 2026
 17:21:06 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261114-v861-v1-0-eb71ec3ee523@iscas.ac.cn> <20261114-v861-v1-6-eb71ec3ee523@iscas.ac.cn>
 <c8OwiyQSR8ivEFULfFWNow@gmail.com>
In-Reply-To: <c8OwiyQSR8ivEFULfFWNow@gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 23 Nov 2026 09:20:52 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRiDrhOTJ77nnHm_v3k52iz2JPk15zZVE0SS_w1KJAVeg@mail.gmail.com>
X-Gm-Features: Aa3M54ouhks5E3p4QI9taB6w48IYX-BM80EMc8-2bbL7hF7KLogcDmZQZpD8tBk
Message-ID: <CAJF2gTRiDrhOTJ77nnHm_v3k52iz2JPk15zZVE0SS_w1KJAVeg@mail.gmail.com>
Subject: Re: [PATCH 06/19] clk: sunxi-ng: add support for the Allwinner V861 CCU
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
	Samuel Holland <samuel.holland@sifive.com>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Han Gao <gaohan@iscas.ac.cn>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Maxime Ripard <mripard@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Andre Przywara <andre.przywara@arm.com>, 
	Han Gao <rabenda.cn@gmail.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org, 
	linux-csky@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rtc@vger.kernel.org, linux-gpio@vger.kernel.org
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Some references for v861:

https://www.cnx-software.com/2026/01/04/allwinner-v861-dual-core-64-bit-ris=
c-v-ai-camera-sip-features-128mb-ddr3l-4k-h-265-h-264-video-encoder/

https://www.allwinnertech.com/index.php?c=3Dproduct&a=3Dindex&id=3D148

https://docs.allwinnertech.com/docs/soc/v861-tina-linux/en/

Hope these help you.

On Sun, Nov 15, 2026 at 3:31=E2=80=AFPM Jernej =C5=A0krabec <jernej.skrabec=
@gmail.com> wrote:
>
> Dne petek, 13. november 2026 ob 23:33:32 Srednjeevropski standardni =C4=
=8Das je Han Gao via B4 Relay napisal(a):
> > From: Han Gao <gaohan@iscas.ac.cn>
> >
> > Add the main CCU driver for the V861, based on the A523 one. The CPU
> > PLL, the CPU subsystem clocks and the E907 clocks are left to the
> > firmware.
> >
> > Unlike on the A523, the second divider of the 27 MHz output is a power
> > of two. pll-audio-4x does not pass rate changes up, as its parent also
> > feeds the UART clock mux.
> >
> > Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
>
> Do you have any user manual for it? Or at least BSP code? It's hard to
> review patches without any of those references.
>
> Best regards,
> Jernej
>
>


--=20
Best Regards
 Guo Ren

