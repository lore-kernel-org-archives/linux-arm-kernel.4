Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CF47606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 15:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JW6ca679;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=i4AadcTo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=j2BNbivZPHPibCEyc+H9GBBrQYs+VsZCs/2qn47xLAI=; b=JW6ca679doWaOR
	1Aiu9iAJ6x7pBhGrt5w9cibFgA1cyNlH25JG7d5yzqoUbLb7qj7s7nJ9HGF5+yha5o+v/vIkICZmX
	+ljEoYRtDjo2EbTmKXMFJYjgYdWWtQAtPNEE/n+M5vLs3eqQrJAzyfcsV/g4UO6qzHhrmTTCv6I1q
	bjbbGc0iiAqefd1Rb+yITLNU0vyhcBG65gg0coQfFKNHK8Wa0pTu+piA2LW7QfzuGQK8Uydb+5PMZ
	BbdYUMkKypywgMxr2+Fn8DlvRjNa5JOFZL1mElouAi0Vho6kp2ssAlJeun6dHnLUb4KtHsolE+J3r
	QxccY8xah/sWYigldhOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xThls-00000009LGi-21Kh;
	Wed, 18 Nov 2026 15:40:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xThlT-00000009L7K-2wyR;
	Wed, 18 Nov 2026 15:40:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E80641477;
	Wed, 18 Nov 2026 07:39:59 -0800 (PST)
Received: from [10.57.69.78] (unknown [10.57.69.78])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1988D3F632;
	Wed, 18 Nov 2026 07:39:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795016402; bh=UmjalxywmS7cNpDQUWtopHm/4dset/da/ZsuV9sIQp4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=i4AadcToOCPgX632yqW2lnrSqScyRtw9QtO2o3OxZKLKLdOUdMia2PtHh/ABU/HxR
	 8Fa1If1Dumx3yG9CNeisIFfYXssDXYPXrNj8IoWLqqKk+HTJFXs1zscm+UxOhVGqq6
	 ZgiAMXhgWMFCf+l0zwEIO6v4b8RFRSIcQs/hLplg=
Message-ID: <35a06829-dd6d-4ef1-aadf-245d1e7ca433@arm.com>
Date: Wed, 18 Nov 2026 16:39:58 +0100
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
 <124bb855-f2f6-4b10-b0be-99fb53cc2ee8@arm.com>
 <CAGb2v65A4rAFTFYyB_sZBC9O7fb0TJWE1YRjdGrLeNgwyVzcSw@mail.gmail.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <CAGb2v65A4rAFTFYyB_sZBC9O7fb0TJWE1YRjdGrLeNgwyVzcSw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_074003_838904_95B6E1D1 
X-CRM114-Status: GOOD (  43.23  )
X-Spam-Score: -4.4 (----)
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

On 11/18/26 16:15, Chen-Yu Tsai wrote:
> On Wed, Nov 18, 2026 at 10:51 PM Andre Przywara <andre.przywara@arm.com> wrote:
>>
>> Hi,
>>
>> On 11/18/26 14:41, Chen-Yu Tsai wrote:
>>> On Wed, Nov 18, 2026 at 1:18 AM Andre Przywara <andre.przywara@arm.com> wrote:
>>>>
>>>> Hi,
>>>>
>>>> the patch itself looks fine, but the comments and the commit message are
>>>> not entirely correct, I think.
>>>>
>>>> On 11/12/26 22:38, Enzo Adriano wrote:
>>>>> The A733 PRCM's bus-r-riscv and bus-r-msgbox gates have no Linux
>>>>> consumers, so unused-clock cleanup gates them. With vendor SCP firmware
>>>>> running on the E902 as shipped on Cubie A7S, warm reboot then stalls.
>>>>
>>>> Please note that we don't support "vendor firmware" with mainline Linux.
>>>> That was mostly incompatible in the past, and while it might work these
>>>> days, this is not something we control and want to endorse.
>>>> So we would be quite reluctant (to put it mildly) about merging patches
>>>> that are solely needed for BSP firmware bits.
>>>>
>>>>> Keep both critical until remoteproc/mailbox drivers can claim them.
>>>>
>>>> I don't think this "until" is an argument. Even if we'd have Linux
>>>> driver support, they would be optional to use (not compiled, not
>>>> loaded), and would only be needed to *communicate* with the firmware.
>>>>
>>>> But those clocks are actually there to drive the RISC-V core clock, and
>>>> also the "RISC-V side" of the peripherals, due to a lack of separate
>>>> clock controls in the SoC in the Allwinner design. So the kernel should
>>>> not care about or touch those clocks at all - which is what
>>>> CLK_IS_CRITICAL does.
>>>
>>> No. CLK_IS_CRITICAL also tells the kernel to turn it on, and you then
>>> can never turn it off. You get a big warning if you try to defeat the
>>> refcounting, but nothing else happens.
>>
>> Good point, so is CLK_IGNORE_UNUSED a better flag? As far as I can see,
>> it only prevents turning it off if unclaimed, it doesn't turn it on if
>> it was off initially, and it doesn't disallow turning it off.
> 
> Yes. It's like an uncoordinated simplefb? :p

I guess you could see it that way, although Linux wouldn't directly know 
about it.

>>> So what if the *real* remoteproc driver needs to turn the clock off to
>>> pause the RISC-V core? It can't
>>
>> I guess this depends on the use case, which isn't very well defined. If
>> this E902 is really a remoteproc device entirely controlled by Linux,
>> then sure: Linux should have full control over its clock.
>> But if it's running some kind of firmware component, then the kernel
>> shouldn't mess with it, IMHO. But I think there is still the arisc on
>> the A733, so this would more likely run the management processor (SCP) code?
> 
> Even if it had firmware already running, if it provides some interface to
> the OS (other than PSCI / SCMI), then you'd probably still have a remoteproc
> driver claiming and somewhat controlling it, plus rpmsg or something else
> to bridge the firmware interface.
> 
> OTOH, AFAIK some SCP, such as crust, are pretty much transparent to the OS,
> i.e. the OS doesn't know about it. The RISC-V core is probably useful beyond
> just being the SCP. You could offload control of various hardware blocks to
> it if you wanted, or you could have it be an always on sensor hub. Either way
> the OS would have some control over it and some defined interface to it.

Yes, that is what I mean: there are two distinct use cases: the realtime 
one, where Linux uses remoteproc to offload timing critical load, and 
the "SCP" one, where it just runs in the background, and the kernel is 
not directly involved. For this latter case we would need to not turn 
off the clocks.

The question now is whether this SCP use case is something we deem 
useful, for mainline. If it's just about to run the BSP firmware, I 
think we shouldn't bother, we just don't support that. But if we end up 
running something like crust on the E902, then it's a different story.

So I wonder if we should just pragmatically add CLK_IGNORE_UNUSED, to 
not shut on the door on this SCP use case later.
If we ever only want to use remoteproc, I think we don't need this patch.

Cheers,
Andre

>>> So, not a fan of this. If the loaded firmware somehow needs some resources
>>> then perhaps the software that loaded it needs to somehow tell the kernel
>>> they are needed, like the bootloader patching the DT passed to the kernel.
>>>
>>> If the firmware needs a piece of DRAM, you don't say in the kernel that
>>> this piece of DRAM is off-limits. You let the bootloader tell the kernel.
>>> Static DRAM carve outs with reserved-memory nodes in the DT source is also
>>> ugly, as you could end up with mismatches if the firmware somehow changed.
>>>
>>> IMO CLK_IS_CRITICAL should be used for things that the kernel knows it needs
>>> but there's nothing to claim it.
>>>
>>>
>>> ChenYu
>>>
>>>>> This follows A523 bus-r-cpucfg in commit 1dba74abf3e2 ("clk: sunxi-ng:
>>>>> Mark A523 bus-r-cpucfg clock as critical") and the temporary SCPI firmware
>>>>> clock protection for Meson AXG fclk_div3 in drivers/clk/meson/axg.c.
>>>>>
>>>>> On Cubie A7S with vendor boot0/BL31/SCP/U-Boot and without
>>>>> clk_ignore_unused, warm reboot returns with both clocks critical and
>>>>> stalls without them. Vinicius found either flag alone insufficient on
>>>>> Cubie A7Z. Power-off, suspend, single flags on A7S, other
>>>>> boards/firmware and upstream TF-A were not tested.
>>>>>
>>>>> Link: https://lore.kernel.org/r/20261005183038.417798-1-vinicius.eduardo.pedrosa@gmail.com
>>>>> Signed-off-by: Enzo Adriano <enzo.adriano.code@gmail.com>
>>>>> ---
>>>>> Changes in v2:
>>>>> - Drop r-timer0, bus-r-timer and bus-msgbox0: A7S warm reboot works with
>>>>>      these at 0/0. Keep only the two E902/mailbox bus gates after Junhui's
>>>>>      review, pending remoteproc/mailbox ownership.
>>>>> - Rebase on CCU v7; its PRCM clock definitions are unchanged from v6.
>>>>>
>>>>> v1:
>>>>> https://lore.kernel.org/r/20261031020640-263f7b05-a7s-clock@gmail.com
>>>>>
>>>>> Base: v7.4-rc1. Depends on CCU v7 (all eight patches):
>>>>> https://lore.kernel.org/r/20261112-a733-clk-v7-0-db7c5451ffa2@pigmoral.tech
>>>>>
>>>>> November 12 board test: two RAM boots and warm reboot -f returns on
>>>>> Cubie A7S with vendor boot0/BL31/SCP/U-Boot, without clk_ignore_unused.
>>>>> Both retained clocks were 1/1; all three dropped clocks were 0/0.
>>>>> The no-flag stall was observed with CCU v6 on Nov 10; PRCM code is
>>>>> byte-identical in v7, where the no-flag control was not repeated.
>>>>> Runtime used DT v3 and its dependencies (all four UART v2 patches),
>>>>> with the PMIC identifier and pinctrl IRQ-map context adapted to the base:
>>>>> https://lore.kernel.org/r/cover.1794227241.git.enzo.adriano.code@gmail.com
>>>>
>>>> I don't think there is any need for those longish test descriptions,
>>>> especially if they pass.
>>>>
>>>>>
>>>>>     drivers/clk/sunxi-ng/ccu-sun60i-a733-r.c | 7 +++++--
>>>>>     1 file changed, 5 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/drivers/clk/sunxi-ng/ccu-sun60i-a733-r.c b/drivers/clk/sunxi-ng/ccu-sun60i-a733-r.c
>>>>> index b8f6e8c6e507..f2965daba0d3 100644
>>>>> --- a/drivers/clk/sunxi-ng/ccu-sun60i-a733-r.c
>>>>> +++ b/drivers/clk/sunxi-ng/ccu-sun60i-a733-r.c
>>>>> @@ -108,7 +108,9 @@ static SUNXI_CCU_DUALDIV_MUX_GATE(r_spi_clk, "r-spi", r_spi_parents, 0x150,
>>>>>                                   0);
>>>>>     static SUNXI_CCU_GATE_HW(bus_r_spi_clk, "bus-r-spi", &r_ahb_clk.common.hw, 0x15c, BIT(0), 0);
>>>>>
>>>>> -static SUNXI_CCU_GATE_HW(bus_r_msgbox_clk, "bus-r-msgbox", &r_ahb_clk.common.hw, 0x17c, BIT(0), 0);
>>>>> +/* Vendor SCP firmware on E902 needs this until a remoteproc/mailbox driver claims it. */
>>>>
>>>> Please change this comment. Something like the msgbox clock is shared
>>>> between the E902 core and the Arm APs.
>>>>
>>>>> +static SUNXI_CCU_GATE_HW(bus_r_msgbox_clk, "bus-r-msgbox", &r_ahb_clk.common.hw,
>>>>> +                      0x17c, BIT(0), CLK_IS_CRITICAL);
>>>>>
>>>>>     static SUNXI_CCU_GATE_HW(bus_r_uart0_clk, "bus-r-uart0", &r_apb1_clk.common.hw, 0x18c, BIT(0), 0);
>>>>>     static SUNXI_CCU_GATE_HW(bus_r_uart1_clk, "bus-r-uart1", &r_apb1_clk.common.hw, 0x18c, BIT(1), 0);
>>>>> @@ -146,8 +148,9 @@ static SUNXI_CCU_MUX_DATA_WITH_GATE(r_riscv_clk, "r-riscv", r_riscv_parents, 0x2
>>>>>                                   24, 2,        /* mux */
>>>>>                                   BIT(31),      /* gate */
>>>>>                                   0);
>>>>> +/* Vendor SCP firmware on E902 needs this until a remoteproc/mailbox driver claims it. */
>>>>
>>>> and this. Just note that the E902 might be running on its own, in a pure
>>>> firmware role, or even completely separate from the main kernel.
>>>>
>>>> Oh, and also please put somewhere that this is based on the linux-sunxi
>>>> for-next tree, aside from just having the base-commit ID below.
>>>>
>>>> Cheers,
>>>> Andre
>>>>
>>>>>     static SUNXI_CCU_GATE_HW(bus_r_riscv_clk, "bus-r-riscv", &r_apb0_clk.common.hw,
>>>>> -                      0x21c, BIT(0), 0);
>>>>> +                      0x21c, BIT(0), CLK_IS_CRITICAL);
>>>>>     static SUNXI_CCU_GATE_HW(bus_r_riscv_cfg_clk, "bus-r-riscv-cfg", &r_apb0_clk.common.hw,
>>>>>                          0x21c, BIT(1), 0);
>>>>>
>>>>>
>>>>> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
>>>>
>>
>>
> 


