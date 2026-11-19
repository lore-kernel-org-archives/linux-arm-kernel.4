Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 669DC606A325
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 14:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KCwaal8S;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=GbdmPxus
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=P2zzf8FFEBL81oIQV+yxC49Gt94XvsXrSt4IwcmCdEQ=; b=KCwaal8SY4totyok7GUZ0qtPh9
	BvojCe3E2dMGuGc2/eb2Dwipt5HZ2/C/ovy0ugMVwm2DzEHCdYEIf7FWG0E4Yu6SVlhi76B8QpIx0
	4g5D0yTNXDiNEpbqHCnMxfCI3mx39t+q+mBbMTCUgPnQyXeKOaq3wbfDxOW1tOp/w72hksgJE6dVx
	p8dEQN4XrCcaHi6vvJjIvrBHNHc+za751OKc27i5wcpAXCIqmtaqQBz+b3IQiJPYy4GhYFKNiVeam
	EYYB2bSfjQL5JtJhVDDmf/4XIgwQQeD4UbwdyS11imY9q1pteFbfr49BvDbnZi91hhBe1VstAo+rY
	5opdQSMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU3Wy-0000000CIew-2fx1;
	Thu, 19 Nov 2026 14:54:32 +0000
Received: from mail-pl1-x645.google.com ([2607:f8b0:4864:20::645])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU3Ww-0000000CIdi-0qE0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 14:54:31 +0000
Received: by mail-pl1-x645.google.com with SMTP id d9443c01a7336-2ee2d612733so8166595ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 06:54:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795100069; x=1795704869; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P2zzf8FFEBL81oIQV+yxC49Gt94XvsXrSt4IwcmCdEQ=;
        b=GbdmPxustHdbY7YcmcJubCXCUTsoAn/zJ0gd8lKW9kN350AwpRBkS7nly0xo7rQ6JV
         kYz9uw3iWo8w+edD/IYdfgoVfxgkql0oaEyqRs0M+OP20RUFjry+Uyjv6sukxIlWxALg
         jkcCSDOyVmE/5Kp4w2GElomPE0nupjq7O+yXXC3ZOAmFXXXzKvfP1zPYV5QvF9e/a7jz
         jlz0uGU303FXeYikS8+O3Gb11FBEl4gwtsVKKZS2hW0CswPaJLe0kR9a3VQ0n5ei0SXZ
         q+o1Ykb9qXJaY0MtHDzEE2Oj68u/r9XeicW2zbORaesSsq4z/+CdSHXmPWCUBlEKWz5v
         SNMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795100069; x=1795704869;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P2zzf8FFEBL81oIQV+yxC49Gt94XvsXrSt4IwcmCdEQ=;
        b=lAOof+in6kS2Bsx5bxHJ7LviDXbZiG5qYrwZ0KehftrnAtqrA6aUQQGUt2lnVfkw8x
         ac8YIekFUH5HeNQbA2ZWQx3snK8TegkoxLRCpGgNqbdjQtk52yEOcbe3+Llpz14UrOJ+
         KxjL9I7baXwXev/09wFm+FoklzcNYCV37MVlUyXho6f/1lHlDra2dBVTUV2OnziYZ1Xt
         aLlsCt8Ca9uRe68X/SmGlNtD5YJd2HhltnUQWo+kvZXQBwELM+jHn7bqBU5U81YSGNeb
         lH/mhJRYEiQ5/MUKgSYNroX2OsZtULRFPgVODMxK6OyPkm2r98RXi1AMVOTQSf16QcoS
         lzKA==
X-Forwarded-Encrypted: i=1; AL+hErFD/O33WxYytL+vVa5y+WBrE4QiidOGFiUoQVb4LEuD8v/uiHIwyBQFMpZduoEa2+Y1tGFv/1VlAdW5P+UhFOQx@lists.infradead.org
X-Gm-Message-State: APuU4Z8GgYWWko/ziqrleAksC7EsESb4kLCnqmNNzF8JSow3vE8V8/yQ
	U7XlpvdFFzhagrXgS1K2Y8Mwi0W3FJYN5cw+u3e3FMuHZZuKo6Pl2jrODHmkdOu6kId63ZmjTO6
	+5ka6HA==
X-Received: from plbkl12.prod.google.com ([2002:a17:903:74c:b0:2ed:4c9b:1bfc])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:e74c:b0:2ef:f2e0:db0
 with SMTP id d9443c01a7336-2f03f18fb43mr715205ad.10.1795100068394; Thu, 19
 Nov 2026 06:54:28 -0800 (PST)
Date: Thu, 19 Nov 2026 06:54:27 -0800
In-Reply-To: <120ad525-efa5-4129-9d97-fa6fa5db747f@arm.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261116164358.142785-1-steven.price@arm.com> <20261116164358.142785-2-steven.price@arm.com>
 <CA+EHjTy5xBmavNWSYPjqU9qXtssV3ZHzsUr1s_4bVOt1GnDLVg@mail.gmail.com>
 <6bb490cd-ebbe-41d7-adf3-d6eaf0e53478@arm.com> <b1ef7241-54b0-4a17-83b6-0008e722f2f6@arm.com>
 <8a095a42-662a-416d-a5d7-79e10161201c@arm.com> <cc27e6a8-6bfa-4c82-92a7-33175baf6803@arm.com>
 <120ad525-efa5-4129-9d97-fa6fa5db747f@arm.com>
Message-ID: <av8No1rvJLXwciId@seanjc-mac.roam.internal>
Subject: Re: [PATCH v3 01/11] KVM: arm64: guest_memfd: Check mmap support when
 preparing memslot
From: Sean Christopherson <seanjc@google.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Steven Price <steven.price@arm.com>, Fuad Tabba <tabba@google.com>, 
	Ackerley Tng <ackerleytng@google.com>, kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
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
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Kohei Enju <enju.kohei@fujitsu.com>
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_065430_238397_B1813388 
X-CRM114-Status: GOOD (  18.80  )
X-Spam-Score: -9.5 (---------)
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
X-Spam-Status: No, score=-13.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 19, 2026, Suzuki K Poulose wrote:
> I see, thanks Steven. For context:
> 
> Arm64 currently (without inplace conversion support) only allows GMEM
> with MMAP flags only and relies on kvm_slot_gmem_only() to detect that
> the GMEM has MMAP flag. But, when we enable inplace conversion,
> we can't reliably reject the slots by kvm_slot_gmem_only(), because
> all GMEM slots are marked GMEM only with inplace conversion.
> 
> Also, from the API Documentation,
> 
> "When the KVM MMU performs a PFN lookup to service a guest fault, the fault
> will always be consumed from guest_memfd, regardless of whether it is a shared
> or a private fault (unless in-place conversion is disabled and the backing
> guest_memfd does not have the GUEST_MEMFD_FLAG_MMAP flag set)."
> 
> So, in effect, with in-place conversion enabled a KVM_CREATE_GUEST_MEMFD
> without GUEST_MEMFD_FLAG_MMAP is an error

It's only an error if (a) the userspace address in the memslot points at the
gmem fd and (b) something in KVM tries to actually GUP the memslot using the
userspace virtual address.

> and thats what this patch is trying to fix in arm64 KVM. The question is:
> 
> 1) Should this be fixed ? How does TDX/SNP support older VMMs with
> inplace conversion ? What was the conclusion on this breakage ?

There is no "breakage".  If userspace doesn't point the userspace address at a
valid VMA, that userspace's problem.  The only thing the early check would do is
prevent weird use cases that may or may not be valid (and for which KVM doesn't
care), and error out earlier if KVM guesses right and userspace really did goof.

> 2) If it should be, then shouldn't it be done in kvm_gmem_create() ?

No.  As above, I don't see any reason to have the check at all.

