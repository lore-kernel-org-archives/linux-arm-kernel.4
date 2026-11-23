Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 203A8606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 21:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hoeW4lpD;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=YowL7F9L
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=IJsNI40Oc4odODK4rCh9CibKGkLzE8LmGw7dcdr4rMY=; b=hoeW4lpD4eur7Y
	7hDfRbsw+hKdSShdaJ5e68aY/loCADlMu8s5XOsk1QxwQLxUG/twmkWMIOXtu/RcetrRa0dqOGZdI
	bSxnbPPbACuepfr/X9hIw76wRPYS/T+EXeRfW3nqIWUdI1DydT8tFQqZMEGNzcAuoNn+jNkF1pF7K
	YmT29NO7Mi6qZDLJNyh41e2L+N91V92lWiRrqU/rSSBERQMXHXedFdaLqMmLITD7q9Q9gug1lltdK
	psH5MZZTWBhzzma0vRAMeY3kDxJidL0nZj6kegVDMalRu/0F3D85WuCPoRRr55v9VaJAcv9CStCh0
	RmktvI+hlhVjuvKxWSNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVahk-00000004qLt-180Z;
	Mon, 23 Nov 2026 20:32:00 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVahh-00000004qLH-49dX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 20:31:59 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-c5188e17487so129029766b.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 12:31:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795465915; cv=none;
        d=google.com; s=arc-20260327;
        b=lzqOWBbvWHbyFW4qLX1YqOnvuVY+L7YWQnzv4ukJskRA9hbmP+ODhieEsvdstN8CKU
         LbrHM9IwLLv+fFghLB1D50133RQPRttYc/R3K2wDibXv1kTvECj4CwFQiZwsFZzrQ2V0
         cz+1VmMup3ItR+yr7G7nS/m10A5HXEnd7BywDt+uVXzRoUvM6If7qCTjmJNu0d9FeSBc
         q/py4rj9minv+ZNjGowipkC4DtfPImkRwzjG3kr/k/zgE0hNLM9lmCJBP68ckuelFEta
         pUCIMV4jp0RCoMQb8F07iD3yEXkdKB+0arz/rpR4YPbhkUye6sDNTwSb4kVBn6FaJ11d
         +EYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IJsNI40Oc4odODK4rCh9CibKGkLzE8LmGw7dcdr4rMY=;
        fh=4IUI23znFn67HsB4ARGO2EFLPgMTIrhideaz4ReNg7w=;
        b=LbjwM/gB/cnglXynKp75ypuAbSy4BXkhqrtGVKcNVP1mMd5rDetkJINeal//PoMXhI
         +0B/B1leRDtnUN/vzeFaOY/O/OgcfqZwhbWAg4WySFtn3U2XeF/owOzU9JHnxNZmZxkJ
         Qrt/IDtv5JcJbmfqCDiHjhM+m6RuR/IEv/mp6n8ErGc+bDDZ2xutbg7E6Wd2swpzAoW8
         oWlRWFk5UoXt6z04zgXTrYwiX+8ob0XsN1bgSaA3mgyoYF5vZb63iQK3z5lq3c9L/IF1
         X7yxXGWWDwixM/w6BVn8M0bzaBTYjKRx+emfz6VNIlhwCIZG0elHoDLn6h/fHx7f5XiA
         6Pmg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795465915; x=1796070715; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IJsNI40Oc4odODK4rCh9CibKGkLzE8LmGw7dcdr4rMY=;
        b=YowL7F9L7/7lSk9oex4jBeN7jk5hn51xTkGXJJ7lfUflv65DNlUslBcMuD+iJNI5y5
         9DU2LSSHfAvT34UG3drTMD+VdzBMONf16AsOb5SUu6i0l56JZfA0zCFpWCweAPGwRrOE
         qglWR/h+f+GS0yKxdC7FNOvfBIGetDijv0MD/inPTbGpcrzwgkv+/DTj0OCPFvdxxefq
         VzlKTKJgNCbWRavhbSl5CL28meKZtnaZj8OjEoQSbbyzrOrC8FlFar0H9K0mdAosCKq0
         hfKCU7/WFGRj+Y0vVBi86I1Lp/3YPwzpi1dnc0sfrho1Hwr2Lzmx8FBsESsV6b0x5WWi
         nWaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795465915; x=1796070715;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IJsNI40Oc4odODK4rCh9CibKGkLzE8LmGw7dcdr4rMY=;
        b=DMdap9up5s9Ghg7d2NGt1++XrqOgAaUwpoy3aDRimmfbFMbL0nFZr9q2fOHZlCaFLF
         p5lzIWPDWDwj8PijggLx44FeL/zbPa2FZ8acqc16g+QkWhdD9G08ncWHdyLHMyFu8w4l
         7YHJyWHZjqH9zLIuW9neQONGdnoXln+uqcgFhPPy/U6pK5FgFbucAf9UpLc3Ri6S8/GL
         nnBG6I66U8YCvO5Oae5Vuo0Vaww6F7wnQxn8osOw0y5jPhX1gKgQoAkJLKzik+kzUAAR
         qhS/YwLVp0BR06JKYl+mvtZwDAsVMcan5Go4x1UhlpMIjfkg9ga3a5gjwrPf3wA/dDZt
         IqjA==
X-Forwarded-Encrypted: i=1; AL+hErG5n4uO5Bz7T/Y78AF27NXZ14IyLX206aSCrDRsVNIlXaZLbDg695sAG61aP6aUaOQ+2rhSnZwrxvLBP0a361ty@lists.infradead.org
X-Gm-Message-State: APuU4Z/EbY22/r6a0uSVc5zUGU+emCBjA8RFmYHq1kU2TxbmqBwHg8id
	iAmiPT09tebWCeVNFIQk7VJtfdYbeMkHzIQ1zfvbQnXgazkqSMp+DeewRRHWHzVUYlV2AeogRx2
	1tqM7sjgVRXOn3dApEcrOocb5Ks0pQEAldaUis8WC
X-Gm-Gg: AZFdTZdJGRlTMgcb3f3oi6woCQd3p+rOXUc6xW3SLaPI/Qfy77aVbFe5VYYFZwpB96K
	NWjkqMmQFLIlkUNouqOisIb0IThtXaRV83yWaKNbYZ57bAOUsnWIhQ6iI7tSRqtjTduDCfsqE12
	SmAMR1LjJSQysC/v3u90W3nFH5uAH/pgMn0oC9TEMxI2VGerhdVB+D9Q7/Ctk8Z6V0074Gypbpd
	gDAZgqoq0SKZq3Ab85poziZQlHAoe+l50YZeEIvB5j28EAGWPOZC5aEij+of2MhRW4MN3S9Om3L
	NWWPLwKa7egGhzVfguLAWFEkUD5Bt45lldMfeaSEr4Q8eutXRYckauN9r8oSU2L/+jHDi2Iirug
	vf2zwPanV5p6Ms1qX/DGGO3uMqSJtGvRbcML0wEWSdKic7QAOd1trMX3flyEzLuCoK4e7G+sF0/
	YQpR+J1M/rmkp68wR785y+uxPVMr23kRwpPeQp20xZkvqDqKcHQK8=
X-Received: by 2002:a05:6402:2347:b0:6b7:d1a4:fe1b with SMTP id
 4fb4d7f45d1cf-6ba37ee380amr9483450a12.43.1795465914250; Mon, 23 Nov 2026
 12:31:54 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261122184453.2668189-1-jthoughton@google.com>
 <20261122184453.2668189-6-jthoughton@google.com> <C1CC6F31-4F75-41D8-89D8-CE43465FBB6C@linux.dev>
In-Reply-To: <C1CC6F31-4F75-41D8-89D8-CE43465FBB6C@linux.dev>
From: James Houghton <jthoughton@google.com>
Date: Mon, 23 Nov 2026 15:31:17 -0500
X-Gm-Features: Aa3M54rAEjsqVff0l9eelHjmiyUD7j4I6mswdsQtcR5CMMtlUyAnlGvfFa0vdJQ
Message-ID: <CADrL8HXemwtmL_URg-WNOzdw1YCVxP3HVxX67yd=pLRGAuFyVA@mail.gmail.com>
Subject: Re: [PATCH v3 05/19] hugetlb_vmemmap: Allow architectures to
 dynamically disallow HVO
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
X-CRM114-CacheID: sfid-20261123_123158_070209_31EEF30E 
X-CRM114-Status: GOOD (  35.55  )
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

On Sun, Nov 22, 2026 at 10:01=E2=80=AFPM Muchun Song <muchun.song@linux.dev=
> wrote:
>
>
>
> > On Nov 23, 2026, at 02:44, James Houghton <jthoughton@google.com> wrote=
:
> >
> > For arm64, only some platforms support HVO. Add an arch hook,
> > arch_support_vmemmap_remap(), to prevent HVO from taking effect if the
> > architecture lacks support. The hook is not HugeTLB-specific, so it can
> > also be used by other users of in-place vmemmap remapping (e.g. FS-DAX)=
.
> >
> > Check it in hugetlb_vmemmap_optimizable_size(), so that hstates are not
> > reported or treated as optimizable (e.g. by report_hugepages() and the
> > HugeTLB allocation and freeing paths) when the architecture does not
> > support HVO.
> >
> > It may be the case that arch_support_vmemmap_remap() returns false at
> > first but eventually returns true. This is the case on arm64, where
> > support depends on a system-wide CPU capability that is not yet known
> > when bootmem hugepages are allocated. Such architectures cannot pre-HVO
> > bootmem hugepages, so they must disable the section-based vmemmap
> > optimization in their vmemmap population path with
> > section_vmemmap_optimization_disable(). Their bootmem hugepages are the=
n
> > optimized when they are gathered instead.
> >
> > Signed-off-by: James Houghton <jthoughton@google.com>
> > ---
> > include/linux/pgtable.h | 15 +++++++++++++++
> > mm/hugetlb_vmemmap.h    |  2 ++
> > 2 files changed, 17 insertions(+)
> >
> > diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> > index ab33df268955..8cf44120e2ed 100644
> > --- a/include/linux/pgtable.h
> > +++ b/include/linux/pgtable.h
> > @@ -480,6 +480,21 @@ static inline int try_update_vmemmap_pte(unsigned =
long addr, pte_t *ptep,
> > }
> > #endif
> >
> > +#ifndef arch_support_vmemmap_remap
>
> We usually add a 's' to 'support'. Like arch_supports_vmemmap_remap.

Oh yeah, I'll fix that. Thanks, Muchun!

>
> > +/*
> > + * arch_support_vmemmap_remap - Whether in-use vmemmap mappings may be=
 remapped.
> > + *
> > + * Vmemmap optimizations, such as the HugeTLB vmemmap optimization (HV=
O),
> > + * remap vmemmap page table entries while they are in use. Architectur=
es that
> > + * can only do this on some systems may override this hook. It may ret=
urn false
>
> "Some systems" is not clear for me, How about rewrite this sentence with:
>
>   May override this hook based on architecture-specific runtime condition=
s.
>
> > + * early during boot and true later, once system-wide features are kno=
wn.
>
> I think the description should be general, so the last sentence I think s=
hould
> be removed.

I think it's important to clarify that the return value can transition
from false to true, but not from true to false.

Okay how about this:
   * Vmemmap optimizations, such as the HugeTLB vmemmap optimization (HVO),
   * remap vmemmap page table entries while they are in use. Architectures =
that
   * can only do this under certain runtime conditions may override
   * this hook. It may return false early during boot and true later. Once
   * it becomes true, it must not start returning false.

What do you think?

Thanks!


>
> Thanks,
> Muchun
>
> > + */
> > +static inline bool arch_support_vmemmap_remap(void)
> > +{
> > +     return IS_ENABLED(CONFIG_VMEMMAP_OPTIMIZATION);
> > +}
> > +#endif
> > +
> > #ifndef __HAVE_ARCH_PTEP_SET_ACCESS_FLAGS
> > extern int ptep_set_access_flags(struct vm_area_struct *vma,
> >                                unsigned long address, pte_t *ptep,
> > diff --git a/mm/hugetlb_vmemmap.h b/mm/hugetlb_vmemmap.h
> > index 8b28063d78cc..440477288d19 100644
> > --- a/mm/hugetlb_vmemmap.h
> > +++ b/mm/hugetlb_vmemmap.h
> > @@ -48,6 +48,8 @@ static inline unsigned int hugetlb_vmemmap_optimizabl=
e_size(const struct hstate
> >
> >       if (!is_power_of_2(sizeof(struct page)))
> >               return 0;
> > +     if (!arch_support_vmemmap_remap())
> > +             return 0;
> >       return size > 0 ? size : 0;
> > }
> > #else
> > --
> > 2.56.1.809.ga0b61035b5-goog
> >
>

