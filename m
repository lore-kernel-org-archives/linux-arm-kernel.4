Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB46F606A330
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 12:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kndbfq9f;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=KHoa5xei
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=1dlKiXXZxapqG9zmCLzBg4HgKnlbFOylWso5ueo6Lqs=; b=kndbfq9fEMb6+S
	jZawcgof/haZ1auOyQQorvUl7s95zgTYsa7UamIJMEzaiOY9Wm4GpdVrFA22RF9hnDv1PMGNatrmZ
	EvQLwIzMN++ejmkDHJGXom9SxmEPXDS9LWS5SL6VXmjYrCFwx8MB7wj8Sm3Ca4jPMv7mRRs1ptB0g
	vpuSHC5/g9ffOFhGMDQMdlnkPaSY376XycZMD5BwAMQZpgP8pATC6+OUTjt9wKp124xSHH6r49IKZ
	KEHPGLKLTOE0CZ2YHGW4dL6/HltBvX9SDr11RrPGkhApcPEFU/7Vlwse/yhO2+E48RctVE6wdODbR
	omLsSOmYkaaxFIGqx1ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWBu4-00000009mcS-3LY3;
	Wed, 25 Nov 2026 12:15:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWBtu-00000009ma8-0RoB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 12:15:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0EEA82F;
	Wed, 25 Nov 2026 04:14:58 -0800 (PST)
Received: from LeoBrasDK.cambridge.arm.com (LeoBrasDK.cambridge.arm.com [10.2.212.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3CD653F86C;
	Wed, 25 Nov 2026 04:14:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795608900; bh=3ky9MZu7q3SGrdCRfqYJILwZNULnWYwWi99eFamj3MQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KHoa5xeilBF+RK+hbrr2Y7ZE5qO8WxJ58QHngjpz9aWYvycsi7kgc7TteMwFWr72q
	 BxBFdzLppDoHL6b4G/rj+T3b9NpXhCCI3jgnIXnv4vIpLdsXen9gQNgMHQnn22zNGd
	 tZwUIekdnZXXfdMv8pX/KT7JXPo3nw37FGFDrBtY=
From: Leonardo Bras <leo.bras@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Leonardo Bras <leo.bras@arm.com>,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Dan Carpenter <dan@pereq.eu>,
	stable@vger.kernel.org
Subject: Re: [PATCH] KVM: arm64: nv: Upgrade sub-page TTL hint to maximum size
Date: Wed, 25 Nov 2026 12:14:46 +0000
Message-ID: <awbRNvgY3c-Oql-E@LeoBrasDK>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <861p8aypwm.wl-maz@kernel.org>
References: <20261123182312.4842-1-maz@kernel.org> <awW5QKqGZAqw1ru9@LeoBrasDK> <864id6yyjy.wl-maz@kernel.org> <awXSCgN4JLLKXErv@LeoBrasDK> <861p8aypwm.wl-maz@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_041502_266044_8E8CB93A 
X-CRM114-Status: GOOD (  53.06  )
X-Spam-Score: -4.4 (----)
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 24, 2026 at 07:45:29PM +0000, Marc Zyngier wrote:
> On Tue, 24 Nov 2026 18:06:02 +0000,
> Leonardo Bras <leo.bras@arm.com> wrote:
> > 
> > On Tue, Nov 24, 2026 at 04:38:41PM +0000, Marc Zyngier wrote:
> > > On Tue, 24 Nov 2026 16:20:16 +0000,
> > > Leonardo Bras <leo.bras@arm.com> wrote:
> > > > 
> > > > On Mon, Nov 23, 2026 at 06:23:12PM +0000, Marc Zyngier wrote:
> > > > > Should a guest be slightly foolish and submit a S2 TLBI with a TTL hint
> > > > > that describe a base granule size smaller than the host's page size,
> > > > > we take the resulting size at face value and feed it to the S2 unmapping
> > > > > code. Which legitimately screams about something not being page-aligned.
> > > > > 
> > > > > The architecture allows us to drop the TLBI on the floor, as we don't
> > > > > support a S2 granule size smaller than the host's page size. But it turns
> > > > > out that doing so is proving pretty hard (we call compute_tlb_inval_range
> > > > > from a number of places, none of which is amenable to an early out).
> > > > > 
> > > > > Instead, detect the annoying case, and pretend that we don't have a TTL
> > > > > hint at all, leaving the size upgrade mechanism to take place and use
> > > > > the largest possible size for the guest's S2 granule size.
> > > > > 
> > > > > This will still allow nonsensical stuff to get through, such as a 4kB
> > > > > level 2 (aka 2MB) from a guest with a 64kB S2 base granule size running
> > > > > on a 16kB page size host, but that's not worse than doing nothing, and
> > > > > the host code won't get shouty.
> > > > > 
> > > > > Reported-by: Dan Carpenter <dan@pereq.eu>
> > > > > Link: https://lore.kernel.org/r/20261123-inval_range-v1-1-815e15797089@pereq.eu
> > > > > Fixes: d1de1576dc21 ("KVM: arm64: nv: Handle FEAT_TTL hinted TLB operations")
> > > > > Signed-off-by: Marc Zyngier <maz@kernel.org>
> > > > > Cc: stable@vger.kernel.org
> > > > > ---
> > > > > 
> > > > > Notes:
> > > > >     Reposting this as a first class patch, as I'd like to plug that one
> > > > >     as early as possible (and Dan has plenty of other patches in flight...)
> > > > > 
> > > > >  arch/arm64/kvm/nested.c | 7 +++++++
> > > > >  1 file changed, 7 insertions(+)
> > > > > 
> > > > > diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
> > > > > index 78d5b18dbd2d6..36e4e83badf0a 100644
> > > > > --- a/arch/arm64/kvm/nested.c
> > > > > +++ b/arch/arm64/kvm/nested.c
> > > > > @@ -714,6 +714,13 @@ unsigned long compute_tlb_inval_range(struct kvm_s2_mmu *mmu, u64 val)
> > > > >  	 */
> > > > >  	max_size = __ttl_to_size(ttl);
> > > > >  
> > > > > +	/*
> > > > > +	 * IMPDEF behaviour: treat subpage TTL-annotated TLBI as the largest
> > > > > +	 * possible invalidation. Don't try this at home, kids!
> > > > > +	 */
> > > > > +	if (max_size < PAGE_SIZE)
> > > > > +		max_size = 0;
> > > > > +
> > > > >  	if (!max_size) {
> > > > >  		/* Compute the maximum extent of the invalidation */
> > > > >  		switch (vtcr_to_tg0_pgsize(kvm, mmu->tlb_vtcr)) {
> > > > > -- 
> > > > > 2.47.3
> > > > > 
> > > > 
> > > > Hey Marc,
> > > > 
> > > > I think the changes make sense, although rounding up to PAGE_SIZE also 
> > > > looks a valid solution in my unexperienced viewpoint.
> > > 
> > > No, it isn't the same thing. Taker the example I have given, where the
> > > host is 16k, the guest 64k, and the invalidation 4k. If you round
> > > things up to 16k, you're still not invalidating anything that is
> > > consistent with the *minimum page size* for the guest. Anything larger
> > > is a multiple of both the host and guest page sizes, and therefore
> > > always correct.
> > 
> > Ah, right!
> > In this case, could we not invalidate the largest page size supported 
> > (64k)?
> 
> Because that's not what the absence of TTL means.
> 
> > 
> > IIUC:
> > - To have max_size between 0 and PAGE_SIZE means it's either 4k or 16k, 
> >   so invalidating the 64k should be enough?
> 
> No.
> 
> >  
> > - max_size=0 from __ttl_to_size() means largest blocksize supported by 
> >   stage2 in current TG.
> 
> Yes.
> 
> > 
> > The two above are opposite ends, no? Like, the first is "this is too small 
> > for us to invalidate, let's pick something bigger", and the other one is 
> > "we want to invalidate the largest supported block".
> > 
> > Is it really ok to put them in the same bucket?
> 
> That's the *only* thing you can do, short of not invalidating anything
> at all. The commit message alreayd explains the IMPDEF choice that is
> made, and why it is made. Let me explain it again:
> 
> - An invalid TTL allows us to ignore the TLBI altogether. No ifs, no
>   buts. This is definitely an invalid TTL.
> 
> - However, by the time we reach this code, we are committed to perform
>   an invalidation, and we can't backtrack (doing so would be really
>   ugly).
> 
> - Our next port of call is to still perform an invalidation with
>   something reasonable. Since the TTL is invalid, only the IPA tells
>   us anything. And for any IPA without any range information, the only
>   sane thing to do is to invalidate the largest possible size.
> 
> You could refine this a bit more, but frankly this is not worth it. We
> are already allowing a broken guest to do some invalidations, but
> there is no need to go out of our way to do anything more.
> 
> The end.
> 

I think I got the whole picture now.
Since guest page size has to be at least the same size as the host, it 
would make no sense for a guest tlbi to ask for an invalidation smaller 
than the host page size, and therefore it's an invalid TTL hint, and we 
should invalidate the whole block, because at this point we can't 
backtrack.

FWIW:
Reviewed-by: Leonardo Bras <leo.bras@arm.com>

Thanks for having the patience to help me understand!
Leo

