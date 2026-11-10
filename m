Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC52606A321
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 15:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xlzm1JKx;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=AV+QwpIL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=iYb4BTtIT+3+iVfeGEaZVxZUER7UNE71+aSo0E/ZqUo=; b=xlzm1JKx73GjmL
	+3TikhgpL2vkM/TKgLaNkR/ujEOmLvA/5k7S/eCcD+yGCo02aMRwRWHEbQuG0r3+Vf/vu9BHCZH0W
	dApJtyMOmGvU0YBCIi7bVOxTOm7LxVhVQgO2Y2LP3oNjvrDvCvW2kswkjAkhiNeT7y/OlzjmcT1Mt
	DOJkL7H+Jujg+TNDyJOGH5Qwbmi87GAugbDxky9RlAGhNK1XqBUC2nM2xQ5MwvEh4OxKA5GSPDFpw
	qhXvETdExpk1MzABLwJs9fcPTHdS6ZFKbdVdkzJF8IH04ngtRTgP01iwCprg9CpgqssLKkzr85Q+u
	2gOfaLLqosmNaejyFLdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQnrd-00000004Ow1-1oxm;
	Tue, 10 Nov 2026 15:34:25 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQnra-00000004Oub-2mXD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 15:34:23 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4a5720b0a57so13144225e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 07:34:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794324861; x=1794929661; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iYb4BTtIT+3+iVfeGEaZVxZUER7UNE71+aSo0E/ZqUo=;
        b=AV+QwpIL2BdkUKxl2viM5IjgWapj6qeI889CTrkBrCO+WewQWknI497xAfGNad0CJu
         uR/L7SHjGixeUe3F7/lnN8bfkYXkSgOAd7Rn2bc9zfHFx8pb2o/nkK6N9FTdjuEncr/L
         4OuOWqu7ck9wVKOK2zTeBhQxytg6kBWN1UB7X85d0+upix4U3MFIed2VMdY9BRzLr7UG
         1J0uWX8ny4wjVacDVKkhmyzBQ13jBcLXZpXLQiyXFBInP5acO/sGdSpMwN4v/ssXxyAK
         ASLDPP6iPBWelEd28bnsKrtH4ovYzMwMdn+Ylt6mZG+hG+7WnTNkz7cfrnJZVo/8L3aW
         /Png==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794324861; x=1794929661;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iYb4BTtIT+3+iVfeGEaZVxZUER7UNE71+aSo0E/ZqUo=;
        b=QXJdN1zw7MI4R+26cgzsbNCjd2gCPz/GrRFWahWMavpk6zTejt+LAIFwpl02sxEWpW
         hnrszBmVgfaKa1Gu6OW/SinMK0Z7fHZK7MsyqLjN3i/+iTIAQDz5qzGzHpeor/f2AC9H
         5evV8DtqZKG4NwRZE0USc2korS2VbvFzGzPv9h/dseoANjBe/clGlDHNY8lCmEOcMDx9
         VyO03JgAXiANHBk9O2V7eGobmaU4xIGlSkKVZvDgnhyyPQGEos7shZeBmMPWYQz6O2OW
         C4fGVCULMxW2Ht7YGoRfcP/ZstI1vf4uGOuwF7yFJyD/a8USgbYycB9Aex8nI9pE4Il3
         J56g==
X-Gm-Message-State: APuU4Z/icbK4mZGEPXcwKMdTNNARmgKK5Ob2Mf2BB4FLNzTA+SR8cXvl
	u3MMoQVZ4Imp6ndYqgNTo2YdSRJHYYfIlVR/d6ykvK+kqFdeMFRz7KP6KJCGJMlUdIY=
X-Gm-Gg: AYBFou3/h5VY9cYUDSiNz7K3amGewP4hqSJBvhzDh/I7YKUUbl/4JKDVzkPPWUjxU5y
	LiM7zeDFC/D0F1GiRp+KwDftlE5ns0BgU2b7p3MRCcX+MZSnfOM0HhssSGAmCy/Hc64NNoETEVo
	4KdrJ9qa+m93W6AO8QA0ZboEr+oqr9XBjqZJwiaji2zeRR0i9TM2u6DWTjwX73w943OoSjpe08V
	Mwx2gol5T5SrCheA9jBAXsjcVBiBBJoH5UskOC62slzwLWZA7j5tlFq47zfkWoQeVJYvL0rlz/u
	94Zch9SW/1H+PvcTaqPE+RaBHmTDFy9hvxAMrpNenekzCeZ2wDeHtEr3P+TA3JjE7XD2Cnt815j
	GpAwjFZaeJZ2AsxBAuHs5HG/UtowsOUIZgm5ug3xQd4qErebuYIWGaLyS4sou8yw734fhJsaHUN
	MSC7PG97EOJ3zWwToS+aEY5NNwAkN9fd+Ka5MF1shAYiqVFCK1trZP56ShOtIvHmJuldM9twxW7
	q276KkYC3alvwDpwAjbAB6EQl18HJrWnVTSxsVinsh6qmO4+2YN+xOy031fo35sWf+Wtzx1HsUV
	DMzkf3PXSMZV856TSC+vYa5DymUHlAf83dc=
X-Received: by 2002:a05:600c:348a:b0:4a1:efbe:529c with SMTP id 5b1f17b1804b1-4ba0234d97amr53166635e9.12.1794324860684;
        Tue, 10 Nov 2026 07:34:20 -0800 (PST)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba02242bd9sm65434465e9.15.2026.11.10.07.34.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 07:34:20 -0800 (PST)
Message-ID: <617d1821-ddbf-42fb-bb02-75aaacda21eb@linaro.org>
Date: Tue, 10 Nov 2026 15:34:19 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 17/23] coresight: trbe: Calculate trace size across
 buffer wrap
To: Leo Yan <leo.yan@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 coresight@lists.linaro.org, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Tamas Petz <tamas.petz@arm.com>, Tamas Zsoldos <tamas.zsoldos@arm.com>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
References: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
 <20261016-trbe_enable_disable_irq_handle_refactor-v2-17-3f57cf3199b1@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20261016-trbe_enable_disable_irq_handle_refactor-v2-17-3f57cf3199b1@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_073422_741819_CEB81EAF 
X-CRM114-Status: GOOD (  32.60  )
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
> trbe_get_trace_size() assumes that the TRBE write pointer is always ahead
> of the perf AUX head. That is not true after a WRAP event, where the write
> pointer can move back to the start of the programmed TRBE span.
> 
> Calculate the size in two parts for WRAP: the bytes from the current AUX
> head to TRBLIMITR_EL1, plus any bytes from TRBBASER_EL1 to the current
> TRBPTR_EL1. Keep the non-WRAP path strict and reject an unexpected write
> pointer below the AUX head.
> 
> For CPUs affected by the overwrite-fill-mode or write-out-of-range errata,
> continue to ignore TRBPTR_EL1 on WRAP and account data only up to
> TRBLIMITR_EL1, since bytes beyond the programmed limit are uncertain.
> 
> Apply this fallback before validating the write pointer so a WRAP report
> with a pointer outside the programmed range still publishes the trace
> from the AUX head to the programmed limit.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-trbe.c | 62 +++++++++++++++++-----------
>   1 file changed, 37 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
> index 661f4a78e67c30652de8c834e4773819fa67b5ac..9a469c8009ce8a8a8b804c2b63a68e741f1dceaa 100644
> --- a/drivers/hwtracing/coresight/coresight-trbe.c
> +++ b/drivers/hwtracing/coresight/coresight-trbe.c
> @@ -730,43 +730,55 @@ static enum trbe_fault_action trbe_get_fault_act(struct perf_output_handle *hand
>   static unsigned long trbe_get_trace_size(struct perf_output_handle *handle,
>   					 struct trbe_buf *buf, bool wrap)
>   {
> -	u64 write;
> -	u64 start_off, end_off;
> -	u64 size;
>   	u64 overwrite_skip = TRBE_WORKAROUND_OVERWRITE_FILL_MODE_SKIP_BYTES;
> +	u64 base = buf->trbe_base;
> +	u64 start_off = PERF_IDX2OFF(handle->head, buf);
> +	u64 write = get_trbe_write_pointer();
> +	u64 limit = get_trbe_limit_pointer();
> +	u64 limit_off, write_off, size;
>   
>   	/*
> -	 * If the TRBE has wrapped around the write pointer has
> -	 * wrapped and should be treated as limit.
> -	 *
>   	 * When the TRBE is affected by TRBE_WORKAROUND_WRITE_OUT_OF_RANGE,
> -	 * it may write upto 64bytes beyond the "LIMIT". The driver already
> +	 * it may write up to 64bytes beyond the "LIMIT". The driver already
>   	 * keeps a valid page next to the LIMIT and we could potentially
>   	 * consume the trace data that may have been collected there. But we
>   	 * cannot be really sure it is available, and the TRBPTR may not
> -	 * indicate the same. Also, affected cores are also affected by another
> -	 * erratum which forces the PAGE_SIZE alignment on the TRBPTR, and thus
> -	 * could potentially pad an entire PAGE_SIZE - 64bytes, to get those
> -	 * 64bytes. Thus we ignore the potential triggering of the erratum
> -	 * on WRAP and limit the data to LIMIT.
> +	 * indicate the same.
> +	 *
> +	 * Also, affected cores are also affected by another erratum
> +	 * TRBE_WORKAROUND_OVERWRITE_FILL_MODE, which forces the PAGE_SIZE
> +	 * alignment on the TRBPTR, and thus could potentially pad an entire
> +	 * PAGE_SIZE - 64bytes, to get those 64bytes. Thus we ignore the
> +	 * potential effects of the erratum on WRAP and limit the data to
> +	 * LIMIT.
>   	 */
> -	if (wrap)
> -		write = get_trbe_limit_pointer();
> -	else
> -		write = get_trbe_write_pointer();
> +	if (wrap &&
> +	    (trbe_may_overwrite_in_fill_mode(buf->cpudata) ||
> +	     trbe_may_write_out_of_range(buf->cpudata)))
> +		write = limit;
>   
> -	/*
> -	 * TRBE may use a different base address than the base
> -	 * of the ring buffer. Thus use the beginning of the ring
> -	 * buffer to compute the offsets.
> -	 */
> -	end_off = write - buf->trbe_base;
> -	start_off = PERF_IDX2OFF(handle->head, buf);
> +	/* Should never happen ... */
> +	if (WARN_ON_ONCE(write < base || write > limit))
> +		return 0;
>   
> -	if (WARN_ON_ONCE(end_off < start_off))
> +	limit_off = limit - base;
> +	write_off = write - base;
> +
> +	if (WARN_ON_ONCE(start_off >= limit_off))
>   		return 0;
>   
> -	size = end_off - start_off;
> +	if (!wrap) {
> +		if (WARN_ON_ONCE(write_off < start_off))
> +			return 0;
> +
> +		size = write_off - start_off;
> +	} else {
> +		size = limit_off - start_off;
> +
> +		if (write != limit)
> +			size += write_off;
> +	}
> +
>   	/*
>   	 * If the TRBE is affected by the following erratum, we must fill
>   	 * the space we skipped with IGNORE packets. And we are always
> 
Reviewed-by: James Clark <james.clark@linaro.org>

