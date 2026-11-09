Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5CAB606A325
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 17:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hm7LWWbk;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=U7k7USFh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=eun4fonrA8YxuiXzX4G4XMpkIlQF/XMM49UglMMMiXw=; b=hm7LWWbkaF0ef9
	6zzxZHtrFOf0sGSf/j2xT/uvaRUE79+zZFg26V4+TVFd8YjA+Jlm34FLdGYfu6SBFBzrYr3gsu3/k
	dh15hECm7espgDhKIeQFOoLgoXlTJytnGQszLtFOqSckIe7GY0qO2unO5m+8DKxHMae1RAbLRRQZ0
	UZC59qW4VRE24tCXHRnZsu+YxuQFRYKLzWctNOg0CpTWSsuSippm07mutuVmqZ1prx0//Y97FxOHb
	esVxG7n3UO5p7ZPM56+Qt2eoKp9bc1lIly9llUMtg2Q29OsOtRY1SFxYUmx6zDtMMweEgEU0cQMjg
	Hka3eW5Q6p/PgRFGCjWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQT6F-00000001Khb-1ECL;
	Mon, 09 Nov 2026 17:24:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQT6E-00000001KhP-07sY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 17:24:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6707941607;
	Mon,  9 Nov 2026 17:24:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 924481F008A1;
	Mon,  9 Nov 2026 17:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1794245045;
	bh=eun4fonrA8YxuiXzX4G4XMpkIlQF/XMM49UglMMMiXw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=U7k7USFh8CiH8yapE7FTZPIc3n7a1VfVrrw/hRpz7ZfmAvrqap3KqDfRs+5dgXjUg
	 7b5GVFc0envv1FiTeaCTmMTZ66R7rrrr0X/aHT3OQaPAdaAd9AdSGv+gj/dkjcPbkm
	 IviqjTERNDo2xLRDzAyJciW777BbRh6rtjEPsZg0=
Date: Mon, 9 Nov 2026 09:24:04 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Leo Yan <leo.yan@arm.com>
Cc: Wen Jiang <jiangwenxiaomi@gmail.com>, catalin.marinas@arm.com,
 will@kernel.org, urezki@gmail.com, linux-mm@kvack.org, baohua@kernel.org,
 dev.jain@arm.com, ryan.roberts@arm.com, anshuman.khandual@arm.com,
 david@kernel.org, rppt@kernel.org, xueyuan.chen21@gmail.com,
 chleroy@kernel.org, maddy@linux.ibm.com, mpe@ellerman.id.au,
 npiggin@gmail.com, ajd@linux.ibm.com, jiangwen6@xiaomi.com,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v12 00/10] mm/vmalloc: Speed up ioremap, vmalloc and
 vmap with contiguous memory
Message-Id: <20261109092404.5441d8bf9c4494ed008162fa@linux-foundation.org>
In-Reply-To: <20261109140206.GY9176@e132581.arm.com>
References: <20261107134953.748622-1-jiangwenxiaomi@gmail.com>
	<20261108230842.3a77b9fe2d4bfc2a04b355a5@linux-foundation.org>
	<CAHKocdGWE9OVA5pJh33U-FYnNkUqRS0pzFt=rCwXWzY9w-QXyw@mail.gmail.com>
	<20261109140206.GY9176@e132581.arm.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
X-Spam-Status: No, score=-7.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 9 Nov 2026 14:02:06 +0000 Leo Yan <leo.yan@arm.com> wrote:

> On Mon, Nov 09, 2026 at 07:07:23PM +0800, Wen Jiang wrote:
> 
> [...]
> 
> > > Do we have sufficient ARM review?
> > >
> > 
> > Thanks for picking this up.
> > 
> > On ARM review: Dev reviewed the earlier revision in detail and
> > his suggestions are folded in. Leo Yan tested the large vmap() path
> > on TRBE/SPE. We'd welcome more ARM review from Ryan, Catalin
> > and others.
> 
> I confirmed that my Tested-by tag remains valid on the latest version.
> The improvement is consistent with L2D TLB refill reduced from
> ~16000+ to ~500+ across multiple runs.

Thanks.  I added your t-b to every patch in the mm.git copy of this
series.


AI review found a couple of little things:

: In [07/10], vmap_pages_range_noflush_walk() uses an int nr
: index, now shared by the high-order mapping path. The previous
: high-order path used unsigned int i, nr. Beyond INT_MAX base
: pages the new index overflows and pages[*nr] can go out of
: bounds. On x86-64/4K that means an allocation above 8 TiB,
: within the vmalloc VA window but requiring a very large machine.
: Please carry unsigned long or size_t through the direct walker.

The vmap(8TB) limit is already well known, not sure that we plan to do
anything about it(?).  But the patchset seems to drop that limit to 4TB
for higher-order pages, which can't be a good thing.

: In [09/10], nr_contig < 2 can be dropped: the loop guarantees
: at least one page, and vm_shift(..., PAGE_SIZE) returns zero
: for a single page. I withdraw my earlier NULL-page objection;
: I could not establish a legitimate producer of that input.



