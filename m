Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D206A606A327
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 13:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qlQg3NIW;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=CoQacUfd;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Oemqflkg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=FSEDyfxSTPcIGOMud9C2CIH0AankhOmnnyfmu4tSqH8=; b=qlQg3NIWtByVLJ
	HWCg2m8muEIa97iTWALwzaYSCSQImxQhv5IXBC3DZ6wv0zPzO2KkAMQxOlpAOZmJvtzv1RRGIRRJa
	6F+NFxdJ43wOxJLy+VzwU/ghZkFvIbe2x08BUTOux4UtxTOQTmLZ5Dmz3ol/HKCh90gu+E1aNy2q1
	cKNh70lHyJ4iI9IV7hW23RauOIn9H4DP2xxCVx9ZQwfXKyWrCEyu0M7BN4xyvJxUYmuZ8JrFt9Teq
	hvsbd5BEcPgXO5i4EOCf/gA3cv74TX07sVMrWTmDgL4HUVY4w2KaICxAldfgj0UTXT76DDgjYSN2D
	V6nwz7l5qLnVoCDmnzMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWCvz-00000009yEI-0Jfm;
	Wed, 25 Nov 2026 13:21:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWCvm-00000009yCZ-3yea
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 25 Nov 2026 13:21:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=FSEDyfxSTPcIGOMud9C2CIH0AankhOmnnyfmu4tSqH8=; b=CoQacUfd4gTb3Txco0GJZmwAei
	5PzUexW6r2B6d9ulhIuVL5sB5TMzwJCE1UV7vg6SNnlxvSEp9l3gQlSiHWpm6kDwNO7VVtj4Fu9k5
	RPtE/ldCKazbHNaEQe9rHbwRdGt5Za1YceAcWbDAtv2N6SXVCImHkCMB6aJ659Wtf5+dMHtfJjWNQ
	9KfbxdlhkVRM9QW2xJo4L8mc/2qa8TDg180ffmNJxktunVqh4JVJa7gYl30KnEKshPQp+emxyU65y
	+Z6NbjS8WDPtgfbMvKJcZ8FElmXPkx4eruFYJBB4HKC+vq+nCT+eohUiB69axaMGCI2s7MUv13cf+
	F6P9wvUQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWCvj-00000005LCG-3jRF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 13:21:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1D94A2F;
	Wed, 25 Nov 2026 05:20:54 -0800 (PST)
Received: from [10.0.154.42] (e121487-lin.cambridge.arm.com [10.0.154.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 10CD33F86F;
	Wed, 25 Nov 2026 05:20:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795612856; bh=o+g6T0SKB4A2t//VSduq7zL1oBlD6qtVm9U/dPU7Dr0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OemqflkgmfdfC+KnMHjvYx4vWJlyDu/kQl+p7P29+d1/z2KNi+KO3194mNfG5ag8D
	 t2EWzp19bCxzCMW2SbfDA368RHZJviDTfp1lZRyTBa2qfSS/H4vnhPSbHUTl7rrRFV
	 l51VaLUflgozNOHD1WaI4xOrGubWZikkG55oW4Zc=
Message-ID: <a162ddf0-3a6a-4c9f-8506-ff66974c2931@arm.com>
Date: Wed, 25 Nov 2026 13:20:53 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] ARM: NOMMU: pmsa-v8: Fix off-by-one in
 __pmsav8_setup_region()
To: Brad Hawthorne <brad@sim.vu>, linux@armlinux.org.uk,
 linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
References: <20261125025757.1159931-1-brad@sim.vu>
 <20261125025757.1159931-6-brad@sim.vu>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <20261125025757.1159931-6-brad@sim.vu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_132059_957318_A898A002 
X-CRM114-Status: GOOD (  21.27  )
X-Spam-Score: -2.5 (--)
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
> __pmsav8_setup_region() rejects "number > mpu_max_regions", which lets
> number == mpu_max_regions through. Regions are numbered from 0, so
> that number names a region the MPU does not have. Reject it.
> 
> A Cortex-M33 can be built with 4 regions. Under QEMU (mps2-an505) with
> a 4-region MPU, QEMU logs "MPU region out of range 4/4" and the kernel
> takes an unhandled exception during the setup. With this patch the
> setup warns "MPU region initialization failure! -2" and the kernel
> faults later, in memblock_alloc_try_nid(), because RAM that region
> would have mapped has none. On an RP2350 board (Cortex-M33, 8 regions)
> the boot is unchanged.
> 
> This patch was written with an AI coding assistant (Claude Opus 5.5,
> Anthropic): it found the bug in review, wrote the fix, the QEMU tests,
> the board test and this changelog, and ran them; I reviewed the
> reasoning and the test results.
> 
> Fixes: 046835b4aa22 ("ARM: 8757/1: NOMMU: Support PMSAv8 MPU")
> Signed-off-by: Brad Hawthorne <brad@sim.vu>
> ---
>  arch/arm/mm/pmsa-v8.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/mm/pmsa-v8.c b/arch/arm/mm/pmsa-v8.c
> index 28cdc5468406..e5353a030731 100644
> --- a/arch/arm/mm/pmsa-v8.c
> +++ b/arch/arm/mm/pmsa-v8.c
> @@ -140,7 +140,7 @@ static int __init __mpu_max_regions(void)
>  
>  static int __init __pmsav8_setup_region(unsigned int number, u32 bar, u32 lar)
>  {
> -	if (number > mpu_max_regions
> +	if (number >= mpu_max_regions
>  	    || number >= MPU_MAX_REGIONS)
>  		return -ENOENT;
>  
> -- 2.43.0

Reviewed-by: Vladimir Murzin <vladimir.murzin@arm.com>


