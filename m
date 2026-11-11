Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD61606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 03:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oK5Et7BM;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pum4xxvK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=UWUQRFbmRLGQnDyBGsNebPidDTP9HqGva0/1QMumkOA=; b=oK5Et7BMcxK0H3J5J7eswMbSy7
	arnIF/wNGXZnXK3FlXz/FZ20sXn1KOERegEtBl1+TZ6RTIUeXRK3HnVSd8tx2EXGeS3LocQZFvdZD
	Ooqn4RIWkui+ioZ8NojJQYUsu2oEOf2PfrDXY6IuWChiONMB+jhWVXnwG1RLFH+uM02K5ys11Og1c
	770YACFa4vX2yZMwfa19A7FKvm2Vz5c9Fq+ToQeRMDePocIzXNk6RpDJpfsGONXUimzukdsiZ2U1G
	+Z0psZExMSV0mn9NlGvfFI9dLlPSIlF0SciegXyiyulIIvSSfrQJAgbOQzVSNHlwMNSyB16X6xqzC
	wuwxJ1Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQyhO-00000005Ur4-17Z7;
	Wed, 11 Nov 2026 03:08:34 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQyhL-00000005Uqi-1dv0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 03:08:33 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4a549cd7fd2so24768655e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 19:08:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794366509; cv=none;
        d=google.com; s=arc-20260327;
        b=Cc2P8OfnhRiTmaEI0iuruHfuDCjrZnQREi4T7uTEKjeBUBca2KluOnkHlMnwPdQUI8
         KuIumOwIm71OIBZzPCk8un101+4DOkVhOa2c/jB0/vIU3cu5m6KNgW3X8RdOY8G/U+cF
         ii+k89tU42fMTD9+MJ1Y7UevwfXfzrOPF+H2vzu2cUfAYzHcmPzFoUnSaJOSVlRBDGia
         CJ1sIUdptjq+X63J2u+8Sl+Dffsg8szKKkN0U1qOI0kveUSt2clGmS7E3kr/AfOFSyxK
         3u80KUg2zf6w+skZ73lNcaJuEo/wEQvN8k1mROpqjuqSy9N5e11X86eSp0Q1b85hsaWN
         NnyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=UWUQRFbmRLGQnDyBGsNebPidDTP9HqGva0/1QMumkOA=;
        fh=kgFCZ2AdvrR4VJuiRSUbIoa2p+V9HKlRLLyPZ7+tvx8=;
        b=EuFx8Qj8jkr6VUXxAgSI/C91fNBZozAJztsYGRRyF9c9eDCOH/H317h+QACHoNwW+0
         8sXZBARbNCRBlsd55opMA5FFsus734jC+cADkGWrVmUjfYqTdi52xydwfAmEtvRJlM2s
         RNumDvmHaQuJOpkXQrvf3PjnlCr0Lx1nj6btumq9bnrWw8LrtxSG/qb+Dh15it134Q9D
         Dny6hHomKGzOj+pRRXE7hPY69ji+f3XLYdTO/LXSivrybhJPMmq/4Rf6hOPybI6rRjye
         Gs2ONC/IidZKBkpRXhdKTld3yOi0ic5nsSveKtv+Fm9rUDsSRic701+dyNotZq6dir40
         xhGQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794366509; x=1794971309; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UWUQRFbmRLGQnDyBGsNebPidDTP9HqGva0/1QMumkOA=;
        b=pum4xxvKkh+jsT4obgORVUyfw01EdoGib0t5hhD0pWgatjp3bpfbK1U6sLkUiYwBwg
         QU3fQfnVVIj8kyFuphZ6Ah6D1oJO5/O7dz0WR+51eW+wE+q4wybSPp0G+a40/NThHj83
         BbVmysQO6oYlVkTQfaY1CuQ9x9DS82f7rgfTChGDP269DOy+mddvtiDc0TmQyKzX/HnX
         dxnLaQGbL7kwTSKuszyMsZNhvKM1zMXVKcebT36Yp7ifWACEXUP7nvn+HB3+tWaOaxoX
         8qy93ZRu66gaAEolv15qsE5mjhsntGT52240esoRzoTu/m4cC6AytpLuHwZJtNbzKUVk
         Ty7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794366509; x=1794971309;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UWUQRFbmRLGQnDyBGsNebPidDTP9HqGva0/1QMumkOA=;
        b=r6kPVerK85xsLNmNSvnGagGm9fQgfsgClTMS5r6gNmeyYM2Y1MJWzUQTWLWsPUlLoB
         Xy5eld3UZvVDoD4OGWIG6XapwuGnY94XFwA+B0zfMPrDnZvtzqKf2SMsKd5RKGkxk+XJ
         zPaxyqM4RI9PdQLbhqUom0XvNZ05SwTSHHZS/lAPpfPMiuKMh4VsT/8Q9rxZdsRjbV0m
         1j0scFGSpEIavw0Mpb4tBrHnJaPACpgFGclTTBvrehf22QVjNk4dd7NWDPou0V99WAJT
         pXKupB5QF+35+uHtRvhSo2hhl0NAzljxJylF/s4sA7k+9s8LE5ZyClgFDqKQWDPyIf9F
         rIvA==
X-Forwarded-Encrypted: i=1; AL+hErGWZIhKrl3Ks5kFb8R0QsEkv6Jz8mPXTj2v08p5G1mwQqQAFBdM5D2Wts1BFih0oGUBNIylvpo/pnyhkQjkYsVH@lists.infradead.org
X-Gm-Message-State: APuU4Z9BODpvrWVZ1DFkGVwUTOgYW0G4gZXYGBnfUwhLvMY2VmNMaFwa
	y/8gf1YaOM3C84RUrhD9oTIcj9DxgRr8rHq2BkRUJfYS8iVaUcIJawYeoxowv4TXv29tleRKGIy
	zzkelHgdZ1QovFdSsFJG2LcfzsMM2b3A=
X-Gm-Gg: AYBFou2TApvCcd4SNlRbsfW1gOePjVKHiyby1H5mjzwozSgwAvFabwV8gJraTEftbc/
	MF1TJHmyQdiOMqClcWDzsVNBE4TXQaU1QWKrFqpDi9TSqRQlk5xVPcP4JfaQAKjtCpUFHw5m8tl
	6eRhq0xGd0moWbH6OmKFq/fBjAALlR4BMldNA52lawvvkgM8V3AgTcZlTnsEIDXUiQ4HdcdtBTm
	yulWrgVpNGIDpVCAY029AzMGFmyZP8eUedubY06SLm1umGuQHB83S17HTXguQs+Q+0LKHWRQsNW
	gduCtWlKViqsqlA3vFizKXnn2AgPs3FL+kgH/7H5KNPSP8LqMm2iEY6cBeSCXoZG+iGvw8SGqY1
	WUfl1sBJ/SC01tVa4CXIj2Y0yvZrRJUKl7nxgVQ==
X-Received: by 2002:a05:600c:3f06:b0:49e:6581:7baf with SMTP id
 5b1f17b1804b1-4ba0931ef17mr14337115e9.2.1794366508821; Tue, 10 Nov 2026
 19:08:28 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261107134953.748622-1-jiangwenxiaomi@gmail.com>
 <20261108230842.3a77b9fe2d4bfc2a04b355a5@linux-foundation.org>
 <CAHKocdGWE9OVA5pJh33U-FYnNkUqRS0pzFt=rCwXWzY9w-QXyw@mail.gmail.com>
 <20261109140206.GY9176@e132581.arm.com> <20261109092404.5441d8bf9c4494ed008162fa@linux-foundation.org>
In-Reply-To: <20261109092404.5441d8bf9c4494ed008162fa@linux-foundation.org>
From: Wen Jiang <jiangwenxiaomi@gmail.com>
Date: Wed, 11 Nov 2026 11:08:17 +0800
X-Gm-Features: AclHuK-m1Jv5Lpg8e2HNShd2BigzuuDvNRyTpoQSxJNGTZo8P3hgc34a2sG_LX0
Message-ID: <CAHKocdG1pvZfo=fxX9OJZxCOnZt6nBYwtRV7rAxPfdukDy6cCw@mail.gmail.com>
Subject: Re: [PATCH v12 00/10] mm/vmalloc: Speed up ioremap, vmalloc and vmap
 with contiguous memory
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Leo Yan <leo.yan@arm.com>, catalin.marinas@arm.com, will@kernel.org, 
	urezki@gmail.com, linux-mm@kvack.org, baohua@kernel.org, dev.jain@arm.com, 
	ryan.roberts@arm.com, anshuman.khandual@arm.com, david@kernel.org, 
	rppt@kernel.org, xueyuan.chen21@gmail.com, chleroy@kernel.org, 
	maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, ajd@linux.ibm.com, 
	jiangwen6@xiaomi.com, linux-arm-kernel@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_190831_451121_9CC7E67F 
X-CRM114-Status: GOOD (  22.24  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 10 Nov 2026 at 01:24, Andrew Morton <akpm@linux-foundation.org> wrote:
>
> On Mon, 9 Nov 2026 14:02:06 +0000 Leo Yan <leo.yan@arm.com> wrote:
>
> > On Mon, Nov 09, 2026 at 07:07:23PM +0800, Wen Jiang wrote:
> >
> > [...]
> >
> > > > Do we have sufficient ARM review?
> > > >
> > >
> > > Thanks for picking this up.
> > >
> > > On ARM review: Dev reviewed the earlier revision in detail and
> > > his suggestions are folded in. Leo Yan tested the large vmap() path
> > > on TRBE/SPE. We'd welcome more ARM review from Ryan, Catalin
> > > and others.
> >
> > I confirmed that my Tested-by tag remains valid on the latest version.
> > The improvement is consistent with L2D TLB refill reduced from
> > ~16000+ to ~500+ across multiple runs.
>
> Thanks.  I added your t-b to every patch in the mm.git copy of this
> series.
>
>
> AI review found a couple of little things:
>
> : In [07/10], vmap_pages_range_noflush_walk() uses an int nr
> : index, now shared by the high-order mapping path. The previous
> : high-order path used unsigned int i, nr. Beyond INT_MAX base
> : pages the new index overflows and pages[*nr] can go out of
> : bounds. On x86-64/4K that means an allocation above 8 TiB,
> : within the vmalloc VA window but requiring a very large machine.
> : Please carry unsigned long or size_t through the direct walker.
>
> The vmap(8TB) limit is already well known, not sure that we plan to do
> anything about it(?).  But the patchset seems to drop that limit to 4TB
> for higher-order pages, which can't be a good thing.
>

Right. I've posted a fixup for [07/10] in reply to that patch, switching the
index to unsigned long.

> : In [09/10], nr_contig < 2 can be dropped: the loop guarantees
> : at least one page, and vm_shift(..., PAGE_SIZE) returns zero
> : for a single page. I withdraw my earlier NULL-page objection;
> : I could not establish a legitimate producer of that input.
>

The nr_contig < 2 check is redundant, as noted. It's just a cheap
early exit for the single-page case, so I'd lean towards keeping it,

Thanks,
Wen

