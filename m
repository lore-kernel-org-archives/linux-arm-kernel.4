Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C870E606A335
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 15:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mei+v6GB;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=tTO9PAEe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=qd0IyWJWgxFJe6K8lzcJgYPZmz94vxmtfSOmYUc+AOM=; b=mei+v6GByENnSs
	iywx1UYYwt4LaoSSkZz+Cr/HnHD5e7SAVhsI2BSQTwaGzsoRB5AIt3wKErsKrcoa5mxmD7b5aGj5l
	gpHMDp+6Of78CzKL7SQ/UJZVMOYH9d2lWdsH/eDoAsKHQAOmFs0qg+NEnfmUIUTezaemZQgLi89zY
	/2iF6iF2dpyxp1gN3zHBV79YFQUj3B69EV3OL1402KEAx51KyymhfpA42USi/RlmZzs91ljXmnwLK
	kxr0cSsNXer045AYS06EfvN63Ds4ernGil88qSwHFpM1bBLrJ4FW8sO288KUZc2vtOdc3c3MhL4HL
	JpZ8dvU+0ChJ3jLIXAZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWb4w-0000000DfvF-17ug;
	Thu, 26 Nov 2026 15:08:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWb4p-0000000DfrK-3gVB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 15:08:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 398771BA8;
	Thu, 26 Nov 2026 07:07:56 -0800 (PST)
Received: from [10.2.197.99] (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6BEB53F632;
	Thu, 26 Nov 2026 07:07:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795705679; bh=yQ6/kuCwtsRfnXsHazLqO0maiTSknyF6p3TOO6ky2Ps=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=tTO9PAEe1PjMP0IJdFKLEuBNbbvARlV69XER9fQOARBLUAR27kVUcaM6+LcdVs1LB
	 ET7l3FoBIvDXL3zarrqtX7XWYoF0FXFdQaCjeCRimPM2lj1q35JG22+cmX6FNwhXTw
	 x7+nHCqhRWPP5Yiyh6sf1mL57n3U6HZvtdQyBlVs=
Message-ID: <af91df31-bba3-43f7-a739-996d11422f96@arm.com>
Date: Thu, 26 Nov 2026 15:07:55 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/23] coresight: trbe: Use helpers for checking errata
To: Leo Yan <leo.yan@arm.com>, Mike Leach <mike.leach@arm.com>,
 James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Tamas Petz <tamas.petz@arm.com>, Tamas Zsoldos <tamas.zsoldos@arm.com>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 coresight@lists.linaro.org
References: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
 <20261016-trbe_enable_disable_irq_handle_refactor-v2-3-3f57cf3199b1@arm.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20261016-trbe_enable_disable_irq_handle_refactor-v2-3-3f57cf3199b1@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_070800_893812_DD848C68 
X-CRM114-Status: GOOD (  16.98  )
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
> Use the existing helpers for checking errata instead of open coded
> equivalent.
> 
> Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
> Signed-off-by: Leo Yan <leo.yan@arm.com>

Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>

> ---
>   drivers/hwtracing/coresight/coresight-trbe.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
> index 02d12445763a86d58c79bdf5143f761827456bc3..8ec0b4c4987f25d10ee0b2f80c27e10f76357387 100644
> --- a/drivers/hwtracing/coresight/coresight-trbe.c
> +++ b/drivers/hwtracing/coresight/coresight-trbe.c
> @@ -738,7 +738,7 @@ static unsigned long trbe_get_trace_size(struct perf_output_handle *handle,
>   	 * the space we skipped with IGNORE packets. And we are always
>   	 * guaranteed to have at least a PAGE_SIZE space in the buffer.
>   	 */
> -	if (trbe_has_erratum(buf->cpudata, TRBE_WORKAROUND_OVERWRITE_FILL_MODE) &&
> +	if (trbe_may_overwrite_in_fill_mode(buf->cpudata) &&
>   	    !WARN_ON(size < overwrite_skip))
>   		__trbe_pad_buf(buf, start_off, overwrite_skip);
>   
> @@ -961,7 +961,7 @@ static int trbe_apply_work_around_before_enable(struct trbe_buf *buf)
>   	 *  - At trace collection:
>   	 *     - Pad the 256bytes skipped above again with IGNORE packets.
>   	 */
> -	if (trbe_has_erratum(buf->cpudata, TRBE_WORKAROUND_OVERWRITE_FILL_MODE)) {
> +	if (trbe_may_overwrite_in_fill_mode(buf->cpudata)) {
>   		if (WARN_ON(!IS_ALIGNED(buf->trbe_write, PAGE_SIZE)))
>   			return -EINVAL;
>   		buf->trbe_hw_base = buf->trbe_write;
> @@ -985,7 +985,7 @@ static int trbe_apply_work_around_before_enable(struct trbe_buf *buf)
>   	 *     - Adjust the TRBLIMITR.LIMIT to leave the extra PAGE outside
>   	 *       the TRBE's range (i.e [TRBBASER, TRBLIMITR.LIMI] ).
>   	 */
> -	if (trbe_has_erratum(buf->cpudata, TRBE_WORKAROUND_WRITE_OUT_OF_RANGE)) {
> +	if (trbe_may_write_out_of_range(buf->cpudata)) {
>   		s64 space = buf->trbe_limit - buf->trbe_write;
>   		/*
>   		 * We must have more than a PAGE_SIZE worth space in the proposed
> 


