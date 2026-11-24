Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74A92606A690
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 14:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qDTl4AvM;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=c7i3xfZK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ISTbz4wvFFAt6bzo0qkX0pE8/CfrFExmmIE+Q/E+mRk=; b=qDTl4AvMsUNynj
	EeQBeSW28aW5+BM9+n6FdOoJTu28E4Z9QtFMV8G0QtKJ1VNz1MlZihbDMJ7/Sx5K9R8ciiF4kb3fa
	kYpbGSblGTgKaVqPJijHQuhOOrxAL1Rsk5Z09KBhNMDRedjKOJbT3X5O72ozjySrck4Wi5UrJSIHF
	B+dzArVyDw0Ea2X/QgOf19Xa0yHDFCDGie8ppQ9kmrEMZKyJw2F+9IXrcxW/BWBAq+4YnGOHk1Vwa
	1rYAlUSbXsGTs0l+3sHWt0IuDBMivrp1ZpK91UTCMiVkOqioeB3FKlxSGfLOp/3JOFxB4a6El+qqd
	4Qp5xVZkg1l9PKZIEukg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVqDt-00000006ZaS-43pI;
	Tue, 24 Nov 2026 13:06:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVqDr-00000006ZZx-0OL6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 13:06:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 94475339;
	Tue, 24 Nov 2026 05:06:04 -0800 (PST)
Received: from [10.2.197.99] (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2F3AE3F86F;
	Tue, 24 Nov 2026 05:06:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795525567; bh=KfcNb14BPbce/SMMQsbu3BnOADE88adplfkak0jlU4k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=c7i3xfZKuhYWfmc8XuthD9SjMtI8KP5JiTYsk//7UKJ7SUqxhDPCOk1lCAF75Z4GJ
	 F6spa/1VAV5pLsBL13FVJTxxgHFMSHzf9eWaP0yf4p4nxYEm45ENeCWFLOvjeBq4hL
	 dJfNqW7ezncp/U9hLs4gCQQIFxuYEQwoAogbIbok=
Message-ID: <09e172d0-3ef5-44ef-a966-7db3b8a4af9a@arm.com>
Date: Tue, 24 Nov 2026 13:06:04 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight: perf: End AUX output when an event is
 throttled
To: Leo Yan <leo.yan@arm.com>, Mike Leach <mike.leach@arm.com>,
 James Clark <james.clark@linaro.org>, Vlad Poenaru <vlad.wing@gmail.com>,
 Amir Ayupov <aaupov@fb.com>, Suyash Mahar <smahar@meta.com>,
 Song Liu <song@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261124-arm_cs_fix_throttling_oops-v1-1-3ad1dfad0159@arm.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20261124-arm_cs_fix_throttling_oops-v1-1-3ad1dfad0159@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_050611_421330_4EFFC63D 
X-CRM114-Status: GOOD (  29.17  )
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

On 24/11/2026 12:00, Leo Yan wrote:
> Perf throttles a group by calling each event's PMU stop callback with
> flags set to zero. On a CPU with a trace path, ETM stops tracing and
> leaves the AUX transaction open because PERF_EF_UPDATE is clear. When
> perf unthrottles the event, perf_aux_output_begin() warns because
> aux_nest is still set.
> 
>    [  181.161897] ------------[ cut here ]------------
>    [  181.161906] WARNING: kernel/events/ring_buffer.c:415 at perf_aux_output_begin+0x1dc/0x1f0, CPU#0:2
>    [  181.234120] arm-scmi arm-scmi.1.auto: timed out in resp(caller: do_xfer+0x1a0/0x558)
>    [  181.234223] cpufreq: __target_index: Failed to change cpu frequency: -110
>    [  181.286675] Modules linked in: panfrost tda9950 hdlcd tda998x drm_shmem_helper drm_client_lib cect
>    [  181.314139] CPU: 0 UID: 0 PID: 352 Comm: perf Not tainted 7.1.0-rc1-00058-gdca922e019dd-dirty #11
>    [  181.323915] Hardware name: ARM LTD ARM Juno Development Platform/ARM Juno Development Platform, B5
>    [  181.334732] pstate: 600000c5 (nZCv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>    [  181.341721] pc : perf_aux_output_begin+0x1dc/0x1f0
>    [  181.346547] lr : perf_aux_output_begin+0x9c/0x1f0
>    [  181.351280] sp : ffff800080003be0
>    [  181.354606] x29: ffff800080003be0 x28: ffff0008023fc000 x27: ffff4b45d287f000
>    [  181.361789] x26: ffff0009764787a8 x25: 0000000000000000 x24: ffff00080dc99710
>    [  181.368970] x23: ffffb4c334553000 x22: 0000000000000001 x21: ffff00080dc99710
>    [  181.376151] x20: ffff0009764787a8 x19: ffff000801cc6000 x18: 00000000ffffffff
>    [  181.383332] x17: 0000000000000000 x16: ffffb4c3a118c998 x15: 0000000000000000
>    [  181.390512] x14: 00003d0900000000 x13: 00000001ffff006e x12: 696765625f747570
>    [  181.397692] x11: ffffb4c3a52758d8 x10: 0000000000000108 x9 : ffffb4c3a117f620
>    [  181.404873] x8 : ffff800080003a58 x7 : ffff000808de4000 x6 : 00000000000fffff
>    [  181.412053] x5 : 0000000000000000 x4 : 0000000000000000 x3 : 0000000000000000
>    [  181.419232] x2 : 0000000000000007 x1 : 0000000000000000 x0 : 0000000000000007
>    [  181.426411] Call trace:
>    [  181.428868]  perf_aux_output_begin+0x1dc/0x1f0 (P)
>    [  181.433692]  etm_event_start+0xdc/0x290 [coresight]
>    [  181.438665]  perf_event_unthrottle+0x70/0xa8
>    [  181.442964]  perf_event_unthrottle_group+0x40/0x170
>    [  181.447871]  perf_adjust_freq_unthr_events+0x178/0x1a8
>    [  181.453038]  perf_adjust_freq_unthr_context+0x74/0xf8
>    [  181.458120]  perf_event_task_tick+0xa8/0x290
>    [  181.462418]  sched_tick+0x144/0x2c8
>    [  181.465937]  update_process_times+0xc0/0x198
> 
> End the AUX transaction with size zero on a throttling stop so
> unthrottling can acquire a fresh handle. Collect trace data only when
> PERF_EF_UPDATE is set.
> 
> Check AUX handle ownership before updating the buffer or ending AUX
> output. Drop the post-update check because the full stop runs with
> local IRQs disabled, which prevents the TRBE IRQ from closing the
> handle during the stop.
> 
> This patch is limited to fixing the event throttling case. Other issues,
> such as CPUs without a trace path and pending TRBE IRQs during sink
> teardown, will be addressed by the following patch series [1][2].
> 
> [1] https://lore.kernel.org/linux-arm-kernel/20260915-arm_cs_support_aux_sample-v1-6-35cf6f297d20@arm.com/
> [2] https://lore.kernel.org/linux-arm-kernel/20261016-trbe_enable_disable_irq_handle_refactor-v2-9-3f57cf3199b1@arm.com/
> 
> Fixes: 9734e25fbf5a ("perf: Fix the throttle logic for a group")
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-etm-perf.c | 34 +++++++-----------------
>   1 file changed, 10 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
> index 909bfd5960331d44547a028fde336f7819488a1a..e506116723c4ed723d66bc721021718b5d176117 100644
> --- a/drivers/hwtracing/coresight/coresight-etm-perf.c
> +++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
> @@ -698,7 +698,7 @@ static void etm_event_pause(struct coresight_path *path,
>   static void etm_event_stop(struct perf_event *event, int mode)
>   {
>   	int cpu = smp_processor_id();
> -	unsigned long size;
> +	unsigned long size = 0;
>   	struct coresight_device *source, *sink;
>   	struct etm_ctxt *ctxt = this_cpu_ptr(&etm_ctxt);
>   	struct perf_output_handle *handle = &ctxt->handle;
> @@ -757,33 +757,19 @@ static void etm_event_stop(struct perf_event *event, int mode)
>   	 * handle due to lack of buffer space), we don't
>   	 * have to do anything here.
>   	 */
> -	if (handle->event && (mode & PERF_EF_UPDATE)) {
> -		if (WARN_ON_ONCE(handle->event != event))
> -			return;
> +	if (!handle->event || WARN_ON_ONCE(handle->event != event))
> +		goto out;
>   
> +	if (mode & PERF_EF_UPDATE) {
>   		/* update trace information */
> -		if (!sink_ops(sink)->update_buffer)
> -			return;
> -
> -		size = sink_ops(sink)->update_buffer(sink, handle,
> -					      event_data->snk_config);
> -		/*
> -		 * Make sure the handle is still valid as the
> -		 * sink could have closed it from an IRQ.
> -		 * The sink driver must handle the race with
> -		 * update_buffer() and IRQ. Thus either we
> -		 * should get a valid handle and valid size
> -		 * (which may be 0).
> -		 *
> -		 * But we should never get a non-zero size with
> -		 * an invalid handle.
> -		 */
> -		if (READ_ONCE(handle->event))
> -			perf_aux_output_end(handle, size);
> -		else
> -			WARN_ON(size);
> +		if (sink_ops(sink)->update_buffer)
> +			size = sink_ops(sink)->update_buffer(sink, handle,
> +							     event_data->snk_config);

Could we retain the READ_ONCE() check to handle the TRBE case here ? 
This looks like introducing a regression. Something like :

		if (!READ_ONCE(handle->event)) {
			WARN_ON(size);
			goto out;
		}


>   	}


Otherwise looks good to me

Suzuki


>   
> +	perf_aux_output_end(handle, size);
> +
> +out:
>   	/* Disabling the path make its elements available to other sessions */
>   	coresight_disable_path(path);
>   }
> 
> ---
> base-commit: 8e3ac058be1b613aeabcb7ce18c142e4603cc5dd
> change-id: 20261124-arm_cs_fix_throttling_oops-140053eb0883
> 
> Best regards,


