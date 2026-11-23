Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24A84606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 09:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ejr2OkyV;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=2z10FrIE;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=UGWZ7T+q
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=UIWLxGK1Vij7tiU90cRxSFqpScY7zQR7QJvEseKLzwo=; b=ejr2OkyVCipxor
	XuJ5mJ2t6CNsr9xo9owlbvgaMn44PzfWnlt91Z0PIqY/4qeO1g7YfisLDPKLVt/4szENRtMHp/d37
	MLr6wn4penVkvwZhlLz7OSdoqfgGM5h1Wh78+DuQVdXgR7XSkWlpVoFr9nBwxdIi/RPJxDp9xOSuY
	0kLU/sB6taVjxGGeZu24+UMDyt2ns8qKAPcPBbpvieBzQbXhbyWXyVJyaKpq+0v1W2+NjR18641hQ
	vVXMZl+sbqso8aVTib5kvZG0UqvyafndJVUaCDjSijpbG6olPb+qxuodih8qRvXnKFwcnWCB26LGf
	37p2DEKhsyd6Ca4rp2QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQV6-00000002kQF-3Gtn;
	Mon, 23 Nov 2026 09:38:16 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQUR-00000002jpo-1WFW;
	Mon, 23 Nov 2026 09:37:36 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795426649;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UIWLxGK1Vij7tiU90cRxSFqpScY7zQR7QJvEseKLzwo=;
	b=2z10FrIENPAZxNBu/4FgnLVDlG3M7eRID7PzxUiXKydy/rln1DK0lZio8yE3noqkjRh9oT
	e/b+tC4rq+6YEoAcrjJ3cO7WlEfdLeLM1li0q/Tu0ADcA+or6b8Go/sgxFoq3u5Jml76nL
	wEJatTYHV8KEwJ04HLx5bycTT8ZyBzDv/EG6zYCj2bUXUfvkPNDwJxK6iLrH1+oKwxdDm0
	M6du5ER5mMXwAVZIpKmMPCoHzkl1ZHZHlS6RXzVJrU/FNTiYSQ/havtLOL4i6YJNQIQTNc
	2tz4Vmrf1kO+R+LB3ZbFcXy/yLpQ6jr/eCHfaUARFPi2Tkk0Cg45knkrepuvNg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795426649;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UIWLxGK1Vij7tiU90cRxSFqpScY7zQR7QJvEseKLzwo=;
	b=UGWZ7T+qthHBHDZwO2ZfnZZ4wdrxxNgHz6eoMYh19mIUB2kturgEFENUaaOBWGQCMbjlCJ
	6yQtRb64pG3v47Aw==
Date: Mon, 23 Nov 2026 10:37:12 +0100
Subject: [PATCH v3 07/15] RISC-V: Remove AT_VECTOR_SIZE_ARCH from UAPI
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261123-at-vector-size-arch-v3-7-d342dae9e843@linutronix.de>
References: <20261123-at-vector-size-arch-v3-0-d342dae9e843@linutronix.de>
In-Reply-To: <20261123-at-vector-size-arch-v3-0-d342dae9e843@linutronix.de>
To: Kees Cook <kees@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-riscv@lists.infradead.org, loongarch@lists.linux.dev, 
 linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-mips@vger.kernel.org, sparclinux@vger.kernel.org, 
 linux-sh@vger.kernel.org, linux-alpha@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
 Paul Walmsley <pjw@kernel.org>, Andy Chiu <andybnac@gmail.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795426640; l=1592;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=d8drZZysn7iP84IJ7qJbdevEVmAtmC8DVsiKbIAXolk=;
 b=aNwL1kWJlo01PaCvebxGDmG5xP0glqFTyi1RyyWhaa+P/3M+1844nqqBisvg5ICRxsxQjd2Xb
 /DJ1mQEVkTCBkqSfISfQLtBeGU1DOULq9hjkJBkJp0rUsvPlCTIH+I2
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_013735_575159_B067220F 
X-CRM114-Status: GOOD (  12.37  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

There is nothing userspace can do with this value. In the kernel is
always combined with AT_VECTOR_SIZE_BASE, which is not exposed to
userspace and also changes from time to time.

Move the symbol to a kernel-internal header.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Acked-by: Paul Walmsley <pjw@kernel.org> # arch/riscv
Reviewed-by: Andy Chiu <andybnac@gmail.com>
Reviewed-by: Kees Cook <kees@kernel.org>
---
 arch/riscv/include/asm/auxvec.h      | 13 +++++++++++++
 arch/riscv/include/uapi/asm/auxvec.h |  2 --
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/auxvec.h b/arch/riscv/include/asm/auxvec.h
new file mode 100644
index 000000000000..0960bc07ccd0
--- /dev/null
+++ b/arch/riscv/include/asm/auxvec.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2012 ARM Ltd.
+ * Copyright (C) 2015 Regents of the University of California
+ */
+
+#ifndef _ASM_RISCV_AUXVEC_H
+#define _ASM_RISCV_AUXVEC_H
+
+/* entries in ARCH_DLINFO */
+#define AT_VECTOR_SIZE_ARCH	10
+
+#endif /* _ASM_RISCV_AUXVEC_H */
diff --git a/arch/riscv/include/uapi/asm/auxvec.h b/arch/riscv/include/uapi/asm/auxvec.h
index 95050ebe9ad0..0a725f2aa2e7 100644
--- a/arch/riscv/include/uapi/asm/auxvec.h
+++ b/arch/riscv/include/uapi/asm/auxvec.h
@@ -33,8 +33,6 @@
 #define AT_L3_CACHESIZE		46
 #define AT_L3_CACHEGEOMETRY	47
 
-/* entries in ARCH_DLINFO */
-#define AT_VECTOR_SIZE_ARCH	10
 #define AT_MINSIGSTKSZ		51
 
 #endif /* _UAPI_ASM_RISCV_AUXVEC_H */

-- 
2.56.1


