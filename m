Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D34AB606A8A0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 03:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zPikxrww;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=cQzJAi9q
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=bOwK+5oLftQk320DH0GEbzZnadmplgpiQL2jCJ+yV24=; b=zPikxrwwz5JOp6A+9IzTpjmtDO
	pm28vzsXB/Y+Wl2gByYQFLrvab/otCvQ84BsI4PgJSNq9TVlvIpw0JpGkK09U9hYhBF/jzEQ8Q63b
	AB6YVpCKOnfoinXET1g0WgghSI4/S6wZzk/gq5/zyELWNUuMBgB6LUGJ8FO/ib9HV7popxhbM5BhL
	BEbOVZZ51dYP+qIRSE9Qrajg74r+KLNfKL1jCFYOQTQmUYj5zidqQj7U1xzpJkQaJBypMntSbJcb4
	aorGx5VJpreuI/0lihQ+tCPlyrO8ZQ07Slv+5hjrDuHpnFYRnvZ0yc2JgbJ+jgwWgZJ5UYJe2ZfQ0
	ms5OS9Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRhyG-0000000Ba9U-21nn;
	Fri, 13 Nov 2026 03:29:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRhyD-0000000Ba8h-3rfa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 03:28:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C6D24175A;
	Thu, 12 Nov 2026 19:28:51 -0800 (PST)
Received: from localhost (a085714.arm.com [10.164.19.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 106C63F632;
	Thu, 12 Nov 2026 19:28:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794540534; bh=kLEU3+bkOweqD+kWRCMnCgNUSxxZISweiL/OZrrvsQg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cQzJAi9qDEf+g9Wu+39XmiWj8YhBA0INOILUGffcjMUE8/Tf9z7R4Xduj/J3XnJva
	 NIkTXHmTBtDOBXymBVjpVAXOyuDh6Q8LHelosDBddoa2rtGosn/7Xf/ohNpiQnHq7C
	 yISkFw1TmXdLfYUuB5eNB4w4khmLNN95v7wKKgUE=
Date: Fri, 13 Nov 2026 08:58:51 +0530
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com, 
	will@kernel.org
Cc: Ryan Roberts <ryan.roberts@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, Lorenzo Stoakes <ljs@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Linu Cherian <linu.cherian@arm.com>, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH V4 0/4] arm64/mm: Convert pgtable READ_ONCE() as
 pxdp_get()
Message-ID: <vtaekdnpxd5avhpv3hlmeswwq5raf57ila2qyilxvddu3w5nnq@lkenzauzv7hy>
References: <20261105043403.3326445-1-anshuman.khandual@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261105043403.3326445-1-anshuman.khandual@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_192858_122940_B3E87B6A 
X-CRM114-Status: GOOD (  22.33  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 05, 2026 at 10:03:59AM +0530, Anshuman Khandual wrote:
> Route READ_ONCE() accesses on pgtable entries via level specific generic MM
> pxdp_get() helpers which platforms could then override when required. These
> accessors on arm64, will help in ensuring page table accesses are performed
> in an atomic manner while reading 128 bit page table entries later. But for
> now they just default to READ_ONCE(), thus preserving existing behaviour on
> current D64 translation a well.
> 
> This is similar to generic MM where all atomic accesses have already been
> converted from READ_ONCE() into pgtable level specific accessors.
> 
> These are preparatory patches for D128 enablement, although standing their
> own for D64 translation as well. These patches are split from earlier D128
> V1 series. There are no functional changes here, and besides mm kselftests
> do not show any regression.
> 
> https://lore.kernel.org/linux-mm/20260729122452.3797443-1-anshuman.khandual@arm.com/
> 
> This series applies on v7.4-rc1 and have been hosted below for reference.
> 
> git@git.gitlab.arm.com:linux-arm/linux-anshuman.git (arm64_pxdp_get_v4)
> 
> Changes in V4:
> 
> - Dropped all pxdp_get() platform overrides per Catalin
> - Moved pmdp_test_and_clear_young() and [pud|p4d]_offset[_phys]()
>   helpers inside arch/arm64/mm/mmu.c to avoid build problems
> - Updated all commit messages as required

This series has run into some KASAN fault issues during boot with 5 level
pgtables but also unlike Sashio suggestions these would require more code
churn to fix. Please find the details below.

https://lore.kernel.org/all/ohyhflzuoxdemccemutoosmj5hsfwylrlt6tvnyehulerk7gf3@ada6wu4zrzkp/

NOTE: somehow Sashiko had dropped LAKML from the thread although it shows
up in MM list.

Given the above scenario, I would suggest falling back on the V3 series,
that defined and override pxdp_get() helpers for arm64 platform. Although
similar to generic MM default fallback, they prevented code movement into
arch/arm64/mm/mmu.c file causing these KASAN issues in the first place.

https://lore.kernel.org/all/20260924062214.1635078-1-anshuman.khandual@arm.com/

V3 series apples cleanly, builds, boots and also clears MM selftests on
v7.4-rc2 as well.

> 
> Changes in V3:
> 
> https://lore.kernel.org/all/20260924062214.1635078-1-anshuman.khandual@arm.com/
> 
> - Added overrides for pxdp_get() and replaced remaining READ_ONCE()
> - Updated all commit messages as required
> - Dropped previous tags
> 
> Changes in V2:
> 
> https://lore.kernel.org/all/20260922061638.3967467-1-anshuman.khandual@arm.com/
> 
> - Rebased on v7.3-rc4 along with all latest dependencies
> - Updated commit messages per Ryan
> - Added tags from Ryan
> 
> Changes in V1:
> 
> https://lore.kernel.org/all/20260903060657.2717457-1-anshuman.khandual@arm.com/
> 
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Ryan Roberts <ryan.roberts@arm.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Lorenzo Stoakes <ljs@kernel.org>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: David Hildenbrand <david@kernel.org>
> Cc: Mike Rapoport <rppt@kernel.org>
> Cc: Linu Cherian <linu.cherian@arm.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-mm@kvack.org
> 
> Anshuman Khandual (4):
>   arm64/mm: Use pmdp_get() for PMD accesses
>   arm64/mm: Use pudp_get() for PUD accesses
>   arm64/mm: Use p4dp_get() for P4D accesses
>   arm64/mm: Use pgdp_get() for PGD accesses
> 
>  arch/arm64/include/asm/pgtable.h | 38 +++----------
>  arch/arm64/mm/fault.c            |  8 +--
>  arch/arm64/mm/fixmap.c           |  6 +-
>  arch/arm64/mm/hugetlbpage.c      | 10 ++--
>  arch/arm64/mm/kasan_init.c       | 18 +++---
>  arch/arm64/mm/mmu.c              | 97 ++++++++++++++++++++++----------
>  arch/arm64/mm/pageattr.c         |  8 +--
>  arch/arm64/mm/trans_pgd.c        | 14 ++---
>  8 files changed, 108 insertions(+), 91 deletions(-)
> 
> -- 
> 2.43.0
> 

