Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01184606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 11:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lFdIiWwX;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F14sZ5ih
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=hwTobTkBKm2/JiwiYi2htTTLwpWNDT0Iwb6zrj1effc=; b=lFdIiWwX010wy631UtQHmJ42yn
	uO/4S7QMoE06ru+NaxHHreYR1W43njOjbDwjX0kHBRMAaYxwppsQ8868QS5kLKghHY4oqNPnxLo/w
	KNfUO95uvmCgE4OnY7AaHa61uoUkJp0XPIyw/BBCP2eVOkYmgX3OsGwLNcnqK3hAzyHL2lxxi+Rug
	75u1N+tRrQ1p4ieZXbHUPwP3+i1eFEoqnWqvv5qj7VYoWVHnvMmw/wYErT4uMzhXPnVvyDNzGWeqo
	PkzcYJQ90gjimd2mLAl1575bw4oUejt3iKbKSQ0kJJlLf14/2oUgf35RoIkZVnmHenAhexc95A8ND
	FVWSXr6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVSJ2-00000003BgT-2LLW;
	Mon, 23 Nov 2026 11:33:56 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVSJ0-00000003Bfc-3R0S
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 11:33:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DF51461DB7
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 11:33:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 825831F000ED
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 11:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795433633;
	bh=hwTobTkBKm2/JiwiYi2htTTLwpWNDT0Iwb6zrj1effc=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=F14sZ5ihiSJcWYxHWXyA0XiJs3VZapM4gtxOv6f/78F22yc/zW94Pe+rIceK5uiQN
	 rN4vxdPjMMyLaTkeVfu+6xo0dfJ+WOpuacTaL4RBIkvsIZQjOu2V3Shk9FxH4Eb0h9
	 zM55HI9U2oCZop0+xtrhlkfvq2SR0fDNU9jENSHnvKbmmyM/MmX8kH9MTgwd5u34qg
	 908tlanZCWRgXMEdez/va9HaUALagWY5NhhKO54WUiiLhS9qpkNa7QBt4eryDHMu51
	 /Xs3wt7iWWXS6/OeXZeVt1EO2w1Vvic1+0yPI8IAZ/mGTmboaUfmvlxXnHgwfcCWCe
	 eo021p1gITiOw==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3ae5ab4fcdcso20144991fa.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 03:33:53 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFdkFREyIbIT+yyfncvFGb7+/t7ZTTiaqOq/CpuzgZWrKk8CdiWIgUtJQ2j8yQOudxvFP54f73wJZHmrJKU9f3R@lists.infradead.org
X-Gm-Message-State: APuU4Z8lzBGAdD6+I3vs3jjM/Abn36+dvZuuSxDP2AN6QxUrhVEeWfy3
	y+mxJloGKYplKEd+gtC3Zgk0GThUvEWzsMrgsOpjIvVTZe6m/k2eLESPMBpwIefoaYK1JPd6cGY
	XLILzHLuzOJNjachrKzFmPG2Ne3yyPhQ=
X-Received: by 2002:a05:651c:2214:b0:3ac:e24f:aa11 with SMTP id
 38308e7fff4ca-3ae7f9978cemr32522291fa.7.1795433631887; Mon, 23 Nov 2026
 03:33:51 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261111134919.90264-1-vinicius.eduardo.pedrosa@gmail.com>
 <CAGb2v66nKWdF3AvXDfb07iYVQE5FC5yDkhuutShp+Z-EgFXEfg@mail.gmail.com> <20261123111547.24280-1-vinicius.eduardo.pedrosa@gmail.com>
In-Reply-To: <20261123111547.24280-1-vinicius.eduardo.pedrosa@gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Mon, 23 Nov 2026 19:33:39 +0800
X-Gmail-Original-Message-ID: <CAGb2v67+kz8kdz1FBX+dn8oifOkQie6hv4FZ2Fw9VHZUvzAcSg@mail.gmail.com>
X-Gm-Features: Aa3M54rCROWHf9umhZr72KzYmEmJvMkYMlPSpk2XNjS86lerVQ17v5gLjZWKnw8
Message-ID: <CAGb2v67+kz8kdz1FBX+dn8oifOkQie6hv4FZ2Fw9VHZUvzAcSg@mail.gmail.com>
Subject: Re: [PATCH 0/3] arm64: dts: allwinner: add Radxa Cubie A7Z support
To: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>, 
	Enzo Adriano <enzo.adriano.code@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
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

On Mon, Nov 23, 2026 at 7:16=E2=80=AFPM Vinicius Pedrosa
<vinicius.eduardo.pedrosa@gmail.com> wrote:
>
> On Sat, Nov 21, 2026 at 12:14 AM Chen-Yu Tsai <wens@kernel.org> wrote:
> > There seem to be 3 revisions of A7Z. Which one are you targeting? Or ar=
e
> > there no differences as far as the OS is concerned?
>
> I'm targeting V1.11, which is the board I have and tested.
>
> I compared the published schematics. V1.10 differs from V1.11 in two
> places relevant to this DT:
>
> On V1.10, BLDOIN comes from SWOUT2 and CLDOIN from PS. V1.11 uses a
> separate SY8089 step-down regulator at 2.4 V for both.

This is pretty much invisible to the OS though, unless it is toggle-able.

> V1.11 adds a 10k external pull-up (R59) to the microSD card-detect line,
> which V1.10 doesn't have.

I think this is more of a fix, but again, mostly invisible to the OS.
The only possible difference would be that you could disable the internal
pull-up. But leaving it on shouldn't be an issue either.

> So the power supplies and card-detect configuration would need changes
> for V1.10.
>
> From the V2.00 schematic, the parts covered by this DT (PMIC, microSD,
> LED and UART) appear unchanged from V1.11. V2.00 adds MIPI DSI, a second
> CSI connector and a backlight driver, none of which are described here.
>
> Would you prefer keeping this DT for V1.11 (and V2.00), with a separate
> DT for V1.10 if needed, or splitting the revision-specific parts now?

From what you mentioned it's not a big deal. For the new connectors
on V2.00, we're still a very long way from that, and it could just
be a separate .dts file with the new bits, and include the v1.1x one
as its base.

> I also saw Andre's review of Enzo's v4 [1]. I'll apply the relevant
> changes to this DT, including removing the MMC alias and revisiting the
> regulator descriptions and constraints. I'll wait for Enzo's v5, test on
> my V1.11 board and send a v2 with those changes and the LED patch
> squashed into the board DT, as Krzysztof requested.

Sure.


Thanks
ChenYu

> [1] https://lore.kernel.org/all/20261122003932.568c099c@ryzen.lan/
>
> Thanks,
> Vinicius
>

