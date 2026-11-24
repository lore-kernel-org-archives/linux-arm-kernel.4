Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EDAC606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 00:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=L00mpBqU;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=bwgES/Fb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=2GtSg4vRHiDWPpeLY7sTd2iSc0/Gk0S5h4DsqQKBcWI=; b=L00mpBqUcOUOLt
	lQPxQwp2B7quyFVx1zbtlydIcACQ0TfCno+KOHViCA372KdrTfc9Dd7PT/7qFXp1iyFQQsfj0YFII
	GU7OmdXIXRPO6ZcHkrYLhE4wnSUuTeJFhPT+TKdLPGhctjloswIb9rD05zDNNYkABc0YvKpFsiZzA
	p4NM+Ko813LkzQjJk9T192yY4vJ772Z0potKg9WWfn273adBEZ/9mukNQceu70BgnWuZfWC1kqKOo
	R/n4dlAIc68nbNpcNR4wxSYg5n5MfWAKRMeXo860uM7SdoZ4VGn5aazd82YjcdJZpjZd5ObKaIVld
	x3EkIx5pBqPxLBfJLh/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVeGw-00000005FsD-1EJW;
	Tue, 24 Nov 2026 00:20:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVeGt-00000005Frp-1u5e
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 00:20:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 70474339;
	Mon, 23 Nov 2026 16:20:27 -0800 (PST)
Received: from [10.57.72.180] (unknown [10.57.72.180])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 942DF3F632;
	Mon, 23 Nov 2026 16:20:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795479630; bh=tqsptYjpvS8j/Z7OXZo9J1OL0d10RZs2DNvWvQ1dcGI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bwgES/Fbu9srTMgZIypAdiwXKHbbWyT4u1hi0ZcDWhVWdcXS/eyp+SqG7KVRv165x
	 KwGO8/oG1MFxQICHD5w2y0S1mkkuGNxBytwOaXKxODhM7NQb/4GB5EVkkFxoizwd7f
	 k7lwAkGRVqO3qMubF5x2TR2YeKd/oBx7DZS2PE4g=
Message-ID: <bc90af1d-068e-4e79-8d5f-f8205beb0a69@arm.com>
Date: Tue, 24 Nov 2026 00:20:24 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/11] KVM: arm64: CCA: Add Realm RTT mapping and
 invalidation helpers
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
References: <20261123104233.95710-1-steven.price@arm.com>
 <20261123104233.95710-8-steven.price@arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20261123104233.95710-8-steven.price@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_162031_587808_5C71858D 
X-CRM114-Status: GOOD (  20.64  )
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

On 23/11/2026 10:42, Steven Price wrote:
> Add the RMI RTT creation and unmap helpers needed by CCA Realm stage-2
> memory operations. REC exit handling and guest requested RIPAS changes
> follow in the vCPU series.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> 
> ---
> Changes since v3:
> - Use the VTCR-derived Realm start level for RTT operations.
> 
> Changes since v2:
> - Use a local MMU cache during notifier invalidation, handle
>    failed RTT splits, and validate RMI levels and cache state.
> 
> Changes since v1:
> - Rework RTT creation and folding around missing or existing RTTs.
>    Use a shared RMI block-size helper and handle alignment, partial
>    progress and errors in range operations.
> ---
>   arch/arm64/include/asm/kvm_rmi.h |   8 +
>   arch/arm64/kvm/rmi.c             | 421 +++++++++++++++++++++++++++++++
>   drivers/firmware/arm_rmm/rmi.c   |  10 -
>   include/linux/arm-rmi-cmds.h     |   8 +
>   4 files changed, 437 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/kvm_rmi.h b/arch/arm64/include/asm/kvm_rmi.h

...

> +
> +static void realm_unmap_shared_range(struct kvm *kvm,
> +				     unsigned long start,
> +				     unsigned long end,
> +				     bool may_block,
> +				     struct kvm_mmu_memory_cache *mc)
> +{
> +	struct realm *realm = &kvm->arch.realm;
> +	unsigned long rd = realm->rd_phys;
> +	unsigned long next_addr, addr;
> +	unsigned long shared_bit = BIT(realm->ia_bits - 1);
> +
> +	if (start >= end)
> +		return;
> +
> +	/*
> +	 * Callers may pass either an IPA range or its shared alias. Add the
> +	 * shared bit only for the former. Use addition so an exclusive end at
> +	 * shared_bit advances to the end of the IPA space.
> +	 */
> +	if (start < shared_bit) {
> +		start += shared_bit;
> +		end += shared_bit;
> +	}
> +
> +	for (addr = start; addr < end; addr = next_addr) {
> +		long ret;
> +
> +		ret = rmi_rtt_unprot_unmap(rd, addr, end, RMI_ADDR_TYPE_NONE,

...

> +		}
> +
> +		if (may_block)
> +			cond_resched_rwlock_write(&kvm->mmu_lock);
> +	}
> +
> +	realm_fold_rtt_level(realm, realm->start_level + 1,
> +			     start, end);

See below.

> +}
> +
> +static void realm_unmap_private_range(struct kvm *kvm,
> +				      unsigned long start,
> +				      unsigned long end,
> +				      bool may_block,
> +				      struct kvm_mmu_memory_cache *mc)
> +{
> +	struct realm *realm = &kvm->arch.realm;
> +	unsigned long rd = realm->rd_phys;
> +	unsigned long next_addr, addr;
> +	long ret;
> +
> +	for (addr = start; addr < end; addr = next_addr) {
> +		unsigned long out_range;
> +		unsigned long flags = RMI_ADDR_TYPE_SINGLE;
> +		/* TODO: Optimise using RMI_ADDR_TYPE_LIST */
> +
> +		ret = rmi_rtt_data_unmap(rd, addr, end, flags, 0,

...

> +		}
> +
> +		if (may_block)
> +			cond_resched_rwlock_write(&kvm->mmu_lock);
> +	}
> +
> +	realm_fold_rtt_level(realm, realm->start_level + 1,
> +			     start, end);


If "may_block", we don't take that into account while folding the RTTs ?
On a bigger range, we might spend too much time, starving the other
threads.

Also, there is no point in folding the RTTs if the Realm is dying. So, I
would rather skip this if the Realm is not ACTIVE.

Suzuki

