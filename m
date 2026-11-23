Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE9B606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 20:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IpNSLK+u;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=L77h9FSb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=BwAkFqLrDZuJNQfsb1QIWJWTzXXHyVshwDglsm6PKrE=; b=IpNSLK+uUCmHkD
	rCI+L6ZGKuHpLA1zH2g95j5nba6Nv1YEWomyV5L/e6K6nZpNO4EO8HNEYze+wQC4nOVA7veQ5mdEb
	m+LsNnUpJufssjYW8faqxzaRr119HRZ+wk8bRccPoZuU1gLTKM20byiqoP6p3AV3Zox3we5NIgmkU
	gdkWnlt2DsQOgj4eT4zw4Y1J47okFo/PTlugN0L/IqwxyWTkXBhJtQu6e97pNxFV3WHatsnRAEDQK
	C3P+7RJPO2EIh503dSeFtqeAIhYXmnUNdUR6JYI5fRr8MuDz2XX7r1nkgZ1rkhl7wv4mMSSjy7qX9
	0ENLI+DjXpTYeaR9wbBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVayp-00000004smx-0Isr;
	Mon, 23 Nov 2026 20:49:39 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVayl-00000004slZ-3NaW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 20:49:38 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-c50ac25cdd4so510074366b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 12:49:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795466973; cv=none;
        d=google.com; s=arc-20260327;
        b=rcwzgTg7KyfjyiBIJAc9mk9w3ZfFKbZRAyYxYntNrFAw9ERp+Ry7LgW/rFM9dzZoUg
         hoJjzmF+p47zCIWlthzz37ogw5po8/tjxU6L1q5t8tV80EXZcikBiDfTDpOJFuBggn6X
         RXl+eu/aD/GIYDthNKfMxgEOVRfRk3OkQVgjak28CyoVqVms9dDj8AqOH+RuydInXNh+
         6otVloiVN/ZlT0h5srrunFT/oMVKtZUDIKFxKsV844F/cX/bYhd5YtSMplFJKZBj8NqU
         j6GIHdobN5ZgFZvpi/EgTXlW5pzR/xS+qqD06MrEzQN6+3wMcTg4b0IZqkdKsjKyE/l4
         intg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BwAkFqLrDZuJNQfsb1QIWJWTzXXHyVshwDglsm6PKrE=;
        fh=5aj7A11KpNwXBR3D1oxDAIdonv81mv6vq73W7HtSgHc=;
        b=F8VU6wc9naOIPscJ5yr3t6eP2VxfzQZmwGKH0SnAe2tQTIb4AltC4oXOgWWmuj+ouX
         nHbjSgLEUMXHd88MEFqpxilKJ02E8/JkBuXSUxET1L1qAm12vxUMpTnuz29L097lhQ0/
         boBamdyBu1YubdtL3tSBBwrZqs3QdRp2zL0jKWLj/E7gsVaBrAP+WArtVevC0smlNkf4
         +ZTXyhR6wzL3C3QEUn3qGaxu5de079lSnevYSGBDFyW0NY97dgnlm6lmoymvSzjCZGn1
         Vw1sifaiOiaMp9dUk57hcZnxdoke/stxh7yR4HSn2Ufxb3bKioHs4vNIHJykqrwP+MVM
         SESQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795466973; x=1796071773; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BwAkFqLrDZuJNQfsb1QIWJWTzXXHyVshwDglsm6PKrE=;
        b=L77h9FSb9IvD+BUkGmmZoYpoMg3OZA1A4BTcmV33vmIptRtFE4f6KKr8oh+Lfz+6vb
         6DwhTGNTqwPokwC7Mj7ZjQWEpFpPbMqGIAui0E4C4nXpsb5CVyvAZP0Pfn/VTB3QUWFk
         dseIJBvunK5A56kFfY7P82o/2PhxyhyWA/cQBfcVL8J15MGdjhGdH3xfoGovYYGIl8CF
         gnCTqXUKsQNPseXh8yZp3jV2YfZ6XtxKc+4XM45ZxR6LABfnIpLm3eUrok9/k94HVk1d
         2hGnVZpWJiXnrVauTHUf3IdEHKDJGvu0Jy3vZAaXtH8vhU3BvYERMS5PSPb+rUcWXjzr
         n3Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795466973; x=1796071773;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BwAkFqLrDZuJNQfsb1QIWJWTzXXHyVshwDglsm6PKrE=;
        b=n4JgjX3e8vJ/zf3K8NjXL4ljajL7niNzS+08QdfQ2ZI29qIbKZzSfvEB0Chhd2sbPq
         WESj44tA4+l7Jq7aOWUfj6AJVKCYEE4gkiXFumL29zaX+h875MfqY59v/u9EtyU+Gj8b
         5kyOrrSlX6I45rzdEAUWBxu+rjJ8p274GWVC69pe4ZXp/Y87zCIWkTtPwOA8FQMiGZZh
         6BNY3ZTVF8RO5VW59TOks+Eb+Hvh9V6WWsnb4LRqO/3UxEIDCWcNiLkGtZdPBnd899CR
         dvM26PJsh0Kp7DHwOEs1aYOYIvFMOuKK6vaJxKnLK7YbHNqr3xnJINL/lBJXrpi54m09
         keow==
X-Forwarded-Encrypted: i=1; AL+hErGOL/8kWCdHPzfKPEfxzebbgE+ThuCkcTk5OPTlWZLRp8BBhzJCnOYrrru4HyJwepZ6OEBrAWrGdlVI3Em88XSL@lists.infradead.org
X-Gm-Message-State: APuU4Z+VKzdCgJb5fO8d5bkqcoKOvCKBarisQPmfvD8gIDOdiNOmIn0Q
	XblPFddYkuUPmXiLloxR/9tk8rq8kA2ldp1jevr1YoDasM+yFVKwGjNmIqWXF/Jgef8HaDsY278
	Lm5NVEOiHkPWbhGKOBDfAHq+8tOk/k7oF56I+ivDJ
X-Gm-Gg: AZFdTZeXm3fiCyqST2U2BLnZS0LcKE/OXRBb1ug4apqgnRWx7+VQz1cS0UgVkpPq7Va
	KUcgvgMPg8Zh84TDe7b9s6S1RL3Bfu5xeRVhLvtA6aIE+Msa7cNZa1O5NxrXmwWFzi8BBXxuL+h
	B1ueeGoqcv/Nd6BGML4OMw9Nlrk5YpNYQhyzLj/omUgUNmlbD5meAe6TVmZIZfKRRlXLBfPqTA/
	EvgO4lqrrOmR1/ySVXQNCMSNfNuYlLyR3iD4IpRewJWdEhaq+Ono3NYqlw8ODO+8eAz57lR+SiC
	E0LhXmXcj8XFs6YuUCP6xHsD9yX90rJP/X6IBAnJ2xRTl1J00hXAr9zkSC0DXt+d8cLE8GVO0LS
	SN7NAcwHkuwNGHygShNV2leDRP2/ZLj/mU4TuDp6JfpGmfkuE7obq5bC9fhGVtDPXvxRwzwKQ9B
	jV6vq6jZNPAzfnORuy6ktxJoWaqtw8tqYqFYdBbIBRrFyw5+93nRw=
X-Received: by 2002:a17:906:da0e:b0:c41:731c:534 with SMTP id
 a640c23a62f3a-c513a8590b8mr737596766b.24.1795466972524; Mon, 23 Nov 2026
 12:49:32 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261122184453.2668189-1-jthoughton@google.com>
 <20261122184453.2668189-5-jthoughton@google.com> <4508589C-2E30-4DAB-9465-73121835D0D8@linux.dev>
In-Reply-To: <4508589C-2E30-4DAB-9465-73121835D0D8@linux.dev>
From: James Houghton <jthoughton@google.com>
Date: Mon, 23 Nov 2026 15:48:54 -0500
X-Gm-Features: Aa3M54q05It1n2eRJ6pQdCziUJwvWp3TC8VwynDcMWXjuCwyJF5MV-bvGGuFHUc
Message-ID: <CADrL8HUstWR2pajfYYzRqL7HziVfzZAXJas6MqJkK6pVxSzXEg@mail.gmail.com>
Subject: Re: [PATCH v3 04/19] hugetlb_vmemmap: Use try_update_vmemmap_pte to
 update in-use PTEs
To: Muchun Song <muchun.song@linux.dev>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>
Cc: Oscar Salvador <osalvador@suse.de>, Andrew Morton <akpm@linux-foundation.org>, 
	Kefeng Wang <wangkefeng.wang@huawei.com>, Nikos Nikoleris <nikos.nikoleris@arm.com>, 
	Linu Cherian <linu.cherian@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	David Hildenbrand <david@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Nanyong Sun <sunnanyong@huawei.com>, Yu Zhao <yuzhao@google.com>, 
	Frank van der Linden <fvdl@google.com>, David Rientjes <rientjes@google.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_124936_092176_C9939CC6 
X-CRM114-Status: GOOD (  46.06  )
X-Spam-Score: -17.6 (-----------------)
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
X-Spam-Status: No, score=-23.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, Nov 22, 2026 at 9:47=E2=80=AFPM Muchun Song <muchun.song@linux.dev>=
 wrote:
>
>
>
> > On Nov 23, 2026, at 02:44, James Houghton <jthoughton@google.com> wrote=
:
> >
> > set_pte_at() cannot be used to replace in-use vmemmap PTEs on arm64, so
> > replace it with a more specific routine, try_update_vmemmap_pte().
> >
> > try_update_vmemmap_pte() is used for modifying page table entries such
> > that there is a guarantee that no fault will be taken.
> >
> > For the generic implementation, please note one difference: set_pte()
> > does not invoke page_table_check_ptes_set(), but set_pte_at(), the call
> > we are about to replace, does. However, this is a functional no-op
> > because page_table_check_ptes_set() does nothing for init_mm PTEs, whic=
h
> > vmemmap PTEs are.
> >
> > Signed-off-by: James Houghton <jthoughton@google.com>
> > ---
> > arch/loongarch/include/asm/pgtable.h |  2 ++
> > arch/riscv/include/asm/pgtable.h     |  2 ++
> > arch/x86/include/asm/pgtable.h       |  2 ++
> > include/linux/pgtable.h              | 22 +++++++++++++++++++
> > mm/hugetlb_vmemmap.c                 | 32 +++++++++++++++++++++++-----
> > 5 files changed, 55 insertions(+), 5 deletions(-)
> >
> > diff --git a/arch/loongarch/include/asm/pgtable.h b/arch/loongarch/incl=
ude/asm/pgtable.h
> > index f87603135131..123eda3f6035 100644
> > --- a/arch/loongarch/include/asm/pgtable.h
> > +++ b/arch/loongarch/include/asm/pgtable.h
> > @@ -633,6 +633,8 @@ static inline long pmd_protnone(pmd_t pmd)
> > #define pmd_leaf(pmd)         ((pmd_val(pmd) & _PAGE_HUGE) !=3D 0)
> > #define pud_leaf(pud)         ((pud_val(pud) & _PAGE_HUGE) !=3D 0)
> >
> > +#define ARCH_WANTS_GENERIC_POPULATE_VMEMMAP_PTE
> > +
> > /*
> >  * We provide our own get_unmapped area to cope with the virtual aliasi=
ng
> >  * constraints placed on us by the cache architecture.
> > diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/=
pgtable.h
> > index 2ebd5fa5adc5..c8d05bc12cc8 100644
> > --- a/arch/riscv/include/asm/pgtable.h
> > +++ b/arch/riscv/include/asm/pgtable.h
> > @@ -1172,6 +1172,8 @@ static inline pud_t pud_modify(pud_t pud, pgprot_=
t newprot)
> >
> > #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
> >
> > +#define ARCH_WANTS_GENERIC_POPULATE_VMEMMAP_PTE
> > +
> > /*
> >  * Encode/decode swap entries and swap PTEs. Swap PTEs are all PTEs tha=
t
> >  * are !pte_none() && !pte_present().
> > diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgta=
ble.h
> > index 000fc6c1ca37..271cdc61de3a 100644
> > --- a/arch/x86/include/asm/pgtable.h
> > +++ b/arch/x86/include/asm/pgtable.h
> > @@ -1372,6 +1372,8 @@ static inline pmd_t pmdp_establish(struct vm_area=
_struct *vma,
> > }
> > #endif
> >
> > +#define ARCH_WANTS_GENERIC_POPULATE_VMEMMAP_PTE
> > +
> > #ifdef CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD
> > static inline pud_t pudp_establish(struct vm_area_struct *vma,
> >               unsigned long address, pud_t *pudp, pud_t pud)
> > diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> > index bc1353f03b08..ab33df268955 100644
> > --- a/include/linux/pgtable.h
> > +++ b/include/linux/pgtable.h
> > @@ -458,6 +458,28 @@ static inline void set_ptes(struct mm_struct *mm, =
unsigned long addr,
> > #endif
> > #define set_pte_at(mm, addr, ptep, pte) set_ptes(mm, addr, ptep, pte, 1=
)
> >
> > +#ifdef ARCH_WANTS_GENERIC_POPULATE_VMEMMAP_PTE
>
> Why not ARCH_WANTS_VMEMMAP_UPDATE_PTE? Then x86, loogarch and RISC-V do n=
ot need define
> this macro in their ptable.h.

You're basically asking to make this opt-out instead of opt-in, right?

I like making the different architectures explicitly opt in to the
generic implementation; it forces any new architecture to decide if
the generic implementation is correct for them. But I don't feel
strongly.

I'll switch it to opt-out in v4 unless you or someone else tells me otherwi=
se.

>
> > +/*
> > + * try_update_vmemmap_pte - Remap PTEs used by the vmemmap.
> > + * @addr: Base address of the remapped PTE.
> > + * @ptep: Page table pointer to be overwritten.
> > + * @pte: Page table entry to write.
> > + *
> > + * This function is only to be used to update PTEs that map the vmemma=
p. The
> > + * only valid transitions supported by this function are: leaf-level
> > + * (PAGE_SIZE), valid-to-valid. The pfn and prot bits may be changed.
> > + *
> > + * Implementations of this function must ensure that, while the update=
 is taking
> > + * place, CPUs will not fault on the remapped virtual address.
> > + */
> > +static inline int try_update_vmemmap_pte(unsigned long addr, pte_t *pt=
ep,
> > +                                      pte_t pte)
>
> Please rename it to vmemmap_update_pte, all HVO-related helpers will be p=
refixed
> with vmemmap.

Okay, will do.

>
> Again, I still recommend having this function return void. That will make=
 the
> overall code simpler. If we actually run into related issues in the futur=
e, we
> can add support for it then. I don't want to introduce unnecessary code
> maintenance now.

Thanks. I will just point back to my reply from v2[1]. I hope Catalin
or Will have thoughts on this.

[1] https://lore.kernel.org/linux-mm/CADrL8HWNaurYHGnpvC9qwr6bVU74YhhucCuho=
VYcvqmSX+R6+Q@mail.gmail.com/

>
> Thanks,
> Muchun
>
> > +{
> > +     set_pte(ptep, pte);
> > +     return 0;
> > +}
> > +#endif
> > +
> > #ifndef __HAVE_ARCH_PTEP_SET_ACCESS_FLAGS
> > extern int ptep_set_access_flags(struct vm_area_struct *vma,
> >                                unsigned long address, pte_t *ptep,
> > diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
> > index 2e9cf8d39c89..b4d0311bcc4a 100644
> > --- a/mm/hugetlb_vmemmap.c
> > +++ b/mm/hugetlb_vmemmap.c
> > @@ -218,15 +218,19 @@ static int alloc_vmemmap_page_list(struct list_he=
ad *head,
> >       return -ENOMEM;
> > }
> >
> > +/*
> > + * Copy @src into the first page on @vmemmap_pages and return it. The =
page is
> > + * left on the list; the caller must remove it only once it has succes=
sfully
> > + * been installed in the vmemmap.
> > + */
> > static struct page *vmemmap_dup_page_from_list(const struct page *src,
> >               struct list_head *vmemmap_pages)
> > {
> >       struct page *dst =3D list_first_entry(vmemmap_pages, struct page,=
 lru);
> >
> > -     list_del(&dst->lru);
> >       copy_page(page_address(dst), page_address(src));
> >
> > -     /* Ensure updates to @dst page are visible before set_pte_at(). *=
/
> > +     /* Ensure updates to @dst page are visible before try_update_vmem=
map_pte(). */
> >       smp_wmb();
> >
> >       return dst;
> > @@ -248,6 +252,8 @@ static int vmemmap_optimize_pte(pte_t *pte, unsigne=
d long addr,
> >       const struct page *page =3D (const struct page *)addr;
> >       const struct folio *folio =3D page_folio(page);
> >       struct page *src =3D pte_page(ptep_get(pte)), *dst;
> > +     bool dup =3D false;
> > +     int ret;
> >
> >       if (likely(vmemmap_optimizable_pfn(page_to_pfn(page), folio_order=
(folio)))) {
> >               dst =3D folio_vmemmap_shared_tail_page(folio);
> > @@ -255,16 +261,27 @@ static int vmemmap_optimize_pte(pte_t *pte, unsig=
ned long addr,
> >                       return -ENOMEM;
> >       } else {
> >               dst =3D vmemmap_dup_page_from_list(src, walk->vmemmap_pag=
es);
> > +             dup =3D true;
> >       }
> >
> > -     list_add(&src->lru, walk->vmemmap_pages);
> >       /*
> >        * Map the shared tail page writable intentionally. A lockless ge=
t that
> >        * read a non-zero refcount before the remap can still do its cmp=
xchg
> >        * after it. The refcount is zero, so the cmpxchg fails and leave=
s the
> >        * page unchanged.
> >        */
> > -     set_pte_at(&init_mm, addr, pte, mk_pte(dst, PAGE_KERNEL));
> > +     ret =3D try_update_vmemmap_pte(addr, pte, mk_pte(dst, PAGE_KERNEL=
));
> > +     if (ret)
> > +             return ret;
> > +
> > +     /*
> > +      * We successfully overwrote the vmemmap PTE, so the page that wa=
s just
> > +      * unmapped can be freed, and if we mapped a duplicated page, rem=
ove it
> > +      * from the list so that it doesn't get freed later.
> > +      */
> > +     if (dup)
> > +             list_del(&dst->lru);
> > +     list_add(&src->lru, walk->vmemmap_pages);
> >
> >       return 0;
> > }
> > @@ -275,6 +292,7 @@ static int vmemmap_restore_pte(pte_t *pte, unsigned=
 long addr,
> >       const struct page *page =3D (const struct page *)addr;
> >       const struct folio *folio =3D page_folio(page);
> >       struct page *src =3D pte_page(ptep_get(pte)), *dst, *tail;
> > +     int ret;
> >
> >       if (unlikely(!vmemmap_optimizable_pfn(page_to_pfn(page), folio_or=
der(folio))))
> >               return 0;
> > @@ -291,7 +309,11 @@ static int vmemmap_restore_pte(pte_t *pte, unsigne=
d long addr,
> >               return 0;
> >
> >       dst =3D vmemmap_dup_page_from_list(src, walk->vmemmap_pages);
> > -     set_pte_at(&init_mm, addr, pte, mk_pte(dst, PAGE_KERNEL));
> > +     ret =3D try_update_vmemmap_pte(addr, pte, mk_pte(dst, PAGE_KERNEL=
));
> > +     if (ret)
> > +             return ret;
> > +
> > +     list_del(&dst->lru);
> >
> >       return 0;
> > }
> > --
> > 2.56.1.809.ga0b61035b5-goog
> >
>

