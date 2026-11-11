Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A3A606A327
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 17:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=M/8Tvn9q;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=kFzskHgB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=2LtHlzenH8P0Let9eUokfApdyyGworpP/r1pDQ+TQU8=; b=M/8Tvn9qDYCOgEJC+Iqr9DZykA
	vJdnJcE45yO+4G6NS9BiijvdzAG+zN9sORIHHWSQIzK0fDM99yb8DnlXBaRWnxww3s/Msam+/P/iI
	Qc9wJVrYw7Jc/sreTyRVYX6AJYY5kT+YjjDLpLeBxpxOtDDwYcBwCVmwphoyUktfe1ddggfemfqlf
	pjz9zOsdt5byQYN1AcSaDwL0IWSTuonAI3f9envN1dt0QKJunKPcciUCUHjowc4X8+FM6Qt/SZUdf
	oP5uwsPsXAt7L9SouttgM0388N1A5ATNIi3c25bnHW5SQ85dRV7E+FWDHZK+jz2ywChA9lOfrlkk7
	NRk7IdfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRBwJ-00000007Hcu-1VMA;
	Wed, 11 Nov 2026 17:16:51 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRBwH-00000007HcQ-3Fvy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 17:16:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BDCE6339;
	Wed, 11 Nov 2026 09:16:45 -0800 (PST)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D4B2D3F632;
	Wed, 11 Nov 2026 09:16:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794417408; bh=I5J2kVvdKW4OqPmoJ/nQAip3vlK/SWhiWTZU2FsT3FI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kFzskHgBfJ2MED+UEtFv80JX+XpZT8ayy4tQXWR1Bkb8jNcjKtwWklLBsjqzy2EW2
	 WxBRsR3lK17xRh29ko6PvPw39RRBOceP94t6lHLkMTWvzQvje1GggtxXs6JrwOlJ/U
	 S2CHp4colJHqGlGTbLxoduOpLbJVoQXP3Q9PKwQM=
Date: Wed, 11 Nov 2026 17:16:37 +0000
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: maz@kernel.org, oupton@kernel.org, fuad.tabba@linux.dev,
	joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, will@kernel.org, mark.rutland@arm.com,
	linux-perf-users@vger.kernel.org, catalin.marinas@arm.com,
	james.clark@linaro.org
Subject: Re: [RFC PATCH v7 03/28] KVM: arm64: Add CONFIG_KVM_ARM_SPE Kconfig
 option
Message-ID: <avSi9WPLhMLrnogk@raptor>
References: <20260903160623.315525-1-alexandru.elisei@arm.com>
 <20260903160623.315525-4-alexandru.elisei@arm.com>
 <atDa-BSF3RMzJSdE@gremlin>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <atDa-BSF3RMzJSdE@gremlin>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_091649_854761_B5C3809E 
X-CRM114-Status: GOOD (  25.21  )
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

On Thu, Oct 15, 2026 at 03:15:18PM +0100, Lorenzo Stoakes (ARM) wrote:
> On Thu, Sep 03, 2026 at 05:05:58PM +0100, Alexandru Elisei wrote:
> > Add a new configuration option that will be used for KVM SPE emulation.
> > CONFIG_KVM_ARM_SPE depends on the SPE driver being loaded because:
> >
> > 1. The SPE driver maintains a cpumask of physical CPUs that support SPE,
> >    and that will be used by KVM to emulate SPE on heterogeneous systems.
> 
> I guess e.g. big.LITTLE?

That's the marketing term for it, yes.

> 
> >
> > 2. KVM will rely on the SPE driver enabling the SPE interrupt at the GIC
> >    level.
> >
> > The option will become user selectable after SPE support in KVM is
> > implemented.
> >
> > Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> 
> With nit addressed the redundant dependency removed (both noted below),
> LGTM and:
> 
> Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> 
> > ---
> >  arch/arm64/kvm/Kconfig | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >
> > diff --git a/arch/arm64/kvm/Kconfig b/arch/arm64/kvm/Kconfig
> > index 449154f9a485..fece4c02b97c 100644
> > --- a/arch/arm64/kvm/Kconfig
> > +++ b/arch/arm64/kvm/Kconfig
> > @@ -103,5 +103,14 @@ config PKVM_STACKTRACE
> >  	  If unsure, or not using protected nVHE (pKVM), say N.
> >
> >  endif # NVHE_EL2_DEBUG
> > +
> > +config KVM_ARM_SPE
> 
> NIT: Nothing else in the file has the _ARM_ prefix, so is that redundant
> here?

I add the capability KVM_CAP_ARM_SPE later, so I would rather keep the config
name KVM_ARM_SPE so the two align?

> 
> > +	bool
> > +	depends on KVM && ARM_SPE_PMU
> 
> I think KVM should be removed here, this is within an 'if KVM' block
> already, and nothing else here depends on it either so not a convention.

Removed the explicit dependency on KVM.

Thanks,
Alex

> 
> > +	default n
> > +	help
> > +	  Adds support for Statistical Profiling Extension (SPE) in virtual
> > +	  machines.
> > +
> >  endif # KVM
> >  endif # VIRTUALIZATION
> > --
> > 2.43.0
> >
> >
> 
> --
> Cheers, Lorenzo

