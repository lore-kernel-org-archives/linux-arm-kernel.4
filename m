Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70565606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 16:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SubdMZvQ;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SxU5PQGo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=5qH9uU2RYKh6XIToRZvT3ow0waxxSB8wLXqXQtdP32c=; b=SubdMZvQVoz6WPd4xqFOeBUvNy
	0MRbxmSoA6R9bBv607xuE/t+34myNyPR+RoLnaYJIRXjTbyeHVOg82D/hM86OSVqY8CDzfYhyCNJ0
	2npMINT5sTwBlu1c7WYZPZQDfSNeSaT9AXqVYSNmjzhsgW//flr+mbP66ntbZDNqbn45b4+Ps3yuI
	aOFqUjb578f0/4UKBt9gLpfD70Y6jH1G2yQem6b0A9Ey/rN+anl86I4VfZcr5exLyuASirRP6gKoi
	otp87Yx+dfDqtBpiqO3mav1dm/DpEVqEVsNrwsQZVfsirZ9UgTwRjBGyFjLh4CgyTCxfqWzDmC9LR
	zhE/NFOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWciP-0000000DyOE-0BRY;
	Thu, 26 Nov 2026 16:52:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWciO-0000000DyO3-22rl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 16:52:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0305B45183;
	Thu, 26 Nov 2026 16:52:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 466201F000C0;
	Thu, 26 Nov 2026 16:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795711975;
	bh=5qH9uU2RYKh6XIToRZvT3ow0waxxSB8wLXqXQtdP32c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SxU5PQGoh3FdeXUb/zZe+iY3rUcOMRcRxSrtlOzk3paXo5yOTqHQW5yzSvByJq1ZU
	 R3b/pZXT/KfX1G0MgF9rcJHgXd3VgeGvkRcW3q+pfjDYiSVSEjTx81Yb/F7xrNWuNV
	 V40BUSLVgfXFOF31TjrqEHmyoeyV0tKowB46vgcmOdi3m6lZb1de3p8R0/stmVBDRV
	 7iEisOk65fU5CBPT9VBRqAZLQdk56bInhx82nvKOoGWqDaznlfE3+NAWI8XmS8KVWK
	 S5XnMDWsjd2IuEiilCummtaNrv1wEaQ+3B0O+M/ehMe9hIWTDYTwBKbPN93Rvubpzv
	 6FeF79qzrReJw==
Date: Thu, 26 Nov 2026 16:52:48 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Usama Arif <usama.arif@linux.dev>, oupton@kernel.org, 
	fuad.tabba@linux.dev, joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com, 
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, riel@surriel.com, shakeel.butt@linux.dev, kernel-team@meta.com, 
	rkeilty@meta.com, atish.patra@linux.dev, dgreid@meta.com
Subject: Re: [PATCH] KVM: arm64: Reduce the stage-2 page cache on 64 KiB hosts
Message-ID: <awhij_-9OARRRi9D@gremlin>
References: <20261124152842.2634495-1-usama.arif@linux.dev>
 <86wlpzycnn.wl-maz@kernel.org>
 <563d2406-dcfe-43b6-8f21-2a7694f1f266@linux.dev>
 <86v75jy48c.wl-maz@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86v75jy48c.wl-maz@kernel.org>
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

On Thu, Nov 26, 2026 at 03:58:11PM +0000, Marc Zyngier wrote:
> On Thu, 26 Nov 2026 14:32:04 +0000,
> Usama Arif <usama.arif@linux.dev> wrote:
>
> [nonsense deleted]
>
> > > Now, to the patch itself: I see no reason to special-case this. If
> > > kvm_mmu_cache_min_pages() is an indication of what is needed, then
> > > this macro should be driven by it, or the whole allocator take it into
> > > account. And then you adjust it by whatever fudge factor seems
> > > appropriate.
> > >
> >
> > Completely agree! [1] does that: no page-size special case, and
> > a capacity of KVM_PGTABLE_LAST_LEVEL - KVM_PGTABLE_FIRST_LEVEL for every
> > page size.  It can't track kvm_mmu_cache_min_pages()
> > at runtime: the vCPU's cache is shared by the canonical and NV shadow
> > MMUs, and its capacity must stay fixed. So it has to cover the largest
> > minimum, which stage-2 caps at 3, and 4 is that plus one page of fudge.
>
> Of course it can. That's not exactly rock science to add, rather than
> relying on another set of bad heuristics. And this must cover more
> than a single mapping per top-up, because that has a ripple effect on
> the speed at which we can split large blocks (funnily enough, people
> care about that stuff).

Hmm is splitting a factor here re: the cache?

In kvm_mmu_split_huge_pages() it is using kvm->arch.mmu.split_page_cache which
is a separate cache altogether right?

And splitting on fault is via e.g. kvm_vm_mem_abort() -> user_mem_abort() which
tops up anyway? (Minus an NV case which is a bug I think, I can send that as a
patch separately? I mention in another reply.)

Maybe I missed a case?

Re: the speed, having bigger cache size doesn't speed anything up as the refill
refills to the max each time, so you're doing the same # of allocations, just
maybe with a much bigger latency on one fault (seems bad to me)?


>
> 	M.
>
> --
> Without deviation from the norm, progress is not possible.
>

--
Cheers, Lorenzo

