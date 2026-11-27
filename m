Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96E98606A324
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 15:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RHYVuHhh;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=pYXhTvL4;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=XUUzxyi2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=w+bvO8L94MbR99EZPTdisowEtnBgJBIsl1FXhXNPe+4=; b=RHYVuHhhtJ48Bv
	ThNzQwFDyep435u5Vc6i3ZyvV46hJSuFvkcTdsx6sPCM7Y7OvjXnEB9AAoxO7AXC9TULdOL95Irsy
	iqL02VSCWYCr+Moo4UTHxlAFSDlFaWCmZebRIhuNH1q797eINJ7hTSgoL5cp5xSmXP01MsiD8TqXf
	LJbWI3LkK4eaqJt856+AyJt1wdncPhlVUrthJZeKs5FK6zL0clfdapQ7B0/l4OOGhNcclHzqCVvPJ
	SeomWLD6WRbFEjDoOFQpQtPuVpn4pTCbYuIboVAypu5bGXONn+HHyxYbbFrGoKaQQ0avdfPBgpmjU
	D0flKDmhpXA2H0ACpi9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxjf-0000000GjpK-3HYJ;
	Fri, 27 Nov 2026 15:19:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxjY-0000000Gjlf-1vmI
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 27 Nov 2026 15:19:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=w+bvO8L94MbR99EZPTdisowEtnBgJBIsl1FXhXNPe+4=; b=pYXhTvL4Hl9pa7BkZ3pTHoo6Y3
	j5r/FGVabIv7YtM70HIBA8ix9bmIqnpeYsYbrTBtvAZyERwczKLiw8XUqT/+TiySRbKqRymxgKrZu
	qOUAMXgVFw1QVxjhaqj20pZ3WSGnHwxKXMCtZTAbm/sKTfatUurKMOSMYbCLnbiNSFO2SziwIcCa6
	pHf7baHmv/0zjcqx1IQOhSqEeU9B63pdA//sfeh4yC/twUQ36FcBw7Slc6LxPHi539FNmg30l2w18
	wVQr2QJGnFFyA+PXyILwan3db67IwXg2q5Ofh5Bn6y1zhfZKrA6iZ3kTPHZl7DqzYax+nQhfqmGnZ
	ksZl+wPw==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxjV-00000007sxJ-27k8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 15:19:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 30A10169E;
	Fri, 27 Nov 2026 07:19:23 -0800 (PST)
Received: from [10.57.71.121] (unknown [10.57.71.121])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3A3B53F632;
	Fri, 27 Nov 2026 07:19:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795792765; bh=6cLgsO7UXgi5ha39CFj+v3MC0SZqQUTqxialUDP9Zno=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XUUzxyi2nkciM4jc6pOOx6202g7vH1u9DKGnQaVFAq6cyhD4Q0+u2gQ2FE/V7D3NC
	 5SMbxg+7aJwR79Krd/JbgbJ3bX7MpUDgQXZi1EARW0yPeo5WVs/kUS6oVHi/e/tJ2S
	 wGIs/Z5uPnUsQBaAzEDlU5HfPbhbz3gMcXbIYy4U=
Message-ID: <0cac6918-d7dd-4e2f-addf-17eb1200f1e3@arm.com>
Date: Fri, 27 Nov 2026 15:19:22 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/23] coresight: trbe: Assign the perf handle in
 enable and disable
Content-Language: en-GB
To: Leo Yan <leo.yan@arm.com>, Mike Leach <mike.leach@arm.com>,
 James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Tamas Petz <tamas.petz@arm.com>, Tamas Zsoldos <tamas.zsoldos@arm.com>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 coresight@lists.linaro.org
References: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
 <20261016-trbe_enable_disable_irq_handle_refactor-v2-11-3f57cf3199b1@arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20261016-trbe_enable_disable_irq_handle_refactor-v2-11-3f57cf3199b1@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_151929_942493_D35D4724 
X-CRM114-Status: GOOD (  20.90  )
X-Spam-Score: -2.5 (--)
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

Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>


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


