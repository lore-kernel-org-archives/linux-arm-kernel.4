Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CDA2606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 12:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uzvjqGDI;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=res/twsR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=I9X4XD5ud4JHTzb58pE9cFq0Gp7fU1CTG2I9JiABR6U=; b=uzvjqGDIQM0WNU
	irn2eT5s+4t4heYtQUwXCs4LsH8tcSi7W6omh32D7fl3TOAomBBS+8Q4uvNxXTybPdM/z6wewWI9Z
	7u96Lkk+A1eh+rUqJ+Gs6J3mM+5dj805N1L1M51Ym/V2d/mCFd0m5h85eetrydIPPkXmnh5DUmvqx
	Uc55t6/d/mHxMyHHX15dRhw6R27lg98YyaSblAri57qRz6bmJ2sbQFK+Sh8vu5CLPOs7OlSOk1Hyj
	s6raBOv0HGjL0nW05d2qCtHeX2LOsg4KH3u5C6sG3sh7gZ+Ol/s+vQ+ZmPDf3RiGdUMEXLA3RzxHc
	xbVnEu19GeiROxMBo+QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRU6s-00000009uT3-0Mqb;
	Thu, 12 Nov 2026 12:40:58 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRU6m-00000009uRQ-32oj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 12:40:56 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20261112124042euoutp01e70ce1178d26db6b7c248a8e4494b386~nTKOYIdlg2545925459euoutp01N;
	Thu, 12 Nov 2026 12:40:42 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20261112124042euoutp01e70ce1178d26db6b7c248a8e4494b386~nTKOYIdlg2545925459euoutp01N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1794487242;
	bh=I9X4XD5ud4JHTzb58pE9cFq0Gp7fU1CTG2I9JiABR6U=;
	h=Date:Subject:To:From:In-Reply-To:References:From;
	b=res/twsRekcb00rl0hpigdDQU49wJT9sewqF9AZUfNVtehuVCXJxiXNmMChvBTE4G
	 eET/M3Ndk/cN+pz1L0w+/FpjnaGKptZRpIyBuWJJY/P+4a8RF1Bcj0RGmLHmGYIVpi
	 4s1s/PiyRviToazDh7OQfOe5aoNIe42v3Wv4p1io=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20261112124041eucas1p2e0fefb8eb4e504a6bbf86fc3bbd57b3b~nTKOBqqaA1051410514eucas1p21;
	Thu, 12 Nov 2026 12:40:41 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261112124039eusmtip15ffbafa2efefdb32bf4f0155ad33cff7~nTKMZv7ec1174711747eusmtip1g;
	Thu, 12 Nov 2026 12:40:39 +0000 (GMT)
Message-ID: <52c54fdf-0879-4dda-9eac-822180f811bc@samsung.com>
Date: Thu, 12 Nov 2026 13:40:39 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/15] lib/lz4: widen LZ4_DECOMPRESS_INPLACE_MARGIN
 for the fast decode loop
To: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers
	<ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, Justin Stitt
	<justinstitt@google.com>, Russell King <linux@armlinux.org.uk>, Thomas
	Bogendoerfer <tsbogend@alpha.franken.de>, "James E.J. Bottomley"
	<James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, Heiko
	Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Alexander
	Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger
	<borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, Thomas
	Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
	<bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Minchan Kim <minchan@kernel.org>, Sergey
	Senozhatsky <senozhatsky@chromium.org>, Jens Axboe <axboe@kernel.dk>, Andrew
	Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
	linux-s390@vger.kernel.org, linux-block@vger.kernel.org, Yann Collet
	<yann.collet.73@gmail.com>, Nick Terrell <terrelln@meta.com>, Gao Xiang
	<xiang@kernel.org>, Chao Yu <chao@kernel.org>, Jaegeuk Kim
	<jaegeuk@kernel.org>, Eric Biggers <ebiggers@kernel.org>, Herbert Xu
	<herbert@gondor.apana.org.au>, David Laight <david.laight.linux@gmail.com>,
	Sungguk <sungguk.na@samsung.com>, Jaehoon Chung <jh80.chung@samsung.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>, linux-erofs@lists.ozlabs.org,
	linux-f2fs-devel@lists.sourceforge.net, linux-crypto@vger.kernel.org
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <avTmC_1I59FKA1FN@MacBookPro.fritz.box>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20261112124041eucas1p2e0fefb8eb4e504a6bbf86fc3bbd57b3b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261106144309eucas1p2a9bfcc1cf81779d473fb073e7d9139b7
X-EPHeader: CA
X-CMS-RootMailID: 20261106144309eucas1p2a9bfcc1cf81779d473fb073e7d9139b7
References: <20261106-lz4-vendor-upstream-v2-0-ee04c3f0d7dc@samsung.com>
	<CGME20261106144309eucas1p2a9bfcc1cf81779d473fb073e7d9139b7@eucas1p2.samsung.com>
	<20261106-lz4-vendor-upstream-v2-12-ee04c3f0d7dc@samsung.com>
	<avTmC_1I59FKA1FN@MacBookPro.fritz.box>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_044053_035196_9868B197 
X-CRM114-Status: GOOD (  22.53  )
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/11/26 23:02, Gao Xiang wrote:
> Hi Michal,
> 
> On Fri, Nov 06, 2026 at 03:42:52PM +0100, Michal Wilczynski wrote:
>> erofs decompresses a pcluster in place when the slack after the output
>> is at least LZ4_DECOMPRESS_INPLACE_MARGIN(compressed size), upstream's
>> (compressedSize >> 8) + 32.
>>
>> That holds for the fork, which overshoots its output by at most 8
>> bytes. Upstream's LZ4_FAST_DEC_LOOP, which the next patch brings in for
>> x86 and arm64, copies in 32-byte steps and can overwrite input it has
>> not read yet: of 172410 valid streams laid out as erofs does at exactly
>> that margin, 3660 fail to decode, none with the fork. The worst needs
>> (compressedSize >> 8) + 33. Images mkfs.erofs built did not hit this,
>> but nothing in the format rules it out.
>>
>> Use (compressedSize >> 8) + (compressedSize >> 15) + 36, which takes a
>> 4K pcluster's margin from 48 to 52 bytes. Upstream's lz4.h defines the
>> macro too, so undefine it first.
>>
>> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> 
> First, I really think kernel LZ4 should be updated for many years, so
> thanks for this!
> 
> But my personal thought is that could you just fold this patch into
> the next one ("lib/lz4: switch the decompressor to the vendored sources")?
> Because this one should be part of the fast loop update.
> 
> Although the current patch order is also fine, but my potential concern
> is that people don't know the details maybe pick the random ones for
> backporting, which is what I'd like to avoid so I hope this patch could
> be just part of it, otherwise the inplace decompression could be broken.
> 

Make sense I'll fold it into the decompressor switch in v3 so the
wider margin and the fast loop can't be picked up separately.

Thanks for the review and the kind words

Best regards,
-- 
Michal Wilczynski <m.wilczynski@samsung.com>

