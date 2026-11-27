Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62BB7606A327
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 15:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Rp63crXz;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=uL1YJ1vk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=y4eKG9taiB9eB/Qf2Z8j0/REU4SNPEh0gD95UBGC7uc=; b=Rp63crXzbRHgF+rQA6cV4DY+3s
	4NunrfO/Mm/ewOV49ao/Pmj4wA7991CkBOYgCepPeQAx1NLEg2NVfBr+WJ0KkmEvwd+PuBlT3cRJk
	9gdJiGrIqXwJlAOh2PjMAh1JsJHRjRfI2hHrIUNvNPVShd4vCmbgY3O7hutWSadjvJV1MqrWO5dCM
	COZoRBwWapxb/REIHVQw60Xn4m7sDBgCFYGhHw9KiZvkW6S4upyClXKoDrVA2jTEg/D1K0QgykkLq
	t1paDTAG/h0t44jOeISUimnv1vU/DP3rzdGNfd8EqCFvGRTeZFhVBIMegvFcDxlqkd5bY5+uDZjgA
	K0j76YIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxT1-0000000GgXa-2zUY;
	Fri, 27 Nov 2026 15:02:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxSz-0000000GgXA-3Uae
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 15:02:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D5BAF169E;
	Fri, 27 Nov 2026 07:02:21 -0800 (PST)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EB2833F86C;
	Fri, 27 Nov 2026 07:02:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795791744; bh=/60+uV6MGkmJY4+B30J1nI4Z6rYXY4H1P3pCsqHWBGs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uL1YJ1vkIAfsGkACGt/UNCS3ATBt/W/Wv6CgV5Ir54xLJrjZjX/hJyTaPnhdQS4wD
	 ngvmEScfqauFVKfF1WZSooj0roxgqrFW7T7kG9QGRDYTLJ8x3LWjL8GbZXGL3Rvj0d
	 NGApLgCsm5zNnhrT4b7wY3/LM3Jo4rlA2jhQL19k=
Date: Fri, 27 Nov 2026 15:02:19 +0000
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: maz@kernel.org, oupton@kernel.org, fuad.tabba@linux.dev,
	joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, will@kernel.org, mark.rutland@arm.com,
	linux-perf-users@vger.kernel.org, catalin.marinas@arm.com,
	james.clark@linaro.org
Subject: Re: [RFC PATCH v7 07/28] KVM: arm64: Add KVM_ARM_VCPU_SPE VCPU
 feature
Message-ID: <awmbe4dRgEkgqL-O@raptor>
References: <20260903160623.315525-1-alexandru.elisei@arm.com>
 <20260903160623.315525-8-alexandru.elisei@arm.com>
 <atIr8IWcXcrjQ0wF@gremlin>
 <avX0-TDCOlQq-4iX@raptor>
 <avtEJaF27eHb_Ryd@gremlin>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <avtEJaF27eHb_Ryd@gremlin>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_070225_958579_DEE3A278 
X-CRM114-Status: GOOD (  31.11  )
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

On Mon, Nov 16, 2026 at 05:59:07PM +0000, Lorenzo Stoakes (ARM) wrote:
> On Thu, Nov 12, 2026 at 05:18:49PM +0000, Alexandru Elisei wrote:
> > Hi Lorenzo,
> >
> > On Fri, Oct 16, 2026 at 03:23:57PM +0100, Lorenzo Stoakes (ARM) wrote:
> > > On Thu, Sep 03, 2026 at 05:06:02PM +0100, Alexandru Elisei wrote:
> > > > Add a new VCPU feature that enables SPE virtualization when set by
> > > > userspace. KVM_VCPU_MAX_FEATURE will be bumped and the feature will
> > > > become selectable by userspace once SPE support in KVM is implemented.
> > >
> > > I guess it's also limited currently at this point in the series by
> > > KVM_CAP_ARM_SPE being unselectable as it stands I think?
> >
> > Yes, indirectly - KVM_CAP_ARM_SPE is advertised only when
> > kvm_supports_spe() is true, and KVM_ARM_VCPU_SPE also depends on
> > kvm_supports_spe(). CONFIG_KVM_ARM_SPE=y is required, but not sufficient,
> > for kvm_supports_spe() to be true. So all of this depends on the Kconfig
> > option, maybe I should document that in the capability doc.
> 
> Thanks that'd be good.

I documented the dependency between KVM_CAP_ARM_SPE and CONFIG_KVM_ARM_SPE in
the previous patch, where KVM_CAP_ARM_SPE is introduced.

> 
> >
> > >
> > > Maybe worth mentioning here that you're adding KVM_ARM_VPCU_SPE to the uapi,
> > > updating docs, etc.?
> >
> > I can mention it, but the short diff should speak for itself?
> 
> I think it's worth giving the intent of your changes in the commit message, it
> doesn't have to be much like 'Export to UAPI, document' etc. etc.

Done.

Thanks,
Alex

> 
> >
> > >
> > > >
> > > > Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> > >
> > > I wonder if there are any dependencies that need expressing in
> > > arch/arm64/kvm/config.c?
> > >
> > > In any case all LGTM, with mega-nit below addressed :):
> > >
> > > Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> > >
> > > > ---
> > > >  Documentation/virt/kvm/api.rst    | 2 ++
> > > >  arch/arm64/include/asm/kvm_spe.h  | 5 +++++
> > > >  arch/arm64/include/uapi/asm/kvm.h | 1 +
> > > >  arch/arm64/kvm/arm.c              | 7 +++++++
> > > >  4 files changed, 15 insertions(+)
> > > >
> > > > diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
> > > > index 1ed5c389c7a4..654736fac78c 100644
> > > > --- a/Documentation/virt/kvm/api.rst
> > > > +++ b/Documentation/virt/kvm/api.rst
> > > > @@ -3591,6 +3591,8 @@ Possible features:
> > > >  	  Depends on KVM_CAP_ARM_EL2_E2H0.
> > > >  	  KVM_ARM_VCPU_HAS_EL2 must also be set.
> > > >
> > > > +        - KVM_ARM_VCPU_SPE: Enable SPE for the CPU. Depends on KVM_CAP_ARM_SPE.
> > >
> > > Super nitty, sorry, but it seems other parts of the docs use tabs, whereas this
> > > uses spaces?
> >
> > Fixed.
> 
> Thanks!
> 
> >
> > Thanks,
> > Alex
> 
> --
> Cheers, Lorenzo
> 

