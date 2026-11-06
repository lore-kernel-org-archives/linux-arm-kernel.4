Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0027F606A326
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 17:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Rt259pfB;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=JwoAZg5E
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=0pHuyDdGFHrSjHAgPsM7O2JBzWQTNhkZRPUuo4cj1zQ=; b=Rt259pfBDxBglUX9AJoPUux8Sj
	Wv/WEE4/R8Efv7vH9RV6cLbOnrP+yateKEm1Zb7ZKW0HjHZSYMJ0K+gHTPLsD4zDR8BP9Rje/EkB/
	cZVM5pxWUFvdg60uB48RwoJPckJ2F33OB9hGysLha0TebkmOfipiZDZMk3O5t3P89EwmSs3ZJNISS
	UWcSrM4duGJhNrpGuc53S+wtMMBB1SbDrZI89/SDqQ3Zwa3z613vW4btza8jn65jJyfpNglvMexeH
	MV2EfwnO3uPRtXmhgB1tQh6BPz1FOi+I72Yvu8X3551D8FyTn5J6f4TCYU0Mo3f4LyQX0CZNpfq5v
	WPsToCMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPNPH-0000000DAWK-3Ids;
	Fri, 06 Nov 2026 17:07:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPNPF-0000000DAVe-0u8H
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 17:07:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 73C7F1682;
	Fri,  6 Nov 2026 09:07:08 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 750F13F632;
	Fri,  6 Nov 2026 09:07:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793984831; bh=6ol2Z/D8V05yZ6or6LI2IXFUiWAfEVEFcBbNRI7igRs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JwoAZg5EVgwKh2wLqs1WliIdCo+Jfe1JYxHmcWG8yqrfzzJE+U64zgM/8LqFm/Vuh
	 pkkyPGZB6Yf41ge3WPrhn+nKkojCwclMerf7UZDiTa7bmgmV7dusGidsTJa/Ppx3z8
	 /OXYfs9RtlgS12Njn/g8z8FBTzv608nrFXDMVCxU=
Date: Fri, 6 Nov 2026 17:07:06 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: will@kernel.org, mark.rutland@arm.com, pratyush@kernel.org,
	leitao@debian.org, mpilaniy@redhat.com, yeoreum.yun@arm.com,
	graf@amazon.com, pasha.tatashin@soleen.com,
	akpm@linux-foundation.org, baoquan.he@linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	rppt@kernel.org
Subject: Re: [PATCH v8] arm64: kexec_file: Stop using the Image text_offset
Message-ID: <au4JOjnQlx2aSpiE@arm.com>
References: <20261105125442.2282987-1-ruanjinjie@huawei.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261105125442.2282987-1-ruanjinjie@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_090713_344525_74C0E45A 
X-CRM114-Status: GOOD (  25.15  )
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

On Thu, Nov 05, 2026 at 08:54:42PM +0800, Jinjie Ruan wrote:
> image_load() adds text_offset to kernel_segment->mem and subtracts it
> from kernel_segment->memsz.  For CMA backed segments this breaks the
> load path: the payload is copied to page_address(cma), which is the CMA
> base, while image->start is set to the adjusted address, so kexec jumps
> into the middle of the kernel.  kimage_map_segment() has the same
> mismatch when a segment has been moved.
> 
> The adjusted memsz also breaks the release path: the CMA pages are
> freed using segment->memsz >> PAGE_SHIFT, which is fewer than were
> allocated, leaking the tail of the allocation.
> 
> Since commit 751c263bb74f ("arm64: remove TEXT_OFFSET randomization")

This commit only removed the randomisation. The one you want mentioned
here is cfa7ede20f13 ("arm64: set TEXT_OFFSET to 0x0 in preparation for
removing it entirely"). Although this removing never happened (see more
below).

> TEXT_OFFSET is always zero.  This has been upstream since v5.8, so no
> LTS kernel carries a non-zero text_offset.  Drop the adjustment and
> reject images with a non-zero value instead of booting them from a
> wrong address.  With the adjustment gone, segments stay at their CMA
> base and the release size matches the allocation.
> 
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Mike Rapoport <rppt@kernel.org>
> Link: https://lore.kernel.org/all/20260921090450.807575-2-ruanjinjie@huawei.com/
> Link: https://lore.kernel.org/all/20260921090450.807575-3-ruanjinjie@huawei.com/
> Fixes: 07d24902977e ("kexec: enable CMA based contiguous allocation")
> Suggested-by: Mike Rapoport <rppt@kernel.org>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
> v2:
> - Split out from the patch set.
> - Link to v7: https://lore.kernel.org/all/20261026075201.699550-1-ruanjinjie@huawei.com/
> ---
>  arch/arm64/kernel/kexec_image.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/kernel/kexec_image.c b/arch/arm64/kernel/kexec_image.c
> index 78b1f956d8d7..7d6baea3d28f 100644
> --- a/arch/arm64/kernel/kexec_image.c
> +++ b/arch/arm64/kernel/kexec_image.c
> @@ -80,12 +80,17 @@ static void *image_load(struct kimage *image,
>  	kbuf.bufsz = kernel_len;
>  	kbuf.mem = KEXEC_BUF_MEM_UNKNOWN;
>  	kbuf.memsz = le64_to_cpu(h->image_size);
> +	/*
> +	 * Pre-v5.8 images carry a non-zero text_offset, which is no longer
> +	 * honored; reject them instead of loading them at a wrong address.
> +	 */
>  	text_offset = le64_to_cpu(h->text_offset);
> +	if (text_offset) {
> +		pr_err("Unsupported Image text_offset 0x%lx\n", text_offset);
> +		return ERR_PTR(-ENOEXEC);
> +	}

If it's only CMA getting it wrong, can we not just set
image->no_cma = true here and continue as normal?

While text_offset is 0 now, I don't think we concluded it should be
deprecated. There was a recent push back on the attempt to document the
always 0 behaviour:

https://lore.kernel.org/all/20260604140839.1930847-1-linux@rasmusvillemoes.dk/

-- 
Catalin

