Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BB83606A682
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 10:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rL+pfPAB;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=G4vLiDGG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=030mMfUA3CgdGvOfPr2ROX9zWpZyZC3p0L8bknHDb9Y=; b=rL+pfPABTURH6UTXe3p3Ehosl7
	R9HCis1vsCWsZBGDr4AlLHSguP9v9WrcGRvuWQaBbZbCX8ocYPHIq5hvrQF7WPxQTn2MSaDPW7vb8
	+eY0QQOkRZAt25Vpooa+y/N+mOqgD4Hf0fZzuXo1UYWf9bJVR9OFwEWyGZfvvqv8jCMwlVYJtOqaw
	qENiocOT+mbj6guu7qRzOYpzHuOr5hayux/k7VyCUefSSnS8gKI1znltJyKd+GAZqKAoY2yVu+Ob3
	xsZ/hLGKXIDSPQ6b9GGeAHTUNNZPNlZQgjAImOgXfVJlHjVYY/8VGwBWfUJ/Jk+E6NeIMBrawmSV0
	0wxCBjjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW9k2-00000009OdF-0Kbt;
	Wed, 25 Nov 2026 09:56:42 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW9jx-00000009OcT-3xVI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 09:56:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 07BD1339;
	Wed, 25 Nov 2026 01:56:34 -0800 (PST)
Received: from thinkpad-e142931.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E7A013F86F;
	Wed, 25 Nov 2026 01:56:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795600596; bh=FcV8Pf60rmiTE/HQHTp46CgyrXFeo+tXVbv4KqGJRPY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G4vLiDGGblmvMsSfpGOhYy1HayDIRGyISeVLSN9pYp6SUb4+4QfYEPa1g/C0KVRNY
	 Yo2m5pVba4FdLbUYT7Qbww9Alz+rEPjJK6ME4Di5gr8ShGwSK+2P+gWb7n+NIToNkm
	 jjR+uiEoAU54KbMVBC8W9YYYX3FWmEPjdK0E4pTw=
Date: Wed, 25 Nov 2026 09:56:18 +0000
From: Wei-Lin Chang <weilin.chang@arm.com>
To: Colton Lewis <coltonlewis@google.com>, Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Fuad Tabba <fuad.tabba@linux.dev>, Steffen Eiden <seiden@linux.ibm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Dan Carpenter <dan@pereq.eu>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] KVM: arm64: nv: Discard undersized TTL hints in
 compute_tlb_inval_range()
Message-ID: <n4ii5ih6szqxjklqxbqzun3bjd4saku3aqqvhq4wf4kq3dipoo@3r2j3exwocw5>
References: <20261123232647.3733149-1-coltonlewis@google.com>
 <20261123232647.3733149-2-coltonlewis@google.com>
 <867bi2z87n.wl-maz@kernel.org>
 <20261124202215.3731849-1-coltonlewis@google.com>
 <87a4my7yhg.wl-maz@kernel.org>
 <20261124221616.4155034-1-coltonlewis@google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261124221616.4155034-1-coltonlewis@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_015638_145213_DB347A9C 
X-CRM114-Status: GOOD (  22.24  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 24, 2026 at 10:16:16PM +0000, Colton Lewis wrote:
> On Tue, 24 Nov 2026 20:42:19 +0000, Marc Zyngier <maz@kernel.org> wrote:
> > On Tue, 24 Nov 2026 20:22:15 +0000,
> > Colton Lewis <coltonlewis@google.com> wrote:
> > > [1] only catches TTL hints smaller than host PAGE_SIZE. It does not
> > > catch a hint that is >= PAGE_SIZE but smaller than the mapped block,
> > > such as a 4kB L3 hint on a 2MB block on a 4kB host.
> >
> > Why do you think this makes *any* difference? The hint passed by the
> > guest is utter bollocks, and the best thing would be to not invalidate
> > anything. It's just too invasive to do elegantly.
> 
> Architecturally [1] is fine for the TLB, and before guest_s2_mappings
> landed in v7.4-rc1 clearing the block was harmless. The problem with [1]
> is a host memory leak in kvm_pgtable_stage2_unmap_tracked():
> 
> 1. L2 faults in a 2MB block. kvm_s2_fault_map() installs a 2MB block PTE
>    and kvm_record_guest_s2_mapping() inserts a 2MB
>    struct kvm_guest_s2_mapping into both interval trees.
> 2. L1 runs TLBI IPAS2E1IS with a 4kB L3 TTL hint (4kB == PAGE_SIZE, so
>    [1] returns 4kB).
> 3. kvm_pgtable_stage2_unmap(..., SZ_4K) clears the entire 2MB block PTE.
> 4. kvm_remove_guest_s2_mappings(..., SZ_4K) skips removing the 2MB entry
>    because a 4kB range does not enclose it.
> 5. L2 touches the address again, faults because the PTE was cleared, and
>    allocates another 2MB tracking entry.
> 
> Looping steps 2-5 lets an L1 guest leak one struct kvm_guest_s2_mapping
> per iteration until a larger unmap or VM teardown (I measured 832kB of
> slab_unreclaimable growth over 8192 iterations) and turns later TLBIs on
> that range into linear walks under write_lock(&kvm->mmu_lock). Patch 2
> avoids exact duplicates for the same (nested, canonical) pair, but
> remapping the nested IPA to different canonical IPAs still leaves each
> stale entry behind.
> 
> If you prefer not to touch compute_tlb_inval_range() beyond [1], another
> option is keeping [1] as-is and dropping the cleared tracking entry in
> kvm_remove_guest_s2_mappings() when a partial overlap leaves no valid
> mapping beneath it (zero cost on valid hints).

For the other option, how can we recognize when a tracking entry can be
safely removed?
i.e. No more shadow mapping in the tracked nipa range.

We don't even know for certain what shadow mappings exist in the first
place.

Thanks,
Wei-Lin Chang

