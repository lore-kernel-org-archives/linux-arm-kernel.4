Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30FAB606A320
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 19:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=h0Xe5t1y;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G5r8Fcjv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=uvvgHJk3GV58HV73c6RWqlDdgsR7MLu03XDpb7f+R5U=; b=h0Xe5t1y1bkAuPT/O9eGFnUsDV
	V2ZzmHtO7Zk9xOgqIMVAZJ5oSuUmsxnHb9sjf5R8rpylMVdZzBqjh4LSo6C89/cjGQKHcicSI1axH
	dQGyRd64AyTQK6ItbQLZRed23iK0Db/2lbdliduX9lVcQoFM/ScJ9QVeBT9oFiKa6+VGt5J2hrFGp
	mLRkte2uzIkSQJH5v/XI/Xpp90OjfNUlej0Ubby0GgT8erx1Zf/XqSV18zjR3faEfokNyjDpSHrFs
	SWjYFNst+UGPlYM2iVtkxd3tlcfLFaww2C/Y0a4UB7rIItadxpSvv3k+sTTL0mDGsvQtWN4CbJNCf
	B38Zy3kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU7oW-0000000DDBP-1GPe;
	Thu, 19 Nov 2026 19:28:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU7oU-0000000DDAu-01y4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 19:28:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BFBE04199A;
	Thu, 19 Nov 2026 19:28:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54D131F000C4;
	Thu, 19 Nov 2026 19:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795116533;
	bh=uvvgHJk3GV58HV73c6RWqlDdgsR7MLu03XDpb7f+R5U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=G5r8FcjvSJeE4+YGEKojS0fN+BgLOD+rITEuaTx/97IhlsXC+w0TDlduE9sEg7h7P
	 1wD0UmOo+fPXObDWZhQtJttla1t0PPf/AHKfsUcsEn8KW+88KzO8QvZRtyW51xzsdm
	 p+33grHuAQm6a3kdNwobT3j4Ry+YPBGPR0tYTTC6Cs3HCOoA1kixGp1VYIeJVUjqWi
	 hWbHS1W9VlDnj0QEsLqVpI+6yCD7/gXPITeQqyUr3pioTR2WF/8kToOjKe6fsbk2Ff
	 ujoWK79i94Jrqc+VmkNunbBtD9WxhRSB4xbfbTA9lbWZzyoApzethbxEP0aKxCdvbd
	 a4B3Bt+mJszsA==
Date: Thu, 19 Nov 2026 12:28:48 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, linux-kbuild@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
	Ard Biesheuvel <ardb+git@google.com>, Will Deacon <will@kernel.org>,
	Christoph Hellwig <hch@lst.de>, Eric Biggers <ebiggers@kernel.org>,
	Song Liu <song@kernel.org>, Yu Kuai <yukuai@fygo.io>
Subject: Re: (subset) [PATCH 0/4] Get rid of all NEON intrinsics stdint.h
 type hacks
Message-ID: <20261119192848.GB875856@ax162>
References: <20261029135020.272082-6-ardb+git@google.com>
 <179508547602.2557572.9682726373932810888.b4-ty@b4>
 <81ddf2f1-faec-47ec-b3b1-7210b4e7712b@app.fastmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <81ddf2f1-faec-47ec-b3b1-7210b4e7712b@app.fastmail.com>
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

On Thu, Nov 19, 2026 at 01:08:51PM +0100, Ard Biesheuvel wrote:
> On Thu, 19 Nov 2026, at 11:51, Catalin Marinas wrote:
> > Applied the first three patches to arm64 (for-next/fixes), thanks! I
> > also added a cc stable, though it won't be a straightforward
> > cherry-pick.
> 
> Thanks!

Yes, thanks a lot for picking this up.

Backports to 6.18 and older will definitely look completely different
because we won't have all the refactoring to place this code in lib/.

> > I left the last patch out, IIUC it's just clean-up rather
> > than fixing a problem on arm32 and can go separately via Russell's tree
> > during the next merge window (let me know if you think otherwise).
> >
> 
> I'll let Nathan respond to that.

Yeah, as far as I am aware, we only need the arm64 bits. arm builds are
fine right now. Russell's tree would need to have the first two patches
to apply the arm change if I understand correctly so it could either go
to 7.5 with a backmerge or 7.6 with a base of 7.5-rc1.

-- 
Cheers,
Nathan

