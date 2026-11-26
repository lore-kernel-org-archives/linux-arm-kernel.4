Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 323D6606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 17:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wBUhU+lv;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=XnpcqNbd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=gEkkIJ/qWNi7EAZD7yoHdkh/exPFsNxJMByksA50ASQ=; b=wBUhU+lv/AD2Id
	BylqwuR2Y8HK4lnmOovNFgWaTvHdT9CDMwajFkjoInc3Gv2x3mI9UQHNJCdxorNisGw9s+2Hp0lzP
	tyHHLodxmlhdtJLYR2gHBY5AVth3kp7PTwZmf6XUH7+LH3FmHuO8FSSoF51fBrsqUyIjZ/AakkZ0l
	sd77dkkLfzIIjOT0X/1dIiJzryVbSn0FLZQhYjg0vWXxHpCYwu2WOnrtwVVuAta0885jtdFAFDpqr
	8bCP0HCjlfV8nkJBpUlONGg/QNdZ2pL8OqIstx0ZiGSIz59gh4+z9uiwP2FGb+vBJS/6WiRkDJuh1
	fGdUk4qgSiiLA4VnTQ8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWdWL-0000000E5so-26KV;
	Thu, 26 Nov 2026 17:44:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWdWI-0000000E5s7-02un
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 17:44:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C17C81BA8;
	Thu, 26 Nov 2026 09:44:23 -0800 (PST)
Received: from LeoBrasDK.cambridge.arm.com (LeoBrasDK.cambridge.arm.com [10.2.212.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 59D023F632;
	Thu, 26 Nov 2026 09:44:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795715066; bh=RzMr+wOsn54fTvspSwDwUm0XU8ZkeIMlrzEzuHt/TKI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XnpcqNbdXi7qBGNhlwyJSNvZiM42NfttpEr2uGsSpYDVHIPmPjQnZn1aL6jWBSuUK
	 5WIE5RDd6KV366KhQvq4C7+5Iihf+pvD0/zEfcuqchaBOGU+jDlYvM/73/E7//layt
	 akZ1+xaZ6B+OHd55xEg8PYa0Ja2aKBO99M9j/05g=
From: Leonardo Bras <leo.bras@arm.com>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Leonardo Bras <leo.bras@arm.com>,
	Wei-Lin Chang <weilin.chang@arm.com>,
	Usama Arif <usama.arif@linux.dev>,
	maz@kernel.org,
	oupton@kernel.org,
	fuad.tabba@linux.dev,
	joey.gouly@arm.com,
	seiden@linux.ibm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	riel@surriel.com,
	shakeel.butt@linux.dev,
	kernel-team@meta.com,
	rkeilty@meta.com,
	atish.patra@linux.dev,
	dgreid@meta.com
Subject: Re: [PATCH] KVM: arm64: Reduce the stage-2 page cache on 64 KiB hosts
Date: Thu, 26 Nov 2026 17:44:20 +0000
Message-ID: <awhv9JeCtZxH3Y5x@LeoBrasDK>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <awhpQIWN3msQ2ruf@gremlin>
References: <06a69a4f-59bb-49b8-9ed0-f4cfe0ecad37@linux.dev> <awcoCklLOKeuXPhh@LeoBrasDK> <e7bdcfa9-bbd8-4649-8318-2f6dc236db15@linux.dev> <4jxdf2pkuu2f7dftvf6ltpv27jctfuvvrfcrbfxudsgnp3hdfk@taur55wftexq> <awhODYKXnsBi_s_B@LeoBrasDK> <klnyvfxwhpw73wo55y5aq3qliglnf7xkfkmfj6cgzje7z3n2fq@aqjxshyjnldu> <awhWYdZVkESY9eJs@LeoBrasDK> <awhfXrdkHkY-riN3@gremlin> <awhnFrt1GmrTlQZ9@LeoBrasDK> <awhpQIWN3msQ2ruf@gremlin>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_094430_131353_6B2FEB54 
X-CRM114-Status: GOOD (  29.95  )
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 26, 2026 at 05:18:00PM +0000, Lorenzo Stoakes (ARM) wrote:
> On Thu, Nov 26, 2026 at 05:07:21PM +0000, Leonardo Bras wrote:
> > On Thu, Nov 26, 2026 at 04:45:35PM +0000, Lorenzo Stoakes (ARM) wrote:
> > > The question is would going from 40 to 3 slow things down?
> > >
> > > At 40 you do 40 __get_free_page() calls on topup for the _first_ fault that hits
> > > it, which adds latency to a random s2 fault (not great).
> > >
> > > (If the fault doesn't in fact use a page table, this is only done once until a
> > > page table is next needed).
> > >
> > > And then as 37 page tables are mapped, those ones don't get allocations at 38
> > > you go again...
> > >
> > > With 3 in the cache you allocate up to 3 for each fault.
> > >
> > > So in both cases you allocate the same amount of pages but in the 40 case it's
> > > all bunched up on one s2 fault with a jump in latency, in the 3 case it's spread
> > > out.
> > >
> > > I'd say 3 is therefore the better choice.
> > >
> > > Also, as mentioned elsewhere, you end up leaking pages once the S2 page tables
> > > are setup until the vCPU is destroyed, as nothing clears down the cache
> > > AFAICT. With 40 that's way more than with 3.
> > >
> > > --
> > > Cheers, Lorenzo
> >
> > Hi Lorenzo,
> >
> > When I mention cache locality above, I mean the cpu cache. Running the same
> > routine 40 times in a row can be faster since all instructions are already
> > cached, and most of the data acessed by it could be local as well.
> >
> > If you run it more often, it could be that something else used the
> > cachelines and the cpu has to fetch them again from lower level caches or
> > memory.
> >
> > That being said, that's the only reason batch allocating 40 would be faster
> > than 4 in the long run. For capacity=4, the number of
> > mmu_memory_cache_alloc_obj() calls can be even smaller than capacity=40,
> > since we don't leave unused pages in the kvm_mmu_memory_cache.
> 
> Ah right I see what you mean, true that would be warmer, but I suspect that'd be
> lost in the noise vs. zeroing each page anyway, and additionally you can argue
> that, if you just zeroed a page before the walk uses it, there's locality
> advantages on that vs. batched too.

Ah, you are right! I was ignoring the zeroing for some reason.

> 
> But again I'd be very surprised if there was any impact on that either way,
> really.

Fully agree

> 
> In any case it seems we agree that a smaller capacity is the way to go :)
> 

Awesome! Thanks!
Leo

