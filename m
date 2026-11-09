Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94B0F606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 10:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lsiy+jsY;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=eG/Sun85
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=LrHYhLri5ZS8HxQtgSMKMn2DV1tWM8X9x+L3DN75OE0=; b=lsiy+jsYXo23Ov
	nZwy7E9lQ7Lb9FrqNfn+4TnjeCjx3bmVscshBi5Sse76GuxbvjfC6ldjkGmqFeqeNEQsnBybbwXKv
	FbvCJL+wwVDwQdbKmvlGCiYlhjqy/kITGM7Ak5Jp5n7I+u8ewu/rjkVLr4PDxi63gA2MOdXjZgtpQ
	cp9I8dRuXFLDSbGygerStfqgidvGeI595TiC+kSvTkpsWeFlD6VkaLyuuDGBolbwC9UTIs0Q83oir
	pH5vM3Ju360FQqCtKSp43BNUQJ2ju5E9e5K+QQrqboX+w4U8QiHJHmWLRs0ZD5xMqzCH6Zx9Dwcja
	1V615PI72Y8zaOAw0paA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQMXn-00000000P0f-1Ntx;
	Mon, 09 Nov 2026 10:24:07 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQMXk-00000000Ozn-2Z5b
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 10:24:05 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4a2069b9710so5682795e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 02:24:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794219842; x=1794824642; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LrHYhLri5ZS8HxQtgSMKMn2DV1tWM8X9x+L3DN75OE0=;
        b=eG/Sun850MGF99I1pS+CwWzacOtsSdcljkDV8hEvHmV/KPlH9a21Cvcx8pSdwz4nhs
         aLtUH1EnYuT1n0iOF7/BEdNkdSOdCoHIbBhHSjuXuX7noSDPpZF0gsboH0/5HeSm/693
         fQfN3t3EDTxGDzKdB1hcc9waBorbfk9zW+jEv6Nj8xhMd0l3J38r449GwbjuiY0IKeDg
         NVjoEKW5BSk2hUMKKD/2Dtg+d2pejieAwmGLMQbp7Jw27gplvlIe+QlIFuc17/oQ/Dq2
         Z9apv0SjgqO1si+XYewUSQOf9rAKe8ehOpSGSNFoafUqjbnjXDUkWKE7ZK3btdFHqxJ1
         aspQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794219842; x=1794824642;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LrHYhLri5ZS8HxQtgSMKMn2DV1tWM8X9x+L3DN75OE0=;
        b=bAqt1PB+EX50QajJPwMd7I0UMuwtSUqpfOr+EP5HkWEweyQHYKyNlAfvKfqHqk9WFW
         wDe81UbEKG6+RSfhWTKHTkrI0mIqpKrWbXa4oqh5DoWsRzvkGgC58AvbuqaWP2qJiNLA
         By9/qBIz3MysE3twWpR5InNALNXJzWv4az0nOOWeva+15ODF5RHoEiiDsIsuXidKhQJc
         3G9lvgNTWR6f8RtM58XuzvyYpQ2NEkdUiBlVBNflmcs57ExGr+csdqLudFaf8xz1mtN2
         rrVK7ids2ADH8PpEkwsiEX4o6aAeaTv5CZBlQvo1Xrz9shdbmXLBWr0c8r8g3p4UHkuw
         pJzg==
X-Forwarded-Encrypted: i=1; AL+hErE7NDgoakP7Gx3b/VyEp2se2OCJDwHgSGqM0JgPhh0C3jufaN3O0GiitCm8VVNV9echpD8/2K45AHj3HZllqcEo@lists.infradead.org
X-Gm-Message-State: APuU4Z+1QDZDMhxslLorDe2DYDnUlMkzlT/Ltw9Jn8QeYZGjFOPMziW+
	d4I4KkrF8weKJU+vSRqx7iK5XNXRnsRXio7VFaV49qhh86oVhZNxo11IgUuzmNoH4tI=
X-Gm-Gg: AYBFou1+TnQrijyZdjBxTlOuiJkNJsJmEWhxxk7a82omaXMVcjbVjuhDVsJvin6PoDu
	dJTXXLjgZE4tr6uNjnJ6txK5A1EbzQwqHiZHMFS8KMB6DUObs7RNZuXqSFPk1rihY7R5mAqGBzu
	gGH9C+6B/MptkhAPA+yma4FlIwUNZFxgE52OabrFeLOpR48c6fjoMT7DlKZ7bm9DR0RQ3ZsfoV+
	nD+f+E1cuP8KuJYQQv8pJrEo5ojl8o18HlNBFMQJaMjOHEMITXYlugVP+efVOTWb/wQ8BgJJm1N
	n0HZoh0bcdzHK5JuaeehUJf7G2GLPOYiulekMnVigXpJBNgtXHHa5E4LmrtanEUZn9iZBFRI1PS
	MDInzhkXbDT/koicwxNCAlVQY4NAVoS/zvGn+xGvVbbjtmLpW4GEcATCYgLbmoH4LkouX0tBZqb
	H96kMx6hD9FwC5Bh1+vjcjfnLApmKeDF8mFJpsyLLeCt/7MJgUMyp6ylXf/ffJZPPtKz+M4QMqU
	poUEvIXkD8Dluw0ZzddHavrGmt+QslLvWf+uECZAFDiWNrROGdMYjbTf+wInGGMNDdENB2j7ZQv
	QDVQgl3uMYypWrSYAZNPb94o0hes998y
X-Received: by 2002:a05:600c:3113:b0:4a1:f720:74cd with SMTP id 5b1f17b1804b1-4b963c91d7fmr67354805e9.24.1794219842343;
        Mon, 09 Nov 2026 02:24:02 -0800 (PST)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7efb1547fsm406780645e9.11.2026.11.09.02.24.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 02:24:01 -0800 (PST)
Message-ID: <bf6925f6-613f-4e20-8491-2a99183f34fb@linaro.org>
Date: Mon, 9 Nov 2026 10:24:01 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] perf vendor events arm64 AmpereOneX: Fix misspelled
 PublicDescription keys
To: TAKANO Mitsuhiro <takano32@gmail.com>
Cc: Ian Rogers <irogers@google.com>, John Garry <john.garry@linux.dev>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Ilkka Koskinen <ilkka@os.amperecomputing.com>,
 linux-perf-users@vger.kernel.org, Arnaldo Carvalho de Melo
 <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>
References: <20261108183846.3804875-1-takano32@gmail.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20261108183846.3804875-1-takano32@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_022404_695437_07C0E9A1 
X-CRM114-Status: GOOD (  21.67  )
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 08/11/2026 18:38, TAKANO Mitsuhiro wrote:
> Sixteen of the 28 entries in mmu.json spell PublicDescription as
> "PublicDescrition"; the other 12 spell it correctly.  jevents.py reads
> only the keys it asks for by name, so those 16 fields are dead.

Shouldn't jevents enforce some kind of schema? This seems like a bug in 
the generator that it's allowed. And we have all the json files in one 
repo, so we can fix everything when adding strict validation.

> 
> Fixing them does not change the perf list output: every one of the 16
> entries has a BriefDescription with the same text, and jevents.py drops
> the long description when it equals the brief one (jevents.py:405).
> Running jevents.py for arm64 before and after this change gives a
> byte-identical generated string table.  This is a cleanup, not a fix for
> anything a user can see.
> 
> The file becomes self-consistent again, and the field works if the brief
> text is ever changed on its own.  No text, name, code or expression
> changes.
> 
> Written with Hermes Agent, an LLM assistant; the tables were regenerated
> with jevents.py on top of this change, perf was not rebuilt.
> 
> Signed-off-by: TAKANO Mitsuhiro <takano32@gmail.com>
> ---
>   .../arch/arm64/ampere/ampereonex/mmu.json     | 32 +++++++++----------
>   1 file changed, 16 insertions(+), 16 deletions(-)
> 
> diff --git a/tools/perf/pmu-events/arch/arm64/ampere/ampereonex/mmu.json b/tools/perf/pmu-events/arch/arm64/ampere/ampereonex/mmu.json
> index 66d83b680651..9457f9be4ecc 100644
> --- a/tools/perf/pmu-events/arch/arm64/ampere/ampereonex/mmu.json
> +++ b/tools/perf/pmu-events/arch/arm64/ampere/ampereonex/mmu.json
> @@ -30,37 +30,37 @@
>           "BriefDescription": "Data TLB translation cache hit on S2L2 walk cache entry"
>       },
>       {
> -        "PublicDescrition": "Data TLB translation cache hit on S2L1 walk cache entry",
> +        "PublicDescription": "Data TLB translation cache hit on S2L1 walk cache entry",
>           "EventCode": "0xd805",
>           "EventName": "MMU_D_TRANS_CACHE_HIT_S2L1_WALK",
>           "BriefDescription": "Data TLB translation cache hit on S2L1 walk cache entry"
>       },
>       {
> -        "PublicDescrition": "Data TLB translation cache hit on S2L0 walk cache entry",
> +        "PublicDescription": "Data TLB translation cache hit on S2L0 walk cache entry",
>           "EventCode": "0xd806",
>           "EventName": "MMU_D_TRANS_CACHE_HIT_S2L0_WALK",
>           "BriefDescription": "Data TLB translation cache hit on S2L0 walk cache entry"
>       },
>       {
> -        "PublicDescrition": "Data-side S1 page walk cache lookup",
> +        "PublicDescription": "Data-side S1 page walk cache lookup",
>           "EventCode": "0xd807",
>           "EventName": "MMU_D_S1_WALK_CACHE_LOOKUP",
>           "BriefDescription": "Data-side S1 page walk cache lookup"
>       },
>       {
> -        "PublicDescrition": "Data-side S1 page walk cache refill",
> +        "PublicDescription": "Data-side S1 page walk cache refill",
>           "EventCode": "0xd808",
>           "EventName": "MMU_D_S1_WALK_CACHE_REFILL",
>           "BriefDescription": "Data-side S1 page walk cache refill"
>       },
>       {
> -        "PublicDescrition": "Data-side S2 page walk cache lookup",
> +        "PublicDescription": "Data-side S2 page walk cache lookup",
>           "EventCode": "0xd809",
>           "EventName": "MMU_D_S2_WALK_CACHE_LOOKUP",
>           "BriefDescription": "Data-side S2 page walk cache lookup"
>       },
>       {
> -        "PublicDescrition": "Data-side S2 page walk cache refill",
> +        "PublicDescription": "Data-side S2 page walk cache refill",
>           "EventCode": "0xd80a",
>           "EventName": "MMU_D_S2_WALK_CACHE_REFILL",
>           "BriefDescription": "Data-side S2 page walk cache refill"
> @@ -90,61 +90,61 @@
>           "BriefDescription": "Level 2 instruction translation buffer allocation"
>       },
>       {
> -        "PublicDescrition": "Instruction TLB translation cache hit on S1L2 walk cache entry",
> +        "PublicDescription": "Instruction TLB translation cache hit on S1L2 walk cache entry",
>           "EventCode": "0xd901",
>           "EventName": "MMU_I_TRANS_CACHE_HIT_S1L2_WALK",
>           "BriefDescription": "Instruction TLB translation cache hit on S1L2 walk cache entry"
>       },
>       {
> -        "PublicDescrition": "Instruction TLB translation cache hit on S1L1 walk cache entry",
> +        "PublicDescription": "Instruction TLB translation cache hit on S1L1 walk cache entry",
>           "EventCode": "0xd902",
>           "EventName": "MMU_I_TRANS_CACHE_HIT_S1L1_WALK",
>           "BriefDescription": "Instruction TLB translation cache hit on S1L1 walk cache entry"
>       },
>       {
> -        "PublicDescrition": "Instruction TLB translation cache hit on S1L0 walk cache entry",
> +        "PublicDescription": "Instruction TLB translation cache hit on S1L0 walk cache entry",
>           "EventCode": "0xd903",
>           "EventName": "MMU_I_TRANS_CACHE_HIT_S1L0_WALK",
>           "BriefDescription": "Instruction TLB translation cache hit on S1L0 walk cache entry"
>       },
>       {
> -        "PublicDescrition": "Instruction TLB translation cache hit on S2L2 walk cache entry",
> +        "PublicDescription": "Instruction TLB translation cache hit on S2L2 walk cache entry",
>           "EventCode": "0xd904",
>           "EventName": "MMU_I_TRANS_CACHE_HIT_S2L2_WALK",
>           "BriefDescription": "Instruction TLB translation cache hit on S2L2 walk cache entry"
>       },
>       {
> -        "PublicDescrition": "Instruction TLB translation cache hit on S2L1 walk cache entry",
> +        "PublicDescription": "Instruction TLB translation cache hit on S2L1 walk cache entry",
>           "EventCode": "0xd905",
>           "EventName": "MMU_I_TRANS_CACHE_HIT_S2L1_WALK",
>           "BriefDescription": "Instruction TLB translation cache hit on S2L1 walk cache entry"
>       },
>       {
> -        "PublicDescrition": "Instruction TLB translation cache hit on S2L0 walk cache entry",
> +        "PublicDescription": "Instruction TLB translation cache hit on S2L0 walk cache entry",
>           "EventCode": "0xd906",
>           "EventName": "MMU_I_TRANS_CACHE_HIT_S2L0_WALK",
>           "BriefDescription": "Instruction TLB translation cache hit on S2L0 walk cache entry"
>       },
>       {
> -        "PublicDescrition": "Instruction-side S1 page walk cache lookup",
> +        "PublicDescription": "Instruction-side S1 page walk cache lookup",
>           "EventCode": "0xd907",
>           "EventName": "MMU_I_S1_WALK_CACHE_LOOKUP",
>           "BriefDescription": "Instruction-side S1 page walk cache lookup"
>       },
>       {
> -        "PublicDescrition": "Instruction-side S1 page walk cache refill",
> +        "PublicDescription": "Instruction-side S1 page walk cache refill",
>           "EventCode": "0xd908",
>           "EventName": "MMU_I_S1_WALK_CACHE_REFILL",
>           "BriefDescription": "Instruction-side S1 page walk cache refill"
>       },
>       {
> -        "PublicDescrition": "Instruction-side S2 page walk cache lookup",
> +        "PublicDescription": "Instruction-side S2 page walk cache lookup",
>           "EventCode": "0xd909",
>           "EventName": "MMU_I_S2_WALK_CACHE_LOOKUP",
>           "BriefDescription": "Instruction-side S2 page walk cache lookup"
>       },
>       {
> -        "PublicDescrition": "Instruction-side S2 page walk cache refill",
> +        "PublicDescription": "Instruction-side S2 page walk cache refill",
>           "EventCode": "0xd90a",
>           "EventName": "MMU_I_S2_WALK_CACHE_REFILL",
>           "BriefDescription": "Instruction-side S2 page walk cache refill"
> 
> base-commit: fa4ad798f6f681031775266044ba1b0cf3c670bd


