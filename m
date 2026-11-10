Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06FBE606A323
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 15:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XVFNE4Nv;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Y9zOu2ZA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=JwOHw4AU6Rnpi+DwWpdZ4fConTJJ3cMlVCSfDKWUcJk=; b=XVFNE4NvhE6nQe
	jyexEpnsO42mBouDenAwY/1lRTseu8opO3MNoAZhQtqA1v8HiEY7JCjLTFEtW6FR9Ul2LKVIl2QJp
	MCpJy7PMTdSLlDVgnK8mwQh7DEdtijTMVo1C7QAmXDxvcX2UKtrLB1e30+HgudSfsUn0EWN3deJzO
	OvLlB39nMt/kgS/4CZr3nz0X97YtIzIh5uSttt5+VRtPJCawVzcbf20o80G6FzYmPLQj3W++kF33R
	hB4CReHkCddSxwrVgr4on43PWAbscXA5XpZ7VZa/Kbe8Dr60wFDM5pDz0r324MOpfOGHPOfKIgA9x
	0fw8k8LzdvGCbtMFMX+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQno0-00000004NbO-3flJ;
	Tue, 10 Nov 2026 15:30:40 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQnny-00000004NZm-1T2D
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 15:30:39 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso22391255e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 07:30:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794324636; x=1794929436; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JwOHw4AU6Rnpi+DwWpdZ4fConTJJ3cMlVCSfDKWUcJk=;
        b=Y9zOu2ZARr40Xf03oKiUHwTYnLRsPW4K90PHzJnz1U95YVk8gZuJY2MRTxp2lMEjux
         hgfpmQissWaWYK6jniQs47Ybd9n1YYtkFlSbvFu5pJEkxF2UydBVaBWSavWu/MYEB1iA
         pAVfWFZ82gQUu5pTqlpIzK+I2JjKo26I7zCFK4Cy3O29Jw2ua29dGbW1gPL4Jxm9fhmj
         JyJJ1t5Ffe9soBXqeDPLjc6NWJIhC9QKw2KC2KZm6yN3pm3jADjYEgPoqoahpb7CImzE
         xYqgmaPv/l3vxlOgJ+cFawhF5d/r773USEeEn7OhhLicBE1tstfgHVUo4Ia/NcDMBcW0
         N11Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794324636; x=1794929436;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JwOHw4AU6Rnpi+DwWpdZ4fConTJJ3cMlVCSfDKWUcJk=;
        b=VXCgw3oR3FBDL7vvsQLvdfsk5iwvt6yAK4sNprZH2h9Pmp0uxc7ISkf3X0hqGRvNWH
         mkkqjYvK97ub9a+VLikd3VyMK1aKWkkN/mqFe7e1uCP2dku/PF3htjiy5F4AXWzF0+1v
         7OAFUMuPGHqDJJioTESURAvIY1TPu2lHDgWdwu4ETePzobdEhFTLI4qkBGPqgqwIJrX0
         vi0rjzADcgQTiIyzepmniIlLWOC1LUMbzcmX6jgmnKoNVkzJOXJhWwC5FHg2teCHasN8
         mvGqceW9ScyoOwUkMTGyNqcnHwii/iAHIEHnzdNQOng6+Tuq/ttWoP9JF/bL5baZEH2c
         o31w==
X-Gm-Message-State: APuU4Z+9UDoL4my5xRpJEQQMcA5AoBpLMqnqVJIacSUwIjlYWrzueCUJ
	eVSMPEIg67DzzyZI+55TPimSWbT2Rh0R361qnCXGKv8IDO3A318U7lKSQ/527UygIO4=
X-Gm-Gg: AYBFou2SppwiXx7J4KFpKIegiRS7BNCQsC6b5n2EDVJ7FSdzYGAyggl+PZMDl+1BdzB
	YcuRjnThlsi2LZpwG5RWfYbzPFdOk+AebA8AI9v41K20GH4pMGjWQqQOILgRo9RgYz48LGCXFov
	eFIH93u/oaUxHhMoHza3lx97GPPxPI4+D2+iNofqC9r0iOGO9canovNO8BwDH5N+uC5BKA4amOg
	eoLDIIpxeXDQGQ5ckjw/os/tSM4guNMfFKjiEnlb9V4AaawVZ5RRx84K6icdH0TUbTwMzrlacO7
	t9TUxlVudwRpVcHH24CGdHGsWO2oUz5elpBRCRf5/Nax2k8OlE0ZrmgDGIGNVZmGyyxu247VJfu
	YnxrmPZPo8XkJX4LVKPQHB464wNedd5zrXVsJL8mjuFYkEl8vroTbSBl6bhmV6u8le992+Eh4J+
	5KYut3M8Lv0R8OoCUtf0VQgx1f/TUXpTUCG2ok1p6NJt/5c+tNtYMeuN8ArQIIu6qgIYUfrvBDv
	Ur1HUYw9qQQH8RT4sTqPKSC8WngavP2FKCck5H9hxZZh7C9At7R0keEUZpgT3pxMTR5ts9fAkaB
	gHQpmvEnV50j7+V64+yS4JqznIqm15gcQQ==
X-Received: by 2002:a05:600c:350a:b0:4a6:42cc:bf66 with SMTP id 5b1f17b1804b1-4ba0233d8b3mr50053665e9.11.1794324636258;
        Tue, 10 Nov 2026 07:30:36 -0800 (PST)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0234a5dcsm71842625e9.2.2026.11.10.07.30.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 07:30:35 -0800 (PST)
Message-ID: <4f84b645-a17a-47c1-a23d-ede7dc81601c@linaro.org>
Date: Tue, 10 Nov 2026 15:30:34 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/23] coresight: trbe: Clear stale external abort
 status
To: Leo Yan <leo.yan@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 coresight@lists.linaro.org, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Tamas Petz <tamas.petz@arm.com>, Tamas Zsoldos <tamas.zsoldos@arm.com>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
References: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
 <20261016-trbe_enable_disable_irq_handle_refactor-v2-8-3f57cf3199b1@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20261016-trbe_enable_disable_irq_handle_refactor-v2-8-3f57cf3199b1@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_073038_416051_43735A4D 
X-CRM114-Status: GOOD (  15.15  )
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



On 16/10/2026 17:55, Leo Yan wrote:
> clr_trbe_status() clears the buffer status and syndrome fields, but
> leaves TRBSR_EL1.EA unchanged. After an external abort, this indication
> can survive into a later perf session on the same CPU.
> 
> Clear EA along with the other status fields while TRBE is disabled.
> The status captured for the current fault remains available for
> classification, so external aborts are still handled as fatal.
> 
> Fixes: 3fbf7f011f24 ("coresight: sink: Add TRBE driver")
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-trbe.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
> index 9dfc6bb7afb4c42dfdec643ee7e4f2f193e2b70c..26e7554d6bdd31f8a55a8bc3a7b6d4c49b984b9b 100644
> --- a/drivers/hwtracing/coresight/coresight-trbe.c
> +++ b/drivers/hwtracing/coresight/coresight-trbe.c
> @@ -608,6 +608,7 @@ static void clr_trbe_status(void)
>   	trbsr &= ~TRBSR_EL1_IRQ;
>   	trbsr &= ~TRBSR_EL1_TRG;
>   	trbsr &= ~TRBSR_EL1_WRAP;
> +	trbsr &= ~TRBSR_EL1_EA;
>   	trbsr &= ~TRBSR_EL1_EC_MASK;
>   	trbsr &= ~TRBSR_EL1_BSC_MASK;
>   	trbsr &= ~TRBSR_EL1_S;
> 

Reviewed-by: James Clark <james.clark@linaro.org>

