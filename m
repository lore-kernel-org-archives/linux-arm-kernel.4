Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D525606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 14:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gH05KFfO;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=hlBYqvSw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=yDy1XcgDWZwINenyHLTABAspaDvRGL9tl++CNqH98OQ=; b=gH05KFfOty0F7kswEqxXC2FeIV
	u9+C5/xK0dekJMQdBRCm2UCQXjr+9kN6qL/Vb7HBST6MMk/UQMEvCGP+YH0qHWJSkHPJ3q+PbCuOH
	E44xSaHxyI4zuSTk3uukYKa4UyWPvemecdqSmpCr/xQKzLJ+g3slBUjXuBV0JgizqHOfObb0heGJQ
	2/2kY5NvlUT1CSZqOhsM1JaKbbc50Ow027wHaXRUxM1YCtBtt3m1PqTTB1tDvnlWLh9Qd6DAPa7Zv
	9BKODhPpZ0/vFcr4tiglZwyGuXqRD8ofQGFrTo9GSdXJotxTWVDHfUaqFdL01d89Nt6ygLC6LTEuL
	XiPeFd/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTKOm-00000006Ber-2JgP;
	Tue, 17 Nov 2026 14:43:04 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTKOj-00000006Bdq-3RoV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 14:43:03 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-5c144eb2f43so6489e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 06:43:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794926579; cv=none;
        d=google.com; s=arc-20260327;
        b=sbnEr4Fsa1aY+ixgstKOyBVHma7/LCCndwxzAY4qhS0+54oSt76WITRiNkWiPHub6e
         YHQvym92gSRbgbxBGtdRRe9gYnt4jBWHyIf3FPKqOvzZh3BgvTm4EvOtQ/c0vkZeCWhI
         rIyRGJQBZ4/YOLRfOkSJHd5mfO67fbT59j7TDF37Yekn5JyD3i10DOpTZqB/DkCx9Xx0
         GXEMOtx/Dm5NBBW+81qgpM0RsvLSU0RfksfToMyIlgbLt/Bce9NlK1oHM52aXiQ6XyOP
         vsV+HVuDD4qY22D2lzEgRu3SvQjPIkJ5X57oBKc9UyqaQD036mcnk/2mda2KUF1WQuLy
         jYxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=yDy1XcgDWZwINenyHLTABAspaDvRGL9tl++CNqH98OQ=;
        fh=ZjvayLIa9MzmTktS5s1reZIGA+C7nfgK+U20RvfeQGU=;
        b=UGvu5YH7BcyI3K+YNGjqF/kBBi8/T7TIIBrwNC4zKmqlVcDo7aK2xGud1gbdaJdeD9
         PlC+ACEgyQ80mOirlVEHNkRTTv5WRZjcD6IO2wexqfJsOlm40kiDOYGAxe1HlcKARlAS
         Q7SBDgBo4+qFlltU+VwXOnAkBa7QKRQlXgEMqASx9EIXEh19CNB0t6xV9RCCukZBLavg
         Y20DIcuadeRnYP9WBdEZKjvFuVA2JyKCpk6/IH1qlhK0ofmCOuJumPWK0pdCTGm9nNI9
         FhwsiNKhcfw574VqCMFpxqIYo1zeUwkuhkvuYJjXtuMXLCrCYyF3PTVGVis54b0cPPbE
         K84A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794926579; x=1795531379; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yDy1XcgDWZwINenyHLTABAspaDvRGL9tl++CNqH98OQ=;
        b=hlBYqvSwjCP8rqzwwiwzHRWS76PIE1F0pvIZvzPQze7pdxct5zntGWp2RFQ6fEukD2
         5yvnTMvj2t0PH3gTEfh6vyiUqJYRGA/zuv0ctwpAzg25P/GytQx8wRgPKIbEGQL4qqU3
         mkXWPLcCFvVltb/p4z3yfW0s4UB/ZHJKjkuB7/vFHmNTp6pYjjRkBc1RjcEP4B+PMo6N
         i8ngX0MFvFGL1u+lByH5CGGQYvk2hJjhkB7pxESdjYaW2nNHP6gi/6t97afHe8Gkht1o
         oMWVtb+vjZ33JOth1oKL7EsIwrzIHoDheFpWOxowVuk1XXCn7G5KuZQy+QEAt3UUMPyb
         hGcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794926579; x=1795531379;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yDy1XcgDWZwINenyHLTABAspaDvRGL9tl++CNqH98OQ=;
        b=gGzR1B1IqJJBWnuZ88IvK5nPyn9IoXfdo6OC5iTzJAR+GAP0Zs61/6fg1QP4S3lLZy
         lO+0NgLK/Zq1h3Zn2ceIP467UpP4UKzkj/xh5ncM+cAttLh+rZI1k/U1xIuUSrFmO/r/
         m5AQeltthY9WG5Nyx4ydVKrjwJFyMzbUDsiVwqFy4wfoOKsd/x47ClVHh6wMY0Qs3tKY
         ZJnlSeU0fDGP0FA2wJvi8+oMmQozGASPY1bgUMonBdw72Plwp8ZpMHb3hzPIHswrsynI
         IP8+jhWDp+nhKRpZhL5hAXRGL0ALdKfLeP2ZiAFMvtBDKCSuWIcDKGag6bKJCyevMAtN
         s4yg==
X-Forwarded-Encrypted: i=1; AL+hErHflTg95+UA8BsFVfTqBHMwk7Shk/BdzCRgo5Ix63NjHMH9MVERbCFZ80YZogAp3DkzD8jQ+Ajh0zDVDj2eZ7Sh@lists.infradead.org
X-Gm-Message-State: APuU4Z+N+iUbwAIOk89fM9MCrPPdWP9s/Un381oijOwoaZR5LflNGk/9
	kRoC6z3Qla29g48iR7WMLEf6Ce1AxSpvYtiHlcnMT09Lj7rJYOUxDiYE0m3g/iKojSDg+osQEEW
	zLKaWtpUvnijfAUqY3aTakTOtP5MqhcvVV21/vNaW3D5bNDVhKcuUlPGJ
X-Gm-Gg: AYBFou1fv6ggKeqDD/fbxLKHS+7/4ZdKK1sKkFikG3UJS9V97QzXGR98NuVfGzjvto0
	oj4bcDB5rI5u95pyVBadrzUUDQMy5T80ggTkDyLLUiUb12aKlGvAP3HiUJ5pvFSHdpMUY1ZxO5q
	yNL7chbdOwAUi9Go63FnaWp/J7kIynaRSId+FTCO4wUqO7PcqhAxw/Pcejqn1ROBs8TrJ3mHw5s
	brbYY+q5o+DG1RMzWxcCoOgtawMA9w1SzYvXrh/MFBszS/HlKuY7uvZnhRdPOeqpGYNpHNVPKAz
	GB7nxgqjRXRUzH0OWZzBp/HJ35R5571pDky8o7w7vHaeeTGQlzf7nX8spOX8liWFHGzrQ1kteJQ
	ZMs46hdaxikt2Affxj1nk/XrY4AWvFHy0PgDsVVsppi+h6vPRxHlhgwHL2B3EevOJG/1XQm4Dgj
	O6PmNmcWnoZtJCaab6OPX+zT+w
X-Received: by 2002:ac2:4e07:0:b0:5bf:f84f:1d74 with SMTP id
 2adb3069b0e04-5c1a2185fadmr144874e87.13.1794926578238; Tue, 17 Nov 2026
 06:42:58 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261116164358.142785-1-steven.price@arm.com> <20261116164358.142785-9-steven.price@arm.com>
In-Reply-To: <20261116164358.142785-9-steven.price@arm.com>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 17 Nov 2026 14:42:22 +0000
X-Gm-Features: AclHuK_cj3TGdQobS2sWbu8813m5UwP4GVfoFkRYcpiUN0Z7bFACWbcVhIVAqkY
Message-ID: <CA+EHjTzAo+5FhtxfX8mQ4t3k5BhatR15UKNSAQw+CRbxJ=wz7A@mail.gmail.com>
Subject: Re: [PATCH v3 08/11] KVM: arm64: CCA: Prevent memslot modifications
 after Realm creation
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
X-CRM114-CacheID: sfid-20261117_064301_915639_E0C1DDAA 
X-CRM114-Status: GOOD (  13.86  )
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

On Mon, 16 Nov 2026 16:43:54 +0000, Steven Price <steven.price@arm.com> wrote:
[...]
> Define kvm_arch_has_private_mem() so generic KVM recognizes Realm VMs
> as supporting private memory.
[...]
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
[...]
> @@ -1611,6 +1611,8 @@ struct kvm *kvm_arch_alloc_vm(void);
>
>  #define kvm_vm_hyp_is_distrusting(kvm)        ((kvm)->arch.vm_flavor >= __VM_DISTRUSTING_HYP)
>
> +#define kvm_arch_has_private_mem(kvm) kvm_vm_is_realm(kvm)

Could the message say that defining the macro makes
gmem_in_place_conversion true for every arm64 VM? One visible change
is that KVM_SET_MEMORY_ATTRIBUTES2 on a non-Realm VM's guest_memfd
returns -EINVAL instead of -ENOTTY.

[...]
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
[...]
> @@ -2887,10 +2903,13 @@ int kvm_arch_prepare_memory_region(struct kvm *kvm,
>                  return 0;
>
>          /*
> -         * Prevent userspace from creating a memory region outside of the IPA
> -         * space addressable by the KVM guest IPA space.
> +         * Realm shared IPAs alias the corresponding private IPAs, so memslots
> +         * must reside entirely in the canonical lower half of the IPA space.
>           */
> -        if ((new->base_gfn + new->npages) > (kvm_phys_size(&kvm->arch.mmu) >> PAGE_SHIFT))
> +        ipa_limit = kvm_phys_size(&kvm->arch.mmu) >> PAGE_SHIFT;
> +        if (kvm_vm_is_realm(kvm))
> +                ipa_limit >>= 1;
> +        if (new->base_gfn + new->npages > ipa_limit)
>                  return -EFAULT;

This check still applies to every VM, so I'd keep the old comment and
add the Realm sentence to it.

Cheers,
/fuad

