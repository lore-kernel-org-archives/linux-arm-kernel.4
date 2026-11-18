Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BFAE606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 14:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=R5HNDiVh;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=frKyaAkS;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=ByOj+lem
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=u/v5EB4DuKP19larRiTYLfjHU2pmt6tp/b9vDdb9Zro=; b=R5HNDiVhwYWo4R
	EZzhNtpRd5TU+0KEtCRqxmJpmtQhxP/Rp6dMjx5n3Sor7UE1EHj06hict2QDjrepgDLVUOMxqojFH
	TjsIKW5uEP5MxXM+GXzl1QG+cc4sU1C6dkUqHuH+EKGLg5ySOM+dFPFmLLMmNIoNkghq5P668fQxf
	DytE/qPVXLpX8YnObZl99PI9XqI+Xit8XIwRlKeHhziisMoQ3YfOizMVo1VsGQNSIhE3xnL/FJi/3
	/OfTbIqbP/9MpFfEZMQjm64C3sI86+lAd+k2Sg6ScRvHkaaCNOP+uIqbyrykUZZ5Sx4yeG7qLa7O1
	jiFGT43jToe0aMBZ/2WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTh0p-000000099Yc-1LAQ;
	Wed, 18 Nov 2026 14:51:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTh0n-000000099YC-48Xw;
	Wed, 18 Nov 2026 14:51:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=u/v5EB4DuKP19larRiTYLfjHU2pmt6tp/b9vDdb9Zro=; b=frKyaAkSlcV+Z5n4ZU2QwOZMk/
	bEvej3NZoM1vlPFedqZL4OTzKIbb54Oqg96/oKQdyR4SQjLA2D2fMHjxdlTVgP//iadDqeh2tD0+P
	FSEorTyLCTNmiNURBHbWq+OZ+t58nGoqV9c3DpnnT8KtopbA4aB49606ivIVK22GaDfTqRAzY1q2h
	omDCnHdXITb52ogIDXhUNT+n8//kcd+shKQdsxsvcqleTdc3hvntr99PS9NfBdQmj6S5LdHA23ysu
	+j/rA7Ds8QfR93SCKX4/J3vs+FjQuEN8kXRFvkNl+u0/zJKT+viytQBxeaSpMETJEXBIbEpKzQ+xu
	i2Jt13Hg==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTh0k-0000000GA6T-0XmW;
	Wed, 18 Nov 2026 14:51:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3D2861596;
	Wed, 18 Nov 2026 06:51:38 -0800 (PST)
Received: from [10.57.69.78] (unknown [10.57.69.78])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6A4F63F632;
	Wed, 18 Nov 2026 06:51:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795013501; bh=p1Y9kHEyN3vd2Wh1wITEyX27uB3SFUWAu7d3tBIEFBM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ByOj+lemTBjazJeZupwPkqMz/bPa1QgkOgQ5nCJ57x2NvIvm02Kwzhu4mpjbfHmcD
	 wMVA3i2dtfSiRhsDGtTKAWsg7rkKoaUsyD42U4IoavnNTYaA/V33K7MoGxP/WLZYig
	 yw1YB5kt1e9GhoE5MH5iOOtSFJ1FODE1mWlgEggQ=
Message-ID: <124bb855-f2f6-4b10-b0be-99fb53cc2ee8@arm.com>
Date: Wed, 18 Nov 2026 15:51:36 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] clk: sunxi-ng: a733: Keep SCP firmware bus clocks
 enabled
To: wens@kernel.org
Cc: Enzo Adriano <enzo.adriano.code@gmail.com>, sboyd@kernel.org,
 bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, jernej.skrabec@gmail.com,
 samuel@sholland.org, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Junhui Liu <junhui.liu@pigmoral.tech>,
 Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
References: <20261112-a733-fwclk-v2@gmail.com>
 <2374cc08-fd47-435a-b1e8-c7e9a61954c4@arm.com>
 <CAGb2v66w9XYO7CUFrvJq2HL7ELABptg=3Bs4XbZxMh7VU0pepw@mail.gmail.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <CAGb2v66w9XYO7CUFrvJq2HL7ELABptg=3Bs4XbZxMh7VU0pepw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_145146_486673_B2A917CD 
X-CRM114-Status: GOOD (  37.86  )
X-Spam-Score: -2.5 (--)
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

On 11/18/26 14:41, Chen-Yu Tsai wrote:
> On Wed, Nov 18, 2026 at 1:18 AM Andre Przywara <andre.przywara@arm.com> wrote:
>>
>> Hi,
>>
>> the patch itself looks fine, but the comments and the commit message are
>> not entirely correct, I think.
>>
>> On 11/12/26 22:38, Enzo Adriano wrote:
>>> The A733 PRCM's bus-r-riscv and bus-r-msgbox gates have no Linux
>>> consumers, so unused-clock cleanup gates them. With vendor SCP firmware
>>> running on the E902 as shipped on Cubie A7S, warm reboot then stalls.
>>
>> Please note that we don't support "vendor firmware" with mainline Linux.
>> That was mostly incompatible in the past, and while it might work these
>> days, this is not something we control and want to endorse.
>> So we would be quite reluctant (to put it mildly) about merging patches
>> that are solely needed for BSP firmware bits.
>>
>>> Keep both critical until remoteproc/mailbox drivers can claim them.
>>
>> I don't think this "until" is an argument. Even if we'd have Linux
>> driver support, they would be optional to use (not compiled, not
>> loaded), and would only be needed to *communicate* with the firmware.
>>
>> But those clocks are actually there to drive the RISC-V core clock, and
>> also the "RISC-V side" of the peripherals, due to a lack of separate
>> clock controls in the SoC in the Allwinner design. So the kernel should
>> not care about or touch those clocks at all - which is what
>> CLK_IS_CRITICAL does.
> 
> No. CLK_IS_CRITICAL also tells the kernel to turn it on, and you then
> can never turn it off. You get a big warning if you try to defeat the
> refcounting, but nothing else happens.

Good point, so is CLK_IGNORE_UNUSED a better flag? As far as I can see, 
it only prevents turning it off if unclaimed, it doesn't turn it on if 
it was off initially, and it doesn't disallow turning it off.

> So what if the *real* remoteproc driver needs to turn the clock off to
> pause the RISC-V core? It can't

I guess this depends on the use case, which isn't very well defined. If 
this E902 is really a remoteproc device entirely controlled by Linux, 
then sure: Linux should have full control over its clock.
But if it's running some kind of firmware component, then the kernel 
shouldn't mess with it, IMHO. But I think there is still the arisc on 
the A733, so this would more likely run the management processor (SCP) code?

Cheers,
Andre

> So, not a fan of this. If the loaded firmware somehow needs some resources
> then perhaps the software that loaded it needs to somehow tell the kernel
> they are needed, like the bootloader patching the DT passed to the kernel.
> 
> If the firmware needs a piece of DRAM, you don't say in the kernel that
> this piece of DRAM is off-limits. You let the bootloader tell the kernel.
> Static DRAM carve outs with reserved-memory nodes in the DT source is also
> ugly, as you could end up with mismatches if the firmware somehow changed.
> 
> IMO CLK_IS_CRITICAL should be used for things that the kernel knows it needs
> but there's nothing to claim it.
> 
> 
> ChenYu
> 
>>> This follows A523 bus-r-cpucfg in commit 1dba74abf3e2 ("clk: sunxi-ng:
>>> Mark A523 bus-r-cpucfg clock as critical") and the temporary SCPI firmware
>>> clock protection for Meson AXG fclk_div3 in drivers/clk/meson/axg.c.
>>>
>>> On Cubie A7S with vendor boot0/BL31/SCP/U-Boot and without
>>> clk_ignore_unused, warm reboot returns with both clocks critical and
>>> stalls without them. Vinicius found either flag alone insufficient on
>>> Cubie A7Z. Power-off, suspend, single flags on A7S, other
>>> boards/firmware and upstream TF-A were not tested.
>>>
>>> Link: https://lore.kernel.org/r/20261005183038.417798-1-vinicius.eduardo.pedrosa@gmail.com
>>> Signed-off-by: Enzo Adriano <enzo.adriano.code@gmail.com>
>>> ---
>>> Changes in v2:
>>> - Drop r-timer0, bus-r-timer and bus-msgbox0: A7S warm reboot works with
>>>     these at 0/0. Keep only the two E902/mailbox bus gates after Junhui's
>>>     review, pending remoteproc/mailbox ownership.
>>> - Rebase on CCU v7; its PRCM clock definitions are unchanged from v6.
>>>
>>> v1:
>>> https://lore.kernel.org/r/20261031020640-263f7b05-a7s-clock@gmail.com
>>>
>>> Base: v7.4-rc1. Depends on CCU v7 (all eight patches):
>>> https://lore.kernel.org/r/20261112-a733-clk-v7-0-db7c5451ffa2@pigmoral.tech
>>>
>>> November 12 board test: two RAM boots and warm reboot -f returns on
>>> Cubie A7S with vendor boot0/BL31/SCP/U-Boot, without clk_ignore_unused.
>>> Both retained clocks were 1/1; all three dropped clocks were 0/0.
>>> The no-flag stall was observed with CCU v6 on Nov 10; PRCM code is
>>> byte-identical in v7, where the no-flag control was not repeated.
>>> Runtime used DT v3 and its dependencies (all four UART v2 patches),
>>> with the PMIC identifier and pinctrl IRQ-map context adapted to the base:
>>> https://lore.kernel.org/r/cover.1794227241.git.enzo.adriano.code@gmail.com
>>
>> I don't think there is any need for those longish test descriptions,
>> especially if they pass.
>>
>>>
>>>    drivers/clk/sunxi-ng/ccu-sun60i-a733-r.c | 7 +++++--
>>>    1 file changed, 5 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/clk/sunxi-ng/ccu-sun60i-a733-r.c b/drivers/clk/sunxi-ng/ccu-sun60i-a733-r.c
>>> index b8f6e8c6e507..f2965daba0d3 100644
>>> --- a/drivers/clk/sunxi-ng/ccu-sun60i-a733-r.c
>>> +++ b/drivers/clk/sunxi-ng/ccu-sun60i-a733-r.c
>>> @@ -108,7 +108,9 @@ static SUNXI_CCU_DUALDIV_MUX_GATE(r_spi_clk, "r-spi", r_spi_parents, 0x150,
>>>                                  0);
>>>    static SUNXI_CCU_GATE_HW(bus_r_spi_clk, "bus-r-spi", &r_ahb_clk.common.hw, 0x15c, BIT(0), 0);
>>>
>>> -static SUNXI_CCU_GATE_HW(bus_r_msgbox_clk, "bus-r-msgbox", &r_ahb_clk.common.hw, 0x17c, BIT(0), 0);
>>> +/* Vendor SCP firmware on E902 needs this until a remoteproc/mailbox driver claims it. */
>>
>> Please change this comment. Something like the msgbox clock is shared
>> between the E902 core and the Arm APs.
>>
>>> +static SUNXI_CCU_GATE_HW(bus_r_msgbox_clk, "bus-r-msgbox", &r_ahb_clk.common.hw,
>>> +                      0x17c, BIT(0), CLK_IS_CRITICAL);
>>>
>>>    static SUNXI_CCU_GATE_HW(bus_r_uart0_clk, "bus-r-uart0", &r_apb1_clk.common.hw, 0x18c, BIT(0), 0);
>>>    static SUNXI_CCU_GATE_HW(bus_r_uart1_clk, "bus-r-uart1", &r_apb1_clk.common.hw, 0x18c, BIT(1), 0);
>>> @@ -146,8 +148,9 @@ static SUNXI_CCU_MUX_DATA_WITH_GATE(r_riscv_clk, "r-riscv", r_riscv_parents, 0x2
>>>                                  24, 2,        /* mux */
>>>                                  BIT(31),      /* gate */
>>>                                  0);
>>> +/* Vendor SCP firmware on E902 needs this until a remoteproc/mailbox driver claims it. */
>>
>> and this. Just note that the E902 might be running on its own, in a pure
>> firmware role, or even completely separate from the main kernel.
>>
>> Oh, and also please put somewhere that this is based on the linux-sunxi
>> for-next tree, aside from just having the base-commit ID below.
>>
>> Cheers,
>> Andre
>>
>>>    static SUNXI_CCU_GATE_HW(bus_r_riscv_clk, "bus-r-riscv", &r_apb0_clk.common.hw,
>>> -                      0x21c, BIT(0), 0);
>>> +                      0x21c, BIT(0), CLK_IS_CRITICAL);
>>>    static SUNXI_CCU_GATE_HW(bus_r_riscv_cfg_clk, "bus-r-riscv-cfg", &r_apb0_clk.common.hw,
>>>                         0x21c, BIT(1), 0);
>>>
>>>
>>> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
>>


