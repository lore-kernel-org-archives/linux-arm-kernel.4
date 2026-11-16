Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4284606A331
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 13:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bZyLjcH8;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wL2wlaCc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=HHhT6Qo81+qqfHiAP1aXCUEzb0E+3rfD32/ByjPjT00=; b=bZyLjcH8n/jeKFn0jpgkhsT3Mr
	ePil5Vp1CV9oIE2+ePQDWIFZri3WGRa8bkdGJ78xMahLg9RXB/5dJcgViJOE329b3RXUpThsKkbx0
	EGWw7dgnIsEOnmIxut20qhTEYpjftj3EqRGVaOXQT6/UgoKWjbd8Xz8+anbpxjvhFnlYVJxSxV9NA
	hEc6+QuK9lr9NHB5rkPrNU1WyUSMoajdyFfyV5KYic2q2RoZZhBCTjYmV+uT4ULVAcswrcaRBxmXn
	k4WxZkAeXRYOcWtXfbumTvebAZGYoGRDpJbrRDk/I2lBI0YN9V5tPx6cIrWXuzPu2/wHsxHYwzjtg
	veZ/UBIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSx1c-00000002gZ3-2nNK;
	Mon, 16 Nov 2026 13:45:36 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSx1a-00000002gXO-0OFt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 13:45:35 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2e9ae391a05so20354385ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 05:45:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794836733; x=1795441533; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HHhT6Qo81+qqfHiAP1aXCUEzb0E+3rfD32/ByjPjT00=;
        b=wL2wlaCcNs0PHqFAKcpN+m48yWHJTiucXNxW0KdQf20b4ym88/zqqwGJNp+7TsaDgM
         jrTAp9Y1TYbBNw5plaFQUftmco5KVoL7xAnGQWSfT8OB5VUXPbWNtBmX5hc3ssfVa6fH
         F/y8JuOemFlJMYOPegRgR9wGehOf4HIl8NfAZtp8lznhxOC1xFczxerMbuvXnFXDdnYp
         Y/VoBOKBBG1z5bFMXft0ETNMq2VyDJPfmno5inT/VMHjLQqnQMf1xWDjJXoVP/VjylL5
         KQwz+docIXHt+otQxBgIPkJZVBd5HcrFih96XrQ3D6xNYvh+qhGlwrPXRxhcWBt/4VW2
         dCyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794836733; x=1795441533;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HHhT6Qo81+qqfHiAP1aXCUEzb0E+3rfD32/ByjPjT00=;
        b=dqDUTpoyhKifKbkAeG0FWwt5uDYjVic/tU7C61R+w7IOlyx2QS7roywAahfMfKMX5R
         PVtTh5/Au0z+4u6+wH3Nbfmme+202OgLuCFVShtZ3GHlkbEWv0EvFpMWeFrT7eIFSK6I
         bxNfkrLMQcD8DpbaHbQT/Aa/g8i/CoZJmgAUQz5ZexRNgYgE/wXctze8Z/lqx9txZ4pL
         xCRz8q0fX5YEQKbZpK9K08TTMG8PtuvqLEZUTwUVypDfgdBvSPuV5yiV5rR9H7YWX0xH
         vG2Ur2UNs0g3RWYce5h5Yp3Mm9yrtUQLiXiB9lHEFylC8XR2+D5iIg06YoN3noFf52t6
         HjhA==
X-Forwarded-Encrypted: i=1; AL+hErHHzmkx834arhebJi2Lu2MZ0NMr3l+VrsQyjcsLP1h/E6O6IZaHu03bpREyEG5BE7lKFLZTzMg6ulz9D5jd186Q@lists.infradead.org
X-Gm-Message-State: APuU4Z/1k5mxLEcMvBS4hscRow9ocNMVxr/jqpwOUuX1OLI6pRQ+iyLw
	hJERlYr+UIiNQyN3njXbOA/DfmAOtz/AWpnyPQzQg3gDocdSYGw4EDtI
X-Gm-Gg: AZFdTZcLbnb7ePzAT2SiQU5UNq9luSmN0JfzeoF9c1WrfR6BKzhexylsTGWTjSkaLNj
	SeN7qGMyufAmh8+niXMQqqJp80qSwCSkSIw/dWjO+9+sTm+5EH9ENCAVEnc6DZINQqSNqRWr/nI
	VTRhEByOMSeuGZT3m5KThFfQT/Kz+KLsD7vlsROh1VtTOyW860bNZNV29egorcPloJK5AtQuOBC
	SYg38zGqeGRbam9hTjQkvk2osuKvI8RlbwuA6u2HaFhFNDPIzt8AeWcI1KHguwtIl0W4RSV6KvP
	7jnPAJb1yg8rg4Ia43oq6hU3Sm7ZXaGMMsVp1h0oXGHBQ3mIeKYwjgrMnoxsI1RcpUKMMhxnPXG
	FThODO2qIsLcxmRROP+pZpnTZN4u1MDeMRxD9FJfr8kQEMVh0qJUhOTYXF2vAp3FAHrBuMTKWrx
	NfjBlzCrrbDOZFQrQE+9LWui8zNV3d5v4g2InvhbMmkppXZ2pNOPhtvzJHxUmkpOVFl6cvOqU6i
	ffRZu1MRYG7MO/j5yPU5IpFDeI/xADH4QOF+RvlBPgin/GRpE3lmOsZC80Pl7UNB31TOF21aObc
	6zrLrgm3U4iBzyDJLoufSqaJUzIXoifc0tbCvZRXP0OeudsEOEB+E3oN+U03RzCmJyY=
X-Received: by 2002:a17:903:1c9:b0:2ed:238b:7db1 with SMTP id d9443c01a7336-2ee0dd2a2admr72241505ad.13.1794836732598;
        Mon, 16 Nov 2026 05:45:32 -0800 (PST)
Received: from [192.168.35.99] ([218.50.238.131])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f868203sm37637585ad.49.2026.11.16.05.45.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 05:45:32 -0800 (PST)
Message-ID: <9fbd4a2a-d28a-4dc0-a4e3-0e91e7c160f7@gmail.com>
Date: Mon, 16 Nov 2026 22:45:25 +0900
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v7 4/9] PM / devfreq: Add new target_freq attribute
 flag for governors
Content-Language: ko
To: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>,
 Sudeep Holla <sudeep.holla@kernel.org>,
 Cristian Marussi <cristian.marussi@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Dmitry Osipenko <digetx@gmail.com>,
 Thierry Reding <thierry.reding@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
 Pankaj Patil <pankaj.patil@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20260610-rfc_v7_scmi_memlat-v7-0-f3f68c608f25@oss.qualcomm.com>
 <20260610-rfc_v7_scmi_memlat-v7-4-f3f68c608f25@oss.qualcomm.com>
From: Chanwoo Choi <cwchoi00@gmail.com>
In-Reply-To: <20260610-rfc_v7_scmi_memlat-v7-4-f3f68c608f25@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_054534_425371_46B4DCEC 
X-CRM114-Status: GOOD (  28.98  )
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

On 6/10/2026 5:51 PM, Pragnesh Papaniya wrote:
> From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> 
> The target_freq sysfs attribute exposes a governor's predicted next
> target frequency. Not every devfreq governor has a meaningful value
> to report there; some merely observe an externally-driven device.
> 
> Add a DEVFREQ_GOV_ATTR_TARGET_FREQ attribute flag that governors with
> a meaningful target frequency must opt in to. Gate the existing
> target_freq sysfs read on the flag and return -EINVAL when the active
> governor does not advertise it.
> 
> Tag all in-tree governors that already populate previous_freq via
> get_target_freq() so visible behaviour stays unchanged for in-tree
> users. Out-of-tree governors that drive frequency updates and want
> to keep target_freq readable need to set the new flag.
> 
> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> Signed-off-by: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
> ---
>  Documentation/ABI/testing/sysfs-class-devfreq | 8 ++++++++
>  drivers/devfreq/devfreq.c                     | 6 ++++++
>  drivers/devfreq/governor_passive.c            | 1 +
>  drivers/devfreq/governor_performance.c        | 1 +
>  drivers/devfreq/governor_powersave.c          | 1 +
>  drivers/devfreq/governor_simpleondemand.c     | 1 +
>  drivers/devfreq/governor_userspace.c          | 1 +
>  drivers/devfreq/hisi_uncore_freq.c            | 1 +
>  drivers/devfreq/tegra30-devfreq.c             | 3 ++-
>  include/linux/devfreq-governor.h              | 3 +++
>  10 files changed, 25 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-class-devfreq b/Documentation/ABI/testing/sysfs-class-devfreq
> index df8ba88b9f6a..5be9940a5853 100644
> --- a/Documentation/ABI/testing/sysfs-class-devfreq
> +++ b/Documentation/ABI/testing/sysfs-class-devfreq
> @@ -37,6 +37,14 @@ Description:
>  		The /sys/class/devfreq/.../target_freq shows the next governor
>  		predicted target frequency of the corresponding devfreq object.
>  
> +		Reading this attribute returns -EINVAL when the active
> +		governor does not advertise DEVFREQ_GOV_ATTR_TARGET_FREQ.
> +		All in-tree governors that drive frequency transitions tag
> +		this attribute, so existing in-tree behaviour is unchanged.
> +		Out-of-tree governors that previously relied on the
> +		unconditional read of df->previous_freq must opt in by
> +		setting DEVFREQ_GOV_ATTR_TARGET_FREQ in their attrs field.
> +
>  What:		/sys/class/devfreq/.../trans_stat
>  Date:		October 2012
>  Contact:	MyungJoo Ham <myungjoo.ham@samsung.com>
> diff --git a/drivers/devfreq/devfreq.c b/drivers/devfreq/devfreq.c
> index f08fc6966eae..2f27a239e34a 100644
> --- a/drivers/devfreq/devfreq.c
> +++ b/drivers/devfreq/devfreq.c
> @@ -1530,6 +1530,12 @@ static ssize_t target_freq_show(struct device *dev,
>  {
>  	struct devfreq *df = to_devfreq(dev);
>  
> +	guard(mutex)(&devfreq_list_lock);
> +
> +	if (!df->profile || !df->governor ||
> +	    !IS_SUPPORTED_ATTR(df->governor->attrs, TARGET_FREQ))
> +		return -EINVAL;
> +
>  	return sprintf(buf, "%lu\n", df->previous_freq);
>  }
>  static DEVICE_ATTR_RO(target_freq);
> diff --git a/drivers/devfreq/governor_passive.c b/drivers/devfreq/governor_passive.c
> index d7feecd900f1..b75e4bbee4b1 100644
> --- a/drivers/devfreq/governor_passive.c
> +++ b/drivers/devfreq/governor_passive.c
> @@ -448,6 +448,7 @@ static int devfreq_passive_event_handler(struct devfreq *devfreq,
>  
>  static struct devfreq_governor devfreq_passive = {
>  	.name = DEVFREQ_GOV_PASSIVE,
> +	.attrs = DEVFREQ_GOV_ATTR_TARGET_FREQ,
>  	.flags = DEVFREQ_GOV_FLAG_IMMUTABLE,
>  	.get_target_freq = devfreq_passive_get_target_freq,
>  	.event_handler = devfreq_passive_event_handler,
> diff --git a/drivers/devfreq/governor_performance.c b/drivers/devfreq/governor_performance.c
> index fdb22bf512cf..b9ec587f582c 100644
> --- a/drivers/devfreq/governor_performance.c
> +++ b/drivers/devfreq/governor_performance.c
> @@ -37,6 +37,7 @@ static int devfreq_performance_handler(struct devfreq *devfreq,
>  
>  static struct devfreq_governor devfreq_performance = {
>  	.name = DEVFREQ_GOV_PERFORMANCE,
> +	.attrs = DEVFREQ_GOV_ATTR_TARGET_FREQ,
>  	.get_target_freq = devfreq_performance_func,
>  	.event_handler = devfreq_performance_handler,
>  };
> diff --git a/drivers/devfreq/governor_powersave.c b/drivers/devfreq/governor_powersave.c
> index ee2d6ec8a512..69eab1d0a7fc 100644
> --- a/drivers/devfreq/governor_powersave.c
> +++ b/drivers/devfreq/governor_powersave.c
> @@ -37,6 +37,7 @@ static int devfreq_powersave_handler(struct devfreq *devfreq,
>  
>  static struct devfreq_governor devfreq_powersave = {
>  	.name = DEVFREQ_GOV_POWERSAVE,
> +	.attrs = DEVFREQ_GOV_ATTR_TARGET_FREQ,
>  	.get_target_freq = devfreq_powersave_func,
>  	.event_handler = devfreq_powersave_handler,
>  };
> diff --git a/drivers/devfreq/governor_simpleondemand.c b/drivers/devfreq/governor_simpleondemand.c
> index ac9c5e9e51a4..65ff9d912ef9 100644
> --- a/drivers/devfreq/governor_simpleondemand.c
> +++ b/drivers/devfreq/governor_simpleondemand.c
> @@ -118,6 +118,7 @@ static int devfreq_simple_ondemand_handler(struct devfreq *devfreq,
>  static struct devfreq_governor devfreq_simple_ondemand = {
>  	.name = DEVFREQ_GOV_SIMPLE_ONDEMAND,
>  	.attrs = DEVFREQ_GOV_ATTR_POLLING_INTERVAL
> +		| DEVFREQ_GOV_ATTR_TARGET_FREQ
>  		| DEVFREQ_GOV_ATTR_TIMER,
>  	.get_target_freq = devfreq_simple_ondemand_func,
>  	.event_handler = devfreq_simple_ondemand_handler,
> diff --git a/drivers/devfreq/governor_userspace.c b/drivers/devfreq/governor_userspace.c
> index 3906ebedbae8..d1b765a7b8e5 100644
> --- a/drivers/devfreq/governor_userspace.c
> +++ b/drivers/devfreq/governor_userspace.c
> @@ -135,6 +135,7 @@ static int devfreq_userspace_handler(struct devfreq *devfreq,
>  
>  static struct devfreq_governor devfreq_userspace = {
>  	.name = DEVFREQ_GOV_USERSPACE,
> +	.attrs = DEVFREQ_GOV_ATTR_TARGET_FREQ,
>  	.get_target_freq = devfreq_userspace_func,
>  	.event_handler = devfreq_userspace_handler,
>  };
> diff --git a/drivers/devfreq/hisi_uncore_freq.c b/drivers/devfreq/hisi_uncore_freq.c
> index 4d00d813c8ac..0800116e3334 100644
> --- a/drivers/devfreq/hisi_uncore_freq.c
> +++ b/drivers/devfreq/hisi_uncore_freq.c
> @@ -399,6 +399,7 @@ static struct devfreq_governor hisi_platform_governor = {
>  	 * Set interrupt_driven to skip the devfreq monitor mechanism, though
>  	 * this governor is not interrupt-driven.
>  	 */
> +	.attrs = DEVFREQ_GOV_ATTR_TARGET_FREQ,
>  	.flags = DEVFREQ_GOV_FLAG_IRQ_DRIVEN,
>  	.get_target_freq = hisi_platform_gov_func,
>  	.event_handler = hisi_platform_gov_handler,
> diff --git a/drivers/devfreq/tegra30-devfreq.c b/drivers/devfreq/tegra30-devfreq.c
> index 401aac6a9f07..fcb278c4a74c 100644
> --- a/drivers/devfreq/tegra30-devfreq.c
> +++ b/drivers/devfreq/tegra30-devfreq.c
> @@ -776,7 +776,8 @@ static int tegra_governor_event_handler(struct devfreq *devfreq,
>  
>  static struct devfreq_governor tegra_devfreq_governor = {
>  	.name = "tegra_actmon",
> -	.attrs = DEVFREQ_GOV_ATTR_POLLING_INTERVAL,
> +	.attrs = DEVFREQ_GOV_ATTR_POLLING_INTERVAL
> +		| DEVFREQ_GOV_ATTR_TARGET_FREQ,
>  	.flags = DEVFREQ_GOV_FLAG_IMMUTABLE
>  		| DEVFREQ_GOV_FLAG_IRQ_DRIVEN,
>  	.get_target_freq = tegra_governor_get_target,
> diff --git a/include/linux/devfreq-governor.h b/include/linux/devfreq-governor.h
> index dfdd0160a29f..2853f571dfdf 100644
> --- a/include/linux/devfreq-governor.h
> +++ b/include/linux/devfreq-governor.h
> @@ -43,9 +43,12 @@
>   *   : Indicate polling_interval sysfs attribute
>   * - DEVFREQ_GOV_ATTR_TIMER
>   *   : Indicate timer sysfs attribute
> + * - DEVFREQ_GOV_ATTR_TARGET_FREQ
> + *   : Indicate the target freq sysfs attribute
>   */
>  #define DEVFREQ_GOV_ATTR_POLLING_INTERVAL		BIT(0)
>  #define DEVFREQ_GOV_ATTR_TIMER				BIT(1)
> +#define DEVFREQ_GOV_ATTR_TARGET_FREQ			BIT(2)
>  
>  /**
>   * struct devfreq_governor - Devfreq policy governor
> 

Hi,

I agree this approach. But, this patches doesn't include devicetree binding for device
and driver has included OPP information. It might be not acceptable for dt maintainer on device binding side.
And are there no problem with short polling period?

-- 
Best Regards,
Chanwoo Choi
Principal Engineer, Samsung Electronics

