Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E836606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 16:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=e51CO1eh;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ZHvJqC0T
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=zfYkUkK1FvEiamJkD2w+G92+ZaU+ueOZOEIhISapy8E=; b=e51CO1ehfhwKTTCsTpVhkA/qVK
	jYh0u+0UKR83tlmH/z+WPCm915cmGSkO+2nOq4HNwBLKfzjwHHvsefBpGC9Gkq06sIRooqtoTu/W+
	6RxUONu/Xja1OZklNMe/Z9DRZ8qHXtFnqdGvKg5usZrFVCWC/2mvzO3pM0WtTXWyCBio2kQ6MBCSA
	C13swx9mjz0qqQYUDYw0stpiWu4iEEM7T7InhWfdWryCAkxiR2OvjQhNBwkIRBX8ypiG2b7Mg5OQL
	tmaT+khprTK/ZawOgEgJDQ5e+5kwS88nP42nF382c8Kla0eSqZjKOaWI1pVvihRsww9wbEUZQ0n4m
	m8v/BL1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRBSe-00000007F2z-0T1N;
	Wed, 11 Nov 2026 16:46:12 +0000
Received: from out-23.mta1.migadu.com ([2001:41d0:203:375::17] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRBSa-00000007F0D-28pM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 16:46:11 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=vTOKXuEi2SgorO3quCcM6rXO+IcsXT+k+wyiUNo4CmU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794415564; v=1; x=1795020364;
 b=ZHvJqC0TvMAf40zIi0Jaycs0aRywXeCYeRnhrHGqU77F3zeosY/QX7ioVVFTqlvucMaN45o+
 Wlae4eygz7xNCedKwfqMlIOXQJCmVFKgwkJFdUEvYEPDkXNhZiIs/gTSB0St2mI/yRUY+8HwneJ
 b0X99g9wQSPPTsXY+f9hfaa8=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id afebdf9ea4e82bf7;
	Wed, 11 Nov 2026 16:46:04 +0000
X-Mizu-Trace-ID: afebdf9ea4e82bf7
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5c00d7ac49dso5626e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 08:46:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHKXpt6QuGuy5quTm7gRQf2AB4MrBRmONeFPGkY5BKJ2ZnKeDVUwQSqXcNL50bXEcA2JnwOrmoJOEbU2bbPrm5W@lists.infradead.org
X-Gm-Message-State: APuU4Z/fEMmUGViL47lBcWjvVDnN3Apy++SWhGO/F4Wi1qIGxb5TMohW
	shsTZSQ3QyMnWZzzTM17RBjQSaSB9tmP7U6OdASWeifHrd2uWZF/Ok2AGSZZYmcXLfwyAvdEsMt
	5+dwh7tWZbWWi20gVVvKHkZlvouRZd2itPXIPLJtF
X-Received: by 2002:a05:6512:1281:b0:5c1:488e:a067 with SMTP id
 2adb3069b0e04-5c15e321265mr149685e87.16.1794415563460; Wed, 11 Nov 2026
 08:46:03 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261001135711.1640520-1-fuad.tabba@linux.dev>
 <20261001135711.1640520-10-fuad.tabba@linux.dev> <5fa8a1fb-4e2c-4746-8a70-a47f387ef0d6@arm.com>
In-Reply-To: <5fa8a1fb-4e2c-4746-8a70-a47f387ef0d6@arm.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 11 Nov 2026 16:45:27 +0000
X-Gmail-Original-Message-ID: <CA+EHjTyCcGPMte9=HuqyvCS7CCCt80Lc_JQuA+1e3ZE+3A0zqQ@mail.gmail.com>
X-Gm-Features: AclHuK_8e85qNvEPUChw2hXq-xwQhB1Rl-UgkdF_cZM8i8KqhVquzOK3Y1yl4BA
Message-ID: <CA+EHjTyCcGPMte9=HuqyvCS7CCCt80Lc_JQuA+1e3ZE+3A0zqQ@mail.gmail.com>
Subject: Re: [PATCH v4 09/18] KVM: arm64: Implement HVC handling for protected
 guests at EL2
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	catalin.marinas@arm.com, will@kernel.org, joey.gouly@arm.com, 
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	mark.rutland@arm.com, steven.price@arm.com, vdonnefort@google.com, 
	qperret@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_084608_696248_1BDA04A1 
X-CRM114-Status: GOOD (  18.81  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Ryan,

On Wed, 11 Nov 2026 13:59:17 +0000, Ryan Roberts <ryan.roberts@arm.com> wrote:
[...]
> > diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
[...]
> > @@ -2622,6 +2622,10 @@ static void kvm_hyp_init_symbols(void)
> >          kvm_nvhe_sym(__icache_flags) = __icache_flags;
> >          kvm_nvhe_sym(kvm_arm_vmid_bits) = kvm_arm_vmid_bits;
> >
> > +        kvm_nvhe_sym(spectre_v2_state) = arm64_get_spectre_v2_state();
> > +        kvm_nvhe_sym(spectre_v4_state) = arm64_get_spectre_v4_state();
> > +        kvm_nvhe_sym(spectre_bhb_state) = arm64_get_spectre_bhb_state();
>
> Is it really correct to snapshot this state then use it at runtime assuming its
> still accurate? See below...

These can't change after this point: update_mitigation_state() doesn't
update a state once system_capabilities_finalized() is true, and
kvm_arm_init() runs after that.

[...]
> > diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
[...]
> > @@ -1181,8 +1187,70 @@ bool kvm_handle_pvm_hvc64(struct kvm_vcpu *vcpu, u64 *exit_code)
[...]
> > +        case ARM_SMCCC_ARCH_FEATURES_FUNC_ID:
> > +                /* The workaround calls themselves are handled on hyp entry. */
> > +                val[0] = SMCCC_RET_NOT_SUPPORTED;
[...]
> > +                case ARM_SMCCC_ARCH_WORKAROUND_2:
> > +                        switch (spectre_v4_state) {
> > +                        case SPECTRE_VULNERABLE:
> > +                                break;
> > +                        case SPECTRE_MITIGATED:
> > +                                /* With SSBS advertised the guest's default is safe. */
> > +                                if (kvm_has_feat(vcpu->kvm, ID_AA64PFR1_EL1, SSBS, IMP))
> > +                                        break;
>
> For this case (and the break immediately above) you return val[0] =
> SMCCC_RET_INVALID_PARAMETER (from init at top of this function). But the
> kernel's kvm_smccc_call_handler() returns val[0] = SMCCC_RET_NOT_SUPPORTED in
> these cases (which seems more likely to be correct). Does this violate the ABI?

Both return NOT_SUPPORTED. val[0] is set to it at the top of the
ARM_SMCCC_ARCH_FEATURES_FUNC_ID case.

>
> > +                                fallthrough;
> > +                        case SPECTRE_UNAFFECTED:
> > +                                val[0] = SMCCC_RET_NOT_REQUIRED;
>
> Is it possible that the (compromised) kernel could have disabled the mitigation
> after the state snapshot was taken? I.e. spectre_v4_state == SPECTRE_MITIGATED
> and the VM doesn't advertise SSBS so it returns SMCCC_RET_NOT_REQUIRED here. But
> the kernel has since turned off the mitigation?

Yes, where the mitigation is the firmware one. The host can disable it
with an ARM_SMCCC_ARCH_WORKAROUND_2 call, which EL2 forwards, and EL2
doesn't enable it again before running the guest. With TF-A that's
only on a Cortex-A76 without SSBS, the only CPU it implements the
dynamic workaround for.

I'll send out a fix. Thanks for spotting this!

Cheers,
/fuad

