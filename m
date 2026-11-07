Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB814606D80A
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 15:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OGIT9Hv2;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=S59sJduE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=W2dZ65y0GQkNS0zpTty1NYFlxTIjfXpbYdGN63CkZpc=; b=OGIT9Hv2LjNQuwLoP/3FSaeP+4
	WWThYj7MV7MEQwXjFnHEzktLope2ihSlMcoEsIMBrT6IFUpS+TAGpGYMohdXHYP7ZFjzcPFug/6AX
	hj4d1MxdP4HwZL+4LV6kmY5gXJChHeHqK/DImGOfL0OLhXrCDTkeiZ0KUd6GL/wY7gwmsKOfRygPp
	SG1qkbu0mJdgWkvhMOHSo+cI4RrX/qa1R+Dvpzi5aVYmtUQohhzFn6ESw2McrgVlc34TY5F58Ji5v
	McEkzsRexELNWXu5j3ufRaZHGF/gIr2Gwj0UoyDatK0bXRyh01fW8mLlm0sb+rAMo3mFdohiQba3I
	lAxRBD/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPiUL-0000000EvdN-2dPk;
	Sat, 07 Nov 2026 15:37:53 +0000
Received: from mail-ej1-x646.google.com ([2a00:1450:4864:20::646])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPiU0-0000000Euzl-2AVE
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 15:37:34 +0000
Received: by mail-ej1-x646.google.com with SMTP id a640c23a62f3a-c210c66672eso190359666b.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Nov 2026 07:37:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794065850; x=1794670650; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=W2dZ65y0GQkNS0zpTty1NYFlxTIjfXpbYdGN63CkZpc=;
        b=S59sJduEyi3xT4WyhFzRpcQRpmihgAQpPuG6jfrME8k8ofv13QfygExWTil+CHcEft
         MF0BIm/O+N+nGcs5hDOM9UbKXQgfNufxoCgidXLubJnfAXCfE8eb4nyzH4FyBIrk3TlL
         X5Q2rRS8rzI57ryr7Xbil0WC7P09HZ6xKBD9CwEeHJYKdaY4uSUTjEvG1tS0w3O60sJE
         YxPNbi/j18V9po7mY34P9UscmvG/MPSXdnQ8kzs72GS5wfRiqX8xIJZiKg+kWQpXDXUb
         GSCgUBqyHyEjXFZkw6vcyrhbDq6dS8xyiaXQtPhVSjStK5LJXLFG7GFuTt4IGcwk5aPn
         jYCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794065850; x=1794670650;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W2dZ65y0GQkNS0zpTty1NYFlxTIjfXpbYdGN63CkZpc=;
        b=NWKSS3tpqidjtyS98dhJNHVaYfA9A4aAcfgXPquH8YY/uHmpuuIiZDzrG7ozXeLmCl
         Wt91ze1SDNOGpQNVsGlZFGqtYgZNIFfLOhIapXdol7q51dkqWLy4e/idZxaOrw/drnCS
         +U3lqPn0ScQca8J73nxjQG7V6mR+x/s2VHM2FJAb/Zob3sKBXtsxJmxVPBgmoH7BrbxG
         fqTN2Me3Na9Oo1ugape1bdSYBgr49Fvl5DSepjJzD/l2g/NJ/8RH0VEi19JmyOG2vPQ/
         B8v9seU6RJOtgpt5WI3lXgI0kGYbFUe2dMS7hpDqVn2eaYQoKEf2e8qPK5eusRei52l1
         3n7Q==
X-Forwarded-Encrypted: i=1; AKwUvBw5XEGYZh21nO54LsCAXCpfl2zNiZAwpktu+2+CLOG5nlnyFVhIWh1OaA62rlriwwVE+M3br2sZWAZ5R8syj2qL@lists.infradead.org
X-Gm-Message-State: APuU4Z9qS0Bu3gEhqDTVMqchfYkvglF+etLbyjSARHaqBTw3d9UmLdlQ
	xM6895/2M6lv4CbhU7D5UABlp5MpYW5CVvsTyuSR4drbuBdBec7K1N5JQQDWI2GCJMMjw3ikvAX
	k/g==
X-Received: from ejz21.prod.google.com ([2002:a17:907:e415:b0:c31:5e56:5742])
 (user=ptosi job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:c0b:b0:c41:731c:534
 with SMTP id a640c23a62f3a-c4d352c83c7mr470461666b.24.1794065850014; Sat, 07
 Nov 2026 07:37:30 -0800 (PST)
Date: Sat, 07 Nov 2026 16:36:22 +0100
In-Reply-To: <20261107-mte-kasan-split-v1-0-d84ea5f30f94@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261107-mte-kasan-split-v1-0-d84ea5f30f94@google.com>
X-Mailer: b4 0.14.3
Message-ID: <20261107-mte-kasan-split-v1-16-d84ea5f30f94@google.com>
Subject: [PATCH 16/24] arm64: Refactor KERNEL_GCR_EL1 out of <sysreg.h>
From: "=?utf-8?q?Pierre-Cl=C3=A9ment_Tosi?=" <ptosi@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	"=?utf-8?q?Pierre-Cl=C3=A9ment_Tosi?=" <ptosi@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_073732_645346_08C1321A 
X-CRM114-Status: GOOD (  14.29  )
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

Rework the constant to make the resulting sysreg value (and computation)
obvious at the usage site and clearly indicate that the GCR_EL1.Exclude
is specifically set by a KASAN policy.

As a result, <sysreg.h> is now KASAN-agnostic and writers of GCR_EL1
explicitly depend on KASAN headers, as they should.

Signed-off-by: Pierre-Cl=C3=A9ment Tosi <ptosi@google.com>
---
 arch/arm64/include/asm/mte-kasan.h | 16 ++++++++++++++++
 arch/arm64/include/asm/sysreg.h    | 16 ----------------
 arch/arm64/kernel/entry.S          |  3 ++-
 arch/arm64/kernel/mte.c            |  4 +++-
 4 files changed, 21 insertions(+), 18 deletions(-)

diff --git a/arch/arm64/include/asm/mte-kasan.h b/arch/arm64/include/asm/mt=
e-kasan.h
index 9d00e9460b0f..6f63c788470a 100644
--- a/arch/arm64/include/asm/mte-kasan.h
+++ b/arch/arm64/include/asm/mte-kasan.h
@@ -5,10 +5,26 @@
 #ifndef __ASM_MTE_KASAN_H
 #define __ASM_MTE_KASAN_H
=20
+#include <linux/bits.h>
+#include <linux/const.h>
+#include <linux/kasan-tags.h>
+
 #include <asm/compiler.h>
 #include <asm/cputype.h>
 #include <asm/mte-def.h>
=20
+/*
+ * KASAN always uses a whole byte for its tags. With CONFIG_KASAN_HW_TAGS =
it
+ * only uses tags in the range 0xF0-0xFF, which we map to MTE tags 0x0-0xF=
.
+ */
+#ifdef CONFIG_KASAN_HW_TAGS
+#define __MTE_TAG_MIN		(KASAN_TAG_MIN & 0xf)
+#define __MTE_TAG_MAX		(KASAN_TAG_MAX & 0xf)
+#define KASAN_GCR_INCL		GENMASK(__MTE_TAG_MAX, __MTE_TAG_MIN)
+#else
+#define KASAN_GCR_INCL		UL(0)
+#endif
+
 #ifndef __ASSEMBLER__
=20
 #include <linux/types.h>
diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysre=
g.h
index 51c6a54d7146..7d82c769ae69 100644
--- a/arch/arm64/include/asm/sysreg.h
+++ b/arch/arm64/include/asm/sysreg.h
@@ -11,7 +11,6 @@
=20
 #include <linux/bits.h>
 #include <linux/stringify.h>
-#include <linux/kasan-tags.h>
 #include <linux/kconfig.h>
=20
 #include <asm/gpr-num.h>
@@ -921,21 +920,6 @@
 #define SYS_GCR_EL1_RRND	(BIT(16))
 #define SYS_GCR_EL1_EXCL_MASK	0xffffUL
=20
-#ifdef CONFIG_KASAN_HW_TAGS
-/*
- * KASAN always uses a whole byte for its tags. With CONFIG_KASAN_HW_TAGS =
it
- * only uses tags in the range 0xF0-0xFF, which we map to MTE tags 0x0-0xF=
.
- */
-#define __MTE_TAG_MIN		(KASAN_TAG_MIN & 0xf)
-#define __MTE_TAG_MAX		(KASAN_TAG_MAX & 0xf)
-#define __MTE_TAG_INCL		GENMASK(__MTE_TAG_MAX, __MTE_TAG_MIN)
-#define KERNEL_GCR_EL1_EXCL	(SYS_GCR_EL1_EXCL_MASK & ~__MTE_TAG_INCL)
-#else
-#define KERNEL_GCR_EL1_EXCL	SYS_GCR_EL1_EXCL_MASK
-#endif
-
-#define KERNEL_GCR_EL1		(SYS_GCR_EL1_RRND | KERNEL_GCR_EL1_EXCL)
-
 /* RGSR_EL1 Definitions */
 #define SYS_RGSR_EL1_TAG_MASK	0xfUL
 #define SYS_RGSR_EL1_SEED_SHIFT	8
diff --git a/arch/arm64/kernel/entry.S b/arch/arm64/kernel/entry.S
index 8d17f61d1b5b..d1d9a7a049a7 100644
--- a/arch/arm64/kernel/entry.S
+++ b/arch/arm64/kernel/entry.S
@@ -21,6 +21,7 @@
 #include <asm/esr.h>
 #include <asm/irq.h>
 #include <asm/memory.h>
+#include <asm/mte-kasan.h>
 #include <asm/mmu.h>
 #include <asm/processor.h>
 #include <asm/ptrace.h>
@@ -176,7 +177,7 @@ alternative_else_nop_endif
 alternative_cb	ARM64_ALWAYS_SYSTEM, kasan_hw_tags_enable
 	b	1f
 alternative_cb_end
-	mov	\tmp, KERNEL_GCR_EL1
+	mov	\tmp, #(SYS_GCR_EL1_RRND | (SYS_GCR_EL1_EXCL_MASK & ~KASAN_GCR_INCL))
 	msr_s	SYS_GCR_EL1, \tmp
 1:
 #endif
diff --git a/arch/arm64/kernel/mte.c b/arch/arm64/kernel/mte.c
index 0d998289edcb..725f48faec3e 100644
--- a/arch/arm64/kernel/mte.c
+++ b/arch/arm64/kernel/mte.c
@@ -23,6 +23,7 @@
 #include <asm/barrier.h>
 #include <asm/cpufeature.h>
 #include <asm/mte.h>
+#include <asm/mte-kasan.h>
 #include <asm/ptrace.h>
 #include <asm/sysreg.h>
=20
@@ -320,7 +321,8 @@ void mte_cpu_setup(void)
 			 MAIR_ATTRIDX(MAIR_ATTR_NORMAL_TAGGED,
 				      MT_NORMAL_TAGGED));
=20
-	write_sysreg_s(KERNEL_GCR_EL1, SYS_GCR_EL1);
+	write_sysreg_s(SYS_GCR_EL1_RRND | (SYS_GCR_EL1_EXCL_MASK & ~KASAN_GCR_INC=
L),
+		       SYS_GCR_EL1);
=20
 	/*
 	 * If GCR_EL1.RRND=3D1 is implemented the same way as RRND=3D0, then

--=20
2.56.0.455.g6c5a503b38-goog


