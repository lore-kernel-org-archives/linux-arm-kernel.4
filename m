Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 376C9606A335
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 07:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wbokx0lO;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Kq6fvGzS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=1y5feySbZxYFKfGlVP6b+/eacqeZv86DnLdBtPAZn5k=; b=wbokx0lOF3FERZ9bAWHN5SRL/R
	ja/jG9H0gK0FhiaiFOIvbf3XxX9QM0tPsPFPszJ6VtTGnB/8MkRMQ1fgRSdV/TkPHUiLmGgw9fa40
	9ZJ1vevGSa/s84eVVUKcKki252XkP5zoTtlbsSzN/Td2tnnpp8z9+8ehQiWp65I37rXh0Pi5ExHTz
	Nl92lRkrWu2zCZya0LOUBS/guM549hMGqwb3y+nygqQQtGzaRXlpAZ3iexIGk/GkYz1X4iS1iLAqy
	74LuKgv36iIz8/+lsx+HbtrJVUO2gdu38slNs6vuP9wzDPzLUOQAZWMtJJy0bi73KuZ2hahfmcT85
	Q101WwrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSV9S-0000000HCZW-3sQ4;
	Sun, 15 Nov 2026 07:59:50 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSV9Q-0000000HCZA-2Ztn
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 07:59:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3D310143D;
	Sat, 14 Nov 2026 23:59:43 -0800 (PST)
Received: from thinkpad-e142931.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D161A3F85F;
	Sat, 14 Nov 2026 23:59:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794729586; bh=RtREhx24vm0xSN0YvyO2whbcheqdh4KYyhiGt77tUTE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Kq6fvGzS8bBURKe01268mPdpM12ho4S6qynQTk8jmqiVaRhJfXajAOJIT3pqRfkUs
	 M43cpozGBFMd398we6ec41e9aChcKPLImqq2CGG8rQJaaYx0uKUbb92OSQWOalzEdk
	 YIY1ep1quTfxzuB6Kf87xb5/4W8/IuPmHR2p3z8E=
Date: Sun, 15 Nov 2026 07:59:27 +0000
From: Wei-Lin Chang <weilin.chang@arm.com>
To: Dan Carpenter <dan@cryspen.com>, Eric Auger <eric.auger@redhat.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Sascha Bischoff <Sascha.Bischoff@arm.com>, Timothy Hayes <timothy.hayes@arm.com>, 
	Jonathan Cameron <jic23@kernel.org>, Christoffer Dall <cdall@linaro.org>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Karthik Bhargavan <karthik@pereq.eu>, =?utf-8?Q?Cl=C3=A9ment?= Blaudeau <clement@cryspen.com>
Subject: Re: [PATCH v2] KVM: arm64: vgic: Don't truncate offsets in
 vgic_find_mmio_region()
Message-ID: <dreynmxfzebsybkwjor74uddje6edmth5joj3rijtezrdh5c6n@i5xwud5ix7t5>
References: <avRLLMOiudnKoSlk@stanley.mountain>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <avRLLMOiudnKoSlk@stanley.mountain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_235948_933299_81CF1175 
X-CRM114-Status: GOOD (  30.55  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 11, 2026 at 02:02:04PM +0300, Dan Carpenter wrote:
> In vgic_its_has_attr_regs() and vgic_its_attr_regs_access() we take a
> u64 "offset" from the user and pass it to vgic_find_mmio_region() to
> find the correct region.  The problem is that vgic_find_mmio_region()
> truncates the "offset" to 32 bits so we might find a region even
> though really we shouldn't.
> 
> Later the untruncated offset is used to calculate "addr".
> 
> 	addr = its->vgic_its_base + offset;
> 
> For example, an offset of 0x100000084 finds the 64-bit GITS_CBASER
> register at 0x80, and the write reaches update_64bit_reg() with an
> offset of 4 into the register and a length of 8.  It exhibits as a
> UBSAN warning.
> 
> [  183.796046] UBSAN: shift-out-of-bounds in arch/arm64/kvm/vgic/vgic-mmio-v3.c:35:10
> [  183.796198] shift exponent 18446744073709551584 is too large for 64-bit type 'long long unsigned int'
> 
> The GICv5 IRS code has the same problem in vgic_v5_has_attr_regs() and
> vgic_v5_irs_attr_regs_access().
> 
> Make vgic_find_mmio_region() and match_region() take the offset as a
> u64, so an offset of 2^32 or more no longer matches any region.  The
> other callers only pass offsets which fit in 32 bits so they are not
> affected.

Just wanted to point out that GICv5 IRS could have avoided this if the
code used reg_attr.addr produced by vgic_v5_parse_attr():

reg_attr->addr = attr->attr & KVM_DEV_ARM_VGIC_OFFSET_MASK;

This is why GICv3 isn't affected, it uses the masked value.

However this patch solves the problem in a more fundamental way, making
using reg_attr.addr produced by vgic_v5_parse_attr() more of a cleanup.

For the patch:

Reviewed-by: Wei-Lin Chang <weilin.chang@arm.com>

Thanks,
Wei-Lin Chang

> 
> Fortunately the effect of this bug is very minor.  The worst case is that
> the VMM accesses an emulated register and sets something nonsensical
> and users are already allowed to do that without the bug.
> 
> Fixes: 8331c23c28e8 ("KVM: arm64: vgic-its: Implement vgic_its_has_attr_regs and attr_regs_access")
> Fixes: 71091136d145 ("KVM: arm64: gic-v5: Handle userspace accesses to IRS MMIO region")
> Signed-off-by: Dan Carpenter <dan@cryspen.com>
> ---
> v2: Change vgic_find_mmio_region() to take a u64 instead of rejecting
>     large offsets in the ITS callers, as Marc suggested.  This also
>     fixes the GICv5 IRS code which my previous patch didn't.  Drop the
>     Cc: stable.
> 
>  arch/arm64/kvm/vgic/vgic-mmio.c | 4 ++--
>  arch/arm64/kvm/vgic/vgic-mmio.h | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/kvm/vgic/vgic-mmio.c b/arch/arm64/kvm/vgic/vgic-mmio.c
> index fddb9da0403d..59bdec495cd7 100644
> --- a/arch/arm64/kvm/vgic/vgic-mmio.c
> +++ b/arch/arm64/kvm/vgic/vgic-mmio.c
> @@ -820,7 +820,7 @@ void vgic_write_irq_line_level_info(struct kvm_vcpu *vcpu, u32 intid,
>  
>  static int match_region(const void *key, const void *elt)
>  {
> -	const unsigned int offset = (unsigned long)key;
> +	const u64 offset = (unsigned long)key;
>  	const struct vgic_register_region *region = elt;
>  
>  	if (offset < region->reg_offset)
> @@ -834,7 +834,7 @@ static int match_region(const void *key, const void *elt)
>  
>  const struct vgic_register_region *
>  vgic_find_mmio_region(const struct vgic_register_region *regions,
> -		      int nr_regions, unsigned int offset)
> +		      int nr_regions, u64 offset)
>  {
>  	return bsearch((void *)(uintptr_t)offset, regions, nr_regions,
>  		       sizeof(regions[0]), match_region);
> diff --git a/arch/arm64/kvm/vgic/vgic-mmio.h b/arch/arm64/kvm/vgic/vgic-mmio.h
> index 38ed730d68ac..6c3c4de6883e 100644
> --- a/arch/arm64/kvm/vgic/vgic-mmio.h
> +++ b/arch/arm64/kvm/vgic/vgic-mmio.h
> @@ -228,6 +228,6 @@ u64 vgic_sanitise_field(u64 reg, u64 field_mask, int field_shift,
>  /* Find the proper register handler entry given a certain address offset */
>  const struct vgic_register_region *
>  vgic_find_mmio_region(const struct vgic_register_region *regions,
> -		      int nr_regions, unsigned int offset);
> +		      int nr_regions, u64 offset);
>  
>  #endif
> -- 
> 2.53.0
> 

