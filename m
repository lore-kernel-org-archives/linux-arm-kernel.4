Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CD4E606A321
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 16:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=k5su1J95;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=StTKzjJ4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=RIx2VwyUaUm8R1FbfbNWeot9VjyRtZMUVqbLF/6xjCw=; b=k5su1J95iQroZD
	09vaELhgRwQKFfkBRq34/pjIV7GwImB5uvvSt8d0SgIImcoa5oYBXhb4uijHNXHSNR1pjrnZMFmyw
	G4j4IhXiihJFBNMgNYVtQ49GAe1mkDiDvatQbtd7RAB2YhQKeC7vwbl/+SrcOITrAojAWfEgRPw+G
	3yrrLFjGL3OR9/5LY61PBu5C3oY4NDCyTp7OtCMZ2doEkH87gxTjsc4mPVrV/bROYDCzIiTMzWuP7
	VmKqLQ2p1sy80rMjLwgLLgS7e+aDywYvlJBXvnBACdQro0dgjSbbv7DQX5c0S0h3BPHu30wfU0i5G
	NHFFugtLnGuu+qDWTpNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQSDc-00000001CQs-1ww7;
	Mon, 09 Nov 2026 16:27:40 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQSDX-00000001CPp-3rIi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 16:27:37 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso11363095e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 08:27:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794241654; x=1794846454; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RIx2VwyUaUm8R1FbfbNWeot9VjyRtZMUVqbLF/6xjCw=;
        b=StTKzjJ4eZGai7G4oQn02nFRQN/b16bdfdBR+0Sb1SPgFyf/+ELmkwqQ5rdlsmvpLp
         bMt0XVCNQRtldD8wI8T23p0NNi+VcHkKDZaQpqrmzQTejAlpi/nKkSEVFaYuxgtPgSbW
         dzGRy7cfwiOM/35B+Mq49UKC4b/JU+HXLtrWgfdN1hUPVXO/Tg6uGvu/YYT0Gn/dgNZg
         zzwkkaNtBTRhp/SXLzjU9uvpvio79MR3x9YOqWkJ2FwRpK7gZJhaWQkPvPZou4FaXbSh
         4MVaH29sYrkJeCr6Bj+ZUyxnsb4JQi344/SOFRYZdOrWgYaPrcAZx4kIFtIEWa0RPAXn
         +FAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794241654; x=1794846454;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RIx2VwyUaUm8R1FbfbNWeot9VjyRtZMUVqbLF/6xjCw=;
        b=lEciPX550a3sSp4j+wvlLCn2hLI/AuLM1bPu3iKlIZqxPoruZG8WAdY4zSKNIB6eme
         r4WwEDGiU0iu4sxUZeXo0MfNM4/YPVNLzQA9Y0LCOf+yhkZQuRGsTIPC6ZODz/IOFCUI
         QPd0PwjS+Hilf3V/gG9+VqsHpZzM1YK0gHpl40eg50xnHvrU4afxoNY+zkW2hREqUrGl
         YrwX6T/ZOrkpyR96XnIUf9rg9FoftuRbUSnfN442pfLqrWKJlAqkfB7TeVfrajUTKvZI
         qCFa4gVzFahyn+ERg62ZSOQ7icVeTsp/05z3qsNsfVecdkho3nOJzwJJm2oqAbsryzw6
         r/iw==
X-Gm-Message-State: APuU4Z8iYkNHv0t96ktrp4Jln1bBfjt19RyWnADyhkS9MOCJlrHxXBGU
	6LGmKmLYuJxNgDcWzF3u7vw6zRy9tEmBictWRRBIQ6Ow/gyPYpWLkSYYqM4MQZAeLhaTBMJX5oL
	pIpwDWFM=
X-Gm-Gg: AYBFou1ghCPKHCS/WqMAtAN64DKzLBsS1VJ2UvF84g+wqzhofih6VV/pqj044Y9XbXR
	ZZ9BvQemDU/t+SycAmh5aVl0fyqkEVcjAzzMO60g14GGh5IqqONEflyB3qgLPb3mMdbolnS8jr/
	YgN138a89c3uhACVScEDokUrxAEtBx2hOLjr/lrxtqFFCLd7I8ldNKWwjlFZvke77okSXWELSP0
	Hs9bx9rNLLiLQkvF/Bju02/KP3wR8lE2m2iDwunkBIwkPyWMAWHWj7oz8H5zRztsi38qkA9gEri
	eiAV0S7DLPgruRF7ynfg02MOSB43x4GW9MNEZz3sUp5EdoHyiQGp0R58mzbPZWL3PfHQD4vdG4L
	jDi8a2+LRdcQ0Ozqu8BFMGdSB1c4Q5kFwNS9EEfv3ONbo44C46xR0mArbsPEqSt6cR9Ev0yJ4Hf
	dUyNJLRiZIHO0vOc7nHRUVm9r9RRkQTKexfaxF2HCmuEL9jku4nKEN0jj7lSZlDJsBWnwrha0vW
	1ZfWxqbYhAcslupPRDBGFeYo4g4fryfEynJyeEMdKKK3XgMQ23AQy2jJ8HSP230puFevEY4l2//
	7nv2ilLZ+kSMXDtx7bFhaHknSb4fHIYz
X-Received: by 2002:a05:600c:8b24:b0:4a1:9078:911 with SMTP id 5b1f17b1804b1-4b963c82388mr73750225e9.31.1794241653881;
        Mon, 09 Nov 2026 08:27:33 -0800 (PST)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49597e0097dsm11053891f8f.57.2026.11.09.08.27.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 08:27:32 -0800 (PST)
Message-ID: <8136ec16-8132-4212-8ccc-6aff05ab698c@linaro.org>
Date: Mon, 9 Nov 2026 16:27:31 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/23] coresight: trbe: Drop redundant disable from
 enable path
To: Leo Yan <leo.yan@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 coresight@lists.linaro.org, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Tamas Petz <tamas.petz@arm.com>, Tamas Zsoldos <tamas.zsoldos@arm.com>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
References: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
 <20261016-trbe_enable_disable_irq_handle_refactor-v2-6-3f57cf3199b1@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20261016-trbe_enable_disable_irq_handle_refactor-v2-6-3f57cf3199b1@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_082736_006139_66C66183 
X-CRM114-Status: GOOD (  20.35  )
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
> The Arm ARM (ARM DDI 0487 M.c) rule RDJMDD says:
> 
>   | When the following conditions apply, the PE might ignore a direct or
>   | external write to any of certain Trace Buffer Unit registers, other
>   | than a direct write or external write to TRBLIMITR_EL1 that clears
>   | the conditions:
>   | • TRBLIMITR_EL1.E is 1, and either FEAT_TRBE_EXT is not implemented
>   |   or the Trace Buffer Unit is using Self-hosted mode.
> 

Doesn't the rule just say that the buffer must be disabled before doing 
writes to other registers? But the explanation for removing the extra 
disable is that it's already disabled at this point, so nothing changes.

The commit message would be clearer without this bit IMO. There's no 
architectural requirement to make this change, it's only a software one.

Otherwise:

Reviewed-by: James Clark <james.clark@linaro.org>

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


