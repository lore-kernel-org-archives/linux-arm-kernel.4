Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33577606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 13:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dXp7/bV9;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cSQRCE9r
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=qHbHYz43YWfZNtecSxmfo42fT9cp3l2S8acs9GzZ4jY=; b=dXp7/bV9zRXyhtB42Dn5ky4kuu
	z/15Yvk2kwmDew/+lgZVJqF9ZGnQMSoCWM4D7aggPoO4VYAep8J5ZrEKctYs2bcG6pI2pahwZZIgD
	lgOOcMERa8Cxtu2U+ouETqQTr9dc9JJSRYq1E/3/IZWx/2mXI70jVfzvCrdCsUSDIKBmcn+HIX4od
	4xJT6ggn0MC3B2ggrxpI2AM3vT2N2bxXhi/1UPjX2Y24RrHf7s/5UIyR3LvJbZOnXxVAQNHSEBg83
	djyAdbskCVlUqv19GIoUgAvqwKbuiu6GdssBH4M+tgyh98VbROwLZIl5A1+44lRrqtBovVLh21JGt
	aXi5FnnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWvhZ-0000000GESX-1rrV;
	Fri, 27 Nov 2026 13:09:21 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWvhY-0000000GES8-0Zib
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 13:09:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 82A6E415B5;
	Fri, 27 Nov 2026 13:09:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EC701F000C1;
	Fri, 27 Nov 2026 13:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795784959;
	bh=qHbHYz43YWfZNtecSxmfo42fT9cp3l2S8acs9GzZ4jY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cSQRCE9rtZWbqs8BskTfYhaLYnl4o3V65Leu8Y3BSZ23IXSzi6NNdUvEAN83FudU1
	 vpbuBzm6ryzEC5VP26oO/V/MsRfa+53D5YLRl+Mr14crccXQuDiutKKWxUz2hrOO4N
	 3rPKL4eBBwSmCjTWhp48fdnr5sYNI1Og/nmPLnAJ/2fbSjhirmN0fDJZd7Am//+wJE
	 k16dOvqA2pfGde6rTks4Ctm+wVdJbl2YfqsVXfbyDT548hRwUTdmB/RR4IExxOS6lf
	 FThf1XFd8RW2zn4MF94XF8wW65TXPTINu2xDyZGiO3AXU6T2mGw0SIIQC8QkIdlIcy
	 x8CoGvHq9idhg==
Date: Fri, 27 Nov 2026 13:09:11 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Leonardo Bras <leo.bras@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Christoffer Dall <christoffer.dall@linaro.org>, Jintack Lim <jintack.lim@linaro.org>, 
	Wei-Lin Chang <weilin.chang@arm.com>, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Usama Arif <usama.arif@linux.dev>, stable@vger.kernel.org
Subject: Re: [PATCH] KVM: arm64: Top up the mmu memcache on user fault for NV
Message-ID: <awl76RV-OOU7i0xm@gremlin>
References: <20261126-fix-nv-cache-topup-v1-1-a22c936872fe@kernel.org>
 <awlwTGHVjoO72YFw@LeoBrasDK>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <awlwTGHVjoO72YFw@LeoBrasDK>
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 27, 2026 at 11:58:04AM +0000, Leonardo Bras wrote:
> On Thu, Nov 26, 2026 at 05:28:29PM +0000, Lorenzo Stoakes (ARM) wrote:
> > The S2 user fault path tops up the MMU memcache (used for page table
> > pre-allocation as the point at which page tables are installed may not
> > allocate) except when:
> >
> > * It's a permission fault AND
> > * dirty page logging is disabled AND
> > * pKVM is disabled
> >
> > At which point it is assumed no page table will be allocated.
> >
> > However nested virtualisation adds another edge case - the mapping size of
> > a shadow S2 is clamped to that of the guest's own S2. If the guest
> > hypervisor replaces a block mapping with a table, a permission fault on the
> > shadow block has to be mapped at PAGE_SIZE, which requires a page table to
> > collapse the block into.
>
> Can you please expand on how would that happen?
>
> IIUC when a guest hypervisor replaces a block mapping with a table, it
> calls a tlbi in the range, and L0 will trap and remove the Shadow S2 entry,
> then next access shouldn't be a permission but a translation fault.
>
> What am I missing?

That's a great point, actually :)

But nothing really enforces that L1 does that for sure, even a bug could produce
that, and you really want to avoid the host getting in bother in that case.

(The host kernel has to behave properly no matter what guests do).

I was able to (get claude to) repro this easily.

But actually I think there's another case too, even assuming everything's
well-behaved:

* vCPU B: Writes to a read-only shadow block -> permission fault, exits
  to the host.

* vCPU A: Concurrently does its break/TLBI/make on the L1 S2, replacing
  the block with writable pages. The TLBI clears the shadow block.

* vCPU B: Now handles the fault. It's still a permission fault as far as
  the ESR is concerned so we skip the top-up, but the L1 S2 now says
  page rather than block, so we go to map a page and have to allocate
  page table(s) for it.

This needs the mapping size to have changed (otherwise we just try to relax
permissions, which doesn't allocate) which can happen when splitting,
replacing pages with a THP page, etc.

In general I think just topping up regardless is the better route, but for
a backport this is the least big change to fix this.

>
> Thanks!
> Leo

--
Cheers, Lorenzo

