Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B37F2606A333
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 15:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dA1KJ5g9;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=bj3E78lc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=4dleiwH3H/7HQB6pZm+q+ilfI0YEmGllWKxu9A8R+YI=; b=dA1KJ5g9LjYQBsc/Fup9ZUgIJm
	y4XJFGp5N0YUv7qv75BRh81OX1I3ovHD6bIxi9nIV1AFd3es5vgzfDHkDwBcqR/hjqttivb6NAPfU
	N5nB5atdj3JWRNe3hBXAwqLp884izZn6DzlqnzlxGoPwmydSfGgRKVpwmhZED05tX6uwnenq6bXg9
	9sExbqbdABc2X1tstMESSIUsLMd2QgbhGY+gEqpKkB6j1KQ7gUR6+hD9xXWM5j4w7RH+L56IxaR/2
	wMGUHgigXegCHtUoLcpGFjH9IcdFtrFH9oYx7Re0++BYw/wLmHKgdXu5jIdvOXVmcslrhw8pFVUPZ
	9LXTPuEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPiUP-0000000EvkV-0mOU;
	Sat, 07 Nov 2026 15:37:57 +0000
Received: from mail-ed1-x546.google.com ([2a00:1450:4864:20::546])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPiU8-0000000EvHi-26pr
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 15:37:42 +0000
Received: by mail-ed1-x546.google.com with SMTP id 4fb4d7f45d1cf-6b65682a122so307290a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Nov 2026 07:37:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794065859; x=1794670659; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4dleiwH3H/7HQB6pZm+q+ilfI0YEmGllWKxu9A8R+YI=;
        b=bj3E78lc2WLILiPqSWq6CbLCmZ7dX8Zvw9/nYGziyEnq/KwdIBXYHhOK3u/TIt9EKy
         KXBfrTpKBBeMjg9mDD9vTunbo0AgN4hoaEbiXwGT4/SDU7MlADAzbt09gsCvE55Y2R8o
         foq5YQX/v4Y7a5P2jBDLBvKGI/wE6GY2h65LVRjaIvYtOJz5wgiGTcsJh0DnrJx4nG5p
         SpFtA21RAQ1S84j0XPetulNNnACR2xcXD2R5Z6gOzJlYjTfx5qhCSXPZ8uO3VHwN2W1n
         +6mTbkHtnwVyd33OhmEsJMzXmKIkGNA5D2+XIX0IebOaqk08DiFgIctwB+s8nwTp/hFy
         RXfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794065859; x=1794670659;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4dleiwH3H/7HQB6pZm+q+ilfI0YEmGllWKxu9A8R+YI=;
        b=rCz1FwX+8f5vXjcuLlMXjIXwzHBkEIBuFQL93icELZAUZzB/GjGjuzRS5qLlrQwoKl
         stJZbCU2O8aNuIt6CwnsDDphVTOtQ+io6Tz2sRHSSMggHEqzou6u/oQCKvnHRAdQ+9T/
         tq32Q/I76ENGp81aG0jBCgOOa5UnWgqIwfNX/m1xzHwh/uz8MtGDDrOG+o+T62/wJDax
         4KOO1/lDjvYskYBNm0mLbq8AonL4KOfMGu2FjPYDq5mip747YHHPUNeqQOQiXoqWNHiK
         B+KbVRzaSzr+uNYpvJVlAfMl32+QI+YVXjfsBUrdAc5Iv4ReTY0mHLnR3Qo6v2f8hk4u
         Hkww==
X-Forwarded-Encrypted: i=1; AL+hErFMdiuBiVl6Wd6zArLtpdFt8gvqfrxBpepasKIBWV5KOLcY/xzxW6G2ahp7uXVoTXTtlD+/BspFK/0teczXvCmm@lists.infradead.org
X-Gm-Message-State: APuU4Z9CBEKtCXR6QS6ZeH2Yy9T/bsOYHijQ00PuOkFx9e6cumqvGJST
	vY/sx5+CNzzh8iRvj7umg2McL7r+/uwKlLwK6fLv4CSq8OjnUB7JVmQii8EE1YpNphnR27+K+Kz
	2Qg==
X-Received: from eddq13.prod.google.com ([2002:a05:6402:518d:b0:6b6:fcaf:dc3a])
 (user=ptosi job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:27cf:b0:6b1:da03:d010
 with SMTP id 4fb4d7f45d1cf-6b5977f54c0mr4472802a12.23.1794065858398; Sat, 07
 Nov 2026 07:37:38 -0800 (PST)
Date: Sat, 07 Nov 2026 16:36:28 +0100
In-Reply-To: <20261107-mte-kasan-split-v1-0-d84ea5f30f94@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261107-mte-kasan-split-v1-0-d84ea5f30f94@google.com>
X-Mailer: b4 0.14.3
Message-ID: <20261107-mte-kasan-split-v1-22-d84ea5f30f94@google.com>
Subject: [PATCH 22/24] arm64: Consolidate MTE-based KASAN in mte-kasan.h
From: "=?utf-8?q?Pierre-Cl=C3=A9ment_Tosi?=" <ptosi@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Alexander Potapenko <glider@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, kasan-dev@googlegroups.com, 
	"=?utf-8?q?Pierre-Cl=C3=A9ment_Tosi?=" <ptosi@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_073740_590755_1437F436 
X-CRM114-Status: GOOD (  18.82  )
X-Spam-Score: -9.5 (---------)
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
X-Spam-Status: No, score=-26.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

As the KASAN-agnostic logic has been carved out of these functions into
standalone MTE functions and since all their non-KASAN callers have been
migrated to those KASAN-agnostic functions and/or arch-agnostic KASAN
functions, the only remaining callers are in KASAN core code and access
them through their arch_*() aliases, which are now an unnecessary level
of indirection.

Therefore, fold the aliases into __always_inline functions.

First, note that this now exposes arch_*() as proper C symbols. Although
the aliasing macros were necessary when first introduced by commit
ccbe2aaba1ed ("arm64: kasan: add arch layer for memory tagging helpers")
because of mm/kasan/kasan.h's reliance on #ifndef to provide fallbacks,
they have since been made redundant by commit e34f1e2ee098 ("kasan: drop
empty tagging-related defines").

Second, it moves the KASAN arch definitions out of <asm/memory.h>. It
isn't clear to me why they were originally placed there but since they
are only for arch-agnostic KASAN code and are guarded by KASAN_HW_TAGS,
it seems more appropriate to have them in a KASAN arch header.

Drop the !ARM64_MTE fallbacks for mte_*() instead of renaming them since
they were deadcode, being only called through arch_*(), which were only
defined when KASAN_HW_TAGS and given that KASAN_HW_TAGS means ARM64_MTE.

Move the declarations of mte_enable_kernel_*() to <asm/mte.h> and
provide no alternatives when !ARM64_MTE since their signatures imply
that they never fail (return void) so a currently non-existent caller
could get confused. A future patch might rework that and add fallbacks.

Cc: Alexander Potapenko <glider@google.com>
Cc: Andrey Konovalov <andreyknvl@gmail.com>
Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>
Cc: Dmitry Vyukov <dvyukov@google.com>
Cc: kasan-dev@googlegroups.com
Signed-off-by: Pierre-Cl=C3=A9ment Tosi <ptosi@google.com>
---
 arch/arm64/include/asm/memory.h    | 14 -------
 arch/arm64/include/asm/mte-kasan.h | 86 ++++++++++++++--------------------=
----
 arch/arm64/include/asm/mte.h       |  5 +++
 3 files changed, 36 insertions(+), 69 deletions(-)

diff --git a/arch/arm64/include/asm/memory.h b/arch/arm64/include/asm/memor=
y.h
index 29e7537f5e58..2aa14788c050 100644
--- a/arch/arm64/include/asm/memory.h
+++ b/arch/arm64/include/asm/memory.h
@@ -309,20 +309,6 @@ static inline const void *__tag_set(const void *addr, =
u8 tag)
 	return (const void *)(__addr | __tag_shifted(tag));
 }
=20
-#ifdef CONFIG_KASAN_HW_TAGS
-#define arch_enable_tag_checks_sync()		mte_enable_kernel_sync()
-#define arch_enable_tag_checks_async()		mte_enable_kernel_async()
-#define arch_enable_tag_checks_asymm()		mte_enable_kernel_asymm()
-#define arch_enable_tag_checks_write_only()	mte_enable_kernel_store_only()
-#define arch_suppress_tag_checks_start()	mte_enable_tco()
-#define arch_suppress_tag_checks_stop()		mte_disable_tco()
-#define arch_flush_async_tag_fault()		mte_get_reset_tfsr()
-#define arch_set_random_tag(addr)		mte_set_random_tag(addr)
-#define arch_get_mem_tag(addr)			mte_get_mem_tag(addr)
-#define arch_set_mem_tag_range(addr, size, tag, init)	\
-			mte_set_mem_tag_range((addr), (size), (tag), (init))
-#endif /* CONFIG_KASAN_HW_TAGS */
-
 /*
  * Physical vs virtual RAM address space conversion.  These are
  * private definitions which should NOT be used outside memory.h
diff --git a/arch/arm64/include/asm/mte-kasan.h b/arch/arm64/include/asm/mt=
e-kasan.h
index 81a8cf3b9a95..c0224a2bb515 100644
--- a/arch/arm64/include/asm/mte-kasan.h
+++ b/arch/arm64/include/asm/mte-kasan.h
@@ -46,98 +46,74 @@ static __always_inline u8 kasan_tag_from_mte(u8 tag)
 	return u8_replace_bits(KASAN_TAG_MIN, tag, KASAN_TAG_MTE_MASK);
 }
=20
-#ifdef CONFIG_ARM64_MTE
+#ifdef CONFIG_KASAN_HW_TAGS
=20
 /*
- * These functions are meant to be only used from KASAN runtime through
- * the arch_*() interface defined in asm/memory.h.
  * These functions don't include system_supports_mte() checks,
  * as KASAN only calls them when MTE is supported and enabled.
  */
=20
-static inline void mte_disable_tco(void)
+static __always_inline void arch_enable_tag_checks_sync(void)
 {
-	set_pstate_tco(0);
+	mte_enable_kernel_sync();
 }
=20
-static inline void mte_enable_tco(void)
+static __always_inline void arch_enable_tag_checks_async(void)
 {
-	set_pstate_tco(1);
+	mte_enable_kernel_async();
 }
=20
-/* Get allocation tag for the address. */
-static inline u8 mte_get_mem_tag(void *addr)
+static __always_inline void arch_enable_tag_checks_asymm(void)
 {
-	return kasan_tag_from_mte(__mte_tag_of(__ldg((u64)addr)));
+	mte_enable_kernel_asymm();
 }
=20
-/* Generate a random tag. */
-static inline void *mte_set_random_tag(const void *addr)
+static __always_inline int arch_enable_tag_checks_write_only(void)
 {
-	/* Writes the random MTE tag in bits [59:56]. */
-	addr =3D (const void *)__irg((u64)addr);
-
-	/* Sets bits [63:60] as KASAN expects. */
-	return (void *)__tag_set(addr, kasan_tag_from_mte(mte_tag_of(addr)));
+	return mte_enable_kernel_store_only();
 }
=20
-static inline void mte_set_mem_tag_range(void *addr, size_t size, u8 tag,
-					 bool zero)
+static __always_inline void arch_suppress_tag_checks_stop(void)
 {
-	if (zero)
-		mte_tag_and_zero_range(addr, size, kasan_tag_to_mte(tag));
-	else
-		mte_tag_range(addr, size, kasan_tag_to_mte(tag));
-}
-
-void mte_enable_kernel_sync(void);
-void mte_enable_kernel_async(void);
-void mte_enable_kernel_asymm(void);
-int mte_enable_kernel_store_only(void);
-
-#else /* CONFIG_ARM64_MTE */
-
-static inline void mte_disable_tco(void)
-{
-}
-
-static inline void mte_enable_tco(void)
-{
-}
-
-static inline u8 mte_get_mem_tag(void *addr)
-{
-	return 0xFF;
+	set_pstate_tco(0);
 }
=20
-static inline void *mte_set_random_tag(const void *addr)
+static __always_inline void arch_suppress_tag_checks_start(void)
 {
-	return (void *)__tag_set(addr, 0xFF);
+	set_pstate_tco(1);
 }
=20
-static inline void mte_set_mem_tag_range(void *addr, size_t size,
-						u8 tag, bool init)
+static __always_inline bool arch_flush_async_tag_fault(void)
 {
+	return mte_get_reset_tfsr();
 }
=20
-static inline void mte_enable_kernel_sync(void)
+/* Get allocation tag for the address. */
+static __always_inline u8 arch_get_mem_tag(void *addr)
 {
+	return kasan_tag_from_mte(__mte_tag_of(__ldg((u64)addr)));
 }
=20
-static inline void mte_enable_kernel_async(void)
+/* Generate a random tag. */
+static __always_inline void *arch_set_random_tag(const void *addr)
 {
-}
+	/* Writes the random MTE tag in bits [59:56]. */
+	addr =3D (const void *)__irg((u64)addr);
=20
-static inline void mte_enable_kernel_asymm(void)
-{
+	/* Sets bits [63:60] as KASAN expects. */
+	return (void *)__tag_set(addr, kasan_tag_from_mte(mte_tag_of(addr)));
 }
=20
-static inline int mte_enable_kernel_store_only(void)
+static __always_inline void arch_set_mem_tag_range(void *addr, size_t size=
,
+						   u8 tag, bool zero)
 {
-	return -EINVAL;
+	if (zero)
+		mte_tag_and_zero_range(addr, size, kasan_tag_to_mte(tag));
+	else
+		mte_tag_range(addr, size, kasan_tag_to_mte(tag));
 }
=20
-#endif /* CONFIG_ARM64_MTE */
+#endif /* CONFIG_KASAN_HW_TAGS */
=20
 #endif /* __ASSEMBLER__ */
=20
diff --git a/arch/arm64/include/asm/mte.h b/arch/arm64/include/asm/mte.h
index 9ba215b2b0fd..34d1438019ed 100644
--- a/arch/arm64/include/asm/mte.h
+++ b/arch/arm64/include/asm/mte.h
@@ -47,6 +47,11 @@ static inline bool system_uses_async_mte_faults(void)
 {
 	return static_branch_unlikely(&mte_async_or_asymm_mode);
 }
+
+void mte_enable_kernel_sync(void);
+void mte_enable_kernel_async(void);
+void mte_enable_kernel_asymm(void);
+int mte_enable_kernel_store_only(void);
 #else
 static inline bool system_uses_sync_mte_faults(void)
 {

--=20
2.56.0.455.g6c5a503b38-goog


