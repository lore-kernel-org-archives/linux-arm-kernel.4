Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6406606A323
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 12:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1YcPfZxW;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Rp3Jtoi1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=i1WLpvyK/v+i/pOtJSHSm4Vqyb8jtIS3Jmom1fb7ALI=; b=1YcPfZxWtiGcHBP88tMS3LyjA5
	6Jga2G971a3Zm6cPs99WaWDJpAJxm+Iw33Ixfj91sgeTPxQ3Z8UgTBcptnpuMlk8qwV8e5OUvoTSi
	y3i3FMopoDAu+QTb/bssw+WC0hzkCT7ipLPnJrnOedDVm3GsoGLzCxn8eDWlt6+f2g8MGMs8znm3q
	QzDmHynlFTUtYBl3jgbGq6A2o3ZPONJeV6asJgt+i2iyCrVVVEan060YtCEN/vgehBL3oB/xoovcu
	SmHepAtWyjV3bUkR8cCoPY9UqfgWDPGGFZhFxJIgbnPqL13rae6QTJ1r/6QvQ3sKxdXqrDW2CeaEV
	SG6771BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRTa8-00000009oXx-2Sad;
	Thu, 12 Nov 2026 12:07:08 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRTa5-00000009oX1-2l6Z
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 12:07:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 631E01477;
	Thu, 12 Nov 2026 04:07:01 -0800 (PST)
Received: from arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5E7253F673;
	Thu, 12 Nov 2026 04:07:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794485224; bh=+Zq51Kz78ZcESlxGtDuYhCkAPFG6+77j8JOduwbmW/w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Rp3Jtoi17XVB3tTXx6sYL2M4C9CCBMwX9FQjfS9ahiI2R3Qr5oIEO6wGPdWCQPxMJ
	 GjIuydKL8TVA58sF8F1IqDSZkSWMXwLWoCaw5vNKeqGdWI+VxZILL0DP1xydY6Hhp+
	 pdLqQ2QGmTllL3nFiRBgelr+A6UWIWloG363MBhs=
Date: Thu, 12 Nov 2026 13:06:54 +0100
From: Beata Michalska <beata.michalska@arm.com>
To: Christian Loehle <christian.loehle@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, Vladimir.Murzin@arm.com,
	catalin.marinas@arm.com, will@kernel.org, suzuki.poulose@arm.com,
	xuewen.yan94@gmail.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: topology: Reduce the skew for AMU feedback
 counter sampling
Message-ID: <avWr3hEq-XNHuLGs@arm.com>
References: <20261111124005.2688820-1-beata.michalska@arm.com>
 <20261111124005.2688820-4-beata.michalska@arm.com>
 <1493f335-a808-471f-932a-393aaa390d25@arm.com>
 <avS3CJI82z3xDQQT@arm.com>
 <10a9170d-9ec7-46be-ad0f-d364c65563cd@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <10a9170d-9ec7-46be-ad0f-d364c65563cd@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_040705_806110_8BD773AC 
X-CRM114-Status: GOOD (  22.41  )
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

On Thu, Nov 12, 2026 at 09:22:46AM +0000, Christian Loehle wrote:
> On 11/11/26 18:42, Beata Michalska wrote:
> > On Wed, Nov 11, 2026 at 02:08:11PM +0000, Christian Loehle wrote:
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
> >>
> >> Since you're moving this comment around, AFAICT it's not actually true?
> >> cpu_has_amu_feat() is checked (which will return -EOPNOTSUPP) before
> >> landing here, right?
> >>
> > Not entirely, no.
> > `cpu_has_amu_feat()` verifies the support for AMUs, the extension itself
> > (ID_AA64PFR0_EL1). Workarounds are applied on top of it.
> 
> Right, I was only referring to:
> "A value of 0 is also returned if the current CPU does not support AMUs[...]"
Ahh, right, this needs to be fixed. Will send v2 with this comment updated.
Thanks.

---
BR
Beata
> 
> > [snip]
> 

