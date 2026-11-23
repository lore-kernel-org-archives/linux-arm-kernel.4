Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F28DD606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 09:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WdKamUoy;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=FQFfSCeT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=lHyRaJe2Oxu6YF/YZuFS79LHuEjt4FTk13YOidFcKI0=; b=WdKamUoyWDxLNs/C/hQW2S554Z
	hmxMIKcQfc4qoBjkqUsKtJJE+ZKeVrA1KWqNoolW+VU30k0JNz7NpCe/dxxmEsPAYboTqtR0R/Q4i
	3h4YNFRUz4gwp5wuVpuKvQ9O7VDFf09vBFyMbknbF5KFSd42w5ZTi3bJat/MfeMPO4kqCbvRXBDth
	D2c4VYsuW5scI6gMJ2HhTaH6ve2RfLByCk+zHUoeqCCWOoCtxjy+xuQbw2VAiXCt5oyv6WqgY8IDh
	6gVXyuwbw51pTyfxr//jeIo/kdjWDXdQa9LcG/Vhuw9Y7GWiLFoKhtqJxNsyYvmv9KiE7RMP26E78
	35Hncd/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQGD-00000002hQ7-1oQh;
	Mon, 23 Nov 2026 09:22:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQER-00000002gmq-2Ow3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 09:21:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 489121476;
	Mon, 23 Nov 2026 01:20:48 -0800 (PST)
Received: from localhost (a079125.arm.com [10.164.21.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6F56C3F632;
	Mon, 23 Nov 2026 01:20:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795425651; bh=sjyw09+6rOZQXtyPBevqw2Txy/HdpRHEm1XHUYTVWQo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FQFfSCeT03MCVMYM6WdTXW5pv96OMoHNbrbaoBV0kV3ZyS9Skat5hbubcRn4GCPYY
	 Qc8vcmuM3sdMjmGSFU0kfk09qVx2V5xUI3whlekXrJKUb726o0zmc//w3HaOC70SUd
	 9PhFFOWVyCwXdsG76Wk7bf+RpHbrx365abQt7g3M=
Date: Mon, 23 Nov 2026 14:50:47 +0530
From: Linu Cherian <linu.cherian@arm.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v1 1/6] arm64: cpufeature: Remove Neoverse-V3/AE from the
 BBML3 allow list
Message-ID: <cw2i2nfhwffg7wwybrttwynnmuujckh25dhe5jrlmmr3byowrz@ggccunczsoka>
References: <20261113145022.2592454-1-ryan.roberts@arm.com>
 <20261113145022.2592454-2-ryan.roberts@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261113145022.2592454-2-ryan.roberts@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_012106_482790_1118EFF7 
X-CRM114-Status: GOOD (  18.83  )
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

On Fri, Nov 13, 2026 at 02:50:15PM +0000, Ryan Roberts wrote:
> Neoverse-V3 and Neoverse-V3AE erratum 3053180 can cause a load or store
> to livelock when mapping size changes without break-before-make or when
> contiguous hints are programmed inconsistently.
> 
> The erratum was previously reported as fixed in r0p2. On that basis,
> commit 5aa4b625762e ("arm64: Add BBM Level 2 cpu feature") allowed
> Neoverse-V3 from r0p2, and commit 8fca3852e33d ("arm64: cpufeature: add
> Neoverse-V3AE to BBML2 allow list") did the same for Neoverse-V3AE.
> 
> The updated SDENs, MP168 v11 for Neoverse-V3 and MP172 v12 for
> Neoverse-V3AE, dated 9 June 2026, list r0p0, r0p1 and r0p2 as affected
> and the erratum as open. There is no fixed revision on which to base
> either allow-list entry.
> 
> Remove both entries so these CPUs observe break-before-make, and record
> the workaround in the silicon errata registry.
> 
> Cc: stable@vger.kernel.org
> Link: https://support.arm.com/documentation/109231/11-0/?lang=en
> Link: https://support.arm.com/documentation/109704/12-0/?lang=en
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> ---
>  Documentation/arch/arm64/silicon-errata.rst | 4 ++++
>  arch/arm64/kernel/cpufeature.c              | 2 --
>  2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/arch/arm64/silicon-errata.rst b/Documentation/arch/arm64/silicon-errata.rst
> index afe109afe692..9ad965d3e1ea 100644
> --- a/Documentation/arch/arm64/silicon-errata.rst
> +++ b/Documentation/arch/arm64/silicon-errata.rst
> @@ -243,10 +243,14 @@ stable kernels.
>  +----------------+-----------------+-----------------+-----------------------------+
>  | ARM            | Neoverse-V2     | #4193787        | ARM64_ERRATUM_4118414       |
>  +----------------+-----------------+-----------------+-----------------------------+
> +| ARM            | Neoverse-V3     | #3053180        | N/A                         |
> ++----------------+-----------------+-----------------+-----------------------------+
>  | ARM            | Neoverse-V3     | #3312417        | ARM64_ERRATUM_3194386       |
>  +----------------+-----------------+-----------------+-----------------------------+
>  | ARM            | Neoverse-V3     | #4193784        | ARM64_ERRATUM_4118414       |
>  +----------------+-----------------+-----------------+-----------------------------+
> +| ARM            | Neoverse-V3AE   | #3053180        | N/A                         |
> ++----------------+-----------------+-----------------+-----------------------------+
>  | ARM            | Neoverse-V3AE   | #3312417        | ARM64_ERRATUM_3194386       |
>  +----------------+-----------------+-----------------+-----------------------------+
>  | ARM            | Neoverse-V3AE   | #4193784        | ARM64_ERRATUM_4118414       |
> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
> index 34c5c03c0c9b..b15619690f42 100644
> --- a/arch/arm64/kernel/cpufeature.c
> +++ b/arch/arm64/kernel/cpufeature.c
> @@ -2012,8 +2012,6 @@ bool cpu_supports_bbml3(void)
>  	/* CPUs that support BBML3 but dont advertise through ID_AA64MMFR2_EL1 */
>  	static const struct midr_range supports_bbml3_list[] = {
>  		MIDR_REV_RANGE(MIDR_CORTEX_X4, 0, 3, 0xf),
> -		MIDR_REV_RANGE(MIDR_NEOVERSE_V3, 0, 2, 0xf),
> -		MIDR_REV_RANGE(MIDR_NEOVERSE_V3AE, 0, 2, 0xf),
>  		MIDR_ALL_VERSIONS(MIDR_NVIDIA_OLYMPUS),
>  		MIDR_ALL_VERSIONS(MIDR_NVIDIA_RIGEL),
>  		MIDR_ALL_VERSIONS(MIDR_AMPERE1),
> -- 
> 2.43.0


Reviewed-by: Linu Cherian <linu.cherian@arm.com>

