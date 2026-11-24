Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 231B5606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 22:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3NkkptCm;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=o2vpPnrm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=WkLgW+c6Vs03pawnWwBT2nJkyF8m6BmAQ32Lw7TCuco=; b=3NkkptCmCZymrIsBBz75cZUPmO
	a+IhQK2N8KbS1o+4aAR/3OrzT1ptZykeQXe1COB814Ff/GcfDt1/lR4Jy0KzR2FvCnsw0RI73vFTV
	teDdUxWK2FKgzOZcAHGVS7jjH9M8XWPWu7U0tAATs0ZjLPnqHPuDkFfLJlMC55eZX5rE05kvvO0tc
	70vn6fLz0WyAotfeKiC9ZiSvR3idcFuwxAfYJb+6sXylhHRszxWKxrpdFkJyC3EKydqi68wEy+qHP
	8mW52tN3MddQlFYeEN61Yhmx8Mla+FqEytJxAdKjyYXmPtLApjLBBamAZzlLcfiePHzbf/3/eiVqB
	EBSXcAcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVz0k-00000007zi2-3UNq;
	Tue, 24 Nov 2026 22:29:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVz0j-00000007zhu-0acj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 22:29:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CFB6260627;
	Tue, 24 Nov 2026 22:29:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02D111F000C4;
	Tue, 24 Nov 2026 22:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795559351;
	bh=WkLgW+c6Vs03pawnWwBT2nJkyF8m6BmAQ32Lw7TCuco=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=o2vpPnrmCxtOS8P4HVMlKGd/mwISEMkCQRNhDBmEksIcnnp4Ig8q/vKSsvXIk1N92
	 gq2c8oMJW97kGIf8vTTNEC55YbRTgmE7EsPpgpY71ZmAA5mN8Im31aoxF+g+0Xa31D
	 ZMUIEhm/KJpYM3iJNv1PGvI3m00mxPUsr0hb4bqC1xgPIj9rETcK42HhQD3QgK15JB
	 l5WF86ZE2CQA6vbKe/1b5JS5s+x8Mx4l0NjHrFs1PJxyJPr0D6K5RAacpwY8hJvI/X
	 XD/wFKxYwcO9mEch31+86IlVIegcSheoZKzm0XYpj+SApYC3/dKZp+64j9frnHmoq2
	 UTnxdnXBiZKLw==
Date: Tue, 24 Nov 2026 14:29:09 -0800
From: Oliver Upton <oupton@kernel.org>
To: Nathan Chen <nathanc@nvidia.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>, Fuad Tabba <fuad.tabba@linux.dev>,
	Marc Zyngier <maz@kernel.org>, Tom Matthias <tmatthias@nvidia.com>,
	Shameer Kolothum Thodi <skolothumtho@nvidia.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Julian Miller <julianmiller@nvidia.com>
Subject: Re: [RFC PATCH 0/6] KVM: arm64: nv: Grow the shadow S2 MMU pool on
 demand
Message-ID: <awYPtXVeY1NYeTla@kernel.org>
References: <20261124211218.2751086-1-nathanc@nvidia.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261124211218.2751086-1-nathanc@nvidia.com>
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

Hi Nathan,

On Tue, Nov 24, 2026 at 01:12:12PM -0800, Nathan Chen wrote:
> A nested-capable VM gets 2 shadow stage-2 MMUs per vcpu. Once the guest
> hypervisor runs more nested VMs than that, nearly every nested context
> switch recycles a live MMU and spikes host CPU usage.
> 
> This series lets KVM grow the shadow MMU pool on demand when the pool
> is too small, up to a host-wide VMID budget. It also parks grown MMUs
> on a guest TLBI ALLE1 and when a guest range invalidation leaves them
> empty, in order to return unused capacity.

Thanks for taking a look at the problem. There's no argument that we
need to do something, the existing MMU allocation policy was good enough
for doing nested development and would get replaced eventually.

With that said, I feel rather strongly that we should not invest further
in the MMU array because it is quite inflexible. On top of that we need
an actual eviction policy that selects cold MMUs as victims instead of
the current round robin approach. I don't think you need to do anything
special on the invalidation side with a good eviction policy.

I think this is what we need:

 - A VM-wide hashtable for storing stage-2 MMUs, keyed off of
   {VTCR_EL2, VTTBR_EL2, HCR_EL2.VM} to align with how we handle TLB
   match at stage-2. The hashtable can be dimensioned based on a
   configurable VM limit for shadow stage-2 MMUs.

 - A state tracking mechanism for victim selection. An LRU list seems
   like a reasonable starting point.

 - RCU replacement of the evicted MMU. I need to think about it a bit
   more but you should be able to reuse the PGD in the new MMU context
   as well since we know that no vCPU holds a reference on the victim.
   That ought to be the goal anyway.

That should allow us to dynamically allocate MMUs while also improving
upon the current behavior for constrained MMU allocations.

Thanks,
Oliver

