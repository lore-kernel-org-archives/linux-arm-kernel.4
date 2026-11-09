Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A76B4606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 07:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VtYRxDT2;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=GyZk03wC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=3/KauWaXYG3OmrhCNO3AADgebVTxE9yJqLBY2sG9Sb0=; b=VtYRxDT23GW5bbQUvT3/5yixjs
	fuNkbOS4/ra/ziiyrLIi7PsG3smrKfkS4MU6CGmSaHOsc97wNqLzvxSjd6zk5ULcG/b1rU2HVI9t+
	/3BJ5oUDjEr3plYRu/HRjUZmBCV+YLRKUR+ka5cSmag/Y1Z6I6PYEakZcUU+qLivNy58S7NycYlUM
	ZpLUEfkOvDB+lzKnKN8EcLg3O4cay1Zt3/wk65mHTolLXSwhLZ785obH4yI67sFgf1pMvwgOuOFFy
	LLXaG6Yg2xP8GeZtxOFCTeUtIuzc2Uu6mJioUl6FjcAnX1Z4PyZNOBV3f1SdscsyAGT+yW0iQk9ZK
	RaeccUtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQK0N-0000000HamO-1rYq;
	Mon, 09 Nov 2026 07:41:27 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQK0H-0000000Hal5-2JOc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 07:41:26 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-5c14bc5a743so2892e87.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Nov 2026 23:41:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794210078; cv=none;
        d=google.com; s=arc-20260327;
        b=gMzg2IgscagcPCPREOVMgECNjlbHShjVebHMOwGmBPyZ2zlyaGe9C7J/Gpfpluv1Ja
         YyhWCJssHw6/LhwXcCPBpvf6UEsz17rqpB8zEZenxZyxObLGCzzJEsvZZbfcPcdCaNA9
         uAdz/aChamjlZTB1JAXM5yabKMLhdP9JzkqyBkO5EcaoV5uP2SVRUdpk32wH42kAfBDD
         pPdB+MO1XzUgG0PLw4w9FrwJGKFg6A5XIRvUNnyTVKfG6bYtoEl2ioTL25rNlF6dqj3x
         K+pylqVMIHtD9kZTOBUWUD08OI3z5tgV+tXlPf6hSyCQNOZzELZ5w4BUn4iRdfMB8iga
         t1fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3/KauWaXYG3OmrhCNO3AADgebVTxE9yJqLBY2sG9Sb0=;
        fh=rMLqlAlBYaY86EYIdQAqAD11taJ6Ol3ruEj7PkQNLYI=;
        b=L+Ux0F5GGtwUZw1FKtX9UL/qHNJB/diu7BuQ7rRDIORqTzLiQ53cdJ8PwyodS8nUm8
         8xFfhuIleJfPps6XTFuFn2FrKpyLcRl97J/+bpgKr4zVyS0YDOPrySQIc/ZlMGomrAbD
         HXvg6nE4+KBeX0Aq4zUmviokMi9MOz2kRw6x67b2LPu/DODrX1rJIZcM+IGD+gPXVlG3
         XxWlFrhcmTwg4fSMn0mJN0lt6OYsOeMHXQZ7KxdBkJsZaoebCp2D3+TE6zimv42fmbrs
         2xCNANmabATbRkrdbLav4YbAncdOeFBv/nhMl5qEXORtK8tJJB3uJKN15GOQGPpzngBK
         ajDw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794210078; x=1794814878; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3/KauWaXYG3OmrhCNO3AADgebVTxE9yJqLBY2sG9Sb0=;
        b=GyZk03wCeT1lfIbw93mDEnS0YdcFgvmE1W7W94gWaIajRidlo3HLKJH/kCrfq/tmui
         CXGbquI0JgET3RiLw/M6CIPMYimOQeekexgr8IXAvR3By2NnWnDTR8jp/RF4obBJUNmr
         FEiL7Tv6DfaY161CGQAU8ClT5/uUQOVvTfYF14H6er0EJqsvwEWMa2DTmgBU8GWfBx4z
         Ol2cqH7nVGA8EMLdvrKDeV5QSdtqc+qcLjQ5kwBauJ+dkL0M56d2NKMtI75AkAUB8ZFE
         /l8wH4O0rHHR9y+l1re80q8xSd4yATLvbpAsBSgOuXh1QEuwlvOft4ldCedtWKJ60/wk
         6vng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794210078; x=1794814878;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3/KauWaXYG3OmrhCNO3AADgebVTxE9yJqLBY2sG9Sb0=;
        b=xMaygUPn86T40dCpFTuC4o9pDHV02a6zpC8OwotJYQDmf3ccjWBV/HQN7a7cxoTx+t
         p0lHuM12PZUB4pvUiY0tK7hVPxEcLSC7wBEhIqtD0Gl78AXIwWZWQQg70BtfyNuG1GWS
         kpLg1qE2Z6L9FHLFnTYHciNQ19fp6+iByQhdceGhPHTVjgiG0BxUdnuVgASl99ziSgKA
         +76QY1bVTMMKwcwOHhYCXdv0YuvxRUruHKsfWgThPy3zs2EMBx6uqoCc7nUtBNhs3dTO
         9pfjyJqwE12ZJx38IhoyND5b16zvAOZs6O0cWmBhwuXznUaW0L34OaHLVBp5Hhyc9btT
         2+Qg==
X-Forwarded-Encrypted: i=1; AL+hErEAf5puVFmu8Dwo0ic4Fta+fh1+YWOxmknygg9tisLtSAeDexpDt8D7H5su3N2DisNraQ7z4qboMjbTrt/Or9q9@lists.infradead.org
X-Gm-Message-State: APuU4Z9fW08L+OyJqHF1il0roCvzWnUPwQ7K2ptVFUT9bVQCizauXPUF
	47U8lOGCfsQYWFzjh4WXDHOt7ib5IQg0+9Yt0paCJYbYqu1Gv9AH7RPuaT1iYI4HqV3oXYj9lbN
	jQB9FrjYjlIgyxl0oLK7w7HzBj7QZB+2/TeSjNOC6
X-Gm-Gg: AYBFou0Ndv48U/DD+ltngR9ljZTcCmr2C3bd0kn1roXzhVyTs4fuHbFlc64LrRdROWY
	noxVBrlmREO9dwBnsS5xWdviMliozA9+EIhj+GKhZ5gWRg3Z6D1fh+tRuGYB1oyivuugiuggqGO
	dzjJzuxAp3GT+P6j7f7ChzEq1LEBQwQKAXZy1XwnIPZvnJ3XMuqwYusL4DtPykRHQXqnqPUdhcm
	b+wXUWHoPqW2SDh0IWu/xPOOwY0qjr6VwUXBv1WFg8pKsGiLIGqOP77LIzbkX/Fi6GlapE+uZQj
	O/Qy1V0OpJtR7lhkBWgSEaDYQWn3nSozvh9uxCqB/6QX4qJmmoXlk40ZhXDikUz0MKEj9JuDSOn
	bt49dSL+8/b1R6BEW0lKaauKIgHc07ilFI/HWvHDV8ucSXES39Kg81Sz2zngfCyd5YJhvb5ln7Z
	5WE0WFjhEu5nZxHw+8nICsy6Br9Q==
X-Received: by 2002:ac2:4bcb:0:b0:5c1:53b5:2029 with SMTP id
 2adb3069b0e04-5c153b5217fmr3411e87.15.1794210077813; Sun, 08 Nov 2026
 23:41:17 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261102141304.126883-1-steven.price@arm.com> <20261102141304.126883-11-steven.price@arm.com>
 <fa0ee5a1-4c49-4c1f-bfbb-c270dc4b6301@arm.com>
In-Reply-To: <fa0ee5a1-4c49-4c1f-bfbb-c270dc4b6301@arm.com>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 9 Nov 2026 07:40:41 +0000
X-Gm-Features: AclHuK87iuKTvXEWJaczVerdWgxPEZxpPBN7O-wc8AIa5Wl9vz0b6-1H_UF4Qbg
Message-ID: <CA+EHjTy970AWnhYoZ5OqxQ8ojCAELeejw60y2NmpDsM_ZMdu4Q@mail.gmail.com>
Subject: Re: [PATCH 10/11] KVM: arm64: CCA: Support runtime faulting of memory
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>, 
	James Morse <james.morse@arm.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Zenghui Yu <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Christoffer Dall <christoffer.dall@arm.com>, 
	linux-coco@lists.linux.dev, 
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, Gavin Shan <gshan@redhat.com>, 
	Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun <alpergun@google.com>, 
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Emi Kisanuki <fj0570is@fujitsu.com>, 
	Vishal Annapurve <vannapurve@google.com>, WeiLin.Chang@arm.com, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_234121_659243_C5167E1D 
X-CRM114-Status: GOOD (  15.89  )
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

Hi Suzuki, Steve,

On Thu, 05 Nov 2026 17:30:16 +0000, Suzuki K Poulose
<suzuki.poulose@arm.com> wrote:
[...]
> > diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
[...]
> > @@ -1816,13 +1828,28 @@ static int gmem_abort(const struct kvm_s2_fault_desc *s2fd,
> >         /* Pairs with the smp_wmb() in kvm_mmu_invalidate_end(). */
> >         smp_rmb();
> >
> > +        if (kvm_vm_is_realm(kvm)) {
> > +                is_realm_private = kvm_realm_is_private_address(&kvm->arch.realm,
> > +                                                                s2fd->fault_ipa);
> > +
> > +                if (is_realm_private != kvm_gmem_is_private_gfn(kvm, canonical_gfn)) {
[...]
> I am wondering there is a way to make it a bit more generic. The issue
> is, only Realm has private memory with guest_memfd for now. Don't know
> the pKVM plans for it.

The plan is for protected pKVM VMs to be backed by guest_memfd too,
which would also hold each page's private/shared state [1]. So
kvm_arch_has_private_mem() will be true for them, and this comparison
applies as is. Only how the expected state is computed differs: for a
pVM it comes from the per-page share state rather than an IPA bit.

Steve, could you gate the guest_memfd checks on
kvm_arch_has_private_mem(kvm) rather than kvm_vm_is_realm(), this one
and the memslot check you proposed for 02/11? Only the
kvm_realm_is_private_address() and realm_map_ipa() calls are
realm-specific, and they could be VM_REALM cases of a switch on
vm_flavor, as Marc asked for on the v21 memslot check [2]. The macro
would then only widen to protected VMs when pKVM's guest_memfd support
lands.

Cheers,
/fuad

[1] https://lore.kernel.org/all/CA+EHjTz+WgXEW5RTxXf4oGeEb1Tsm5Ha4nOc4S1jBcp7jxP4+A@mail.gmail.com/
[2] https://lore.kernel.org/all/86mrsw2jrn.wl-maz@kernel.org/

