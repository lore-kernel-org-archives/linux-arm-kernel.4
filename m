Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A852606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 19:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ROBRZ8Kk;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=XU4gsp1h
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=DptalpG5OK6uHIWvNRT85H0FkbJfB5pNsWcqOQw9vJE=; b=ROBRZ8KkPK7/KC
	FXGCGMZ8A+j8T8w8/Ba2l/dQoZtcjfqBghQ+h2PJoB/+YpVx76SMxSboJgJbe27Ea0IS1EuTcb9QB
	Mq/8FcHGU251f7bhEKMb9n71Ax1RMKvgZpvx7YdFWl0u1iRfjdZc6MaNRTQB7R5hueejCSiqCXgCe
	/cLPhV8KR+lzxhoG5UaVzs/EI63h1cwsgH9XFQwwzAa8X7aBELn3cJEIEcsNsp7T0XsZbbHQvOEGs
	fKQs4G5oJO8PcySzJ/foBOQcR36zBfjutUyJvPjnoqc69py/NpMjVRc/pfi4lDsVaXMCt/J8UI1Cz
	GjxFW3A0Y807r2VoxHkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX1nT-0000000HaZu-09dP;
	Fri, 27 Nov 2026 19:39:51 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX1nQ-0000000HaZ6-2k4X
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 19:39:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A59E81575;
	Fri, 27 Nov 2026 11:39:44 -0800 (PST)
Received: from [10.2.212.23] (e121345-lin.cambridge.arm.com [10.2.212.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F3CF93F632;
	Fri, 27 Nov 2026 11:39:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795808387; bh=iWkMLFKoQMuIMMUNeN14lQelc9+PWIM3ZZnPe8c8zTQ=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=XU4gsp1huDDg/iulDCSn76xkxJgy7kv6WlcmXl+Hgwav83nfA2CmObNK41TENpLIa
	 mgTwpdRScD6VNTkouFwRSW3SzZuYOAG8IakvBtU5VRynb1NpovsiYFBzHF6drAjNKu
	 gqNFpZLclfuocAOqgeJhzQTOGv8KIY6qfbIQUwHY=
Message-ID: <a91bb9fd-1170-49c7-a5da-d6b8fd00c4ba@arm.com>
Date: Fri, 27 Nov 2026 19:39:44 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH 2/2] perf/smmuv3: Add runtime PM support
To: Amita Mishra <amitamishra@google.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261118101913.3135869-1-amitamishra@google.com>
 <20261118101913.3135869-3-amitamishra@google.com>
Content-Language: en-GB
In-Reply-To: <20261118101913.3135869-3-amitamishra@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_113948_866843_A199CE6C 
X-CRM114-Status: GOOD (  45.88  )
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

On 2026-11-18 10:19 am, Amita Mishra wrote:
> On SoCs where an SMMUv3 PMCG resides in a switchable power domain,
> probing the PMCG attaches and powers on the domain, but without runtime
> PM support the domain remains permanently powered on even when no perf
> events are active.
> 
> Add runtime PM support for PMCG devices attached to a PM domain:
> - Enable runtime PM while holding a reference before setting up the IRQ
>    and registering the PMU, then drop the reference once probe completes
>    so an idle PMCG can suspend.
> - Resume and hold a runtime PM reference in smmu_pmu_event_init() for
>    each active event and release it in event->destroy().
> - Register runtime PM callbacks to disable the PMU on suspend and reset
>    it on resume.
> - Guard smmu_pmu_enable(), smmu_pmu_disable(), and smmu_pmu_handle_irq()
>    with smmu_pmu_in_use() because perf_ctx_enable()/perf_ctx_disable()
>    and shared or late IRQs can still run after the last event is removed
>    and the PMCG is powered off. Keep unconditional register disable in
>    __smmu_pmu_disable() for reset, runtime suspend, and active shutdown.
> 
> Signed-off-by: Amita Mishra <amitamishra@google.com>
> ---
>   drivers/perf/arm_smmuv3_pmu.c | 134 +++++++++++++++++++++++++++++-----
>   1 file changed, 115 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/perf/arm_smmuv3_pmu.c b/drivers/perf/arm_smmuv3_pmu.c
> index 97440b6233c6..e9da99b4a086 100644
> --- a/drivers/perf/arm_smmuv3_pmu.c
> +++ b/drivers/perf/arm_smmuv3_pmu.c
> @@ -50,6 +50,7 @@
>   #include <linux/of.h>
>   #include <linux/perf_event.h>
>   #include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
>   #include <linux/smp.h>
>   #include <linux/sysfs.h>
>   #include <linux/types.h>
> @@ -151,15 +152,33 @@ SMMU_PMU_EVENT_ATTR_EXTRACTOR(filter_stream_id, config1, 0, 31);
>   SMMU_PMU_EVENT_ATTR_EXTRACTOR(filter_span, config1, 32, 32);
>   SMMU_PMU_EVENT_ATTR_EXTRACTOR(filter_enable, config1, 33, 33);
>   
> -static inline void smmu_pmu_enable(struct pmu *pmu)
> +static inline void __smmu_pmu_enable(struct smmu_pmu *smmu_pmu)
>   {
> -	struct smmu_pmu *smmu_pmu = to_smmu_pmu(pmu);
> -
>   	writel(SMMU_PMCG_IRQ_CTRL_IRQEN,
>   	       smmu_pmu->reg_base + SMMU_PMCG_IRQ_CTRL);
>   	writel(SMMU_PMCG_CR_ENABLE, smmu_pmu->reg_base + SMMU_PMCG_CR);
>   }
>   
> +/*
> + * perf keeps calling ->pmu_enable()/->pmu_disable() for a PMU in a CPU context
> + * after its last event there is gone, and a shared or late interrupt can call
> + * the IRQ handler. Without counters in use, no event holds a runtime PM
> + * reference and the PMCG may be powered off, so its registers must not be
> + * touched. used_counters only changes in ->add()/->del() on the event's CPU.
> + */
> +static inline bool smmu_pmu_in_use(struct smmu_pmu *smmu_pmu)
> +{
> +	return !bitmap_empty(smmu_pmu->used_counters, smmu_pmu->num_counters);

This may as well just use SMMU_PMCG_MAX_COUNTERS, so that it can 
optimise to the trivial constant case. We know we're not going to mark 
any counters as used which we don't even have in the first place.

> +}
> +
> +static inline void smmu_pmu_enable(struct pmu *pmu)
> +{
> +	struct smmu_pmu *smmu_pmu = to_smmu_pmu(pmu);
> +
> +	if (smmu_pmu_in_use(smmu_pmu))
> +		__smmu_pmu_enable(smmu_pmu);
> +}
> +
>   static int smmu_pmu_apply_event_filter(struct smmu_pmu *smmu_pmu,
>   				       struct perf_event *event, int idx);
>   
> @@ -174,12 +193,18 @@ static inline void smmu_pmu_enable_quirk_hip08_09(struct pmu *pmu)
>   	smmu_pmu_enable(pmu);
>   }
>   
> +static inline void __smmu_pmu_disable(struct smmu_pmu *smmu_pmu)
> +{
> +	writel(0, smmu_pmu->reg_base + SMMU_PMCG_CR);
> +	writel(0, smmu_pmu->reg_base + SMMU_PMCG_IRQ_CTRL);
> +}
> +
>   static inline void smmu_pmu_disable(struct pmu *pmu)
>   {
>   	struct smmu_pmu *smmu_pmu = to_smmu_pmu(pmu);
>   
> -	writel(0, smmu_pmu->reg_base + SMMU_PMCG_CR);
> -	writel(0, smmu_pmu->reg_base + SMMU_PMCG_IRQ_CTRL);
> +	if (smmu_pmu_in_use(smmu_pmu))
> +		__smmu_pmu_disable(smmu_pmu);

...however I can't help but be wary of this somehow getting out of sync 
such that we might end up scheduling in a group on an initially-empty 
PMU with CR_ENABLE still set and the events starting to count 
immediately. Maybe it does work out, but given how convoluted all the 
possible enable/disable paths in the perf core are already with 
potential nesting and elision, it seems far from straightforward to 
reason about :/

>   }
>   
>   static inline void smmu_pmu_disable_quirk_hip08_09(struct pmu *pmu)
> @@ -392,6 +417,14 @@ static bool smmu_pmu_events_compatible(struct perf_event *curr,
>    * the core perf events code.
>    */
>   
> +static void smmu_pmu_event_destroy(struct perf_event *event)
> +{
> +	struct smmu_pmu *smmu_pmu = to_smmu_pmu(event->pmu);
> +
> +	/* Only set when smmu_pmu_event_init() took a reference. */
> +	pm_runtime_put(smmu_pmu->dev);

In isolation, "Only set" appearing to somehow refer to either the 
pm_runtime_put() call or its argument makes this comment more confusing 
than helpful.

> +}
> +
>   static int smmu_pmu_event_init(struct perf_event *event)
>   {
>   	struct hw_perf_event *hwc = &event->hw;
> @@ -439,18 +472,26 @@ static int smmu_pmu_event_init(struct perf_event *event)
>   
>   	hwc->idx = -1;
>   
> -	if (event->group_leader == event)
> -		return 0;
> +	if (event->group_leader != event) {
> +		for_each_sibling_event(sibling, event->group_leader) {
> +			if (is_software_event(sibling))
> +				continue;
>   
> -	for_each_sibling_event(sibling, event->group_leader) {
> -		if (is_software_event(sibling))
> -			continue;
> +			if (!smmu_pmu_events_compatible(sibling, event))
> +				return -EINVAL;
>   
> -		if (!smmu_pmu_events_compatible(sibling, event))
> -			return -EINVAL;
> +			if (++group_num_events > smmu_pmu->num_counters)
> +				return -EINVAL;
> +		}
> +	}
>   
> -		if (++group_num_events > smmu_pmu->num_counters)
> -			return -EINVAL;
> +	/* The same condition smmu_pmu_probe() enables runtime PM on. */
> +	if (dev->pm_domain) {
> +		int ret = pm_runtime_resume_and_get(dev);
> +
> +		if (ret < 0)
> +			return ret;
> +		event->destroy = smmu_pmu_event_destroy;
>   	}
>   
>   	return 0;
> @@ -692,6 +733,9 @@ static irqreturn_t smmu_pmu_handle_irq(int irq_num, void *data)
>   	u64 ovsr;
>   	unsigned int idx;
>   
> +	if (!smmu_pmu_in_use(smmu_pmu))
> +		return IRQ_NONE;
> +
>   	ovsr = readq(smmu_pmu->reloc_base + SMMU_PMCG_OVSSET0);
>   	if (!ovsr)
>   		return IRQ_NONE;
> @@ -779,7 +823,7 @@ static void smmu_pmu_reset(struct smmu_pmu *smmu_pmu)
>   {
>   	u64 counter_present_mask = GENMASK_ULL(smmu_pmu->num_counters - 1, 0);
>   
> -	smmu_pmu_disable(&smmu_pmu->pmu);
> +	__smmu_pmu_disable(smmu_pmu);
>   
>   	/* Disable counter and interrupt */
>   	writeq_relaxed(counter_present_mask,
> @@ -910,10 +954,21 @@ static int smmu_pmu_probe(struct platform_device *pdev)
>   
>   	smmu_pmu_reset(smmu_pmu);
>   
> +	/*
> +	 * Runtime PM must be enabled before the IRQ handler and the PMU go
> +	 * live: from then on ->event_init() takes a reference for each event.
> +	 * Hold one until probe is done.
> +	 */
> +	if (dev->pm_domain) {
> +		pm_runtime_get_noresume(dev);
> +		pm_runtime_set_active(dev);
> +		pm_runtime_enable(dev);
> +	}
> +
>   	err = smmu_pmu_setup_irq(smmu_pmu);
>   	if (err) {
>   		dev_err(dev, "Setup irq failed, PMU @%pa\n", &res_0->start);
> -		return err;
> +		goto out_rpm;
>   	}
>   
>   	smmu_pmu_get_iidr(smmu_pmu);
> @@ -922,7 +977,8 @@ static int smmu_pmu_probe(struct platform_device *pdev)
>   			      (res_0->start) >> SMMU_PMCG_PA_SHIFT);
>   	if (!name) {
>   		dev_err(dev, "Create name failed, PMU @%pa\n", &res_0->start);
> -		return -EINVAL;
> +		err = -EINVAL;
> +		goto out_rpm;
>   	}
>   
>   	if (!dev->of_node)
> @@ -947,7 +1003,7 @@ static int smmu_pmu_probe(struct platform_device *pdev)
>   	if (err) {
>   		dev_err(dev, "Error %d registering hotplug, PMU @%pa\n",
>   			err, &res_0->start);
> -		return err;
> +		goto out_rpm;
>   	}
>   
>   	err = perf_pmu_register(&smmu_pmu->pmu, name, -1);
> @@ -962,10 +1018,19 @@ static int smmu_pmu_probe(struct platform_device *pdev)
>   		 smmu_pmu->global_filter ? "Global(Counter0)" :
>   		 "Individual");
>   
> +	if (dev->pm_domain)
> +		pm_runtime_put_sync(dev);
> +
>   	return 0;
>   
>   out_unregister:
>   	cpuhp_state_remove_instance_nocalls(cpuhp_state_num, &smmu_pmu->node);
> +out_rpm:
> +	if (dev->pm_domain) {
> +		pm_runtime_disable(dev);
> +		pm_runtime_set_suspended(dev);
> +		pm_runtime_put_noidle(dev);
> +	}

Can we not just use the devm_ variants for auto-cleanup?

>   	return err;
>   }
>   
> @@ -975,15 +1040,45 @@ static void smmu_pmu_remove(struct platform_device *pdev)
>   
>   	perf_pmu_unregister(&smmu_pmu->pmu);
>   	cpuhp_state_remove_instance_nocalls(cpuhp_state_num, &smmu_pmu->node);
> +	if (pdev->dev.pm_domain)
> +		pm_runtime_disable(&pdev->dev);

...especially since probe failure vs. driver unbind should not be 
leaving things in different states, surely?

>   }
>   
>   static void smmu_pmu_shutdown(struct platform_device *pdev)
>   {
>   	struct smmu_pmu *smmu_pmu = platform_get_drvdata(pdev);
>   
> -	smmu_pmu_disable(&smmu_pmu->pmu);
> +	if (pdev->dev.pm_domain) {
> +		if (pm_runtime_get_if_active(&pdev->dev) <= 0)
> +			return;
> +		__smmu_pmu_disable(smmu_pmu);
> +		pm_runtime_put(&pdev->dev);
> +		return;
> +	}
> +
> +	__smmu_pmu_disable(smmu_pmu);
> +}

TBH I'm not sure why there's a shutdown routine here at all - the entire 
kernel state is about to stop existing, so we really shouldn't need to 
waste yet more time faffing with RPM accounting. I'd be inclined to just 
drop the whole thing, to be consistent with pretty much every other PMU 
driver. Yes, perf core doesn't deschedule events on shutdown either, so 
at worst after a warm reboot we might find pending overflows, but driver 
probes should be robust and not make assumptions about the initial state 
of the hardware anyway (as indeed this one appears to be.)

> +
> +static int smmu_pmu_runtime_suspend(struct device *dev)
> +{
> +	struct smmu_pmu *smmu_pmu = dev_get_drvdata(dev);
> +
> +	__smmu_pmu_disable(smmu_pmu);

Similarly, this seems entirely unnecessary - if we can only get here 
when no events are open, there already cannot be anything worth 
disabling (i.e. no running counters able to generate unexpected IRQs if 
the hardware doesn't actually lose state while logically suspended.)

> +	return 0;
>   }
>   
> +static int smmu_pmu_runtime_resume(struct device *dev)
> +{
> +	struct smmu_pmu *smmu_pmu = dev_get_drvdata(dev);
> +
> +	smmu_pmu_reset(smmu_pmu);
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops smmu_pmu_pm_ops = {
> +	RUNTIME_PM_OPS(smmu_pmu_runtime_suspend, smmu_pmu_runtime_resume, NULL)
> +};

Consider DEFINE_SIMPLE_DEV_PM_OPS() for even more brevity.

Thanks,
Robin.

> +
>   #ifdef CONFIG_OF
>   static const struct of_device_id smmu_pmu_of_match[] = {
>   	{ .compatible = "arm,smmu-v3-pmcg" },
> @@ -996,6 +1091,7 @@ static struct platform_driver smmu_pmu_driver = {
>   	.driver = {
>   		.name = "arm-smmu-v3-pmcg",
>   		.of_match_table = of_match_ptr(smmu_pmu_of_match),
> +		.pm = pm_ptr(&smmu_pmu_pm_ops),
>   		.suppress_bind_attrs = true,
>   	},
>   	.probe = smmu_pmu_probe,


