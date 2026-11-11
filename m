Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF3CE606A324
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 17:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JEmvxTf3;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=B0vx20da
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Z8qU6+HvaIS0hGP6RSMrC3qaiOO8YyUA1e15Sl/ZGXE=; b=JEmvxTf3rxmo4W
	GYUzLXXMnDOAe0i2+oWyZbpJAHOHSRwWouy74dN35kyqt0cjrM+yeMI9Lti5sEiba2sDRj8IeEITZ
	UEx4tvIol1iKTXj4vtFyAKwWJWRw0XT0DvYRALVyOCU/jhOsGavN5RO4ABsDp3+2DQ5BtqvTx01hG
	vKIEer0M99pIJ57yFIC6hkb/PgO3t2TYvS3/UMyiu7vVX4JvY7JbeFBuamASFv+JoxC2uVwWtmOGt
	9K41YL0A92fJXmBA5+KXyQjYR8/k0kKxuSx/pBgQyZevVYN/m4+vh2OQnRlSQPaH8HYgIAVE/z5Cj
	eJSdZ+NGgxq+vW4vuzGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRCT1-00000007L3x-21S1;
	Wed, 11 Nov 2026 17:50:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRCSy-00000007L38-3tB7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 17:50:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DADC11576;
	Wed, 11 Nov 2026 09:50:32 -0800 (PST)
Received: from [10.57.69.47] (unknown [10.57.69.47])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DC4093F632;
	Wed, 11 Nov 2026 09:50:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794419435; bh=mkeJMyoQ8Qv6RCg92gwoZ/tiJll4x2tHEGTQlboYilQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=B0vx20daoO+pjHgnuqgkbbdr6Am0qaJ+xSgQiGc5DV5qXM28UAODjDIdbLLg3j+P/
	 JVlF8vJ8I0yzmAja1WatBIQIdsq/5ssyGRXt8SQoW39vxsUmwE3B3KibZBxalzjzoM
	 52ANnchXJdVDMcsSysOPgEhvoy0NWAp+/DfnpoPE=
Message-ID: <c426f5a3-d161-476d-8911-99903ecf8e46@arm.com>
Date: Wed, 11 Nov 2026 17:50:31 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 09/18] KVM: arm64: Implement HVC handling for protected
 guests at EL2
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 catalin.marinas@arm.com, will@kernel.org, joey.gouly@arm.com,
 seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
 mark.rutland@arm.com, steven.price@arm.com, vdonnefort@google.com,
 qperret@google.com
References: <20261001135711.1640520-1-fuad.tabba@linux.dev>
 <20261001135711.1640520-10-fuad.tabba@linux.dev>
 <5fa8a1fb-4e2c-4746-8a70-a47f387ef0d6@arm.com>
 <CA+EHjTyCcGPMte9=HuqyvCS7CCCt80Lc_JQuA+1e3ZE+3A0zqQ@mail.gmail.com>
From: Ryan Roberts <ryan.roberts@arm.com>
Content-Language: en-GB
In-Reply-To: <CA+EHjTyCcGPMte9=HuqyvCS7CCCt80Lc_JQuA+1e3ZE+3A0zqQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_095037_057495_BBFF59AD 
X-CRM114-Status: GOOD (  20.83  )
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

On 11/11/2026 16:45, Fuad Tabba wrote:
> Hi Ryan,
> 
> On Wed, 11 Nov 2026 13:59:17 +0000, Ryan Roberts <ryan.roberts@arm.com> wrote:
> [...]
>>> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> [...]
>>> @@ -2622,6 +2622,10 @@ static void kvm_hyp_init_symbols(void)
>>>          kvm_nvhe_sym(__icache_flags) = __icache_flags;
>>>          kvm_nvhe_sym(kvm_arm_vmid_bits) = kvm_arm_vmid_bits;
>>>
>>> +        kvm_nvhe_sym(spectre_v2_state) = arm64_get_spectre_v2_state();
>>> +        kvm_nvhe_sym(spectre_v4_state) = arm64_get_spectre_v4_state();
>>> +        kvm_nvhe_sym(spectre_bhb_state) = arm64_get_spectre_bhb_state();
>>
>> Is it really correct to snapshot this state then use it at runtime assuming its
>> still accurate? See below...
> 
> These can't change after this point: update_mitigation_state() doesn't
> update a state once system_capabilities_finalized() is true, and
> kvm_arm_init() runs after that.
> 
> [...]
>>> diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> [...]
>>> @@ -1181,8 +1187,70 @@ bool kvm_handle_pvm_hvc64(struct kvm_vcpu *vcpu, u64 *exit_code)
> [...]
>>> +        case ARM_SMCCC_ARCH_FEATURES_FUNC_ID:
>>> +                /* The workaround calls themselves are handled on hyp entry. */
>>> +                val[0] = SMCCC_RET_NOT_SUPPORTED;
> [...]
>>> +                case ARM_SMCCC_ARCH_WORKAROUND_2:
>>> +                        switch (spectre_v4_state) {
>>> +                        case SPECTRE_VULNERABLE:
>>> +                                break;
>>> +                        case SPECTRE_MITIGATED:
>>> +                                /* With SSBS advertised the guest's default is safe. */
>>> +                                if (kvm_has_feat(vcpu->kvm, ID_AA64PFR1_EL1, SSBS, IMP))
>>> +                                        break;
>>
>> For this case (and the break immediately above) you return val[0] =
>> SMCCC_RET_INVALID_PARAMETER (from init at top of this function). But the
>> kernel's kvm_smccc_call_handler() returns val[0] = SMCCC_RET_NOT_SUPPORTED in
>> these cases (which seems more likely to be correct). Does this violate the ABI?
> 
> Both return NOT_SUPPORTED. val[0] is set to it at the top of the
> ARM_SMCCC_ARCH_FEATURES_FUNC_ID case.

Ahh missed that oops!

> 
>>
>>> +                                fallthrough;
>>> +                        case SPECTRE_UNAFFECTED:
>>> +                                val[0] = SMCCC_RET_NOT_REQUIRED;
>>
>> Is it possible that the (compromised) kernel could have disabled the mitigation
>> after the state snapshot was taken? I.e. spectre_v4_state == SPECTRE_MITIGATED
>> and the VM doesn't advertise SSBS so it returns SMCCC_RET_NOT_REQUIRED here. But
>> the kernel has since turned off the mitigation?
> 
> Yes, where the mitigation is the firmware one. The host can disable it
> with an ARM_SMCCC_ARCH_WORKAROUND_2 call, which EL2 forwards, and EL2
> doesn't enable it again before running the guest. With TF-A that's
> only on a Cortex-A76 without SSBS, the only CPU it implements the
> dynamic workaround for.

If the mitigation is via SSBS but SSBS is not exposed to the guest, I'm guessing
this is safe because the guest is expected to set SSBS=0 in this case?

Thanks,
Ryan

> 
> I'll send out a fix. Thanks for spotting this!
> 
> Cheers,
> /fuad


