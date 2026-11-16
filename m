Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2853606A887
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 18:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rZA/Z+3S;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MRhsWgX6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=998chmVGlgR1Bb+7q8aQ3gIGlPWLeXhmy31lb6kqaW0=; b=rZA/Z+3SrhziyGxJF7uZYTwsAQ
	2wwbsB5uANIMV/D6aw87N0WSOzNzreWHXa5qUj1mG7NFhayjkWygUp/7lxeH1PozIAH23exQznsMA
	3LCPX3lG4WMPh4NaHYbBp3VDxY77/MhWHzJouWucCGLLSnSUtItfENPcb9j58MswyTRmU5RfeY4Sj
	QacwCgsGA5ouaYdTxa1R9gghdDIwsUtlDECjKsD31Wk3l4iZZT3Tj9TI9fW5erVCpqJbQcp8jjdwd
	sV+rS1PbG9dYLKAtU0BHQ0dL7AI5vW/OOwebaDzkVrybHjOdBaE/KMDKDcBkkKxndsYGvx57KO+lj
	Aqp1gkAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT10F-00000003TdN-087B;
	Mon, 16 Nov 2026 18:00:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT10E-00000003TdG-0xf8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 18:00:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CCD7B40981;
	Mon, 16 Nov 2026 18:00:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D3621F000C4;
	Mon, 16 Nov 2026 18:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794852025;
	bh=998chmVGlgR1Bb+7q8aQ3gIGlPWLeXhmy31lb6kqaW0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MRhsWgX6xG9y5Aw2OHN9dSkXFKCRUEt5ffarsOOX3lad5iSqAee5yjkz4gYRb2RCF
	 Nmlc61bqE9Mr1vXZf071UVmvKwoilnHVll4/pBDUwRN1ujUs6Y+1UJygk4ZFlekYRG
	 fbbgZeU6szqDGGrOCRD3op3iK81T4BTTXmud68Y1EwVrHAmHdtCBzyfrW2AEMnXhTx
	 o0mBEyeyNntThPlirFtI5oXjP9an26dDzsTYSEAhs97W9J8m7b3EC5vWzaKeExRj0G
	 axRj2Szojv7D9iifOwG1rLWvVgFg9bbcWqTJy9julo2Ax63nniNCLov1qzHbSOLMle
	 20Sx5aWxLosyg==
Date: Mon, 16 Nov 2026 18:00:19 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: maz@kernel.org, oupton@kernel.org, fuad.tabba@linux.dev, 
	joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	will@kernel.org, mark.rutland@arm.com, linux-perf-users@vger.kernel.org, 
	catalin.marinas@arm.com, james.clark@linaro.org
Subject: Re: [RFC PATCH v7 03/28] KVM: arm64: Add CONFIG_KVM_ARM_SPE Kconfig
 option
Message-ID: <avtEpYOSGrZ7BcKE@gremlin>
References: <20260903160623.315525-1-alexandru.elisei@arm.com>
 <20260903160623.315525-4-alexandru.elisei@arm.com>
 <atDa-BSF3RMzJSdE@gremlin>
 <avSi9WPLhMLrnogk@raptor>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <avSi9WPLhMLrnogk@raptor>
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

On Wed, Nov 11, 2026 at 05:16:37PM +0000, Alexandru Elisei wrote:
> Hi,
>
> On Thu, Oct 15, 2026 at 03:15:18PM +0100, Lorenzo Stoakes (ARM) wrote:
> > On Thu, Sep 03, 2026 at 05:05:58PM +0100, Alexandru Elisei wrote:
> > > Add a new configuration option that will be used for KVM SPE emulation.
> > > CONFIG_KVM_ARM_SPE depends on the SPE driver being loaded because:
> > >
> > > 1. The SPE driver maintains a cpumask of physical CPUs that support SPE,
> > >    and that will be used by KVM to emulate SPE on heterogeneous systems.
> >
> > I guess e.g. big.LITTLE?
>
> That's the marketing term for it, yes.
>
> >
> > >
> > > 2. KVM will rely on the SPE driver enabling the SPE interrupt at the GIC
> > >    level.
> > >
> > > The option will become user selectable after SPE support in KVM is
> > > implemented.
> > >
> > > Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> >
> > With nit addressed the redundant dependency removed (both noted below),
> > LGTM and:
> >
> > Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> >
> > > ---
> > >  arch/arm64/kvm/Kconfig | 9 +++++++++
> > >  1 file changed, 9 insertions(+)
> > >
> > > diff --git a/arch/arm64/kvm/Kconfig b/arch/arm64/kvm/Kconfig
> > > index 449154f9a485..fece4c02b97c 100644
> > > --- a/arch/arm64/kvm/Kconfig
> > > +++ b/arch/arm64/kvm/Kconfig
> > > @@ -103,5 +103,14 @@ config PKVM_STACKTRACE
> > >  	  If unsure, or not using protected nVHE (pKVM), say N.
> > >
> > >  endif # NVHE_EL2_DEBUG
> > > +
> > > +config KVM_ARM_SPE
> >
> > NIT: Nothing else in the file has the _ARM_ prefix, so is that redundant
> > here?
>
> I add the capability KVM_CAP_ARM_SPE later, so I would rather keep the config
> name KVM_ARM_SPE so the two align?

Ack that's fine.

>
> >
> > > +	bool
> > > +	depends on KVM && ARM_SPE_PMU
> >
> > I think KVM should be removed here, this is within an 'if KVM' block
> > already, and nothing else here depends on it either so not a convention.
>
> Removed the explicit dependency on KVM.

Thanks!

>
> Thanks,
> Alex
>
> >
> > > +	default n
> > > +	help
> > > +	  Adds support for Statistical Profiling Extension (SPE) in virtual
> > > +	  machines.
> > > +
> > >  endif # KVM
> > >  endif # VIRTUALIZATION
> > > --
> > > 2.43.0
> > >
> > >
> >
> > --
> > Cheers, Lorenzo

--
Cheers, Lorenzo

