Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D225606A321
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Nov 2026 13:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XHnlWmnD;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LFAt3yvq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=dCmAGX2Omd/g9y7jDZCpeWTJ9I+W1z7gL0oCYL7gw10=; b=XHnlWmnDZ48Tsw
	K1Mrlpd6MhJVS9SQd+TSZKnKivpwCVN+BOJONMaATTjN9OWYuJM34kl4UitsKsiNlsjQBfTBRnCLr
	ZZQyeT187DvwXrK+Q47eIgNF1QvIQVaHMVqgGSJpHhimyVj6tYOqgJQoAn3iDmhG6136cQZMY2qxC
	+QaZyCd+BhpgKw/XFu0SlzLIs9fYeMzYGsflX7Dc3ag/rfbbmcqKLBUw53kGNU60WCwZDbXXlXywg
	RT/eb6hFuZJQIWgG66368snpbNigPGyxDuACjd6gxyb0BVHqURxntENSw5ZfewQiE3EljxQ2Ljmm0
	+sznnPiYHKbAgCQlmw0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXIdl-00000000nWV-0a7I;
	Sat, 28 Nov 2026 13:38:57 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXIdi-00000000nVy-3nlC
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Nov 2026 13:38:56 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-3ae85add512so75571531fa.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 28 Nov 2026 05:38:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795873132; x=1796477932; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dCmAGX2Omd/g9y7jDZCpeWTJ9I+W1z7gL0oCYL7gw10=;
        b=LFAt3yvqdaSMnKyavZqjwnUOF6nZurnFOoS+zelj15FICWoOsDhYxM7flPWulI64Fm
         5fAZHu+PKEqUcySR9X6cluURKq4ensbbH7xGRzBil+GLv7G2hVa0FL1hwVL/9xiBzjNU
         WVzRuqsz5eYeTwJU0eX4Ao9HeHtqkMkQBgntwlgOE4SNZcoUiM1QYxW7YXNYayLJUWk7
         ZPu4WA5Muoh9muwrc2/v753I1uQ/HyFG9CEgnCIrGf8x47sudQF7rEzAimBL4OWJaDHy
         9HXlkXkTBFn3/f4g3BtdTPP7ylUAxCQNe/hFcuMC+xElG9ON9avb4t4q6D/3PkSrp0hX
         eqUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795873132; x=1796477932;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dCmAGX2Omd/g9y7jDZCpeWTJ9I+W1z7gL0oCYL7gw10=;
        b=0mwlOGNOEG9hKXUd/Qy/GYnE1lzekeRZrDkCDdYe+NUKiFWLk+xVM5A23kVO+0j5Ef
         1ukX4GzENUntjRBtA6+PZiDanvANaiSXJ2pijkGlxEjX03Vo0tB7mXMzYq+IwAzISmGL
         bjcMOctLBCRgBhGbR1W0onkK1p2VWfq9i+fTerT1IqUVQPquPI9w8cn1lDrl/mSAok6/
         BRVFSXpV3hjaAC1yeCIjVa6uJcrSYWNGZeC47CGHKTNQnLfVaIryEaG4heVdxGbhZ284
         62E7OSzq8za0EJEEbptaj9vrk85e+7Y4cOUd0zQ4oggYqpNmZDJgSvaPjL0W7bifcwqe
         igCA==
X-Forwarded-Encrypted: i=1; AL+hErGB11iJU9QU+pft227nTIKrf+9cy3uiVoYcxeOhKLhsmNasLX0NKqxuDwPm2XStiUkMpmKzj8bFg9L0pGXs2/xs@lists.infradead.org
X-Gm-Message-State: APuU4Z+jqto5MuOS6VXw9wf3SJNHKMFRLnPooStMI2CMx7HAOAFPJmjC
	IWCYYqgtva1kSk7NWCcHso/wdtyeOTzUTSEydkKabxqBJAuV/0qqrsR+
X-Gm-Gg: AZFdTZdv+PMjnYomSZ6l8XhWq4pajWaNgg69Shhje70B+WALotF8QV0UEsIxnKC4ZlR
	phdmW8+5y39I/ItRP0DOFq7HpGar+m/VbQiXWA41dB4yY2hfmbefWfW2P9nGKKOZaMnsYyEtRkN
	k2MbdurznQOt0h6pAjBI92tLNCLq2ZQcnHehTyjAgol8Phdb1ARJ7otGabFNFFvLtJyWzo1wCI2
	FGgwjeM9zw8q7HA0UjDevoBRlvwTU3cqCrZ8ikMePQJyLH2dTUXvSlfW+EE4JhIApOtsO0P+Fi4
	2bBsk0NaJa7bYSLUaJZVoIjpMwpzC/6dc8xf6J9EgGPNeIGc1/9OzajoMz7HgcR17g1TFIULvw0
	SV/HaIX3e1VOWwFGyqFHKUrLR0GCBSoUCGup4Z1eZmNatwnasTV+Vced/dbHjgC+FPXSykFuoAW
	mTJXTfAM9ogYmcav5H68fRLRYopS92r/00CtYLXahhO1vlnB+nSjcepL6Z1FgaKpQMD8qhr+ToL
	tmkIaOCcnQlgibTw6P3FOrCH2moHbiHaKQOAuILkllwh7wLFMEKIT3GNkKOhEFu+vJ9wvgvlZFA
	4A0QeMB9hLhnX9VfezzDGgRNqJ1n5WnBoxvJPSke6r3T
X-Received: by 2002:a05:6512:3b89:b0:5c3:3dfd:c4e8 with SMTP id 2adb3069b0e04-5c33dfdc807mr1617419e87.2.1795873131953;
        Sat, 28 Nov 2026 05:38:51 -0800 (PST)
Received: from [10.127.127.83] ([5.195.0.145])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bcff8b82sm6968991e87.16.2026.11.28.05.38.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Nov 2026 05:38:50 -0800 (PST)
Message-ID: <2528005e-67b5-4e23-a357-fbf853c2ff38@gmail.com>
Date: Sat, 28 Nov 2026 17:38:44 +0400
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/12] clk: samsung: exynos8895: Terminate PLL rate tables
 with sentinels
To: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?=
 <u.kleine-koenig@baylibre.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Takashi Sakamoto <o-takashi@sakamocchi.jp>,
 Danilo Krummrich <dakr@kernel.org>, linux-samsung-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
References: <20261127180416.3277544-1-lee@kernel.org>
 <20261127180416.3277544-11-lee@kernel.org>
Content-Language: en-US
From: ivaylo ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <20261127180416.3277544-11-lee@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261128_053855_011696_9E37D679 
X-CRM114-Status: GOOD (  15.16  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/27/26 22:03, Lee Jones wrote:
> _samsung_clk_register_pll() sizes each PLL rate table by scanning until
> it encounters an entry with .rate == 0, then copies the counted entries
> into pll->rate_table.  However, pll_shared0_rate_table,
> pll_shared1_rate_table, pll_shared2_rate_table, pll_shared3_rate_table,
> and pll_shared4_rate_table all omit a terminating zero sentinel, causing
> out-of-bounds reads into adjacent read-only data and populating
> pll->rate_table with bogus entries.
>
> Append a sentinel entry to each of the 5 PLL rate tables.
>
> Fixes: 9174fac3b302 ("clk: samsung: Introduce Exynos8895 clock driver")

Looks good to me. Thanks, nice catch!

Reviewed-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>

> Cc: stable@vger.kernel.org
> Signed-off-by: Lee Jones <lee@kernel.org>
> ---
>   drivers/clk/samsung/clk-exynos8895.c | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/drivers/clk/samsung/clk-exynos8895.c b/drivers/clk/samsung/clk-exynos8895.c
> index 259481c4276e..daf337f47e4f 100644
> --- a/drivers/clk/samsung/clk-exynos8895.c
> +++ b/drivers/clk/samsung/clk-exynos8895.c
> @@ -478,22 +478,27 @@ static const unsigned long top_clk_regs[] __initconst = {
>   
>   static const struct samsung_pll_rate_table pll_shared0_rate_table[] __initconst = {
>   	PLL_35XX_RATE(26 * MHZ, 2132000000U, 328, 4, 0),
> +	{ /* sentinel */ }
>   };
>   

...

Best regards,
Ivaylo

