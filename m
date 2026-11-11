Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A72F2606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 17:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=m/4Foblw;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Z3NEcnpz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=oHVW7jNgTo/7nIb4CmqK42I4MtbBzqJmNU5KyxcTUvE=; b=m/4FoblwqaaB8uKo3YgudJ95Vi
	8vcv1Glu4V8eFg+EJzVW0F0M6aI1/Eb/e7oHbDRW+BJj5TkWD+oPAYdUudjjmF35kv+5606VDf2OK
	9XXAG19pBBCd/M1AE1R3TFzlatfq7fI03M0DaJ+Id0Z8GiUDIiX/sSs4V5qgTVX/HjmS8vnqwGYMg
	PktArI+2pteLEXAyFYe01q47owIljzzKIq8gWBFGB0JFyc+zrZlUtusPNc7tJQ2bS2bf0yfgCTGE7
	PsBRs3BXTB7zTMqBi0W/F/R3Jc0GNaa0duTm5IwVl3tbud8AnTu3R6Ynuq2jV2OSD1xbf8hAIrgQY
	trSPPbXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRC0R-00000007I5T-0tCi;
	Wed, 11 Nov 2026 17:21:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRC0O-00000007I56-3OVW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 17:21:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BDC441576;
	Wed, 11 Nov 2026 09:21:00 -0800 (PST)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 87BAC3F632;
	Wed, 11 Nov 2026 09:21:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794417663; bh=Rf4ebtvltCctbkDc/Gv4WhpuRQ5MW6jqs73z5jo5cb0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z3NEcnpzN+rb8IhiTNoLslEyKdoUWksMEpnQHcWQAB7rr/bq5YHO2aUh9LZBJb9kZ
	 NVJ4FctJSnEOQvL9bv8EUE5im5n3NvHjBD2tLY/0pcjk8MmodxdQ9Z4LUMN0lfvE87
	 XlML061p/+aCR23TsCURNUlK6CPGFo+EFvOdFTcc=
Date: Wed, 11 Nov 2026 17:20:08 +0000
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: maz@kernel.org, oupton@kernel.org, fuad.tabba@linux.dev,
	joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, will@kernel.org, mark.rutland@arm.com,
	linux-perf-users@vger.kernel.org, catalin.marinas@arm.com,
	james.clark@linaro.org
Subject: Re: [RFC PATCH v7 05/28] perf: arm_spe_pmu: Add PMBIDR_EL1 and
 PMSIDR_EL1 to struct arm_spe_pmu
Message-ID: <avSjyLhFsYjI7tG_@raptor>
References: <20260903160623.315525-1-alexandru.elisei@arm.com>
 <20260903160623.315525-6-alexandru.elisei@arm.com>
 <atDmDRSNDllpJtmL@gremlin>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <atDmDRSNDllpJtmL@gremlin>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_092104_958347_9C26625F 
X-CRM114-Status: GOOD (  33.36  )
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

Hi,

On Thu, Oct 15, 2026 at 04:12:27PM +0100, Lorenzo Stoakes (ARM) wrote:
> I think probably some kind of commit message would be good even for a
> trivial change :)

Of course, I'll add something here.

> 
> On Thu, Sep 03, 2026 at 05:06:00PM +0100, Alexandru Elisei wrote:
> > Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> > ---
> >  drivers/perf/arm_spe_pmu.c       | 3 +++
> >  include/linux/perf/arm_spe_pmu.h | 2 ++
> >  2 files changed, 5 insertions(+)
> >
> > diff --git a/drivers/perf/arm_spe_pmu.c b/drivers/perf/arm_spe_pmu.c
> > index 79c571a649d5..42ba0924bd02 100644
> > --- a/drivers/perf/arm_spe_pmu.c
> > +++ b/drivers/perf/arm_spe_pmu.c
> > @@ -1095,6 +1095,7 @@ static void __arm_spe_pmu_dev_probe(void *info)
> >  			"profiling buffer owned by higher exception level\n");
> >  		return;
> >  	}
> > +	spe_pmu->pmbidr_el1 = reg;
> 
> This doesn't seem to be used anywhere in the series?

Indeed, that's a leftover from the previous iterations, will remove.

> 
> >
> >  	/* Minimum alignment. If it's out-of-range, then fail the probe */
> >  	fld = FIELD_GET(PMBIDR_EL1_ALIGN, reg);
> > @@ -1107,6 +1108,8 @@ static void __arm_spe_pmu_dev_probe(void *info)
> >
> >  	/* It's now safe to read PMSIDR and figure out what we've got */
> >  	reg = read_sysreg_s(SYS_PMSIDR_EL1);
> > +	spe_pmu->pmsidr_el1 = reg;
> > +
> >  	if (FIELD_GET(PMSIDR_EL1_FE, reg))
> >  		spe_pmu->features |= SPE_PMU_FEAT_FILT_EVT;
> >
> > diff --git a/include/linux/perf/arm_spe_pmu.h b/include/linux/perf/arm_spe_pmu.h
> > index af86fd184050..97b14e236fcd 100644
> > --- a/include/linux/perf/arm_spe_pmu.h
> > +++ b/include/linux/perf/arm_spe_pmu.h
> > @@ -21,6 +21,8 @@ struct arm_spe_pmu {
> >  	cpumask_t				supported_cpus;
> >  	struct hlist_node			hotplug_node;
> >
> > +	u64					pmbidr_el1;
> 
> Equally, this doesn't seem to be used anywhere in the series, maybe drop?

Fixed.

> 
> > +	u64					pmsidr_el1;
> 
> This field is used in kvm_spe_has_feat_spe_fds() and
> kvm_spe_has_feat_spe_fne():
> 
> bool kvm_spe_has_feat_spe_fds(struct kvm *kvm)
> {
> 	...
> 	return kvm_has_feat(kvm, ID_AA64DFR0_EL1, PMSVer, V1P4) &&
> 	       FIELD_GET(PMSIDR_EL1_FDS, spe_pmu->pmsidr_el1);
> }
> 
> bool kvm_spe_has_feat_spe_fne(struct kvm *kvm)
> {
> 	...
> 	return kvm_has_feat(kvm, ID_AA64DFR0_EL1, PMSVer, V1P2) &&
> 	       FIELD_GET(PMSIDR_EL1_FnE, spe_pmu->pmsidr_el1);
> }
> 
> So checking for FDS and FnE, but these are available as feature flags as
> __arm_spe_pmu_dev_probe() gets these:
> 
> static void __arm_spe_pmu_dev_probe(void *info)
> {
> 	...
> 	if (FIELD_GET(PMSIDR_EL1_FnE, reg))
> 		spe_pmu->features |= SPE_PMU_FEAT_INV_FILT_EVT;
> 	...
> 	if (FIELD_GET(PMSIDR_EL1_FDS, reg))
> 		spe_pmu->features |= SPE_PMU_FEAT_FDS;
> 	...
> }
> 
> And then kvm_spe_has_feat_spe_fds() and kvm_spe_has_feat_spe_fne() can be:
> 
> bool kvm_spe_has_feat_spe_fds(struct kvm *kvm)
> {
> 	...
> 	return kvm_has_feat(kvm, ID_AA64DFR0_EL1, PMSVer, V1P4) &&
> 	       (spe_pmu->features & SPE_PMU_FEAT_FDS);
> }
> 
> bool kvm_spe_has_feat_spe_fne(struct kvm *kvm)
> {
> 	...
> 	return kvm_has_feat(kvm, ID_AA64DFR0_EL1, PMSVer, V1P2) &&
> 	       (spe_pmu->features & SPE_PMU_FEAT_INV_FILT_EVT);
> }
> 
> Right?

In this use case they are functionally the same, yes, but conceptually, they are
not the same thing. spe_pmu->features advertises the features that the SPE
*driver* supports, PMSIDR_EL1 advertises the features that the *hardware*
implements. The two are not always equal.  For example, KVM added handling for
the PMSNEVFR_EL1 register (added by FEAT_SPE_FnE), a few years before the SPE
driver supported FEAT_SPE_FnE.

I can see KVM, in the future, having to virtualize hardware features not
supported by the host driver yet, so unless you have a strong objection, I would
rather keep the use of the architectural register instead of relying on the
driver.

> 
> So it seems you could drop this patch from the series in general? Is there
> another reason to get these fields?
> 
> Also - there seems to be a divergence in the naming there between FnE and
> INV_FILT_EVT, is that intentional?

I think that's a question for the person who added FEAT_PMU_FEAT_INV_FILT_EVT?

Thanks,
Alex

