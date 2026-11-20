Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A92E606A320
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 13:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=a+Yh2r0f;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=ZN3+qJR6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=aB08wIcpTTI3vXC9jSzOsNIg7/liyFIa40MeOk7LpRI=; b=a+Yh2r0foffuLy
	+K3iFw8t6bLIOu2Xk8XXTyTfzuI11LvuVa0SPqoZolYEoRm+9DRaG1wrZ67bGMTrsEGvvWUqnNeGF
	YA4k5qOL9NID99QypOPF9TJ9IHx/Jj3GtkdWma9BKlX11uV1reESI51BpS5HDERpgAOEk9+TUpRyz
	n+w3BiVEfGLL9zjXiWydl2w6CHOEz/Gkg0qnS3/XStaZvday44EFnkj5Jw+uVNsmBCQy/8Ide33sU
	4QY83eB32jCvW4Khx9x7NxZS9/MUHuq6QRqC+akawutBGm1tMgzrrJhlxvNO+OkSYQHcp63fmgMAI
	8QyNTDQ9yaK7nmUgLK7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUOVP-0000000F52q-3L8u;
	Fri, 20 Nov 2026 13:18:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUOVM-0000000F522-2njQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 13:18:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 90FE315A1;
	Fri, 20 Nov 2026 05:18:09 -0800 (PST)
Received: from [192.168.4.157] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 799703F632;
	Fri, 20 Nov 2026 05:18:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795180692; bh=F5YnqOcI8fB8gJNDD5T+aF8BJp8UgeC/aXT/5d2Gp3k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZN3+qJR66dri/0+NUvwBInoznarAVBvAJIVTfX6WozKtCSQ5F/crXbYOcZL9T5uhy
	 lgy67dYhHkqQr5NVWE/rrfKRgGSqwJJwMNtByGyoYyqweYxEqUtDMT96OHbpVieqmx
	 0imtJe+Fq9DEtacTxhhlsjp5PSCcfwtx5G/wRseU=
Message-ID: <b21faaee-921d-40bc-b084-1cb77538dd07@arm.com>
Date: Fri, 20 Nov 2026 13:18:08 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/11] KVM: arm64: CCA: Support runtime faulting of
 memory
Content-Language: en-GB
To: Steven Price <steven.price@arm.com>, Wei-Lin Chang
 <weilin.chang@arm.com>, kvm@vger.kernel.org, kvmarm@lists.linux.dev
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
 Vishal Annapurve <vannapurve@google.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Kohei Enju <enju.kohei@fujitsu.com>
References: <20261116164358.142785-1-steven.price@arm.com>
 <20261116164358.142785-10-steven.price@arm.com>
 <hwmtiumovuqyu7js5eqd4xt3h2zsuhjwkcygnw62hp5rrar5ph@5fhmv46iio2r>
 <bf4da8b7-0714-4253-9841-cf83cb65b92d@arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <bf4da8b7-0714-4253-9841-cf83cb65b92d@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_051816_936191_A2EE2012 
X-CRM114-Status: GOOD (  29.40  )
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 19/11/2026 17:01, Steven Price wrote:
> On 19/11/2026 07:48, Wei-Lin Chang wrote:
>> Hi Steven,
>>
>> On Mon, Nov 16, 2026 at 04:43:55PM +0000, Steven Price wrote:
>>
>> [...]
>>
>>> @@ -1791,12 +1799,18 @@ static int gmem_abort(const struct kvm_s2_fault_desc *s2fd,
>>>   	void *memcache = NULL;
>>>   	gfn_t canonical_gfn;
>>>   	int ret;
>>> +	bool is_private = false;
>>>   
>>> -	if (!perm_fault) {
>>> +	if (KVM_BUG_ON(!kvm_slot_has_gmem(s2fd->memslot), kvm))
>>> +		return -EINVAL;
>>
>> I feel this is being too cautious, gmem_abort is always run after a
>> kvm_slot_has_gmem() check.
> 
> Fair point - I'll drop that.
> 
>>> +
>>> +	if (!perm_fault || kvm_arch_has_private_mem(kvm)) {
>>>   		memcache = get_mmu_memcache(s2fd->vcpu);
>>>   		ret = topup_mmu_memcache(s2fd->mmu, memcache);
>>>   		if (ret)
>>>   			return ret;
>>> +	}
>>> +	if (!perm_fault) {
>>>   		if (kvm_is_nested_s2_mmu(kvm, pgt->mmu)) {
>>>   			mapping = kmalloc_obj(struct kvm_guest_s2_mapping, GFP_KERNEL_ACCOUNT);
>>>   			if (!mapping)
>>> @@ -1805,7 +1819,7 @@ static int gmem_abort(const struct kvm_s2_fault_desc *s2fd,
>>>   	}
>>>   
>>>   	s2vi.vma_pagesize = PAGE_SIZE;
>>> -	s2vi.gfn = ALIGN_DOWN(s2fd->fault_ipa, s2vi.vma_pagesize) >> PAGE_SHIFT;
>>> +	s2vi.gfn = gpa_to_gfn(kvm_gpa_from_fault(kvm, s2fd->fault_ipa));
>>>   	canonical_gfn = get_canonical_gfn(s2fd, &s2vi);
>>>   
>>>   	write_fault = kvm_s2_fault_is_write(s2fd);
>>> @@ -1817,13 +1831,35 @@ static int gmem_abort(const struct kvm_s2_fault_desc *s2fd,
>>>   	/* Pairs with the smp_wmb() in kvm_mmu_invalidate_end(). */
>>>   	smp_rmb();
>>>   
>>> +	if (kvm_arch_has_private_mem(kvm)) {
>>> +		switch (kvm->arch.vm_flavor) {
>>> +		case VM_REALM:
>>> +			is_private = kvm_realm_is_private_address(&kvm->arch.realm,
>>> +								  s2fd->fault_ipa);
>>> +			break;
>>> +		default:
>>> +			break;
>>> +		}
>>> +
>>> +		if (is_private != kvm_gmem_is_private_gfn(kvm, canonical_gfn)) {
>>> +			if (!result)
>>> +				kvm_prepare_memory_fault_exit(s2fd->vcpu,
>>> +							      gfn_to_gpa(canonical_gfn),
>>> +							      PAGE_SIZE,
>>> +							      write_fault, exec_fault,
>>> +							      is_private);
>>> +			kfree(mapping);
>>> +			return -EFAULT;
>>> +		}
>>> +	}
>>> +
>>>   	ret = kvm_gmem_get_pfn(kvm, s2fd->memslot, canonical_gfn, &s2vi.pfn, NULL);
>>>   	if (ret) {
>>>   		/* If result is non-NULL this is a synthetic fault. */
>>>   		if (!result)
>>>   			kvm_prepare_memory_fault_exit(s2fd->vcpu, gfn_to_gpa(canonical_gfn),
>>>   						      s2vi.vma_pagesize, write_fault, exec_fault,
>>> -						      false);
>>> +						      is_private);
>>>   		kfree(mapping);
>>>   		return ret;
>>>   	}
>>> @@ -1846,6 +1882,16 @@ static int gmem_abort(const struct kvm_s2_fault_desc *s2fd,
>>>   		goto out_unlock;
>>>   	}
>>>   
>>> +	switch (kvm->arch.vm_flavor) {
>>> +	case VM_REALM:
>>> +		prot &= ~KVM_PGTABLE_PROT_X;
>>> +		ret = realm_map_ipa(kvm, s2fd->fault_ipa, s2vi.pfn,
>>> +				    PAGE_SIZE, prot, memcache);
>>> +		goto out_unlock;
>>> +	default:
>>> +		break;
>>> +	}
>>> +
>>>   	if (perm_fault) {
>>>   		/*
>>>   		 * Drop the SW bits in favour of those stored in the
>>> @@ -2047,7 +2093,8 @@ static int kvm_s2_fault_get_vma_info(const struct kvm_s2_fault_desc *s2fd,
>>>   	 * mapping size to ensure we find the right PFN and lay down the
>>>   	 * mapping in the right place.
>>>   	 */
>>> -	s2vi->gfn = ALIGN_DOWN(s2fd->fault_ipa, s2vi->vma_pagesize) >> PAGE_SHIFT;
>>> +	s2vi->gfn = kvm_gfn_from_fault(kvm, ALIGN_DOWN(s2fd->fault_ipa,
>>> +						       s2vi->vma_pagesize));
>>>   
>>>   	s2vi->mte_allowed = kvm_vma_mte_allowed(vma);
>>>   
>>> @@ -2227,7 +2274,7 @@ static int kvm_s2_fault_map(const struct kvm_s2_fault_desc *s2fd,
>>>   	 * possible.
>>>   	 */
>>>   	if (mapping_size == PAGE_SIZE && s2vi->max_map_size != PAGE_SIZE) {
>>> -		if (perm_fault_granule > PAGE_SIZE) {
>>> +		if (perm_fault_granule > PAGE_SIZE && !kvm_vm_is_realm(kvm)) {
>>>   			mapping_size = perm_fault_granule;
>>>   		} else {
>>>   			mapping_size = transparent_hugepage_adjust(s2fd, &pfn, &gfn);
>>> @@ -2242,12 +2289,15 @@ static int kvm_s2_fault_map(const struct kvm_s2_fault_desc *s2fd,
>>>   	if (!perm_fault_granule && !s2vi->map_non_cacheable && kvm_has_mte(kvm))
>>>   		sanitise_mte_tags(kvm, pfn, mapping_size);
>>>   
>>> -	/*
>>> -	 * Under the premise of getting a FSC_PERM fault, we just need to relax
>>> -	 * permissions only if mapping_size equals perm_fault_granule. Otherwise,
>>> -	 * kvm_pgtable_stage2_map() should be called to change block size.
>>> -	 */
>>> -	if (mapping_size == perm_fault_granule) {
>>> +	if (kvm_vm_is_realm(kvm)) {
>>> +		ret = realm_map_ipa(kvm, s2fd->fault_ipa, pfn, mapping_size,
>>> +				    prot, memcache);
>>> +	} else if (mapping_size == perm_fault_granule) {
>>> +		/*
>>> +		 * Under the premise of getting a FSC_PERM fault, we just need to relax
>>> +		 * permissions only if mapping_size equals perm_fault_granule. Otherwise,
>>> +		 * kvm_pgtable_stage2_map() should be called to change block size.
>>> +		 */
>>>   		/*
>>>   		 * Drop the SW bits in favour of those stored in the
>>>   		 * PTE, which will be preserved.
>>> @@ -2306,15 +2356,16 @@ static int user_mem_abort(const struct kvm_s2_fault_desc *s2fd,
>>>   	/*
>>>   	 * Permission faults just need to update the existing leaf entry,
>>>   	 * and so normally don't require allocations from the memcache. The
>>> -	 * only exception to this is when dirty logging is enabled at runtime
>>> +	 * exceptions are when dirty logging is enabled at runtime
>>>   	 * and a fault needs to collapse a block entry into a table.
>>> +	 * Realms can also require new RTT levels when replacing a mapping.
>>>   	 * Under pKVM a permission fault can also collapse pages into a block,
>>>   	 * which needs a fresh mapping object, and the hypervisor requires the
>>>   	 * min-pages memcache even when the install allocates nothing.
>>>   	 */
>>>   	memcache = get_mmu_memcache(s2fd->vcpu);
>>>   	if (!perm_fault || memslot_is_logging(s2fd->memslot) ||
>>> -	    is_protected_kvm_enabled()) {
>>> +	    is_protected_kvm_enabled() || kvm_vm_is_realm(s2fd->vcpu->kvm)) {
>>>   		ret = topup_mmu_memcache(s2fd->mmu, memcache);
>>>   		if (ret)
>>>   			return ret;
>>> @@ -2340,12 +2391,22 @@ static int user_mem_abort(const struct kvm_s2_fault_desc *s2fd,
>>>   	return kvm_s2_fault_map(s2fd, &s2vi, prot, memcache, result);
>>>   }
>>
>> I see that the changes to gmem_abort() and kvm_s2_fault_map() are more
>> significant, and can possibly be turned into its realm version leaving
>> the original unchanged. With this can we give realm_vm_s2_ops its own
>> .vm_mem_abort? Something like:
>>
>> First, make user_mem_abort() take a function pointer, call it at the
>> current kvm_s2_fault_map() place.
>>
>> Then realm_vm_s2_ops.vm_mem_abort = realm_mem_abort()
>>
>> And in realm_mem_abort() do:
>>
>> realm_mem_abort()
>>    if gmem slot:    realm_gmem_abort()
>>    if regular slot: user_mem_abort(kvm_realm_fault_map)
>>
>> realm_gmem_abort() and kvm_realm_fault_map() are just the realm version
>> of gmem_abort() and kvm_s2_fault_map(). For example they won't need NV
>> related code, and vm_flavor switch case.
>>
>> Proposing this because I think we would like the CCA changes more
>> self-contained.
> 
> It's a little marginal - there's quite a bit of common code between the
> realm path and the normal path. But it does have the advantage that you
> mention of making CCA more self contained. So it's probably worth it.

The only odd bit would be handling the permission fault separately for
Realms ?

Suzuki

> 
> Thanks,
> Steve
> 
>> Thanks,
>> Wei-Lin Chang
>>
>>>   
>>> +static bool private_ipa_fault(struct kvm *kvm, phys_addr_t fault_ipa)
>>> +{
>>> +	return kvm_vm_is_realm(kvm) &&
>>> +		kvm_realm_is_private_address(&kvm->arch.realm, fault_ipa);
>>> +}
>>> +
>>>   static int kvm_vm_mem_abort(const struct kvm_s2_fault_desc *s2fd)
>>>   {
>>>   	VM_WARN_ON_ONCE(kvm_s2_fault_is_perm(s2fd) &&
>>>   			!esr_abt_is_write_fault(s2fd->esr) &&
>>>   			!kvm_s2_fault_is_exec(s2fd));
>>>   
>>> +	if (private_ipa_fault(s2fd->vcpu->kvm, s2fd->fault_ipa) &&
>>> +	    !kvm_slot_has_gmem(s2fd->memslot))
>>> +		return -EINVAL;
>>> +
>>>   	if (kvm_slot_has_gmem(s2fd->memslot))
>>>   		return gmem_abort(s2fd, NULL);
>>>   	else
>>> @@ -2458,10 +2519,10 @@ int kvm_handle_guest_sea(struct kvm_vcpu *vcpu)
>>>    */
>>>   int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
>>>   {
>>> +	struct kvm *kvm = vcpu->kvm;
>>>   	struct kvm_s2_trans nested_trans, *nested = NULL;
>>>   	unsigned long esr = kvm_vcpu_get_esr(vcpu);
>>>   	struct kvm_s2_mmu *mmu = vcpu->arch.hw_mmu;
>>> -	struct kvm *kvm = vcpu->kvm;
>>>   	phys_addr_t fault_ipa; /* The address we faulted on */
>>>   	phys_addr_t ipa; /* Always the IPA in the L1 guest phys space */
>>>   	struct kvm_memory_slot *memslot;
>>> @@ -2554,8 +2615,9 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
>>>   		nested = &nested_trans;
>>>   	}
>>>   
>>> -	gfn = ipa >> PAGE_SHIFT;
>>> +	gfn = kvm_gfn_from_fault(kvm, ipa);
>>>   	memslot = gfn_to_memslot(kvm, gfn);
>>> +
>>>   	hva = gfn_to_hva_memslot_prot(memslot, gfn, &writable);
>>>   	write_fault = esr_abt_is_write_fault(esr);
>>>   	if (kvm_is_error_hva(hva) || (write_fault && !writable)) {
>>> @@ -2598,7 +2660,7 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
>>>   		 * of the page size.
>>>   		 */
>>>   		ipa |= FAR_TO_FIPA_OFFSET(kvm_vcpu_get_hfar(vcpu));
>>> -		ret = io_mem_abort(vcpu, ipa);
>>> +		ret = io_mem_abort(vcpu, kvm_gpa_from_fault(kvm, ipa));
>>>   		goto out_unlock;
>>>   	}
>>>   
>>
>> [...]
> 


