Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CD64606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 15:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nwVic9P5;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=cvI/KY++
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=8UzSE5s19hmDLWKrvHWQ929kQ9lOeg6Wx1lbFsCH0T8=; b=nwVic9P5Cl4biBkfWUNKlw2k72
	yRwan7hG2zRgG0VOrxr5M9iCzFaQ3NyFzHKRLyIyDEE17RZdWQ+2Mr2bfeR/t/iO+fJmnzsxGodqF
	ulC/WnUhPL5xrB54ghuPvw4cBP4Yrs3a5RwBm8SLODvQHEqX/k47wlpRDVUYI6POADr6trz+TKm3E
	m3Pa8JQ8XbUaWBfex9bIYGm9lZEdFOXE0LDDwb6gSZi9ks5XdAymn3pSzjWCBoEv9jT5EehqaloL/
	UgSdEp/t0Ds4+D0em+bozLUO9F+9zuMrJ5joHWmdrgt8cE2bVd3CY3Tzfu++5+DhEBPSTn5lz8D81
	6inFsrmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxb2-0000000GhtW-0iXw;
	Fri, 27 Nov 2026 15:10:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxat-0000000GhrA-3EKc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 15:10:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B9B5F169E;
	Fri, 27 Nov 2026 07:10:31 -0800 (PST)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A7E393F632;
	Fri, 27 Nov 2026 07:10:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795792234; bh=m/nbdcGqKkeJN9d3QUnWCROPJi+91iueJPuEGYf787c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cvI/KY++KjF3uEu/jxp/dzyNfQ0qHncVM8FPivKsdCafuYH5d+NSbfrTXgVQ09min
	 9Poy30OtdmHTpN/3efttaAGjKzRrByXF4FaeTro6IggIVhmGe/CkV25E6pKYsI2gR4
	 WeXaiFN4F9wdKkVyiHYLE9/m4XS7rxyAjz6OX4jU=
Date: Fri, 27 Nov 2026 15:10:28 +0000
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: maz@kernel.org, oupton@kernel.org, fuad.tabba@linux.dev,
	joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, will@kernel.org, mark.rutland@arm.com,
	linux-perf-users@vger.kernel.org, catalin.marinas@arm.com,
	james.clark@linaro.org
Subject: Re: [RFC PATCH v7 13/28] KVM: arm64: Add SPE VCPU device attribute
 to set the SPE device
Message-ID: <awmdZLXCSa8fBtJw@raptor>
References: <20260903160623.315525-1-alexandru.elisei@arm.com>
 <20260903160623.315525-14-alexandru.elisei@arm.com>
 <auHUUHYtQXg0imDt@gremlin>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <auHUUHYtQXg0imDt@gremlin>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_071040_640220_865A89BE 
X-CRM114-Status: GOOD (  69.38  )
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

On Wed, Oct 28, 2026 at 01:11:54PM +0000, Lorenzo Stoakes (ARM) wrote:
> On Thu, Sep 03, 2026 at 05:06:08PM +0100, Alexandru Elisei wrote:
> > To support systems where there is more than one SPE instance, or where not
> > all the PEs have SPE, add KVM_ARM_VCPU_SPE_CTRL(KVM_ARM_VCPU_SPE_ID) for
> > userspace to set the SPE instance it wants the virtual machine to use.
> > Similar to the PMU, it is entirely up to userspace to make sure the VCPUs
> > are run only on the physical CPUs which share this SPE instance.
> 
> OK but this is enforced by KVM right? So while it's up to userspace to
> ensure affinity, this is checked for and if the user gets it wrong KVM will
> bail AFAICT?

Yes.

> 
> So I'd probably add something here about what happens if you don't do this
> - i.e. 'this is checked on vCPU load via kvm_arch_vcpu_load(), and if the
> CPU does not share the SPE instance specified, KVM will eventually error
> out to userspace.'

Ok.

> 
> >
> > If the ioctl is called for multiple VCPUs, userspace must use the same
> > SPE identifier for each of the VCPUs.
> >
> > Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> > ---
> >  Documentation/virt/kvm/devices/vcpu.rst | 32 +++++++++
> >  arch/arm64/include/asm/kvm_host.h       |  4 ++
> >  arch/arm64/include/asm/kvm_spe.h        | 19 ++++++
> >  arch/arm64/include/uapi/asm/kvm.h       |  1 +
> >  arch/arm64/kvm/arm.c                    | 43 ++++++++++++
> >  arch/arm64/kvm/pmu-emul.c               | 11 ++-
> >  arch/arm64/kvm/spe.c                    | 90 +++++++++++++++++++++++++
> >  7 files changed, 198 insertions(+), 2 deletions(-)
> >
> > diff --git a/Documentation/virt/kvm/devices/vcpu.rst b/Documentation/virt/kvm/devices/vcpu.rst
> > index d30b2f7fec9a..d60dd1daa67f 100644
> > --- a/Documentation/virt/kvm/devices/vcpu.rst
> > +++ b/Documentation/virt/kvm/devices/vcpu.rst
> > @@ -329,3 +329,35 @@ Specifies the Profiling Buffer management interrupt number. The interrupt number
> >  must be a PPI and the interrupt number must be the same for each VCPU. Arm
> >  recommends 21 as the interrupt number. SPE virtualization requires an in-kernel
> >  vGIC implementation.
> > +
> > +5.2 ATTRIBUTE: KVM_ARM_VCPU_SPE_ID
> > +------------------------------------------
> > +
> > +:Parameters: in kvm_device_attr.addr the address to an int representing the SPE
> > +             identifier.
> > +
> > +:Returns:
> 
> Hmm this is a nit obviously but this is inconsistent from the previous doc
> edit which uses 'Returns:' so I think better to choose one and stick with
> it :)

I have chosen 'Returns:'.

> 
> > +
> > +	 =======  =========================================================
> > +	 -EBUSY   Virtual machine has already run
> > +	 -EFAULT  Error accessing the SPE identifier
> > +	 -EINVAL  A different SPE instance already assigned, or no physical
> > +                  CPUs found
> 
> With the introduction of kvm_update_supported_cpus() and PMU also using
> that, I think you need to add an -EINVAL line to the PMU doc entry too.

Will do.

> 
> > +	 -ENXIO   SPE not supported or not properly configured, or the SPE
> > +                  module not loaded
> > +	 -ENODEV  KVM_ARM_VCPU_HAS_SPE VCPU feature not set
> 
> Should be KVM_ARM_VCPU_SPE? Looking back I think you also typo'd this in
> the previous commit? Very easily done obviously :P

Yeah, I kept going back and forth on the names.

> 
> > +	 =======  =========================================================
> > +
> > +Required.
> > +
> > +Request that the VCPU uses the specified SPE instance. The SPE identifier can be
> > +read from the 'type' file for the desired SPE instance under /sys/devices (or,
> > +equivalent, /sys/bus/event_source). Must be set for at least one VCPU, in which
> > +case all the other VCPUs will use the same SPE instance. Once a SPE instance has
> > +been set, attempting to set a different one will result in an error.
> > +
> 
> I think you need a paragraph here to explain that you must ensure that
> physical CPUs assigned to vCPUs must share the same SPE instance, and
> failing to do so will result in KVM returning an error when the vCPU is
> attempted to be run.

Ok.

> 
> > +Similar to KVM_ARM_VCPU_PMU_V3_CTRL(KVM_ARM_VCPU_PMU_SET_PMU), userspace is
> > +responsible for making sure that the VCPU is run only on physical CPUs which
> > +share the specified SPE instance. If the VCPU has a PMU assigned, and there are
> 
> I think the 'userspace is responsible for making sure that the VCPU is run
> only on physical CPUs which share the specified SPE instance' bit can be
> hoisted into the suggested paragraph above, leaving this one to focus on
> SPE/PMU interactions.
> 
> And I think the SPE-specific bit shouldn't mention a similarity to PMU, I
> think that's confusing in itself.

Ok.

> 
> > +no physical CPUs which share the same SPE and PMU instance, an error is
> > +returned.
> 
> This is overall unclear I think. It starts with 'similar to PMU' then
> mentions an actual interaction between PMU/SPE. So, as above, I suggest
> separating these two out.
> 
> And here I think you should be a lot clearer about that PMU/SPE
> interaction, something like:
> 
> "Both SPE and PMU restrict supported physical CPUs to the subset which
> share the selected SPE or PMU instance.
> 
> If both are selected, the subsets must overlap, otherwise there would be no
> physical CPU on which the vCPUs could run.
> 
> If this happens, whichever of KVM_ARM_VCPU_SPE_ID or
> KVM_ARM_VCPU_PMU_V3_SET_PMU specified it returns -EINVAL.
> 
> Note that the default PMU selected by KVM is not taken into account by this
> check, it only applies when a specific PMU instance has been selected via
> KVM_ARM_VCPU_PMU_V3_SET_PMU."

Ok.

> 
> > diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> > index e7332bd82bf3..10fa223bdbda 100644
> > --- a/arch/arm64/include/asm/kvm_host.h
> > +++ b/arch/arm64/include/asm/kvm_host.h
> > @@ -382,6 +382,7 @@ struct kvm_arch {
> >  	 */
> >  	unsigned long *pmu_filter;
> >  	struct arm_pmu *arm_pmu;
> > +	struct kvm_spe kvm_spe;
> 
> I think we can do away with the kvm_ prefix on the value name?

I don't see a reason to change it.

This is an **RFC**, and I would rather we focus on the general approach and on
correctness, and leave variable name changes that propagate to almost all
remaining patches for when the series stabilizes.

> 
> >
> >  	cpumask_var_t supported_cpus;
> >
> > @@ -1499,6 +1500,9 @@ void kvm_vcpu_put_vhe(struct kvm_vcpu *vcpu);
> >  int __init kvm_set_ipa_limit(void);
> >  u32 kvm_get_pa_bits(struct kvm *kvm);
> >
> > +int kvm_update_supported_cpus(struct kvm *kvm, cpumask_t *pmu_cpus,
> > +			      cpumask_t *spe_cpus);
> > +
> >  #define __KVM_HAVE_ARCH_VM_ALLOC
> >  struct kvm *kvm_arch_alloc_vm(void);
> >
> > diff --git a/arch/arm64/include/asm/kvm_spe.h b/arch/arm64/include/asm/kvm_spe.h
> > index 8ded2d821bff..b8afb419c851 100644
> > --- a/arch/arm64/include/asm/kvm_spe.h
> > +++ b/arch/arm64/include/asm/kvm_spe.h
> > @@ -11,6 +11,11 @@ struct kvm_vcpu;
> >  struct kvm_device_attr;
> >
> >  #ifdef CONFIG_KVM_ARM_SPE
> > +struct arm_spe_pmu;
> > +struct kvm_spe {
> > +	struct arm_spe_pmu *spe_pmu;
> 
> I feel like 'spe_pmu' as a name is pretty confusing as there is PMU as
> regards the perf driver thing, which SPE is implemented as, and also the
> general PMUv3 architecture :)
> 
> Maybe the _pmu suffix makes sense then on the type (which has to be a
> performance monitoring unit driver), but could we replace '_pmu' with
> '_instance' in the field, etc. names?

The driver that KVM depends on calls it a spe_pmu, and this comes directly from
the driver. I think the name is appropriate.

> 
> > +};
> 
> This looks a little silly as a one field struct, but presumably because you
> add more later. I think worth saying so in the commit message?

I don't think it's worth it.

> 
> > +
> >  struct kvm_vcpu_spe {
> >  	int irq_num;		/* Buffer management interrupt number */
> >  };
> > @@ -20,10 +25,17 @@ bool kvm_supports_spe(void);
> >  #define vcpu_has_spe(vcpu)					\
> >  	(vcpu_has_feature(vcpu, KVM_ARM_VCPU_SPE))
> >
> > +void kvm_spe_destroy_vm(struct kvm *kvm);
> 
> This naming feels weird, reads to me like 'spe, destroy the vm' which is
> probably not the intent :P

I see your point.

> 
> Maybe just kvm_spe_destroy()?

I have changed it to kvm_destroy_vm_spe(kvm).

> 
> > +
> >  int kvm_spe_set_attr(struct kvm_vcpu *vcpu, struct kvm_device_attr *attr);
> >  int kvm_spe_get_attr(struct kvm_vcpu *vcpu, struct kvm_device_attr *attr);
> >  int kvm_spe_has_attr(struct kvm_vcpu *vcpu, struct kvm_device_attr *attr);
> > +
> > +bool kvm_spe_pmu_set(struct kvm *kvm);
> >  #else
> > +struct kvm_spe {
> > +};
> > +
> >  struct kvm_vcpu_spe {
> >  };
> >
> > @@ -34,6 +46,9 @@ static __always_inline bool kvm_supports_spe(void)
> >
> >  #define vcpu_has_spe(vcpu)	false
> >
> > +static inline void kvm_spe_destroy_vm(struct kvm *kvm)
> > +{
> > +}
> >  static inline int kvm_spe_set_attr(struct kvm_vcpu *vcpu, struct kvm_device_attr *attr)
> >  {
> >  	return -ENXIO;
> > @@ -46,6 +61,10 @@ static inline int kvm_spe_has_attr(struct kvm_vcpu *vcpu, struct kvm_device_attr
> >  {
> >  	return -ENXIO;
> >  }
> > +static inline bool kvm_spe_pmu_set(struct kvm *kvm)
> > +{
> > +	return false;
> > +}
> >  #endif /* CONFIG_KVM_ARM_SPE */
> >
> >  #endif /* __ARM64_KVM_SPE_H__ */
> > diff --git a/arch/arm64/include/uapi/asm/kvm.h b/arch/arm64/include/uapi/asm/kvm.h
> > index b9e5019181eb..8ffa3e89d38c 100644
> > --- a/arch/arm64/include/uapi/asm/kvm.h
> > +++ b/arch/arm64/include/uapi/asm/kvm.h
> > @@ -448,6 +448,7 @@ enum {
> >  #define   KVM_ARM_VCPU_PVTIME_IPA	0
> >  #define KVM_ARM_VCPU_SPE_CTRL		3
> >  #define   KVM_ARM_VCPU_SPE_IRQ		0
> > +#define   KVM_ARM_VCPU_SPE_ID		1
> >
> >  /* KVM_IRQ_LINE irq field index values */
> >  #define KVM_ARM_IRQ_VCPU2_SHIFT		28
> > diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> > index 763b102dc51f..132df44c3088 100644
> > --- a/arch/arm64/kvm/arm.c
> > +++ b/arch/arm64/kvm/arm.c
> > @@ -336,6 +336,8 @@ void kvm_arch_destroy_vm(struct kvm *kvm)
> >  	kfree(kvm->arch.sysreg_masks);
> >  	kvm_destroy_vcpus(kvm);
> >
> > +	kvm_spe_destroy_vm(kvm);
> > +
> >  	kvm_unshare_hyp(kvm, kvm + 1);
> >
> >  	kvm_arm_teardown_hypercalls(kvm);
> > @@ -612,6 +614,47 @@ void kvm_arch_vcpu_unblocking(struct kvm_vcpu *vcpu)
> >
> >  }
> >
> > +int kvm_update_supported_cpus(struct kvm *kvm, cpumask_t *pmu_cpus,
> > +			      cpumask_t *spe_cpus)
> 
> This interface is really awkward - it's unclear whether you need to pass
> one + other NULL, or both, and what happens in each situation.

Yeah, it's not great, I'll try to make it better.

> 
> And it turns out that actually you should only specify one of them with the
> other NULL as it stands.
> 
> It seems to me SPE vs. PMU is just immaterial here, and you should simply
> have:
> 
> int kvm_restrict_supported_cpus(struct kvm *kvm, const cpumask_t *mask)
> {
> 	lockdep_assert_held(&kvm->arch.config_lock);
> 
> 	if (!cpumask_intersects(kvm->arch.supported_cpus, mask))
> 		return -EINVAL;
> 
> 	cpumask_and(kvm->arch.supported_cpus, kvm->arch.supported_cpus, mask);
> 	return 0;
> }
> 
> Then all the complexity goes away.
> 
> I think it's then simplest to simply disallow re-selection for both SPE and
> PMU, returning -EBUSY if they're already selected.
> 
> That way it's very clear-cut - you set these once and only once.

I don't think it's a good idea to introduce a potentially userspace breaking
change because you don't like the code.

If you feel strongly about it, you can send a patch right now to forbid
userspace from changing the PMU.

[..]
> 
> > +
> >  static int kvm_arm_pmu_v3_set_pmu(struct kvm_vcpu *vcpu, int pmu_id)
> >  {
> >  	struct kvm *kvm = vcpu->kvm;
> > @@ -1104,8 +1109,11 @@ static int kvm_arm_pmu_v3_set_pmu(struct kvm_vcpu *vcpu, int pmu_id)
> >  				break;
> >  			}
> >
> > +			ret = kvm_pmu_update_supported_cpus(kvm, &arm_pmu->supported_cpus);
> > +			if (ret)
> > +				break;
> >  			kvm_arm_set_pmu(kvm, arm_pmu);
> > -			cpumask_copy(kvm->arch.supported_cpus, &arm_pmu->supported_cpus);
> > +
> 
> Looks like a stray extra line here?

Fixed.

> 
> >
> >  			/*
> >  			 * Since a specific PMU is explicitly selected,
> > @@ -1117,7 +1125,6 @@ static int kvm_arm_pmu_v3_set_pmu(struct kvm_vcpu *vcpu, int pmu_id)
> >  				kvm->arch.pmmir_slots =
> >  					FIELD_GET(ARMV8_PMU_SLOTS,
> >  						  arm_pmu->reg_pmmir);
> > -			ret = 0;
> 
> I guess because you assign ret above (and if non-zero bail) you don't need
> to reset here, but probably worth keeping just to be really clear as to
> intent?

Ok.

> 
> >  			break;
> >  		}
> >  	}
> > diff --git a/arch/arm64/kvm/spe.c b/arch/arm64/kvm/spe.c
> > index dd5f80318ba4..87fcdbbcbd67 100644
> > --- a/arch/arm64/kvm/spe.c
> > +++ b/arch/arm64/kvm/spe.c
> > @@ -59,6 +59,71 @@ bool kvm_supports_spe(void)
> >  	return !list_empty(&spe_pmus);
> >  }
> >
> > +void kvm_spe_destroy_vm(struct kvm *kvm)
> 
> See above re: naming.
> 
> > +{
> > +	struct arm_spe_pmu *spe_pmu;
> > +
> > +	guard(mutex)(&spe_pmus_lock);
> > +
> > +	spe_pmu = kvm->arch.kvm_spe.spe_pmu;
> > +	if (!spe_pmu)
> > +		return;
> > +
> > +	module_put(spe_pmu->pmu.module);
> 
> Does spe_pmus_lock (hopefully spe_instances_lock in future :P) need to be
> held over module_put()? Seems unnecessary.

Looks alright to me.

> 
> > +}
> > +
> > +bool kvm_spe_pmu_set(struct kvm *kvm)
> 
> See comments above re: naming.
> 
> > +{
> > +	return !!kvm->arch.kvm_spe.spe_pmu;
> 
> This !! is unnecessary. The conversion to bool handles it for you.

Ok.

> 
> > +}
> > +
> > +static int kvm_spe_update_supported_cpus(struct kvm *kvm, cpumask_t *spe_cpus)
> > +{
> > +	return kvm_update_supported_cpus(kvm, NULL, spe_cpus);
> > +}
> 
> See above re: the helpers.
> 
> > +
> > +static int kvm_spe_set_spe_id(struct kvm_vcpu *vcpu, int spe_id)
> > +{
> > +	struct kvm *kvm = vcpu->kvm;
> > +	struct kvm_spe *kvm_spe = &kvm->arch.kvm_spe;
> > +	struct arm_spe_pmu *existing_spe_pmu, *spe_pmu = NULL;
> 
> Obviously similar comments to above about 'spe_pmu' -> 'spe_instance' :)
> 
> > +	struct spe_pmu_entry *entry;
> > +
> > +	if (kvm_vm_has_ran_once(kvm))
> > +		return -EBUSY;
> > +
> > +	guard(mutex)(&spe_pmus_lock);
> > +
> > +	list_for_each_entry(entry, &spe_pmus, link) {
> > +		if (entry->spe_pmu->pmu.type == spe_id) {
> > +			spe_pmu = entry->spe_pmu;
> > +			break;
> > +		}
> > +	}
> > +
> > +	if (!spe_pmu)
> > +		return -ENXIO;
> > +
> > +	existing_spe_pmu = kvm_spe->spe_pmu;
> > +	if (existing_spe_pmu) {
> > +		if (existing_spe_pmu != spe_pmu)
> > +			return -EINVAL;
> 
> This really should be -EBUSY for consistency I think.

Consistency with what?

> 
> See above for suggested change to the code for setting up the CPU mask.
> 
> > +		return 0;
> > +	}
> > +
> > +	if (!try_module_get(spe_pmu->pmu.module))
> > +		return -ENXIO;
> > +
> > +	if (kvm_spe_update_supported_cpus(kvm, &spe_pmu->supported_cpus)) {
> 
> You're ignoring the error here, better to do:

I'm not ignoring the error, I am deliberately choosing to return -EINVAL to
userspace, as per the documentation, instead of propagating the error code from
the internal function.

> 
> 	int err;
> 	...
> 	err = kvm_spe_update_supported_cpus(kvm, &spe_pmu->supported_cpus);
> 	if (err) {
> 		...
> 		return err;
> 	}
> 
> > +		module_put(spe_pmu->pmu.module);
> > +		return -EINVAL;
> > +	}
> > +
> > +	kvm_spe->spe_pmu = spe_pmu;
> > +
> > +	return 0;
> > +}
> > +
> >  static bool kvm_spe_irq_is_valid(struct kvm *kvm, int irq)
> >  {
> >  	struct kvm_vcpu *vcpu;
> > @@ -108,6 +173,15 @@ int kvm_spe_set_attr(struct kvm_vcpu *vcpu, struct kvm_device_attr *attr)
> >  		vcpu_spe->irq_num = irq;
> >  		return 0;
> >  	}
> > +	case KVM_ARM_VCPU_SPE_ID: {
> > +		int __user *uaddr = (int __user *)(long)attr->addr;
> > +		int spe_id;
> > +
> > +		if (get_user(spe_id, uaddr))
> > +			return -EFAULT;
> > +
> > +		return kvm_spe_set_spe_id(vcpu, spe_id);
> > +	}
> >  	}
> >
> >  	return -ENXIO;
> > @@ -117,6 +191,7 @@ int kvm_spe_get_attr(struct kvm_vcpu *vcpu, struct kvm_device_attr *attr)
> >  {
> >  	struct kvm_vcpu_spe *vcpu_spe = &vcpu->arch.vcpu_spe;
> >  	struct kvm *kvm = vcpu->kvm;
> > +	struct kvm_spe *kvm_spe = &kvm->arch.kvm_spe;
> >
> >  	if (!vcpu_has_spe(vcpu))
> >  		return -ENODEV;
> > @@ -138,6 +213,20 @@ int kvm_spe_get_attr(struct kvm_vcpu *vcpu, struct kvm_device_attr *attr)
> >
> >  		return 0;
> >  	}
> > +	case KVM_ARM_VCPU_SPE_ID: {
> > +		struct arm_spe_pmu *spe_pmu = kvm_spe->spe_pmu;
> > +		int __user *uaddr = (int __user *)(long)attr->addr;
> > +		int spe_id;
> > +
> > +		if (!spe_pmu)
> > +			return -ENXIO;
> > +
> > +		spe_id = spe_pmu->pmu.type;
> > +		if (put_user(spe_id, uaddr))
> > +			return -EFAULT;
> > +
> > +		return 0;
> > +	}
> >  	}
> >
> >  	return -ENXIO;
> > @@ -150,6 +239,7 @@ int kvm_spe_has_attr(struct kvm_vcpu *vcpu, struct kvm_device_attr *attr)
> >
> >  	switch(attr->attr) {
> >  	case KVM_ARM_VCPU_SPE_IRQ:
> > +	case KVM_ARM_VCPU_SPE_ID:
> >  		return 0;
> >  	}
> >
> > --
> > 2.43.0
> >
> >
> 
> Assuming you are on board with the suggested rework, I feel like this patch
> needs splitting up into:

I'm not going to risk breaking userspace, and without that I don't see the need
to create a separate patch to introduce a one line helper.

Thanks,
Alex

