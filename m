Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C32DA6083628
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 14:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xHzdfuj/;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=Tuy1y/iM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:Cc:
	To:In-Reply-To:Message-Id:Content-Transfer-Encoding:MIME-Version:Subject:Date
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=pvazUZ8GwALVMPvikyd9HIyqQPGJP1xRnMR9Mkuuq5g=; b=xHzdfuj/jxgVZv
	Lw82uTVK/o7EjpH+gP9n1ATqd+9feL1Nmz9Hw4dBxyu8OmsUrPr/0sjOhK0cY545U4dJkBE43k8Tf
	QxQ6NeoAlg2UmVhugPf6lnaW292Ya15nlR4g/NeKCtvdu4JZrs5bDfW9caWNRx97guIP8ilaT21ss
	HL0lDcYH4Jg3tIvEJRB01qp5sG4Hzt/mSbjeRDwLKvIj/wmcM4Xlh3G4PkUNuOmZmUsXb4jSp4EWI
	CjEpxD4W0sqxuuiYcgYXBlWL/MSM3fzndk9YPUBBAPFw4T1zQv+04+7uCRKYybLq6jmy46HH+H8PZ
	GWUK+34pgJTblhDOjEVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPL9n-0000000CiEG-2MM7;
	Fri, 06 Nov 2026 14:43:07 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPL9g-0000000Ci6d-1eex
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 14:43:02 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20261106144258euoutp024896c522eb7cece168675d99790d92fb~le9RabMVi1397013970euoutp02a;
	Fri,  6 Nov 2026 14:42:58 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20261106144258euoutp024896c522eb7cece168675d99790d92fb~le9RabMVi1397013970euoutp02a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1793976178;
	bh=pvazUZ8GwALVMPvikyd9HIyqQPGJP1xRnMR9Mkuuq5g=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=Tuy1y/iMSKfBZwuXZQwMW5l8JCrFtBgAguab+c2GbqsJNFIR57SDJeNDcX97g+P9g
	 UNkpn0TBtxGRr8tKaA3EYg9/BKL1oM+tZbNb1JrubHXRqM5KrxvNvsZIaYpZRMY7Bp
	 FwekHtiiyhhfFmokD43m3dKmeTG3+Sw3fJxH88Uo=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20261106144258eucas1p1f59ead3e337482e074bfb26f4553e70d~le9RDuTy80320903209eucas1p1Z;
	Fri,  6 Nov 2026 14:42:58 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261106144256eusmtip19a7550efce2282b6115acdd561526f25~le9Pf0jgn2998329983eusmtip12;
	Fri,  6 Nov 2026 14:42:56 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Fri, 06 Nov 2026 15:42:46 +0100
Subject: [PATCH v2 06/15] lib/lz4: backport upstream's aarch64 fast decode
 loop enablement
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-lz4-vendor-upstream-v2-6-ee04c3f0d7dc@samsung.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1749;
	i=m.wilczynski@samsung.com; h=from:subject:message-id;
	bh=YYDQiSfMdDchGst9Ca1G0wxCAGDujriJSlg8sDF+9gg=;
	b=owGbwMvMwCGWumv6zndzRCIZT6slMWS9fZ6q4zL/9pVfolPi++x/a854xv96Q0qw1tHIG7dN/
	d9s+CMn2FHKwiDGwSArpshydmO0keQ/hqflxx//gpnDygQyhIGLUwAmEu/J8FcgbHruVENh070C
	inX9/h83PHhopfZcV2vr2U+3j85Ov6LLyPDoh9E2Lsvd3AFusSk2P5k4bKxM2O79qPE7VDht27M
	XvqwA
X-Developer-Key: i=m.wilczynski@samsung.com; a=openpgp;
	fpr=CDB15B3219FE00E577C7E3FA65BA97B9EE9C1459
X-CMS-MailID: 20261106144258eucas1p1f59ead3e337482e074bfb26f4553e70d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261106144258eucas1p1f59ead3e337482e074bfb26f4553e70d
X-EPHeader: CA
X-CMS-RootMailID: 20261106144258eucas1p1f59ead3e337482e074bfb26f4553e70d
References: <20261106-lz4-vendor-upstream-v2-0-ee04c3f0d7dc@samsung.com>
	<CGME20261106144258eucas1p1f59ead3e337482e074bfb26f4553e70d@eucas1p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_064300_732557_04C959C5 
X-CRM114-Status: GOOD (  13.19  )
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
X-Spam-Status: No, score=-23.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

v1.10.0 leaves LZ4_FAST_DEC_LOOP off for aarch64 built with clang, after
a slowdown reported on some Android phones in 2019 (upstream PR #707).
An arm64 kernel built with clang therefore decodes with the slower loop.

Upstream has since enabled it for all aarch64, in three unreleased
commits:

commit 0aa33884faf5 ("[LZ4] Limit disabling LZ4_FAST_DEC_LOOP to aarch64+clang+android")
commit 51f8af506b4a ("Fix missing endif")
commit ed86bc1ed802 ("AArch64: Enable LZ4_FAST_DEC_LOOP for Android")

Arm measured +3.5% to +15.6% on Cortex-A510 to X4 with clang. Take the
lz4.c hunks of all three. This goes away at the next re-sync.

Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 lib/lz4/upstream/lz4.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/lib/lz4/upstream/lz4.c b/lib/lz4/upstream/lz4.c
index 0d474be0236a698d297ab9a430f5082485eb3709..ee69d57aae112f4057c050bbdab4cc0f2d30f9d9 100644
--- a/lib/lz4/upstream/lz4.c
+++ b/lib/lz4/upstream/lz4.c
@@ -478,12 +478,7 @@ static const int      dec64table[8] = {0, 0, 0, -1, -4,  1, 2, 3};
 #ifndef LZ4_FAST_DEC_LOOP
 #  if defined __i386__ || defined _M_IX86 || defined __x86_64__ || defined _M_X64
 #    define LZ4_FAST_DEC_LOOP 1
-#  elif defined(__aarch64__) && defined(__APPLE__)
-#    define LZ4_FAST_DEC_LOOP 1
-#  elif defined(__aarch64__) && !defined(__clang__)
-     /* On non-Apple aarch64, we disable this optimization for clang because
-      * on certain mobile chipsets, performance is reduced with clang. For
-      * more information refer to https://github.com/lz4/lz4/pull/707 */
+#  elif defined(__aarch64__)
 #    define LZ4_FAST_DEC_LOOP 1
 #  else
 #    define LZ4_FAST_DEC_LOOP 0

-- 
2.34.1


