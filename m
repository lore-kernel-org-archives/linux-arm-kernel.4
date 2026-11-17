Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B57E606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 17:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BzojqQE9;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=X26tYuWa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=+1CUcFNE7JwfSHGV62hBf/oteDplXzPtQU4sFGBvXqM=; b=BzojqQE9S/CzAYs+pwi3xLb0W3
	RVkeycpAqoZ80JbClHy/D6SxoCgTe/D1tJvhsp0MJU3at6n6CFYkV24KNPHEKOW/OYPp1QGX7UfiI
	4hUKI5FNjjM7MtOAR0079hR3hoCB2VdxjKKMipfogd2fJqn/iQeuS9v4CiQkoyUQuH94XIOXVVyYc
	uNDdPQv1H4vMM9sN1D2jdNSUMcqIGS72Rq974C+4S1Irrl7oZJjxQYHSqBDDbqsE4gArV1844QLQv
	N0Ro56Y9qJxCkpPfR85qeMhzXxWNlqrCcPjecPdUGo+I/H2PiSGJf2c07419gPRo6Zye/ryfxS/Dx
	pBmvI5sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTMuY-00000006XTy-3b7f;
	Tue, 17 Nov 2026 17:24:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTMuW-00000006XTB-0c9A
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 17:24:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B615E1A00;
	Tue, 17 Nov 2026 09:23:52 -0800 (PST)
Received: from e144440.cambridge.arm.com (e144440.arm.com [10.2.199.104])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AE1CD3F632;
	Tue, 17 Nov 2026 09:23:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794936235; bh=nuuxNabwLDGMU43xHBMlv65TOjY4YdPO5UFA/AgDsmQ=;
	h=From:To:Cc:Subject:Date:From;
	b=X26tYuWa+ayRlYoEsgE88VEUuQSKMuliPzXKPOx6yh/KWkxN39IiELtTfcS2gRk3J
	 6SmATcQOc+s/hgPrJ2rIOdWmsmZjONdKMp3qu4lS9iHVksalcZjuqR3cNGG1+ne+gb
	 N4PM08YSNtMxOaR3KFb20OenFJijKD09w0Es5IQ8=
From: Ryan Roberts <ryan.roberts@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	John Fastabend <john.fastabend@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v1] arm64: Mitigate Spectre v1 in the BPF interpreter
Date: Tue, 17 Nov 2026 17:23:40 +0000
Message-ID: <20261117172341.3152407-1-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_092400_265383_490704EA 
X-CRM114-Status: GOOD (  18.32  )
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

The BPF verifier can accept programs with unsafe speculative paths by
inserting BPF_NOSPEC instructions instead of rejecting them. It relies
on those instructions to prevent execution of the unsafe paths.

The arm64 JIT implements BPF_NOSPEC with a speculation barrier, but the
interpreter calls barrier_nospec(), which falls back to a no-op on
arm64. Programs executed by the interpreter therefore lack the
Spectre-v1 barriers assumed by the verifier. Contrary to the code
comment, kernel-wide SSBD does not provide this protection, since it
mitigates Spectre v4 rather than Spectre v1.

Rename spec_bar() to barrier_nospec() so that the interpreter and other
callers receive SB if supported, or DSB NSH followed by ISB otherwise.

Defining barrier_nospec() would also add barriers to the generic
copy_from_user() and copy_from_user_iter() paths. These are unnecessary
on arm64: its uaccess primitives mask user pointers so that they cannot
address kernel memory even when an access_ok() check is mispredicted.

Introduce user_access_may_speculate_kernel_addr(), defaulting to true,
and have arm64 return false. Then update the uaccess sites to call
barrier_nospec() conditionally on the macro.

Cc: stable@vger.kernel.org
Fixes: d6f1c85f2253 ("bpf: Fall back to nospec for Spectre v1")
Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
---
 arch/arm64/include/asm/barrier.h | 6 +++---
 arch/arm64/include/asm/uaccess.h | 3 +++
 arch/arm64/kernel/proton-pack.c  | 2 +-
 include/linux/uaccess.h          | 7 ++++++-
 kernel/bpf/core.c                | 9 +--------
 lib/iov_iter.c                   | 3 ++-
 6 files changed, 16 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/include/asm/barrier.h b/arch/arm64/include/asm/barrier.h
index 9495c4441a46..088ee29d36f4 100644
--- a/arch/arm64/include/asm/barrier.h
+++ b/arch/arm64/include/asm/barrier.h
@@ -40,9 +40,9 @@
  */
 #define dgh()		asm volatile("hint #6" : : : "memory")

-#define spec_bar()	asm volatile(ALTERNATIVE("dsb nsh\nisb\n",		\
-						 SB_BARRIER_INSN"nop\n",	\
-						 ARM64_HAS_SB))
+#define barrier_nospec() asm volatile(ALTERNATIVE("dsb nsh\nisb\n",		\
+						  SB_BARRIER_INSN"nop\n",	\
+						  ARM64_HAS_SB) : : : "memory")

 #define gsb_ack()	asm volatile(GSB_ACK_BARRIER_INSN : : : "memory")
 #define gsb_sys()	asm volatile(GSB_SYS_BARRIER_INSN : : : "memory")
diff --git a/arch/arm64/include/asm/uaccess.h b/arch/arm64/include/asm/uaccess.h
index 9f5bd9c69c24..6fd03dc1ae76 100644
--- a/arch/arm64/include/asm/uaccess.h
+++ b/arch/arm64/include/asm/uaccess.h
@@ -174,6 +174,9 @@ static inline void __user *__uaccess_mask_ptr(const void __user *ptr)
 	return safe_ptr;
 }

+/* __uaccess_mask_ptr() prevents speculative accesses to kernel addresses. */
+#define user_access_may_speculate_kernel_addr() false
+
 /*
  * The "__xxx" versions of the user access functions do not verify the address
  * space - it must have been done previously with a separate "access_ok()"
diff --git a/arch/arm64/kernel/proton-pack.c b/arch/arm64/kernel/proton-pack.c
index 3bcf86154d95..c96e93eca3b9 100644
--- a/arch/arm64/kernel/proton-pack.c
+++ b/arch/arm64/kernel/proton-pack.c
@@ -559,7 +559,7 @@ static enum mitigation_state spectre_v4_enable_hw_mitigation(void)
 	 * could mis-speculate branches and bypass a conditional barrier.
 	 */
 	if (IS_ENABLED(CONFIG_ARM64_ERRATUM_3194386))
-		spec_bar();
+		barrier_nospec();

 	return SPECTRE_MITIGATED;
 }
diff --git a/include/linux/uaccess.h b/include/linux/uaccess.h
index 67cdb0a4f583..5a1fa4f48c77 100644
--- a/include/linux/uaccess.h
+++ b/include/linux/uaccess.h
@@ -50,6 +50,10 @@
  #define mask_user_address(src) (src)
 #endif

+#ifndef user_access_may_speculate_kernel_addr
+#define user_access_may_speculate_kernel_addr() true
+#endif
+
 /*
  * Architectures should provide two primitives (raw_copy_{to,from}_user())
  * and get rid of their private instances of copy_{to,from}_user() and
@@ -179,7 +183,8 @@ _inline_copy_from_user(void *to, const void __user *from, unsigned long n)
 		 * lead to nasty side effects *after* the copy is
 		 * finished:
 		 */
-		barrier_nospec();
+		if (user_access_may_speculate_kernel_addr())
+			barrier_nospec();
 	}
 	instrument_copy_from_user_before(to, from, n);
 	res = raw_copy_from_user(to, from, n);
diff --git a/kernel/bpf/core.c b/kernel/bpf/core.c
index 0b8456f2dce9..abd938d310bb 100644
--- a/kernel/bpf/core.c
+++ b/kernel/bpf/core.c
@@ -2250,14 +2250,7 @@ static u64 ___bpf_prog_run(u64 *regs, const struct bpf_insn *insn)
 	/* ST, STX and LDX*/
 	ST_NOSPEC:
 		/* Speculation barrier for mitigating Speculative Store Bypass,
-		 * Bounds-Check Bypass and Type Confusion. In case of arm64, we
-		 * rely on the firmware mitigation as controlled via the ssbd
-		 * kernel parameter. Whenever the mitigation is enabled, it
-		 * works for all of the kernel code with no need to provide any
-		 * additional instructions here. In case of x86, we use 'lfence'
-		 * insn for mitigation. We reuse preexisting logic from Spectre
-		 * v1 mitigation that happens to produce the required code on
-		 * x86 for v4 as well.
+		 * Bounds-Check Bypass and Type Confusion.
 		 */
 		barrier_nospec();
 		CONT;
diff --git a/lib/iov_iter.c b/lib/iov_iter.c
index fa4fe2e92383..abd27189beff 100644
--- a/lib/iov_iter.c
+++ b/lib/iov_iter.c
@@ -60,7 +60,8 @@ size_t copy_from_user_iter(void __user *iter_from, size_t progress,
 		 * lead to nasty side effects *after* the copy is
 		 * finished:
 		 */
-		barrier_nospec();
+		if (user_access_may_speculate_kernel_addr())
+			barrier_nospec();
 	}
 	to += progress;
 	instrument_copy_from_user_before(to, iter_from, len);
--
2.43.0


