Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F42606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 15:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KMVviv4U;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=G0oE+4R9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=trMeZ3I6wSRpel42gaDmvuE0j0JJNvQaWvB9cfT9V8g=; b=KMVviv4UkIiGfKDHGZNNUzFaei
	McYSnhWHbQsde0uz6b+YVX8RRLSeIKXnytdjbF7xZWnu3iufIVnjgxHE0G4yA/kr2bxcozv79mPGG
	xdMU9NgJmw1CI1FItTjPj0ljWhu94shFG9mfnVhxtxQdToe+O/OtsSRcO5Bod5WdO2fs0RWhw2lIr
	hZT6K70Vdg2wus33DycE1MjySQ5e2h60TkYpgENqQBCCjSKIwydBQTuK3iQXwI30iISyFlj/gkcBP
	GxQhsl/QfZwTWsgRSxYU/BTc/C7lXPoqfzR3nnAMiE62ioibSVzsFOXOP21CQ3XQpoMFHkl4rwo7X
	tGalgCPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxR9-0000000GgF4-0VpM;
	Fri, 27 Nov 2026 15:00:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxQc-0000000Gg7T-1Eq3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 14:59:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A9E92169E;
	Fri, 27 Nov 2026 06:59:54 -0800 (PST)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DE0C63F86C;
	Fri, 27 Nov 2026 06:59:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795791597; bh=Guj4qq8KsMECYr2/fFBhn4O8fhKzRg2BkXrLBTo0Gb4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G0oE+4R90vGvAvd4EPODqjyWNz4FYDuvIubkX8g5SfO3rpfIpzY4gTODCV4SjonTe
	 b6Zx4iyimFZdZhM1LRqeYCIRqxuzun00cZsPUYxguVUmqgqGA0SIzSNOR4Fg0nYiIa
	 n7sT3zjvR5Oy8TYYnGNh/iinR8xg0IapWkQMpKrM=
Date: Fri, 27 Nov 2026 14:59:50 +0000
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
Message-ID: <awma5sGHkk3LqlC-@raptor>
References: <20260903160623.315525-1-alexandru.elisei@arm.com>
 <20260903160623.315525-6-alexandru.elisei@arm.com>
 <atDmDRSNDllpJtmL@gremlin>
 <avSjyLhFsYjI7tG_@raptor>
 <avtDK5rtD38jnhqR@gremlin>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <avtDK5rtD38jnhqR@gremlin>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_065958_425989_57BABB87 
X-CRM114-Status: GOOD (  29.45  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Lorenzo,

On Mon, Nov 16, 2026 at 05:56:28PM +0000, Lorenzo Stoakes (ARM) wrote:
> On Wed, Nov 11, 2026 at 05:20:08PM +0000, Alexandru Elisei wrote:
[..]
> > On Thu, Oct 15, 2026 at 04:12:27PM +0100, Lorenzo Stoakes (ARM) wrote:
[..]
> > > On Thu, Sep 03, 2026 at 05:06:00PM +0100, Alexandru Elisei wrote:
[..]
> > > > diff --git a/include/linux/perf/arm_spe_pmu.h b/include/linux/perf/arm_spe_pmu.h
> > > > index af86fd184050..97b14e236fcd 100644
> > > > --- a/include/linux/perf/arm_spe_pmu.h
> > > > +++ b/include/linux/perf/arm_spe_pmu.h
> > > > @@ -21,6 +21,8 @@ struct arm_spe_pmu {
> > > >  	cpumask_t				supported_cpus;
> > > >  	struct hlist_node			hotplug_node;
> > > >
> > > > +	u64					pmbidr_el1;
> > >
> > > Equally, this doesn't seem to be used anywhere in the series, maybe drop?
> >
> > Fixed.
> >
> > >
> > > > +	u64					pmsidr_el1;
> > >
> > > This field is used in kvm_spe_has_feat_spe_fds() and
> > > kvm_spe_has_feat_spe_fne():
> > >
> > > bool kvm_spe_has_feat_spe_fds(struct kvm *kvm)
> > > {
> > > 	...
> > > 	return kvm_has_feat(kvm, ID_AA64DFR0_EL1, PMSVer, V1P4) &&
> > > 	       FIELD_GET(PMSIDR_EL1_FDS, spe_pmu->pmsidr_el1);
> > > }
> > >
> > > bool kvm_spe_has_feat_spe_fne(struct kvm *kvm)
> > > {
> > > 	...
> > > 	return kvm_has_feat(kvm, ID_AA64DFR0_EL1, PMSVer, V1P2) &&
> > > 	       FIELD_GET(PMSIDR_EL1_FnE, spe_pmu->pmsidr_el1);
> > > }
> > >
> > > So checking for FDS and FnE, but these are available as feature flags as
> > > __arm_spe_pmu_dev_probe() gets these:
> > >
> > > static void __arm_spe_pmu_dev_probe(void *info)
> > > {
> > > 	...
> > > 	if (FIELD_GET(PMSIDR_EL1_FnE, reg))
> > > 		spe_pmu->features |= SPE_PMU_FEAT_INV_FILT_EVT;
> > > 	...
> > > 	if (FIELD_GET(PMSIDR_EL1_FDS, reg))
> > > 		spe_pmu->features |= SPE_PMU_FEAT_FDS;
> > > 	...
> > > }
> > >
> > > And then kvm_spe_has_feat_spe_fds() and kvm_spe_has_feat_spe_fne() can be:
> > >
> > > bool kvm_spe_has_feat_spe_fds(struct kvm *kvm)
> > > {
> > > 	...
> > > 	return kvm_has_feat(kvm, ID_AA64DFR0_EL1, PMSVer, V1P4) &&
> > > 	       (spe_pmu->features & SPE_PMU_FEAT_FDS);
> > > }
> > >
> > > bool kvm_spe_has_feat_spe_fne(struct kvm *kvm)
> > > {
> > > 	...
> > > 	return kvm_has_feat(kvm, ID_AA64DFR0_EL1, PMSVer, V1P2) &&
> > > 	       (spe_pmu->features & SPE_PMU_FEAT_INV_FILT_EVT);
> > > }
> > >
> > > Right?
> >
> > In this use case they are functionally the same, yes, but conceptually, they are
> > not the same thing. spe_pmu->features advertises the features that the SPE
> > *driver* supports, PMSIDR_EL1 advertises the features that the *hardware*
> > implements. The two are not always equal.  For example, KVM added handling for
> > the PMSNEVFR_EL1 register (added by FEAT_SPE_FnE), a few years before the SPE
> > driver supported FEAT_SPE_FnE.
> >
> > I can see KVM, in the future, having to virtualize hardware features not
> > supported by the host driver yet, so unless you have a strong objection, I would
> > rather keep the use of the architectural register instead of relying on the
> > driver.
> 
> Ack OK, sounds sensible, no strong objection but could you add a sentence to the
> commit msg about that? Thanks! :)

Done.

Thanks,
Alex

