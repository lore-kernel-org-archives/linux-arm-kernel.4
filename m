Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35870606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 09:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kWaJLm7Z;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=QvB9JfTb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=d1DkW7hSxM4zmZB+M7JMw570YuREp3Imf+VPgNwrY+U=; b=kWaJLm7Z2MWYps
	6v1XXx2/8/IWwYrh7E7s7bGDgrHJWVBrQjC752qkbtBBNvr3Q6wO3B4MEzwKMrnAO4JzzWB9CjyPJ
	RgKO5mg89oOO7GkoZymG8HxHYaNoDNafsx1XhbR1qWiuxgMdboKWpwATjLH/2JPolb2MC2GDLW7q8
	1Psk2sfC0RRuv5jdNuv+9nigLXSRHiQ4OmUKDns0Pnp3WGDWvs4mmQyfePCnL8+nk9qPirxM6XWuZ
	EPjqpv3ChiGb6dubuHS3xRu3RrwLGVl9Nplmvym7Hx4SbSgGA/z7frPGOPSnzCuy6MdwYXZFRFpmD
	3Vd7mp5HA6PC/J8or1lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW9fr-00000009Nfn-2VG3;
	Wed, 25 Nov 2026 09:52:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW9f8-00000009NOI-2K2v
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 09:51:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9881C339;
	Wed, 25 Nov 2026 01:51:34 -0800 (PST)
Received: from [10.2.197.99] (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4DDC93F86F;
	Wed, 25 Nov 2026 01:51:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795600297; bh=tRDSqd+CGHk3r5D+U05UtW8jtHrhEXkjEro27EFWSG0=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=QvB9JfTb0eVj0TNqX1/aisA+sCnq88pRePMzXgvNV5TV++zi35AaZ9JuNCI5IexBi
	 403av+utnLN8jKrvqrVP4VHRBw7vSuqkg1m1uZn6hfyNMVnKla4d3DaHAzdEAc1fZA
	 993f3D2B+tNmlZ4COwetskel25c8xKMzHeI3iH7k=
Message-ID: <70c50c45-c8b9-4096-84b2-ba4b6ecb63ed@arm.com>
Date: Wed, 25 Nov 2026 09:51:32 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/11] KVM: arm64: CCA: Add Realm RTT mapping and
 invalidation helpers
From: Suzuki K Poulose <suzuki.poulose@arm.com>
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
 <20261123104233.95710-8-steven.price@arm.com>
 <bc90af1d-068e-4e79-8d5f-f8205beb0a69@arm.com>
Content-Language: en-US
In-Reply-To: <bc90af1d-068e-4e79-8d5f-f8205beb0a69@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_015140_219060_562804AB 
X-CRM114-Status: GOOD (  23.01  )
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



On 24/11/2026 00:20, Suzuki K Poulose wrote:
> On 23/11/2026 10:42, Steven Price wrote:
>> Add the RMI RTT creation and unmap helpers needed by CCA Realm stage-2
>> memory operations. REC exit handling and guest requested RIPAS changes
>> follow in the vCPU series.
>>
>> Signed-off-by: Steven Price <steven.price@arm.com>
>>
>> ---
>> Changes since v3:
>> - Use the VTCR-derived Realm start level for RTT operations.
>>
>> Changes since v2:
>> - Use a local MMU cache during notifier invalidation, handle
>>    failed RTT splits, and validate RMI levels and cache state.
>>
>> Changes since v1:
>> - Rework RTT creation and folding around missing or existing RTTs.
>>    Use a shared RMI block-size helper and handle alignment, partial
>>    progress and errors in range operations.
>> ---
>>   arch/arm64/include/asm/kvm_rmi.h |   8 +
>>   arch/arm64/kvm/rmi.c             | 421 +++++++++++++++++++++++++++++++
>>   drivers/firmware/arm_rmm/rmi.c   |  10 -
>>   include/linux/arm-rmi-cmds.h     |   8 +
>>   4 files changed, 437 insertions(+), 10 deletions(-)
>>
>> diff --git a/arch/arm64/include/asm/kvm_rmi.h b/arch/arm64/include/ 
>> asm/kvm_rmi.h
> 
> ...
> 
>> +
>> +static void realm_unmap_shared_range(struct kvm *kvm,
>> +                     unsigned long start,
>> +                     unsigned long end,
>> +                     bool may_block,
>> +                     struct kvm_mmu_memory_cache *mc)
>> +{
>> +    struct realm *realm = &kvm->arch.realm;
>> +    unsigned long rd = realm->rd_phys;
>> +    unsigned long next_addr, addr;
>> +    unsigned long shared_bit = BIT(realm->ia_bits - 1);
>> +
>> +    if (start >= end)
>> +        return;
>> +
>> +    /*
>> +     * Callers may pass either an IPA range or its shared alias. Add the
>> +     * shared bit only for the former. Use addition so an exclusive 
>> end at
>> +     * shared_bit advances to the end of the IPA space.
>> +     */
>> +    if (start < shared_bit) {
>> +        start += shared_bit;
>> +        end += shared_bit;
>> +    }
>> +
>> +    for (addr = start; addr < end; addr = next_addr) {
>> +        long ret;
>> +
>> +        ret = rmi_rtt_unprot_unmap(rd, addr, end, RMI_ADDR_TYPE_NONE,
> 
> ...
> 
>> +        }
>> +
>> +        if (may_block)
>> +            cond_resched_rwlock_write(&kvm->mmu_lock);
>> +    }
>> +
>> +    realm_fold_rtt_level(realm, realm->start_level + 1,
>> +                 start, end);
> 
> See below.
> 
>> +}
>> +
>> +static void realm_unmap_private_range(struct kvm *kvm,
>> +                      unsigned long start,
>> +                      unsigned long end,
>> +                      bool may_block,
>> +                      struct kvm_mmu_memory_cache *mc)
>> +{
>> +    struct realm *realm = &kvm->arch.realm;
>> +    unsigned long rd = realm->rd_phys;
>> +    unsigned long next_addr, addr;
>> +    long ret;
>> +
>> +    for (addr = start; addr < end; addr = next_addr) {
>> +        unsigned long out_range;
>> +        unsigned long flags = RMI_ADDR_TYPE_SINGLE;
>> +        /* TODO: Optimise using RMI_ADDR_TYPE_LIST */
>> +
>> +        ret = rmi_rtt_data_unmap(rd, addr, end, flags, 0,
> 
> ...
> 
>> +        }
>> +
>> +        if (may_block)
>> +            cond_resched_rwlock_write(&kvm->mmu_lock);
>> +    }
>> +
>> +    realm_fold_rtt_level(realm, realm->start_level + 1,
>> +                 start, end);
> 
> 
> If "may_block", we don't take that into account while folding the RTTs ?
> On a bigger range, we might spend too much time, starving the other
> threads.
> 
> Also, there is no point in folding the RTTs if the Realm is dying. So, I
> would rather skip this if the Realm is not ACTIVE.

Having a think about it, I don't think the folding of RTTs in the unmap
case is a good idea. We could leave them as they are, because:

1) As mentioned above, we are holding the write_lock() and doing this
within the lock is bad for contention
2) We do not check if there was any mapping at all that was actually
invalidated. i.e., the tables were already folded and for a big range
we go over it unnecessarily.
3) For fixing up permission faults on shared range, we end up unmapping
the range and then trying to map it. Folding here means, we could end
up in the dance of reclaiming the RTT and then creating it back for
each L3. (This is a rare case though).

Overall, I don't see the benefit of folding outweighing the impact of
it. So, could we please drop this ?


Cheers
Suzuki


> 
> Suzuki


