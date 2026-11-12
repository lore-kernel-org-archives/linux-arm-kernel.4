Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B02D4606A894
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 16:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=S0R+V+N0;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=ZJO47dX5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=fvV6XL4h3GEAfdxymvHQ6KJBqZ97Mq7jkqEHVuzv9Fc=; b=S0R+V+N0YIWnra
	zQlcvtorMXLaou9zNAnZxNQoNd6f0iS+oRtYYp4o9JpU+IZ5BX3LCDELtG6B/glhT84VRI/yd7uU4
	2af0VWpqaywmVpVAuCsvSrxMuOSEsY0uSQzvceI1ld/sGsBfzdpjvgUYqvlEOblYhs1jS4wSFLtbB
	qghoEB58dQ1ElzXIDu+cXPlg6oss/SxwAcgFsBVGBtpVy0F2ao1WrgCA6qn8LWvlKOLxCVEuYXcAM
	drkC3OvmD8egoeCbl9cGLZ9bu9FqA5eDzC+8I1UghnJnHXmna5FGsD7ZyNLOsYPjAPrBRmcmwnQzl
	KFOrVmuh9wCRWWkzpIYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRXqO-0000000Adtk-3YoS;
	Thu, 12 Nov 2026 16:40:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRXq9-0000000Adfp-0bs6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 16:40:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7D39D1516;
	Thu, 12 Nov 2026 08:39:53 -0800 (PST)
Received: from [10.57.67.215] (unknown [10.57.67.215])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EA7D83F673;
	Thu, 12 Nov 2026 08:39:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794501596; bh=7shWzIDpVLy84svurvW2x95+hE4KVOpyxi/wiZh858k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZJO47dX5vke/+FZ6u/CheIKMHFKP4tWiEZXBRpIobhU98K/B48YCM7sEfpTAWO7qN
	 Z9y5HSPkYoRjJnU2ctAWOHmHoO7bGXbzrAw8ireYK5D6gszc5d/JekKmcAqjJiXmA1
	 aLK1nxKdgNXK7sAsixyiB85xoG99pq3QTDHcft88=
Message-ID: <4ccf4e34-bf7e-48da-bd70-acfed1e5ce04@arm.com>
Date: Thu, 12 Nov 2026 16:39:49 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/12] KVM: arm64: CCA: Check RMI support and features
 at init
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
References: <20261111145758.217946-1-steven.price@arm.com>
 <20261111145758.217946-5-steven.price@arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20261111145758.217946-5-steven.price@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_083958_736829_5666A856 
X-CRM114-Status: GOOD (  26.55  )
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

Hi Steven

On 11/11/2026 14:57, Steven Price wrote:
> Wire RMI initialization into KVM startup and select ARM_RMM_RMI.
> Proceed only when RMM mode is selected and RMI is available. If
> KVM uses LPA2, require RMM LPA2 support. Also require SHA-256
> measurement support.
> 
> Define a disabled kvm_rmi_is_available static key for later Realm
> capability checks. The key is enabled after the remaining Realm
> support is in place.

Given all of this is only used for the UABI (KVM_CAP_ARM_RMI and
others), does it make sense to move this patch to the next batch
of the CCA support and keep this only to sort out the memory
management support ? Similarly for the Patch 1 ?

Cheers
Suzuki

> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> 
> ---
> Changes since v1:
> - Combine the separate v1 RMI availability and LPA2/SHA-256 feature
>    check patches into one initialization patch.
> ---
>   arch/arm64/include/asm/kvm_rmi.h |  2 ++
>   arch/arm64/include/asm/virt.h    |  1 +
>   arch/arm64/kvm/Kconfig           |  1 +
>   arch/arm64/kvm/Makefile          |  2 +-
>   arch/arm64/kvm/arm.c             |  5 ++++
>   arch/arm64/kvm/rmi.c             | 42 ++++++++++++++++++++++++++++++++
>   include/linux/arm-rmi-cmds.h     |  5 ++++
>   7 files changed, 57 insertions(+), 1 deletion(-)
>   create mode 100644 arch/arm64/kvm/rmi.c
> 
> diff --git a/arch/arm64/include/asm/kvm_rmi.h b/arch/arm64/include/asm/kvm_rmi.h
> index 67f16793b4d0..3194daaacf2b 100644
> --- a/arch/arm64/include/asm/kvm_rmi.h
> +++ b/arch/arm64/include/asm/kvm_rmi.h
> @@ -56,4 +56,6 @@ struct realm {
>   	enum realm_state state;
>   };
>   
> +void kvm_init_rmi(void);
> +
>   #endif /* __ASM_KVM_RMI_H */
> diff --git a/arch/arm64/include/asm/virt.h b/arch/arm64/include/asm/virt.h
> index b546703c3ab9..92cec42952f4 100644
> --- a/arch/arm64/include/asm/virt.h
> +++ b/arch/arm64/include/asm/virt.h
> @@ -87,6 +87,7 @@ void __hyp_reset_vectors(void);
>   bool is_kvm_arm_initialised(void);
>   
>   DECLARE_STATIC_KEY_FALSE(kvm_protected_mode_initialized);
> +DECLARE_STATIC_KEY_FALSE(kvm_rmi_is_available);
>   
>   static inline bool is_pkvm_initialized(void)
>   {
> diff --git a/arch/arm64/kvm/Kconfig b/arch/arm64/kvm/Kconfig
> index cecea0820e52..d067063a3686 100644
> --- a/arch/arm64/kvm/Kconfig
> +++ b/arch/arm64/kvm/Kconfig
> @@ -34,6 +34,7 @@ menuconfig KVM
>   	select GUEST_PERF_EVENTS if PERF_EVENTS
>   	select KVM_GUEST_MEMFD
>   	select KVM_GENERIC_PRE_FAULT_MEMORY
> +	select ARM_RMM_RMI
>   	help
>   	  Support hosting virtualized guest machines.
>   
> diff --git a/arch/arm64/kvm/Makefile b/arch/arm64/kvm/Makefile
> index 7aaeeb84e788..66a719ab5b6b 100644
> --- a/arch/arm64/kvm/Makefile
> +++ b/arch/arm64/kvm/Makefile
> @@ -16,7 +16,7 @@ CFLAGS_handle_exit.o += -Wno-override-init
>   kvm-y += arm.o mmu.o mmio.o psci.o hypercalls.o pvtime.o \
>   	 inject_fault.o va_layout.o handle_exit.o config.o \
>   	 guest.o debug.o reset.o sys_regs.o stacktrace.o \
> -	 vgic-sys-reg-v3.o fpsimd.o pkvm.o \
> +	 vgic-sys-reg-v3.o fpsimd.o pkvm.o rmi.o \
>   	 arch_timer.o trng.o vmid.o emulate-nested.o nested.o at.o \
>   	 vgic/vgic.o vgic/vgic-init.o \
>   	 vgic/vgic-irqfd.o vgic/vgic-v2.o \
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index e06cc390a3d6..318e8a4b19f8 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -42,6 +42,7 @@
>   #include <asm/kvm_nested.h>
>   #include <asm/kvm_pkvm.h>
>   #include <asm/kvm_ptrauth.h>
> +#include <asm/kvm_rmi.h>
>   #include <asm/sections.h>
>   #include <asm/stacktrace/nvhe.h>
>   
> @@ -112,6 +113,8 @@ long kvm_get_cap_for_kvm_ioctl(unsigned int ioctl, long *ext)
>   	return -EINVAL;
>   }
>   
> +DEFINE_STATIC_KEY_FALSE(kvm_rmi_is_available);
> +
>   DECLARE_KVM_HYP_PER_CPU(unsigned long, kvm_hyp_vector);
>   
>   DEFINE_PER_CPU(unsigned long, kvm_arm_hyp_stack_base);
> @@ -3272,6 +3275,8 @@ static __init int kvm_arm_init(void)
>   
>   	in_hyp_mode = is_kernel_in_hyp_mode();
>   
> +	kvm_init_rmi();
> +
>   	if (cpus_have_final_cap(ARM64_WORKAROUND_DEVICE_LOAD_ACQUIRE) ||
>   	    cpus_have_final_cap(ARM64_WORKAROUND_1508412))
>   		kvm_info("Guests without required CPU erratum workarounds can deadlock system!\n" \
> diff --git a/arch/arm64/kvm/rmi.c b/arch/arm64/kvm/rmi.c
> new file mode 100644
> index 000000000000..f4c45021c6f7
> --- /dev/null
> +++ b/arch/arm64/kvm/rmi.c
> @@ -0,0 +1,42 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2023-2026 ARM Ltd.
> + */
> +
> +#include <linux/arm-rmi-cmds.h>
> +#include <linux/kvm_host.h>
> +
> +#include <asm/kvm_pgtable.h>
> +#include <asm/virt.h>
> +
> +static int rmm_check_features(void)
> +{
> +	if (kvm_lpa2_is_enabled() &&
> +	    !rmi_has_feature(0, RMI_FEATURE_REGISTER_0_LPA2)) {
> +		kvm_err("RMM doesn't support LPA2\n");
> +		return -ENXIO;
> +	}
> +
> +	if (!rmi_has_feature(1, RMI_FEATURE_REGISTER_1_HASH_SHA_256)) {
> +		kvm_err("RMM doesn't support SHA-256 measurements\n");
> +		return -ENXIO;
> +	}
> +
> +	return 0;
> +}
> +
> +void kvm_init_rmi(void)
> +{
> +	if (kvm_get_mode() != KVM_MODE_RMM)
> +		return;
> +
> +	if (!is_rmi_available()) {
> +		kvm_info("Realm VM support is disabled because RMI is not available\n");
> +		return;
> +	}
> +
> +	if (rmm_check_features())
> +		return;
> +
> +	/* Future patch will enable static branch kvm_rmi_is_available */
> +}
> diff --git a/include/linux/arm-rmi-cmds.h b/include/linux/arm-rmi-cmds.h
> index a84e50ac851c..6f43eac7c7be 100644
> --- a/include/linux/arm-rmi-cmds.h
> +++ b/include/linux/arm-rmi-cmds.h
> @@ -67,6 +67,11 @@ static __always_inline void rmi_smccc_invoke_once(struct arm_smccc_1_2_regs *reg
>   
>   unsigned long rmi_feat_reg(unsigned int index);
>   
> +static inline bool rmi_has_feature(unsigned int index, unsigned long feature)
> +{
> +	return !!(rmi_feat_reg(index) & feature);
> +}
> +
>   int rmi_delegate_range(phys_addr_t phys, unsigned long size,
>   		       phys_addr_t *out_phys);
>   int rmi_undelegate_range(phys_addr_t phys, unsigned long size);


