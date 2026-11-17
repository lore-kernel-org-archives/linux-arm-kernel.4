Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6640606A329
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 07:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yKKRx0qh;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fv+gQFSm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=dMx+tOseMam46SgmfM9cvERzRhYAz0pOaNb4GxykaIk=; b=yKKRx0qhHUpYfkPO3SvzItKQ28
	Z88OGI5vuu7b3PumVbahI+Gq/Eey9LCYE70Fkj5goeIJ18h3oRhVACu+0XVqOIuxax6E4/up1P8Wn
	Jtu58lhHDeF1Gc4Zsy54RCq8AsWokxBY76WnoSS3x56CD2jgegM0tXUobOnrFpSpwjhGqdAX6brM+
	+vP1dFxrjDW7OAQUQMMpuSTmcOra8cTMR4cC/bfcFfJlzxdoq+g4iyTxONi10Md9E5KhjwOwcOI39
	6m06c5p6icUlDxJCWa4UcSLTjCtcHlDsF7ifDcUvmUA6WfG7esKEugneHaZpXMQ2fBXU1WdsvfSWM
	NIaNa1yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTDpu-00000004ogt-3O1o;
	Tue, 17 Nov 2026 07:42:38 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTDpr-00000004ogU-0y3g
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 07:42:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794901355; x=1826437355;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=AsTisYS88CyF1D2XKlMoI1xuwTYcxN5zMHAD5L3nQVs=;
  b=fv+gQFSm0lMPokE2MttipV2ZVFMndDGqwYjCdcO0JshW4TPuPkwibiHZ
   ro666Tbu2jysSxsOV4drqfCl9inJnRKZ9Q1b+dBo25ZFKmymQNgjy55xQ
   xV5X5kUw0wICT9wUTwtG0isZRHW+IYs8ISs/6z+Imw03akGBcJAGlPTjP
   tSYrvCOA2m+0FY7/kRAYlbmgVAbcIqO45SNVUnia9YR2kf6Jw0hUUo5AQ
   N2TtRBvS5v9sZQeOaQYvfYbgr09de6EkzqE/EKWlV8UwdTfz3RTrC35XR
   jZudeGeqngDFuLKpLkHa7K27nEXkpREnb2aG5PmAWdZfdypMhD9whOhsX
   w==;
X-CSE-ConnectionGUID: A045clFaT0ajHvcSQyZjyw==
X-CSE-MsgGUID: eIp8vLYYRXKra8/zj808WQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3675290"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3675290"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 23:42:34 -0800
X-CSE-ConnectionGUID: +ZzAkOxcQvm+yatLfSznfw==
X-CSE-MsgGUID: BQJbNDbeRgmT9vPLE3XTJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="9985124"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.254])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 23:42:27 -0800
Date: Tue, 17 Nov 2026 09:42:24 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Leo Yan <leo.yan@arm.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Al Grant <al.grant@arm.com>, "Johnny.Fan" <johnny.fan@cixtech.com>,
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org
Subject: Re: [PATCH 1/8] device property: Add firmware node IRQ affinity
 callbacks
Message-ID: <avwFYMdr7g4r6Z9y@ashevche-desk.local>
References: <20261116-acpi_arm_pmu_registration_hmp-v1-0-0371d4eca626@arm.com>
 <20261116-acpi_arm_pmu_registration_hmp-v1-1-0371d4eca626@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261116-acpi_arm_pmu_registration_hmp-v1-1-0371d4eca626@arm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_234235_310542_8848EE59 
X-CRM114-Status: GOOD (  17.80  )
X-Spam-Score: -4.2 (----)
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 16, 2026 at 06:21:28PM +0000, Leo Yan wrote:
> Platform IRQ affinity lookup currently selects the OF or ACPI helper
> directly. Add fwnode_irq_get_affinity() and an irq_get_affinity operation
> implemented by both firmware types.
> 
> Use the new helper for platform devices, preserving the existing fallback
> to cpu_possible_mask when affinity information is unavailable.

From this commit message it's unclear why we do that. Is it any helpful in the
future? If yes, for what?

...

> static const struct cpumask *get_irq_affinity(struct platform_device *dev,

>  {
>  	const struct cpumask *mask = NULL;
>  #ifndef CONFIG_SPARC

> -	struct fwnode_handle *fwnode = dev_fwnode(&dev->dev);
> -

Might be unneeded churn — you can leave these two lines being untouched.

> -	if (is_of_node(fwnode))
> -		mask = of_irq_get_affinity(to_of_node(fwnode), num);
> -	else if (is_acpi_device_node(fwnode))
> -		mask = acpi_irq_get_affinity(ACPI_HANDLE_FWNODE(fwnode), num);

> +	mask = fwnode_irq_get_affinity(dev_fwnode(&dev->dev), num);

	mask = fwnode_irq_get_affinity(fwnode, num);

>  #endif

>  	return mask ?: cpu_possible_mask;

But I understand the point as we have only a single user left. So I am not
objecting the proposed approach, just pointed out on an alternative.

...

> +++ b/include/linux/fwnode.h

>  struct fwnode_operations;
>  struct device;
> +struct cpumask;

Yes, it's a bit disordered, can you place the new one before the 'device'
to follow alphabetical order?

-- 
With Best Regards,
Andy Shevchenko



