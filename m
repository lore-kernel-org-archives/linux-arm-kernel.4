Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28513606D51B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 22:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IALAzTQr;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=qQoKbhBt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ZEddz8haj4iGepLSSw+CHqlgTqudRs35VC14E4G7pVs=; b=IALAzTQrE3wZPO
	1yQ2/H4Y18Dmq1JvsqNML32hDcWaoQyr9hAD77sYvttvv/x6WUZx7WotIeY9LkJNhmjNBTWoHf1WS
	KR28OTTm5od7SQyNJQa1QIsCw1ngfeI3dICmsLUizRUB1wp9TJ8IY7LXturasyWTKzMJLascFbIJZ
	i90Y1KoVIJYFc3IJjzj47nL3bYufaJQ/nvYaHSp41/LOk1xKTvFhA2yHXfls5gTrPbnEQzlKBm4Qm
	AXch1+vgviZKTMXMkNOZueNgvv7I0UcM6+6QcTS75Wd3qGlYJgO4i/5l+VuHHDnVxcDbphKKpVlgN
	fZzLELbI1UvfAIuygvvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQu2c-000000058Mk-0q8K;
	Tue, 10 Nov 2026 22:10:10 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQu2W-000000058MK-2rvG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 22:10:06 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-c3f04e0e65fso372045966b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 14:10:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794348602; cv=none;
        d=google.com; s=arc-20260327;
        b=i5IcXFjqe/bhPe+AJYkJZ38ukUlxdzI84U0AKjkiK9CTrw7asJLOYxrZ+ArO62i1/0
         no4FFEXvnUSM5ZmXBj7x+FPYlI9XYEzYqutHxxOUI8olMHCtHMUgoDyQLvUG/UOfAMz8
         ITQLjKBOQZQIXvYpXZB3P0SY9GdSGag+VEzIvADjdmS85USTTO27Kd8cHgijaSTieNMf
         LfawA7TLsK4mSOKzZHzcqdrdfgEPPvbCDa11B1EmUI4L7qjifkBizyFDfTGiCzlRu8O6
         5bYY9pAwMlz9t8DF6PUth0e7+s/Kx/g9AB35F0I2sv7QO8z2jHPLfYJLO8nTQnBjEaZw
         xYVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZEddz8haj4iGepLSSw+CHqlgTqudRs35VC14E4G7pVs=;
        fh=QYgVLjlJHJt2Z+V+zIxv3r3w9ZxoCp54rfjqB60HYOg=;
        b=OVi5osvFU6RuXzgQJNpgCAq3OSjMAWmJ4sMJOElpSrh8l0dBtnkj2iFbgh3bl4vwv0
         0oRO1xFmp2kML8c4PlRzknKXQ6cNPpeaNe+IsjCtItWjTzyY+K1mB6WHigFNTv6zRfKw
         1B3dWbOlDVEEqmROahe15Txgmn3/iS2+sfHr1wEckhe9JonithP+Q1ljkfY/1RMrZpUb
         hFr6AP5TwH0Nexz+I4NuyO7A3Q8+rv160Q+cYMJxOIzCsulfGKsrZjdjezy6+xSs3coW
         LxMF/62jT4rrjjda6tCS8RXV9x6BenYz6lMa4hHkps8JlAFKIO3L6FA72eibTvx4J49Q
         zrLw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794348602; x=1794953402; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZEddz8haj4iGepLSSw+CHqlgTqudRs35VC14E4G7pVs=;
        b=qQoKbhBtuP3oGc7Bou9Ce2ZPXimcoLepb4ygGAOqszmS/hMp+ze9hbrRVAww9zZEHa
         ZNH1NM9+vKcV5pmGr0hQkLuZ+MtHuhxfDa/qq935RQO8UV7pn05JXebRHpIvyFDxrq6a
         vQaU8QsTFzD+kQLUXSzmWqDx2sUF+efORnJ+8xDBhDF5zCd75u0iHlFRnwQ5Bt/hs/hR
         a9oTTMzF0jJGCr7d0b4jRxBg2IIDGLk/hTu01U3DWQF7mz4u0Y2/dHos0mFSs4r70fV5
         VdtMzRTsH78XTNEzVVBQgOkAOPxM93ALZ/GHU4khtQXjZPdUFKbAGvMAtHOh1/qEguqV
         Jt2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794348602; x=1794953402;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZEddz8haj4iGepLSSw+CHqlgTqudRs35VC14E4G7pVs=;
        b=1FEhVg5ob0ODrmIPU2Ta2+6AaiEzwMt05IgVrPTv3D3DkBmUePkgIerSJta5dD3CUa
         5aX42I+7xrqq/lX+VNwYVsHuK9X3MypmPWktbW3XaJfeuc+Wchz5oiV13gnHj/5MOeVg
         TDZMBZ6wxHt407ojCmHh3sN+bJPWJoAiW4jO6ftwIhbHhIxw/vc9Xzzaj/HLoljZ559e
         4k2GdDgXLMpMvybGhyvCR2FL2Gvisbxd5xvBiRQyvXBr0hsjFoz+XwFzYMbX7WPxZg26
         Wbe7v2VjooCLOrD44YK7NsBbM4B+HpyfGR2gRZvdNi5IsFWz5Wimw2JFfBMHvciZpFki
         oVqg==
X-Forwarded-Encrypted: i=1; AL+hErGRyZyY/mn5VSBJbu+1Ozj9g28oAhyJ4fFbVNyDw/AUHoDapHpr2L0U+TpLYjRJaB9VXaV53pZRB/+R2cluMdPT@lists.infradead.org
X-Gm-Message-State: APuU4Z/0R6hczN0mPt3FTJ8GrXCn9vei9FuOp4pau5vDoheYZ8YVzJe4
	TEMoOEw+CWn31zGhTF1nrj0bmYcflRMRDS1eMs5cSUlozZoP404PMhJ9fr8+P2aS78AN/Od+zZ0
	7VvBH+FNIZLUICeVTo9F+b/N62+d0KNBTZkt39/8a
X-Gm-Gg: AYBFou3u8TG3cQ4E3af2huIJm0MKkzeverFsR6qHqyi07Q5cm6eqc9HpVFQvKLz83s0
	wtaZKpPM6RxE/J2n2yC85OQYMTM/mUGpwVXkb8bOfpzmuz0ufDFMruanVaFjXvzuIuhYD30F4Xa
	V4mkK9e3f6XKOTHJB3unQAOIKNB5QKTYeAxWzNau8KNXIpgS1ElLWK1nysPBi59GKJHmHJfjG+j
	OyS1Rtc837jc2r9WY3N9WzyNdNv3ZuydQpUl/TdTibYJ8x5RumH/aRkRxk1kBnmS1tvO+esREEH
	2T+EGVFIt6xGnlOuN1+Y0Ox3Im/MX+joEiYrTzgQJK7LgZzDsbBAeNz7OM9O8WQQpIg4wldX6Xk
	TKnOg1k/s8eHcpM8zqRu6zAwPTB/UgeBcVkp3HA1i8ylA1G2N/umwDvttQygCEZtWYcb6+XctB3
	+sT7d7I/gKP1DBF6R4LCAlyK5PY+KfFtYHCpCIlavfZ8o3ZBC/H0P+rBBoJlJkn7IEOVmE8mrMK
	HF1jQbN
X-Received: by 2002:a17:907:980b:b0:c26:2a2:b91d with SMTP id
 a640c23a62f3a-c506694f0b9mr36476966b.6.1794348601603; Tue, 10 Nov 2026
 14:10:01 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261003002123.505555-1-jthoughton@google.com>
 <20261003002123.505555-9-jthoughton@google.com> <30822F0C-88B8-4ACD-A0CD-F889F438EDB4@linux.dev>
In-Reply-To: <30822F0C-88B8-4ACD-A0CD-F889F438EDB4@linux.dev>
From: James Houghton <jthoughton@google.com>
Date: Tue, 10 Nov 2026 14:09:25 -0800
X-Gm-Features: AclHuK_-DHdY3lumgPO6Qy00BxbcnPvhIHC2Bs1SRzgw1uz1jqZUi8ATzat9T6U
Message-ID: <CADrL8HXU1jfoCcZNbRwjy6wg8jpLQPgsHu7=U28qN2Yc01nMzg@mail.gmail.com>
Subject: Re: [PATCH v2 08/20] hugetlb: Fully initialize tail struct pages of
 non-pre-HVOed bootmem folios
To: Muchun Song <muchun.song@linux.dev>
Cc: Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Oscar Salvador <osalvador@suse.de>, Andrew Morton <akpm@linux-foundation.org>, 
	Nikos Nikoleris <nikos.nikoleris@arm.com>, Linu Cherian <linu.cherian@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, David Hildenbrand <david@kernel.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, Nanyong Sun <sunnanyong@huawei.com>, 
	Yu Zhao <yuzhao@google.com>, Frank van der Linden <fvdl@google.com>, 
	David Rientjes <rientjes@google.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_141004_757677_C03E1938 
X-CRM114-Status: GOOD (  33.32  )
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

On Fri, Nov 6, 2026 at 11:06=E2=80=AFPM Muchun Song <muchun.song@linux.dev>=
 wrote:
>
>
>
> > On Oct 3, 2026, at 08:21, James Houghton <jthoughton@google.com> wrote:
> >
> > alloc_bootmem() marks all but the head struct page of a bootmem giganti=
c
> > folio as noinit, and gather_bootmem_prealloc_node() then only
> > initializes the first HUGETLB_VMEMMAP_RESERVE_PAGES struct pages. The
> > remaining tail struct pages are initialized only if the folio ends up
> > not being HVOed.
> >
> > This assumes that a bootmem folio is either pre-HVOed, or will not be
> > HVOed at all. However, hugetlb_vmemmap_optimize_bootmem_page() may skip
> > pre-HVO because arch_hugetlb_vmemmap_optimization_supported() does not
> > yet return true that early in boot (e.g. on arm64, where support depend=
s
> > on a system-wide CPU capability), while it does return true by the time
> > hugetlb_vmemmap_optimize_bootmem_folios() runs. Such folios are then
> > HVOed through the regular remap path with uninitialized tail struct
> > pages, which trips the PageTail() WARN in vmemmap_remap_pte().
> >
> > Avoid this by initializing all tail struct pages up front in
> > gather_bootmem_prealloc_node() for folios that were not pre-HVOed. This
> > makes the HVO-failure fallback in prep_and_add_bootmem_folios()
> > unnecessary, as pre-HVOed folios are never passed through the regular
> > remap path, and all other folios now already have initialized tail
> > struct pages. A failed optimization either leaves the original vmemmap
> > in place or restores the tail struct pages from the shared tail page.
> > Remove the fallback.
> >
> > For folios that are not HVOed at all, this does not change the amount
> > of initialization work, only where it is done.
> >
> > Signed-off-by: James Houghton <jthoughton@google.com>
> > ---
> > mm/hugetlb.c | 28 +++++++++++++++-------------
> > 1 file changed, 15 insertions(+), 13 deletions(-)
> >
> > diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> > index 4dac7ed1df57..e971e2362412 100644
> > --- a/mm/hugetlb.c
> > +++ b/mm/hugetlb.c
> > @@ -3303,17 +3303,6 @@ static void __init prep_and_add_bootmem_folios(s=
truct hstate *h,
> >       hugetlb_vmemmap_optimize_bootmem_folios(h, folio_list);
> >
> >       list_for_each_entry_safe(folio, tmp_f, folio_list, lru) {
> > -             if (!folio_test_hugetlb_vmemmap_optimized(folio)) {
> > -                     /*
> > -                      * If HVO fails, initialize all tail struct pages
> > -                      * We do not worry about potential long lock hold
> > -                      * time as this is early in boot and there should
> > -                      * be no contention.
> > -                      */
> > -                     hugetlb_folio_init_tail_vmemmap(folio, h,
> > -                                     HUGETLB_VMEMMAP_RESERVE_PAGES,
> > -                                     pages_per_huge_page(h));
> > -             }
>
> Just for your information, I also plan to remove those code, see here [1]=
.
> I need to push this patch along quickly. I'm confident it won't take long=
.

I see that [1] is included in the series you uploaded recently at [2].
So I'll go ahead and rebase on top of [2], thanks!

> [1] https://lore.kernel.org/all/20260513132044.41690-15-songmuchun@byteda=
nce.com/

[2] https://lore.kernel.org/all/20261109095807.41547-1-songmuchun@bytedance=
.com/

