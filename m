Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8068F606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 00:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EqOxeO9M;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=oyDQ+Din
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:MIME-Version:References:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=rntaW4qP7qUm/rpCDs8AkAc3u/q2bwtFH1Dwu9ED+9M=; b=EqOxeO9MHJfzuEd7SpwolsQwth
	vmjC1FmOdR1NCNZHxcgRPXF4sZxNb6TTGT3vNBUIWTWAdxkBnkRvZx3VMt/pYRhZZDl0Xr4CBEqCm
	3oHiHYtAYgalSd4q3Z2o2H99Fngbo8Mgc+BDuMudvAdch53DawmXT7xpnnGhxSqocrZwdVY9BF3Cq
	rd9cWkoXdArjlblTxJ2PdY5uDIGigHtqnnugRO8Cs0GB2gXPw7WYHQ6hFdUaVYh0TkDYMVOsuwN6J
	BkB5pRVvgEPaAiADz7tDwVCObMDnHN+Wc3j06JTW0KbZfN/71ckKfwYO72B2tKempKuEqYH21ztux
	H+ALPVFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW0aA-0000000884m-1jp8;
	Wed, 25 Nov 2026 00:09:54 +0000
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW0Zy-0000000881C-3Haq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 00:09:44 +0000
Received: by mail-qv1-xf34.google.com with SMTP id 6a1803df08f44-921375f52b8so55279946d6.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 16:09:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795565380; cv=none;
        d=google.com; s=arc-20260327;
        b=GL5qy7/TJASTgtbR+AneM5GeHsYA4DcpZffvqQPYKMgNxTqROEt7J3CGCjJirIaQbs
         wWQ2s0t4STmLFL9es0jhNk0Jgwz4fGxgO3zk0t1G1XshQk0VNnkWfjZDn84KsuVPqtx7
         bJ6B0xm0Ie6rgRK0q8rhurMBxJaq08UJAURVsCgS4XnXIXWRoCnnNqtF7048d3dMfpRz
         AxuLCCb35WrB4OGFnaGmLiTcjATjyoy0+PYYudKhukufYXuYwHm2kIaxXbHXEand/Aph
         Ft7Te6yLG8wN4+Rv3kHwlgqBsN0aTt/PHunqBvBvq9wTc1ec3gAFO2FR5dAU2rDtO9Tf
         LYRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=rntaW4qP7qUm/rpCDs8AkAc3u/q2bwtFH1Dwu9ED+9M=;
        fh=tXQgtosgt8Z7ePX7fRysOoFL9Y7hiodpvCc1mJBVN5I=;
        b=C6NE4JUoabbvPswUg+/aRaxnQi2Fn5d39rcTJWEdmBhdaefetOeCnS5iZ9zzpHsZOI
         ggKzRulH8/vIOK1V3MiZHkUa9vSALisbCvoEVWcnQmhT1QV8/qYvwsnYSAxodbN5HrDu
         277iSx+57VxNrCpMsYK62LbWOlzHJa25urCNADL2xY4YlhZeKXACJnnClD7zxsr8mEh7
         KFCiKXfd3jKwNQg77w06ZvkhApTxbrhRKTWRsVtZBBLyBzar1d/2IZkdW8LTqq7iwHYf
         DazhLZGmuFbBQMklBlKw7/OIbprggmLCw+N0tMot1U8coOVVtUwFt08ZCy1XrzcYSgzL
         RsGw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795565380; x=1796170180; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rntaW4qP7qUm/rpCDs8AkAc3u/q2bwtFH1Dwu9ED+9M=;
        b=oyDQ+DinVaJ76D1WSgf2QeOMGav57wN0Om1T7UwIC3sQFimyJN9HV3jjQjow++Itwx
         OqxcSP9EGSmSmijy7hGnYJOMNn/vMfPFQAboC9mjHwL+eAwqyRfldt2KnYcWfM4FhWVS
         lrriz/NQexJklJlNcHF0+hf7pAJm6h0qpNRnLs4/T9+PcDzoX0vzeL4cFa9rQhXDMKvv
         xyZXzX5x4HA+dkI395WP8ULUJhbKoYAKBvE8RQSTCGax2Zor7YlwA8oz6jOA3+kA8Fcf
         ipE6FIbWEtFyeUGr/mDek3FzDFGqOCHz2DTs8Y7iIiTt74O826JrbXUFtHeMe8hSdw6X
         Bdvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795565380; x=1796170180;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rntaW4qP7qUm/rpCDs8AkAc3u/q2bwtFH1Dwu9ED+9M=;
        b=XaNzPU7sEyjk1H1YVWAAzZGWHdOTLk6vpodeMhfVk+p1BdVQtd1l2RFLDDyQ4Xy9AO
         lEOCzu+R9uz5/bZ676zj44+7XnBL+/yKpneCu/wHrrqQbnRvGWirG+A6xoSY+Jqywylt
         99CXmn2OU7hwh3KQC0/S/wMF4lohh84AIv+wmfvnm2QGB0EC9cMB5R40fsL6vhfkj0Kb
         LWjRi4mudxNqjRkNFZDgttpuAPagABYZHEHT/wsJmQuB0MoTyisElWFs1LSd+SCJjBj+
         yPlrg/27sN5fA137R7K6WFJCLx71QzkXHsOQYVbuSAQgCQSOaSB8alOsecuL1MtcVWrj
         mXTQ==
X-Forwarded-Encrypted: i=1; AL+hErHdAVvpu3+OI67NQfv2YS79hQ3pK8YDIU5OWUU87XSM7JYfnkKURxVgQEFTVDQbI52f1BCtDdgxaq08Hz4HfUGX@lists.infradead.org
X-Gm-Message-State: APuU4Z+hIN9s8Sdht0ol9WWvoivqwoYAgzQ+N12VCBFBACzHVroFcZsM
	QdbJLIXvj7hsxzXcS1+q2VbUJcPNGGEDiWF0W95DS9L88VMSukDKL/BDAyGs67CRrAnxJgQne4E
	hJTvsy6yfUECLbu4YBWZtmPQ09muWUpNPK27m76p9
X-Gm-Gg: AZFdTZdblK5LHDZacRcmK8gDMoyOM+ILgxhJ3H0jaUZHQkGCUvDvv42RSBtJRBl0iOL
	+/gzsO550+CfeTlBVLNoBoXFgeV11aYh6GDfriTNDb7QVbL+WeSJIrIgNIc7byqw8XxuNFQTiui
	lUkBNv+g41upjXaiGXvJ1qvFq/mn3lybxgaKwQX23STNSwk5S4iMMZrWjaWsg+ZNiMHU/017PqB
	2Ugy/FlFIsbnMffjoMcd94rY2j3W/jRQaD6gywc/P78YOnslYHFZwAcm0fNr0QBvaTa071DUTMC
	o1AyPbcUBNxhJxj/zLkea05kmDKaMolGkRpVlnul5H8wlmZzTBSeL8dBA2UFBQ9QDQuYGLuwfu5
	C/udmiejZ1w9fMaKylIxY01Px5KFXWWi8jtfoSpo1ibiH6eFvo+nzwFgvNdO5ejoN5ZHa5pbh0F
	zCiBNyiT/VWpemJWAMjlu2anI=
X-Received: by 2002:a05:6214:3c9d:b0:91c:9316:f4e8 with SMTP id
 6a1803df08f44-92134baab8amr275174306d6.54.1795565379417; Tue, 24 Nov 2026
 16:09:39 -0800 (PST)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 24 Nov 2026 16:09:38 -0800
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20261123104233.95710-10-steven.price@arm.com>
References: <20261123104233.95710-1-steven.price@arm.com> <20261123104233.95710-10-steven.price@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Tue, 24 Nov 2026 16:09:38 -0800
X-Gm-Features: Aa3M54oNKjHnmwhcyDiHaoxz_zNMiDJBoB2YChnt0u_TPYjP0NAb6dZlL994CUs
Message-ID: <CAEvNRgFQ5BXqU3KfPFT8bfZTW=RyvBw25z3GZtr3JA=Wv3Yqfw@mail.gmail.com>
Subject: Re: [PATCH v4 09/11] KVM: arm64: CCA: Prevent memslot modifications
 after Realm creation
To: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org, kvmarm@lists.linux.dev
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>, 
	Oliver Upton <oliver.upton@linux.dev>, Zenghui Yu <yuzenghui@huawei.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Joey Gouly <joey.gouly@arm.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Christoffer Dall <christoffer.dall@arm.com>, Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev, 
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, Gavin Shan <gshan@redhat.com>, 
	Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun <alpergun@google.com>, 
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Emi Kisanuki <fj0570is@fujitsu.com>, 
	Vishal Annapurve <vannapurve@google.com>, WeiLin.Chang@arm.com, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Kohei Enju <enju.kohei@fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_160942_848682_0090426C 
X-CRM114-Status: GOOD (  30.47  )
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
X-Spam-Status: No, score=-23.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Steven Price <steven.price@arm.com> writes:

> From: Suzuki K Poulose <suzuki.poulose@arm.com>
>
> Once the Realm is created, prevent changes to guest_memfd backed
> memslots, which can provide private memory. Validate these changes
> before KVM invalidates the old memslot, so a rejected deletion leaves
> its stage-2 mappings intact. Realm stage-2 faults will also validate
> the private memory backing in a later commit.
>
> Require Realm memslots to lie in the lower half of the IPA space, as the
> upper, shared half aliases the lower, protected half.
>
> Define kvm_arch_has_private_mem() so generic KVM recognizes Realm VMs
> as supporting private memory. Defining the macro also makes
> gmem_in_place_conversion true for every arm64 VM, so guest_memfd
> memslots are marked gmem-only even for non-Realm VMs. A well-formed
> KVM_SET_MEMORY_ATTRIBUTES2 request on a non-Realm guest_memfd now
> reaches the VM check and returns -EINVAL instead of -ENOTTY.
>
> Additionally, similar to pKVM, do not support dirty logging or
> read-only memslots.
>

Imo this could be split into a few patches

1. Add the constraints wrt realm memslots and being in the lower half of
   the IPA space
2. Defining arm's support for private mem
3. Imposing rules on memslot changes
4. Maybe some others, maybe I'm misunderstanding the patch

> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Steven Price <steven.price@arm.com>
>
> ---
> Changes since v3:
> - Explain the arm64-wide in-place conversion effect and keep the
>   general IPA limit comment.
>
> Changes since v1:
> - Preserve private mappings if KVM invalidates a Realm guest_memfd
>   slot before the prepare hook rejects its deletion.
> ---
>  arch/arm64/include/asm/kvm_host.h |  2 ++
>  arch/arm64/kvm/mmu.c              | 37 ++++++++++++++++++++++++-------
>  2 files changed, 31 insertions(+), 8 deletions(-)
>
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index 3ddeddfacd06..55673d08e3eb 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -1607,6 +1607,8 @@ struct kvm *kvm_arch_alloc_vm(void);
>
>  #define kvm_vm_is_realm(kvm)		((kvm)->arch.vm_flavor == VM_REALM)
>
> +#define kvm_arch_has_private_mem(kvm) kvm_vm_is_realm(kvm)
> +
>  #define kvm_has_mte(kvm)					\
>  	(system_supports_mte() &&				\
>  	 test_bit(KVM_ARCH_FLAG_MTE_ENABLED, &(kvm)->arch.flags))
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index 800333a345cd..9af5fe6d87f0 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -2861,17 +2861,32 @@ int kvm_arch_validate_memory_region(struct kvm *kvm,
>  {
>  	lockdep_assert_held(&kvm->slots_lock);
>
> -	if (kvm_vm_is_protected(kvm)) {
> +	if (kvm_vm_is_protected(kvm) && new &&
> +	    (new->flags & (KVM_MEM_LOG_DIRTY_PAGES | KVM_MEM_READONLY)))
> +		return -EPERM;

gmem is already generically mutually exclusive with
KVM_MEM_LOG_DIRTY_PAGES and KVM_MEM_READONLY, so before this change,
pKVM is saying no to KVM_MEM_LOG_DIRTY_PAGES and KVM_MEM_READONLY for
all memslots, gmem or not, so this check makes sense.

> +
> +	switch (kvm->arch.vm_flavor) {
> +	case VM_PROTECTED_PKVM:
>  		/* Cannot modify memslots once a pVM has run. */
>  		if (pkvm_hyp_vm_is_created(kvm) &&
> -		    (change == KVM_MR_DELETE || change == KVM_MR_MOVE)) {
> +		    (change == KVM_MR_DELETE || change == KVM_MR_MOVE))
>  			return -EPERM;
> -		}
> +		break;

Not sure why pKVM doesn't allow deleting a memslot after the vm is
created, but this is no change from before this patch, the removal of {}
here is mixed in with the other changes in this patch.

> +	case VM_REALM:
> +		/*
> +		 * Once the Realm is created, we cannot modify any slots that
> +		 * could be providing private memory. i.e., guest_memfd backed
> +		 * slots.
> +		 * TODO: Handle trusted device private memory slots
> +		 */
> +		if (!kvm_realm_is_created(kvm))
> +			break;
>
> -		if (new &&
> -		    new->flags & (KVM_MEM_LOG_DIRTY_PAGES | KVM_MEM_READONLY)) {
> +		if (kvm_slot_has_gmem(old) || kvm_slot_has_gmem(new))
>  			return -EPERM;
> -		}
> +		break;

Imo this should be written the same way as the pKVM branch for clarity,
like

if (kvm_realm_is_created() &&
    (kvm_slot_has_gmem(old) || kvm_slot_has_gmem(new)))
        return -EPERM;

but that aside,

1. Why block creating memslots after realm is created?

Does ARM CCA have no way to add pages after a VM starts? This isn't
blocked for TDX and SNP so I think this constraint seems unnecessary.

2. Why block deleting memslots after realm is created?

This also seems like an artificial constraint, and it constrains the way
the userspace VMM operates when stopping a VM, like the memslots can't
be removed ever, the VM just has to be closed? (something like that)

> +	default:
> +		break;
>  	}
>
>  	return 0;
> @@ -2883,6 +2898,7 @@ int kvm_arch_prepare_memory_region(struct kvm *kvm,
>  				   enum kvm_mr_change change)
>  {
>  	hva_t hva, reg_end;
> +	gfn_t ipa_limit;
>  	int ret = 0;
>
>  	if (change != KVM_MR_CREATE && change != KVM_MR_MOVE &&
> @@ -2891,9 +2907,14 @@ int kvm_arch_prepare_memory_region(struct kvm *kvm,
>
>  	/*
>  	 * Prevent userspace from creating a memory region outside of the IPA
> -	 * space addressable by the KVM guest IPA space.
> +	 * space addressable by the KVM guest IPA space. Realm shared IPAs alias
> +	 * the corresponding private IPAs, so Realm memslots must reside entirely
> +	 * in the lower half of that space.
>  	 */
> -	if ((new->base_gfn + new->npages) > (kvm_phys_size(&kvm->arch.mmu) >> PAGE_SHIFT))
> +	ipa_limit = kvm_phys_size(&kvm->arch.mmu) >> PAGE_SHIFT;
> +	if (kvm_vm_is_realm(kvm))
> +		ipa_limit >>= 1;
> +	if (new->base_gfn + new->npages > ipa_limit)
>  		return -EFAULT;
>
>  	/*
> --
> 2.43.0

