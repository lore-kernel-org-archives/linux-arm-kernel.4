Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8119606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 09:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FQnvYXN5;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=ka+3Z7Va;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=+3FEC2I7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=OWddYtZFRBih+2kOOV/tz3cfLiO8YsvFVYLjnh/zs0c=; b=FQnvYXN5hTGsEJ
	UiUvbL0JqvR933eHvvurwG/SRunROzDWqXSGs0i3xNIcKd0u+hDyMZsTq2dVyG363mU9yUfJtP9M5
	zKa1NjYxCpMNZJMD7Iktmx7Jn/PllxW2uaQaL/QcFvdXFUuuVXBQYkIzBfg26y0joA0jQYlKt5ok9
	RkGTduD0+zkIo+ThovHRpqrb1r4jejHRarVmqj3vIsN2cQereXj4kPlK17K8ypWAgezB9xsyQM0m+
	zkMhXhD1x3Ik2bANl52+Nn11s2bGSLlSgWkuCkRobwqh+jx+9ey3xNGFRXKnbEszQTsCvJM615DQ7
	Rcv6FMvS6JGVPNuCw4Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQVh-00000002l7d-14Ty;
	Mon, 23 Nov 2026 09:38:53 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQUS-00000002jqh-3ejI;
	Mon, 23 Nov 2026 09:37:39 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795426654;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OWddYtZFRBih+2kOOV/tz3cfLiO8YsvFVYLjnh/zs0c=;
	b=ka+3Z7VadWdisEHx0nhlsSjM+BJx26vRfZQSKZBaNmkldRHN9izmYdiJ3lbMxC0OucilQO
	x4wajeyPaG9SYXCOYo0mEJbrlyo1Qb6odgIgVyt7RHwE0LwAcOrEw/9ag3SpzJaSdD+/50
	cf84wqq101c0Y7SjIl9MAYkyB/NoCBBDvkAzs3gXDM9eKkDoC5J59Oj+2z90qtXEsKIYjb
	6NCDbIjwyDXjHKXIWzzJogKsraz1G6QbzIpx7dekdRzxvdML7vicPUoeYiNKxgM4iAtCSw
	txYM5rGc4MljvQElOkPCMxyj2ftSGcr1+DILod8yuYSdLAYTq5uXJQbNv9SkwQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795426654;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OWddYtZFRBih+2kOOV/tz3cfLiO8YsvFVYLjnh/zs0c=;
	b=+3FEC2I7ganDyUkYlSgk8p5ebQ/W+4z9rJpXxo/+Q6+NHLP1FitfABHLjtVREnjnKzyYQa
	inDCvMd1nvmg6DBA==
Date: Mon, 23 Nov 2026 10:37:17 +0100
Subject: [PATCH v3 12/15] sparc: Remove AT_VECTOR_SIZE_ARCH from UAPI
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261123-at-vector-size-arch-v3-12-d342dae9e843@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795426640; l=1455;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=vD8CGJOm5QnknC9kSQAkUBhPNwBGIfJ1kH0awZZC4RM=;
 b=ZqXe3ujMdbEB5uqjyUQ/H+vOfXjC40uRBW01eTcsRo6t6/9jooGMDQTmAxN0GFYsNBJaxy0gu
 pb1295uByM8Ac2cxiZxLoRuOrUYtiCs9VE19YvlZd0nouwzkUZeW8Zd
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_013737_099039_0895FD5E 
X-CRM114-Status: GOOD (  11.01  )
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
 arch/sparc/include/asm/auxvec.h      | 6 ++++++
 arch/sparc/include/uapi/asm/auxvec.h | 8 +++-----
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/arch/sparc/include/asm/auxvec.h b/arch/sparc/include/asm/auxvec.h
new file mode 100644
index 000000000000..50c249a8bd17
--- /dev/null
+++ b/arch/sparc/include/asm/auxvec.h
@@ -0,0 +1,6 @@
+#ifndef __ASMSPARC_AUXVEC_H
+#define __ASMSPARC_AUXVEC_H
+
+#define AT_VECTOR_SIZE_ARCH	4
+
+#endif /* !(__ASMSPARC_AUXVEC_H) */
diff --git a/arch/sparc/include/uapi/asm/auxvec.h b/arch/sparc/include/uapi/asm/auxvec.h
index ab8780fb9df1..0fab3b29148a 100644
--- a/arch/sparc/include/uapi/asm/auxvec.h
+++ b/arch/sparc/include/uapi/asm/auxvec.h
@@ -1,5 +1,5 @@
-#ifndef __ASMSPARC_AUXVEC_H
-#define __ASMSPARC_AUXVEC_H
+#ifndef __UAPI_ASMSPARC_AUXVEC_H
+#define __UAPI_ASMSPARC_AUXVEC_H
 
 #define AT_SYSINFO_EHDR		33
 
@@ -10,6 +10,4 @@
 #define AT_ADI_NBITS	49
 #define AT_ADI_UEONADI	50
 
-#define AT_VECTOR_SIZE_ARCH	4
-
-#endif /* !(__ASMSPARC_AUXVEC_H) */
+#endif /* !(__UAPI_ASMSPARC_AUXVEC_H) */

-- 
2.56.1


