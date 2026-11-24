Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 007F2606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 17:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pLv+eRa1;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZQHDzjWA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=tdBRQuRPxwEZd2+vFYBwLL5uePULho2FVfb2iukzoGg=; b=pLv+eRa1C7vRWi
	F41Rl66Mx3CSSahjOw3mH08zBctq6j77kiKtMNfx5IPMt5lwhdKngLJUnX8YfyZ1+vS4psHDN+XcM
	5MVRmMoy+fhxCidoOo4wjzmt88MSkb7384ehx43vreB4dneLVyEgXppXTprJWstsEJ0t93MM5cMws
	ZkuqpYcjjfITawPYOHbo8WjVlRbAu2pQvSgXIzK5eChC586oZwB87xsziPy+QtYGLc6s00rBWpQkB
	LMOwGwfm/jrlHApxo3vo9bCJGR+4I/KD8vwGUQQmgUJKwMYW8Hm5Mmm52Pt+WNyYoRj5HUPGoeQZh
	tnmNejZawxxhXWu001vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVu5Q-00000007JIJ-1orD;
	Tue, 24 Nov 2026 17:13:45 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVu5M-00000007JG5-3Awv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 17:13:42 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-c5198302d38so118871166b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 09:13:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795540419; cv=none;
        d=google.com; s=arc-20260327;
        b=bk0qh33DD7m7wHTT9r2WuGxhFW1YK53cWizvTvzwTB11Bt+W1cDMUau7DCBaCU0nqH
         KgtF3GDS957AaClsdHS7q/ZAnV8d+xoKMC9j5QfXsyP4Oq7HaPPSV2zNI5I5WXfiOhTp
         qqtrDqpZg+G5xw5/Le1/+GlaQwicHqMSzRFMagfCF50kyEPiUACSc46wv+6wh0Qwa6D/
         Ao5SqaqL2/9lW5Z7S2X40p8BLhv+RkVD1MGqzJ8MJbrpttK4chpwHvLPNqZqMYnCxjIX
         Ei+gGe6ET0Z4grhAluoeS6kgw1yEqtnKIrM5qkyqrdTUd18pSeWWmhCVzou/xqO5CSpE
         qV4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tdBRQuRPxwEZd2+vFYBwLL5uePULho2FVfb2iukzoGg=;
        fh=d62tHEvDhY8mEuzMYUZ93J1YDX3/J6ayXZbPvU9nZOs=;
        b=OzfSHABdr4y/jy5tcG9H4pa45FeCN4LLLgq74RLUxmZwHKJAiMYS+Vb1inYWvyRpeW
         kZYBAK6Ohfoj12xcd5AkUnVB2brlusGD+5TonXthGXJ8gDVqkViozqgYtxrU5EWmQCKA
         EpCkhwYkJ8BLlfVpmooiYi+LvS2y46wtmgqEivSpmcdrb2tm+iPXtuu3qsIBeNmiC2Yb
         cG5qBldyDvYw+/dJx751dQXeNEeeN3hk6PJH+ldd8p5Bk4x5/S0pm/436tLe80+NbJMV
         QaMEou5JPk8TazlAipe+d1RPaUHJY5aV92mCEqbBPPRHIIY4Xfjx1VnczT2qqSaNvuQJ
         LGXA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795540419; x=1796145219; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tdBRQuRPxwEZd2+vFYBwLL5uePULho2FVfb2iukzoGg=;
        b=ZQHDzjWAycaxnlZTqkfmuo5aIRUQbbgBYHOqHAoVXYb+n1uT0ZLBGhGnKdjzuQ5mk4
         1l4piYd9J1GIgJ1FioTQPnOrw/O+mYfeTtT8hqadRq7dyftBUps/D37jXke2ExSdGLGo
         qOTdX3/KFXvAUpauNkJ11R1bJFTXCWxY5WqXk1j29l1IdlzoJdQKg5ElAPGY3uCT21KK
         DQjDlJFHpSX2k+eFC6ABF7C1KmGP93lRpG7t4hvmsng/5NXmMztRtS2zjfcon1xL/sL7
         5LtOnuwi03ACj7SnvHmb3JZnI540A0I1H/ovHBzfJefx9LE/fYMdk6cHir1fvIcUc3tC
         KrGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795540419; x=1796145219;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tdBRQuRPxwEZd2+vFYBwLL5uePULho2FVfb2iukzoGg=;
        b=XLdIQy7DAYbT7+At/ne92088UlrW9lNfTYztUzKRpd9cR6I9Jijhg84vZ0xERfHqnQ
         Xo6X2gusbGh+zWRaU8YUtBz9m++yKZXTwRt+1to8YOgWTmHpx1/PX7yvOOZcL8eUkzTH
         x8N8gUwyFZZzDq+PrD0e4ZvM66DpDkgbbZZO+R/avrgnvQomQITvfDnY6Z+Vcx4HAKEg
         EwFakiwXpjmQNmigXr9fHm3jmV9eBDe2wsJ5wLyxLlpfyIPlCB5+BohPKvNdZITlyOTv
         rOPo7x+iSR7lpPTBOprsdmPtzltCEmj6xvxkODNPjNR0Ql9+w7Rp00vaGoeFwbo5RC9v
         pj4A==
X-Forwarded-Encrypted: i=1; AL+hErHRE1oIVC3LstjQMd6cAx/S0vQuDG3OhVYTXSqSROzPveRfPuKG3hkcsDPO1XNC2iQg6eKk7dlfsPET4gfxQv+V@lists.infradead.org
X-Gm-Message-State: APuU4Z/KcVl2wM/WHBaup0whz0yrmNwdbctyDxbiFxA2Dn0tdvgBOyQF
	YZwoOtVmcYEACKIWf7KdgFhMz0cH+qT9z+1x492tSY3Khy1gvAQc4TQAdGHB+/JaGvyW2/zSH2m
	o2Xj8DiySWvxDAADs2KHJsR+0SIsIfuw+MgWhlaYP
X-Gm-Gg: AZFdTZcamEuZbIQ/mRQ9ILAPG3py6phktNDpJptA/cBkirp1IWjvSz6o5posQ3P+enh
	1jV5xxsNCNDVHBZu5TJdQulVo169gvRN/hUlNLtzQwV8Hmo87OrQNcHosybT64TqqjvQSca5Zhx
	LIcwDOk6X8WSzD1kcd3xyanH83RgqT7ytK9igmg5BkxkUUHUNuDTjgz5mJSnNEUREgDoLsqJVlN
	vi0AVYqDJKSfWU0CGxNL/z4IVGRfs+D/opVFWcBdqsPyvMOAPYiMypAU3NgkMeIPxSA57AdbvbQ
	1rsXle4JWOrVXoq3ET7x49lTJI4jEVsWVDB//pa56KodHix5sSARDELkCkx5EALj+fRGhn0YI6w
	ICLv+bzFB5/VViERWMMGoXlh5V8+FrA+q9PMz6vFQIJkyYrucaCyqrAAbeodyEk0iVp5RXIJGWY
	l+p1aM+J3WJcolX/mBdAN6MHRxMJqyzY+p8+Pb+25NMPJX7gJ7S7bFfZiv2ZxdnEallo4E8sNVM
	A==
X-Received: by 2002:a17:907:6eab:b0:c29:f5d8:9c78 with SMTP id
 a640c23a62f3a-c513aab17ebmr1287834866b.39.1795540418086; Tue, 24 Nov 2026
 09:13:38 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261122184453.2668189-1-jthoughton@google.com>
 <20261122184453.2668189-9-jthoughton@google.com> <9487E341-5F59-4245-BE0E-EFDD413E45D2@linux.dev>
In-Reply-To: <9487E341-5F59-4245-BE0E-EFDD413E45D2@linux.dev>
From: James Houghton <jthoughton@google.com>
Date: Tue, 24 Nov 2026 12:13:00 -0500
X-Gm-Features: Aa3M54p8XNdyqhw8NgJKcdhzlhzDFTnyhToFP0C3oUsuY3ie39XtBoe2DJRFnVg
Message-ID: <CADrL8HXPKfUhRaVhVyV6CPoQ2apZx1FCpyqyPMr=p=Q_kF3HBA@mail.gmail.com>
Subject: Re: [PATCH v3 08/19] hugetlb_vmemmap: Expose whether HVO is enabled
 to architecture code
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
X-CRM114-CacheID: sfid-20261124_091340_833685_969CCC51 
X-CRM114-Status: GOOD (  41.84  )
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

On Mon, Nov 23, 2026 at 3:50=E2=80=AFAM Muchun Song <muchun.song@linux.dev>=
 wrote:
>
> > On Nov 23, 2026, at 02:44, James Houghton <jthoughton@google.com> wrote=
:
> >
> > Architectures that select
> > CONFIG_ARCH_HUGETLB_VMEMMAP_OPTIMIZATION_SYSCTL_RO may configure the
> > system at boot depending on whether HVO is enabled, e.g. arm64 may
> > require all CPUs to support hardware access flag updates only if HVO is
> > enabled.
> >
> > Add hugetlb_vmemmap_optimize_enabled() so that they can check. It is
> > declared before <asm/hugetlb.h> is included, so that it can also be use=
d
> > from inline helpers there.
> >
> > It only reflects the hugetlb_free_vmemmap=3D kernel command line parame=
ter
> > (and the sysctl, when writable), not whether the architecture supports
> > HVO.
> >
> > Signed-off-by: James Houghton <jthoughton@google.com>
> > ---
> > include/linux/hugetlb.h |  9 +++++++++
> > mm/hugetlb_vmemmap.c    | 18 ++++++++++++++++++
> > 2 files changed, 27 insertions(+)
> >
> > diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
> > index 0d5414392d87..b2a6441bcd84 100644
> > --- a/include/linux/hugetlb.h
> > +++ b/include/linux/hugetlb.h
> > @@ -22,6 +22,15 @@ struct node;
> >
> > void free_huge_folio(struct folio *folio);
> >
> > +#ifdef CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP
> > +bool hugetlb_vmemmap_optimize_enabled(void);
> > +#else
> > +static inline bool hugetlb_vmemmap_optimize_enabled(void)
> > +{
> > +     return false;
> > +}
> > +#endif
> > +
> > #ifdef CONFIG_HUGETLB_PAGE
> >
> > #include <linux/pagemap.h>
> > diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
> > index 142f2975846b..fb6da64bd80d 100644
> > --- a/mm/hugetlb_vmemmap.c
> > +++ b/mm/hugetlb_vmemmap.c
> > @@ -452,6 +452,24 @@ static int __init hugetlb_vmemmap_optimize_param(c=
har *buf)
> > }
> > early_param("hugetlb_free_vmemmap", hugetlb_vmemmap_optimize_param);
> >
> > +/**
> > + * hugetlb_vmemmap_optimize_enabled - whether HVO is enabled
> > + *
> > + * This only reflects the hugetlb_free_vmemmap=3D kernel command line =
parameter
> > + * and the vm.hugetlb_optimize_vmemmap sysctl, not whether the archite=
cture
> > + * supports HVO (see arch_support_vmemmap_remap()).
> > + *
> > + * The value is final once early parameters have been parsed only if t=
he
> > + * architecture selects CONFIG_ARCH_HUGETLB_VMEMMAP_OPTIMIZATION_SYSCT=
L_RO;
> > + * otherwise it may change at any time through the sysctl.
> > + *
> > + * Return: true if HVO is enabled.
> > + */
>
> I don't think hugetlb_vmemmap_optimize_enabled() has clear semantics.
>
> Its name suggests that it reports whether HVO is actually enabled and
> usable, but it only returns the policy bit set by Kconfig, the command
> line, or the sysctl. It may return true even when
> arch_support_vmemmap_remap() is false. This is particularly confusing
> because arm64 calls it while determining the capability on which
> arch_support_vmemmap_remap() itself depends. Therefore, the helper
> really reports whether HVO was requested, rather than whether it is
> enabled.

I agree, the name is misleading.

> Could we keep vmemmap_optimize_enabled private and let arm64 retain
> the boot-time setting locally instead? For example, arm64 can use a
> private hvo_enabled_at_boot variable with a
> core_param(hugetlb_free_vmemmap, ...) registration. The system
> capability is evaluated after core parameters have been parsed, and
> arm64 makes the HVO sysctl read-only, so the value remains stable for
> system capability and late CPU verification.
>
> What do you think?
>
> +static bool hvo_enabled_at_boot __ro_after_init =3D
> +       IS_ENABLED(CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP_DEFAULT_ON);
> +core_param(hugetlb_free_vmemmap, hvo_enabled_at_boot, bool, 0);
> +
>  static bool has_bbm_through_af(const struct arm64_cpu_capabilities *caps=
, int scope)
>  {
>         /* The kernel only enables HW AF updates with CONFIG_ARM64_HW_AFD=
BM. */
> @@ -2055,7 +2059,8 @@ static bool has_bbm_through_af(const struct arm64_c=
pu_capabilities *caps, int sc
>          * BBM-through-AF is only needed for HVO. If HVO is not in use, d=
on't
>          * penalize systems with mismatched support.
>          */
> -       if (!hugetlb_vmemmap_optimize_enabled()) {
> +       if (!IS_ENABLED(CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP) ||
> +           !hvo_enabled_at_boot) {
>                 /* Only valid if HVO cannot be enabled later via the sysc=
tl. */
>                 BUILD_BUG_ON(!IS_ENABLED(CONFIG_ARCH_HUGETLB_VMEMMAP_OPTI=
MIZATION_SYSCTL_RO));
>                 return false;
>

This is a good suggestion, but let me explain why I don't think we
should do this:

First of all, I'm changing the bbm_through_af capability from a
SYSTEM_FEATURE to an EARLY_LOCAL_CPU_FEATURE, which means that
has_bbm_through_af() will be evaluated before core_param()s are
parsed. I could change it back to a SYSTEM_FEATURE, but I would rather
not do that. (See [1]).

I also don't like duplicate parsing of the same command line argument.
I'm not sure if there is precedent for this, but I feel like it will
lead to confusion. (It is news to me that duplicate parsing like this
is valid, as long as they are not both core_param()? or
early_param()s, I think?)

It would be much easier just to rename
hugetlb_vmemmap_optimize_enabled() to
hugetlb_vmemmap_optimize_requested() and properly document what it
returns. Does that sound good to you?

[1] https://lore.kernel.org/linux-mm/CADrL8HUgo0zAHe7_eF1+hfTR6jBbZ=3DUKB1q=
PpMWpksvqbNHsyw@mail.gmail.com/

