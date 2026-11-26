Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84203606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 12:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qXuzclv0;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=mH6OniO7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=By9wjTOOe34Y8ZPHcZz8S+BrpYassCrx27UhnbbGrAo=; b=qXuzclv0Ol+OkZ
	zO6o5S6iagRDslCTn8QedSsKp0z7sZT9mZN5LIaA01c6vVzFyPKiAPH9LGdTChHThVY/CefzkgrpL
	tHWH9U6Y4Dxns/uyZX0j+s4YO94E/DOkAsPCiUarYaymt79fM/4jD3twjRLowEWZVV267ubZawYWW
	nvNPfCY553ITzb7/jU4bO2qUthef0GFw0PRc5/9gPEAnseXfc4aHPh4XkWq8Uk/AduAOUURPVzGXC
	Nt1LPB+INdCWn6X6B2VPLTN19GjDoImjwiPsO6ribJxHPF59saMXqwvgJJmnNI/SMql6IG+2CEDJn
	wDis5q2bBd1qJ6Q2mzhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWYaj-0000000D9UE-28fs;
	Thu, 26 Nov 2026 12:28:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWYaf-0000000D9TE-4Bn6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 12:28:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6334C1CE2;
	Thu, 26 Nov 2026 04:28:38 -0800 (PST)
Received: from [10.0.135.195] (M0PRX50XMG.cambridge.arm.com [10.0.135.195])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 899483F86C;
	Thu, 26 Nov 2026 04:28:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795696121; bh=CtDIZY5JfDH8M7wFqXLRqQmiO0o0aXHpOhBaAPWYw8w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mH6OniO7ipWHu4LjDcvnH1nWgIka1lJfMVDZffJGFhJK0o0t4XeRJVYF/UjOOHR1U
	 1pllDDVm19c61KwnqFpy4p1Xb93d6HpiIBN7DvxdrFwfjva93Dqc09F1EFnF+oDD26
	 jy5I7p7sE4HF47XGhPTOW2JE9lP0fQro4Wb7aDCQ=
Message-ID: <06effdad-0a76-4d73-9542-cb628a40d887@arm.com>
Date: Thu, 26 Nov 2026 12:28:38 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] KVM: arm64: gic-v5: Reject an ID_BITS too large for a
 linear IST
To: Fuad Tabba <fuad.tabba@linux.dev>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oupton@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, Steffen Eiden <seiden@linux.ibm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Fuad Tabba <tabba@google.com>
References: <20261126100023.1286902-1-fuad.tabba@linux.dev>
Content-Language: en-GB
From: Sascha Bischoff <sascha.bischoff@arm.com>
In-Reply-To: <20261126100023.1286902-1-fuad.tabba@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_042842_786778_062F583A 
X-CRM114-Status: GOOD (  28.84  )
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

Hi Fuad,

On 26/11/2026 10:00, Fuad Tabba wrote:
> Without two-level IST support in the host IRS, KVM allocates a guest's
> LPI IST with a single kzalloc(). The guest picks the IST's size, up to
> the virtual IRS_IDR2.ID_BITS, which userspace can set as high as the
> host's. With 24 ID bits the IST is at least 64MB, more than
> KMALLOC_MAX_SIZE with 4K or 16K pages, and kzalloc() warns when the
> guest enables the IST.
> 
> Reject an ID_BITS for which a linear IST would be larger than
> KMALLOC_MAX_SIZE. This applies even for a Linux guest, which
> configures a much smaller IST. Userspace writes to IRS_IDR2 are new
> in this cycle, so no release has them.

Thanks for catching and fixing this issue. I agree that we shouldn't 
allow this to happen, and what you have here is a defensive check. 
However, I was surprised that this was reachable in the first place, and 
now see the mistake I'd made.

In general, we limit GICv5-based VMs to 16-bits of ID space in both the 
CPUIF (see vgic_v5_reset()) and in the emulated IRS (see 
kvm_vgic_v5_irs_init()). The userspace write path fails to enforce that 
limit, however, and only checks the hardware capabilities. I see no 
reason to allow a vIRS that supports more ID bits than the CPUIF.

Maybe something along the lines of the following in 
vgic_v5_mmio_uaccess_write_irs()?

/* We limit the CPU interface to 16 ID bits, so match that here. */
if (FIELD_GET(GICV5_IRS_IDR2_ID_BITS, val) > 16)
         return -EINVAL;

Are you happy to add this (or similar) to your patch, or would you 
prefer me to fix that up separately?

Long-term I'd like to remove the hard coded 16 in the vIRS code, but 
that's a clean up that's not appropriate for this patch.

Thanks,
Sascha

> 
> Fixes: 71091136d1452 ("KVM: arm64: gic-v5: Handle userspace accesses to IRS MMIO region")
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
> ---
> 
> Notes:
>      Tested on FVP, on VHE and nVHE hosts, with and without two-level IST
>      support in the IRS. The vgic_v5 selftest passes. A reproducer that
>      sets ID_BITS to 24 and restores an IST that wide hits the kzalloc()
>      warning without this patch. With it, the IRS_IDR2 write is rejected.
>      
>      Based on Linux 7.4-rc3 (aebb727447640).
> 
>   arch/arm64/kvm/vgic/vgic-irs-v5.c    | 4 ++++
>   arch/arm64/kvm/vgic/vgic-v5-tables.c | 8 ++++++++
>   arch/arm64/kvm/vgic/vgic-v5-tables.h | 1 +
>   3 files changed, 13 insertions(+)
> 
> diff --git a/arch/arm64/kvm/vgic/vgic-irs-v5.c b/arch/arm64/kvm/vgic/vgic-irs-v5.c
> index f73349c02656c..97362caef4433 100644
> --- a/arch/arm64/kvm/vgic/vgic-irs-v5.c
> +++ b/arch/arm64/kvm/vgic/vgic-irs-v5.c
> @@ -648,6 +648,10 @@ static int vgic_v5_mmio_uaccess_write_irs(struct kvm_vcpu *vcpu, gpa_t addr,
>   		    vgic_v5_irs_ist_id_bits(&irs_caps))
>   			return -EINVAL;
>   
> +		/* A linear host IST is a single allocation, limited to KMALLOC_MAX_SIZE */
> +		if (!vgic_v5_lpi_ist_id_bits_valid(FIELD_GET(GICV5_IRS_IDR2_ID_BITS, val)))
> +			return -EINVAL;
> +
>   		/* Min LPI ID bits must be greater than or equal to the HW */
>   		if (FIELD_GET(GICV5_IRS_IDR2_MIN_LPI_ID_BITS, val) <
>   		    vgic_v5_irs_min_lpi_id_bits(&irs_caps))
> diff --git a/arch/arm64/kvm/vgic/vgic-v5-tables.c b/arch/arm64/kvm/vgic/vgic-v5-tables.c
> index 8f72704209b0e..ae5f380fa783c 100644
> --- a/arch/arm64/kvm/vgic/vgic-v5-tables.c
> +++ b/arch/arm64/kvm/vgic/vgic-v5-tables.c
> @@ -1207,6 +1207,14 @@ static unsigned int vgic_v5_ist_istsz(unsigned int id_bits)
>   	return GICV5_IRS_IST_CFGR_ISTSZ_8;
>   }
>   
> +bool vgic_v5_lpi_ist_id_bits_valid(unsigned int id_bits)
> +{
> +	if (vgic_v5_irs_ist_levels(&irs_caps))
> +		return true;
> +
> +	return GICV5_LINEAR_IST_SIZE(id_bits, vgic_v5_ist_istsz(id_bits)) <= KMALLOC_MAX_SIZE;
> +}
> +
>   /*
>    * Allocate an IST for SPIs.
>    *
> diff --git a/arch/arm64/kvm/vgic/vgic-v5-tables.h b/arch/arm64/kvm/vgic/vgic-v5-tables.h
> index 89096926563f7..ba049978157b1 100644
> --- a/arch/arm64/kvm/vgic/vgic-v5-tables.h
> +++ b/arch/arm64/kvm/vgic/vgic-v5-tables.h
> @@ -123,6 +123,7 @@ int vgic_v5_vmte_free_vpe(struct kvm_vcpu *vcpu);
>   
>   int vgic_v5_spi_ist_alloc(struct kvm *kvm, unsigned int id_bits);
>   int vgic_v5_lpi_ist_exists(struct kvm *kvm);
> +bool vgic_v5_lpi_ist_id_bits_valid(unsigned int id_bits);
>   int vgic_v5_lpi_ist_alloc(struct kvm *kvm, unsigned int id_bits);
>   int vgic_v5_lpi_ist_free(struct kvm *kvm);
>   
> 
> base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3


