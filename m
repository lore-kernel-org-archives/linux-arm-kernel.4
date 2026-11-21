Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86ED7606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 19:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qxtnfOJr;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IF9xP7nZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=LI7WNa26rUwyPFniRmupPeMT9Z7ApM/S3vAe0l+cWN4=; b=qxtnfOJrxADCdSqbloyBpWqugR
	bZyrPdSZwcQleRBz0IW+X3we0EeYrsROijEMTk5ex70w+Ew9Yx/tdTELDmCcVjTioDE4cvBMD9vAT
	NGExqSCW7IcEPO8PXmHDG2hDhZrpsjLfdbfS+95UxYhoQnlgbfrQJpQGXjU/6dOASipMpX8SfW4dZ
	nVIm63H85f9ZRaGTLlxN3/mVaE3DjKCOjZxTcKpS+YjLFTivNn2wM4bsLTEmfkp2GxgoBHYUOx6Or
	4mNz2fa0Lan4vuEu7WZEIlg8vrddi3hWmFbPcel/njrNwjJ7hmkpBu4G7EVOrO9++H1BXF5WgGAq3
	oSJQzc5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUr5H-000000008nZ-2r7z;
	Sat, 21 Nov 2026 19:49:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUr5G-000000008nQ-1Iht
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 19:49:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 15DFB40201;
	Sat, 21 Nov 2026 19:49:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C86CF1F000C4;
	Sat, 21 Nov 2026 19:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795290554;
	bh=LI7WNa26rUwyPFniRmupPeMT9Z7ApM/S3vAe0l+cWN4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IF9xP7nZUyHvmr9Ru+MrgEm04EPaED7yzCqJ3NVfVb795vG2CjRxFvsAt2R+CutZ1
	 ACEOuzrbvLVBkTxWV17TFMvnLAqA8bK4xVNfZ2dbtXsHK0ZjoOPAh89F0R2TFJf8Y/
	 Im9OVsMUCTclbaya8crjamWrgTFnNoh7PPlmaYczBCpdVgDX3AfNVgWAiYVwAeF8On
	 GJ9vYVEm+h7bMhleExDhlwukMaGCKmBxMsV54xILv/Vq5QCq/jzBV/tHkx1MhYy9vY
	 RWtXlYfJmxAe9LyetAW/S7yogKhzMAELZEqEQyw1a793ZZOpazF5juv0trRVGdyKfK
	 hITParLlL9q4Q==
Date: Sat, 21 Nov 2026 11:49:12 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-arm-kernel@lists.infradead.org,
	Emanuele Rocca <emanuele.rocca@arm.com>
Subject: Re: [PATCH] lib/crypto: arm64/sm3: Use assembler for sm3 instructions
Message-ID: <20261121194912.GB1975@quark>
References: <20261114211019.80609-1-ebiggers@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261114211019.80609-1-ebiggers@kernel.org>
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
X-Spam-Status: No, score=-20.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, Nov 14, 2026 at 01:10:19PM -0800, Eric Biggers wrote:
> All supported assemblers (binutils 2.30 and later, and clang 17.0.1 and
> later) support the sm3 instructions now.
> 
> Therefore, drop the use of '.inst' in sm3-ce-core.S and just have the
> assembler generate the instructions.
> 
> This requires adding '.arch armv8.2-a+sm4'.  (Yes, the assemblers want
> sm4, not sm3.)  I also tried just '.arch_extension sm4', but that
> doesn't work with binutils 2.40 and earlier because they consider sm3 to
> depend on armv8.2-a or later (and this file isn't built with
> -march=armv8.2-a or later).  This was fixed in binutils 2.41 commit
> 205e4380c800, but the kernel currently supports binutils 2.30 and later.
> 
> No change in the resulting .text section with either binutils or clang.
> 
> Signed-off-by: Eric Biggers <ebiggers@kernel.org>
> ---
> 
> This patch is intended to be taken through libcrypto-next
> 
>  lib/crypto/arm64/sm3-ce-core.S | 41 +++++++---------------------------
>  1 file changed, 8 insertions(+), 33 deletions(-)

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git/log/?h=libcrypto-next

- Eric

