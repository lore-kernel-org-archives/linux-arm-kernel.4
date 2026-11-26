Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18007606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 07:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fV1E+pyv;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=g1oybbN5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=wQ+/QZBTir+dwOenA7NjF9C0GeIIPN6OhBFC1kuCwlY=; b=fV1E+pyvsiN2NEIiQYStcKIqOz
	L+ttm9cE4hwAw4fyHMQIZ2cBve2oa5TTIlb/iIQHmChFJ57ebdTiMGTqLYuI0hQ9jXiLkx+rrHimY
	+1ToBMkJsPkXSBY6mMTFDZ8EbUP6RrpxJhcDPENPqo3DmR4mkfYRRiEUOWKnetMLxCDRu3MOryiq7
	eZUj2NUJ763xT7OI10oHrL0HP5mSVMFTaVZtekpf6OHdrLKKrmLHGuiISLPR1Lftrg7Zx4n210hBQ
	5s2N3pq0hXqMITJKvuXcbkL2EgNvnXM3NGCGZ4TE4SQ/NGO6paJ+kYsFmrKxK8nrlIwiLhvfZxqZc
	w5g8eH1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWTgC-0000000CGUh-1SZx;
	Thu, 26 Nov 2026 07:14:04 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWTft-0000000CGGd-0oZg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 07:13:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 942BC339;
	Wed, 25 Nov 2026 23:13:38 -0800 (PST)
Received: from localhost (a085714.arm.com [10.164.19.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B02593F632;
	Wed, 25 Nov 2026 23:13:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795677221; bh=a6UBW4Czs/YFie20cl2s7IdmngDfOVRY3Is5Sf9sFcQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g1oybbN57BPDmbjrTHrg3Wf4TnmYEcLu7XNVH3/fZtPcCsmM+mn4xgkjFG1L9UWIy
	 bGMBd72cPOzMhsaf5+rfNdcY8SzhBMBm+Oam9VY9arsAO2NbKzqRSTAsgOePH/xjQC
	 4C5lBnSrWRpvnS5JQ3Ytdm8W+SJn5LDMfpD/WbQs=
Date: Thu, 26 Nov 2026 12:43:38 +0530
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com, 
	will@kernel.org, mark.rutland@arm.com, akpm@linux-foundation.org, 
	david@kernel.org, pasha.tatashin@soleen.com, ryan.roberts@arm.com, 
	rmclure@linux.ibm.com, baolin.wang@linux.alibaba.com, kevin.brodsky@arm.com, 
	kas@kernel.org
Subject: Re: [PATCH] arm64: mm: clarify necessity of isb() in
 emit_pte_barriers()'s comments
Message-ID: <pzq4vyyvychgi5rvnunyxaotl6oo3afwuedza5epnfiqbfxces@lyw7ffhmp2dr>
References: <20261125183805.1188848-1-yeoreum.yun@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261125183805.1188848-1-yeoreum.yun@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_231345_365919_755FB1AA 
X-CRM114-Status: GOOD (  20.91  )
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

On Wed, Nov 25, 2026 at 06:38:05PM +0000, Yeoreum Yun wrote:
> The dsb() in emit_pte_barriers() makes the pte store visible to the
> table walker. However, without FEAT_ETS2, address translation for a
> subsequent data access may occur speculatively before the dsb() completes,
> potentially observing the old invalid PTE according to
> Arm ARM DDI0487 M.d:
> 
>   B2.6.9 Data Synchronization Barrier
>   ...
>   In addition, no instruction that appears in program order after the DSB
>   instruction can alter any state of the system or perform any part of
>   its functionality until the DSB completes other than:
>   ...
>     - If FEAT_ETS2 is not implemented, translating any virtual addresses of
>       instructions that generate Explicit Memory Effects.
>   ...

Above wording checks out in the ARM ARM.

> 
> Document this behavior and reference Arm ARM DDI0487 M.d, B2.6.9 to
> clarify why the dsb() alone is insufficient to prevent a spurious fault.

Documenting FEAT_ETS2 dependence nuance in the comment does make sense.
FEAT_ETS2 is mandatory from Armv8.8 onwards. Hence this might not be a
real issue on the field ?

> 
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> ---
>  arch/arm64/include/asm/pgtable.h | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> index a474c9fb485ad..6101357539f31 100644
> --- a/arch/arm64/include/asm/pgtable.h
> +++ b/arch/arm64/include/asm/pgtable.h
> @@ -45,7 +45,10 @@ static inline void emit_pte_barriers(void)
>  	/*
>  	 * These barriers are emitted under certain conditions after a pte entry
>  	 * was modified (see e.g. __set_pte_complete()). The dsb makes the store
> -	 * visible to the table walker. The isb ensures that any previous
> +	 * visible to the table walker.
> +	 * However, without FEAT_ETS2, address translation for a subsequent
> +	 * data access may occur speculatively before the dsb completes
> +	 * (see Arm ARM DDI0487 M.d, B2.6.9). The isb ensures that any previous
>  	 * speculative "invalid translation" marker that is in the CPU's
>  	 * pipeline gets cleared, so that any access to that address after
>  	 * setting the pte to valid won't cause a spurious fault. If the thread
> -- 
> LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}
> 
> 

