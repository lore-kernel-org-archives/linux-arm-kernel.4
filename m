Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEFE1606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 19:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JTlQSS9E;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d8i9iwWh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=FNfXUEFx3KNT9v+Ggjhv1AJgo4iO4cxlU3+LWs139EA=; b=JTlQSS9EJuRsDlcT8rHWfpUS8v
	WH1drQC3G8tgYgvJ2gXpVEisPLgPgmJxeyqAlIl/jgFvYYH2/CcT8rzoUyWohG8GRwt9/d50NwpeE
	ZbzzQJnELjMlaID3lnRPdK32L0jgUfYknbMyVZ4bwB+dcKES8imCNS5uDxN1XsSrjbaxAfj38ppz+
	itWtR0WDdXtvTIQgKRs0Y76lAFrwptiD42/b0s09+VHS63PFiliWBf2jCkl36q8j90ohwIEUf24ta
	g1GIYy89HtHJ+SRCtI9IQLTnIwjnFu9vZbp5vS4jHfNEeY6NB3vb6WNdY1EV4HhBqfU/WravzbMPe
	hDy0kwaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUr4u-000000008kt-2Poy;
	Sat, 21 Nov 2026 19:48:52 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUr4t-000000008kj-3t3f
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 19:48:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 719B242476;
	Sat, 21 Nov 2026 19:48:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 312521F000C4;
	Sat, 21 Nov 2026 19:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795290531;
	bh=FNfXUEFx3KNT9v+Ggjhv1AJgo4iO4cxlU3+LWs139EA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=d8i9iwWhKUrtlzrHSH6shNv9LBfChh904fuPTtPeiqY9a/UF4mFNadbFpbk23C9kc
	 yIsDDxInuo90Vbt0bC9YEcXQVUe7KWuUyuo98vEOpQinoOZEW2f+1MVHvWT+kllNxD
	 UpNGUC3UC4tiyFahUKidWeW8b0aCgNZm9eEpnRoQx4Q2UooczheB/g1S8gb2r7Y9Aq
	 r4ImUXYDH2OfF0nKvcA0yWYovpnMLBcJTDCy5kRePatojc5Rc+zXIztKB/e8xf3lj9
	 WRF955jj/ydurO5gw6eicj6ccM8nP2iVN991S5dSDtRkweCccv6pMIqmpWmWsL+sMc
	 5NjFg9tgEzE0w==
Date: Sat, 21 Nov 2026 11:48:49 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-arm-kernel@lists.infradead.org,
	Emanuele Rocca <emanuele.rocca@arm.com>
Subject: Re: [PATCH] lib/crypto: arm64/sha3: Use assembler for sha3
 instructions
Message-ID: <20261121194849.GA1975@quark>
References: <20261114204245.67919-1-ebiggers@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261114204245.67919-1-ebiggers@kernel.org>
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

On Sat, Nov 14, 2026 at 12:42:45PM -0800, Eric Biggers wrote:
> All supported assemblers (binutils 2.30 and later, and clang 17.0.1 and
> later) support the sha3 instructions now.
> 
> Therefore, drop the use of '.inst' in sha3-ce-core.S and just have the
> assembler generate the instructions.
> 
> This requires adding '.arch armv8.2-a+sha3'.  I also tried just
> '.arch_extension sha3', but that doesn't work with binutils 2.40 and
> earlier because they consider sha3 to depend on armv8.2-a or later (and
> this file isn't built with -march=armv8.2-a or later).  This was fixed
> in binutils 2.41 commit 205e4380c800, but the kernel currently supports
> binutils 2.30 and later.
> 
> Also prefix the immediate operands to 'xar' with '#', now that they no
> longer need to be plain numbers to generate an .inst.  This isn't
> required, but it follows the standard convention for immediates in arm64
> assembly, including elsewhere in the same file.
> 
> No change in the resulting .text section with either binutils or clang.
> 
> Signed-off-by: Eric Biggers <ebiggers@kernel.org>
> ---
> 
> This patch is intended to be taken through libcrypto-next
> 
>  lib/crypto/arm64/sha3-ce-core.S | 73 ++++++++++++---------------------
>  1 file changed, 26 insertions(+), 47 deletions(-)

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git/log/?h=libcrypto-next

- Eric

