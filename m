Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93449606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 10:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xnFh5xpQ;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Q5XwbQpl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=o0xJIki+mFoJUWoYjAhFxPBVjnzW6F1WhyTl0VK8FZs=; b=xnFh5xpQKxbCDB
	xik/kf3CIJPuIQ3nJwFx+lKSOdiP1YQ3BMb6PVao3aiQ9y7XuOSQFqUnqfEA7xCwyvWz1bISRS1wm
	wK4xp5Hws64h/9a/Cq+F54c4oK8dhsSS8WR4RGuMllDrcfakaqTYiwGLAvQvOpyXTkHf1+dEPBjHm
	BtqIwxuBx9waTIkPR8+3lMSxXB4VfGn9q9LjMyeesBCLRW45o+9SP+y3dqD7/vwGfuJppn7LRpm8V
	pQmFebGwtKYuZgkoMBmMKfzwflvnRDvKAthlU0EfgWA1jYZo56k8LCub1Dc92gdTuXq5nM0iUGjtx
	NmqvbL4B0N4l6zuEOCNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTz6O-0000000BUny-42IT;
	Thu, 19 Nov 2026 10:10:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTz6M-0000000BUnd-3aqq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 10:10:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 021D81575;
	Thu, 19 Nov 2026 02:10:40 -0800 (PST)
Received: from [10.0.129.3] (Suzukis-MBP.cambridge.arm.com [10.0.129.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 90FB23F632;
	Thu, 19 Nov 2026 02:10:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795083042; bh=7YWcBLhIPYqKWe2ix2RQNC66Zd0lpOfLCGPkdsJOsBM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Q5XwbQpl4Z1MWetRAjz0CoLEMc7Y0wB+bliAGEGpeV6ErsaD+ydzUiBaPjwO5jKrs
	 LlqFQ54UaiKTsXHzDr16BV58dhQs/9gv5/7o1EOMNLdON/YbPP7A8pIzJRRaCBTSEb
	 pBoo0+42pwwdHFFOu29tYezIaJbmqXPp6sfM/iK0=
Message-ID: <120ad525-efa5-4129-9d97-fa6fa5db747f@arm.com>
Date: Thu, 19 Nov 2026 10:10:38 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/11] KVM: arm64: guest_memfd: Check mmap support when
 preparing memslot
Content-Language: en-GB
To: Steven Price <steven.price@arm.com>, Fuad Tabba <tabba@google.com>,
 Ackerley Tng <ackerleytng@google.com>,
 Sean Christopherson <seanjc@google.com>
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
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Kohei Enju <enju.kohei@fujitsu.com>
References: <20261116164358.142785-1-steven.price@arm.com>
 <20261116164358.142785-2-steven.price@arm.com>
 <CA+EHjTy5xBmavNWSYPjqU9qXtssV3ZHzsUr1s_4bVOt1GnDLVg@mail.gmail.com>
 <6bb490cd-ebbe-41d7-adf3-d6eaf0e53478@arm.com>
 <b1ef7241-54b0-4a17-83b6-0008e722f2f6@arm.com>
 <8a095a42-662a-416d-a5d7-79e10161201c@arm.com>
 <cc27e6a8-6bfa-4c82-92a7-33175baf6803@arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <cc27e6a8-6bfa-4c82-92a7-33175baf6803@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_021046_967210_BDB0A7B7 
X-CRM114-Status: GOOD (  16.58  )
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Cc: Ackerley, Sean

On 18/11/2026 15:18, Steven Price wrote:
> On 18/11/2026 12:04, Suzuki K Poulose wrote:
>> On 18/11/2026 11:14, Steven Price wrote:
>>> On 18/11/2026 10:34, Suzuki K Poulose wrote:
>>>> Hi Steven
>>>>
>>>> On 17/11/2026 14:05, Fuad Tabba wrote:
>>>>> Hi Steven,
>>>>>
>>>>> On Mon, 16 Nov 2026 16:43:47 +0000, Steven Price
>>>>> <steven.price@arm.com> wrote:
>>>>>> Check the guest_memfd backing file when deciding whether an arm64
>>>>>> memslot has mappable memory rather than checking whether the slot is
>>>>>> gmem only. A public helper function is added to be able to reuse the
>>>>>> static kvm_gmem_supports_mmap() function.
>>>>>
>>>>> nit: could the message say why this is needed? It's a no-op until
>>>>> patch 8 defines kvm_arch_has_private_mem(), which makes every
>>>>> guest_memfd slot gmem-only.
>>>>
>>>> I still don't understand why this is needed. For arm64 we have always
>>>> prevented guest_memfd without MMAP, in kvm_arch_prepare_memory_region().
>>>
>>> Fuad is correct, this isn't really needed until patch 8. Patch 8 defines
>>> kvm_arch_has_private_mem() - that means that gmem_in_place_conversion
>>> becomes true (see include/linux/kvm_host.h). That in turn means that
>>
>>> every guest_memfd slot is KVM_MEMSLOT_GMEM_ONLY including slots backed
>>> by a file without mmap support.
>>
>> But we dont support slots without MMAP anyways even without this series.
>>   So, does it really matter for arm64 ?
> 
> So ChatGPT produced the attached test. It creates a non-mappable gmem
> and tries to add it to a normal (non-realm/non-pkvm) VM. With v7.4-rc1
> it is rejected. However without this patch it succeeds.
> 
> The issue is that gmem_in_place_conversion changes the behaviour for
> normal VMs.

I see, thanks Steven. For context:

Arm64 currently (without inplace conversion support) only allows GMEM
with MMAP flags only and relies on kvm_slot_gmem_only() to detect that
the GMEM has MMAP flag. But, when we enable inplace conversion,
we can't reliably reject the slots by kvm_slot_gmem_only(), because
all GMEM slots are marked GMEM only with inplace conversion.

Also, from the API Documentation,

"When the KVM MMU performs a PFN lookup to service a guest fault, the 
fault will
always be consumed from guest_memfd, regardless of whether it is a 
shared or a
private fault (unless in-place conversion is disabled and the backing
guest_memfd does not have the GUEST_MEMFD_FLAG_MMAP flag set)."

So, in effect, with in-place conversion enabled a KVM_CREATE_GUEST_MEMFD
without GUEST_MEMFD_FLAG_MMAP is an error and thats what this patch
is trying to fix in arm64 KVM. The question is:

1) Should this be fixed ? How does TDX/SNP support older VMMs with
inplace conversion ? What was the conclusion on this breakage ?

2) If it should be, then shouldn't it be done in kvm_gmem_create() ?

Suzuki


> 
> Thanks,
> Steve
> 


