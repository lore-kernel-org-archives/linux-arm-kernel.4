Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA0D6606A33F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 09:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FtE+i+D5;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PWMKq2ci
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=8h0PI3x5L84bxHJWgvhwyPcSqbxezc6i6wUfYwT0/gw=; b=FtE+i+D5BUt4BZUtEr8XQawjBk
	hLMjM+CzWl1GFH3bVhlabABgT2tuk/qM++yU0pbDMG7zTSi0Fj3H/WpVHBqfMttYJbThZErFrK7J1
	CCCwJruEehOQL923syla3ROhOrJqZW6Qs5lzBwRVhDSLngLHsRRyh4/7TdieFTAXuZYBLXMlIdrRl
	mAHHPW3srMKsnpcv7IXXDCnQLOVJ6aghjTg6PkaoG48+09NfOPX6TR75XUBj72eWM/0vem5nWnRii
	IvkcJmJZoLeU8h7N5v6xs9RnRcZxVUF7eH41ekyyKY+MtIGlvc1/3ANf2ggtQ0fuuU6tTaYcHzyFH
	/j/vuxCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQLYY-00000000Ef7-49FI;
	Mon, 09 Nov 2026 09:20:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQLYY-00000000Ees-0WFu;
	Mon, 09 Nov 2026 09:20:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8AEBB43D06;
	Mon,  9 Nov 2026 09:20:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B8531F008A2;
	Mon,  9 Nov 2026 09:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794216049;
	bh=8h0PI3x5L84bxHJWgvhwyPcSqbxezc6i6wUfYwT0/gw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PWMKq2cik7On9nLBWZZo+q2yFr8sWXi/dqsHfAOWf5G8lTU47xEhSOhDJMI8XikaX
	 5m07d7IVQvL4OmfmjXbpZC1xKhl0bnPIHFCc1+GnK9lePH1J9OXffOSC3rolXJf+DP
	 k4ocKY24KRkrPS6q7WNJrkW/H6guwGWdd1Qlf00BWCHthyiEskC+lVYU1caVCSxDJ4
	 8mr+TmUNdQsWrTcx+JFHlqbf5vM/T8amfu0IckZaVZKSK+i+YeSGHR/TccZjqYXArb
	 yGxJbGTMk29VHdRtuVjfBsvlx9exyhCVwGps8u3eDDtXsofy9sTxR1LmMTyHZmh202
	 /IyFsFh/XTSVw==
Date: Mon, 9 Nov 2026 10:20:41 +0100
From: "Oscar Salvador (SUSE)" <osalvador@kernel.org>
To: Muchun Song <songmuchun@bytedance.com>
Cc: David Hildenbrand <david@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Lance Yang <lance.yang@linux.dev>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Ritesh Harjani <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Oscar Salvador <osalvador@suse.de>, Qi Zheng <qi.zheng@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>, linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, x86@kernel.org,
	loongarch@lists.linux.dev, linux-s390@vger.kernel.org
Subject: Re: [PATCH v3 4/5] mm/sparse-vmemmap: drop vmemmap_can_optimize()
Message-ID: <avGQadeXQU0ayFYv@localhost.localdomain>
References: <20261107043122.25650-1-songmuchun@bytedance.com>
 <20261107043122.25650-5-songmuchun@bytedance.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261107043122.25650-5-songmuchun@bytedance.com>
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, Nov 07, 2026 at 12:31:21PM +0800, Muchun Song wrote:
> section_vmemmap_optimizable() can already decide whether a section uses
> vmemmap optimization based on the section compound order. The DAX-specific
> vmemmap_can_optimize() helper duplicates that policy, so remove it to
> simplify the code.
> 
> Signed-off-by: Muchun Song <songmuchun@bytedance.com>

Reviewed-by: Oscar Salvador (SUSE) <osalvador@kernel.org>

 

-- 
Oscar Salvador
SUSE Labs

