Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DF09606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 22:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Qha5YNkT;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ETYjDjFL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=MzZ1z0KVM3oeEIZUdt7Z+pU3mVSpY3HkCpsElCBUhqA=; b=Qha5YNkTN0mR98
	TOvQZ3SX2gc/kMqoEU2CHKrTdLMGHoSBj4jVrtY3js2U4Q5GwnBlJVcCgfeOyowr56wWAUnwNkTyn
	kSU8g+KRaiq/aXqSjWldqIO1ru1pDDm7bfY1NLgyU0h9vKxsr1Dh1F7LL58orrH/x3HZjNWOareWq
	x6O/3ZVv+QxFvmKYIvISNYPyKz6aghfYpMtHcOeRsPAuB9XGAXJWnKB9b3slEM+W8V0x1uj32h7zN
	QNNf4cR89+vFXyYam0CG14YF3nH3E5oHuGb/6QfH/aTOBkbgVn65+/3tSdAI2jfZgui/vGaNXZFDu
	SvVMucg7DM3d1gx1+qPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQuFg-000000059HD-4ARi;
	Tue, 10 Nov 2026 22:23:41 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQuFe-000000059GZ-1jCo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 22:23:39 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-c506094fd93so110056366b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 14:23:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794349416; cv=none;
        d=google.com; s=arc-20260327;
        b=M2klk3E1TklsVf8vOuQtJA4wwFMi95GOicGT3g298WO4/a0SK2+QFYgquRvqDYT+lH
         IqR3rsWQLB/cHqDyZ0Lzkp+ChIcqkdvn5ItA3orrkwIcTs+Jcp1JOm0PiIoiSSSXGeQ8
         D6I8d4lw5crmGjy4q3c1c8GPB5rXUh96yzd34AF+5aXCXxqBI0EFL88fJ++FNdy0JDtj
         77s3lvQkd74OQvlM4fK2WeHoYKNnk8SxJJIlCxmBsBy3TCpLT9foPTvz9YRR2RlDPcGA
         n0kFUcpotWDtDHW2tLZ2+XdG2/w3404bWpUatvEnpY1DktzI1xiu48UlhjKn3fIA3aQN
         AwmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MzZ1z0KVM3oeEIZUdt7Z+pU3mVSpY3HkCpsElCBUhqA=;
        fh=XUaJ6Fjl91n1U+7pscoEm0lhLYBU/IEcp/0s9e7lg1U=;
        b=JV5IM5b1jHra6xBCMWin8kS7c1j2+3qY6kMTDTB5cCS8I1mmHz4CrQaN2/CtNlB8Vx
         g0z/qwq0CuYlR46hJCcZyxMo0cyEmaLF3otezPAwli2waKDy/YruOMMEm53EsoxybaB3
         OkfFgkivj/cqYM2PpnBtZPs5EV9ZY1sfvkWJKsJqW5IfKROo6KjM7RyV71qsLWjzBKUM
         R05iTaXof6R3gSTv+4RKs1Bq2OpaFl2N8Qa4oT0NUt6eb/Md367uwfNSz53adsSIatAi
         Jf9zVCPtL/VsMg9sa0OQR1uFC6woD5XCH3QE6BAUhn1M2s8L9OE9OMW5iWk15cjv5nAc
         0RiQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794349416; x=1794954216; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MzZ1z0KVM3oeEIZUdt7Z+pU3mVSpY3HkCpsElCBUhqA=;
        b=ETYjDjFLNugzdKfPM8Ty0b6YC5bqWl6Ek05P3/OJyGIAzGXdjdXlsXbLk4DlBpnaHB
         Mhvst2+f4GYjpp62L35K1yEZ1wCB8Drftbz0//gQFQupEWnlAeJcSEaIUqDL2hfxDbu6
         cZawINHvVYkSIc7E5Wy3mh4tG7t3KgI0vJ2D0kR+1NGBmz/NMIlm/3vljEsfvmkl1wrj
         fAuUmp8UB8rJICovG0PXQnAGYn9xLQEGz/NmgRcQsmk5iKy8Km/uhQLV+jF/f0pitoZe
         zzhJhN86h7NPplV9lY+pB9VJuUbBooyB39VVotj9gX7ctKN8ZiS37OjrIF1A++9cbgNs
         FaIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794349416; x=1794954216;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MzZ1z0KVM3oeEIZUdt7Z+pU3mVSpY3HkCpsElCBUhqA=;
        b=ELX63rDAZWahp1A99ThBzkRsyWlOvNz7FLO2QnS7kRWco0uYyLFYyhVTlgfoAGy5az
         GcOpQxSVW3zrwSk8IbEvol6C/zg8+6dtBidj9zWwCHFLLFHbxOrhVRpr6KtkB1mzfnrh
         hfIccmv1s3+iys2/f/04Vkp+tb66v44/bpegspx0L7d2Yfj1locYAyL+vZDJTTbFxTza
         duoYltT/yZC9MAs1s/QnhhxambOPioz3d+3WA7t4rUN/jfRNYq2cTOmIrbDlwccb56WV
         xpj7LHx7OvTSW2oCyPFpjux44LGWrKaAExBn2bgXegpNKdQV1u5EExukQM0We8dJSjAL
         uaIw==
X-Forwarded-Encrypted: i=1; AL+hErE0p7t7270gvndGCX5BAB2EihR/89LsRqfWg75BjLk1OUkad2H0SCSjCUaE7IIGDA/ldTjI6+eXFhYeFj1Bkp84@lists.infradead.org
X-Gm-Message-State: APuU4Z/SE9vTLDTIk9DwLJdoeO/d1gnxwsVB+KaHLr6zyJ4Wjhl13Dba
	LwNdvQnRZWwMNmGTTxTZVsUauOrXSBzQoycv1i7bno5AuIw4G5KGqSrVIxCBmKLYtQ7Msg7ttcQ
	gByEUm6zpk4PXi54XU1d+OJ8cZ/UeS4HQ1ga17EQM
X-Gm-Gg: AYBFou3c3E591ZiKDf4DOtrRoRIzg6EuslpheBzLhDMYTH1NqBx6QuXka7DbkZ69nir
	JcshfaQhsdIDvLKllM+K4i4Yi7fMYzpckZ7c+NAt6yfYHKKMdAWsKNiBnMN0JdQqf5e+mqSOqm3
	WZethdz+BnqbcPF3quixHhwZPMW5MjzJ/4bIZGwQCCagLbSIZd7959ma3SUMjc5QSsAcM94Ca9N
	0v3tuemABOlL0+ZexgPhsggnqZv6p8GecAD2L8wKRyEwiLMhud6KN58Lr3+yp3KNP3SMlhefrMd
	EJBhHFe8SbF2XZAw7qvnzUrG39cfeexzUShc1U0BHnkkFj0veejCFgD+2rpb7h5093iWZxzrBuu
	wCbiW7u96Ggz0lBu+2XPx6kDjkjFsCf3r/3t+PSaBaEcS+iHmQeNOBoDqjM1Hk9qlodyeD8CcnV
	HjhCP9oXYk3hOsZ7ANcd2GAbbWGwgh1yTRNWFTzdibUXgL/+KXpq+6xLM99czfdux1Y34CWK3PQ
	peyyGeYFw==
X-Received: by 2002:a17:907:a08a:b0:c2a:b1cc:158d with SMTP id
 a640c23a62f3a-c5066cab80amr34767966b.32.1794349415908; Tue, 10 Nov 2026
 14:23:35 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261003002123.505555-1-jthoughton@google.com>
 <20261003002123.505555-14-jthoughton@google.com> <CAF9824D-CDC5-48E6-A1F6-840CB299EADB@linux.dev>
 <3a66ba8f-96dd-4215-8c4d-0cc3c286375a@huawei.com>
In-Reply-To: <3a66ba8f-96dd-4215-8c4d-0cc3c286375a@huawei.com>
From: James Houghton <jthoughton@google.com>
Date: Tue, 10 Nov 2026 14:22:58 -0800
X-Gm-Features: AclHuK-LfjoZOtKEGwbFXm4SDbHWSiIOi9H9ah6KA9x7oxgjCWZK8mc2-sY7pxs
Message-ID: <CADrL8HVVLG=MPypRoqC-iGope6tFqpg1Af5hZT=zRk2FFqxYaw@mail.gmail.com>
Subject: Re: [PATCH v2 13/20] arm64: Support hugetlb vmemmap optimization
To: Kefeng Wang <wangkefeng.wang@huawei.com>
Cc: Muchun Song <muchun.song@linux.dev>, Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Oscar Salvador <osalvador@suse.de>, 
	Andrew Morton <akpm@linux-foundation.org>, Nikos Nikoleris <nikos.nikoleris@arm.com>, 
	Linu Cherian <linu.cherian@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	David Hildenbrand <david@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Nanyong Sun <sunnanyong@huawei.com>, Yu Zhao <yuzhao@google.com>, 
	Frank van der Linden <fvdl@google.com>, David Rientjes <rientjes@google.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_142338_480357_B55DE8F2 
X-CRM114-Status: GOOD (  26.15  )
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

On Tue, Nov 10, 2026 at 1:16=E2=80=AFAM Kefeng Wang <wangkefeng.wang@huawei=
.com> wrote:
>
>
>
> On 11/7/2026 2:45 PM, Muchun Song wrote:
> >
> >
> >> On Oct 3, 2026, at 08:21, James Houghton <jthoughton@google.com> wrote=
:
> >>
> >> Support HVO if HW AF and BBML3 are supported. These are the required
> >> features for the vmemmap to be modified in place.
> >>
> >> On arm64 systems that do not have the required hardware features to
> >> support HVO, the HVO sysctl will not appear, and any attempts to enabl=
e
> >> HVO (either via the command line or via
> >> CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP_DEFAULT_ON=3Dy) will have no effe=
ct.
> >>
> >> Signed-off-by: James Houghton <jthoughton@google.com>
> >> ---
> >> arch/arm64/Kconfig               | 2 ++
> >> arch/arm64/include/asm/hugetlb.h | 7 +++++++
> >> mm/hugetlb_vmemmap.c             | 4 ++++
> >> 3 files changed, 13 insertions(+)
> >>
> >> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> >> index b51d23a62c92..e4c87487bc7f 100644
> >> --- a/arch/arm64/Kconfig
> >> +++ b/arch/arm64/Kconfig
> >> @@ -92,7 +92,9 @@ config ARM64
> >>      select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT
> >>      select ARCH_WANT_FRAME_POINTERS
> >>      select ARCH_WANT_HUGE_PMD_SHARE if ARM64_4K_PAGES || (ARM64_16K_P=
AGES && !ARM64_VA_BITS_36)
> >> +    select ARCH_WANT_HUGETLB_VMEMMAP_RO_AFTER_INIT
> >>      select ARCH_WANT_LD_ORPHAN_WARN
> >> +    select ARCH_WANT_OPTIMIZE_HUGETLB_VMEMMAP if ARM64_HW_AFDBM
> >
> > Because vmemmap optimization depends on compound_info_has_mask(), befor=
e
> > enabling HVO on arm64, its vmemmap start address needs to be aligned to
> > MAX_FOLIO_VMEMMAP_ALIGN. Therefore, a prerequisite patch is required.
> >
>
> Agreed, we tried to enable ARCH_WANT_OPTIMIZE_DAX_VMEMMAP[1] on ARM64.
> If the alignment is not performed, a warning will be triggered with
> DEBUG_VM, see sparse_init(). The same issue applies to
> ARCH_WANT_OPTIMIZE_HUGETLB_VMEMMAP.
>
>
> [1] enable ARCH_WANT_OPTIMIZE_DAX_VMEMMAP
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index 1075bc661833..649244e55c4b 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -94,6 +94,7 @@ config ARM64
>          select ARCH_WANT_FRAME_POINTERS
>          select ARCH_WANT_HUGE_PMD_SHARE if ARM64_4K_PAGES ||
> (ARM64_16K_PAGES && !ARM64_VA_BITS_36)
>          select ARCH_WANT_LD_ORPHAN_WARN
> +       select ARCH_WANT_OPTIMIZE_DAX_VMEMMAP
>          select ARCH_WANTS_EXECMEM_LATE
>          select ARCH_WANTS_NO_INSTR
>          select ARCH_WANTS_THP_SWAP if ARM64_4K_PAGES
> diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
> index 4e7682dfe366..6808529873a9 100644
> --- a/arch/arm64/mm/init.c
> +++ b/arch/arm64/mm/init.c
> @@ -91,11 +91,9 @@ phys_addr_t __ro_after_init arm64_dma_phys_limit;
>    * has a direct correspondence, and needs to appear sufficiently aligne=
d
>    * in the virtual address space.
>    */
> -#if ARM64_MEMSTART_SHIFT < SECTION_SIZE_BITS
> -#define ARM64_MEMSTART_ALIGN   (1UL << SECTION_SIZE_BITS)
> -#else
> -#define ARM64_MEMSTART_ALIGN   (1UL << ARM64_MEMSTART_SHIFT)
> -#endif
> +#define ARM64_MEMSTART_ALIGN                                          \
> +       max_t(u64, 1UL << max(SECTION_SIZE_BITS, ARM64_MEMSTART_SHIFT), \
> +               PFN_PHYS(MAX_FOLIO_VMEMMAP_ALIGN / sizeof(struct page)))

Thanks, Muchun and Kefeng. I never hit this warning, I think because I
was only using 4K base pages. I'll make sure to test with 16K and 64K
base pages before sending v3. I'll make the same fix, though I think I
will write it differently.

