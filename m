Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 496DB606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 15:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LBZQT1ma;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=us9ZXcXN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=B5Ck8QcmZUAlkcxrFv8qpQfkG3CLKPwiTCqYeBBAEsE=; b=LBZQT1mal3ilTdqiQCQH6EwI0U
	i2cT65iW/Paq+FImDTwYkTIn4PNwiU4S/4ZirqbiI/omlnbl/xWoJ/9gdVzgmDEoHVTYFC7sg45xX
	ZM9eEAQNODQ3+IEhrjSmZl1SfJNsoeHEx7/CBobfjkgh39vM3K5aj9IsDvjekm/sfFVEdAbeGZwd6
	/uVQffKxl2NZFKk3mxW9I4adjiOCjq7IdItXc/xhpYwxXr+Q4etIcHhxcFyjHIEVG6SrPMI7/+n7X
	DPbbkNyOKz59BJ8jNXqI/wmG8D2DfXMmy6Xv/r90lVBsZ3mtpWFVtTbITq13PaYXGsNTHLHri074L
	jaCq1Bsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxXp-0000000GhQW-1jnX;
	Fri, 27 Nov 2026 15:07:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxXm-0000000GhPe-2CzF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 15:07:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ADCF51570;
	Fri, 27 Nov 2026 07:07:18 -0800 (PST)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7E4923F632;
	Fri, 27 Nov 2026 07:07:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795792041; bh=t9JEmXoi7UsrPtxB0TwwfX1bVrMLJhUNWjCkxSHRbLE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=us9ZXcXNEOrwNRY4bxXA6zO5LT4iIH1/+aWFswtgO+NfCyLyR3PavPbqXGXA8DZ2l
	 lkjHpanpJpiY/vt7tIH5rvRxY4eNWNeHNkCvG+SBIvfejsxbgOPu9Abp4p0Pdh9NM4
	 H/taBlnSKZ/+Lubr8H7VpZsVYVz3vofgl3g5pl1o=
Date: Fri, 27 Nov 2026 15:07:15 +0000
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: maz@kernel.org, oupton@kernel.org, fuad.tabba@linux.dev,
	joey.gouly@arm.com, seiden@linux.ibm.com, yuzenghui@huawei.com,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	will@kernel.org, mark.rutland@arm.com,
	linux-perf-users@vger.kernel.org, catalin.marinas@arm.com,
	james.clark@linaro.org, Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [RFC PATCH v7 12/28] KVM: arm64: Add SPE VCPU device attribute
 to set the interrupt number
Message-ID: <awmco0j3gEvK_LHp@raptor>
References: <20260903160623.315525-1-alexandru.elisei@arm.com>
 <20260903160623.315525-13-alexandru.elisei@arm.com>
 <69288872-2576-4697-a62d-87ab2bcedd49@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <69288872-2576-4697-a62d-87ab2bcedd49@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_070723_365949_547FF264 
X-CRM114-Status: GOOD (  22.87  )
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

Hi Suzuki,

On Wed, Oct 28, 2026 at 04:52:53PM +0000, Suzuki K Poulose wrote:
> On 03/09/2026 17:06, Alexandru Elisei wrote:
> > From: Sudeep Holla <sudeep.holla@arm.com>
> > 
> > Add KVM_ARM_VCPU_SPE_CTRL(KVM_ARM_VCPU_SPE_IRQ) to allow the user to set
> > the interrupt number for the buffer management interrupt.
> > 
> > [ Alexandru E: Split from "KVM: arm64: Add a new VCPU device control group
> >                 for SPE" ]
> > 
> > Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> > Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> > ---
> 
> ...
> 
> > diff --git a/arch/arm64/kvm/spe.c b/arch/arm64/kvm/spe.c
> > index fe45ad4c703a..dd5f80318ba4 100644
> > --- a/arch/arm64/kvm/spe.c
> > +++ b/arch/arm64/kvm/spe.c
> > @@ -59,17 +59,99 @@ bool kvm_supports_spe(void)
> >   	return !list_empty(&spe_pmus);
> >   }
> 
> ...
> 
> >   int kvm_spe_get_attr(struct kvm_vcpu *vcpu, struct kvm_device_attr *attr)
> >   {
> > +	struct kvm_vcpu_spe *vcpu_spe = &vcpu->arch.vcpu_spe;
> > +	struct kvm *kvm = vcpu->kvm;
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
> > +		if (!vcpu_spe->irq_num)
> > +			return -ENXIO;
> > +
> > +		irq = vcpu_spe->irq_num;
> > +		if (put_user(irq, uaddr))
> > +			return -EFAULT;
> > +
> > +		return 0;
> > +	}
> > +	}
> > +
> >   	return -ENXIO;
> >   }
> >   int kvm_spe_has_attr(struct kvm_vcpu *vcpu, struct kvm_device_attr *attr)
> >   {
> > +	if (!vcpu_has_spe(vcpu))
> > +		return -ENODEV;
> > +
> > +	switch(attr->attr) {
> > +	case KVM_ARM_VCPU_SPE_IRQ:
> > +		return 0;
> 
> Should we gate this too on irqchip_in_kernel(vcpu->kvm) ? Otherwise
> we would advertise to the userspace that it has the SPE_IRQ, but
> would return -EINVAL when we try get_attr if the irqchip is not
> in kernel.

From Documentation/virt/kvm/api.rst:

4.81 KVM_HAS_DEVICE_ATTR
------------------------
[..]
A successful return indicates the attribute is implemented.  It does not
necessarily indicate that the attribute can be read or written in the
device's current state.  "addr" is ignored.

I think my implementation adheres to the documentation? Unless you have a
specific use case in mind?

> 
> Also, do we need to mandate the ordering of the SPE configuration on
> VGIC ?

That doesn't seem to be an issue for the PMU?

Thanks,
Alex

