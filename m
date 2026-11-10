Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07414606A320
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 22:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LlX4Yn5f;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=cpzZu8fJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=S0D/VShkRW4WtVgs6Ji1jkMhYLatw++pmKPgAANQ3tA=; b=LlX4Yn5frHowrd
	ywGBe4hgG9+L9kddPBQgtGzKtBx0/mVyRMqPAL9OVGSMukOFR+pWsxodNNWQAiHthAn+8BUYP4mnZ
	kK9FroTCrEVZDg2dc7GGs7zGaoB8e2EYQt/VbKq8CLdxjuEF1Ho+rZz3PGjQnxkuLoSgMXDc9Ccvr
	3uJQFA3UOXfzmGMSIR1YV5alZAfG14APusJz0+jT2oRNPAKobgVMBoQEVV9IOyq09myksdxqIVBQT
	nu4mFoP/pQ+pIoO+HaRx9cZc8l7VYywhnD6cH1mxCiBlpRBDV2Olk3eaHJ1Hc9CJQoeunkdIrAJn9
	B+Sd5c//HPDEueVHJcEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQtyy-0000000583V-2hNl;
	Tue, 10 Nov 2026 22:06:24 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQtyw-00000005834-0BTm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 22:06:23 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-c49c32650adso197695366b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 14:06:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794348380; cv=none;
        d=google.com; s=arc-20260327;
        b=U4BSHPiPqMM6oAldBURjlDInOK8SmRK5eJ3jVwIjTAj3MfVzuXGpaNOZ6Mwa6QMRII
         H/WrXPn+s0V7AjxmxXmrrKTjVuB46lmhNhR/7328ESDJKsABU4aOZyhLgllgEC9UyP7j
         kX140fxEYp0vputvkUTMnZa0QmRR9b7r/QNN0g4PlX31547ft4wPDbw9vnx1PBWtRxGp
         49LH77gvFwW81rcGxIivHoPC10eXF6FqPqEq1/l7Ae9r/raAdwhCAcOXsNl4YorTNUFW
         LoR0JAK/KEnbpp77CKbwRFevbOIZiPrn8p60HneASaQWxhrTmPHYuosZ7VZkyulCQ8xT
         zx3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=S0D/VShkRW4WtVgs6Ji1jkMhYLatw++pmKPgAANQ3tA=;
        fh=LBwPfDiQiUwzmwkb+5we0kESzzH4pJaW4xK9+3a3UaM=;
        b=Iqr1hzj9N0Mi1K4JIN6vt0uJilX7bGdAk1ONyXUE5wnvZ0j6Wu25ekxaycOacOyehN
         qkEiVPHrLmfneWRCo2I0XFR7meaRVXANHg90VnlPYP0IkSIZ3jx38/bimQY4K9+KWJws
         R0tS9xbHMJ3jY4OK0fJptrvo34zn+yEwCbMBr84nTQsvjdEditNtzu7rxfaeFj5mVdj6
         W0vz7sWlnyTflo9JHw0S9sfTkPVaj67D0+XUBK0wUPK5QdtnD4Fcew39jphygaYtHins
         EPIlVpUAmACHFZ05lKM3uHMJMHhUVQpkfOSe8gOlSxzck5+ScmpXW0/egR+u0YAyztvQ
         9d3w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794348380; x=1794953180; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S0D/VShkRW4WtVgs6Ji1jkMhYLatw++pmKPgAANQ3tA=;
        b=cpzZu8fJ4yvVKGKu27JES+LmWlOzr3qs71YthnKsX/Mh6sNHpXYUiActDM0iE9l5H8
         iJh+HFP026zlOripmvmkMtNgrgvZKH132tc1Jkiv7zQBszR7SoNSg8EYygUcPbNz+HDQ
         OHdPqKzsbh1hpBYGHwsgqdEwbDmS4U0ns7chxNXTbFQiZDe7YJ952MbkZ3Np/ueg4sRn
         iRIIoUF9mpYrdU3Q5fMO5jyFlGYYImuRaZno+kAsj67gt3r3H13hwYbOyj/hblzRQCQ4
         xwvrfOzurMkdWEsA3ZFQeFQHFYFPOn0/NPIGn8rfceiym7Ocz5/xbiJc1yyvHBJXij/H
         pCSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794348380; x=1794953180;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S0D/VShkRW4WtVgs6Ji1jkMhYLatw++pmKPgAANQ3tA=;
        b=ebrkAOfLT3CJ1tGR2gmz9PYypmdrniFfEJCyFPsxHWxw1Y9/U98gz/Tchgla2LZf2H
         7rkDVgIkoLCIa1yUl0MBHSEoLogu3QufqyhzBdCVa3htuK1Deyu1sk6HZgYrGZHIRw36
         73xYuc0K8puI78AbK47HyV1iKxISx+BKa3P9cdMHNfPD09Nl19+aar2YaqKBhYCmnPIp
         ZCYg2WliggvswRPNo/u1qbzp8G9u5ZBHpiq2mOvVOd+ci3e9hJNM7lxktwl0hVNVPgOI
         ab9LXJxkaqAw2wIDlws9b1zzH2emyGnNOWcEjaA9ytkMWT3tE3iz08MWRmXy3gKkwQ/Z
         v1+w==
X-Forwarded-Encrypted: i=1; AL+hErHePCY3vKMQFJ7rRO+xbKod3PHgDqJ4Z9ZZAJTkZHNaAy/yeZgHhbCmlE5seshe5+jkRh/f8gCwoinMnvcwPOtn@lists.infradead.org
X-Gm-Message-State: APuU4Z//fHMYosn9CCaksUIo5b9vf90idXQUhJSdmkDCMU1WRtrNK4UR
	vrHS2xTV1VRS7MeP+G7FR3O2kwEeyIPobmcoiQNfdxiWhdTnajtABDy335TWNq4AYa1sy7I8S9d
	T/HJvWCBOf1Ea9Kbs8KnDL7GFmMsM7zPlJgpEDQ5W
X-Gm-Gg: AYBFou06p/8W88TaTpxDdUZ+Or6o7phhGpehd9W5VV+XqEOhQrcPgnr09mEvnyAz+JB
	bS8NiyKEkpTtbe/W1QUzsrVsLWqYkVBPNBwhosrV4WwmJCYwSH8beXVMzGu3OTEolP/WgKKmZiF
	1pgy/Shd0XS5QFmBizG5OsXmoJW1ePVGlBK12Wvqh8yV0Uf40kJDlO/VrSDjYvhWr4Pbtr55WFB
	LPw5uF+hwtJRnE+sYZoarmO+YnqY1LVs42DKweDj9BkcT4ahzpIx31DX0S1n25+x1jP/rHS7fmg
	c1oGTQFUeqncHAokMt8i13NA2ASU1cagJ83LlG/TPBR5WgXJGWeS3NeK43yiBnlE5BVtvok2J4k
	X8YcyxLOPUVK4Z8NnpfimAHrJ6Eek52QUQPuAjkVmFZHFYQUWQCHWrIrPvlo0kT4EA9h/5jXeRU
	UnFt6uLYU11yXX+0KBM1M3N4/J2MsYQLIehpiISqJAH8mqrzyAQbjV1t/OKj4YCF551NUI+wA53
	q3rSTrZ
X-Received: by 2002:a17:906:794c:b0:c42:82ac:b6a9 with SMTP id
 a640c23a62f3a-c5066b6baa7mr35192566b.29.1794348379456; Tue, 10 Nov 2026
 14:06:19 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261003002123.505555-1-jthoughton@google.com>
 <20261003002123.505555-7-jthoughton@google.com> <8814E4B3-5A5A-4874-863A-71FC6E4F3B34@linux.dev>
In-Reply-To: <8814E4B3-5A5A-4874-863A-71FC6E4F3B34@linux.dev>
From: James Houghton <jthoughton@google.com>
Date: Tue, 10 Nov 2026 14:05:42 -0800
X-Gm-Features: AclHuK9DP4E2SNlLaTNdiTkQr6q6QZ9Qonb4QaVlevADmVOep5O3eB7CHyRgUcM
Message-ID: <CADrL8HWepp70MNhsBgAhJsLbOW=ZqEWbKSuc9CUA7oLEpPT5sA@mail.gmail.com>
Subject: Re: [PATCH v2 06/20] hugetlb_vmemmap: Allow architectures to
 dynamically disallow HVO
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
X-CRM114-CacheID: sfid-20261110_140622_134019_519DF347 
X-CRM114-Status: GOOD (  27.62  )
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

On Fri, Nov 6, 2026 at 10:44=E2=80=AFPM Muchun Song <muchun.song@linux.dev>=
 wrote:
>
>
>
> > On Oct 3, 2026, at 08:21, James Houghton <jthoughton@google.com> wrote:
> >
> > For arm64, only some platforms support HVO. Add an arch hook to prevent
> > HVO from taking affect if the architecture lacks support.
> >
> > It may be the case that arch_supports_hugetlb_vmemmap_optimization()
> > returns false at first but eventually returns true. This is the case on
> > arm64. When this happens, bootmem hugepages won't be immediately HVOed,
> > but they will be optimized in prep_and_add_bootmem_folios().
> >
> > Signed-off-by: James Houghton <jthoughton@google.com>
> > ---
> > include/asm-generic/hugetlb.h |  7 +++++++
> > mm/hugetlb_vmemmap.c          | 12 ++++++++++++
> > 2 files changed, 19 insertions(+)
> >
> > diff --git a/include/asm-generic/hugetlb.h b/include/asm-generic/hugetl=
b.h
> > index 635c41cc3479..8d24075d53d4 100644
> > --- a/include/asm-generic/hugetlb.h
> > +++ b/include/asm-generic/hugetlb.h
> > @@ -128,4 +128,11 @@ static inline bool gigantic_page_runtime_supported=
(void)
> > }
> > #endif /* __HAVE_ARCH_GIGANTIC_PAGE_RUNTIME_SUPPORTED */
> >
> > +#ifndef __HAVE_ARCH_HVO_SUPPORTED
> > +static inline bool arch_hugetlb_vmemmap_optimization_supported(void)
>
> I suggest using arch_support_vmemmap_remap (see [1]), which can also be
> applied to FS-DAX.
>
> [1] https://lore.kernel.org/all/20260903122128.12264-2-songmuchun@bytedan=
ce.com/
>
> > +{
> > +     return IS_ENABLED(CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP);
> > +}
> > +#endif /* __HAVE_ARCH_HVO_SUPPORTED */
> > +
> > #endif /* _ASM_GENERIC_HUGETLB_H */
> > diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
> > index 3fdb1e4ce1a1..8596a462fee6 100644
> > --- a/mm/hugetlb_vmemmap.c
> > +++ b/mm/hugetlb_vmemmap.c
> > @@ -16,6 +16,7 @@
> > #include <linux/pagewalk.h>
> > #include <linux/pgalloc.h>
> > #include <linux/vmemmap-optimization.h>
> > +#include <linux/hugetlb.h>
> >
> > #include <asm/tlbflush.h>
> > #include "hugetlb_vmemmap.h"
> > @@ -529,6 +530,9 @@ static bool vmemmap_should_optimize_folio(const str=
uct hstate *h, struct folio *
> >       if (!READ_ONCE(vmemmap_optimize_enabled))
> >               return false;
> >
> > +     if (!arch_hugetlb_vmemmap_optimization_supported())
> > +             return false;
> > +
> >       if (!hugetlb_vmemmap_optimizable(h))
> >               return false;
> >
> > @@ -731,6 +735,14 @@ void __init hugetlb_vmemmap_optimize_bootmem_page(=
unsigned long pfn, unsigned in
> >       if (!READ_ONCE(vmemmap_optimize_enabled))
> >               return;
> >
> > +     /*
> > +      * Architectures may return false here but true by the time
> > +      * hugetlb_init() is called. In this case, although the folios wi=
ll
> > +      * not be pre-HVOed, they will be optimized in hugetlb_init().
> > +      */
> > +     if (!arch_hugetlb_vmemmap_optimization_supported())
> > +             return;
>
> I plan to add a new helper, section_vmemmap_optimization_disable() [2],
> intended to disable vmemmap optimization in the architectural vmemmap
> population path. Since arm64 does not support section-based vmemmap
> optimization, section_vmemmap_optimization_disable() should be used there=
.
>
> [2] https://lore.kernel.org/all/20261107043122.25650-3-songmuchun@bytedan=
ce.com/

Thanks! I'll integrate both of these into v3.

