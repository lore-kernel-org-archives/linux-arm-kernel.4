Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B074F606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 17:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UrCBllaB;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=EEt6Egq0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=hoUaDOXjvR+PfhexV4Pyo/MoYW9ox9uoEc03akIFgno=; b=UrCBllaBjR8HmOgi541u1JeC5q
	A4jFbwfYi7AtD7c60rW/rCEouDKpvyP2xNjrQ7MUwHCvCmGidQrCLzura07XAjOb7NUO2jOYwChss
	phOqC3QjwuD7JJ1Ok4ZU1AylDGjKbiqKcFQVfHx2l7nk7swtYAbCO7xjTOsw5XJFzZXbz1USCGTi5
	7J0OdekG0aQACW1o1RPim1vTs2d9HYhIebVjl3xwCFv2YzU4TPGiqHNQjP0ZrRaJCZXa91YgaSu92
	2+CNS8BKVzSezRHS/pO9VwDKZRAcksjWoMwSrS2ux187k2PKZeOM21VpskOKPn79wzZHMxQk/z1H5
	mzrCHcUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRBxU-00000007Hmn-2bBZ;
	Wed, 11 Nov 2026 17:18:04 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRBxS-00000007HmQ-2FGt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 17:18:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4F6541576;
	Wed, 11 Nov 2026 09:17:58 -0800 (PST)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 31B2C3F632;
	Wed, 11 Nov 2026 09:17:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794417481; bh=UrZqN4uTe8uR++LX3BUuIbvtsKfw4L/it9U0FMTY02A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EEt6Egq01I0d/W3/mcLTMJ8M9L2pHaoCM3Nn+SoOgaEkFLAtPlvnpjUsnkuHj5GN7
	 6pOn6kN+Sb1YU3abfAjb7MFDguqK6ugZ2CCCzv7ZsUZ0j7dJiquVyjt+VaF7tNUgam
	 TN5tJvfDnAmEwtzoo/yP0DA4ICqOkLvnaWyDiIlY=
Date: Wed, 11 Nov 2026 17:17:22 +0000
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: maz@kernel.org, oupton@kernel.org, fuad.tabba@linux.dev,
	joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, will@kernel.org, mark.rutland@arm.com,
	linux-perf-users@vger.kernel.org, catalin.marinas@arm.com,
	james.clark@linaro.org
Subject: Re: [RFC PATCH v7 04/28] perf: arm_spe_pmu: Move struct arm_spe_pmu
 to a separate header file
Message-ID: <avSjIvJM5TZAuQlG@raptor>
References: <20260903160623.315525-1-alexandru.elisei@arm.com>
 <20260903160623.315525-5-alexandru.elisei@arm.com>
 <atDgBR0WOGHUsLaF@gremlin>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <atDgBR0WOGHUsLaF@gremlin>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_091802_694528_AC42243D 
X-CRM114-Status: GOOD (  22.36  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Lorenzo,

On Thu, Oct 15, 2026 at 03:40:09PM +0100, Lorenzo Stoakes (ARM) wrote:
> On Thu, Sep 03, 2026 at 05:05:59PM +0100, Alexandru Elisei wrote:
> > KVM will soon want to make use of struct arm_spe_pmu, move it to a separate
> > header where it will be easily accessible.
> >
> > Cc: Will Deacon <will@kernel.org>
> > Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> 
> Looks to be a straightforward mechanical change, couple nits below but with
> those addressed:
> 
> Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> 
> > ---
> >  drivers/perf/arm_spe_pmu.c       | 33 +--------------------
> >  include/linux/perf/arm_spe_pmu.h | 50 ++++++++++++++++++++++++++++++++
> 
> This should be added to MAINTAINERS too I think?

Added this under ARM PMU PROFILING AND DEBUGGING:

+F:     include/linux/perf/arm_spe_pmu.h

> 
> >  2 files changed, 51 insertions(+), 32 deletions(-)
> >  create mode 100644 include/linux/perf/arm_spe_pmu.h
> >
> > diff --git a/drivers/perf/arm_spe_pmu.c b/drivers/perf/arm_spe_pmu.c
> > index b70f3fedf028..79c571a649d5 100644
> > --- a/drivers/perf/arm_spe_pmu.c
> > +++ b/drivers/perf/arm_spe_pmu.c
> > @@ -28,6 +28,7 @@
> >  #include <linux/of.h>
> >  #include <linux/perf_event.h>
> >  #include <linux/perf/arm_pmu.h>
> > +#include <linux/perf/arm_spe_pmu.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/printk.h>
> >  #include <linux/slab.h>
> > @@ -67,38 +68,6 @@ struct arm_spe_pmu_buf {
> >  	void					*base;
> >  };
> >
> > -struct arm_spe_pmu {
> > -	struct pmu				pmu;
> > -	struct platform_device			*pdev;
> > -	cpumask_t				supported_cpus;
> > -	struct hlist_node			hotplug_node;
> > -
> > -	int					irq; /* PPI */
> > -	u16					pmsver;
> > -	u16					min_period;
> > -	u16					counter_sz;
> > -
> > -#define SPE_PMU_FEAT_FILT_EVT			(1UL << 0)
> > -#define SPE_PMU_FEAT_FILT_TYP			(1UL << 1)
> > -#define SPE_PMU_FEAT_FILT_LAT			(1UL << 2)
> > -#define SPE_PMU_FEAT_ARCH_INST			(1UL << 3)
> > -#define SPE_PMU_FEAT_LDS			(1UL << 4)
> > -#define SPE_PMU_FEAT_ERND			(1UL << 5)
> > -#define SPE_PMU_FEAT_INV_FILT_EVT		(1UL << 6)
> > -#define SPE_PMU_FEAT_DISCARD			(1UL << 7)
> > -#define SPE_PMU_FEAT_EFT			(1UL << 8)
> > -#define SPE_PMU_FEAT_FDS			(1UL << 9)
> > -#define SPE_PMU_FEAT_DEV_PROBED			(1UL << 63)
> > -	u64					features;
> > -
> > -	u64					pmsevfr_res0;
> > -	u16					max_record_sz;
> > -	u16					align;
> > -	struct perf_output_handle __percpu	*handle;
> > -};
> > -
> > -#define to_spe_pmu(p) (container_of(p, struct arm_spe_pmu, pmu))
> > -
> >  /* Convert a free-running index from perf into an SPE buffer offset */
> >  #define PERF_IDX2OFF(idx, buf) \
> >  	((idx) % ((unsigned long)(buf)->nr_pages << PAGE_SHIFT))
> > diff --git a/include/linux/perf/arm_spe_pmu.h b/include/linux/perf/arm_spe_pmu.h
> > new file mode 100644
> > index 000000000000..af86fd184050
> > --- /dev/null
> > +++ b/include/linux/perf/arm_spe_pmu.h
> > @@ -0,0 +1,50 @@
> > +// SPDX-License-Identifier: GPL-2.0
> 
> Pedantic I know, sorry :P but as per Documentation/process/license-rules.rst:
> 
>       C source:	// SPDX-License-Identifier: <SPDX License Expression>
>       C header:	/* SPDX-License-Identifier: <SPDX License Expression> */
>       ...
> 
> So should be /* */ here.

Fixed.

> 
> > +/*
> > + * Split from driver/perf/arm_spe_pmu.c
> 
> NIT: should be drivers/...

Fixed.

Thanks,
Alex

> 
> > + *
> > + * Copyright (C) 2016 ARM Limited
> > + */
> > +
> > +#ifndef __PERF_ARM_SPE_PMU_H__
> > +#define __PERF_ARM_SPE_PMU_H__
> > +
> > +#include <linux/cpumask.h>
> > +#include <linux/container_of.h>
> > +#include <linux/list.h>
> > +#include <linux/perf_event.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/types.h>
> > +
> > +struct arm_spe_pmu {
> > +	struct pmu				pmu;
> > +	struct platform_device			*pdev;
> > +	cpumask_t				supported_cpus;
> > +	struct hlist_node			hotplug_node;
> > +
> > +	int					irq; /* PPI */
> > +	u16					pmsver;
> > +	u16					min_period;
> > +	u16					counter_sz;
> > +
> > +#define SPE_PMU_FEAT_FILT_EVT			(1UL << 0)
> > +#define SPE_PMU_FEAT_FILT_TYP			(1UL << 1)
> > +#define SPE_PMU_FEAT_FILT_LAT			(1UL << 2)
> > +#define SPE_PMU_FEAT_ARCH_INST			(1UL << 3)
> > +#define SPE_PMU_FEAT_LDS			(1UL << 4)
> > +#define SPE_PMU_FEAT_ERND			(1UL << 5)
> > +#define SPE_PMU_FEAT_INV_FILT_EVT		(1UL << 6)
> > +#define SPE_PMU_FEAT_DISCARD			(1UL << 7)
> > +#define SPE_PMU_FEAT_EFT			(1UL << 8)
> > +#define SPE_PMU_FEAT_FDS			(1UL << 9)
> > +#define SPE_PMU_FEAT_DEV_PROBED			(1UL << 63)
> > +	u64					features;
> > +
> > +	u64					pmsevfr_res0;
> > +	u16					max_record_sz;
> > +	u16					align;
> > +	struct perf_output_handle __percpu	*handle;
> > +};
> > +
> > +#define to_spe_pmu(p) (container_of(p, struct arm_spe_pmu, pmu))
> > +
> > +#endif /* __PERF_ARM_SPE_PMU_H__ */
> > --
> > 2.43.0
> >
> >
> 
> --
> Cheers, Lorenzo

