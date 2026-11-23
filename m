Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F128D606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 09:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3yUB3KTH;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=TR8XczD/;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=hoHVYH9x
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=OzqRCnJR602SPiJtJXTG2PDcd45+A0tgb/oYXFQovLs=; b=3yUB3KTHoMfilb
	d7JVfgSZ2K4UTRYg6rvgFyDMvabbpFGLz0LBpikNZZNBcaanwjdKudxnBR40wa2NMcnhP7Rydh7w/
	kSJeGD+VoMsgn8Z8Mhs+aHLQyLq2HWQoFRYv7FE/lFOA2fgA8R+DeKcnSbOK34pBLNtFKm4G56Rh6
	ib1uRB7U0tEfE5bs9cqgVXNnQNKvP9HLJpvFRfrggxECqm58dmV/FAF3CDEQw6f4Vgt6Wa8s+5a+S
	Zx0HyfsHzg+AzgjOLygVUVp2A6rKaCmT3pu3zLiaSiIwsMQdlv8pzVFHn+OGDGzUq5kgTxoMypOOV
	e19TlL6LTpX7zk0fp1AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQWW-00000002m5M-1E0S;
	Mon, 23 Nov 2026 09:39:44 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQUR-00000002jqH-3ima;
	Mon, 23 Nov 2026 09:37:39 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795426651;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OzqRCnJR602SPiJtJXTG2PDcd45+A0tgb/oYXFQovLs=;
	b=TR8XczD//6I1MR5e9lJz+GijeGBKJ/F77cjTzH8vVoII07f/tMCwr/xGjF4TQGtgulC1EP
	vACmE5JKgFiiOYT5KMeM2ILfQDDi13RwanO37c9TmxxeyyWSa0jXluHBhTGxRKR0Yl64Oo
	7CYJEReknofWyo9+snoBGSVkCzXAajtax1AaQ/4R5wOyeTS+P0v42R8b4YqyL/j18nRyhy
	mAwleNFjqSK+iTvML/y9rFNzZ0CRLbBTDuzjqKG2uRk179PYD2MCsPQ1UIFgLV23Hjv6Nc
	mYzD6KuLCKi+7tfSemTLaki6pb72ly81l56+DTIHo3Ug7lZ9pzlij7cZQsJJsQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795426651;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OzqRCnJR602SPiJtJXTG2PDcd45+A0tgb/oYXFQovLs=;
	b=hoHVYH9xKLXuXyJAz+H1gDzElbvGfdJZ93NePphkmUT76//hgCh1ZCl3cIDoWvCVOzkPxm
	cENh6xJYPcEMYdBw==
Date: Mon, 23 Nov 2026 10:37:14 +0100
Subject: [PATCH v3 09/15] s390: Remove AT_VECTOR_SIZE_ARCH from UAPI
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261123-at-vector-size-arch-v3-9-d342dae9e843@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795426640; l=1450;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=XHafUQ8AvHq+zUf/VxtJZdze1xMjqQNOG6NhH665A6A=;
 b=oxMrqHfHeIxNkNvUbLxa7kn1LyC91rAIVfldoDncMK3YDOPceCuvoLmcVldlsZq98SdN6iXBt
 Y22qC0QCyKzCx4lysgpfyA2b5U5DJjnjaaEah8tYPviOHRifBjjXfLp
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_013736_061917_3FD5575A 
X-CRM114-Status: GOOD (  10.16  )
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
 arch/s390/include/asm/auxvec.h      | 7 +++++++
 arch/s390/include/uapi/asm/auxvec.h | 6 ++----
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/arch/s390/include/asm/auxvec.h b/arch/s390/include/asm/auxvec.h
new file mode 100644
index 000000000000..beaaefe12a84
--- /dev/null
+++ b/arch/s390/include/asm/auxvec.h
@@ -0,0 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+#ifndef __ASMS390_AUXVEC_H
+#define __ASMS390_AUXVEC_H
+
+#define AT_VECTOR_SIZE_ARCH 1 /* entries in ARCH_DLINFO */
+
+#endif
diff --git a/arch/s390/include/uapi/asm/auxvec.h b/arch/s390/include/uapi/asm/auxvec.h
index a056c4637ffc..54bbfd68d709 100644
--- a/arch/s390/include/uapi/asm/auxvec.h
+++ b/arch/s390/include/uapi/asm/auxvec.h
@@ -1,9 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
-#ifndef __ASMS390_AUXVEC_H
-#define __ASMS390_AUXVEC_H
+#ifndef __ASMS390_UAPI_AUXVEC_H
+#define __ASMS390_UAPI_AUXVEC_H
 
 #define AT_SYSINFO_EHDR		33
 
-#define AT_VECTOR_SIZE_ARCH 1 /* entries in ARCH_DLINFO */
-
 #endif

-- 
2.56.1


