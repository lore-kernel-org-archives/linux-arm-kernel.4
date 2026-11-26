Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0876606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 17:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yDCp76NV;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HsEOHv2+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=V5xmoW4LeD92bfUW3nTeFlKJBK+Im2x8DkYDeOLL1Fs=; b=yDCp76NVVn73xDe0aN149pmMqt
	qG3bTkyCkGyQqm/gLNcNqqoLlkIPwo9nGZs3D9xhZjYkI8lp+HMktVJp0+kmNA1W5WiJX+QTj0foz
	Xgh284cG++qIU9lbbcHKjwHpn2Kq3ropXG0sP+2rd5F8DI5a3U4C0lm8e9ocOBJRKvgm4G1yUYDJx
	pmu0Jc5sDwgEVlMLcUqKZEe61gJ1ypJKS6GCv3UAbwdL9uL30wMHYFs0P+6okg4nktQRBoKOTVHRC
	R+GFT0GXZiF8iPQBYKgZNrimrBG0lVb7Tkg+iIypFJvgsPFgziWhfTCXDVZ1kYZIUdsZDPS+XNj+h
	Has0dpqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWd6r-0000000E21I-2y6y;
	Thu, 26 Nov 2026 17:18:15 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWd6m-0000000E210-3m75
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 17:18:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8AEBA440AE;
	Thu, 26 Nov 2026 17:18:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 654E41F000C4;
	Thu, 26 Nov 2026 17:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795713488;
	bh=V5xmoW4LeD92bfUW3nTeFlKJBK+Im2x8DkYDeOLL1Fs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HsEOHv2+oDS6M9briT4hHB2Uatfz/gw6X+Xk0j0ANg2CqNC5xpG3J9mRBOJRGsPXh
	 Gi5CsYaHySPyXAbuA1nlGhz2vRbA4Bk+9TRO539iSbDHlg39hYELdBfydxRp2ymQsa
	 sTbKL1Vtp+yPbYpkBHuelzvO4CzcLjSqznelSj/u9WZzfA265COlRvTpFkRzntK9Cq
	 /N0IPPqCgBkQ57it9NFqX8dW5tnOhvNTg0kO5FQL/ert79vv56BRNyVVlRKF5bLPGG
	 6RT3p+ic4McQa4zZJly2dplygUHPVbP2gWd2YR5hLXYZXelHaX9lle6uTf/BekoIiS
	 AP7D/wTnCEXRw==
Date: Thu, 26 Nov 2026 17:18:00 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Leonardo Bras <leo.bras@arm.com>
Cc: Wei-Lin Chang <weilin.chang@arm.com>, 
	Usama Arif <usama.arif@linux.dev>, maz@kernel.org, oupton@kernel.org, fuad.tabba@linux.dev, 
	joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com, 
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, riel@surriel.com, shakeel.butt@linux.dev, kernel-team@meta.com, 
	rkeilty@meta.com, atish.patra@linux.dev, dgreid@meta.com
Subject: Re: [PATCH] KVM: arm64: Reduce the stage-2 page cache on 64 KiB hosts
Message-ID: <awhpQIWN3msQ2ruf@gremlin>
References: <awcXhk885lqDRAHy@LeoBrasDK>
 <06a69a4f-59bb-49b8-9ed0-f4cfe0ecad37@linux.dev>
 <awcoCklLOKeuXPhh@LeoBrasDK>
 <e7bdcfa9-bbd8-4649-8318-2f6dc236db15@linux.dev>
 <4jxdf2pkuu2f7dftvf6ltpv27jctfuvvrfcrbfxudsgnp3hdfk@taur55wftexq>
 <awhODYKXnsBi_s_B@LeoBrasDK>
 <klnyvfxwhpw73wo55y5aq3qliglnf7xkfkmfj6cgzje7z3n2fq@aqjxshyjnldu>
 <awhWYdZVkESY9eJs@LeoBrasDK>
 <awhfXrdkHkY-riN3@gremlin>
 <awhnFrt1GmrTlQZ9@LeoBrasDK>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <awhnFrt1GmrTlQZ9@LeoBrasDK>
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

On Thu, Nov 26, 2026 at 05:07:21PM +0000, Leonardo Bras wrote:
> On Thu, Nov 26, 2026 at 04:45:35PM +0000, Lorenzo Stoakes (ARM) wrote:
> > The question is would going from 40 to 3 slow things down?
> >
> > At 40 you do 40 __get_free_page() calls on topup for the _first_ fault that hits
> > it, which adds latency to a random s2 fault (not great).
> >
> > (If the fault doesn't in fact use a page table, this is only done once until a
> > page table is next needed).
> >
> > And then as 37 page tables are mapped, those ones don't get allocations at 38
> > you go again...
> >
> > With 3 in the cache you allocate up to 3 for each fault.
> >
> > So in both cases you allocate the same amount of pages but in the 40 case it's
> > all bunched up on one s2 fault with a jump in latency, in the 3 case it's spread
> > out.
> >
> > I'd say 3 is therefore the better choice.
> >
> > Also, as mentioned elsewhere, you end up leaking pages once the S2 page tables
> > are setup until the vCPU is destroyed, as nothing clears down the cache
> > AFAICT. With 40 that's way more than with 3.
> >
> > --
> > Cheers, Lorenzo
>
> Hi Lorenzo,
>
> When I mention cache locality above, I mean the cpu cache. Running the same
> routine 40 times in a row can be faster since all instructions are already
> cached, and most of the data acessed by it could be local as well.
>
> If you run it more often, it could be that something else used the
> cachelines and the cpu has to fetch them again from lower level caches or
> memory.
>
> That being said, that's the only reason batch allocating 40 would be faster
> than 4 in the long run. For capacity=4, the number of
> mmu_memory_cache_alloc_obj() calls can be even smaller than capacity=40,
> since we don't leave unused pages in the kvm_mmu_memory_cache.

Ah right I see what you mean, true that would be warmer, but I suspect that'd be
lost in the noise vs. zeroing each page anyway, and additionally you can argue
that, if you just zeroed a page before the walk uses it, there's locality
advantages on that vs. batched too.

But again I'd be very surprised if there was any impact on that either way,
really.

In any case it seems we agree that a smaller capacity is the way to go :)

--
Cheers, Lorenzo

