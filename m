Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05BF96082BFD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 16:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vHaZvhq9;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Y6QGzbK4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=BWpLaVBRkOlQWYeoX9SPxGyEXeXPe7MtwkGKCwhz/ks=; b=vHaZvhq91Y9BRv
	DvYBXprPeIZy/TGvkD2PjqP+6iAtAWH/+WrAqOMQbKJVe5S3EU/lRdTJNurBWpI8EQ6ScaFTEE6X7
	2iXaM9DA5VFRLq0XWA74PoK7bk8/FufwY2GjpD+HDtossmOgqE0g1SNa3sN2j5PcC3GKnOQfAA+0T
	77yjPFpn/rXGn0Vlu+DzgxvErAC9Jjb0NIc/KXVWUG+9Sh0YmIiDb5c+DvvnFoayhJGji0tnKRBg6
	4IIST8kqVQcN/f4pjwZ8B235POBNhVz+HYT6m+IpTgYh0FfexdTL1OSmS2yQunolvem+diHckAhqR
	A3NbkySYKXvgjGO7pNHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQRna-000000017FY-0YpR;
	Mon, 09 Nov 2026 16:00:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQRnU-000000017B3-2gyr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 16:00:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1FD351516;
	Mon,  9 Nov 2026 08:00:37 -0800 (PST)
Received: from localhost.localdomain (e123572-lin.cambridge.arm.com [10.2.208.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 42CD23F632;
	Mon,  9 Nov 2026 08:00:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794240040; bh=echuUgtLkD2a7BAD+7hYclWLN8NT3mDQAmCpjSBvsFk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Y6QGzbK49+REvpkxtERwwRHEONKDKFghwySdcsjRjdlI517MmjfTwR3s6m0QobYBa
	 3sn/jaGFagkhKCpOG1rpEsWtLz8+b48zchh/AEr560CrvtaBdlQ6wiNUmHQvX3sRzZ
	 twgysJBNhnxsNOoKzScZ0QEdN3mSvpMohb/PcPNc=
From: Kevin Brodsky <kevin.brodsky@arm.com>
Date: Mon, 09 Nov 2026 15:58:26 +0000
Subject: [PATCH RFC v10 01/22] mm: Introduce kpkeys
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261109-kpkeys-v10-1-aa6c4d9603bc@arm.com>
References: <20261109-kpkeys-v10-0-aa6c4d9603bc@arm.com>
In-Reply-To: <20261109-kpkeys-v10-0-aa6c4d9603bc@arm.com>
To: linux-hardening@vger.kernel.org
Cc: Kevin Brodsky <kevin.brodsky@arm.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Ard Biesheuvel <ardb+git@google.com>, Andy Lutomirski <luto@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Dave Hansen <dave.hansen@linux.intel.com>, 
 "David Hildenbrand (Arm)" <david@kernel.org>, Jann Horn <jannh@google.com>, 
 Jeff Xu <jeffxu@chromium.org>, Joey Gouly <joey.gouly@arm.com>, 
 Kees Cook <kees@kernel.org>, Linu Cherian <linu.cherian@arm.com>, 
 Linus Walleij <linusw@kernel.org>, Marc Zyngier <maz@kernel.org>, 
 Mark Brown <broonie@kernel.org>, Matthew Wilcox <willy@infradead.org>, 
 Maxwell Bland <mbland@motorola.com>, 
 "Mike Rapoport (IBM)" <rppt@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, 
 Pierre Langlois <pierre.langlois@arm.com>, 
 =?utf-8?q?Pierre-Cl=C3=A9ment_Tosi?= <ptosi@google.com>, 
 Quentin Perret <qperret@google.com>, 
 Rick Edgecombe <rick.p.edgecombe@intel.com>, 
 Ryan Roberts <ryan.roberts@arm.com>, Vlastimil Babka <vbabka@kernel.org>, 
 Will Deacon <will@kernel.org>, Yang Shi <yang@os.amperecomputing.com>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, x86@kernel.org, 
 Ira Weiny <iweiny@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794240029; l=6214;
 i=kevin.brodsky@arm.com; s=20260427; h=from:subject:message-id;
 bh=echuUgtLkD2a7BAD+7hYclWLN8NT3mDQAmCpjSBvsFk=;
 b=M7uxGf8m8LgUdUIOChPJY5rfo9p8Svpg9/S7sTLYMAlbmUhfhg1wFRDmHdZYq6jO29fCVU69I
 eijdTIw94XWBsyMBWozP3mIqOnAkhHm0jYlOLiP4EQdKhP9fTFoezeO
X-Developer-Key: i=kevin.brodsky@arm.com; a=ed25519;
 pk=N2QG+eJKrvkNovwhhwJhnJ4+ScVfsGCHldmqLfcMTFs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_080040_927379_E4C9E238 
X-CRM114-Status: GOOD (  23.01  )
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

kpkeys is a simple framework to enable the use of protection keys
(pkeys) to harden the kernel itself. This patch introduces the basic
API in <linux/kpkeys.h>: a pair of functions to enter/leave a kpkeys
context, and macros to define guard objects.

Each kpkeys context specifies permissions for the pkeys managed by the
framework. kpkeys_enter_context() applies those permissions and
returns a state for kpkeys_leave_context() to restore.

The saved state is represented by struct kpkeys_state, with one
field for the arch state (typically the saved pkeys register value).
The other field is used to skip the restore step in case we were
already in the context passed to enter_context().

Support for kpkeys must be indicated by selecting ARCH_HAS_KPKEYS.
The architecture must then provide:

* struct arch_kpkeys_state in <asm/kpkeys_types.h>

* arch_kpkeys_enter_context() in <asm/kpkeys.h>:
  if needed, sets the new state and saves the original one in
  arch_kpkeys_state; reports whether the context was actually
  changed

* arch_kpkeys_leave_context() in <asm/kpkeys.h>:
  restores the original state

* arch_supports_kpkeys() in <asm/kpkeys.h>:
  returns whether the system has an appropriate hardware feature to
  support kpkeys

To start with, only KPKEYS_CTX_DEFAULT is available, granting
RW access to the default pkey (0).

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 include/linux/kpkeys.h       | 107 +++++++++++++++++++++++++++++++++++++++++++
 include/linux/kpkeys_types.h |  25 ++++++++++
 mm/Kconfig                   |   2 +
 3 files changed, 134 insertions(+)

diff --git a/include/linux/kpkeys.h b/include/linux/kpkeys.h
new file mode 100644
index 000000000000..69ec4808d850
--- /dev/null
+++ b/include/linux/kpkeys.h
@@ -0,0 +1,107 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef _LINUX_KPKEYS_H
+#define _LINUX_KPKEYS_H
+
+#include <linux/bug.h>
+#include <linux/cleanup.h>
+#include <linux/kpkeys_types.h>
+
+/**
+ * KPKEYS_GUARD_NOOP() - helper to define a guard type that does nothing
+ * @name: the name of the guard type
+ *
+ * Define a guard type that does nothing, useful to match a real guard type
+ * that is defined under an #ifdef.
+ */
+#define KPKEYS_GUARD_NOOP(name)						\
+	__DEFINE_CLASS_IS_CONDITIONAL(name, false);			\
+	DEFINE_CLASS(name, bool, (void)_T, false, void);		\
+	static inline void *class_##name##_lock_ptr(bool *_T)		\
+	{ return _T; }
+
+#ifdef CONFIG_ARCH_HAS_KPKEYS
+
+#include <asm/kpkeys.h>
+
+/**
+ * KPKEYS_GUARD_COND() - helper to define a guard type that conditionally
+ *                       switches to a given kpkeys context
+ * @name: the name of the guard type
+ * @ctx: the kpkeys context to switch to
+ * @cond: an expression that is evaluated as condition
+ *
+ * Define a guard type that switches to @ctx if @cond evaluates to true,
+ * and does nothing otherwise.
+ */
+#define KPKEYS_GUARD_COND(name, ctx, cond)				\
+	__DEFINE_CLASS_IS_CONDITIONAL(name, false);			\
+	DEFINE_CLASS(name, struct kpkeys_state,				\
+		     kpkeys_leave_context(&_T),				\
+		     (cond) ? kpkeys_enter_context(ctx) :		\
+			      (struct kpkeys_state) {}, void);		\
+	static inline							\
+	void *class_##name##_lock_ptr(struct kpkeys_state *_T)		\
+	{ return _T; }
+
+/**
+ * KPKEYS_GUARD() - helper to define a guard type that switches to a given
+ *                  kpkeys context if kpkeys are supported
+ * @name: the name of the guard type
+ * @ctx: the kpkeys context to switch to
+ *
+ * Define a guard type that switches to @ctx if the system supports kpkeys.
+ */
+#define KPKEYS_GUARD(name, ctx)						\
+	KPKEYS_GUARD_COND(name, ctx, kpkeys_supported())
+
+/**
+ * kpkeys_enter_context() - enter a kpkeys context
+ * @ctx: the context to switch to
+ *
+ * Enters the specified kpkeys context. @ctx must be a compile-time constant.
+ *
+ * Return: state to be passed to kpkeys_leave_context().
+ */
+static __always_inline
+struct kpkeys_state kpkeys_enter_context(enum kpkeys_ctx ctx)
+{
+	struct kpkeys_state state = {};
+
+	BUILD_BUG_ON_MSG(!__builtin_constant_p(ctx),
+			 "kpkeys_enter_context() only takes constant values");
+	BUILD_BUG_ON_MSG(ctx < 0 || ctx >= KPKEYS_CTX_COUNT,
+			 "Invalid value passed to kpkeys_enter_context()");
+
+	state.entered_context = arch_kpkeys_enter_context(ctx, &state.arch_state);
+	return state;
+}
+
+/**
+ * kpkeys_leave_context() - leave a kpkeys context
+ * @state: state returned by kpkeys_enter_context()
+ *
+ * Restores the state saved when entering a kpkeys context. If no context was
+ * entered, this function does nothing.
+ */
+static __always_inline
+void kpkeys_leave_context(const struct kpkeys_state *state)
+{
+	if (state->entered_context)
+		arch_kpkeys_leave_context(&state->arch_state);
+}
+
+static inline bool kpkeys_supported(void)
+{
+	return arch_supports_kpkeys();
+}
+
+#else /* CONFIG_ARCH_HAS_KPKEYS */
+
+static inline bool kpkeys_supported(void)
+{
+	return false;
+}
+
+#endif /* CONFIG_ARCH_HAS_KPKEYS */
+
+#endif /* _LINUX_KPKEYS_H */
diff --git a/include/linux/kpkeys_types.h b/include/linux/kpkeys_types.h
new file mode 100644
index 000000000000..9de59092e9c3
--- /dev/null
+++ b/include/linux/kpkeys_types.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef _LINUX_KPKEYS_TYPES_H
+#define _LINUX_KPKEYS_TYPES_H
+
+#include <linux/types.h>
+
+#ifdef CONFIG_ARCH_HAS_KPKEYS
+#include <asm/kpkeys_types.h>
+#endif
+
+#if defined(CONFIG_ARCH_HAS_KPKEYS) && !defined(__ASSEMBLY__)
+
+enum kpkeys_ctx {
+	KPKEYS_CTX_DEFAULT = 0,
+	KPKEYS_CTX_COUNT,
+};
+
+struct kpkeys_state {
+	bool entered_context;
+	struct arch_kpkeys_state arch_state;
+};
+
+#endif /* CONFIG_ARCH_HAS_KPKEYS && !__ASSEMBLY__ */
+
+#endif /* _LINUX_KPKEYS_TYPES_H */
diff --git a/mm/Kconfig b/mm/Kconfig
index afff1b25b543..4635628de622 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -1265,6 +1265,8 @@ config ARCH_USES_HIGH_VMA_FLAGS
 	bool
 config ARCH_HAS_PKEYS
 	bool
+config ARCH_HAS_KPKEYS
+	bool
 
 config ARCH_USES_PG_ARCH_2
 	bool

-- 
2.56.0


