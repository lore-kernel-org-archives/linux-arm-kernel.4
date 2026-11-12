Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56501606A323
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 16:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=StUDTGjJ;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=tNGxxaHv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Fz3ok1xgLMCevgKit+vc08GYfcHPvlYtyNknEWCsv+M=; b=StUDTGjJkPapR5
	81M5AAJ+CIMfU68SSqJrdegpKm6eqsUxVuCAy7BNIg5eP29coCZ4VHPrLjdQ5MLf5bgzIhJtzjmnY
	vIKXi0IOQHO9FuLpOSIHf4ThvQYTEXn+qnT2R3cf8Nvow1pKvZ76qdXpFjTqHcwoVwinGiaB0tYAI
	igPdXIlz0FV8odJ/QCZcuWCrK6qodgsJrH0RDczdp0VwpRuZLXp5Ux8mKun9JOxrgh38QntQY52PZ
	Ix3a6KJ7hRvWsrRtSrrtenu6xNkLRgwTq4JFy7kepgvE2eJeKFJZbeGQQJjDAXpjTw8a2BTKAEVrX
	mKHz35GX6foa+e8AnxBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRY78-0000000Ah7g-3Xsy;
	Thu, 12 Nov 2026 16:57:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRY73-0000000Ah5Q-1gGR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 16:57:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7C8B51516;
	Thu, 12 Nov 2026 08:57:20 -0800 (PST)
Received: from [10.57.67.215] (unknown [10.57.67.215])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CEA383F673;
	Thu, 12 Nov 2026 08:57:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794502643; bh=n2YAal6lwAvLkGjEYo4/CPDxHN6fr05biMtI54HCe30=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=tNGxxaHvtfVA43zvRnB7GTnGJoDyTosQUMhEXFkpKP4DM07ISyw/1a6JwnDIzfeVt
	 iPFZYAuyr7J7aOLWZPHXLLDlPIrzG0j4O6jDVSDxGQbuXq5MM8hFZEpxOFPK8LgeeI
	 w5IruCxrFPIbf5Si6pQxMDpCHFztBO57Uco6Vvh0=
Message-ID: <87c408e4-95cd-477c-9656-b472983c6df7@arm.com>
Date: Thu, 12 Nov 2026 16:57:18 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/12] KVM: arm64: guest_memfd: Check mmap support when
 preparing memslot
Content-Language: en-GB
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev, Ackerley Tng <ackerleytng@google.com>
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
References: <20261111145758.217946-1-steven.price@arm.com>
 <20261111145758.217946-3-steven.price@arm.com>
 <fbc33983-cb8a-48e4-854f-ce009cc5668f@arm.com>
 <1e02dfff-c1ad-46bb-9834-fd4bbaa46179@arm.com>
 <26a29420-8d27-4069-bbd5-28692c9e8542@arm.com>
In-Reply-To: <26a29420-8d27-4069-bbd5-28692c9e8542@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_085726_460806_0DB3D601 
X-CRM114-Status: GOOD (  25.48  )
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

On 12/11/2026 16:35, Suzuki K Poulose wrote:
> On 12/11/2026 10:43, Steven Price wrote:
>> On 11/11/2026 15:21, Suzuki K Poulose wrote:
>>> On 11/11/2026 14:57, Steven Price wrote:
>>>> Check the guest_memfd backing file when deciding whether an arm64
>>>> memslot has mappable memory rather than checking whether the slot is
>>>> gmem only. A public helper function is added to be able to reuse the
>>>> static kvm_gmem_supports_mmap() function.
>>>>
>>>
>>> Please could you explain why we need this ? Why not rely on
>>> kvm_memslot_is_gmem_only(), which already tells
>>> kvm_gmem_supports_mmap() ? With inplace conversion support gmem supports
>>> mmap.
>>
>> Unless I'm missing something it's still possible to create a guest_memfd
>> that doesn't support mmap() by not passing the GUEST_MEMFD_FLAG_MMAP
>> flag. So kvm_memslot_is_gmem_only() doesn't actually guarantee that it's
>> a guest_memfd that supports mmap().
> 
> I see, while the KVM decides that, with inplace conversion shared pages
> come from gmem, we do allow creation of gmem without MMAP set, implying
> we would fail the mmap request from VMM, which is pretty pointless. But
> should the KVM fail this when VMM is shooting on its foot ? Only makes
> sense if there are no untrusted device DMA for the CoCo Guest.

See Documentation/virt/kvm/api.rst, under section : KVM_CREATE_GUEST_MEMFD


"When the KVM MMU performs a PFN lookup to service a guest fault, the 
fault will
always be consumed from guest_memfd, regardless of whether it is a 
shared or a
private fault (unless in-place conversion is disabled and the backing
guest_memfd does not have the GUEST_MEMFD_FLAG_MMAP flag set)."


Cheers
Suzuki


> 
> Am I missing something ?
> 
> Cheers
> Suzuki
> 
> 
> 
> 
>>
>>>
>>>> Signed-off-by: Steven Price <steven.price@arm.com>
>>>>
>>>> ---
>>>> Changes since v1:
>>>> - New patch in v2. Check the guest_memfd backing file rather than the
>>>>     memslot flag when deciding whether arm64 can map the backing 
>>>> memory.
>>>> ---
>>>>    arch/arm64/kvm/mmu.c     | 7 ++++---
>>>>    include/linux/kvm_host.h | 1 +
>>>>    virt/kvm/guest_memfd.c   | 6 ++++++
>>>>    3 files changed, 11 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
>>>> index 1db10d8d6db7..a146f6cde3d0 100644
>>>> --- a/arch/arm64/kvm/mmu.c
>>>> +++ b/arch/arm64/kvm/mmu.c
>>>> @@ -2839,10 +2839,11 @@ int kvm_arch_prepare_memory_region(struct kvm
>>>> *kvm,
>>>>            return -EFAULT;
>>>>          /*
>>>> -     * Only support guest_memfd backed memslots with mappable memory,
>>>> since
>>>> -     * there aren't any CoCo VMs that support only private memory on
>>>> arm64.
>>>> +     * Protected VMs currently require guest_memfd backed memslots 
>>>> with
>>>> +     * mappable memory to support shared mappings.
>>>>         */
>>>> -    if (kvm_slot_has_gmem(new) && !kvm_memslot_is_gmem_only(new))
>>>> +    if (kvm_arch_has_private_mem(kvm) && kvm_slot_has_gmem(new) &&
>>>> +        !kvm_gmem_slot_supports_mmap(new))
>>
>> Sashiko has identified I've screwed up this condition though.
>> kvm_arch_has_private_mem(kvm) shouldn't be in there as that allows a
>> non-private VM to bind a non-mmappable gmem.
>>
>>>>            return -EINVAL;
>>>>          /* guest_memfd is incompatible with MTE. */
>>>> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
>>>> index e7fc94e2910a..f65728a713ec 100644
>>>> --- a/include/linux/kvm_host.h
>>>> +++ b/include/linux/kvm_host.h
>>>> @@ -2614,6 +2614,7 @@ static inline bool kvm_is_private_gfn(struct kvm
>>>> *kvm, gfn_t gfn)
>>>>      #ifdef CONFIG_KVM_GUEST_MEMFD
>>>>    bool kvm_gmem_is_private_gfn(struct kvm *kvm, gfn_t gfn);
>>>> +bool kvm_gmem_slot_supports_mmap(const struct kvm_memory_slot *slot);
>>>>    bool kvm_arch_supports_gmem_init_shared(struct kvm *kvm);
>>>>      static inline u64 kvm_gmem_get_supported_flags(struct kvm *kvm)
>>>> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
>>>> index 8c97a69b16dc..3dd8d227bebb 100644
>>>> --- a/virt/kvm/guest_memfd.c
>>>> +++ b/virt/kvm/guest_memfd.c
>>>> @@ -442,6 +442,12 @@ static bool kvm_gmem_supports_mmap(struct inode
>>>> *inode)
>>>>        return GMEM_I(inode)->flags & GUEST_MEMFD_FLAG_MMAP;
>>>>    }
>>>>    +bool kvm_gmem_slot_supports_mmap(const struct kvm_memory_slot 
>>>> *slot)
>>>> +{
>>>> +    /* The guest_memfd file is pinned while preparing a new 
>>>> memslot. */
>>>
>>> We should gate this on kvm_slot_has_gmem() and how do we ensure that the
>>> call comes after it is prepared ?
>>
>> I'm not sure what you mean by "gate this on kvm_slot_has_gmem()" - yes
>> this function only makes sense on a gmem slot - the user above checks
>> that first. I'm not sure what value the function should call if you call
>> it on a non-gmem slot?
>>
>> Thanks,
>> Steve
>>
>>>> +    return kvm_gmem_supports_mmap(file_inode(slot->gmem.file));
>>>> +}
>>>> +
>>>>    static vm_fault_t kvm_gmem_fault_user_mapping(struct vm_fault *vmf)
>>>>    {
>>>>        struct inode *inode = file_inode(vmf->vma->vm_file);
>>>
>>>
>>> Cheers
>>> Suzuki
>>
> 


