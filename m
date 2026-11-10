Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4278606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 15:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nSh6r68e;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=B7prtjzk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=NJnOdF4olvZ0uC00aRDDzPjTyhqTiEVqBOnUPYxJ54A=; b=nSh6r68e5/b8Xp
	DPqgy4SOoY2v/CZ05ar+4NsH7Tcem4oSPX0SfVb5evo/IGKy8hpTLBmU743llzEbbAWIZ0MfuTXU3
	tQX9a0u7xIyPc/t2zRJmX+tbQVyMEy+sFpozNKh3w1Z/OttMFltTJczAngVKZu0LY6Ex4x+fvutq7
	4i0vqxhN6Ktnnoa6Br9iep7B1r/25RlNUylr9wHZMdG9v1X03tK3paTu0CVFRvdet7dAzSD0baYFQ
	bDwBQEiXPG2pnZVOqnnUoVPK8TUvld5eHqJTglh6hA0G25/rtLVHC26wq3nKcAAsrWSj7YbvdweHk
	BLBHmU+csHn/JkLgGEKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQnrq-00000004P1t-3GSN;
	Tue, 10 Nov 2026 15:34:38 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQnro-00000004P0Y-3ebv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 15:34:38 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso18002195e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 07:34:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794324875; x=1794929675; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NJnOdF4olvZ0uC00aRDDzPjTyhqTiEVqBOnUPYxJ54A=;
        b=B7prtjzkScbNi0+lxpiKnHySm5jpSkeXAfSwlUIp/N6Bm5L1ePfI9qGZ8YfMKcWgKU
         RBZQYYvISB8AnjZG3iM/b7VdCxdH7bpvJ2hnTXT6D4mCFbOpyvtHYDXZnZebDSX+ULFi
         lLeXiConnE4/E6kum5Uk/deME/lu59Rkzkyjhmifk0ypPZiBLmdkwXTqfx1v+J32O9yX
         h81+JWmdZo6GyWTOX8QsrsDLDvX+wS6UNea8HH3IIH2u+YgQBmGYkVCrQe05gRLJgMRf
         AqaZWOGtjfERQPT+YS1LCKi9bCqgFS/NGYklQ9lTTp59B9PzcwGFSn2xW2mvqGSfW8Z3
         jODQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794324875; x=1794929675;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NJnOdF4olvZ0uC00aRDDzPjTyhqTiEVqBOnUPYxJ54A=;
        b=CQbUKnOvuUlBIGFyhl+XA6P0B3QoZRw7rEawuXIemfJklFeJWo0/Pd2zIF0vlpjgBD
         624Bn4hre1rITE7Muvfi+5zcLp8kyIUjhRgSLnEQX+LjoxntO0JElhusSNB2Wiz8tO1+
         IS/tkuyLHmfeaVBY89m5W5uItvcfNUHnr3+utzesDJniTWPHx7jIpK+r53oTO7C+s9fN
         EO3ZKYsRbJv1i9yFgAuLpwRYtlzweFIVx1RQ59+FVWi3LQvmlvJfabp8QYO6LjCyZtRB
         RWKhrYn0V6wvkN9OA5k0rtH6xOALVIElUrkD+c8DBT8Gb5HO5Ct/c7/JURKgJOsg7Eut
         6vWw==
X-Gm-Message-State: APuU4Z9zkctZp9bIrkt94x/WjHISPvgeTzFZ4PX075oC6bLUvAQIICkr
	oRi5vOP8iRiQ5pL4sFBfIU9gL+aSp37jhKfVv8MJAPGZfqdXuvWx8VrNYpfegjh69Qg=
X-Gm-Gg: AYBFou2PUMUqQGlTVaVzbr7h+oAVkRvSsWYpveJwClkA5nxbamgE088NQzfImtdGDsw
	XWxHloHglGS+yGChbjGEy/rccHZNj0VoCJyrsUNwORXcJjtw0LVLADKEBKR3m0t1sqiQPCg1aLq
	XQnV/GkoI7PoNIIavf1pijpNuuJNACWmVRhoMR1Y6K2akgi2Jsj+9iUZicBvYZpV6UQcwKrd05L
	apQr7jJMWSYLtAbk6mkZLXS420i9ghte8XYho4ASAQjkMpCyg0MhgS7s+Ndzck/d1E/Txm1ZAfO
	ExruGnxP8MTug8ITF2CZlYb0Av8WQ8yUAlaieU/9cj9fPlC5vwpzPtpMFBtFwQB5v15LwQXe/o6
	T/PqHb+pBQZpldQYLcqEC95xSw5rzQlyBXako654jerXHLTgaVerpxVNt0eVKuJO7j9Rgr81bSK
	zypCXP8rNg6TnUuwpcbFRdywOZzfA9kGlwwn8xAmTvrUt6nHJp6XeL8ssyxacgvVHT0w9snIil3
	Yr/G7qGt6KmhxHxFyG/t+ZNOCvrhefq0hw+jzoZ7DIn4y4WGJQ6/3Vj8nUHKnFxJKjQUno/biUR
	zoRUJLgpSOfGaihFhLD5JBX6yi92atNWAQ==
X-Received: by 2002:a05:600c:3d05:b0:4a3:598e:e7a8 with SMTP id 5b1f17b1804b1-4ba0230519amr54309275e9.4.1794324874844;
        Tue, 10 Nov 2026 07:34:34 -0800 (PST)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49835e20f91sm6187825f8f.27.2026.11.10.07.34.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 07:34:34 -0800 (PST)
Message-ID: <38e4f4dc-e2ea-4b7f-82d1-e7b298e88002@linaro.org>
Date: Tue, 10 Nov 2026 15:34:33 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 18/23] coresight: trbe: Keep the perf handle in per-CPU
 data
To: Leo Yan <leo.yan@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 coresight@lists.linaro.org, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Tamas Petz <tamas.petz@arm.com>, Tamas Zsoldos <tamas.zsoldos@arm.com>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
References: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
 <20261016-trbe_enable_disable_irq_handle_refactor-v2-18-3f57cf3199b1@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20261016-trbe_enable_disable_irq_handle_refactor-v2-18-3f57cf3199b1@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_073436_966580_EAA34123 
X-CRM114-Status: GOOD (  27.60  )
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
> Arm SPE owns a per-CPU perf output handle for the PMU lifetime. TRBE
> instead receives a handle from CoreSight when enabling its sink.
> 
> Store that session handle in trbe_cpudata instead of a separate per-CPU
> pointer array, and pass the CPU data as the per-CPU IRQ context. Use this
> context directly for overflow and spurious interrupt handling so local
> hardware control does not depend on the current AUX buffer configuration.
> 
> Allocate the CPU data before registering the IRQ and free it after
> releasing the IRQ, keeping the IRQ context valid throughout registration.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-trbe.c | 44 ++++++++++++----------------
>   1 file changed, 19 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
> index 9a469c8009ce8a8a8b804c2b63a68e741f1dceaa..2328aab0a084a0ac123e950f846f404d120ec2c0 100644
> --- a/drivers/hwtracing/coresight/coresight-trbe.c
> +++ b/drivers/hwtracing/coresight/coresight-trbe.c
> @@ -139,6 +139,7 @@ struct trbe_save_state {
>    * @cpu			- CPU this TRBE belongs to.
>    * @mode		- Mode of current operation. (perf/disabled)
>    * @buf			- Buffer configuration retained for the enabled session.
> + * @handle		- Perf output handle from successful enable until disable.
>    * @drvdata		- TRBE specific drvdata
>    * @errata		- Bit map for the errata on this TRBE.
>    */
> @@ -149,6 +150,7 @@ struct trbe_cpudata {
>   	int cpu;
>   	enum cs_mode mode;
>   	struct trbe_buf *buf;
> +	struct perf_output_handle *handle;
>   	struct trbe_drvdata *drvdata;
>   	struct trbe_save_state save_state;
>   	DECLARE_BITMAP(errata, TRBE_ERRATA_MAX);
> @@ -156,7 +158,6 @@ struct trbe_cpudata {
>   
>   struct trbe_drvdata {
>   	struct trbe_cpudata __percpu *cpudata;
> -	struct perf_output_handle * __percpu *handle;
>   	struct hlist_node hotplug_node;
>   	int irq;
>   	cpumask_t supported_cpus;
> @@ -1091,7 +1092,7 @@ static int arm_trbe_enable(struct coresight_device *csdev, enum cs_mode mode,
>   		return ret;
>   	}
>   
> -	*this_cpu_ptr(drvdata->handle) = handle;
> +	cpudata->handle = handle;
>   	cpudata->buf = buf;
>   	cpudata->mode = mode;
>   	return 0;
> @@ -1112,16 +1113,15 @@ static int arm_trbe_disable(struct coresight_device *csdev)
>   	trbe_drain_and_disable_local(cpudata);
>   	clr_trbe_status();
>   
> -	*this_cpu_ptr(drvdata->handle) = NULL;
>   	buf->cpudata = NULL;
> +	cpudata->handle = NULL;
>   	cpudata->buf = NULL;
>   	cpudata->mode = CS_MODE_DISABLED;
>   	return 0;
>   }
>   
> -static void trbe_handle_spurious(struct perf_output_handle *handle)
> +static void trbe_handle_spurious(struct trbe_cpudata *cpudata)
>   {
> -	struct trbe_buf *buf = etm_perf_sink_config(handle);
>   	u64 trblimitr = read_sysreg_s(SYS_TRBLIMITR_EL1);
>   
>   	/*
> @@ -1129,11 +1129,12 @@ static void trbe_handle_spurious(struct perf_output_handle *handle)
>   	 * back without modifying the buffer parameters to
>   	 * retain the trace collected so far.
>   	 */
> -	set_trbe_enabled(buf->cpudata, trblimitr);
> +	set_trbe_enabled(cpudata, trblimitr);
>   }
>   
> -static int trbe_handle_overflow(struct perf_output_handle *handle)
> +static int trbe_handle_overflow(struct trbe_cpudata *cpudata)
>   {
> +	struct perf_output_handle *handle = cpudata->handle;
>   	struct perf_event *event = handle->event;
>   	struct trbe_buf *buf = etm_perf_sink_config(handle);
>   	unsigned long size;
> @@ -1203,9 +1204,8 @@ static u64 cpu_prohibit_trace(void)
>   
>   static irqreturn_t arm_trbe_irq_handler(int irq, void *dev)
>   {
> -	struct perf_output_handle **handle_ptr = dev;
> -	struct perf_output_handle *handle = *handle_ptr;
> -	struct trbe_buf *buf;
> +	struct trbe_cpudata *cpudata = dev;
> +	struct perf_output_handle *handle = cpudata->handle;
>   	enum trbe_fault_action act;
>   	u64 status;
>   	bool truncated = false;
> @@ -1232,18 +1232,17 @@ static irqreturn_t arm_trbe_irq_handler(int irq, void *dev)
>   	 * Ensure the trace is visible to the CPUs and
>   	 * any external aborts have been resolved.
>   	 */
> -	buf = etm_perf_sink_config(handle);
> -	trbe_drain_and_disable_local(buf->cpudata);
> +	trbe_drain_and_disable_local(cpudata);
>   	clr_trbe_irq();
>   	isb();
>   
>   	act = trbe_get_fault_act(handle, status);
>   	switch (act) {
>   	case TRBE_FAULT_ACT_WRAP:
> -		truncated = !!trbe_handle_overflow(handle);
> +		truncated = !!trbe_handle_overflow(cpudata);
>   		break;
>   	case TRBE_FAULT_ACT_SPURIOUS:
> -		trbe_handle_spurious(handle);
> +		trbe_handle_spurious(cpudata);
>   		break;
>   	case TRBE_FAULT_ACT_FATAL:
>   		trbe_truncate_event(handle);
> @@ -1507,10 +1506,6 @@ static int arm_trbe_probe_coresight(struct trbe_drvdata *drvdata)
>   {
>   	int cpu;
>   
> -	drvdata->cpudata = alloc_percpu(typeof(*drvdata->cpudata));
> -	if (!drvdata->cpudata)
> -		return -ENOMEM;
> -
>   	for_each_cpu(cpu, &drvdata->supported_cpus) {
>   		/* If we fail to probe the CPU, let us defer it to hotplug callbacks */
>   		if (smp_call_function_single(cpu, arm_trbe_probe_cpu, drvdata, 1))
> @@ -1531,7 +1526,6 @@ static int arm_trbe_remove_coresight(struct trbe_drvdata *drvdata)
>   		smp_call_function_single(cpu, arm_trbe_disable_cpu, drvdata, 1);
>   		arm_trbe_remove_coresight_cpu(drvdata, cpu);
>   	}
> -	free_percpu(drvdata->cpudata);
>   	return 0;
>   }
>   
> @@ -1618,14 +1612,14 @@ static int arm_trbe_probe_irq(struct platform_device *pdev,
>   
>   	cpumask_copy(&drvdata->supported_cpus, affinity);
>   
> -	drvdata->handle = alloc_percpu(struct perf_output_handle *);
> -	if (!drvdata->handle)
> +	drvdata->cpudata = alloc_percpu(typeof(*drvdata->cpudata));
> +	if (!drvdata->cpudata)
>   		return -ENOMEM;
>   
>   	ret = request_percpu_irq_affinity(drvdata->irq, arm_trbe_irq_handler, DRVNAME,
> -					  affinity, drvdata->handle);
> +					  affinity, drvdata->cpudata);
>   	if (ret) {
> -		free_percpu(drvdata->handle);
> +		free_percpu(drvdata->cpudata);
>   		return ret;
>   	}
>   	return 0;
> @@ -1633,8 +1627,8 @@ static int arm_trbe_probe_irq(struct platform_device *pdev,
>   
>   static void arm_trbe_remove_irq(struct trbe_drvdata *drvdata)
>   {
> -	free_percpu_irq(drvdata->irq, drvdata->handle);
> -	free_percpu(drvdata->handle);
> +	free_percpu_irq(drvdata->irq, drvdata->cpudata);
> +	free_percpu(drvdata->cpudata);
>   }
>   
>   static int arm_trbe_device_probe(struct platform_device *pdev)
> 
Reviewed-by: James Clark <james.clark@linaro.org>

