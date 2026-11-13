Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8269606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 20:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RH6L7746;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BeNe79yK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=S62Apjunl/OYf6dm8P9jYppCwO2i0AlqtAXpPuIIy9U=; b=RH6L7746ufHxRCkEZ2sNVe3aAz
	mNlfjqS4sqmJ9pJx+2pTd+fXR9iWMFhGo8118HQ7lcE7YToHAF9QZqB/oPq6Z0eWvqc3hxv9VIV9S
	YUZ4FmczET9GPXpvQ+Lc0j2M7tuo18q8LqWmsepKJC35wOo6QPUrSiEY8F1UMjsWeAVVVcwqH33Y3
	2HBKEkkGZBzQxizV3subj3qZTGP50iTF8T+aAlkLQ/RwSD2udgb5Oqpbyko3bNc0sLtuMbaoEKtZc
	YSKmHjJVPL/l8187ZBOw5IPFW5ldE0DRLeo3V5bC5DS9GYrwizKffyrHdP4cIPej/icwRhVFY+J4C
	PfkG5xkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRxuV-0000000EPnt-1R0L;
	Fri, 13 Nov 2026 20:30:11 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRxuU-0000000EPmk-1NS7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 20:30:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4FC7362388;
	Fri, 13 Nov 2026 20:30:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD4861F000C4;
	Fri, 13 Nov 2026 20:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794601809;
	bh=S62Apjunl/OYf6dm8P9jYppCwO2i0AlqtAXpPuIIy9U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BeNe79yKfO6VaeGdZVaILyXJXkxXK6N+jGXDa52kSZYaVeBsB4+hF8tfBAwWaFFkj
	 IJMQAQcuXAWgQnga4ifLDbBhPfw/DSAU0VvYysoCPZd8nBQXc//IyKKo0Twx6lH1JI
	 SUM6AK1lCqCh/dgIaA2ESjvDzrRug8fgi5HN1wnG4ougE8Gq9+r/IjETQ9ZeHrVUVD
	 NDz4r5m6D/MwygzvI8v1cMOMbSPAj0S1+s+fu3hBeWHNQRX1fThTL9umlJJXHT28jj
	 PWDKfeouNOa58I1CUd6TTE5AmqyVJYLDzlpi8LXEdF5u7UuOQVDbTxU8DJ3akZOYcw
	 LH7eQI39LCr6A==
Date: Fri, 13 Nov 2026 12:30:07 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, linux-kbuild@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 0/4] Get rid of all NEON intrinsics stdint.h type hacks
Message-ID: <20261113203007.GB29151@quark>
References: <20261029135020.272082-6-ardb+git@google.com>
 <20261112222720.GA188816@ax162>
 <bc58b973-3d54-4480-aaaa-f5d5269418ea@app.fastmail.com>
 <20261113190150.GA2857474@ax162>
 <b7f72b97-6e8e-4b07-a2a1-6ac8c6e596e4@app.fastmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b7f72b97-6e8e-4b07-a2a1-6ac8c6e596e4@app.fastmail.com>
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

On Fri, Nov 13, 2026 at 09:05:32PM +0100, Ard Biesheuvel wrote:
> (cc Catalin)
> 
> Full thread:
> https://lore.kernel.org/all/20261029135020.272082-6-ardb+git@google.com/
> 
> On Fri, 13 Nov 2026, at 20:01, Nathan Chancellor wrote:
> > On Fri, Nov 13, 2026 at 09:23:03AM +0100, Ard Biesheuvel wrote:
> >> On Thu, 12 Nov 2026, at 23:27, Nathan Chancellor wrote:
> >> > Who do you think should take this series? It would be nice if it could
> >> > start making its way to mainline sooner rather than later since tip of
> >> > tree clang builds have been broken for over a month at this point.
> >> >
> >> 
> >> Are the first two patches sufficient for that? Perhaps Eric can take them
> >> through the CRC or libcrypto trees, and I can send the remaining ones
> >> through the respective arch trees the following cycle.
> >
> > Unfortunately not :/ we need the third patch to resolve the error since
> > that is where the conflict is originating.
> >
> 
> OK in that case, maybe Catalin can take the whole thing via the arm64 tree? 
> 
> 
> 
> Diffstat:
> 
> Ard Biesheuvel (4):
>   lib/crc: Don't include <linux/types.h> in NEON intrinsics code
>   xor: arm/arm64: Move NEON xor_gen() dispatch into the glue code
>   arm64: Drop stdint.h type overrides from asm/neon-intrinsics.h
>   ARM: Drop stdint.h type overrides from asm/neon-intrinsics.h
> 
>  Documentation/arch/arm/kernel_mode_neon.rst | 10 +++--
>  arch/arm/include/asm/neon-intrinsics.h      | 43 +++-----------------
>  arch/arm64/include/asm/neon-intrinsics.h    | 24 +++--------
>  lib/crc/crc64-neon.c                        | 10 ++---
>  lib/raid/xor/arm/xor-neon-glue.c            |  3 ++
>  lib/raid/xor/arm/xor-neon.h                 | 16 +++++++-
>  lib/raid/xor/arm64/xor-eor3.c               | 15 ++-----
>  lib/raid/xor/arm64/xor-neon-glue.c          |  5 +++
>  lib/raid/xor/arm64/xor-neon.h               | 31 ++++++++++++--
>  lib/raid/xor/xor-neon.c                     | 16 ++------
>  10 files changed, 78 insertions(+), 95 deletions(-)

I agree the arm64 tree makes the most sense for cross-subsystem arm and
arm64 infrastructure changes like this.

- Eric

