Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F62606A334
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 12:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=K2Xskv5W;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=AfzYxK3P
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ArlvmEMGN27jBhN3Cy984yIjnWKIqYZFJD4/EaUdqjQ=; b=K2Xskv5WDCB9zraNcDSbxnL4Mn
	u0Tur7dQdn4maS0fxMXqtn29OlXrEAS/6yuHenpf/kMtDaZttGUcoWXAQzNVjGOXc3dn53rFyCbvf
	TpVrF6FdiMdTeiBA+OBz2g1CrImbvhHqWODRWbEt4eIFlTW2gUoLIxZkeU0TRs3iLzHzKJ0Oc3ZhW
	1JIV46QYBun1BWkbtGfCytNID8AhKHmREpHpRu6UaPH3C7Dq17DA6VgqBjz69VPFT6m92SD6OFRfY
	TqCOo7W0jyEBS/JJTB6piXziNgmnZXV/CG/vLOIL1QC4w/UwQWvlkSR4+P6LbirpSKbMl9glEqdhC
	zIM5V2jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWYaO-0000000D9P1-1AdO;
	Thu, 26 Nov 2026 12:28:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWYaM-0000000D9OP-0xC9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 12:28:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E21AF1C2B;
	Thu, 26 Nov 2026 04:28:17 -0800 (PST)
Received: from e142392.arm.com (e142392.arm.com [10.2.213.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 882243F86C;
	Thu, 26 Nov 2026 04:28:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795696100; bh=HCbX/IbazWKscucgT5cWE9fT0tX8wPV3R692kWKmp2g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AfzYxK3Pjv7BE1onmPbYnITfBJtYkGApfxkf84coUMyq/ikkSSiuok7/U26301SFW
	 4sgz+Z6fwGvMaNz1l5c0tmQebjLImimHCBuVkQapkeHXNXbIF7VniC/jMIwmVXaEbH
	 UIHBj6Yssf3HCc7Iz8RIoCy4IjyPIgw6tE13W0aM=
Date: Thu, 26 Nov 2026 12:28:13 +0000
From: Kristina =?utf-8?Q?Mart=C5=A1enko?= <kristina.martsenko@arm.com>
To: Jirka Hladky <jhladky@redhat.com>
Cc: will@kernel.org, catalin.marinas@arm.com, luyang@redhat.com, 
	dockseed@proton.me, jmario@redhat.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Claude Code <noreply@anthropic.com>
Subject: Re: [PATCH v2] arm64: clear_user: keep alignment padding out of the
 zeroing loop
Message-ID: <lnh4ij6zpo5haddbkvxjp2gui6xlgjzaxkrmh26xgovc2b3muz@2wapkzpfnceq>
References: <CAL2CeByu46f48j8O9=237fvhpPUCsKjOZkFuuHU3xrr3wVF5Eg@mail.gmail.com>
 <20261124233043.1289050-1-jhladky@redhat.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261124233043.1289050-1-jhladky@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_042822_350496_E1F6A66C 
X-CRM114-Status: GOOD (  20.47  )
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

On Wed, Nov 25, 2026 at 12:30:43AM +0100, Jirka Hladky wrote:
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
> 
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
> Signed-off-by: Jirka Hladky <jhladky@redhat.com>
> 
> Co-Authored-By: Claude Code <noreply@anthropic.com>
> ---
>  arm64/lib/clear_user.S | 3 ++-

This patch doesn't apply. The file path is missing the "arch" directory,
it should be arch/arm64/lib/clear_user.S.

>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arm64/lib/clear_user.S b/arm64/lib/clear_user.S
> index de9a303..143d2f7 100644
> --- a/arm64/lib/clear_user.S
> +++ b/arm64/lib/clear_user.S
> @@ -37,7 +37,8 @@ USER(6f, setet	[x0]!, x1!, xzr)
>  	subs	x1, x1, #8
>  	b.mi	2f
>  
> -1:	.p2align 4
> +	.p2align 4
> +1:
>  USER(9f, sttr	xzr, [x0])
>  	add	x0, x0, #8
>  	subs	x1, x1, #8

Looks correct to me. I didn't realize that putting the label on the same
line as the alignment directive would have this side effect.

Reviewed-by: Kristina Martšenko <kristina.martsenko@arm.com>

Thanks,
Kristina


