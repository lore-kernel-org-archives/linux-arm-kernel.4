Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 492DF606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 16:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=i95ISoFd;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UPpFuF29
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=GFQPb65NT7RMSCppnWXFsuqs6MvLmEnYZdDh5XC4mjA=; b=i95ISoFdFT7XnCDdZ9I0xZa8T9
	8DeTKVl4oWKdjNZxhN7/+t+1/5AnysKJh3d6+0KlX8PWLJGnUDHIH8mdOOWwYE1P26QsnHFmd6dD4
	7LsLJMBrNxl+FBskip7R28d+RGMKB4Q5V3DeMgrn3XswXQywRzDVKGe/fOnuouHLstdE+WO0l5w8J
	pruy92R7S2+IX62Zlhwapm45dXqae6cHS0KLxgA4r5jofj+8DS3CsJzZFP/uqHS6zvHgPjbBVSiSn
	neeF4ah7fOdYGSdZPl34PXvJBziI+V/B4jEehABmeh/Dk5cpJjiiJ3EUPv7gzX/NkHkDt+idQi7tc
	RE5LV4Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQRtv-000000019mc-3XtH;
	Mon, 09 Nov 2026 16:07:19 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQRtu-000000019mQ-1hJ2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 16:07:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0731045AA1
	for <linux-arm-kernel@lists.infradead.org>; Mon,  9 Nov 2026 16:07:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E36451F00930
	for <linux-arm-kernel@lists.infradead.org>; Mon,  9 Nov 2026 16:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794240437;
	bh=GFQPb65NT7RMSCppnWXFsuqs6MvLmEnYZdDh5XC4mjA=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=UPpFuF292enNAk33j0lC+1PqdbjJadzioJZ9ju8EwW47zs88GH4LOgNx6EXsBeAVS
	 naQyLa5OJnp5SwqUX8i35edRwP+9AafAV+Zz8HdaTatC78INOzQLTZGY6xqBbAdv/w
	 IiBpDWoJ7kQqe+JNkrpVw+hcxH4K73HSm0ZwcQcAPxQTgH7kNV3MNpL2gTH1DzNyal
	 c2ohYafFn+0LycaXUe345gUZ3bkAugp/UYZE1nBzEES9VDKgulLZ94SrK0/f9E6ILx
	 D/nEratmZRTSCwdOkvM1jJUmOWwhPHp9t6xXNpRh+E/zY0IW2d3tLcFSer/hskkYgY
	 vTE3vP+uIGl7Q==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5be4a2d94adso950624e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 08:07:17 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGn89eBYVegh0weZcIal0fafHSTa5GZtm1JcRZ3qiTPKs1qKe82ODEaT9mRyMmwmguv4CfzdIUu+Gtvu+Tt7yRy@lists.infradead.org
X-Gm-Message-State: APuU4Z+dJ1BxSp1Xioi5w+1nP0F/FLKOmDNnLJpm1ggjO366/cO1G4IV
	9u1A/4R4gE6edPazn7VuWikVFxBH+hfqOQXzXynOucbtRLT5IlTuk8UF4j3ObZgMi7xEqDUxoHF
	MiCSNUQuS94AIZ1y3fsuzlOBPE7JMiiM=
X-Received: by 2002:a05:6512:1396:b0:5c1:4974:c15e with SMTP id
 2adb3069b0e04-5c14c0347cbmr1335285e87.52.1794240436213; Mon, 09 Nov 2026
 08:07:16 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261009-a733-clk-v6-0-ae8178fce7e8@pigmoral.tech> <20261009-a733-clk-v6-6-ae8178fce7e8@pigmoral.tech>
In-Reply-To: <20261009-a733-clk-v6-6-ae8178fce7e8@pigmoral.tech>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 10 Nov 2026 01:07:03 +0900
X-Gmail-Original-Message-ID: <CAGb2v67M2bN6a4AsNL_Lv70QmHTvdSWUCbPQat6Po_7KbbqA-w@mail.gmail.com>
X-Gm-Features: AclHuK9agX6QEN1ILAcd18vE_t6MGmoL64ggMRVBKmQGQ0cwuc_S8X4_YIrWVls
Message-ID: <CAGb2v67M2bN6a4AsNL_Lv70QmHTvdSWUCbPQat6Po_7KbbqA-w@mail.gmail.com>
Subject: Re: [PATCH v6 6/8] clk: sunxi-ng: a733: Add mod clocks support
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

On Sat, Oct 10, 2026 at 12:54=E2=80=AFAM Junhui Liu <junhui.liu@pigmoral.te=
ch> wrote:
>
> Add the module clocks found in the Allwinner A733 SoC, including video,
> storage, interfaces and others. While most of these clocks are similar
> to those in the A523 SoC, this implementation accounts for changes in
> register offsets and introduces support for new modules.
>
> Tested-by: Jerome Brunet <jbrunet@baylibre.com>
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
> ---
>  drivers/clk/sunxi-ng/ccu-sun60i-a733.c | 1103 ++++++++++++++++++++++++++=
++++++
>  1 file changed, 1103 insertions(+)
>
> diff --git a/drivers/clk/sunxi-ng/ccu-sun60i-a733.c b/drivers/clk/sunxi-n=
g/ccu-sun60i-a733.c
> index 371c4297c3ab..7847eec84313 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun60i-a733.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun60i-a733.c

[...]

> +static const struct clk_parent_data dram_parents[] =3D {
> +       { .hw =3D &pll_ddr_clk.common.hw, },
> +       { .hw =3D &pll_periph0_800M_clk.common.hw, },
> +       { .hw =3D &pll_periph0_600M_clk.hw, },
> +       { .hw =3D &pll_de_clk.common.hw, },
> +       { .hw =3D &pll_npu_clk.common.hw, },
> +};
> +static SUNXI_CCU_M_DATA_WITH_MUX_GATE_FEAT(dram0_clk, "dram0", dram_pare=
nts, 0xc00,
> +                                          0, 4,        /* M */

My LLM agent flagged this: the divider is 5 bits wide, not 4.
Both the user manual (page 149 from start or 128 as numbered on the page)
and the BSP agree.


ChenYu

