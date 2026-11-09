Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7365C606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 07:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QAAahRtX;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=qMT/iSQy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=R60RtisWcqPaJsP3z5umkKLOFCDRWj8EeZj2DKpMtAQ=; b=QAAahRtXaVk6Si
	eO3IikRX6Aa0PEWwvFjl/EL8nmt07hLm1AYyr1iu7fIXxBrrO9tnlTnzpSiDCYvM/pIzJxSx/qdzj
	y4uSdhVQkmaFnelUcMucyfOaHrz86pig3ePq3tRFi5U5fq7p0Xo9guNVJNFxjnrOCeuDgxxsVgesp
	L82vH2H90IuIbiP76895St57s60Dc2OE0C0P7f11XrHi4lcNI2SskEt/XL+wSDAlkbNWNHjJ0yWP6
	idgcaE76WLW1JXZspouLFgH1GmCqOOEpjDZXCnfMLO2sU0oRJSjr9laQ1uWCYhe/GXGD65lkrWoaO
	196eRDsA/k9q36mJWsdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQJUk-0000000HXqU-2o6R;
	Mon, 09 Nov 2026 07:08:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQJUi-0000000HXqN-3J2k
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 07:08:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id AD594405CF;
	Mon,  9 Nov 2026 07:08:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E782B1F0089F;
	Mon,  9 Nov 2026 07:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1794208123;
	bh=R60RtisWcqPaJsP3z5umkKLOFCDRWj8EeZj2DKpMtAQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=qMT/iSQysf11EbkSRNfEw5+UOG45cxeA4/obABZTaIw5jUZNkssXGGYgeRSJMbaYy
	 4E8KZZmnu6+b5WKd/WEV/xp+PLbFam/lUK9OTHuHSBpa5qP5AL4fflcKZd+3cWe9S8
	 lJqz1moFNyVTZFHsRQlHIuxUMxLy/q96EhQPpliE=
Date: Sun, 8 Nov 2026 23:08:42 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Wen Jiang <jiangwenxiaomi@gmail.com>
Cc: catalin.marinas@arm.com, will@kernel.org, urezki@gmail.com,
 linux-mm@kvack.org, baohua@kernel.org, dev.jain@arm.com,
 ryan.roberts@arm.com, anshuman.khandual@arm.com, david@kernel.org,
 rppt@kernel.org, leo.yan@arm.com, xueyuan.chen21@gmail.com,
 chleroy@kernel.org, maddy@linux.ibm.com, mpe@ellerman.id.au,
 npiggin@gmail.com, ajd@linux.ibm.com, jiangwen6@xiaomi.com,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v12 00/10] mm/vmalloc: Speed up ioremap, vmalloc and
 vmap with contiguous memory
Message-Id: <20261108230842.3a77b9fe2d4bfc2a04b355a5@linux-foundation.org>
In-Reply-To: <20261107134953.748622-1-jiangwenxiaomi@gmail.com>
References: <20261107134953.748622-1-jiangwenxiaomi@gmail.com>
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

On Sat,  7 Nov 2026 21:49:43 +0800 Wen Jiang <jiangwenxiaomi@gmail.com> wrote:

> This patchset accelerates ioremap, vmalloc, and vmap when the memory is
> physically fully or partially contiguous.

Thanks.  This looks pretty mature and reviewed.  I'll add it to the
pipeline for linux-next testing.

Sashiko likes it.  I'm working on a different AI review setup which
finds different things.  Very slowly.  I'll let you know if anything
interesting pops out.

Do we have sufficient ARM review?


