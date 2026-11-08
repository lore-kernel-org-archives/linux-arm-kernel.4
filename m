Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E5D9606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Nov 2026 16:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=b8CHEata;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cKY5HchF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=HYdezMpMDTFxzK1FZSXPnbV9koPM+33TOfuH3HebiDY=; b=b8CHEataS6jfTAoMPnS5F6kOlf
	YmMAhg5wSBCHTQSXMbwuSl8z44YTLJxL1YSBSv4VStVwrk9Qo3gn58kA+a9BOlQCFvesJH0gZiUQd
	GPZjioP0EA/cus8L3zvxgGOTvONyIdxqEZKtg02od1IfWj8KkW5uZrj6/OwAMrCS/5A6yiqj+bRbL
	bO5UeIKZ/ZjVrMD33PkZIUg2dFu6WQwoSD41iGx4snxZbsdZv7LeRjDtxAL+XK3409fs5d+evI0B+
	n0p2IwDidrDP22qch7OauN1ORY2NhBtas/k+p7LSyQSdvqPu7CI2ztJS2zynwT5WK66+uKhpMTaDo
	r8YU25eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ677-0000000GPOG-1uCg;
	Sun, 08 Nov 2026 16:51:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ676-0000000GPOA-3HaS
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Nov 2026 16:51:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1D957401D4
	for <linux-arm-kernel@lists.infradead.org>; Sun,  8 Nov 2026 16:51:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01D6C1F008A2
	for <linux-arm-kernel@lists.infradead.org>; Sun,  8 Nov 2026 16:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794156688;
	bh=HYdezMpMDTFxzK1FZSXPnbV9koPM+33TOfuH3HebiDY=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=cKY5HchFPJJy/ssHlxCtcZgd7QCYCOxatgwRkpX8JEKqBjsmbhNM79r0PcpXYzo8e
	 gh7Y2w7rK14qmB88u1U2WdH19UQJmkgX0nGJjCY0/BZASK+6NhUyBeJ2krTxzVwkEi
	 qrex2+0GSGngAboBwHrknrxGb+Y1g3sCrGM4K/xO0YR9u4BGY5Wq3k+cAx01xlSBp8
	 mNEPWbK7bWeEzyKZPC3AJcfCPQA76p3bw5DIIm5lTWXAfeC4md0egZbaoaSbUGG2hS
	 14E0rScpkZw/1vIFFRgzRVOTmDRLtrtMFh4bR+wrnILPdVk6Is3NTlfO9W+8f6z+y9
	 +32eJN5G9PJpQ==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3adff684a52so531471fa.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Nov 2026 08:51:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHHlB81dNdIMmahxXcNrTjcrx3lV+B7tGiB/f8GfEq42hwkLqjR59K16GgGV5SX5whGuETgjb7M96Xwu0F1yhGu@lists.infradead.org
X-Gm-Message-State: APuU4Z+DJOWqmo8maO4E9z03k7lzfK6MaSZx0rzOuUOD+0s53huItz/X
	3AY9VZIqj74uuz/mCXyTQeY9VbUeflmPh7uEzpp6aQb4y4tLzco6QhdYl6WvI9ATp8Nm5rfn1Vd
	GDjHh9eLGI69Q7tMQ0OfQHRXaD5u6EHo=
X-Received: by 2002:a2e:bcc2:0:b0:3ac:43b3:d926 with SMTP id
 38308e7fff4ca-3adfa427714mr2794851fa.8.1794156686440; Sun, 08 Nov 2026
 08:51:26 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261108155702.361022-1-pmazzini@gmail.com>
In-Reply-To: <20261108155702.361022-1-pmazzini@gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Mon, 9 Nov 2026 01:51:13 +0900
X-Gmail-Original-Message-ID: <CAGb2v659Km1rsvEbnwtFZwX8O+rztBXc1xuSoS9_=siz0EDxRw@mail.gmail.com>
X-Gm-Features: AclHuK-CJjXMYHavmXJ4Bjl3HAAm8K3xT0QbfHYHd9dVDpGfItJLvFreCyFJ8Tw
Message-ID: <CAGb2v659Km1rsvEbnwtFZwX8O+rztBXc1xuSoS9_=siz0EDxRw@mail.gmail.com>
Subject: Re: [PATCH 0/3] clk: sunxi-ng: describe CCUs as tables, add the
 Allwinner B288
To: Pablo Mazzini <pmazzini@gmail.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Andre Przywara <andre.przywara@arm.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 9, 2026 at 12:58=E2=80=AFAM Pablo Mazzini <pmazzini@gmail.com> =
wrote:
>
> sunxi-ng drivers describe each clock as a static structure, list it
> twice (ccu_clks and hw_clks) and keep a separate reset table. This adds
> a table front end: a SoC lists its clocks once, indexed by their binding
> clock ID, and the core builds the usual ccu_* clocks from that table.
> Bus resets come from the gate entries, and clocks that a SoC generation
> shares come from templates. Existing drivers and bindings are not
> affected.

I think you're going to have to give more justification. What do we gain?
What are the trade-offs? Building all the data at run-time means we end
up consuming even more memory. The tables from init time typically aren't
dropped when a driver is built as a module.


ChenYu

> The first user is the B288. Its driver is 212 lines here, against 749
> in the current style.
>
> This replaces patches 01 and 02 of the B288 series v4:
> https://lore.kernel.org/r/20261012100816.331033-1-pmazzini@gmail.com
>
> Pablo Mazzini (3):
>   dt-bindings: clock: sun4i-a10-ccu: add Allwinner B288
>   clk: sunxi-ng: add a table front end
>   clk: sunxi-ng: add Allwinner B288 CCU driver
>
>  .../clock/allwinner,sun4i-a10-ccu.yaml        |   1 +
>  drivers/clk/sunxi-ng/Kconfig                  |   5 +
>  drivers/clk/sunxi-ng/Makefile                 |   2 +
>  drivers/clk/sunxi-ng/ccu-sun8i-b288.c         | 212 ++++++++
>  drivers/clk/sunxi-ng/ccu-sun8i-b288.h         |  11 +
>  drivers/clk/sunxi-ng/ccu_table.c              | 510 ++++++++++++++++++
>  drivers/clk/sunxi-ng/ccu_table.h              | 233 ++++++++
>  include/dt-bindings/clock/sun8i-b288-ccu.h    |  82 +++
>  include/dt-bindings/reset/sun8i-b288-ccu.h    |  45 ++
>  9 files changed, 1101 insertions(+)
>  create mode 100644 drivers/clk/sunxi-ng/ccu-sun8i-b288.c
>  create mode 100644 drivers/clk/sunxi-ng/ccu-sun8i-b288.h
>  create mode 100644 drivers/clk/sunxi-ng/ccu_table.c
>  create mode 100644 drivers/clk/sunxi-ng/ccu_table.h
>  create mode 100644 include/dt-bindings/clock/sun8i-b288-ccu.h
>  create mode 100644 include/dt-bindings/reset/sun8i-b288-ccu.h
>
>
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> --
> 2.52.0
>
>

