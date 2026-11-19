Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 291A4606A33B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 10:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oU7sv7gi;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=EfMXmpKT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=E6PaedIbWsGIFw12ximAg+3ujcDQEcqQA+eS1w62gu0=; b=oU7sv7gihSIUQrbyRmXpz7nKNC
	fn5kHA17WGbkkDdxB3B//YXPelIQaq/tsCO3PSyndP+P6EgPxvUKnOknLZr7RtcSCHGXdGKZzRfhz
	KH99LgvF6+MwIqhzEhWSDh7yQbfh6pS9NdfjGL6eMRR1fzK0Pxfy3sQuiYrOQN2TV3OdfgqGOj/i4
	pbvjUypSqLl4H/AIL+0qfsrszu41vQ11MNeBOlE7e5LsJIWgRGZBnKw48a4S9109pJr/iEyCruSoy
	mxop5svb1HPjKOjys+ZcJSRsr+ub/9WxNx4Q22sCszrX5e8yark8T4WwKjwoV3wWmxDpfo/GuRkRU
	ObWQyjiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTzAJ-0000000BVxM-2kFC;
	Thu, 19 Nov 2026 10:14:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTzAB-0000000BVok-2ZvW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 10:14:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 629771575;
	Thu, 19 Nov 2026 02:14:36 -0800 (PST)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E7BC03F632;
	Thu, 19 Nov 2026 02:14:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795083279; bh=6NWbvSR0f3g3Q9Uy9G+y2I15dJrCHKFfvk2I/HZj43s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EfMXmpKTI/2lqjtWjkfA5oGOAVopz0eEtWJAOHB7j6QKfYDpAs8Fvzd0Th5pGI2nW
	 lzWVDuMeBHmk61Owh+4ZuSmGT6RSLNqGlZSnkhDUlIi6iIVmH8F2ncG10phCrajtQG
	 9iduahb2uhkrdtdogg8Ps4gkc5S/iHEIyz8nZ8cg=
Date: Thu, 19 Nov 2026 10:14:35 +0000
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Linu Cherian <linu.cherian@arm.com>,
	Mark Brown <broonie@kernel.org>, Shuah Khan <shuah@kernel.org>,
	Will Deacon <will@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v2 1/2] arm64: mm: Add note about overlays in PIE_EL1
Message-ID: <av7MCz-kJZqs6i3Y@e129823.arm.com>
References: <20261119-poe_futex-v2-0-244c7a01f788@arm.com>
 <20261119-poe_futex-v2-1-244c7a01f788@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261119-poe_futex-v2-1-244c7a01f788@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_021443_819922_20F60963 
X-CRM114-Status: GOOD (  17.77  )
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

LGTM.

Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>

On Thu, Nov 19, 2026 at 09:54:37AM +0000, Kevin Brodsky wrote:
> It isn't completely obvious why user page types do not have overlays
> applied in PIE_EL1. Add a comment to that effect, to avoid
> unpleasant surprises in the future.
> 
> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
> ---
>  arch/arm64/include/asm/pgtable-prot.h | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm64/include/asm/pgtable-prot.h b/arch/arm64/include/asm/pgtable-prot.h
> index 590ef4328f12..e6788e2e23bf 100644
> --- a/arch/arm64/include/asm/pgtable-prot.h
> +++ b/arch/arm64/include/asm/pgtable-prot.h
> @@ -175,6 +175,13 @@ static inline bool __pure lpa2_is_enabled(void)
>  	PIRx_ELx_PERM_PREP(pte_pi_index(_PAGE_READONLY),      PIE_R_O)   | \
>  	PIRx_ELx_PERM_PREP(pte_pi_index(_PAGE_SHARED),        PIE_RW_O))
>  
> +/*
> + * Regular user page types such as _PAGE_SHARED must not have overlays applied
> + * in PIE_EL1. If POE is enabled at EL1, and in the absence of FEAT_LSUI, this
> + * would break futex atomic operations on user memory with a non-default
> + * POIndex; the privileged atomic load/store instructions would be mistakenly
> + * checked against POR_EL1.
> + */
>  #define PIE_E1	( \
>  	PIRx_ELx_PERM_PREP(pte_pi_index(_PAGE_GCS),           PIE_NONE_O) | \
>  	PIRx_ELx_PERM_PREP(pte_pi_index(_PAGE_GCS_RO),        PIE_NONE_O) | \
> 
> -- 
> 2.56.0
> 

-- 
Sincerely,
Yeoreum Yun

