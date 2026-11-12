Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 227E5606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 14:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4zSqBNza;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=evi7clWU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Ahp2R8XXPiuO6iEjfb6UKUnsMrVVlx0bOA5QMiN/SCg=; b=4zSqBNzavZsSHdUMpj7LjrAY8u
	NK3ru+NvgxAbynvk+2c2QmBtVncMP0OVz07GJtjkdjiEZ7YUjr6QBJ99D/4mTJCPGqXCfXm2dE044
	K2YaLmfKUzRbquxbHTp8QeiDO+WhjEcJ4rSD9aSri3GoIzrHQec/TQLEsujkkcPOVLV6gPKTSGjxU
	pUoF1If0rDJI9oBkgC1KrALNpAue3MSfYjHpL8dEsrGAqN30GPboocmit2genkqKl8JQ5P5YojXsc
	oFWNdfvo1K7QRaVRvI6X9z4m4M/VK3Ak+u9mWfWeHEc+bXcvyyFZn5wxDmt0l1Ti3WkyQ/iUm7uI1
	TbvozFfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRWGL-0000000AMMv-2sX1;
	Thu, 12 Nov 2026 14:58:53 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRWGH-0000000AMM7-3XmA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 14:58:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 07A6D405CE
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 14:58:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2B9C1F00A07
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 14:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794495528;
	bh=Ahp2R8XXPiuO6iEjfb6UKUnsMrVVlx0bOA5QMiN/SCg=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=evi7clWUqzfu5IwbwBr1JJlISMJDxPDhvh6uAAOyCg4ZnCnklbxu8+ZjPmsyAJp/0
	 aP8kAcEIz52VuMwJki7SyO4fuxYHvB3MavOJRR03w0bl2i7fAv32f91k/+09mGMrj3
	 iWt4HXcH3d0ZZxsnA6Rm9vsEqznM4YC0+n0a6kqqns3tv22HaO3JdV6Q+ZvJtYkBfF
	 h9guIvmInAtJSD2Thdtkqr1TC4gRLGYeJpVypaDuYlIneKDv92USZioY1YD+c92ZTM
	 GNRqYI1l0LabEgiidIKy/Ghen9POAU1/k4/CNgnT6u71WupklB+95qmRViP8rE0x3t
	 oi8M7RhZ7wVeQ==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3ae25d9e2fdso4861181fa.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 06:58:48 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErH7h7JpnGODEE4iunoN5j9pWZOO2jyxaNOtHYZs0bzp8KVxijsxe95sn5QX/aFGi5v0IaiIxJMfJfL0dMwfL9jV@lists.infradead.org
X-Gm-Message-State: APuU4Z8hYPTh6vSQ48AWpGuMN/Xca1F5HTv4XcnajMNzXWjzCdMPewNe
	savFDCmsyif+/OiiAS2fGh/1DvhBPjQwddRidWrFYZS9sYTnr5x97YRqLCxr5fLrXXuSULD4H8Z
	4MSWwjM16ym4nczSUsczVrswgX+vphq4=
X-Received: by 2002:a05:651c:e0c4:10b0:3ae:25db:795 with SMTP id
 38308e7fff4ca-3ae25db0827mr3381781fa.12.1794495527049; Thu, 12 Nov 2026
 06:58:47 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261112-a733-clk-v7-0-db7c5451ffa2@pigmoral.tech> <20261112-a733-clk-v7-6-db7c5451ffa2@pigmoral.tech>
In-Reply-To: <20261112-a733-clk-v7-6-db7c5451ffa2@pigmoral.tech>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Thu, 12 Nov 2026 23:58:33 +0900
X-Gmail-Original-Message-ID: <CAGb2v64Ye4wEiE3y2msoFh1P5Cs7dvXQ_vESmVFEJ=qhkp9PVQ@mail.gmail.com>
X-Gm-Features: AclHuK-IX9I87FO9BVEBpEeLaHk1PETWtM0mWihOigloFLp60Bd_bejTc7ChEns
Message-ID: <CAGb2v64Ye4wEiE3y2msoFh1P5Cs7dvXQ_vESmVFEJ=qhkp9PVQ@mail.gmail.com>
Subject: Re: [PATCH v7 6/8] clk: sunxi-ng: a733: Add mod clocks support
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Richard Cochran <richardcochran@gmail.com>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, netdev@vger.kernel.org, 
	Jerome Brunet <jbrunet@baylibre.com>, Enzo Adriano <enzo.adriano.code@gmail.com>, 
	Andre Przywara <andre.przywara@arm.com>, Norman Herms <dockseed@proton.me>, 
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

On Thu, Nov 12, 2026 at 4:15=E2=80=AFPM Junhui Liu <junhui.liu@pigmoral.tec=
h> wrote:
>
> Add the module clocks found in the Allwinner A733 SoC, including video,
> storage, interfaces and others. While most of these clocks are similar
> to those in the A523 SoC, this implementation accounts for changes in
> register offsets and introduces support for new modules.
>
> Tested-by: Jerome Brunet <jbrunet@baylibre.com>
> Tested-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
> ---
>  drivers/clk/sunxi-ng/ccu-sun60i-a733.c | 1087 ++++++++++++++++++++++++++=
++++++
>  1 file changed, 1087 insertions(+)
>
> diff --git a/drivers/clk/sunxi-ng/ccu-sun60i-a733.c b/drivers/clk/sunxi-n=
g/ccu-sun60i-a733.c
> index 8bc603393f5a..5ea65bf5b5e0 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun60i-a733.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun60i-a733.c

[...]

> +static SUNXI_CCU_M_HW_WITH_MUX_GATE(i2spcm2_asrc_clk, "i2spcm2_asrc", i2=
spcm2_asrc_parents, 0x1224,

This and the csi master clocks later have an underscore in the clk name str=
ing.
They should have hyphens instead. I will fix it when I apply the patches.
No need to resend just for this.

> +static SUNXI_CCU_DUALDIV_MUX_GATE(csi_master0_clk, "csi_master0", csi_ma=
ster_parents, 0x1800,

This one.

> +                                 0, 5,         /* M */
> +                                 8, 5,         /* N */
> +                                 24, 3,        /* mux */
> +                                 BIT(31),      /* gate */
> +                                 0);
> +static SUNXI_CCU_DUALDIV_MUX_GATE(csi_master1_clk, "csi_master1", csi_ma=
ster_parents, 0x1804,

This one.

> +                                 0, 5,         /* M */
> +                                 8, 5,         /* N */
> +                                 24, 3,        /* mux */
> +                                 BIT(31),      /* gate */
> +                                 0);
> +static SUNXI_CCU_DUALDIV_MUX_GATE(csi_master2_clk, "csi_master2", csi_ma=
ster_parents, 0x1808,

And this one.

> +                                 0, 5,         /* M */
> +                                 8, 5,         /* N */
> +                                 24, 3,        /* mux */
> +                                 BIT(31),      /* gate */
> +                                 0);


These were flagged by a review agent comparing the driver against the datas=
heet
and BSP code.


ChenYu

