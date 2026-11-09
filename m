Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96FEA606A333
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 22:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nWxXYeR+;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=N+1eX0lt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=O8KHCux6DdBKzEkjUoqO1TbETr0T7myPvKNAkvAeZEo=; b=nWxXYeR+/E+a/b
	o+pYROcBW30OffV3Ehu0SpYMojaQaJJAFeNC2vMfsWwAEIPpOYqBqTvGtBIuE//G7y72PqcwYBPXv
	0NjlzYoBlp+ejdNjgNSM4KbB/8HKZLdG3qCLHrKqgzcWQSpYVzuWdPeo74k2MphexjQip8tFCLCcL
	Tw6Tk9nunjc1XEedLXTM3Y+GxSo0MK80V5r7LoN5AmuMJ/OX453mmKK9bVW29LIKbHpsp2SqXXFnw
	gVhCvSfSdl6DauyiPSX6eEoCb3X7ooClMUucZwNiz5gte4169alk5vjbuyJ0KmTqClODxfV73rVg2
	E3mYfBl7RUJR6D2YVkLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQYDC-00000001ud3-2ojH;
	Mon, 09 Nov 2026 22:51:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQYD9-00000001ucj-3xUs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 22:51:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F186814BF;
	Mon,  9 Nov 2026 14:51:30 -0800 (PST)
Received: from [10.57.66.183] (unknown [10.57.66.183])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 25CC83F85F;
	Mon,  9 Nov 2026 14:51:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794264694; bh=maXvj0CLcHHwIox8S+lKpiL0hGRDaPZhNzhXsuq3WZk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=N+1eX0ltPT9Wy2JU8iL7JDkbbLYXUHCGzVG3CYzFvGsCFD3vH9pMR0OqjOXAt0dro
	 TNY6vd0aSgtPeLSBCBoaU+/pENk4EMCdEGdjoiXRX91195R7V3wFkgXF5h9z/7kc4K
	 xjLPM+sg+KiHX46i7qbWQbnu4xd2fCzQ7ClHvtLk=
Message-ID: <a79a52db-2361-4303-9d43-87837f349f48@arm.com>
Date: Mon, 9 Nov 2026 22:51:30 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/23] coresight: trbe: Clear TRBSR status at stop
 sites
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
 <20261016-trbe_enable_disable_irq_handle_refactor-v2-9-3f57cf3199b1@arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20261016-trbe_enable_disable_irq_handle_refactor-v2-9-3f57cf3199b1@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_145136_145142_CE11C293 
X-CRM114-Status: GOOD (  19.36  )
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
> TRBSR_EL1 records the status of the buffer that just stopped. Clearing
> it in trbe_enable_hw() postpones cleanup until another run starts. If
> AUX output cannot restart, for example when AUX space is exhausted,
> that clear never executes. Clear the status in arm_trbe_disable()
> after disabling TRBE instead.
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

TRBSR_ELx is UNKNOWN at reset and if we don't clear it at probe time, we 
endup running the first session with unknown values. It is safer to
clear this at enable_hw.

Suzuki



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


