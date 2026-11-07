Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5DC5606A334
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 07:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QK3vn66V;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z7pu2Zcw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=1o7E6/PEZfnHFqDMeLtzchjTUh2bQgzVUzqTp6fm5lQ=; b=QK3vn66VhIFTq4
	VSUkFC8iWINA3dGTLgo5iZdcqqC+F187ISjXm6ljDsd6vX4urpUgOP49piAAW/cHCsXnzjShDPwXN
	zKRhNApabCbRriUGuWeVgpzen+AtnlGmtPFUh24pRD/S3rc4Up3fEOolvZJEhS1voZ6xTEuPrBeU1
	p3tCKe6QdeBn7orrei2dn7DYkPZwl+efeEBkRRr4fOIjcpHQuKxZjlt0QoQ3Z0vtBXGmXfgXWOlrJ
	oQB5vTcEInbhwblUHfSXUNBdbWuwwEFrLhqfIrmMnDbe7IrULeKKgRZZtcZrheVIQBEQUzjA8SXiG
	4BupTNqTlZY9F5TlBehQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPaw1-0000000EKK8-2uFm;
	Sat, 07 Nov 2026 07:33:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPavy-0000000EKJR-272E
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 07:33:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E5DE543B18;
	Sat,  7 Nov 2026 07:33:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32D261F008A1;
	Sat,  7 Nov 2026 07:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794036833;
	bh=1o7E6/PEZfnHFqDMeLtzchjTUh2bQgzVUzqTp6fm5lQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Z7pu2ZcwoD9OUreYyHE8HU2dJMBtk1hv8qhGCbK5WFxTzxQ/fCQJIjX/XgtL/Z8ap
	 6WtNwMVARJt+lSBu/3YH8/pFiFLqy8RG2C1/tpgIZgNG3WtpSZb2mpwfAYDn0XEqRI
	 eJt5QT1QhFhprtJqgtS24CZEYz8bAzg5u24ARNVM/SJKCsUXyihBZZNYUD44XxHIkO
	 hg5I19k3iUtXfRrjDCGwQ7fop2m8hCf4FsGkAMJNGnguVofPbfM8ntRTgnpveMAJYg
	 dn3J713D3P9N/DmFjaCxDdpubU2gU9vDBy2vE2bgobq5YuoEYiZOCJf0EfY4KY54e2
	 6i9qnERwrEMZg==
From: Jisheng Zhang <jszhang@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Tejun Heo <tj@kernel.org>,
	Dennis Zhou <dennis@kernel.org>,
	Christoph Lameter <cl@gentwo.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com,
	linux-mm@kvack.org
Subject: [PATCH 1/4] arm64: percpu: Always inline helpers used by noinstr code
Date: Sat,  7 Nov 2026 15:13:36 +0800
Message-ID: <20261107071339.17467-2-jszhang@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261107071339.17467-1-jszhang@kernel.org>
References: <20261107071339.17467-1-jszhang@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The non-instrumentable entry and stack unwinding paths use the per-CPU
offset and read helpers. Plain inline does not guarantee inlining, so
these helpers can be emitted out of line without inheriting the
caller's instrumentation restrictions.

In a GCC build with CONFIG_CC_OPTIMIZE_FOR_SIZE=y,
__kern_my_cpu_offset() was emitted in .text and called from
.noinstr.text.

Mark the per-CPU offset and read helpers __always_inline to keep their
instructions within their callers.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Assisted-by: LLM
---
 arch/arm64/include/asm/percpu.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/include/asm/percpu.h b/arch/arm64/include/asm/percpu.h
index 3cc316091d66..7c344de5052d 100644
--- a/arch/arm64/include/asm/percpu.h
+++ b/arch/arm64/include/asm/percpu.h
@@ -23,7 +23,7 @@ static inline void set_my_cpu_offset(unsigned long off)
 			:: "r" (off) : "memory");
 }
 
-static inline unsigned long __hyp_my_cpu_offset(void)
+static __always_inline unsigned long __hyp_my_cpu_offset(void)
 {
 	/*
 	 * Non-VHE hyp code runs with preemption disabled. No need to hazard
@@ -37,7 +37,7 @@ static inline unsigned long __hyp_my_cpu_offset(void)
 		    "mrs " dst ", tpidr_el2",				\
 		       ARM64_HAS_VIRT_HOST_EXTN)
 
-static inline unsigned long __kern_my_cpu_offset(void)
+static __always_inline unsigned long __kern_my_cpu_offset(void)
 {
 	unsigned long off;
 
@@ -129,7 +129,7 @@ static inline unsigned long __kern_my_cpu_offset(void)
 #endif
 
 #define PERCPU_RW_OPS(w, sfx, sz)						\
-static inline unsigned long __percpu_read_##sz(void __percpu *pcp)		\
+static __always_inline unsigned long __percpu_read_##sz(void __percpu *pcp)		\
 {										\
 	u16 *gprs = &current_thread_info()->pcpu_gprs;				\
 	unsigned long off;							\
-- 
2.55.0


