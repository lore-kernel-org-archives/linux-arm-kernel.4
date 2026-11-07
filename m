Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 065E060A382B
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 15:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pfPlCj5M;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JkEpZuJc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=FhNHSPGgRz9Ke5ZXnFFLBTYfVhk9gRkjrfMATYBeC9E=; b=pfPlCj5M2K+rQ5L0baV1EjOglt
	ZCnQaHDcHSpzb6WD15EQSdjVktiRhd2EZzk9w7a9BvLfC9Botz4RQNH779ok6oOh+X8xK5rC5GOLI
	dKE8lJI4m5WnnAFjzTtJOayn/ONZnjzHEfnIk5eRGF5P9VY1jNmYlYflP455pA2zXacOMcsPUQHwH
	UIuqeEqXCCIP0/Rsyc13WIGduBu9pJyJDR8fLv1t93XU/8Bm2fXaxfCa9d2IrSeXg6q3kXrnqAJEY
	9tA2p0t8gMOOOXbQ8Rnzn0El7GTgP5GN7x246nxcBPPIvLpkzBnoBkONiw0ttlO2sRqVAwlTJiQZz
	5VQVjZXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPiU2-0000000Ev62-037s;
	Sat, 07 Nov 2026 15:37:34 +0000
Received: from mail-ej1-x647.google.com ([2a00:1450:4864:20::647])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPiTw-0000000EuuR-2ujs
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 15:37:29 +0000
Received: by mail-ej1-x647.google.com with SMTP id a640c23a62f3a-c4048584447so143180466b.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Nov 2026 07:37:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794065846; x=1794670646; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FhNHSPGgRz9Ke5ZXnFFLBTYfVhk9gRkjrfMATYBeC9E=;
        b=JkEpZuJczsAYJVYG01x5cngnDkg5rMigw6gFsti+8Xkk5J8Axt45mf44ReNWoaVPRp
         aPwucFoyw3TVpSbU0s8ox9vX+yG7yNa5Bt+8Gb030EcJcNoB03gmsadlCNjQtAuejFqw
         j0mIgtruTPHn7K5rFYA56udqySkdtwdh6ur0bp4OXQKyR9urtrCWHhpysdsJ2oe+18Nq
         q/SIt61B22UQnicmgkMD9mLfkjJ8i1MRk1op6YySua9PQJsUpSHm3aJJxmOdnWRpMehR
         gC7f6i4V0mz02API5fpPLwrY24yo1UvlrZz+7W5qo5pJLvWjYBz1aBxkbQ39MhpzHiVy
         SUPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794065846; x=1794670646;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FhNHSPGgRz9Ke5ZXnFFLBTYfVhk9gRkjrfMATYBeC9E=;
        b=eyrX1Q2KfOmStBMshjD7f4xvtBOPvM/XTBvs+Lh59YTBpkKG983/rs6SoV24B5UIzk
         ltUXSgHCo6d36fCE9Mb4maDFtPYmjm3LDpLA6+HOwwnE5pTnDJ51K4cUcyP636Q5JBw7
         vZyJEyaG/7MQv+6BOK3iJWHHGBzj0NjFCCGM7C9GkXzFA6iBx+AE6asAkzIQ6YAFIKvU
         v927OhcTEOPI8c4JDtWEVrTok1CEB5kONUH14m4eT3QzfoT33TKLaT138KvUM12VL1fW
         VAcSuS6xDPIvCnBi5iLBD9Ly8I4eJf4GJLhd+XhyIE2qMVP+2VwwEj927En+1bQ2uuxM
         BuEQ==
X-Forwarded-Encrypted: i=1; AL+hErFG9T0uWL10Hn/Dq0SLjPVtpISfXqKkGDcnph7skiZMTEEcOrn7R8RdU1a0z8dZbO7GOE3ZoVIisPNRKzLivB7L@lists.infradead.org
X-Gm-Message-State: APuU4Z/3A2weJweqOXyX0CNj84rMdYFrEnWV3KbnC8ivqjNjRhL4ZS4m
	H1Ytzb8MjxXqOEsq49itBPR3NO2pIPVBqpK3OvE4vGemxdar+ebrxPoESEXEIPCfjstIaC5ZUiv
	DuQ==
X-Received: from ejcjx20.prod.google.com ([2002:a17:907:7614:b0:c46:c6af:b8da])
 (user=ptosi job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:7fa5:b0:c4c:f846:1f1d
 with SMTP id a640c23a62f3a-c4d351f29d0mr423966266b.3.1794065846355; Sat, 07
 Nov 2026 07:37:26 -0800 (PST)
Date: Sat, 07 Nov 2026 16:36:19 +0100
In-Reply-To: <20261107-mte-kasan-split-v1-0-d84ea5f30f94@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261107-mte-kasan-split-v1-0-d84ea5f30f94@google.com>
X-Mailer: b4 0.14.3
Message-ID: <20261107-mte-kasan-split-v1-13-d84ea5f30f94@google.com>
Subject: [PATCH 13/24] arm64: Introduce set_pstate_tco() helper macro
From: "=?utf-8?q?Pierre-Cl=C3=A9ment_Tosi?=" <ptosi@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	"=?utf-8?q?Pierre-Cl=C3=A9ment_Tosi?=" <ptosi@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_073728_799483_3F8AA621 
X-CRM114-Status: GOOD (  16.94  )
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

Like other PSTATE bits, TCO deserves its own accessor.

Note that only HW KASAN common code now calls mte_{enable,disable}_tco()
so that their KASAN_HW_TAGS and ALTERNATIVE(ARM64_MTE) are superfluous.

Move the comment, as it now applies to them.

Signed-off-by: Pierre-Cl=C3=A9ment Tosi <ptosi@google.com>
---
 arch/arm64/include/asm/mte-kasan.h      | 24 +++++++++++-------------
 arch/arm64/include/asm/mte.h            |  2 +-
 arch/arm64/include/asm/sysreg.h         |  1 +
 arch/arm64/include/asm/uaccess.h        | 16 ++++++++--------
 arch/arm64/include/asm/word-at-a-time.h |  4 ++--
 5 files changed, 23 insertions(+), 24 deletions(-)

diff --git a/arch/arm64/include/asm/mte-kasan.h b/arch/arm64/include/asm/mt=
e-kasan.h
index 17e4155781fc..9d00e9460b0f 100644
--- a/arch/arm64/include/asm/mte-kasan.h
+++ b/arch/arm64/include/asm/mte-kasan.h
@@ -13,6 +13,8 @@
=20
 #include <linux/types.h>
=20
+#include <asm/sysreg.h>
+
 #ifdef CONFIG_KASAN_HW_TAGS
=20
 /* Whether the MTE asynchronous mode is enabled. */
@@ -34,27 +36,23 @@ static inline bool system_uses_mte_async_or_asymm_mode(=
void)
=20
 #ifdef CONFIG_ARM64_MTE
=20
+/*
+ * These functions are meant to be only used from KASAN runtime through
+ * the arch_*() interface defined in asm/memory.h.
+ * These functions don't include system_supports_mte() checks,
+ * as KASAN only calls them when MTE is supported and enabled.
+ */
+
 static inline void mte_disable_tco(void)
 {
-	if (!IS_ENABLED(CONFIG_KASAN_HW_TAGS))
-		return;
-	asm volatile(ALTERNATIVE("nop", SET_PSTATE_TCO(0), ARM64_MTE));
+	set_pstate_tco(0);
 }
=20
 static inline void mte_enable_tco(void)
 {
-	if (!IS_ENABLED(CONFIG_KASAN_HW_TAGS))
-		return;
-	asm volatile(ALTERNATIVE("nop", SET_PSTATE_TCO(1), ARM64_MTE));
+	set_pstate_tco(1);
 }
=20
-/*
- * These functions are meant to be only used from KASAN runtime through
- * the arch_*() interface defined in asm/memory.h.
- * These functions don't include system_supports_mte() checks,
- * as KASAN only calls them when MTE is supported and enabled.
- */
-
 static inline u8 mte_get_ptr_tag(void *ptr)
 {
 	/* Note: The format of KASAN tags is 0xF<x> */
diff --git a/arch/arm64/include/asm/mte.h b/arch/arm64/include/asm/mte.h
index 614fff7dc35f..815843079eb9 100644
--- a/arch/arm64/include/asm/mte.h
+++ b/arch/arm64/include/asm/mte.h
@@ -271,7 +271,7 @@ static inline void mte_disable_tco_entry(struct task_st=
ruct *task)
 	 */
 	if (kasan_hw_tags_enabled() ||
 	    (task->thread.sctlr_user & (1UL << SCTLR_EL1_TCF0_SHIFT)))
-		asm volatile(SET_PSTATE_TCO(0));
+		set_pstate_tco(0);
 }
=20
 #ifdef CONFIG_KASAN_HW_TAGS
diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysre=
g.h
index e3b60ee03023..51c6a54d7146 100644
--- a/arch/arm64/include/asm/sysreg.h
+++ b/arch/arm64/include/asm/sysreg.h
@@ -105,6 +105,7 @@
 #define set_pstate_uao(x)		asm volatile(SET_PSTATE_UAO(x))
 #define set_pstate_ssbs(x)		asm volatile(SET_PSTATE_SSBS(x))
 #define set_pstate_dit(x)		asm volatile(SET_PSTATE_DIT(x))
+#define set_pstate_tco(x)		asm volatile(SET_PSTATE_TCO(x))
=20
 /* Register-based PAN access, for save/restore purposes */
 #define SYS_PSTATE_PAN			sys_reg(3, 0, 4, 2, 3)
diff --git a/arch/arm64/include/asm/uaccess.h b/arch/arm64/include/asm/uacc=
ess.h
index 9e3957ee3642..aac7676da531 100644
--- a/arch/arm64/include/asm/uaccess.h
+++ b/arch/arm64/include/asm/uaccess.h
@@ -140,13 +140,13 @@ static inline void __uaccess_disable_mte(void)
 	 * such that a bad user address tag could trigger a kernel MTE fault.
 	 */
 	if (kasan_hw_tags_enabled())
-		asm volatile(SET_PSTATE_TCO(1));
+		set_pstate_tco(1);
 }
=20
 static inline void __uaccess_enable_mte(void)
 {
 	if (kasan_hw_tags_enabled())
-		asm volatile(SET_PSTATE_TCO(0));
+		set_pstate_tco(0);
 }
=20
 static inline void uaccess_disable_privileged(void)
@@ -249,12 +249,12 @@ do {										\
 do {									\
 	__label__ __rgm_err;						\
 									\
-	asm volatile(SET_PSTATE_TCO(1));				\
+	set_pstate_tco(1);						\
 	__raw_get_mem(ldr, x, ptr, __rgm_err, type);			\
-	asm volatile(SET_PSTATE_TCO(0));				\
+	set_pstate_tco(0);						\
 	break;								\
 __rgm_err:								\
-	asm volatile(SET_PSTATE_TCO(0));				\
+	set_pstate_tco(0);						\
 	goto label;							\
 } while (0)
=20
@@ -355,12 +355,12 @@ do {										\
 do {									\
 	__label__ __rpm_err;						\
 									\
-	asm volatile(SET_PSTATE_TCO(1));				\
+	set_pstate_tco(1);						\
 	__raw_put_mem(str, x, ptr, __rpm_err, type);			\
-	asm volatile(SET_PSTATE_TCO(0));				\
+	set_pstate_tco(0);						\
 	break;								\
 __rpm_err:								\
-	asm volatile(SET_PSTATE_TCO(0));				\
+	set_pstate_tco(0);						\
 	goto label;							\
 } while (0)
=20
diff --git a/arch/arm64/include/asm/word-at-a-time.h b/arch/arm64/include/a=
sm/word-at-a-time.h
index ec72126210d1..430d5ab8f042 100644
--- a/arch/arm64/include/asm/word-at-a-time.h
+++ b/arch/arm64/include/asm/word-at-a-time.h
@@ -67,9 +67,9 @@ static inline unsigned long load_unaligned_zeropad(const =
void *addr)
 	if (!system_uses_mte_async_or_asymm_mode())
 		return __load_unaligned_zeropad(addr);
=20
-	asm volatile(SET_PSTATE_TCO(1));
+	set_pstate_tco(1);
 	ret =3D __load_unaligned_zeropad(addr);
-	asm volatile(SET_PSTATE_TCO(0));
+	set_pstate_tco(0);
=20
 	return ret;
 }

--=20
2.56.0.455.g6c5a503b38-goog


