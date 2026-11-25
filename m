Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 277C8606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 15:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=G8ENmBpv;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=ZoJs1Pdu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=X3zNXgFcgKkRvrebQOQS0iqgUmCxBf+Rl6iIn0IF0a4=; b=G8ENmBpvIaVVJ9
	MIhqu3hnsJu4kb8tIb1TTPPfbENZ8PFoed+lIw/f799uC+emYRDNY2WjHtvDhW0qq+WBpTDlS5RHh
	RwRJpaf2HvpHfyf1bmLqv0zAcb/Q0d+fv2SgzK/WiyUFJumHbgLl+0LMXdxwrndSmBgyER2QKy3hw
	SSyvP0VdJLcx5jpwd9+1xbkUmQPmsqrmbXnJKIKTHt0CBiQGiDX9jwv4Tzsv1+dAJsaxnM8KFVIjw
	76WmgNGQo0kJw0OzkS8xOUe0GLlRhR0sISH0EGTQLS7Ld3CLNXUQQRciqJaKQe1uy3X2uQvojv00W
	h/L3PkIUJs9r+SKcuXQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWESH-0000000AHDg-1VFB;
	Wed, 25 Nov 2026 14:58:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWESF-0000000AHCl-1Moj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 14:58:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8E0592F;
	Wed, 25 Nov 2026 06:58:33 -0800 (PST)
Received: from [10.2.197.99] (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2ECBB3F632;
	Wed, 25 Nov 2026 06:58:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795618716; bh=D/n+P8rGctWCPmcRxey9aK7QCr6PlKd7Fo3q+ESxtX8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZoJs1PduoU0ULUyP6YVRCRXGnlHrzR4tGX0ZOcuxgF6JCfnSb+OxspbajzsG32Dkt
	 1Z730FRcVZHXhbCFzLBFONsxqLNfCmyWjC9hIcdqTHJqPbmaKso6xMf1aEIsjGw9Wq
	 eAw3xOv2uegtqNUIFjfCGzV9mXZb+s9Cr4kaU0jc=
Message-ID: <e4108d4f-e84c-444c-aa7a-18e823816eae@arm.com>
Date: Wed, 25 Nov 2026 14:58:31 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 09/11] KVM: arm64: CCA: Prevent memslot modifications
 after Realm creation
To: Ackerley Tng <ackerleytng@google.com>, Steven Price
 <steven.price@arm.com>, kvm@vger.kernel.org, kvmarm@lists.linux.dev,
 Catalin Marinas <catalin.marinas@arm.com>
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
 <20261123104233.95710-10-steven.price@arm.com>
 <CAEvNRgFQ5BXqU3KfPFT8bfZTW=RyvBw25z3GZtr3JA=Wv3Yqfw@mail.gmail.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <CAEvNRgFQ5BXqU3KfPFT8bfZTW=RyvBw25z3GZtr3JA=Wv3Yqfw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_065839_466559_D6F85F5F 
X-CRM114-Status: GOOD (  37.01  )
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

Hi Ackerley

On 25/11/2026 00:09, Ackerley Tng wrote:
> Steven Price <steven.price@arm.com> writes:
> 
>> From: Suzuki K Poulose <suzuki.poulose@arm.com>
>>
>> Once the Realm is created, prevent changes to guest_memfd backed
>> memslots, which can provide private memory. Validate these changes
>> before KVM invalidates the old memslot, so a rejected deletion leaves
>> its stage-2 mappings intact. Realm stage-2 faults will also validate
>> the private memory backing in a later commit.
>>
>> Require Realm memslots to lie in the lower half of the IPA space, as the
>> upper, shared half aliases the lower, protected half.
>>
>> Define kvm_arch_has_private_mem() so generic KVM recognizes Realm VMs
>> as supporting private memory. Defining the macro also makes
>> gmem_in_place_conversion true for every arm64 VM, so guest_memfd
>> memslots are marked gmem-only even for non-Realm VMs. A well-formed
>> KVM_SET_MEMORY_ATTRIBUTES2 request on a non-Realm guest_memfd now
>> reaches the VM check and returns -EINVAL instead of -ENOTTY.
>>
>> Additionally, similar to pKVM, do not support dirty logging or
>> read-only memslots.
>>
> 
> Imo this could be split into a few patches
> 
> 1. Add the constraints wrt realm memslots and being in the lower half of
>     the IPA space
> 2. Defining arm's support for private mem
> 3. Imposing rules on memslot changes
> 4. Maybe some others, maybe I'm misunderstanding the patch

Agree


> 
>> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>> Signed-off-by: Steven Price <steven.price@arm.com>
>>
>> ---
>> Changes since v3:
>> - Explain the arm64-wide in-place conversion effect and keep the
>>    general IPA limit comment.
>>
>> Changes since v1:
>> - Preserve private mappings if KVM invalidates a Realm guest_memfd
>>    slot before the prepare hook rejects its deletion.
>> ---
>>   arch/arm64/include/asm/kvm_host.h |  2 ++
>>   arch/arm64/kvm/mmu.c              | 37 ++++++++++++++++++++++++-------
>>   2 files changed, 31 insertions(+), 8 deletions(-)
>>
>> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
>> index 3ddeddfacd06..55673d08e3eb 100644
>> --- a/arch/arm64/include/asm/kvm_host.h
>> +++ b/arch/arm64/include/asm/kvm_host.h
>> @@ -1607,6 +1607,8 @@ struct kvm *kvm_arch_alloc_vm(void);
>>
>>   #define kvm_vm_is_realm(kvm)		((kvm)->arch.vm_flavor == VM_REALM)
>>
>> +#define kvm_arch_has_private_mem(kvm) kvm_vm_is_realm(kvm)
>> +
>>   #define kvm_has_mte(kvm)					\
>>   	(system_supports_mte() &&				\
>>   	 test_bit(KVM_ARCH_FLAG_MTE_ENABLED, &(kvm)->arch.flags))
>> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
>> index 800333a345cd..9af5fe6d87f0 100644
>> --- a/arch/arm64/kvm/mmu.c
>> +++ b/arch/arm64/kvm/mmu.c
>> @@ -2861,17 +2861,32 @@ int kvm_arch_validate_memory_region(struct kvm *kvm,
>>   {
>>   	lockdep_assert_held(&kvm->slots_lock);
>>
>> -	if (kvm_vm_is_protected(kvm)) {
>> +	if (kvm_vm_is_protected(kvm) && new &&
>> +	    (new->flags & (KVM_MEM_LOG_DIRTY_PAGES | KVM_MEM_READONLY)))
>> +		return -EPERM;
> 
> gmem is already generically mutually exclusive with
> KVM_MEM_LOG_DIRTY_PAGES and KVM_MEM_READONLY, so before this change,
> pKVM is saying no to KVM_MEM_LOG_DIRTY_PAGES and KVM_MEM_READONLY for
> all memslots, gmem or not, so this check makes sense.
> 
>> +
>> +	switch (kvm->arch.vm_flavor) {
>> +	case VM_PROTECTED_PKVM:
>>   		/* Cannot modify memslots once a pVM has run. */
>>   		if (pkvm_hyp_vm_is_created(kvm) &&
>> -		    (change == KVM_MR_DELETE || change == KVM_MR_MOVE)) {
>> +		    (change == KVM_MR_DELETE || change == KVM_MR_MOVE))
>>   			return -EPERM;
>> -		}
>> +		break;
> 
> Not sure why pKVM doesn't allow deleting a memslot after the vm is
> created, but this is no change from before this patch, the removal of {}
> here is mixed in with the other changes in this patch.

IIRC, pKVM relies on pinning the stage2 until the teardown ?
ed
from the Stage2 unless we d

> 
>> +	case VM_REALM:
>> +		/*
>> +		 * Once the Realm is created, we cannot modify any slots that
>> +		 * could be providing private memory. i.e., guest_memfd backed
>> +		 * slots.
>> +		 * TODO: Handle trusted device private memory slots
>> +		 */
>> +		if (!kvm_realm_is_created(kvm))
>> +			break;
>>
>> -		if (new &&
>> -		    new->flags & (KVM_MEM_LOG_DIRTY_PAGES | KVM_MEM_READONLY)) {
>> +		if (kvm_slot_has_gmem(old) || kvm_slot_has_gmem(new))
>>   			return -EPERM;
>> -		}
>> +		break;
> 
> Imo this should be written the same way as the pKVM branch for clarity,
> like
> 
> if (kvm_realm_is_created() &&
>      (kvm_slot_has_gmem(old) || kvm_slot_has_gmem(new)))
>          return -EPERM;
> 
> but that aside,
> 
> 1. Why block creating memslots after realm is created?
> 
> Does ARM CCA have no way to add pages after a VM starts? This isn't
> blocked for TDX and SNP so I think this constraint seems unnecessary.

This and (2) was triggered by the following thread, raised by Catalin.

https://lore.kernel.org/all/aqrGPK0lFBFXL2qY@arm.com

But having said that, since then, we now have :

1) All private faults must be serviced by realm_gmem_abort(), which 
mandates Guest memfd slot. (See Patch 11, realm_mem_abort())

2) realm_gmem_abort() matches the "private" attribute for a "protected"
fault, failing which causes a memory fault exit.

So I think we can remove these memslot restrictions.

> 
> 2. Why block deleting memslots after realm is created?
> 
> This also seems like an artificial constraint, and it constrains the way
> the userspace VMM operates when stopping a VM, like the memslots can't
> be removed ever, the VM just has to be closed? (something like that)

As mentioned above, I think we are good to remove the restrictions.

Suzuki


> 
>> +	default:
>> +		break;
>>   	}
>>
>>   	return 0;
>> @@ -2883,6 +2898,7 @@ int kvm_arch_prepare_memory_region(struct kvm *kvm,
>>   				   enum kvm_mr_change change)
>>   {
>>   	hva_t hva, reg_end;
>> +	gfn_t ipa_limit;
>>   	int ret = 0;
>>
>>   	if (change != KVM_MR_CREATE && change != KVM_MR_MOVE &&
>> @@ -2891,9 +2907,14 @@ int kvm_arch_prepare_memory_region(struct kvm *kvm,
>>
>>   	/*
>>   	 * Prevent userspace from creating a memory region outside of the IPA
>> -	 * space addressable by the KVM guest IPA space.
>> +	 * space addressable by the KVM guest IPA space. Realm shared IPAs alias
>> +	 * the corresponding private IPAs, so Realm memslots must reside entirely
>> +	 * in the lower half of that space.
>>   	 */
>> -	if ((new->base_gfn + new->npages) > (kvm_phys_size(&kvm->arch.mmu) >> PAGE_SHIFT))
>> +	ipa_limit = kvm_phys_size(&kvm->arch.mmu) >> PAGE_SHIFT;
>> +	if (kvm_vm_is_realm(kvm))
>> +		ipa_limit >>= 1;
>> +	if (new->base_gfn + new->npages > ipa_limit)
>>   		return -EFAULT;
>>
>>   	/*
>> --
>> 2.43.0


