Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8906606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 16:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PounKbFT;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Yz5ViYlQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=rdQIS/ECy3PO60roTk7Hl6DW/eEqOwD4J/t6PJ5uSgY=; b=PounKbFTKiuuQ63km8AaSa8alK
	LGjc0GYJeO9lQxC0gRPYiz9p2Q5XKiWQr3Jk6Zeyuo9QA0zpJ+D3OSu152ALKR//7vA/HWX4lbBYr
	geQmlY5iA6XL5SpbTpwqb4nNASPi6q0exlX/adbOHYdToL6s+s4XbC182Rm9CcHxnGrA/k7XS8fQs
	xh+Ohd8nZse+K0j1I4xBhzYVyhBq8TMLN+YXtYj41wMbKfeUca+4chcNYupclPk/+FTiZIKf6iCl9
	ES6OHseMkdnTdkcwAo1881G/g8RdmTd39PpnqPUPLN6U9Er1FIH7hfO5ABB1KpoJREZ0yg5UvyFWN
	FRK9oAzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPiUL-0000000Eve3-3gfo;
	Sat, 07 Nov 2026 15:37:53 +0000
Received: from mail-ej1-x647.google.com ([2a00:1450:4864:20::647])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPiU1-0000000Ev0p-24Lo
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 15:37:36 +0000
Received: by mail-ej1-x647.google.com with SMTP id a640c23a62f3a-c29c391bd2fso166013566b.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Nov 2026 07:37:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794065851; x=1794670651; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rdQIS/ECy3PO60roTk7Hl6DW/eEqOwD4J/t6PJ5uSgY=;
        b=Yz5ViYlQwzwrS5X2hL9aySCIXnAV/2/B1zoUcIaEZt6cjSUf43eBPfuFMmOwA0Gfst
         ombjCvslLgoT2iOifDPAb0TudILEJ/VYcsErhLM5JrLk9Uh2ht85IwebX/SWNYUWvKxg
         QOkTWW2OULwMNzxTTGpYf9cyAMnhOggeZKfCC9RP/rx2GYC0A1CdYqY8uoELXqwqWx+B
         VMCUJzss9NH2gIYedC+PUVAENY9vKXjjiejlKYKUL851FHqcBZybSWVFSHfUyW0HyWuS
         2Xfhe5moCqSVrTi6DLhcaQRNZeRBTwu9KdYBRRKKqzxfWpReTZaR8dYErM7WemjzU44O
         csqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794065851; x=1794670651;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rdQIS/ECy3PO60roTk7Hl6DW/eEqOwD4J/t6PJ5uSgY=;
        b=rnx/dmb9SLJCbnTuCSGks6bLEVREeo2aYFWD94z6iGybVgUnxC//zPm/DcxlFPh+Jv
         wwih92RQgpRUmqJLqCjpPTL9Awpog5BqYWe/4T3//FKGcPTz1DyTz1F23gwYQhy0aZNx
         fWlYddUyKpw8NbjOgXJWzoo7HwvQCHldsKAvyDV39VFNeBfqOG6iSqOuHIot9hNM7uHb
         QXJSVJ6tNO7sxw4oJi9OXDPv7RY5sP5PfGl5LMXhJNXee9+tu9Su0HFmtjEQaHtNkyPA
         1ADTAjaAWmQCIS2Irc4d3NTuaG27W38JTqy05gJD7J2eTRpjHsrkYxG+KIUsJa8LuzSV
         //4Q==
X-Forwarded-Encrypted: i=1; AKwUvBzQwJunHl6OUagvX2oGpE32p2kBE0FM0iqWHkWoslhODgYmoFSodEeNKBWqKAP3NQxUDaL/36Fgzrkwxp0+Mrqf@lists.infradead.org
X-Gm-Message-State: APuU4Z/fT245AinEEnNpm198/WWXVQPO3nIihEVx8rvGuKMGduPMd8qX
	h5FEo+QvI9GnrcUrclvzq/4Vk2/dIKhmO4obC7cRg1Ucu9FD8Ms7Wc+TJVaiRhfqOVMKFFHEiVj
	N5g==
X-Received: from ejxe19.prod.google.com ([2002:a17:906:81d3:b0:c2e:9100:5dcc])
 (user=ptosi job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:868a:b0:c31:e9b7:f10b
 with SMTP id a640c23a62f3a-c4d34c70d99mr414676666b.42.1794065851145; Sat, 07
 Nov 2026 07:37:31 -0800 (PST)
Date: Sat, 07 Nov 2026 16:36:23 +0100
In-Reply-To: <20261107-mte-kasan-split-v1-0-d84ea5f30f94@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261107-mte-kasan-split-v1-0-d84ea5f30f94@google.com>
X-Mailer: b4 0.14.3
Message-ID: <20261107-mte-kasan-split-v1-17-d84ea5f30f94@google.com>
Subject: [PATCH 17/24] arm64: Introduce MTE & KASAN tag handling helpers
From: "=?utf-8?q?Pierre-Cl=C3=A9ment_Tosi?=" <ptosi@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	"=?utf-8?q?Pierre-Cl=C3=A9ment_Tosi?=" <ptosi@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_073733_871892_A09418EF 
X-CRM114-Status: GOOD (  16.32  )
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

Introduce [__]mte_{tagged,tag_of}() helpers for MTE tags.

Use a naming convention which clearly indicates that the helpers are
dealing with the tag bits of the argument, as opposed to the tag value
actually associated in hardware with the memory the argument points to.
The get()/set() terminology may imply the latter, and actually is used
in that sense already e.g. mte_get_mem_tag() or mte_set_mem_tag_range().

Provide a const-compatible ("__"-prefixed) variant and type-checked
functions, these should provide compile-time validation (with zero
runtime overhead) of constant arguments.

Introduce [__]kasan_tag_{to,from}_mte() helpers for KASAN tags.

Here, the "__"-prefixed variants are asm-compatible.

Signed-off-by: Pierre-Cl=C3=A9ment Tosi <ptosi@google.com>
---
 arch/arm64/include/asm/mte-def.h   | 20 ++++++++++++++++++++
 arch/arm64/include/asm/mte-kasan.h | 29 +++++++++++++++++++++--------
 arch/arm64/mm/fault.c              |  2 +-
 3 files changed, 42 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/include/asm/mte-def.h b/arch/arm64/include/asm/mte-=
def.h
index 14ee86b019c2..660948a3fa9c 100644
--- a/arch/arm64/include/asm/mte-def.h
+++ b/arch/arm64/include/asm/mte-def.h
@@ -15,4 +15,24 @@
=20
 #define __MTE_PREAMBLE		ARM64_ASM_PREAMBLE ".arch_extension memtag\n"
=20
+#ifndef __ASSEMBLER__
+
+#include <linux/bitfield.h>
+#include <linux/types.h>
+
+#define __mte_tag_of(addr)	FIELD_GET(MTE_TAG_MASK, addr)
+#define __mte_tagged(addr, tag)	u64_replace_bits(addr, tag, MTE_TAG_MASK)
+
+static __always_inline u8 mte_tag_of(const void *ptr)
+{
+	return __mte_tag_of((u64)ptr);
+}
+
+static __always_inline void *mte_tagged(const void *ptr, u8 tag)
+{
+	return (void *)__mte_tagged((u64)ptr, tag);
+}
+
+#endif /* __ASSEMBLER__ */
+
 #endif /* __ASM_MTE_DEF_H  */
diff --git a/arch/arm64/include/asm/mte-kasan.h b/arch/arm64/include/asm/mt=
e-kasan.h
index 6f63c788470a..24d5d9d6d04b 100644
--- a/arch/arm64/include/asm/mte-kasan.h
+++ b/arch/arm64/include/asm/mte-kasan.h
@@ -13,24 +13,40 @@
 #include <asm/cputype.h>
 #include <asm/mte-def.h>
=20
+#define __KASAN_TAG_MTE_MASK		GENMASK(MTE_TAG_SIZE - 1, 0)
 /*
  * KASAN always uses a whole byte for its tags. With CONFIG_KASAN_HW_TAGS =
it
  * only uses tags in the range 0xF0-0xFF, which we map to MTE tags 0x0-0xF=
.
  */
+#define __kasan_tag_to_mte(tag)		((tag) & __KASAN_TAG_MTE_MASK)
+#define __kasan_tag_from_mte(tag)	((KASAN_TAG_MIN & ~__KASAN_TAG_MTE_MASK)=
 | (tag))
+
 #ifdef CONFIG_KASAN_HW_TAGS
-#define __MTE_TAG_MIN		(KASAN_TAG_MIN & 0xf)
-#define __MTE_TAG_MAX		(KASAN_TAG_MAX & 0xf)
-#define KASAN_GCR_INCL		GENMASK(__MTE_TAG_MAX, __MTE_TAG_MIN)
+#define KASAN_GCR_INCL \
+	GENMASK(__kasan_tag_to_mte(KASAN_TAG_MAX), __kasan_tag_to_mte(KASAN_TAG_M=
IN))
 #else
 #define KASAN_GCR_INCL		UL(0)
 #endif
=20
 #ifndef __ASSEMBLER__
=20
+#include <linux/bitfield.h>
 #include <linux/types.h>
=20
 #include <asm/sysreg.h>
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
 #ifdef CONFIG_KASAN_HW_TAGS
=20
 /* Whether the MTE asynchronous mode is enabled. */
@@ -71,10 +87,7 @@ static inline void mte_enable_tco(void)
=20
 static inline u8 mte_get_ptr_tag(void *ptr)
 {
-	/* Note: The format of KASAN tags is 0xF<x> */
-	u8 tag =3D 0xF0 | (u8)(((u64)(ptr)) >> MTE_TAG_SHIFT);
-
-	return tag;
+	return kasan_tag_from_mte(mte_tag_of(ptr));
 }
=20
 /* Get allocation tag for the address. */
@@ -140,7 +153,7 @@ static inline void mte_set_mem_tag_range(void *addr, si=
ze_t size, u8 tag,
 	dczid_bs =3D 4ul << (dczid & 0xf);
 	dczid_dzp =3D (dczid >> 4) & 1;
=20
-	curr =3D (u64)__tag_set(addr, tag);
+	curr =3D (u64)mte_tagged(addr, kasan_tag_to_mte(tag));
 	mask =3D dczid_bs - 1;
 	/* STG/STZG up to the end of the first block. */
 	end1 =3D curr | mask;
diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
index b22736853fcd..cf855aa1c30f 100644
--- a/arch/arm64/mm/fault.c
+++ b/arch/arm64/mm/fault.c
@@ -915,7 +915,7 @@ static int do_tag_check_fault(unsigned long far, unsign=
ed long esr,
 	 * Otherwise, bits 63:60 of FAR_EL1 are not UNKNOWN.
 	 */
 	if (!cpus_have_cap(ARM64_MTE_FAR))
-		far =3D (__untagged_addr(far) & ~MTE_TAG_MASK) | (far & MTE_TAG_MASK);
+		far =3D __mte_tagged(__untagged_addr(far), __mte_tag_of(far));
=20
 	do_bad_area(far, esr, regs);
 	return 0;

--=20
2.56.0.455.g6c5a503b38-goog


