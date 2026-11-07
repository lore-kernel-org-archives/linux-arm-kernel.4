Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F14606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 07:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Zlfjsm+6;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H9HhWnec
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=bP0SvI1SyNFWGaznG9wghum5HnnqOxchfJ6Ki1mewRQ=; b=Zlfjsm+6qaXMdL
	0MwKqdTTTq4+eMrKyzBZxS/Z2WgHf5+Nz62hLSGlRwsGVlZXCQkCRs8Vm2TzRga9QJaGcplpavout
	tFqUG7W6Rl5ZBn5uDHFW9gDYqc1MsKhJ2p1ohPbHXxhZghL24dkAgapGgeiuwls0sONMQC3x6e+lU
	5n2VG3Aup/mlD0MfcIOtnSTZJQ+kBNAhU5USwSYQESwNKojIxKQoAf201bFZs3S5Kw9yqn1pmVI1g
	6dEJEvokLNMNSGuYB27Cu6+KserZZftleCdD0hgh00KVoRfXuoUTGVoxAKQSOMsjwNweFfaycMAzz
	YfujywxhWDtJtc4QWP8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPawA-0000000EKNl-4994;
	Sat, 07 Nov 2026 07:34:06 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPaw7-0000000EKMY-1ylY
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 07:34:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E592460D96;
	Sat,  7 Nov 2026 07:34:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4806C1F0089F;
	Sat,  7 Nov 2026 07:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794036842;
	bh=bP0SvI1SyNFWGaznG9wghum5HnnqOxchfJ6Ki1mewRQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=H9HhWnecdxRy9vEC4nHuQJSaDvquhMBI/PT801hH48JTsRd3zA+RCmU/HDJCkHKUz
	 9hBx9hkFGuKGERrF2UnNiTcLwsiPNUfWAxAI0rfswINB7IfINNe83yyNK+Ej2D+BCS
	 OXkL33cMm88csVmrZIt58Pz2+7egV/OvVOGoKu09CBbZGnbXWOzHJqhYy+ZdFrfrBu
	 MRItFyzQ637jbhvKdvyl+N32L+rfyvgF5fvoCSkonAy/HLJm1lpO6w3gkcU+/RYKwS
	 90HlrZFYjMZt8hjUpU5+ACKyyckNqKjK2xddxpsbAhtly/u4OqUwOEiIqAPv/gzhqs
	 ccw0wttMDE0sg==
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
Subject: [PATCH 3/4] arm64: stacktrace: Always inline internal stack boundary helpers
Date: Sat,  7 Nov 2026 15:13:38 +0800
Message-ID: <20261107071339.17467-4-jszhang@kernel.org>
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The noinstr stack walkers reach the stack boundary and frame-record
helpers through an __always_inline call chain. However, these shared
helpers do not themselves guarantee inlining.

With CONFIG_CC_OPTIMIZE_FOR_SIZE=y, GCC emitted several stack
information helpers and unwind_find_stack() out of line in .text.

Mark the shared stack boundary and frame-record helpers
__always_inline to keep their instructions in the non-instrumentable
walkers

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Assisted-by: LLM
---
 arch/arm64/include/asm/stacktrace.h        | 16 ++++++++--------
 arch/arm64/include/asm/stacktrace/common.h | 12 ++++++------
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/include/asm/stacktrace.h b/arch/arm64/include/asm/stacktrace.h
index 6d3280932bf5..b370c0e1e337 100644
--- a/arch/arm64/include/asm/stacktrace.h
+++ b/arch/arm64/include/asm/stacktrace.h
@@ -22,7 +22,7 @@ extern void dump_backtrace(struct pt_regs *regs, struct task_struct *tsk,
 
 DECLARE_PER_CPU(unsigned long *, irq_stack_ptr);
 
-static inline struct stack_info stackinfo_get_irq(void)
+static __always_inline struct stack_info stackinfo_get_irq(void)
 {
 	unsigned long low = (unsigned long)raw_cpu_read(irq_stack_ptr);
 	unsigned long high = low + IRQ_STACK_SIZE;
@@ -33,13 +33,13 @@ static inline struct stack_info stackinfo_get_irq(void)
 	};
 }
 
-static inline bool on_irq_stack(unsigned long sp, unsigned long size)
+static __always_inline bool on_irq_stack(unsigned long sp, unsigned long size)
 {
 	struct stack_info info = stackinfo_get_irq();
 	return stackinfo_on_stack(&info, sp, size);
 }
 
-static inline struct stack_info stackinfo_get_task(const struct task_struct *tsk)
+static __always_inline struct stack_info stackinfo_get_task(const struct task_struct *tsk)
 {
 	unsigned long low = (unsigned long)task_stack_page(tsk);
 	unsigned long high = low + THREAD_SIZE;
@@ -50,7 +50,7 @@ static inline struct stack_info stackinfo_get_task(const struct task_struct *tsk
 	};
 }
 
-static inline bool on_task_stack(const struct task_struct *tsk,
+static __always_inline bool on_task_stack(const struct task_struct *tsk,
 				 unsigned long sp, unsigned long size)
 {
 	struct stack_info info = stackinfo_get_task(tsk);
@@ -61,7 +61,7 @@ static inline bool on_task_stack(const struct task_struct *tsk,
 
 DECLARE_PER_CPU(unsigned long [OVERFLOW_STACK_SIZE/sizeof(long)], overflow_stack);
 
-static inline struct stack_info stackinfo_get_overflow(void)
+static __always_inline struct stack_info stackinfo_get_overflow(void)
 {
 	unsigned long low = (unsigned long)raw_cpu_ptr(overflow_stack);
 	unsigned long high = low + OVERFLOW_STACK_SIZE;
@@ -76,7 +76,7 @@ static inline struct stack_info stackinfo_get_overflow(void)
 DECLARE_PER_CPU(unsigned long *, sdei_stack_normal_ptr);
 DECLARE_PER_CPU(unsigned long *, sdei_stack_critical_ptr);
 
-static inline struct stack_info stackinfo_get_sdei_normal(void)
+static __always_inline struct stack_info stackinfo_get_sdei_normal(void)
 {
 	unsigned long low = (unsigned long)raw_cpu_read(sdei_stack_normal_ptr);
 	unsigned long high = low + SDEI_STACK_SIZE;
@@ -87,7 +87,7 @@ static inline struct stack_info stackinfo_get_sdei_normal(void)
 	};
 }
 
-static inline struct stack_info stackinfo_get_sdei_critical(void)
+static __always_inline struct stack_info stackinfo_get_sdei_critical(void)
 {
 	unsigned long low = (unsigned long)raw_cpu_read(sdei_stack_critical_ptr);
 	unsigned long high = low + SDEI_STACK_SIZE;
@@ -105,7 +105,7 @@ static inline struct stack_info stackinfo_get_sdei_critical(void)
 #ifdef CONFIG_EFI
 extern u64 *efi_rt_stack_top;
 
-static inline struct stack_info stackinfo_get_efi(void)
+static __always_inline struct stack_info stackinfo_get_efi(void)
 {
 	unsigned long high = (u64)efi_rt_stack_top;
 	unsigned long low = high - THREAD_SIZE;
diff --git a/arch/arm64/include/asm/stacktrace/common.h b/arch/arm64/include/asm/stacktrace/common.h
index 821a8fdd31af..7c502ae276b9 100644
--- a/arch/arm64/include/asm/stacktrace/common.h
+++ b/arch/arm64/include/asm/stacktrace/common.h
@@ -35,7 +35,7 @@ struct unwind_state {
 	int nr_stacks;
 };
 
-static inline struct stack_info stackinfo_get_unknown(void)
+static __always_inline struct stack_info stackinfo_get_unknown(void)
 {
 	return (struct stack_info) {
 		.low = 0,
@@ -43,7 +43,7 @@ static inline struct stack_info stackinfo_get_unknown(void)
 	};
 }
 
-static inline bool stackinfo_on_stack(const struct stack_info *info,
+static __always_inline bool stackinfo_on_stack(const struct stack_info *info,
 				      unsigned long sp, unsigned long size)
 {
 	if (!info->low)
@@ -55,7 +55,7 @@ static inline bool stackinfo_on_stack(const struct stack_info *info,
 	return true;
 }
 
-static inline void unwind_init_common(struct unwind_state *state)
+static __always_inline void unwind_init_common(struct unwind_state *state)
 {
 	state->stack = stackinfo_get_unknown();
 }
@@ -70,7 +70,7 @@ static inline void unwind_init_common(struct unwind_state *state)
  *
  * Return: a pointer to the relevant stack_info if found; NULL otherwise.
  */
-static struct stack_info *unwind_find_stack(struct unwind_state *state,
+static __always_inline struct stack_info *unwind_find_stack(struct unwind_state *state,
 					    unsigned long sp,
 					    unsigned long size)
 {
@@ -99,7 +99,7 @@ static struct stack_info *unwind_find_stack(struct unwind_state *state,
  *
  * Return: 0 upon success, an error code otherwise.
  */
-static inline void unwind_consume_stack(struct unwind_state *state,
+static __always_inline void unwind_consume_stack(struct unwind_state *state,
 					struct stack_info *info,
 					unsigned long sp,
 					unsigned long size)
@@ -142,7 +142,7 @@ static inline void unwind_consume_stack(struct unwind_state *state,
  *
  * Return: 0 upon success, an error code otherwise.
  */
-static inline int
+static __always_inline int
 unwind_next_frame_record(struct unwind_state *state)
 {
 	struct stack_info *info;
-- 
2.55.0


