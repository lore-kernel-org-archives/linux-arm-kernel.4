Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F45E606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 13:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0ADwrYWg;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t6OneKGJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=CsF55ZXLDTjTlBBCuvyJQs4EzU3mpk9cWSAc5sBOHaM=; b=0ADwrYWgWK0mnMYZA/8gvqzqWK
	6AHJ/N/6S/Wb9mmPol2l5yvEUEbSmeDDAP6N2hLo8RjLCRwoYP86W0lk/8a6rKBjTrX1jPcSw826S
	+lGeBDPUWwJZcs+avXWp7BpxJlqmJf8Cs4fwHdSkjjg2iEKOjChE+zkAhznpyOTL90Mjvj6HkyyXr
	CYJtBcEbzsjLq6yrryqTXdkaGmOmCISn8eGVU6G5u4ZIYF0cxJT3vhWHvAtH+E29lmqA8io99KuEf
	KjVJx6CGWerqlEfkg9QjC5PKNSlo02rVH8//OpZpQo43w1F3/PssGD5rrwqJZ8vajj3hWOzUgqJe8
	XyNE/73Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTfq3-00000008xLB-0WwF;
	Wed, 18 Nov 2026 13:36:39 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTfpz-00000008xKV-3JwV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 13:36:38 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-cd60c5da24cso750660a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 05:36:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795008995; x=1795613795; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CsF55ZXLDTjTlBBCuvyJQs4EzU3mpk9cWSAc5sBOHaM=;
        b=t6OneKGJJMAvV9gcovzAnONIxWbixIaAgo+/r9eXDBo50iqVzLwfXuVD5RsCmjBzRb
         QdoxhRro4AbAza9N63lJT2ykMtM8xqCm+58v2QlfvqWveqtqM7iHRRHaXGHXHQDiQOgC
         fDwxmodz6XB7B3YJotyKgzQUIu62ii8K8LE4qHzeqodpfwse0T3RQsP0ftV9TSv8AwQ4
         LQHPtSYinTmG6vMTeby2UWWm70SYDH8NYO/BSstxq5dNWmk4HJ6FuutwNho24m3U/KcW
         9y8AmMdj4xzdLDj13CFsgk3y6LJB21uVlxtgBO9rNcodPz2w9S0L/idywKm3n4kyJe1D
         91cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795008995; x=1795613795;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CsF55ZXLDTjTlBBCuvyJQs4EzU3mpk9cWSAc5sBOHaM=;
        b=YY6Wb5cxwx2zyBHEoxj+2W9FUCvhaxPS0OD5vMRkXN6GGk5y6ZgIg+T3i2RU6EVu2Z
         ZA4OrMCX2OMxjGpM6Iy7Pdek6a3ZqF1Bn0kJXI+oIZkN2Hv3WH0fhQzIRw9LWtWYyFS4
         KqBMUVXUbDppeUpJrkDJkqd05KQgKTQuIPv+8EfPw+V3ShlzD8u/1+oBi7dX8HY8Qahz
         Cm0ZqhxuqQGKlT+06xy3sjerHdjSbNN/oLjfTJObsBu3NBZRkGW7ZNK7MUUT8Y/hq2cG
         bUnvmRTKPdMH3dkglaZfOVqsV5EaBjvTFhYBoItglAjnT7v+2i3KW//CYS+kPN08YnEZ
         Ow3w==
X-Forwarded-Encrypted: i=1; AL+hErHJ+qo9yOnRfDk1nu1kXgNYVD8w6nsz+aBaz8FZ1bm2IwFO5ggiAKQqNaiQO89H3sgvK9POGWk6BgIgywEjUYyB@lists.infradead.org
X-Gm-Message-State: APuU4Z+hyP99+Is05febNPplEQE+IHXT9i5GdawJJcdHS64ZB+gaVhjH
	AtZ+6KoITJvxDM4lKP160nEu7IkFfkZ5mF3rBF+il7EbRQOIcrCM5Opl
X-Gm-Gg: AZFdTZckE/Hne6nMkSA1QuB1nZhJdojj0WwgvJcj0ix9RS37jCizhkOM8BL46q8nTn/
	D+QXHqKqsKKIdZwaMo/t1HnRrVzj+ubsSfKXVjGfYkrDI2VatcM2WEQHSeYKnD9Xu9qhPqBYxQF
	U1w/WLq6z1j6Wiv1NBSyqEBVDEOlD0tmd18Bj7iG7E0jJVHLgHVSZYLw3flam4J7NDZemLS9H0o
	Zqa6lQhmFBtx0MQSWv8r9iIjEk2SCuFri07Xbug15fe0p9mSS0pwAunYEZJAPYQSDDeMWSdBPz9
	P9EudDpl2tiv/xjedIgFz8jH1TRnqMo8Dqdn8hVRIisw49bk+9KYD8UqEcA/EeJeuTiKZ4PFxFa
	q2rWPKUfP+WRIomliqbJ53sbGhR3VzRiOEXK/n0H9M/zDSGUGYz5YV6AFRQdv5D3dW6axUb7+Gm
	HaE3sanUiiXJHwtop0YiWICzAeTR+NZMY4apw059vVGjYJ+P1/R3cwmdjwp8IJ7sMXgL0by0F8K
	7mWPIK+LK/05qZpZGvWUKRKeNkPlfCOsWTlAcFJRyu7053p9lRFlTtiurV8lfj388UA9CHfaY3T
	RKFk6UEpeyAI1w0vZsAxeQ7mPNEAkGe3uGoIj/hOjjQAGVA2oBjB
X-Received: by 2002:a17:90b:314e:b0:3b3:c930:35d1 with SMTP id 98e67ed59e1d1-3b3d07c8421mr3025084a91.51.1795008994528;
        Wed, 18 Nov 2026 05:36:34 -0800 (PST)
Received: from macbookair ([187.40.224.113])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff6214565sm13741965ad.42.2026.11.18.05.36.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 05:36:34 -0800 (PST)
Date: Thu, 19 Nov 2026 00:36:23 +1100
From: Myria Sarvay <myrialsarvay@gmail.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, asahi@lists.linux.dev,
	Yuvan Shen <yuvanshen09@gmail.com>,
	Nick Chan <towinchenmi@gmail.com>
Subject: Re: [PATCH v2 03/15] drivers/perf: apple_m1: Support
 per-implementation event tables
Message-ID: <av2p17j8AglpTSAz@macbookair>
References: <20261107-m3-plus-pmu-events-v2-0-acf1e78da039@gmail.com>
 <20261107-m3-plus-pmu-events-v2-3-acf1e78da039@gmail.com>
 <864ide1hb1.wl-maz@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <864ide1hb1.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_053637_444795_09965C95 
X-CRM114-Status: GOOD (  50.19  )
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 18, 2026 at 11:59:30AM +0000, Marc Zyngier wrote:
> On Sat, 07 Nov 2026 10:48:50 +0000,
> Myria Sarvay via B4 Relay <devnull+myrialsarvay.gmail.com@kernel.org> wrote:
> > 
> > From: Nick Chan <towinchenmi@gmail.com>
> > 
> > Use per-implementation event tables to allow supporting implementations
> > with a different list of events and event affinities.
> > 
> > Signed-off-by: Nick Chan <towinchenmi@gmail.com>
> > Co-developed-by: Myria Sarvay <myrialsarvay@gmail.com>
> > Signed-off-by: Myria Sarvay <myrialsarvay@gmail.com>
> > ---
> >  drivers/perf/apple_m1_cpu_pmu.c | 113 ++++++++++++++++++++++++----------------
> >  1 file changed, 69 insertions(+), 44 deletions(-)
> > 
> > diff --git a/drivers/perf/apple_m1_cpu_pmu.c b/drivers/perf/apple_m1_cpu_pmu.c
> > index de4026c63afd..2ff0c2e0b737 100644
> > --- a/drivers/perf/apple_m1_cpu_pmu.c
> > +++ b/drivers/perf/apple_m1_cpu_pmu.c
> > @@ -43,9 +43,6 @@
> >   * moment, we don't really need to distinguish between the two because we
> >   * know next to nothing about the events themselves, and we already have
> >   * per cpu-type PMU abstractions.
> > - *
> > - * If we eventually find out that the events are different across
> > - * implementations, we'll have to introduce per cpu-type tables.
> >   */
> >  enum m1_pmu_events {
> >  	M1_PMU_PERFCTR_RETIRE_UOP				= 0x1,
> > @@ -167,7 +164,7 @@ static const u16 m1_pmu_event_affinity[M1_PMU_PERFCTR_LAST + 1] = {
> >  	[M1_PMU_PERFCTR_UNKNOWN_fd]				= ONLY_2_4_6,
> >  };
> >  
> > -static const unsigned m1_pmu_perf_map[PERF_COUNT_HW_MAX] = {
> > +static const unsigned int m1_pmu_perf_map[PERF_COUNT_HW_MAX] = {
> >  	PERF_MAP_ALL_UNSUPPORTED,
> >  	[PERF_COUNT_HW_CPU_CYCLES]		= M1_PMU_PERFCTR_CORE_ACTIVE_CYCLE,
> >  	[PERF_COUNT_HW_INSTRUCTIONS]		= M1_PMU_PERFCTR_INST_ALL,
> > @@ -486,11 +483,12 @@ static void m1_pmu_write_counter(struct perf_event *event, u64 value)
> >  	isb();
> >  }
> >  
> > -static int m1_pmu_get_event_idx(struct pmu_hw_events *cpuc,
> > -				struct perf_event *event)
> > +static int apple_pmu_get_event_idx(struct pmu_hw_events *cpuc,
> > +				   struct perf_event *event,
> > +				   const u16 event_affinities[])
> >  {
> >  	unsigned long evtype = event->hw.config_base & M1_PMU_CFG_EVENT;
> > -	unsigned long affinity = m1_pmu_event_affinity[evtype];
> > +	unsigned long affinity = event_affinities[evtype];
> >  	int idx;
> >  
> >  	/*
> > @@ -509,6 +507,12 @@ static int m1_pmu_get_event_idx(struct pmu_hw_events *cpuc,
> >  	return -EAGAIN;
> >  }
> >  
> > +static int m1_pmu_get_event_idx(struct pmu_hw_events *cpuc,
> > +				struct perf_event *event)
> > +{
> > +	return apple_pmu_get_event_idx(cpuc, event, m1_pmu_event_affinity);
> > +}
> > +
> >  static void m1_pmu_clear_event_idx(struct pmu_hw_events *cpuc,
> >  				   struct perf_event *event)
> >  {
> > @@ -536,44 +540,52 @@ static void m1_pmu_stop(struct arm_pmu *cpu_pmu)
> >  	__m1_pmu_set_mode(PMCR0_IMODE_OFF);
> >  }
> >  
> > +static int apple_pmu_map_event(struct perf_event *event,
> > +			       const unsigned int (*perf_map)[],
> > +			       unsigned int flags)
> > +{
> > +	event->hw.flags |= flags;
> > +	return armpmu_map_event(event, perf_map, NULL, M1_PMU_CFG_EVENT);
> > +}
> > +
> > +/*
> > + * Apple PMU counters have been observed to be either 48 or
> > + * 64 bits wide, depending on the SoC. However, the MSB is
> > + * what triggers an overflow interrupt, so we advertise the
> > + * counters as being 1-bit smaller than hardware so as to
> > + * mimick ARM PMU behaviour
> > + */
> >  static int m1_pmu_map_event(struct perf_event *event)
> >  {
> > -	/*
> > -	 * Although the counters are 48bit wide, bit 47 is what
> > -	 * triggers the overflow interrupt. Advertise the counters
> > -	 * being 47bit wide to mimick the behaviour of the ARM PMU.
> > -	 */
> > -	event->hw.flags |= ARMPMU_EVT_47BIT;
> > -	return armpmu_map_event(event, &m1_pmu_perf_map, NULL, M1_PMU_CFG_EVENT);
> > +	return apple_pmu_map_event(event, &m1_pmu_perf_map, ARMPMU_EVT_47BIT);
> >  }
> >  
> >  static int m2_pmu_map_event(struct perf_event *event)
> >  {
> > -	/*
> > -	 * Same deal as the above, except that M2 has 64bit counters.
> > -	 * Which, as far as we're concerned, actually means 63 bits.
> > -	 * Yes, this is getting awkward.
> > -	 */
> > -	event->hw.flags |= ARMPMU_EVT_63BIT;
> > -	return armpmu_map_event(event, &m1_pmu_perf_map, NULL, M1_PMU_CFG_EVENT);
> > +	return apple_pmu_map_event(event, &m1_pmu_perf_map, ARMPMU_EVT_63BIT);
> >  }
> >  
> > -static int m1_pmu_map_pmuv3_event(unsigned int eventsel)
> > +static int apple_pmu_map_pmuv3_event(unsigned int eventsel, const u16 pmceid_map[])
> >  {
> > -	u16 m1_event = HW_OP_UNSUPPORTED;
> > +	u16 apple_event = HW_OP_UNSUPPORTED;
> 
> nit: s/apple_event/hw_event/.

Thanks!
> 
> >  
> >  	if (eventsel < ARMV8_PMUV3_MAX_COMMON_EVENTS)
> > -		m1_event = m1_pmu_pmceid_map[eventsel];
> > +		apple_event = pmceid_map[eventsel];
> >  
> > -	return m1_event == HW_OP_UNSUPPORTED ? -EOPNOTSUPP : m1_event;
> > +	return apple_event == HW_OP_UNSUPPORTED ? -EOPNOTSUPP : apple_event;
> >  }
> >  
> > -static void m1_pmu_init_pmceid(struct arm_pmu *pmu)
> > +static int m1_pmu_map_pmuv3_event(unsigned int eventsel)
> > +{
> > +	return apple_pmu_map_pmuv3_event(eventsel, m1_pmu_pmceid_map);
> > +}
> > +
> > +static void apple_pmu_init_pmceid(struct arm_pmu *pmu)
> >  {
> >  	unsigned int event;
> >  
> >  	for (event = 0; event < ARMV8_PMUV3_MAX_COMMON_EVENTS; event++) {
> > -		if (m1_pmu_map_pmuv3_event(event) >= 0)
> > +		if (pmu->map_pmuv3_event(event) >= 0)
> >  			set_bit(event, pmu->pmceid_bitmap);
> >  	}
> >  }
> > @@ -616,33 +628,22 @@ static int m1_pmu_set_event_filter(struct hw_perf_event *event,
> >  	return 0;
> >  }
> >  
> > -static int m1_pmu_init(struct arm_pmu *cpu_pmu, u32 flags)
> > +static int apple_pmu_init(struct arm_pmu *cpu_pmu)
> >  {
> >  	cpu_pmu->handle_irq	  = m1_pmu_handle_irq;
> >  	cpu_pmu->enable		  = m1_pmu_enable_event;
> >  	cpu_pmu->disable	  = m1_pmu_disable_event;
> >  	cpu_pmu->read_counter	  = m1_pmu_read_counter;
> >  	cpu_pmu->write_counter	  = m1_pmu_write_counter;
> > -	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
> >  	cpu_pmu->clear_event_idx  = m1_pmu_clear_event_idx;
> >  	cpu_pmu->start		  = m1_pmu_start;
> >  	cpu_pmu->stop		  = m1_pmu_stop;
> > -
> > -	if (flags & ARMPMU_EVT_47BIT)
> > -		cpu_pmu->map_event = m1_pmu_map_event;
> > -	else if (flags & ARMPMU_EVT_63BIT)
> > -		cpu_pmu->map_event = m2_pmu_map_event;
> > -	else
> > -		return WARN_ON(-EINVAL);
> > -
> >  	cpu_pmu->reset		  = m1_pmu_reset;
> >  	cpu_pmu->set_event_filter = m1_pmu_set_event_filter;
> >  
> > -	cpu_pmu->map_pmuv3_event  = m1_pmu_map_pmuv3_event;
> > -	m1_pmu_init_pmceid(cpu_pmu);
> > +	apple_pmu_init_pmceid(cpu_pmu);
> >  
> >  	bitmap_set(cpu_pmu->cntr_mask, 0, M1_PMU_NR_COUNTERS);
> > -	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_EVENTS] = &m1_pmu_events_attr_group;
> >  	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_FORMATS] = &m1_pmu_format_attr_group;
> >  	return 0;
> >  }
> > @@ -651,25 +652,49 @@ static int m1_pmu_init(struct arm_pmu *cpu_pmu, u32 flags)
> >  static int m1_pmu_ice_init(struct arm_pmu *cpu_pmu)
> >  {
> >  	cpu_pmu->name = "apple_icestorm_pmu";
> > -	return m1_pmu_init(cpu_pmu, ARMPMU_EVT_47BIT);
> > +	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
> > +	cpu_pmu->map_event	  = m1_pmu_map_event;
> > +
> > +	cpu_pmu->map_pmuv3_event  = m1_pmu_map_pmuv3_event;
> > +
> > +	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_EVENTS] = &m1_pmu_events_attr_group;
> > +	return apple_pmu_init(cpu_pmu);
> >  }
> >
> 
> Looking at the following patches, I feel that this series is taking
> the long route to get to a relatively clear point: most of the
> invariant that we relied on for M1, slightly relaxed for M2 (counter
> width), are even more relaxed for M3+ (event width). We therefore need
> to indirect things. The way you do it is to mirror the current setup,
> with a whole set of callbacks per implementation and a bunch of
> additional helpers.
> 
> But instead of having a set of helper functions, one per
> implementation, with an ever increasing set of parameters, it really
> feels like we could do with a more data-centric approach where we have
> a single data structure describing an implementation, containing all
> the relevant data (pointer to the event mapping table, flags, bit
> indices for the user/kernel/guest/host attributes, and so on. We could
> then have a single set of callbacks that work on everything.
> 
> You could convert M1/M2 to that, then just add the relevant
> descriptions for M3+, which should just add data and the init
> functions, nothing else.
> 
> Does this make sense to you?

Hi Marc,

It does make sense, and should reduce duplicated code, I'm just not
confident I have the right idea as to how to implement it. I don't want
to duplicate a lot of the generic arm_pmu code, so it looks like it'd
probably have to be modified to allow passing a hardware specific detail
struct to all the callbacks, likely stored as a new field (void *) in
the arm_pmu struct itself. Does that vaguely sound right to you?

Also, with this rewrite, if we're going to make the code a whole lot
more generic, and take hardware specific data from a static struct,
would it make sense to rename the driver/all the callbacks while we're
at it, now that we're adding a lot more than just M1/M2 pmu events?

Thanks,
Myria

> 
> Thanks,
> 
> 	M.
> 
> -- 
> Without deviation from the norm, progress is not possible.

