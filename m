Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6345A606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 22:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pbpT1Xda;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UcsgqfMv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=e2NL43u+2YfXFaE0ljD3Rd6MzpHrPYH8D7UaHAQ7IMM=; b=pbpT1Xda3xsPskNt6sh4nzlVSo
	YtoBFY6uT0WLyahs+1RPi6F9jmuNDjsuuS+rn7jEjtoZxkbl25rW3dHy5wUkG4ywfCNopW9UWXipi
	Q3hVFkeMBCOek52czgpnrGO+C0UeKQcWEvFE3BJtAJIPiHeBpOJGRXqqUaSMoxDn/Y0URdI6iBX99
	RNBf+sZicts59UPzerh2w3JDsqSQ4ZFCltiYb5spRRACeMVSS8e8/YIkUs7H3CJT3ZZsFKtZGKvHt
	rxCg9CjK+/wH1c5PCefJmAUTTjdl0tXSG2TWzSyqJPgw5s1bsX1GkgAfWkbjUdLHB6KvzUwxe9WUx
	+NBcHKBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSj3v-00000000h2B-0KbE;
	Sun, 15 Nov 2026 22:51:03 +0000
Received: from mail-dy1-x132d.google.com ([2607:f8b0:4864:20::132d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSj3s-00000000h1S-1R8A
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 22:51:01 +0000
Received: by mail-dy1-x132d.google.com with SMTP id 5a478bee46e88-37f14feca60so527363eec.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 14:51:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794783059; x=1795387859; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e2NL43u+2YfXFaE0ljD3Rd6MzpHrPYH8D7UaHAQ7IMM=;
        b=UcsgqfMvjXRm2CrGfZ4ztgW6U/VuVPGBUEGHPnGzhRCX1b77/G31eJiK7KEWl/9pK6
         JYQiHseLW5PDkv/zv2MqaEHy2iS120EzGhZ4g2dAwYQdko/X4PfJSO1nW/JUAEy9QmxT
         xFiEowotLfFNPaLc4l7Ox6M3tTj3Db0GiWWI93RBP8QefDFs47+eVmFrX40WwaK8NgoR
         7G1xIiJV8zxCVIYr9sX3SO1lhXrhw313CRySji9tzKy/koVvxRjgMRRb/fR/YVVpclxS
         3F9K4RVZPmR9BxPDqctZaXr0Xo4IxXOFUJiFUEZfnxLLGZGdFY+7WeVSI77uVUSewg2e
         YIIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794783059; x=1795387859;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e2NL43u+2YfXFaE0ljD3Rd6MzpHrPYH8D7UaHAQ7IMM=;
        b=DhtNlzWotlyl8VlkO9/7A7NhpbSnW3gqaebYHVThguw+u/hsf0/Mj88EZpQa5f+OI0
         sHuk3nC1gFy5ByMXUto3polngIHCYPKAl9RnFclPT6aDZxwRaok1Zw6n8C+gG7FlXMYG
         6wAUjG+mseVmC+Eq02sy2/4hl3J43PyjJ/ofwAXFeKWDcCwMPxl0IXXOdj1eokEj+L4D
         ExciEhqtRNHvugDDlqYyuqfGDVizrj3JSbtmI0I7ZMOrBnUoCZ7fZ2hwEuTfutSVR5Ys
         YtjMOXdtJDdI6pETq6y5C3sN5jndVvUUbKqOFwqzeEarGmkcjgw+XbAFn7l/jdn+G3lW
         ip2w==
X-Forwarded-Encrypted: i=1; AL+hErEUTYkDw0jLSNJhZPZHcVjX/YrydJvwFA5GCt95mqflwfyHqmO1aRMg+QLeehqRAXZwE5Nw+5GqUzxWk8i0e11Q@lists.infradead.org
X-Gm-Message-State: APuU4Z+EldhR1P1oB6qO7UffD9N4UKpfjGX05LQr9Jja8P/TGlqXCTSY
	HbKeQktf0XyZ+jhwdiEV8u0aadN/3tE+Gj9fuQ+rFQZxUUl7XuLwcN7e
X-Gm-Gg: AYBFou0oHUqlmX4lDt3AEoebBb06Wq5ldsqV4Iq7x6oZkQNspP+b2rEfJW4LOM4xF6u
	H9yl6m5bcXyRn/4mjBsMpOYtSh+4CmGulKIbASeGGTo+dpVEatD+AR6u9TjfXlHVDJQpPh6xx3t
	lPvAWDzUdnw8e22gRy5T8GJ3LAld7xJXEr3OGYpqU3ul1bafLnw0EOs/xPk0GfLDCpoWJlEifJN
	9VhUijHaiy8n7uTGt+Cd4sH67M7thr5k7c369xMWhvAN+Myre6sdyK8oYkRkXbvjysdV2vjNpS+
	9aRgfnc3RyGqyhapr9B3IhQmoqyalQsFhCcCvH3cNFJSKlpmF3eMfXdRIC3oq+86BkVujV7ZqYX
	6TOEIh0rSIgGqD37XxhxCAVhVQnkdI6RsaZs6zoNftfQM6jm6lVyweyAM4ZLVtJ7MS0OmHQ3WZv
	5jGjmKhdVvW2xJ2wj0oFY50HgzosSSmes6rHkBs6ce8XwAc71cmuunxeqt9KvTfSQJgMFtpJYb4
	cMhzGfJGsrovBpUNO0RoMGB9F5YKHnfw+XX6a+aCLR6cOm+aXYJkk711Xu6sr038NHpW0gu5tns
	WxWJ127wC2F+fpOHS6BMo7rpjl6Mu0Mw2lAoH3uNDiJLDCTDEhRCqjAaOk+RoiYfgz0k
X-Received: by 2002:a05:693c:894f:20b0:36d:5102:9974 with SMTP id 5a478bee46e88-379636607famr8547200eec.2.1794783059212;
        Sun, 15 Nov 2026 14:50:59 -0800 (PST)
Received: from [192.168.35.214] ([218.50.238.131])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379569b8389sm46704105eec.25.2026.11.15.14.50.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 14:50:58 -0800 (PST)
Message-ID: <1e3c14c2-4ad8-479d-a896-952fdfeac708@gmail.com>
Date: Mon, 16 Nov 2026 07:50:55 +0900
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] devfreq: Refcount governor modules while in use
Content-Language: ko
To: Jie Zhan <zhanjie9@hisilicon.com>, cw00.choi@samsung.com,
 myungjoo.ham@samsung.com, kyungmin.park@samsung.com,
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: linuxarm@huawei.com, tianyaxiong@kylinos.cn, zhenglifeng1@huawei.com,
 zhangpengjie2@huawei.com, lihuisong@huawei.com, prime.zeng@hisilicon.com
References: <20260729102348.3857779-1-zhanjie9@hisilicon.com>
 <20260729102348.3857779-5-zhanjie9@hisilicon.com>
From: Chanwoo Choi <cwchoi00@gmail.com>
In-Reply-To: <20260729102348.3857779-5-zhanjie9@hisilicon.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_145100_414875_F78535E1 
X-CRM114-Status: GOOD (  33.27  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: chanwoo@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 7/29/2026 7:23 PM, Jie Zhan wrote:
> A governor module can be inserted or removed dynamically when built as a
> kernel module.  'devfreq->governor' would become NULL if the governor
> module is removed when it's in use.
> 
> Add a refcount mechanism for governor modules to prevent the governor
> module from being removed (except for force unload):
> 1. Add an optional 'owner' member to struct devfreq_governor so the devfreq
>    core can identify the module that holds the governor code.
> 2. Get and put a refcount of the governor module when starting and stopping
>    the governor.
> 
> The new 'owner' field is optional:
> - Common governor modules (performance, powersave, simple_ondemand,
>   userspace, passive) set 'owner' to THIS_MODULE.
> - Governors that are bundled into a device driver module must leave 'owner'
>   NULL.  The device's lifetime already pins that module, and setting
>   'owner' would create a self-reference that blocks the driver from being
>   unloaded.
> 
> As a result, a non-forced rmmod of an in-use stand-alone governor now
> fails with -EBUSY, e.g.:
> 
>   $ cat governor
>   performance
>   $ rmmod governor_performance
>   rmmod: ERROR: Module governor_performance is in use
> 
> Force unloads (rmmod -f, if configured) can't be blocked.
> 
> Signed-off-by: Jie Zhan <zhanjie9@hisilicon.com>
> ---
>  drivers/devfreq/devfreq.c                 | 17 ++++++++++++++++-
>  drivers/devfreq/governor_passive.c        |  1 +
>  drivers/devfreq/governor_performance.c    |  1 +
>  drivers/devfreq/governor_powersave.c      |  1 +
>  drivers/devfreq/governor_simpleondemand.c |  1 +
>  drivers/devfreq/governor_userspace.c      |  1 +
>  include/linux/devfreq-governor.h          | 11 +++++++++++
>  7 files changed, 32 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/devfreq/devfreq.c b/drivers/devfreq/devfreq.c
> index 959f0b08ed36..4a01dad21c16 100644
> --- a/drivers/devfreq/devfreq.c
> +++ b/drivers/devfreq/devfreq.c
> @@ -345,24 +345,37 @@ static int devfreq_set_governor(struct devfreq *df,
>  				 __func__, df->governor->name, ret);
>  			return ret;
>  		}
> +		module_put(old_gov->owner);
>  	}
>  
>  	/* Start the new governor */
> +	if (!try_module_get(new_gov->owner)) {
> +		df->governor = NULL;
> +		return -EINVAL;
> +	}
> +
>  	df->governor = new_gov;
>  	ret = df->governor->event_handler(df, DEVFREQ_GOV_START, NULL);
>  	if (ret) {
>  		dev_warn(dev, "%s: Governor %s not started(%d)\n",
>  			 __func__, df->governor->name, ret);
> +		module_put(new_gov->owner);
>  
>  		/* Restore previous governor */
>  		df->governor = old_gov;
>  		if (!df->governor)
>  			return ret;
>  
> +		if (!try_module_get(old_gov->owner)) {
> +			df->governor = NULL;
> +			return -EINVAL;
> +		}
> +
>  		ret = df->governor->event_handler(df, DEVFREQ_GOV_START, NULL);
>  		if (ret) {
>  			dev_err(dev, "%s: restore Governor %s failed (%d)\n",
>  				__func__, df->governor->name, ret);
> +			module_put(old_gov->owner);
>  			df->governor = NULL;
>  			return ret;
>  		}
> @@ -1051,9 +1064,11 @@ int devfreq_remove_device(struct devfreq *devfreq)
>  
>  	devfreq_cooling_unregister(devfreq->cdev);
>  
> -	if (devfreq->governor)
> +	if (devfreq->governor) {
>  		devfreq->governor->event_handler(devfreq,
>  						 DEVFREQ_GOV_STOP, NULL);
> +		module_put(devfreq->governor->owner);
> +	}
>  	device_unregister(&devfreq->dev);
>  
>  	return 0;
> diff --git a/drivers/devfreq/governor_passive.c b/drivers/devfreq/governor_passive.c
> index d7feecd900f1..3e63dd200a04 100644
> --- a/drivers/devfreq/governor_passive.c
> +++ b/drivers/devfreq/governor_passive.c
> @@ -449,6 +449,7 @@ static int devfreq_passive_event_handler(struct devfreq *devfreq,
>  static struct devfreq_governor devfreq_passive = {
>  	.name = DEVFREQ_GOV_PASSIVE,
>  	.flags = DEVFREQ_GOV_FLAG_IMMUTABLE,
> +	.owner = THIS_MODULE,
>  	.get_target_freq = devfreq_passive_get_target_freq,
>  	.event_handler = devfreq_passive_event_handler,
>  };
> diff --git a/drivers/devfreq/governor_performance.c b/drivers/devfreq/governor_performance.c
> index fdb22bf512cf..0a08b067ea6b 100644
> --- a/drivers/devfreq/governor_performance.c
> +++ b/drivers/devfreq/governor_performance.c
> @@ -37,6 +37,7 @@ static int devfreq_performance_handler(struct devfreq *devfreq,
>  
>  static struct devfreq_governor devfreq_performance = {
>  	.name = DEVFREQ_GOV_PERFORMANCE,
> +	.owner = THIS_MODULE,
>  	.get_target_freq = devfreq_performance_func,
>  	.event_handler = devfreq_performance_handler,
>  };
> diff --git a/drivers/devfreq/governor_powersave.c b/drivers/devfreq/governor_powersave.c
> index ee2d6ec8a512..3ae296d55e3e 100644
> --- a/drivers/devfreq/governor_powersave.c
> +++ b/drivers/devfreq/governor_powersave.c
> @@ -37,6 +37,7 @@ static int devfreq_powersave_handler(struct devfreq *devfreq,
>  
>  static struct devfreq_governor devfreq_powersave = {
>  	.name = DEVFREQ_GOV_POWERSAVE,
> +	.owner = THIS_MODULE,
>  	.get_target_freq = devfreq_powersave_func,
>  	.event_handler = devfreq_powersave_handler,
>  };
> diff --git a/drivers/devfreq/governor_simpleondemand.c b/drivers/devfreq/governor_simpleondemand.c
> index ac9c5e9e51a4..46287b279ded 100644
> --- a/drivers/devfreq/governor_simpleondemand.c
> +++ b/drivers/devfreq/governor_simpleondemand.c
> @@ -119,6 +119,7 @@ static struct devfreq_governor devfreq_simple_ondemand = {
>  	.name = DEVFREQ_GOV_SIMPLE_ONDEMAND,
>  	.attrs = DEVFREQ_GOV_ATTR_POLLING_INTERVAL
>  		| DEVFREQ_GOV_ATTR_TIMER,
> +	.owner = THIS_MODULE,
>  	.get_target_freq = devfreq_simple_ondemand_func,
>  	.event_handler = devfreq_simple_ondemand_handler,
>  };
> diff --git a/drivers/devfreq/governor_userspace.c b/drivers/devfreq/governor_userspace.c
> index 3906ebedbae8..b1acccc79f7f 100644
> --- a/drivers/devfreq/governor_userspace.c
> +++ b/drivers/devfreq/governor_userspace.c
> @@ -135,6 +135,7 @@ static int devfreq_userspace_handler(struct devfreq *devfreq,
>  
>  static struct devfreq_governor devfreq_userspace = {
>  	.name = DEVFREQ_GOV_USERSPACE,
> +	.owner = THIS_MODULE,
>  	.get_target_freq = devfreq_userspace_func,
>  	.event_handler = devfreq_userspace_handler,
>  };
> diff --git a/include/linux/devfreq-governor.h b/include/linux/devfreq-governor.h
> index dfdd0160a29f..ae1721e58401 100644
> --- a/include/linux/devfreq-governor.h
> +++ b/include/linux/devfreq-governor.h
> @@ -12,6 +12,7 @@
>  #define __LINUX_DEVFREQ_DEVFREQ_H__
>  
>  #include <linux/devfreq.h>
> +struct module;
>  
>  #define DEVFREQ_NAME_LEN			16
>  
> @@ -53,6 +54,15 @@
>   * @name:		Governor's name
>   * @attrs:		Governor's sysfs attribute flags
>   * @flags:		Governor's feature flags
> + * @owner:		Optional, module that owns this governor.
> + *			When set (typically to THIS_MODULE), the devfreq core
> + *			takes a reference on @owner while this governor is in
> + *			use so that the governor module cannot be removed,
> + *			except by a forced unload. Governors that are bundled
> + *			into a device driver module must leave @owner NULL: the
> + *			device's lifetime already pins that module, and setting
> + *			@owner would create a self-reference that prevents the
> + *			driver from being unloaded.
>   * @get_target_freq:	Returns desired operating frequency for the device.
>   *			Basically, get_target_freq will run
>   *			devfreq_dev_profile.get_dev_status() to get the
> @@ -70,6 +80,7 @@ struct devfreq_governor {
>  	const char name[DEVFREQ_NAME_LEN];
>  	const u64 attrs;
>  	const u64 flags;
> +	struct module *owner;
>  	int (*get_target_freq)(struct devfreq *this, unsigned long *freq);
>  	int (*event_handler)(struct devfreq *devfreq,
>  				unsigned int event, void *data);

I agree this suggestion. But this patch is based on patch1/2/3.
After resolving the patch1,2,3, we better to review this patch.

-- 
Best Regards,
Chanwoo Choi
Principal Engineer, Samsung Electronics

