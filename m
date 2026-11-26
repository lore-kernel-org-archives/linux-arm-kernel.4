Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B6D606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 15:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VO4C2ksU;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=h5gWecEN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=fgxyB+n3QY03ZfRfTDTAK8x+vJ6Kgnl8jXSFnV7RL2E=; b=VO4C2ksUHWpOQK
	dWsnDiR/w/QR7f3rHCYN3xa2jMXV5zvh/3CmDSFfloF77MwBy9z18rh31cBVxf2QNL9AQiXEvX4Aq
	fpLx2et1/RU2QOAMzQKDEdbgRdEO1taF3iX2O4KJIOBheLBVHxHV+lcIUVGG3OVnWWpgHOZuVesrN
	gRj2IlOXBEHLv5ziF/0C/X+FbH1FFVJyb9Ww33CGlmh97nCupPgWixCxHZEA4u3zyXqbNq0TtS94p
	+1DSGONEnscYpsNI+Dtz5Mep+gh5MqlCXfWDyfiD3RCaQwlmOSxMFrZj/yiuNP5XHaNyKmUekZ069
	gqnnbqmFuQYTJ0HAHt9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWb7B-0000000Dgvb-1l3S;
	Thu, 26 Nov 2026 15:10:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWb5R-0000000DgJG-3N8r
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 15:08:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CB2081C2B;
	Thu, 26 Nov 2026 07:08:33 -0800 (PST)
Received: from [10.2.197.99] (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4586F3F632;
	Thu, 26 Nov 2026 07:08:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795705716; bh=pcTtCG5MrLLjdL9Cf8YKjtiDMmisuJ1ywC/zUjGK40E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=h5gWecENk6kSakIJsEri90wKvxyAhsFYtkk7vrvENr2wPd5wdcoJ9vQSUc18Ll15n
	 7gFze5rR9zhQhAhbTEp44gILci3gNaynyKdYMcOvBEvaFye2KorQkAoJUTtUEyweJJ
	 9F51vqM5jm+i4bfjy0Ir3ZXM+t3nZoPKz5VyDZVc=
Message-ID: <07b50f8d-b71a-4e96-bd4b-cf3973cca833@arm.com>
Date: Thu, 26 Nov 2026 15:08:33 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/23] coresight: trbe: Drop redundant disable from
 enable path
To: Leo Yan <leo.yan@arm.com>, Mike Leach <mike.leach@arm.com>,
 James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Tamas Petz <tamas.petz@arm.com>, Tamas Zsoldos <tamas.zsoldos@arm.com>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 coresight@lists.linaro.org
References: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
 <20261016-trbe_enable_disable_irq_handle_refactor-v2-6-3f57cf3199b1@arm.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20261016-trbe_enable_disable_irq_handle_refactor-v2-6-3f57cf3199b1@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_070838_199773_B128129B 
X-CRM114-Status: GOOD (  16.70  )
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
> The Arm ARM (ARM DDI 0487 M.c) rule RDJMDD says:
> 
>   | When the following conditions apply, the PE might ignore a direct or
>   | external write to any of certain Trace Buffer Unit registers, other
>   | than a direct write or external write to TRBLIMITR_EL1 that clears
>   | the conditions:
>   | • TRBLIMITR_EL1.E is 1, and either FEAT_TRBE_EXT is not implemented
>   |   or the Trace Buffer Unit is using Self-hosted mode.
> 
> trbe_enable_hw() calls set_trbe_disabled() first to ensure TRBE has
> already been disabled before programming any other TRBE registers.
> 
> However, TRBE is already expected to be disabled before trbe_enable_hw()
> runs:
> 
>   1. CPU probe resets TRBLIMITR_EL1 via trbe_reset_local();
>   2. Interrupt handling disables the buffer before re-enabling it;
>   3. The normal disable path clears TRBLIMITR_EL1.E.
> 
> Calling set_trbe_disabled() from the enable path is therefore redundant.
> Drop the call from trbe_enable_hw(), which only needs to program a
> known-disabled TRBE.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>

Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>


> ---
>   drivers/hwtracing/coresight/coresight-trbe.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
> index a7c1037a048f5236598f8f3a7cc4f47bff9d329c..979d0fa84c1c7b448c1ce5cd7a37dff8845795ef 100644
> --- a/drivers/hwtracing/coresight/coresight-trbe.c
> +++ b/drivers/hwtracing/coresight/coresight-trbe.c
> @@ -652,7 +652,6 @@ static void trbe_enable_hw(struct trbe_buf *buf)
>   	WARN_ON(buf->trbe_hw_base < buf->trbe_base);
>   	WARN_ON(buf->trbe_write < buf->trbe_hw_base);
>   	WARN_ON(buf->trbe_write >= buf->trbe_limit);
> -	set_trbe_disabled(buf->cpudata);
>   	clr_trbe_status();
>   	set_trbe_base_pointer(buf->trbe_hw_base);
>   	set_trbe_write_pointer(buf->trbe_write);
> 


