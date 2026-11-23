Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6F8A606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 10:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=C5J6OWGY;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=0j5Gmmlj;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=xKFKMpGl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=dDtQZ0VAonHgAXv6V61xlzs7rkDt1P1WSeLVHahPhAk=; b=C5J6OWGYTngKnk
	d7mM0v7FmYTjdwAlLV3L1tLAmrzVaeIc/rcpvzNFLYTzX5IEfOmDL/Mt65cMDl2yi4lJedEK2g1PS
	BUO4gRLM7beiJfYTH6WaWDj8YvuXOIXW/b8w18+6I/y3c52syjeJXE3tkLrLe7ufqcXJtdTzxY4ZR
	O5mXeYWnqoPyW4uurOiN2QsK4sWNXPeSiqDPQ8jCaz4On4llpxS110uIDetMXiOYTDQKcMxSv3xWT
	EESD016obwyzvO1wVupH1dskKjDwXLT84SAP9/JoLH1vgzlfIC2YqO2jaX2lgItfgbbDLeupO1IFv
	w7/a9aGCKROBiUy9HBew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQUQ-00000002jqK-2bii;
	Mon, 23 Nov 2026 09:37:34 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQUM-00000002jnr-1Wct;
	Mon, 23 Nov 2026 09:37:33 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795426647;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dDtQZ0VAonHgAXv6V61xlzs7rkDt1P1WSeLVHahPhAk=;
	b=0j5Gmmljkca/E2gltZCv/iUBQbTWeg/kQBkYf9XVAiAvA+qtjrKckZWXQHPA2f/1TeXecV
	/zE0P2DNvoi8HzN3ElVxpGGiQAEUlNEcd6UGF8hYrc/wSMLNce0GBczPBbKvIrUO5X19RR
	R1IdOvKig4vP9CGu5Hhx6vXZPUH55eQ55Cmk36Mb44np+ZIxlZSOLnCp0ymuePoAJEdl+5
	TwmUudfDzyUogJxAH8+mEPtUHitYqGo8y7Cn1b+rbDaEO5y1tmknjd9BzK8UJv7cfl21hY
	ru0ooQgiSTna2g0imjxfqNWRrK9ENYE5x9K6ykIbUErgd+RZ7TijW+6DyYVOYg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795426647;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dDtQZ0VAonHgAXv6V61xlzs7rkDt1P1WSeLVHahPhAk=;
	b=xKFKMpGlecHS7QXXG/FYCxByPNPhxibU2GcZwDKmWF1WUgWqaJk6Gin5FmwBxGa5E4PlWb
	9bnxn8NrLGCuOXAA==
Date: Mon, 23 Nov 2026 10:37:07 +0100
Subject: [PATCH v3 02/15] auxvec.h: Move AT_VECTOR_SIZE definitions to
 linux/auxvec.h
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261123-at-vector-size-arch-v3-2-d342dae9e843@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795426640; l=1309;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=vTIIJIwUFOUw6+gUJjUOc4a2N37x7HojOq0oR0BBlzg=;
 b=GyKn4Bxu+C22SecrgL0rmVE25rtNo0/nZVqR9YcowgOuG6XWN+hFQ7LVwF48ESsfl68yPNaNg
 5OD4YumxPGrDTLDcZ/xMG4kmg7ZscPSTHPCE8zZxHWIbEnZdxHW3/L6
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_013730_547271_B865B745 
X-CRM114-Status: UNSURE (   8.35  )
X-CRM114-Notice: Please train this message.
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

The auxvec.h header is a more fitting place for these definitions.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Reviewed-by: Kees Cook <kees@kernel.org>
---
 include/linux/auxvec.h   | 7 +++++++
 include/linux/mm_types.h | 6 ------
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/include/linux/auxvec.h b/include/linux/auxvec.h
index 8bcb9b726262..4b364e639f08 100644
--- a/include/linux/auxvec.h
+++ b/include/linux/auxvec.h
@@ -6,4 +6,11 @@
 
 #define AT_VECTOR_SIZE_BASE 24 /* NEW_AUX_ENT entries in auxiliary table */
   /* number of "#define AT_.*" above, minus {AT_NULL, AT_IGNORE, AT_NOTELF} */
+
+#ifndef AT_VECTOR_SIZE_ARCH
+#define AT_VECTOR_SIZE_ARCH 0
+#endif
+
+#define AT_VECTOR_SIZE (2*(AT_VECTOR_SIZE_ARCH + AT_VECTOR_SIZE_BASE + 1))
+
 #endif /* _LINUX_AUXVEC_H */
diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index 1ed35d258d2e..c75626c5aad4 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -26,12 +26,6 @@
 
 #include <asm/mmu.h>
 
-#ifndef AT_VECTOR_SIZE_ARCH
-#define AT_VECTOR_SIZE_ARCH 0
-#endif
-#define AT_VECTOR_SIZE (2*(AT_VECTOR_SIZE_ARCH + AT_VECTOR_SIZE_BASE + 1))
-
-
 struct address_space;
 struct futex_private_hash;
 struct mem_cgroup;

-- 
2.56.1


