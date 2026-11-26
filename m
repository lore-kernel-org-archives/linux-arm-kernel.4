Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7A29606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 15:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dZI+OE2g;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=WxRAdZYm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=oyZp6GIvcpweU5fwjCc+QvoMsk02lNyi+HgBwgbOqog=; b=dZI+OE2gW0iyQuM7D+F2GimygQ
	m6Hj/S6htpQFCTzYqXeRdIGzth9uHhXS/04MjDjgFSOYdxfzag2R4A0d/VLN+xTNjenGIKBWPIF1c
	OI4aBigzr93OkUN/vAXiA2W2j0+uqSLIaT0EhDb9IeL8JDOpimPftfl5K414KQuVVlLWUQECkHCRA
	4nIIj0MlRXGVSzz5HLYbREfLVMVhbHV/lPAPstC1wJVC4PmYzhKokvbnuSK058NlFJPQZymhaQ5SC
	igGcpfWXjTT1c4og/jViUBLkkRr4EayDa1K4e8A6+ScFz4fyzVTaQh8lBjTsA7019hg7mdhfPiy4Z
	iT7DRakw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWbLM-0000000DixI-1HnX;
	Thu, 26 Nov 2026 15:25:04 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWbKu-0000000Dir0-1FX0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 15:24:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0949F1C2B;
	Thu, 26 Nov 2026 07:24:31 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 836323F632;
	Thu, 26 Nov 2026 07:24:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795706673; bh=FDdQIQpOoRxvJbj6lPjG5MBExNl3QFoCUrLhmLfkHx8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WxRAdZYmTSx8ZIyUYLIxfggtJcEB7rf8gN4gNDhhlKkrP/9f18L6oV1/Q7BD+MdsO
	 pFBQtoBKm8Njp/a8/zn9W3LP8Ik1iwWGI/9xBX/n3JXvs9bZR4gSHG4NyYepR3FU03
	 LiZEYj3tkk+EG9GvmiIzmH0lr06IjE9YLE8M1UVQ=
Date: Thu, 26 Nov 2026 15:24:29 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Jirka Hladky <jhladky@redhat.com>
Cc: will@kernel.org, kristina.martsenko@arm.com, luyang@redhat.com,
	dockseed@proton.me, jmario@redhat.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] arm64: clear_user: keep alignment padding out of the
 zeroing loop
Message-ID: <awhPLR0Q_UjkjdDs@arm.com>
References: <CAL2CeByu46f48j8O9=237fvhpPUCsKjOZkFuuHU3xrr3wVF5Eg@mail.gmail.com>
 <20261126125033.1692064-1-jhladky@redhat.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261126125033.1692064-1-jhladky@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_072436_436343_E2AA4884 
X-CRM114-Status: GOOD (  14.90  )
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 26, 2026 at 01:50:33PM +0100, Jirka Hladky wrote:
> Commit fe59e0358d9b ("arm64: lib: Use MOPS for usercopy routines")
> restructured __arch_clear_user() and moved the loop alignment inside
> the function. In doing so, the loop label ended up in front of its
> own alignment directive:
> 
> 	1:	.p2align 4
> 	USER(9f, sttr	xzr, [x0])
> 	add	x0, x0, #8
> 	subs	x1, x1, #8
> 	b.hi	1b
> 
> The backward branch at the bottom of the loop therefore lands in the
> alignment padding, and every iteration of the 8-byte zeroing loop
> executes however many padding NOPs the linker happened to need (0-3).
> Because that count depends on where the function lands, unrelated
> code changes anywhere in the kernel can shift /dev/zero read
> performance: an irqbypass reorganisation in 6.17 [1] left two NOPs
> in the loop and cost about 30% of /dev/zero read throughput on
> affected builds.

The NOPs don't change at link time. The assembler already ensures that
the .text section of clear_user.o is 16-byte aligned (due to the
.p2align 4). What can change though is the position of the function in
16-byte increments and the two NOPs inserted before the sttr can indeed
cross a cache-line boundary. The loop executes the NOPs unnecessarily.

The irqbypass rework only moved the function. The NOPs have been in the
loop since the MOPS update.

> Norman Herms diagnosed this and proposed moving the label below the
> directive, so the padding is executed only once on the fall-through
> path and the loop body starts 16-byte aligned as intended:
> 
> 	.p2align 4
> 	1:
> USER(9f, sttr	xzr, [x0])
> 
> Measured on Ampere Altra (Neoverse N1, no FEAT_MOPS), reading 4 GiB
> from /dev/zero, two otherwise identical kernels built from the same
> tree and toolchain, differing only in this change (two NOPs of
> padding in the unpatched loop):
> 
>   kernel instructions per MiB:	797.5k -> 536.4k
>   throughput:			11.6 GB/s -> 22.3 GB/s (+92%)
> 
> The instruction delta is exactly the two removed NOPs: 2 x 131072
> instructions per MiB at 8 bytes per iteration.
> 
> [1] https://lore.kernel.org/all/20250516230734.2564775-6-seanjc@google.com/
> 
> Fixes: fe59e0358d9b ("arm64: lib: Use MOPS for usercopy routines")
> Reported-by: Luke Yang <luyang@redhat.com>
> Suggested-by: Norman Herms <dockseed@proton.me>
> Reviewed-by: Kristina Martšenko <kristina.martsenko@arm.com>
> Signed-off-by: Jirka Hladky <jhladky@redhat.com>
> 
> Co-Authored-By: Claude Code <noreply@anthropic.com>

Nit: empty line in the trailers block. Also we shouldn't really add
co-authored-by: claude. You can mention it the cover letter (if any) or
the text below ---.

And probably a Cc: stable.

The fix looks fine otherwise, so:

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

