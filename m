Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D225606A326
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 17:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sajNU4cs;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=kqmy5gpm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=+PbzB0xCkTWEycEy8rkSNwKqkAxrWhfHDIvHL929Xx8=; b=sajNU4cslZGSMH
	iNLJYH1+ra+IPjuWE+KkWGwnvSJDwqOzN9YZq5JsbBMPdfzk06rCXVda8zOus6sxG2HS2zQMv1Uug
	2A5KZFaT1UDrSN+QhGDmG5wFBq0koaVpDMmjAT21HT6RQ3d45kXZ7LBh1CfIVv/c2zjh77eSO1M8E
	/hZDGBc7mtXwyc2R1R1eeZ2ja3cPzYkZK/HCLOFgic50R1XqvgP7qeMFbCe3sbYkdYAsd5ZjJmL7n
	5wuC36+6nWm31BXGdZ1rRSFp0jp6KQLMNrit9PLQNIHdu972CJPvE5tV34jybLdRzQ/W5NLOTW/tT
	iTgbeu6heeSf8E4pnXxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVu5D-00000007JCV-0mKA;
	Tue, 24 Nov 2026 17:13:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVu5A-00000007JBj-0MJn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 17:13:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D71F21C25;
	Tue, 24 Nov 2026 09:13:23 -0800 (PST)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AA9603F763;
	Tue, 24 Nov 2026 09:13:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795540406; bh=mQvvQlu+WKj7+RLxU16Cz7BdMtaylQyW0xRrOxnSqAo=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=kqmy5gpmI6ohqVy2e0XAnM+InGNAlHisEecFf7n60v5NMGGJM2Zm3otoF0SjFt/v6
	 +nlBe05Je/8VcpKLAZ2ITJtIyWbGKdeR4PeWH9dasOV7eYISVV5mzB9+F960+fCvR1
	 hfnA3S+qv/Les4J2Y/aqUBUru7rw7xmTcOV9zdT4=
Message-ID: <0db7751a-5189-4cc1-8865-cd184dbc5a32@arm.com>
Date: Tue, 24 Nov 2026 17:13:24 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] arm_mpam: Save and restore the MSC state across
 system sleep
To: Jinjie Ruan <ruanjinjie@huawei.com>, james.morse@arm.com,
 reinette.chatre@intel.com, fenghuay@nvidia.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261124082708.1705024-1-ruanjinjie@huawei.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20261124082708.1705024-1-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_091328_218066_E0987B0F 
X-CRM114-Status: GOOD (  31.76  )
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

Hi Jinjie,

Thanks for the patch and looking into this.

On 24/11/2026 08:27, Jinjie Ruan wrote:
> The MPAM driver reprograms an MSC's configuration when the first CPU
> that can access it comes online, and resets it, saving the bandwidth
> monitor state, when the last one goes offline.
> 
> The CPU that suspends the system stays online, so the MSCs it can
> access, such as the L3 and memory side MSCs, are never seen going
> offline by these cpuhp callbacks. An MSC can still lose its registers
> while the system sleeps, for example when its power domain is not
> retained across suspend-to-RAM. resctrl then reports the cached
> configuration while the hardware is back at its defaults, and the
> bandwidth monitor counters restart from zero, losing the traffic
> counted before the sleep.
> 
> Save the state from the driver's system sleep callback, which runs
> while the MSC is still accessible, and reprogram it from the matching
> resume callback. The cpuhp callbacks then leave the MSC alone: a second
> save when its last CPU goes offline would find the monitors already
> disabled by the first save, and lose the monitor configuration from
> the saved state.
> 
> Cc: James Morse <james.morse@arm.com>
> Cc: Ben Horgan <ben.horgan@arm.com>
> Cc: Reinette Chatre <reinette.chatre@intel.com>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  drivers/resctrl/mpam_devices.c  | 101 ++++++++++++++++++++++++--------
>  drivers/resctrl/mpam_internal.h |   1 +
>  2 files changed, 78 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index c067b6d57d71..49ace93280a7 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -23,6 +23,7 @@
>  #include <linux/mailbox_client.h>
>  #include <linux/mutex.h>
>  #include <linux/platform_device.h>
> +#include <linux/pm.h>
>  #include <linux/printk.h>
>  #include <linux/property.h>
>  #include <linux/srcu.h>
> @@ -2223,6 +2224,37 @@ static void _enable_percpu_irq(void *_irq)
>  	enable_percpu_irq(*irq, IRQ_TYPE_NONE);
>  }
>  
> +static void mpam_msc_power_on(struct mpam_msc *msc)
> +{
> +	mutex_lock(&msc->error_irq_lock);
> +	if (msc->error_irq_hw_enabled)
> +		mpam_touch_msc(msc, mpam_enable_msc_ecr, msc);
> +	mutex_unlock(&msc->error_irq_lock);
> +
> +	mpam_reprogram_msc(msc);
> +}
> +
> +static void mpam_msc_power_off(struct mpam_msc *msc)
> +{
> +	struct mpam_msc_ris *ris;
> +
> +	mutex_lock(&msc->cfg_lock);
> +	list_for_each_entry_srcu(ris, &msc->ris, msc_list,
> +				 srcu_read_lock_held(&mpam_srcu)) {
> +		mpam_touch_msc(msc, &mpam_reset_ris, ris);
> +
> +		/*
> +		 * The reset state for non-zero partid may be
> +		 * lost while the CPUs are offline.
> +		 */
> +		ris->in_reset_state = false;
> +
> +		if (mpam_is_enabled())
> +			mpam_touch_msc(msc, &mpam_save_mbwu_state, ris);
> +	}
> +	mutex_unlock(&msc->cfg_lock);
> +}
> +
>  static int mpam_cpu_online(unsigned int cpu)
>  {
>  	struct mpam_msc *msc;
> @@ -2236,14 +2268,8 @@ static int mpam_cpu_online(unsigned int cpu)
>  		if (msc->reenable_error_ppi)
>  			_enable_percpu_irq(&msc->reenable_error_ppi);
>  
> -		if (atomic_fetch_inc(&msc->online_refs) == 0) {
> -			mutex_lock(&msc->error_irq_lock);
> -			if (msc->error_irq_hw_enabled)
> -				mpam_touch_msc(msc, mpam_enable_msc_ecr, msc);
> -			mutex_unlock(&msc->error_irq_lock);
> -
> -			mpam_reprogram_msc(msc);
> -		}
> +		if (atomic_fetch_inc(&msc->online_refs) == 0 && !msc->pm_suspended)
> +			mpam_msc_power_on(msc);
>  	}
>  
>  	if (mpam_resctrl_enabled)
> @@ -2304,30 +2330,56 @@ static int mpam_cpu_offline(unsigned int cpu)
>  		if (msc->reenable_error_ppi)
>  			disable_percpu_irq(msc->reenable_error_ppi);
>  
> -		if (atomic_dec_and_test(&msc->online_refs)) {
> -			struct mpam_msc_ris *ris;
> +		if (atomic_dec_and_test(&msc->online_refs) && !msc->pm_suspended)
> +			mpam_msc_power_off(msc);
> +	}
>  
> -			mutex_lock(&msc->cfg_lock);
> -			list_for_each_entry_srcu(ris, &msc->ris, msc_list,
> -						 srcu_read_lock_held(&mpam_srcu)) {
> -				mpam_touch_msc(msc, &mpam_reset_ris, ris);
> +	return 0;
> +}
>  
> -				/*
> -				 * The reset state for non-zero partid may be
> -				 * lost while the CPUs are offline.
> -				 */
> -				ris->in_reset_state = false;
> +static int mpam_msc_suspend(struct device *dev)
> +{
> +	struct mpam_msc *msc = dev_get_drvdata(dev);
>  
> -				if (mpam_is_enabled())
> -					mpam_touch_msc(msc, &mpam_save_mbwu_state, ris);
> -			}
> -			mutex_unlock(&msc->cfg_lock);
> -		}
> +	if (!msc)
> +		return 0;
> +
> +	guard(mutex)(&mpam_cpuhp_state_lock);
> +	if (!mpam_is_enabled())
> +		return 0;
> +
> +	guard(cpus_read_lock)();
> +	guard(srcu)(&mpam_srcu);
> +	if (atomic_read(&msc->online_refs)) {
> +		mpam_msc_power_off(msc);
> +		msc->pm_suspended = true;
>  	}
>  
>  	return 0;
>  }
>  
> +static int mpam_msc_resume(struct device *dev)
> +{
> +	struct mpam_msc *msc = dev_get_drvdata(dev);
> +
> +	if (!msc)
> +		return 0;
> +
> +	guard(mutex)(&mpam_cpuhp_state_lock);
> +	if (!mpam_is_enabled() || !msc->pm_suspended)
> +		return 0;
> +
> +	guard(cpus_read_lock)();
> +	guard(srcu)(&mpam_srcu);
> +	msc->pm_suspended = false;
> +	if (atomic_read(&msc->online_refs))
> +		mpam_msc_power_on(msc);
> +
> +	return 0;
> +}
> +
> +static DEFINE_SIMPLE_DEV_PM_OPS(mpam_msc_pm_ops, mpam_msc_suspend, mpam_msc_resume);

If I understand correctly this covers both system system and hibernate but the commit message just
mentions system suspend. Is that the case?

Thanks,

Ben

> +
>  static void mpam_register_cpuhp_callbacks(int (*online)(unsigned int online),
>  					  int (*offline)(unsigned int offline),
>  					  char *name)
> @@ -2578,6 +2630,7 @@ static struct platform_driver mpam_msc_driver = {
>  	.driver = {
>  		.name = "mpam_msc",
>  		.suppress_bind_attrs = true,
> +		.pm = pm_sleep_ptr(&mpam_msc_pm_ops),
>  	},
>  	.probe = mpam_msc_drv_probe,
>  	.remove = mpam_msc_drv_remove,
> diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
> index 1f86cc158100..2e6da63c61c6 100644
> --- a/drivers/resctrl/mpam_internal.h
> +++ b/drivers/resctrl/mpam_internal.h
> @@ -86,6 +86,7 @@ struct mpam_msc {
>  	struct mpam_msc * __percpu	*error_dev_id;
>  
>  	atomic_t		online_refs;
> +	bool			pm_suspended;
>  
>  	/*
>  	 * probe_lock is only taken during discovery. After discovery these


