Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A9B606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 14:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=k+mAqPI5;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Gztt8nYr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=2Bo4SNRejcptfdbl/T7ioVzGH9ExfpssBlBBB+Y7ODI=; b=k+mAqPI5EbS+emB01EF1+2LjFQ
	oIaqmUO0K7aVJZgYFaHNvIe5kNcVR1Nv289ivpNvHb2EfXbW5YuDMPG1AlSRRPM9uQPXayXiGTexN
	F8oByit0YhZZPtmNwjuLAdntXAkrzfOwZL76vMz7DQuOOirm9VIiatOdQI10y791WXya09wDwuK95
	hsIHivn/0aHd8zOi3rAAbRCq5+MJDDiKDrDe9UQYeWFF1hd8O0tQpjgpKmamoNNjwKEVd94JpiPNx
	LpTFQY9hgT4Qrtgo3gyLtP1bEpnO71jBTvgVKzijok5H/lNbPHEPiFxr1RXJL57TxFWPOYv8TiM9W
	8NDyXsuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU3Jp-0000000CFlJ-49yL;
	Thu, 19 Nov 2026 14:40:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU3Jo-0000000CFl5-3Err
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 14:40:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 855F643D46;
	Thu, 19 Nov 2026 14:40:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 409D41F000C4;
	Thu, 19 Nov 2026 14:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795099256;
	bh=2Bo4SNRejcptfdbl/T7ioVzGH9ExfpssBlBBB+Y7ODI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Gztt8nYrDs5jwVfu1xBiUfW04Xw8Gr+ccPbNaPLA3Sbx9zr9SsyvjOheo+PHTFS6b
	 pPPwotwBfj2kw1J9fld9CKOmyJl/gZeKxkJnMp9npAF0BqfVA5p4wI22vPKu6UyrMs
	 FF1nTsUYeBBWw0XOELmSTR7KLnWiarMpo/XQt1MD0d4B5Z5x7rM+ClCkHpMXH+oe00
	 zFdpDoEOI2AlOcZAihJ1C3KKYVlsP9zje+Pt/ZVRffzWq6WeX5/M1FTCIzGD7wyt9p
	 sfB9X4WLU8v9wraO6Wevl+uBg9eJ5dTDY3vEM27+xi8waS0yJcgTt4LuvE57bsZ/1P
	 rQWEBmLAYKSHg==
Date: Thu, 19 Nov 2026 09:40:52 -0500
From: Brian Masney <masneyb@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Long Zhao <longzhao@ambarella.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
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
Subject: Re: [PATCH v12 0/6] arm64: add Ambarella CV75 SoC support
Message-ID: <av8KdBCzXLeNE0BX@x1g10>
References: <20261119-cv75-soc-v12-0-e5a03cca8b05@ambarella.com>
 <1148990d-dfa6-489d-99f8-4bf4417b2c4c@app.fastmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1148990d-dfa6-489d-99f8-4bf4417b2c4c@app.fastmail.com>
User-Agent: Mutt/2.4.3 (2026-10-09)
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 19, 2026 at 03:18:26PM +0100, Arnd Bergmann wrote:
> On Thu, Nov 19, 2026, at 11:13, Long Zhao via B4 Relay wrote:
> > Add the Ambarella CV75 SoC and EVK support: the board binding, the
> > RCT clock binding and driver, ARCH_AMBARELLA, the devicetree and
> > MAINTAINERS.
> >
> > Apply the patches in this order:
> >
> > 1. board binding
> > 2. RCT clock binding and clock ID header
> > 3. ARCH_AMBARELLA
> > 4. RCT clock driver
> > 5. CV75 SoC and EVK device tree, plus defconfig
> > 6. MAINTAINERS
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
> 
> I merged this into the soc/newsoc branch now, which may get
> additional SoCs from other vendors for the merge window. This
> should be in linux-next starting tomorrow.
> 
> I also pushed the contents out in two branches:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git/log/?h=newsoc/ambarella
> 
> contains all six patches, while

I pulled the branch with all six patches into clk-next.

Brian

