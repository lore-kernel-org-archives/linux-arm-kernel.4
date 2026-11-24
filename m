Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90FF0606A326
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 02:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=r6t7x8w9;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=t6cAU+2B
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=18r5tD9y2ALIX7X7Kv9k6QsRP9npRMqolTYhIPTl4so=; b=r6t7x8w9rmCtIN
	jmhUVzXNOQlbLxmHtmwXglpBaPTB+0eAqhwO82wzEGdztccRidZ9tEbIvNTbG5PpH8e9kPGZIkR5Z
	ISViI6L3bSTLqnwVDRXsKI7cVx7UsEsx/8gkG6S5Dozp7NwiwYWjpOOCPpdYmnqSZCNOj7oR7PJEg
	rxF0yNJS0YcnAgK4vBZsxjAv/eMEMoPnQsn8a8SUyaghvtSntIX93IfLy0o4VB8xmvVH8dEMn5Y3a
	1IpLIh/nDRU27UA74BKpuPOxNyEAC3UWQZCt6Y5cqHVK/Oo454KWxy8Ur8j1hksi6F2To3WGCqJ+b
	EW8I6hhtM+CCVq/GloWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVgI2-00000005Md2-3GFi;
	Tue, 24 Nov 2026 02:29:50 +0000
Received: from out-98.mta0.migadu.com ([2001:41d0:1004:224b::62] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVgHz-00000005Mcd-0liJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 02:29:49 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=bKdavHn4Gjkl6Bx3sYPvnFvwvriR5ITOlurhR8mBhXw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795487381; v=1; x=1796092181;
 b=t6cAU+2Bv3v1WcGrFVBGWgpe8IFNzbhM2ln3PsfgIirTnzYYZFzT2Zqzyt+Rku3+xT7EKtmH
 OvViD/l6cknN8+M4I46IYyN8V50z4iUVGVd2EmagOWuRL6HyyBtwUfHSFoNsbn1/QvyUuHvCfL0
 9heleEeqkkj80GZqvmXAtp3o=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 42d52afc46ba6af1;
	Tue, 24 Nov 2026 02:29:40 +0000
X-Mizu-Trace-ID: 42d52afc46ba6af1
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=utf-8
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.200.71.1.16\))
Subject: Re: [PATCH v3 04/19] hugetlb_vmemmap: Use try_update_vmemmap_pte to
 update in-use PTEs
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <CADrL8HUstWR2pajfYYzRqL7HziVfzZAXJas6MqJkK6pVxSzXEg@mail.gmail.com>
Date: Tue, 24 Nov 2026 10:29:22 +0800
Cc: Muchun Song <muchun.song@linux.dev>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>,
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
Message-Id: <4A195604-B83B-4608-B32E-5F6CC85AE96F@linux.dev>
References: <20261122184453.2668189-1-jthoughton@google.com>
 <20261122184453.2668189-5-jthoughton@google.com>
 <4508589C-2E30-4DAB-9465-73121835D0D8@linux.dev>
 <CADrL8HUstWR2pajfYYzRqL7HziVfzZAXJas6MqJkK6pVxSzXEg@mail.gmail.com>
To: James Houghton <jthoughton@google.com>
X-Mailer: Apple Mail (2.3901.200.71.1.16)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_182948_201864_B1E2083C 
X-CRM114-Status: GOOD (  33.75  )
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



> On Nov 24, 2026, at 04:48, James Houghton <jthoughton@google.com> =
wrote:
>=20
> On Sun, Nov 22, 2026 at 9:47=E2=80=AFPM Muchun Song =
<muchun.song@linux.dev> wrote:
>>=20
>>=20
>>=20
>>> On Nov 23, 2026, at 02:44, James Houghton <jthoughton@google.com> =
wrote:
>>>=20
>>> set_pte_at() cannot be used to replace in-use vmemmap PTEs on arm64, =
so
>>> replace it with a more specific routine, try_update_vmemmap_pte().
>>>=20
>>> try_update_vmemmap_pte() is used for modifying page table entries =
such
>>> that there is a guarantee that no fault will be taken.
>>>=20
>>> For the generic implementation, please note one difference: =
set_pte()
>>> does not invoke page_table_check_ptes_set(), but set_pte_at(), the =
call
>>> we are about to replace, does. However, this is a functional no-op
>>> because page_table_check_ptes_set() does nothing for init_mm PTEs, =
which
>>> vmemmap PTEs are.
>>>=20
>>> Signed-off-by: James Houghton <jthoughton@google.com>
>>> ---
>>> arch/loongarch/include/asm/pgtable.h |  2 ++
>>> arch/riscv/include/asm/pgtable.h     |  2 ++
>>> arch/x86/include/asm/pgtable.h       |  2 ++
>>> include/linux/pgtable.h              | 22 +++++++++++++++++++
>>> mm/hugetlb_vmemmap.c                 | 32 =
+++++++++++++++++++++++-----
>>> 5 files changed, 55 insertions(+), 5 deletions(-)
>>>=20
>>> diff --git a/arch/loongarch/include/asm/pgtable.h =
b/arch/loongarch/include/asm/pgtable.h
>>> index f87603135131..123eda3f6035 100644
>>> --- a/arch/loongarch/include/asm/pgtable.h
>>> +++ b/arch/loongarch/include/asm/pgtable.h
>>> @@ -633,6 +633,8 @@ static inline long pmd_protnone(pmd_t pmd)
>>> #define pmd_leaf(pmd)         ((pmd_val(pmd) & _PAGE_HUGE) !=3D 0)
>>> #define pud_leaf(pud)         ((pud_val(pud) & _PAGE_HUGE) !=3D 0)
>>>=20
>>> +#define ARCH_WANTS_GENERIC_POPULATE_VMEMMAP_PTE
>>> +
>>> /*
>>> * We provide our own get_unmapped area to cope with the virtual =
aliasing
>>> * constraints placed on us by the cache architecture.
>>> diff --git a/arch/riscv/include/asm/pgtable.h =
b/arch/riscv/include/asm/pgtable.h
>>> index 2ebd5fa5adc5..c8d05bc12cc8 100644
>>> --- a/arch/riscv/include/asm/pgtable.h
>>> +++ b/arch/riscv/include/asm/pgtable.h
>>> @@ -1172,6 +1172,8 @@ static inline pud_t pud_modify(pud_t pud, =
pgprot_t newprot)
>>>=20
>>> #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
>>>=20
>>> +#define ARCH_WANTS_GENERIC_POPULATE_VMEMMAP_PTE
>>> +
>>> /*
>>> * Encode/decode swap entries and swap PTEs. Swap PTEs are all PTEs =
that
>>> * are !pte_none() && !pte_present().
>>> diff --git a/arch/x86/include/asm/pgtable.h =
b/arch/x86/include/asm/pgtable.h
>>> index 000fc6c1ca37..271cdc61de3a 100644
>>> --- a/arch/x86/include/asm/pgtable.h
>>> +++ b/arch/x86/include/asm/pgtable.h
>>> @@ -1372,6 +1372,8 @@ static inline pmd_t pmdp_establish(struct =
vm_area_struct *vma,
>>> }
>>> #endif
>>>=20
>>> +#define ARCH_WANTS_GENERIC_POPULATE_VMEMMAP_PTE
>>> +
>>> #ifdef CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD
>>> static inline pud_t pudp_establish(struct vm_area_struct *vma,
>>>              unsigned long address, pud_t *pudp, pud_t pud)
>>> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
>>> index bc1353f03b08..ab33df268955 100644
>>> --- a/include/linux/pgtable.h
>>> +++ b/include/linux/pgtable.h
>>> @@ -458,6 +458,28 @@ static inline void set_ptes(struct mm_struct =
*mm, unsigned long addr,
>>> #endif
>>> #define set_pte_at(mm, addr, ptep, pte) set_ptes(mm, addr, ptep, =
pte, 1)
>>>=20
>>> +#ifdef ARCH_WANTS_GENERIC_POPULATE_VMEMMAP_PTE
>>=20
>> Why not ARCH_WANTS_VMEMMAP_UPDATE_PTE? Then x86, loogarch and RISC-V =
do not need define
>> this macro in their ptable.h.
>=20
> You're basically asking to make this opt-out instead of opt-in, right?

Yes, exactly.

>=20
> I like making the different architectures explicitly opt in to the
> generic implementation; it forces any new architecture to decide if
> the generic implementation is correct for them. But I don't feel
> strongly.

We already have an opt-in config: ARCH_WANT_OPTIMIZE_HUGETLB_VMEMMAP.
It already forces new architectures to pay attention to it.

Thanks,
Muchun

>=20
> I'll switch it to opt-out in v4 unless you or someone else tells me =
otherwise.
>=20
>>=20
>>> +/*
>>> + * try_update_vmemmap_pte - Remap PTEs used by the vmemmap.
>>> + * @addr: Base address of the remapped PTE.
>>> + * @ptep: Page table pointer to be overwritten.
>>> + * @pte: Page table entry to write.
>>> + *
>>> + * This function is only to be used to update PTEs that map the =
vmemmap. The
>>> + * only valid transitions supported by this function are: =
leaf-level
>>> + * (PAGE_SIZE), valid-to-valid. The pfn and prot bits may be =
changed.
>>> + *
>>> + * Implementations of this function must ensure that, while the =
update is taking
>>> + * place, CPUs will not fault on the remapped virtual address.
>>> + */
>>> +static inline int try_update_vmemmap_pte(unsigned long addr, pte_t =
*ptep,
>>> +                                      pte_t pte)
>>=20
>> Please rename it to vmemmap_update_pte, all HVO-related helpers will =
be prefixed
>> with vmemmap.
>=20
> Okay, will do.
>=20
>>=20
>> Again, I still recommend having this function return void. That will =
make the
>> overall code simpler. If we actually run into related issues in the =
future, we
>> can add support for it then. I don't want to introduce unnecessary =
code
>> maintenance now.
>=20
> Thanks. I will just point back to my reply from v2[1]. I hope Catalin
> or Will have thoughts on this.
>=20
> [1] =
https://lore.kernel.org/linux-mm/CADrL8HWNaurYHGnpvC9qwr6bVU74YhhucCuhoVYc=
vqmSX+R6+Q@mail.gmail.com/
>=20
>>=20
>> Thanks,
>> Muchun
>>=20
>>> +{
>>> +     set_pte(ptep, pte);
>>> +     return 0;
>>> +}
>>> +#endif
>>> +
>>> #ifndef __HAVE_ARCH_PTEP_SET_ACCESS_FLAGS
>>> extern int ptep_set_access_flags(struct vm_area_struct *vma,
>>>                               unsigned long address, pte_t *ptep,
>>> diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
>>> index 2e9cf8d39c89..b4d0311bcc4a 100644
>>> --- a/mm/hugetlb_vmemmap.c
>>> +++ b/mm/hugetlb_vmemmap.c
>>> @@ -218,15 +218,19 @@ static int alloc_vmemmap_page_list(struct =
list_head *head,
>>>      return -ENOMEM;
>>> }
>>>=20
>>> +/*
>>> + * Copy @src into the first page on @vmemmap_pages and return it. =
The page is
>>> + * left on the list; the caller must remove it only once it has =
successfully
>>> + * been installed in the vmemmap.
>>> + */
>>> static struct page *vmemmap_dup_page_from_list(const struct page =
*src,
>>>              struct list_head *vmemmap_pages)
>>> {
>>>      struct page *dst =3D list_first_entry(vmemmap_pages, struct =
page, lru);
>>>=20
>>> -     list_del(&dst->lru);
>>>      copy_page(page_address(dst), page_address(src));
>>>=20
>>> -     /* Ensure updates to @dst page are visible before =
set_pte_at(). */
>>> +     /* Ensure updates to @dst page are visible before =
try_update_vmemmap_pte(). */
>>>      smp_wmb();
>>>=20
>>>      return dst;
>>> @@ -248,6 +252,8 @@ static int vmemmap_optimize_pte(pte_t *pte, =
unsigned long addr,
>>>      const struct page *page =3D (const struct page *)addr;
>>>      const struct folio *folio =3D page_folio(page);
>>>      struct page *src =3D pte_page(ptep_get(pte)), *dst;
>>> +     bool dup =3D false;
>>> +     int ret;
>>>=20
>>>      if (likely(vmemmap_optimizable_pfn(page_to_pfn(page), =
folio_order(folio)))) {
>>>              dst =3D folio_vmemmap_shared_tail_page(folio);
>>> @@ -255,16 +261,27 @@ static int vmemmap_optimize_pte(pte_t *pte, =
unsigned long addr,
>>>                      return -ENOMEM;
>>>      } else {
>>>              dst =3D vmemmap_dup_page_from_list(src, =
walk->vmemmap_pages);
>>> +             dup =3D true;
>>>      }
>>>=20
>>> -     list_add(&src->lru, walk->vmemmap_pages);
>>>      /*
>>>       * Map the shared tail page writable intentionally. A lockless =
get that
>>>       * read a non-zero refcount before the remap can still do its =
cmpxchg
>>>       * after it. The refcount is zero, so the cmpxchg fails and =
leaves the
>>>       * page unchanged.
>>>       */
>>> -     set_pte_at(&init_mm, addr, pte, mk_pte(dst, PAGE_KERNEL));
>>> +     ret =3D try_update_vmemmap_pte(addr, pte, mk_pte(dst, =
PAGE_KERNEL));
>>> +     if (ret)
>>> +             return ret;
>>> +
>>> +     /*
>>> +      * We successfully overwrote the vmemmap PTE, so the page that =
was just
>>> +      * unmapped can be freed, and if we mapped a duplicated page, =
remove it
>>> +      * from the list so that it doesn't get freed later.
>>> +      */
>>> +     if (dup)
>>> +             list_del(&dst->lru);
>>> +     list_add(&src->lru, walk->vmemmap_pages);
>>>=20
>>>      return 0;
>>> }
>>> @@ -275,6 +292,7 @@ static int vmemmap_restore_pte(pte_t *pte, =
unsigned long addr,
>>>      const struct page *page =3D (const struct page *)addr;
>>>      const struct folio *folio =3D page_folio(page);
>>>      struct page *src =3D pte_page(ptep_get(pte)), *dst, *tail;
>>> +     int ret;
>>>=20
>>>      if (unlikely(!vmemmap_optimizable_pfn(page_to_pfn(page), =
folio_order(folio))))
>>>              return 0;
>>> @@ -291,7 +309,11 @@ static int vmemmap_restore_pte(pte_t *pte, =
unsigned long addr,
>>>              return 0;
>>>=20
>>>      dst =3D vmemmap_dup_page_from_list(src, walk->vmemmap_pages);
>>> -     set_pte_at(&init_mm, addr, pte, mk_pte(dst, PAGE_KERNEL));
>>> +     ret =3D try_update_vmemmap_pte(addr, pte, mk_pte(dst, =
PAGE_KERNEL));
>>> +     if (ret)
>>> +             return ret;
>>> +
>>> +     list_del(&dst->lru);
>>>=20
>>>      return 0;
>>> }
>>> --
>>> 2.56.1.809.ga0b61035b5-goog



