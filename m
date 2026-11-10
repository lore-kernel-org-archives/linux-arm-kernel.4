Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB5BB606A321
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 08:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WNQSm+Cd;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PpHULgDq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=AzlN3AkWLSdBc/kc/1UhObJxFo1YqRiElThcXbSlnv4=; b=WNQSm+Cdg7wWAZ+Q7yP0ytfhUD
	x3ZhqSoFuyd1ZEbr8VkamEtBmzUQc9Dlb6m0S3EsMeH0cyuuBzWFWiXf85HpPsRbkzPOwFxjOdrM/
	uiJvhlMk3vwpIWQARY3V0JxvjLbcf9hYg4aSLSsmK+YKY4EX+6sFqAYcrQ6xL0n8Jb3oWxvpomrqe
	5mQq0vGTR3VpYffioc3Hb6nYUpsAjP8LkMspBYzSAlp8BRqhlyOiMXnaBWM/b7SvIUdzrwBYntuXn
	+VIrFmY42Lr9jVyWXYR7IA6gq9t19X38U8SvCkXv5rQ3wDeHoUJ8KzkOUfGJxpkCkpvfAFa3dPTCl
	nutPURNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgoV-000000032nQ-2BO9;
	Tue, 10 Nov 2026 08:02:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgoT-000000032nE-3adY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 08:02:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2744161182;
	Tue, 10 Nov 2026 08:02:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5FD11F0089F;
	Tue, 10 Nov 2026 08:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794297759;
	bh=AzlN3AkWLSdBc/kc/1UhObJxFo1YqRiElThcXbSlnv4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PpHULgDqTzaVRk0Nu1guUJ2j23qbcgjmANz6xf/JOk0W/5JVWYmzaruYC7Qe1IPN4
	 gQMwf+8mAi8PgW+yVkBwV9r7sb89Y80WAEV0W5883zHElDUGBX9H/5zQ+QDrB+7Oso
	 PjlziCDWwZtAY2s+g+H7ZwTUmTfztk0VjDpTe0CLB8vjTunkumSXpxLT5O0q5AmP4P
	 vk7MrPguUM4hF1g4/rh8Pg4El6mjBVmjGdnpG2pHGGCQOnFvhzXEGDvQesEm4XIm9o
	 I8PXyFMxykxnpw7p8w7vZxDrp+Ec9pre4WHpbMsRZWZ6lkItiLSDpafwr4iDKlIPiE
	 aqpS8iqRZRrJg==
Date: Tue, 10 Nov 2026 09:02:35 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Brian Masney <masneyb@kernel.org>
Cc: Long Zhao <longzhao@ambarella.com>, Arnd Bergmann <arnd@arndb.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Jerome Brunet <jbrunet@baylibre.com>, linux-clk@vger.kernel.org, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	Conor Dooley <conor+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, devicetree@vger.kernel.org, Long Zhao <zl020895@163.com>, 
	linux-kernel@vger.kernel.org, Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH v11 0/5] arm64: add Ambarella CV75 SoC support
Message-ID: <20261110-interesting-hilarious-shark-2dbfc0@quoll>
References: <20261105-cv75-soc-v11-0-aa6ee0b2380d@ambarella.com>
 <179427375370.1061670.4050288038934218487.b4-review@b4>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <179427375370.1061670.4050288038934218487.b4-review@b4>
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 09, 2026 at 08:22:33PM -0500, Brian Masney wrote:
> Hi Long / Krzysztof / Conor / Rob,
> 
> > Add the Ambarella CV75 SoC and EVK support: the board binding, the
> > RCT clock binding and driver, ARCH_AMBARELLA, the devicetree and
> > MAINTAINERS.
> > 
> > The clock ID header is added before the devicetree that includes it,
> > so patch 2 (the clock binding) has to be applied before patch 4 (the
> > devicetree).
> > 
> > The ambarella vendor prefix and the CV75 secure scratchpad syscon
> > binding are already in linux-next. This series does not repeat
> > either of them.
> > 
> > GPIO, UART and pinctrl bindings and drivers are separate series.
> > This devicetree references those compatibles.
> > 
> > Tested on the CV75 EVK. The board boots. That boot used a local tree
> > that also includes the GPIO, UART and pinctrl patches.
> > 
> > To: Arnd Bergmann <arnd@arndb.de>
> > To: Krzysztof Kozlowski <krzk@kernel.org>
> > To: Alexandre Belloni <alexandre.belloni@bootlin.com>
> > To: soc@lists.linux.dev
> > To: linux-arm-kernel@lists.infradead.org
> > To: Michael Turquette <mturquette@baylibre.com>
> > To: Stephen Boyd <sboyd@kernel.org>
> > Cc: Jerome Brunet <jbrunet@baylibre.com>
> > Cc: linux-clk@vger.kernel.org
> > Cc: Brian Masney <masneyb@kernel.org>
> > Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Cc: Rob Herring <robh@kernel.org>
> > Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> > Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> > Cc: Conor Dooley <conor+dt@kernel.org>
> > Cc: Catalin Marinas <catalin.marinas@arm.com>
> > Cc: Will Deacon <will@kernel.org>
> > Cc: devicetree@vger.kernel.org
> > Cc: Long Zhao <longzhao@ambarella.com>
> > Cc: Long Zhao <zl020895@163.com>
> > Cc: linux-kernel@vger.kernel.org
> > 
> > Signed-off-by: Long Zhao <longzhao@ambarella.com>
> > ---
> > Changes in v11:
> > - clk: use builtin_platform_driver(). The Kconfig symbol is bool. (Brian)
> > - clk: drop CLK_IS_CRITICAL from the core PLL. It has no enable op. (Brian)
> > - clk: drop the misleading (u64) cast in the div_u64() call. (Brian)
> > - clk: add .suppress_bind_attrs = true to block sysfs unbind. (Brian)
> > - clk: drop MODULE_AUTHOR. (Brian)
> > - Link to v10:
> >   https://patch.msgid.link/20261019-cv75-soc-v10-0-d386065e2dd5@ambarella.com
> > 
> > ---
> > Long Zhao (5):
> >       dt-bindings: arm: add Ambarella CV75 platforms
> >       dt-bindings: clock: add Ambarella CV75 RCT
> >       clk: ambarella: add CV75 RCT clock controller
> >       arm64: ambarella: add ARCH_AMBARELLA and CV75 EVK DT
> >       MAINTAINERS: add ARM/AMBARELLA SoC support
> 
> The clk changes look good to me.
> 
> Before I start to merge things, and since I'm a new maintainer here, I
> just want to make sure that I am doing this correctly, and have the
> expected merge strategy for everyone involved.
> 
> - I create a new shared immutable branch based on v7.4-rc1 and I can put
>   the first two dt-bindings patches in that. I merge this into clk-pile
>   (feeds clk-next) with --no-ff. The DTS folks will merge this immutable
>   branch as well.
> 
> - I can then merge patches 3 and 5 into clk-pile.

You will have code depending on non-exisitng ARCH_AMBARELLA symbol, but
if that's fine for you then sure.

> 
> - The DTS folks will take patch 4.

The entire platform is for SoC tree. This sounds ok for me, but I am not
sure if Arnd was merging pulls with dependencies. If not, then worse
case the arm64 bits will wait a cycle. Anyway, I guess you can take
clock bits.

Best regards,
Krzysztof


