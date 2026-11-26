Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8157F606A323
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 17:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VrxsFQ9Y;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=UeNf17Ji
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=WPGr1zy5i6P/rHSMpbivxNKgZDJVzV+91EOntET5gTQ=; b=VrxsFQ9Yd+9AwQHxsVwk8YDNOD
	+spN2hhDsbnHUyIvSmX1Jj0AL5owRiwcWu3J1qvoIejnQeWB0df6Cw5PLQGXOT8NpK0RBnH88zW2I
	ymIkrQ33VpMVDfXopRfFjy6JgYFrfx4R8pkPviTABQP6CdgTd6MpHVyT2D/4Eei1L7yGAlN54Ff5c
	h9kDMa/LBXrKLETFg8oVkjVhCYC+ngQV9AfEYZTZ5lZvgmM8tkHSePdPv2Xc4zsd+8vACIzLVyzm+
	DaLl0UGwdpEcRHS702oVoTC6K2wjJV+fiTI/YsDx+vjvPmPblj9qqqfLR0BPhOaDR9jQS1fS7Mvmi
	myB6JAbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWdAb-0000000E2n6-386h;
	Thu, 26 Nov 2026 17:22:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWdAV-0000000E2lM-1wJZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 17:22:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C71D11BA8;
	Thu, 26 Nov 2026 09:21:55 -0800 (PST)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 94A213F632;
	Thu, 26 Nov 2026 09:21:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795713718; bh=UE5D3X6xGaaBtADlO2XDtyz8TtxmFrljQYN8j9r3etk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UeNf17JiHi4b+62Dr7anISZCItOLfKVawSy3Snx7syBNq9eesH1MbZBASQI2LK+oc
	 KxaIlibX4agCDpkOpF3qi22JwlabkOi7OiO3ptchvsIMdJV7EvbvjGHMyzTl3dIWQ9
	 WMqVUFnSPE9rrC7O4u4B4IXEaGcmMoxDlWaN6DrY=
Date: Thu, 26 Nov 2026 17:21:54 +0000
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, linux-arm-kernel@lists.infradead.org,
	will@kernel.org, mark.rutland@arm.com, akpm@linux-foundation.org,
	david@kernel.org, pasha.tatashin@soleen.com, ryan.roberts@arm.com,
	rmclure@linux.ibm.com, baolin.wang@linux.alibaba.com,
	kevin.brodsky@arm.com, kas@kernel.org, anshuman.khandual@arm.com
Subject: Re: [PATCH] arm64: mm: clarify necessity of isb() in
 emit_pte_barriers()'s comments
Message-ID: <awhqspDavLGWONzZ@e129823.arm.com>
References: <20261125183805.1188848-1-yeoreum.yun@arm.com>
 <awhjLLF2YLfcqjWX@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <awhjLLF2YLfcqjWX@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_092159_583142_7D513069 
X-CRM114-Status: GOOD (  27.71  )
X-Spam-Score: -4.4 (----)
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> On Wed, Nov 25, 2026 at 06:38:05PM +0000, Yeoreum Yun wrote:
> > The dsb() in emit_pte_barriers() makes the pte store visible to the
> > table walker. However, without FEAT_ETS2, address translation for a
> > subsequent data access may occur speculatively before the dsb() completes,
> > potentially observing the old invalid PTE according to
> > Arm ARM DDI0487 M.d:
> > 
> >   B2.6.9 Data Synchronization Barrier
> >   ...
> >   In addition, no instruction that appears in program order after the DSB
> >   instruction can alter any state of the system or perform any part of
> >   its functionality until the DSB completes other than:
> >   ...
> >     - If FEAT_ETS2 is not implemented, translating any virtual addresses of
> >       instructions that generate Explicit Memory Effects.
> >   ...
> > 
> > Document this behavior and reference Arm ARM DDI0487 M.d, B2.6.9 to
> > clarify why the dsb() alone is insufficient to prevent a spurious fault.
> > 
> > Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> > ---
> >  arch/arm64/include/asm/pgtable.h | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> > index a474c9fb485ad..6101357539f31 100644
> > --- a/arch/arm64/include/asm/pgtable.h
> > +++ b/arch/arm64/include/asm/pgtable.h
> > @@ -45,7 +45,10 @@ static inline void emit_pte_barriers(void)
> >  	/*
> >  	 * These barriers are emitted under certain conditions after a pte entry
> >  	 * was modified (see e.g. __set_pte_complete()). The dsb makes the store
> > -	 * visible to the table walker. The isb ensures that any previous
> > +	 * visible to the table walker.
> > +	 * However, without FEAT_ETS2, address translation for a subsequent
> > +	 * data access may occur speculatively before the dsb completes
> > +	 * (see Arm ARM DDI0487 M.d, B2.6.9). The isb ensures that any previous
> >  	 * speculative "invalid translation" marker that is in the CPU's
> >  	 * pipeline gets cleared, so that any access to that address after
> >  	 * setting the pte to valid won't cause a spurious fault. If the thread
> 
> I wonder whether one could read it as the isb() can be dropped if ETS2
> is present, which is not the case. This function is used on the execmem
> path as well where we need the barriers irrespective of ETS2. You may
> want to add another sentence that even with ETS2, we still need the
> barriers for instruction fetches.

Agree. regardless of FEAT_ETS2, it couldn't remove dsb() and isb()
for instruction fetch. but it's the case for data access according to
the NOTE section of ETS-ordered-before or DSB-ordered-before.

What about with below?

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 6101357539f31..36b5d799b0692 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -47,8 +47,11 @@ static inline void emit_pte_barriers(void)
         * was modified (see e.g. __set_pte_complete()). The dsb makes the store
         * visible to the table walker.
         * However, without FEAT_ETS2, address translation for a subsequent
-        * data access may occur speculatively before the dsb completes
-        * (see Arm ARM DDI0487 M.d, B2.6.9). The isb ensures that any previous
+        * data access and instruction fetches may occur speculatively before
+        * the dsb() completes (see Arm ARM DDI0487 M.d, B2.6.9).
+        * With FEAT_ETS2, this remains possible for instruction fetches,
+        * but not for data access (see ARM ARM DDI0487 M.d, B2.6.7
+        * ETS-ordered-before or DSB-ordered-before). The isb ensures that any previous
         * speculative "invalid translation" marker that is in the CPU's
         * pipeline gets cleared, so that any access to that address after
         * setting the pte to valid won't cause a spurious fault. If the thread

Thanks.

-- 
Sincerely,
Yeoreum Yun

