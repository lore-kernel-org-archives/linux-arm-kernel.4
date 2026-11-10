Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A7C60A2614
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 15:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Oet/ahGU;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=kIHe2Nwy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=NNEimUxoh8N9f7kKCUbQLMGpNQjJl22yyVS/gX08dYA=; b=Oet/ahGUQ0gYHz
	BSgJJ0BiKY98S5gzTaYBQDgTymb3jghSLIvUVGSbhJb4KhekB5b8chqX0Yojn55E8HsnlRhR6MjZ7
	GAXeAD40g64Sm/6/MwRynrGPbyWypxjJ+/fJPvaHswXXM/6ltm0miQKcwlPArGZl6L66YPjZSq2xI
	jt9+Wufc6jhbRq3g5gRVWFp0Z7uxCstqmMxwRRm1u6KhUhntPNFStL8wAy+Qxw02+5z1VfI4m9JNR
	To1WJ4xNleiO/wLZ1W3tla7UFxHouveuXaoNpA6UrlrBxBRRlBOj14vrnqsaAksMmNXj83ZfRVEai
	pxbklhKcIRkCF8gOiEjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQnse-00000004PVL-2mFY;
	Tue, 10 Nov 2026 15:35:28 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQnsV-00000004PNn-1avd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 15:35:20 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-48e3b22e971so1174968f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 07:35:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794324917; x=1794929717; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NNEimUxoh8N9f7kKCUbQLMGpNQjJl22yyVS/gX08dYA=;
        b=kIHe2NwyMyRF1Sukygnfy3Et/cFdfYXsT9NYLIEWu8Y8NnUZZWyPAsAy6LTgsa271W
         hWiD3ofwirjdIOG7WnofA8RUC2MI7pjqrYpXFK+Q/4jJTKYKNtYxSvmcSRXVN2gbzlR+
         JWJK0HvG8KrHwu8iQhqXqrS/oCXJrdVfSRrEp5UIxa6RMnyPHKZARyxBUN2EB4z+Kkvi
         TD9Jb7DRWuV3gS64fFFzhZGfv6RShx7bJtsE7b491I92H6kJqIvD2VYdFd0Cw77x1sqI
         TjtWZETmbGoBEByxdKQly+r/pcQCiPinq/uSeLQetmpIiuDVd5MZQ5Xei400xtS75kwZ
         BXyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794324917; x=1794929717;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NNEimUxoh8N9f7kKCUbQLMGpNQjJl22yyVS/gX08dYA=;
        b=B+BGZgNcLGMmTO5Bb8beQu6dLZFy94CMtJwtLGYXjui/9QROe5offRPtSkt02Mqysh
         0fGejl68c3deI+WCwHKaQWK82R3XrxfT5fOKhoFz9p8IVMGN+7+JzMM1AXknmhigxqYx
         XmnSq4QkfdW+lYUO4gLxYXrfCW0nA4ttgIbbk8WBK/h5kkF5PyFG+p9/JpLmKw5mRqFx
         cNfHwyTu7nicjXDtXfm5KyPLTm+okQMU11J6eMbMAnBmySB1YFVS+yO96Iog/MOfy7Hq
         hxQv73vu+3Eqmkcrvtp3ytT6yIjyP2dWwvzFKexVATwBPnBNa8Awqfa77EjtNnwcMh04
         PTiQ==
X-Gm-Message-State: APuU4Z+QlEn866qn2CV38wiN3yF8UH92MeWy978W2qBJg82m9GOjrxQE
	cp+3O3l2Tc1jqZmQbcQvAU9vXiv3+7VpQDlyEkUSe0NumsvfAYrlH3/2FiqIK4MMxCw=
X-Gm-Gg: AYBFou2Zas9RIjbHGKZ3Nj4DDi+0lElKC4WEmGkdTxjebUMeabLaZfI6olUxwTYHykg
	phJMCdZWTn8FuPDD4V7iWg+c0QhSdCbtTrXiZx65O4ss3REutJZ+F2zI0DjesWB4QiLsp+6qKHv
	hhWs0k2EU9SQboxRF6dtA8TaUODr+UV8rBvZP7JtXb/JQkGthbgYlDvJwXRrcKTlfriN/SB5QVl
	XOjtwIRrsrutokxO7c/Jc7EsCmQshUf2BXTGORXMFkELeEkTPDGajnfsE6rqgera+PuMNde22sG
	exLYSt99UoC9h2YToq2aSp0eBIdlyyFdSR82HtA0A0rO/krB2wROYWj5K3xFSGpaFWCjN4RlRey
	pzqpSJ1AxwbxDwL5/2yY3M37oJoiPZ2a0gHZiio99q/dZUb6ACanFEqCLKRfhOsicSMpaC6rzbQ
	+qjjUu/BNp9uaiSxPvJBrCO+FPVYqfIdjBHCwB6J9ZaaHT2Za+2hueIUTwkc6LigOzghvybLQqf
	HYbzwEOpyAGhoFvAV42qhl5Q+mgzVjOmGYAedrladxrxVXVIm+iCF6fpGXlnX/YI+V5WCXHOa5s
	iODuUjFWAYoT05mGE2g=
X-Received: by 2002:a05:6000:4709:b0:48d:e5c9:39a4 with SMTP id ffacd0b85a97d-498302fb5camr5282051f8f.33.1794324917314;
        Tue, 10 Nov 2026 07:35:17 -0800 (PST)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49895f4e6ffsm4392423f8f.16.2026.11.10.07.35.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 07:35:16 -0800 (PST)
Message-ID: <71dd5516-495e-44e7-baa2-c38c544835ac@linaro.org>
Date: Tue, 10 Nov 2026 15:35:15 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 22/23] coresight: trbe: Restart trace source for
 stopped buffers
To: Leo Yan <leo.yan@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 coresight@lists.linaro.org, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Tamas Petz <tamas.petz@arm.com>, Tamas Zsoldos <tamas.zsoldos@arm.com>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
References: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
 <20261016-trbe_enable_disable_irq_handle_refactor-v2-22-3f57cf3199b1@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20261016-trbe_enable_disable_irq_handle_refactor-v2-22-3f57cf3199b1@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_073519_481937_9DB7E7C5 
X-CRM114-Status: GOOD (  32.84  )
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
> When TRBSR reports a stopped buffer, the IRQ handler closes the current
> AUX buffer and programs TRBE for the next run. This creates a trace
> discontinuity. User tool has to reset the decoder when moving to the
> next AUX data block, which can reduce decoded trace coverage.
> 
> Stop and restart the trace source around TRBE reprogramming for stopped
> buffers. This emits ASYNC packets, allowing the decoder to recognize
> discontinuity without a full reset.
> 
> This duplicates part of the trace source enable/disable code in the
> ETMv4 driver. Reusing that code would require splitting the ETMv4
> callbacks into finer-grained helpers that TRBE can call, which would
> make the change much larger. Keep the TRBE change self-contained for
> now.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-trbe.c | 121 +++++++++++++++++++++++++--
>   1 file changed, 116 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
> index 36f143a15e680b28aa6ca6a43ad7d3ee134693be..6bc82d5b55539795059da37039d2929b4ea504e3 100644
> --- a/drivers/hwtracing/coresight/coresight-trbe.c
> +++ b/drivers/hwtracing/coresight/coresight-trbe.c
> @@ -17,9 +17,11 @@
>   
>   #include <asm/barrier.h>
>   #include <asm/cpufeature.h>
> +#include <linux/iopoll.h>
>   #include <linux/kvm_host.h>
>   #include <linux/vmalloc.h>
>   
> +#include "coresight-etm4x.h"
>   #include "coresight-self-hosted-trace.h"
>   #include "coresight-trbe.h"
>   
> @@ -1132,14 +1134,106 @@ static void trbe_handle_spurious(struct trbe_cpudata *cpudata)
>   	set_trbe_enabled(cpudata, trblimitr);
>   }
>   
> +static u64 read_sys_trcstatr(void)
> +{
> +	/* Context synchronization for each polling */
> +	isb();
> +	return read_sysreg_s(SYS_TRCSTATR);
> +}
> +
> +static int arm_trbe_start_tracer(u64 trcprgctlr)
> +{
> +	u64 val;
> +
> +	/* A pending IRQ after AUX pause? */
> +	if (!(trcprgctlr & BIT(0)))
> +		return 0;
> +
> +	/* Restore the saved tracer state */
> +	write_sysreg_s(trcprgctlr, SYS_TRCPRGCTLR);
> +
> +	/*
> +	 * Context synchronization between writing to the TRCPRGCTLR and
> +	 * reading the TRCSTATR.
> +	 */
> +	isb();
> +
> +	/* Wait for TRCSTATR.IDLE to go down to 0 */
> +	if (read_poll_timeout_atomic(read_sys_trcstatr, val,
> +				     !(val & BIT(TRCSTATR_IDLE_BIT)),
> +				     1,		/* delay_us */
> +				     TIMEOUT_US, /* timeout_us */
> +				     false)) {	/* delay_before_read */
> +		pr_err("TRBE: timeout for TRCSTATR IDLE\n");
> +		return -ETIME;
> +	}
> +
> +	/* Context synchronization after programming the tracer */
> +	isb();
> +
> +	return 0;
> +}
> +
> +static int arm_trbe_stop_tracer(u64 *trcprgctlr)
> +{
> +	u64 val;
> +
> +	/* Disable tracer and save trcprgctlr */
> +	*trcprgctlr = read_sysreg_s(SYS_TRCPRGCTLR);
> +
> +	/* No need to stop tracer again */
> +	if (!(*trcprgctlr & BIT(0)))
> +		return 0;
> +
> +	write_sysreg_s(*trcprgctlr & ~BIT(0), SYS_TRCPRGCTLR);
> +
> +	/*
> +	 * Context synchronization between writing to the TRCPRGCTLR and
> +	 * reading the TRCSTATR.
> +	 */
> +	isb();
> +
> +	/*
> +	 * PMSTABLE alone does not permit re-enabling the tracer.
> +	 * Wait for TRCSTATR.IDLE to go to 1.
> +	 */
> +	if (read_poll_timeout_atomic(read_sys_trcstatr, val,
> +				     val & BIT(TRCSTATR_IDLE_BIT),
> +				     1,
> +				     TIMEOUT_US,
> +				     false)) {
> +		pr_err("TRBE: timeout for TRCSTATR IDLE=1\n");
> +		return -ETIME;
> +	}
> +
> +	/* Context synchronization after programming the tracer */
> +	isb();
> +
> +	return 0;
> +}
> +
>   static int trbe_handle_overflow(struct trbe_cpudata *cpudata,
> -				enum trbe_fault_action act)
> +				enum trbe_fault_action act,
> +				bool is_buffer_stopped)
>   {
>   	struct perf_output_handle *handle = cpudata->handle;
>   	struct perf_event *event = handle->event;
>   	struct trbe_buf *buf = etm_perf_sink_config(handle);
>   	unsigned long size;
>   	struct etm_event_data *event_data;
> +	u64 trcprgctlr = 0;
> +	int ret = 0;
> +
> +	/*
> +	 * Since the trace buffer has stopped, disable and re-enable the
> +	 * tracer to generate ASYNC packets. This allows the decoder to
> +	 * recognize the discontinuity in the trace stream.
> +	 */
> +	if (is_buffer_stopped) {
> +		ret = arm_trbe_stop_tracer(&trcprgctlr);
> +		if (ret)
> +			goto truncate_event;
> +	}
>   
>   	/*
>   	 * Clear the status. No context synchronization is required here,
> @@ -1172,11 +1266,27 @@ static int trbe_handle_overflow(struct trbe_cpudata *cpudata,
>   	 */
>   	buf = etm_perf_sink_config(handle);
>   	if (!buf || buf->cpudata != cpudata) {
> -		trbe_truncate_event(handle);
> -		return -EINVAL;
> +		ret = -EINVAL;
> +		goto truncate_event;
> +	}
> +
> +	ret = __arm_trbe_enable(buf, handle);
> +	if (ret)
> +		return ret;
> +
> +	if (is_buffer_stopped) {
> +		ret = arm_trbe_start_tracer(trcprgctlr);
> +		if (ret) {
> +			trbe_drain_and_disable_local(cpudata);
> +			goto truncate_event;
> +		}
>   	}
>   
> -	return __arm_trbe_enable(buf, handle);
> +	return 0;
> +
> +truncate_event:
> +	trbe_truncate_event(handle);
> +	return ret;
>   }
>   
>   static bool is_perf_trbe(struct perf_output_handle *handle)
> @@ -1267,7 +1377,8 @@ static irqreturn_t arm_trbe_irq_handler(int irq, void *dev)
>   	act = trbe_get_fault_act(handle, status);
>   	switch (act) {
>   	case TRBE_FAULT_ACT_WRAP:
> -		truncated = !!trbe_handle_overflow(cpudata, act);
> +		truncated = !!trbe_handle_overflow(cpudata, act,
> +						   !is_trbe_running(status));
>   		break;
>   	case TRBE_FAULT_ACT_SPURIOUS:
>   		trbe_handle_spurious(cpudata);
> 
Reviewed-by: James Clark <james.clark@linaro.org>

