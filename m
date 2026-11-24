Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC97606A333
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 13:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZDxm8aW0;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y3dllRdg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=oYMA+I1ChVexlwqljAYD9stKsVlsIrLPpIr5y/H1ce4=; b=ZDxm8aW05sBjNQKvIpd3M/6Q7O
	6JjOEIBSBLLU1W/2dylZ9ABFxi+VmFGMSMgx9VGxtPMpkODmeYo6JixIYZ+AyhWFr2KApqdYm7lh0
	AG/vtu7qWf8MmhUAYgwkT+aVnXCNmHufUbt3O6HbR3zI4STjgTGCGSliWGmeM8PCLH5FWzHXfMZdp
	r5jqfgTQSvAq+q120XHqdgw5U2W5AXrpiY6Jlpm0A87PkSufdNp14Z0RHriuAkcbfce5TCst3F763
	8BfUt+ZXH9T3SqmKXgsGs4ilgjG3sKyPU+PdMkVT8L14mzHDAJcK+mFb8Dh5wp0GqeUQEEy7ec05r
	jtlnFmIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVqMD-00000006aRS-0cPT;
	Tue, 24 Nov 2026 13:14:49 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVqMB-00000006aQs-3bCt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 13:14:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4DF4C40AEB;
	Tue, 24 Nov 2026 13:14:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C6A61F000E1;
	Tue, 24 Nov 2026 13:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795526086;
	bh=oYMA+I1ChVexlwqljAYD9stKsVlsIrLPpIr5y/H1ce4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Y3dllRdgovE0K8wEwpo/avOs2CTalQOyMxfZVAEtlhIH3lg+0WU8mies1GL2FipTP
	 x8w4e/R57wOBo8oZMgyY1IdXz99YYYBcKxFxyrjPFn0S6/hZFBz/AnGfovfnzLs+aO
	 50OCr1eECbZpkmOAO4BKX02aOPxzb5nFfMWOzHxtIaxGQDPd/2R32TUD8trDK55cVe
	 IJPB2pTUlIOYUYZy1A88B1XrcGQkTbK/mY1Isd50rsFby+sQIL11huiWEEShOKzkqF
	 S4naHNjqyrrWFu2rWtAEoxKXUdfWmHplQ4JGw0bP1lbl3KTm3v9dY+m2CKkr9xM6dv
	 qlrHCDgay7rMQ==
Date: Tue, 24 Nov 2026 13:14:40 +0000
From: Lee Jones <lee@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Thomas Abraham <thomas.ab@samsung.com>,
	Chander Kashyap <k.chander@samsung.com>,
	Amit Daniel Kachhap <amit.daniel@samsung.com>,
	Tomasz Figa <t.figa@samsung.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Marian Mihailescu <mihailescu2m@gmail.com>,
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 07/10] clk: samsung: exynos5420: Terminate PLL rate
 tables with sentinels
Message-ID: <20261124131440.GG70182@joneslee-macbookpro.roam.internal>
References: <20261123164834.3330320-1-lee@kernel.org>
 <20261123164834.3330320-8-lee@kernel.org>
 <ff973b48-043c-4cd8-88fb-dc38ec54c09d@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ff973b48-043c-4cd8-88fb-dc38ec54c09d@kernel.org>
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

On Mon, 23 Nov 2026, Krzysztof Kozlowski wrote:

> On 23/11/2026 17:47, Lee Jones wrote:
> > _samsung_clk_register_pll() sizes each PLL rate table by scanning until
> > it encounters an entry with .rate == 0, then copies the counted entries
> > into pll->rate_table.  However, exynos5420_pll2550x_24mhz_tbl,
> > exynos5422_bpll_rate_table, exynos5420_epll_24mhz_tbl, and
> > exynos5420_vpll_24mhz_tbl all omit a terminating zero sentinel, causing
> > out-of-bounds reads into adjacent read-only data and populating
> > pll->rate_table with bogus entries.
> > 
> > Append a sentinel entry to each of the four PLL rate tables.
> > 
> > Fixes: ca5b40293822 ("clk: samsung: register exynos5420 apll/kpll configuration data")
> > Fixes: 9842452acd3d ("clk: samsung: exynos542x: Add EPLL rate table")
> > Fixes: 8b4a7acf7b30 ("clk: samsung: add BPLL rate table for Exynos 5422 SoC")
> > Fixes: b92981de92cb ("clk: samsung: exynos5420: Add VPLL rate table")
> > Closes: https://sashiko.dev/#/bug/linux-553831f9-0a7b-4e94-be60-222de60ca8c3
> 
> Also drivers/clk/samsung/clk-artpec8.c, artpec9, exynos5410,
> clk-exynos7885.c and probably others?

I have 43 fixes queued for clk, in all!  =:-|

-- 
Lee Jones

