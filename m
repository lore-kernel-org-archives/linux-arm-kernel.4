Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 524DB606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 18:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oISBpjEQ;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=HRI8N6aK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=JzJkj9wk5hVZMLbPumFq67x0VNnc2cDGyQHbGbUc/Ig=; b=oISBpjEQCi/r/g1BBNrUJ9sA79
	sI4vtIXErkLUapYyfaWM4GJaVPYqLr5I7pppEq2zE0q/oZBVV/IZteYUh2W7N4O+1cO9jSNRpHefu
	0IJ6bU/xo2T16R8tpYHF/f9XmNSUT6enikTBYAkbqVnEqNhWzM+xzYJ2yOqGx0mUFIjqc9S8t7pwH
	p9IoyCznqCKKl5CRLNv/v0RfMTAmA50tZX9eVkWWCYeKlXIlRDz3XISdvNAOG/fYDWLFphvZDhDuB
	AaBunLzl+rEUAO68lLvR+SUx7WkmMmPpzTlTZ68BmvU5re2AVi2xInUitouImgMMt6aFkNrZnT4uS
	evVwVh5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRDDj-00000007R7n-4BbC;
	Wed, 11 Nov 2026 18:38:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRDDh-00000007R6t-2M6Y
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 18:38:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9F5411576;
	Wed, 11 Nov 2026 10:38:48 -0800 (PST)
Received: from arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A09B93F85F;
	Wed, 11 Nov 2026 10:38:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794422331; bh=EtvO+7JBVelwwvKmyuQQ0VL1HGZ1zvVNE+scTBzF2L4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HRI8N6aKFh4+N5ZlvjgMY5u44/w7jY7OmjE0gN76Prv6nqzuExdlgiqhfk0UomWSm
	 cK2c2/M0OuMTykhw6x6G9nviDEn71NBxYcmps9z+D1u+ayNTlKymXS7lUHs5ca0PhL
	 YkfpRsalXmTdgBPDT21+BxGgZaUwGs+IlhduS/88=
Date: Wed, 11 Nov 2026 19:38:26 +0100
From: Beata Michalska <beata.michalska@arm.com>
To: Christian Loehle <christian.loehle@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, Vladimir.Murzin@arm.com,
	catalin.marinas@arm.com, will@kernel.org, suzuki.poulose@arm.com,
	xuewen.yan94@gmail.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: topology: Reduce the skew for AMU feedback
 counter sampling
Message-ID: <avS2In7pb6A2XJaT@arm.com>
References: <20261111124005.2688820-1-beata.michalska@arm.com>
 <20261111124005.2688820-4-beata.michalska@arm.com>
 <45d9ce54-0f6f-46b0-aed6-de8d12b3d6de@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <45d9ce54-0f6f-46b0-aed6-de8d12b3d6de@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_103853_689423_EC8998C2 
X-CRM114-Status: GOOD (  33.38  )
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

Hi Christian,
On Wed, Nov 11, 2026 at 01:56:49PM +0000, Christian Loehle wrote:
> On 11/11/26 12:39, Beata Michalska wrote:
> > With the FFH support for CPPC, the AMU feedback counters, core and const
> > counter, are being sampled to measure CPU performance. Checking for errata
> > (which can affect both counters) between the reads delays the second
> > sample and can skew the result.
> > 
> > Take both samples in succession, then discard values from affected
> > counters. This narrows the sampling interval used for CPPC feedback.
> > 
> > Signed-off-by: Beata Michalska <beata.michalska@arm.com>
> > ---
> >  arch/arm64/kernel/topology.c | 76 +++++++++++++++++++++++-------------
> >  1 file changed, 49 insertions(+), 27 deletions(-)
> > 
> > diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
> > index 66ac67bd025e..c968fa5b0c88 100644
> > --- a/arch/arm64/kernel/topology.c
> > +++ b/arch/arm64/kernel/topology.c
> > @@ -381,29 +381,45 @@ enum cpc_ffh_ctr_id {
> >  	CPC_FFH_CTR_CONST = 0x1,
> >  };
> >  
> > -static void cpu_read_corecnt(void *val)
> > +static inline void cpu_read_corecnt(void *val)
> >  {
> > -	/*
> > -	 * A value of 0 can be returned if the current CPU does not support AMUs
> > -	 * or if the counter is disabled for this CPU. A return value of 0 at
> > -	 * counter read is properly handled as an error case by the users of the
> > -	 * counter.
> > -	 */
> > -	*(u64 *)val = this_cpu_has_cap(ARM64_WORKAROUND_BROKEN_AMU_CORECNT) ?
> > -		0UL : read_corecnt();
> > +	*(u64 *)val = read_corecnt();
> >  }
> >  
> > -static void cpu_read_constcnt(void *val)
> > +static void cpu_try_read_corecnt(void *val)
> >  {
> > -	/*
> > -	 * Return 0 if the current CPU is affected by a HW erratum.
> > -	 * A value of 0 is also returned if the current CPU does not
> > -	 * support AMUs or if the counter is disabled. A return
> > -	 * value of 0 at counter read is properly handled as an error
> > -	 * case by the users of the counter.
> > -	 */
> > -	*(u64 *)val = this_cpu_has_cap(ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT) ?
> > -		      0UL : read_constcnt();
> > +	if (!this_cpu_has_cap(ARM64_WORKAROUND_BROKEN_AMU_CORECNT)) {
> > +		cpu_read_corecnt(val);
> > +	} else {
> > +		/*
> > +		 * A value of 0 can be returned if the current CPU does not support AMUs
> > +		 * or if the counter is disabled for this CPU. A return value of 0 at
> > +		 * counter read is properly handled as an error case by the users of the
> > +		 * counter.
> > +		 */
> > +		*(u64 *)val = 0UL;
> > +	}
> > +}
> > +
> > +static inline void cpu_read_constcnt(void *val)
> > +{
> > +	*(u64 *)val = read_constcnt();
> > +}
> > +
> > +static void cpu_try_read_constcnt(void *val)
> > +{
> > +	if (!this_cpu_has_cap(ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT)) {
> > +		cpu_read_constcnt(val);
> > +	} else {
> > +		/*
> > +		 * Return 0 if the current CPU is affected by a HW erratum.
> > +		 * A value of 0 is also returned if the current CPU does not
> > +		 * support AMUs or if the counter is disabled. A return
> > +		 * value of 0 at counter read is properly handled as an error
> > +		 * case by the users of the counter.
> > +		 */
> > +		*(u64 *)val = 0UL;
> > +	}
> >  }
> >  
> >  static inline
> > @@ -461,14 +477,20 @@ static void amu_read_core_const_ctrs(void *val)
> >  {
> >  	struct amu_ffh_ctrs *ctrs = val;
> >  
> > +	cpu_read_corecnt(&ctrs->corecnt);
> > +	cpu_read_constcnt(&ctrs->constcnt);
> > +
> >  	/*
> > -	 * cpu_read_constcnt() incurs slight latency due to the
> > -	 * ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT check.
> > -	 * Read it first to minimize the sampling skew between the const
> > -	 * and core counters.
> > +	 * Return 0 if the current CPU is affected by a HW erratum.
> > +	 * A value of 0 is also returned if the current CPU does not
> > +	 * support AMUs or if the counter is disabled. A return
> > +	 * value of 0 at counter read is properly handled as an error
> > +	 * case by the users of the counter.
> 
> Why do we read them first then on 
> ARM64_WORKAROUND_BROKEN_AMU_CORECNT or ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT
> respectively?
>
That's what this patch is all about - isn't it ?
It allows direct read of both counters (those being read first),
and only once that's done, it verifies whether the workaround should be applied
or not. For cores that do not have either it eliminates the check between
reading the counters.
Or you had smth else in mind I did not quite manage to grasp ?

---
BR
Beata
> >  	 */
> > -	cpu_read_constcnt(&ctrs->constcnt);
> > -	cpu_read_corecnt(&ctrs->corecnt);
> > +	if (this_cpu_has_cap(ARM64_WORKAROUND_BROKEN_AMU_CORECNT))
> > +		ctrs->corecnt = 0UL;
> > +	if (this_cpu_has_cap(ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT))
> > +		ctrs->constcnt = 0UL;
> >  }
> >  
> >  static bool cpc_ffh_reg_valid(const struct cpc_reg *reg)
> > @@ -543,10 +565,10 @@ int cpc_read_ffh(int cpu, struct cpc_reg *reg, u64 *val)
> >  
> >  	switch ((u64)reg->address) {
> >  	case CPC_FFH_CTR_CORE:
> > -		ret = counters_read_on_cpu(cpu, cpu_read_corecnt, val);
> > +		ret = counters_read_on_cpu(cpu, cpu_try_read_corecnt, val);
> >  		break;
> >  	case CPC_FFH_CTR_CONST:
> > -		ret = counters_read_on_cpu(cpu, cpu_read_constcnt, val);
> > +		ret = counters_read_on_cpu(cpu, cpu_try_read_constcnt, val);
> >  		break;
> >  	}
> >  
> 

