Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3221060A3816
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 17:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tNRwldWM;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Sp4O/GYt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=7opp9hPoTKTPhk0yMQ4YWgEN212V/vxQj64/fQGJyZQ=; b=tNRwldWMNRZIPb
	bRtrbheII8ecP7MEiQejO/DSlA8FlFCk0HFAZdIXEgYr1FDFMzmpixdjH0Lb0yvKjt8QFUcn9BGA0
	BjGe+5OsSTZt2mswHfbOhDlLvN3f1qvHmdzSfXpK26nDjVFX5dMuaAfuYxvVxGMzplK4za0nPWnIa
	CvN1FKnSwMSp8i/+0hLUHlX4khiYNdIVSKPOl/jGC8GwBkeFBYAMz8OXVuOnDBwMMEdlpvdAy2a2J
	Gp215+l49NsFJMeXRJr/s06kjoORx4NLtIfyOpXi7DrC6ZXi3FT8KHgzRtfp2jI0fgPPG8cy2hqQu
	pWW/JG6fr0D7S6n/nwKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVuND-00000007Mod-3nYZ;
	Tue, 24 Nov 2026 17:32:07 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVuNC-00000007MnK-13wL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 17:32:07 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-c51373ae637so726817966b.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 09:32:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795541524; cv=none;
        d=google.com; s=arc-20260327;
        b=h6f07aP9CFzGD/v7I0U3CL7M9vN2Xzxutu04tgMsSUPWSHfsKjrQLTPyypA26Y3AAv
         9P7kD8FpNTqUn84Zj34ueRovR0MB2Hxo3YsT3vhQ/6fBPY5rwVqxgpRJ0tHnKGWNKFzO
         YlYJi/qaKhVe+ssXn71SVm5RPFml4ywAKm+IXZDSocBP+VHFvt8FjTSEC34UrTUJh9Vn
         SYaRToI4amXNjwX9z4ON43gMfoVenS4/xCKge92k5nW6CXSIzygwdW45SVHrCfiWxfya
         X0jeitVphKnxANeTo8m0gfvoypdHYivZ1Fyn/BzFJaSwla95wAUv6LCdc7dO9soTY0zV
         uxaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7opp9hPoTKTPhk0yMQ4YWgEN212V/vxQj64/fQGJyZQ=;
        fh=lign9jMAio9JMH+892pkAXlrAiUag++UeIc5NJQKSlk=;
        b=OSspj/v5bFwZ305zYlcEcbI4nkpHzxi/6a/980hUanOflnssJSkcXrK3WLf2UcWHg6
         Hk0gCZZrku6Y7ddbIOmnY7ymin8XsMdKb6QMcYRcC9MGCB6aaNWE7xzdVEZuJpGigQUj
         TMmasvF4OcMTz888aPwc5aCSt46f9SRoJuaosLK3I/yjlpNAsPUfN2gMvPYbK/43N/cz
         tWXxphOcVPbkDidImmd3gJ3o+u1nGritub5NLOyGSOni2NKEviGzzCDye+Pd/sGiZqf0
         pDgX21Xx8xyaStx8vJLoGfrwrXeC2zUTSJ98EgytznypvQ0QTEAqTAA2X/HK274WgMTE
         YV9g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795541524; x=1796146324; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7opp9hPoTKTPhk0yMQ4YWgEN212V/vxQj64/fQGJyZQ=;
        b=Sp4O/GYt1JXO4oE8FBKhTNvlSMP96PPrZ9OT/VZbWEJP9DIx9Bp8mmUOHjmZOsoock
         AX59i4d0Qdjp4WDKZUsxwzKfQ/B67zygpjWwZ8nErRaFURDdVPjHecJT6tP73Xz/JNhY
         BW6+cr6jUqCYGEQVY34hEAK5RQgSogSSmwCdzcJnfhsSvW5VBvvxgzHqEmLc3wgnBkdy
         mb12K89al1RfuH1QMozx4baBJztqsPef78I499TlTFB9TnNKTp9IU/F1ULdDWDqipZHu
         V7E5XdKQd7/MFHTVtpT+SjwDNW7Bz+TSaiynkAOEE18pLjIwydOcUfQjbeR3HikdOTA2
         QDxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795541524; x=1796146324;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7opp9hPoTKTPhk0yMQ4YWgEN212V/vxQj64/fQGJyZQ=;
        b=bkf2kuKCL4j9+IaHRza5iLOyDtp7oviZnHRT1NAlYaYItimM2sYKNavLbT1z5ZQayv
         yMw1Xbmn+e5BTepEyfJFAL0PtY2BpjMTOyIp4ZVjF2h7WtgsosDHCd5w6V9y8uCMN8vO
         GvWLuuk3vcxp/zZwu8t8+PvODSHwez+U9jHhASn4sQAbXNK8xE7CHo8wCMXkpQLfEXZk
         PxKjjdVetev+TSdi6OV47h9/6oQmLfmpmFQW/P9Fg40xDS+lgExNN7hce98Qcq6sQHLU
         wawfIvoivkQzfJQpeR6JU2XBMRRyNL4vSx46sKgb3E+FwVGwPsnrW+bP3R7TeK3kNWWT
         DOYg==
X-Forwarded-Encrypted: i=1; AL+hErFbT7W9kOYQzKQKWcKOQnv1r5FO8mJD4VglK4DQ0YBloqipDIUXk5xoMztUQTLfWKLWQrNlGHHGt6uoVcPrEpYh@lists.infradead.org
X-Gm-Message-State: APuU4Z+6/ef3+vgSCD90Z5xOqYt2Z2Jcx8pqzuTr1V9UjM508jExHSiD
	VLOTRlrgszRYP6ogPkePCPPpEnN7oNbrDeZJ/OBOEcZ5XWsmxYRGol6nWDLUQgOxtxxuOPcfhcO
	iVbF2FopN4qXsN468IWnRqaj1mm4plVzMugQiIRi2
X-Gm-Gg: AZFdTZdQvIH+wXzzZHwmSXpw9MH+u8J873Fir5gJLRK/39QFwNRX9Ya0L7RlOsLdDJm
	IhFjgNH+OcoSD9/P7NDVflhQLheKj3p7kF+gF/1pUTRYcD7VIJ24oJ37nLNM5uoTB+HIEnvfF33
	7BtW8hloijW/xeKqe9J9IhttrxAsmwEQHKPnoTv8Fz1xUij5iKNvWybG/Y3PFkG4g9fnbgf7PC7
	9/EttW+lQT3Q4HAQuuHERjVChdZ6L4K4im6CDLJuCyythW0w6WEMkfQvKGGhwukjbDtG5jr9id4
	/p3ncpOI8pVJYFL8Ij6G8m53ixg5F9TyAvA/4hGo+r0RGDBS1gTRXO2Air7qL6pFKGYNqO4jAA8
	bIJS0iUV7MLj7xjLWGh0M9m6Q0ZDCZ9g2CXIRIbhW4Rkn5IWg6y7zCkyLAelZ1l1SKU6GOiOjN0
	qthjqq7sJC/9/RWUDxAGl+4QGtZqyAa4mK3lSNY2jPlUILTj4NVMA=
X-Received: by 2002:a17:907:f447:b0:c51:3b74:9d07 with SMTP id
 a640c23a62f3a-c513b74a25fmr1285241866b.18.1795541523747; Tue, 24 Nov 2026
 09:32:03 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261122184453.2668189-1-jthoughton@google.com>
 <20261122184453.2668189-13-jthoughton@google.com> <64639588-CB39-4980-A9E3-8423AB0DF268@linux.dev>
In-Reply-To: <64639588-CB39-4980-A9E3-8423AB0DF268@linux.dev>
From: James Houghton <jthoughton@google.com>
Date: Tue, 24 Nov 2026 12:31:26 -0500
X-Gm-Features: Aa3M54pJowFxRXx8hUGNB1puE_T2twV36WACIQPmhuWjpD5RyPK2KGuMrESCLFo
Message-ID: <CADrL8HW6FuyzV+cbdV7n6-=3fPzAz0fPuEEoa6e6sc42uz=-fA@mail.gmail.com>
Subject: Re: [PATCH v3 12/19] arm64: Support hugetlb vmemmap optimization
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
X-CRM114-CacheID: sfid-20261124_093206_382775_025D618D 
X-CRM114-Status: GOOD (  29.59  )
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

On Sun, Nov 22, 2026 at 10:26=E2=80=AFPM Muchun Song <muchun.song@linux.dev=
> wrote:
>
> > On Nov 23, 2026, at 02:44, James Houghton <jthoughton@google.com> wrote=
:
> >
> > Support HVO if HW AF and BBML3 are supported. These are the required
> > features for the vmemmap to be modified in place.
> >
> > On arm64 systems that do not have the required hardware features to
> > support HVO, the HVO sysctl will not appear, and any attempts to enable
> > HVO (either via the command line or via
> > CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP_DEFAULT_ON=3Dy) will have no effec=
t.
> >
> > Because HVO support is only known after the vmemmap has been populated,
> > disable the section-based vmemmap optimization in vmemmap_populate(), a=
s
> > LoongArch and powerpc do. Boot-time HugeTLB folios are then optimized
> > when they are gathered.
> >
> > Signed-off-by: James Houghton <jthoughton@google.com>
> > ---
> > arch/arm64/Kconfig               | 1 +
> > arch/arm64/include/asm/pgtable.h | 6 ++++++
> > arch/arm64/mm/mmu.c              | 9 +++++++++
> > mm/hugetlb_vmemmap.c             | 4 ++++
> > 4 files changed, 20 insertions(+)
> >
> > diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> > index 4cce60c2de66..b13618f0ace5 100644
> > --- a/arch/arm64/Kconfig
> > +++ b/arch/arm64/Kconfig
> > @@ -95,6 +95,7 @@ config ARM64
> >       select ARCH_WANT_FRAME_POINTERS
> >       select ARCH_WANT_HUGE_PMD_SHARE if ARM64_4K_PAGES || (ARM64_16K_P=
AGES && !ARM64_VA_BITS_36)
> >       select ARCH_WANT_LD_ORPHAN_WARN
> > +     select ARCH_WANT_OPTIMIZE_HUGETLB_VMEMMAP if ARM64_HW_AFDBM
> >       select ARCH_WANTS_EXECMEM_LATE
> >       select ARCH_WANTS_NO_INSTR
> >       select ARCH_WANTS_THP_SWAP if ARM64_4K_PAGES
> > diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/=
pgtable.h
> > index 7421c0a048ff..5dadaac54bef 100644
> > --- a/arch/arm64/include/asm/pgtable.h
> > +++ b/arch/arm64/include/asm/pgtable.h
> > @@ -1931,6 +1931,12 @@ static inline void clear_young_dirty_ptes(struct=
 vm_area_struct *vma,
> >
> > #endif /* CONFIG_ARM64_CONTPTE */
> >
> > +#define arch_support_vmemmap_remap arch_support_vmemmap_remap
> > +static inline bool arch_support_vmemmap_remap(void)
> > +{
> > +     return system_supports_bbm_through_af();
> > +}
> > +
> > static inline int try_update_vmemmap_pte(unsigned long addr, pte_t *pte=
p,
> >                                        const pte_t pte)
> > {
> > diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> > index a61464cf7367..bc3eea16004c 100644
> > --- a/arch/arm64/mm/mmu.c
> > +++ b/arch/arm64/mm/mmu.c
> > @@ -30,6 +30,7 @@
> > #include <linux/mm_inline.h>
> > #include <linux/pagewalk.h>
> > #include <linux/stop_machine.h>
> > +#include <linux/vmemmap-optimization.h>
> >
> > #include <asm/barrier.h>
> > #include <asm/cputype.h>
> > @@ -1843,6 +1844,14 @@ int __meminit vmemmap_populate(unsigned long sta=
rt, unsigned long end, int node,
> >       /* [start, end] should be within one section */
> >       WARN_ON_ONCE(end - start > PAGES_PER_SECTION * sizeof(struct page=
));
> >
> > +     /*
> > +      * Whether HVO is supported is only known once the system-wide CP=
U
> > +      * features have been finalized, which is after the vmemmap has b=
een
> > +      * populated, so the section-based vmemmap optimization (pre-HVO)=
 is
>
> It's better to avoid the term of "pre-HVO", It's an obsolete term. All in=
frastructure
> of it are removed now.

Will fix, sorry about that.

> > +      * not supported. Boot-time HugeTLB folios are optimized later in=
stead.
> > +      */
> > +     section_vmemmap_optimization_disable(start, end);
> > +
> >       if (!IS_ENABLED(CONFIG_ARM64_4K_PAGES) ||
> >           (end - start < PAGES_PER_SECTION * sizeof(struct page)))
> >               return vmemmap_populate_basepages(start, end, node, altma=
p);
> > diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
> > index fb6da64bd80d..a01377c37c96 100644
> > --- a/mm/hugetlb_vmemmap.c
> > +++ b/mm/hugetlb_vmemmap.c
> > @@ -79,6 +79,10 @@ static int vmemmap_split_pmd(pmd_t *pmd, struct page=
 *head, unsigned long start,
> >
> >               /* Make pte visible before pmd. See comment in pmd_instal=
l(). */
> >               smp_wmb();
> > +             /*
> > +              * On arm64, this requires BBML3. Its support has already=
 been
> > +              * checked.
> > +              */
>
> Please don't add an architecture specific comment here. That is something=
 architecture
> itself needs to consider.

Okay, I'll drop it. I've updated the changelog for this patch to
indicate the BBML3 requirement so that we don't lose this subtlety.

