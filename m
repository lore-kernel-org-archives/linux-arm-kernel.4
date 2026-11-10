Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 894DE606A333
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 15:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ybBgGx7H;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=RRVMydY8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=P9CCZPVFgS03WxJsvAf+y67MqFmcRV8SPG30b8JscMs=; b=ybBgGx7HcUsHvE
	cv3J9/WE+2dCXD4ERtDJ4EyQecT/7aILhXLTODDvJwB3Y1aZ6SDzSC8/d9i57jozI3WnHgCM+QzLc
	zVkbwf5ZTgykem39rhrxI3q0zZHRoDzYRgqfXIR3+OT/BTw9b9l2jhZjTXHFVbChhcZrSstraRiN9
	C+1mjh6cxpycRtsMCK4TODAzEhC8fNjqQETon4dvkhIOeFoNL17V+8YQv+WHHcHkiUDpSphn7pxMi
	t/y50l7RQB0pg0yyMGv3LCULX0lDP4MwLlCgoCfTVatLVayz42LzHMbEbNb4NzQc2wFphRKi5vgAE
	sGy5tEI0lJoN9mTUNgcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQnox-00000004Nw5-07Wc;
	Tue, 10 Nov 2026 15:31:39 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQnou-00000004Nux-3fFp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 15:31:38 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4a210470b49so16920845e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 07:31:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794324695; x=1794929495; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P9CCZPVFgS03WxJsvAf+y67MqFmcRV8SPG30b8JscMs=;
        b=RRVMydY8XGFSLfJUS3jJPqPOSipMjPeUiWvhsDbIfAGNx7RswUZApfg4IGGNMmLzGl
         PXhmWyePi20UsP3v+PcXIf0LDZlD+T9lauRUERVwkya1kLn6g6n8kg3MBqUtLeBByJdj
         fiGYxe2TYbAqrLjb8wEgxUZ1OYMdR5i7YemqMAO4AK+QaOs6nhaxVUqX8MimjqwvNT0u
         Hdjq+ORB4b7VpMaR+CQyr3EfxfzTRHC3u3cEaOsUnrY5G+z8Fv+54nGxJXWl4YwKN7VH
         0Uxy0G7vUq8NdpJ4xs+i/qw7sCe1kbxVxKadUXSOunu8tdPn6TNjpl879gzcgEqRwtoI
         Ewig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794324695; x=1794929495;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P9CCZPVFgS03WxJsvAf+y67MqFmcRV8SPG30b8JscMs=;
        b=ael0cLa9SPIugcz+lCD9XltqhJWWc3pQOA514NHgMxRWGxXaJw/tTOPKfzXGq4Xx0j
         oiToyewanvOBZyeHIDmiZiL1c5xvQitiRW7Hq7Ub9vM2a3Y3S/wp4P4wMm80yUZEBQ/w
         L5ZHzxA66h9+5dqmgGM3Ty8sKtvXHQdIFzLjJ8SdoKgkF6sJSszMRzo5Nx8llfstJiUO
         I96r0A0w+5n3j8XnEFTu8weX2/4TTjWJaeI2UZgEK9qo1dBxzIiLwHpjTU/+KeuAtYE3
         2/+5jaUgqDI06pxYu4fTDuRJdJPOJk3w9OwF9ZxHDzHhfzwn+/D1Xd1hQKjbQY4yN2mR
         UTgQ==
X-Gm-Message-State: APuU4Z+Dz75sp1l6QHgSLKlWN3G1FAHdfLNM2Qko3LInjgEZ5sr9KfxW
	5cSJwdBcHQXz+e4pt6RqapCL0kF03vFxFYpWd+huRIHki35cw9oZ6p4cvrKozFPLfSk=
X-Gm-Gg: AYBFou1EVxAGC1u8lZHiEWK7JtajGKJp4XnYQT7F8Fp3G9ztrSQC7CgLXMYI8iko5F/
	Ys0Ao6G7Ta2xEEGYuHGbC9/nPqe89TfnIPPaqm+9Hq8m80wyFv3ACVBmPybyuQfWoJCReHIjJNz
	yaq9lPBLCcqimCgObKhARcLhACA2uCij8q19ibVl7m2dLgbCGu1jGkLMK/tWLJ/Hyh1SG/bYYLG
	eNRBP3puaNxrddtFHw7IDi0lE/j8Egl/MGG/wHdMnIevGjYsLeqkJWzWO4/dac55xiP5CwzJY4s
	wU+1miBQbrfgau92s3wFIanshmmu6T+fkHpn/+KsmO9eSrYPZ301aJ//FqJqpMkr+ScW4eJaHwF
	GYwmxNThNMgLzOOpOccd4wSEe9qpjpjCMwXpnTdF12ukXflKd+EE37SFXFiXTAOe4EHp13JDfOo
	iSEr/dUiREC7DFpNbEveH0jd5cLJ6jRA2yROMg859Ffz3NNbj2MYdoY2Ob/ZYJRWnNEOkOi+FG7
	ZB2OrR/q9Iw1ArHOiFLIN7omr5fUQZTQOtYxFdqEgVZXW27SMmgVYFDkQE4440r+jcctFFYiHxM
	bnb1N2cERXPq0XQgNiowl2/LdzVXNT6UHw==
X-Received: by 2002:a05:600c:190f:b0:4a6:30c3:1114 with SMTP id 5b1f17b1804b1-4ba0233c53fmr49950065e9.12.1794324694886;
        Tue, 10 Nov 2026 07:31:34 -0800 (PST)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0236f03esm55774305e9.3.2026.11.10.07.31.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 07:31:34 -0800 (PST)
Message-ID: <002dcf66-ace9-4973-b163-81e79315ce32@linaro.org>
Date: Tue, 10 Nov 2026 15:31:33 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/23] coresight: trbe: Drop redundant disables
To: Leo Yan <leo.yan@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 coresight@lists.linaro.org, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Tamas Petz <tamas.petz@arm.com>, Tamas Zsoldos <tamas.zsoldos@arm.com>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
References: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
 <20261016-trbe_enable_disable_irq_handle_refactor-v2-10-3f57cf3199b1@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20261016-trbe_enable_disable_irq_handle_refactor-v2-10-3f57cf3199b1@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_073136_936849_8BDAD7C0 
X-CRM114-Status: GOOD (  22.60  )
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
> The IRQ handler has a common point that disables TRBE before dispatching
> the fault action. Once execution reaches the overflow handling or
> truncate path, the trace buffer has already been stopped.
> 
> The __arm_trbe_enable() error path does not need a disable there either,
> as TRBE is already in disabled state.
> 
> Remove TRBE disable from the truncate helper and from the overflow
> failure path. The truncate helper only needs to mark and end the AUX
> output, so rename it to trbe_truncate_event() to reflect its remaining
> purpose.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-trbe.c | 15 +++------------
>   1 file changed, 3 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
> index dd9c9330bb0c739795f300dafc6ce34e72fbf280..4a041bbc6e970d72a7d735e15f7221037cb091d6 100644
> --- a/drivers/hwtracing/coresight/coresight-trbe.c
> +++ b/drivers/hwtracing/coresight/coresight-trbe.c
> @@ -301,18 +301,10 @@ static void trbe_report_wrap_event(struct perf_output_handle *handle)
>   	perf_aux_output_flag(handle, PERF_AUX_FLAG_COLLISION);
>   }
>   
> -static void trbe_stop_and_truncate_event(struct perf_output_handle *handle)
> +static void trbe_truncate_event(struct perf_output_handle *handle)
>   {
>   	struct trbe_buf *buf = etm_perf_sink_config(handle);
>   
> -	/*
> -	 * We cannot proceed with the buffer collection and we
> -	 * do not have any data for the current session. The
> -	 * etm_perf driver expects to close out the aux_buffer
> -	 * at event_stop(). So disable the TRBE here and leave
> -	 * the update_buffer() to return a 0 size.
> -	 */
> -	trbe_drain_and_disable_local(buf->cpudata);
>   	perf_aux_output_flag(handle, PERF_AUX_FLAG_TRUNCATED);
>   	perf_aux_output_end(handle, 0);
>   	*this_cpu_ptr(buf->cpudata->drvdata->handle) = NULL;
> @@ -1024,7 +1016,7 @@ static int __arm_trbe_enable(struct trbe_buf *buf,
>   	trbe_enable_hw(buf);
>   	return 0;
>   err:
> -	trbe_stop_and_truncate_event(handle);
> +	trbe_truncate_event(handle);
>   	return ret;
>   }
>   
> @@ -1117,7 +1109,6 @@ static int trbe_handle_overflow(struct perf_output_handle *handle)
>   		 * is able to detect this with a disconnected handle
>   		 * (handle->event = NULL).
>   		 */
> -		trbe_drain_and_disable_local(buf->cpudata);
>   		*this_cpu_ptr(buf->cpudata->drvdata->handle) = NULL;
>   		return -EINVAL;
>   	}
> @@ -1208,7 +1199,7 @@ static irqreturn_t arm_trbe_irq_handler(int irq, void *dev)
>   		trbe_handle_spurious(handle);
>   		break;
>   	case TRBE_FAULT_ACT_FATAL:
> -		trbe_stop_and_truncate_event(handle);
> +		trbe_truncate_event(handle);
>   		truncated = true;
>   		break;
>   	}
> 

Reviewed-by: James Clark <james.clark@linaro.org>

