Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2298606A33D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 13:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dPtRfBon;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=b8Usqek3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=qyBKwFksJNX/3zANmADcweL35ZbCo7zw0f36je+aSa0=; b=dPtRfBonNymcd2
	/6HLaOGkzyCG7mPLiVMkROnfO21Oiy6VF0+So5/yacAITx7olo+aUBzIbDMn8pgg2DLTLuyeyAnZH
	P7PC9m294ZhzwJfW8lGaP8xBwOaXuz1/dhqp7fllV5VaWnQTyYAKurdtoNEVCj3pTQnWf6vquXuNT
	9aZPOqYefKtuYmBq7JK3DAAYMWkT3ao+06PKNZ0fGOZ7g8QueMFGOVo+hOIALYT2G84UIVq02GKTh
	GHponrfF367+LAF/ZoOlSUFYMKWdrW2vzLgnPJkKFWKfBfvjWtuBhLin7zUUhUerH+kvNtbSBBTMq
	5ilrDGzupN7g0/oqwsvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQPqD-00000000tas-13Hm;
	Mon, 09 Nov 2026 13:55:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQPq9-00000000taI-2Xbc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 13:55:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9CF7114BF;
	Mon,  9 Nov 2026 05:55:13 -0800 (PST)
Received: from LeoBrasDK.cambridge.arm.com (LeoBrasDK.cambridge.arm.com [10.2.212.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6C3F13F632;
	Mon,  9 Nov 2026 05:55:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794232516; bh=KJJLhpniQZUmQ77hpm1zsDXOiW1CCXxKt62dmhbtma8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=b8Usqek3kaVUOB1RB0xwIA04Lp+O+RMitLE1+TFQAq4X64T9fjtId114taMH3frRl
	 uKaZaRYI3VzAPYg9BkjXhmSjl9Z9fCVabsIalNzEHG3yDozSmuQbmFGDj9pvCUCHl0
	 RU9u7X30AsjjJzRT1Z8wrFgLwHe0DDdE1gdE9jI4=
From: Leonardo Bras <leo.bras@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Leonardo Bras <leo.bras@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v4 2/3] KVM: arm64: Introduce KVM_PGTABLE_WALK_SKIP_LEVEL* walk flags
Date: Mon,  9 Nov 2026 13:55:05 +0000
Message-ID: <avHQubuK6r3k9anX@LeoBrasDK>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <60fe23f4-4fca-41b6-8489-a28ab7b281f9@arm.com>
References: <20261106161240.1345126-1-leo.bras@arm.com> <20261106161240.1345126-3-leo.bras@arm.com> <60fe23f4-4fca-41b6-8489-a28ab7b281f9@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_055519_577472_70D11623 
X-CRM114-Status: GOOD (  30.95  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 06, 2026 at 05:02:31PM +0000, Suzuki K Poulose wrote:
> On 06/11/2026 16:12, Leonardo Bras wrote:
> > Add new walking flags KVM_PGTABLE_WALK_SKIP_LEVEL{0-3}.
> > When used, they make the kvm_pgtable_walk() skip the given level, as well
> > as levels higher than that.
> > 
> > Being able to skip levels substancially decreases the runtime of a
> 
> minor nit: substantially

fixed!

> 
> > pagetable walk when the callback function does nothing on that level.
> > 
> > Signed-off-by: Leonardo Bras <leo.bras@arm.com>
> > ---
> >   arch/arm64/include/asm/kvm_pgtable.h | 14 ++++++++++++++
> >   arch/arm64/kvm/hyp/pgtable.c         | 16 +++++++++++++---
> >   2 files changed, 27 insertions(+), 3 deletions(-)
> > 
> > diff --git a/arch/arm64/include/asm/kvm_pgtable.h b/arch/arm64/include/asm/kvm_pgtable.h
> > index 41a8687938eb..5f37ceef8d63 100644
> > --- a/arch/arm64/include/asm/kvm_pgtable.h
> > +++ b/arch/arm64/include/asm/kvm_pgtable.h
> > @@ -311,31 +311,45 @@ typedef bool (*kvm_pgtable_force_pte_cb_t)(u64 addr, u64 end,
> >    * @KVM_PGTABLE_WALK_SHARED:		Indicates the page-tables may be shared
> >    *					with other software walkers.
> >    * @KVM_PGTABLE_WALK_IGNORE_EAGAIN:	Don't terminate the walk early if
> >    *					the walker returns -EAGAIN.
> >    * @KVM_PGTABLE_WALK_SKIP_BBM_TLBI:	Visit and update table entries
> >    *					without Break-before-make's
> >    *					TLB invalidation.
> >    * @KVM_PGTABLE_WALK_SKIP_CMO:		Visit and update table entries
> >    *					without Cache maintenance
> >    *					operations required.
> > + * @KVM_PGTABLE_WALK_SKIP_LEVEL0:	Skip visiting level 0+ entries
> > + * @KVM_PGTABLE_WALK_SKIP_LEVEL1:	Skip visiting level 1+ entries
> > + * @KVM_PGTABLE_WALK_SKIP_LEVEL2:	Skip visiting level 2+ entries
> > + * @KVM_PGTABLE_WALK_SKIP_LEVEL3:	Skip visiting level 3 entries
> >    */
> >   enum kvm_pgtable_walk_flags {
> >   	KVM_PGTABLE_WALK_LEAF			= BIT(0),
> >   	KVM_PGTABLE_WALK_TABLE_PRE		= BIT(1),
> >   	KVM_PGTABLE_WALK_TABLE_POST		= BIT(2),
> >   	KVM_PGTABLE_WALK_SHARED			= BIT(3),
> >   	KVM_PGTABLE_WALK_IGNORE_EAGAIN		= BIT(4),
> >   	KVM_PGTABLE_WALK_SKIP_BBM_TLBI		= BIT(5),
> >   	KVM_PGTABLE_WALK_SKIP_CMO		= BIT(6),
> > +	/* SKIP_LEVEL* flags should not be split nor reordered */
> > +	KVM_PGTABLE_WALK_SKIP_LEVEL0		= BIT(7),
> > +	KVM_PGTABLE_WALK_SKIP_LEVEL1		= BIT(8),
> > +	KVM_PGTABLE_WALK_SKIP_LEVEL2		= BIT(9),
> > +	KVM_PGTABLE_WALK_SKIP_LEVEL3		= BIT(10),
> >   };
> > +#define KVM_PGTABLE_WALK_SKIP_LEVELS 	(KVM_PGTABLE_WALK_SKIP_LEVEL0 | \
> > +					 KVM_PGTABLE_WALK_SKIP_LEVEL1 | \
> > +					 KVM_PGTABLE_WALK_SKIP_LEVEL2 | \
> > +					 KVM_PGTABLE_WALK_SKIP_LEVEL3 )
> > +
> >   struct kvm_pgtable_visit_ctx {
> >   	kvm_pte_t				*ptep;
> >   	kvm_pte_t				old;
> >   	void					*arg;
> >   	struct kvm_pgtable_mm_ops		*mm_ops;
> >   	u64					start;
> >   	u64					addr;
> >   	u64					end;
> >   	s8					level;
> >   	enum kvm_pgtable_walk_flags		flags;
> > diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
> > index 7a51f78b6446..80744478c810 100644
> > --- a/arch/arm64/kvm/hyp/pgtable.c
> > +++ b/arch/arm64/kvm/hyp/pgtable.c
> > @@ -137,20 +137,27 @@ static bool kvm_pgtable_walk_continue(const struct kvm_pgtable_walker *walker,
> >   	 * Ignore the return code altogether for walkers outside a fault handler
> >   	 * (e.g. write protecting a range of memory) and chug along with the
> >   	 * page table walk.
> >   	 */
> >   	if (r == -EAGAIN)
> >   		return walker->flags & KVM_PGTABLE_WALK_IGNORE_EAGAIN;
> >   	return !r;
> >   }
> > +static bool kvm_pgtable_skip_level(s8 level, enum kvm_pgtable_walk_flags flags)
> > +{
> > +	u32 skip = FIELD_GET(KVM_PGTABLE_WALK_SKIP_LEVELS, flags);
> > +
> > +	return unlikely(skip && level >= ffs(skip) - 1);
> > +}
> > +
> >   static int __kvm_pgtable_walk(struct kvm_pgtable_walk_data *data,
> >   			      struct kvm_pgtable_mm_ops *mm_ops, kvm_pteref_t pgtable, s8 level);
> >   static inline int __kvm_pgtable_visit(struct kvm_pgtable_walk_data *data,
> >   				      struct kvm_pgtable_mm_ops *mm_ops,
> >   				      kvm_pteref_t pteref, s8 level)
> >   {
> >   	enum kvm_pgtable_walk_flags flags = data->walker->flags;
> >   	kvm_pte_t *ptep = kvm_dereference_pteref(data->walker, pteref);
> >   	struct kvm_pgtable_visit_ctx ctx = {
> > @@ -185,35 +192,35 @@ static inline int __kvm_pgtable_visit(struct kvm_pgtable_walk_data *data,
> >   	 * into a newly installed or replaced table.
> >   	 */
> >   	if (reload) {
> >   		ctx.old = READ_ONCE(*ptep);
> >   		table = kvm_pte_table(ctx.old, level);
> >   	}
> >   	if (!kvm_pgtable_walk_continue(data->walker, ret))
> >   		return ret;
> > -	if (!table) {
> > +	if (!table || kvm_pgtable_skip_level(level + 1, ctx.flags)) {
> >   		data->addr = ALIGN_DOWN(data->addr, kvm_granule_size(level));
> >   		data->addr += kvm_granule_size(level);
> >   		goto out;
> >   	}
> >   	childp = (kvm_pteref_t)kvm_pte_follow(ctx.old, mm_ops);
> >   	ret = __kvm_pgtable_walk(data, mm_ops, childp, level + 1);
> >   	if (!kvm_pgtable_walk_continue(data->walker, ret))
> >   		return ret;
> > -	if (ctx.flags & KVM_PGTABLE_WALK_TABLE_POST)
> > +out:
> > +	if (table && ctx.flags & KVM_PGTABLE_WALK_TABLE_POST)
> >   		ret = kvm_pgtable_visitor_cb(data, &ctx, KVM_PGTABLE_WALK_TABLE_POST);
> > -out:
> >   	if (kvm_pgtable_walk_continue(data->walker, ret))
> >   		return 0;
> >   	return ret;
> >   }
> >   static int __kvm_pgtable_walk(struct kvm_pgtable_walk_data *data,
> >   			      struct kvm_pgtable_mm_ops *mm_ops, kvm_pteref_t pgtable, s8 level)
> >   {
> >   	u32 idx;
> > @@ -242,20 +249,23 @@ static int _kvm_pgtable_walk(struct kvm_pgtable *pgt, struct kvm_pgtable_walk_da
> >   	u32 idx;
> >   	int ret = 0;
> >   	u64 limit = BIT(pgt->ia_bits);
> >   	if (data->addr > limit || data->end > limit)
> >   		return -ERANGE;
> >   	if (!pgt->pgd)
> >   		return -EINVAL;
> > +	if (kvm_pgtable_skip_level(pgt->start_level, data->walker->flags))
> > +		return 0;
> > +
> 
> Should we rather return an error here ? A walk skipping the start level,
> is that any meaningful ?
> 

My rationale on not returning error is that it may be ok for some routine 
to call a walker on a pagetable range just to be sure, even if it actually 
does nothing.

I take that this happens based on the split walker being called on
kvm_arch_mmu_enable_log_dirty_pt_masked() multiple times in the same range, 
even though it's already split, for instance.

But I am fine on changing it to return an error here if it's important in 
some scenario.

Thanks!
Leo 

