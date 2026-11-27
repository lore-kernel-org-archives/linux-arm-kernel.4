Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E29F606A327
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 10:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=l9CaUI46;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=F+URV/Gd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=06zzXwIW3I1VPFNgtYMvEWIBr/XXYDkHvtUDGSNv6OE=; b=l9CaUI46HeFIsn
	UVu3IInH7IyLHZGcdXmrpHa3mkgdnnFPl86yR8xk1dOW7iQysSsLyMRxjIuwGu4y3ZUhWBjn+8Hyr
	W+sQKIdQe6FhuiVRD+R6GkLb4vdMJabzZgmKvuSKeZlLOHx7pKCpADeFaAqndLBTnuj46acCNcHC6
	aV9ZzAhd1sBVJ2/yFzFg6f5JGIIisx6CWyMN3HUl+h+a37IBjQDqTiYKV3WqISgdYbmKO25+avU9y
	fEAspzReNsAKdwags8yBWgUkEHX3iKTkPxIqlcvmNU2xWGksOf53jFxj7NZqft0MoG8Ki+4VxFlnV
	74cMMKfEEFYhPKJOKsaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWtFU-0000000FcF9-4ADX;
	Fri, 27 Nov 2026 10:32:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWtFS-0000000FcEg-05Uh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 10:32:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DAC9B1756;
	Fri, 27 Nov 2026 02:32:04 -0800 (PST)
Received: from [10.57.71.121] (unknown [10.57.71.121])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 253083F86C;
	Fri, 27 Nov 2026 02:32:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795775527; bh=chASf/urfNl2ikaVYJ/SelPybEFH9i/SJ8m0tJNVg6Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=F+URV/Gd0w5wHeP6hZoLc/b4BtVw11ZkT6FJyv32CDUg64mLIoHFo0ZNv9Uipo/ip
	 ePSVsVR78Bp9xytPsTnwGfIcptZux/ivBAR9s2R1pPrYyIu3tXw9dlAaiJvbshoxtr
	 7GQWVFzLgHTs2WDC9PJZFFsy2dsEs+N94eeogbG0=
Message-ID: <bf5fbffb-6d78-4485-be56-7a213648953d@arm.com>
Date: Fri, 27 Nov 2026 10:32:04 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/23] coresight: trbe: Drop redundant disables
Content-Language: en-GB
To: Leo Yan <leo.yan@arm.com>, Mike Leach <mike.leach@arm.com>,
 James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Tamas Petz <tamas.petz@arm.com>, Tamas Zsoldos <tamas.zsoldos@arm.com>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 coresight@lists.linaro.org
References: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
 <20261016-trbe_enable_disable_irq_handle_refactor-v2-10-3f57cf3199b1@arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20261016-trbe_enable_disable_irq_handle_refactor-v2-10-3f57cf3199b1@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_023210_270825_244BDC82 
X-CRM114-Status: GOOD (  20.56  )
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
> The IRQ handler has a common point that disables TRBE before dispatching
> the fault action. Once execution reaches the overflow handling or
> truncate path, the trace buffer has already been stopped.
> 
> The __arm_trbe_enable() error path does not need a disable there either,
> as TRBE is already in disabled state.
> 
> Remove TRBE disable from the truncate helper and from the overflow
> failure path. The truncate helper only needs to mark and end the AUX
> output, so rename it to trbe_truncate_event() to reflect its remaining
> purpose.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>

Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>


> ---
>   drivers/hwtracing/coresight/coresight-trbe.c | 15 +++------------
>   1 file changed, 3 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
> index dd9c9330bb0c739795f300dafc6ce34e72fbf280..4a041bbc6e970d72a7d735e15f7221037cb091d6 100644
> --- a/drivers/hwtracing/coresight/coresight-trbe.c
> +++ b/drivers/hwtracing/coresight/coresight-trbe.c
> @@ -301,18 +301,10 @@ static void trbe_report_wrap_event(struct perf_output_handle *handle)
>   	perf_aux_output_flag(handle, PERF_AUX_FLAG_COLLISION);
>   }
>   
> -static void trbe_stop_and_truncate_event(struct perf_output_handle *handle)
> +static void trbe_truncate_event(struct perf_output_handle *handle)
>   {
>   	struct trbe_buf *buf = etm_perf_sink_config(handle);
>   
> -	/*
> -	 * We cannot proceed with the buffer collection and we
> -	 * do not have any data for the current session. The
> -	 * etm_perf driver expects to close out the aux_buffer
> -	 * at event_stop(). So disable the TRBE here and leave
> -	 * the update_buffer() to return a 0 size.
> -	 */
> -	trbe_drain_and_disable_local(buf->cpudata);
>   	perf_aux_output_flag(handle, PERF_AUX_FLAG_TRUNCATED);
>   	perf_aux_output_end(handle, 0);
>   	*this_cpu_ptr(buf->cpudata->drvdata->handle) = NULL;
> @@ -1024,7 +1016,7 @@ static int __arm_trbe_enable(struct trbe_buf *buf,
>   	trbe_enable_hw(buf);
>   	return 0;
>   err:
> -	trbe_stop_and_truncate_event(handle);
> +	trbe_truncate_event(handle);
>   	return ret;
>   }
>   
> @@ -1117,7 +1109,6 @@ static int trbe_handle_overflow(struct perf_output_handle *handle)
>   		 * is able to detect this with a disconnected handle
>   		 * (handle->event = NULL).
>   		 */
> -		trbe_drain_and_disable_local(buf->cpudata);
>   		*this_cpu_ptr(buf->cpudata->drvdata->handle) = NULL;
>   		return -EINVAL;
>   	}
> @@ -1208,7 +1199,7 @@ static irqreturn_t arm_trbe_irq_handler(int irq, void *dev)
>   		trbe_handle_spurious(handle);
>   		break;
>   	case TRBE_FAULT_ACT_FATAL:
> -		trbe_stop_and_truncate_event(handle);
> +		trbe_truncate_event(handle);
>   		truncated = true;
>   		break;
>   	}
> 


