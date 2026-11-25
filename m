Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41B01606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 21:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qDh4Gj+8;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ws6tXbXT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=PXBgJMIY+nvFjiJk/u8SJDhKaneIc4smuRh4J/SjTx8=; b=qDh4Gj+8XkZRB36vdoge4mbxU3
	HRgt5EDj9HsCnrAQ4Zs3Kg8OzDUfOuMm96Ug1GiMgAYv/i3w709ZVNalXZsgPQEzeL7YXpJWl+3QT
	bWQUGJDhRymNp/ye0yOGUzijksFyfiHZzfVaReYIGSNHwu3XzhNa/aDB0+mA7XRhF6AreZJ042ICw
	lp1Sd1Rjj2gghFu1lgpkQUfM4MW8DQhD24CQzBgzSWVy7AnpxIQF43FvUaO4nZIUzW6ee7gjl3Uus
	GLaakjGrDw374ZDf9ZrmxT+XqGA9TmNHGpoBR3O+UAh10rFFAjhxceLrtvtXIQnSeStpCIDqLM6T8
	dEMI9IRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWK5N-0000000BKTV-00I1;
	Wed, 25 Nov 2026 20:59:25 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWK5I-0000000BKST-3Mws
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 20:59:22 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-6b8815693e2so7219709a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 12:59:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795640358; cv=none;
        d=google.com; s=arc-20260327;
        b=pi4qpih2SHZkDeRCo1+gNPI6UByexx6nC/Q5KcVrBDk/UDzBXcYFjkr2wrfrvMk1Ta
         2fn/4c5gA6enktE1XjpyUmQSmfunLJdOQy7qxCAKBM9xPbAy6t0xjzlo+8drlYdGl9/m
         SVOIIzyCQoz945t6Us7jkpEkIgF1StMojfVt3IFE9HD5kGlq+BrNG943O0Se8damEN26
         rXkzzbVgWAqWy4rtVq/GgTItn/EHnNka9PPd2jCsaeUHDsQFztL8tlklqL4J3ojUJgek
         EltLWa9AB/ybZBvswEFoPnGLxXroreWDFqJp4jxDhsrNRrR6+usCmSA4GhSmC0bkjfd0
         vY4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=PXBgJMIY+nvFjiJk/u8SJDhKaneIc4smuRh4J/SjTx8=;
        fh=Wr3qoRFp7wLjW+ybgecuWpsdfEMv5zskj9k/etD14Ck=;
        b=idWs0n5BDRplpyEQwVC7WoO2tJWVLXeIUXgXrvSQZ7GBQ3f6I8H8LfcmKzZrWJo25t
         FvNTUZjayjvs1cLsx1vvEYABqZBxrtFbNi2wpA5n9TU/oLbyTqOv9bcIopziFHTegFEb
         DFPzZKbDI4LRI5pHXS4gJyGFOVsuPASp2lHl22XTUGZpu+2abD/pHaDmYz6u6Zu3QgJk
         ckaFHg1LPFZMCxOdkO87nPM4hXRkt98MF8nfD2UgXbu1ykM0XwY6ipqsY7wWt2WMnVAj
         uQxcKwAxJa9pPn6Z30zglKYeFy+jOXOzmCbZNwee3fHXgG0JMZXkgnSzuqgdk3iYLQp9
         mszw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795640358; x=1796245158; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PXBgJMIY+nvFjiJk/u8SJDhKaneIc4smuRh4J/SjTx8=;
        b=ws6tXbXTjVRMcazpzCfODa5rS0PIByKp891wZsQKYCc+XQIQWXjUZp9+x5Q3S5x1de
         YyQrYMaFTTmf9FN34nQlecwIGwKYp5r1LEBncIAiKl2rKemgyZ4NSE924MC1oHlgJhDp
         ZwrK2768TfsEcf/eaBSkN88rgmMpuCkvsWYBUtBPxrWp1Cjtj/6MqE0fJdQWvOXVQImj
         a5pJPjSMzzBxk+JH1r4a38/+X0fOw/Ukld9XgYZr7YOur6TK4CnrZUq4JaoIHpHNYkOc
         ym4Z0Ja7/V8pQnD3TGtR0DSJrqqEz9S4Q+7y/jIIRPvKulaHt7E0aocHkas0Z84mwbWh
         WtDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795640358; x=1796245158;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PXBgJMIY+nvFjiJk/u8SJDhKaneIc4smuRh4J/SjTx8=;
        b=FEcP0JOeWtPRpfPm4pESPfbZlifWKrT9UsGJkJw7T/tQckMTSVrSBTg+BtWifPdWyW
         XUBPdS8esJt7xeb8zBGfvM2GT21nKufM/bujc6SfCfdH7oQ9SScOCFsA4PsiYvYoConJ
         fyRHVzsKvSkuKQvbyDxPIFboDUxKE4SS9Dem4awgizIQ2D+r1FUaDgYdSCLe7HuOOWU5
         CfuSkLUDXfNimPFMG3F5uUrGxeMOUCbp9J+FKbcII48aZSJ80HcOUrKIbHH6ZbykoIYn
         s2l+LziQz7/jc0+L9kaeeC479ge/6U385+EOCJq0BrCRmaNoq3a3gfnpbVjUw6gExDD4
         8aXA==
X-Forwarded-Encrypted: i=1; AL+hErEHDNpq6LBB3P9hBuZy7Ro+ZsOqjDLA5emNnil51qBqvm8FX6/I2xwnqFsz0kZJXjFc+jCgufiz9IxZgCX6f6a5@lists.infradead.org
X-Gm-Message-State: APuU4Z82EGjJ/21TXQwnUPHXdv8hlp0AOIyHumaaLmOAT/oo53SAXwSa
	nD5N6IVarSjeiXPpDSeV3HxPxJVj5vWNjgTZ6c/b50ZUHurHqsdzrwTA1nvoa+X2lnNW0IBcr4H
	xL3AkvtLkALXkR8q+eB0BC0T4jBHPHF4kaVeVPPCjRA==
X-Gm-Gg: AZFdTZcm/7k4+OQ/gH5mkFHxPDvgWC9fcCUkaPSK/bZMllT8dNKOitUPZO6ipqtF5m+
	hRwfNvWCV3YIevxomBgvBWtUXc3NqaaeI9lDsD6izZ5+V0EWZkuw2gLcSIM3yiFfiDHBE8gdMuB
	rl8rO5MN0XD00bCzAhZK02D6/ga2RTrkby0RBxrGvmm6LnUKXZTAHe85UlNlk+OorXex047HN0b
	pA9dseqG4EqvgDHPXlUFXWqOhKkjCfpHa4w2PRZPtPBFpV0saXtf9j2ZlfrUYqsFp/A/FUh9V7L
	G1kCpKUI0jhY+Ep7n0KK/HOTxDm3tmnXUBC6xOZSgAfwA8z1PuXS9plAJCH0sfA8aMiu+JdEhlf
	uuJiJp2x3I7QJSDlsXxS6OqfB7w4YaLQSw++dPXkTNkC0ak8kslKAggkKjiHTWrVRVaWSrSc=
X-Received: by 2002:aa7:cf85:0:b0:6b1:a509:875 with SMTP id
 4fb4d7f45d1cf-6ba37e66febmr9344235a12.20.1795640358409; Wed, 25 Nov 2026
 12:59:18 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261123164834.3330320-1-lee@kernel.org> <20261123164834.3330320-8-lee@kernel.org>
In-Reply-To: <20261123164834.3330320-8-lee@kernel.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 25 Nov 2026 20:59:06 +0000
X-Gm-Features: Aa3M54qBKC7-tr-B2jw-93nT_AW_sr-oGI0v4yuTHgh0h7sm-7QQngWZhmScpnM
Message-ID: <CADrjBPq2OmgLjzs8qYybQSKRDBC5QK5DTrO8Wy4gbUoo0Ydu6g@mail.gmail.com>
Subject: Re: [PATCH 07/10] clk: samsung: exynos5420: Terminate PLL rate tables
 with sentinels
To: Lee Jones <lee@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Thomas Abraham <thomas.ab@samsung.com>, 
	Chander Kashyap <k.chander@samsung.com>, Amit Daniel Kachhap <amit.daniel@samsung.com>, 
	Tomasz Figa <t.figa@samsung.com>, Lukasz Luba <lukasz.luba@arm.com>, 
	Marian Mihailescu <mihailescu2m@gmail.com>, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_125920_912875_D6264664 
X-CRM114-Status: GOOD (  18.52  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 23 Nov 2026 at 16:49, Lee Jones <lee@kernel.org> wrote:
>
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

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  drivers/clk/samsung/clk-exynos5420.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung/clk-exynos5420.c
> index 400a5c59815c..35baeabf3ccb 100644
> --- a/drivers/clk/samsung/clk-exynos5420.c
> +++ b/drivers/clk/samsung/clk-exynos5420.c
> @@ -1419,6 +1419,7 @@ static const struct samsung_pll_rate_table exynos5420_pll2550x_24mhz_tbl[] __ini
>         PLL_35XX_RATE(24 * MHZ, 400000000,  200, 3, 2),
>         PLL_35XX_RATE(24 * MHZ, 300000000,  200, 2, 3),
>         PLL_35XX_RATE(24 * MHZ, 200000000,  200, 3, 3),
> +       { /* sentinel */ }
>  };
>
>  static const struct samsung_pll_rate_table exynos5422_bpll_rate_table[] = {
> @@ -1430,6 +1431,7 @@ static const struct samsung_pll_rate_table exynos5422_bpll_rate_table[] = {
>         PLL_35XX_RATE(24 * MHZ, 275000000, 275, 3, 3),
>         PLL_35XX_RATE(24 * MHZ, 206000000, 206, 3, 3),
>         PLL_35XX_RATE(24 * MHZ, 165000000, 110, 2, 3),
> +       { /* sentinel */ }
>  };
>
>  static const struct samsung_pll_rate_table exynos5420_epll_24mhz_tbl[] = {
> @@ -1448,6 +1450,7 @@ static const struct samsung_pll_rate_table exynos5420_epll_24mhz_tbl[] = {
>         PLL_36XX_RATE(24 * MHZ,  49152000U, 197, 3, 5, -25690),
>         PLL_36XX_RATE(24 * MHZ,  45158401U, 90, 3, 4, 20762),
>         PLL_36XX_RATE(24 * MHZ,  32768001U, 131, 3, 5, 4719),
> +       { /* sentinel */ }
>  };
>
>  static const struct samsung_pll_rate_table exynos5420_vpll_24mhz_tbl[] = {
> @@ -1459,6 +1462,7 @@ static const struct samsung_pll_rate_table exynos5420_vpll_24mhz_tbl[] = {
>         PLL_35XX_RATE(24 * MHZ, 266000000U,  266, 3, 3),
>         PLL_35XX_RATE(24 * MHZ, 177000000U,  118, 2, 3),
>         PLL_35XX_RATE(24 * MHZ, 100000000U,  200, 3, 4),
> +       { /* sentinel */ }
>  };
>
>  static struct samsung_pll_clock exynos5x_plls[nr_plls] __initdata = {
> --
> 2.56.1.750.gf70dc682cf-goog
>

