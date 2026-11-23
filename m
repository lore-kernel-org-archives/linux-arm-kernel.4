Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9157606A336
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 11:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rACSbXRr;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=oNQDTBu8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=s2UaCnJHegTtHQHuBogVkelUqR56F5YOWyaQ5O82hGA=; b=rACSbXRrHs8O+q
	t4Sq2Wi7ldaQY4K1ELo9aHJm2YrJ0KQOC/Fev3+s9GzXtdDqOepps4gs2D5XPQtUmA8wP4JLTkTlz
	JdxqXXcP0EHMc9poN4JFN+bJLcWOH1nbAiP1vhjXGr5xPRlmDQwAm868oQqv6TkruKiHpbgZAr1px
	pydW12A9NVaYbst0ysm6fPTelc9EmZVxOdKITOjK6ucsPG/UNkLeAImGabx9qh/ld0iio0JxkUurh
	R82FPLapglUmBTvCJNYVPUNjeyLU5i0MTKoKQGX423NKcSsp1p1+YFcOta4yb4BYIwF1nWxQ7f31u
	JPwvwrxu9cUFiM75g4fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVS8y-000000039h6-09ce;
	Mon, 23 Nov 2026 11:23:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVS8v-000000039fn-3n3w
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 11:23:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 558EA143D;
	Mon, 23 Nov 2026 03:23:26 -0800 (PST)
Received: from [10.0.129.12] (Suzukis-MBP.cambridge.arm.com [10.0.129.12])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8A7D23F882;
	Mon, 23 Nov 2026 03:23:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795433009; bh=JJf5wrf3Uk0e6a6L7HQajjtgkwWgA/CjERtDpKtOa6k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oNQDTBu8q5UjbnxAg/pfOT0hdYwDNp+Wv5zYvWaP7dPAJzIM5OZ32kYeHfRAQUR0c
	 qXrM50ge5vP6b+T50ndJyjhzeOpi75mEahzQwdHkX0VRP0w3whzPASpqG83z7BwC+Q
	 MO+WY8VS9WiSuhVqhQoLYuNQ+ZIAY/Ip0p41m6H0=
Message-ID: <0d031484-d394-47e3-be49-7c85004dbb83@arm.com>
Date: Mon, 23 Nov 2026 11:23:23 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/11] KVM: arm64: Dispatch stage-2 destruction by VM
 flavor
Content-Language: en-GB
To: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>, Zenghui Yu <yuzenghui@huawei.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Joey Gouly <joey.gouly@arm.com>, Alexandru Elisei
 <alexandru.elisei@arm.com>, Christoffer Dall <christoffer.dall@arm.com>,
 Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Gavin Shan <gshan@redhat.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 Alper Gun <alpergun@google.com>, "Aneesh Kumar K . V"
 <aneesh.kumar@kernel.org>, Emi Kisanuki <fj0570is@fujitsu.com>,
 Vishal Annapurve <vannapurve@google.com>, WeiLin.Chang@arm.com,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Kohei Enju <enju.kohei@fujitsu.com>
References: <20261123104233.95710-1-steven.price@arm.com>
 <20261123104233.95710-5-steven.price@arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20261123104233.95710-5-steven.price@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_032330_032008_5E81B43E 
X-CRM114-Status: GOOD (  22.15  )
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 23/11/2026 10:42, Steven Price wrote:
> Select the stage-2 destruction functions through the VM's stage-2
> operations. This keeps the native and pKVM paths explicit and lets a
> Realm provide its own destruction callback when Realm stage-2
> operations are registered.
> 
> The Realm callback will only free the root RTT pages, because RMI
> teardown destroys the non-root RTTs separately.
> 

minor nit: The second paragraph may be omitted as we introduce the
Realm stuff in a later patch.


> Signed-off-by: Steven Price <steven.price@arm.com>


Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>


> 
> ---
> Changes since v3:
> - Move before basic Realm infrastructure and declare the page-table
>    type for the new callback.
> 
> Changes since v2:
> - New patch in v3; split stage-2 destruction dispatch out of the
>    Realm stage-2 MMU operations patch.
> ---
>   arch/arm64/include/asm/kvm_host.h |  2 ++
>   arch/arm64/kvm/mmu.c              | 30 +++++++++++++++++++++++-------
>   2 files changed, 25 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index 9d6258b213d1..3ddeddfacd06 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -234,6 +234,7 @@ struct kvm_vcpu_ops {
>   
>   struct kvm_gfn_range;
>   enum kvm_gfn_range_filter;
> +struct kvm_pgtable;
>   struct kvm_s2_fault_desc;
>   
>   struct kvm_vm_s2_ops {
> @@ -242,6 +243,7 @@ struct kvm_vm_s2_ops {
>   	int (*vm_flush_remote_tlbs)(struct kvm *kvm);
>   	int (*vm_flush_remote_tlbs_range)(struct kvm *kvm, gfn_t gfn,
>   					  u64 nr_pages);
> +	void (*vm_stage2_destroy)(struct kvm_pgtable *pgt);
>   	void (*vm_stage2_unmap_range)(struct kvm_s2_mmu *mmu,
>   				      phys_addr_t start, u64 size,
>   				      bool may_block,
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index 8a9a80c7cfab..fab915ddeaab 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -1018,26 +1018,39 @@ static int kvm_init_ipa_range(struct kvm_s2_mmu *mmu, unsigned long type)
>    * cond_resched() periodically to prevent hogging the CPU for a long time
>    * and schedule something else, if required.
>    */
> -static void stage2_destroy_range(struct kvm_pgtable *pgt, phys_addr_t addr,
> -				   phys_addr_t end)
> +static void stage2_destroy_range(struct kvm_pgtable *pgt,
> +				 void (*destroy_range)(struct kvm_pgtable *pgt,
> +						       u64 addr, u64 size))
>   {
> +	u64 addr = 0;
> +	u64 end = BIT(VTCR_EL2_IPA(pgt->mmu->vtcr));
>   	u64 next;
>   
>   	do {
>   		next = stage2_range_addr_end(addr, end);
> -		KVM_PGT_FN(kvm_pgtable_stage2_destroy_range)(pgt, addr,
> -							     next - addr);
> +		destroy_range(pgt, addr, next - addr);
>   		if (next != end)
>   			cond_resched();
>   	} while (addr = next, addr != end);
>   }
>   
> +static void kvm_vm_stage2_destroy(struct kvm_pgtable *pgt)
> +{
> +	stage2_destroy_range(pgt, kvm_pgtable_stage2_destroy_range);
> +	kvm_pgtable_stage2_destroy_pgd(pgt);
> +}
> +
> +static void pkvm_stage2_destroy(struct kvm_pgtable *pgt)
> +{
> +	stage2_destroy_range(pgt, pkvm_pgtable_stage2_destroy_range);
> +	pkvm_pgtable_stage2_destroy_pgd(pgt);
> +}
> +
>   static void kvm_stage2_destroy(struct kvm_pgtable *pgt)
>   {
> -	unsigned int ia_bits = VTCR_EL2_IPA(pgt->mmu->vtcr);
> +	struct kvm *kvm = kvm_s2_mmu_to_kvm(pgt->mmu);
>   
> -	stage2_destroy_range(pgt, 0, BIT(ia_bits));
> -	KVM_PGT_FN(kvm_pgtable_stage2_destroy_pgd)(pgt);
> +	kvm->arch.vm_s2_ops->vm_stage2_destroy(pgt);
>   }
>   
>   /**
> @@ -3146,6 +3159,7 @@ long kvm_arch_vcpu_pre_fault_memory(struct kvm_vcpu *vcpu,
>   }
>   
>   static const struct kvm_vm_s2_ops protected_pkvm_vm_s2_ops = {
> +	.vm_stage2_destroy		= pkvm_stage2_destroy,
>   	.vm_flush_remote_tlbs		= pkvm_flush_remote_tlbs,
>   	.vm_flush_remote_tlbs_range	= pkvm_flush_remote_tlbs_range,
>   	.vm_age_gfn			= no_age_gfn,
> @@ -3155,6 +3169,7 @@ static const struct kvm_vm_s2_ops protected_pkvm_vm_s2_ops = {
>   };
>   
>   static const struct kvm_vm_s2_ops pkvm_vm_s2_ops = {
> +	.vm_stage2_destroy		= pkvm_stage2_destroy,
>   	.vm_flush_remote_tlbs		= pkvm_flush_remote_tlbs,
>   	.vm_flush_remote_tlbs_range	= pkvm_flush_remote_tlbs_range,
>   	.vm_age_gfn			= pkvm_age_gfn,
> @@ -3164,6 +3179,7 @@ static const struct kvm_vm_s2_ops pkvm_vm_s2_ops = {
>   };
>   
>   static const struct kvm_vm_s2_ops kvm_default_vm_s2_ops = {
> +	.vm_stage2_destroy		= kvm_vm_stage2_destroy,
>   	.vm_flush_remote_tlbs		= kvm_vm_flush_remote_tlbs,
>   	.vm_flush_remote_tlbs_range	= kvm_vm_flush_remote_tlbs_range,
>   	.vm_age_gfn			= kvm_vm_age_gfn,


