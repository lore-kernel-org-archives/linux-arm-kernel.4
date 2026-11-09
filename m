Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E172E606AAD5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 16:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fc37o8st;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=gy/pUHLL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=sx1g5ye6adgoDbOeyAiWR4bH+5HwaMNsR4cQud6nf1o=; b=fc37o8stDO20A/
	f7aileyXc45iKIhjAQxuhrk8IURJJ3b5R81iZNKN1RobCAu+GcQYHDpYMQumt+Vcv7+lYqk1tBCk2
	PZpkQStiGDrtKunQbiuGii/W+Sh53vtD0ux41ru6w5sPIXkBPinA9oXeo11/JwQMMKaTnClFnlNEz
	otbpq2jq8A1rH3ZWBcGJnW6XcASX/GtH9E/7FCllXWWL+J92V2FZ3gICItjFeaTfBlGVcBFBlaJxC
	CEXibVWJVHHkD47cSdOvPlcGyVfsSzHcoxezG0Y5rX+PKMvold3kNTDZ5yxjJbyYho4KfYnlVEkw8
	iJd9ajtGgNgRw6K2Advw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQSPf-00000001DVS-1VCT;
	Mon, 09 Nov 2026 16:40:07 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQSPd-00000001DUk-03Mv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 16:40:06 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-4918c2d727fso566630f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 08:40:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794242403; x=1794847203; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sx1g5ye6adgoDbOeyAiWR4bH+5HwaMNsR4cQud6nf1o=;
        b=gy/pUHLLGLFRG5HR8hMzqGUWg22Z3l1PoGRkn2RMRo/KHx3+zVw0QxXfHhntW3bnYp
         uR32oA6OoIVKkgH1G27/iN0eBioCGNhaIMxckeOcRtex5uGDS2HhXOvT5Du6FgP2KJTd
         hjA7DTH7frHGlAosAtzTbODQnYoOGAM6KeZFvqJZ4KFPVhleway068fzCZNDi2lv2N5l
         v2OdR+LDF5qPT4CW5p9f8X2jAbRK2mwC4a1gX7WF77sEpqVGqxSOgey+XzjdD1iZ/onG
         T5P1GZmkrfTZHj/ZqZl7a6WnyGbsHYwVBVfR436kuD5jcmJF8myeTry59RXMKPqXl7uz
         +y5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794242403; x=1794847203;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sx1g5ye6adgoDbOeyAiWR4bH+5HwaMNsR4cQud6nf1o=;
        b=bwHHKRHLe1P/0xrHbV6DaHBJ+oFwZlIm3BTiQExU48O10LTgLmb/P+olp+9TZgyHZP
         9aPArjh2547cN3zljFvKcwgfMxYIuOR8SuvJfs6vz5QyXnGBun0JkZByAZwDpgn+HxeF
         9DNJR1m5eTVt2QwabVhMSY2Da0VbHNG9uKRCjZh+5fJSZ11Z1Ji+54nar2osRdhPROI9
         0PK/qRZsyJn28cNlO58ztLrE7IruV8jjkoKS3NOezd5kc8HMPptzmC+Cq3JnBxu0Haqg
         F+zebov6CSlMMPeb0sMqsl2ZvCawbZzKw0pOiFzQvS1nNea842zaO4B+LHEDYhgeEYFK
         XjTw==
X-Gm-Message-State: APuU4Z+TuxBUlaSwviFjc661OXLguOBKlckyLlkGcXli5psv0m51af9l
	29J8zqcv4qZDoZVsXHU0imTmuXWa0Pa6nKsz60RuiI3wLrLfXOpNY6VterZTcniX7t8=
X-Gm-Gg: AYBFou0ok50djwQtbvAPBGI0Ieb8sMVf+z0iXl0J7qn1dgKd8peJB0daSoHRabao7oJ
	ILwhPnTR+ytLWr2LBepb+cF30ZNYPVCZieffhAJ0V4NCB1X2S1KAKdjF6yAQH0dMQ8EcrkH+m+D
	ItJbwNbJZz66KWGbE6sUwpMmUB0Gg2I5Xf+K5DJNOz06z8DdA72uNv/aey3ZBKTiBzxoXF/bDkD
	lPTwA01sOhzhtI9RV9YdBUiRy14rTEx8pkQTshcz6gN8v7TEtmiwQq34R/nQK8FRYO9gWtHjHbX
	4HlRAerqMgYAoHpDTcFfTWMnBaVC19g9SHgVN5qf9a21nnC5pBAXjDWJqcLT5BhsyQmpZUCkaUd
	1oHssbPMfgeuzkok2qPQZQ1mxkWv4VKdaBC5DCluFNCJcuKHVLJDoCaL/IW03MbfJ7Ep3IO8t08
	THrTaLBuex7K4nmcFyONdb8eIExGmujquAHGHjZSg+j14PcSqrbT9kIZXZ4mbOsxGBEDY20cOaW
	etPvlPY37Vg5uBLSK6pGe+elEONoOGQvzizPmIoOvMf+aHAdllYHmVI1pXocs6DGhCxFaakq+fH
	SlV0kX2or302gbL3Tg==
X-Received: by 2002:a05:6000:1848:b0:494:bf39:21a5 with SMTP id ffacd0b85a97d-4982e82bf9emr1102f8f.10.1794242402825;
        Mon, 09 Nov 2026 08:40:02 -0800 (PST)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49596ea5008sm11062337f8f.26.2026.11.09.08.40.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 08:40:02 -0800 (PST)
Message-ID: <f8a2f477-2dc7-45a9-a2f0-f6e279ebf8f1@linaro.org>
Date: Mon, 9 Nov 2026 16:40:01 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/23] coresight: trbe: Clear TRBSR status at stop
 sites
To: Leo Yan <leo.yan@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 coresight@lists.linaro.org, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Tamas Petz <tamas.petz@arm.com>, Tamas Zsoldos <tamas.zsoldos@arm.com>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
References: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
 <20261016-trbe_enable_disable_irq_handle_refactor-v2-9-3f57cf3199b1@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20261016-trbe_enable_disable_irq_handle_refactor-v2-9-3f57cf3199b1@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_084005_086501_AE0B317B 
X-CRM114-Status: GOOD (  21.13  )
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
> TRBSR_EL1 records the status of the buffer that just stopped. Clearing
> it in trbe_enable_hw() postpones cleanup until another run starts. If
> AUX output cannot restart, for example when AUX space is exhausted,
> that clear never executes. Clear the status in arm_trbe_disable()
> after disabling TRBE instead.

Why is leaving it set a problem though? That's not mentioned. Maybe 
there is some later patch that requires it?

It seems like clearing on enable is cleaner because it only requires one 
call to clear, but this replaces it with two separate calls without 
really saying what the benefit of the extra complexity is.

> 
> trbe_handle_overflow() can start the next run without calling
> arm_trbe_disable(). Clear the stopped buffer's syndrome and status bits
> while TRBE is disabled, before attempting the AUX restart. This also
> leaves the status clean when the restart fails.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-trbe.c | 10 +++++++++-
>   1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
> index 26e7554d6bdd31f8a55a8bc3a7b6d4c49b984b9b..dd9c9330bb0c739795f300dafc6ce34e72fbf280 100644
> --- a/drivers/hwtracing/coresight/coresight-trbe.c
> +++ b/drivers/hwtracing/coresight/coresight-trbe.c
> @@ -655,7 +655,6 @@ static void trbe_enable_hw(struct trbe_buf *buf)
>   	WARN_ON(buf->trbe_hw_base < buf->trbe_base);
>   	WARN_ON(buf->trbe_write < buf->trbe_hw_base);
>   	WARN_ON(buf->trbe_write >= buf->trbe_limit);
> -	clr_trbe_status();
>   	set_trbe_base_pointer(buf->trbe_hw_base);
>   	set_trbe_write_pointer(buf->trbe_write);
>   
> @@ -1069,6 +1068,8 @@ static int arm_trbe_disable(struct coresight_device *csdev)
>   		return -EINVAL;
>   
>   	trbe_drain_and_disable_local(cpudata);
> +	clr_trbe_status();
> +
>   	buf->cpudata = NULL;
>   	cpudata->buf = NULL;
>   	cpudata->mode = CS_MODE_DISABLED;
> @@ -1095,6 +1096,13 @@ static int trbe_handle_overflow(struct perf_output_handle *handle)
>   	unsigned long size;
>   	struct etm_event_data *event_data;
>   
> +	/*
> +	 * Clear the status. No context synchronization is required here,
> +	 * since context synchronization will be performed before TRBE is
> +	 * re-enabled (see trbe_enable_hw()).
> +	 */
> +	clr_trbe_status();
> +
>   	size = trbe_get_trace_size(handle, buf, true);
>   	if (buf->snapshot)
>   		handle->head += size;
> 


