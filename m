Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF55606A339
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 17:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4CIwSaa7;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eLJVFGak
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Hx/zwz9ol4l1LDJ7Dd/bGQfgA1YUM37wVvRIuAH27ZI=; b=4CIwSaa7MofhwfHSQbmpoZxBR9
	RSvVIQYSQ6ydKWJpHqE8/n0L0tstECHG6g8Br+PhTg0ATxcRgxuFfdavmqt8cOu5lKQl5028hjLdI
	TGc+cARF9TB/hjj0l3hZFHHpPqhQYWOiyHU7cE56dFvXY46Hn5k8XbR1tEVkUALII0kEojy6ZpC6L
	LEOr0TL9nBW/ONKPm5Qa3gSLVI0Pr2yyZUT+q28w2jM4TEkIdRSGzRpojUOcjcI2f48Q9nRWiZ8L3
	wM9WmjFjp8QsJ8xChT2vGJte8r5ZKtVGQeazBxO4nrHb4TLk57Yrv6dSIUjL7STygL3hAn+4i7J5V
	ELxc4blg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT0zZ-00000003TTe-3mxl;
	Mon, 16 Nov 2026 17:59:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT0zZ-00000003TTN-0LJK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 17:59:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 60A666147C;
	Mon, 16 Nov 2026 17:59:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C9CC1F000CC;
	Mon, 16 Nov 2026 17:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794851984;
	bh=Hx/zwz9ol4l1LDJ7Dd/bGQfgA1YUM37wVvRIuAH27ZI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eLJVFGakU4VSc4iWqh0M+dGNOpQzetPnRCEVSi6rgv/tiL8L8piS5IooI/qP9Blps
	 AhmrhJQrCmNZg383iGl7FcR5WU4AXnJzQ4OMfA5DuitD1n+DX8lqD1s5Gqv6Mf7PL1
	 OZ29uW8hHtpor9dJSN8UqUzLNIGNWY4zuQ8/1ZMdxTcoRxfoJ9dQQw5ddxBPKXAMbW
	 E9JRDKpbOLFj499hFhuVGnPiXhcRPyj0c1CaF4A+DRAHr/G1furIFGBV583s1yVDkW
	 HnXcBkFZ9Zjp2L/oooUPrmIVu0wY4S9E1M0UM5uiikYAd1W8ofp3YYjNOVOcEQbxHM
	 YES16R7BXG2IA==
Date: Mon, 16 Nov 2026 17:59:07 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: maz@kernel.org, oupton@kernel.org, fuad.tabba@linux.dev, 
	joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	will@kernel.org, mark.rutland@arm.com, linux-perf-users@vger.kernel.org, 
	catalin.marinas@arm.com, james.clark@linaro.org
Subject: Re: [RFC PATCH v7 07/28] KVM: arm64: Add KVM_ARM_VCPU_SPE VCPU
 feature
Message-ID: <avtEJaF27eHb_Ryd@gremlin>
References: <20260903160623.315525-1-alexandru.elisei@arm.com>
 <20260903160623.315525-8-alexandru.elisei@arm.com>
 <atIr8IWcXcrjQ0wF@gremlin>
 <avX0-TDCOlQq-4iX@raptor>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <avX0-TDCOlQq-4iX@raptor>
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

On Thu, Nov 12, 2026 at 05:18:49PM +0000, Alexandru Elisei wrote:
> Hi Lorenzo,
>
> On Fri, Oct 16, 2026 at 03:23:57PM +0100, Lorenzo Stoakes (ARM) wrote:
> > On Thu, Sep 03, 2026 at 05:06:02PM +0100, Alexandru Elisei wrote:
> > > Add a new VCPU feature that enables SPE virtualization when set by
> > > userspace. KVM_VCPU_MAX_FEATURE will be bumped and the feature will
> > > become selectable by userspace once SPE support in KVM is implemented.
> >
> > I guess it's also limited currently at this point in the series by
> > KVM_CAP_ARM_SPE being unselectable as it stands I think?
>
> Yes, indirectly - KVM_CAP_ARM_SPE is advertised only when
> kvm_supports_spe() is true, and KVM_ARM_VCPU_SPE also depends on
> kvm_supports_spe(). CONFIG_KVM_ARM_SPE=y is required, but not sufficient,
> for kvm_supports_spe() to be true. So all of this depends on the Kconfig
> option, maybe I should document that in the capability doc.

Thanks that'd be good.

>
> >
> > Maybe worth mentioning here that you're adding KVM_ARM_VPCU_SPE to the uapi,
> > updating docs, etc.?
>
> I can mention it, but the short diff should speak for itself?

I think it's worth giving the intent of your changes in the commit message, it
doesn't have to be much like 'Export to UAPI, document' etc. etc.

>
> >
> > >
> > > Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> >
> > I wonder if there are any dependencies that need expressing in
> > arch/arm64/kvm/config.c?
> >
> > In any case all LGTM, with mega-nit below addressed :):
> >
> > Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> >
> > > ---
> > >  Documentation/virt/kvm/api.rst    | 2 ++
> > >  arch/arm64/include/asm/kvm_spe.h  | 5 +++++
> > >  arch/arm64/include/uapi/asm/kvm.h | 1 +
> > >  arch/arm64/kvm/arm.c              | 7 +++++++
> > >  4 files changed, 15 insertions(+)
> > >
> > > diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
> > > index 1ed5c389c7a4..654736fac78c 100644
> > > --- a/Documentation/virt/kvm/api.rst
> > > +++ b/Documentation/virt/kvm/api.rst
> > > @@ -3591,6 +3591,8 @@ Possible features:
> > >  	  Depends on KVM_CAP_ARM_EL2_E2H0.
> > >  	  KVM_ARM_VCPU_HAS_EL2 must also be set.
> > >
> > > +        - KVM_ARM_VCPU_SPE: Enable SPE for the CPU. Depends on KVM_CAP_ARM_SPE.
> >
> > Super nitty, sorry, but it seems other parts of the docs use tabs, whereas this
> > uses spaces?
>
> Fixed.

Thanks!

>
> Thanks,
> Alex

--
Cheers, Lorenzo

