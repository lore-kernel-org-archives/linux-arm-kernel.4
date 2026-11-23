Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E29C8606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 07:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KDn2h7rI;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=wZgwMW7f
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=eb1bmF8F2PVJN1FG3qeHre4JjGzW9zZyj8slSTuCErU=; b=KDn2h7rIBu4lhJ5SgYJ8oyp28t
	FHl+s4qVaNPlxkWSCn+hjm52mYbCYi/p3Ns9LWX60njSnQ9wQO0hF6uPNVBFZkWmV98+KkCy6XFtf
	TWiZD7nhVXBSKX5x8DKaWJk+HJbv3V6atMdkZkqLuDCqXgD+cbGLO7ipZiJYndfRCt3cTUV63YoZk
	d4LyeXPYtDnV5uVwg+Sl4wTEW09O5l3pxQlNEpEb+cxV+BBr1eYAgy5ZD4oZLG5wufqY9shcpsTkh
	BRjZf4i6oCxWiP+RX32RtBKdMPJqBo5uwfQ/kseqHax3kn7CBnwbJODlQua4hKyFF7gQDC2AF8eQn
	Qp2dSf+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVObO-00000002T5p-2j59;
	Mon, 23 Nov 2026 07:36:41 +0000
Received: from out-130.mta1.migadu.com ([2001:41d0:203:375::82] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVOb6-00000002T43-0dgI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 07:36:21 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=GbNG4aEZgYnqy60cKkuKbdz31c//1P7sSXGaCQ5qE5k=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795419371; v=1; x=1796024171;
 b=wZgwMW7fFFnHcDSYylDf0JYR3mD5371OJi8tMEM2taMQOAiOc4aGEIvhxJcyW/QO5a7Sex0F
 C7DOYr+d/Wq2F69xGlRIr9L1iKmDiEv1d8UOaYWxIrTsrYP1Mh7KQPRLtMXd/F2V7tFiTLVS/fP
 3eiGH44jZp+Q39bN0AraTgkg=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id b108d2690a061a7b;
	Mon, 23 Nov 2026 07:36:10 +0000
X-Mizu-Trace-ID: b108d2690a061a7b
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5c14bc5a743so8644e87.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 23:36:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGS3OLv5VcqVGwNkkiaDL/n2VPAiLFGj097ULhxPC3Tj4aTWu60qe0TR89xRjVhq6yLk/34KyBv/PVspJ46KESA@lists.infradead.org
X-Gm-Message-State: APuU4Z+7GI3Ji5JjFimi5EL8AGNiBWr6IokDr6CY1AHBE5BfRIr7V1gn
	5Q7BanU52eM/Qye67a2wsOOIy9JEFZ2lvlIoJh0n2OWKMP+AHv4I5SfljfUUYgHEl9Z5Wgd5IJI
	BoKBy/MXaFJTx2crnmtZl6JAYDkAgkENhDUeZzOEY
X-Received: by 2002:a05:6512:1250:b0:5c1:4cd1:131e with SMTP id
 2adb3069b0e04-5c21a261fbamr165167e87.11.1795419366920; Sun, 22 Nov 2026
 23:36:06 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261120121638.194154-1-fuad.tabba@linux.dev> <20261120121638.194154-4-fuad.tabba@linux.dev>
 <6782b5ee-3dfe-4076-a79c-fbeb2c2ac7da@arm.com>
In-Reply-To: <6782b5ee-3dfe-4076-a79c-fbeb2c2ac7da@arm.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 23 Nov 2026 07:35:30 +0000
X-Gmail-Original-Message-ID: <CA+EHjTziXrRdR+guikKbj93Az96T+AMx_=0sVeyWG5C4fwaaTg@mail.gmail.com>
X-Gm-Features: Aa3M54qbIcVsswZvgTdf3Pr5w2t6747s-c6Tnij9t_PWy9hwC6gUmChWfQyq38Y
Message-ID: <CA+EHjTziXrRdR+guikKbj93Az96T+AMx_=0sVeyWG5C4fwaaTg@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: mm: Don't defer the barriers when installing a
 fixmap entry
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Yang Shi <yang@os.amperecomputing.com>, Kevin Brodsky <kevin.brodsky@arm.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_233620_343410_2F4B5734 
X-CRM114-Status: GOOD (  18.36  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Ryan,

On Sat, 21 Nov 2026 11:01:49 +0000, Ryan Roberts <ryan.roberts@arm.com> wrote:
[...]
> > kernel then warns about a spurious translation fault. When kgdb stops a
> > CPU in lazy MMU mode, its breakpoint writes through FIX_TEXT_POKE0 can
> > fault the same way, and fail.
> >
> > Emit the barriers directly in __set_fixmap().
> >
> > Fixes: 5fdd05efa1cd3 ("arm64/mm: Batch barriers when updating kernel mappings")
>
> My memory might be betraying me, but I think this change went in before BBML3
> (BBML2_NOABORT)? In which case, the bug is only exposed by the latter series?

It did, and the set_swapper_pgd() path is only exposed by the later
series. The tag is for the kgdb path, which doesn't depend on BBML3.
When kgdb is entered from a breakpoint in process context,
in_interrupt() is false, so in lazy MMU mode the barriers for its
FIX_TEXT_POKE0 mapping are still deferred.

[...]
> > diff --git a/arch/arm64/mm/fixmap.c b/arch/arm64/mm/fixmap.c
[...]
> > @@ -127,7 +127,9 @@ void __set_fixmap(enum fixed_addresses idx,
> >          ptep = fixmap_pte(addr);
> >
> >          if (pgprot_val(flags)) {
> > -                __set_pte(ptep, pfn_pte(phys >> PAGE_SHIFT, flags));
> > +                /* The slot must be usable on return, even in lazy MMU mode. */
> > +                __set_pte_nosync(ptep, pfn_pte(phys >> PAGE_SHIFT, flags));
> > +                emit_pte_barriers();
>
> I wonder if it would be clearer to wrap __set_ptes():
>
> lazy_mmu_mode_pause()
> __set_ptes()
> lazy_mmu_mode_resume()

That would work. However, there's the stable backport. 6.18 has the
bug, but lazy_mmu_mode_pause() was added in 7.0, so 6.18.y would need
its own patch. This patch applies to 6.18 unchanged.

I'm happy with either, or with a followup patch in the same series.

Cheers,
/fuad

