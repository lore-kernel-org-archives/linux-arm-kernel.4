Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D1D7606A331
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 12:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OHlSKrt+;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iJ+/FIiU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=jDLLbZHLdq5MhOPUl4urb8863fHk2vd7x0ssvKzjf2U=; b=OHlSKrt+E7rIzs
	fgRp29AQZVDGe1REUTYAzuEgWdgUdMjO0pT+XH6lVaFoEhH/F3oeYbhkvbIux4EyPutpkqqgUE8dn
	ywN9KN57YZdgS8AlAk0NYhPoBwz8jBnA6YIZ5HIvUHp2NnmuqNUE1+Wn6ERdMxSII4t+JZj929zKh
	oovMkHnI9wUcqJseAf+t3WH3Xyr/iA0xnL5LrgrgdGNfXATwehAV+JNPKYRpGUZVavOF6WjZivm/S
	lVQQSPWbyjlDVOwF463s8WeqoeX/m5IKE5KBLCTbfmIKhf5ApC6xhfWACQBiEo7MWR7aC/raG7qVt
	GJ8Hhwvwj/WsDxD6UEiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQO7i-00000000c1C-2cA2;
	Mon, 09 Nov 2026 12:05:18 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQO7h-00000000c0d-1MSy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 12:05:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C02DD63191;
	Mon,  9 Nov 2026 12:05:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 971F71F0089F;
	Mon,  9 Nov 2026 12:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794225916;
	bh=jDLLbZHLdq5MhOPUl4urb8863fHk2vd7x0ssvKzjf2U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=iJ+/FIiUC1g6XzTjLwnj6XGPzszrze3zAChLy/4ghxYUT53y7oXHv0nPTPwvAGDd5
	 Y2ML8NJnlrYt2lZp4bQfZ32ARA3YddcGThJGF730a17Jssq3jO9mf5T3rqeN5ruouD
	 I4htAztWuwFT3frhnZJXAnfuKlg4bXY90JL9XVxaHJj+vct0XNDnPI4zf3YtG1mpGn
	 zhPx7XO/S6IAh7yCPqhX+GbkiHC3HfeGAdTRO/v6xGl6kmktyB+jqDcv64t5YT/PlR
	 g1Ehsq3Zng0Wl69d6k0yGBCU4B2M4HwE6GcK7zfNgw2LbvPJwJf059sp8iyJorxEQA
	 mOubsFL9yiUBA==
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
Subject: [PATCH v2 1/6] arm64: percpu: Always inline helpers used by noinstr code
Date: Mon,  9 Nov 2026 19:44:54 +0800
Message-ID: <20261109114500.20298-2-jszhang@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261109114500.20298-1-jszhang@kernel.org>
References: <20261109114500.20298-1-jszhang@kernel.org>
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
 arch/arm64/include/asm/percpu.h | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/include/asm/percpu.h b/arch/arm64/include/asm/percpu.h
index 3cc316091d66..40a327df41cd 100644
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
@@ -149,7 +149,7 @@ static inline unsigned long __percpu_read_##sz(void __percpu *pcp)		\
 	return val;								\
 }										\
 										\
-static inline void __percpu_write_##sz(void __percpu *pcp, unsigned long val)	\
+static __always_inline void __percpu_write_##sz(void __percpu *pcp, unsigned long val) \
 {										\
 	u16 *gprs = &current_thread_info()->pcpu_gprs;				\
 	unsigned long off;							\
@@ -167,7 +167,7 @@ static inline void __percpu_write_##sz(void __percpu *pcp, unsigned long val)	\
 }
 
 #define __PERCPU_OP_CASE(w, sfx, name, sz, op_llsc, op_lse)		\
-static inline void							\
+static __always_inline void					\
 __percpu_##name##_case_##sz(void __percpu *pcp, unsigned long val)	\
 {									\
 	u16 *gprs = &current_thread_info()->pcpu_gprs;			\
@@ -200,7 +200,7 @@ __percpu_##name##_case_##sz(void __percpu *pcp, unsigned long val)	\
 }
 
 #define __PERCPU_RET_OP_CASE(w, sfx, name, sz, op_llsc, op_lse)		\
-static inline u##sz							\
+static __always_inline u##sz					\
 __percpu_##name##_return_case_##sz(void __percpu *pcp, unsigned long val)	\
 {									\
 	u16 *gprs = &current_thread_info()->pcpu_gprs;			\
@@ -270,7 +270,7 @@ PERCPU_RET_OP(add, add, ldadd)
 #undef PERCPU_RET_OP
 
 #define PERCPU_XCHG_OP(w, sfx, sz)					\
-static inline unsigned long						\
+static __always_inline unsigned long				\
 __percpu_xchg_case_##sz(void __percpu *pcp, u##sz val)			\
 {									\
 	u16 *gprs = &current_thread_info()->pcpu_gprs;			\
@@ -307,7 +307,7 @@ __percpu_xchg_case_##sz(void __percpu *pcp, u##sz val)			\
 }
 
 #define PERCPU_CMPXCHG_OP(w, sfx, sz)					\
-static inline unsigned long						\
+static __always_inline unsigned long				\
 __percpu_cmpxchg_case_##sz(void __percpu *pcp,				\
 			   u##sz old,					\
 			   u##sz new)					\
@@ -463,7 +463,7 @@ PERCPU_CMPXCHG_OP(x,  , 64)
 
 #define this_cpu_cmpxchg64(pcp, o, n)	this_cpu_cmpxchg_8(pcp, o, n)
 
-static inline u128
+static __always_inline u128
 __percpu_cmpxchg_128(void __percpu *pcp, u128 old, u128 new)
 {
 	u16 *gprs = &current_thread_info()->pcpu_gprs;
-- 
2.55.0


