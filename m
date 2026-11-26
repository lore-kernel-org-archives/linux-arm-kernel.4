Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F9FB606A321
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 03:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mD5qL/XM;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EnFf2oIl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=pnrWDLI+bbkoF+uspFaAef/gof/CKGiguNODNOS4GpA=; b=mD5qL/XMgY/+o0VjS/9yDIVHAu
	t294QgbRXm3EVRpi4P4eual/NVgzhy8XF8xVNtY+ivsJJz4pI1g6b8bopJ96BijMLlyyGhXTqOKx4
	RzHky3A4wdwUmsncff3YjQH8LnCdNa2Tk7TC7K8rEuAbSnyNtTJzkh3ELi0gaH7fgZsjy7faiFyMF
	jd6pC272TNxrCbgJeLYwf/5SRc1h4x1HV4g2IGXx1jckOdX8ToL9Ww8Sz70qSf4xJ1v/yj642dyuu
	pTZtxSFvQklH0qVrjc8OyshBdOllH71dCesNa/GCEC2dy1wsZNFpgoBhRmgXhGmC8dpzlVJCQKTMv
	nbBffTbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWQbP-0000000C2SV-2RP9;
	Thu, 26 Nov 2026 03:56:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWQbM-0000000C2SE-2eks
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 03:56:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DF7A74639C
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 03:56:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5F581F000D3
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 03:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795665411;
	bh=pnrWDLI+bbkoF+uspFaAef/gof/CKGiguNODNOS4GpA=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=EnFf2oIl25F5fuGyrN92NOgPL6kqIB+PTByRBEV3aAZf8ZfJ957KgMf5KK6PsD4Cw
	 zflo82yjh57GWQAKBN0zQJ3ijLHDRdSpLs34Ypubezx1+kdfXAnPIjT0MRca7B7nRb
	 +rO8mpQb/bCxW8CFA+2Lx5rEVRmyJz4YfrOrnc0k250Cwzd7xVTkbCMd+ipqAGmsNt
	 HlHRpxSdtd7AvpLEw2SfBrHhhWw9nPCLZOm8brr6044aErj4rTR4DdBOsdGnfIIcmV
	 dO3wocrkyfGT62CpwOxOuAHNl9X/82Ppq3JVVcDI5bXUE7TCNERLHEGOfW+aVa5yvh
	 KoGaWgq/V1/8w==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3adfcafaabbso59980591fa.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 19:56:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEVvLqjCAbHKhhh5VrdIkegCU9W+zpA/DR2OrLbHbEpaiYop2dAsEt61Q387LoH9SMCzYqrFHnuUqIcD54LynWK@lists.infradead.org
X-Gm-Message-State: APuU4Z8jOJZyktoH62utld8dPxMnXdv56kB9REe57KKnPipZMtuGFmrR
	Jt38GDmww1rNI9kXHTPHSQwok4ixPZZwAHNHv4WDTsafVQ6p2AyuNkNLPxuyKyKhHr+OlK/STpP
	BFk2KT6IKFTW2FgZaWLW2DTlvnTm5ECU=
X-Received: by 2002:a05:651c:a1aa:b0:3ab:3af4:c2d8 with SMTP id
 38308e7fff4ca-3ae7fa71a15mr56174711fa.28.1795665409967; Wed, 25 Nov 2026
 19:56:49 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261112-a733-clk-v7-7-db7c5451ffa2@pigmoral.tech> <20261125115320.3692954-1-alastair@d-silva.org>
In-Reply-To: <20261125115320.3692954-1-alastair@d-silva.org>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Thu, 26 Nov 2026 12:56:37 +0900
X-Gmail-Original-Message-ID: <CAGb2v644kMOCbLGVNB0HRFmoaQcD3qbhKY9G5FVE46O=2td12g@mail.gmail.com>
X-Gm-Features: Aa3M54rpP-Zn9FFry4pu5XjBTgRTyOiIwDPt_8N8tX1t-bsfN3kUc7IF24g0SfQ
Message-ID: <CAGb2v644kMOCbLGVNB0HRFmoaQcD3qbhKY9G5FVE46O=2td12g@mail.gmail.com>
Subject: Re: [PATCH v7 7/8] clk: sunxi-ng: a733: Add bus clock gates
To: "Alastair D'Silva" <alastair@d-silva.org>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Richard Cochran <richardcochran@gmail.com>, linux-clk@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>, 
	Enzo Adriano <enzo.adriano.code@gmail.com>, Norman Herms <dockseed@proton.me>, 
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
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

On Wed, Nov 25, 2026 at 9:02=E2=80=AFPM Alastair D'Silva <alastair@d-silva.=
org> wrote:
>
> Hi Junhui,
>
> On Thu, 12 Nov 2026, Junhui Liu wrote:
> > static SUNXI_CCU_GATE_HWS(ahb_msi_lite0_clk, "ahb-msi-lite0", ahb_hws,
> >                         0x5c0, BIT(16), 0);
> > ...
> > static SUNXI_CCU_GATE_HWS(mbus_msi_lite0_clk, "mbus-msi-lite0", mbus_hw=
s,
> >                         0x5e0, BIT(29), 0);
>
> While bringing up GMAC0 on the OrangePi 4 Pro with this v7 CCU series,
> link-up and DMA broke as soon as clk_disable_unused() ran.
>
> ahb-msi-lite0 (0x5c0, BIT(16)) and mbus-msi-lite0 (0x5e0, BIT(29)) gate
> the shared MSI-Lite0 bus fabric used by GMAC0 and other masters, whereas
> bus-msi-lite0 is only its register configuration clock. Referencing
> ahb-msi-lite0 and mbus-msi-lite0 only in gmac0 does not model the
> shared fabric, and gating them off breaks GMAC0 DMA.
>
> Could you please mark ahb_msi_lite0_clk and mbus_msi_lite0_clk with
> CLK_IS_CRITICAL, matching ahb_store_clk and mbus_store_clk in this
> driver?

The patches have been merged. Please send a fix on top.

If in doubt, you can always check linux-next for patches you are tracking.

> Tested on OrangePi 4 Pro (Allwinner A733).
>
> Thanks,
> Alastair
>

