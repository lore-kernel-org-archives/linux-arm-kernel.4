Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3695606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 17:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wETWAswV;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=WV9URbfw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=MBpzvZy2ZJyn1GNW1kPyufscZwT3WxGJxcs/46l1sms=; b=wETWAswVPmHOI1
	wgWZT+voGF/jIUb/dz+zq8NUd4tKWlj4vHG8+65ISqDdIrfSgxI4R1inT5BKZ4rYlA2twysTGLBe0
	eFQ5l3XkY2L76i3QkMOyV3fnrbIf+XS2ckX5enLGXCO4CN66xqri8JKoWAnjhXfBMYDZVea/0P+wK
	XujDNkK2rcMKon/SEtkzeOqi7Up0RvYnTz3n3jGAOWiW9Tg9y09/cO3g8N4O3gyYWnhf4pakXUOuo
	Vn9vQXj7kA7PqmHXinyiE/mDP+5yz9INQYhdN4ydRrWgjJ7GVs/2NWWJH1WctqyEJETVV0Rb3xQXO
	gI61IUKpUoLYjh7zcD/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX09r-0000000HKxM-3qNa;
	Fri, 27 Nov 2026 17:54:51 +0000
Received: from mail-106118.protonmail.ch ([79.135.106.118])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX09o-0000000HKwu-31Kd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 17:54:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1795802084; x=1796061284;
	bh=MBpzvZy2ZJyn1GNW1kPyufscZwT3WxGJxcs/46l1sms=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=WV9URbfwJWMvgppCmeG6dN9HfAo+Ub5JejJNz1mG5l2s1pHBb6LLnUTPg91VaoXxa
	 AeqhPesz+uhW3OQr16xDEpUWGBK7xxCLx7jRe+KJuwQ4jkMoZAU9Z0j4hkxew5lZ4G
	 XcOgLet77UWkXaBlgg0YplyjpEky6wY0jTt/a2Lr4k16Q3Gd1MO12yrxi+zbeEaOPP
	 I53M8ClJVixa4hSKKagtCloAK/kauHedhsO2bgbaY/uh8LmQmSFB++1oWti6PEQpue
	 oARtboOlsJFB8JGPu6koj8BbMtoSQenWlVSOTTeXy86qzXKXmSdA/Y+AYkQFx9TZDY
	 4bNHSFUGl40WQ==
Date: Fri, 27 Nov 2026 17:54:35 +0000
To: Andre Przywara <andre.przywara@arm.com>
From: Norman Herms <dockseed@proton.me>
Cc: Jerome Brunet <jbrunet@baylibre.com>, =?utf-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, wens@kernel.org, samuel@sholland.org, Enzo Adriano <enzo.adriano.code@gmail.com>, Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, Junhui Liu <junhui.liu@pigmoral.tech>, Pablo Mazzini <pmazzini@gmail.com>, Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>, Alexander Sverdlin <alex@sverdlin.org>, Jun Yan <jerrysteve1101@gmail.com>, Lukas Schmid <lukas.schmid@netcube.li>, Cristian Filipescu <filipescu.cristian@gmail.com>
Subject: Re: [PATCH v6 2/5] arm64: dts: allwinner: add A733 SoC description
Message-ID: <0ZiLi25XUh_mAaMCw_YhXS3YA3FIj89dJfHVYgxGcBS3a5biGYvczbtTd9O3zus2A5Q1HQMkCaU7I9UU6Y50VGIZ_ltPsKx-7lHvtFtYcVQ=@proton.me>
In-Reply-To: <682cee16-d56c-436a-8661-0cf511fa2e78@arm.com>
References: <20261126-a733-cubie-a7s-dt-v6-0@gmail.com> <20261126-a733-cubie-a7s-dt-v6-2@gmail.com> <p3YaXlLJTguQBGnWyMpb1w@gmail.com> <1jld6eldic.fsf@starbuckisacylon.baylibre.com> <wzwsbUKM-fEhYpTIhswvHly5oyuMCPDOExJEWjbSf-OS3Lrwx2H_l9CUfuMITJUK5CyEz4pNojUFRzjDDczUQmX_LmSWwF7DVSceD34XeHY=@proton.me> <682cee16-d56c-436a-8661-0cf511fa2e78@arm.com>
Feedback-ID: 144388465:user:proton
X-Pm-Message-ID: e8432731c81dec984c084befc90a1a96ab850531
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_095449_529740_C75171FC 
X-CRM114-Status: GOOD (  22.45  )
X-Spam-Score: -2.8 (--)
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

Hi Andre,

> What do you mean by that? The proper solution is to *create* a new
> regulator driver, either embedded in the pinctrl driver (make the
> pinctrl export a regulator device), or as a separate driver, using some
> pinctrl provided regmap.
[...]
> Are you using a different approach?

Yes, a different one: I only meant that there is no PMIC regulator
whose voltage could be changed, the switch is inside the pin
controller. We went with pinctrl states, and sunxi-mmc selects them in
its voltage switch when there is no vqmmc. It works, but a regulator
mux exported by the pin controller, with vqmmc pointing at it, looks
cleaner to me and needs no change in sunxi-mmc. We are happy to test
that.

> Do you mean you use vmmc-supply to point to some 1.8V regulator?

No, vmmc is SWOUT2 at 3.3 V. Without vqmmc, sunxi_mmc_volt_switch()
returns -EINVAL for 1.8 V, so the card stays at 3.3 V without UHS.

> Is that a timing issue, maybe? Maybe the sampling happens only so often,
> and you just happen to miss the change, occasionally?

We cannot rule that out. We read the detector at every SD interrupt
while PF ran at 1.8 V: in the adaptive mode it said "not 1.8 V" at 2
of 90 and 6 of 83 reads, and with the mode set by hand at 1 of 99 and
3 of 103, where the card stayed clean. Right after a switch it already
reported 1.8 V on the first read in our trace, so it does not look
like a slow detector. The USB3 combo PHY points the same way, as it
shares CLDO5 on this board: with the PHY running the failures go
away, and in older traces the detector said 3.3 V in the first 25 ms
at 1.8 V at 2 of 76 reads with the PHY off, but at 0 of 1137 with it
running. Those two traces also differ in kernel and DT, though, and a
run comparing both in the same boot never happened.

> Just to clarify: "0 of 40" means *0 fails* here, so it works?

Yes, 0 failures in 40 rebinds.

> Do you mean your patch just badly hacks those two bits to do what you
> want, by treating PortF separately, but it's not something that looks
> nice and upstreamable?

Yes, it is a special case for bank PF in the pinctrl driver. With a
regulator mux, its set_voltage would be the natural place for the
same order.

> So according to the A7A schematics VCC18-PF is a separate power supply
> pin on the SoC, and it's supplied by CLDO5.

Same on the A7S. There CLDO5 also feeds VCC-PC (the eMMC VCCQ) and the
combo PHY's analog supply, and v6 already references it as
vcc-pc-supply.

> But this is a firmware problem, then? As 0b10 is documented as 3.3V,
> which is wrong if you use a 1.8V eMMC. So doesn't the new pinctrl fix
> patch overwrite this with "auto" (0b01)?

Yes, it is a firmware problem, and yes: with the pinctrl patch the
register reads 0x05555555 under v6, so PC is in auto. Our boot chain
writes auto too; we set PC to 10 by hand at runtime to see what
happens. My point was only that 10 on PC does not behave as the
adaptive mode that the manual text gives for C/E/K. Whether U-Boot
fails with it too, we have not tested.

Built and measured by AI agents (Claude) on my boards.

Thanks,
Norman


