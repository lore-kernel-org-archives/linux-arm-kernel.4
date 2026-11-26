Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7722E606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 18:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=e0vq/OXB;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=rjHla4Zd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=SgEXTnV8G+RJXc5Z7bgG1FhksN70TN1v7tDQK7jcQno=; b=e0vq/OXBo2QPQW1yjkxwoTF3W/
	RmExm3wyKgFEnFLQIb22hlP8wodzuJ10+uQpG7YJ/QEV7mscKJZ4OH9W6oZq0uK0X4ZCriQByrH19
	53Eql+BFbeGiUx3OCR0lErzxjWraYk/Z/mEeSaIhQHUfxll/7RM7ZtgVM8Fy8FH8NyToRUa1hhJ2D
	5iBhNWpFaeLTEuytTOxxrwiWFrGKstcnzwYSh6HH9bMov3FvAzjnxpuHt4f4UO7eWOSEWyFJveI2F
	vrgZsx85wckN6nXGhG+5rqJoj5c3zSo3EYLc2J+RtX/OZdlNsQbfo7M2oqIK9vXEQKt7SX4jsx+PG
	iYBFytlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWeCn-0000000EAnw-4AX8;
	Thu, 26 Nov 2026 18:28:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWeCk-0000000EAnG-1lOm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 18:28:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B4FB61BA8;
	Thu, 26 Nov 2026 10:28:18 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C864F3F86F;
	Thu, 26 Nov 2026 10:28:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795717701; bh=ECKrBhRZGoMv8l0eh6hXdfHU+etv5qKLM+IN744ApMc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rjHla4ZdxoOln5FT9RBk4AKTaSFTot7WAo7RH/foFNIjZNiF7/1FPToatwqioRhTR
	 APrFtzeA8oSIktJtLveVYom5CxtQQ7BW17rgUv9SpsSdxR+q82qCuRja+tTjPLT7DW
	 FcK5JbXvAyUPJSPYCow1FkWACmcDttWkoiglznWA=
Date: Thu, 26 Nov 2026 18:28:15 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Tal Zussman <tz2294@columbia.edu>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: mte: drop the huge zero folio check in
 __access_remote_tags()
Message-ID: <awh6P5njoJ3eOVlI@arm.com>
References: <20261031-arm64-mte-folio-v1-0-a8bc2960d11e@columbia.edu>
 <20261031-arm64-mte-folio-v1-2-a8bc2960d11e@columbia.edu>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261031-arm64-mte-folio-v1-2-a8bc2960d11e@columbia.edu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_102822_494080_F1A21870 
X-CRM114-Status: GOOD (  17.98  )
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

On Sat, Oct 31, 2026 at 04:44:54PM -0400, Tal Zussman wrote:
> Commit adfb6609c680 ("mm/huge_memory: initialise the tags of the huge
> zero folio") added an is_huge_zero_folio() check to the hugetlb branch,
> but the huge zero folio is a THP, so it is never reached. It doesn't
> need to be checked in the other branch either, as its pages are tagged
> by __GFP_ZEROTAGS on allocation. Remove the check.
> 
> Signed-off-by: Tal Zussman <tz2294@columbia.edu>
> ---
>  arch/arm64/kernel/mte.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/kernel/mte.c b/arch/arm64/kernel/mte.c
> index f8d39e70857e..8615732567e6 100644
> --- a/arch/arm64/kernel/mte.c
> +++ b/arch/arm64/kernel/mte.c
> @@ -483,8 +483,7 @@ static int __access_remote_tags(struct mm_struct *mm, unsigned long addr,
>  		}
>  
>  		if (folio_test_hugetlb(folio))
> -			WARN_ON_ONCE(!folio_test_hugetlb_mte_tagged(folio) &&
> -				     !is_huge_zero_folio(folio));
> +			WARN_ON_ONCE(!folio_test_hugetlb_mte_tagged(folio));
>  		else
>  			WARN_ON_ONCE(!page_mte_tagged(page) && !is_zero_folio(folio));

Hmm, I added it to the wrong branch but it wasn't needed anyway since
the huge zero folio has PG_mte_tagged set. Patch looks fine:

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

