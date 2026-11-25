Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DCB8606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 16:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fVnEh4HI;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZID8ZcQM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=SH3WD86btuINr/uxcoF6S242mnrN0umh75GOIi7csNw=; b=fVnEh4HIZbreMa
	g2XyyQe1DH1HDgLcs9xOc7m2jB4jH36TVVsGmBMJTWxWu+wd8sgH0wR+4aeVPbBSLlafgmO2fYtHL
	uFBhovGaICAWojkmdcwKkjsaCCc8F6PK9mbh0iNYte/XKe1/50os+cG69DnfQvSYTULzUcb9SXhg7
	lsuRzfGUhnr3ZlPHI6W0OCV6XZtvLgHpHdbuJVQ2eVhNhCYl86zZw7H0ev3rEYl1Fy4a2+M0TeE5f
	qEc3F5LuPmLuQ8bVUCY32nFkAbTsmI+eZ3RX4iVo44dYLd0AIxYuz0Yqz8FGIYVmjnXsD1SB+Eigu
	QfHnO0377TEYfOa3FEtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWFZJ-0000000AV7o-3hMy;
	Wed, 25 Nov 2026 16:10:02 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWFZF-0000000AV65-2ZOA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 16:10:00 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-c5126505cb3so773092766b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 08:09:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795622995; cv=none;
        d=google.com; s=arc-20260327;
        b=SpCsnj6aZwUrxym6icUJhnloVLpjLIUX3POu3IEvzXF53ScG65d+pz3f4NWK6WSQH/
         NYXY7UV57zHkMgdGAh5gwHjywsbQybRT0YJJaK01cnHx2A+xOmcrnGSUKIL6HFeMGomu
         /pVYKbGQcDE3s38AXiE3iEjgj/d0c9HCRsX8KMNgO1seR09BvywETAKX0AzOoHI9CWjK
         meUkH40q8AndngVJQYxpvYcHAFHx3fAdFXeO67DEz9QqY2uuL/HvdqYoHyz+cU9vk6pv
         ajad0OdpfWqAKGWNM4Y5HmtPBiznjmBbYxUfcrpvgBq0elIiO50pboUWsmPnRdrO6aDC
         nX4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SH3WD86btuINr/uxcoF6S242mnrN0umh75GOIi7csNw=;
        fh=R8ImJiduEBNC7n6/q7bShW2xynwWYsCygHwlhpTTzac=;
        b=IOsIWiMv9cEmA+t5HIVSBrrg9hcXCEG4FwPbitig1Y4KtxMwmsCjLtDpoCZ3DZkWuN
         OsfStTDO8OOx1GiX9U3N/+NIBmsoAsclXkH/aeFdPp76EV4fCwjYzsGJFmt0ZbLZjfUf
         vWxbd6t0jnJZ87VXGOG5q4nt7PbCgK0e0d0bzn/7sCxGyBaXm3HAFIhra021JqUJUZnW
         ciCBpUxJvPuVwiYJ9ggwiwQsb7/se+YtKI9HgvK38gYOTQdp8NjEZ+J4WO5z1zzVrgs/
         q0WXQUhQZbszTqW3Z+zc49L9szfdWPMLpl2nsaLcYQjSZrLL8AptzIJ96QqJbGH2AeF5
         ByRQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795622995; x=1796227795; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SH3WD86btuINr/uxcoF6S242mnrN0umh75GOIi7csNw=;
        b=ZID8ZcQMxmP9TI8edDGKD/vAs24JoTT7PVb50uvCOzMwJOuhivvuBWQBhKnoSgA/16
         DWbLQOoKB7kzOyt/f8XlwPCRQ4K51s6DgL2AFdyZ9sfiLWuNu7RJKJWXQuEPppsvw41B
         YLHROHV+G8yDS/E+fOt9SsTsAesL++PC7LF/w5kQX/cVCJxr4gPjVtmWCo8PuYSPcwQ/
         HbbEq3pL0FKXFfVeSjR+35it1i5ufXoypFSP5B/bXV5NWrU3uPlL/PKUrlumTbsyrDyS
         Xzi0oupMZIwHybemZ2e6BmyUAzyraigqscz6gUVer3C5bdDrct669Vco4pn2Xvm9ezLD
         ZZZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795622995; x=1796227795;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SH3WD86btuINr/uxcoF6S242mnrN0umh75GOIi7csNw=;
        b=pMtx0391gXIvCfYf3MynDbq9XjzDSYNMRAg2ZMwE816VZ8ql6Bke+iV1n8VPH0F+N8
         j/kIR9o3IfX5lJkARrGOp32TW5ks5Za5dmIM4PbYQ/l9tYtP0nY8nZjHrYO8oth9w+a3
         vIsvh16048Dg9bOGJa/zQ7DUZeQQoPWWTxdZF0s9ZMAcal4SjaKY7VD8tUnP3dFYSG9k
         vLlOswbuj9q7JRzW4VDVq1mai11mliVLc7qaXIgt9pPeNkxUah9+OxvNEPhsG3EtByTl
         L47U9DJGQq60duKj86y++Hkj6/SnHb/Tt2qHDilKAZJv3KOr4i11Rc5Z4TdyqVH0caFX
         7yag==
X-Forwarded-Encrypted: i=1; AL+hErFf6Igfk0hIELSacB1yGEUnE2XPBafNUsJIzj6eT6Zu08/muoT9i2Zzjv6o4TIfDTeA5yuQaJnGZX+ghqd6cNzy@lists.infradead.org
X-Gm-Message-State: APuU4Z8MFfh6KWEMirFv7TvD/GW1ncuTlScTgjNss9pC6nU7yJJP7r8r
	2nGaJCHhRMWaMAhuh1psR/x48beWggcmnixMBRv0xqa/e8YRZdQXYpiKhBm8F0SY+x8Gt/x3r8r
	du3YKKCJJf5qfQmMbQs5TKKT7o+4nSQr4w2OrbM7j
X-Gm-Gg: AZFdTZcmFeAcgchj2rUEzztKw6dfOu1hngjsdQ08sXnGDlXRiO+cXdArYU6iV2ODrs9
	4JTaLcsnDJhuYxIVKPF+1j0O5PhPB/PggsAmQGoa5QQNR5VVVgXVwhFO9kBZ6xHu8njWDqA63Oh
	m0HboPZMWzZxlhMNCpxq98c+CKwXLChDwUoSLPtTWhZ14do5EIuP1q08gD4VEKpAn+RnuKapMay
	VmbtG3ar2H0EHRaolZyUxrLv0lVt2y5BCmBz+B1GMdAoYPB3eMA/oM4MvbPDdIqUFAnhH7j0vxt
	rHBZKqJW5HAJx1CgNfwaTLzJ1fcgTufdRndednK2EjB7PtBX927sSLedQ1lpmOCGBLw54pY7bbN
	P9xYvJZoyV0NA1HeS1V78EHw6PVZtNe3zpMHxgvmEL+oNV3V4NVXCq26BFc7WJc/riHfthzIgSM
	1sIkPYjCvkIt8sfQBca5+FdkxF7BdDmN+LUgMbfxBSnywdk8AXBII=
X-Received: by 2002:a17:907:608c:b0:c2e:6a4f:a88b with SMTP id
 a640c23a62f3a-c513a1f5c8cmr1559863766b.0.1795622994038; Wed, 25 Nov 2026
 08:09:54 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261122184453.2668189-1-jthoughton@google.com>
 <20261122184453.2668189-7-jthoughton@google.com> <CF94E7D7-87D2-4523-9343-512EE00094FA@linux.dev>
 <CADrL8HW8+eFt5f1VBQ0zt-ioiU3X150W4ROaKf2Nzw4j9+0i_Q@mail.gmail.com> <09A53080-61DE-472D-9A37-38B524C76FF9@linux.dev>
In-Reply-To: <09A53080-61DE-472D-9A37-38B524C76FF9@linux.dev>
From: James Houghton <jthoughton@google.com>
Date: Wed, 25 Nov 2026 11:09:16 -0500
X-Gm-Features: Aa3M54o_hFax3FlT4U3L1WrxJk7av4zfqy7DgK21ApX3Y58oo7HyZderBGv4ryc
Message-ID: <CADrL8HV2m6DO=r-mezNONV_w0BtrN1_7Wph+mHUsAsYBf5FR2g@mail.gmail.com>
Subject: Re: [PATCH v3 06/19] hugetlb: Optimize bootmem folios that were not pre-HVOed
To: Muchun Song <muchun.song@linux.dev>
Cc: Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Oscar Salvador <osalvador@suse.de>, Andrew Morton <akpm@linux-foundation.org>, 
	Kefeng Wang <wangkefeng.wang@huawei.com>, Nikos Nikoleris <nikos.nikoleris@arm.com>, 
	Linu Cherian <linu.cherian@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	David Hildenbrand <david@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Nanyong Sun <sunnanyong@huawei.com>, Yu Zhao <yuzhao@google.com>, 
	Frank van der Linden <fvdl@google.com>, David Rientjes <rientjes@google.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_080957_717402_8AAA598C 
X-CRM114-Status: GOOD (  39.30  )
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

On Wed, Nov 25, 2026 at 4:37=E2=80=AFAM Muchun Song <muchun.song@linux.dev>=
 wrote:
>
>
>
> > On Nov 25, 2026, at 00:58, James Houghton <jthoughton@google.com> wrote=
:
> >
> > On Sun, Nov 22, 2026 at 10:11=E2=80=AFPM Muchun Song <muchun.song@linux=
.dev> wrote:
> >>
> >>
> >>
> >>> On Nov 23, 2026, at 02:44, James Houghton <jthoughton@google.com> wro=
te:
> >>>
> >>> Boot-time gigantic folios are expected to be pre-HVOed through the
> >>> section-based vmemmap optimization, so the bulk optimization pass for
> >>> bootmem folios was dropped.
> >>>
> >>> However, arch_support_vmemmap_remap() may not yet
> >>> return true when bootmem folios are allocated (e.g. on arm64, where
> >>> support depends on a system-wide CPU capability), while it does retur=
n
> >>> true by the time the bootmem folios are gathered. Such architectures
> >>> disable the section-based vmemmap optimization in their vmemmap
> >>> population path (see section_vmemmap_optimization_disable()), so the
> >>> folios are not pre-HVOed and would never be optimized.
> >>
> >> Yeah, when I removed support for this part of the code, I figured you
> >> might add a new patch in the future to add support back. It is fine.
> >>
> >>>
> >>> Optimize such folios when gathering bootmem folios. Their tail struct
> >>> pages have all been initialized by memmap_init_compound_page(),
> >>> as they were not pre-HVOed. Pre-HVOed folios are skipped by
> >>> vmemmap_should_optimize_folio().
> >>>
> >>> Signed-off-by: James Houghton <jthoughton@google.com>
> >>> ---
> >>> mm/hugetlb.c | 11 +++++++++++
> >>> 1 file changed, 11 insertions(+)
> >>>
> >>> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> >>> index 72839e98f998..8756c0206922 100644
> >>> --- a/mm/hugetlb.c
> >>> +++ b/mm/hugetlb.c
> >>> @@ -3325,6 +3325,17 @@ static void __init prep_and_add_bootmem_folios=
(struct hstate *h,
> >>>      unsigned long flags;
> >>>      struct folio *folio, *tmp_f;
> >>>
> >>> +     /*
> >>> +      * Bootmem folios are normally pre-HVOed through the section-ba=
sed
> >>> +      * vmemmap optimization. However, an architecture that can only
> >>> +      * determine whether it supports HVO after bootmem allocation d=
isables
> >>> +      * the section-based optimization (see
> >>> +      * section_vmemmap_optimization_disable()), in which case the f=
olios
> >>> +      * were not pre-HVOed and must be optimized now. Pre-HVOed foli=
os are
> >>> +      * skipped.
> >>> +      */
> >>
> >> I'd like to condense these comments to something like:
> >>
> >> /*
> >> * Some architectures do not support section-based vmemmap optimization=
,
> >> * so their bootmem folios should be optimized here with folio-based
> >> * optimization.
> >> */
> >
> > Applied in v4, thanks!
> >
> > Also just so you don't miss it, would appreciate your thoughts on my
> > reply to Sashiko's comments on this patch[1]. Let me know if you would
> > like me to do something different.
>
> I think the diff below might be a bit simpler. You might think that when
> HVO is turned off, it could still cause some unnecessary TLB flushes. You
> don't need to worry about that, because I've added a global guard to make
> sure it doesn't happen. Take a look here [1].
>
> [1] https://lore.kernel.org/all/20261124110530.3004071-3-songmuchun@byted=
ance.com/
>
> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> index b2c14f4f99b7..69a7d4ca8b1b 100644
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -3345,6 +3345,7 @@ static void __init gather_bootmem_prealloc_node(uns=
igned long nid)
>         LIST_HEAD(folio_list);
>         struct huge_bootmem_page *m, *tm;
>         struct hstate *h =3D NULL, *prev_h =3D NULL;
> +       unsigned long vmemmap_unoptimized =3D 0;
>
>         list_for_each_entry_safe(m, tm, &huge_boot_pages[nid], list) {
>                 struct page *page =3D virt_to_page(m);
> @@ -3368,6 +3369,8 @@ static void __init gather_bootmem_prealloc_node(uns=
igned long nid)
>
>                 if (vmemmap_optimizable_order(pfn_to_section_compound_ord=
er(pfn)))
>                         folio_set_hugetlb_vmemmap_optimized(folio);
> +               else
> +                       vmemmap_unoptimized++;
>                 section_set_compound_order_range(pfn, nr_pages, 0);
>
>                 list_add(&folio->lru, &folio_list);
> @@ -3387,6 +3390,8 @@ static void __init gather_bootmem_prealloc_node(uns=
igned long nid)
>                 cond_resched();
>         }
>
> +       if (vmemmap_unoptimized)
> +               hugetlb_vmemmap_optimize_folios(h, &folio_list);

This hunk needs to also be added to the `h !=3D prev_h` piece inside of
the loop, otherwise we could miss optimizing folios for some hstates.

I prefer the early return that I've re-applied. It's a lot more
straightforward for me. Let me know if you really want me to switch it
with your suggestion.

Thanks for all the feedback, Muchun! I really appreciate it.

>         prep_and_add_bootmem_folios(h, &folio_list);
>  }
>
>
>

