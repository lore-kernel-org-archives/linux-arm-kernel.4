Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13BCF606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 09:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eYEUb59I;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=sy6wKMMi;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=EIfbqxqQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=wyQVJDn0J0MtFHgb5Qr9bVYS1xHAFGjzONhCtcrDq0g=; b=eYEUb59IAYT/yy
	a1TCdKhh4XMX9SdTw5xMm49GqiLiG1u9Qf7uXFjksWgT9x9PdAwAAH5KrHb1tDhO/G4TtadEKDi6C
	XHQHCORMLpzRxI7kNrsvcbl4gf/WUqgsvNxikIi6JJ04uxmkS38jdxUmhZ3MCqzm/zMPSaHkcZl5Y
	JtFdGI02OIYErk5UjK/K+vEHsLaZ2JXiwZ4DG+02QG/NCJj3aias8G6VQ3S1QuU7IwjctdmrR+NP0
	sfWsrunY6kaU3FivaySiZ7xJ6kmnqQG3Nh+hzybcyvUclbxuye5ImocTHWBccl6sjK8gWkosQrXN2
	K5NoJY+NMCUGRm6AdvzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQVQ-00000002kkE-22d8;
	Mon, 23 Nov 2026 09:38:36 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQUR-00000002jqI-3nXa;
	Mon, 23 Nov 2026 09:37:38 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795426652;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wyQVJDn0J0MtFHgb5Qr9bVYS1xHAFGjzONhCtcrDq0g=;
	b=sy6wKMMiSIYJJrLVs8OtFCFEbAMDezBV33VL71jtQheALKkWfogtOtkMSo7f3iDpx1hnmH
	DCow9DPdvS16RqXtCng1RNmV+NhFA2xClLPkTLPOYfmJGRa8ojIpmcuQsaxu56R6M4Fm+F
	kWBEw+7wIe+yzmSezbHp2T0eZORxNQJkDKd/9DCeDLuJAd/R7aeaufQ9FSQHhA2EizTWnq
	xfUG5037egX7h41/8CHjMiihW5FLjTaXA3mTegbNGNV896H0etpBsr0RNnEtHhkJFChwPx
	ujWRQS8fQWadjGCep69ydOg4Axb/KfFESJIPml36wiPo21QQXQ8D1RJkrL8ZZg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795426652;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wyQVJDn0J0MtFHgb5Qr9bVYS1xHAFGjzONhCtcrDq0g=;
	b=EIfbqxqQDY5EeJRfGC/cqaJZmr3BsSxE/bXQsnuaukyukzxhYJf5e7OI+OIDmQ4Kkwp59O
	ifnISwgD66ulBTCQ==
Date: Mon, 23 Nov 2026 10:37:15 +0100
Subject: [PATCH v3 10/15] powerpc: Remove AT_VECTOR_SIZE_ARCH from UAPI
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261123-at-vector-size-arch-v3-10-d342dae9e843@linutronix.de>
References: <20261123-at-vector-size-arch-v3-0-d342dae9e843@linutronix.de>
In-Reply-To: <20261123-at-vector-size-arch-v3-0-d342dae9e843@linutronix.de>
To: Kees Cook <kees@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-riscv@lists.infradead.org, loongarch@lists.linux.dev, 
 linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-mips@vger.kernel.org, sparclinux@vger.kernel.org, 
 linux-sh@vger.kernel.org, linux-alpha@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795426640; l=1614;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=lq2CTgfwZG73WGl5OVl7p6mIHPWbhjx1Tz1RNRtR7N8=;
 b=bJ5A5zd3pfSWIa+VMd5QiOGWtRTF6UJscvwGWocaeSTuxYx7he2xiLti1KebdjyptmSFP9R36
 LWL13Cj7QasDcyXmn53dOiu+z7BAW25TVHWTaylnvQbJlD/oDtlC0ip
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_013736_113172_560F1022 
X-CRM114-Status: GOOD (  11.22  )
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
Reviewed-by: Kees Cook <kees@kernel.org>
---
 arch/powerpc/include/asm/auxvec.h      | 7 +++++++
 arch/powerpc/include/uapi/asm/auxvec.h | 6 ++----
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/include/asm/auxvec.h b/arch/powerpc/include/asm/auxvec.h
new file mode 100644
index 000000000000..d6c180e9ac2c
--- /dev/null
+++ b/arch/powerpc/include/asm/auxvec.h
@@ -0,0 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_POWERPC_AUXVEC_H
+#define _ASM_POWERPC_AUXVEC_H
+
+#define AT_VECTOR_SIZE_ARCH	15 /* entries in ARCH_DLINFO */
+
+#endif
diff --git a/arch/powerpc/include/uapi/asm/auxvec.h b/arch/powerpc/include/uapi/asm/auxvec.h
index aa7c16215453..9ab5b6d17929 100644
--- a/arch/powerpc/include/uapi/asm/auxvec.h
+++ b/arch/powerpc/include/uapi/asm/auxvec.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
-#ifndef _ASM_POWERPC_AUXVEC_H
-#define _ASM_POWERPC_AUXVEC_H
+#ifndef _UAPI_ASM_POWERPC_AUXVEC_H
+#define _UAPI_ASM_POWERPC_AUXVEC_H
 
 /*
  * We need to put in some extra aux table entries to tell glibc what
@@ -50,6 +50,4 @@
 
 #define AT_MINSIGSTKSZ		51      /* stack needed for signal delivery */
 
-#define AT_VECTOR_SIZE_ARCH	15 /* entries in ARCH_DLINFO */
-
 #endif

-- 
2.56.1


