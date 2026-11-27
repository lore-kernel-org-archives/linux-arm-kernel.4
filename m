Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50E5A606A33B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 18:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1J88PFmK;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NDO6NmU+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=EkobH3yqYFHOtC9f87E5HTqak4ieERed4ic8RVwH7/E=; b=1J88PFmKyYIltouCVODNZs3kFO
	JG7RTal7hwwHVza4ODMVRNpf+bP1VHaEXht8+JvQlR1Mgzmql0jsRdPL3EVUQj30a//K2wzzURkx0
	kMwT1rzv5umQ9h8qGnzLGW1B2eMAjTr0PwE4r2l6tBC16mI/xm1329Xr8Nx1fSy8+tqwcMgkmdLmn
	wfG/9BySbry+jGrWSfAllSt9h2kFWrfM76K1QDB1Cov3hgrfNs484D2KBVat/iut484XsZZgp3kpp
	JGfrFTmr9kPu5vNVm1D6jjPUBRckgYhBw6TVP8QQUPIk4bJc8aFh0l5HuDJkX2+sXiUn9KZ++LOLZ
	rDMdx1pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX0uI-0000000HSPI-1Reu;
	Fri, 27 Nov 2026 18:42:50 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX0tm-0000000HSLG-2ly5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 18:42:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0E98161B5B;
	Fri, 27 Nov 2026 18:42:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E74FC1F00899;
	Fri, 27 Nov 2026 18:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795804937;
	bh=EkobH3yqYFHOtC9f87E5HTqak4ieERed4ic8RVwH7/E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NDO6NmU+VVjbIqtwzl0mJ0nT5Qf28Sw1bKhRU9UYbBsA1lT3RrEcCdLxnEJx/Al6n
	 BgRnaSuBZ9Dl7d0VmbQH2B1ki3EI1/xcHRai6KZJ4nrt+knM+EGYDcaN+IeDjnXKjd
	 yBMDov1nM8jOZ6ZD0gRVC+oPowtYfuqULP4o6fZQQP+rqiBHuIay0/zA0qBw8g/dh3
	 GRVW6946l/bwVX1hV8DPsYk/qETjLhW5/Oejw6hRjx+ckocl2xmInB625ORq9RD2d9
	 NQQ3iOb3sgxLL1w0Va+JyMc+oRrvrJjfTOJjRy4Rk6I+r2fduDjLZeB5y2vNaRIbVD
	 Huhi2xtfLHJCw==
Date: Fri, 27 Nov 2026 18:42:12 +0000
From: Will Deacon <will@kernel.org>
To: James Clark <james.clark@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Leo Yan <leo.yan@arm.com>,
	Suzuki Poulose <Suzuki.Poulose@arm.com>,
	Al Grant <Al.Grant@arm.com>, linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] perf: arm_spe: Factor HW discard mode out of
 arm_spe_perf_aux_output_begin()
Message-ID: <awnPBIbrS6rvrq9S@willie-the-truck>
References: <20260805-james-spe-software-discard-v1-0-0ff0e44c4c92@linaro.org>
 <20260805-james-spe-software-discard-v1-2-0ff0e44c4c92@linaro.org>
 <asNfh-qywjOPxajj@willie-the-truck>
 <9c5e1aa7-4e0f-4576-b322-b4594cdea5b0@linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9c5e1aa7-4e0f-4576-b322-b4594cdea5b0@linaro.org>
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 05, 2026 at 10:31:48AM +0100, James Clark wrote:
> 
> 
> On 05/10/2026 09:27, Will Deacon wrote:
> > On Wed, Aug 05, 2026 at 04:01:52PM +0100, James Clark wrote:
> > > Discard mode doesn't call perf_aux_output_begin() or emit aux records,
> > > and enabling it never fails. We'll add a second discard mode in the
> > > next commit so it will be cleaner if there is a separate begin function
> > > just for discard mode.
> > > 
> > > No functional changes intended.
> > 
> > [...]
> > 
> > > +static void arm_spe_pmu_begin_discard(struct perf_output_handle *handle,
> > > +				      struct perf_event *event)
> > > +{
> > > +	u64 limit;
> > > +
> > > +	limit = FIELD_PREP(PMBLIMITR_EL1_FM, PMBLIMITR_EL1_FM_DISCARD);
> > > +	limit |= PMBLIMITR_EL1_E;
> > > +
> > > +	write_sysreg_s(limit, SYS_PMBLIMITR_EL1);
> > > +}
> > > +
> > >   static int arm_spe_perf_aux_output_begin(struct perf_output_handle *handle,
> > >   					 struct perf_event *event)
> > >   {
> > >   	u64 base, limit;
> > >   	struct arm_spe_pmu_buf *buf;
> > 
> > Is it worth checking that we have a discard event in begin_discard() and
> > similarly that we don't have a discard event in output_begin()? It looks
> > like quite an error-prone interface for the caller, otherwise.
> > 
> 
> Makes sense, I can add that.
> 
> > > @@ -775,6 +785,12 @@ static irqreturn_t arm_spe_pmu_irq_handler(int irq, void *dev)
> > >   		arm_spe_pmu_disable_and_drain_local();
> > >   		break;
> > >   	case SPE_PMU_BUF_FAULT_ACT_OK:
> > > +		if (arm_spe_discard_mode(event)) {
> > > +			arm_spe_pmu_begin_discard(handle, event);
> > > +			isb();
> > > +			break;
> > > +		}
> > 
> > This looks like new behaviour?
> > 
> > Will
> 
> I just extracted the discard part of arm_spe_perf_aux_output_begin() into
> here and arm_spe_pmu_begin_discard(). The PMBLIMITR_EL1 write and isb()
> should be the same.
> 
> Do you mean that now it does arm_spe_pmu_begin_discard() unconditionally
> before checking PERF_AUX_FLAG_TRUNCATED? Truncated would never be set in HW
> discard mode, so it should be equivalent. And the IRQ would never fire
> anyway so we don't get here until SW discard is added, and even if it did,
> handle->event is NULL so the handler would exit on the first line anyway.

I'm just highlighing that this goes beyond what I would normally expect
when a commit messages says "No functional changes intended." since
you're adding unconditional register writes to the interrupt handler that
weren't there before. If it "should be equivalent" because the truncation
flag isn't set, then put this inside the existing conditional. In fact,
that would make the whole thing more readable anyway.

Will

