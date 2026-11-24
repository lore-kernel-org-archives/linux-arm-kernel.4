Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0078E606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 16:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BgFlXzDj;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=UQHhnatg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Czsesa5ZeOVdF9UZnZPtwINhyqTnZrrNDtc5MtD/hAc=; b=BgFlXzDjOZu2ts
	4IUfQwawGdUCO4Y2ebPA0MhQ89HcGmQRYYqlpsbACc8H2JQ1cvj8CgIIGxA0f4ti+oHOw46k3bZEN
	0heBlbt9tUzE6u+GQz2M9sNFdFwA1eOuquOCZSusJXnRVOVNRmQYl6VHTCAVf2CkmsikEzGNWgIv/
	dXTEFWue2/BhZt94RH13GyFVAf+wWI5uCsbJVuqVb+h8biQfPefoTcX9ELTKDcU29oYuCFENJC6Zr
	aBHaKSQLiA/yLE/2ASTjCwq3dVJSmv+mLP3l1dSPnyMaqomrkvEv8UZwP1IPAC1Z8rsuYrelVjnz2
	YbaRL602sljJe9yR9XGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVtrM-00000007FDD-2406;
	Tue, 24 Nov 2026 16:59:12 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVtrH-00000007FC2-386i
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 16:59:10 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-c4d21051042so771605266b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 08:59:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795539546; cv=none;
        d=google.com; s=arc-20260327;
        b=dencwqJTzbCM6O02dJXXh9BbYHfm9as9sssgvJiEv3pBVxfS9mUtLVcXYHPFvu88NG
         g8WA738W21MtNSEMLOwlKmGq9Qi1OVakck86PpwYBLqgtjQg+OL7RnmlSXpapEzCjV7i
         LIIIWt4UrmK/Gab/f7lNNiaDc6tRAT5m+Ub7S2Bp8giGcrf5hFkpuI26HEPqWElitJQT
         kKula3ltN6Ytk49GaM3xZrf0I9nIQvnlm6Fy7X3NEMHZUQEw+VY3/BLKvanizgCgLd6g
         lkbX/TXXvY3/KHSBGfZATSXOO6rWqCr0EQIP7Fc78ntVaj8q++VAaNeIfDQIgLs4C1Dc
         KJzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Czsesa5ZeOVdF9UZnZPtwINhyqTnZrrNDtc5MtD/hAc=;
        fh=+NNAbfeiZ3ImcAgIK+8GFBhM+SmB8Ez/+r6iIeok1Kk=;
        b=A/3d1i2vkbXiPM8fXvX1pAOAgz+bzEI0Nbp35ymT74efWxhfvpBb/jCvLOH2SBVhMs
         o3axsyvfef0ye7SJ7vGRvGATt+p07pFsovtQiGjlPW76r4nZJYZcc5kLvYJ4JKj9Wd/3
         ktpceD21kFekEVgzd0V0bDg75MV5V/Jj+eMsT0wGM6Bzs8/hMCQZAFQH8YT2d5ltJoUj
         Rm305Fg0LRsELERkGzt33oPpIWJ3n7w3Rddp9zObDMLGQnbZguA9FrT207NkqMqrYLO9
         kA5iLhjaciHlxieB3O0ZZvtUYdHC6BFHJeYYLfB5ux6f9TdbgxMIYrpe9gUSRpBiIBvx
         aT/w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795539546; x=1796144346; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Czsesa5ZeOVdF9UZnZPtwINhyqTnZrrNDtc5MtD/hAc=;
        b=UQHhnatg6YzY31zDhaQ90iAsXfBS5yY9naddtdHQAFjiGJz1DPTm5BI6pJ8PyhCLnK
         kibSkf0cZSVC16hIzV/GRzPqyUIopcaNHFuuMB7VCx/x6zEfusbpVCwj2L/b595rwX8l
         2cm1+i9OXozN/mxb+2HvFb9XAMkDuZ96IJ+OUS+n5Wgxvp85HrTBNgV9b3VvhZ7D9zLN
         rzsE/KKazMVrRm0uIsB+qiOgO0hFAZr5uqnfxmvDKt78winRGn0BAyeagEs7iCsAzcyI
         pI48MabxeSD4kEONuHSSymVyg59pWsFbUFeCHcCt7D0I4Pwu9ixz9HABCXyw9ess5Sk4
         ASsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795539546; x=1796144346;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Czsesa5ZeOVdF9UZnZPtwINhyqTnZrrNDtc5MtD/hAc=;
        b=TXWWFbaqFe18rl58W8mUe9Yyouzqw9aAT7xaBbqvj/pZo+SEQi/5UX8z9kk61SrgeG
         QAXOKr0jUX5debn/zsq9eqz7B1eFPce1wAYtA2PzZPi1ZWZCe9FvjQkNO5mx5GR7LIIT
         t8hrUce6wr9Qu6/gV9WDrJQWB6CHLqf3zXQRHuf/h/TUBKsSICQwxjQ38JED2LeXrO6R
         jnmvRBTOHx4tMChxGNCDx1ZjWQUffH+hqcSThrrpM8hQjaGeixPLNoY5rPfwShbesvmf
         JLha41+rmaliiB3gpfxYn7sLOqH1Hh/yZPMRFry2DJgnylUlRnGcPX8BCZ2Gwo3qMW6n
         Jl6g==
X-Forwarded-Encrypted: i=1; AL+hErGEpEJ5GeiM+b309TC0cjD5Vq7kjYzw8mtRLXJlYlkojnfVvKWjksBCi5CuUAWnuAVKf0QCsybo6WtQNTJ5MKq8@lists.infradead.org
X-Gm-Message-State: APuU4Z+2sCxms+pYVqntEsFsGNERtNKcpHVRNqQiMqrGM3lMC5hU3fj+
	BAHiA760phy5FinDcQ5oSwmm4JXkYlVVXTBPrB2Y7e4ovU9ommIdED/I+kPDp/Egi10YwlYXSXM
	W1eC2ca28b0N2SB7ggVd+zAgRMZEhRR4J3/Fzszo+
X-Gm-Gg: AZFdTZdg/eBAwgJf1NPKC8dnfoFhDRY1vrIuaG57gJOL33qPzqjilVSNiwbVkqwkBwr
	uglMmnaE45zN5hFSd1vcqO7E+e4NfssQjbxTQmBlEmyM0oscHQc2D8cHyVlkshxK/GDdOhJuSHb
	DcQIbJN2rKDQ52hBD/F15cqhfs4YAnTVljolXfnk+Dmih9A6cS9bWvWl1DyYW+YCzjowyhl6eCe
	MBWe2ctX1oTmMxMrJu8zDdR4Tu4x8UquMpJ9iap6KJi2dOGYq+2gAO7ruUHbfoFXs0WtQBMkHHL
	Gp22bkc8GqtUgF0lN134De9n3Az7KPRXjpU8XsBRN8N6kAtAKEKZG+nnO64cNT2KkPvAkj5wCeR
	ds7Zb0AeAJJoF91NtUOnTBiv3Bk/8VPXzGZoe0FtnLt8meMz66pKSRfyoMEdJnIpRXKOmZnQ/iC
	709rNaFCLnWHEwhH3gEbJEp7Z/dYUriqyIFTR41IBD6IOfFoqD9OXe
X-Received: by 2002:a17:907:9d1a:b0:c51:3b58:b99b with SMTP id
 a640c23a62f3a-c513b58bc59mr1253328666b.19.1795539545161; Tue, 24 Nov 2026
 08:59:05 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261122184453.2668189-1-jthoughton@google.com>
 <20261122184453.2668189-7-jthoughton@google.com> <CF94E7D7-87D2-4523-9343-512EE00094FA@linux.dev>
In-Reply-To: <CF94E7D7-87D2-4523-9343-512EE00094FA@linux.dev>
From: James Houghton <jthoughton@google.com>
Date: Tue, 24 Nov 2026 11:58:27 -0500
X-Gm-Features: Aa3M54ohYXliwBIhyvf_be5zFFZBRmz0PsOJzrNeOCUHJCfDe6sQjb1ES_TJZKg
Message-ID: <CADrL8HW8+eFt5f1VBQ0zt-ioiU3X150W4ROaKf2Nzw4j9+0i_Q@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20261124_085907_809812_402A1EC4 
X-CRM114-Status: GOOD (  30.67  )
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

On Sun, Nov 22, 2026 at 10:11=E2=80=AFPM Muchun Song <muchun.song@linux.dev=
> wrote:
>
>
>
> > On Nov 23, 2026, at 02:44, James Houghton <jthoughton@google.com> wrote=
:
> >
> > Boot-time gigantic folios are expected to be pre-HVOed through the
> > section-based vmemmap optimization, so the bulk optimization pass for
> > bootmem folios was dropped.
> >
> > However, arch_support_vmemmap_remap() may not yet
> > return true when bootmem folios are allocated (e.g. on arm64, where
> > support depends on a system-wide CPU capability), while it does return
> > true by the time the bootmem folios are gathered. Such architectures
> > disable the section-based vmemmap optimization in their vmemmap
> > population path (see section_vmemmap_optimization_disable()), so the
> > folios are not pre-HVOed and would never be optimized.
>
> Yeah, when I removed support for this part of the code, I figured you
> might add a new patch in the future to add support back. It is fine.
>
> >
> > Optimize such folios when gathering bootmem folios. Their tail struct
> > pages have all been initialized by memmap_init_compound_page(),
> > as they were not pre-HVOed. Pre-HVOed folios are skipped by
> > vmemmap_should_optimize_folio().
> >
> > Signed-off-by: James Houghton <jthoughton@google.com>
> > ---
> > mm/hugetlb.c | 11 +++++++++++
> > 1 file changed, 11 insertions(+)
> >
> > diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> > index 72839e98f998..8756c0206922 100644
> > --- a/mm/hugetlb.c
> > +++ b/mm/hugetlb.c
> > @@ -3325,6 +3325,17 @@ static void __init prep_and_add_bootmem_folios(s=
truct hstate *h,
> >       unsigned long flags;
> >       struct folio *folio, *tmp_f;
> >
> > +     /*
> > +      * Bootmem folios are normally pre-HVOed through the section-base=
d
> > +      * vmemmap optimization. However, an architecture that can only
> > +      * determine whether it supports HVO after bootmem allocation dis=
ables
> > +      * the section-based optimization (see
> > +      * section_vmemmap_optimization_disable()), in which case the fol=
ios
> > +      * were not pre-HVOed and must be optimized now. Pre-HVOed folios=
 are
> > +      * skipped.
> > +      */
>
> I'd like to condense these comments to something like:
>
> /*
>  * Some architectures do not support section-based vmemmap optimization,
>  * so their bootmem folios should be optimized here with folio-based
>  * optimization.
>  */

Applied in v4, thanks!

Also just so you don't miss it, would appreciate your thoughts on my
reply to Sashiko's comments on this patch[1]. Let me know if you would
like me to do something different.

[1] https://lore.kernel.org/linux-mm/20261124165516.1182390-1-jthoughton@go=
ogle.com/

