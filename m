Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 575E8606A323
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 15:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IyxAMCHL;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=H60ILt51
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=s10zdA63ZUkc/Ktd6fQza6WZn0Id1SGwFj4wAg5AooU=; b=IyxAMCHLwNIzKl
	4D1Az64VLQTLf6T5zpxn9q0T+vnsrhGpIkr70n20VRHF1tImTfgom+pqZRD+nK2kHh8pJUiwwaRHk
	XQlb0pZUd5x/sr1TtWzJGFldlDhF9JLt8lsi8cho3wusY/FTpakI36zyJtxv5PIHoYs52prlikq0b
	zeLYYu4OaKd/Ltec7ZoTQaMoYJcOIGEaIagc83TKnY38wYU2JuwQyG7KZ6nSF+UubplvHZ5ujwSWB
	IlU+f53uCsz45oX/BS9KUfvf31NvklVjskJ2ozxjd2SanTrt1kTgZwjj1zMe1M/VEjMBGiFneIdEg
	yWM71j1Gn8W5OMKvdBZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWb7B-0000000DgvQ-0iDP;
	Thu, 26 Nov 2026 15:10:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWb5F-0000000DgCZ-3Vfo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 15:08:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C484C1CE0;
	Thu, 26 Nov 2026 07:08:21 -0800 (PST)
Received: from [10.2.197.99] (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2A7D93F632;
	Thu, 26 Nov 2026 07:08:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795705704; bh=WiE+GrqQlfy0dZcrGXC3bpTOEyYUUMzcbbF/wtNMzrg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=H60ILt51+3vmoERJ93hXRhVn/lf/QkCWwvKlWccBnDuhZwSGF1ovkIG/NsKSe6xoZ
	 C4TMGRkJQOpuxQUYYvVKyOCcy1hnTdsjzEFQRM4I+2/bAN8fDpIGNC4gHB9JY6spv6
	 KBZmQOIxUH6pEgjypUQdx+iKDbY9rDDtqsjobYX8=
Message-ID: <25c6af3c-de2c-492f-bc15-213e19d1bc1d@arm.com>
Date: Thu, 26 Nov 2026 15:08:21 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/23] coresight: trbe: Validate perf handle before
 using sink data
To: Leo Yan <leo.yan@arm.com>, Mike Leach <mike.leach@arm.com>,
 James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Tamas Petz <tamas.petz@arm.com>, Tamas Zsoldos <tamas.zsoldos@arm.com>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 coresight@lists.linaro.org
References: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
 <20261016-trbe_enable_disable_irq_handle_refactor-v2-5-3f57cf3199b1@arm.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20261016-trbe_enable_disable_irq_handle_refactor-v2-5-3f57cf3199b1@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_070825_957388_0CDBD645 
X-CRM114-Status: GOOD (  17.33  )
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
> The TRBE IRQ handler calls etm_perf_sink_config(handle) before
> validating the per-CPU perf handle and its AUX transaction. This may
> dereference a NULL handle after disabling TRBE or access stale sink
> data after perf_aux_output_end().
> 
> Validate the handle and AUX transaction before accessing the sink
> configuration. Move the local buffer lookup closer to its use.
> Remove the warning for a NULL handle, which is expected after
> disabling TRBE.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>

Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>

> ---
>   drivers/hwtracing/coresight/coresight-trbe.c | 15 ++++++++-------
>   1 file changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
> index 91fbdbad3676ffae399df0b4d4ddcd603a40e86c..a7c1037a048f5236598f8f3a7cc4f47bff9d329c 100644
> --- a/drivers/hwtracing/coresight/coresight-trbe.c
> +++ b/drivers/hwtracing/coresight/coresight-trbe.c
> @@ -1150,12 +1150,18 @@ static irqreturn_t arm_trbe_irq_handler(int irq, void *dev)
>   {
>   	struct perf_output_handle **handle_ptr = dev;
>   	struct perf_output_handle *handle = *handle_ptr;
> -	struct trbe_buf *buf = etm_perf_sink_config(handle);
> +	struct trbe_buf *buf;
>   	enum trbe_fault_action act;
>   	u64 status;
>   	bool truncated = false;
>   	u64 trfcr;
>   
> +	if (!handle || !perf_get_aux(handle))
> +		return IRQ_NONE;
> +
> +	if (!is_perf_trbe(handle))
> +		return IRQ_NONE;
> +
>   	/* Reads to TRBSR_EL1 is fine when TRBE is active */
>   	status = read_sysreg_s(SYS_TRBSR_EL1);
>   	/*
> @@ -1171,16 +1177,11 @@ static irqreturn_t arm_trbe_irq_handler(int irq, void *dev)
>   	 * Ensure the trace is visible to the CPUs and
>   	 * any external aborts have been resolved.
>   	 */
> +	buf = etm_perf_sink_config(handle);
>   	trbe_drain_and_disable_local(buf->cpudata);
>   	clr_trbe_irq();
>   	isb();
>   
> -	if (WARN_ON_ONCE(!handle) || !perf_get_aux(handle))
> -		return IRQ_NONE;
> -
> -	if (!is_perf_trbe(handle))
> -		return IRQ_NONE;
> -
>   	act = trbe_get_fault_act(handle, status);
>   	switch (act) {
>   	case TRBE_FAULT_ACT_WRAP:
> 


