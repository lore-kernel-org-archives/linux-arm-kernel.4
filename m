Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AA26606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 15:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=udKtUrhl;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=w4vkKAxX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=rJjgX6E2Iz7NtAxo/Ej78l7jtNhnUtuzxHSnkCpGCgw=; b=udKtUrhl2CZglZ
	wVBvnBRxvCHvxOCNMH/4vydLx2Q9tuhI1Uz109jWMrZxtd18w1/9tH6AAtKlszTm8xYdH6EEYZFtt
	FNsM6/LV8XTYALKpDG1bFmqMvQPhCwE5rwDdG0VIOkxYnewpYQKq5DVmW68oxFPZO/jBdj2X9NG6D
	vHdyz8BFfzM3qBBcAGIYXhEi8gn0t7IolYR7YlXpH9cwM77zXbdlI7PWk6fKhum0t6mnBlkQcDGFq
	DcBQoIkF5lPyDvBJTWe1u/TaD+adzaqRVAT7lLmxMjMUG9fDbIdAZFefLQBBaZoSa5IlmwzJCsSfX
	Uyz1y6SrRxZsrvUyYbBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQnpI-00000004O2I-0a5X;
	Tue, 10 Nov 2026 15:32:00 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQnpG-00000004O19-0k7e
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 15:31:59 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-c43373ae89aso150389066b.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 07:31:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794324716; x=1794929516; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rJjgX6E2Iz7NtAxo/Ej78l7jtNhnUtuzxHSnkCpGCgw=;
        b=w4vkKAxXMepxxRxzJplliDPj3Wij1mmV239sroOvL7GsquqSO8YfXm0sHEtOpbNyka
         GM/vbR0VyJZ6gKq5ijsdpd9+uSySjS6mY0XchjQPvavJd9zp0Z7O6wx6lV+GrGK4/SST
         mAKeY2UZid845NVkXYyHTGLS+mQrPebEB6/i3gCGG767eJCpezKmL/zs6XOl+85V43xW
         N/jUigioacjkkLCtUfZJeKT2CQ3WsXL1QAPMRoCM69rPyMCbf8pczXIeZLCRSW0KkVkm
         L2SRGUzDI2hJqqkHN0+7qShvmjTR72yA2SyT6q4JUkiQtMHfRLkuSd9VU+14z5+D6brE
         Hu0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794324716; x=1794929516;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rJjgX6E2Iz7NtAxo/Ej78l7jtNhnUtuzxHSnkCpGCgw=;
        b=ouqxQR9Ro0saK5A5dPz1DlG/QB/lZ9YVK/Rh6no4Qw1emA+rhNGALhy5yv7bN0ztOD
         RJgCNXPXBWvyB+q3H7f74oR9P945u9TWX8Nt1hinUdYRHZ/SGlMyQDHucP6clno9RGcO
         T/X6FsUe6xxv62uz1cbib5F9lj+zfcmJTICXB1DgjlYd/X/byXFSf7CeH76LowtycXB0
         Wo7xZF3nrDtiHieb8kftzm50cHAJXYC3/JTYoIz6RA+L2B8K78jXNz1uFxLzxkC8VXsA
         vszpRgDNJnLswg/qhXizCCxYOI8f6zt5IXyM3uQSQONV9yKyIMYNLR4CmXFAbJ9NUVFx
         1hpw==
X-Gm-Message-State: APuU4Z800k5hBncIqjwRRb0MghLE2I1EvYmCBZvQhzl2lpQa6a8lMQhM
	WmUeFVNi9mshq3NgcVAJSB/1VdlWmt5U9ui8fInC+3zVA7LTxhR/Y7CoBFJngzQC8ic=
X-Gm-Gg: AYBFou0E0gSfOVdg1WdeJJpzu4TGpSkC1B/HsrBI5JaFMI1Jo3k+Xa/rUBZrnT4jdwq
	3EGoc6edUuG6ZqPNpZbdBC89mKzumwxACcEnWdJcwFZyag9dFSazNgFbnucQtHxgI0XRx0RqhTz
	0n8/kCe77jjnQKNOcgRFMNc+ZaS2euUoTjAFa6FINA+aAwjWKOeugHoEt7cl8MPpSAV4MTAUnrq
	sFsAOq9pztukeWVAFRLc39Z/R2xuLG8+ZJrreBitHjBEkdqjcEtR5jR6LcxtrW5fR2HSs5yNcKL
	OsDCtAO3LmYraHPQ4Z6gNkEmZEUMEZb5CcDiCAYy+2sNDJNvAsybRwux2vyMojgYETEA7FYPX6R
	2hYdhiEDI373KYyFTMvuZ3PNbIsrKWA2jqQs+Kg0sWDJl55xe6zxPBoLb1sMl1j+Ke+lheiXCHx
	+GoRyRbwYZA8gHinioRA8FsFrTOUHT6zerU38R5BkxfUZPCALYQHbSFO3tJKMSTu4+wbk8TeIWG
	x06U6Twkt98GCTq+pfV0JcqVBI1h4E+HvhFUvdh1CziSa1xBwvp5CAOeMzlDgJu002fshMzw3tf
	kwOFuw0IC20dag37LrVvZDXt8L0c23AC1/0=
X-Received: by 2002:a17:906:8a6f:b0:c48:ddac:7eb1 with SMTP id a640c23a62f3a-c50496e7f98mr179676266b.45.1794324716129;
        Tue, 10 Nov 2026 07:31:56 -0800 (PST)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4984e26f8e3sm4917105f8f.1.2026.11.10.07.31.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 07:31:55 -0800 (PST)
Message-ID: <1b528cd9-eac0-43b3-8166-db9f78c9f044@linaro.org>
Date: Tue, 10 Nov 2026 15:31:54 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/23] coresight: trbe: Assign the perf handle in
 enable and disable
To: Leo Yan <leo.yan@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 coresight@lists.linaro.org, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Tamas Petz <tamas.petz@arm.com>, Tamas Zsoldos <tamas.zsoldos@arm.com>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
References: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
 <20261016-trbe_enable_disable_irq_handle_refactor-v2-11-3f57cf3199b1@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20261016-trbe_enable_disable_irq_handle_refactor-v2-11-3f57cf3199b1@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_073158_250128_BC5E7AB3 
X-CRM114-Status: GOOD (  22.46  )
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
> etm-perf owns the perf output handle embedded in its per-CPU etm_ctxt and
> passes it to TRBE through arm_trbe_enable(). TRBE binds that handle after
> successful sink enable and unbinds it in arm_trbe_disable(). The handle
> object remains valid throughout this interval, even if the current AUX
> transaction ends or a new transaction begins.
> 
> The inner enable helper currently publishes the handle, while truncation
> and failed rollover clear it. Sink disable leaves the handle installed
> after dropping the buffer association. These assignments track the AUX
> transaction rather than the enabled sink session.
> 
> Publish the handle only in arm_trbe_enable() after successful setup and
> clear it in arm_trbe_disable() before dropping the buffer association.
> Remove the assignments from the inner enable, overflow and truncation
> paths so the handle association follows the enabled sink session.
> 
> A valid handle object may have no active AUX transaction, so the IRQ
> handler continues to check perf_get_aux() before accessing the
> transaction's configuration.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-trbe.c | 20 +++++++-------------
>   1 file changed, 7 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
> index 4a041bbc6e970d72a7d735e15f7221037cb091d6..1f51c33de83638479436683fd96e31d69c3b860f 100644
> --- a/drivers/hwtracing/coresight/coresight-trbe.c
> +++ b/drivers/hwtracing/coresight/coresight-trbe.c
> @@ -303,11 +303,8 @@ static void trbe_report_wrap_event(struct perf_output_handle *handle)
>   
>   static void trbe_truncate_event(struct perf_output_handle *handle)
>   {
> -	struct trbe_buf *buf = etm_perf_sink_config(handle);
> -
>   	perf_aux_output_flag(handle, PERF_AUX_FLAG_TRUNCATED);
>   	perf_aux_output_end(handle, 0);
> -	*this_cpu_ptr(buf->cpudata->drvdata->handle) = NULL;
>   }
>   
>   /*
> @@ -1012,7 +1009,6 @@ static int __arm_trbe_enable(struct trbe_buf *buf,
>   	if (ret)
>   		goto err;
>   
> -	*this_cpu_ptr(buf->cpudata->drvdata->handle) = handle;
>   	trbe_enable_hw(buf);
>   	return 0;
>   err:
> @@ -1042,6 +1038,7 @@ static int arm_trbe_enable(struct coresight_device *csdev, enum cs_mode mode,
>   		return ret;
>   	}
>   
> +	*this_cpu_ptr(drvdata->handle) = handle;
>   	cpudata->buf = buf;
>   	cpudata->mode = mode;
>   	return 0;
> @@ -1062,6 +1059,7 @@ static int arm_trbe_disable(struct coresight_device *csdev)
>   	trbe_drain_and_disable_local(cpudata);
>   	clr_trbe_status();
>   
> +	*this_cpu_ptr(drvdata->handle) = NULL;
>   	buf->cpudata = NULL;
>   	cpudata->buf = NULL;
>   	cpudata->mode = CS_MODE_DISABLED;
> @@ -1102,16 +1100,12 @@ static int trbe_handle_overflow(struct perf_output_handle *handle)
>   	trbe_report_wrap_event(handle);
>   	perf_aux_output_end(handle, size);
>   	event_data = perf_aux_output_begin(handle, event);
> -	if (!event_data) {
> -		/*
> -		 * We are unable to restart the trace collection,
> -		 * thus leave the TRBE disabled. The etm-perf driver
> -		 * is able to detect this with a disconnected handle
> -		 * (handle->event = NULL).
> -		 */
> -		*this_cpu_ptr(buf->cpudata->drvdata->handle) = NULL;
> +	/*
> +	 * If trace collection cannot be restarted, leave TRBE disabled.
> +	 * The etm-perf driver detects this through handle->event == NULL.
> +	 */
> +	if (!event_data)
>   		return -EINVAL;
> -	}
>   
>   	return __arm_trbe_enable(buf, handle);
>   }
> 
Reviewed-by: James Clark <james.clark@linaro.org>

