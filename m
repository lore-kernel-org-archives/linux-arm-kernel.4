Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 108CF606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 15:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gTZGnEhH;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=j2jC7JT1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Bmv319Hm5maWBVqso1uMI60b0Aj3ANtM1HB8/nsvsUc=; b=gTZGnEhH+Z4UGI
	HYsyyLECl0+tSG+zZ2WVz9BSNXkV5dMq3VbY7bP7CA3fZXkiUeAn9szs5Ggx0NNlAvPFmbH5pD/lX
	yLBwzsVM4BxdaUE12eeHN4dLk5KmXuf7cmi3V3Gm9rrIDH49XcR8o0zqg7QDxK66f9V/nnkXnCxtY
	N9o1InmRq1a3ugM9Xgu4L+1mBuG/eP8DI2n17B1I3kPWfrlAWFu62oItA7aqPQwTq2aHvvErj4sMA
	pOy8g6fnLnp30qDrEdFHP1YwbL/qQ/U2WYDSoCxt0JRiPvyl1hTPrG4+v1+kdWT30unwkMnx6w6gd
	IiN+10Wi2w0fmDirQlGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQni0-00000004M8I-3GQ4;
	Tue, 10 Nov 2026 15:24:28 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQnhx-00000004M7y-2fxE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 15:24:26 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4b467581b98so20134195e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 07:24:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794324263; x=1794929063; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bmv319Hm5maWBVqso1uMI60b0Aj3ANtM1HB8/nsvsUc=;
        b=j2jC7JT1vZ0EzgVLmtt19xJOPblNZ5Bucbw+rvzmX1hcaJp0WSLs0pXeoNjE85JQ5Y
         Qj1ftPSlKWkfU2EjzBaByMC2ck3HfFY5bM0yCujvgcarzWokzhODwTt4SwXXnaCNRba6
         /sFnZMKxdBVm0jQISfTvtPZsEcdqIrCRLm0+zXl9oD5zbvvZ2y9B5lPtXySBbjvQB19R
         8jxA20Lm+MGuhuTNaYEmSLPOpqeVo0lVOY7ALFkrumXZ1nS3rejNukBgQUARxcLVmtdN
         Y67Jx2I9pIgXLaBpvWWLSoJhV95ysMW2D00/TtLSLKf7gvJ3ra+/o+7uBfs4KHkm8Pn4
         /Kpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794324263; x=1794929063;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bmv319Hm5maWBVqso1uMI60b0Aj3ANtM1HB8/nsvsUc=;
        b=J+qMFkb5Bjs0p6jsiJ9BtkabS7xSd1m9HQJPwk12WUQMT86Q3nfS1B2gon/bXXT4HD
         w49RQKIIw96ijVdepXE5TEl+bQx625dPci+2/ShUkbXjZv4cilNSGe5jdBb6yrST2jK2
         rsJWTKKkbhrsQnCw8w4+HXLik3CzRQ8O1lF2Ejl+mJn7SvmI6B0kGHSrWOGHeU62+RAs
         W4ipkbrwqi9OcE78dmaUKJjDX9lG2Im7yqrrw+R0WwL238ctqW45AALBSI/b19wQDlXJ
         +9KiRNRwj/eOyQheTB1UCxZ1YWvif2imjVP7Mt+k7zhBE9+Sg7c/pDU5IbZpWHqZJUWL
         LirA==
X-Gm-Message-State: APuU4Z/+fr2RjU2VAWNAHTCen4qTdH1LOJKOSfwMTdjH+AtoIEjOAYoS
	2hKbExGUPInawXyN4rBGKS/8+LHVOYoiXS1z0LvfNsng0alRetcD7OK069R4JeuXRDbl9MUumcG
	ziYEcWrM=
X-Gm-Gg: AYBFou1k4xQzkt1hqQzUQ3YZ5JnyLI0cYmP5wPavIMYedSa1vuLNI+jD27ue5BIk1vm
	TpDTt5g3zZywqg3UYX91M3rFOlSwM/fZU6m4PGAB5WYW+Nkah7el44vbjgoBYU3nnrIcByWH+Wl
	jL5Tpdxdj9J8O5kWqPcETMDuKQb8xCFQPSr0c5hWt0+1aPoaP3pkRocpLlokpI6lknvDCerkKOu
	ajU2MTreWtMfI4gmdu8d7Lt+NQ/G+/ICzMwYk0wjNNsNV2wZrneoYGMoS36vklqSEyX5JgNKcc6
	nZNrCjH/dSDw2/n0KxTOCxoZpukl+HcQ5Gyzj1Ch5BIARYQPYoTaqXCv6G4MByfgja3824YnnvH
	G+QqQhvtsTAlQdORNpAkYvzM6I6KTdP9yNYfAmqH1iU4f5bd9scw8/dT9E1MpcXYwAVIM4Inaqg
	mkzmTZQx0E1Ui/hmS8tVuIVgRaRNJycqespdojuEzKgE8Ih8lrboDfgwYHf2mqBCsxgGQEcaJAZ
	YPKLHdthgjKRsZyPNP5eI22axE6RwB49G6evr8Rs8YdufioFu8trljpkppw/Xt25lv1h+UASPb2
	uBBMAzfDJJeHblE7W2EpFTR3KO8svtYJyg==
X-Received: by 2002:a05:600c:c0d6:b0:4ba:7e6:53d6 with SMTP id 5b1f17b1804b1-4ba07e65578mr11293295e9.33.1794324263251;
        Tue, 10 Nov 2026 07:24:23 -0800 (PST)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0223c41csm71917165e9.14.2026.11.10.07.24.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 07:24:22 -0800 (PST)
Message-ID: <52f2c3c3-b67b-497f-9b21-1ed08842d9d4@linaro.org>
Date: Tue, 10 Nov 2026 15:24:21 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 21/23] coresight: trbe: Read TRBSR after prohibiting
 and flushing trace
To: Leo Yan <leo.yan@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 coresight@lists.linaro.org, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Tamas Petz <tamas.petz@arm.com>, Tamas Zsoldos <tamas.zsoldos@arm.com>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
References: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
 <20261016-trbe_enable_disable_irq_handle_refactor-v2-21-3f57cf3199b1@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20261016-trbe_enable_disable_irq_handle_refactor-v2-21-3f57cf3199b1@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_072425_716118_324406D5 
X-CRM114-Status: GOOD (  30.84  )
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
> The IRQ handler needs a stable TRBSR_EL1 value before classifying the
> interrupt. If the PE can still generate trace, or if pending trace has
> not been flushed, TRBSR can still change while the handler is sampling
> it. This is especially important for TRBSR.S bit, which is used to
> decide whether the TRBE has stopped.
> 
> Move the drain buffer into arm_trbe_prohibit_trace(), so the handler
> first prohibits trace and flushes trace before reading TRBSR_EL1. Once
> this has been done, the IRQ path no longer needs the unconditional
> trbe_drain_and_disable_local(); it only needs to disable TRBE before
> handling the stopped-buffer status.
> 
> Refactor the IRQ exit path accordingly: restore TRFCR on non-truncated
> exits, while the truncated path still runs the perf IRQ work to shut
> down the event.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-trbe.c | 40 +++++++++++++++++++---------
>   1 file changed, 28 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
> index c83c440d4ac13c346bc2a7f9093951c186c90157..36f143a15e680b28aa6ca6a43ad7d3ee134693be 100644
> --- a/drivers/hwtracing/coresight/coresight-trbe.c
> +++ b/drivers/hwtracing/coresight/coresight-trbe.c
> @@ -1207,24 +1207,34 @@ static bool is_perf_trbe(struct perf_output_handle *handle)
>   	return true;
>   }
>   
> -static u64 cpu_prohibit_trace(void)
> +static u64 arm_trbe_prohibit_trace(void)
>   {
>   	u64 trfcr = read_trfcr();
>   
>   	/* Prohibit tracing at EL0 & the kernel EL */
>   	write_trfcr(trfcr & ~(TRFCR_EL1_ExTRE | TRFCR_EL1_E0TRE));
> +
> +	/* Ensure the program-flow trace is flushed */
> +	trbe_drain_buffer();
> +
>   	/* Return the original value of the TRFCR */
>   	return trfcr;
>   }
>   
> +static void arm_trbe_allow_trace(u64 trfcr)
> +{
> +	/* Allow tracing at EL0 & the kernel EL */
> +	write_trfcr(trfcr);
> +}
> +
>   static irqreturn_t arm_trbe_irq_handler(int irq, void *dev)
>   {
>   	struct trbe_cpudata *cpudata = dev;
>   	struct perf_output_handle *handle = cpudata->handle;
>   	enum trbe_fault_action act;
> -	u64 status;
>   	bool truncated = false;
> -	u64 trfcr;
> +	u64 status, trfcr;
> +	irqreturn_t ret;
>   
>   	if (!handle || !perf_get_aux(handle))
>   		return IRQ_NONE;
> @@ -1232,22 +1242,25 @@ static irqreturn_t arm_trbe_irq_handler(int irq, void *dev)
>   	if (!is_perf_trbe(handle))
>   		return IRQ_NONE;
>   
> +	/* Prohibit the CPU from tracing before we disable the TRBE */
> +	trfcr = arm_trbe_prohibit_trace();
> +
>   	/* Reads to TRBSR_EL1 is fine when TRBE is active */
>   	status = read_sysreg_s(SYS_TRBSR_EL1);

I think sashiko is right, you need an isb() between 
arm_trbe_prohibit_trace() and the status read, otherwise it can still be 
stale.

>   	/*
>   	 * If the pending IRQ was handled by update_buffer callback
>   	 * we have nothing to do here.
>   	 */
> -	if (!is_trbe_irq(status))
> -		return IRQ_NONE;
> +	if (!is_trbe_irq(status)) {
> +		ret = IRQ_NONE;
> +		goto out;
> +	}
>   
> -	/* Prohibit the CPU from tracing before we disable the TRBE */
> -	trfcr = cpu_prohibit_trace();
>   	/*
>   	 * Ensure the trace is visible to the CPUs and
>   	 * any external aborts have been resolved.
>   	 */
> -	trbe_drain_and_disable_local(cpudata);
> +	set_trbe_disabled(cpudata);
>   	clr_trbe_irq();
>   	isb();
>   
> @@ -1272,12 +1285,15 @@ static irqreturn_t arm_trbe_irq_handler(int irq, void *dev)
>   	 * Otherwise, restore the trace filter controls to
>   	 * allow the tracing.
>   	 */
> -	if (truncated)
> +	if (truncated) {
>   		irq_work_run();
> -	else
> -		write_trfcr(trfcr);
> +		return IRQ_HANDLED;
> +	}
>   
> -	return IRQ_HANDLED;
> +	ret = IRQ_HANDLED;
> +out:
> +	arm_trbe_allow_trace(trfcr);
> +	return ret;
>   }
>   
>   static int arm_trbe_save(struct coresight_device *csdev)
> 


