Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 088ED606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 10:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XXnD8ZnX;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q3tRe0tK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=82vT/MidDA+8aMYka2WD5yUJcaeeqPoH6Zw6wVte8cw=; b=XXnD8ZnXouljs6ClHi8fgx+TPQ
	1DFRnu6cp939gU2IJLWJV8Kgf6gAK04XV6rEaQdSndwich9kRQ7bk6BgfrWVbJKHdfPXr4K1FoKci
	BLY4oWa+/3VNnBbzblFMS5yEtm8Cm5J63i53FOndAsxr4vyIPjqW8JswOK4gSgso/AuiTq/1sk/f4
	84bbAGuaop99jeax/cNFkoxa7U8eBGTdcMA+dMuxiXHIDUSfQ2ECTu49yKsgRiMxmZxuyKLTuaakP
	rG0IpDuTa72kP0dOuso98zE4zcnk/dRw/hM4cd9CWOS881GoothMiz97GpsoaRDaDQeLGy0CGiwRJ
	aQ8zVW/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV583-00000000zHe-18Kx;
	Sun, 22 Nov 2026 10:49:03 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV581-00000000zHU-3nyj
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 10:49:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EE6A06121D
	for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 10:49:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A598E1F000D2
	for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 10:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795344540;
	bh=82vT/MidDA+8aMYka2WD5yUJcaeeqPoH6Zw6wVte8cw=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=Q3tRe0tKc+da4fHoKNZggf+QYLWK/vw/RT2uLgHl0fU/2aO0OT1jAjK4bf+xeyIbM
	 WL5hrs5EqOPsI9Vd5n5n73nG13jsMd/zZQ26MhWur+5jcjOH/qUU+/c5ND84/GrT06
	 atCOmot23FoQM6oc7n8w4ILuhPkx35rD9bRB54dUrP44iPF16GIc0fJMnFtY6UnvcR
	 cBdftCQ8izLhWvRPd0DkX4YKlQ7fetTicDR1Knq+We68oZSx3vBVpS5PFdBROluTQJ
	 cgcDOCp3iBzj5huZTUfRRDJ+w882AMl5P4dHV9ipwgLRUi3SATQhzFVCVkSwJeoEpg
	 XxAKPk49RUx0g==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3ae81ae52ffso15577571fa.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 02:49:00 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGjUYXa5T3dKEY9S6N8nA5de5s54E5cYRpa15HXVuP9MYzlc58HVmFwOPGbxrPUsrgFsCGJBAk4iwnfssvfyPJS@lists.infradead.org
X-Gm-Message-State: APuU4Z/lqF9eAFrM3b8+NihtmpTg/Y9fpMmciEXCtafLyomxxySVhFuO
	OLIGlOWnFXZFTOLTze6B18MjvFnIB4D/h8S9MsTgQpFJaQf/LBIlauCiCfQmtJkNc+GFcK9aQFp
	dIFtHVhAE5Iyx+KHqytlNVWnBfMVoa+0=
X-Received: by 2002:a05:6512:6811:b0:5bf:a209:f81f with SMTP id
 2adb3069b0e04-5c1bc8227e0mr1708230e87.37.1795344539095; Sun, 22 Nov 2026
 02:48:59 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261122-sun8i-emac-mtu-limit-v2-0-c4081e5b83cf@gmail.com>
In-Reply-To: <20261122-sun8i-emac-mtu-limit-v2-0-c4081e5b83cf@gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sun, 22 Nov 2026 18:48:47 +0800
X-Gmail-Original-Message-ID: <CAGb2v66oxp7G92psuF-pQsha5doh47j2gSMiTY7PAB2dYfozUw@mail.gmail.com>
X-Gm-Features: Aa3M54r7bLOgFVd2AUy7gPHcb4qGTG5JYucqFv0oQ6biMXQehq8fLcl6BjtfAGY
Message-ID: <CAGb2v66oxp7G92psuF-pQsha5doh47j2gSMiTY7PAB2dYfozUw@mail.gmail.com>
Subject: Re: [PATCH net v2 0/2] net: stmmac: Limit the MTU of normal
 descriptors to one buffer
To: aiyengar1990@gmail.com
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	LABBE Corentin <clabbe.montjoie@gmail.com>, netdev@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	Russell King <rmk+kernel@armlinux.org.uk>, Nicolai Buchwitz <nb@tipi-net.de>, stable@vger.kernel.org
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

On Sun, Nov 22, 2026 at 5:13=E2=80=AFPM Arun Iyengar via B4 Relay
<devnull+aiyengar1990.gmail.com@kernel.org> wrote:
>
> Normal descriptors take frames of at most one 2047-byte buffer, but
> max_mtu allows 3712 on arm64. Patch 1 limits it in the core, patch 2
> limits dwmac-sun8i further to the 2044 bytes its RX DMA fills.

I think you should clearly state that *one normal descriptor* can have
a buffer of up to 2047 bytes. And the driver is currently limited to
using one descriptor per-frame.

The way you write it makes it unclear whether it's a hardware or driver
limitation. I believe it is the latter.

> Tested on an Orange Pi Zero2 (H616) on net/main. Without the patches,
> MTU 2029 to 2100 is accepted and ping gets no reply. With patch 1 the
> maximum is 2021, with both 2018. UDP and ping are lossless up to the
> maximum, and larger MTUs are refused. Ring mode and other cores are
> untested.
>
> Claude (AI) helped write these patches; I reviewed and tested them.
>
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
> ---
> Changes in v2:
> - Limit normal descriptors in the core (patch 1, Andrew Lunn, Maxime
>   Chevallier), keep the lower sun8i limit as patch 2
> - Link to v1: https://patch.msgid.link/20261121-sun8i-emac-mtu-limit-v1-1=
-22492842d318@gmail.com
>
> ---
> Arun Iyengar (2):
>       net: stmmac: Limit the MTU of normal descriptors to one buffer
>       net: stmmac: dwmac-sun8i: Limit the MTU to 2018
>
>  drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 1 +
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 3 +++
>  2 files changed, 4 insertions(+)
> ---
> base-commit: 890f23ba87a7ca1aba97c8320770a686e3b689fb
> change-id: 20261121-sun8i-emac-mtu-limit-66a936064965
>
> Best regards,
> --
> Arun Iyengar <aiyengar1990@gmail.com>
>
>

