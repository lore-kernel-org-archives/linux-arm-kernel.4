Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8AC7606D80A
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 15:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=c+2uQUFO;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=YcLkV+7m
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ymerlQQbzBI7LWyfvxNA92j5SCLnOFejvA7ndvJleRY=; b=c+2uQUFOeYOglg7bIoO0Xfgyad
	pFEYD0JLWUwYi1t8CtjPeIPEAPQs4PDuamJ18NFleN14EFO4F/25k1Osx/wtT20GSKKgcCTX5hJp0
	C3uDPQr7Ra5cEhk0+UrSxp4gAM5cSh/6aTakUlGVshqohBMeZAPk8rr/OZ3ZUZXjva5e5xy2FainP
	xV5Wrt0i8JlX2wv+7XBgPnhV0g2+vGgjbEEKghtRWmZ8X1A2KsbcUQQdzvqKavBncEXohfA/hTKsV
	RoYy1usKnGlMhifV3BMHou19W0P9U6a6w+vxNxE/G8iPYHnWcwEdhZyC4lz6jI9vlQk7feGSzCSRJ
	oBUf7gSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPiUM-0000000Evgn-3wPb;
	Sat, 07 Nov 2026 15:37:54 +0000
Received: from mail-ej1-x647.google.com ([2a00:1450:4864:20::647])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPiU5-0000000EvBA-1med
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 15:37:38 +0000
Received: by mail-ej1-x647.google.com with SMTP id a640c23a62f3a-c40285df2a0so102672466b.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Nov 2026 07:37:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794065855; x=1794670655; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ymerlQQbzBI7LWyfvxNA92j5SCLnOFejvA7ndvJleRY=;
        b=YcLkV+7mNig4C49EBuqSVLNJGYvWPNWizvDo65ENluTsxP1GXzNWGy/HivHnHvj40a
         614IlnNO68Jm0PPw5MBIaFmksTgpAb/04bNufC1H7pgyp/y7zurmuZ5lgDg4Pe13cSzK
         5VBEg/8DzcfTPVl5kr/6l6o9wKgSs39ZE0QaI3tMUfxABYLvyrxHXyx2QLtdJSLjC7Q2
         HHJMHsg3rkY/C/X2n+as8ArRF6zjAAwAcKcis4jZbJ1MG7jPa50cuhycLDGjZDmyo1q4
         PARbJZvbgbisfvQAgLcJcPLVVzxeJ/XT6N5P7l6aIHeC7fF2kuvU4J5fdKPaiO/qS830
         NN3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794065855; x=1794670655;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ymerlQQbzBI7LWyfvxNA92j5SCLnOFejvA7ndvJleRY=;
        b=ouoS9i+aAzFcEWFlvhmQcHs6spJGU5IjzhJ3I/KxhebF1gL50abOffJlye+5OczBBX
         /HpTRtvgTPKF/nRkOuaQLX2GK9e+sU37v3IWAXSwPTcpRp2bdO7YXd79w55LW4ckuMT4
         GQSbpc0kOMMcfAxnpuBONh4tiVxM6JeqtB9PpAMCAW93hYRFXSwaSKrniQ8FuNWxfOht
         7H+YcWnpr7tVz2Myu7HgsSWO1zvbYnQwuJlb3IE1pPWpRsxDaKPi/ZEuWBs8Kj6dl2gE
         Idc0yT7PiOWZQc0eOHEfnYaimEA67wefS2WXQ80Ctx8M87MH8j0fNRgHaluEiGjXvic8
         cwMw==
X-Forwarded-Encrypted: i=1; AL+hErGoiAklzTLu9V2q3ucGFnq2wG7z/g96IJIPKnqcx/jzNHdvgQmMXX2feF1/4A1pkW+2d97JoNiXNyPd6F8WCxx6@lists.infradead.org
X-Gm-Message-State: APuU4Z+wOHx5/yKIOIoVkmjfzE+iJAvCrgsg32vKKXbgbCg6/kDUc4kQ
	Q748ffseMvRe+qxr4BB+D8A9Ub6NVvYurlJhh+oWly4VlhaY1dSGwb/Td7oczM9URFd2XhujKKZ
	XiA==
X-Received: from ejco12.prod.google.com ([2002:a17:906:37cc:b0:c31:97d6:2c5])
 (user=ptosi job=prod-delivery.src-stubby-dispatcher) by 2002:a17:906:7952:b0:c3f:7270:10ab
 with SMTP id a640c23a62f3a-c4d34a71de4mr496841466b.14.1794065855169; Sat, 07
 Nov 2026 07:37:35 -0800 (PST)
Date: Sat, 07 Nov 2026 16:36:26 +0100
In-Reply-To: <20261107-mte-kasan-split-v1-0-d84ea5f30f94@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261107-mte-kasan-split-v1-0-d84ea5f30f94@google.com>
X-Mailer: b4 0.14.3
Message-ID: <20261107-mte-kasan-split-v1-20-d84ea5f30f94@google.com>
Subject: [PATCH 20/24] arm64: Move MTE insn wrappers to <asm/mte-def.h>
From: "=?utf-8?q?Pierre-Cl=C3=A9ment_Tosi?=" <ptosi@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	"=?utf-8?q?Pierre-Cl=C3=A9ment_Tosi?=" <ptosi@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_073737_574897_D49A4455 
X-CRM114-Status: GOOD (  11.58  )
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

Relocate all assembly from <asm/mte-kasan.h> to a KASAN-agnostic header.

Signed-off-by: Pierre-Cl=C3=A9ment Tosi <ptosi@google.com>
---
 arch/arm64/include/asm/mte-def.h   | 45 ++++++++++++++++++++++++++++++++++
 arch/arm64/include/asm/mte-kasan.h | 49 +++-------------------------------=
----
 2 files changed, 48 insertions(+), 46 deletions(-)

diff --git a/arch/arm64/include/asm/mte-def.h b/arch/arm64/include/asm/mte-=
def.h
index 660948a3fa9c..b86d0e7e45ed 100644
--- a/arch/arm64/include/asm/mte-def.h
+++ b/arch/arm64/include/asm/mte-def.h
@@ -19,6 +19,7 @@
=20
 #include <linux/bitfield.h>
 #include <linux/types.h>
+#include <asm/compiler.h>
=20
 #define __mte_tag_of(addr)	FIELD_GET(MTE_TAG_MASK, addr)
 #define __mte_tagged(addr, tag)	u64_replace_bits(addr, tag, MTE_TAG_MASK)
@@ -33,6 +34,50 @@ static __always_inline void *mte_tagged(const void *ptr,=
 u8 tag)
 	return (void *)__mte_tagged((u64)ptr, tag);
 }
=20
+static __always_inline u64 __irg(u64 addr)
+{
+	asm volatile(__MTE_PREAMBLE "irg %0, %0"
+		     : "+r" (addr));
+
+	return addr;
+}
+
+static __always_inline u64 __ldg(u64 addr)
+{
+	asm(__MTE_PREAMBLE "ldg %0, [%0]"
+	    : "+r" (addr));
+
+	return addr;
+}
+
+static __always_inline u64 __stg_post(u64 addr)
+{
+	asm volatile(__MTE_PREAMBLE "stg %0, [%0], #16"
+		     : "+r" (addr)
+		     :
+		     : "memory");
+	return addr;
+}
+
+static __always_inline u64 __stzg_post(u64 addr)
+{
+	asm volatile(__MTE_PREAMBLE "stzg %0, [%0], #16"
+		     : "+r" (addr)
+		     :
+		     : "memory");
+	return addr;
+}
+
+static __always_inline void __dc_gva(u64 addr)
+{
+	asm volatile(__MTE_PREAMBLE "dc gva, %0" : : "r" (addr) : "memory");
+}
+
+static __always_inline void __dc_gzva(u64 addr)
+{
+	asm volatile(__MTE_PREAMBLE "dc gzva, %0" : : "r" (addr) : "memory");
+}
+
 #endif /* __ASSEMBLER__ */
=20
 #endif /* __ASM_MTE_DEF_H  */
diff --git a/arch/arm64/include/asm/mte-kasan.h b/arch/arm64/include/asm/mt=
e-kasan.h
index 9d018d3a0b3b..66d72d0d3c43 100644
--- a/arch/arm64/include/asm/mte-kasan.h
+++ b/arch/arm64/include/asm/mte-kasan.h
@@ -9,7 +9,6 @@
 #include <linux/const.h>
 #include <linux/kasan-tags.h>
=20
-#include <asm/compiler.h>
 #include <asm/cputype.h>
 #include <asm/mte-def.h>
=20
@@ -66,57 +65,20 @@ static inline void mte_enable_tco(void)
 	set_pstate_tco(1);
 }
=20
-static inline u8 mte_get_ptr_tag(void *ptr)
-{
-	return kasan_tag_from_mte(mte_tag_of(ptr));
-}
-
 /* Get allocation tag for the address. */
 static inline u8 mte_get_mem_tag(void *addr)
 {
-	asm(__MTE_PREAMBLE "ldg %0, [%0]"
-		: "+r" (addr));
-
-	return mte_get_ptr_tag(addr);
+	return kasan_tag_from_mte(__mte_tag_of(__ldg((u64)addr)));
 }
=20
 /* Generate a random tag. */
 static inline void *mte_set_random_tag(const void *addr)
 {
 	/* Writes the random MTE tag in bits [59:56]. */
-	asm volatile(__MTE_PREAMBLE "irg %0, %0"
-		: "+r" (addr));
+	addr =3D (const void *)__irg((u64)addr);
=20
 	/* Sets bits [63:60] as KASAN expects. */
-	return (void *)__tag_set(addr, mte_get_ptr_tag((void *)addr));
-}
-
-static inline u64 __stg_post(u64 p)
-{
-	asm volatile(__MTE_PREAMBLE "stg %0, [%0], #16"
-		     : "+r"(p)
-		     :
-		     : "memory");
-	return p;
-}
-
-static inline u64 __stzg_post(u64 p)
-{
-	asm volatile(__MTE_PREAMBLE "stzg %0, [%0], #16"
-		     : "+r"(p)
-		     :
-		     : "memory");
-	return p;
-}
-
-static inline void __dc_gva(u64 p)
-{
-	asm volatile(__MTE_PREAMBLE "dc gva, %0" : : "r"(p) : "memory");
-}
-
-static inline void __dc_gzva(u64 p)
-{
-	asm volatile(__MTE_PREAMBLE "dc gzva, %0" : : "r"(p) : "memory");
+	return (void *)__tag_set(addr, kasan_tag_from_mte(mte_tag_of(addr)));
 }
=20
 /*
@@ -188,11 +150,6 @@ static inline void mte_enable_tco(void)
 {
 }
=20
-static inline u8 mte_get_ptr_tag(void *ptr)
-{
-	return 0xFF;
-}
-
 static inline u8 mte_get_mem_tag(void *addr)
 {
 	return 0xFF;

--=20
2.56.0.455.g6c5a503b38-goog


