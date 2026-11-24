Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C38F606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 17:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=D1vXpHCn;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=fceMWERi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=cRMT7+DNC3zJ3ZAIBaunCOcEFiu2z3/L8DzLcGanCPY=; b=D1vXpHCn4WWZ8i
	vlbRJILLU0jwDGUEu/TDwlsdiX+7bZah6oU7DUO2Qozt0F2hIJx2jHEFT0S+1CCAyX6hftpIDRq+M
	hT6+eayFEHUe4U/NvK5O9IUH2vnYeejO++ddflj7lNyNple9JcRZ/zZ3FkeNUQd+IuafsOrANFLsM
	ArChn7+ceQMtYTGa+wRkhZcPHeWmLXsgHNJKvi8MfX5T5Ws7UQBr3q7whRlVRYCbIRH3PPclKdN8v
	GF6xDTgq5Mm2+EUcHP2v0vqQ3qTUoyBaV1dOueTcQ399b3vW0hgLmpTMngs8nwC7jFLDM/pQar/ja
	ZWaoS8cmLd26gRD37yAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVuIO-00000007LoQ-2Ca7;
	Tue, 24 Nov 2026 17:27:08 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVuHU-00000007Lbf-0ID2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 17:26:16 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-c4395d31228so818006566b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 09:26:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795541170; cv=none;
        d=google.com; s=arc-20260327;
        b=AzoS9mvTfxYqtfcsdWvGEmKH2Uv4f4iE4/NmggUfkFh0420OmiEHbhGXctLeZv8GNc
         7wiSzir/C9nicvdKxRQm/rLsLo2Whivya1Iip4lNiKn2n7Ro9Mplrk/nHY6Y1Wfu1uBd
         BdZ9Ta030nLbNq4yBbnFqpAJV2AlT+37w+FCnpYxgoxd+OyLTI/IdyYIwW64qNdgk05U
         O16+mFoCzWwkJiAD7kOpluylEHPTsQBuyYL7hbVJPYfWnwv4nvzyp9lo3DJfbVySANp0
         zh1byATwW6MZzVCs5KO5Xg6JahZmi/0eJICCFc1UT1xgkiOZvxLKGz1eio40C3kQzmvn
         F7kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cRMT7+DNC3zJ3ZAIBaunCOcEFiu2z3/L8DzLcGanCPY=;
        fh=Lih+RQLvCW/aw08hYk4qMD5rvz421NIvWTlmLR0ttBg=;
        b=m74k+dTlNAmtKGSfIEZxWOMp724UqPcbDMhmHTAGZckKQdyv2khvDKU635rWOARr6a
         Z9pDPtYSf0210t+87pomXa0WPYNwwTKur8f8NQxsDUNDMNcNB/lG39Pwj4ZyQE1cWCum
         mFRTyBMckkHzIj9nNOV0Zy5kebKQhX4PmSyUo/Dz4tLFxLMycpGEWMqzvD2EeOLx8YP/
         T1rNPlpFPiU/81xcWTza/ME06OOwegS2Y3B/22bV6P+SXdh1qNbPVAMjejZSyzKcOTWz
         jAWdEjzyAVd88nnBCqgg7RUrOTLKrssQmEZNtjXC1g5DdErZj2kG/7axKN8C6z07Zk+D
         6yHg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795541170; x=1796145970; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cRMT7+DNC3zJ3ZAIBaunCOcEFiu2z3/L8DzLcGanCPY=;
        b=fceMWERipmeneKRwWotAkt8aNixPVnhIoMqudrapfZ5PKBjmAMWJ/v65naSxhKGeDv
         Tb8UB+6FW77qPCC1WqfKhy2fgAbixpBgd6pwLH+6dkIaUVWUgIgxym7e1evhW1GbVaHu
         /glccEMFyO9gwDab/cFfXDWLyQkoQsVMXY58X5ImuBAszX/IS/jMlnPAEduhtwqkZgXF
         AdR8NyhK+/W2heoouMcZysi6IEtHoYqua/2Z6bn0B2GKkSAo5B2vmyBcUm93Rwk7CaBo
         l+mIEmGxI9K4kqa1IlMh0fTzSWzOKzZ+9pVdnq5GjFAdOr6/vQHVKEsHLbmHEfeZCOQ7
         AdIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795541170; x=1796145970;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cRMT7+DNC3zJ3ZAIBaunCOcEFiu2z3/L8DzLcGanCPY=;
        b=ezy615vr+1qjiI/jSXccFtcBXMyLlSgr0Ucv3kLo+LC3eGZ3yexG5rS6eSWyM/u0Oj
         21Sky+Hi6GdNeAwpBceyAygQwr14IqbRweKm6uCKbmBjfb+Ygf6daMsMzhV4auYBbnV5
         puBCC59G6K6dci7LYNrvkV1u/TVElBxgGPN4m4N7csBS/5+eVkcR8LcREJBLbknCQ0u1
         3bT9O055y0++7W2AneLrd2aQTl+nVK2iRv8NML4x0xukEt8OR0j9GMAIJ1CqS6eZaPyE
         Y6emmBGLvp60z1p++UiQbxnimkV7Pe7RRTS/MjITpQ9GLeG66OdD5rspKzj/At1ESog8
         kUKg==
X-Forwarded-Encrypted: i=1; AL+hErFmyRzswRPPFNz1Q/3mJE0IViWODDZDsJqvxdJ+0cdhpG7yiG17S87nVC/F2qGLUPzhNYc6/lfy5kFX7JPY8lxt@lists.infradead.org
X-Gm-Message-State: APuU4Z+3uRybotdDeILxiMgw3gNswUYIcsdMEkDDEuOHM3wpgt480oLR
	eoj/pJ0SH6HXqZ98ILrHxJHRYGq9rCNJtaikjsB89qPV6cW32UdzzScmJz5qOiDJXPvLF6Ihddz
	EKdYIbrSa0UNxTFiKD4am76a16Jh5buSYY3krPtRa
X-Gm-Gg: AZFdTZctRU1JGitNbrxzGLmyJ6lYNTjut3CQXl2s85wTLiOKKMOhPW1bZzZKdyyWKMF
	nP9GrqZv7mNg1pT0oLIz3R/eELk6p8Jy1sfJG4i9dO00x0nAK6P3WxsLGB2kpiPtizbq2hUPYwD
	arLWRxk0wZZTivJ3SXUt3zClfqe6G3tVcdYCz8kYxk2/CE/bllv84LYx6tFXjT5GJrE/8l/UMBb
	WQ4rb0wMZTLjrH8D0TFpMmP5aS14hiGHXdaoWADKYQ/EMQLIyBAcRca7IJwOe5NGfwCxSHadTY6
	18P94Jf7BfQG02uby0E3fpNwGNX1VT4p91MckpuWJYFhhNNYbshOtYvqYzwfaxjjSJHaxoiRE4A
	yNzDbz4wNY0ztbqnptxzi02F1cjkxKq2oxk3HKztFCGXn+2qzv0G9i679DTw77j+F0z6JMRzToc
	9jGBITEo9ifp40hMlTgI9fQBNdig95dupZtP+//LOfDCMEJeaxroU=
X-Received: by 2002:a17:906:7d6:b0:c29:63f2:99bb with SMTP id
 a640c23a62f3a-c513aafb466mr1015135366b.47.1795541169501; Tue, 24 Nov 2026
 09:26:09 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261122184453.2668189-1-jthoughton@google.com>
 <20261122184453.2668189-12-jthoughton@google.com> <ED44F18E-E7FF-4B53-9B5B-3201F1100154@linux.dev>
In-Reply-To: <ED44F18E-E7FF-4B53-9B5B-3201F1100154@linux.dev>
From: James Houghton <jthoughton@google.com>
Date: Tue, 24 Nov 2026 12:25:31 -0500
X-Gm-Features: Aa3M54rJ_84SrZFS6bq7z7BArP-3coKMEdNs8lreDoBfSY-QuNyAX93ofCaakaQ
Message-ID: <CADrL8HUGN9xX6mdFOCxrgD=v6-AUSxX0_5c5fuW705SFm6Sv7A@mail.gmail.com>
Subject: Re: [PATCH v3 11/19] arm64/mm: Align vmemmap to maximal folio size
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
X-CRM114-CacheID: sfid-20261124_092614_890244_8E2F5C44 
X-CRM114-Status: GOOD (  19.34  )
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
X-Spam-Status: No, score=-18.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, Nov 22, 2026 at 10:22=E2=80=AFPM Muchun Song <muchun.song@linux.dev=
> wrote:
> > #include <asm/boot.h>
> > @@ -92,11 +93,22 @@ phys_addr_t __ro_after_init arm64_dma_phys_limit;
> >  * in the virtual address space.
> >  */
> > #if ARM64_MEMSTART_SHIFT < SECTION_SIZE_BITS
> > -#define ARM64_MEMSTART_ALIGN (1UL << SECTION_SIZE_BITS)
> > +#define ARM64_MEMSTART_BASE_ALIGN    (1UL << SECTION_SIZE_BITS)
> > #else
> > -#define ARM64_MEMSTART_ALIGN (1UL << ARM64_MEMSTART_SHIFT)
> > +#define ARM64_MEMSTART_BASE_ALIGN    (1UL << ARM64_MEMSTART_SHIFT)
> > #endif
> >
> > +/*
> > + * With CONFIG_VMEMMAP_OPTIMIZATION, compound_head() masks the address=
 of a
> > + * tail page to find its head, so the head struct page of every folio =
must be
> > + * naturally aligned to the folio's vmemmap size. The vmemmap is offse=
t by
> > + * memstart_addr, so memstart_addr must be aligned to the largest foli=
o size.
> > + */
> > +#define ARM64_VMEMMAP_OPT_ALIGN                                       =
       \
> > +     PFN_PHYS(MAX_FOLIO_VMEMMAP_ALIGN / sizeof(struct page))
> > +#define ARM64_MEMSTART_ALIGN                                         \
> > +     max_t(phys_addr_t, ARM64_MEMSTART_BASE_ALIGN, ARM64_VMEMMAP_OPT_A=
LIGN)
> > +
> > static void __init arch_reserve_crashkernel(void)
> > {
> >       unsigned long long crash_base, crash_size, cma_size =3D 0;
> > @@ -218,6 +230,8 @@ void __init arm64_memblock_init(void)
> >       /*
> >        * Select a suitable value for the base of physical memory.
> >        */
> > +     BUILD_BUG_ON(MAX_FOLIO_VMEMMAP_ALIGN &&
> > +                  !IS_ALIGNED(VMEMMAP_START, MAX_FOLIO_VMEMMAP_ALIGN))=
;
>
> We already have a sanity check in spares_init(). Doesn't it work? If we r=
eally
> need a check here, I think we should use compound_info_has_mask() for the=
 guard
> instead of MAX_FOLIO_VMEMMAP_ALIGN.

The check in sparse_init() is only a VM_WARN_ON_ONCE(), which only
fires if CONFIG_DEBUG_VM=3Dy. And hitting it doesn't prevent folios from
being vmemmap-optimized.

So I think we might as well have a BUILD_BUG_ON here, in case the
vmemmap base address changes in the future for some reason, for any
config.

I've switched MAX_FOLIO_VMEMMAP_ALIGN to compound_info_has_mask() in v4, th=
anks!

