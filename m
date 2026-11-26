Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8B2C606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 11:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kJO6Ev7y;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K6Tg0r3X
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=SQ9Dk6hIAYospo25vS7eUsQ5PcRuSfCG/o49Uj2yEW0=; b=kJO6Ev7yjJzkfFNiXjAm2jQ/Yr
	jNoXklb2+WKaLQphM2183zAjqsuh5KuKcxHGnOGxWBwF1/qXU/53zuUvfbmedwWiIQ/prPzwj8Ipi
	ywPCB2Yv3Lk3o8WKD3Egw1Igji7sje3Ej30bvgNjOTUkNxB6mVtbJtvXO0n9YBn6MDSmyCJtnbmGg
	Xo3x/fN9p+ogw/cqZO6zl8jEO+AceRVKWM4A+OvmR/IglLLeMFmkoiipl13ag25x4kb/IbMM/nysg
	eBpCX4I9LeDUK2VDmNEWBSXsyFT12He6IYqcLr6KGwCj3WBxthnfjkggP4qcFOE9Kyndg1zj7zURz
	YWciyqAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWXsA-0000000D2el-1pEp;
	Thu, 26 Nov 2026 11:42:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWXs9-0000000D2eG-0Ygp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 11:42:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6276240C53;
	Thu, 26 Nov 2026 11:42:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80C711F000CA;
	Thu, 26 Nov 2026 11:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795693359;
	bh=SQ9Dk6hIAYospo25vS7eUsQ5PcRuSfCG/o49Uj2yEW0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=K6Tg0r3XiLLbVSA7Tt8Sye2tdushWj2CrKYZLrBP/cWphM4PnleANEOBBxmWox4Ua
	 mlqUDZ3v2qyHg7ebPrl8EF6rWOAaDTQcxFD0aisFYfg3bK1pXyWCu+Dp3IsVn2VJLS
	 5VPf/l8spPBHkDC/qiOr3Uviwk1b/iu6S/LOEk6L0VFMLTBLkqe2WrYYQxYbY/e+Oh
	 V/yWhbdAejyx7nxHGnNItaOvpTJBYzTPezssMzOyMo6E8QhgsTVrX/pRyIWMPiuLHQ
	 rnEJXVhhayaYDvzs+qn3+Rx8kKgyFXuYbcNoxoVYej/44NdvlV/atQVwkOk9SkKczV
	 NGCN5p7djeDFw==
Date: Thu, 26 Nov 2026 13:42:32 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Adrian =?utf-8?Q?Barna=C5=9B?= <abarnas@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, David Hildenbrand <david@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>, Christoph Lameter <cl@gentwo.org>,
	Yang Shi <yang@os.amperecomputing.com>,
	Brendan Jackman <jackmanb@google.com>,
	Ryan Roberts <ryan.roberts@arm.com>
Subject: Re: [RFC PATCH 6/6] arm64: mm: support PMD page coalescing in the
 linear map
Message-ID: <awgbKPpwipkwkXPY@kernel.org>
References: <20260611130144.1385343-1-abarnas@google.com>
 <20260611130144.1385343-7-abarnas@google.com>
 <799181c3-a1a1-4de7-bc6a-576d3282efb0@arm.com>
 <akuieSDlbYdHnkCV@google.com>
 <aku8zidRtXPe_Rle@kernel.org>
 <awQLqYbrrgwUycxP@google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <awQLqYbrrgwUycxP@google.com>
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Adrian,

On Mon, Nov 23, 2026 at 09:47:21AM +0000, Adrian Barnaś wrote:
> On Mon, Jul 06, 2026 at 05:33:50PM +0300, Mike Rapoport wrote:
> > >                                                                             I
> > > see that x86 has a lock that wraps entire process of updating attributes
> > > (including spliting and collapsing pages):
> > > ```
> > > spin_lock(&cpa_lock);
> > > ret = __change_page_attr(cpa, primary);
> > > spin_unlock(&cpa_lock);                                            ```
> > > As I understand it makes it safe already.
> > > However, on ARM64 there is a split lock (which works fine for spliting) but
> > > for collapsing at least on my implementation it is not sufficient as
> > > Ryan pointed out.
> > 
> > I think the lock should be at set_memory level so that set_memory callers
> > shouldn't care about the differences in arch implementations.

For callers to stop caring about the differences in arch implementation we
need this:

https://lore.kernel.org/linux-mm/20261126-generic-set-memory-v0-1-v2-0-723f1e33c3d8@kernel.org/

> I have recently got back to the topic, and I have one thing to clarify.
> 
> Currently the collapsing mechanism that is backing execmem cache, following
> execmem_restore_rox() description
> 
> ```
>   * Restores read-only-execute permissions on a range [@ptr, @ptr + @size)
>   * after it was temporarily remapped as writable. Relies on architecture
>   * implementation of set_memory_rox() to restore mapping using large pages.
> 
> ```
> is driven entirely by the architecture code. It has drawbacks, that could be
> addresed by passing some of the responsibility to memory owner,
> execmem rox cache in this case.
> 
> Arch code at no point is aware if the piece of memory it makes RW/RO, is
> ment to be collapsed. Every permission change can cause entire block
> to be collapsable so we need to try collapse on every run. We can probably
> make RCU-like mechanism to batch those events but still there is a lot
> of pointless runs just to find out we can't collapse or collapse of memory
> block that already have split operation waiting for lock release.
> 
> I was wondering if it would be acceptable to create a try_collapse operation
> in set_memory api that would tell the arch code "I will probably not touch
> this anymore for a while, you can collapse if you want". And call it after
> predifined delay from last execmem_cache_restore_rox call.

What do you mean by "last execmem_restore_rox"?
How execmem would now that an execmem_restore_rox() is the last one?
 
> From execmem side it can be based on the same delayed work mechanism that
> execmem_cache_free is using.
> 
> I have a PoC locally but it is mostly vibecoded and I have already
> discovered some bugs in it. But conceptualy it worked. After a batch load
> of modules it collapsed all execmem cache blocks in both direct map and
> vmalloc in a single run.
> 
> Before I craft a proper patch set I want to ask if it is in any way
> acceptable approach?

I believe we could drive the collapse from the callers rather than from the
architecture code.

Other options could be to make the collapses wait until there is no other
set_memory operations in flight or run a kthread that would collapse
everything it could.

But before optimizing collapse I think we should close the technical debt
of having 7 different page table walkers implementing set_memory APIs.

-- 
Sincerely yours,
Mike.

