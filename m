Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1388B606A68E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 23:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=n53lADuR;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=O+8QmB4X
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=FvvNDtfsIabNA/On19BazK/OQL2ez6R5Vi/Cev7mYvk=; b=n53lADuRqxsSzI
	3yFKbIcyx7bBTYdWut3KgEFOLHc8Xn/oQmbxbtWh4sjVYAh6qkLYByDbB0gNQh9WZF2P1P5DNtdA/
	JEtCiKKAKqZphu/Xgy8CdQ17MT4UlGwESFmnwbLG6/V2WOfJinDNzY+fKTv7f66rISdRmm7xVRy2+
	93Dw5SHc2mnDP+6ILDp1Ovt5V19G4r00iFUXAzMjoHPZ4z68sOeNhM2uNbMglDsrdhJP6v9jhYhcS
	uixX0jpImz+pvM4wBVsOgqjA0ISsWlxJcqxI+aG/2E2YjyptrXa7Go9lta+IejQVOewODDHfqpyj2
	B88AuWE/mPWLbaC38KzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWMSv-0000000BZNf-1bVD;
	Wed, 25 Nov 2026 23:31:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWMSj-0000000BZ4u-0b8c
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 23:31:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1344B1596;
	Wed, 25 Nov 2026 15:31:35 -0800 (PST)
Received: from [10.43.3.73] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 19F6A3F86F;
	Wed, 25 Nov 2026 15:31:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795649497; bh=g4SLH4ntJ/Uj2nuvXWB8FADSkntEV5OWw71EFBWI27c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=O+8QmB4X04m2jcI9M7lf3p+aZQGd5zPftioIuuFIPcj3BZHatl8xM9lk3BdvUiu9E
	 z+TbsQ1kjBzDZCqKqL1lK6RSPzZMdGwT9ACOiJeF5tCv1iLjx3REEREY6m2s/OJ5Vj
	 G8HlgVQwQTcQ/2tvEAzqVA9VVjpPwGC9RWVIHAQM=
Message-ID: <b9220cf0-ad6b-4719-aa67-154666c788ea@arm.com>
Date: Wed, 25 Nov 2026 23:31:30 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] pinctrl: sunxi: add support for the Allwinner A733
To: Alastair D'Silva <alastair@d-silva.org>, Linus Walleij
 <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Yixun Lan <dlan@gentoo.org>,
 Enzo Adriano <enzo.adriano.code@gmail.com>,
 Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
References: <20260910133519.459011-8-andre.przywara@arm.com>
 <20261125115703.3724690-1-alastair@d-silva.org>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20261125115703.3724690-1-alastair@d-silva.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_153141_527846_2C8B22B7 
X-CRM114-Status: GOOD (  20.07  )
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

Hi Alastair,

On 11/25/26 12:57, Alastair D'Silva wrote:
> Hi Andre,
> 
> Two issues showed up while testing this A733 pinctrl series on the
> OrangePi 4 Pro:

While it's the right idea to reply to the patch that introduces some 
problematic behaviour, there are other things to consider here:
> 1. PIO_POW_MOD_SEL (0x0040) on A733 uses 2 bits per bank instead of

But we know that for a while now...

>     1 bit. With BIAS_VOLTAGE_PIO_POW_MODE_SEL, banks are written at the
>     wrong bit offset and left misconfigured (for example, bank H stays in
>     1.8V mode when supplied at 3.3V, breaking RGMII Gigabit TX).
>     Adding a 2-bit variant (writing 0b01 per bank with mask
>     0x3U << (2 * bank)) enables hardware auto-detect from PIO_POW_VAL
>     and fixes 3.3V RGMII TX (also addressed in Vinicius Pedrosa's
>     follow-up series).

Yes, Vinicius did the right thing, since this patch you reply to here 
has already been merged. If you want to support his series, please reply 
to the specific patch *there*, ideally with a Reviewed-by:, or at least 
with a Tested-by.
Replying to this old patch here is then not too useful.

> 
> 2. PA has 0 pins on A733, so PB..PK are hardware banks 1..10 while
>     irq_banks = 10 maps logical IRQ banks 0..9. Without .irq_bank_map
>     and sunxi_irq_hw_bank_num() in sunxi_irq_base_reg(), logical IRQ
>     bank 0 (PB) accesses PA's IRQ registers (0xc0) instead of PB's
>     (0x140). Adding:
>       static const unsigned int a733_irq_bank_map[] = {
>               1, 2, 3, 4, 5, 6, 7, 8, 9, 10,
>       };
>     and using sunxi_irq_hw_bank_num(pctl->desc, bank) inside
>     sunxi_irq_base_reg() fixes the bank offset.

Again this is an issue we know about for a while, and for which patches 
are on the list. Please look at them, they solve this problem in a 
different way.
> Also, in patch 4/7, sunxi_grp_config_reg() takes an unused
> `const struct sunxi_pinctrl *pctl` parameter that can be dropped.

This again is an issue in a patch that is already merged. If you want 
that fixed, you need to send a patch on top of v7.4-rc1, and send it 
with a Fixes: tag, so that this can be remedied before the release.
If you just want to report this issue, do this as a reply to that 
specific patch, with the original patch text cited, and your report 
inline, directly after the problematic line. After all we have this well 
hung email patch submission system, to make this very clear and 
transparent.

Cheers,
Andre

> 
> Tested on OrangePi 4 Pro (Allwinner A733).
> 
> Thanks,
> Alastair


