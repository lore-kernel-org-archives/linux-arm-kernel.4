Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B316C606A320
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 16:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=d0JwzAs0;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=UAM//OUL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=We1LJjJy1kCPW5EPJlSwLuh9zShR5MvSm97HULZTIo4=; b=d0JwzAs0bDUuTL
	butLyErTFjFSBrHzDdWlDQQOrM+3C1Sj0qbB+h/iMxbDRazSWV05P2gSL/HSTSda2tymZMdc9aLzt
	Yl+0+9TDDYTHkwrOsc72N/Bf/LBY+MpR0QrzOP04ORaEKWf3a2KIBVcoszLfFcIV5vziCK/Wh5frM
	8v2lwPjbX8f2gY4foh89O2PBy60ZPe78jooUiQROXqpIf6aMQy4epOaJxe5SbJWLz9i85CAOPRjH8
	eySZTqdAoS/2cJzb0odx58EcmYZehqQ6gXP6Wk7tGCGAST/fDTnsj9wH3byU0qO3U6KU7uvnj5keR
	GkqrAEg2c/kLvmGHw86w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTiqf-00000009ZXe-1gaj;
	Wed, 18 Nov 2026 16:49:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTiqb-00000009ZWp-23WK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 16:49:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B5AFD143D;
	Wed, 18 Nov 2026 08:49:21 -0800 (PST)
Received: from [10.57.62.206] (unknown [10.57.62.206])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 571CE3F673;
	Wed, 18 Nov 2026 08:49:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795020564; bh=5DF3UMuuIAB9eEb863SsQyI53Bmrii/ORFqImQUx9Ck=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UAM//OULyFGAv7/1q3GJ435EUNjO1b4O1WG5u+nQr9NMdylc3Fx2uWKh14BhWsVMS
	 TBOFPuGu3IpQ2ztmBBQhLPAMHzdUK8EcCrJCKwYaZFxQATLKRAyFJG0WzAKC4qGTja
	 AegXQAErNCqkoGgBNl0v1dds8/wdY+g3Tusstjj0=
Message-ID: <9b42bb54-97aa-4b2f-94f8-0c887a7f82a2@arm.com>
Date: Wed, 18 Nov 2026 16:49:17 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/11] KVM: arm64: CCA: Prevent memslot modifications
 after Realm creation
To: Fuad Tabba <tabba@google.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
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
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Kohei Enju <enju.kohei@fujitsu.com>
References: <20261116164358.142785-1-steven.price@arm.com>
 <20261116164358.142785-9-steven.price@arm.com>
 <CA+EHjTzAo+5FhtxfX8mQ4t3k5BhatR15UKNSAQw+CRbxJ=wz7A@mail.gmail.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <CA+EHjTzAo+5FhtxfX8mQ4t3k5BhatR15UKNSAQw+CRbxJ=wz7A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_084925_621205_D27E3B80 
X-CRM114-Status: GOOD (  14.20  )
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

On 17/11/2026 14:42, Fuad Tabba wrote:
> On Mon, 16 Nov 2026 16:43:54 +0000, Steven Price <steven.price@arm.com> wrote:
> [...]
>> Define kvm_arch_has_private_mem() so generic KVM recognizes Realm VMs
>> as supporting private memory.
> [...]
>> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> [...]
>> @@ -1611,6 +1611,8 @@ struct kvm *kvm_arch_alloc_vm(void);
>>
>>  #define kvm_vm_hyp_is_distrusting(kvm)        ((kvm)->arch.vm_flavor >= __VM_DISTRUSTING_HYP)
>>
>> +#define kvm_arch_has_private_mem(kvm) kvm_vm_is_realm(kvm)
> 
> Could the message say that defining the macro makes
> gmem_in_place_conversion true for every arm64 VM? One visible change
> is that KVM_SET_MEMORY_ATTRIBUTES2 on a non-Realm VM's guest_memfd
> returns -EINVAL instead of -ENOTTY.

True - I'll explicitly mention that the commit message just in case
anyone bisects that in the future.

> [...]
>> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> [...]
>> @@ -2887,10 +2903,13 @@ int kvm_arch_prepare_memory_region(struct kvm *kvm,
>>                  return 0;
>>
>>          /*
>> -         * Prevent userspace from creating a memory region outside of the IPA
>> -         * space addressable by the KVM guest IPA space.
>> +         * Realm shared IPAs alias the corresponding private IPAs, so memslots
>> +         * must reside entirely in the canonical lower half of the IPA space.
>>           */
>> -        if ((new->base_gfn + new->npages) > (kvm_phys_size(&kvm->arch.mmu) >> PAGE_SHIFT))
>> +        ipa_limit = kvm_phys_size(&kvm->arch.mmu) >> PAGE_SHIFT;
>> +        if (kvm_vm_is_realm(kvm))
>> +                ipa_limit >>= 1;
>> +        if (new->base_gfn + new->npages > ipa_limit)
>>                  return -EFAULT;
> 
> This check still applies to every VM, so I'd keep the old comment and
> add the Realm sentence to it.

Ack.

Thanks,
Steve


