Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47FE4606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 05:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uDoBo09y;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YXeiifdf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=mGkb+EjOSlLHs2Hp50X4VPuLXnV4T0Mq79/QyiPYW5E=; b=uDoBo09yBFBWNozz/4OEpXFVCL
	dyrfWYR0wv/e7Vokbu4MtfV5B4/QKzJJyFvCyZRlrhX1yRILXwDGJB4RV2ZlKX2dUoIRePAVW+8zr
	NdGxl7ZdZbvhhB5lMxt/zBAYUm1pVyr3KSSUuK7oNHTSeNG6NHHl3k+7eug3skgOjgiPimQZlps03
	LTlUEiONAKRZ8LxpFLRbIrjSalg4KNtwbji6N7zmz+LpKyxNq5/Aky2A4AUF6ix9pQzwB54birawY
	K7BH7essDJ9odPBd9H5zmu4AW9gB846Bj5qR3GAfXlofUmNw/Y7HW6cqPUSqavZggd2m55D1XqCgX
	EqdKqDHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTXtr-00000007jZW-0Ljq;
	Wed, 18 Nov 2026 05:08:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTXtp-00000007jZQ-3SVj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 05:08:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 43BC0403A3;
	Wed, 18 Nov 2026 05:08:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 675D71F000C4;
	Wed, 18 Nov 2026 05:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794978481;
	bh=mGkb+EjOSlLHs2Hp50X4VPuLXnV4T0Mq79/QyiPYW5E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YXeiifdf0c/VhG5hMZSwUNR54qAqBFdaXyJZbh5XcO/2sqRss6CDwRKOn3GvreXYA
	 N8sol7JhMY1rQdccZSTvUitx5wYvboW86yXgWSWAqMyOJFFfLQaulb3z3D+J1KKGNj
	 KDMuYXlqz5Q94NnaURODLkdhuwDGTuqKRTVpXT3y3saAU73g2ANCWZTuKGPqc7N+23
	 Q8zu1NrpoUOL6Gvlb3JNFhApR/lkmZ4+eUo6/6hPvi61HJLTfYG85N7R02b51F/fjT
	 iEBaFvS4e9nIPbqwTLRgJSI+dEhsnuXdSkDG8vMrQvHYn8169Rt/V6pDb5vdckAerd
	 hjtaO/DrnzNPA==
Date: Tue, 17 Nov 2026 21:07:58 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Dylan Hatch <dylanbhatch@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S . Miller" <davem@davemloft.net>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Weinan Liu <wnliu@google.com>, Jens Remus <jremus@linux.ibm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org, linux-crypto@vger.kernel.org,
	llvm@lists.linux.dev, Josh Poimboeuf <jpoimboe@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Indu Bhagat <ibhagatgnu@gmail.com>,
	Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
	live-patching@vger.kernel.org
Subject: Re: [RFC PATCH 11/12] arm64, crypto/lib: annotate leaf functions
 with CFI info
Message-ID: <20261118050758.GD3400@sol>
References: <20261117043504.1021063-1-dylanbhatch@google.com>
 <20261117043504.1021063-12-dylanbhatch@google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261117043504.1021063-12-dylanbhatch@google.com>
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

On Tue, Nov 17, 2026 at 04:35:03AM +0000, Dylan Hatch wrote:
> Several arm64 assembly functions are leaf functions (they do not call
> other functions and do not modify x30). Add SYM_[TYPED_]LEAF_FUNC_*
> macros in <asm/linkage.h> that emit .cfi_startproc / .cfi_endproc so
> that .eh_frame entries are generated for these leaf functions and LR can
> be recovered by the unwinder when an exception is taken from one of
> them.
> 
> Signed-off-by: Dylan Hatch <dylanbhatch@google.com>
> ---
>  arch/arm64/crypto/aes-ce-ccm-core.S    | 12 +++----
>  arch/arm64/crypto/aes-neonbs-core.S    | 16 +++++-----
>  arch/arm64/crypto/ghash-ce-core.S      | 20 ++++++++----
>  arch/arm64/crypto/sm4-ce-ccm-core.S    | 16 +++++-----
>  arch/arm64/crypto/sm4-ce-cipher-core.S |  4 +--
>  arch/arm64/crypto/sm4-ce-core.S        | 44 +++++++++++++-------------
>  arch/arm64/crypto/sm4-ce-gcm-core.S    | 16 +++++-----
>  arch/arm64/crypto/sm4-neon-core.S      | 12 +++----
>  arch/arm64/include/asm/linkage.h       | 33 +++++++++++++++++++
>  arch/arm64/kernel/entry.S              |  7 ----
>  arch/arm64/lib/clear_user.S            |  4 +--
>  arch/arm64/lib/copy_from_user.S        |  4 +--
>  arch/arm64/lib/copy_page.S             |  4 +--
>  arch/arm64/lib/copy_to_user.S          |  4 +--
>  arch/arm64/lib/memchr.S                |  4 +--
>  arch/arm64/lib/memcmp.S                |  4 +--
>  arch/arm64/lib/memcpy.S                |  8 ++---
>  arch/arm64/lib/memset.S                |  8 ++---
>  arch/arm64/lib/mte.S                   | 28 ++++++++--------
>  arch/arm64/lib/strchr.S                |  4 +--
>  arch/arm64/lib/strcmp.S                |  4 +--
>  arch/arm64/lib/strlen.S                |  4 +--
>  arch/arm64/lib/strncmp.S               |  4 +--
>  arch/arm64/lib/strnlen.S               |  4 +--
>  arch/arm64/lib/strrchr.S               |  4 +--
>  arch/arm64/lib/tishift.S               | 12 +++----

Presumably you'll need to update lib/crypto/arm64/*.S and
lib/crc/arm64/*.S as well.

- Eric

