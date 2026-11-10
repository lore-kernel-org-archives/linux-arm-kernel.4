Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E46C1606A320
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 15:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YcFLPdUS;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=m7Muq6az
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=m09xLtEnG0I/PYQsE4dhMAVWShcasniD6HSBtBOMuLY=; b=YcFLPdUS2dluF+
	2LxI0vS+3ot+n+QhtHHExtfRlWVmSwUntVpsf55h6aaeOnhcQi4whtxx51h+Q3JnFBhcN+5Bw08ul
	dR22pqlNgSgOZtAf+dxRPKrqmu4ykFEIUlYh2Ozc+Slp8EWck36ZQzgrr7dlFtu3JNDYWBZOliyrp
	VDpG+D5B9eBitF3Tp3BDa+H+GSACh8ZjZ6xENKylZFDzpT8xIhoTlwqx3R/0PdO9SD6Bm1q/5LVHU
	8j5ItWcqwfg0ngCRomv6s9rlTFR1YAtCBTDThNg651IYKPOLvEtB/KAwo5ZxVt2a8fJe0TxuuEKnW
	XRkQ/0bv1b4MIjSqE1Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQnmB-00000004MqQ-3Lop;
	Tue, 10 Nov 2026 15:28:47 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQnm9-00000004MoG-25hK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 15:28:46 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-48dee593f18so1476163f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 07:28:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794324523; x=1794929323; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m09xLtEnG0I/PYQsE4dhMAVWShcasniD6HSBtBOMuLY=;
        b=m7Muq6az1nB9+IcCg5DznWJUAokRWG8QYvBXuuxWb8r/6S3yNtlOvocHDuWfHBWta2
         AkQpc32aeBnK5tcKI8CGsf9rVCNgvIBS8ATYiToo0e1CgubEFREp38yTN7VZ+VMSIJGV
         LE53sFeipAIwL7gKIjlEq4DU3kN0XLITp/0ZCiZRUEWtMMXqm6G6BbzgC6NDDfKbqEUE
         Ww1SEsliG6aAgAz+jAXfdH+I68reR8eLmwHLAttJKRQFI6uBjhgc6flhYMYBjJZd6ZQr
         upaL5DRdV2jZvwfPczfsV1Tk1EshRvJbUMU5WfqsDcfpGe4eVlBP8ZA6W9yzDIvbuFf4
         lCDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794324523; x=1794929323;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m09xLtEnG0I/PYQsE4dhMAVWShcasniD6HSBtBOMuLY=;
        b=sVentl0DCmRD7mnus+pAMx98PAKm7BQRrHi0MS5nk8I1rwsTb/VZy5INuHjFEMg0mN
         wO4NAueWB0KcvYt9vW+YLX+dE1Ae7KExYbqLBnvNNQJns5BFQ2mo3JP0zdkko6Xszf1b
         MiFUXDQqhrD6SfeOqOExR0oNPskECEpUjX/M4O3H4IPa58khg+nLvDFiuj5rXT90gRoK
         RaNrutFuKDev7K0Ikx7mx/OS20Eh9o+3ufiA7bryMMt+vjF3a/D0hHnKTqIPTN1ZPp0J
         fdYZYHs+dYKU5Tni4liJhgbe8iLOmefooblMnKVO1DN8RX+paYQQslK4Yrx+dJFtFMgx
         hPLA==
X-Gm-Message-State: APuU4Z+t5LSUATNPD7v+53mnNrNjNjicRG3z/FOihKpwxvtADr7zWnvX
	xdWBOAQa8kNgpFiqnqyX3ku8UppfCA1cHDuhAMg/WujAGBumR/fugbOXrpmfrUVWybE=
X-Gm-Gg: AYBFou1XlrBS6EWXJdcvR+FUO8Sa1ndFRyCvQTXx5xmmLxiKaaxe9wJgfLoxFROJyHy
	MVc8rhFUleqFZT0xxacgZW0+dJ6zUXs83xwDi9J9padoUdbsSQx+pDXMRD1nQ7p9TJQLCPXhtGW
	EbNHicPc0uomzQDVdV8GgP/ibwco6EjBas3wYSN8WglcnGPOZxf1Hl/7hqUlaRYKAle0qoYh0lz
	WXur3860t5HfmNKUsnzM4lrStlryHNzClsLigfDmAO2hwg1iGGZ0HS2txTRGHvu01+JQLSnLxdy
	OYP7nVfMzGGmNK2HlkWhA/Dl8ecHhjBGdCakuNy2cKowSU1aR8eO5vLZ4uVjSdq13m2LI1cvigh
	Z8hKQhY07lBU6mj/t5h1hzqAy1pC+hzDRxgvPRGlzc7GhigRiSmHJXoT0BAK0dx11pwnzgnXzAq
	g7F2gV9iGuLOs3+dNOyDW/8G4h0cKMqPrPHB2EGrLSUdjhp6gBBBkUsIWFqQoe40nSeyiCqKxBV
	nK3Z91qJbDeNa1pC5TDRSmK2YhTy9cNdKTDRDEElrrCwcur6QyOC/uyGCFu8jyyA9CiNg+Km+Ax
	loi45XdWmdouVrUtJb1aSc4MR/BYt489JA==
X-Received: by 2002:a05:6000:1788:b0:490:1881:80ec with SMTP id ffacd0b85a97d-4982f689f67mr5667739f8f.36.1794324522856;
        Tue, 10 Nov 2026 07:28:42 -0800 (PST)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498365ccbccsm5574512f8f.44.2026.11.10.07.28.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 07:28:42 -0800 (PST)
Message-ID: <806ba4f6-b021-4eb5-8841-430edc87dfb6@linaro.org>
Date: Tue, 10 Nov 2026 15:28:41 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/23] coresight: trbe: Make watermark range check
 overflow safe in __trbe_normal_offset()
To: Leo Yan <leo.yan@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 coresight@lists.linaro.org, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Tamas Petz <tamas.petz@arm.com>, Tamas Zsoldos <tamas.zsoldos@arm.com>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
References: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
 <20261016-trbe_enable_disable_irq_handle_refactor-v2-2-3f57cf3199b1@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20261016-trbe_enable_disable_irq_handle_refactor-v2-2-3f57cf3199b1@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_072845_564788_3604FB6C 
X-CRM114-Status: GOOD (  17.06  )
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

Reviewed-by: James Clark <james.clark@linaro.org>

