Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A6E606A898
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 22:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Evu9K1vH;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H2HTk8rO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=/29Fh1u2FOm5/5k1pmwlztbcmx561O6eu158ApMSsyU=; b=Evu9K1vHAzYPv/uyFknSxqNVH3
	UagUef1a9wAeioh0JnQfDUcgzFLpf0iWfQ5M0hjVciJq+1dc1qaG36DI+fAXA/AhFihyPHCF1xO2q
	seI5AQU3TT3PlUnJ8omD4kM9JEMW7KWSQNwrND0LeBJX/9OHQu1BlvGj3/1TIgP/fp4buNfEbcZ3L
	Kew/Di1aerA+Ub1X7mlJcJUZXawNrFqs8xNALQ89NfLqQJMX6XSP4O6Z1erkr1RSs8PPf7xjXM0Ff
	xshkZT5n/Tz1LiYXhNNwYiL6ehR0VHetu8JLKsl3/OF/n/IFWrybHfuDONyhAaI2+pOqYm63HFpvj
	lKCBQ8fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRGPN-00000007tPV-1O0E;
	Wed, 11 Nov 2026 22:03:09 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRGPM-00000007tPC-0V96
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 22:03:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2040261D2C;
	Wed, 11 Nov 2026 22:03:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2E751F00A05;
	Wed, 11 Nov 2026 22:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794434586;
	bh=/29Fh1u2FOm5/5k1pmwlztbcmx561O6eu158ApMSsyU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=H2HTk8rOLZgWw9Lm2uB8it44XJGQ1VP252zKM3Vsl27YeQT3fQC/oPf+9dR1GGuPe
	 fTrdVHJg83sazuCLRwsK7FMBmZ65BjYmx/5l1Fr9V4zrWbVX2E4c/EGrAZHOJ23iP5
	 K6oVJy3Ue6XdepxFi87RWoq3TdzVK9qDLL8BM8XMCz9n7H3pjJ8s2COHz+NjnFIDwg
	 2eGJ+4dbOKk2dBpxqBDuRpXAU1slNtJxbA2Dkar3W/730CiqV+uxXwdTMmafxIRXoH
	 hanK6KHxVmWrohkzaChiP47GtgTq+nQUar+jL+4xWJclsB1e8afff/e4uoWiQs4JB9
	 jrQrJYXOzTbWA==
Date: Wed, 11 Nov 2026 23:02:51 +0100
From: Gao Xiang <xiang@kernel.org>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Russell King <linux@armlinux.org.uk>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>, Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Minchan Kim <minchan@kernel.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Jens Axboe <axboe@kernel.dk>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org, linux-s390@vger.kernel.org,
	linux-block@vger.kernel.org, Yann Collet <yann.collet.73@gmail.com>,
	Nick Terrell <terrelln@meta.com>, Gao Xiang <xiang@kernel.org>,
	Chao Yu <chao@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>,
	Eric Biggers <ebiggers@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	David Laight <david.laight.linux@gmail.com>,
	Sungguk <sungguk.na@samsung.com>,
	Jaehoon Chung <jh80.chung@samsung.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	linux-erofs@lists.ozlabs.org,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-crypto@vger.kernel.org
Subject: Re: [PATCH v2 12/15] lib/lz4: widen LZ4_DECOMPRESS_INPLACE_MARGIN
 for the fast decode loop
Message-ID: <avTmC_1I59FKA1FN@MacBookPro.fritz.box>
Mail-Followup-To: Michal Wilczynski <m.wilczynski@samsung.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Russell King <linux@armlinux.org.uk>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>, Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Minchan Kim <minchan@kernel.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Jens Axboe <axboe@kernel.dk>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org, linux-s390@vger.kernel.org,
	linux-block@vger.kernel.org, Yann Collet <yann.collet.73@gmail.com>,
	Nick Terrell <terrelln@meta.com>, Gao Xiang <xiang@kernel.org>,
	Chao Yu <chao@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>,
	Eric Biggers <ebiggers@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	David Laight <david.laight.linux@gmail.com>,
	Sungguk <sungguk.na@samsung.com>,
	Jaehoon Chung <jh80.chung@samsung.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	linux-erofs@lists.ozlabs.org,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-crypto@vger.kernel.org
References: <20261106-lz4-vendor-upstream-v2-0-ee04c3f0d7dc@samsung.com>
 <CGME20261106144309eucas1p2a9bfcc1cf81779d473fb073e7d9139b7@eucas1p2.samsung.com>
 <20261106-lz4-vendor-upstream-v2-12-ee04c3f0d7dc@samsung.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261106-lz4-vendor-upstream-v2-12-ee04c3f0d7dc@samsung.com>
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Michal,

On Fri, Nov 06, 2026 at 03:42:52PM +0100, Michal Wilczynski wrote:
> erofs decompresses a pcluster in place when the slack after the output
> is at least LZ4_DECOMPRESS_INPLACE_MARGIN(compressed size), upstream's
> (compressedSize >> 8) + 32.
> 
> That holds for the fork, which overshoots its output by at most 8
> bytes. Upstream's LZ4_FAST_DEC_LOOP, which the next patch brings in for
> x86 and arm64, copies in 32-byte steps and can overwrite input it has
> not read yet: of 172410 valid streams laid out as erofs does at exactly
> that margin, 3660 fail to decode, none with the fork. The worst needs
> (compressedSize >> 8) + 33. Images mkfs.erofs built did not hit this,
> but nothing in the format rules it out.
> 
> Use (compressedSize >> 8) + (compressedSize >> 15) + 36, which takes a
> 4K pcluster's margin from 48 to 52 bytes. Upstream's lz4.h defines the
> macro too, so undefine it first.
> 
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>

First, I really think kernel LZ4 should be updated for many years, so
thanks for this!

But my personal thought is that could you just fold this patch into
the next one ("lib/lz4: switch the decompressor to the vendored sources")?
Because this one should be part of the fast loop update.

Although the current patch order is also fine, but my potential concern
is that people don't know the details maybe pick the random ones for
backporting, which is what I'd like to avoid so I hope this patch could
be just part of it, otherwise the inplace decompression could be broken.

Thanks,
Gao Xiang

