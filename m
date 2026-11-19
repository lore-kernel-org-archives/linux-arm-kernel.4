Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD8A660A260A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 10:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TANUq7XV;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=ngY7agX8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=8r8tiXdG1EXIMaxQR5APcNuE1bo5BJirn9lWOpCi1tw=; b=TANUq7XV03Tqcp
	4UoQpE3yzsvg6PW68NRTMc/dq4CQfwgCyHLD8NTuEPPnkNaSQBxFHImAwXeBTJBrCo/3XC0d1NqBi
	CcLway12DH4C1kU6xqhDCWM1tV9PGF2J/Mdvaz2DAR9HFxmm9BrDffi1FFfRy+zJ7a4ZTv1qN2FIB
	DJmG10M9cZFScCXBjgOzDE0dRyMh6YkSGIJNwPs5KBRO/8a2KLMzb+fYkCe1GnXxY00lHIZZx1D8Z
	l488wZ8d4Ui6YMpwuhKCkl5VSjz5KxhabgZSvBpdzE4hwWBNwi/oLYTp/oKTrLqyfTzOpLBSjyNQi
	Frd9TQgRltC8TsQAnEFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTzqX-0000000Bcso-10En;
	Thu, 19 Nov 2026 10:58:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTzqS-0000000Bcpf-1drj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 10:58:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B1D1F1575;
	Thu, 19 Nov 2026 02:58:20 -0800 (PST)
Received: from gaia.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D526D3F673;
	Thu, 19 Nov 2026 02:58:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795085903; bh=pe4EV1QOr5xk+JHbmfciYoro1feJcKk+4rYD3gTII9o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ngY7agX8gN1NeAaDRB1rCm/aHkF76DvMsGPOQAY3cIrOO/gULycnAcgJfhKmNdYgz
	 gBoAlPjd/ZEZd6Q0EswY6Lc7cmKjHl4KWk2xewL5oqTiRKMtU48hRl+cv46B47owPd
	 JigKITBwhGBY+6cgsEwL+U4I7xhdZ6RgzAs1O0cU=
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-kbuild@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org,
	Ard Biesheuvel <ardb+git@google.com>
Cc: Will Deacon <will@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Christoph Hellwig <hch@lst.de>,
	Eric Biggers <ebiggers@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Song Liu <song@kernel.org>,
	Yu Kuai <yukuai@fygo.io>
Subject: Re: (subset) [PATCH 0/4] Get rid of all NEON intrinsics stdint.h type hacks
Date: Thu, 19 Nov 2026 10:51:16 +0000
Message-ID: <179508547602.2557572.9682726373932810888.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261029135020.272082-6-ardb+git@google.com>
References: <20261029135020.272082-6-ardb+git@google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_025824_486758_3311C8E6 
X-CRM114-Status: GOOD (  15.62  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 29 Oct 2026 14:50:20 +0100, Ard Biesheuvel wrote:
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
> [...]

Applied the first three patches to arm64 (for-next/fixes), thanks! I
also added a cc stable, though it won't be a straightforward
cherry-pick. I left the last patch out, IIUC it's just clean-up rather
than fixing a problem on arm32 and can go separately via Russell's tree
during the next merge window (let me know if you think otherwise).

(cc'ed the md maintainers for their information as the patches touch
their code)

[1/4] lib/crc: Don't include <linux/types.h> in NEON intrinsics code
      https://git.kernel.org/arm64/c/ff049836f05f
[2/4] xor: arm/arm64: Move NEON xor_gen() dispatch into the glue code
      https://git.kernel.org/arm64/c/14e346032143
[3/4] arm64: Drop stdint.h type overrides from asm/neon-intrinsics.h
      https://git.kernel.org/arm64/c/a041bdbe1f3a

