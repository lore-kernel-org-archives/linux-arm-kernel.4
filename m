Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 353FB606A324
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 10:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ros5vrzi;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=tRotdwgW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=E0xIKm+cz73M8abUWu8ny6genyhhbuyvIZwIeMLtpK8=; b=Ros5vrziPYmjBr
	7r5w0DHDJ+trYw3BdHxsiA1BNZBowcwOf47CDLdzkGW4ns0DJ11ed5JBfDnbRYMZSGlAQ9Zl2JeKl
	RptlKRSRIZAGkqhni53pZ/l2yp4IePsYmZG/aNWgoswvh8zZWu8x8q3j6d6yqGjpy4jvu6Bcbljw2
	+sqdGQ3SqIfyjnDSEgRGcI9honkjGenYPcbtz9WtvVfZSQFqsVv+3TerXhS7MUuongRFCOgNLqJcy
	Lq5ZPl1xiv2TiRg8xHLMfS+B6sNYRayVKT2yiyPCQGo2VFQ++E+qNhshfkN3ix8pU8lId+yNNGmWA
	9zpWWUW8AEIrtDAlo10g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR5rI-00000006O3t-0xPn;
	Wed, 11 Nov 2026 10:47:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR5rG-00000006O39-2ZRU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 10:47:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9D52F1576;
	Wed, 11 Nov 2026 02:47:10 -0800 (PST)
Received: from [10.2.197.99] (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EB6EB3F632;
	Wed, 11 Nov 2026 02:47:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794394033; bh=symzOMU/drdgsQKXYISFLyE59beBdgV5l5c5Zsouk1Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=tRotdwgWhZQjzpx/2Dg9C0eUh3Jk/P7RgPZsmnX+EPG8ebkUZK8sf3ZPt4dJpHN53
	 zsVFPA+0vYtAJKKwnfq7RuVTRTMtmLrNBMQsRA5+IgMRdbJYXLILIwTw2NfOWsdm0a
	 5a8V9T2x08bO5tL3+5IXKeicrUbBltmJyYtnarNg=
Message-ID: <57ca748e-127d-45a6-a662-fc1cb9895b51@arm.com>
Date: Wed, 11 Nov 2026 10:47:10 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 15/23] coresight: trbe: Report truncated trace on
 buffer update errors
To: Leo Yan <leo.yan@arm.com>, Mike Leach <mike.leach@arm.com>,
 James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Tamas Petz <tamas.petz@arm.com>, Tamas Zsoldos <tamas.zsoldos@arm.com>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 coresight@lists.linaro.org
References: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
 <20261016-trbe_enable_disable_irq_handle_refactor-v2-15-3f57cf3199b1@arm.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20261016-trbe_enable_disable_irq_handle_refactor-v2-15-3f57cf3199b1@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_024714_702836_8739862D 
X-CRM114-Status: GOOD (  16.15  )
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
> When arm_trbe_update_buffer() handles a pending interrupt that is
> not a wrap event, it discards the buffer by returning zero. The AUX
> output is not marked as truncated, so userspace is not informed of
> the lost trace.
> 
> Set PERF_AUX_FLAG_TRUNCATED before returning zero so perf reports
> the trace loss when closing the AUX output.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-trbe.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
> index 1c585b6123df2f20d08747678d836742ce9564cc..ac49098aa08412a23a20d32f84c2e1977ee4a223 100644
> --- a/drivers/hwtracing/coresight/coresight-trbe.c
> +++ b/drivers/hwtracing/coresight/coresight-trbe.c
> @@ -903,6 +903,7 @@ static unsigned long arm_trbe_update_buffer(struct coresight_device *csdev,
>   		 * errors and as such buffer is empty.
>   		 */
>   		if (act != TRBE_FAULT_ACT_WRAP) {
> +			perf_aux_output_flag(handle, PERF_AUX_FLAG_TRUNCATED);

Do we need this though ? If the buffer has space left, we shouldn't use
TRUNCATED. TRUNCATED causes the event to be stopped and the userspace
needs to re-enable the event.

Cheers
Suzuki

>   			size = 0;
>   			goto done;
>   		}
> 





