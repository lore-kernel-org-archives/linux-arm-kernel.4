Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27551606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 03:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0t08uozQ;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=xnS5oWgz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=liONQZO+EAHG7ixY8JmtuIKPPkmSaSHZeOcFjrgKJBg=; b=0t08uozQCovzj0
	/5pVDoFboPJRXNoLvgGFrCGABIIpKpVc8f+ZSi33B67LLZVLgFOF09T8esPzYVUkeydUqzMULwOE2
	MupgGqtqXSPdG/o+t2z6CTL0ooGIXcH98vjmlcPq8RFKHDj+9vV6WUq76LYdiHwuvfQqNP+/I608C
	NNXDWXyTzhxwQPHD5vTcK6hRIuC74/TOS7W47vqrtDsVukD5MzSA85TJ5ZBwjgDC48xlHjFukE+lC
	9P9eDAny+ihmxk5oJH7Div7vnF3NTTUaZtiglQ6ShqMoSvInJOa9wnJdS6LNKYc7h3xFlcEESDK2E
	0loujGieNBVU5Ln0ERFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVKT2-00000002BOK-0fKn;
	Mon, 23 Nov 2026 03:11:44 +0000
Received: from out-22.mta0.migadu.com ([2001:41d0:1004:224b::16] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVKSg-00000002BMI-3HiG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 03:11:41 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=ujFplHJ3piEVGbgFTkod2LvOMRYY4YKywSoNgd1YTy8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795403480; v=1; x=1796008280;
 b=xnS5oWgzs17ElRihHvNnCWB7LwGaXrJXyK4nOEXZF3bZHeDyUzXILmJy/8Bu46oyL+hfk4AL
 gJNMLRR3t+vH6yJpSCDRaEYUlKis0xjxPS5Dkzea1ZMZqKNnkyi9vFV89oDgU60pqtvvjlZOl5f
 dxRQD/a+fpkWjUmcy8D/cK/s=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 6023f3f8b2fdfde6;
	Mon, 23 Nov 2026 03:11:20 +0000
X-Mizu-Trace-ID: 6023f3f8b2fdfde6
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=us-ascii
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.200.71.1.16\))
Subject: Re: [PATCH v3 06/19] hugetlb: Optimize bootmem folios that were not
 pre-HVOed
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20261122184453.2668189-7-jthoughton@google.com>
Date: Mon, 23 Nov 2026 11:10:55 +0800
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
Message-Id: <CF94E7D7-87D2-4523-9343-512EE00094FA@linux.dev>
References: <20261122184453.2668189-1-jthoughton@google.com>
 <20261122184453.2668189-7-jthoughton@google.com>
To: James Houghton <jthoughton@google.com>
X-Mailer: Apple Mail (2.3901.200.71.1.16)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_191123_919325_55BC2416 
X-CRM114-Status: GOOD (  23.64  )
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
> Boot-time gigantic folios are expected to be pre-HVOed through the
> section-based vmemmap optimization, so the bulk optimization pass for
> bootmem folios was dropped.
>=20
> However, arch_support_vmemmap_remap() may not yet
> return true when bootmem folios are allocated (e.g. on arm64, where
> support depends on a system-wide CPU capability), while it does return
> true by the time the bootmem folios are gathered. Such architectures
> disable the section-based vmemmap optimization in their vmemmap
> population path (see section_vmemmap_optimization_disable()), so the
> folios are not pre-HVOed and would never be optimized.

Yeah, when I removed support for this part of the code, I figured you
might add a new patch in the future to add support back. It is fine.

>=20
> Optimize such folios when gathering bootmem folios. Their tail struct
> pages have all been initialized by memmap_init_compound_page(),
> as they were not pre-HVOed. Pre-HVOed folios are skipped by
> vmemmap_should_optimize_folio().
>=20
> Signed-off-by: James Houghton <jthoughton@google.com>
> ---
> mm/hugetlb.c | 11 +++++++++++
> 1 file changed, 11 insertions(+)
>=20
> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> index 72839e98f998..8756c0206922 100644
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -3325,6 +3325,17 @@ static void __init =
prep_and_add_bootmem_folios(struct hstate *h,
> 	unsigned long flags;
> 	struct folio *folio, *tmp_f;
>=20
> +	/*
> +	 * Bootmem folios are normally pre-HVOed through the =
section-based
> +	 * vmemmap optimization. However, an architecture that can only
> +	 * determine whether it supports HVO after bootmem allocation =
disables
> +	 * the section-based optimization (see
> +	 * section_vmemmap_optimization_disable()), in which case the =
folios
> +	 * were not pre-HVOed and must be optimized now. Pre-HVOed =
folios are
> +	 * skipped.
> +	 */

I'd like to condense these comments to something like:

/*
 * Some architectures do not support section-based vmemmap optimization,
 * so their bootmem folios should be optimized here with folio-based
 * optimization.
 */

Thanks,
Muchun

> +	hugetlb_vmemmap_optimize_folios(h, folio_list);
> +
> 	list_for_each_entry_safe(folio, tmp_f, folio_list, lru) {
> 		/* Subdivide locks to achieve better parallel =
performance */
> 		spin_lock_irqsave(&hugetlb_lock, flags);
> --=20
> 2.56.1.809.ga0b61035b5-goog
>=20


