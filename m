Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFB1D606A320
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 22:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qWltdB1y;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZlWpL45b
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=VzpWhdNDbomTwao90Y0ofhyGovSJ0z1DWCHTvO85OdQ=; b=qWltdB1yPrF1eTI96Fz+cukB4Q
	CwFPN1+0l9laYijpPYwFC7aw1gKDimQzUvFF/7JmB0Q1MRHjFSmgYvQwYwWS1mcGTgvr4aqhxXw+/
	UyIYhk8KOYMNK4kTTgTgiqbH5QRjctnelKIR2Cei3rATkBUoCmaaY0CXLsOWTSNAi+/e/3chJu1PB
	NA0PyDrvV+e5eX0XiMtvMmWFEsYDOi1tP3fOR9TnDLKtdczJK8EDglAE3IejCRz+oGyJ9ipIIuKPP
	RZeYjNsnC72N+QnGtPtnI0fpQg9lb9XdhMSYhCRKxs1vj4TD66coz138/qjw7++d+sdVa9bOf2Xk5
	c+h9DPbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUAir-0000000Da0k-2gpz;
	Thu, 19 Nov 2026 22:35:17 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUAiq-0000000Da0e-2vtj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 22:35:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D088360D41;
	Thu, 19 Nov 2026 22:35:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40C1E1F000C4;
	Thu, 19 Nov 2026 22:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795127715;
	bh=VzpWhdNDbomTwao90Y0ofhyGovSJ0z1DWCHTvO85OdQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZlWpL45bxHST6QohvSbhOsSRNawrFOFSseOz7knkAv1kq5epM7n1l6MJM2HvtMKnT
	 oXmkirDO+/QuH0Dj6brbqnjEQcpj8FrqU4K2maffLD29n2blj357P/sNDBIdt/v2eJ
	 M0n38ooGTlhGj3ntlnlmVy0yZgwbt1c/TTgG/JNt9MhKY5YBAJGAl1DoDo1l/pi6MN
	 0yruuEBIQUpHwxj079QQZwa29rLVrXi/JAyoopiF1VJpzl/KYsWsAXxkcQCe4aCUZX
	 pWHaYkbS+HU5XpYWVQ/Y0niyHJAtoU2pu/uRc7c1xc3Pp/LBzDOrp3zdUHuf20Kw/x
	 V/AcHCdY4zCGg==
Date: Thu, 19 Nov 2026 14:35:13 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>,
	Christoph Hellwig <hch@lst.de>, Demian Shulhan <demyansh@gmail.com>
Subject: Re: [PATCH 2/2] raid6: arm64: use the EOR3 instruction where
 available
Message-ID: <20261119223513.GB1894@quark>
References: <20261118183335.1944213-4-ardb+git@google.com>
 <20261118183335.1944213-6-ardb+git@google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261118183335.1944213-6-ardb+git@google.com>
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
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 18, 2026 at 07:33:38PM +0100, Ard Biesheuvel wrote:
> Build the EOR3 versions from the same neon.uc source, with
> RAID6_NEON_EOR3 defined and the SHA3 extension enabled, and use them
> instead of the plain NEON versions on CPUs that implement SHA3. Use
> -march=armv8.2-a+sha3 for this: SHA3 is an optional extension of
> ARMv8.2, so any CPU that implements it implements ARMv8.2 as well. This
> is also what older toolchains (e.g., GCC 8.5 with binutils 2.36) need to
> accept EOR3.

gcc 8.1 supports the sha3 feature itself, but the veor3q_u8() intrinsic
wasn't added until gcc 9.1 and gcc 8.5.  Since the minimum gcc version
to build the kernel is 8.1, we probably need a gcc version check.

> -	struct raid6_calls const raid6_neonx ## _n = {			\
> -		.gen_syndrome	= raid6_neon ## _n ## _gen_syndrome,	\
> -		.xor_syndrome	= raid6_neon ## _n ## _xor_syndrome,	\
> -		.name		= "neonx" #_n,				\
> +	struct raid6_calls const raid6_ ## _name = {			\
> +		.gen_syndrome	= _pfx ## _n ## _gen_syndrome,		\
> +		.xor_syndrome	= _pfx ## _n ## _xor_syndrome,		\
> +		.name		= #_name,				\
>  	}

Nit: 'const' should go before 'struct'

> @@ -129,7 +145,7 @@ static inline void STEP4(unative_t *wp, unative_t *wq, const uint8_t *s3,
>  	unative_t d1 = vld1q_u8(s1);
>  	unative_t d0 = vld1q_u8(s0);
>  
> -	*wp ^= d3 ^ d2 ^ d1 ^ d0;
> +	*wp = XOR3(XOR3(*wp, d3, d2), d1, d0);
>  	*wq = HORNER4(*wq, d3, d2, d1, d0, x1d);
>  }

The following might be better, since it cuts down the length of the
loop-carried dependency chain on *wp.

*wp = XOR3(*wp, XOR3(d3, d2, d1), d0);

> diff --git a/lib/raid/raid6/arm64/pq_arch.h b/lib/raid/raid6/arm64/pq_arch.h
> index 27ff564d7594..4e397aa36480 100644
> --- a/lib/raid/raid6/arm64/pq_arch.h
> +++ b/lib/raid/raid6/arm64/pq_arch.h
> @@ -1 +1,33 @@
> -#include "arm/pq_arch.h"
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +
> +#include <linux/cpufeature.h>
> +#include <asm/neon.h>
> +
> +extern const struct raid6_calls raid6_neonx1;
> +extern const struct raid6_calls raid6_neonx2;
> +extern const struct raid6_calls raid6_neonx4;
> +extern const struct raid6_calls raid6_neonx8;
> +extern const struct raid6_calls raid6_eor3x1;
> +extern const struct raid6_calls raid6_eor3x2;
> +extern const struct raid6_calls raid6_eor3x4;
> +extern const struct raid6_calls raid6_eor3x8;
> +extern const struct raid6_recov_calls raid6_recov_neon;

These declarations are duplicated in 2 places, but they're still not
in-scope in the .c files that actually define them.  Maybe they should
go in lib/raid/raid6/arm/neon.h, and lib/raid/raid6/arm/pq_arch.h and
lib/raid/raid6/arm64/pq_arch.h should include that?

- Eric

