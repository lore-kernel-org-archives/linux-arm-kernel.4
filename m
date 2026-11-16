Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C6D606A322
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 18:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FPM5gAQQ;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BZQvZvdn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=PjgDifA+WY+ML1G6HjbkqA7torFG5UegbIaFkipl26w=; b=FPM5gAQQaCsCX+QyIWHsrADxpQ
	imJg+hf5U/lAt59qg2PZB9umsJL1vA6oOjYhM2gzu2kQGdy9M98HU5Ek70f0jArlTVaoaJizQ1rb6
	YIaBHG4Suu02gFfq+V3vblKJ8Q4zpk44Eiaq/jdO+t75/mrJ0jiLgqgQri1cSct3MmcVLoX5E345O
	T02znULm5E+g7SWyZOgv7G2TKbPQ7XbpttgB7D/OrCOWPwOZOOceMT9BgInf76FAUDEXMivHLKOLK
	5OnNxmETSxEP47Tc2lvmJTpY1FFb3TFcF5UkbYrYhADMgloieWZoUG6KZk6fvOyGBdOUAoO/T376p
	Akv6tG4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT13j-00000003UbD-2Xf2;
	Mon, 16 Nov 2026 18:04:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT13i-00000003Uaq-2aNd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 18:04:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4B4CC41E5F;
	Mon, 16 Nov 2026 18:04:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 370F81F000C4;
	Mon, 16 Nov 2026 18:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794852242;
	bh=PjgDifA+WY+ML1G6HjbkqA7torFG5UegbIaFkipl26w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BZQvZvdnCu1giJ3n9uXH1U5699IR0+LrLB7Y8Ha/qpjipq/k5KAbUrH5utPqTM5P2
	 HQDKJxG2+GlXB9EMO6S7nFz2X7N/LHyZ6IHoJZL/izg8PP93rExefpbo5vm3mloKRa
	 pquMJdJ/EkrGWpEF82c9Tac77BaJO/elDrRDLvseO8kGHFFr9ElDzVxdnFo4NpxuDI
	 lrmoqU/D/flKe151y5d8z45H0et4/vOMd8L/XnUrw8RDiVqZpVp+2QLnOUchXm4O7S
	 nc4QlNJARiOkUGcp1ZAUe1yt0XzD7T8MEev8Q2gpJuoz60e9RMvFHiVQ7UMfyoqxvX
	 Gn3/KbYdSR6Qg==
Date: Mon, 16 Nov 2026 18:03:49 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: maz@kernel.org, oupton@kernel.org, fuad.tabba@linux.dev, 
	joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	will@kernel.org, mark.rutland@arm.com, linux-perf-users@vger.kernel.org, 
	catalin.marinas@arm.com, james.clark@linaro.org
Subject: Re: [RFC PATCH v7 04/28] perf: arm_spe_pmu: Move struct arm_spe_pmu
 to a separate header file
Message-ID: <avtFfIHH5KP01r0j@gremlin>
References: <20260903160623.315525-1-alexandru.elisei@arm.com>
 <20260903160623.315525-5-alexandru.elisei@arm.com>
 <atDgBR0WOGHUsLaF@gremlin>
 <avSjIvJM5TZAuQlG@raptor>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <avSjIvJM5TZAuQlG@raptor>
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

On Wed, Nov 11, 2026 at 05:17:22PM +0000, Alexandru Elisei wrote:
> Hi Lorenzo,
>
> On Thu, Oct 15, 2026 at 03:40:09PM +0100, Lorenzo Stoakes (ARM) wrote:
> > On Thu, Sep 03, 2026 at 05:05:59PM +0100, Alexandru Elisei wrote:
> > > KVM will soon want to make use of struct arm_spe_pmu, move it to a separate
> > > header where it will be easily accessible.
> > >
> > > Cc: Will Deacon <will@kernel.org>
> > > Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> >
> > Looks to be a straightforward mechanical change, couple nits below but with
> > those addressed:
> >
> > Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> >
> > > ---
> > >  drivers/perf/arm_spe_pmu.c       | 33 +--------------------
> > >  include/linux/perf/arm_spe_pmu.h | 50 ++++++++++++++++++++++++++++++++
> >
> > This should be added to MAINTAINERS too I think?
>
> Added this under ARM PMU PROFILING AND DEBUGGING:
>
> +F:     include/linux/perf/arm_spe_pmu.h
>
> >
> > >  2 files changed, 51 insertions(+), 32 deletions(-)
> > >  create mode 100644 include/linux/perf/arm_spe_pmu.h
> > >
> > > diff --git a/drivers/perf/arm_spe_pmu.c b/drivers/perf/arm_spe_pmu.c
> > > index b70f3fedf028..79c571a649d5 100644
> > > --- a/drivers/perf/arm_spe_pmu.c
> > > +++ b/drivers/perf/arm_spe_pmu.c
> > > @@ -28,6 +28,7 @@
> > >  #include <linux/of.h>
> > >  #include <linux/perf_event.h>
> > >  #include <linux/perf/arm_pmu.h>
> > > +#include <linux/perf/arm_spe_pmu.h>
> > >  #include <linux/platform_device.h>
> > >  #include <linux/printk.h>
> > >  #include <linux/slab.h>
> > > @@ -67,38 +68,6 @@ struct arm_spe_pmu_buf {
> > >  	void					*base;
> > >  };
> > >
> > > -struct arm_spe_pmu {
> > > -	struct pmu				pmu;
> > > -	struct platform_device			*pdev;
> > > -	cpumask_t				supported_cpus;
> > > -	struct hlist_node			hotplug_node;
> > > -
> > > -	int					irq; /* PPI */
> > > -	u16					pmsver;
> > > -	u16					min_period;
> > > -	u16					counter_sz;
> > > -
> > > -#define SPE_PMU_FEAT_FILT_EVT			(1UL << 0)
> > > -#define SPE_PMU_FEAT_FILT_TYP			(1UL << 1)
> > > -#define SPE_PMU_FEAT_FILT_LAT			(1UL << 2)
> > > -#define SPE_PMU_FEAT_ARCH_INST			(1UL << 3)
> > > -#define SPE_PMU_FEAT_LDS			(1UL << 4)
> > > -#define SPE_PMU_FEAT_ERND			(1UL << 5)
> > > -#define SPE_PMU_FEAT_INV_FILT_EVT		(1UL << 6)
> > > -#define SPE_PMU_FEAT_DISCARD			(1UL << 7)
> > > -#define SPE_PMU_FEAT_EFT			(1UL << 8)
> > > -#define SPE_PMU_FEAT_FDS			(1UL << 9)
> > > -#define SPE_PMU_FEAT_DEV_PROBED			(1UL << 63)
> > > -	u64					features;
> > > -
> > > -	u64					pmsevfr_res0;
> > > -	u16					max_record_sz;
> > > -	u16					align;
> > > -	struct perf_output_handle __percpu	*handle;
> > > -};
> > > -
> > > -#define to_spe_pmu(p) (container_of(p, struct arm_spe_pmu, pmu))
> > > -
> > >  /* Convert a free-running index from perf into an SPE buffer offset */
> > >  #define PERF_IDX2OFF(idx, buf) \
> > >  	((idx) % ((unsigned long)(buf)->nr_pages << PAGE_SHIFT))
> > > diff --git a/include/linux/perf/arm_spe_pmu.h b/include/linux/perf/arm_spe_pmu.h
> > > new file mode 100644
> > > index 000000000000..af86fd184050
> > > --- /dev/null
> > > +++ b/include/linux/perf/arm_spe_pmu.h
> > > @@ -0,0 +1,50 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> >
> > Pedantic I know, sorry :P but as per Documentation/process/license-rules.rst:
> >
> >       C source:	// SPDX-License-Identifier: <SPDX License Expression>
> >       C header:	/* SPDX-License-Identifier: <SPDX License Expression> */
> >       ...
> >
> > So should be /* */ here.
>
> Fixed.
>
> >
> > > +/*
> > > + * Split from driver/perf/arm_spe_pmu.c
> >
> > NIT: should be drivers/...
>
> Fixed.
>
> Thanks,
> Alex
>
> >
> > > + *
> > > + * Copyright (C) 2016 ARM Limited
> > > + */
> > > +
> > > +#ifndef __PERF_ARM_SPE_PMU_H__
> > > +#define __PERF_ARM_SPE_PMU_H__
> > > +
> > > +#include <linux/cpumask.h>
> > > +#include <linux/container_of.h>
> > > +#include <linux/list.h>
> > > +#include <linux/perf_event.h>
> > > +#include <linux/platform_device.h>
> > > +#include <linux/types.h>
> > > +
> > > +struct arm_spe_pmu {
> > > +	struct pmu				pmu;
> > > +	struct platform_device			*pdev;
> > > +	cpumask_t				supported_cpus;
> > > +	struct hlist_node			hotplug_node;
> > > +
> > > +	int					irq; /* PPI */
> > > +	u16					pmsver;
> > > +	u16					min_period;
> > > +	u16					counter_sz;
> > > +
> > > +#define SPE_PMU_FEAT_FILT_EVT			(1UL << 0)
> > > +#define SPE_PMU_FEAT_FILT_TYP			(1UL << 1)
> > > +#define SPE_PMU_FEAT_FILT_LAT			(1UL << 2)
> > > +#define SPE_PMU_FEAT_ARCH_INST			(1UL << 3)
> > > +#define SPE_PMU_FEAT_LDS			(1UL << 4)
> > > +#define SPE_PMU_FEAT_ERND			(1UL << 5)
> > > +#define SPE_PMU_FEAT_INV_FILT_EVT		(1UL << 6)
> > > +#define SPE_PMU_FEAT_DISCARD			(1UL << 7)
> > > +#define SPE_PMU_FEAT_EFT			(1UL << 8)
> > > +#define SPE_PMU_FEAT_FDS			(1UL << 9)
> > > +#define SPE_PMU_FEAT_DEV_PROBED			(1UL << 63)
> > > +	u64					features;
> > > +
> > > +	u64					pmsevfr_res0;
> > > +	u16					max_record_sz;
> > > +	u16					align;
> > > +	struct perf_output_handle __percpu	*handle;
> > > +};
> > > +
> > > +#define to_spe_pmu(p) (container_of(p, struct arm_spe_pmu, pmu))
> > > +
> > > +#endif /* __PERF_ARM_SPE_PMU_H__ */
> > > --
> > > 2.43.0
> > >
> > >
> >
> > --
> > Cheers, Lorenzo

Cheers for all above!

--
Cheers, Lorenzo

