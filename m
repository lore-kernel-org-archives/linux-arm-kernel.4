Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8450D606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 09:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tDqGwmkk;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=eVR3Ru4Y;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=fb+iCiKk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=12rCIot4Q1y046Vzp8EdeFdJZwXEj1gxqogCrSz0YUU=; b=tDqGwmkkbue91s0+Y7+CCuYcra
	aNfYMJ8w26iaXMCIZw20rfPMPvu7SodUaGL5g/KG56GQAb1LkHUx+FVeJGkQsPDAAva0bWOsnzkKC
	nHtgsfKqjKCN7Mh3jIKsh/Z8VJl0fBC2BI1quapNGsiUN9l0pG7YU1AlHrQl9cOQsUjj9//mJlCWb
	kHGdeKMCzf0MwabLw0mHSkpCXbGLC+5/E+XiogEBmfoITuX11i/ykeBvZqmu869P3Ze5UjjO6zUKc
	2ykt+f4OLHUT67KcqAN3+z+mx8DK5a0mEX4jH/LDonyIuEc13PwWgTs38y0y3ebkznzEQ3amQYdA5
	wOmLC4Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQUR-00000002jqR-06Fi;
	Mon, 23 Nov 2026 09:37:35 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQUL-00000002jnU-4434;
	Mon, 23 Nov 2026 09:37:33 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795426646;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=12rCIot4Q1y046Vzp8EdeFdJZwXEj1gxqogCrSz0YUU=;
	b=eVR3Ru4YMLUxoE2oBeLnHegybGHZ1wA0UbD4tiFIxf5sSlq+p3wJdzZpk1ObDTCcQrza1z
	sy98hHXx+8xzinXaJ18cQFrVUiJIc/UcxxCx104dR5eQpHKjKHCYzESkf81Gf3OdfKYFU/
	eii4VqnD+bVQRxDevExQLyGum7btdJKvvpx3Yr5ardHDzDIHP6aGihnfy+77XqVSz6ZQgt
	47xh6w/Vwimk/bHTNf5kdhLgywTu1BYGw396QHdIBvHSpQXvrSULdDcD2Khd3VZ6kMCHkn
	cKpXfzLviy+wczOkqv+t1GeRU7hURAtZmDFbfCzTh8szA5wnR/Jki6meRytmbQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795426646;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=12rCIot4Q1y046Vzp8EdeFdJZwXEj1gxqogCrSz0YUU=;
	b=fb+iCiKkolSfl3maExBNRcPmG1YtwmtD8FIgojBmtd/T7xWBvxDvLsmVcOv8h0gdh8FVpL
	vvdYhx+u/oAeYgDg==
Subject: [PATCH v3 00/15] exec: Remove AT_VECTOR_SIZE_ARCH from UAPI
Date: Mon, 23 Nov 2026 10:37:05 +0100
Message-Id: <20261123-at-vector-size-arch-v3-0-d342dae9e843@linutronix.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23NQQ6CMBCF4auQrq2ZTiOCK+9hXJQylUlMMS02K
 OHuFly4kOU/yftmEpECUxSnYhKBEkfufQ69K4TtjL+R5Da3QMASFNTSDDKRHfogI79JmmA7WRI
 4pNq5qilFXj4COR5X9XLN3XHMg9f6JKnl+vU04KaXlARplHKgG4PWVOc7++cQes/jviWxmAl/T
 g1628HsHBqr0RwV6fbPmef5A6qlb4UCAQAA
X-Change-ID: 20260109-at-vector-size-arch-6e0f2e9ff8b6
To: Kees Cook <kees@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-riscv@lists.infradead.org, loongarch@lists.linux.dev, 
 linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-mips@vger.kernel.org, sparclinux@vger.kernel.org, 
 linux-sh@vger.kernel.org, linux-alpha@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
 Paul Walmsley <pjw@kernel.org>, Andy Chiu <andybnac@gmail.com>, 
 Magnus Lindholm <linmag7@gmail.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795426640; l=3299;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=0K3qhqEWg64tqQPsXMhmXxkKgiRN0V2EEQPpHTYxv4A=;
 b=Fe8nQiRi3Kfc2ylHmmPvMPRVTTjkYlaqoKTjn4kvNkLesW4z62H7gN1D51+mJJRRBnWysks5K
 2YBQSucEVjaDRaSt/FqXQnlQcInw1lzhzM2T6nWBTe45/TAM3F1ehFZ
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_013730_158531_E6354909 
X-CRM114-Status: UNSURE (   8.44  )
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

There is nothing userspace can do with this value. In the kernel is
always combined with AT_VECTOR_SIZE_BASE, which is not exposed to
userspace and also changes from time to time.

Move the symbol to kernel-internal headers.

Meant to be applied through the asm-generic or execve tree.
The default recipient list was huge. I trimmed it to only the
architecture lists.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
Changes in v3:
- Rebase on v7.3-rc1.
- Fix some include guards.
- Link to v2: https://patch.msgid.link/20260903-at-vector-size-arch-v2-0-5bc32a71e3d8@linutronix.de

Changes in v2:
- Rebase on v7.3-rc1.
- Pick up tags.
- Link to v1: https://lore.kernel.org/r/20260302-at-vector-size-arch-v1-0-a11f03ba2ca8@linutronix.de

---
Thomas Weißschuh (15):
      MAINTAINERS: exec: Add more auxvec.h variants
      auxvec.h: Move AT_VECTOR_SIZE definitions to linux/auxvec.h
      asm-generic: add an in-kernel auxvec.h header
      ARM: drop custom asm/auxvec.h
      x86: Remove AT_VECTOR_SIZE_ARCH from UAPI
      arm64: Remove AT_VECTOR_SIZE_ARCH from UAPI
      RISC-V: Remove AT_VECTOR_SIZE_ARCH from UAPI
      LoongArch: Remove AT_VECTOR_SIZE_ARCH from UAPI
      s390: Remove AT_VECTOR_SIZE_ARCH from UAPI
      powerpc: Remove AT_VECTOR_SIZE_ARCH from UAPI
      MIPS: Remove AT_VECTOR_SIZE_ARCH from UAPI
      sparc: Remove AT_VECTOR_SIZE_ARCH from UAPI
      sh: Remove AT_VECTOR_SIZE_ARCH from UAPI
      alpha: remove AT_VECTOR_SIZE_ARCH from UAPI
      auxvec.h: Drop fallback AT_VECTOR_SIZE_ARCH

 MAINTAINERS                              |  5 +++++
 arch/alpha/include/asm/auxvec.h          |  7 +++++++
 arch/alpha/include/uapi/asm/auxvec.h     |  8 +++-----
 arch/arm/include/asm/auxvec.h            |  1 -
 arch/arm64/include/asm/auxvec.h          |  7 +++++++
 arch/arm64/include/uapi/asm/auxvec.h     |  6 ++----
 arch/loongarch/include/asm/auxvec.h      | 14 ++++++++++++++
 arch/loongarch/include/uapi/asm/auxvec.h |  8 +++-----
 arch/mips/include/asm/auxvec.h           | 17 +++++++++++++++++
 arch/mips/include/uapi/asm/auxvec.h      |  8 +++-----
 arch/powerpc/include/asm/auxvec.h        |  7 +++++++
 arch/powerpc/include/uapi/asm/auxvec.h   |  6 ++----
 arch/riscv/include/asm/auxvec.h          | 13 +++++++++++++
 arch/riscv/include/uapi/asm/auxvec.h     |  2 --
 arch/s390/include/asm/auxvec.h           |  7 +++++++
 arch/s390/include/uapi/asm/auxvec.h      |  6 ++----
 arch/sh/include/asm/auxvec.h             |  7 +++++++
 arch/sh/include/uapi/asm/auxvec.h        |  8 +++-----
 arch/sparc/include/asm/auxvec.h          |  6 ++++++
 arch/sparc/include/uapi/asm/auxvec.h     |  8 +++-----
 arch/x86/include/asm/auxvec.h            | 12 ++++++++++++
 arch/x86/include/uapi/asm/auxvec.h       | 13 +++----------
 include/asm-generic/Kbuild               |  1 +
 include/asm-generic/auxvec.h             |  7 +++++++
 include/linux/auxvec.h                   |  5 +++++
 include/linux/mm_types.h                 |  6 ------
 26 files changed, 139 insertions(+), 56 deletions(-)
---
base-commit: a6b4ba7acc23ac0fb680449981982f308ea75036
change-id: 20260109-at-vector-size-arch-6e0f2e9ff8b6

Best regards,
--  
Thomas Weißschuh <thomas.weissschuh@linutronix.de>


