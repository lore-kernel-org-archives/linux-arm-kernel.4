Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CD25606A337
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 18:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WbksCATm;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TKmit2Va
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=n6neBvr0wzOJ2VVH/LYidFqNZx3hE/M3bOlYTCRTmTM=; b=WbksCATmHaHVG/NETJCUQj+a1M
	tYanLwkVed/YlUz1X2CUV/APnr6RvbVo8LdukT8bYlyHp27vONT+ER8mxRCuAJPGakojgb6zse6Oy
	0rvyrbsdgqN2WaqSLIlUfoJsPBC11WFfgDU+L2VaAsO0JeI5gO416eBLql3NI9vXYRWNSBexQNtxu
	cusf4BmnIJwX1NJ4QNedDHsABAWOCrc6Ein1/9aOLASv7QaXffr1735tHYJojROTRdvoAnMqhyuOK
	NnvP4P6V6h8BzA7BJx5v05v9BX/uLVc5e3ugzXwofxrKJAarJKJDDOF9xjf+eLFuJNRKp/nEtvQTA
	jhZKAA5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPORD-0000000DMS7-3Fln;
	Fri, 06 Nov 2026 18:13:19 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPORC-0000000DMRs-354C
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 18:13:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 19FDA419C3;
	Fri,  6 Nov 2026 18:13:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4A8A1F0089F;
	Fri,  6 Nov 2026 18:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793988798;
	bh=n6neBvr0wzOJ2VVH/LYidFqNZx3hE/M3bOlYTCRTmTM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TKmit2VaRab5+O+N4YXufxsAnlcJcuUgT7MNO0yB/XKc1B52C+yRKs+wPcANe1x7K
	 Hj9OIF5b+4NTLzgkCJwL/hoUhsct01y/jJFkHqGhADUzZQVeq0G4vDdQm8Da4qhi7n
	 pd7hfnQsl0glx155UqBtcnnJ4ZbLW1GjtVjOL8hE/9LcClH8r4JeCJgPN96SR/iUf8
	 S+Ba+lgutXn5UoY6oFk5XuUjNqYRZXjbBteWGSdrRyQGT/geqU0z63OfydV5ftj7U1
	 ggAnHfZUfPsYQep15DmAW3PdDl6xjCgNj7zWg+lXsR/OpA6wbphhBJwgzj0yutfKBx
	 ipKf4ftOn7N8w==
Date: Fri, 6 Nov 2026 10:13:16 -0800
From: Oliver Upton <oupton@kernel.org>
To: Leonardo Bras <leo.bras@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v4 2/3] KVM: arm64: Introduce
 KVM_PGTABLE_WALK_SKIP_LEVEL* walk flags
Message-ID: <au4YvD_8B3PzbofZ@kernel.org>
References: <20261106161240.1345126-1-leo.bras@arm.com>
 <20261106161240.1345126-3-leo.bras@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261106161240.1345126-3-leo.bras@arm.com>
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

Hi Leo,

On Fri, Nov 06, 2026 at 04:12:37PM +0000, Leonardo Bras wrote:
> Add new walking flags KVM_PGTABLE_WALK_SKIP_LEVEL{0-3}.
> When used, they make the kvm_pgtable_walk() skip the given level, as well
> as levels higher than that.
> 
> Being able to skip levels substancially decreases the runtime of a
> pagetable walk when the callback function does nothing on that level.
> 
> Signed-off-by: Leonardo Bras <leo.bras@arm.com>

I'm still not crazy about using a flag per level... This is what I have
stuffed on top locally. I've got a similar oneline fix for patch #3 to
initialize the field with an offset.

Any opinions?

Thanks,
Oliver

commit cad2070228c4305b5a83ce0a4cfa4aaa3dc0eb44
Author: Oliver Upton <oupton@kernel.org>
Date:   Fri Nov 6 10:03:14 2026 -0800

    squash! KVM: arm64: Introduce KVM_PGTABLE_WALK_SKIP_LEVEL* walk flags
    
    KVM: arm64: Add support for early termination of table walk recursion
    
    Add a new field to the walk flags that represents an offset from the
    last level of the page table hierarchy at which recursion should
    terminate.

    Signed-off-by: Leonardo Bras <leo.bras@arm.com>
    [oliver: pass a numeric value instead of a flag per level]
    Signed-off-by: Oliver Upton <oupton@kernel.org>

diff --git a/arch/arm64/include/asm/kvm_pgtable.h b/arch/arm64/include/asm/kvm_pgtable.h
index 1d7a9125e522..18dcce3c506e 100644
--- a/arch/arm64/include/asm/kvm_pgtable.h
+++ b/arch/arm64/include/asm/kvm_pgtable.h
@@ -326,10 +326,8 @@ typedef bool (*kvm_pgtable_force_pte_cb_t)(u64 addr, u64 end,
  * @KVM_PGTABLE_WALK_SKIP_CMO:		Visit and update table entries
  *					without Cache maintenance
  *					operations required.
- * @KVM_PGTABLE_WALK_SKIP_LEVEL0:	Skip visiting level 0+ entries
- * @KVM_PGTABLE_WALK_SKIP_LEVEL1:	Skip visiting level 1+ entries
- * @KVM_PGTABLE_WALK_SKIP_LEVEL2:	Skip visiting level 2+ entries
- * @KVM_PGTABLE_WALK_SKIP_LEVEL3:	Skip visiting level 3 entries
+ * @KVM_PGTABLE_WALK_SKIP_OFFSET:	Offset from KVM_PGTABLE_LAST_LEVEL at
+ * 					which the walk should stop descending
  */
 enum kvm_pgtable_walk_flags {
 	KVM_PGTABLE_WALK_LEAF			= BIT(0),
@@ -339,18 +337,9 @@ enum kvm_pgtable_walk_flags {
 	KVM_PGTABLE_WALK_IGNORE_EAGAIN		= BIT(4),
 	KVM_PGTABLE_WALK_SKIP_BBM_TLBI		= BIT(5),
 	KVM_PGTABLE_WALK_SKIP_CMO		= BIT(6),
-	/* SKIP_LEVEL* flags should not be split nor reordered */
-	KVM_PGTABLE_WALK_SKIP_LEVEL0		= BIT(7),
-	KVM_PGTABLE_WALK_SKIP_LEVEL1		= BIT(8),
-	KVM_PGTABLE_WALK_SKIP_LEVEL2		= BIT(9),
-	KVM_PGTABLE_WALK_SKIP_LEVEL3		= BIT(10),
+	KVM_PGTABLE_WALK_SKIP_OFFSET		= GENMASK(9, 7),
 };
 
-#define KVM_PGTABLE_WALK_SKIP_LEVELS 	(KVM_PGTABLE_WALK_SKIP_LEVEL0 | \
-					 KVM_PGTABLE_WALK_SKIP_LEVEL1 | \
-					 KVM_PGTABLE_WALK_SKIP_LEVEL2 | \
-					 KVM_PGTABLE_WALK_SKIP_LEVEL3 )
-
 struct kvm_pgtable_visit_ctx {
 	kvm_pte_t				*ptep;
 	kvm_pte_t				old;
diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
index 6aaf2696c99a..3008817da6c5 100644
--- a/arch/arm64/kvm/hyp/pgtable.c
+++ b/arch/arm64/kvm/hyp/pgtable.c
@@ -147,9 +147,12 @@ static bool kvm_pgtable_walk_continue(const struct kvm_pgtable_walker *walker,
 
 static bool kvm_pgtable_skip_level(s8 level, enum kvm_pgtable_walk_flags flags)
 {
-	u32 skip = FIELD_GET(KVM_PGTABLE_WALK_SKIP_LEVELS, flags);
+	u8 offset = FIELD_GET(KVM_PGTABLE_WALK_SKIP_OFFSET, flags);
 
-	return unlikely(skip && level >= ffs(skip) - 1);
+	BUILD_BUG_ON(!FIELD_FIT(KVM_PGTABLE_WALK_SKIP_OFFSET,
+				KVM_PGTABLE_LAST_LEVEL - KVM_PGTABLE_FIRST_LEVEL));
+
+	return unlikely(level > KVM_PGTABLE_LAST_LEVEL - offset);
 }
 
 static int __kvm_pgtable_walk(struct kvm_pgtable_walk_data *data,

> ---
>  arch/arm64/include/asm/kvm_pgtable.h | 14 ++++++++++++++
>  arch/arm64/kvm/hyp/pgtable.c         | 16 +++++++++++++---
>  2 files changed, 27 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/kvm_pgtable.h b/arch/arm64/include/asm/kvm_pgtable.h
> index 41a8687938eb..5f37ceef8d63 100644
> --- a/arch/arm64/include/asm/kvm_pgtable.h
> +++ b/arch/arm64/include/asm/kvm_pgtable.h
> @@ -311,31 +311,45 @@ typedef bool (*kvm_pgtable_force_pte_cb_t)(u64 addr, u64 end,
>   * @KVM_PGTABLE_WALK_SHARED:		Indicates the page-tables may be shared
>   *					with other software walkers.
>   * @KVM_PGTABLE_WALK_IGNORE_EAGAIN:	Don't terminate the walk early if
>   *					the walker returns -EAGAIN.
>   * @KVM_PGTABLE_WALK_SKIP_BBM_TLBI:	Visit and update table entries
>   *					without Break-before-make's
>   *					TLB invalidation.
>   * @KVM_PGTABLE_WALK_SKIP_CMO:		Visit and update table entries
>   *					without Cache maintenance
>   *					operations required.
> + * @KVM_PGTABLE_WALK_SKIP_LEVEL0:	Skip visiting level 0+ entries
> + * @KVM_PGTABLE_WALK_SKIP_LEVEL1:	Skip visiting level 1+ entries
> + * @KVM_PGTABLE_WALK_SKIP_LEVEL2:	Skip visiting level 2+ entries
> + * @KVM_PGTABLE_WALK_SKIP_LEVEL3:	Skip visiting level 3 entries
>   */
>  enum kvm_pgtable_walk_flags {
>  	KVM_PGTABLE_WALK_LEAF			= BIT(0),
>  	KVM_PGTABLE_WALK_TABLE_PRE		= BIT(1),
>  	KVM_PGTABLE_WALK_TABLE_POST		= BIT(2),
>  	KVM_PGTABLE_WALK_SHARED			= BIT(3),
>  	KVM_PGTABLE_WALK_IGNORE_EAGAIN		= BIT(4),
>  	KVM_PGTABLE_WALK_SKIP_BBM_TLBI		= BIT(5),
>  	KVM_PGTABLE_WALK_SKIP_CMO		= BIT(6),
> +	/* SKIP_LEVEL* flags should not be split nor reordered */
> +	KVM_PGTABLE_WALK_SKIP_LEVEL0		= BIT(7),
> +	KVM_PGTABLE_WALK_SKIP_LEVEL1		= BIT(8),
> +	KVM_PGTABLE_WALK_SKIP_LEVEL2		= BIT(9),
> +	KVM_PGTABLE_WALK_SKIP_LEVEL3		= BIT(10),
>  };
>  
> +#define KVM_PGTABLE_WALK_SKIP_LEVELS 	(KVM_PGTABLE_WALK_SKIP_LEVEL0 | \
> +					 KVM_PGTABLE_WALK_SKIP_LEVEL1 | \
> +					 KVM_PGTABLE_WALK_SKIP_LEVEL2 | \
> +					 KVM_PGTABLE_WALK_SKIP_LEVEL3 )
> +
>  struct kvm_pgtable_visit_ctx {
>  	kvm_pte_t				*ptep;
>  	kvm_pte_t				old;
>  	void					*arg;
>  	struct kvm_pgtable_mm_ops		*mm_ops;
>  	u64					start;
>  	u64					addr;
>  	u64					end;
>  	s8					level;
>  	enum kvm_pgtable_walk_flags		flags;
> diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
> index 7a51f78b6446..80744478c810 100644
> --- a/arch/arm64/kvm/hyp/pgtable.c
> +++ b/arch/arm64/kvm/hyp/pgtable.c
> @@ -137,20 +137,27 @@ static bool kvm_pgtable_walk_continue(const struct kvm_pgtable_walker *walker,
>  	 * Ignore the return code altogether for walkers outside a fault handler
>  	 * (e.g. write protecting a range of memory) and chug along with the
>  	 * page table walk.
>  	 */
>  	if (r == -EAGAIN)
>  		return walker->flags & KVM_PGTABLE_WALK_IGNORE_EAGAIN;
>  
>  	return !r;
>  }
>  
> +static bool kvm_pgtable_skip_level(s8 level, enum kvm_pgtable_walk_flags flags)
> +{
> +	u32 skip = FIELD_GET(KVM_PGTABLE_WALK_SKIP_LEVELS, flags);
> +
> +	return unlikely(skip && level >= ffs(skip) - 1);
> +}
> +
>  static int __kvm_pgtable_walk(struct kvm_pgtable_walk_data *data,
>  			      struct kvm_pgtable_mm_ops *mm_ops, kvm_pteref_t pgtable, s8 level);
>  
>  static inline int __kvm_pgtable_visit(struct kvm_pgtable_walk_data *data,
>  				      struct kvm_pgtable_mm_ops *mm_ops,
>  				      kvm_pteref_t pteref, s8 level)
>  {
>  	enum kvm_pgtable_walk_flags flags = data->walker->flags;
>  	kvm_pte_t *ptep = kvm_dereference_pteref(data->walker, pteref);
>  	struct kvm_pgtable_visit_ctx ctx = {
> @@ -185,35 +192,35 @@ static inline int __kvm_pgtable_visit(struct kvm_pgtable_walk_data *data,
>  	 * into a newly installed or replaced table.
>  	 */
>  	if (reload) {
>  		ctx.old = READ_ONCE(*ptep);
>  		table = kvm_pte_table(ctx.old, level);
>  	}
>  
>  	if (!kvm_pgtable_walk_continue(data->walker, ret))
>  		return ret;
>  
> -	if (!table) {
> +	if (!table || kvm_pgtable_skip_level(level + 1, ctx.flags)) {
>  		data->addr = ALIGN_DOWN(data->addr, kvm_granule_size(level));
>  		data->addr += kvm_granule_size(level);
>  		goto out;
>  	}
>  
>  	childp = (kvm_pteref_t)kvm_pte_follow(ctx.old, mm_ops);
>  	ret = __kvm_pgtable_walk(data, mm_ops, childp, level + 1);
>  	if (!kvm_pgtable_walk_continue(data->walker, ret))
>  		return ret;
>  
> -	if (ctx.flags & KVM_PGTABLE_WALK_TABLE_POST)
> +out:
> +	if (table && ctx.flags & KVM_PGTABLE_WALK_TABLE_POST)
>  		ret = kvm_pgtable_visitor_cb(data, &ctx, KVM_PGTABLE_WALK_TABLE_POST);
>  
> -out:
>  	if (kvm_pgtable_walk_continue(data->walker, ret))
>  		return 0;
>  
>  	return ret;
>  }
>  
>  static int __kvm_pgtable_walk(struct kvm_pgtable_walk_data *data,
>  			      struct kvm_pgtable_mm_ops *mm_ops, kvm_pteref_t pgtable, s8 level)
>  {
>  	u32 idx;
> @@ -242,20 +249,23 @@ static int _kvm_pgtable_walk(struct kvm_pgtable *pgt, struct kvm_pgtable_walk_da
>  	u32 idx;
>  	int ret = 0;
>  	u64 limit = BIT(pgt->ia_bits);
>  
>  	if (data->addr > limit || data->end > limit)
>  		return -ERANGE;
>  
>  	if (!pgt->pgd)
>  		return -EINVAL;
>  
> +	if (kvm_pgtable_skip_level(pgt->start_level, data->walker->flags))
> +		return 0;
> +
>  	for (idx = kvm_pgd_page_idx(pgt, data->addr); data->addr < data->end; ++idx) {
>  		kvm_pteref_t pteref = &pgt->pgd[idx * PTRS_PER_PTE];
>  
>  		ret = __kvm_pgtable_walk(data, pgt->mm_ops, pteref, pgt->start_level);
>  		if (ret)
>  			break;
>  	}
>  
>  	return ret;
>  }
> -- 
> 2.55.0
> 

