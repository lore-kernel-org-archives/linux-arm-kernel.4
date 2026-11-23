Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACCB9606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 12:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qzYI6yLV;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=XbUEr6bz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=/5fuckEu5kRLieVoVNa0lCZNGChykYM2/RYhg24AQF8=; b=qzYI6yLVZpO2V3
	4SOQm1zpNGVCgNb5laAkX09E8MBq5/wHb8AI7RsvCO0oFUjbSksm3cBuJBNx9+UWFNqETerrcN+EO
	ykdFJNlzIyYJ0tgLB4nz3ICnHM8D9lLiqu2Eq0pfmQPv/y28lN/RCPBE7cKDnvJsmSwitRgZepLL0
	sqryZSD1+ZKV9gTIFZdcVx0UhFJ2VrPg4lN4IaSaATGQONd6XV0z0HNWdTXVjNGbhhPeYw7IUNfHR
	IX0JJdPVJk3JGTV11TX2AARzlWT6N8PyxHH55uzJcHRBDFvhXclcThVGBAa8UWXsMZTuKyPaxqvbx
	VZiHBq43wHolx0iUXeYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVSfc-00000003FwL-0pK9;
	Mon, 23 Nov 2026 11:57:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVSfZ-00000003FvY-1kP6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 11:57:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5C895339;
	Mon, 23 Nov 2026 03:57:09 -0800 (PST)
Received: from [10.0.129.12] (Suzukis-MBP.cambridge.arm.com [10.0.129.12])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 057153F882;
	Mon, 23 Nov 2026 03:57:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795435032; bh=LNo56Qz1QeBon68sU6vuY9seA4keelwdA6dbHp5GkPs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XbUEr6bzpC00cZQFioZj4V/+sj62CtDhUmSGOZAx40kXfv/FvlNYVdxiaQIfzjumt
	 HSbwGdrplSL8jlfXo3ZZf8yqNHOdFdx9hahLI/eSV01zJkWaVpphfE8c/wTiUknwhX
	 hOPnVdiOpZsuzxorOzWMVISIEUa4ktpHYHRhnrw8=
Message-ID: <b224f2af-5881-4ea9-9e6f-38b8fef8ad9e@arm.com>
Date: Mon, 23 Nov 2026 11:57:07 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/11] KVM: arm64: CCA: Destroy RTTs
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
 <20261123104233.95710-7-steven.price@arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20261123104233.95710-7-steven.price@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_035713_544693_E889749B 
X-CRM114-Status: GOOD (  42.41  )
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
> The RMM owns the stage 2 page tables for a realm, and KVM must request
> that the RMM creates/destroys entries as necessary. The physical pages
> to store the page tables are delegated to the realm as required, and can
> be undelegated when no longer used.
> 
> Creating new RTTs is the easy part, destroying them is a little more
> tricky. The result of realm_rtt_destroy() can be used to effectively
> walk the tree and destroy the entries (undelegating pages that were
> given to the realm).
> 


> Tear down a created Realm whether it is still new or has been activated.
> Unmap the Realm IPA space once during stage-2 teardown. Defer
> destruction of non-root RTTs until final Realm destruction, after
> REALM_TERMINATE and before destroying the RD; root RTTs remain until the
> RD has gone away.

While I understand what this is trying to convey, it may be unclear
to someone who is not familiar with the "Realm Liveness".
How about something like :

Realm can be destroyed ONLY if all stage2 Root RTTs are not live
(along with no RECs or other resources assigned to it).
i.e., there are no live mappings or tables mapped from the Root
tables. So, we unmap the entire stage2 and move the Realm to
ZOMBIE state then destroy all the non-root level RTTs. The Root
level RTTs can only be reclaimed after the RD is destroyed.

The comment in the code is actually pretty clear.

> 
> Use the same minimum of two stage-2 levels as VTCR when deriving
> the Realm's starting RTT level. Without this, narrow IPAs on
> 64K-page hosts can give the RMM a different starting level from
> KVM's own page tables.

I believe this paragraph can go as we now have start_level cached.

> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> 
> ---
> Changes since v3:
> - Match VTCR's minimum of two stage-2 levels for Realm RTTs.
> - Use explicit config_lock cleanup in Realm destruction.
> 
> Changes since v2:
> - Use the actual stage-2 start level and correct the RTT skip
>    granularity. Free SRO state on final teardown errors.
> 
> Changes since v1:
> - Tear down created Realms in both NEW and ACTIVE states. Fix the
>    RTT start level, page accounting on failed undelegation, and
>    handling of RTT granules returned by RMI.
> ---
>   arch/arm64/include/asm/kvm_rmi.h |   3 +
>   arch/arm64/kvm/mmu.c             |  17 ++-
>   arch/arm64/kvm/rmi.c             | 178 +++++++++++++++++++++++++++++++
>   3 files changed, 197 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/include/asm/kvm_rmi.h b/arch/arm64/include/asm/kvm_rmi.h
> index 4ac1af622872..01ecaabd839b 100644
> --- a/arch/arm64/include/asm/kvm_rmi.h
> +++ b/arch/arm64/include/asm/kvm_rmi.h
> @@ -58,6 +58,7 @@ enum realm_state {
>    * @state: The lifetime state machine for the realm
>    * @ia_bits: Number of valid Input Address bits in the IPA
>    * @start_level: Starting level of the Realm Translation Table
> + * @stage2_unmapped: The Realm stage-2 mappings have been removed
>    */
>   struct realm {
>   	phys_addr_t rd_phys;
> @@ -72,11 +73,13 @@ struct realm {
>   	enum realm_state state;
>   	unsigned int ia_bits;
>   	int start_level;
> +	bool stage2_unmapped;
>   };
>   
>   u32 kvm_rmm_ipa_limit(void);
>   
>   int kvm_init_realm(struct kvm *kvm);
>   void kvm_destroy_realm(struct kvm *kvm);
> +void kvm_realm_unmap_stage2_all(struct kvm *kvm);
>   
>   #endif /* __ASM_KVM_RMI_H */
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index 84b02699f103..4a975715375c 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -1149,9 +1149,24 @@ int kvm_init_stage2_mmu(struct kvm *kvm, struct kvm_s2_mmu *mmu, unsigned long t
>   	return err;
>   }
>   
> +static void kvm_realm_uninit_stage2(struct kvm_s2_mmu *mmu)
> +{
> +	struct kvm *kvm = kvm_s2_mmu_to_kvm(mmu);
> +
> +	guard(mutex)(&kvm->arch.config_lock);
> +	if (kvm_realm_state(kvm) == REALM_STATE_NEW ||
> +	    kvm_realm_state(kvm) == REALM_STATE_ACTIVE) {
> +		kvm_set_realm_state(kvm, REALM_STATE_DYING);
> +		kvm_realm_unmap_stage2_all(kvm);
> +	}
> +}
> +
>   void kvm_uninit_stage2_mmu(struct kvm *kvm)
>   {
> -	kvm_free_stage2_pgd(&kvm->arch.mmu);
> +	if (kvm_realm_is_created(kvm))
> +		kvm_realm_uninit_stage2(&kvm->arch.mmu);
> +	else
> +		kvm_free_stage2_pgd(&kvm->arch.mmu);
>   	kvm_mmu_free_memory_cache(&kvm->arch.mmu.split_page_cache);
>   }
>   
> diff --git a/arch/arm64/kvm/rmi.c b/arch/arm64/kvm/rmi.c
> index fafca2439c46..435174ac3d87 100644
> --- a/arch/arm64/kvm/rmi.c
> +++ b/arch/arm64/kvm/rmi.c
> @@ -16,22 +16,196 @@ u32 kvm_rmm_ipa_limit(void)
>   	return u64_get_bits(rmi_feat_reg(0), RMI_FEATURE_REGISTER_0_S2SZ);
>   }
>   
> +static void free_rtt(phys_addr_t phys)
> +{
> +	kvm_account_pgtable_pages(phys_to_virt(phys), -1);
> +	if (rmi_free_delegated_page(phys))
> +		kvm_account_pgtable_pages(phys_to_virt(phys), 1);
> +}
> +
> +/*
> + * realm_rtt_destroy - Destroy an RTT at @level for @addr.
> + *
> + * Returns - Result of the RMI_RTT_DESTROY call, and:
> + * @rtt_granule:	RTT granule, if the RTT was destroyed.
> + * @next_addr:		IPA corresponding to the next possible valid entry we
> + *			can target
> + */
> +static long realm_rtt_destroy(struct realm *realm, unsigned long addr,
> +			      int level, phys_addr_t *rtt_granule,
> +			      unsigned long *next_addr)
> +{
> +	unsigned long out_rtt;
> +	long ret;
> +
> +	ret = rmi_rtt_destroy(realm->rd_phys, addr, level,
> +			      &out_rtt, next_addr);
> +
> +	if (ret == RMI_SUCCESS)
> +		*rtt_granule = out_rtt;
> +
> +	return ret;
> +}
> +
> +static int realm_destroy_rtt_level(struct realm *realm, int level,
> +				   unsigned long start, unsigned long end)
> +{
> +	ssize_t map_size;
> +	unsigned long addr, next_addr;
> +
> +	if (WARN_ON(level > KVM_PGTABLE_LAST_LEVEL))
> +		return -EINVAL;
> +
> +	map_size = kvm_granule_size(level - 1);
> +	if (WARN_ON(!IS_ALIGNED(start, map_size)))
> +		return -EINVAL;
> +
> +	for (addr = start; addr < end; addr = next_addr) {
> +		phys_addr_t rtt_granule;
> +		long ret;
> +		unsigned long align_addr = ALIGN(addr, map_size);
> +
> +		next_addr = ALIGN(addr + 1, map_size);
> +
> +		if (next_addr > end || align_addr != addr) {
> +			/*
> +			 * The target range is smaller than what this level
> +			 * covers, recurse deeper.
> +			 */
> +			ret = realm_destroy_rtt_level(realm,
> +						      level + 1,
> +						      addr,
> +						      min(next_addr, end));
> +			if (ret)
> +				return ret;
> +			continue;
> +		}
> +
> +		ret = realm_rtt_destroy(realm, addr, level,
> +					&rtt_granule, &next_addr);
> +		if (ret < 0)
> +			return ret;
> +
> +		switch (RMI_RESULT_STATUS(ret)) {
> +		case RMI_SUCCESS:
> +			free_rtt(rtt_granule);
> +			break;
> +		case RMI_ERROR_RTT:
> +			if (next_addr > addr) {
> +				/* Missing RTT, skip */
> +				break;
> +			}
> +			/*
> +			 * We destroy the RTT range for the full IPA
> +			 * space, after everything is unmapped. Also we
> +			 * descend down only if we cannot destroy a
> +			 * top level RTT. Thus RMM must be able to walk
> +			 * to the requested level. e.g., a block mapping
> +			 * exists at L1 or L2.
> +			 */
> +			if (WARN_ON(RMI_RESULT_DATA_LEVEL(ret) != level))
> +				return -EBUSY;
> +			if (WARN_ON(level == KVM_PGTABLE_LAST_LEVEL))
> +				return -EBUSY;
> +
> +			/*
> +			 * The table has active entries in it, recurse deeper
> +			 * and destroy the RTTs.
> +			 */
> +			next_addr = ALIGN(addr + 1, map_size);
> +			ret = realm_destroy_rtt_level(realm,
> +						      level + 1,
> +						      addr,
> +						      next_addr);
> +			if (ret)
> +				return ret;
> +			/*
> +			 * Now that the child RTTs are destroyed,
> +			 * retry at this level.
> +			 */
> +			next_addr = addr;
> +			break;
> +		default:
> +			WARN_ON(1);
> +			return -ENXIO;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static int realm_destroy_rtt_range(struct realm *realm,
> +				   unsigned long start, unsigned long end)
> +{
> +	/*
> +	 * Root level RTTs can only be destroyed after the RD is destroyed. So
> +	 * destroy everything below the root level
> +	 */
> +	return realm_destroy_rtt_level(realm, realm->start_level + 1,
> +				       start, end);
> +}
> +

minor nit: May be we could fold the above into realm_destroy_rtts()

> +static int realm_destroy_rtts(struct kvm *kvm)
> +{
> +	struct realm *realm = &kvm->arch.realm;
> +	unsigned int ia_bits = realm->ia_bits;
> +
> +	lockdep_assert_held(&kvm->arch.config_lock);
> +
> +	return realm_destroy_rtt_range(realm, 0, (1UL << ia_bits));
> +}
> +
> +void kvm_realm_unmap_stage2_all(struct kvm *kvm)
> +{
> +	struct realm *realm = &kvm->arch.realm;
> +
> +	lockdep_assert_held(&kvm->arch.config_lock);
> +
> +	if (realm->stage2_unmapped)
> +		return;
> +
> +	write_lock(&kvm->mmu_lock);
> +	kvm_stage2_unmap_range(&kvm->arch.mmu, 0,
> +			       BIT(realm->ia_bits - 1), true);
> +	write_unlock(&kvm->mmu_lock);
> +
> +	realm->stage2_unmapped = true;
> +}
> +
>   void kvm_destroy_realm(struct kvm *kvm)
>   {
>   	struct realm *realm = &kvm->arch.realm;
>   	size_t pgd_size = kvm_pgtable_stage2_pgd_size(kvm->arch.mmu.vtcr);
>   
> +	/*
> +	 * Serialize final Realm destruction with Realm creation and stage-2 unmapping,
> +	 * which also access Realm state under config_lock.
> +	 */
> +	mutex_lock(&kvm->arch.config_lock);

minor nit: guard(mutex)() ?


> +
>   	if (!kvm_realm_is_created(kvm))
>   		goto out_free_sro;
>   
>   	kvm_set_realm_state(kvm, REALM_STATE_DYING);
>   
> +	/*
> +	 * REALM_DESTROY requires the realm to be non-live: all RECs must have
> +	 * been destroyed and the root RTTs must be empty. Unmap the IPA space
> +	 * and destroy any non-root RTTs before tearing down the RD. The root
> +	 * RTT pages are still owned by the RMM at this point, so keep the KVM
> +	 * pgtable alive until after REALM_DESTROY and undelegation.
> +	 */
> +	kvm_realm_unmap_stage2_all(kvm);
> +
>   	if (realm->rd_phys) {
>   		phys_addr_t rd_phys = realm->rd_phys;
>   
>   		if (WARN_ON(rmi_realm_terminate(rd_phys, realm->sro)))
>   			goto out_free_sro;
>   
> +		if (WARN_ON(realm_destroy_rtts(kvm)))
> +			goto out_free_sro;
> +
>   		if (WARN_ON(rmi_realm_destroy(rd_phys, realm->sro)))
>   			goto out_free_sro;
>   		rmi_free_delegated_page(rd_phys);
> @@ -44,9 +218,13 @@ void kvm_destroy_realm(struct kvm *kvm)
>   
>   	kvm_set_realm_state(kvm, REALM_STATE_DEAD);
>   
> +	/* Now that the realm is destroyed, free the entry-level RTTs. */
> +	kvm_free_stage2_pgd(&kvm->arch.mmu);
> +
>   out_free_sro:
>   	kfree(realm->sro);
>   	realm->sro = NULL;
> +	mutex_unlock(&kvm->arch.config_lock);
>   }


Suzuki


