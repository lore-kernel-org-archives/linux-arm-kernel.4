Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC5C2606D824
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 14:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tXyYtLyB;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=EN46cMg4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:Cc:
	To:In-Reply-To:Message-Id:Content-Transfer-Encoding:MIME-Version:Subject:Date
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ZukkpYT3qCCda2Jxa+XkaNLKI/uzan+hwGewF/8rdTw=; b=tXyYtLyBm+SBHt
	Fyk5VGJhUbxBvax6xHv9SHtv1xlZkvLcCy0GJGTGQUFzDSKXFPQ/MfSsWJXdyRO1EPUnmbapYVEWb
	hjQKVfxY1sv3WcjKP4j3zv7Psz53+1EJP1J/cGE46uGyKyC2ClydauMwQHdAYrrY9Rfgj4FQC9RCo
	SitaJ4Q+rLK5u2JdVu9dtEJIK2K+yRi46zxIebRgjUz7YB/V6ZAjQV6EJ6ln89zAm+TejSikHMTY/
	2HVYYoyasb5xMw/VEWp9I+9TqQqnmAgnRx0fMi0FC27vDJoNn6vet788fEo/ncLqa2Dy6iwELeRky
	51j00offE9patJmWedpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPL9a-0000000Ci3c-2aSk;
	Fri, 06 Nov 2026 14:42:54 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPL9Y-0000000Ci2S-0yQw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 14:42:54 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20261106144250euoutp022e1a6a3073d383bd646015487e8568c9~le9JpKhy81199311993euoutp02D;
	Fri,  6 Nov 2026 14:42:50 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20261106144250euoutp022e1a6a3073d383bd646015487e8568c9~le9JpKhy81199311993euoutp02D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1793976170;
	bh=ZukkpYT3qCCda2Jxa+XkaNLKI/uzan+hwGewF/8rdTw=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=EN46cMg4Z5AshlKXcWj6iq9nVx+1cEFRUR3OeEX1SELWiBSHo0MXSd8R+ZRpXPqPo
	 5J9fZGzBi/ektMzl9T564UxSBe3S67f6f+YsOPNBKFF7rocyARFmA/WbDBCKVPMy1l
	 grLUbbLxfYwtJc30nNwsRnyAAGoxoUyejvqHmnV0=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20261106144249eucas1p1ca5f03b764c6305120da3e8b65f76ed1~le9JAlvFx2626526265eucas1p1j;
	Fri,  6 Nov 2026 14:42:49 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261106144247eusmtip1bdfc91f54320939f93a2226da03397ef~le9G89u5c0161401614eusmtip13;
	Fri,  6 Nov 2026 14:42:47 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Fri, 06 Nov 2026 15:42:41 +0100
Subject: [PATCH v2 01/15] lib/decompress_unlz4: use
 LZ4_decompress_safe_partial() before boot
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-lz4-vendor-upstream-v2-1-ee04c3f0d7dc@samsung.com>
In-Reply-To: <20261106-lz4-vendor-upstream-v2-0-ee04c3f0d7dc@samsung.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>,  Nathan Chancellor
	<nathan@kernel.org>,  Nick Desaulniers <ndesaulniers@google.com>,  Bill
	Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,  Russell
	King <linux@armlinux.org.uk>,  Thomas Bogendoerfer
	<tsbogend@alpha.franken.de>,  "James E.J. Bottomley"
	<James.Bottomley@HansenPartnership.com>,  Helge Deller <deller@gmx.de>,
	Heiko Carstens <hca@linux.ibm.com>,  Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>,  Christian Borntraeger
	<borntraeger@linux.ibm.com>,  Sven Schnelle <svens@linux.ibm.com>, Thomas
	Gleixner <tglx@kernel.org>,  Ingo Molnar <mingo@redhat.com>, Borislav Petkov
	<bp@alien8.de>,  Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Minchan Kim <minchan@kernel.org>,  Sergey
	Senozhatsky <senozhatsky@chromium.org>, Jens Axboe <axboe@kernel.dk>, 
	Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linux-s390@vger.kernel.org, 
	linux-block@vger.kernel.org, Yann Collet <yann.collet.73@gmail.com>,  Nick
	Terrell <terrelln@meta.com>, Gao Xiang <xiang@kernel.org>,  Chao Yu
	<chao@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>,  Eric Biggers
	<ebiggers@kernel.org>,  Herbert Xu <herbert@gondor.apana.org.au>,  David
	Laight <david.laight.linux@gmail.com>,  Sungguk <sungguk.na@samsung.com>,
	Jaehoon Chung <jh80.chung@samsung.com>,  Marek Szyprowski
	<m.szyprowski@samsung.com>, linux-erofs@lists.ozlabs.org, 
	linux-f2fs-devel@lists.sourceforge.net, linux-crypto@vger.kernel.org
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1628;
	i=m.wilczynski@samsung.com; h=from:subject:message-id;
	bh=i98BIOEMfPRofAmIfLEP+RTKtUlRGNT17p8zNX3eSM8=;
	b=owGbwMvMwCGWumv6zndzRCIZT6slMWS9fZ6ynW99606dIwL7ulQ6Bbe9jN7M8lqzVe7sNB/dw
	JkrA5JWdZSyMIhxMMiKKbKc3RhtJPmP4Wn58ce/YOawMoEMYeDiFICJrAtn+Kd4oT3eQJe/yUhy
	6odrlWpckv+rc3a+M/rqfupkEZNc9AyG/453bnjdSWxq+LLd5e7mt6pKC87ZPImexDM9MuXEZx3
	FWh4A
X-Developer-Key: i=m.wilczynski@samsung.com; a=openpgp;
	fpr=CDB15B3219FE00E577C7E3FA65BA97B9EE9C1459
X-CMS-MailID: 20261106144249eucas1p1ca5f03b764c6305120da3e8b65f76ed1
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261106144249eucas1p1ca5f03b764c6305120da3e8b65f76ed1
X-EPHeader: CA
X-CMS-RootMailID: 20261106144249eucas1p1ca5f03b764c6305120da3e8b65f76ed1
References: <20261106-lz4-vendor-upstream-v2-0-ee04c3f0d7dc@samsung.com>
	<CGME20261106144249eucas1p1ca5f03b764c6305120da3e8b65f76ed1@eucas1p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_064252_838057_B9B2FB85 
X-CRM114-Status: GOOD (  14.68  )
X-Spam-Score: -2.8 (--)
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The pre-boot decompressor is the only in-tree user of
LZ4_decompress_fast(), which upstream has deprecated since v1.9. It
never checks the input against the chunk length in the header.

Decode with LZ4_decompress_safe_partial() instead, bounded by the chunk
length and by the expected output length. Count every chunk against the
size the image ends with, and fail a chunk that decodes short or comes
after that size is reached.

x86 decompresses in place; the margin arch/x86/boot/header.S reserves,
(output >> 8) + 128K, covers the safe decoder's 32-byte overshoot.

Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 lib/decompress_unlz4.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/lib/decompress_unlz4.c b/lib/decompress_unlz4.c
index c0dbb3cea915eb91d8f4ac26c38c4785bbf19770..dc20c22e087900e21da49f9fcb267e6b511e1072 100644
--- a/lib/decompress_unlz4.c
+++ b/lib/decompress_unlz4.c
@@ -151,14 +151,17 @@ STATIC inline int INIT unlz4(u8 *input, long in_len,
 			}
 		}
 #ifdef PREBOOT
-		if (out_len >= uncomp_chunksize) {
+		if (out_len >= uncomp_chunksize)
 			dest_len = uncomp_chunksize;
-			out_len -= dest_len;
-		} else
+		else
 			dest_len = out_len;
+		out_len -= dest_len;
 
-		ret = LZ4_decompress_fast(inp, outp, dest_len);
-		chunksize = ret;
+		ret = LZ4_decompress_safe_partial(inp, outp, chunksize,
+						  dest_len, dest_len);
+		/* A chunk once the image's stated size is reached is corrupt. */
+		if (!dest_len || ret != (int)dest_len)
+			ret = -1;
 #else
 		dest_len = uncomp_chunksize;
 

-- 
2.34.1


