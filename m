Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F547606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 15:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=48qokNaM;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=OrG3TV0B
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=7vlfz2YIOMsDpcgqil+TjE1DMAtwKpgtIEmyD66S1fo=; b=48qokNaMiDPIsT
	DW3WT4lzgxu93ZVHxosM6dbKLDnC4SlhtVjTL48VNlar0grjwiETwzp/q2JbKT/q9XZYopxqdDvdx
	3NyntewEritFwOU3gVviUZiTHKbK9kVi3ZhPP6JqHjHu/KgbuMBrkD1Y4vq0xFjJidaWWMjRKudNJ
	65MMrE/NIn5w7WhjmvvNXUKLGia0tAxK4vG6sPxHg1w0z4y02kfmyXkQfph8uXI9dSjMaqM/y6xvO
	RmPHa1Qz8M79sSdK2BsjOxr90iCk7hcnubEYPjYL63qwvaOc2G8uDWTYs+iOVwgAvc1yjRDMe23/T
	Z4SucHc+1pgqeKjG00cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWay1-0000000DeIN-0BIP;
	Thu, 26 Nov 2026 15:00:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWaxx-0000000DeH9-1iEa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 15:00:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 35C811BA8;
	Thu, 26 Nov 2026 07:00:47 -0800 (PST)
Received: from [10.2.197.99] (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6BC1A3F86F;
	Thu, 26 Nov 2026 07:00:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795705250; bh=0v9eO+W3RIJoIsk5MXrKv8kB1hjR+PMVi3bSCo2sPMs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OrG3TV0BjDDQtO89hf9CzY5NHvPY5KIPoBbiZ1loHZloMGV1TxRlJyliVPydymdET
	 LS/WOwxi6aluc8ieVauOJeFcpwy48N/Ryx/GVcP2ayfjH/uiELcazNkhIQSWDLOqck
	 mtMfnyJ7AAwgRPsbjO+0n4Ap1HcH9Du9+BuR6oZ8=
Message-ID: <4dfed719-5f62-4ea3-8685-5dc4426ad3c9@arm.com>
Date: Thu, 26 Nov 2026 15:00:46 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 16/23] coresight: trbe: Always classify TRBSR when
 updating buffer
To: Leo Yan <leo.yan@arm.com>, Mike Leach <mike.leach@arm.com>,
 James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Tamas Petz <tamas.petz@arm.com>, Tamas Zsoldos <tamas.zsoldos@arm.com>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 coresight@lists.linaro.org
References: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
 <20261016-trbe_enable_disable_irq_handle_refactor-v2-16-3f57cf3199b1@arm.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20261016-trbe_enable_disable_irq_handle_refactor-v2-16-3f57cf3199b1@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_070053_533418_1893BA0D 
X-CRM114-Status: GOOD (  25.25  )
X-Spam-Score: -4.4 (----)
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
> arm_trbe_update_buffer() must account trace when perf stops a session,
> even if no maintenance interrupt has been handled. Prepare it for
> trigger and wrap modes by making the trace-size decision from the
> drained TRBSR status rather than gating classification on IRQ.
> Acknowledge IRQ only when it is set.
> 
> In FILL mode, reaching LIMIT sets WRAP and IRQ and returns TRBPTR to
> BASE. Interrupt delivery can be delayed, so update_buffer() may run
> before the IRQ handler. The existing IRQ-gated path uses WRAP to size
> through LIMIT in that case; preserve this while also classifying
> updates without a pending IRQ.
> 
> With classification on the no-IRQ path, a normal software stop can
> have TRBSR.S clear and an ignored detected trigger can set TRBSR.TRG.
> Neither should warn or discard valid trace. Mark fatal status as
> truncated and return zero. 


Use LIMIT for a filled WRAP and TRBPTR
> otherwise.

This is already the case, right. Please could we remove this bit ?
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-trbe.c | 24 +++++++++---------------
>   1 file changed, 9 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
> index ac49098aa08412a23a20d32f84c2e1977ee4a223..661f4a78e67c30652de8c834e4773819fa67b5ac 100644
> --- a/drivers/hwtracing/coresight/coresight-trbe.c
> +++ b/drivers/hwtracing/coresight/coresight-trbe.c
> @@ -662,8 +662,6 @@ static enum trbe_fault_action trbe_get_fault_act(struct perf_output_handle *hand
>   	int ec = get_trbe_ec(trbsr);
>   	int bsc = get_trbe_bsc(trbsr);
>   
> -	WARN_ON(is_trbe_running(trbsr));
> -

Why are we removing this ?  Do we expect to be called with TRBE running 
? Both trbe_update_buffer and the irq_handler stops the trbe. So this
must be held valid ?

Suzuki



>   	if (is_trbe_abort(trbsr)) {
>   		err_str = "External abort";
>   		goto out_fatal;
> @@ -844,7 +842,6 @@ static unsigned long arm_trbe_update_buffer(struct coresight_device *csdev,
>   	enum trbe_fault_action act;
>   	unsigned long size, status;
>   	unsigned long flags;
> -	bool wrap = false;
>   
>   	WARN_ON(buf->cpudata != cpudata);
>   	WARN_ON(cpudata->cpu != smp_processor_id());
> @@ -896,23 +893,20 @@ static unsigned long arm_trbe_update_buffer(struct coresight_device *csdev,
>   		 */
>   		clr_trbe_irq();
>   		isb();
> +	}
>   
> -		act = trbe_get_fault_act(handle, status);
> -		/*
> -		 * If this was not due to a WRAP event, we have some
> -		 * errors and as such buffer is empty.
> -		 */
> -		if (act != TRBE_FAULT_ACT_WRAP) {
> -			perf_aux_output_flag(handle, PERF_AUX_FLAG_TRUNCATED);
> -			size = 0;
> -			goto done;
> -		}
> +	act = trbe_get_fault_act(handle, status);
>   
> +	/* If an error occurred, the buffer may be empty */
> +	if (act == TRBE_FAULT_ACT_FATAL) {
> +		perf_aux_output_flag(handle, PERF_AUX_FLAG_TRUNCATED);
> +		size = 0;
> +		goto done;
> +	} else if (act == TRBE_FAULT_ACT_WRAP) {
>   		trbe_report_wrap_event(handle);
> -		wrap = true;
>   	}
>   
> -	size = trbe_get_trace_size(handle, buf, wrap);
> +	size = trbe_get_trace_size(handle, buf, act == TRBE_FAULT_ACT_WRAP);

>   
>   done:
>   	local_irq_restore(flags);
> 


