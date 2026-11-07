Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D08606D80A
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 15:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LclwDgIE;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=fKYOzaBY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=aYsds2lmhwxKvfT8vs6KlKG3El1BipjqGgZyAuNVTLs=; b=LclwDgIEnWIEkM4sfvpleRc6hw
	EG2mVjHTqLDMh2WmR60xbNP7WASFdjGY8jTU2lWtzzTQIfhf0Fk9tUxIB5PCCOezV7ciTfGSIyLBf
	ndJv3iElz3D7JTTTZIy0PcxP2n8R6uBMPytzlFl/S6PqAofP2VEBPcxHLCLGw97UYua5Mksl90aHT
	uMT2/2ynwq08nS0Jz6+WAtxRXkQfxdCwyuQ0OEzwr4I2YTYgMnShih+d8mkSM6LBMJcByNc1KrXlh
	4FcmKJNPyEgZVZTxivj5Fo//PUc9Igs8LtvVyTkz6wcN8ZvJvOSMTe+IP/ZAo0fFC2oOe8J34byRr
	IBp+cbHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPiUQ-0000000Evmf-1WvO;
	Sat, 07 Nov 2026 15:37:58 +0000
Received: from mail-ed1-x545.google.com ([2a00:1450:4864:20::545])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPiU9-0000000EvKP-47sZ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 15:37:44 +0000
Received: by mail-ed1-x545.google.com with SMTP id 4fb4d7f45d1cf-6b5654ad27fso1240811a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Nov 2026 07:37:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794065860; x=1794670660; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aYsds2lmhwxKvfT8vs6KlKG3El1BipjqGgZyAuNVTLs=;
        b=fKYOzaBY3Fi+rbZ6U3KcAcH71Zf8+fC+Vx5/SRWCVR+bfZEWJ0MeGwFcAcMPObv9Pr
         oDD5PKSVHeIRp6k28HbqWDD0Zb2EGMC28/wv2XDCCv0Fg3bp9DGdZ9AfZ8KNBQ/iaOcK
         zOQ6N5kdgga31SwNSX65DuvJXcVsbrr2aGBIIr4dz9I3LVNKF8plYukKD6tMQjA8+mFt
         NYMKQNfAx3X2GQqu6KRvoo8yb+4F/GBeDEUJdDjNbzi0b3b20ao2DJGvdNt8zyd9sQJV
         61zf+il6Zn1wR4ZKs1U+uT6YuEOK3+aT7kDphE13bBaQSfhOiRSloPNPTh+pmPMDByf/
         XI1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794065860; x=1794670660;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aYsds2lmhwxKvfT8vs6KlKG3El1BipjqGgZyAuNVTLs=;
        b=xclsDBKLIh5OfK3qGQH9LvKa8GM5nD0S2Hhf6MUn7NzqZtTQW25EFE0K5J1zm4yJLm
         0fyGDARwjZG4i9wP7+84RIy083+7vVmRHrC9ykNWhUyG/k55KMVQTJ7XKkh8ZVKTQ4bt
         nvu6KcPb1nsnfKmSNcWj4rwWZDomnw9CTHs77YEXhW8ibcs71yt7xDOVmIJ13qwahkSa
         GbI4LTq7o+S8tY4e+IYqaEEvli0QDK1NT7XxYOl2+gxuu+4mmDY5O+YE3ag08tW8pgLQ
         9fgQ9Pr8uHRs7R6psZSaDS0PgBfA+dU3KTYf4OFrpVFISNUrlqD0NfgY0u/hCBaZB+K2
         C4pQ==
X-Forwarded-Encrypted: i=1; AL+hErGufmMH2B3ilhgPgeckGNi/L9Dlvnr0ZpqC9uIZUpZ6KMUgorSEvmG37EmzM2O6Orj4IqzFz0jC3esOD//q9xso@lists.infradead.org
X-Gm-Message-State: APuU4Z9PvOzbqSzEKnJn7aF/Kcxi1nm6rO0mhh70owh/mItPczjMKTOT
	+s325Epq2MbvUquz4BZd2IzP6u6N4xU7JNQnZmGjzmvNo3DiIzPE/ZQEZVzf4A8P/RL+vMKJhun
	FkQ==
X-Received: from edew26-n2.prod.google.com ([2002:a05:6402:a21a:20b0:6b4:895:eec9])
 (user=ptosi job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:5486:b0:6b5:97a5:c9ea
 with SMTP id 4fb4d7f45d1cf-6b597a5caa9mr3771497a12.7.1794065859600; Sat, 07
 Nov 2026 07:37:39 -0800 (PST)
Date: Sat, 07 Nov 2026 16:36:29 +0100
In-Reply-To: <20261107-mte-kasan-split-v1-0-d84ea5f30f94@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261107-mte-kasan-split-v1-0-d84ea5f30f94@google.com>
X-Mailer: b4 0.14.3
Message-ID: <20261107-mte-kasan-split-v1-23-d84ea5f30f94@google.com>
Subject: [PATCH 23/24] arm64: Fold <asm/mte-kasan.h> into <asm/kasan.h>
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
X-CRM114-CacheID: sfid-20261107_073742_090698_7C4C59CD 
X-CRM114-Status: GOOD (  19.78  )
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

Now that all MTE-specific implementation details have been extracted to
<asm/mte-def.h> and <asm/mte.h>, <asm/mte-kasan.h> only contains a thin
KASAN-to-MTE wrapping layer so fold it directly into <asm/kasan.h> to
prevent confusion or misuse and simplify header dependencies.

Update MAINTAINERS to remove the pattern that was specifically added to
track this header. This silences a checkpatch warning. If future arm64
KASAN headers are added, they should probably favor the arch-agnostic
header naming convention <asm/kasan*.h> instead, anyway.

Cc: Alexander Potapenko <glider@google.com>
Cc: Andrey Konovalov <andreyknvl@gmail.com>
Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>
Cc: Dmitry Vyukov <dvyukov@google.com>
Cc: kasan-dev@googlegroups.com
Signed-off-by: Pierre-Cl=C3=A9ment Tosi <ptosi@google.com>
---
 MAINTAINERS                        |   2 +-
 arch/arm64/include/asm/kasan.h     | 100 ++++++++++++++++++++++++++++++-
 arch/arm64/include/asm/mte-kasan.h | 120 ---------------------------------=
----
 arch/arm64/kernel/entry.S          |   2 +-
 arch/arm64/kernel/mte.c            |   2 +-
 5 files changed, 101 insertions(+), 125 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 93abbb315065..990237c9ac32 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14358,7 +14358,7 @@ L:	kasan-dev@googlegroups.com
 S:	Maintained
 B:	https://bugzilla.kernel.org/buglist.cgi?component=3DSanitizers&product=
=3DMemory%20Management
 F:	Documentation/dev-tools/kasan.rst
-F:	arch/*/include/asm/*kasan.h
+F:	arch/*/include/asm/kasan.h
 F:	arch/*/mm/kasan_init*
 F:	include/linux/kasan*.h
 F:	lib/Kconfig.kasan
diff --git a/arch/arm64/include/asm/kasan.h b/arch/arm64/include/asm/kasan.=
h
index 3106a2271781..45af725d6fd3 100644
--- a/arch/arm64/include/asm/kasan.h
+++ b/arch/arm64/include/asm/kasan.h
@@ -2,18 +2,54 @@
 #ifndef __ASM_KASAN_H
 #define __ASM_KASAN_H
=20
+#include <linux/bits.h>
+#include <linux/const.h>
+#include <linux/kasan-tags.h>
+
+#include <asm/mte-def.h>
+
+#define __KASAN_TAG_MTE_MASK		GENMASK(MTE_TAG_SIZE - 1, 0)
+/*
+ * KASAN always uses a whole byte for its tags. With CONFIG_KASAN_HW_TAGS =
it
+ * only uses tags in the range 0xF0-0xFF, which we map to MTE tags 0x0-0xF=
.
+ */
+#define __kasan_tag_to_mte(tag)		((tag) & __KASAN_TAG_MTE_MASK)
+#define __kasan_tag_from_mte(tag)	((KASAN_TAG_MIN & ~__KASAN_TAG_MTE_MASK)=
 | (tag))
+
+#ifdef CONFIG_KASAN_HW_TAGS
+#define KASAN_GCR_INCL \
+	GENMASK(__kasan_tag_to_mte(KASAN_TAG_MAX), __kasan_tag_to_mte(KASAN_TAG_M=
IN))
+#else
+#define KASAN_GCR_INCL		UL(0)
+#endif
+
 #ifndef __ASSEMBLER__
=20
+#include <linux/bitfield.h>
 #include <linux/linkage.h>
+#include <linux/types.h>
+
 #include <asm/memory.h>
-#include <asm/mte-def.h>
-#include <asm/mte-kasan.h>
+#include <asm/mte.h>
 #include <asm/pgtable-types.h>
+#include <asm/sysreg.h>
=20
 #define arch_kasan_set_tag(addr, tag)	__tag_set(addr, tag)
 #define arch_kasan_reset_tag(addr)	__tag_reset(addr)
 #define arch_kasan_get_tag(addr)	__tag_get(addr)
=20
+#define KASAN_TAG_MTE_MASK		GENMASK_U8(MTE_TAG_SIZE - 1, 0)
+
+static __always_inline u8 kasan_tag_to_mte(u8 tag)
+{
+	return u8_get_bits(tag, KASAN_TAG_MTE_MASK);
+}
+
+static __always_inline u8 kasan_tag_from_mte(u8 tag)
+{
+	return u8_replace_bits(KASAN_TAG_MIN, tag, KASAN_TAG_MTE_MASK);
+}
+
 #if defined(CONFIG_KASAN_GENERIC) || defined(CONFIG_KASAN_SW_TAGS)
=20
 asmlinkage void kasan_early_init(void);
@@ -24,7 +60,67 @@ static inline void kasan_init(void) { }
 #endif
=20
 #ifdef CONFIG_KASAN_HW_TAGS
+
 #define KASAN_GRANULE_SIZE	MTE_GRANULE_SIZE
+
+static __always_inline void arch_enable_tag_checks_sync(void)
+{
+	mte_enable_kernel_sync();
+}
+
+static __always_inline void arch_enable_tag_checks_async(void)
+{
+	mte_enable_kernel_async();
+}
+
+static __always_inline void arch_enable_tag_checks_asymm(void)
+{
+	mte_enable_kernel_asymm();
+}
+
+static __always_inline int arch_enable_tag_checks_write_only(void)
+{
+	return mte_enable_kernel_store_only();
+}
+
+static __always_inline void arch_suppress_tag_checks_stop(void)
+{
+	set_pstate_tco(0);
+}
+
+static __always_inline void arch_suppress_tag_checks_start(void)
+{
+	set_pstate_tco(1);
+}
+
+static __always_inline bool arch_flush_async_tag_fault(void)
+{
+	return mte_get_reset_tfsr();
+}
+
+static __always_inline u8 arch_get_mem_tag(void *addr)
+{
+	return kasan_tag_from_mte(__mte_tag_of(__ldg((u64)addr)));
+}
+
+static __always_inline void *arch_set_random_tag(const void *addr)
+{
+	/* Writes the random MTE tag in bits [59:56]. */
+	addr =3D (const void *)__irg((u64)addr);
+
+	/* Sets bits [63:60] as KASAN expects. */
+	return (void *)__tag_set(addr, kasan_tag_from_mte(mte_tag_of(addr)));
+}
+
+static __always_inline void arch_set_mem_tag_range(void *addr, size_t size=
,
+						   u8 tag, bool zero)
+{
+	if (zero)
+		mte_tag_and_zero_range(addr, size, kasan_tag_to_mte(tag));
+	else
+		mte_tag_range(addr, size, kasan_tag_to_mte(tag));
+}
+
 #endif /* CONFIG_KASAN_HW_TAGS */
=20
 #endif
diff --git a/arch/arm64/include/asm/mte-kasan.h b/arch/arm64/include/asm/mt=
e-kasan.h
deleted file mode 100644
index c0224a2bb515..000000000000
--- a/arch/arm64/include/asm/mte-kasan.h
+++ /dev/null
@@ -1,120 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Copyright (C) 2020 ARM Ltd.
- */
-#ifndef __ASM_MTE_KASAN_H
-#define __ASM_MTE_KASAN_H
-
-#include <linux/bits.h>
-#include <linux/const.h>
-#include <linux/kasan-tags.h>
-
-#include <asm/mte-def.h>
-
-#define __KASAN_TAG_MTE_MASK		GENMASK(MTE_TAG_SIZE - 1, 0)
-/*
- * KASAN always uses a whole byte for its tags. With CONFIG_KASAN_HW_TAGS =
it
- * only uses tags in the range 0xF0-0xFF, which we map to MTE tags 0x0-0xF=
.
- */
-#define __kasan_tag_to_mte(tag)		((tag) & __KASAN_TAG_MTE_MASK)
-#define __kasan_tag_from_mte(tag)	((KASAN_TAG_MIN & ~__KASAN_TAG_MTE_MASK)=
 | (tag))
-
-#ifdef CONFIG_KASAN_HW_TAGS
-#define KASAN_GCR_INCL \
-	GENMASK(__kasan_tag_to_mte(KASAN_TAG_MAX), __kasan_tag_to_mte(KASAN_TAG_M=
IN))
-#else
-#define KASAN_GCR_INCL		UL(0)
-#endif
-
-#ifndef __ASSEMBLER__
-
-#include <linux/bitfield.h>
-#include <linux/types.h>
-
-#include <asm/mte.h>
-#include <asm/sysreg.h>
-
-#define KASAN_TAG_MTE_MASK		GENMASK_U8(MTE_TAG_SIZE - 1, 0)
-
-static __always_inline u8 kasan_tag_to_mte(u8 tag)
-{
-	return u8_get_bits(tag, KASAN_TAG_MTE_MASK);
-}
-
-static __always_inline u8 kasan_tag_from_mte(u8 tag)
-{
-	return u8_replace_bits(KASAN_TAG_MIN, tag, KASAN_TAG_MTE_MASK);
-}
-
-#ifdef CONFIG_KASAN_HW_TAGS
-
-/*
- * These functions don't include system_supports_mte() checks,
- * as KASAN only calls them when MTE is supported and enabled.
- */
-
-static __always_inline void arch_enable_tag_checks_sync(void)
-{
-	mte_enable_kernel_sync();
-}
-
-static __always_inline void arch_enable_tag_checks_async(void)
-{
-	mte_enable_kernel_async();
-}
-
-static __always_inline void arch_enable_tag_checks_asymm(void)
-{
-	mte_enable_kernel_asymm();
-}
-
-static __always_inline int arch_enable_tag_checks_write_only(void)
-{
-	return mte_enable_kernel_store_only();
-}
-
-static __always_inline void arch_suppress_tag_checks_stop(void)
-{
-	set_pstate_tco(0);
-}
-
-static __always_inline void arch_suppress_tag_checks_start(void)
-{
-	set_pstate_tco(1);
-}
-
-static __always_inline bool arch_flush_async_tag_fault(void)
-{
-	return mte_get_reset_tfsr();
-}
-
-/* Get allocation tag for the address. */
-static __always_inline u8 arch_get_mem_tag(void *addr)
-{
-	return kasan_tag_from_mte(__mte_tag_of(__ldg((u64)addr)));
-}
-
-/* Generate a random tag. */
-static __always_inline void *arch_set_random_tag(const void *addr)
-{
-	/* Writes the random MTE tag in bits [59:56]. */
-	addr =3D (const void *)__irg((u64)addr);
-
-	/* Sets bits [63:60] as KASAN expects. */
-	return (void *)__tag_set(addr, kasan_tag_from_mte(mte_tag_of(addr)));
-}
-
-static __always_inline void arch_set_mem_tag_range(void *addr, size_t size=
,
-						   u8 tag, bool zero)
-{
-	if (zero)
-		mte_tag_and_zero_range(addr, size, kasan_tag_to_mte(tag));
-	else
-		mte_tag_range(addr, size, kasan_tag_to_mte(tag));
-}
-
-#endif /* CONFIG_KASAN_HW_TAGS */
-
-#endif /* __ASSEMBLER__ */
-
-#endif /* __ASM_MTE_KASAN_H  */
diff --git a/arch/arm64/kernel/entry.S b/arch/arm64/kernel/entry.S
index d1d9a7a049a7..2da704f53b5a 100644
--- a/arch/arm64/kernel/entry.S
+++ b/arch/arm64/kernel/entry.S
@@ -20,8 +20,8 @@
 #include <asm/errno.h>
 #include <asm/esr.h>
 #include <asm/irq.h>
+#include <asm/kasan.h>
 #include <asm/memory.h>
-#include <asm/mte-kasan.h>
 #include <asm/mmu.h>
 #include <asm/processor.h>
 #include <asm/ptrace.h>
diff --git a/arch/arm64/kernel/mte.c b/arch/arm64/kernel/mte.c
index 675ba6a803cf..d072cb76ad05 100644
--- a/arch/arm64/kernel/mte.c
+++ b/arch/arm64/kernel/mte.c
@@ -24,8 +24,8 @@
=20
 #include <asm/barrier.h>
 #include <asm/cpufeature.h>
+#include <asm/kasan.h>
 #include <asm/mte.h>
-#include <asm/mte-kasan.h>
 #include <asm/ptrace.h>
 #include <asm/sysreg.h>
=20

--=20
2.56.0.455.g6c5a503b38-goog


