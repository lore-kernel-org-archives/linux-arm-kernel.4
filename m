Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37B91606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 04:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OZjqbHyX;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=WvdJsXl6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=jES9287MH9jWQ+5Q+HNtKHVTJlglstu0zwzo0JLxghQ=; b=OZjqbHyXJmdxsJktACy8F9Ujy+
	bIx/uroHSIFslicq4IK1/mRFZ6q5/HxRMtinV8I880lRGuMCULgykBQEa1avMb98gqH0LYNjVbGKZ
	7Ni9Ct9X7OjWSG6ckVwJTfj1b9lorZo/c6k5BGySiYufoBJZ0QFp+AkDPHMEWbD1zxdk/xtTtwA7b
	qrBio90Lt4VaOAT8x9AbOC07trp4I205oNZbLZyw7sLWRRQ7kYQmSsEmDIHJ6ebKEedJBiBGfjNF8
	2UPHQ/3TekPr0EHJgSPMlyMv93drNFfNGCGtANyofTjwxVTgCNORYt84sIzBJZwEctQx2oFaBRSd7
	H1cqRoYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW4jj-00000008OVZ-3ovO;
	Wed, 25 Nov 2026 04:36:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW4jg-00000008OV6-0LAX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 04:36:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 51F1E339;
	Tue, 24 Nov 2026 20:35:53 -0800 (PST)
Received: from localhost (a085714.arm.com [10.164.19.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7362C3F86C;
	Tue, 24 Nov 2026 20:35:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795581356; bh=WlnWqEgxHO9OwEFiPYTA4lAxgT8kQaGYI8IyY6i07ig=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WvdJsXl66Zo/MMmirsJhxVtTutvItNPxsf2hjTwX8JArGnZY1sqlJnFnZxUoci7C6
	 M4J5pEg+e+fg3cxlVQ3dFhXFyitJv7vnskpqvh3rclkYNRgMFSfnrx9Z/Cdr/JMwKE
	 7dLyjzgFZBoJAJm8ecQJ8l4oHqEQa4b/CunjKtGE=
Date: Wed, 25 Nov 2026 10:05:52 +0530
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com, 
	will@kernel.org, Ryan Roberts <ryan.roberts@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, Lorenzo Stoakes <ljs@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH V3 00/14] arm64/mm: Enable 128 bit page table entries
Message-ID: <a54bdqfzj4eyoaaiekxxeqi27rc6pu6z2uufv3lblbyujclz36@egotqjcxv653>
References: <20261117070613.1183243-1-anshuman.khandual@arm.com>
 <20261120190525.GC1133597@ziepe.ca>
 <aqcypbxidjbmjhuiujg2krseuy7v4lofrlq3upl4s7yjiq6bh2@3s4jqisdrkgd>
 <20261124135424.GL9566@ziepe.ca>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261124135424.GL9566@ziepe.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_203600_253936_772D171F 
X-CRM114-Status: GOOD (  22.86  )
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
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 24, 2026 at 09:54:24AM -0400, Jason Gunthorpe wrote:
> On Tue, Nov 24, 2026 at 09:29:27AM +0530, Anshuman Khandual wrote:
> > On Fri, Nov 20, 2026 at 03:05:25PM -0400, Jason Gunthorpe wrote:
> > > On Tue, Nov 17, 2026 at 12:35:59PM +0530, Anshuman Khandual wrote:
> > > > FEAT_D128 is a new arm architecture feature adding support for VMSAv9-128
> > > > translation system. FEAT_D128 is an optional feature from ARMV9.3 onwards.
> > > > arm64 platforms with FEAT_D128 enabled will now have two different memory
> > > > translation systems i.e VMSAv8-64 and VMSAv9-128.
> > > 
> > > Please don't forget to update arm_smmu_sva_supported()
> > 
> > Sure, thanks for the pointer.
> > 
> > Fow now will disable SVA with CONFIG_ARM_D128 enabled but later it can
> > be enabled back with SMMU_IDR5.D128 feature. I will probably fold back
> > the following change in the series.
> > 
> > --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c
> > +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c
> > @@ -205,6 +205,9 @@ bool arm_smmu_sva_supported(struct arm_smmu_device *smmu)
> >         unsigned long asid_bits;
> >         u32 feat_mask = ARM_SMMU_FEAT_COHERENCY;
> > 
> > +       if (IS_ENABLED(CONFIG_ARM64_D128))
> > +               return false;
> 
> That seems wrong if the arch code is enabling this based on a CPU IDR.

D128 translation gets enabled when CONFIG_ARM64_D128 is enabled and also
HW has FEAT_D128 as detected via ID_AA64MMFR3_EL1.D128.

Besides if CONFIG_ARM64_D128 is enabled on any HW which does not support
FEAT_D128 the kernel would not even boot as there is no dynamic fallback
to D64 translation in such cases.

Hence a running kernel with CONFIG_ARM64_D128 enabled is running in D128
translation mode for sure.

> 
> I would expect distro kernels to enable this kconfig unconditionally,
> so this will break SVA for everyone.

ARM64_D128 actually depends on EXPERT and hence it would not be enabled
unconditionally in distros ?

