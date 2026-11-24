Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EC0A606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 09:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hUDN61Tf;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=pzXozxLm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=H5EGPVwUvBTVCjnjKNK0pwP1iE/nYLH8FPXSomLTbJo=; b=hUDN61TfddoqqN1gVqfqoUlmoI
	BFX127JPYWyCyQ/RL2OvcTw7XQd0zWXE1pLLPrqfhCEU9uQDUrJpwRdy+DeH7F2SOC+ud94SWG4QE
	gqrUDAuWNIl0Tuv04fhUS6TTlEvVHo1DOGK7PRASQLRp/0aphLTnf/Ka0Ajsn60xISX+P6/AVX/h/
	9tDOAF2RyZplaEy1WXg4zOJE2hfWCqSVHcIviAso8z8V/krelRXkQt2aN7Djnr+D/Qw5/ptalOiUg
	mr9Y/FqABdgSXclo+V4QDI5WuERD/IKX+lN5Q0WBgbVvQs0/UiD0xnfgKwsU+BUaaW+QT5JFcNNpR
	fD/5UzTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVmSg-000000060kz-11W1;
	Tue, 24 Nov 2026 09:05:14 +0000
Received: from out-115.mta1.migadu.com ([95.215.58.115] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVmSc-000000060jf-401Q
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 09:05:12 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=xPij0k4CeHH9+SjKj41LaA/JfirxBcQilK4GNNYxiKg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795511108; v=1; x=1796115908;
 b=pzXozxLmhONCVD+K/9lgsvhPodMQnUBLFzNN+W0jx1o3IPSgff58r8ZRE4LpMeKKpZGHUDAf
 k/0FhN/PreX7b48b+b+uMIGwTLrYR5CiwOsxBMaoLRhqoUrmzw80tVY71kqmtXyvHTWyWgu2pR5
 aRknsdqYzFPxPjDsYqfiBx0A=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 27f79909c5682256;
	Tue, 24 Nov 2026 09:05:08 +0000
X-Mizu-Trace-ID: 27f79909c5682256
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5c00d7ac49dso15899e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 01:05:08 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErG8MM5Q2Gcw/UnytC4KBLsZ0CwlvV+JRf1/4VnUBwOPK18+Ceim5cVAWO+DnYfmePzKKxLosmMMf/JSMKTIUzQP@lists.infradead.org
X-Gm-Message-State: APuU4Z8AgJrCHZ124GzKmEYwq5NFuVptuiEr/ri5bnyTBmzfkJ8cwWT+
	V/gWU+G6pqiF5dE9bdcSHmjcoGMdDhl05L93rWNUdKjnyXjGuj2cqPrw+0bCGLBp1v34cdPkwau
	+3tcOoz3Y/2EzKruTvSBzORiLgWYcy+nnUcyICMX4
X-Received: by 2002:a05:6512:1282:b0:5c1:a880:e5b9 with SMTP id
 2adb3069b0e04-5c1fbb1e9acmr380099e87.7.1795511106116; Tue, 24 Nov 2026
 01:05:06 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261123192457.8700-1-maz@kernel.org> <20261123192457.8700-3-maz@kernel.org>
In-Reply-To: <20261123192457.8700-3-maz@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 24 Nov 2026 09:05:00 +0000
X-Gmail-Original-Message-ID: <CA+EHjTyOc3K4vgMxONpCsQoE9sC7vGf2y1Fjjp0wCZuLUHx+RQ@mail.gmail.com>
X-Gm-Features: Aa3M54rju6I7eIYSuhEWlu6AZl7jQW3yTB9_OPRQWCxv1avPMlgvoBI00tGtVA0
Message-ID: <CA+EHjTyOc3K4vgMxONpCsQoE9sC7vGf2y1Fjjp0wCZuLUHx+RQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] KVM: arm64: Add GIC idregs sanitisation to common framework
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Steffen Eiden <seiden@linux.ibm.com>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Oliver Upton <oupton@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_010511_409931_CC8CE3D9 
X-CRM114-Status: GOOD (  10.40  )
X-Spam-Score: -2.8 (--)
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

Hi Marc,

On Mon, 23 Nov 2026 19:24:56 +0000, Marc Zyngier <maz@kernel.org> wrote:
> It takes no least than 3 ID registers to describe whether a GICv3 or
> GICv5 is supported. Define the sanitisation tables for the relevant
> fields and the set of relevant callbacks.

nit: s/no least than/no less than/

[...]
> diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
[...]
> +static bool feat_gicv3(struct kvm *kvm)
> +{
> +        return (irqchip_in_kernel(kvm) &&
> +                kvm->arch.vgic.vgic_model == KVM_DEV_TYPE_ARM_VGIC_V3);
> +}

nit: could this be irqchip_in_kernel(kvm) && vgic_is_v3(kvm), and
feat_gcie() use vgic_is_v5() the same way?

[...]
> +static const struct reg_bits_to_feat_map aa64pfr0_gicv3[] = {
> +        ENUM_FEAT(ID_AA64PFR0_EL1_GIC_IMP, feat_gicv3 ),
> +        ENUM_FEAT(ID_AA64PFR0_EL1_GIC_NI, NULL ),
> +};

nit: stray spaces before the closing parentheses.

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad

