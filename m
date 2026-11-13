Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C140606A323
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 19:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MzPHo/rW;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W6dxepis
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Yme8xVrfiJB9JtUWZsCWQb4f6bpQ8C2lB7x46RDJgew=; b=MzPHo/rWMPP+jYOpH7KJNytSyJ
	SD2I41CCU86307sT8nC23accm5dM8AcURggTRkgVA4i69r+vRmbz12kRiJSVsFoRaZkevAB1OP8nx
	/7Tq1C57AarU17ofjZvxAGrd6N2AGiVY/2wngl85IngW3E7z9No0s20OQ8rqjZ/VCZj3UQQ7WRQLD
	3zJSIoSTJjbU0xvjaC7KiskPqTx3BhEoMjYIotpTniyIw4UK0/+/LpLQeNseirBhtnz4ZsMSrigDd
	ywcfQ+Nf2PpIsk+nd3+o5vbNuEKXMBsntJVDQTBd00i0xS46//wWPesvFFb7HIzgqgzydhCVUHrJ6
	lDdx0czQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRwp1-0000000E95T-2cga;
	Fri, 13 Nov 2026 19:20:27 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRwp0-0000000E94y-0hqb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 19:20:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0896061D75;
	Fri, 13 Nov 2026 19:20:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A40361F000C4;
	Fri, 13 Nov 2026 19:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794597624;
	bh=Yme8xVrfiJB9JtUWZsCWQb4f6bpQ8C2lB7x46RDJgew=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=W6dxepisHpNNsxivi81mY2JUyom8vDvbtSJGZ79fX/VnHuW46WgDlfEp5w7M4L57I
	 LCYDzH5U0zSkM86UX6S5jGE9QpxapZ2vXxyGRwBFCxzwa1hnqIs2B5C1sd9o1Obgcp
	 MFZVnbFcDAFxRX01z+kkFJPV818yQD1kIbDRb8w1KLadEiSWsjM6L69B0/DeYUaKKJ
	 JnHV9Zjv20wthE9X+dPxf1pxS/GCxyevGUDxAU7fMzVkPg2hHRB2S01RE3gZ9BRIKm
	 zBYjPZQY9VUggt4Lrn/MTj4XrA5pKIELlXIqABDX1noeaFuneVjKllspDykcclkRE9
	 OuumQ6HJ3hVhQ==
Date: Fri, 13 Nov 2026 19:20:17 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-mm@kvack.org, Arnd Bergmann <arnd@arndb.de>, 
	Andrew Morton <akpm@linux-foundation.org>, Andreas Larsson <andreas@gaisler.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>, 
	"David Hildenbrand (Arm)" <david@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Matthew Wilcox <willy@infradead.org>, 
	Malin Jonsson <malin.jonsson@est.tech>, Richard Weinberger <richard@nod.at>, 
	Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, 
	linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, x86@kernel.org
Subject: Re: [PATCH v2 6/6] ARM: add CONFIG_VMSPLIT_2G_OPT option
Message-ID: <avdfH-r5kDSrPUI4@gremlin>
References: <20261112112528.1116405-1-arnd@kernel.org>
 <20261112112528.1116405-7-arnd@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261112112528.1116405-7-arnd@kernel.org>
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 12, 2026 at 12:25:28PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> Unlike x86 and powerpc, there is currently no option to use exactly 2GiB
> of lowmem on Arm. Since 2GiB is still a relatively common configuration
> on embedded systems, it makes sense to allow this to be used in
> non-highmem builds.
>
> Add the Kconfig option and make this the default for non-LPAE builds
> with highmem enabled instead of CONFIG_VMSPLIT_2G.  LPAE still requires
> the vmsplit to be on a gigabyte boundary, so this is only available for
> classic pagetables at the moment, same as CONFIG_VMSPLIT_3G_OPT.
>
> Tested in qemu -M virt, both with and without HIGHMEM enabled.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

With sashiko fix, LGTM and:

Acked-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

> ---
>  arch/arm/Kconfig | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index 797705a94b28..8992fedfdf37 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -1025,7 +1025,8 @@ config BL_SWITCHER_DUMMY_IF
>  choice
>  	prompt "Memory split"
>  	depends on MMU
> -	default VMSPLIT_2G if HIGHMEM || ARM_LPAE
> +	default VMSPLIT_2G if ARM_LPAE
> +	default VMSPLIT_2G_OPT if HIGHMEM
>  	default VMSPLIT_3G_OPT
>  	help
>  	  Select the desired split between kernel and user memory.
> @@ -1042,6 +1043,9 @@ choice
>  		bool "3G/1G user/kernel split (for full 1G low memory)"
>  	config VMSPLIT_2G
>  		bool "2G/2G user/kernel split"
> +	config VMSPLIT_2G_OPT
> +		depends on !ARM_LPAE
> +		bool "2G/2G user/kernel split (for full 2G low memory)"
>  	config VMSPLIT_1G
>  		bool "1G/3G user/kernel split"
>  endchoice
> @@ -1050,6 +1054,7 @@ config PAGE_OFFSET
>  	hex
>  	default PHYS_OFFSET if !MMU
>  	default 0x40000000 if VMSPLIT_1G
> +	default 0x70000000 if VMSPLIT_2G_OPT
>  	default 0x80000000 if VMSPLIT_2G
>  	default 0xB0000000 if VMSPLIT_3G_OPT
>  	default 0xC0000000
> @@ -1058,6 +1063,7 @@ config KASAN_SHADOW_OFFSET
>  	hex
>  	depends on KASAN
>  	default 0x1f000000 if PAGE_OFFSET=0x40000000
> +	default 0x4f000000 if PAGE_OFFSET=0x70000000
>  	default 0x5f000000 if PAGE_OFFSET=0x80000000
>  	default 0x9f000000 if PAGE_OFFSET=0xC0000000
>  	default 0x8f000000 if PAGE_OFFSET=0xB0000000
> --
> 2.53.0
>

--
Cheers, Lorenzo

