Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16C6E606A325
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 23:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3U5AbddV;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=pzZ26KWK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=KaufFdBJJM6uHUO0RxAk0mis1hBr3eWXheXkcNAnmWQ=; b=3U5AbddV6lT6Xr3Z727KlTKvOu
	dAQcau79FxPxlcd2mw2PD1s9BW19QgWWgiTHWs0vrregt1wTIH4iv7bLYdBim7avo4R3W7jmbYv79
	2n/TsAU8bOi4ZRGwVnyBJRcDaVcO27IjGP9kqFgmhvqrDy0oRYc8h1l5kxR/daRzM2N4BceoiGiK7
	c3z8NGj6kPJ3Onvs6FW73q92DxIspvyD2njPgEmzzQLsf3hq9u43PHjCUzxBiIG5MByXBeEEY8I3j
	Yc7AgFJxpgLYZ5liiZkhb4UMT+nxjYF22qX4NLRQYObHOcHTwJq2IyR9z/IKGemp1G24i1e7ZxO+A
	vwDBA2SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUXri-0000000GPAG-2IKf;
	Fri, 20 Nov 2026 23:17:58 +0000
Received: from mail-oi1-x245.google.com ([2607:f8b0:4864:20::245])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUXrg-0000000GP9q-1TTc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 23:17:58 +0000
Received: by mail-oi1-x245.google.com with SMTP id 5614622812f47-571bc0b66d7so1515431b6e.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 15:17:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795216674; x=1795821474; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KaufFdBJJM6uHUO0RxAk0mis1hBr3eWXheXkcNAnmWQ=;
        b=pzZ26KWKddorQKNo/4f3V60b5w2IO0r01H5DZaixo+Em4LRq+oGD5qUwMtsH9I4Gzu
         5/4hQczo8sGE1XejoYqQwVxsoch+8kpanH3lfBToYZgzX6LkWpKCNn6oTGHuNyynlDA2
         a+SOIcp8SzoNrK3XFcJz3xbYtdBrZUaon2B5+ovVbXVL21lk6e+w99dlb+8QyYXusQRl
         xteeAwPOGTEuXG1K32jZvrLAKd4W4W8qm6lvlyRVcYdw2ilE2GbqJ+Hl32jgaOrJJu68
         NNYpkWLhMgFaR7ARDweyo7so1kpVc5837APHGiIdFBfOEicgHFRzEus1GNRqA7lVC0ZV
         WwLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795216674; x=1795821474;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KaufFdBJJM6uHUO0RxAk0mis1hBr3eWXheXkcNAnmWQ=;
        b=pGEoUOIUttoh9/jO8hT8AjJgJaDG44vj3PojiZ29ecULmQ0r+SWDzsIeGySfqLbUXc
         BBCxgbymWhT1WXaUYZQsM1YYe1DAtZ9V0F6yncxgznnQaJypoRFJYdRE2veVUYZMk6np
         QaBP3HN4HZeUs8QL+bhNZTrDsnt4FOZkaocI9MJUB/Bl3XogpBdLqhSXyw4lpg63/w8E
         quzgX+1XzeV1yUeWmg8aMyzwkswOWajyeOSOZuPsT8J5YLK7sSj1ZWwoMo8gHT0gbPP9
         LziPmYSVto4V8nKUb8/i1EUsU1HWY6Tm76iBdn40z6hgMbE+vEkagSpeBQHEkAyC3vgF
         QJaw==
X-Forwarded-Encrypted: i=1; AL+hErFHb+WEy88GxnkMeMPt0xhKrXjFwJaOtvQ9+BG4XZknKFjxsDmv1y8OrTAf1rZHyhhG9mG2rX6BXNgz8wHPlhjK@lists.infradead.org
X-Gm-Message-State: APuU4Z9cr++OYnIGJGWDmbOHA8duKtO30IYMiw5GDwPnYZFEgJKdaFfu
	X9nNedYkZcgzDzCQ/+0tuA5bMA+HZa8IHo8qd2kGsz7URW2J0k2LXVq3Jr+rt65jovHpRnFiIFO
	1sdnM6wJvNFLyMm0Z/iSPiuqGTQ==
X-Received: from ilb26-n2.prod.google.com ([2002:a05:6e02:531a:20b0:53d:d5c4:1e46])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:c12b:b0:572:86c8:6b4c with SMTP id 5614622812f47-57a07d19c74mr5405322b6e.6.1795216674015;
 Fri, 20 Nov 2026 15:17:54 -0800 (PST)
Date: Fri, 20 Nov 2026 23:17:53 +0000
In-Reply-To: <iyfa5sagkdapb4plle575uhbxbmjdcxvbe35nnlxkqzfqnztqd@mmweqvqmil6x>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261119185105.626343-1-coltonlewis@google.com> <iyfa5sagkdapb4plle575uhbxbmjdcxvbe35nnlxkqzfqnztqd@mmweqvqmil6x>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261120231753.1170879-1-coltonlewis@google.com>
Subject: Re: [PATCH] KVM: arm64: nv: Fix guest stage-2 mapping leak on
 sub-block unmap
From: Colton Lewis <coltonlewis@google.com>
To: Wei-Lin Chang <weilin.chang@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Fuad Tabba <fuad.tabba@linux.dev>, Steffen Eiden <seiden@linux.ibm.com>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_151756_753775_7082C32C 
X-CRM114-Status: GOOD (  22.70  )
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

On Fri, 20 Nov 2026 06:35:12 +0000, Wei-Lin Chang <weilin.chang@arm.com> wrote:
> > result, every sub-block invalidation followed by a re-fault leaks a
>
> Doesn't the block tracking node get leaked regardless of whether a
> re-fault happens?

Yes, the stale entry is left behind on the first TLBI. Re-faulting is
just what lets L1 accumulate additional entries.

> For this third paragraph can you improve it by stating how the problem
> is fixed upfront? The first two paragraphs describe the problem, then
> you started to talk about stage2_unmap_walker all of a sudden (which I'm
> not sure how much it helps), and the fix itself is not emphasised. The
> combination makes it pretty difficult to get what the patch is doing.

Agreed, the commit message was unclear. In v2 I will drop the
kvm_remove_guest_s2_mappings() approach in favor of ignoring TLBI
IPAS2E1 when the guest-supplied TTL is smaller than the mapped granule
(as Marc suggested), and rewrite the commit messages to be shorter and
clearer.

> > In addition, suppress exact-match duplicate insertions in
> > kvm_record_guest_s2_mapping() when concurrent faults or -EAGAIN retries
> > record an identical (nested, canonical) range on the same shadow MMU.
>
> I believe this is better split into its own patch, it's doing another
> thing.

Makes sense. I will split it into a separate patch in v2.

> > Fixes: 5491980c1a41 ("KVM: arm64: nv: Track guest stage-2 mapping removal")
> > Fixes: c2778d14cd2f ("KVM: arm64: nv: Track guest stage-2 mapping creation")
>
> Since there isn't a real bug in the original implementation do we need
> these tags?

Good point. I will drop the Fixes tag on the duplicate-avoidance patch
and point the TTL patch at the commit that added FEAT_TTL handling
instead.

> > +	scoped_guard(spinlock, &kvm->arch.guest_s2_tracking_lock) {
> > +		if (!guest_s2_mapping_exists(mmu, mapping)) {
> > +			interval_tree_insert(&mapping->nested,
> > +					     &mmu->guest_s2_mappings);
> > +			interval_tree_insert(&mapping->canonical,
> > +					     &kvm->arch.mmu.guest_s2_mappings);
> > +			mapping = NULL;
> > +		}
> > +	}
> > +
> > +	kfree(mapping);
>
> In my understanding kfree() can be called while holding locks, so we
> don't need the extra level of indentation.

Yes, kfree() is safe under the spinlock. I will keep guard(spinlock)
and call kfree() directly there.

