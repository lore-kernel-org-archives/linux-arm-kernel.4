Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3729A606A320
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 15:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KQC0prwM;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=UXJ3h6Jn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=+Sc8+E7NzYjXnp+JW1pX3E6P5CdKsFyTsU2jebgSnJ8=; b=KQC0prwMSduRTw
	/RPwnczrxokx1FNxzo+rX2Wy4XphYsvX1x6KGTyiil7PfozlG/IVQIoec4jR1hZ1u6sFw/2q5JHkG
	LT84feENUmKB3ASj99Kb6qXcT/3SkYhMS4j9Ul0WpBsRu1vcZoFWFpN/3XkVydu8T8phOhG4/7bSS
	FYCcTCAI74OFos1TLk/J4GBUaYdV0oK2HyI+31URg+RwUU1oLsyJS+qWug3vUc9FhOFJatjm3IZ9k
	vsZpN4CRFe+66LnwbtNv1L28senqV+c1u58S7p2cPzBlJ8n+EuPo8sIs3mhTpfEs29YEW5SnWMguV
	8Zv8N+aluzGjLyc8OVgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQnsp-00000004PfI-45Al;
	Tue, 10 Nov 2026 15:35:39 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQnsn-00000004Pbr-0aTM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 15:35:38 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so21503905e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 07:35:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794324935; x=1794929735; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+Sc8+E7NzYjXnp+JW1pX3E6P5CdKsFyTsU2jebgSnJ8=;
        b=UXJ3h6JnuO7DFRzwJZMO5ZyZINAlsEcLCuGdxmIB0AfMEBnIcMya1dAGivcHBeFggu
         ZA7tUr8/+Lx1x2Txz3GtW9M9B6707rUxQBJR5Gi2dGy64XzYTYz3Jdwx1tZQwX1rEJoI
         4e6pAwtOY5tAIftkLPg9OrdLC4icDW3C3KwVGCApdJ8zjCXBGoJXnSfo+k2h72xaD5E+
         4QPOoGtVKb+Z+nnC26O+3rPb8/uyV4oDs9utvO+1OV5nsZkQkLo/zhMDjc/j7m8A/Byq
         o29Y01mpSlgQOBEH+WfKZm3i5CsrAwbUccLe5M4rhsNRXeWcLIHqON0ZLSz/4JRfOZ5E
         /S6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794324935; x=1794929735;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+Sc8+E7NzYjXnp+JW1pX3E6P5CdKsFyTsU2jebgSnJ8=;
        b=X92q3zvxheziLpRdDLyKq1Ejn0AuWj6p/nl06RLpRni1F5ZKoZ33+pk5+ARAM2UDQw
         0Xpb9aThQT6yFxa0tcrYOaE+fh9rxCLAors0cl566quFypVUtdcb6dC1Ic259fafU4YI
         qs/h+FCEzDYSRwqRugLMHtDFJeQWpPgr9/UKLKuJQwE6Z7SyTb0l5Gn/Qgm8NOUxBqrR
         Ai9L7OLP/F6I1e8bnfLle8MpmK93FFjBkiiClCFKZAXMGadYdhHH//U/oL5hYlx95Lil
         4QDtvM47l/R7b8oF1xMait4pMJCVxsAgzEAUX1IfVUTESeAxEgZAd0beb/sO8jh5idbN
         LKYA==
X-Gm-Message-State: APuU4Z/ZYvDS3pTWRb+8TuDtbIogdKGGizYWXnDc0CrkiJDZA1pkbgcP
	SND0L68OyF88+NigpJH3UVCMI3PFnlgbJQ27FJTd7F00HOoLMvSPqsk+F2iPdaQ8NhQ=
X-Gm-Gg: AYBFou0Ax73OxLRXEGt8+bQV8HZDaFCgsCX/jbjAMv31TsYCmXaFskAyYO60baJHK8O
	lx9F5ThZ5kHJuW3J+3vbBwcPZojLttwKrYldOyBwKZqVhaWGqwLzCjPNctvWBtgaiEeaggF/fEW
	Gtyio3NlMq6QweKbefmwKEP6RtIm9J0/AFY6f8BDkqYCHQ+UFPoNsr19yr3xsS9+VojYZ7/MSPN
	obqxAvRuHRVVneZ69ynSXGaQG63kBOUOKkMulZ3dBnp7mA8kp5lACKzNA3LqSUFrTv/K3eGQwFo
	VNLxqxzHvq7h9Wl2iEZGTSEU85We1DntJUYlboJUHvenJRKqfOY0haQFQhDGO431IERXUt67Llt
	6SrIBaupJ+6Yg0FHm4Fp4ysF6nSXMoONQjkb/VS7bZkB2UtqJ51S9FXUgYMbYsOQf06iXEGbK1I
	8Dpv4d04UaXEkXvxWZq3iS1FFq+NOU9lw3aBPHscYmd5ZHh00IOgKlCdVyjs/tKuaifjLV8pVbT
	qIqiecour791RCaV2R0fDL61Wf4fMQsBazIMK36u/19+LuRpGHE+A5K7ZRpC5pTdD6FCTIKkyuq
	4oz5slTwFmn5TDB63ffK4zjJX2nfG+PJVbU=
X-Received: by 2002:a05:600c:3544:b0:4a2:a3b:7aa8 with SMTP id 5b1f17b1804b1-4ba023053d6mr59691535e9.3.1794324935300;
        Tue, 10 Nov 2026 07:35:35 -0800 (PST)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498363dffa1sm5521925f8f.39.2026.11.10.07.35.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 07:35:34 -0800 (PST)
Message-ID: <85fb9774-c61e-4811-a023-b3171a289e21@linaro.org>
Date: Tue, 10 Nov 2026 15:35:33 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 23/23] coresight: trbe: Report trace gaps with PARTIAL
 instead of COLLISION
To: Leo Yan <leo.yan@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 coresight@lists.linaro.org, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Tamas Petz <tamas.petz@arm.com>, Tamas Zsoldos <tamas.zsoldos@arm.com>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
References: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
 <20261016-trbe_enable_disable_irq_handle_refactor-v2-23-3f57cf3199b1@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20261016-trbe_enable_disable_irq_handle_refactor-v2-23-3f57cf3199b1@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_073537_217004_4B2EB0EF 
X-CRM114-Status: GOOD (  27.98  )
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
> When a fill-mode wrap stops TRBE, the trace source can continue running
> until software handles the stop. Trace generated during this interval
> may be lost.
> 
> The overflow path now stops and restarts the trace source around buffer
> reprogramming. This emits ASYNC packets so the decoder can synchronize
> with the next trace segment. Use PERF_AUX_FLAG_PARTIAL to report the
> possible gap instead of PERF_AUX_FLAG_COLLISION.
> 
> Set PARTIAL in both the overflow handler and the buffer update callback.
> This also preserves the gap indication when event shutdown handles a
> pending wrap, even if no further trace segment follows. Limit the flag
> to stopped buffers.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-trbe.c | 29 +++++++---------------------
>   1 file changed, 7 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
> index 6bc82d5b55539795059da37039d2929b4ea504e3..29a1882b1f3c2eb7166f71eeef37badece67039c 100644
> --- a/drivers/hwtracing/coresight/coresight-trbe.c
> +++ b/drivers/hwtracing/coresight/coresight-trbe.c
> @@ -285,25 +285,6 @@ static void trbe_reset_local(struct trbe_cpudata *cpudata)
>   	write_sysreg_s(0, SYS_TRBSR_EL1);
>   }
>   
> -static void trbe_report_wrap_event(struct perf_output_handle *handle)
> -{
> -	/*
> -	 * Mark the buffer to indicate that there was a WRAP event by
> -	 * setting the COLLISION flag. This indicates to the user that
> -	 * the TRBE trace collection was stopped without stopping the
> -	 * ETE and thus there might be some amount of trace that was
> -	 * lost between the time the WRAP was detected and the IRQ
> -	 * was consumed by the CPU.
> -	 *
> -	 * Setting the TRUNCATED flag would move the event to STOPPED
> -	 * state unnecessarily, even when there is space left in the
> -	 * ring buffer. Using the COLLISION flag doesn't have this side
> -	 * effect. We only set TRUNCATED flag when there is no space
> -	 * left in the ring buffer.
> -	 */
> -	perf_aux_output_flag(handle, PERF_AUX_FLAG_COLLISION);
> -}
> -
>   static void trbe_truncate_event(struct perf_output_handle *handle)
>   {
>   	perf_aux_output_flag(handle, PERF_AUX_FLAG_TRUNCATED);
> @@ -917,10 +898,12 @@ static unsigned long arm_trbe_update_buffer(struct coresight_device *csdev,
>   		perf_aux_output_flag(handle, PERF_AUX_FLAG_TRUNCATED);
>   		size = 0;
>   		goto done;
> -	} else if (act == TRBE_FAULT_ACT_WRAP) {
> -		trbe_report_wrap_event(handle);
>   	}
>   
> +	/* Trace may have been lost before the source was stopped. */
> +	if (act == TRBE_FAULT_ACT_WRAP && !is_trbe_running(status))
> +		perf_aux_output_flag(handle, PERF_AUX_FLAG_PARTIAL);
> +
>   	size = trbe_get_trace_size(handle, buf, act == TRBE_FAULT_ACT_WRAP);
>   
>   done:
> @@ -1246,7 +1229,9 @@ static int trbe_handle_overflow(struct trbe_cpudata *cpudata,
>   	if (buf->snapshot)
>   		handle->head += size;
>   
> -	trbe_report_wrap_event(handle);
> +	if (is_buffer_stopped)
> +		perf_aux_output_flag(handle, PERF_AUX_FLAG_PARTIAL);
> +
>   	perf_aux_output_end(handle, size);
>   	event_data = perf_aux_output_begin(handle, event);
>   	/*
> 
Reviewed-by: James Clark <james.clark@linaro.org>

