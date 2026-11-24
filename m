Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A1EA606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 22:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cE4/2HNt;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=aacrkhKa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=oIkNeebV3bBNTky3/G9aQsRRQo/i+uLeVgZIMqhznFQ=; b=cE4/2HNt2grzhotN0L3343LMJ/
	Da7djl7ALmPUH4dSt9jd2fr4v8hbXTeSOziWltnhhErnwqek/EB/LIJMiRTl4yFP1/6hebIW+tg7/
	WvA993ogvoDIXASPi1uBJkM+5ss+GHQ11BNVr+epv5tuJb5AkUIz1Ll1KKgeURecatc4t1RIsSwHI
	gvGPrGSBBxchPcQMHgKWNEYzwj0u7EbyjsReIn1kk9KaiTY1eGm17WCDZ9hQOfJACrkLwO2XwMpSN
	zLczwhPmmo12R2PPH0AajUPV/YqJmWo9q2/hqt9i6ttZpUikAjUrbBVb5zMIq94tBDGbIzxNyMO3X
	n0LaO0RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVyoJ-00000007yaD-0rl8;
	Tue, 24 Nov 2026 22:16:23 +0000
Received: from mail-ot1-x346.google.com ([2607:f8b0:4864:20::346])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVyoG-00000007yZo-00bb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 22:16:21 +0000
Received: by mail-ot1-x346.google.com with SMTP id 46e09a7af769-862b952fb06so3890329a34.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 14:16:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795558578; x=1796163378; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oIkNeebV3bBNTky3/G9aQsRRQo/i+uLeVgZIMqhznFQ=;
        b=aacrkhKa0NE6EwTMnjzoNUQCaSMlwFPPyu1wqjCZbePlPmheOAwAxPGLBcQ9FxS00s
         CVzSXwTpdTswOOx3ipNajqNOOAvZO+9i94fhWtcubENX6qPmX2Ht+OVfz2WJG4ZmjwOG
         OXM7skGuMabGHqaxHJy0jYhJ47azmOaC1OuzyJu2+tCv+z80gMLeLHpSRpDTNCg641Ah
         46mr7kbWFn+b1j50h04bEnm7KGbc2JqUHEzSbVHmHSoP/0bB/ezyZA07dGC4r+L8/p1H
         DjA9TUTrx7gUVyXJ7+aQuPoIQB5jYyx7iNYCdWuO6bBzyjcng84O+waW+ve10fyKu3wq
         WGCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795558578; x=1796163378;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oIkNeebV3bBNTky3/G9aQsRRQo/i+uLeVgZIMqhznFQ=;
        b=FpZDOGAyYgO0iNkkU464H6kd4XgFQzxkT+JZHi8xeAQwe7yjrFCHWr6mbFNVq61c9d
         4NA8PTGHeLAj5h9y5qGPumTuYv/MzL7BLw1p4gnno0CjXcELf7h7gUlmr+jEDSKISSXd
         ts+JIPV39S1NruBzHQE2lOKNn2BoDSvRJTmBO9InAoGa/O7Lc7R2RO5G+Mk3ve9YyJnI
         kBgxN478cpD5lFzsz+qORJxs70sqSsSFpypypy7joWOnA6ykjnSeH2owrdoPV0s4gZtt
         +glPMOxgSG8isNe1vs45i/BWQP9kVbwh0L6c4lA1s1WEc9UHyrL/H2GyMvYNZhh3EOz6
         jLfw==
X-Forwarded-Encrypted: i=1; AL+hErFgY1yWg0sB0WnLRdHi6vA+XYIS6eCtiz/i3noRtIDt9LmfFKyO3+lrarw4UXpLYI0i7HWVGxo95G2x+p/wCoRX@lists.infradead.org
X-Gm-Message-State: APuU4Z+SDHy2ikpmeX/XGPPpzOr6CSRrjBQd6AKqvO6E9jCMazcqraGm
	jJsQjyGAu1+rXJtt0Rzc00GkpB/euULhb3k+ywCb+OsQiJxo8QJpuw9TTNhG6zkg1OJME0mJ7xD
	k4fYcTehbPWHNmRzV6lSIklCliQ==
X-Received: from jaaq28.prod.google.com ([2002:a05:6638:c01c:b0:61d:1a3b:cb30])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:180e:b0:572:61c7:bee2 with SMTP id 5614622812f47-57a06a1a79bmr18783520b6e.1.1795558577535;
 Tue, 24 Nov 2026 14:16:17 -0800 (PST)
Date: Tue, 24 Nov 2026 22:16:16 +0000
In-Reply-To: <87a4my7yhg.wl-maz@kernel.org>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261123232647.3733149-1-coltonlewis@google.com>
 <20261123232647.3733149-2-coltonlewis@google.com> <867bi2z87n.wl-maz@kernel.org>
 <20261124202215.3731849-1-coltonlewis@google.com> <87a4my7yhg.wl-maz@kernel.org>
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
Message-ID: <20261124221616.4155034-1-coltonlewis@google.com>
Subject: Re: [PATCH v2 1/2] KVM: arm64: nv: Discard undersized TTL hints in compute_tlb_inval_range()
From: Colton Lewis <coltonlewis@google.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Fuad Tabba <fuad.tabba@linux.dev>, Steffen Eiden <seiden@linux.ibm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Wei-Lin Chang <weilin.chang@arm.com>, 
	Dan Carpenter <dan@pereq.eu>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_141620_053725_4B34DA14 
X-CRM114-Status: GOOD (  16.56  )
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
X-Spam-Status: No, score=-16.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT,USER_IN_DEF_DKIM_WL autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 24 Nov 2026 20:42:19 +0000, Marc Zyngier <maz@kernel.org> wrote:
> On Tue, 24 Nov 2026 20:22:15 +0000,
> Colton Lewis <coltonlewis@google.com> wrote:
> > [1] only catches TTL hints smaller than host PAGE_SIZE. It does not
> > catch a hint that is >= PAGE_SIZE but smaller than the mapped block,
> > such as a 4kB L3 hint on a 2MB block on a 4kB host.
>
> Why do you think this makes *any* difference? The hint passed by the
> guest is utter bollocks, and the best thing would be to not invalidate
> anything. It's just too invasive to do elegantly.

Architecturally [1] is fine for the TLB, and before guest_s2_mappings
landed in v7.4-rc1 clearing the block was harmless. The problem with [1]
is a host memory leak in kvm_pgtable_stage2_unmap_tracked():

1. L2 faults in a 2MB block. kvm_s2_fault_map() installs a 2MB block PTE
   and kvm_record_guest_s2_mapping() inserts a 2MB
   struct kvm_guest_s2_mapping into both interval trees.
2. L1 runs TLBI IPAS2E1IS with a 4kB L3 TTL hint (4kB == PAGE_SIZE, so
   [1] returns 4kB).
3. kvm_pgtable_stage2_unmap(..., SZ_4K) clears the entire 2MB block PTE.
4. kvm_remove_guest_s2_mappings(..., SZ_4K) skips removing the 2MB entry
   because a 4kB range does not enclose it.
5. L2 touches the address again, faults because the PTE was cleared, and
   allocates another 2MB tracking entry.

Looping steps 2-5 lets an L1 guest leak one struct kvm_guest_s2_mapping
per iteration until a larger unmap or VM teardown (I measured 832kB of
slab_unreclaimable growth over 8192 iterations) and turns later TLBIs on
that range into linear walks under write_lock(&kvm->mmu_lock). Patch 2
avoids exact duplicates for the same (nested, canonical) pair, but
remapping the nested IPA to different canonical IPAs still leaves each
stale entry behind.

If you prefer not to touch compute_tlb_inval_range() beyond [1], another
option is keeping [1] as-is and dropping the cleared tracking entry in
kvm_remove_guest_s2_mappings() when a partial overlap leaves no valid
mapping beneath it (zero cost on valid hints).

