Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74B96606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 14:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uqNGfKEN;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=vQL1Kemy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:Cc:
	To:In-Reply-To:Message-Id:Content-Transfer-Encoding:MIME-Version:Subject:Date
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=6rJNUO6E54sMvUs2WMIZbbBsdevweP1GURHzVXhYi9c=; b=uqNGfKENeZH+OT
	c8bqVul5/fy1lyLskRkzLLEv3Iq+YYwI8eEfHL7hv5I7LLnLuoj1DUm84gxi50mv9V2TLSZa3Lzvf
	/GZe8dqWirUSdf+zawRb8UcxtRSCxAttmqyBdUnnn6zAjzmL5A3N+kg5z8tLbEEqUx9cWHaPp1ea8
	AQHt0BfkpPdQl2uDLK64JtpMcdr6R7mf1o6YQkevBKqorL8vR+t3Y2zB3T79qnukVo6BZjIuSBu0I
	exhcYsh77KHYeSTiNQUKb1IWOOkpDIDNsgkXGi/06lwy3CJAEGWKHVBl5bE6sKy45PYMhubAeZc4Y
	R21kvqlALTqpzOB0q9AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPL9n-0000000CiEd-2ths;
	Fri, 06 Nov 2026 14:43:07 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPL9i-0000000Ci9M-1r0z
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 14:43:03 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20261106144300euoutp022fe9ba632879a263b59dd1be5c370c27~le9Tgddn21426614266euoutp02X;
	Fri,  6 Nov 2026 14:43:00 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20261106144300euoutp022fe9ba632879a263b59dd1be5c370c27~le9Tgddn21426614266euoutp02X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1793976180;
	bh=6rJNUO6E54sMvUs2WMIZbbBsdevweP1GURHzVXhYi9c=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=vQL1KemyUL/i8iZISuvadb7LjWhfk9xrjaC2sDcM8Owe+O9RHy1wFufNoIOF94jcf
	 p0JVcTX5g5tl+FMQDx9m1nv0Tf+LPOvYWUH9EP9PPWO7X7w1rERwDHFqKFiq4V0yTk
	 PQ3uwEgwyYh+n8/Yo016rsYHh9MLBaxuU9NrIFjU=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20261106144259eucas1p27d26efbc44beac102c03ec07ebed4310~le9SqiDiy1206212062eucas1p2V;
	Fri,  6 Nov 2026 14:42:59 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261106144258eusmtip1a717ab7164c31bdd835911116d976388~le9RHsKmV0111901119eusmtip1_;
	Fri,  6 Nov 2026 14:42:58 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Fri, 06 Nov 2026 15:42:47 +0100
Subject: [PATCH v2 07/15] lib/lz4: backport upstream's match length limit
 fix
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-lz4-vendor-upstream-v2-7-ee04c3f0d7dc@samsung.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2240;
	i=m.wilczynski@samsung.com; h=from:subject:message-id;
	bh=FeGwjLLCi9r5jO0sT4c2oOMQI6pybsCaTl5iiV1XLg0=;
	b=owGbwMvMwCGWumv6zndzRCIZT6slMWS9fZ56U0Pa67C9pl5js81Djt4t++e+Y9b7J3lW8Y3NG
	r1sg6NpHaUsDGIcDLJiiixnN0YbSf5jeFp+/PEvmDmsTCBDGLg4BWAi79MZGWakV6Uz+5RNvHEk
	zKojQjHywl3bTtHiJs+mSS+WF12fZsHwTzdo44JtE7fGf1/aYSV3LyD68iubAoVt21jaD0zI/xv
	xkw8A
X-Developer-Key: i=m.wilczynski@samsung.com; a=openpgp;
	fpr=CDB15B3219FE00E577C7E3FA65BA97B9EE9C1459
X-CMS-MailID: 20261106144259eucas1p27d26efbc44beac102c03ec07ebed4310
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261106144259eucas1p27d26efbc44beac102c03ec07ebed4310
X-EPHeader: CA
X-CMS-RootMailID: 20261106144259eucas1p27d26efbc44beac102c03ec07ebed4310
References: <20261106-lz4-vendor-upstream-v2-0-ee04c3f0d7dc@samsung.com>
	<CGME20261106144259eucas1p27d26efbc44beac102c03ec07ebed4310@eucas1p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_064302_758660_71BC6188 
X-CRM114-Status: GOOD (  16.13  )
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

v1.10.0 lets a match length's extension bytes run to four bytes before
the end of the block, which leaves room for only a token and three
literals where the format requires five. The fork rejected such blocks,
v1.10.0 decodes them: 1f 41 01 00 ff 00 30 7a 7a 7a decodes to 278
bytes instead of failing.

Upstream fixed this in 587ed9557708 ("add comments explaining
read_variable_length() ilimit bounds, fix match length limit"), on top
of a read_variable_length() rework v1.10.0 does not have. Both versions
accept the same final ip for a given limit, so change the limit at the
two match length call sites to iend - (1 + LASTLITERALS), as upstream
does. This is one byte stricter than the fork; no compressor produces
the blocks it newly rejects.

This goes away at the next re-sync.

Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 lib/lz4/upstream/lz4.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/lz4/upstream/lz4.c b/lib/lz4/upstream/lz4.c
index ee69d57aae112f4057c050bbdab4cc0f2d30f9d9..a45f3828141eec9baea59a5e97a3ff37d6474d6e 100644
--- a/lib/lz4/upstream/lz4.c
+++ b/lib/lz4/upstream/lz4.c
@@ -2120,7 +2120,7 @@ LZ4_decompress_generic(
             DEBUGLOG(7, "  match length token = %u (len==%u)", (unsigned)length, (unsigned)length+MINMATCH);
 
             if (length == ML_MASK) {
-                size_t const addl = read_variable_length(&ip, iend - LASTLITERALS + 1, 0);
+                size_t const addl = read_variable_length(&ip, iend - (1 + LASTLITERALS), 0);
                 if (addl == rvl_error) {
                     DEBUGLOG(5, "error reading long match length");
                     goto _output_error;
@@ -2338,7 +2338,7 @@ LZ4_decompress_generic(
 
     _copy_match:
             if (length == ML_MASK) {
-                size_t const addl = read_variable_length(&ip, iend - LASTLITERALS + 1, 0);
+                size_t const addl = read_variable_length(&ip, iend - (1 + LASTLITERALS), 0);
                 if (addl == rvl_error) { goto _output_error; }
                 length += addl;
                 if (unlikely((uptrval)(op)+length<(uptrval)op)) goto _output_error;   /* overflow detection */

-- 
2.34.1


