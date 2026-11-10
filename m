Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8524606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 15:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZbYBXVY9;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=IaLBmA6V
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=sJhBd9A00CF51bJNi2AfMlK59AYx2EoWRCtJUHTymgo=; b=ZbYBXVY9BBE0yp
	xMA2I5I1qchCQQksiTzzhssgN2yVSjbvocZX8vTFunc33YqjH/YH0jA3jKCZm39MguqnMc3KPCWbc
	I+GxoOkaZcKT38Ui3a6jXx36T5/9nVv+n88lvhG9fH1QSJt19aYTHJGxw/8TMktsfllDERYRZ9Asb
	OS982sKuZotOBwB0sjpT0zZ68EzxO+ZnNIiIHzXu7hzvT3NvHI+TxwI5yFvMqut+QmAfzLV6nsVld
	VwidKiYbAxyiYXv0CC5FrXMI3ZwezyAUoTG6QtvwC74O2W+1O+g3vKTnVi7q58lmZ9OECxJvxdR40
	IQdL2YEohT7AeUQvecRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQnW9-00000004KGN-3uzr;
	Tue, 10 Nov 2026 15:12:13 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQnW6-00000004KFX-3l4i
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 15:12:12 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-490d59c3f0aso1143484f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 07:12:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794323528; x=1794928328; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sJhBd9A00CF51bJNi2AfMlK59AYx2EoWRCtJUHTymgo=;
        b=IaLBmA6V8hRp0wj3fp+K2KkvFvwcW3bBTq6KfQSw3Ju9KTm6n8+He9g/54w/48bfXN
         ddTSsnSz5ERW6DWgoHLxl8wQ7Xco3VPvB7WPUbQQ0Fwh5soEc72YPv1eh0DzxJYbHQsD
         ToZH0Ottp+2tT/nDCIC9V5WwsypC5h/UgwYuIVN9dxqttywXRYr2apFIcUM0UI5oBXu6
         50l94wX9yc/gvgJ3Nb8obweDtGTGWAQo6c7zhfuWuRHXxaN3zv2pOWBGrcBHTB97KIyX
         RzCneYnI8JRxHjhRQgT3GxJnwkZkknUjS7xQiGXc/s0rIHUPqaG4/N8BCjOFgTeRB1x2
         4APA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794323528; x=1794928328;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sJhBd9A00CF51bJNi2AfMlK59AYx2EoWRCtJUHTymgo=;
        b=iEpzEkjHlLCmdquN6zg0Ss+AEdx53gBhZmSg2Wnyiap5O0KwKM09Cu8kAX2/ovMqAK
         9WMTikZOtwPr7NT+WQlTc8cFruJu1PhMaGDBH1QOURtqsqT2FlUNPKtRt67nNvMTu3zr
         RnldKtEecY/X4oonDAIGd/WtKNwtiEDqz4GytpGIFwug6vTIP58t7qW8KwEIOv1xNZau
         bcB23sl7OHMDqpntkFf63QmqJIWBNM+ofehk9DhMu39It6jGB4IggpbjGhz5HxYkjq2k
         dgHDquc+QFEKdp+0iJ2EM6i/EUi896Vq868Izgg7a9d5T5VXM3JKQmDoBh921m3PF61Q
         oa+A==
X-Gm-Message-State: APuU4Z99IHY44UwDP9s6yLwapZw6eYNJSJJlaehwcPZe0LXdnjvfm/CE
	MaCqfIYpV899GnxlHVh8LGSZSf3JYoNFoeOS1ubPXlwOoon73aSZf60VV6dU5WzgAsw=
X-Gm-Gg: AYBFou0jgGmHv2W2C8sfMdJkFY+kcquRPf5TChiF9XQ+GsQomtlGhMkYLjsJ1GonZfH
	Mhnz3PDql6VEO4tT9HkfkIcxNJpK08lzNsO3/OwGrR8AkzC6QaOrlJZIycQWNJQzZALRMBwhF97
	LGrNQe3Ihi0i1m1HXgDRbVjndIKoPS4y6Esms4vkSOmhTLbm5iriK17ETk6DmOIaAXM9newFyDt
	quJiobEw+mtPL89IB2vXGa3tVzIgG1tUsynJ91B3SH6LhyPS9IhB6GA+sQjXyrebawYcssRy/Aa
	PIKkE3AHq+e28ShNt3evO3GQZKg+NfG/AIWN3wnbXhVHpforGHWN+lVHuHgIsHGdXpjQEctGvlH
	6I/3qpkHsY2Sw2ibKfsF3+TUeT1iL1YNbCvd+6NVI6Cm3uocX+5KYAvyBhPNX2a2XtC9TfDZCn4
	M+Mnoktx5IBxDMsJK2p6d0y46LHdX0k5AilfxlKobLsZjSBvlGWq0oG8DDVpmddAfKrGKABAZ8v
	/6CFqB74UKnVziXGBcat9tfLHlViocR6LZ1U74rMKzsPisaqj5dW6dEadZ+/+QppaYeJOwwKJXD
	kIbVYt2XWezTMWYjO4ROHRWDwLGccseusw==
X-Received: by 2002:a05:6000:2087:b0:48e:d27:bef2 with SMTP id ffacd0b85a97d-4982fd3e412mr5251630f8f.21.1794323528401;
        Tue, 10 Nov 2026 07:12:08 -0800 (PST)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4988bdef64dsm4024165f8f.20.2026.11.10.07.12.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 07:12:07 -0800 (PST)
Message-ID: <d93b9120-197d-4b01-a9ab-8df01657716d@linaro.org>
Date: Tue, 10 Nov 2026 15:12:06 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 19/23] coresight: trbe: Reload the AUX buffer on
 overflow restart
To: Leo Yan <leo.yan@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 coresight@lists.linaro.org, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Tamas Petz <tamas.petz@arm.com>, Tamas Zsoldos <tamas.zsoldos@arm.com>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
References: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
 <20261016-trbe_enable_disable_irq_handle_refactor-v2-19-3f57cf3199b1@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20261016-trbe_enable_disable_irq_handle_refactor-v2-19-3f57cf3199b1@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_071210_978000_B88285CA 
X-CRM114-Status: GOOD (  35.46  )
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
> PERF_EVENT_IOC_SET_OUTPUT lets events share another event's mapped output
> buffer. For AUX events, this also selects the associated AUX area and
> sink configuration. Perf normally establishes this sharing during setup.
> 
> Consider the following hypothetical live-redirection sequence, permitted
> by the inspected perf-core paths. P is a parent event and C is its
> inherited event, with C->parent = P. A and B are mapped AUX destination
> buffers owned by separate, disabled cs_etm events in different task
> contexts. All three are per-task events restricted to the same CPU, with
> compatible output settings. P has no mmap of its own, allowing its output
> to be redirected while A and B remain mapped through their owner events.
> 
> 1. P's output is redirected to A. C inherits from P and begins tracing
>     on the selected CPU, so its open AUX transaction and TRBE hardware
>     both use A. P can be inactive while C is running because their
>     events are scheduled with their respective tasks.
> 2. A userspace controller calls PERF_EVENT_IOC_SET_OUTPUT on P to select
>     B. ring_buffer_attach() calls perf_event_stop(P, 0), which returns for
>     inactive P without stopping C. P->rb now selects B, but C's existing
>     handle and hardware still use A.
> 3. C's next buffer overflow invokes trbe_handle_overflow() from the IRQ
>     handler. It saves buf for A, ends that AUX transaction, then calls
>     perf_aux_output_begin(handle, C). AUX begin follows C->parent and
>     reads P's current rb, rebinding the same handle to B.
> 
> This is a hypothetical API sequence, not a reproduced TRBE failure or
> an observed buffer switch in normal perf record operation.
> 
> Without reloading buf, __arm_trbe_enable() calculates the next buffer
> using B through the handle, but its workaround and hardware setup still
> receive A. If B has never been enabled, its missing CPU association can
> cause the normal-offset calculation to dereference NULL. With a snapshot
> buffer, hardware may instead keep using A while perf accounts output to B.
> 
> Reload the sink configuration after perf_aux_output_begin() so the buffer
> and handle refer to the same AUX transaction. If the buffer is missing or
> its CPU association does not match the interrupt's CPU data, truncate the
> new transaction and leave TRBE disabled. Truncation requests perf to stop
> the event; a subsequent normal restart installs the buffer and its CPU
> association through the sink enable path.
> 
> Stopping inherited writers during output redirection remains a separate
> perf-core fix.
> 

Shouldn't we do that instead of this? It seems much better to fix this 
in perf core rather than here which is hard to understand and appears to 
be a bit hacky, and doesn't apply to all users of aux buffers. I would 
expect that even when using PERF_EVENT_IOC_SET_OUTPUT, the buffer should 
be consistent between start and stops from the point of view of 
individual drivers. It makes sense to add a workaround in the driver if 
we can't control that behavior, but the code is in the same repo. Maybe 
we could even just leave this patch out and do the core fix later?

Unrelated to this, the sashiko report that says there is an out of 
bounds read if the output is switched to an ETF buffer seems to be 
pre-existing. But it's something worth thinking about.

> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-trbe.c | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
> index 2328aab0a084a0ac123e950f846f404d120ec2c0..f1f102df6c387f53feaa12b89d3df89f734afcdb 100644
> --- a/drivers/hwtracing/coresight/coresight-trbe.c
> +++ b/drivers/hwtracing/coresight/coresight-trbe.c
> @@ -1161,6 +1161,20 @@ static int trbe_handle_overflow(struct trbe_cpudata *cpudata)
>   	if (!event_data)
>   		return -EINVAL;
>   
> +	/*
> +	 * Reload the buffer after perf_aux_output_begin() so it matches the
> +	 * handle. A race with PERF_EVENT_IOC_SET_OUTPUT may select a buffer
> +	 * that has not been installed on this CPU and has no valid cpudata.
> +	 * If the buffer is missing or its CPU association does not match,
> +	 * truncate the trace to stop the event. A subsequent normal restart
> +	 * installs the buffer and its CPU association through sink enable.
> +	 */
> +	buf = etm_perf_sink_config(handle);
> +	if (!buf || buf->cpudata != cpudata) {
> +		trbe_truncate_event(handle);
> +		return -EINVAL;
> +	}
> +
>   	return __arm_trbe_enable(buf, handle);
>   }
>   
> 

