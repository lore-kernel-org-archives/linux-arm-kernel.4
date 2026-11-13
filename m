Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03652606B2ED
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 16:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hWg7CmXo;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=um0Z1Mgu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=QhfGUW32CZ1pQ3WZy3XxoZITm270vtUPhzCkGIyBM7o=; b=hWg7CmXojFBcNQ
	ZL6ArGdlRdnjd8+lpMqZyvBefMYaCdPSQXkFj5ms1/sMNc6/OKedHI4NLD41Ta5lhCj4NcDOOYG0K
	FSHRGs3QpNQq7NsnvhchjZG7SN/A4veUPH4Tj0ZM3uuoG0kQYBuMjp54OxpyJrXSh4VtVDt1jkkiF
	x/vJ33RR2S79EsXidRkiHLMcvMKjAWVjiSAJuZGuYj+vtIZfu/2XB1SzgffXTJjBmLK/k44lTJtbb
	ee5CSGDVvhnvl+A1VvA08bIshuJ9GEe9gO8CpvSakbnk3egCSDb//9w9pxyFDZdJLMKaF2ruvAha/
	aScBLGWccEULQDGyI0+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRu7C-0000000DXti-2UmD;
	Fri, 13 Nov 2026 16:27:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRu79-0000000DXsg-3BSR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 16:27:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9D37E143D;
	Fri, 13 Nov 2026 08:26:52 -0800 (PST)
Received: from [10.57.67.215] (unknown [10.57.67.215])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 343483F673;
	Fri, 13 Nov 2026 08:26:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794587215; bh=dx8muCVYeDPy2QKy19aHXLOssocMH92hk+wTEOh+S2c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=um0Z1MguqXQ8blB8JQE/qq8Zfq1bjvAzBvhOvIMT2Q6WCh2xsGWLNMiYlpJJx/RT8
	 0/q22nwbKtcU1lUiKqeDaCDNKTHPeR8Ew8RenrzpRN/Kx6x1f+sGSI6pNMCsZk0kdw
	 vBmst7zYpt+0NFsc/w8bPy44Rc8krIKETT+fI79E=
Message-ID: <020d220a-6f21-46a9-a0d6-51e56a7b3a5a@arm.com>
Date: Fri, 13 Nov 2026 16:26:50 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/12] KVM: arm64: CCA: Tear down RTTs
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
References: <20261111145758.217946-1-steven.price@arm.com>
 <20261111145758.217946-8-steven.price@arm.com>
 <e1690e53-70fb-47fe-bd06-4758b1e196d2@arm.com>
 <6c362b9e-6ac3-4cbb-8e9d-d666f87ef8c2@arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <6c362b9e-6ac3-4cbb-8e9d-d666f87ef8c2@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_082700_140370_B327777C 
X-CRM114-Status: GOOD (  25.28  )
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

On 13/11/2026 15:05, Steven Price wrote:
> On 13/11/2026 01:04, Suzuki K Poulose wrote:
>> On 11/11/2026 14:57, Steven Price wrote:
>>> The RMM owns the stage 2 page tables for a realm, and KVM must request
>>> that the RMM creates/destroys entries as necessary. The physical pages
>>> to store the page tables are delegated to the realm as required, and can
>>> be undelegated when no longer used.
>>>
>>> Creating new RTTs is the easy part, tearing down is a little more
>>> tricky. The result of realm_rtt_destroy() can be used to effectively
>>> walk the tree and destroy the entries (undelegating pages that were
>>> given to the realm).
>>>
>>> Tear down a created Realm whether it is still new or has been activated.
>>> Unmap the Realm IPA space once during stage-2 teardown. Defer
>>> destruction of non-root RTTs until final Realm destruction, after
>>> REALM_TERMINATE and before destroying the RD; root RTTs remain until the
>>> RD has gone away.
>>>
>>> Signed-off-by: Steven Price <steven.price@arm.com>
>>>

...

>>>      #endif /* __ASM_KVM_RMI_H */
>>> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
>>> index 9df3f8d5b4ef..be014f6c00e7 100644
>>> --- a/arch/arm64/kvm/mmu.c
>>> +++ b/arch/arm64/kvm/mmu.c
>>> @@ -1145,9 +1145,25 @@ int kvm_init_stage2_mmu(struct kvm *kvm, struct
>>> kvm_s2_mmu *mmu, unsigned long t
>>>        return err;
>>>    }

...

>>>    void kvm_uninit_stage2_mmu(struct kvm *kvm)
>>>    {
>>> -    kvm_free_stage2_pgd(&kvm->arch.mmu);
>>> +    if (kvm_realm_is_created(kvm))
>>> +        kvm_realm_uninit_stage2(&kvm->arch.mmu);
>>> +    else
>>> +        kvm_free_stage2_pgd(&kvm->arch.mmu);
>>
>> We added kvm_free_stage2_pgd() from kvm_destroy_realm() for Realms in
>> the previous patch. Should we move that here since, this is where we
>>
>> 1. Deal with tearing down stage2
>> 2. And more importantly we are skipping it for Realms.
> 
> I'm not quite sure what you're asking for here. We can't free the stage2
> PGD while the realm is existing (because the RMM has the pages) - so we
> defer it.

I understand. My point is, we are deferring the stage2 free for Realm
in this patch, without explicitly showing where it is done. We have
introduced that as part of kvm_destroy_realm() in Patch 6.

My recommendation is to add kvm_free_stage2_pgd() to kvm_destroy_realm()
in this patch, where we are showing when this is deferred to. e.g.,
this patch functionally leaves the reader with no clue when this is
actually freed.

Does that make sense ?


> 
>>>        kvm_mmu_free_memory_cache(&kvm->arch.mmu.split_page_cache);
>>>    }
>>>    diff --git a/arch/arm64/kvm/rmi.c b/arch/arm64/kvm/rmi.c
>>> index 69c628cfb6c7..b904e6541fb0 100644
>>> --- a/arch/arm64/kvm/rmi.c
>>> +++ b/arch/arm64/kvm/rmi.c
>>> @@ -11,16 +11,193 @@
>>>    #include <asm/kvm_pgtable.h>
>>>    #include <asm/virt.h>
>>>    +static inline unsigned long rmi_rtt_level_mapsize(int level)
>>> +{
>>> +    if (WARN_ON(level > KVM_PGTABLE_LAST_LEVEL))
>>> +        return PAGE_SIZE;
>>> +
>>> +    return (1UL << ARM64_HW_PGTABLE_LEVEL_SHIFT(level));
>>> +}
>>> +
>>
>> We agreed to use kvm_granule_size() instead of this ?
>>
>> https://lore.kernel.org/all/cb183290-3fee-4535-aa3e-5cc172c2323a@arm.com
> 
> That was a screw-up when I was squashing fixes back in - the next patch
> removes the code. I'll fix this up in the next version so it never
> appears. Thanks for pointing it out.
> 
>>>    u32 kvm_rmm_ipa_limit(void)
>>>    {
>>>        return u64_get_bits(rmi_feat_reg(0), RMI_FEATURE_REGISTER_0_S2SZ);
>>>    }
>>>    +static int get_start_level(struct realm *realm)
>>> +{
>>> +    return 4 - max(2, stage2_pgtable_levels(realm->ia_bits));
>>
>> I don't think we need this "max()". ia_bits is guaranteed to be
>>> = 32bit (ARM64_MIN_PARANGE_BITS, see kvm_init_ipa_range()), implying
>> that we have at least 2 levels on all page sizes.
> 
> Ah, very true - Sashiko complained, but I hadn't noticed
> ARM64_MIN_PARANGE_BITS provided an effective minimum. I'll remove the
> max() and add a comment.
> 
>>> +}
>>> +
>>> +static void free_rtt(phys_addr_t phys)
>>> +{
>>> +    kvm_account_pgtable_pages(phys_to_virt(phys), -1);
>>> +    if (rmi_free_delegated_page(phys))
>>> +        kvm_account_pgtable_pages(phys_to_virt(phys), 1);
>>
>> Is there a reason why remove the account before freeing ? Could we do
>> this after we have reclaimed it ?
> 
> Sashiko again:
> 
>> Does calling kvm_account_pgtable_pages() after rmi_free_delegated_page()
>> access the page after it has already been freed and uncharged from its
>> memcg?
> 
> Basically the problem is that rmi_free_delegated_page() frees the page
> back to the allocator. So doing the account after freeing means that
> technically the page could have been reused.

Thanks, for the explanation, that makes sense.

Cheers
Suzuki


