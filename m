Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B374606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 13:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=it0PVEZq;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HPpEeEcK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=q3PzFJ3hbYSCea9rHodUJxc+bUxixgVlxzIsC4nrb7w=; b=it0PVEZqSIBDk3
	+BMSbgQmQx9LrRcFDCNFlK1TW9oL+jTdklWol/Ih8VYfjzPCjxJ/mfPUoCs/xx1CYF64NV2qwzj+6
	lbWJoc9Ce1rslOTKtN6Q5F/5UmDGwB9EMzY8pGgAKH2yJetyKtwDygQxNEJnZFzJNnSv65EqLgRsa
	WRgg1nofC7zV/hK6C4HQVEwQ1a9TN9ABivp45wt0UyI50950NpZvI7XsgoGMV7j+UZPQ3o2Le8bMy
	/IR8rKuEOZUSONXotQD9hrAQu5wNwurWEDP2xnznx0cyxNdugO+/R6KnGd9AnScFqh+73UdCCAZde
	STEdBBCz/D2KjlUrSQHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWYyS-0000000DFN0-0Ioz;
	Thu, 26 Nov 2026 12:53:16 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWYyQ-0000000DFMt-39eR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 12:53:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2405845F29
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 12:53:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1D271F000E1
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 12:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795697593;
	bh=q3PzFJ3hbYSCea9rHodUJxc+bUxixgVlxzIsC4nrb7w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=HPpEeEcK7Qisws2Yn2HR2QKFv32My5gHCW/8A9zrInx19MWi11iDKK6VrCbEVVOUc
	 54mk7Xuyy+fUcUxmEcTpFao5KArkGJ4xRfCrwKfLM5YwpcAoW/4INXtsxGtZFZ4G5l
	 7k+xY6aEuv4JCnKsfHXJzIdh8femk6oi3DkGXYdY7RKArxdfMAZZtDybnpSkB1KIob
	 g8WDaS1mIGqnajzeLFzav47q/orkl5QZWAdJ62iMw2zuFzo3PAa2p4129pHOKZ1SsK
	 VikdTI5+VJ0uSbQMro5L3gt5zEm3hrLNyX+p8xOqjOptcU5nutkiVRi/Qq+VH/1iY8
	 iu7TcIZjKjh6w==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5c17ef1e18cso4533899e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 04:53:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFbwPh0hiWTeIQ6wQfqD2KcEhNVmrqjucvXErSNX4fZf6pLT5KNHgcrkY3GcCosv2blE6z+icHic0JnGqhc7xjl@lists.infradead.org
X-Gm-Message-State: APuU4Z/8s+LAbdd3PIMv9ei4nRtBsPxa19Uwolu5F+n+NLo11Ic+5yLV
	yqFM2MzjT1/Jg/581Su65ibglHbfzDVA9YCjCLNvt51VZHsWPpRuDCbURT3WSLESfsgHmLlbMKe
	eu7W7jMDtw2VTTrEXXXs8WAbwiiFaaLo=
X-Received: by 2002:a05:6512:1111:b0:5bf:a172:db47 with SMTP id
 2adb3069b0e04-5c1bc7fbf6emr6119152e87.16.1795697592407; Thu, 26 Nov 2026
 04:53:12 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261118-for-upstream-lx2160a-rcw-pinmux-v1-v8-0-d01bc837593e@free.fr>
In-Reply-To: <20261118-for-upstream-lx2160a-rcw-pinmux-v1-v8-0-d01bc837593e@free.fr>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 26 Nov 2026 13:53:00 +0100
X-Gmail-Original-Message-ID: <CAD++jLnRWZrLfyBGGOikx_eeYXirahuB7E7yuDhB6KoSAQoA5w@mail.gmail.com>
X-Gm-Features: Aa3M54q-CsXp8NzMnoFlWGAu1EmQEOW5kQyf9eE8X0_RcR3iOaRDqKTNl-NFIlo
Message-ID: <CAD++jLnRWZrLfyBGGOikx_eeYXirahuB7E7yuDhB6KoSAQoA5w@mail.gmail.com>
Subject: Re: [PATCH v8 0/6] lx2160a: change the pad muxes through the RCW override
To: vjardin@free.fr
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Frank Li <Frank.Li@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, Vladimir Oltean <vladimir.oltean@nxp.com>, 
	Ioana Ciornei <ioana.ciornei@nxp.com>
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Vincent,

On Wed, Nov 18, 2026 at 12:00=E2=80=AFPM Vincent Jardin via B4 Relay
<devnull+vjardin.free.fr@kernel.org> wrote:

> The LX2160A muxes its IIC, XSPI, SDHC, UART, IRQ and EVT pads from
> fields of the RCW. They are read-only in RCWSR12..14 of DCFG, and are
> changed at runtime through the override registers in the DCSR view of
> DCFG, which read 0 until written.
>
> Since commit 8a1365c7bbc1 ("arm64: dts: lx2160a: add pinmux and i2c
> gpio to support bus recovery"), fsl-lx216x.dtsi drives the override
> registers with pinctrl-single for the I2C bus recovery. Its first pin
> state clears every other field of the word: a board whose RCW programs
> a non-zero pad mux loses those pads at the first I2C probe.
>
> This series reads the fields in effect from RCWSR and writes RCWCR, as
> fsl_guts_rcw_rmw() already does for the SerDes protocols:

Once the review is complete, can I merge all patches except the DTSI
patch through the pin control tree, i.e. does it have the right ACKs?

Yours,
Linus Walleij

