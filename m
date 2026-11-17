Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D52606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 14:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wp+TnZs4;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=eFRBQMJt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=htWpbWvWjkzp2iYbY9MWMmeINInucOJuS3Dv1JVxhx8=; b=wp+TnZs4PRAgj7VloNzBlA2IHV
	mCE/6qYcbvtlxREnvGAdIejWr17UaZbbQJLiVcQwHPBP6XI69pGjyx5jsbIdaGRQ/1a+2T+TcWZ2J
	uCmCOpxYtzTUTHdmUt1/dIRI0y1Oy2AlBy4CuP7UOm1m7WFO4GkDA7dsSeeJtstLzretPIFjQelDm
	qtuxQYj5RhdhZCE0LcSEWvg1MLCIkJ8fRrbNptSbaJSPDGSyJFNl0MqWl+vgJCcT5/eAD5rEH4RZq
	6p6MpqAejGlObO+pym2Zp6lLymbZToFSo1ye/AKReTw17KejH1tEG7D3xJEx/UZ17DlQ315vQ1wvx
	jShHGoLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTJqz-0000000648b-3sEN;
	Tue, 17 Nov 2026 14:08:09 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTJqx-0000000647e-45Y6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 14:08:09 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-5c14bc5a743so9376e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 06:08:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794924485; cv=none;
        d=google.com; s=arc-20260327;
        b=TlcEU9lzp2jcACRMszlltrAdjeNtj0hJPvmL4LnKbxSs7wFtaNzD/dyO/r4gRrtRVm
         6C2dqAYVi4K7Af2KH9ReuBrD9dztJkA2H1bDGw+8IS9PaHpxpRkWlWC0Jtp/7YBQuyH1
         SsGN6rs9kFO3XXHLyy6xbvtWO3wTdw+gSkeXMUOcjSOdc3ze7eLlqi7DkAGUr4B69aY6
         JtLrJ56R2fD4y2c1o8SmgZJIeGN7aiTusXFLM71haYhStBn3MIFDnHdRzD2jK7R+JWqB
         H0T1aMqi4V23zauCkvMJLeMPCwHH5S0u8WLhdKdC2c1QOfMdB2Nj7ma/1E2TsDp3RKJH
         h1QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=htWpbWvWjkzp2iYbY9MWMmeINInucOJuS3Dv1JVxhx8=;
        fh=a7+gs/j1jYZnwxTuDZkWBGnHUka5m2AF+s2SY18+GTY=;
        b=gh8mJQF7MROkABZhH3rznXPp0RguquHq7UhWiFA4HidVmjDQNRBNAAvLPgqhuw6RVZ
         l5H2ns954aPEIz6whn5synna1XohmDYZt+1VuzVHduwf10i5O3HR/iFgGhbO9ZCKMyQq
         7nL46FfeQytz4d8JK7h2ORQtUndq1s0OA6PlbYLEa1ZiUGs/fXNWliux5hXLF9ImnpBM
         QrZRJLhkGjlwLjxief90BjUaHZZNukesUXRB3Gq6IRXSCQqdWTqD15Gh3C8Q8lRZJo+I
         Zz13886C/ryRoopw5LIzr7tS/UvIeUoRLmA4/FznRVxac1jIDoQOVniMImlNDpv7SnNW
         DqoA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794924485; x=1795529285; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=htWpbWvWjkzp2iYbY9MWMmeINInucOJuS3Dv1JVxhx8=;
        b=eFRBQMJtDLBVPWCJvDThF26ggegMikDJ/ZiBz85+0tdvUz498dEFUQe7C9OkyDPZvv
         DZtnaOWoYzUw3dR45JRd+Two0SOSwIv4buFapmKxO7l4ANnFpCnzZLMCpLRPD6bwS1Rf
         HKCnF7QRQ0ZmXpCcyj8M6xLrgCH7P5WvqFQO2caL5SuOVFFxLQPOxmIfO9m809r5Khvl
         5TLeIeQ/Iye1qU71gHC3g+ARoQ4ikGc5VMJ1RVZm88UFLgMjT9c8wY8lhNZU95mv0oBc
         u5dsgVAtzHu9k7MiS6ZKdCVs+JfeKWrRJTML1YmYGQKZbIQnt1f4Yo87K6Sxbu82KMAl
         uP7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794924485; x=1795529285;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=htWpbWvWjkzp2iYbY9MWMmeINInucOJuS3Dv1JVxhx8=;
        b=Q6d2LN1pXLWmzrsy+S6W4lEhkM5y+TD5Wz6Z0DkRP9dSZubovPbiBDxRb/mg/3uocm
         GjUtKcJDSbYz2TUGu117zzAkuofFhfNxq611XJM95f741nbeOojcjI4zKmhBXLTSZ/zA
         hb785fCfVUwrSYNO0oShpUw/yRhqO4kVXet9h00uJFHcoBxkTEBYbtQBlKtizPp7p6wN
         BK7P/mUFYVZelN4lX/y5cVtPYdbvrPwiV5V1snF7XhjHjuyobaou2hHOAO/rNap0e6hH
         5Cgcrlm9te0hEKPzaZOxAD3GgkITz8CSzI3dHJ4zWJflJ+cjQ5QOkm/V94qbz9vqfDID
         9TRg==
X-Forwarded-Encrypted: i=1; AL+hErHljNPLoWyZuDuviyq1HVs3Ui35laHL8qn1i+F1li6xvxj3y+Qg3sS4xfC6jef0AeP6jd5gA2swDitDGHxIWy+F@lists.infradead.org
X-Gm-Message-State: APuU4Z9VT4wMX5fF3T5yJTvyeBbpO2zKGEVO9I1M20FGgJIQJK8mB7Ww
	jrOPA+Y0sVovvSiwkJAhRj7dbFKEcp/ToD7Gkn+8y1Zl0ZUYWd6XLq2Se5D8lh5KuPCMulENSqo
	1yAge3iCRSRy+qWSKsUyKFEp+re/H9Fr7o/AVZ5n5
X-Gm-Gg: AYBFou3jIpg8bDjCT+9WG7G1ESptFvqmpFT7pcUltdo6RIUcNhf5ck8CB7gA8D0mDvs
	KYl1VaavxUhxFZmb5ak3+xYWzjkXZ8MQ3OXc+cOHmQHPGKLDpZwki4yjq6RsFB5kvBUurjfc9AI
	W5nsman2/Re9r8Bw2J3pzUUjcTI+P/HEHqdpx7yYagslk5Eyn719OtnXD16VbS86Kk+MP/GdD4M
	QqRdyIN26zR8ZdORK2+HoaRNU+cHQRlmJ0dlOD7dh1RY5vz9JVovcHxqixRuTSlXdItTM0UNAXZ
	V4lVwyKuUtssalDZA2RP9JjJTjEUNJj8Es7qVkPKuAm9QJ8uKk+I34kOHDZIPY3ScSuLsp3JExb
	fndTzOyg/N1C9UzI3rrHGJIjDW7oiQtdq6iMiMs0OcIAFNBpX3Re+n3k8i+lTlZH6pkdNfXAyA6
	Y++WNmgdyl6e+rH6PESfyxJNA=
X-Received: by 2002:ac2:4e07:0:b0:5bf:f84f:1d74 with SMTP id
 2adb3069b0e04-5c1a2185fadmr137629e87.13.1794924484857; Tue, 17 Nov 2026
 06:08:04 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261116164358.142785-1-steven.price@arm.com> <20261116164358.142785-3-steven.price@arm.com>
In-Reply-To: <20261116164358.142785-3-steven.price@arm.com>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 17 Nov 2026 14:07:28 +0000
X-Gm-Features: AclHuK_JC9RetKL5Q3HHKVX6R6ajyHm2xDLO6StGpKQMwUtLiIUPvzFbgoEna3U
Message-ID: <CA+EHjTwfp8p7uwP2LXEqSmTwL6ZHuDCYbvMie_Wr_30xJwfO6A@mail.gmail.com>
Subject: Re: [PATCH v3 02/11] KVM: arm64: CCA: Introduce Realms
To: Steven Price <steven.price@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>, 
	Oliver Upton <oliver.upton@linux.dev>, Zenghui Yu <yuzenghui@huawei.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Joey Gouly <joey.gouly@arm.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Christoffer Dall <christoffer.dall@arm.com>, linux-coco@lists.linux.dev, 
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, Gavin Shan <gshan@redhat.com>, 
	Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun <alpergun@google.com>, 
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Emi Kisanuki <fj0570is@fujitsu.com>, 
	Vishal Annapurve <vannapurve@google.com>, WeiLin.Chang@arm.com, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Kohei Enju <enju.kohei@fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_060808_062819_43F65D95 
X-CRM114-Status: GOOD (  17.89  )
X-Spam-Score: -17.6 (-----------------)
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
X-Spam-Status: No, score=-18.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 16 Nov 2026 16:43:48 +0000, Steven Price <steven.price@arm.com> wrote:
[...]
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
[...]
> @@ -1571,31 +1576,39 @@ struct kvm *kvm_arch_alloc_vm(void);
>
>  #define __KVM_HAVE_ARCH_FLUSH_REMOTE_TLBS_RANGE
>
> -#ifdef __KVM_NVHE_HYPERVISOR__
> +#define kvm_vm_is_protected(kvm)        ((kvm)->arch.vm_flavor >= __VM_PROTECTED)
>
> -#define kvm_vm_is_protected(kvm)                        \
> -        (is_protected_kvm_enabled() && ((kvm)->arch.vm_flavor == VM_PROTECTED_PKVM))
> +#ifdef __KVM_NVHE_HYPERVISOR__
>  /*
>   * Accessing vcpu->kvm from nVHE hyp stub is tricky, as we need to convert the
>   * pointer to the hyp VA. With pKVM, the nVHE code runs with the hyp_vcpu,
> - * which is populated correctly and is gated on is_protected_kvm_enabled().
> + * which is populated correctly. Always vcpu_is_protected_pkvm(), which is
> + * gated on is_protected_kvm_enabled().
>   */
> -#define vcpu_is_protected(vcpu)                                                \
> +#define vcpu_is_protected(vcpu)                BUILD_BUG_ON(1)
> +#else
> +#define vcpu_is_protected(vcpu)                kvm_vm_is_protected((vcpu)->kvm)
> +#endif
> +
> +#define kvm_vm_is_protected_pkvm(kvm)                                        \
> +        (is_protected_kvm_enabled() && ((kvm)->arch.vm_flavor == VM_PROTECTED_PKVM))
> +
> +/*
> + * Rely on is_protected_kvm_enabled() check in kvm_vm_is_protected_pkvm() to
> + * make sure the vcpu->kvm is always valid VA in the context
> + */
> +#define vcpu_is_protected_pkvm(vcpu)                                        \
>          ({                                                                \
>                  struct kvm *__kvm = READ_ONCE((vcpu)->kvm);                \
>                                                                          \
> -                (__kvm && kvm_vm_is_protected(__kvm));                        \
> +                (__kvm && kvm_vm_is_protected_pkvm(__kvm));                \
>          })
>
> -#else
> -
> -#define kvm_vm_is_protected(kvm)        ((kvm)->arch.vm_flavor >= __VM_PROTECTED)
> -#define vcpu_is_protected(vcpu)                kvm_vm_is_protected((vcpu)->kvm)

This brings back the _pkvm variants that Marc asked to drop in the
plumbing series [1]. In the nVHE hyp code, kvm_vm_is_protected() and
vcpu_is_protected() already mean pKVM-protected, so I think the hyp
side can stay as it is.

At EL1, the pKVM-only checks that a Realm vCPU also reaches are in
kvm_arm_vcpu_power_off() and kvm_psci_vcpu_on(). Could they check
vm_flavor == VM_PROTECTED_PKVM directly?

> +#define kvm_vm_is_realm(kvm)                ((kvm)->arch.vm_flavor == VM_REALM)
> +#define vcpu_is_rec(vcpu)                kvm_vm_is_realm((vcpu)->kvm)

vcpu_is_rec() isn't used anywhere in this series. Could it be dropped?

[...]
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
[...]
> @@ -906,7 +907,8 @@ static bool kvm_arm_vcpu_suspended(struct kvm_vcpu *vcpu)
>  /* Only the guest's CPU_ON may start a vCPU EL2 holds powered off. */
>  bool kvm_pkvm_vcpu_is_powered_off(struct kvm_vcpu *vcpu)
>  {
> -        return READ_ONCE(vcpu->arch.mp_state.mp_state) == KVM_MP_STATE_UNINITIALIZED;
> +        return vcpu_is_protected_pkvm(vcpu) &&
> +                READ_ONCE(vcpu->arch.mp_state.mp_state) == KVM_MP_STATE_UNINITIALIZED;

Only a pVM's vCPU can be in KVM_MP_STATE_UNINITIALIZED, so is this needed?

Cheers,
/fuad

[1] https://lore.kernel.org/all/86pkxs2npx.wl-maz@kernel.org/

