Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EC61606A325
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 15:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KOy0u+Yc;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Ge6NNMfd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=PXJAvmxQXstxSOL+heMZGmv93yC12Dwzkd4AWXEIrR8=; b=KOy0u+Yc9W6+81
	bV970pBTPFNneb6RyE6VnFaR2mIR6T4KFB3sOULB5G6GjJQhLiRw6T79RZRNTTpG76uO36GaE6Kfv
	UE+1BAI3CaEk3+mvOMyDpqgG2nzxJhT7LboBnKI0wMyGjDhS2spxPR6IyHpiKIdnPMnW3c8LN8Wj3
	9QqwmaN4qk9mlf3iM8RJ9dBtKwE0AHbO9557qWDVGym5DcBsIRiTSs320Ah3vESpzN/utbPi6yPje
	vtHEdTutJ04DONxA1VcIWyfqZ//HKzKDVvcoleANLJp4QSdgTamQC5UnWxq9yU+FdwXkQR7F7IdHM
	kP3NZqszW9bsqQS+rPSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQnma-00000004N0C-02Xn;
	Tue, 10 Nov 2026 15:29:12 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQnmX-00000004Mz0-2nDO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 15:29:10 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-490d59c3f0aso1156503f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 07:29:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794324548; x=1794929348; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PXJAvmxQXstxSOL+heMZGmv93yC12Dwzkd4AWXEIrR8=;
        b=Ge6NNMfdJVTgf+MFv2+2BGLMBHFDpfghsY793ppJye9Ftaz4BbWqOvEVlwyE/qmWS4
         nS0Kxr/9l4l6C/RvBuTF0YZ/G1nCqsE4RPy42F7Wlxjqv2Cuff/kUwfDb4yI9Dv1zHgv
         y+DGzsgvAPxafE6q5WnUFKj5IZu9ndiLHgb3DCMJ/aUQdj7eVCk6IdyCKF1Pnz0MIySz
         unTfIJUBhbUxZDCBJX+CQLWACGEJDnoCNjiq7FqbDFj0wyBqWxe223K+cDWDeqhv0OPN
         xVO+ciCfJjKy/tF5Wck+iz39m9O6hjdWukRYhqGd0k8xxS0m/JtYR0y/lCGPzop6EBc2
         D+lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794324548; x=1794929348;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PXJAvmxQXstxSOL+heMZGmv93yC12Dwzkd4AWXEIrR8=;
        b=I1M+SpwRIv+Q6qhdOB4qjlo5lZ3f02P3RIRG41B/0nrWY7o3xAzklYGc2Gh3NCdGQL
         s3LPpseGBipZ2A8ueiagvGzVhG+UcvZRy5MPoayLOD26/uHuln46IXobOS/G53LzowuE
         Zff0ZBKEJEQrjbroGLIdDlGe97v8q6BenqfnHKr0bepaIvcLCx4W40GvoFME7RDIEYlM
         n2cTqSEfW1ALWgSLnb+pAf5wBADnjHTZAmQtevh6Wx6fx0d/Jf/zlwm/mVB3NbEBg/pC
         hVTcL6GFITbbDCEdk0se3GBzlBlVcv2t1on7fO+PslE7Z1fM9t3eg2qhAap7VuS7mtw+
         krVA==
X-Gm-Message-State: APuU4Z+Klz9ksEfVrYJokgCwaXYdO73Vk04NUBsfPx5WJNnMyRzPGYz/
	7Peb+2rd+F7+MM06CU9QPhYBzymyeii1JHXG8PYmOb75ZVyLWvXr5akSyStqFaXtf0c=
X-Gm-Gg: AYBFou2mrtcgzGwOuRJVheIH4eFBfLX7iWOfs8hkJ31TQnk1Q2sBcD5iabYLVU7Ryv1
	fiICPZCVrYnjTA/P2X8bBkmxbeEg0LO572rF7NB+XNtevqTxzJf1ofXD1Vq+gScP42+whsga7CX
	bM/ZjuKmnTW+j3tFh3SJKBQyrH2zmbJb0GKh7nqhSCC4V+ya/YkyrpqRMFknx8RMUi+2GfCcdux
	KdT22xZevPDgsvJS9DafYN6G1ZEw7SHNTak+Y8AQIsUM7IEE73gpyjV0h/EgRQjaSKRLvKcvA+s
	hIMTiz6OCOv2zRTvufw+w0ZWBjFsX4PbbVv8HdFAzFUuIJJ0o6SBVSYJktI5SADoqF8bL4a8lh6
	weX2DQcTWRTGhi6g2/3kKhDdK9tzqR5mFz1XNHnpubD1cGosCfIsRj2FIJdrEP7TG4XojDQHh2x
	iICi/YJtbQYp2eDkJGaouiAa8SCXNznNcjvhWfbUNHfgcrVG21PjDuK2V01jTJZabTeuzXEJzg5
	yMgM6m4qZfXv+7VpqqF7OQBj25yp+OlyTcde8CVusf1ychPGLsdWBtOU1KHnbfUdaG1gxDOq9dy
	bihJM9nCf5SO5CwR790rqbN4lN0VFdLnVA==
X-Received: by 2002:a05:6000:2387:b0:48f:bcbf:26fc with SMTP id ffacd0b85a97d-49831ae8014mr5302993f8f.53.1794324547642;
        Tue, 10 Nov 2026 07:29:07 -0800 (PST)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498365ccbccsm5576095f8f.44.2026.11.10.07.29.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 07:29:07 -0800 (PST)
Message-ID: <ae1300fa-29c7-4ec2-811a-1c7ffd507983@linaro.org>
Date: Tue, 10 Nov 2026 15:29:06 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/23] coresight: trbe: Use helpers for checking errata
To: Leo Yan <leo.yan@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 coresight@lists.linaro.org, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Tamas Petz <tamas.petz@arm.com>, Tamas Zsoldos <tamas.zsoldos@arm.com>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
References: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
 <20261016-trbe_enable_disable_irq_handle_refactor-v2-3-3f57cf3199b1@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20261016-trbe_enable_disable_irq_handle_refactor-v2-3-3f57cf3199b1@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_072909_731962_CD6B0000 
X-CRM114-Status: GOOD (  19.01  )
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
> Use the existing helpers for checking errata instead of open coded
> equivalent.
> 
> Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
> Signed-off-by: Leo Yan <leo.yan@arm.com>
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

Reviewed-by: James Clark <james.clark@linaro.org>


