Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E01D2606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 07:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=D8RjO+Vd;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mCwJGwIW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=jwb5N7uyT2WDq4mt94dsR2bTDs02PiJrxSo0w40YZbI=; b=D8RjO+VdQ9DAyL
	iuEyTt+QsN9GbTXQpmrnByBEep+y8dxldBAO2Y8iEktQCZmV12PEHYbMVXZUYDfgo4ofpCGvUmGvK
	D8BfzqO3pnb7Z2xmacoBlzDP+7t/B5J9d4+4In6j0LkT8LPSf+wWuc4Y6D1ZgV1qvIGp8RAkTJOS2
	XzjGgC2llzblnIXD1yWF8VNfbbiL+VJZyZXDB6dhVWJxVZrQcpJUSA/yTDiVDsfxB3TC0i/d9R0LU
	Ng07CK5LUv2fNSXjmnpko9msEpZ64KZP90OWcaUrhDyjfyTJUvrtMDb8pkj+gbglmpKMGMMWR7Qq/
	J5R1VWK3kcWcrxBy5udw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWTbi-0000000CFb1-3wnU;
	Thu, 26 Nov 2026 07:09:27 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWTbh-0000000CFas-3Ekd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 07:09:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CC88C60619;
	Thu, 26 Nov 2026 07:09:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE5EC1F000C0;
	Thu, 26 Nov 2026 07:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795676964;
	bh=jwb5N7uyT2WDq4mt94dsR2bTDs02PiJrxSo0w40YZbI=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=mCwJGwIWKvzK5Z8LSs1t9rcO+i7vyCTE2UxjxEobI+80N9ZySQU06hNNVBR9amkph
	 OufZrL59lQtB8JPQoCIwOSZrpK4kOX9JZ2Sl5g1jVk3C3nK7/wq6RXAy0+5aOa4/De
	 XsW7wvdjh8auzT6rnFQNNWP+92RNGkNHQec0Wqi8DRKsKKqf+8SnutKR+AiZWoov8Y
	 fzCaW2UeR3nxd3KXKuz7nmaYwQEKxcfWZQF620tL0fpXwfrEdnYh5lSIWNOtgnKS9i
	 ETdBDVXSQnbzBqOaOBY1ZDKeLP44/1t1sRjXqioEf2mbMZqCOzftLSS0Jl4ZeMQhio
	 a7jyskB4454wA==
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 07/10] clk: samsung: exynos5420: Terminate PLL rate
 tables with sentinels
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Lee Jones <lee@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
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
In-Reply-To: <20261123164834.3330320-8-lee@kernel.org>
References: <20261123164834.3330320-1-lee@kernel.org>
 <20261123164834.3330320-8-lee@kernel.org>
Date: Thu, 26 Nov 2026 08:09:21 +0100
Message-Id: <179567696129.9086.5750343229179878451.b4-reply@b4>
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

On 2026-11-23 16:47 +0000, Lee Jones wrote:
> _samsung_clk_register_pll() sizes each PLL rate table by scanning until
> it encounters an entry with .rate == 0, then copies the counted entries
> into pll->rate_table.  However, exynos5420_pll2550x_24mhz_tbl,
> exynos5422_bpll_rate_table, exynos5420_epll_24mhz_tbl, and
> exynos5420_vpll_24mhz_tbl all omit a terminating zero sentinel, causing
> out-of-bounds reads into adjacent read-only data and populating
> pll->rate_table with bogus entries.
> 
> Append a sentinel entry to each of the four PLL rate tables.
> 
> Fixes: ca5b40293822 ("clk: samsung: register exynos5420 apll/kpll configuration data")
> Fixes: 9842452acd3d ("clk: samsung: exynos542x: Add EPLL rate table")
> Fixes: 8b4a7acf7b30 ("clk: samsung: add BPLL rate table for Exynos 5422 SoC")
> Fixes: b92981de92cb ("clk: samsung: exynos5420: Add VPLL rate table")
> Closes: https://sashiko.dev/#/bug/linux-553831f9-0a7b-4e94-be60-222de60ca8c3
> Cc: stable@vger.kernel.org
> Signed-off-by: Lee Jones <lee@kernel.org>
> ---
>  drivers/clk/samsung/clk-exynos5420.c | 4 ++++
>  1 file changed, 4 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

-- 
Krzysztof Kozlowski <krzk@kernel.org>

