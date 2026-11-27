Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1310D606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 15:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=L4k6S1pe;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=GkjXkRXE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=6OxR87UYxK+OwG5i5j5ERBXd09I19CokZ0WmuEb6pdA=; b=L4k6S1peJkCRrgcmhMBbHOMwkQ
	6Tl2HI3U6XEJTlk9qKZ/0vgWZ+rjumD/V1R2Edn7YxwJmYPSccx+rkEEf9S/+yLO3ziAY8ALELJkW
	gN3+Ylolq+tjdxQ2jC+hnp8EGX5cBw5ipv8pLc9q7uD0lEjv4GFH4oJDe4QEJHUzR+ZrZoSR/CdM5
	NYBzKFOVPDVk03iHBzttXhBoypGOIGjMCJddl7vlU8TKQ6FSluHuB1BQDg+xQkW6LVoitfToRmG6W
	y5b++UxDTYO/jQo+yMwKJNbkmnmTe8J6onbRd4H+Bz6FmahgKWoeBaXTVaefqB5zbYQ4UytfjL85Y
	Ak4FtJsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxXK-0000000GhID-0m9J;
	Fri, 27 Nov 2026 15:06:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxXH-0000000GhHO-1Pco
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 15:06:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 721A0169E;
	Fri, 27 Nov 2026 07:06:47 -0800 (PST)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6910D3F632;
	Fri, 27 Nov 2026 07:06:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795792010; bh=39QWeaXFYvuGiw8B44UEBdLSiu5E3gd4fqoYYOcSPcs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GkjXkRXEAxS/XVDl2y1zUqx86YEk4FSes8XqO7yUJBxkrkon8KM+iJb7y7CvahRHT
	 /kWT60+l/Owu0KJxkmHaYd5dIlc8auEVMPO6Wc8EEuTF0SGGT/UTJCtCbx38zQ/lzC
	 s22I1M9LfulhbwufGONAh4AyOfhKtMmsCPTEhHg0=
Date: Fri, 27 Nov 2026 15:06:45 +0000
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: maz@kernel.org, oupton@kernel.org, fuad.tabba@linux.dev,
	joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, will@kernel.org, mark.rutland@arm.com,
	linux-perf-users@vger.kernel.org, catalin.marinas@arm.com,
	james.clark@linaro.org, Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [RFC PATCH v7 12/28] KVM: arm64: Add SPE VCPU device attribute
 to set the interrupt number
Message-ID: <awmchdW0FRpDWA7R@raptor>
References: <20260903160623.315525-1-alexandru.elisei@arm.com>
 <20260903160623.315525-13-alexandru.elisei@arm.com>
 <ateEKZC3pjL6Sjrq@gremlin>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ateEKZC3pjL6Sjrq@gremlin>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_070651_612206_EE21FCBC 
X-CRM114-Status: GOOD (  49.28  )
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

On Tue, Oct 20, 2026 at 06:20:29PM +0100, Lorenzo Stoakes (ARM) wrote:
> On Thu, Sep 03, 2026 at 05:06:07PM +0100, Alexandru Elisei wrote:
> > From: Sudeep Holla <sudeep.holla@arm.com>
> >
> > Add KVM_ARM_VCPU_SPE_CTRL(KVM_ARM_VCPU_SPE_IRQ) to allow the user to set
> > the interrupt number for the buffer management interrupt.
> 
> I know this is a bit of a theme of the review :P but feels a little short.
> 
> Be good to see why you want to do this, broadly what you are changing
> (shouldn't duplicate stuff you can see from the diff but something like '

Done.

> 
> >
> > [ Alexandru E: Split from "KVM: arm64: Add a new VCPU device control group
> >                for SPE" ]
> >
> > Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> > Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> 
> I guess similar comment to before - is this a significant change? If so
> then probably best to go Co-developed-by route, otherwise not a big deal.

Changed to Co-developed-by: Alexandru Elisei <alexandru.elisei@arm.com>, with
Sudeep's permission.

> 
> > ---
> >  Documentation/virt/kvm/devices/vcpu.rst | 22 +++++++
> >  arch/arm64/include/asm/kvm_host.h       |  2 +
> >  arch/arm64/include/asm/kvm_spe.h        | 11 ++++
> >  arch/arm64/include/uapi/asm/kvm.h       |  1 +
> >  arch/arm64/kvm/guest.c                  |  2 +
> >  arch/arm64/kvm/spe.c                    | 82 +++++++++++++++++++++++++
> >  6 files changed, 120 insertions(+)
> >
> > diff --git a/Documentation/virt/kvm/devices/vcpu.rst b/Documentation/virt/kvm/devices/vcpu.rst
> > index e0a7fa35dfd2..d30b2f7fec9a 100644
> > --- a/Documentation/virt/kvm/devices/vcpu.rst
> > +++ b/Documentation/virt/kvm/devices/vcpu.rst
> > @@ -307,3 +307,25 @@ From the destination VMM process:
> >  ===============================
> >
> >  :Architectures: ARM64
> > +
> > +5.1 ATTRIBUTE: KVM_ARM_VCPU_SPE_IRQ
> > +-----------------------------------
> > +
> > +:Parameters: in kvm_device_attr.addr the address for the Profiling Buffer
> > +             management interrupt number as a pointer to an int
> > +
> > +Returns:
> 
> Was going to say maybe it should be ':Returns:' but actually the doc seems
> super inconsistent on this... :P so it doesn't really matter.
> 
> > +
> > +	 =======  ==========================================================
> > +	 -EFAULT  Error accessing the buffer management interrupt number
> > +	 -EINVAL  Invalid interrupt number or not using an in-kernel irqchip
> > +	 -ENODEV  KVM_ARM_VCPU_HAS_SPE VCPU feature not set
> 
> Seems like a typo, should be KVM_ARM_VCPU_SPE_IRQ right?

It's a typo, yes, should be KVM_ARM_VCPU_SPE.

> 
> > +	 -ENXIO   SPE not supported or not properly configured
> > +	 =======  ==========================================================
> > +
> > +Required.
> > +
> > +Specifies the Profiling Buffer management interrupt number. The interrupt number
> > +must be a PPI and the interrupt number must be the same for each VCPU. Arm
> > +recommends 21 as the interrupt number. SPE virtualization requires an in-kernel
> > +vGIC implementation.
> > diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> > index 27fe0cd5b2d7..e7332bd82bf3 100644
> > --- a/arch/arm64/include/asm/kvm_host.h
> > +++ b/arch/arm64/include/asm/kvm_host.h
> > @@ -27,6 +27,7 @@
> >  #include <asm/fpsimd.h>
> >  #include <asm/kvm.h>
> >  #include <asm/kvm_asm.h>
> > +#include <asm/kvm_spe.h>
> >  #include <asm/vncr_mapping.h>
> >
> >  #define __KVM_HAVE_ARCH_INTC_INITIALIZED
> > @@ -918,6 +919,7 @@ struct kvm_vcpu_arch {
> >  	struct vgic_cpu vgic_cpu;
> >  	struct arch_timer_cpu timer_cpu;
> >  	struct kvm_pmu pmu;
> > +	struct kvm_vcpu_spe vcpu_spe;
> >
> >  	/* vcpu power state */
> >  	struct kvm_mp_state mp_state;
> > diff --git a/arch/arm64/include/asm/kvm_spe.h b/arch/arm64/include/asm/kvm_spe.h
> > index 1327064d0984..8ded2d821bff 100644
> > --- a/arch/arm64/include/asm/kvm_spe.h
> > +++ b/arch/arm64/include/asm/kvm_spe.h
> > @@ -6,7 +6,15 @@
> >  #ifndef __ARM64_KVM_SPE_H__
> >  #define __ARM64_KVM_SPE_H__
> >
> > +struct kvm;
> > +struct kvm_vcpu;
> > +struct kvm_device_attr;
> > +
> >  #ifdef CONFIG_KVM_ARM_SPE
> > +struct kvm_vcpu_spe {
> > +	int irq_num;		/* Buffer management interrupt number */
> > +};
> 
> I guess this struct will be expanded over time?

Indeed, it will.

> 
> > +
> >  bool kvm_supports_spe(void);
> >
> >  #define vcpu_has_spe(vcpu)					\
> > @@ -16,6 +24,9 @@ int kvm_spe_set_attr(struct kvm_vcpu *vcpu, struct kvm_device_attr *attr);
> >  int kvm_spe_get_attr(struct kvm_vcpu *vcpu, struct kvm_device_attr *attr);
> >  int kvm_spe_has_attr(struct kvm_vcpu *vcpu, struct kvm_device_attr *attr);
> >  #else
> 
> NIT, and probably applicable to a previous patch, but useful to put /*
> CONFIG_KVM_ARM_SPE */ there, certainly useful as things grow.

I'll put it here, this patch adds more code than the other two patches that
touch the file.

> 
> > +struct kvm_vcpu_spe {
> > +};
> > +
> 
> OK good this covers off the !CONFIG_KVM_ARM_SPE case.

Ack.

> 
> >  static __always_inline bool kvm_supports_spe(void)
> >  {
> >  	return false;
> > diff --git a/arch/arm64/include/uapi/asm/kvm.h b/arch/arm64/include/uapi/asm/kvm.h
> > index e8a68e34be63..b9e5019181eb 100644
> > --- a/arch/arm64/include/uapi/asm/kvm.h
> > +++ b/arch/arm64/include/uapi/asm/kvm.h
> > @@ -447,6 +447,7 @@ enum {
> >  #define KVM_ARM_VCPU_PVTIME_CTRL	2
> >  #define   KVM_ARM_VCPU_PVTIME_IPA	0
> >  #define KVM_ARM_VCPU_SPE_CTRL		3
> > +#define   KVM_ARM_VCPU_SPE_IRQ		0
> >
> >  /* KVM_IRQ_LINE irq field index values */
> >  #define KVM_ARM_IRQ_VCPU2_SHIFT		28
> > diff --git a/arch/arm64/kvm/guest.c b/arch/arm64/kvm/guest.c
> > index 56c5f937fcdb..f953b235b458 100644
> > --- a/arch/arm64/kvm/guest.c
> > +++ b/arch/arm64/kvm/guest.c
> > @@ -920,7 +920,9 @@ int kvm_arm_vcpu_arch_set_attr(struct kvm_vcpu *vcpu,
> >  		ret = kvm_arm_pvtime_set_attr(vcpu, attr);
> >  		break;
> >  	case KVM_ARM_VCPU_SPE_CTRL:
> > +		mutex_lock(&vcpu->kvm->arch.config_lock);
> >  		ret = kvm_spe_set_attr(vcpu, attr);
> > +		mutex_unlock(&vcpu->kvm->arch.config_lock);
> >  		break;
> >  	default:
> >  		ret = -ENXIO;
> > diff --git a/arch/arm64/kvm/spe.c b/arch/arm64/kvm/spe.c
> > index fe45ad4c703a..dd5f80318ba4 100644
> > --- a/arch/arm64/kvm/spe.c
> > +++ b/arch/arm64/kvm/spe.c
> > @@ -59,17 +59,99 @@ bool kvm_supports_spe(void)
> >  	return !list_empty(&spe_pmus);
> >  }
> >
> > +static bool kvm_spe_irq_is_valid(struct kvm *kvm, int irq)
> > +{
> > +	struct kvm_vcpu *vcpu;
> > +	struct kvm_vcpu_spe *vcpu_spe;
> > +	unsigned long i;
> > +
> 
> Maybe worth a small comment:
> 
> 	/* Every vCPU must have either the same or no IRQ set. */

I think that's misleading, because someone reading that might get the idea
that it is allowed for a VCPU not to have an interrupt number set. I think
the documentation is enough.

> 
> > +	kvm_for_each_vcpu(i, vcpu, kvm) {
> > +		vcpu_spe = &vcpu->arch.vcpu_spe;
> > +
> > +		if (!vcpu_spe->irq_num)
> > +			continue;
> > +
> > +		if (vcpu_spe->irq_num != irq)
> > +			return false;
> > +	}
> > +
> > +	return true;
> > +}
> > +
> 
> >  int kvm_spe_set_attr(struct kvm_vcpu *vcpu, struct kvm_device_attr *attr)
> >  {
> > +	struct kvm_vcpu_spe *vcpu_spe = &vcpu->arch.vcpu_spe;
> > +	struct kvm *kvm = vcpu->kvm;
> > +
> > +	lockdep_assert_held(&kvm->arch.config_lock);
> > +
> > +	if (!vcpu_has_spe(vcpu))
> > +		return -ENODEV;
> > +
> > +	switch (attr->attr) {
> > +	case KVM_ARM_VCPU_SPE_IRQ: {
> > +		int __user *uaddr = (int __user *)(long)attr->addr;
> > +		int irq;
> > +
> > +		if (!irqchip_in_kernel(kvm))
> > +			return -EINVAL;
> > +
> > +		if (get_user(irq, uaddr))
> > +			return -EFAULT;
> > +
> > +		if (!irq_is_ppi(kvm, irq))
> > +			return -EINVAL;
> > +
> > +		if (!kvm_spe_irq_is_valid(kvm, irq))
> > +			return -EINVAL;
> 
> What about changing the IRQ for vcpu? kvm_spe_irq_is_valid() will abort
> even if only the current vCPU has an IRQ set.

kvm_spe_irq_is_valid() aborts if userspace attempts to set a different
interrupt number than the number that has already been set on a VCPU,
including the one on which the ioctl is executing. In particular, if no
VCPU has an SPE interrupt number set, kvm_spe_irq_is_valid() returns true
(success).

The requirement is that all VCPUs have the same interrupt number configured
because (I would assume that) KVM doesn't want to have to deal with
heterogenous systems.

As for why it cannot be changed to a different value once set: I am not
aware of any reason for userspace to do that - I assume that if there was
one, it would also apply to the PMU, and the PMU has a similar behaviour of
rejecting reassignment.

> 
> Also what about the case of setting the current vCPU's IRQ to the same
> value? Should that be -EBUSY?
> 
> PMU seems to do something like that, so maybe worth doing that for
> consistency? Not exactly a huge thing, that though!

Good point. To be on the safe side, I'll just replicate it. I'll also move
irq_is_ppi() into kvm_spe_irq_is_valid(), because being a PPI is a
requirement for a valid interrupt number.

> 
> Also looking at PMU there's:
> 
> 	/* On GICv5, the PMUIRQ is architecturally mandated to be PPI 23 */
> 	if (vgic_is_v5(kvm) && irq != KVM_ARMV8_PMU_GICV5_IRQ)
> 		return false;
> 
> Is that something you have to worry about for SPE?

Thanks for pointing it out, didn't know that GICv5 mandates interrupt
number assignments. It's 21 for PMBIRQ, will update accordingly.

Thanks,
Alex

