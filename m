Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A4C606A321
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 15:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0FDnbCKX;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=g/5Vrh3E
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=dH7CD2rNLFDt4vFYO7CU8n53SbMou6nWupr2ypIPRx0=; b=0FDnbCKXShRQTh
	MeK7rVGjEYNwzYga/DltnYTmdwG64PCmrTL12a0055ePb2hGqCXkaY3bzNXrsYwh5FLS2gXROWhqu
	lviSbgOkHaRL3WqczyXtN4BDUymaAnwcTCmAbfOCV9h9D868ZZxCcUExIsirKR/TjxmjX/EFOZRwq
	kgXCWtTqfaG/pFVm2TI2h4odZ+hVnIMj07kgJZPBxZSDJMwXzP7/1FwuaNewq2zVrG5M3ZSt8NXYQ
	Q6sosR5L+qjWMxslRMzMOnxcS67oYSZ6WxY0OCptuNienIs8IDvCfUYMbjEVN4NoZudoYj/bMj4Gp
	nGZLtbvj9Q/5sqqXbttg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWb4v-0000000DftW-2YjP;
	Thu, 26 Nov 2026 15:08:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWb4a-0000000Dfn6-3jv7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 15:07:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5AB811BA8;
	Thu, 26 Nov 2026 07:07:41 -0800 (PST)
Received: from [10.2.197.99] (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B9D213F632;
	Thu, 26 Nov 2026 07:07:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795705664; bh=H9M6UHpvj+4BdAxHU0WJzfBL5Pspw+2hpNxMUL97FVw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=g/5Vrh3Eq2YfQz8mnrZ+4xscF75eANeLruFw5YYXhXwKi0DJkX751A5Vr/r1O83r6
	 2MUzWUVYF3mdG/DYRi4/y+TcM1BWboS6dvihCgqWAgBsGJfcEjQBo4fONR0EJH9MfD
	 OTNeJrqRXlcqoqw6Nm69GIFGSYev5USnn9L+sWtQ=
Message-ID: <6f5d98b9-8636-431c-8b75-a08eb428d386@arm.com>
Date: Thu, 26 Nov 2026 15:07:41 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/23] coresight: trbe: Make watermark range check
 overflow safe in __trbe_normal_offset()
To: Leo Yan <leo.yan@arm.com>, Mike Leach <mike.leach@arm.com>,
 James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Tamas Petz <tamas.petz@arm.com>, Tamas Zsoldos <tamas.zsoldos@arm.com>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 coresight@lists.linaro.org
References: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
 <20261016-trbe_enable_disable_irq_handle_refactor-v2-2-3f57cf3199b1@arm.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20261016-trbe_enable_disable_irq_handle_refactor-v2-2-3f57cf3199b1@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_070745_292106_24E89692 
X-CRM114-Status: GOOD (  15.00  )
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
> The current code checks whether the wakeup point lies before the current
> tail by comparing against handle->head + handle->size. That addition can
> overflow when the monotonically increasing perf AUX head is close to
> ULONG_MAX, causing a valid wakeup point in the current writable range to
> be missed.
> 
> Use unsigned subtraction to compare the distance from head to wakeup
> against the buffer size instead. This keeps the check correct across
> potential wrap.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>

Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>

> ---
>   drivers/hwtracing/coresight/coresight-trbe.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
> index eca8e13a97447b46a4b383049aacb3fa7ad3c329..02d12445763a86d58c79bdf5143f761827456bc3 100644
> --- a/drivers/hwtracing/coresight/coresight-trbe.c
> +++ b/drivers/hwtracing/coresight/coresight-trbe.c
> @@ -526,7 +526,7 @@ static unsigned long __trbe_normal_offset(struct perf_output_handle *handle)
>   	 * +----|---------------|-------|-------+
>   	 * trbe_base		limit		trbe_base + nr_pages
>   	 */
> -	if (handle->wakeup < (handle->head + handle->size) && head <= wakeup)
> +	if ((handle->wakeup - handle->head) < handle->size && head <= wakeup)
>   		limit = min(limit, round_up(wakeup, PAGE_SIZE));
>   
>   	/*
> 


