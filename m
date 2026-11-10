Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50E2360A380B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 15:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bwsZoowd;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=UX1zLdbt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=f1LNHAFVlJ4bgCx5jvWZ9/1xooFZxhmenlQGy0ip0GE=; b=bwsZoowdMx2m9X
	jRBpZPpVHQ/DZcW1wX0z0bRAVn3HnQgVMEPJE2czW8Gm9lJTErNv3eDIE9IYGKh6nl5C+BINP+IOr
	vYktIV5ok6S0Bq0aXYWBJwldRKP+vlhXb//AZRoeF9NyUu+bA5LJ7AjUOyduG/DjFdUNVTowhxDTJ
	auDB8D50i96Mw25sdQ9A47fe7LV/eZ9jIrQblRMPXzbZ5Esw4OQpORa6igTpevpepejcJFuA/HdtC
	8nibbt3FrgDBkoBN/2I54RujFPuup4W54oFVf8ixB500UGicyvPst+HmG6yGMCz+tcraIFc1VEV0m
	91qbVc3AEFWQaM6WP+fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQnsA-00000004P8s-3tPQ;
	Tue, 10 Nov 2026 15:34:58 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQns8-00000004P7U-2tVB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 15:34:57 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso16895945e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 07:34:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794324895; x=1794929695; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f1LNHAFVlJ4bgCx5jvWZ9/1xooFZxhmenlQGy0ip0GE=;
        b=UX1zLdbtSEsto8v6N7pUUgCKD0M4Q217etSb+2k/mPPs4ji95So6mIEinUf2gX2p34
         PWA6zHXJvn5RZVatqPD5GaHqlhQ1OpnbIcHw5RQTd46WQNbC6BlbbVNGfa2CxdtJrkET
         DfD3dPlNdrCehoagCmNllBLlzfldfbkkc/7aGfdnEIkUj6u/YQEYLIncTJa6J5k8+4T5
         yl9l/l9KK4jxiqj2Vjx+t5eqy4ZcUeWctNNNEvOYZZq0+/V0uuNYszxTOQ5LHjKAxKFW
         zOEih03j2EfdAyxD2s1/RbHmCr8Y7ie+yI8fVYfsublQkXRFyuqOUnvBzO1ENq8NFBuB
         V51A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794324895; x=1794929695;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f1LNHAFVlJ4bgCx5jvWZ9/1xooFZxhmenlQGy0ip0GE=;
        b=ZG6dQOMTw3V7eLmmY0f2oVEqi2hIk4BAyw8Hk40ClRdDOfyewmch9upAa3z48iarB3
         JlztxMZS4c1tXTb7sYuzQKyH3+dXgK5OguTFFCOH1l3mxnMtETFUg2jQ8UZOlZjmmtPg
         yOpBcKpCNGtkgdijplqbf7tHXD7Ny5G5/bUOvnXv5eK59ljIYGqzCCA8VXK73Bkh3ktU
         US7OsgmNX1El3lDGrV/SjXz8+qwRabLcVCAwhWDkyDBclJEgrag3m6IDbj/xQgmWMdCm
         S8sjNvcmOJhkBg9l195099c2N5A8XapICQHDiOxqf7dqQqxnAsb67fIrhgYDh3agxqYH
         /49w==
X-Gm-Message-State: APuU4Z82+z5CSkAHeQ/cqtY9WqNO5lHygFwcyaXXDxABe4TSBoodwgeD
	M3Ko/AK0fPjU+R/XUCZCx775VCT/YxFR8GCM/smEq9uXkl5+8F+x9PuBWUOW+AReAR4=
X-Gm-Gg: AYBFou0/XeRFQ5M2Baa4V5GXkTZbJf1sk3yYorEjLIPmLjJTy0S9y13uhSD9dYiXyeo
	9tpOU3uqcetXt7ZxR3ENDCw4IqI6XVM/tbYHEYiLHGk1LrggAVPLsZde74fXDeV5xG/TLRGcvY/
	8ttUBpSWtR/IS2CCZyeGRWV1wK7pe2uH+y8PqXbBrfwLGhUi5Bet/NsXTvVOzMogKUs5v8KPcnC
	4c6f6jx/zPpEpO4z1o2nd+mIxTUTUnoDT2Zocv7YEhInp2KiOHVF5ah/0e2nlCCTuy9My6lGKpn
	EfMwE3+bz1n1xoAjzOQ6BrbrliF7gkBGkAf9RJXZbuJy9TDcbnOEppgPJcKmf2A6Q436+OoJqDw
	4MRsm/bAQT8/e8z5/mudlE9lPiLvVTk0H83TqOfCKYGJNMRrNDFZRb/v1PneRLLzGnLPO8/MryL
	FdAgr6Z+OIh9HwdtfWeKSDsLo1BUBmQLd0It1nq52XOuiCOQF6h4EbgQJiQhgBYi5SnT7TqG5UN
	TnDCj0Xq+vWREyuesIDN60wg0mtPnlUrZUorhlV9pFXjGqPP3ebhK+j1/nk6YGdZFm3OuO83LM+
	KMxu131/8hzb9khdoRKiW+Fi6Z31PEq6ag==
X-Received: by 2002:a05:600c:34c7:b0:4a4:f48e:78fa with SMTP id 5b1f17b1804b1-4ba02344f3fmr47924145e9.12.1794324894569;
        Tue, 10 Nov 2026 07:34:54 -0800 (PST)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0234a5dcsm72076655e9.2.2026.11.10.07.34.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 07:34:54 -0800 (PST)
Message-ID: <9c366f17-8fb7-43b5-99ac-092f14d4b4a7@linaro.org>
Date: Tue, 10 Nov 2026 15:34:53 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 20/23] coresight: trbe: Add fault action argument to
 trbe_handle_overflow()
To: Leo Yan <leo.yan@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 coresight@lists.linaro.org, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Tamas Petz <tamas.petz@arm.com>, Tamas Zsoldos <tamas.zsoldos@arm.com>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
References: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
 <20261016-trbe_enable_disable_irq_handle_refactor-v2-20-3f57cf3199b1@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20261016-trbe_enable_disable_irq_handle_refactor-v2-20-3f57cf3199b1@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_073456_781826_1DF735E0 
X-CRM114-Status: GOOD (  17.42  )
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
> Add a new argument to trbe_handle_overflow() for the fault action, which
> is used to compare the wrap event for trace size calculation.
> 
> No functional change intended; this is preparation for a later update.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-trbe.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
> index f1f102df6c387f53feaa12b89d3df89f734afcdb..c83c440d4ac13c346bc2a7f9093951c186c90157 100644
> --- a/drivers/hwtracing/coresight/coresight-trbe.c
> +++ b/drivers/hwtracing/coresight/coresight-trbe.c
> @@ -1132,7 +1132,8 @@ static void trbe_handle_spurious(struct trbe_cpudata *cpudata)
>   	set_trbe_enabled(cpudata, trblimitr);
>   }
>   
> -static int trbe_handle_overflow(struct trbe_cpudata *cpudata)
> +static int trbe_handle_overflow(struct trbe_cpudata *cpudata,
> +				enum trbe_fault_action act)
>   {
>   	struct perf_output_handle *handle = cpudata->handle;
>   	struct perf_event *event = handle->event;
> @@ -1147,7 +1148,7 @@ static int trbe_handle_overflow(struct trbe_cpudata *cpudata)
>   	 */
>   	clr_trbe_status();
>   
> -	size = trbe_get_trace_size(handle, buf, true);
> +	size = trbe_get_trace_size(handle, buf, act == TRBE_FAULT_ACT_WRAP);
>   	if (buf->snapshot)
>   		handle->head += size;
>   
> @@ -1253,7 +1254,7 @@ static irqreturn_t arm_trbe_irq_handler(int irq, void *dev)
>   	act = trbe_get_fault_act(handle, status);
>   	switch (act) {
>   	case TRBE_FAULT_ACT_WRAP:
> -		truncated = !!trbe_handle_overflow(cpudata);
> +		truncated = !!trbe_handle_overflow(cpudata, act);
>   		break;
>   	case TRBE_FAULT_ACT_SPURIOUS:
>   		trbe_handle_spurious(cpudata);
> 
Reviewed-by: James Clark <james.clark@linaro.org>

