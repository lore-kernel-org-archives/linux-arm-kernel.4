Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1288606A333
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 07:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jw8GNOZj;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EmnxEBiQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=4YyEWwAkCQU+bFSGO99qgS4Bf2a+9peUpz7t0o/uWGE=; b=jw8GNOZj0bnSxJ
	n8zcUihA1gAv+8shRUgEPCs1Bv4qPiaKTnFVNvbTfuJ64sdjH1+9vGohMwaOdI4Pp3EhfbgIog1ww
	HPhKEyDPcsi3DW4k+Gcnfgrpp0efoYNdTLUmvwA0ql2vkdqUB2qZPPwL/m6Qo+9QolKKYfMhPKFua
	uJl3fbJZm9GusjALqDVWebjQwk2ewgcZ8VZEgURYwJzyjH9kw9x8XyDM4YC+/WBvsUUIkVhl6HFyh
	bY3R7rcqsjuCHMEtFaYHFIdUCMoIeBiVQeXlKKjOYg5yt3eIaIdHnDuAmI39v7fREeOSXG2rWVpQq
	NzpWNfCXx02b2fV8BmSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWTe5-0000000CFtw-3yWj;
	Thu, 26 Nov 2026 07:11:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWTe5-0000000CFtf-1Hx6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 07:11:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C41D543EBF;
	Thu, 26 Nov 2026 07:11:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 247671F000D2;
	Thu, 26 Nov 2026 07:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795677112;
	bh=4YyEWwAkCQU+bFSGO99qgS4Bf2a+9peUpz7t0o/uWGE=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=EmnxEBiQ2we8OzqZSSUpuEIO00yeED7qfKBz7UYPbFY1VeUVc6EPIae2wwJbIamBP
	 hsGAerkUoYPIC2tpHu80+9l9MufpHAlp9RPJ0hcvleJe+v7uDzB6bhnB5Kul5aL4uk
	 hgKXpV0OSsQKhMunlU/5XLrtjy9IWeto8hzJL9DppEl0UZsOY/79Gg6xL7Rtg30rGD
	 demWXX4eczRRkAoisvA8lkKM9GX+c7rZOELcjsJ485j5234h5gHVpkL28DQsdqcblc
	 iO8ceRNxm22qrTd7U+L93JEWMBK2c95sTIlngtQwIqFiXYM88xeSZlBCEQjdvMh6LJ
	 z5752lLHGObWw==
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 07/10] clk: samsung: exynos5420: Terminate PLL rate
 tables with sentinels
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Stephen Boyd <sboyd@kernel.org>, 
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
In-Reply-To: <179567696129.9086.5750343229179878451.b4-reply@b4>
References: <20261123164834.3330320-1-lee@kernel.org>
 <20261123164834.3330320-8-lee@kernel.org>
 <179567696129.9086.5750343229179878451.b4-reply@b4>
Date: Thu, 26 Nov 2026 08:11:49 +0100
Message-Id: <179567710988.9086.18307051341647082138.b4-reply@b4>
X-Mailer: b4 0.17-dev
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-11-26 08:09:21+01:00, Krzysztof Kozlowski wrote:
> On 2026-11-23 16:47 +0000, Lee Jones wrote:
> 
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
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Lee Jones <lee@kernel.org>
> > ---
> >  drivers/clk/samsung/clk-exynos5420.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Actually let me just grab it and I still wait for other files as well.

-- 
Krzysztof Kozlowski <krzk@kernel.org>

