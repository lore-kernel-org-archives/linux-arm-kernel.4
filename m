Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66137606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 17:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0fpnPLn7;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=u/Jt9bDL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=BlY58mh9Hw/tgSMH5z15/+c8H0ljlIKjWB31zCng0sM=; b=0fpnPLn78PaXQTswEsGpm2K3ny
	HlM7SvCZ46m5SKz46qjm/Pj18fexoofhXOZkwBTXGZDeTy/UW3k4If9TSe3bIAKSh7Q0aDn46WA/l
	EQHdaZ+et8S9fxfqudKB6m7M6juzd4Sinsnmm3PTli840CS/JJ80EqqhFlDPmnou3KQP+BMiqZGPJ
	VVkDWpeosIPvBbJCiFzO+MW2U0dJYMWLJs6N9a4zCyfinWYegI6z814+X3A5tji2iju+Zf07cM1HO
	uwoJJxd1lj9SSRfWAVaGpJvrU1IMZadEBcIPBheVHkgecY8WB7i+eEleKsw8y3I/q3G8FyW7m0cz4
	sd27ouiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRYRx-0000000Ak62-3fHe;
	Thu, 12 Nov 2026 17:19:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRYRs-0000000Ak50-3XH0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 17:19:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 305411516;
	Thu, 12 Nov 2026 09:18:51 -0800 (PST)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EE7693F632;
	Thu, 12 Nov 2026 09:18:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794503934; bh=PMnroKYZu+m0u0h/6B9jMwGrR1fmbzde9UqBEKf/0sA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u/Jt9bDLrv1f6QNL1AEOhElHFgK1s4fLaLHscOU9PjRzYui4BbMl8SJka2h6VikLY
	 WJNC5gWbUoj1lZkjG+3kKbiM+UE2gl1/nt0oVpl+q+zL1RUd5J1qTihCq3E8Y5acfI
	 Rkht22WSzistnaD4kF7Nya7bqy8yDEr6UcYYWwb8=
Date: Thu, 12 Nov 2026 17:18:49 +0000
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
Message-ID: <avX0-TDCOlQq-4iX@raptor>
References: <20260903160623.315525-1-alexandru.elisei@arm.com>
 <20260903160623.315525-8-alexandru.elisei@arm.com>
 <atIr8IWcXcrjQ0wF@gremlin>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <atIr8IWcXcrjQ0wF@gremlin>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_091859_611150_AF8F2EA0 
X-CRM114-Status: GOOD (  21.64  )
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

On Fri, Oct 16, 2026 at 03:23:57PM +0100, Lorenzo Stoakes (ARM) wrote:
> On Thu, Sep 03, 2026 at 05:06:02PM +0100, Alexandru Elisei wrote:
> > Add a new VCPU feature that enables SPE virtualization when set by
> > userspace. KVM_VCPU_MAX_FEATURE will be bumped and the feature will
> > become selectable by userspace once SPE support in KVM is implemented.
> 
> I guess it's also limited currently at this point in the series by
> KVM_CAP_ARM_SPE being unselectable as it stands I think?

Yes, indirectly - KVM_CAP_ARM_SPE is advertised only when
kvm_supports_spe() is true, and KVM_ARM_VCPU_SPE also depends on
kvm_supports_spe(). CONFIG_KVM_ARM_SPE=y is required, but not sufficient,
for kvm_supports_spe() to be true. So all of this depends on the Kconfig
option, maybe I should document that in the capability doc.

> 
> Maybe worth mentioning here that you're adding KVM_ARM_VPCU_SPE to the uapi,
> updating docs, etc.?

I can mention it, but the short diff should speak for itself?

> 
> >
> > Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> 
> I wonder if there are any dependencies that need expressing in
> arch/arm64/kvm/config.c?
> 
> In any case all LGTM, with mega-nit below addressed :):
> 
> Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> 
> > ---
> >  Documentation/virt/kvm/api.rst    | 2 ++
> >  arch/arm64/include/asm/kvm_spe.h  | 5 +++++
> >  arch/arm64/include/uapi/asm/kvm.h | 1 +
> >  arch/arm64/kvm/arm.c              | 7 +++++++
> >  4 files changed, 15 insertions(+)
> >
> > diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
> > index 1ed5c389c7a4..654736fac78c 100644
> > --- a/Documentation/virt/kvm/api.rst
> > +++ b/Documentation/virt/kvm/api.rst
> > @@ -3591,6 +3591,8 @@ Possible features:
> >  	  Depends on KVM_CAP_ARM_EL2_E2H0.
> >  	  KVM_ARM_VCPU_HAS_EL2 must also be set.
> >
> > +        - KVM_ARM_VCPU_SPE: Enable SPE for the CPU. Depends on KVM_CAP_ARM_SPE.
> 
> Super nitty, sorry, but it seems other parts of the docs use tabs, whereas this
> uses spaces?

Fixed.

Thanks,
Alex

