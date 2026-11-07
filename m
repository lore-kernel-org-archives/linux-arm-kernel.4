Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CDCB606A326
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 06:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CoKpPcgt;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=pQ0SCBKK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=xliLypkGqol0qEpEVa+hTfnI8y9iuSR0fJnpOdphoZo=; b=CoKpPcgty284wq
	mFA8BJJFcK6aKzBnHSOoPD1VFdzQVYJqEDT5TjsEMcQDixaz+gf7I4rzTBhfxzTqlBW2n27sbxXlk
	x2GYfpwSBNv9FYCyUxao8rX8/6Se1iH4pgh7WKSbFbAQefu3s/zWKDBT2wIUyo3tNXzCuAb7sBLON
	udyjt9Csu+60BICbSQaiPsMc6TnwhzC3sMfM+K7Blk/e/yoagHDyWGq5LjpM0YPluc5UktJYxtGQf
	17SOZXcuAasUPZCbGcfqNgHTtjagYIpUsUQ6BOT9jBRwMEjIy9J9yLsRcMY72Vl99+fagCruxSU4B
	ZNaZGtTRKFscShqhSxlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPa9x-0000000EHaF-2CN4;
	Sat, 07 Nov 2026 06:44:17 +0000
Received: from out-134.mta0.migadu.com ([2001:41d0:1004:224b::86] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPa9u-0000000EHZk-367H
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 06:44:16 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=kGVxC57LJnQRDgXx8D0xd95zTBOZXo4vhbKbkir4GP4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794033851; v=1; x=1794638651;
 b=pQ0SCBKKF7yDkPQypqSgjzhBa3VCul4hGS28NKFaCvJ7kGf+XlBoRRMmfzDnIhJDevuOCQ2d
 V/NWfIQMo4t+1jZ4VpyCbdpo3NhceM+djnPUO90G/DCzOGyrM1kpKy+850qChY2uucOR26e60Ho
 oaasVK1+mOQNviKkfI+YTKnY=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by mta12.migadu.com with ESMTPS id d37edd97d7e39205;
	Sat, 07 Nov 2026 06:44:10 +0000
X-Mizu-Trace-ID: d37edd97d7e39205
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=us-ascii
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.200.71.1.16\))
Subject: Re: [PATCH v2 06/20] hugetlb_vmemmap: Allow architectures to
 dynamically disallow HVO
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20261003002123.505555-7-jthoughton@google.com>
Date: Sat, 7 Nov 2026 14:43:48 +0800
Cc: Will Deacon <will@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>,
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
Message-Id: <8814E4B3-5A5A-4874-863A-71FC6E4F3B34@linux.dev>
References: <20261003002123.505555-1-jthoughton@google.com>
 <20261003002123.505555-7-jthoughton@google.com>
To: James Houghton <jthoughton@google.com>
X-Mailer: Apple Mail (2.3901.200.71.1.16)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_224415_290508_A851DE8D 
X-CRM114-Status: GOOD (  21.98  )
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



> On Oct 3, 2026, at 08:21, James Houghton <jthoughton@google.com> =
wrote:
>=20
> For arm64, only some platforms support HVO. Add an arch hook to =
prevent
> HVO from taking affect if the architecture lacks support.
>=20
> It may be the case that arch_supports_hugetlb_vmemmap_optimization()
> returns false at first but eventually returns true. This is the case =
on
> arm64. When this happens, bootmem hugepages won't be immediately =
HVOed,
> but they will be optimized in prep_and_add_bootmem_folios().
>=20
> Signed-off-by: James Houghton <jthoughton@google.com>
> ---
> include/asm-generic/hugetlb.h |  7 +++++++
> mm/hugetlb_vmemmap.c          | 12 ++++++++++++
> 2 files changed, 19 insertions(+)
>=20
> diff --git a/include/asm-generic/hugetlb.h =
b/include/asm-generic/hugetlb.h
> index 635c41cc3479..8d24075d53d4 100644
> --- a/include/asm-generic/hugetlb.h
> +++ b/include/asm-generic/hugetlb.h
> @@ -128,4 +128,11 @@ static inline bool =
gigantic_page_runtime_supported(void)
> }
> #endif /* __HAVE_ARCH_GIGANTIC_PAGE_RUNTIME_SUPPORTED */
>=20
> +#ifndef __HAVE_ARCH_HVO_SUPPORTED
> +static inline bool arch_hugetlb_vmemmap_optimization_supported(void)

I suggest using arch_support_vmemmap_remap (see [1]), which can also be
applied to FS-DAX.

[1] =
https://lore.kernel.org/all/20260903122128.12264-2-songmuchun@bytedance.co=
m/

> +{
> + 	return IS_ENABLED(CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP);
> +}
> +#endif /* __HAVE_ARCH_HVO_SUPPORTED */
> +
> #endif /* _ASM_GENERIC_HUGETLB_H */
> diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
> index 3fdb1e4ce1a1..8596a462fee6 100644
> --- a/mm/hugetlb_vmemmap.c
> +++ b/mm/hugetlb_vmemmap.c
> @@ -16,6 +16,7 @@
> #include <linux/pagewalk.h>
> #include <linux/pgalloc.h>
> #include <linux/vmemmap-optimization.h>
> +#include <linux/hugetlb.h>
>=20
> #include <asm/tlbflush.h>
> #include "hugetlb_vmemmap.h"
> @@ -529,6 +530,9 @@ static bool vmemmap_should_optimize_folio(const =
struct hstate *h, struct folio *
> 	if (!READ_ONCE(vmemmap_optimize_enabled))
> 		return false;
>=20
> +	if (!arch_hugetlb_vmemmap_optimization_supported())
> +		return false;
> +
> 	if (!hugetlb_vmemmap_optimizable(h))
> 		return false;
>=20
> @@ -731,6 +735,14 @@ void __init =
hugetlb_vmemmap_optimize_bootmem_page(unsigned long pfn, unsigned in
> 	if (!READ_ONCE(vmemmap_optimize_enabled))
> 		return;
>=20
> + 	/*
> +	 * Architectures may return false here but true by the time
> +	 * hugetlb_init() is called. In this case, although the folios =
will
> +	 * not be pre-HVOed, they will be optimized in hugetlb_init().
> +	 */
> +	if (!arch_hugetlb_vmemmap_optimization_supported())
> +		return;

I plan to add a new helper, section_vmemmap_optimization_disable() [2],
intended to disable vmemmap optimization in the architectural vmemmap
population path. Since arm64 does not support section-based vmemmap
optimization, section_vmemmap_optimization_disable() should be used =
there.

[2] =
https://lore.kernel.org/all/20261107043122.25650-3-songmuchun@bytedance.co=
m/

Thanks,
Muchun

> +
> 	section_set_compound_order_range(pfn, 1UL << order, order);
> }
>=20
> --=20
> 2.56.0.rc1.315.gc6ed9934b7-goog
>=20


