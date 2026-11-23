Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D84E9606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 03:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=073A2cGj;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Je3rYygI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=rVGtwWIUrwg3vjkZky9jBduG/TMeysWW9WrLvNCpeaU=; b=073A2cGjI0+dAX
	Q+z7aVV9AYf6tJ7siiKbvlyTlEBkqqpQr/FrcjBl5+oKXk8P4gT1N6YlUCKGl5EyugjRAB4yjcwLM
	f8tGuRbbd0vAY+YK2Epxx790GIh/CGGkXrqDN1ljQ9JcnhuRo0G6VZ9n6OaW+sTTyCtxTogb835jR
	zlM4A1Bk54Tud7pDH3FlFAm3zTqZxkbmEEO57bse34r6cVRi+LmqG1PDjx+EjEmlr7fJnluSisS/4
	hnlNxVrB7qNLVna1nivB0ezsbrIsgTOSrIJ34FN5hrYKcKbtF1D/EcocaJPyjNDKxLtNOitZQnYb5
	M6ohtXkMaGluQeAKg3bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVKJD-00000002A2J-1Kjo;
	Mon, 23 Nov 2026 03:01:35 +0000
Received: from out-176.mta0.migadu.com ([2001:41d0:1004:224b::b0] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVKJ7-00000002A1h-3zK7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 03:01:33 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=mIgBcbUV5ixDOvXz3J1MusGef0bPdFIqnXiTXJGakI8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795402887; v=1; x=1796007687;
 b=Je3rYygIgpzY1nXNspU9V2667bbCxLLQx2mNTGfA5ycudJIdi0ddpU3flrQfQ+x3bu/n4JwP
 EHkGQ2b2RtFhdpJIDn16/2YsyMpdxpo9jc0VZClg2ybCSOXNcWbKs036kkjhk0PZ+OuQ/szJxZH
 3U2NuV9anPz/kTarzHXX0zWQ=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 195945ff91ad8013;
	Mon, 23 Nov 2026 03:01:26 +0000
X-Mizu-Trace-ID: 195945ff91ad8013
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=us-ascii
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.200.71.1.16\))
Subject: Re: [PATCH v3 05/19] hugetlb_vmemmap: Allow architectures to
 dynamically disallow HVO
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20261122184453.2668189-6-jthoughton@google.com>
Date: Mon, 23 Nov 2026 11:01:07 +0800
Cc: Muchun Song <muchun.song@linux.dev>,
 Will Deacon <will@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>,
 Kefeng Wang <wangkefeng.wang@huawei.com>,
 Nikos Nikoleris <nikos.nikoleris@arm.com>,
 Linu Cherian <linu.cherian@arm.com>,
 Mark Rutland <mark.rutland@arm.com>,
 David Hildenbrand <david@kernel.org>,
 Ryan Roberts <ryan.roberts@arm.com>,
 Nanyong Sun <sunnanyong@huawei.com>,
 Yu Zhao <yuzhao@google.com>,
 Frank van der Linden <fvdl@google.com>,
 David Rientjes <rientjes@google.com>,
 linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mm@kvack.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <C1CC6F31-4F75-41D8-89D8-CE43465FBB6C@linux.dev>
References: <20261122184453.2668189-1-jthoughton@google.com>
 <20261122184453.2668189-6-jthoughton@google.com>
To: James Houghton <jthoughton@google.com>
X-Mailer: Apple Mail (2.3901.200.71.1.16)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_190132_689197_CA2316E5 
X-CRM114-Status: GOOD (  26.31  )
X-Spam-Score: -2.1 (--)
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



> On Nov 23, 2026, at 02:44, James Houghton <jthoughton@google.com> =
wrote:
>=20
> For arm64, only some platforms support HVO. Add an arch hook,
> arch_support_vmemmap_remap(), to prevent HVO from taking effect if the
> architecture lacks support. The hook is not HugeTLB-specific, so it =
can
> also be used by other users of in-place vmemmap remapping (e.g. =
FS-DAX).
>=20
> Check it in hugetlb_vmemmap_optimizable_size(), so that hstates are =
not
> reported or treated as optimizable (e.g. by report_hugepages() and the
> HugeTLB allocation and freeing paths) when the architecture does not
> support HVO.
>=20
> It may be the case that arch_support_vmemmap_remap() returns false at
> first but eventually returns true. This is the case on arm64, where
> support depends on a system-wide CPU capability that is not yet known
> when bootmem hugepages are allocated. Such architectures cannot =
pre-HVO
> bootmem hugepages, so they must disable the section-based vmemmap
> optimization in their vmemmap population path with
> section_vmemmap_optimization_disable(). Their bootmem hugepages are =
then
> optimized when they are gathered instead.
>=20
> Signed-off-by: James Houghton <jthoughton@google.com>
> ---
> include/linux/pgtable.h | 15 +++++++++++++++
> mm/hugetlb_vmemmap.h    |  2 ++
> 2 files changed, 17 insertions(+)
>=20
> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> index ab33df268955..8cf44120e2ed 100644
> --- a/include/linux/pgtable.h
> +++ b/include/linux/pgtable.h
> @@ -480,6 +480,21 @@ static inline int try_update_vmemmap_pte(unsigned =
long addr, pte_t *ptep,
> }
> #endif
>=20
> +#ifndef arch_support_vmemmap_remap

We usually add a 's' to 'support'. Like arch_supports_vmemmap_remap.

> +/*
> + * arch_support_vmemmap_remap - Whether in-use vmemmap mappings may =
be remapped.
> + *
> + * Vmemmap optimizations, such as the HugeTLB vmemmap optimization =
(HVO),
> + * remap vmemmap page table entries while they are in use. =
Architectures that
> + * can only do this on some systems may override this hook. It may =
return false

"Some systems" is not clear for me, How about rewrite this sentence =
with:

  May override this hook based on architecture-specific runtime =
conditions.

> + * early during boot and true later, once system-wide features are =
known.

I think the description should be general, so the last sentence I think =
should
be removed.

Thanks,
Muchun

> + */
> +static inline bool arch_support_vmemmap_remap(void)
> +{
> +	return IS_ENABLED(CONFIG_VMEMMAP_OPTIMIZATION);
> +}
> +#endif
> +
> #ifndef __HAVE_ARCH_PTEP_SET_ACCESS_FLAGS
> extern int ptep_set_access_flags(struct vm_area_struct *vma,
> 				 unsigned long address, pte_t *ptep,
> diff --git a/mm/hugetlb_vmemmap.h b/mm/hugetlb_vmemmap.h
> index 8b28063d78cc..440477288d19 100644
> --- a/mm/hugetlb_vmemmap.h
> +++ b/mm/hugetlb_vmemmap.h
> @@ -48,6 +48,8 @@ static inline unsigned int =
hugetlb_vmemmap_optimizable_size(const struct hstate
>=20
> 	if (!is_power_of_2(sizeof(struct page)))
> 		return 0;
> +	if (!arch_support_vmemmap_remap())
> +		return 0;
> 	return size > 0 ? size : 0;
> }
> #else
> --=20
> 2.56.1.809.ga0b61035b5-goog
>=20


