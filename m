Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE11F606A88B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 16:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=K6R1I0ok;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=KzcDaEH5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=nVQSkvxSA2D4E7wBBlcWxeerY52SIX8ZzPPc0+UbW0Q=; b=K6R1I0okYrKdo87f3uYXPVh9nj
	Fh5bWRyomlq5im5NXWYDfMwBSSwRvNmnog/lKAUhQpVShnAgAukFG9+vjkaukOLElvF8tgxMaqWki
	ZaddOXf7O30/4gYiKga+b5zKfvWSwvzmtS9JWQ9JgwtLnG+MBN+PJ9h3fzD+6EjElpDBbxNoYJSbL
	jS1pWT6yEVJlkW3SOS6tJIciTE2KoKjC/krkpZOZljStkrGxzUpzV3dN5A3q0vklWa7BDe1Niw5iJ
	f/Gkzi5aIiEL5BvZqvn1WRZNTTym662O/x1W2rIVSMTD8TsYdz3DZSAR4RYt7KhuW70qSR2hDSsTi
	EpTmMWCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTLsi-00000006Ouu-34Js;
	Tue, 17 Nov 2026 16:18:04 +0000
Received: from out-7.mta0.migadu.com ([2001:41d0:1004:224b::7] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTLsf-00000006Os7-2fxX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 16:18:03 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=6gwDumgKWifTcW7wg2iaB3gIO2cxXQFF5pgKIzED2/A=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794932278; v=1; x=1795537078;
 b=KzcDaEH5+3flrPIm5k64eLblgsuju5oiRzzuZqGcQUqXAv1oHmbgaRnnBri2U84f1lC3407V
 tGIDfUWnZcLAtpjHm5Zjz9nWyIprL7koaVEVTZTVaAo4VZN5LA61mtBrfSlTsgZxYBKLf7sgKJs
 WtSvVqmqFNvhg0T9IR8gZCvc=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id b181a18f754880e1;
	Tue, 17 Nov 2026 16:17:57 +0000
X-Mizu-Trace-ID: b181a18f754880e1
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5c14bc5a743so11149e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 08:17:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFKLMrjV4ZaucsLmYgkWUTaiCjZL5wwHVqhy8dApdvw53eXIbTYqbpC0I1NIKLgkUnFZ1d8MSw/Cw59KK2B3dOo@lists.infradead.org
X-Gm-Message-State: APuU4Z/CQbSVlsZLdj1wU20YHUkIFkbzOsQIMJVwUeUjXyw6tIw373Ha
	sUi9gLgP/ui4LpdcvaYg3ij4r5D4ECwQ8zYBI+4yGh5w82u8kY87LHvL7kEjBJ3RFlBlncxTYjc
	48i1M2yZlI74SuHGrz+oO2JlFaTDwKV5CjTsAogRq
X-Received: by 2002:a05:6512:3b93:b0:5c1:5bc5:f373 with SMTP id
 2adb3069b0e04-5c1a21bcf91mr172153e87.15.1794932276673; Tue, 17 Nov 2026
 08:17:56 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261111145758.217946-1-steven.price@arm.com> <20261111145758.217946-12-steven.price@arm.com>
 <c5ebf936-fbc6-4910-be59-9e89ff3a625e@arm.com>
In-Reply-To: <c5ebf936-fbc6-4910-be59-9e89ff3a625e@arm.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 17 Nov 2026 16:17:20 +0000
X-Gmail-Original-Message-ID: <CA+EHjTxz18a-8YcJPu7Vdib5xo4bLV-2CedLJxzh+76KuWG0YQ@mail.gmail.com>
X-Gm-Features: AclHuK9hGzky46Uw9aIIH7RYxIzDHZDA5jw0n1Qmc2z6Ij7OwGUMvY7c8hZrsUo
Message-ID: <CA+EHjTxz18a-8YcJPu7Vdib5xo4bLV-2CedLJxzh+76KuWG0YQ@mail.gmail.com>
Subject: Re: [PATCH v2 11/12] KVM: arm64: CCA: Support runtime faulting of memory
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
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Kohei Enju <enju.kohei@fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_081802_069000_8C2CBDBD 
X-CRM114-Status: GOOD (  20.41  )
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

Hi Suzuki,

(sorry for the resend, my email client mangled the first one)

On Mon, 16 Nov 2026 18:36:29 +0000, Suzuki K Poulose
<suzuki.poulose@arm.com> wrote:
> On 11/11/2026 14:57, Steven Price wrote:
[...]
> > diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
[...]
> > @@ -1791,12 +1799,18 @@ static int gmem_abort(const struct kvm_s2_fault_desc *s2fd,
> >           void *memcache = NULL;
> >           gfn_t canonical_gfn;
> >           int ret;
> > +        bool is_private = false;
> >
> > -        if (!perm_fault) {
> > +        if (KVM_BUG_ON(!kvm_slot_has_gmem(s2fd->memslot), kvm))
> > +                return -EINVAL;
> > +
> > +        if (!perm_fault || kvm_arch_has_private_mem(kvm)) {
>
> should this be s/kvm_arch_has_private_mem/kvm_vm_is_realm ? I dont think
> this would be required for pKVM yet ?
>
> Also, I wonder why pKVM doesnt need mmu cache pages with permission
> faults with gmem. They do for user_mem_abort().
> (may be because they assume Gmem is always single page ? in which case
> we could also have the same behavior)

gmem_abort() only maps single pages, so a permission fault there just
relaxes permissions and doesn't use the memcache. In user_mem_abort(),
a pKVM permission fault can map a block, and that uses the memcache.
So yes, the top-up on a permission fault here is only for Realms.

[...]
> > @@ -1817,13 +1831,35 @@ static int gmem_abort(const struct kvm_s2_fault_desc *s2fd,
> >           /* Pairs with the smp_wmb() in kvm_mmu_invalidate_end(). */
> >           smp_rmb();
> >
> > +        if (kvm_arch_has_private_mem(kvm)) {
>
> --8>--
>
> > +                switch (kvm->arch.vm_flavor) {
> > +                case VM_REALM:
> > +                        is_private = kvm_realm_is_private_address(&kvm->arch.realm,
> > +                                                                  s2fd->fault_ipa);
>
> Could we for now use
>                 is_private = private_ipa_fault(kvm, s2fd->fault_ipa);
>
> In other words use a wrapper for detecting if a given ipa is private or
> not ? May be something like:        kvm_ipa_is_private(kvm, ipa)? (choose ipa
> to make it explicit, it is arm64 thing).
>
> Where, pKVM could hook in its own check.
I'd keep the switch. pKVM can add its own case when it uses this path.

Cheers,
/fuad

