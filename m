Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE8E0606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 09:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vwLlbTcq;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=dcAnQhGt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=QVie/z0J40GiWaXqHRXPvG+NrtU10m0jzVDp6bMnZM8=; b=vwLlbTcqjzaxik
	tAWI1pCoykk+60NnTeTLudFvdmQszv4QJQtOrII1/f2WXB0DIB4MhAehNS++Whgrp8D7sikBsBgDv
	jZujUYRIYvalbauFqU8RGFC//fx3vLyaDd4aAZb6ANK6PXP01PG8KkdtPYvnfxdIN2rdiR8ugmgqg
	AeYkVCbD9bM34c79rPgFHW/jRsZOpTMdCrMz7wc4hvB3ETWmCfiqCvH3KdcPTgFERiWNGHZLB3CVe
	QSDJzFrqm/La1RYJ4daf3ch8liAZUu9WLFPEEaeXNdxhsSM1rH+Xmz9uZn4CDPcXewOsALh64RQxc
	LpTcvEJRLBsweNiwmDjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW8zf-00000009Dlo-29e0;
	Wed, 25 Nov 2026 09:08:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW8zb-00000009Dl7-2oa2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 09:08:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9198E339;
	Wed, 25 Nov 2026 01:08:38 -0800 (PST)
Received: from [10.2.197.99] (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 475643F86F;
	Wed, 25 Nov 2026 01:08:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795597721; bh=pmOn0GAQ/bIzl3yEFkQbNwWqfmhqh+tr+9j74hBF0n8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dcAnQhGtPKyESIvNebDMGfL2TrSqBtOSKEzh2om+0KBX3wkCehatasRziYTiTReSc
	 p/UUMgQHC6adqOhdOTayYPC49JWou0HCkpkyxeUkQrtwhFWHqMDagQJqtyaF2HHbmz
	 KlGBHPKyMdilzcBf8Nwd5t0/GuII1ev/VeEvtsPg=
Message-ID: <0c7c59df-69cd-40fe-830f-60c0f3cedafa@arm.com>
Date: Wed, 25 Nov 2026 09:08:36 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/8] KVM: arm64: Reset SP_EL1, ELR_EL1 and SPSR_EL1
 when resetting a vcpu
To: Dan Carpenter <dan@pereq.eu>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oupton@kernel.org>, Fuad Tabba <fuad.tabba@linux.dev>,
 Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>,
 Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Christoffer Dall <c.dall@virtualopensystems.com>,
 Rusty Russell <rusty@rustcorp.com.au>, Marcelo Tosatti
 <mtosatti@redhat.com>, Sebastian Ott <sebott@redhat.com>,
 Eric Auger <eric.auger@redhat.com>, James Morse <james.morse@arm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson
 <seanjc@google.com>, Shuah Khan <shuah@kernel.org>
Cc: Karthik Bhargavan <karthik@pereq.eu>,
 =?UTF-8?Q?Cl=C3=A9ment_Blaudeau?= <clement@cryspen.com>,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
 linux-kselftest@vger.kernel.org, stable@vger.kernel.org
References: <20261125-double_exception-v2-0-224689d8a764@pereq.eu>
 <20261125-double_exception-v2-2-224689d8a764@pereq.eu>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20261125-double_exception-v2-2-224689d8a764@pereq.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_010843_809409_1C63DCE7 
X-CRM114-Status: GOOD (  17.40  )
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

On 25/11/2026 06:56, Dan Carpenter wrote:
> Resetting a vcpu keeps the old values of SP_EL1, ELR_EL1 and SPSR_EL1.
> Commit e47c2055c68e ("KVM: arm64: Make struct kvm_regs userspace-only")
> changed the reset to only clear the general purpose registers, SP, PC
> and PSTATE, and later commits moved these three registers to the system
> register array without a reset value.  Commit 85d703746154 ("KVM: arm64:
> Fully zero the vcpu state on reset") fixed the FP registers and the
> 32-bit SPSRs the same commit missed, but not these three.
> 
> The impact is that the guest that boots next can read the previous
> kernel's stack pointer and exception return address.  KVM_GET_ONE_REG
> also returns the old values to userspace, and a rebooted VM doesn't
> start in the same state as a new one.
> 
> Zero them in kvm_reset_vcpu().
> 
> Fixes: e47c2055c68e ("KVM: arm64: Make struct kvm_regs userspace-only")
> Cc: stable@vger.kernel.org
> Signed-off-by: Dan Carpenter <dan@pereq.eu>
> ---
>   arch/arm64/kvm/reset.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/arch/arm64/kvm/reset.c b/arch/arm64/kvm/reset.c
> index 26081d273408..9c1b42890c96 100644
> --- a/arch/arm64/kvm/reset.c
> +++ b/arch/arm64/kvm/reset.c
> @@ -199,6 +199,9 @@ void kvm_reset_vcpu(struct kvm_vcpu *vcpu)
>   
>   	/* Reset core registers */
>   	kvm_reset_vcpu_core(vcpu);
> +	__vcpu_assign_sys_reg(vcpu, SP_EL1, 0);
> +	__vcpu_assign_sys_reg(vcpu, ELR_EL1, 0);
> +	__vcpu_assign_sys_reg(vcpu, SPSR_EL1, 0);

nit: Please could we move these into kvm_reset_vcpu_core() where we
reset other registers ?

With that:

Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>


>   	vcpu->mmio_needed = false;
>   
>   	/* Reset system registers */
> 


