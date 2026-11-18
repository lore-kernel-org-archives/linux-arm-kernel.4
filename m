Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E49E606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 16:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BohwI3BY;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=VfMYMAuM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=yYNwdmBSIDxtuxPrHW8cdhm8SfdRppfZaAmTog96H2A=; b=BohwI3BYmCrUzr
	vhrIzkElK7Er+xsBAq3a6JIUphutTzPpMj4CPPJfu1LE4h9rq/tbV0y09MLA0gdWEqw3/V0KgJdoy
	Ni1GVuZMmM8KDAG3MO6dr/OFflnEpTZNY2MN6VacEo8XkzmaKEliSLlD3y8uZMnICoAjAPQXIfRrJ
	Jtc2b//LmSvVCCV4mOtuDtXyLmoz2apjABxLv5CTwxzvyEQ0NyqJ0gQfuTvlWfbIvKpRPzy3cxvpJ
	qOXlT7Auwt6vrFWXSqNoCCWIMZV6wEwN9eZJ5AvL5jgauU5FWa3V9GZyTrhli/E2DD7vgTCibuchT
	fyzojzVq44Ahga5IjbUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTiHV-00000009QHl-1ss3;
	Wed, 18 Nov 2026 16:13:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTiHS-00000009QHA-1vIT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 16:13:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5FF44339;
	Wed, 18 Nov 2026 08:13:02 -0800 (PST)
Received: from [10.57.62.206] (unknown [10.57.62.206])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E29C53F673;
	Wed, 18 Nov 2026 08:12:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795018385; bh=7HisUsPk+KXisBKOhhwZZBhSMTa8p36OAkhoTk09/p8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VfMYMAuMFySbcli51fpiRUiyHhsrWxVA0JvsMlnhNMKHwT3OC8N7svYDR6AXpwyRI
	 DQ3ucKevGEEZxmSMHnhWCReSwkfPCO0oRhqJaRKuPRh1v7zUXh0fBwqw4KIilbCFx/
	 PLAJ0VltMjZX2DM+j8kxWZtoujx0Rpj6phIcEFV0=
Message-ID: <a36b5c53-5148-4b08-b399-ae64b1ad8707@arm.com>
Date: Wed, 18 Nov 2026 16:12:57 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/11] KVM: arm64: CCA: Introduce Realms
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
 <20261116164358.142785-3-steven.price@arm.com>
 <CA+EHjTwfp8p7uwP2LXEqSmTwL6ZHuDCYbvMie_Wr_30xJwfO6A@mail.gmail.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <CA+EHjTwfp8p7uwP2LXEqSmTwL6ZHuDCYbvMie_Wr_30xJwfO6A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_081306_591421_7122847B 
X-CRM114-Status: GOOD (  18.17  )
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

On 17/11/2026 14:07, Fuad Tabba wrote:
> On Mon, 16 Nov 2026 16:43:48 +0000, Steven Price <steven.price@arm.com> wrote:
> [...]
>> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> [...]
>> @@ -1571,31 +1576,39 @@ struct kvm *kvm_arch_alloc_vm(void);
>>
>>  #define __KVM_HAVE_ARCH_FLUSH_REMOTE_TLBS_RANGE
>>
>> -#ifdef __KVM_NVHE_HYPERVISOR__
>> +#define kvm_vm_is_protected(kvm)        ((kvm)->arch.vm_flavor >= __VM_PROTECTED)
>>
>> -#define kvm_vm_is_protected(kvm)                        \
>> -        (is_protected_kvm_enabled() && ((kvm)->arch.vm_flavor == VM_PROTECTED_PKVM))
>> +#ifdef __KVM_NVHE_HYPERVISOR__
>>  /*
>>   * Accessing vcpu->kvm from nVHE hyp stub is tricky, as we need to convert the
>>   * pointer to the hyp VA. With pKVM, the nVHE code runs with the hyp_vcpu,
>> - * which is populated correctly and is gated on is_protected_kvm_enabled().
>> + * which is populated correctly. Always vcpu_is_protected_pkvm(), which is
>> + * gated on is_protected_kvm_enabled().
>>   */
>> -#define vcpu_is_protected(vcpu)                                                \
>> +#define vcpu_is_protected(vcpu)                BUILD_BUG_ON(1)
>> +#else
>> +#define vcpu_is_protected(vcpu)                kvm_vm_is_protected((vcpu)->kvm)
>> +#endif
>> +
>> +#define kvm_vm_is_protected_pkvm(kvm)                                        \
>> +        (is_protected_kvm_enabled() && ((kvm)->arch.vm_flavor == VM_PROTECTED_PKVM))
>> +
>> +/*
>> + * Rely on is_protected_kvm_enabled() check in kvm_vm_is_protected_pkvm() to
>> + * make sure the vcpu->kvm is always valid VA in the context
>> + */
>> +#define vcpu_is_protected_pkvm(vcpu)                                        \
>>          ({                                                                \
>>                  struct kvm *__kvm = READ_ONCE((vcpu)->kvm);                \
>>                                                                          \
>> -                (__kvm && kvm_vm_is_protected(__kvm));                        \
>> +                (__kvm && kvm_vm_is_protected_pkvm(__kvm));                \
>>          })
>>
>> -#else
>> -
>> -#define kvm_vm_is_protected(kvm)        ((kvm)->arch.vm_flavor >= __VM_PROTECTED)
>> -#define vcpu_is_protected(vcpu)                kvm_vm_is_protected((vcpu)->kvm)
> 
> This brings back the _pkvm variants that Marc asked to drop in the
> plumbing series [1]. In the nVHE hyp code, kvm_vm_is_protected() and
> vcpu_is_protected() already mean pKVM-protected, so I think the hyp
> side can stay as it is.
> 
> At EL1, the pKVM-only checks that a Realm vCPU also reaches are in
> kvm_arm_vcpu_power_off() and kvm_psci_vcpu_on(). Could they check
> vm_flavor == VM_PROTECTED_PKVM directly?

Ah, yes that should work better. Thanks for the suggestion.

>> +#define kvm_vm_is_realm(kvm)                ((kvm)->arch.vm_flavor == VM_REALM)
>> +#define vcpu_is_rec(vcpu)                kvm_vm_is_realm((vcpu)->kvm)
> 
> vcpu_is_rec() isn't used anywhere in this series. Could it be dropped?

Yep, I can move it after this series.

> [...]
>> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> [...]
>> @@ -906,7 +907,8 @@ static bool kvm_arm_vcpu_suspended(struct kvm_vcpu *vcpu)
>>  /* Only the guest's CPU_ON may start a vCPU EL2 holds powered off. */
>>  bool kvm_pkvm_vcpu_is_powered_off(struct kvm_vcpu *vcpu)
>>  {
>> -        return READ_ONCE(vcpu->arch.mp_state.mp_state) == KVM_MP_STATE_UNINITIALIZED;
>> +        return vcpu_is_protected_pkvm(vcpu) &&
>> +                READ_ONCE(vcpu->arch.mp_state.mp_state) == KVM_MP_STATE_UNINITIALIZED;
> 
> Only a pVM's vCPU can be in KVM_MP_STATE_UNINITIALIZED, so is this needed?

I guess not. I'll drop this change.

Thanks,
Steve

> Cheers,
> /fuad
> 
> [1] https://lore.kernel.org/all/86pkxs2npx.wl-maz@kernel.org/


