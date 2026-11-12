Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28EFF606A323
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 11:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=G9ZUS8ni;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NiDyh9CS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=MKcG3X7dsKXAw4NNVjEt7ZV1vzPfMBBW0q4ysZTtxpk=; b=G9ZUS8nijLPr6Jshlo/9feCIJ3
	MkmByc0eQOxs1YqiD50MMjmsL9Nf61o78GgJs6pDfeexmLShId9pZ8ZnsVhQxpSdHYY9O+kP1DBd7
	ICCWNs5kSY453giMrbcA8s5GN4vRauSEZnI1cFTtwffzcVG3k9daSKxvrMqXVr/M/PqjR5anq1Hkg
	ol/xvnH3rRcXq91p/H6PBlcILIGcDTJh624NMFi6fo8HuFgBaPOqtkAhymmxXAk0MhaxdtNPtzGDu
	7Rm1kgyW9rdUmu/j4TVh6dxtgoSFB8ccwGBBMOAYDsmahE5k5FulJ86lDrSpKDsbVUTyL1NuITUlF
	x06e0Lmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRTIk-00000009mKG-0b6L;
	Thu, 12 Nov 2026 11:49:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRTIi-00000009mK3-28k4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 11:49:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A11E66186E;
	Thu, 12 Nov 2026 11:49:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F07851F00A05;
	Thu, 12 Nov 2026 11:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794484147;
	bh=MKcG3X7dsKXAw4NNVjEt7ZV1vzPfMBBW0q4ysZTtxpk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NiDyh9CSMf4fnMa1aXCvHZxu1XNPZLF0/Dl9XempRO4DnG2Rnv4Cg3GohFO4EBFz5
	 81EpjF4nYwMtW7DcmV9HhlhPBEuZxpj9uyD4iv4l+EKqjYt1CyiVf+ASqrTv29jCn3
	 vw7Cq+OEghXqj50p1/echU8vAtiEFP2pHx3+Q4f2zoGs8RITGhiQpBM9qNWaKvF/t9
	 ziJmXqbPJb/qA9zZhB4bk4YCtqBFzsbaLaPIXeFmU1UPyBqijY4Klvc2TZ7W6n9eeT
	 xG4p1Q4rF39lKl8yaiQimmWpvUVrLuHhJOiY8tpsIULS66Q4FRARKhqorLxL8+DzQm
	 tq7vXZ+PENnMA==
Date: Thu, 12 Nov 2026 13:48:58 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-mm@kvack.org, Arnd Bergmann <arnd@arndb.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andreas Larsson <andreas@gaisler.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"David Hildenbrand (Arm)" <david@kernel.org>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	"Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Malin Jonsson <malin.jonsson@est.tech>,
	Richard Weinberger <richard@nod.at>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org, linux-fsdevel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, x86@kernel.org
Subject: Re: [PATCH v2 2/6] mm: remove ARCH_NEEDS_KMAP_HIGH_GET
Message-ID: <avWnqt1E9ssKQDWt@kernel.org>
References: <20261112112528.1116405-1-arnd@kernel.org>
 <20261112112528.1116405-3-arnd@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261112112528.1116405-3-arnd@kernel.org>
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 12, 2026 at 12:25:24PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Arm has stopped setting ARCH_NEEDS_KMAP_HIGH_GET, so this
> is handled using the same wrappers across all architectures
> now, which leaves room for simplification.
> 
> Replace lock_kmap()/unlock_kmap() with open-coded spinlocks
> and drop the now empty arch_kmap_local_high_get() and
> kmap_high_unmap_local() helpers.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  mm/highmem.c | 100 ++++++---------------------------------------------
>  1 file changed, 10 insertions(+), 90 deletions(-)

Nice :)

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>


-- 
Sincerely yours,
Mike.

