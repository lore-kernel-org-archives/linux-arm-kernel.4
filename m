Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68771606A337
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 11:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=z/gEMxUc;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Qzcy7j5c
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=PYV844ivqJ39fhXbpbQJt7ThrmrdZ/Uef1Hl7B/7mic=; b=z/gEMxUc/ey+/W
	yKgMP1kMKfiIDSJT67IhNUaQmFbejFA7sHPoQfZN5x99sAQWdGWizLhlYYR745UScSO65GuB1ViKP
	OmR57sPlylUaEjCZheI9LkBtAlUEJk9yQrRgtK4VpGNUsYBl/VBPguYJtWC3IJvFWPu8Xe157zZuN
	+SUElOKIzhwGQvlBtCDW00vPXNt904aqLwpDykAcKTKQzhW2sGpihenQ3ZUBtRal70Xd7Uo11hZBy
	9WoEgtAlGAUyGBPy8SgUSizfb68UtBmwboKFggCidP73yTrop85mLhzUl5EJrdmXJNK8hSYoO+K2r
	HENFijstiZjl2HLqoUAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQNf1-00000000XNe-0FFG;
	Mon, 09 Nov 2026 11:35:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQNez-00000000XN8-1ATM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 11:35:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 37FB61516;
	Mon,  9 Nov 2026 03:35:33 -0800 (PST)
Received: from [10.2.197.99] (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B59B93F85F;
	Mon,  9 Nov 2026 03:35:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794224136; bh=rTLHWsiv8pph/dAfc4DcKVgal8O6MwfZfU2M1D232cA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Qzcy7j5c8+tbgnD1Z9hB0H2xfYVSag9SEoaDEDoibA7M1o5laQrfJaS2pa7i5zACm
	 0Wgo+QHOtul0e27z4on0wY4fO+kWBT/9IiUgRtGqRXOU8DsIHZh5o41QjjaZjx8WoB
	 tleUJKwVUK/luuLMar6jw5SH1NCbv5e66XgI8lXc=
Message-ID: <06e52c9c-9026-4279-b8c0-53a54a667dad@arm.com>
Date: Mon, 9 Nov 2026 11:35:31 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/11] KVM: arm64: CCA: Support runtime faulting of memory
To: Fuad Tabba <tabba@google.com>
Cc: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev, Catalin Marinas <catalin.marinas@arm.com>,
 Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>,
 James Morse <james.morse@arm.com>, Oliver Upton <oliver.upton@linux.dev>,
 Zenghui Yu <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Christoffer Dall <christoffer.dall@arm.com>, linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Gavin Shan <gshan@redhat.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 Alper Gun <alpergun@google.com>, "Aneesh Kumar K . V"
 <aneesh.kumar@kernel.org>, Emi Kisanuki <fj0570is@fujitsu.com>,
 Vishal Annapurve <vannapurve@google.com>, WeiLin.Chang@arm.com,
 Lorenzo Pieralisi <lpieralisi@kernel.org>
References: <20261102141304.126883-1-steven.price@arm.com>
 <20261102141304.126883-11-steven.price@arm.com>
 <fa0ee5a1-4c49-4c1f-bfbb-c270dc4b6301@arm.com>
 <CA+EHjTy970AWnhYoZ5OqxQ8ojCAELeejw60y2NmpDsM_ZMdu4Q@mail.gmail.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <CA+EHjTy970AWnhYoZ5OqxQ8ojCAELeejw60y2NmpDsM_ZMdu4Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_033537_405704_5DA126CC 
X-CRM114-Status: GOOD (  19.48  )
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

Hi Fuad

Thanks for sharing the pVM gmem details, some more questions below.

On 09/11/2026 07:40, Fuad Tabba wrote:
> Hi Suzuki, Steve,
> 
> On Thu, 05 Nov 2026 17:30:16 +0000, Suzuki K Poulose
> <suzuki.poulose@arm.com> wrote:
> [...]
>>> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> [...]
>>> @@ -1816,13 +1828,28 @@ static int gmem_abort(const struct kvm_s2_fault_desc *s2fd,
>>>          /* Pairs with the smp_wmb() in kvm_mmu_invalidate_end(). */
>>>          smp_rmb();
>>>
>>> +        if (kvm_vm_is_realm(kvm)) {
>>> +                is_realm_private = kvm_realm_is_private_address(&kvm->arch.realm,
>>> +                                                                s2fd->fault_ipa);
>>> +
>>> +                if (is_realm_private != kvm_gmem_is_private_gfn(kvm, canonical_gfn)) {
> [...]
>> I am wondering there is a way to make it a bit more generic. The issue
>> is, only Realm has private memory with guest_memfd for now. Don't know
>> the pKVM plans for it.
> 
> The plan is for protected pKVM VMs to be backed by guest_memfd too,
> which would also hold each page's private/shared state [1]. So
> kvm_arch_has_private_mem() will be true for them, and this comparison
> applies as is. Only how the expected state is computed differs: for a
> pVM it comes from the per-page share state rather than an IPA bit.

When you say, per-page, you mean per-IPA or per "backing page" ? i.e.,
can pKVM do something like :

    kvm_ipa_is_private(kvm, ipa) ?

(similar to Realm) or does it need the struct page backing the "ipa" ?

> 
> Steve, could you gate the guest_memfd checks on
> kvm_arch_has_private_mem(kvm) rather than kvm_vm_is_realm(), this one
> and the memslot check you proposed for 02/11? Only the
> kvm_realm_is_private_address() and realm_map_ipa() calls are
> realm-specific, and they could be VM_REALM cases of a switch on
> vm_flavor, as Marc asked for on the v21 memslot check [2]. The macro
> would then only widen to protected VMs when pKVM's guest_memfd support

Makes sense.

Suzuki

> lands.
> 
> Cheers,
> /fuad
> 
> [1] https://lore.kernel.org/all/CA+EHjTz+WgXEW5RTxXf4oGeEb1Tsm5Ha4nOc4S1jBcp7jxP4+A@mail.gmail.com/
> [2] https://lore.kernel.org/all/86mrsw2jrn.wl-maz@kernel.org/


