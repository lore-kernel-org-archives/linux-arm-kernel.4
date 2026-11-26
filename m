Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF485606A321
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 15:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=w3DP9BVz;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=sDLu0qrt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=aUbZxvdAHyq4ryrKZGnl6ROkEBk3HYBwARaX1t7MY28=; b=w3DP9BVzAPbyMZ
	7r0M15NAuD92yR8yEKVGGdjk5nVTTHQgxaA7RWqmAueQh6flL2T8T15OhRCuDnbN581E8aTNq7asG
	vngOhEAXbXxPV71XGtlDqylKgAKCp1HkjRuMHQZ93c0Fp59bufXr3B7W8zInO6LNCxo8nT/q7b38u
	L8/TqvJkWEFSRX7/sMV0MZNDZqJwBPiPBmGpURk8zn9irlbjy3W559quP35hKB0Ts+9eTH5xrrG9i
	/VKNrTyH3C0Z95bSmud5yMaZjAzEwSEhFz9ghTnQw9fkxVDnoG0RlD23ccLcmHsM3BCAJbW6NrUYa
	F30JpCPDOcm/qd0A2VdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWb7B-0000000Dguw-0GGw;
	Thu, 26 Nov 2026 15:10:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWb52-0000000Dg1x-0HUC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 15:08:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5DB331C2B;
	Thu, 26 Nov 2026 07:08:08 -0800 (PST)
Received: from [10.2.197.99] (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BEC683F632;
	Thu, 26 Nov 2026 07:08:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795705691; bh=8R4cIdICA/xfw4Ir/UDdVgpJ5yXQQeu3rB34U1uw99U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=sDLu0qrtFlPxble7jhv6DnNu2uK345uN+jAqAUxC0+BWtCmbdOmO41ZPQz3dbxPVh
	 lqtkqLpYyyN7z9iPV6662QYlmM+8dtgDskCbERN1ElqSckazwK5b6e0qDp2bS7bgDq
	 qO99QiSzTKz0/c0m+nJIpjsixWga6xK/GeyMENd0=
Message-ID: <b2a0002c-9b82-419a-96f9-bf3a8fe29dd2@arm.com>
Date: Thu, 26 Nov 2026 15:08:08 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/23] coresight: trbe: Check the buffer association
 before IRQ validation
To: Leo Yan <leo.yan@arm.com>, Mike Leach <mike.leach@arm.com>,
 James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Tamas Petz <tamas.petz@arm.com>, Tamas Zsoldos <tamas.zsoldos@arm.com>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 coresight@lists.linaro.org
References: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
 <20261016-trbe_enable_disable_irq_handle_refactor-v2-4-3f57cf3199b1@arm.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20261016-trbe_enable_disable_irq_handle_refactor-v2-4-3f57cf3199b1@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_070812_155585_A4894F40 
X-CRM114-Status: GOOD (  15.12  )
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
> is_perf_trbe() obtains the sink buffer from the output handle and
> dereferences buf->cpudata before validating either pointer. A live AUX
> transaction does not guarantee that the selected buffer has a CPU
> association.
> 
> Reject a missing buffer or CPU association before reading CPU driver
> data or checking the hardware buffer addresses. Treat these configurations
> as an invalid perf TRBE session.
> 

Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>


> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-trbe.c | 10 ++++++++--
>   1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
> index 8ec0b4c4987f25d10ee0b2f80c27e10f76357387..91fbdbad3676ffae399df0b4d4ddcd603a40e86c 100644
> --- a/drivers/hwtracing/coresight/coresight-trbe.c
> +++ b/drivers/hwtracing/coresight/coresight-trbe.c
> @@ -1111,10 +1111,16 @@ static int trbe_handle_overflow(struct perf_output_handle *handle)
>   static bool is_perf_trbe(struct perf_output_handle *handle)
>   {
>   	struct trbe_buf *buf = etm_perf_sink_config(handle);
> -	struct trbe_cpudata *cpudata = buf->cpudata;
> -	struct trbe_drvdata *drvdata = cpudata->drvdata;
> +	struct trbe_cpudata *cpudata;
> +	struct trbe_drvdata *drvdata;
>   	int cpu = smp_processor_id();
>   
> +	if (!buf || !buf->cpudata)
> +		return false;
> +
> +	cpudata = buf->cpudata;
> +	drvdata = cpudata->drvdata;
> +
>   	WARN_ON(buf->trbe_hw_base != get_trbe_base_pointer());
>   	WARN_ON(buf->trbe_limit != get_trbe_limit_pointer());
>   
> 


