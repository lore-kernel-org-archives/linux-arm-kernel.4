Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C3C606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 12:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=z0+q8lEX;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=upi0++HA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ys650cAde3Q0UZPCkuSKgdoYQBhDD7kH4x34+Y7aDk4=; b=z0+q8lEXMXcqbH
	6hFPsbJMkr/SWGwrTqFW8549nvLfv4m5h0EaUDoGoQGj0NVTxNRBbhy1EHxVzQDTGZov9ZWZmWuLR
	GLKmCqLZKZ5I7ZcfwiM2lLM3mZ0nYw50m3uJdu8v+Oz8dA+8cPGyjotu1fXjUCkv1pT20H+OWca7W
	/MAd8q3lPE8jS4JIUjReW5RVja2KKY3pGlCT8WM6Ok5fkEQuf83ktIR3cH3IZqcpUs7C5+cHgTJnB
	3+fz7OghlrzsIus7QqFbaojDYyNp1OeBrnAcw259MW8ST3CMygoxnI4nD8nCeUQmaV8pdh5xHMlYO
	mf5fkyZJeyEL8EQivqGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVStd-00000003IZk-3smw;
	Mon, 23 Nov 2026 12:11:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVStb-00000003IZ0-0Mnf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 12:11:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0F092143D;
	Mon, 23 Nov 2026 04:11:37 -0800 (PST)
Received: from [192.168.178.24] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F38793F882;
	Mon, 23 Nov 2026 04:11:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795435899; bh=IXJlhkOu02PMLJhAmFQG3suYsDUBwjTHBtjb3rIawWI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=upi0++HA2QQxKi3l/eDto4HMDostHb/auc9eIJQt4fBdzYPGzQRfCHEz+vl/NlpzT
	 lNuooRR/vLYiLvR8RrRDrnBCKnBuz4xEy5w+1cpBTy6V4FPWHFt/xLu+HwM+nvkRiQ
	 ChyjiRsOhlqi87WQfkg7lR0nkKUVgDSmKcqGVbbs=
Message-ID: <374d9bf5-5c91-4f93-aa25-f0666802e153@arm.com>
Date: Mon, 23 Nov 2026 13:11:37 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] arm64: dts: allwinner: add Radxa Cubie A7Z support
To: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
 Chen-Yu Tsai <wens@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Enzo Adriano <enzo.adriano.code@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20261111134919.90264-1-vinicius.eduardo.pedrosa@gmail.com>
 <CAGb2v66nKWdF3AvXDfb07iYVQE5FC5yDkhuutShp+Z-EgFXEfg@mail.gmail.com>
 <20261123111547.24280-1-vinicius.eduardo.pedrosa@gmail.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20261123111547.24280-1-vinicius.eduardo.pedrosa@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_041143_308902_5517EA8D 
X-CRM114-Status: GOOD (  26.74  )
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

On 11/23/26 12:15, Vinicius Pedrosa wrote:
> On Sat, Nov 21, 2026 at 12:14 AM Chen-Yu Tsai <wens@kernel.org> wrote:
>> There seem to be 3 revisions of A7Z. Which one are you targeting? Or are
>> there no differences as far as the OS is concerned?
> 
> I'm targeting V1.11, which is the board I have and tested.

I think we should aim to support both variants with one DT. I don't 
think it's nice to expect users to pick the right version. The board I 
have is v1.10, and it's about a year old. I think there is an even 
earlier batch, having been sent out in summer of 2025.

I think the DT can be made compatible with both v1.10 and v1.11, and 
probably even v2.00 later:

> I compared the published schematics. V1.10 differs from V1.11 in two
> places relevant to this DT:
> 
> On V1.10, BLDOIN comes from SWOUT2 and CLDOIN from PS. V1.11 uses a
> separate SY8089 step-down regulator at 2.4 V for both.

Both SWOUT2 and PS are always-on, and this SY8089 regulator seems to 
have no enable control as well. So the DT dependencies should be only 
cosmetic. So it shouldn't hurt keeping the regulator, just adding a 
comment about the v1.10 not having it.

> V1.11 adds a 10k external pull-up (R59) to the microSD card-detect line,
> which V1.10 doesn't have.

Argh, on the v1.10 I need to enable the internal pull-down(!) to make 
the switch work. So I guess it connects to Vdd internally if an SD card 
is in? In the v1.11 schematic it looks like D1 and D2 form the two sides 
of the switch, and the other side (D2) is connected to GND. So the 
switch trigger is probably inverted?
When I leave the pull register bits at 0, the readout is inconsistent 
(goes to high when a card is inserted, but stays there when removed).

I wonder if this works anyway with using both the internal pull-down and 
potentially external pull-up resistors? As one would win over the other?
Can you try how your board behaves with:
         cd-gpios = <&pio 5 6 (GPIO_ACTIVE_HIGH | GPIO_PULL_DOWN)>;

Let's hope this works ...

Cheers,
Andre

> So the power supplies and card-detect configuration would need changes
> for V1.10.
> 
>  From the V2.00 schematic, the parts covered by this DT (PMIC, microSD,
> LED and UART) appear unchanged from V1.11. V2.00 adds MIPI DSI, a second
> CSI connector and a backlight driver, none of which are described here.
> 
> Would you prefer keeping this DT for V1.11 (and V2.00), with a separate
> DT for V1.10 if needed, or splitting the revision-specific parts now?


> I also saw Andre's review of Enzo's v4 [1]. I'll apply the relevant
> changes to this DT, including removing the MMC alias and revisiting the
> regulator descriptions and constraints. I'll wait for Enzo's v5, test on
> my V1.11 board and send a v2 with those changes and the LED patch
> squashed into the board DT, as Krzysztof requested.
> 
> [1] https://lore.kernel.org/all/20261122003932.568c099c@ryzen.lan/
> 
> Thanks,
> Vinicius


