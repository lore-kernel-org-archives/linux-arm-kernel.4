Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC2A5606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 17:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=u5zlfKoE;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=V1Rkddvt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=9gzHBqo1ZS1N9lhELOvmEI3+H79vKOr9CzjE/QFqZ20=; b=u5zlfKoEuIhbvo
	dOTI4eCc6kPViVPx5+MRn2/KTZyUntUPffhA5w6oLOVgiH9+mGhwAyOc9fk9hapGmTgexm7xXEwRv
	w/ZI44NM4be3jIEYrmsEmRbqD8kb66pzEmlGthnZndlAgufEIw+rm7SBi9spCWcFMf92NowG/Nehh
	9GChRpv1Fzjx6FzrAqz8TwV3ld5DTe65HVmB2a+c0GbbNwyn/SS+IoAUMjpa/gtxUbYZ2xEvqQeuJ
	+FwNUx2ESK76b6EhjY1Nr5pfeffZoqJF/LlE10050QiTIsEMIsux5elt70GI2ndy9VGvygf6bBzbr
	0aLyVkfG3ShkclPOUz4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWzPd-0000000HCSf-1ust;
	Fri, 27 Nov 2026 17:07:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWzPa-0000000HCSB-17E0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 17:07:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 181621575;
	Fri, 27 Nov 2026 09:06:58 -0800 (PST)
Received: from [10.33.50.35] (e142021.arm.com [10.33.50.35])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DCBED3F632;
	Fri, 27 Nov 2026 09:06:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795799220; bh=qFa6sy83V0It3krE5paW+O7B9Fqh10IXDVByOoZlZCg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=V1RkddvtAdtrHpMFzFpDiZ4C/UaR5WYNc0ztJ5+Z463L6+Nv4oHyzmK4HiDTvzwPm
	 6AN/jKSaaEq5km6iu5X7tdN3q7y61sqjxji932nkfydkvILEPaCr/n+5gNJQa4j/1l
	 RxbqgiXm9QE3eTgf9w3rbLIjjLNBO5C4uWWNZwhg=
Message-ID: <682cee16-d56c-436a-8661-0cf511fa2e78@arm.com>
Date: Fri, 27 Nov 2026 17:06:54 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/5] arm64: dts: allwinner: add A733 SoC description
To: Norman Herms <dockseed@proton.me>, Jerome Brunet <jbrunet@baylibre.com>
Cc: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, wens@kernel.org,
 samuel@sholland.org, Enzo Adriano <enzo.adriano.code@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Junhui Liu <junhui.liu@pigmoral.tech>,
 Pablo Mazzini <pmazzini@gmail.com>,
 Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
 Alexander Sverdlin <alex@sverdlin.org>, Jun Yan <jerrysteve1101@gmail.com>,
 Lukas Schmid <lukas.schmid@netcube.li>,
 Cristian Filipescu <filipescu.cristian@gmail.com>
References: <20261126-a733-cubie-a7s-dt-v6-0@gmail.com>
 <20261126-a733-cubie-a7s-dt-v6-2@gmail.com>
 <p3YaXlLJTguQBGnWyMpb1w@gmail.com>
 <1jld6eldic.fsf@starbuckisacylon.baylibre.com>
 <wzwsbUKM-fEhYpTIhswvHly5oyuMCPDOExJEWjbSf-OS3Lrwx2H_l9CUfuMITJUK5CyEz4pNojUFRzjDDczUQmX_LmSWwF7DVSceD34XeHY=@proton.me>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <wzwsbUKM-fEhYpTIhswvHly5oyuMCPDOExJEWjbSf-OS3Lrwx2H_l9CUfuMITJUK5CyEz4pNojUFRzjDDczUQmX_LmSWwF7DVSceD34XeHY=@proton.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_090702_447409_0C1A909E 
X-CRM114-Status: GOOD (  29.56  )
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

On 11/27/26 17:37, Norman Herms wrote:
> Hi Jerome,
> 
> On the PF voltage selector: we have been running UHS-I on the Cubie
> A7S for a while in our own trees (6.18 and mainline based). Here is
> what we ran into, in case it helps whoever models it.
> 
> - The switch: on this board bank PF takes its supply from VCC-IO
>    (3.3 V) or from CLDO5 (1.8 V), selected by GPIO_POW_VAL_SET_CTL
>    bit 0 (1 = 3.3 V). There is no external regulator to switch, so

What do you mean by that? The proper solution is to *create* a new 
regulator driver, either embedded in the pinctrl driver (make the 
pinctrl export a regulator device), or as a separate driver, using some 
pinctrl provided regmap. To be precise, it should be some kind of 
regulator mux, selecting between VCC-IO and VCC18-PF.
And then it should indeed just be a matter of pointing vqmmc-supply to 
that regulator to make it work.
Are you using a different approach? I have seen various downstream 
patches implementing something similar, and they seem to be happy.
And I have seen pinctrl states as well, but think we need a proper vqmmc 
regulator, regardless?

>    vqmmc does not fit, and sunxi-mmc without vqmmc returns -EINVAL for
>    1.8 V.

Do you mean you use vmmc-supply to point to some 1.8V regulator? This is 
indeed bound to fail, as the SD spec requires 3.3V always for the supply 
voltage. And the binding/SD card Linux subsystem allows not providing 
vqmmc, at which point it will assume it's the same as vmmc - but not the 
other way around.

 >    We use two pinctrl states, "sdmmc-3v3" and "sdmmc-1v8" as on> 
Tegra, whose pin groups carry power-source.
> 
> - The withstand mode: with PF in the adaptive mode of
>    GPIO_POW_MOD_SEL (01, which is what the pinctrl automatic voltage
>    detection patch sets), the pads follow the SoC's own supply
>    detector, and on our board that detector now and then reports
>    3.3 V while PF runs at 1.8 V.

Is that a timing issue, maybe? Maybe the sampling happens only so often, 
and you just happen to miss the change, occasionally?

> With one card, 14 of 40 SD rebinds at
>    SDR104 failed: the CMD6 status read gets a data CRC error and the
>    card falls back to high speed; once the card was lost ("error -5
>    whilst initialising SD card"). Setting the PF mode by hand together
>    with the switch gave 0 of 40: 10 (3.3 V) before switching to 3.3 V,

Just to clarify: "0 of 40" means *0 fails* here, so it works?

>    and 11 (1.8 V) after switching to 1.8 V, once GPIO_POW_VAL reports
>    PF at 1.8 V. Our final patch does that and also gave 0 of 40.

Do you mean your patch just badly hacks those two bits to do what you 
want, by treating PortF separately, but it's not something that looks 
nice and upstreamable?

>    Oddly, the fault also goes away while the USB3 combo PHY runs; on
>    this board CLDO5 supplies its analog part too. Another card passed

So according to the A7A schematics VCC18-PF is a separate power supply 
pin on the SoC, and it's supplied by CLDO5. On the A7A CLDO5 is not 
always-on, so you would need to reference it somewhere to be enabled, by 
the SD card node.

>    40 of 40 even in the adaptive mode.
> 
> - The eMMC on bank PC needs no switching, CLDO5 is fixed at 1.8 V.
>    But if the boot chain leaves the PC field at its reset value 10 (the
>    register resets to 0x022aaaa0), HS400 enhanced strobe fails with
>    "mmc_select_hs400es failed, error -110". So on PC, 10 behaves as the
>    3.3 V mode, as in the register table, not as the adaptive mode the

But this is a firmware problem, then? As 0b10 is documented as 3.3V, 
which is wrong if you use a 1.8V eMMC. So doesn't the new pinctrl fix 
patch overwrite this with "auto" (0b01)?
Even if not, firmware should not program the wrong values. I guess 
U-Boot would similarly fail to access the eMMC with that wrong value?

Cheers,
Andre

>    text of 18.14.4.6 gives for C/E/K. 01 and the fixed 1.8 V mode (11)
>    both work.
> 
> We can test patches for this on the A7S, SD and eMMC.
> 
> Built and measured by AI agents (Claude) on my boards.
> 
> Thanks,
> Norman


