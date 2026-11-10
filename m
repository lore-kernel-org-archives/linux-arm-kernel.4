Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C9C606DA1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 09:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=O9BPK5t/;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mZnHFto/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=z1EiYiesShrPXkvDVgUvtrE7Nbx28aPk1xRDvgjsVXE=; b=O9BPK5t/AiqOay+oYLdOhVUnhP
	c4rYq3fTe9+nirqlzXd0+HE17PqV6LEhCoL+bWx2JDvdUH/yhidFN4gd/xKpoj+JxQrnLkdgnk+2u
	U7cXeal9awDxYKK3AvxOBOLrkVCbTsCE66DzWCUnfaNf1zYJV90yT6iWane6qmOJkeMuqV6xmLI/0
	db5zIz20Wn2xrHpOtwLDH45TUcLZFMh5HhbTj4w1/DHwHlXcfKGPHu1r6gVJtiiuLhpAaZfSuiqDk
	0YtQSgnOP3crE2aRZx7WJBcOdnEJJ4+lNAaihzNaK/1Sc2q/z2A76yEqJx4vOQApNOSxWE6QPwN3P
	onuOKv3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQi1z-00000003F7o-3oSj;
	Tue, 10 Nov 2026 09:20:43 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQi1v-00000003F5C-0mr1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 09:20:42 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so21811435e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 01:20:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794302436; x=1794907236; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z1EiYiesShrPXkvDVgUvtrE7Nbx28aPk1xRDvgjsVXE=;
        b=mZnHFto/S9pcAGTmvQmjU84ywuq4/uN6SXnHw0K+7kvhQgGHIKIbfXhbP6XFXeYTEz
         JrFEjhxgB1kxtdDD+I57WOGUaYXcj/+l5G67iygBlGoJS1guZyhFTOOOozcUZggqzZHV
         wzRowg+XfzL51c9SLiqY4O1CXqy5l8Wp5TRdM4PWv70joWOxWhlc2NsOELqE2VxM4Iiu
         qGAnJzsD2ABSlBUiprTkL5+7g+H7GmW1aPulzoPXKkrp9Uib5pDG6121gY/7hVu8a+Mq
         WzgLKYBCphLkbFHYGEkSXZMyp8KnnDEsEwzYzxp5XIIogiRSfmX2+8NwAANwxFGNt5TJ
         ZIog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794302436; x=1794907236;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z1EiYiesShrPXkvDVgUvtrE7Nbx28aPk1xRDvgjsVXE=;
        b=WWiYHoCtbaEvuz8Da+3g5RGnKM4pPPX2deA8rSGwDWNb5Op7v43ytFdN0FwBU+xuoM
         8GTpqOn4ZtxKEWovb5lQLwTiRLit8zIAhSbZV3T1ZHyM4Q664VkBjSBecscXmbJ+ab6e
         Nu3As2ouwWVaQ9usKDD032KAQwlHtpkQd1P5oXW6Awjk018tI2iPF4ECIJeIzk8KHSU6
         0X8420wGWDgcZT9RjQNeJ52mKz+OTfmlpQ7BLai66muHSLQ5L3oYYOWpBi9LreNBrnPt
         nEmrdytFmYA1C+m9gX+TpojbLdE8JzOWYZ2rZ0Srv9yaRBu8bcnLakc7mbLd513akcm9
         SjrA==
X-Forwarded-Encrypted: i=1; AL+hErFMLPRSPbSnzRhGQHHkzWEWBKa/kKb3OEoo/S12dmOyLCPUKAL6OKZyxEV516zTiZKtZDxT+GH4fmOEpwEkaQ31@lists.infradead.org
X-Gm-Message-State: APuU4Z/YYjF7M9rZZ1ViGzERdGtLSAvPe+wssVzvrO7NKeqleeYSmKXI
	rcX5407OizRwrXDfCLrwRWyCNihJnGMJR3MMknyL/8QQzE8ZPnmHFGQMsdRIEIsovQ==
X-Gm-Gg: AYBFou0APp/Qi7NTsKPH5I7/66AgzrLXiYwBvPfKQjXhBkBm5MTwqu8Uq6gNKQu7vMa
	HpyHTBtiFze0+Fw6qOjSLi17Ofu0KgX/rlV1l39UDxVVb2A2ZILwFT7iI8wtAE3+shfa4x50c5O
	KPn/lOQP/99JQIXno+Gl1rWXPvz+ONjruBYuxY3EooLZ1meH7VMcnexvsxGiCQ2kLgjc//zaGZB
	ngrnKf927SzExkrMck72JrkSjEMagjHlsNpK7e4kCAG3QBp63VFO7vqgNewEQN52DVU3bU4+eyk
	ACEzfh1Qbo8CY0CoT+EjbePstoG7EA3i4+1xR5DNPdT1zJvuuR7mrKRDioMcEWSy5XxkGk49UgJ
	0BBpt8YtsPDJ1Yg6Sf12ISVkL+WOvgef5mpcWom+IT5pJhQGZkJJGK9g8sTYO98j2YHJNu/bXfW
	rXywCbyuKkEr15YgQO55KLC0oIxMeQ+tfaWlAIBwiiiLseOYBWqGuYLhGYqu9NQE0mnri7YyYDX
	ZFT1iJGX/CqHMlSYkqAYZm0di1QB47K8+LsylYEnpuW81CkhrzkmVp3eqWVJRwX2DXgYCPR9PJL
	luM84AK/QMtmZStm6B4mE9boQ0Va7M3IL0uwgWYEI7DgUa7ccDVvTwrrTIxTzKeJaw==
X-Received: by 2002:a05:600c:6990:b0:4a1:777b:8a12 with SMTP id 5b1f17b1804b1-4ba0233e86cmr29624555e9.14.1794302435405;
        Tue, 10 Nov 2026 01:20:35 -0800 (PST)
Received: from google.com (0.182.34.34.bc.googleusercontent.com. [34.34.182.0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fef675sm50469705e9.14.2026.11.10.01.20.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 01:20:34 -0800 (PST)
Date: Tue, 10 Nov 2026 09:20:31 +0000
From: Vincent Donnefort <vdonnefort@google.com>
To: xuheng@cs.columbia.edu
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Quentin Perret <qperret@google.com>, Will Deacon <will@kernel.org>,
	Mostafa Saleh <smostafa@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] KVM: arm64: Don't replace a valid hyp block mapping
 with a table
Message-ID: <avLh32oF-TnQrxtz@google.com>
References: <20261109-hyp-block-map-v3-1-bd70e67eb0bf@cs.columbia.edu>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261109-hyp-block-map-v3-1-bd70e67eb0bf@cs.columbia.edu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_012039_280585_76EBC1C9 
X-CRM114-Status: GOOD (  36.15  )
X-Spam-Score: -17.6 (-----------------)
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
X-Spam-Status: No, score=-23.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 09, 2026 at 10:13:35PM +0000, Xuheng Li via B4 Relay wrote:
> From: Xuheng Li <xuheng@cs.columbia.edu>
> 
> When kvm_pgtable_hyp_map() is asked to map part of a range that a valid
> block mapping already covers, hyp_map_walker_try_leaf() declines, as the
> request cannot be a leaf at the block's level.  hyp_map_walker() then
> allocates a zeroed table and stores it over the valid block entry.  The
> walk descends into the new table and maps the requested pages, but the
> rest of the block is now unmapped, and the valid block was replaced
> without break-before-make.
> 
> No in-tree caller maps into an existing hyp block mapping today, so this
> cannot be triggered in mainline.  Fail such a request with -EEXIST
> instead, so that a future caller gets an error rather than silently
> losing the rest of the block.
> 
> The same check now catches a conflicting remap of an existing leaf, so
> drop the WARN_ON() from hyp_map_walker_try_leaf(): every caller checks
> the error, and a WARN is fatal at EL2.  Do the check before the
> last-level WARN_ON(), which is kept for internal errors, and update the
> kernel-doc of kvm_pgtable_hyp_map() to match.
> 
> Signed-off-by: Xuheng Li <xuheng@cs.columbia.edu>
> ---

Reviewed-by: Vincent Donnefort <vdonnefort@google.com>

> This is patch 3/3 of v2, sent alone: 1/3 is superseded by Mostafa's
> "KVM: arm64: Use consistent type for pool size" [1], and 2/3 is dropped.
> 
> With the WARN_ON() gone from hyp_map_walker_try_leaf(), a conflicting
> remap through the EL1 path (__create_hyp_mappings()) also returns
> -EEXIST without a warning, where it used to warn and return -EINVAL.
> 
> [1] https://lore.kernel.org/r/20261106172750.2678873-1-smostafa@google.com
> ---
> Changes in v3:
> - Drop the WARN_ON() from the new check and from
>   hyp_map_walker_try_leaf(), and update the kernel-doc of
>   kvm_pgtable_hyp_map() (Vincent, Fuad).
> - Do the check before the last-level WARN_ON(), so that a conflicting
>   page-level mapping returns -EEXIST instead of reaching it.
> - Link to v2: https://lore.kernel.org/r/20261105-hyp-pool-and-map-v2-3-44a6ca90190b@cs.columbia.edu
> ---
>  arch/arm64/include/asm/kvm_pgtable.h |  2 +-
>  arch/arm64/kvm/hyp/pgtable.c         | 10 +++++++++-
>  2 files changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/kvm_pgtable.h b/arch/arm64/include/asm/kvm_pgtable.h
> index 1c9c57cd6..6d6ed8596 100644
> --- a/arch/arm64/include/asm/kvm_pgtable.h
> +++ b/arch/arm64/include/asm/kvm_pgtable.h
> @@ -508,7 +508,7 @@ void kvm_pgtable_hyp_destroy(struct kvm_pgtable *pgt);
>   * If device attributes are not explicitly requested in @prot, then the
>   * mapping will be normal, cacheable. Attempts to install a new mapping
>   * for a virtual address that is already mapped will be rejected with an
> - * error and a WARN().
> + * error.
>   *
>   * Return: 0 on success, negative error code on failure.
>   */
> diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
> index 9c83837b1..94a59f29a 100644
> --- a/arch/arm64/kvm/hyp/pgtable.c
> +++ b/arch/arm64/kvm/hyp/pgtable.c
> @@ -414,7 +414,7 @@ static bool hyp_map_walker_try_leaf(const struct kvm_pgtable_visit_ctx *ctx,
>  		return true;
>  	if (!kvm_pte_valid(ctx->old))
>  		ctx->mm_ops->get_page(ctx->ptep);
> -	else if (WARN_ON((ctx->old ^ new) & ~KVM_PTE_LEAF_ATTR_HI_SW))
> +	else if ((ctx->old ^ new) & ~KVM_PTE_LEAF_ATTR_HI_SW)
>  		return false;
>  
>  	smp_store_release(ctx->ptep, new);
> @@ -431,6 +431,14 @@ static int hyp_map_walker(const struct kvm_pgtable_visit_ctx *ctx,
>  	if (hyp_map_walker_try_leaf(ctx, data))
>  		return 0;
>  
> +	/*
> +	 * A valid entry here is a leaf that conflicts with the request.
> +	 * Replacing a block with a table would need break-before-make, and
> +	 * would leave the rest of the block unmapped.
> +	 */
> +	if (kvm_pte_valid(ctx->old))
> +		return -EEXIST;
> +
>  	if (WARN_ON(ctx->level == KVM_PGTABLE_LAST_LEVEL))
>  		return -EINVAL;
>  
> 
> ---
> base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
> change-id: 20261109-hyp-block-map-0c19f8e9424b
> 
> Best regards,
> -- 
> Xuheng Li <xuheng@cs.columbia.edu>
> 
> 

-- 
Vincent

