Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9B30606A321
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 12:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=C1zlz7XX;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=bbyGR6PF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=i4gW7Cly4GN/RaClACKVmImsihef+9xIzgbb6Z6X1Vw=; b=C1zlz7XXJ0ZpMrAnrVqs1YB2rX
	XUEV0pn5y/eWT8fYmj94jcRy3ufXP9kfTwUb9eOpadod3MYCWTbOuk9pbh0a9YzIsudpLgtS3OtUw
	h2WZ91lTBQZeZ980EY1PaGgyNdhpyyFqniqavOBo5t/PqjSwJZf3jHRGOzm28Mr/gnRqJJQ7pxLCC
	AvyVLaTGafw4luL8cjVWXoD1HqOSmpqkN5P8U3cmn3Q70vmLMTem5HzAKjVpvNJAoPsdE6YdubmHt
	Q0dS62ILPnCVqg/YZCkK0RA9ZtDxaSdE9Q7+OJ4Xp5ELhqJhPpF55qEnDHJuq2QessnappAzUNG+q
	o3KrAbfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRTke-00000009qER-3SZY;
	Thu, 12 Nov 2026 12:18:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRTkb-00000009qDK-0lI9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 12:17:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D573E1477;
	Thu, 12 Nov 2026 04:17:52 -0800 (PST)
Received: from arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B83B63F673;
	Thu, 12 Nov 2026 04:17:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794485875; bh=X0I/uay5++GC6f09O16wvseEm/aWOoXZGjNzwlonTQg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bbyGR6PFqloc+0zTLLcI1LclG3kj6uuNPAQ+ae7jnZzWWC3tPgH5lI1mv+A+ha8mZ
	 vMw/ccfbda5yIwMEdztZQA8GTk6lJ+hq1fUH7RoqT1QHve6GCGvVdHOSqlbMtdC0lC
	 Qa/ytMncoINpOkCsE5taFx3DcqFRtFzuBDwrO5CA=
Date: Thu, 12 Nov 2026 13:17:50 +0100
From: Beata Michalska <beata.michalska@arm.com>
To: Christian Loehle <christian.loehle@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, Vladimir.Murzin@arm.com,
	catalin.marinas@arm.com, will@kernel.org, suzuki.poulose@arm.com,
	xuewen.yan94@gmail.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: topology: Reduce the skew for AMU feedback
 counter sampling
Message-ID: <avWubiON1-XXNFVp@arm.com>
References: <20261111124005.2688820-1-beata.michalska@arm.com>
 <20261111124005.2688820-4-beata.michalska@arm.com>
 <45d9ce54-0f6f-46b0-aed6-de8d12b3d6de@arm.com>
 <avS2In7pb6A2XJaT@arm.com>
 <30ba2eb9-5fe4-4b8a-879d-0283a8388f28@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <30ba2eb9-5fe4-4b8a-879d-0283a8388f28@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_041757_318200_E4968851 
X-CRM114-Status: GOOD (  33.94  )
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

On Thu, Nov 12, 2026 at 09:10:28AM +0000, Christian Loehle wrote:
> On 11/11/26 18:38, Beata Michalska wrote:
> > Hi Christian,
> > On Wed, Nov 11, 2026 at 01:56:49PM +0000, Christian Loehle wrote:
> >> On 11/11/26 12:39, Beata Michalska wrote:
> >>> With the FFH support for CPPC, the AMU feedback counters, core and const
> >>> counter, are being sampled to measure CPU performance. Checking for errata
> >>> (which can affect both counters) between the reads delays the second
> >>> sample and can skew the result.
> >>>
> >>> Take both samples in succession, then discard values from affected
> >>> counters. This narrows the sampling interval used for CPPC feedback.
> >>>
> >>> Signed-off-by: Beata Michalska <beata.michalska@arm.com>
> >>> ---
> >>>  arch/arm64/kernel/topology.c | 76 +++++++++++++++++++++++-------------
> >>>  1 file changed, 49 insertions(+), 27 deletions(-)
> >>>
> >>> diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
> >>> index 66ac67bd025e..c968fa5b0c88 100644
> >>> --- a/arch/arm64/kernel/topology.c
> >>> +++ b/arch/arm64/kernel/topology.c
> >>> @@ -381,29 +381,45 @@ enum cpc_ffh_ctr_id {
> >>>  	CPC_FFH_CTR_CONST = 0x1,
> >>>  };
> >>>  
> >>> -static void cpu_read_corecnt(void *val)
> >>> +static inline void cpu_read_corecnt(void *val)
> >>>  {
> >>> -	/*
> >>> -	 * A value of 0 can be returned if the current CPU does not support AMUs
> >>> -	 * or if the counter is disabled for this CPU. A return value of 0 at
> >>> -	 * counter read is properly handled as an error case by the users of the
> >>> -	 * counter.
> >>> -	 */
> >>> -	*(u64 *)val = this_cpu_has_cap(ARM64_WORKAROUND_BROKEN_AMU_CORECNT) ?
> >>> -		0UL : read_corecnt();
> >>> +	*(u64 *)val = read_corecnt();
> >>>  }
> >>>  
> >>> -static void cpu_read_constcnt(void *val)
> >>> +static void cpu_try_read_corecnt(void *val)
> >>>  {
> >>> -	/*
> >>> -	 * Return 0 if the current CPU is affected by a HW erratum.
> >>> -	 * A value of 0 is also returned if the current CPU does not
> >>> -	 * support AMUs or if the counter is disabled. A return
> >>> -	 * value of 0 at counter read is properly handled as an error
> >>> -	 * case by the users of the counter.
> >>> -	 */
> >>> -	*(u64 *)val = this_cpu_has_cap(ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT) ?
> >>> -		      0UL : read_constcnt();
> >>> +	if (!this_cpu_has_cap(ARM64_WORKAROUND_BROKEN_AMU_CORECNT)) {
> >>> +		cpu_read_corecnt(val);
> >>> +	} else {
> >>> +		/*
> >>> +		 * A value of 0 can be returned if the current CPU does not support AMUs
> >>> +		 * or if the counter is disabled for this CPU. A return value of 0 at
> >>> +		 * counter read is properly handled as an error case by the users of the
> >>> +		 * counter.
> >>> +		 */
> >>> +		*(u64 *)val = 0UL;
> >>> +	}
> >>> +}
> >>> +
> >>> +static inline void cpu_read_constcnt(void *val)
> >>> +{
> >>> +	*(u64 *)val = read_constcnt();
> >>> +}
> >>> +
> >>> +static void cpu_try_read_constcnt(void *val)
> >>> +{
> >>> +	if (!this_cpu_has_cap(ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT)) {
> >>> +		cpu_read_constcnt(val);
> >>> +	} else {
> >>> +		/*
> >>> +		 * Return 0 if the current CPU is affected by a HW erratum.
> >>> +		 * A value of 0 is also returned if the current CPU does not
> >>> +		 * support AMUs or if the counter is disabled. A return
> >>> +		 * value of 0 at counter read is properly handled as an error
> >>> +		 * case by the users of the counter.
> >>> +		 */
> >>> +		*(u64 *)val = 0UL;
> >>> +	}
> >>>  }
> >>>  
> >>>  static inline
> >>> @@ -461,14 +477,20 @@ static void amu_read_core_const_ctrs(void *val)
> >>>  {
> >>>  	struct amu_ffh_ctrs *ctrs = val;
> >>>  
> >>> +	cpu_read_corecnt(&ctrs->corecnt);
> >>> +	cpu_read_constcnt(&ctrs->constcnt);
> >>> +
> >>>  	/*
> >>> -	 * cpu_read_constcnt() incurs slight latency due to the
> >>> -	 * ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT check.
> >>> -	 * Read it first to minimize the sampling skew between the const
> >>> -	 * and core counters.
> >>> +	 * Return 0 if the current CPU is affected by a HW erratum.
> >>> +	 * A value of 0 is also returned if the current CPU does not
> >>> +	 * support AMUs or if the counter is disabled. A return
> >>> +	 * value of 0 at counter read is properly handled as an error
> >>> +	 * case by the users of the counter.
> >>
> >> Why do we read them first then on 
> >> ARM64_WORKAROUND_BROKEN_AMU_CORECNT or ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT
> >> respectively?
> >>
> > That's what this patch is all about - isn't it ?
> 
> I thought it's about getting (all GCC 11.4 here)
> mrs x0, amevcntr00_el0
> str x0, [x19]
> mrs x0, amevcntr01_el0
> 
> instead of
> mrs     x1, amevcntr01_el0
> [100 instructions here...]
> mrs     x1, amevcntr00_el0
> 
> (before this patch)
> 
> > It allows direct read of both counters (those being read first),
> > and only once that's done, it verifies whether the workaround should be applied
> > or not. For cores that do not have either it eliminates the check between
> > reading the counters.
> > Or you had smth else in mind I did not quite manage to grasp ?
> 
> Something like:
> 
>     bool core_broken = this_cpu_has_cap(ARM64_WORKAROUND_BROKEN_AMU_CORECNT);
>     bool const_broken = this_cpu_has_cap(ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT);
> 
>     if (core_broken) {
>         ctrs->corecnt = 0;
>         ctrs->constcnt = const_broken ? 0 : read_constcnt();
>     } else if (const_broken) {
>         ctrs->corecnt = read_corecnt();
>         ctrs->constcnt = 0;
>     } else {
>         ctrs->corecnt = read_corecnt();
>         ctrs->constcnt = read_constcnt();
>     }
> 
> 
> gives us
> 
> mrs x0, amevcntr00_el0
> mrs x1, amevcntr01_el0
> stp x0, x1, [x19]
> 
> (for the non-broken case obviously)
Will update that to eliminate the pointless MRS case the workarounds are active.
Not that it will change anything, but will look better ? :)

---
BR
Beata

