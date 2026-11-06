Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0855606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 18:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lwHW9Izc;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lRWqtfp+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=hh1wVIGhMUtDEqA1RGRXhLPsq4X7xlZOf5Yg/x7bTfA=; b=lwHW9IzcTJD9JmPGwI7uTeN0dK
	V/SVYV8qjl8NVT+i1cjeeMuxYPs4D8Vnb4rdxIInuvxa/q0vOeFcz0uBu/V5oDpCBolBBGLg3OQTf
	NeJQyIHNMLMPTp+S3jUgZGchaC/vT5UNv7O/y8aFiKYZ1iwhcXIbqQVa6a6PWehZqiYx5k8cAeneV
	N1sq8IjjoLbosH6M1jbd0rR7xlzG+gtB47IL1OLh5xS38+GxaM6DveBAaaamA0jxcLJ9mfJA6qmNc
	GWp30PPmtfR5eIVKzSH2xXLPIUpZWoHQFOmJFm9TacFVxu1NYAoY++TtxefkBv5z9oBGGu/cp8+ZL
	4RMBDn0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPP9Y-0000000DTaG-3LNQ;
	Fri, 06 Nov 2026 18:59:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPP9Y-0000000DTa8-0W7u
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 18:59:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3D1E0601E1;
	Fri,  6 Nov 2026 18:59:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDC261F0089F;
	Fri,  6 Nov 2026 18:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793991547;
	bh=hh1wVIGhMUtDEqA1RGRXhLPsq4X7xlZOf5Yg/x7bTfA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lRWqtfp+1D498aBxxNnJJyG9ECqg+f/OfZ3IbBN3x25p6pxG/EdBJjp5O3EH94agq
	 G4S0/LF+z79xECrP3fyX7gwClgYK0RzJw9f9N3wi0e0o5s3jvO7ePlzSAmsak8VDRD
	 cUAdhEjJNEeQNF9q55IQx6OW5BBMj3KUGC7Vi2Sms6yntczCqpkTI4QcgPvgc0I1bk
	 zsTMLn/IvdjcnbQ3thc+emgG+L4sMVxWznkDRqMTFCVLh+O0aQo9ygdXuBfAX5QygY
	 XjXntwjXrnaRLax/wGU7yepiBQjqQ+XjzW3GXqjj4bp31h0zvRrYlfnNosyp/tcgJt
	 Y06IpJ3ja+I/A==
Date: Fri, 6 Nov 2026 10:59:05 -0800
From: Oliver Upton <oupton@kernel.org>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: Fuad Tabba <fuad.tabba@linux.dev>, Marc Zyngier <maz@kernel.org>,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Fuad Tabba <tabba@google.com>, kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] KVM: arm64: Allocate a protected vCPU's SVE state at
 EL2
Message-ID: <au4jeecA_FIk_yPT@kernel.org>
References: <20261105130456.1617185-1-fuad.tabba@linux.dev>
 <20261105130456.1617185-3-fuad.tabba@linux.dev>
 <au4TsO50x7BcFYpi@google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <au4TsO50x7BcFYpi@google.com>
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

On Fri, Nov 06, 2026 at 05:51:44PM +0000, Vincent Donnefort wrote:
> > @@ -1243,6 +1253,9 @@ int pkvm_reset_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu)
> >  			    PSCI_0_2_AFFINITY_LEVEL_ON) != PSCI_0_2_AFFINITY_LEVEL_ON_PENDING)
> >  		return -ECANCELED;
> >  
> > +	if (vcpu_has_sve(&hyp_vcpu->vcpu))
> > +		memset(hyp_vcpu->vcpu.arch.sve_state, 0, vcpu_sve_state_size(&hyp_vcpu->vcpu));
> > +
> 
> Why wasn't this line around before?

Prior to this series SVE was only supported in non-protected guests, so
the host was responsible for resetting SVE state.

Now that we have pVM support we need to reset state for protected
vCPUs.

Thanks,
Oliver

> >  	kvm_reset_vcpu_core(&hyp_vcpu->vcpu);
> >  	kvm_reset_pvm_sys_regs(&hyp_vcpu->vcpu);
> >  
> > diff --git a/arch/arm64/kvm/hyp/nvhe/sys_regs.c b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
> > index 32e82653ebf7e..06ea91415ad8b 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/sys_regs.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
> > @@ -570,6 +570,7 @@ static const struct sys_reg_desc_reset pvm_sys_reg_reset_vals[] = {
> >  	RESET_UNKNOWN(MAIR_EL1),
> >  	RESET_ZERO(AMAIR_EL1),
> >  	RESET_ZERO(MDSCR_EL1),
> > +	RESET_ZERO(ZCR_EL1),
> >  	RESET_ZERO(CNTV_CTL_EL0),
> >  	RESET_UNKNOWN(TTBR0_EL1),
> >  	RESET_UNKNOWN(TTBR1_EL1),
> > diff --git a/arch/arm64/kvm/reset.c b/arch/arm64/kvm/reset.c
> > index 10eb7249aa9e8..aaaa1b8634ba4 100644
> > --- a/arch/arm64/kvm/reset.c
> > +++ b/arch/arm64/kvm/reset.c
> > @@ -52,6 +52,8 @@ int __init kvm_arm_init_sve(void)
> >  		if (WARN_ON(kvm_sve_max_vl > VL_ARCH_MAX))
> >  			kvm_sve_max_vl = VL_ARCH_MAX;
> >  
> > +		kvm_nvhe_sym(kvm_sve_max_vl) = kvm_sve_max_vl;
> > +
> >  		/*
> >  		 * Don't even try to make use of vector lengths that
> >  		 * aren't available on all CPUs, for now:
> > -- 
> > 2.47.3
> > 
> 
> -- 
> Vincent

