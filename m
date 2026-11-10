Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44F31606A335
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 12:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uPKNcnRi;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xfbc4F3R
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=LL088vvOh6sCBfd/LnyaL4FRMTZvCBi1FWJIhdFJWI4=; b=uPKNcnRi22ZWorA9nUU4X8t+gB
	penBHsaJcc7E1UJ52PMqQcboMROSJSMsicKFp3cNp6DAMN8qLodIcOZCZunpOIriTaGY4xoOJim0d
	HCluLGPWucEL7iuXysTRu+KKCfw5l98JmlVrf1EbZe/BgVzOIkUlrbZBwm/icrgV7Vro3pLvm+7/w
	DXa9rvuiwyPuD659DqwFDrTulrG8bu6EMPOjjiwk9v6ZLfi3RyInl/hK+enniwswGNKoH3C5RRFVD
	YL6Z3oPMh0/fynUFnVpkECCm3M5VUTdf/JfryQT0WFAHViSye7PwJvHQbVbYNEk0XFP5bYFkoW9gV
	gyUqI3Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQktk-00000003pgc-0jau;
	Tue, 10 Nov 2026 12:24:24 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQktj-00000003pgU-0QEm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 12:24:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B757247150;
	Tue, 10 Nov 2026 12:24:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5A5E1F008A5;
	Tue, 10 Nov 2026 12:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794313462;
	bh=LL088vvOh6sCBfd/LnyaL4FRMTZvCBi1FWJIhdFJWI4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Xfbc4F3RjRSXIrNUyLL2NbxzuNH5ng7v0WWr3KxmWgCMx5Nf8sApnL5Sjxz3vPEs4
	 0el6E7b6RZ/g58jz9Sw9socXPiS9VavINGXvyMl4iqbf8m7rTLdzVKPgRPGFDZiOaj
	 bi4EapaiJwxvIT/WfkHJmq3NKL2f5oaAvkhXmCPNBctrI0bhvU7KOPXPj6+QqTFF4a
	 +EDM2N2q8a+2KYSOO1eyr8IWy0hGmr2msM/uD4K2PucFQcVD5mnVGgwliVIMNaNbX6
	 i7skrT+s3oTEcjW31S9+Ni/2QBrldxdqO5sKAT4MlCwMd3huCIIzJp57yBWD74ZCJ3
	 U50ex3AEIpkFg==
Date: Tue, 10 Nov 2026 07:24:19 -0500
From: Brian Masney <masneyb@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Long Zhao <longzhao@ambarella.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Jerome Brunet <jbrunet@baylibre.com>, linux-clk@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, devicetree@vger.kernel.org,
	Long Zhao <zl020895@163.com>, linux-kernel@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH v11 0/5] arm64: add Ambarella CV75 SoC support
Message-ID: <avMM8z-LYncKS8ip@x1g10>
References: <20261105-cv75-soc-v11-0-aa6ee0b2380d@ambarella.com>
 <179427375370.1061670.4050288038934218487.b4-review@b4>
 <20261110-interesting-hilarious-shark-2dbfc0@quoll>
 <7eeaf54d-2d7d-420c-a34e-eebc6dd0effe@app.fastmail.com>
 <bbc16906-45e2-4d81-ae81-ad93e87b13be@kernel.org>
 <c67939c7-9725-459e-97dd-e104f3b14022@app.fastmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c67939c7-9725-459e-97dd-e104f3b14022@app.fastmail.com>
User-Agent: Mutt/2.4.2 (2026-08-30)
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

On Tue, Nov 10, 2026 at 09:46:29AM +0100, Arnd Bergmann wrote:
> On Tue, Nov 10, 2026, at 09:27, Krzysztof Kozlowski wrote:
> > On 10/11/2026 09:23, Arnd Bergmann wrote:
> >> On Tue, Nov 10, 2026, at 09:02, Krzysztof Kozlowski wrote:
> >>> On Mon, Nov 09, 2026 at 08:22:33PM -0500, Brian Masney wrote:
> >>>>
> >>>> - I create a new shared immutable branch based on v7.4-rc1 and I can put
> >>>>   the first two dt-bindings patches in that. I merge this into clk-pile
> >>>>   (feeds clk-next) with --no-ff. The DTS folks will merge this immutable
> >>>>  branch as well.
> >>>> 
> >>>> - I can then merge patches 3 and 5 into clk-pile.
> >>>>
> >>>> - The DTS folks will take patch 4.
> >> 
> >> If the clk driver is required to boot, I would
> >> suggest having a branch with the two clk patches that
> >> can get merged (not applied) into both the clk tree
> >> and the soc/newsoc branch to put the other patches
> >> on top.
> >
> > There is a build dependency - DTS needs clock binding
> > header - so it has to be second, unless the dependency
> > is decoupled.
> 
> Ok, I see. Let's go with Brian's suggestion then.

I see that the pinctrl driver was merged into v7.4-rc1 and also
lists ARCH_AMBARELLA. It doesn't cause any build warnings or issues, so
I'm fine with this too just as long as ARCH_AMBARELLA is going to appear
in the tree.

I'll make shared immutable branch with the dt-bindings this evening
my time. It'll be fine for patch 4 to go through the DTS tree.

Brian

