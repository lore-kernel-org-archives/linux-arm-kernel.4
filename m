Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBDDD606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 07:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wCpGeL4C;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=bV/nqyeX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=N3QVgukA5qJJPhjxPDWIGy+6WZwkUo9uICIUUy2pb5A=; b=wCpGeL4Cnuu9nLTpSafjjY2VAv
	v+dbvo2wh13UNkVDC0NvpA9c0sIFtLmscrmEXT9VgSFbrz3DC+8wLOEi9ogUPsJBowPTocCN4+Nb3
	4A4R3nTz+CdHsBS8zuHf9iImoQqcM1uqvyMlyQg01PrymDRMokY5dNFvFDQ2ohG53XuNnGE6WqQzY
	7x7SlAUZHsCmnTE2Qe3r5Q8XJO48LGDahtu2czz0UcJegtPKfya3Kq9ill8sL3bqTMyCJtvn2JcId
	J/lOTIMnbW2HdOEPBXJ1FFki7bQLRQIlzwkaQzq2J0HhRnFc0wYE+Jv4fo+/30JOV2jmu2+j5mbKr
	EPodBc0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWTrB-0000000CHx3-3l6B;
	Thu, 26 Nov 2026 07:25:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWTr9-0000000CHwX-1W5U
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 07:25:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 20406339;
	Wed, 25 Nov 2026 23:25:19 -0800 (PST)
Received: from thinkpad-e142931.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 277EA3FA7A;
	Wed, 25 Nov 2026 23:25:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795677922; bh=W8p9IFPoop55wdnARjeEf3Xh8Vk1OfULBvf4VJtucz8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bV/nqyeXXxc44EKXd7FYgJAAx/VLSTXikazIrO+oFBmosOUrdsSad1saMJJ2P4k7s
	 JGIMTopBlXZvbvTd3Q0JC+vM4m86TVz72p40U0e4LjGpRx3UxLidvnS3TH+FFNLA3q
	 7UfZ6pgrOGQPCRmlk7W7FyrySvr+CldXOwZvT/Iw=
Date: Thu, 26 Nov 2026 07:25:05 +0000
From: Wei-Lin Chang <weilin.chang@arm.com>
To: Aashish Sharma <aashish@aashishsharma.net>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>
Cc: Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Ricardo Koller <ricarkol@google.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] KVM: arm64: Do not free split_page_cache in
 kvm_arch_flush_shadow_all()
Message-ID: <b3qbghvxkqs5ntr6cptcbih2cocvnqyu5lousloeazdun4625s@thr2qxpszw2u>
References: <20261124224959.685002-1-aashish@aashishsharma.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261124224959.685002-1-aashish@aashishsharma.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_232523_489120_C54B7C5D 
X-CRM114-Status: GOOD (  22.19  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 24, 2026 at 02:49:59PM -0800, Aashish Sharma wrote:
> kvm_arch_flush_shadow_all() is called from the MMU notifier ->release()
> callback, which can run concurrently from __mmu_notifier_release() and
> mmu_notifier_unregister(), as well as concurrently with VM ioctls
> accessing split_page_cache under kvm->slots_lock. Calling

I don't think VM ioctls can race against ->release(). VM ioctls keeps
current->mm and KVM fd alive, so ->release() cannot be called.

However ->release() can be called in parallel if the last mm and KVM fd
reference gets dropped at the same time so there is still a race.

> kvm_uninit_stage2_mmu() there invokes kvm_mmu_free_memory_cache()
> without locking, which is not thread-safe and can double-free
> split_page_cache.
> 
> Call kvm_free_stage2_pgd(&kvm->arch.mmu) directly instead.
> kvm_arch_destroy_vm() already calls kvm_uninit_stage2_mmu() once after
> mmu_notifier_unregister() completes and all VM references are gone
> (see commit a3ca3bfd01b7 ("KVM: arm64: Destroy stage-2 page-table in
> kvm_arch_destroy_vm()")).
> 
> Fixes: e7bf7a490c68 ("KVM: arm64: Split huge pages when dirty logging is enabled")
> Cc: <stable@vger.kernel.org> # 6.6.x: a3ca3bfd01b7: KVM: arm64: Destroy stage-2 page-table in kvm_arch_destroy_vm()
> Cc: <stable@vger.kernel.org> # 6.6.x
> Signed-off-by: Aashish Sharma <aashish@aashishsharma.net>

Can we just remove kvm_uninit_stage2_mmu()?
That's one less function to keep in mind.
(skip split_page_cache freeing in kvm_arch_init_vm because no one can
use it yet, and keep kvm_free_stage2_pgd() in kvm_arch_destroy_vm()
because of a3ca3bfd01b7)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 21cd872ea394..6f04f21497d8 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -303,7 +303,7 @@ int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)
 	return 0;
 
 err_uninit_mmu:
-	kvm_uninit_stage2_mmu(kvm);
+	kvm_free_stage2_pgd(&kvm->arch.mmu);
 	kvm_destroy_nested(kvm);
 err_free_cpumask:
 	free_cpumask_var(kvm->arch.supported_cpus);
@@ -354,7 +354,8 @@ void kvm_arch_destroy_vm(struct kvm *kvm)
 	if (is_protected_kvm_enabled())
 		pkvm_destroy_hyp_vm(kvm);
 
-	kvm_uninit_stage2_mmu(kvm);
+	kvm_free_stage2_pgd(&kvm->arch.mmu);
+	kvm_mmu_free_memory_cache(&kvm->arch.mmu.split_page_cache);
 	kvm_destroy_mpidr_data(kvm);
 
 	kfree(kvm->arch.sysreg_masks);
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index a0d4981ebb99..f3bfff15f193 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1117,12 +1117,6 @@ int kvm_init_stage2_mmu(struct kvm *kvm, struct kvm_s2_mmu *mmu, unsigned long t
 	return err;
 }
 
-void kvm_uninit_stage2_mmu(struct kvm *kvm)
-{
-	kvm_free_stage2_pgd(&kvm->arch.mmu);
-	kvm_mmu_free_memory_cache(&kvm->arch.mmu.split_page_cache);
-}
-
 static void stage2_unmap_memslot(struct kvm *kvm,
 				 struct kvm_memory_slot *memslot)
 {
diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index 78d5b18dbd2d..9b455533e128 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -1480,7 +1480,7 @@ void kvm_arch_flush_shadow_all(struct kvm *kvm)
 		if (!WARN_ON(atomic_read(&mmu->refcnt)))
 			kvm_free_stage2_pgd(mmu);
 	}
-	kvm_uninit_stage2_mmu(kvm);
+	kvm_free_stage2_pgd(&kvm->arch.mmu);
 }
 
 /*

Thanks,
Wei-Lin Chang

> ---
>  arch/arm64/kvm/nested.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
> index 4d83281a7a28..2440ad9fed87 100644
> --- a/arch/arm64/kvm/nested.c
> +++ b/arch/arm64/kvm/nested.c
> @@ -1472,7 +1472,7 @@ void kvm_arch_flush_shadow_all(struct kvm *kvm)
>  		if (!WARN_ON(atomic_read(&mmu->refcnt)))
>  			kvm_free_stage2_pgd(mmu);
>  	}
> -	kvm_uninit_stage2_mmu(kvm);
> +	kvm_free_stage2_pgd(&kvm->arch.mmu);
>  }
>  
>  /*
> 
> base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
> -- 
> 2.56.1.831.g720f3f5937-goog
> 

