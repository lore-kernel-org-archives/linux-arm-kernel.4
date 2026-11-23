Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DBBC606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 03:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ROq84RIW;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=MbmIxTcQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=mmVRvdK02N6AgoL3Fkb1Slsd4s0/SBaF5vDPeDu6iRw=; b=ROq84RIWLBLyKx
	97dHL1LlryhJY7GrQw4/iI444BKCsv4hKrIionlRG5goyrcJQDK2MNBpTNDFzAgc+TcsbOt6uokZH
	mrE3QJRHsG/+VDg9u8opBChk0OlLm4rAdeN5eu9tN3SCND4tBcKqEsAFUHJ2mq6a/jh2fxsip8Zry
	FF67aRliq57HKcz+bm3cOwuQtEvIxDU5ZI5n8K4kjaW/2vteUXJ1lchr/KdUDgWNvRVOBrlJOttj2
	DDNycQF8Lo+bMxbe/XI1628bTA64Q0NBz0W/xvBczz9VFKZNJ81Eh20IKcAHCzXgWpFU/zq5QSgaf
	HFaisxUzp5DvR2io1kGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVKdm-00000002CKA-0fro;
	Mon, 23 Nov 2026 03:22:50 +0000
Received: from out-204.mta0.migadu.com ([2001:41d0:1004:224b::cc] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVKdi-00000002CJi-3nR2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 03:22:48 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=/mnPk6TbiEx963fDemDdeJymjABb+Fn9UESDkxFlWro=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795404164; v=1; x=1796008964;
 b=MbmIxTcQ3G8tt5wpa6I92LbDuMVfs1806E7cCC5PBI2vMou21aB8rNHj0nuJts8H03VVD2PI
 9TAupc99w0fWffVFDQy168Kz8ejfAY9iYpPuItzqQ6Uyb/Izcz9NyUgvR3SABuMbZKKvSgRXEae
 vJQh1W78cvOAENKbObhR4Edc=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id a40b5ee157b951a8;
	Mon, 23 Nov 2026 03:22:43 +0000
X-Mizu-Trace-ID: a40b5ee157b951a8
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=us-ascii
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.200.71.1.16\))
Subject: Re: [PATCH v3 11/19] arm64/mm: Align vmemmap to maximal folio size
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20261122184453.2668189-12-jthoughton@google.com>
Date: Mon, 23 Nov 2026 11:22:18 +0800
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
Message-Id: <ED44F18E-E7FF-4B53-9B5B-3201F1100154@linux.dev>
References: <20261122184453.2668189-1-jthoughton@google.com>
 <20261122184453.2668189-12-jthoughton@google.com>
To: James Houghton <jthoughton@google.com>
X-Mailer: Apple Mail (2.3901.200.71.1.16)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_192247_159207_9F6F22DE 
X-CRM114-Status: GOOD (  22.08  )
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
> With CONFIG_VMEMMAP_OPTIMIZATION, compound_head() derives a tail =
page's
> head by masking its address. This requires the head struct page of =
every
> folio to be naturally aligned to the folio's vmemmap size, up to
> MAX_FOLIO_VMEMMAP_ALIGN.
>=20
> On arm64, the vmemmap is offset by memstart_addr, which is only =
aligned
> to ARM64_MEMSTART_ALIGN: as little as 512M with 64K pages, where 16G
> CONT_PMD hugetlb folios exist. VMEMMAP_START itself is sufficiently
> aligned for all supported page sizes and VA sizes.
>=20
> Raise ARM64_MEMSTART_ALIGN to cover MAX_FOLIO_VMEMMAP_ALIGN, and =
assert
> at build time that VMEMMAP_START is suitably aligned. This is a no-op
> until arm64 enables HVO, which selects CONFIG_VMEMMAP_OPTIMIZATION.
>=20
> Signed-off-by: James Houghton <jthoughton@google.com>
> ---
> arch/arm64/mm/init.c | 18 ++++++++++++++++--
> 1 file changed, 16 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
> index 4e7682dfe366..7186d86afc41 100644
> --- a/arch/arm64/mm/init.c
> +++ b/arch/arm64/mm/init.c
> @@ -35,6 +35,7 @@
> #include <linux/kmemleak.h>
> #include <linux/execmem.h>
> #include <linux/arm-rsi-cmds.h>
> +#include <linux/vmemmap-optimization.h>
>=20
>=20
> #include <asm/boot.h>
> @@ -92,11 +93,22 @@ phys_addr_t __ro_after_init arm64_dma_phys_limit;
>  * in the virtual address space.
>  */
> #if ARM64_MEMSTART_SHIFT < SECTION_SIZE_BITS
> -#define ARM64_MEMSTART_ALIGN	(1UL << SECTION_SIZE_BITS)
> +#define ARM64_MEMSTART_BASE_ALIGN	(1UL << SECTION_SIZE_BITS)
> #else
> -#define ARM64_MEMSTART_ALIGN	(1UL << ARM64_MEMSTART_SHIFT)
> +#define ARM64_MEMSTART_BASE_ALIGN	(1UL << ARM64_MEMSTART_SHIFT)
> #endif
>=20
> +/*
> + * With CONFIG_VMEMMAP_OPTIMIZATION, compound_head() masks the =
address of a
> + * tail page to find its head, so the head struct page of every folio =
must be
> + * naturally aligned to the folio's vmemmap size. The vmemmap is =
offset by
> + * memstart_addr, so memstart_addr must be aligned to the largest =
folio size.
> + */
> +#define ARM64_VMEMMAP_OPT_ALIGN						=
\
> +	PFN_PHYS(MAX_FOLIO_VMEMMAP_ALIGN / sizeof(struct page))
> +#define ARM64_MEMSTART_ALIGN						=
\
> +	max_t(phys_addr_t, ARM64_MEMSTART_BASE_ALIGN, =
ARM64_VMEMMAP_OPT_ALIGN)
> +
> static void __init arch_reserve_crashkernel(void)
> {
> 	unsigned long long crash_base, crash_size, cma_size =3D 0;
> @@ -218,6 +230,8 @@ void __init arm64_memblock_init(void)
> 	/*
> 	 * Select a suitable value for the base of physical memory.
> 	 */
> +	BUILD_BUG_ON(MAX_FOLIO_VMEMMAP_ALIGN &&
> +		     !IS_ALIGNED(VMEMMAP_START, =
MAX_FOLIO_VMEMMAP_ALIGN));

We already have a sanity check in spares_init(). Doesn't it work? If we =
really
need a check here, I think we should use compound_info_has_mask() for =
the guard
instead of MAX_FOLIO_VMEMMAP_ALIGN.

Thanks,
Muchun

> 	memstart_addr =3D round_down(memblock_start_of_DRAM(),
> 				   ARM64_MEMSTART_ALIGN);
>=20
> --=20
> 2.56.1.809.ga0b61035b5-goog
>=20


