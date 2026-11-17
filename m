Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF83606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 05:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kmEGkvCn;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=LiIb4hrG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=cFIGFgrqmh7vJ8p05TfgpCv8oubT+IqY4VjNLXb1IxQ=; b=kmEGkvCntN9eJTf9pD1EjGxP+a
	+FaJeVrBXlT/sQgMU06ueu/xgn8Zh/l5x+e1dffF8NSKQBAAMs3IDtLFXj+uXQYw+v3NSRez2Dx8N
	TgB2D4zZAD5DO78dFKIULfGDktymM0TEyxRwqIfbdm00mAetZv9ZiieND5KLgvjlFLQSR3OQD5wGs
	n+HK3sD+JAgJpsw7rEJfAx14WvCfW0aTVOHcTrOBb6IIdsgK5+KLZMFClh1jQD9ojQ/qgR5TpulLX
	HJ0eY+3+S+xTSaTTe55sN2zMrTsddpIM1yXVxMswQ5DeC4xa7ZBIpzobfCCj8rg/ZIeLzw2z+8po4
	9zXpjM9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTBU2-00000004aMv-1OxJ;
	Tue, 17 Nov 2026 05:11:54 +0000
Received: from mail-dl1-x122b.google.com ([2607:f8b0:4864:20::122b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTBTz-00000004aMZ-2FlT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 05:11:52 +0000
Received: by mail-dl1-x122b.google.com with SMTP id a92af1059eb24-1a2af4c8d00so8824737c88.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 21:11:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794892310; x=1795497110; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cFIGFgrqmh7vJ8p05TfgpCv8oubT+IqY4VjNLXb1IxQ=;
        b=LiIb4hrGfLS5hqvJjBPs2GFUZP8qSLXVxVxF37HLrULoR7TazHgNBrYfPDFmuGVszq
         5K6iNfGkWDdUm5m78TG8j8mx23DWEH/og2VEOkTHR8CKpbfgPTTSTw+nbfdypgeihesc
         ZG5TMVea0VwOLAL1bZ3yyz3vzq+Z1+yfnjx9fi1aiqFZRplO4pi/zXL4hvN9m8vnIBnt
         JOyZqt62yf131qBodCPvXb8tSnFK60H1ZtzwCuWd9G5av3UBsoVvFfFLQJn53E+sD1Fa
         RpJCz7o8s1x/TY5eekLkn3b3dtB8nXjLln/RqDN1g7KcOIOk8kbvVfMqHzQdVjIAs0bC
         /KcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794892310; x=1795497110;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cFIGFgrqmh7vJ8p05TfgpCv8oubT+IqY4VjNLXb1IxQ=;
        b=vQnFKRoUy/HibboCe29mQ4IDnls9e/bD7BgVujEUNUQ/4ogfTQWAe6kF4ZPEvYnSyF
         otS6A6UslxqIAe0dURN3iJs6JTAL0zhr9/etiikodEGqllQUBJL/I6oRNZRNcZrkqNeo
         MG0wQ+JqThCRUG1JD5nsJO63NgulMfvUEbNgNZmfzxaUJJ/FIIZvTU/sT/l3lLQZJhR8
         1FhelkxOE7a9exz1usB0QvgGLl7X3Ngg4lrFa4i1sHNCFQjefpfdY2a/Db0yXZ+ueZUQ
         lJCMx8IVOHRuBG+sky+1uVSW0CuQZ2vyKiOVdBVYFo1e+WKBDZKYibl3jhjsRaXvrQCH
         Q+SQ==
X-Forwarded-Encrypted: i=1; AL+hErEJfuZ9iC9xq4PE61z8EkCso9OSzEHPMJCo1JqAV6khiEDNOTnEp3f9YmFMIijCg0xQ0btc3dacv2Kdg8ZU06Yu@lists.infradead.org
X-Gm-Message-State: APuU4Z/M4s6DBfjWeqKVr96LUx/cqb82kh/pQrOmgSSqwpZ36D4MUkcn
	qUvKAOny4GCrO7PP+d+/YEYSwltzDdkC0/zLvU0GK7cjoKgExmxtB+Jve7h+eXrZ/W0=
X-Gm-Gg: AYBFou3GFJdc2yJ12eoX25MXnyh2CGxHm0t2qfTC2nNqwbT5ZaASfWJFMhXQiWVPpcI
	rvtjNCpmYWrc59Snxoh6C0Xzq/r3CBcRNrzNV+TilOi9VrdFHPOw6i2iElcT3M++MoZEbZB8OBN
	YxA63TNd8DCa9YO+J0dWZ4U7XXBtW1hPIVxLr154gfj5GxflgV9QZkB9T4HQegAD3nuSuGqY8mi
	NeV90+ccqBp9HBeVb3CMwSbu62ArKMM7CzMJU6QUGamh+9Z4Uzg18CUwdi3j/x9Pt54TbYKBA/8
	6qz/RjRnJgEpZ/hYYeEh/oFON1PxLsqxExgu3eUKDbdDOPXgS6ZOxEPqr7HOK1jhfhaQKWMuXkQ
	cH9rE5yvEouvgJxDKhKIDQc6DiaKdJDXP7TvTuQsG8U5DiJ3Z7qHh9Z3gduyacmfgj0NgwUUMkV
	i9rF+bq2zJ7kozeyr2Xne6BE+jVWs+skvDYyNc7e/dHGPtKLPVY7FY4j6BGL6wbxV9YSVmk6kZC
	uDxm2CXWsbDuZXtPeWDrTXbotCaspqlFhf4WhJfTlpZGhKzhVFDgyUOTr/YNLXs4wRmcjpqnRv1
	C+Evxmp3lfikBNt1jsECu3xiUGxMjA==
X-Received: by 2002:a05:701a:cc87:20b0:1b5:3878:aa29 with SMTP id a92af1059eb24-1b53878b8c1mr2057482c88.38.1794892309617;
        Mon, 16 Nov 2026 21:11:49 -0800 (PST)
Received: from localhost ([122.172.83.36])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031918c7sm53754284c88.9.2026.11.16.21.11.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 21:11:48 -0800 (PST)
Date: Tue, 17 Nov 2026 10:41:45 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: rajanyadav0307@gmail.com
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Yangtao Li <tiny.windzz@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] cpufreq: sun50i: Handle boards with the
 allwinner,sun50i-a133 compatible
Message-ID: <avviEW1-h495D0B5@vireshk-B250M-D3H>
References: <20261104-a133-fix-v1-1-d0b5ad3d4c5d@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261104-a133-fix-v1-1-d0b5ad3d4c5d@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_211151_593899_20B8D4E1 
X-CRM114-Status: GOOD (  26.55  )
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

On 04-11-26, 22:07, Rajan Yadav via B4 Relay wrote:
> From: Rajan Yadav <rajanyadav0307@gmail.com>
> 
> The Teclast P80 uses "allwinner,sun50i-a133" as its only SoC
> compatible, as documented in the arm/sunxi.yaml binding. Neither the
> sun50i cpufreq driver nor the cpufreq-dt-platdev blocklist lists it.
> cpufreq-dt then probes on its own, finds only opp-microvolt-speedN
> properties and fails:
> 
>   cpu cpu0: opp_parse_microvolt: opp-microvolt missing although OPP managing regulators
>   cpu cpu0: _of_add_opp_table_v2: Failed to add OPP, -22
>   cpu cpu0: OPP table can't be empty
> 
> so the board runs without CPU frequency scaling.
> 
> Add the compatible to both lists.
> 
> Tested on a KickPi K5C (A133) with its root compatible changed to
> "allwinner,sun50i-a133" only: on v7.4-rc1 cpufreq fails as above, with
> this change the sun50i driver probes and the A100 speed1 OPPs are used.
> v6.18 fails the same way, also with "kickpi,k5c" listed first.
> 
> Claude Code (Anthropic) drafted this change and its message from my test
> logs; I reviewed and tested it.
> 
> Fixes: 60b064eb82e6 ("arm64: dts: allwinner: A133: add basic support for Teclast P80 tablet")
> Signed-off-by: Rajan Yadav <rajanyadav0307@gmail.com>
> ---
> This fixes the Teclast P80 support added in v7.4-rc1, so I think it can
> go in as a fix for 7.4. I do not have a Teclast P80; I reproduced the
> failure on a KickPi K5C as described above. A series with A133 speed
> grade support, which Andre asked for, follows separately.
> ---
>  drivers/cpufreq/cpufreq-dt-platdev.c   | 1 +
>  drivers/cpufreq/sun50i-cpufreq-nvmem.c | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/drivers/cpufreq/cpufreq-dt-platdev.c b/drivers/cpufreq/cpufreq-dt-platdev.c
> index bce4c87573a..6bdeba47749 100644
> --- a/drivers/cpufreq/cpufreq-dt-platdev.c
> +++ b/drivers/cpufreq/cpufreq-dt-platdev.c
> @@ -110,6 +110,7 @@ static const struct of_device_id blocklist[] __initconst = {
>  	{ .compatible = "airoha,en7581", },
>  
>  	{ .compatible = "allwinner,sun50i-a100" },
> +	{ .compatible = "allwinner,sun50i-a133", },
>  	{ .compatible = "allwinner,sun50i-h6", },
>  	{ .compatible = "allwinner,sun50i-h616", },
>  	{ .compatible = "allwinner,sun50i-h618", },
> diff --git a/drivers/cpufreq/sun50i-cpufreq-nvmem.c b/drivers/cpufreq/sun50i-cpufreq-nvmem.c
> index 9261d148a16..5d4ff192e99 100644
> --- a/drivers/cpufreq/sun50i-cpufreq-nvmem.c
> +++ b/drivers/cpufreq/sun50i-cpufreq-nvmem.c
> @@ -324,6 +324,7 @@ static struct platform_driver sun50i_cpufreq_driver = {
>  static const struct of_device_id sun50i_cpufreq_match_list[] = {
>  	{ .compatible = "allwinner,sun50i-h6" },
>  	{ .compatible = "allwinner,sun50i-a100" },
> +	{ .compatible = "allwinner,sun50i-a133" },
>  	{ .compatible = "allwinner,sun50i-h616" },
>  	{ .compatible = "allwinner,sun50i-h618" },
>  	{ .compatible = "allwinner,sun50i-h700" },
> 

Applied. Thanks.

-- 
viresh

