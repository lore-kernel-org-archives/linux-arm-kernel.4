Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53E16606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 22:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RZBhv855;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Bz9YT9qj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=f+SeFdYy4JRTK3hXnhRNUWYVD40LxxdzEaf6yp824CU=; b=RZBhv855fXhckU8UvP+Wpo3LN+
	0+fUXN8Vp6fufTc1/HHOdsZsXhrV61s1Ur+sDhP+YPzb8yasVnhQGJDdGx56PWpQgk+8YJQlcLr5u
	OAuw4FpxvuivSpx7xB/WUen/2zLiSkG6Zk5hcuGRHBhr93ibh4gOU/bZ3GBYU6oLiTUNUw1A6xUcx
	RQFU3dhLKfZU1HG2B/RW3QJbSPCMuMynt34SP7gFALL1neq4B1Uwf1mwWWC0Rj2bZfZ1X/CK8Mj/U
	+qaTTCBlhciKkBwJk6oYAI9LzC/ofRKHlWRtQvBcWqr9PN7mMz3Gd4aBWqyp/NZx9TsiiVvZLES6Y
	OawfRD2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRdGR-0000000B9vs-0JQy;
	Thu, 12 Nov 2026 22:27:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRdGP-0000000B9vl-2psn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 22:27:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0AB97432CC;
	Thu, 12 Nov 2026 22:27:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4333F1F000C4;
	Thu, 12 Nov 2026 22:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794522444;
	bh=f+SeFdYy4JRTK3hXnhRNUWYVD40LxxdzEaf6yp824CU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Bz9YT9qjT32lKIG/FhtkoW2ysJ6CnFY75269Dhl4kEYr0/btpFp0Q/zAmM/v/JxxW
	 iTkhm73wCMIzShDuy7NuVOSYEpMOUDOAR7xyBY4cWAy5MFR55rta2H+Yp3ZvpnYK9l
	 CpqaFH0dpolkGQeim7lih4F+A2Yy9iAlaHFxBRxy1LznfM2eYnVvXZxhT5Rnjrb3hW
	 cbOUHosRtenS4QYtihoM0wmHSSTGH1zqcSGL6/utccs7OroRBhjgb8G2hkqzgJGtUe
	 9wN9tSar9pFjDespIyKd8zSnEmT0bEPRcYCG1RHpVXnN7Bm2aRbRzgZSL9qeoUc1GG
	 r0JdF7tybRsLQ==
Date: Thu, 12 Nov 2026 15:27:20 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-kbuild@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	Christoph Hellwig <hch@lst.de>, Eric Biggers <ebiggers@kernel.org>
Subject: Re: [PATCH 0/4] Get rid of all NEON intrinsics stdint.h type hacks
Message-ID: <20261112222720.GA188816@ax162>
References: <20261029135020.272082-6-ardb+git@google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261029135020.272082-6-ardb+git@google.com>
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Ard,

On Thu, Oct 29, 2026 at 02:50:20PM +0100, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> Recent Clang has become more finicky when it comes to overriding the
> type macros that the freestanding stdint.h consumes when defining the
> uintXX_t types, and so it is time to finally get rid of this entirely.
> 
> So instead of making stdint.h (which comes from the compiler when
> -ffreestanding is set on the command line) agree with the kernel's
> linux/types.h header, avoid the latter entirely in the compilation units
> that actually use the NEON intrinsics (which are always leaf functions
> that are not tightly coupled to kernel APIs).
> 
> Note that the disagreements are about long vs. long long on arm64, and
> long vs. int on 32-bit ARM, so never about types that actually have
> conflicting representations.
> 
> Cc: Christoph Hellwig <hch@lst.de>
> Cc: Eric Biggers <ebiggers@kernel.org>
> Cc: Nathan Chancellor <nathan@kernel.org>
> 
> Ard Biesheuvel (4):
>   lib/crc: Don't include <linux/types.h> in NEON intrinsics code
>   xor: arm/arm64: Move NEON xor_gen() dispatch into the glue code
>   arm64: Drop stdint.h type overrides from asm/neon-intrinsics.h
>   ARM: Drop stdint.h type overrides from asm/neon-intrinsics.h

Who do you think should take this series? It would be nice if it could
start making its way to mainline sooner rather than later since tip of
tree clang builds have been broken for over a month at this point.

-- 
Cheers,
Nathan

