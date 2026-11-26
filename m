Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02519606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 13:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GCDOEWAg;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=hknF0b9z
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=AU2h9lPdSzx4S/KR98PU1M8jqATUeMkcc+DImUKw4Bc=; b=GCDOEWAg+KbZwy
	bd7fTCx8cCxWroT7zyAA6lJK/0RZM1AEehtR5g6KuXpN6fxkhzCAQOGjKb0srq4U1fmIkP1lIyjWp
	VZYhdxR+ViyRfG+MZ00RYxip6kYtZ0JAo6m/GRFaX0EPp7j03DH6yZtWx2eyF17zO4AUCo0j71WCm
	uYRYyYAf6eJH5mbUWJQCD02Vtbf7TI1mZpqzvB97rwfc+jO4eUz4TjSOKjOmlrpDL6h6engZKV1mn
	/82pHYJyMkhW1HccqdWXDDHXpY5QFj+6ksLRBLqcHZYd+CqFKzHqfLuUM+uTyWX+y1oWG6f5B8TXI
	N3U/tx2V2CfUseKdGdpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWZua-0000000DRjp-31GM;
	Thu, 26 Nov 2026 13:53:21 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWZuX-0000000DRia-1fjC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 13:53:18 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-4a3e706b5dfso4395639f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 05:53:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795701195; x=1796305995; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AU2h9lPdSzx4S/KR98PU1M8jqATUeMkcc+DImUKw4Bc=;
        b=hknF0b9zDMRsH56RpDwWHGpxtKUJP574eB+qt2hBEHFTmbykq7oTyaxcvzfmVQRBGM
         kxdHRaTnX9d5d+Q00RvGSf4upY2e89CW/BeaXhek9IYHj8BzqbVGQlPRX/gwPV3NtW+o
         +i5+v7RYy5QN26LJaOLW1pC5Ff2t7mRAjkik+WuVo2ixHOjR7aD+TwReIhhIZFFfCDFG
         /vg9wQNfrHE2WRSX1uMnxzlaqSLOseeTSKFCJgy6HGceHblNodAfd7ZZzArAc0u286uD
         xONoCD4/HxSyG9kbrsyVTlkIF6YRVCj+ZLTeiF6ts2I0asLT87TIYLJF5v2H5c+sbbe7
         sUXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795701195; x=1796305995;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AU2h9lPdSzx4S/KR98PU1M8jqATUeMkcc+DImUKw4Bc=;
        b=0ZhvBbzUgCzfMBw3H7rHRJkUM1GMQ0xXhcaZK3wCxYQyzsPs9gHqhkvA9APh2r2tl1
         oggKVk0g7PgfDXn69pcc6IjoP3sK7CnmjupbuxcWL1WvehEWnKNdsj/2xRjz4rQP64+m
         A+WMCGFOAvDUMSP1ktLVIZ/ltHhhX8/kiD6UNSU5sK7l/Eb1J+9/aORJ+zL7AcFY4IQw
         i9+t3X3aiBSLdhua+Fb+99AbUUISRgNDcfvkUgZbafa0MB6kdfaW+lp0YukwPyj+LBV+
         Tg2iaazqHtVFlD4v7B3X0ts+2sBk+Fc6HeOK4v2DzfDL91j6onL7UNALWjGOLo6/Nf6y
         3g2g==
X-Forwarded-Encrypted: i=1; AL+hErFYX31PtFNyUsJZO8HWCEuOf2i2NtyhvKAtqGLVJx7OFEMDuBudn9kDd2jqE/ex7OcRntPDElVADc7KswUMYsnL@lists.infradead.org
X-Gm-Message-State: APuU4Z8zjZMo7dAP5C+lGfNQNeXQL2WFnc8TwQC5kEMYGv2tsujGUDXH
	bx6SWe7Dn95Pi2kowMncOwTiuwms75Up1jYYx4LFNblZA9AoMWBFI4d5EOzNwcMJt0Y=
X-Gm-Gg: AZFdTZfGvZDtSr6k3XcZQj/8LwKPQPXY7KsC/RblR+n+3MASmDxx7plB1IzYp5yP0Qb
	cpE86LtMzJJ5kCI9roFhK0HMGs7MUI7OZ85PDrwIGY/jHzPaP+RJWI2/qPHLQnDccm+1cEMifyx
	g71BJ7pI3C4HZuOtqlzF7ybhFeN+2XTxrsMjnIc9ExDnw/1X+iPmLSyoMOl+Uo7TnXc1+FoJUyb
	SREy5kF6fjuTqTs4QnjdXUzzn8J2PWqhD4UcWgf62d/n1MPKstJlgixxirPOuqpMjYWnSsyCjzg
	V0A+CmrTnI3fXpLntFjEm6jIeWb/fiLTgy02JDVaNCoHe9BXOtFtddf0WckzbHPmdFJw2fS2A23
	LlJpaHaYfkabAmhpM28RMiISM9bUTLsit1VbnpjL4BEzZA/+aLqMpTKuC3qUOy/zv5oC29Q7cwQ
	9vF/UymxjJeVdLBOh5oHHxQc82JxAh53PBorxTAVuJAr3JaksaqwK8QWvlUm69nli/xJ/qdJ8Mu
	dmwr2banwgaI4StEtwGRjd8nPXdeXwek8XYXXc6kraQ8P4upF8M54VfR6wLlDCKCdLSJtTOQpAz
	QriVXkCklBJjlxxsA4UY1ZFChM3iV3I0bEyWpXRO6Nae4vYVPmh0Aeo=
X-Received: by 2002:a05:6000:4812:b0:4aa:8da8:4bbc with SMTP id ffacd0b85a97d-4abb5702827mr38115253f8f.36.1795701195608;
        Thu, 26 Nov 2026 05:53:15 -0800 (PST)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bc8ce06sm39382253f8f.47.2026.11.26.05.53.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 05:53:15 -0800 (PST)
Message-ID: <acb7a0f9-610e-40db-b38d-26e63fa5818a@linaro.org>
Date: Thu, 26 Nov 2026 13:53:13 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] perf cs-etm: Use the packet instruction size for
 stack events
To: Leo Yan <leo.yan@arm.com>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mike Leach <mike.leach@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Robert Walker <robert.walker@arm.com>
References: <20261113-perf_fix_gcc15_failure-v1-0-eae592c5ff64@arm.com>
 <20261113-perf_fix_gcc15_failure-v1-2-eae592c5ff64@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20261113-perf_fix_gcc15_failure-v1-2-eae592c5ff64@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_055317_463470_F8F304BE 
X-CRM114-Status: GOOD (  18.13  )
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



On 13/11/2026 10:54, Leo Yan wrote:
> cs_etm__add_stack_event() uses the last executed instruction of the
> previous packet as the branch source. The decoder already records this
> instruction's size in last_instr_size, including for T32 instructions.
> 
> Use the recorded size directly instead of reading instruction memory
> again. This removes an unnecessary read and the dependency on DSO data
> when updating the thread stack.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   tools/perf/util/cs-etm.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
> index 25f12bd110934a204d79244f45317085b7a81666..312d4a734e84faa0d24c4ac1fee16f4dae4c2398 100644
> --- a/tools/perf/util/cs-etm.c
> +++ b/tools/perf/util/cs-etm.c
> @@ -1626,7 +1626,6 @@ static void cs_etm__add_stack_event(struct cs_etm_queue *etmq,
>   {
>   	struct cs_etm_auxtrace *etm = etmq->etm;
>   	u64 from, to;
> -	int size;
>   
>   	if (!etm->synth_opts.branches && !etm->synth_opts.instructions)
>   		return;
> @@ -1638,11 +1637,10 @@ static void cs_etm__add_stack_event(struct cs_etm_queue *etmq,
>   		from = cs_etm__last_executed_instr(tidq->prev_packet);
>   		to = cs_etm__first_executed_instr(tidq->packet);
>   
> -		size = cs_etm__instr_size(etmq, tidq, tidq->prev_packet, from);
> -
>   		/* Enable callchain so thread stack entry can be allocated */
>   		thread_stack__event(tidq->frontend_thread, tidq->prev_packet->cpu,
> -				    tidq->prev_packet->flags, from, to, size,
> +				    tidq->prev_packet->flags, from, to,
> +				    tidq->prev_packet->last_instr_size,
>   				    etmq->buffer->buffer_nr + 1,
>   				    etmq->etm->use_callchain,
>   				    tidq->br_stack_sz, 0);
> 

Reviewed-by: James Clark <james.clark@linaro.org>

