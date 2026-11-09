Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97C89606D819
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 13:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uJPF6yce;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=hqlHWuAO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=XLjVVqRd3p8pCryT/VdTNuVykrHMu0nh/BoWx9VVYBY=; b=uJPF6yceWaebGZ
	OVVtQI3DlG2uZ7azFJCedLrUUuBufIb7lVqzZOzoZNdOrLmSZm1CnTJo3CZyTiM64G//GLoB5V4mM
	onH3kPRpTpKNSmg4bBVUWzvrKXz0oRRScEZff5cg693aJaLa9F1X3lOMMHaKvQt03admPzR6u0kur
	exyUUMl5SnnC//dxx7qJ/+E68eTBFZSil6MIwlE1mf+bwmiXbyjKYvWlQ3/xOKIJHXOlPKw0OAUYI
	X2ANTJL0Jh3eB6znka/k1OLMOHFcAcpjUG6pYRhAg/dswdpLZGwrZXTwkhsYKuHT8nM1aEmhsI97h
	mWXWqvJMtAKMj7jEyF7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQPYp-00000000qCn-0ySl;
	Mon, 09 Nov 2026 13:37:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQPYk-00000000qAB-3S5j
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 13:37:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ACB4014BF;
	Mon,  9 Nov 2026 05:37:12 -0800 (PST)
Received: from [10.57.60.25] (unknown [10.57.60.25])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AD2543F632;
	Mon,  9 Nov 2026 05:37:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794231435; bh=NnQ/lEoIzA5Usu4Fnnce/QHJMYYmA9ABd8vXbiATAAQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hqlHWuAOhP2c6MKtExUEUsXcpTvjTSy/wmSieETuzLi3Tp9gaYEk34F5HIiSJJGGO
	 hjEnQpAD91vJGTYBOKKPDeTPncDQybIkK8mynI3UZeNxt32odugTQYOrDZ/eg9ywOu
	 gIBIPBiML6bNn8UnkUiygB6P8gIDKVKxRVz4+FTc=
Message-ID: <473e0c95-e027-44dc-a355-eed26d8a3926@arm.com>
Date: Mon, 9 Nov 2026 13:37:03 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/11] KVM: arm64: CCA: Support runtime faulting of memory
To: Fuad Tabba <tabba@google.com>, Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev,
 Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>, Zenghui Yu <yuzenghui@huawei.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Joey Gouly <joey.gouly@arm.com>, Alexandru Elisei
 <alexandru.elisei@arm.com>, Christoffer Dall <christoffer.dall@arm.com>,
 linux-coco@lists.linux.dev,
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
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <CA+EHjTy970AWnhYoZ5OqxQ8ojCAELeejw60y2NmpDsM_ZMdu4Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_053719_046768_1E8F29FA 
X-CRM114-Status: GOOD (  17.61  )
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

On 09/11/2026 07:40, Fuad Tabba wrote:
> Hi Suzuki, Steve,

Hi Fuad,

> On Thu, 05 Nov 2026 17:30:16 +0000, Suzuki K Poulose
> <suzuki.poulose@arm.com> wrote:
> [...]
>>> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> [...]
>>> @@ -1816,13 +1828,28 @@ static int gmem_abort(const struct kvm_s2_fault_desc *s2fd,
>>>         /* Pairs with the smp_wmb() in kvm_mmu_invalidate_end(). */
>>>         smp_rmb();
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
> 
> Steve, could you gate the guest_memfd checks on
> kvm_arch_has_private_mem(kvm) rather than kvm_vm_is_realm(), this one
> and the memslot check you proposed for 02/11? Only the
> kvm_realm_is_private_address() and realm_map_ipa() calls are
> realm-specific, and they could be VM_REALM cases of a switch on
> vm_flavor, as Marc asked for on the v21 memslot check [2]. The macro
> would then only widen to protected VMs when pKVM's guest_memfd support
> lands.

Sure I can include that in v2.

Thanks,
Steve

> Cheers,
> /fuad
> 
> [1] https://lore.kernel.org/all/CA+EHjTz+WgXEW5RTxXf4oGeEb1Tsm5Ha4nOc4S1jBcp7jxP4+A@mail.gmail.com/
> [2] https://lore.kernel.org/all/86mrsw2jrn.wl-maz@kernel.org/


