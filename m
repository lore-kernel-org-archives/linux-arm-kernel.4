Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E581606A323
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 19:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=E+l6zTwX;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Zlr8cphp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=bTYAm4EWSRHx/ZHXwlhFob7m+xxSKwh0NNHvPVL+4a0=; b=E+l6zTwXeIaCrmdVShXmCaXt3H
	kBV7qVBakHHFQ+he3nD8J3OriKISGq3geMcp1jruRxepYjm/jzxP/WBpbrDitmaRV558EpYuzu68m
	/E5C2ZIqEQPwiHE5IjQ9Q9ELlF0x+pc54edGYpd/HpBOZYx23i4DoBVQKuFZiGavZdDKa3oepY9bs
	PUFuetV7bXZHpa1BXJZXD2xzk2oxeX/N3TjSkt9iT/PxbeAUwUxR13QkltYPo8kKsfFYExPEO6nsf
	p3CVH1V4COLZHzvZStor9Ut1bB7YJE+Yp7t1JdxLgrcikdrDZU/MujyJQy1ePzGLWaVwXiv2rmkpV
	gz0l5msQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSfgT-00000000Myb-3YqA;
	Sun, 15 Nov 2026 19:14:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSfgS-00000000MyV-08gZ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 19:14:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B2ABF41664;
	Sun, 15 Nov 2026 19:14:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2830B1F000C4;
	Sun, 15 Nov 2026 19:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794770075;
	bh=bTYAm4EWSRHx/ZHXwlhFob7m+xxSKwh0NNHvPVL+4a0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Zlr8cphpaQd3nqY4dD/M8LKmVfhEwBhg/RXnFS8Dbd42j21budIL80Fj83ujynYBi
	 xrkpXbt/vgXXJ3zbCIgd0vytWH9UFZRo+kWYg6+zk3Dgh5sXkP6sxBNtPVRWMc7kgU
	 7c0cXcpkCgnk34WxtxAQP15i7VF+f+o9Op3gqEYw8sVFIZUZZKKEE/DiCEBd5NJmBL
	 eqWix0PI/yHN1v1kle17XH0UgF/k5g+OojdNRy9zlUqHohW/kmiciG1CH3WaxOOynl
	 GtOjVUG+IaqnqKJMnuActvv+XKVHz8jIHWFruwvUHIhP9DWwGFEUc3P4bbqJVKIINp
	 h+RZkJC+eVaDQ==
Date: Sun, 15 Nov 2026 21:14:25 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: catalin.marinas@arm.com, will@kernel.org, akpm@linux-foundation.org,
	m.szyprowski@samsung.com, jenswi@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, mark.rutland@arm.com,
	robin.murphy@arm.com, hch@lst.de, ryan.roberts@arm.com,
	sumit.garg@kernel.org, sudeep.holla@kernel.org, ardb@kernel.org,
	thierry.reding@kernel.org, david@kernel.org, danielmentz@google.com,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	iommu@lists.linux.dev, op-tee@lists.trustedfirmware.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/8] memblock: Introduce MEMBLOCK_PTEMAP
Message-ID: <avoEkRRM3iH70_Am@kernel.org>
References: <20261111110738.872947-1-vdonnefort@google.com>
 <20261111110738.872947-2-vdonnefort@google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261111110738.872947-2-vdonnefort@google.com>
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

On Wed, Nov 11, 2026 at 11:07:31AM +0000, Vincent Donnefort wrote:
> Keeping PTE-level mappings is interesting for arm64 as it allows
> mapping/unmapping pages from the kernel direct map without the risk of
> splitting blocks which, under the break-before-make rule, may trigger
> page-faults the kernel can't handle.
> 
> However, mapping the entire direct map at PTE-level is costly. So
> instead, create a new memblock flag MEMBLOCK_PTEMAP to selectively apply
> a PTE-level mapping.
> 
> Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

> ---
>  include/linux/memblock.h |  9 +++++++++
>  mm/memblock.c            | 39 +++++++++++++++++++++++++++++++++++++--
>  2 files changed, 46 insertions(+), 2 deletions(-)

-- 
Sincerely yours,
Mike.

