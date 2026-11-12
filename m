Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2799A606A8A6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 11:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Wzpm2rRc;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JShWTYBw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=AXwEBWpVcpvZcrV+jXWqjYnIWZkbHRe6QYcaP4OKLgA=; b=Wzpm2rRcwrDZ/DQHHiM8ERYmJY
	7nrujW/myca70uZu3rYkyE3AgXoRj3EK6ELoKv7zui4I7yM5pu2uhdd61YrB/dXFJE6fcBuIODd4W
	BgkB9CdqovEdFdnRIDI7AP2dsubrrLCR1kqcIpDblDOzoWl7rUSpMt7zbtb6Lcipv6RIphw0SGmo5
	0N24ZDXZrqB7n+1PB2tZFtUaRnDgOReDQxP60FbMbQeAjPLDdN7rDIqAx0WdG8K0N2XFq+tvh95c5
	FIXzIhBZBWBzEDIaD7kJ4/UkGbNx9KNY3qC29wiPKu8U4yweaf0Jv7HEFptDjuY0XJJtSxOGH61/1
	yO/Isa2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRTNk-00000009n3O-0gtp;
	Thu, 12 Nov 2026 11:54:20 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRTNi-00000009n36-2MWE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 11:54:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CAA5361CEA;
	Thu, 12 Nov 2026 11:54:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2A951F00A05;
	Thu, 12 Nov 2026 11:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794484457;
	bh=AXwEBWpVcpvZcrV+jXWqjYnIWZkbHRe6QYcaP4OKLgA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JShWTYBwz3T1m0D+gMlzyAXZUOV5lZTEdKWEmPLNzsIRW+v6wGYjzrWz/3a+qlIIh
	 uHEBwZWTzfI+8nM1pcwM53SGkhGVtDsLBHshuYSxtzNG61JCXbS2MprM5hV/RW220H
	 EL1fsA/x1UUGroAbYZBw+qSGfyZB4AOspBYFjnzgVnaVolzaeMfQXuiyzSNiu/Vp5y
	 FZk8uOr8DWU5XDcsKIwXsglFSq2MXx57+zvKA08GWuWTcIghT/EEC8a7yprTEzE1K1
	 C3sWmvVFn06QL/mupd6DGhe9ParugCE3t4qUWqqEJB1lwXJ/5dePwtcAucWejA+WvE
	 v93jIoibDc7rw==
Date: Thu, 12 Nov 2026 13:54:08 +0200
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
Subject: Re: [PATCH v2 4/6] mm: drop HIGHPTE support altogether
Message-ID: <avWo4NrAPX8BisCY@kernel.org>
References: <20261112112528.1116405-1-arnd@kernel.org>
 <20261112112528.1116405-5-arnd@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261112112528.1116405-5-arnd@kernel.org>
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

On Thu, Nov 12, 2026 at 12:25:26PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> With both x86 and arm having dropped CONFIG_HIGHPTE support, no
> architecture is left using it, so remove the remnants in common code.
> 
> It is likely that further cleanups are possible in the page table
> code but those are not obvious from the config options.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  include/linux/hugetlb.h | 5 +----
>  include/linux/mm.h      | 1 -
>  include/linux/pgtable.h | 9 ---------
>  3 files changed, 1 insertion(+), 14 deletions(-)

With this and arm HIGHPTE patches applied there are still a few leftovers:

$ git grep  HIGHPTE
arch/arm/configs/vt8500_v6_v7_defconfig:CONFIG_HIGHPTE=y
mm/memory.c:     * Dumping the PTE would be nice, but it's tricky with CONFIG_HIGHPTE,
mm/pgtable-generic.c: * kmapped if necessary (when CONFIG_HIGHPTE), and locked against concurrent
mm/userfaultfd.c:        * index ordering when CONFIG_HIGHPTE is enabled. We mapped dst_pte

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

-- 
Sincerely yours,
Mike.

