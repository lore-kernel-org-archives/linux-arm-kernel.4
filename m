Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7031606A329
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 14:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zILHP4yF;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=bMA90oAV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=KCFAC1FOAB4tB1Vm5iJMuAjrTh3kSujq/UfRYmsRVvA=; b=zILHP4yFO/A+Kb
	dH6ARwcok3gXEwqvXBIjm0TCEELiuRAh2CIEMUA65qGKacaaTGiNd4I51wnGUbFjigB91Jt1CwYai
	zZpM//ZSCR5h7FGjwCj1TWERyzsQrCdfwcTLt0eY2e/bqYPOSTKzGlzXcMagLtPd7ngyeFS0U9YNi
	kD0pvdINseMxXY+EZS8rpb8Yg94C7LqJN4h2UmOylayuFAYySvhWLkISxmpmLUdbM6e9ZUGtl3Yq1
	9IrBecXvvkR7VthwKunSKIfdapMaQL5H3zcIpRvr7Lo9gzRQOi1zwoF9VQIpqo81ldcOLlOPSzWJp
	0n99N9MndoZCfME3f2wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWDnt-0000000A7h4-3mx0;
	Wed, 25 Nov 2026 14:16:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWDnp-0000000A7g0-03UA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 14:16:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5208B2F;
	Wed, 25 Nov 2026 06:16:48 -0800 (PST)
Received: from [10.0.154.42] (e121487-lin.cambridge.arm.com [10.0.154.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 27D553F763;
	Wed, 25 Nov 2026 06:16:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795616211; bh=2SXKFVoBbxWUha93ECgLAC2EuSDLG7Zz9KOIAMkR/Vg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bMA90oAVFQ3VCfANbPbE8mQjtEZEYekxZbeHGHszMB8aYNvDChqBychj9Mop3Xd7r
	 5C1OLF7oy+aH34p2wrvzefyJhIzLzw8X4fmkwtgcOqNGchsJf3KmzzuE8jInQE6iqs
	 NFf/+ydb07wVOQAB785EXpl4cwHYyYHkgYNDiNoQ=
Message-ID: <81e6e5ad-24ab-4b47-b22b-494d61e318dc@arm.com>
Date: Wed, 25 Nov 2026 14:16:48 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] ARM: NOMMU: pmsa-v7: Align a split region's base to
 its size
To: Brad Hawthorne <brad@sim.vu>, linux@armlinux.org.uk,
 linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
References: <20261125025757.1159931-1-brad@sim.vu>
 <20261125025757.1159931-5-brad@sim.vu>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <20261125025757.1159931-5-brad@sim.vu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_061654_160841_18FB7E39 
X-CRM114-Status: GOOD (  24.10  )
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/25/26 02:57, Brad Hawthorne wrote:
> try_split_region() masks the base with size - 1, which aligns it only
> when size is a power of two, then rounds the region size up without
> aligning the base again. An MPU region's base must be aligned to its
> size. For memory at 0x21400000 + 0xa00000, the kernel asks for a 16MB
> region at 0x21400000. QEMU ignores such a region. Hardware that
> ignores the low bits would map 0x21000000-0x219fffff and leave
> 0x21a00000-0x21dfffff, which the kernel uses, unmapped.
> 
> Start from the size rounded down to a power of two, align the base to
> it, and double it until the aligned region covers the request.
> 
> Tested under QEMU (mps2-an385) with that memory layout: QEMU no longer
> reports a misaligned region, and the kernel boots to user space. Not
> tested on PMSAv7 hardware.
> 
> This patch was written with an AI coding assistant (Claude Opus 5.5,
> Anthropic): it found the bug in review, wrote the fix, the QEMU tests
> and this changelog, and ran them; I reviewed the reasoning and the test
> results.
> 
> Fixes: 5c9d9a1b3a54 ("ARM: 8712/1: NOMMU: Use more MPU regions to cover memory")
> Cc: stable@vger.kernel.org
> Signed-off-by: Brad Hawthorne <brad@sim.vu>
> ---
>  arch/arm/mm/pmsa-v7.c | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm/mm/pmsa-v7.c b/arch/arm/mm/pmsa-v7.c
> index af0c71135a6e..bd776ea90934 100644
> --- a/arch/arm/mm/pmsa-v7.c
> +++ b/arch/arm/mm/pmsa-v7.c
> @@ -146,13 +146,19 @@ static inline unsigned long irbar_read(void) {return 0;}
>  static bool __init try_split_region(phys_addr_t base, phys_addr_t size, struct region *region)
>  {
>  	unsigned long  subreg, bslots, sslots;
> -	phys_addr_t abase = base & ~(size - 1);
> -	phys_addr_t asize = base + size - abase;
> -	phys_addr_t p2size = 1 << __fls(asize);
> -	phys_addr_t bdiff, sdiff;
> -
> -	if (p2size != asize)
> +	phys_addr_t p2size = 1 << __fls(size);
> +	phys_addr_t abase, asize, bdiff, sdiff;
> +
> +	/* The base must be aligned to the region size */
> +	for (;;) {
> +		abase = base & ~(p2size - 1);
> +		asize = base + size - abase;
> +		if (asize <= p2size)
> +			break;
>  		p2size *= 2;
> +		if (!p2size)
> +			return false;	/* would need a 4GB region */
> +	}
>  
>  	bdiff = base - abase;
>  	sdiff = p2size - asize;
> -- 2.43.0
> 

Reviewed-by: Vladimir Murzin <vladimir.murzin@arm.com>


