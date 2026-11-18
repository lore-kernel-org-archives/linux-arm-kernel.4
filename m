Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8226606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 13:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Pa71WaHm;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l7vSMIlU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=lcaa3SNkhAb/kcsmzPV8E1WCwoDFbGJK3E0LRrMO6DY=; b=Pa71WaHmEK2CqTb4FV/s0DdXAz
	7vyEU76o5Blfg460DvyaxkGz0EFCm6OXRew9gUPZLsqETbsCin+LhS2+1KBi6sTdVJrzcC4/puxsy
	r0jU/EaUW56+g2GWHNIEXV1Sr/I3UtnMxnxnJhoD4WiRvkvkgJ/9M1K+OdXp+VNCDG8wlREJwcIgM
	NNvfUwPPcEHvFEzyreBebujs9gHiDzFScr3b5NgpxjRPEuVRPFD3guqCde7SO97t2fsOtE5b8cObJ
	umdY0tCESQneiEs+6c5JXKmmEkLE/CWH0GgvhachxqquMv9dX5LYRXbH81nHbYxB4+lcb83kZDI+O
	+sd4TtBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTfv2-00000008yxA-1UZ4;
	Wed, 18 Nov 2026 13:41:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTfv1-00000008ywr-1p7H
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 13:41:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 194F145BD5
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 13:41:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0E6E1F000CB
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 13:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795009307;
	bh=lcaa3SNkhAb/kcsmzPV8E1WCwoDFbGJK3E0LRrMO6DY=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=l7vSMIlUj0ZnV6gCM6eDGXMeJHxgvN5KeZXKq521C1yqABKr3mPHRJfpt2naXjWJB
	 54z/+SfTXESc/0CyOjoq1+hjdqVO5355UpGtz8kPpSZGjJEi7/TnMk3H2jIBYD4ci8
	 lTsC0OHcm+zaweE+DoGye/QGHD8NQyvrz94FZ7qhlqJdF/MQ2nDjg72U00uwulzPoU
	 eLEq7gQiCBzwt3dGvV883PVeHroCXQvZR1f1PL0xtDy7zRvlXHjNKCclPbKzajCLhj
	 Z5ib/TAlVM8g7DJcXlPgB+hzRqCtmABXGyFEc9zVdl7k9jy6sivSwKFRuspjQSaMCw
	 JhLbHJ/347JIQ==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5bcdae234ecso1120214e87.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 05:41:46 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFC5O0cITe3Sber2TrMNY2au7bdcBQ2j2v9sxsDe/CrUI0tvjWyO97aFgUd1UJG1HH/nECm8CdyTTTSrR3MGQfM@lists.infradead.org
X-Gm-Message-State: APuU4Z8FwH6UFvdssisVF0F9gMoYLIFbYalP06BA2djRKlX823NfzeoQ
	zXkH6YN4qeDX9PgLHYR0luSQ1sVd3cfbTg8g5z3YKxIwquXF4pBAlI43gC9FXmH7hcg601EIIIr
	PdzXXvAE5oqnlewjkurbi/PsBGVSJJ74=
X-Received: by 2002:a05:6512:3d26:b0:5bf:d93d:77ab with SMTP id
 2adb3069b0e04-5c1aa04bfbdmr1046146e87.14.1795009305171; Wed, 18 Nov 2026
 05:41:45 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261112-a733-fwclk-v2@gmail.com> <2374cc08-fd47-435a-b1e8-c7e9a61954c4@arm.com>
In-Reply-To: <2374cc08-fd47-435a-b1e8-c7e9a61954c4@arm.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Wed, 18 Nov 2026 21:41:30 +0800
X-Gmail-Original-Message-ID: <CAGb2v66w9XYO7CUFrvJq2HL7ELABptg=3Bs4XbZxMh7VU0pepw@mail.gmail.com>
X-Gm-Features: AclHuK_uSfLxLqB2imw4kAYz2-b1phnvB91nCtuA6LEH6OR5sLpPkWc-BEPm25g
Message-ID: <CAGb2v66w9XYO7CUFrvJq2HL7ELABptg=3Bs4XbZxMh7VU0pepw@mail.gmail.com>
Subject: Re: [PATCH v2] clk: sunxi-ng: a733: Keep SCP firmware bus clocks enabled
To: Andre Przywara <andre.przywara@arm.com>
Cc: Enzo Adriano <enzo.adriano.code@gmail.com>, sboyd@kernel.org, bmasney+clk@redhat.com, 
	jbrunet+clk@baylibre.com, jernej.skrabec@gmail.com, samuel@sholland.org, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Junhui Liu <junhui.liu@pigmoral.tech>, 
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

On Wed, Nov 18, 2026 at 1:18=E2=80=AFAM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> Hi,
>
> the patch itself looks fine, but the comments and the commit message are
> not entirely correct, I think.
>
> On 11/12/26 22:38, Enzo Adriano wrote:
> > The A733 PRCM's bus-r-riscv and bus-r-msgbox gates have no Linux
> > consumers, so unused-clock cleanup gates them. With vendor SCP firmware
> > running on the E902 as shipped on Cubie A7S, warm reboot then stalls.
>
> Please note that we don't support "vendor firmware" with mainline Linux.
> That was mostly incompatible in the past, and while it might work these
> days, this is not something we control and want to endorse.
> So we would be quite reluctant (to put it mildly) about merging patches
> that are solely needed for BSP firmware bits.
>
> > Keep both critical until remoteproc/mailbox drivers can claim them.
>
> I don't think this "until" is an argument. Even if we'd have Linux
> driver support, they would be optional to use (not compiled, not
> loaded), and would only be needed to *communicate* with the firmware.
>
> But those clocks are actually there to drive the RISC-V core clock, and
> also the "RISC-V side" of the peripherals, due to a lack of separate
> clock controls in the SoC in the Allwinner design. So the kernel should
> not care about or touch those clocks at all - which is what
> CLK_IS_CRITICAL does.

No. CLK_IS_CRITICAL also tells the kernel to turn it on, and you then
can never turn it off. You get a big warning if you try to defeat the
refcounting, but nothing else happens.

So what if the *real* remoteproc driver needs to turn the clock off to
pause the RISC-V core? It can't

So, not a fan of this. If the loaded firmware somehow needs some resources
then perhaps the software that loaded it needs to somehow tell the kernel
they are needed, like the bootloader patching the DT passed to the kernel.

If the firmware needs a piece of DRAM, you don't say in the kernel that
this piece of DRAM is off-limits. You let the bootloader tell the kernel.
Static DRAM carve outs with reserved-memory nodes in the DT source is also
ugly, as you could end up with mismatches if the firmware somehow changed.

IMO CLK_IS_CRITICAL should be used for things that the kernel knows it need=
s
but there's nothing to claim it.


ChenYu

> > This follows A523 bus-r-cpucfg in commit 1dba74abf3e2 ("clk: sunxi-ng:
> > Mark A523 bus-r-cpucfg clock as critical") and the temporary SCPI firmw=
are
> > clock protection for Meson AXG fclk_div3 in drivers/clk/meson/axg.c.
> >
> > On Cubie A7S with vendor boot0/BL31/SCP/U-Boot and without
> > clk_ignore_unused, warm reboot returns with both clocks critical and
> > stalls without them. Vinicius found either flag alone insufficient on
> > Cubie A7Z. Power-off, suspend, single flags on A7S, other
> > boards/firmware and upstream TF-A were not tested.
> >
> > Link: https://lore.kernel.org/r/20261005183038.417798-1-vinicius.eduard=
o.pedrosa@gmail.com
> > Signed-off-by: Enzo Adriano <enzo.adriano.code@gmail.com>
> > ---
> > Changes in v2:
> > - Drop r-timer0, bus-r-timer and bus-msgbox0: A7S warm reboot works wit=
h
> >    these at 0/0. Keep only the two E902/mailbox bus gates after Junhui'=
s
> >    review, pending remoteproc/mailbox ownership.
> > - Rebase on CCU v7; its PRCM clock definitions are unchanged from v6.
> >
> > v1:
> > https://lore.kernel.org/r/20261031020640-263f7b05-a7s-clock@gmail.com
> >
> > Base: v7.4-rc1. Depends on CCU v7 (all eight patches):
> > https://lore.kernel.org/r/20261112-a733-clk-v7-0-db7c5451ffa2@pigmoral.=
tech
> >
> > November 12 board test: two RAM boots and warm reboot -f returns on
> > Cubie A7S with vendor boot0/BL31/SCP/U-Boot, without clk_ignore_unused.
> > Both retained clocks were 1/1; all three dropped clocks were 0/0.
> > The no-flag stall was observed with CCU v6 on Nov 10; PRCM code is
> > byte-identical in v7, where the no-flag control was not repeated.
> > Runtime used DT v3 and its dependencies (all four UART v2 patches),
> > with the PMIC identifier and pinctrl IRQ-map context adapted to the bas=
e:
> > https://lore.kernel.org/r/cover.1794227241.git.enzo.adriano.code@gmail.=
com
>
> I don't think there is any need for those longish test descriptions,
> especially if they pass.
>
> >
> >   drivers/clk/sunxi-ng/ccu-sun60i-a733-r.c | 7 +++++--
> >   1 file changed, 5 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/clk/sunxi-ng/ccu-sun60i-a733-r.c b/drivers/clk/sun=
xi-ng/ccu-sun60i-a733-r.c
> > index b8f6e8c6e507..f2965daba0d3 100644
> > --- a/drivers/clk/sunxi-ng/ccu-sun60i-a733-r.c
> > +++ b/drivers/clk/sunxi-ng/ccu-sun60i-a733-r.c
> > @@ -108,7 +108,9 @@ static SUNXI_CCU_DUALDIV_MUX_GATE(r_spi_clk, "r-spi=
", r_spi_parents, 0x150,
> >                                 0);
> >   static SUNXI_CCU_GATE_HW(bus_r_spi_clk, "bus-r-spi", &r_ahb_clk.commo=
n.hw, 0x15c, BIT(0), 0);
> >
> > -static SUNXI_CCU_GATE_HW(bus_r_msgbox_clk, "bus-r-msgbox", &r_ahb_clk.=
common.hw, 0x17c, BIT(0), 0);
> > +/* Vendor SCP firmware on E902 needs this until a remoteproc/mailbox d=
river claims it. */
>
> Please change this comment. Something like the msgbox clock is shared
> between the E902 core and the Arm APs.
>
> > +static SUNXI_CCU_GATE_HW(bus_r_msgbox_clk, "bus-r-msgbox", &r_ahb_clk.=
common.hw,
> > +                      0x17c, BIT(0), CLK_IS_CRITICAL);
> >
> >   static SUNXI_CCU_GATE_HW(bus_r_uart0_clk, "bus-r-uart0", &r_apb1_clk.=
common.hw, 0x18c, BIT(0), 0);
> >   static SUNXI_CCU_GATE_HW(bus_r_uart1_clk, "bus-r-uart1", &r_apb1_clk.=
common.hw, 0x18c, BIT(1), 0);
> > @@ -146,8 +148,9 @@ static SUNXI_CCU_MUX_DATA_WITH_GATE(r_riscv_clk, "r=
-riscv", r_riscv_parents, 0x2
> >                                 24, 2,        /* mux */
> >                                 BIT(31),      /* gate */
> >                                 0);
> > +/* Vendor SCP firmware on E902 needs this until a remoteproc/mailbox d=
river claims it. */
>
> and this. Just note that the E902 might be running on its own, in a pure
> firmware role, or even completely separate from the main kernel.
>
> Oh, and also please put somewhere that this is based on the linux-sunxi
> for-next tree, aside from just having the base-commit ID below.
>
> Cheers,
> Andre
>
> >   static SUNXI_CCU_GATE_HW(bus_r_riscv_clk, "bus-r-riscv", &r_apb0_clk.=
common.hw,
> > -                      0x21c, BIT(0), 0);
> > +                      0x21c, BIT(0), CLK_IS_CRITICAL);
> >   static SUNXI_CCU_GATE_HW(bus_r_riscv_cfg_clk, "bus-r-riscv-cfg", &r_a=
pb0_clk.common.hw,
> >                        0x21c, BIT(1), 0);
> >
> >
> > base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
>

