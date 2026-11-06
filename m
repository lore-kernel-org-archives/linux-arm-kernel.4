Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED493606EEA5
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 14:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hpagsphm;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=WQgmkKbc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:Cc:
	To:In-Reply-To:Message-Id:Content-Transfer-Encoding:MIME-Version:Subject:Date
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=GYgm5u58bPQ8KjrBy/61xpOFxkMjgCoTnwcTVNwoqbk=; b=hpagsphm/axC08
	cfoh6oS4iBpQOOnx8dRbP7UZdxCFg3tKcD0MDxu2MIlNWgZmVf62M/Qj9cDel9+ObB1olhpT4cI5o
	sn4frWkReups2/pjb77HMv3khNwHPRVjok1oIXavDt6epPPv2+dJi7zgs82+ohkiQCFEX3jrv4qxT
	Aalk4g7Y/VBKIAqHN2fjlgvQduwZDh5fb8AYWfFbmzHhFs/uhtekKeqmVFDxJnEtJ7S9WcC1Bexcv
	3hxurUSaRLydHOvAxI3Ml0ptPgAzhyz0TVzaIHaSer0cQEQFOFnavXfnm7rWkoRee4p9dNU3ihO+r
	Vugbv3/nmqCSRXYUVw0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPLA3-0000000CiYw-0z76;
	Fri, 06 Nov 2026 14:43:23 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPL9w-0000000CiNj-0Uc5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 14:43:17 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20261106144314euoutp01bf87a536a63373af7576bde678d1ddb8~le9gTt12I2284222842euoutp01h;
	Fri,  6 Nov 2026 14:43:14 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20261106144314euoutp01bf87a536a63373af7576bde678d1ddb8~le9gTt12I2284222842euoutp01h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1793976194;
	bh=GYgm5u58bPQ8KjrBy/61xpOFxkMjgCoTnwcTVNwoqbk=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=WQgmkKbcpS0E5IppfyivxuipWCQVcrj3wQBhcG7mppmAFCb61WSuWQLycNnw2LszB
	 QBV9gIdHH1YOykat4PVKvqUj106DRrp0MQYKnvtWt+9iAlpffLU8njplSMEPRaxEUg
	 Zi2lTJLd/b+PgKD4zjnk6WRW355DOUz0XqSi+Au0=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20261106144313eucas1p18ebd11c40d0e1e68730aac1800b2502f~le9foEAZZ0320803208eucas1p1z;
	Fri,  6 Nov 2026 14:43:13 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261106144312eusmtip1f828cc3d3bce0595deabb51a9c76f7a7~le9eGMPzl0111901119eusmtip1B;
	Fri,  6 Nov 2026 14:43:12 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Fri, 06 Nov 2026 15:42:55 +0100
Subject: [PATCH v2 15/15] MAINTAINERS: add an entry for the LZ4 compression
 library
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-lz4-vendor-upstream-v2-15-ee04c3f0d7dc@samsung.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1482;
	i=m.wilczynski@samsung.com; h=from:subject:message-id;
	bh=HGm8Ef+oh1jjJf2rH2pR5MHSsxC9Nek4TB/eJTDN4oQ=;
	b=owGbwMvMwCGWumv6zndzRCIZT6slMWS9fZ46abfJ/e19IaxMGW5HdnJahax7qPTqucTmL61LK
	yVunnzF2VHKwiDGwSArpshydmO0keQ/hqflxx//gpnDygQyhIGLUwAmMkuZ4b8H27vww+aTf9sr
	N3XbHLz3N8hwUuGtw780TzbOOCOjvSmPkeGmlHH30XVnPxqo96y+mbnccFpp95ySRF5/txDPTl+
	eX2wA
X-Developer-Key: i=m.wilczynski@samsung.com; a=openpgp;
	fpr=CDB15B3219FE00E577C7E3FA65BA97B9EE9C1459
X-CMS-MailID: 20261106144313eucas1p18ebd11c40d0e1e68730aac1800b2502f
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261106144313eucas1p18ebd11c40d0e1e68730aac1800b2502f
X-EPHeader: CA
X-CMS-RootMailID: 20261106144313eucas1p18ebd11c40d0e1e68730aac1800b2502f
References: <20261106-lz4-vendor-upstream-v2-0-ee04c3f0d7dc@samsung.com>
	<CGME20261106144313eucas1p18ebd11c40d0e1e68730aac1800b2502f@eucas1p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_064316_434196_F7C83DCA 
X-CRM114-Status: GOOD (  13.19  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

lib/lz4/ has never had one: get_maintainer.pl returns only the LKML
fallback for every file in it, including include/linux/lz4.h, which eight
subsystems build against.

The entry also takes lib/decompress_unlz4.c and its header, which
decode LZ4 kernel images and initramfs through lib/lz4, the way XZ
EMBEDDED covers its own equivalents, and crypto/lz4.c and crypto/lz4hc.c,
the crypto API wrappers zswap uses, as ZSTD takes crypto/zstd.c.

This matters more now than it did. With the previous patches lib/lz4 is
vendored upstream sources, and someone has to bump them to new upstream
releases and decide what the kernel-side glue may do. I am willing to do
that, so add myself as its maintainer.

Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index cc3cae2e378b34aeb705cef654c720ca9f2ba223..598d87ca772eecbb1ed169d51ff0eb8cdd2e50ad 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15606,6 +15606,16 @@ S:	Supported
 F:	drivers/net/pcs/pcs-lynx.c
 F:	include/linux/pcs-lynx.h
 
+LZ4 COMPRESSION LIBRARY
+M:	Michal Wilczynski <m.wilczynski@samsung.com>
+S:	Maintained
+F:	crypto/lz4.c
+F:	crypto/lz4hc.c
+F:	include/linux/decompress/unlz4.h
+F:	include/linux/lz4.h
+F:	lib/decompress_unlz4.c
+F:	lib/lz4/
+
 M68K ARCHITECTURE
 M:	Geert Uytterhoeven <geert@linux-m68k.org>
 L:	linux-m68k@lists.linux-m68k.org

-- 
2.34.1


