Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F87606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 16:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=J3kObnkI;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=E4QAzZ+m
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=CKc2uY9tw++qJSeO11LOOO9i6cJhH/YZkvglgrwUC60=; b=J3kObnkI2Gg/N3JY3ZdSoTbHi6
	P18WO3dWZH5w3o7fZJtoov3lioyUVE3eTWLeI4laaFecdGhrYynezMCQlS2Zk5ShNOqP0wbKscJnz
	FK7734m7G8PaCwRsAkl6jvzvTIdBVUig/Hc+CFf9xqcf1bFMEBl2p7JPC4HNDkGIp8hjXHs+NxUOM
	k+A7J0u1pEigEi9pjmbHyCnekswMjJmoUpe/Gt0oB4OATV5AnIVIC6O2+OkkAGpzOUb9FKmgX35Ef
	1/82QbIeIDNRqbGP/EPwk+KpdQyBpI8pER6ApreRr5YaF6f61oeDbd7qMLdcaAJAASbcDOVlGEKJT
	lO+T4wiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTLtN-00000006P7f-3daO;
	Tue, 17 Nov 2026 16:18:45 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTLtK-00000006P6W-1PIu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 16:18:43 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4bb77a462c6so7579105e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 08:18:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794932319; x=1795537119; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CKc2uY9tw++qJSeO11LOOO9i6cJhH/YZkvglgrwUC60=;
        b=E4QAzZ+myFrHxyufJyqoFDH9DVfznhAwhvt4pPAgIgyC8sXjvw4/s1Q4cVV5WurZWo
         b5gMRa1sglNAdJPpbvnDJo4vwSuEZCvJxvVjTZchV49WwdtUoXRcZQMChDfycRCNe+Wq
         zt1OurKkyhp9ZDnqh5pY/hxnXlZwoWunsbYyaKFBRbo/tYJJpr9D78b3zfAiel4DppLb
         3bJ48mhdUELRYalQ09BnrGdPg7A1ybJDp8esLlkf5fbqRunngmXYxyllrsD7m8ngyd10
         RAfyfTvFRoLvzG8/kMWXi+RZ/xuggIrWvsxSx3zYafv+XxfYKud1GRWhO24BIMxldOwU
         1LiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794932319; x=1795537119;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CKc2uY9tw++qJSeO11LOOO9i6cJhH/YZkvglgrwUC60=;
        b=Md097Dhj2B34Beqe0IspxWAc2r+kbHuSWgxFqLuIgVs3ZB8cg1MZRLT3WsNYW3xWq8
         4SrpqEJ0yQUMRqeKHfnxjWPJA+BmmFbMMPPw5wO7e/1d5HvZ0CqwOZ/iz40YXhUT9fqR
         HZvoT4HoFnmTfFOwaiiGForRWrkOwryuwHJ4jceYS1pifMG4O/7J44lBAMDbcCSjYqd3
         6g9MJLcROIiD2WA45OCkB415+UKqzT7Ha9kQy7mwkengWBL5/IZ5yH+f5F78opuSuL90
         jK0sOv10MYou0P92TejaoUYScJgKM8FYKC5rAm/p1A2uTdAljRUVFqtUEUYvavobiEc6
         rKew==
X-Forwarded-Encrypted: i=1; AL+hErHcZltqLZ8DUZPXh8gX4CqfJSmJZYTX2WMem9UeVF1Q1oP3nWv2jr9x2JHUQeFyqIf2xfUG2Z7C6b7HrDIvlQCV@lists.infradead.org
X-Gm-Message-State: APuU4Z/HEcwkuSKxmteknb+L/GOYCXBG/pmVH4YSUp6CyES+/euC9Wuh
	yeF8XLreXZ6KClo//WlwV0a10u1+ZcFPr0arMISm+gvjyCWjdSHpo+ma1n22isZvBg==
X-Gm-Gg: AYBFou2rXtO2L8nwAzmk+JJRu5ZPSLkWeiPTuq4a8U1ICpmP7uPFwpus+MacmbTBQvU
	UhjDbsI97vhCWX+lZREC3iXBJsWYbtqoXGls54eN9Qa/FEJ8GmHTrkfy5Dv+z1EWz9d+fF/RxwJ
	329GgoP01/KrB9I527gEDG2nrfeWEbNa/VIEHp6Whk1Mzl1un/jW4XH1WRztJSgBEXX8p/TZ90R
	8dL9KRQ8Wmi2wWyGrSHXbvi3kG69pZ0bugi1nPDgemgmtB7RDGwrGdUdteBZGhnmfGcXNqU7b3g
	sJs2KqNWKYIhrErfiNQlaRE+pN/QTY0VsGYO3Pf9SJgzw9t2CT4ozFaOLARREDzKAVLCTYop7Id
	Ftzf9WeiY5xR33EBqIpSPW2hwrDIJTKNROJdIDNIVHwQWJBTMtOM/2IEGhMKcIGNOt3RgET0Eyz
	HE9NFcB4I0KxUVRKw1Gun89pvZXB3FB310x7Me6Yapjo7eCjTMEsMfy/qmM0hngeZPhalRSIZuo
	RFvdQoAkRc5GT9aVySg7iD/i8euNfT5n0afeajct5LKe1Q5qovPC01qAsil79uLhujub4OSOii+
	4FXghnx5hJlRSs46deQ9/1E9TSvWXkj/1Pi/jzEOoeXHiFdK0DcJgyHShHJPp3lFhw==
X-Received: by 2002:a05:600c:c103:b0:4a1:88df:8a2a with SMTP id 5b1f17b1804b1-4bb7838be00mr52317225e9.13.1794932318543;
        Tue, 17 Nov 2026 08:18:38 -0800 (PST)
Received: from google.com (0.182.34.34.bc.googleusercontent.com. [34.34.182.0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb734b9f44sm105265185e9.1.2026.11.17.08.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 08:18:37 -0800 (PST)
Date: Tue, 17 Nov 2026 16:18:32 +0000
From: Vincent Donnefort <vdonnefort@google.com>
To: Haseeb Ashraf <haseebashraf091@gmail.com>
Cc: maz@kernel.org, Oliver Upton <oupton@kernel.org>,
	Haseeb Ashraf <haseeb.ashraf@siemens.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Wei-Lin Chang <weilin.chang@arm.com>,
	Joey Gouly <joey.gouly@arm.com>, fahad.arslan@siemens.com,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Quentin Perret <qperret@google.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] KVM: arm64: Resume stage-2 range walks where they
 stopped
Message-ID: <avx-WAgBpyjJlwhg@google.com>
References: <20261113080233.640539-1-haseebashraf091@gmail.com>
 <20261113080233.640539-2-haseebashraf091@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261113080233.640539-2-haseebashraf091@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_081842_423352_77252AD9 
X-CRM114-Status: GOOD (  34.85  )
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

On Fri, Nov 13, 2026 at 01:02:33PM +0500, Haseeb Ashraf wrote:
> From: Haseeb Ashraf <haseeb.ashraf@siemens.com>
> 
> stage2_apply_range() walks a range one block-sized chunk at a time.
> The walker steps over an invalid entry in one go, but the next walk
> starts at the following chunk, so an invalid entry larger than a chunk
> is visited once for every chunk it covers. Unmapping the whole IPA
> space of a shadow stage-2, as emulating TLBI VMALLS12E1IS and TLBI
> ALLE1IS does, takes 2^18 walks with 4K pages and a 48-bit IPA space,
> however little it maps. Each walk also ends with a range TLBI when
> FEAT_TLBIRANGE and FWB are available.
> 
> On an AmpereOne A192-32X (192 CPUs, Xen on KVM, 4K pages, 48-bit IPA),
> a full-range unmap of one shadow stage-2 took 0.84-0.94 s (mean 0.91 s
> over 226 unmaps) on 6.18.29. With this change and the mainline commits
> it builds on backported, it took 2.1-45 ms (mean 4.1 ms over 672
> unmaps), with 512 to 1023 walks instead of 262144. The slowest TLBI
> VMALLS12E1IS trap took 0.94 s before and 46 ms after.
> 
> Have the walk report the address it reached, and have
> stage2_apply_range() resume from there. Unmap, write-protect and flush
> all go through it, so all three get this. kvm_pgtable_stage2_unmap(),
> kvm_pgtable_stage2_wrprotect() and kvm_pgtable_stage2_flush() now
> return the address, or a negative error code, and so do their pKVM
> counterparts, which do not walk page tables and return the end of the
> range. The other callers, in nested.c and at EL2, only looked for an
> error: they now check for a negative value, and those that pass the
> result on turn it back into 0. The walk handles every entry it steps
> over, including invalid entries that carry state, so nothing has to be
> looked up beforehand.
> 
> The unmap of a shadow stage-2 also drops the guest stage-2 records of
> the whole span the walk covered: nothing is mapped in the part it
> stepped over, so any record there is stale. Each walk that remains
> ends with the same deferred TLB invalidation as before. The spans that
> were skipped have no valid entry, so there is nothing to invalidate.
> 
> Suggested-by: Oliver Upton <oupton@kernel.org>
> Signed-off-by: Haseeb Ashraf <haseeb.ashraf@siemens.com>
> ---
>  arch/arm64/include/asm/kvm_pgtable.h  | 25 ++++++++++-----
>  arch/arm64/include/asm/kvm_pkvm.h     |  6 +--
>  arch/arm64/kvm/hyp/nvhe/mem_protect.c | 24 ++++++++----
>  arch/arm64/kvm/hyp/pgtable.c          | 55 +++++++++++++++++----------
>  arch/arm64/kvm/mmu.c                  | 32 ++++++++++------
>  arch/arm64/kvm/nested.c               |  2 +-
>  arch/arm64/kvm/pkvm.c                 | 22 +++++++----
>  7 files changed, 108 insertions(+), 58 deletions(-)
> 

[...]

> --- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> +++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> @@ -383,16 +383,20 @@ static int host_stage2_unmap_dev_all(void)
>  	struct kvm_pgtable *pgt = &host_mmu.pgt;
>  	struct memblock_region *reg;
>  	u64 addr = 0;
> -	int i, ret;
> +	int i;
> +	s64 ret;
>  
>  	/* Unmap all non-memory regions to recycle the pages */
>  	for (i = 0; i < hyp_memblock_nr; i++, addr = reg->base + reg->size) {
>  		reg = &hyp_memory[i];
>  		ret = kvm_pgtable_stage2_unmap(pgt, addr, reg->base - addr);
> -		if (ret)
> +		if (ret < 0)
>  			return ret;
>  	}
> -	return kvm_pgtable_stage2_unmap(pgt, addr, BIT(pgt->ia_bits) - addr);
> +
> +	ret = kvm_pgtable_stage2_unmap(pgt, addr, BIT(pgt->ia_bits) - addr);
> +
> +	return ret < 0 ? ret : 0;
>  }
>  
>  /*
> @@ -1418,7 +1422,7 @@ int __pkvm_host_reclaim_page_guest(u64 gfn, struct pkvm_hyp_vm *vm)
>  		goto unlock;
>  	}
>  
> -	WARN_ON(kvm_pgtable_stage2_unmap(&vm->pgt, ipa, PAGE_SIZE));
> +	WARN_ON(kvm_pgtable_stage2_unmap(&vm->pgt, ipa, PAGE_SIZE) < 0);
>  	WARN_ON(host_stage2_set_owner_locked(phys, PAGE_SIZE, PKVM_ID_HOST));
>  
>  unlock:
> @@ -1601,6 +1605,7 @@ int __pkvm_host_unshare_guest(u64 gfn, u64 nr_pages, struct pkvm_hyp_vm *vm)
>  	u64 ipa = hyp_pfn_to_phys(gfn);
>  	u64 size, phys;
>  	int ret;
> +	s64 reached;
>  
>  	ret = __guest_check_transition_size(0, ipa, nr_pages, &size);
>  	if (ret)
> @@ -1613,9 +1618,11 @@ int __pkvm_host_unshare_guest(u64 gfn, u64 nr_pages, struct pkvm_hyp_vm *vm)
>  	if (ret)
>  		goto unlock;
>  
> -	ret = kvm_pgtable_stage2_unmap(&vm->pgt, ipa, size);
> -	if (ret)
> +	reached = kvm_pgtable_stage2_unmap(&vm->pgt, ipa, size);
> +	if (reached < 0) {
> +		ret = reached;
>  		goto unlock;
> +	}

Could we just make ret s64 to avoid adding another variable?

  ret = kvm_pgtable_stage2_unmap();
  if (ret < 0)
     goto unlock;

  ret = 0;
	
>  
>  	for_each_hyp_page(page, phys, size) {
>  		/* __check_host_shared_guest() protects against underflow */
> @@ -1674,6 +1681,7 @@ int __pkvm_host_wrprotect_guest(u64 gfn, u64 nr_pages, struct pkvm_hyp_vm *vm)
>  {
>  	u64 size, ipa = hyp_pfn_to_phys(gfn);
>  	int ret;
> +	s64 reached;
>  
>  	if (pkvm_hyp_vm_is_protected(vm))
>  		return -EPERM;
> @@ -1684,10 +1692,10 @@ int __pkvm_host_wrprotect_guest(u64 gfn, u64 nr_pages, struct pkvm_hyp_vm *vm)
>  
>  	assert_host_shared_guest(vm, ipa, size);
>  	guest_lock_component(vm);
> -	ret = kvm_pgtable_stage2_wrprotect(&vm->pgt, ipa, size);
> +	reached = kvm_pgtable_stage2_wrprotect(&vm->pgt, ipa, size);
>  	guest_unlock_component(vm);
>  
> -	return ret;
> +	return reached < 0 ? reached : 0;
>  }
>  
>  int __pkvm_host_test_clear_young_guest(u64 gfn, u64 nr_pages, bool mkold, struct pkvm_hyp_vm *vm)

[...]

> diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
> index 0169972..73aad80 100644
> --- a/arch/arm64/kvm/pkvm.c
> +++ b/arch/arm64/kvm/pkvm.c
> @@ -602,19 +602,24 @@ int pkvm_pgtable_stage2_map(struct kvm_pgtable *pgt, u64 addr, u64 size,
>  	return ret;
>  }
>  
> -int pkvm_pgtable_stage2_unmap(struct kvm_pgtable *pgt, u64 addr, u64 size)
> +s64 pkvm_pgtable_stage2_unmap(struct kvm_pgtable *pgt, u64 addr, u64 size)
>  {
>  	struct kvm *kvm = kvm_s2_mmu_to_kvm(pgt->mmu);
> +	int ret;
>  
>  	if (WARN_ON(kvm_vm_is_protected(kvm)))
>  		return -EPERM;
>  
>  	lockdep_assert_held_write(&kvm->mmu_lock);
>  
> -	return __pkvm_pgtable_stage2_unshare(pgt, addr, addr + size);
> +	ret = __pkvm_pgtable_stage2_unshare(pgt, addr, addr + size);
> +	if (ret)
> +		return ret;
> +
> +	return addr + size;

Could we make this shorter?

return __pkvm_pgtable_stage2_unshare(...) ?: addr + size;

ditto pkvm_pgtable_stage2_wrprotect().

-- 
Vincent


>  }
>  
> -int pkvm_pgtable_stage2_wrprotect(struct kvm_pgtable *pgt, u64 addr, u64 size)
> +s64 pkvm_pgtable_stage2_wrprotect(struct kvm_pgtable *pgt, u64 addr, u64 size)
>  {
>  	struct kvm *kvm = kvm_s2_mmu_to_kvm(pgt->mmu);
>  	pkvm_handle_t handle = kvm->arch.pkvm.handle;
> @@ -632,10 +637,13 @@ int pkvm_pgtable_stage2_wrprotect(struct kvm_pgtable *pgt, u64 addr, u64 size)
>  			break;
>  	}
>  
> -	return ret;
> +	if (ret)
> +		return ret;
> +
> +	return addr + size;
>  }
>  
> -int pkvm_pgtable_stage2_flush(struct kvm_pgtable *pgt, u64 addr, u64 size)
> +s64 pkvm_pgtable_stage2_flush(struct kvm_pgtable *pgt, u64 addr, u64 size)
>  {
>  	struct kvm *kvm = kvm_s2_mmu_to_kvm(pgt->mmu);
>  	struct pkvm_mapping *mapping;
> @@ -643,7 +651,7 @@ int pkvm_pgtable_stage2_flush(struct kvm_pgtable *pgt, u64 addr, u64 size)
>  	lockdep_assert_held(&kvm->mmu_lock);
>  
>  	if (cpus_have_final_cap(ARM64_HAS_STAGE2_FWB))
> -		return 0;
> +		return addr + size;
>  
>  	for_each_mapping_in_range_safe(pgt, addr, addr + size, mapping) {
>  		if (!mapping->nc)
> @@ -651,7 +659,7 @@ int pkvm_pgtable_stage2_flush(struct kvm_pgtable *pgt, u64 addr, u64 size)
>  						  PAGE_SIZE * mapping->nr_pages);
>  	}
>  
> -	return 0;
> +	return addr + size;
>  }
>  
>  bool pkvm_pgtable_stage2_test_clear_young(struct kvm_pgtable *pgt, u64 addr, u64 size, bool mkold)
> -- 
> 2.43.0
> 

