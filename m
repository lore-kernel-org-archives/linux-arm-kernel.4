Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA688606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 11:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=z3QtVLEq;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=m9Q7jtT3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=pdNtJPN+YZ4rri0c8RqM9UiYr5D4vUVV+Oim0b+KOQQ=; b=z3QtVLEqFOLrwV
	1nLsfPG1q3+mGYITF1agOv9/DpadokT+V6M3a7pnUjTPTR9sKbA0xJA9xagXxZ5ZjhMatyHxZk2tQ
	ZtnMiPbSqzZxZ/TRtSgmONZnlWWCS4jmDimgHjow5gJNTNqyEopeMOU2J7ChnRfqifYS6z82osXFS
	ab71FRWdu14ICrficmeGq76yuu3aD4x9DEsmRrMk64Bus4TPfv6QhR5g/4qmYvxs73UaBLUqzoz4K
	BvKvFcVSgh4ZttNPeXS2q8POh7uBiG1GClT+/mMYBBQ9RGY6ZQsYXV47HC3RHsPpQjLaHZEhUnJ13
	0DchzC2xDNsFEjjKp4aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVRzH-0000000362B-31wt;
	Mon, 23 Nov 2026 11:13:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVRzE-0000000360t-10lj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 11:13:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 06927143D;
	Mon, 23 Nov 2026 03:13:24 -0800 (PST)
Received: from [10.0.129.12] (Suzukis-MBP.cambridge.arm.com [10.0.129.12])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6DCA73F882;
	Mon, 23 Nov 2026 03:13:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795432406; bh=oNhrJvzngQdGUdvtf3HwuE2CWgPaaoD7obsB30AVFiY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=m9Q7jtT3qHQi3dYcCrefTbgfBfUUxdNLEeSayLg5rbIkTXoB/x4VvOFF+eg0uhNh2
	 T/4lQSmqKOLk+XDumy7kWWFZul9JkoADuqxsEvtsVmmda8EtepGJuohYsvZf+bq7uV
	 Nl/sd5PnvA+c6orhoSiVc+M4ML8dN8BWTlgNNhto=
Message-ID: <3a3c5681-ff1e-47b6-b942-2d5ce64a8d6d@arm.com>
Date: Mon, 23 Nov 2026 11:13:22 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/11] KVM: arm64: guest_memfd: Check mmap support when
 preparing memslot
Content-Language: en-GB
To: Sean Christopherson <seanjc@google.com>
Cc: Steven Price <steven.price@arm.com>, Fuad Tabba <tabba@google.com>,
 Ackerley Tng <ackerleytng@google.com>, kvm@vger.kernel.org,
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
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Kohei Enju <enju.kohei@fujitsu.com>
References: <20261116164358.142785-1-steven.price@arm.com>
 <20261116164358.142785-2-steven.price@arm.com>
 <CA+EHjTy5xBmavNWSYPjqU9qXtssV3ZHzsUr1s_4bVOt1GnDLVg@mail.gmail.com>
 <6bb490cd-ebbe-41d7-adf3-d6eaf0e53478@arm.com>
 <b1ef7241-54b0-4a17-83b6-0008e722f2f6@arm.com>
 <8a095a42-662a-416d-a5d7-79e10161201c@arm.com>
 <cc27e6a8-6bfa-4c82-92a7-33175baf6803@arm.com>
 <120ad525-efa5-4129-9d97-fa6fa5db747f@arm.com>
 <av8No1rvJLXwciId@seanjc-mac.roam.internal>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <av8No1rvJLXwciId@seanjc-mac.roam.internal>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_031328_367542_454556CF 
X-CRM114-Status: GOOD (  21.72  )
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

On 19/11/2026 14:54, Sean Christopherson wrote:
> On Thu, Nov 19, 2026, Suzuki K Poulose wrote:
>> I see, thanks Steven. For context:
>>
>> Arm64 currently (without inplace conversion support) only allows GMEM
>> with MMAP flags only and relies on kvm_slot_gmem_only() to detect that
>> the GMEM has MMAP flag. But, when we enable inplace conversion,
>> we can't reliably reject the slots by kvm_slot_gmem_only(), because
>> all GMEM slots are marked GMEM only with inplace conversion.
>>
>> Also, from the API Documentation,
>>
>> "When the KVM MMU performs a PFN lookup to service a guest fault, the fault
>> will always be consumed from guest_memfd, regardless of whether it is a shared
>> or a private fault (unless in-place conversion is disabled and the backing
>> guest_memfd does not have the GUEST_MEMFD_FLAG_MMAP flag set)."
>>


>> So, in effect, with in-place conversion enabled a KVM_CREATE_GUEST_MEMFD
>> without GUEST_MEMFD_FLAG_MMAP is an error
> 
> It's only an error if (a) the userspace address in the memslot points at the
> gmem fd and 

I don't understand this part. With inplace conversion, we mark the slot
as GMEM_ONLY and always resolve shared faults from the gmem (on arm64
as described by the API). So, isn't it a usage error from the VMM if it
plans to use GUEST_MEMFD_FLAG_MMAP=false with inplace conversion ?

In other words, do you mean to say, passing a non-gmem fd userspace
address is fine with GUEST_MEMFD_FLAG_MMAP=false ? But the API
documentation and the GMEM_ONLY flags contradict the usage.

Now, should we reject that in KVM or not is the secondary question.


(b) something in KVM tries to actually GUP the memslot using the
> userspace virtual address.

Agreed


Suzuki


> 
>> and thats what this patch is trying to fix in arm64 KVM. The question is:
>>
>> 1) Should this be fixed ? How does TDX/SNP support older VMMs with
>> inplace conversion ? What was the conclusion on this breakage ?
> 
> There is no "breakage".  If userspace doesn't point the userspace address at a
> valid VMA, that userspace's problem.  The only thing the early check would do is
> prevent weird use cases that may or may not be valid (and for which KVM doesn't
> care), and error out earlier if KVM guesses right and userspace really did goof.
> 
>> 2) If it should be, then shouldn't it be done in kvm_gmem_create() ?
> 
> No.  As above, I don't see any reason to have the check at all.


