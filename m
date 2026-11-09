Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10AD5606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 15:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=v3GmWlwT;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=ShO469X1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=BUlcemVKSy1aly5lghh79Jsyo31y0KT2wUOF5YDxAD0=; b=v3GmWlwT0d1jTN
	TNiUkX4U7O+Si28wElRf92wtJItxCqDZQ82td1n0H9sz3c0pvmyCSrC7IgufHIfTwtDwqjqQd1YJd
	aiKwq2g2EoI31bhDKsLDUuGpdrd5aXppvc34nUMmN1wdBXgKkDeeWmFuiRT9KCVMeBOt9yolOP/kI
	lOgY8DKqaypb9hImyv2so9p43h6hSu845TZMUb0BmV2RYu634qw9XE2WqC3aRZImylZ7C2HirJX5H
	6hSDfaVTiylxm0ycuF9aP5pgP6+ptpgT8vOoHQ65guLNtstMBV2QyaBQi5J9osJ8XrpyqHBRtoWuk
	HeiAMXvFNlYy1WPyVLwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQQpn-000000010JU-1tOj;
	Mon, 09 Nov 2026 14:58:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQQpi-000000010Gn-43QV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 14:58:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 86D9714BF;
	Mon,  9 Nov 2026 06:58:49 -0800 (PST)
Received: from LeoBrasDK.cambridge.arm.com (LeoBrasDK.cambridge.arm.com [10.2.212.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 51C5B3F85F;
	Mon,  9 Nov 2026 06:58:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794236332; bh=/YWsMtiXHeD2+Z2sUeLJPW83qIoOAL9dkqf6qd2V4L4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ShO469X1gAaFl21c/gOhk658pkxBTvkupJH4758MUyMLy2l4iioX1Ddp55jNu3MFS
	 M71yuxbbIMOhKiq9IPd43G+AeifDeU9yBi1PCLmh48fcl/rrxoF0jZ3QwmQPcXBOaW
	 1jWPBo+fWWTp3tLmqrWTRShdrcmoObkX8BNFpwFc=
From: Leonardo Bras <leo.bras@arm.com>
To: Oliver Upton <oupton@kernel.org>
Cc: Leonardo Bras <leo.bras@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v4 2/3] KVM: arm64: Introduce KVM_PGTABLE_WALK_SKIP_LEVEL* walk flags
Date: Mon,  9 Nov 2026 14:58:42 +0000
Message-ID: <avHfohqBxlNqo8_R@LeoBrasDK>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <au4YvD_8B3PzbofZ@kernel.org>
References: <20261106161240.1345126-1-leo.bras@arm.com> <20261106161240.1345126-3-leo.bras@arm.com> <au4YvD_8B3PzbofZ@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_065855_172019_9C3EE8A0 
X-CRM114-Status: GOOD (  28.86  )
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

On Fri, Nov 06, 2026 at 10:13:16AM -0800, Oliver Upton wrote:
> Hi Leo,
> 
> On Fri, Nov 06, 2026 at 04:12:37PM +0000, Leonardo Bras wrote:
> > Add new walking flags KVM_PGTABLE_WALK_SKIP_LEVEL{0-3}.
> > When used, they make the kvm_pgtable_walk() skip the given level, as well
> > as levels higher than that.
> > 
> > Being able to skip levels substancially decreases the runtime of a
> > pagetable walk when the callback function does nothing on that level.
> > 
> > Signed-off-by: Leonardo Bras <leo.bras@arm.com>
> 
> I'm still not crazy about using a flag per level... This is what I have
> stuffed on top locally. I've got a similar oneline fix for patch #3 to
> initialize the field with an offset.
> 
> Any opinions?
> 
> Thanks,
> Oliver
> 
> commit cad2070228c4305b5a83ce0a4cfa4aaa3dc0eb44
> Author: Oliver Upton <oupton@kernel.org>
> Date:   Fri Nov 6 10:03:14 2026 -0800
> 
>     squash! KVM: arm64: Introduce KVM_PGTABLE_WALK_SKIP_LEVEL* walk flags
>     
>     KVM: arm64: Add support for early termination of table walk recursion
>     
>     Add a new field to the walk flags that represents an offset from the
>     last level of the page table hierarchy at which recursion should
>     terminate.
> 
>     Signed-off-by: Leonardo Bras <leo.bras@arm.com>
>     [oliver: pass a numeric value instead of a flag per level]
>     Signed-off-by: Oliver Upton <oupton@kernel.org>
> 
> diff --git a/arch/arm64/include/asm/kvm_pgtable.h b/arch/arm64/include/asm/kvm_pgtable.h
> index 1d7a9125e522..18dcce3c506e 100644
> --- a/arch/arm64/include/asm/kvm_pgtable.h
> +++ b/arch/arm64/include/asm/kvm_pgtable.h
> @@ -326,10 +326,8 @@ typedef bool (*kvm_pgtable_force_pte_cb_t)(u64 addr, u64 end,
>   * @KVM_PGTABLE_WALK_SKIP_CMO:		Visit and update table entries
>   *					without Cache maintenance
>   *					operations required.
> - * @KVM_PGTABLE_WALK_SKIP_LEVEL0:	Skip visiting level 0+ entries
> - * @KVM_PGTABLE_WALK_SKIP_LEVEL1:	Skip visiting level 1+ entries
> - * @KVM_PGTABLE_WALK_SKIP_LEVEL2:	Skip visiting level 2+ entries
> - * @KVM_PGTABLE_WALK_SKIP_LEVEL3:	Skip visiting level 3 entries
> + * @KVM_PGTABLE_WALK_SKIP_OFFSET:	Offset from KVM_PGTABLE_LAST_LEVEL at
> + * 					which the walk should stop descending
>   */
>  enum kvm_pgtable_walk_flags {
>  	KVM_PGTABLE_WALK_LEAF			= BIT(0),
> @@ -339,18 +337,9 @@ enum kvm_pgtable_walk_flags {
>  	KVM_PGTABLE_WALK_IGNORE_EAGAIN		= BIT(4),
>  	KVM_PGTABLE_WALK_SKIP_BBM_TLBI		= BIT(5),
>  	KVM_PGTABLE_WALK_SKIP_CMO		= BIT(6),
> -	/* SKIP_LEVEL* flags should not be split nor reordered */
> -	KVM_PGTABLE_WALK_SKIP_LEVEL0		= BIT(7),
> -	KVM_PGTABLE_WALK_SKIP_LEVEL1		= BIT(8),
> -	KVM_PGTABLE_WALK_SKIP_LEVEL2		= BIT(9),
> -	KVM_PGTABLE_WALK_SKIP_LEVEL3		= BIT(10),
> +	KVM_PGTABLE_WALK_SKIP_OFFSET		= GENMASK(9, 7),
>  };
>  
> -#define KVM_PGTABLE_WALK_SKIP_LEVELS 	(KVM_PGTABLE_WALK_SKIP_LEVEL0 | \
> -					 KVM_PGTABLE_WALK_SKIP_LEVEL1 | \
> -					 KVM_PGTABLE_WALK_SKIP_LEVEL2 | \
> -					 KVM_PGTABLE_WALK_SKIP_LEVEL3 )
> -
>  struct kvm_pgtable_visit_ctx {
>  	kvm_pte_t				*ptep;
>  	kvm_pte_t				old;
> diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
> index 6aaf2696c99a..3008817da6c5 100644
> --- a/arch/arm64/kvm/hyp/pgtable.c
> +++ b/arch/arm64/kvm/hyp/pgtable.c
> @@ -147,9 +147,12 @@ static bool kvm_pgtable_walk_continue(const struct kvm_pgtable_walker *walker,
>  
>  static bool kvm_pgtable_skip_level(s8 level, enum kvm_pgtable_walk_flags flags)
>  {
> -	u32 skip = FIELD_GET(KVM_PGTABLE_WALK_SKIP_LEVELS, flags);
> +	u8 offset = FIELD_GET(KVM_PGTABLE_WALK_SKIP_OFFSET, flags);
>  
> -	return unlikely(skip && level >= ffs(skip) - 1);
> +	BUILD_BUG_ON(!FIELD_FIT(KVM_PGTABLE_WALK_SKIP_OFFSET,
> +				KVM_PGTABLE_LAST_LEVEL - KVM_PGTABLE_FIRST_LEVEL));
> +
> +	return unlikely(level > KVM_PGTABLE_LAST_LEVEL - offset);
>  }
>  
>  static int __kvm_pgtable_walk(struct kvm_pgtable_walk_data *data,
> 

Hi Oliver,
Sure, I agree it looks much better in terms of coding: it uses a single 
flag and only 3 bits for all levels. Checking it is simpler as well, so I 
am pretty much willing to use it in v5.

The only part that bothers me is naming... skip_offset seems a bit generic 
to me:

	struct kvm_pgtable_walker walker = {
		.flags  = KVM_PGTABLE_WALK_LEAF |
			  FIELD_PREP(KVM_PGTABLE_WALK_SKIP_OFFSET, 1),
	}

What if we use, instead: 

KVM_PGTABLE_WALK_SKIP_LAST_N_LEVELS 

Then when using, we could have something like:
 
        struct kvm_pgtable_walker walker = {
                .flags  = KVM_PGTABLE_WALK_LEAF |
			  FIELD_PREP(KVM_PGTABLE_WALK_SKIP_LAST_N_LEVELS, 1),
	}

It becomes much longer, but I think it looks easier to understand it like 
this, if I did not already knew what it does. (Maybe we can think on 
something a bit shorter?)


What do you think?

Thanks!
Leo

