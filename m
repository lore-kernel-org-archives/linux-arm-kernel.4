Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60EE760A2605
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 15:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MxDpiYtT;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=MkrYsFk/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=HCC2TdG6RWHax6m3RaTlIkhTsAHQgHyzqZG341Zkcv8=; b=MxDpiYtT1BG+xvSg4GfNcuXXg9
	9ruL9Zy8DETbrZVg9xdOH++oKviZn0qFIYw6PBJ1JTDgTm7NFOEiUscIUCXulcalCrs1SEeQbeWRh
	6il1eV6HnZQH3AuM4YAopDbqRmizZkUabmk6Zxn3EfYRDUiY5oG9UZQCuBUX9He7jh+FZXIu87Jeg
	Qa9g3iehK+LaB7TEW2UEhpAosRWHhZmVjAc5MtUWZ1Xd39+A17yiQcDGwdp4JGHaMzKbK6jjwzjfX
	b+Wzs+EJDE/h4UuLN2xkoavQeU8BM46YFoLPvfqLhOg3mI9xiBlwpNBG+NBRBjhPpfd+3LY06K3aJ
	1lw3jHfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPiTw-0000000Euvn-2tzx;
	Sat, 07 Nov 2026 15:37:28 +0000
Received: from mail-ej1-x645.google.com ([2a00:1450:4864:20::645])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPiTk-0000000Euli-3eu6
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 15:37:19 +0000
Received: by mail-ej1-x645.google.com with SMTP id a640c23a62f3a-c49b95262a5so117779366b.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Nov 2026 07:37:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794065835; x=1794670635; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HCC2TdG6RWHax6m3RaTlIkhTsAHQgHyzqZG341Zkcv8=;
        b=MkrYsFk/+xATA16LpDbCCEHvnmmc2Sydl3kN3ykNax8ejqTzV6UWuP9yQgvDQiP/9s
         U+PrYEm8oM/8a2Cvsa6NliR4g+kuFm8R3aAM5NB1wiQeY1n/UJJf/rMQoqbsQ0dk0+lH
         e35lJU04i0XTXh4OLb922lFizAHd+bDzjUdL4rLfAwsdaMcJZKP9rToM5jEU2yF0wM1E
         F0GhnkF7q9TUQCpnO1eWNP8cEjVAs9f4E8mbge+4YKvJqA5KFlQiBDFQ7BbLu7yG2V5h
         G6RiVqGnDROeYpQEaSn49KclpK+IkCm6vIyhTHmpf7hYGVzpISfdlERW1T7CrLzLRRpD
         iXHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794065835; x=1794670635;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HCC2TdG6RWHax6m3RaTlIkhTsAHQgHyzqZG341Zkcv8=;
        b=F1roqjLtdotRVAjHoBjLTjK+ES/nRGbO2IohKFd0YcVI9xiVYsE/YzhtKYej2uVpKg
         POV9CV66XSRd4re2XQGDz1OgygtziDQGALW6mYz8V0nE0HR6rNNSDxdqqHXwDrEP0BTz
         /eX1IuvBkH41xx75Jg+DCx92JQuUTnfwKR8kO0X4/1oQifDM7b68sTAsi64nm2eR9KYf
         nxUIK8wv5uaQNT0zRejhKqwAX8oHxkXBdLFlVOnGzR+hs6MrWqUYo1gqdfh5WoFSBCa7
         eUiNjZSSNS15xOSSCdGfFlh+x4kbeMGMktiaGbtXBnfBAFciEFxRMcwT8o0F3DkYLPK+
         zx8w==
X-Forwarded-Encrypted: i=1; AKwUvBz1TeUoGaqHrCmnkOJILh6x2zLUhGKfiVmQUS+CmC8rNWKNuK+88f2ttj+4KqDXijmBk+kViqEdCooW25UA1oZu@lists.infradead.org
X-Gm-Message-State: APuU4Z+VIS9feKkSg06etqxll9acZvwxX819iieFkgosWdzWUpreXgIh
	xtqLe0rwRrievGTrgE0YSZqh177JXki9InW2SZ5rklqC85OpK0ccQ79ZjurvfwvL5VeBnoZiIgJ
	Eyw==
X-Received: from ejeck20-n1.prod.google.com ([2002:a17:907:e1d4:10b0:c4d:2f7a:cb66])
 (user=ptosi job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:a785:b0:c40:9e84:942a
 with SMTP id a640c23a62f3a-c4d34ce3a9dmr404232766b.48.1794065834471; Sat, 07
 Nov 2026 07:37:14 -0800 (PST)
Date: Sat, 07 Nov 2026 16:36:11 +0100
In-Reply-To: <20261107-mte-kasan-split-v1-0-d84ea5f30f94@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261107-mte-kasan-split-v1-0-d84ea5f30f94@google.com>
X-Mailer: b4 0.14.3
Message-ID: <20261107-mte-kasan-split-v1-5-d84ea5f30f94@google.com>
Subject: [PATCH 05/24] arm64: Check MTE once per fault-handling section
From: "=?utf-8?q?Pierre-Cl=C3=A9ment_Tosi?=" <ptosi@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	"=?utf-8?q?Pierre-Cl=C3=A9ment_Tosi?=" <ptosi@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_073716_960386_8F80647B 
X-CRM114-Status: GOOD (  19.29  )
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

Call system_uses_mte_async_or_asymm_mode() only once per section. This
improves performance (fewer instructions at runtime and fewer static
branches needing to be tracked and patched), correctness (no theoretical
race between the execution of the section and the static branch being
toggled, which could leave TCO in an unexpected state), and code clarity
(no 3-level indirection with redundant checks to flip one PSTATE bit).

Signed-off-by: Pierre-Cl=C3=A9ment Tosi <ptosi@google.com>
---
 arch/arm64/include/asm/mte-kasan.h      | 25 -----------
 arch/arm64/include/asm/uaccess.h        | 80 ++++++++++++++++++++---------=
----
 arch/arm64/include/asm/word-at-a-time.h | 22 +++++++--
 3 files changed, 67 insertions(+), 60 deletions(-)

diff --git a/arch/arm64/include/asm/mte-kasan.h b/arch/arm64/include/asm/mt=
e-kasan.h
index 467d1d41a392..b474fca3ea56 100644
--- a/arch/arm64/include/asm/mte-kasan.h
+++ b/arch/arm64/include/asm/mte-kasan.h
@@ -48,23 +48,6 @@ static inline void mte_enable_tco(void)
 	asm volatile(ALTERNATIVE("nop", SET_PSTATE_TCO(1), ARM64_MTE));
 }
=20
-/*
- * These functions disable tag checking only if in MTE async mode
- * since the sync mode generates exceptions synchronously and the
- * nofault or load_unaligned_zeropad can handle them.
- */
-static inline void __mte_disable_tco_async(void)
-{
-	if (system_uses_mte_async_or_asymm_mode())
-		mte_disable_tco();
-}
-
-static inline void __mte_enable_tco_async(void)
-{
-	if (system_uses_mte_async_or_asymm_mode())
-		mte_enable_tco();
-}
-
 /*
  * These functions are meant to be only used from KASAN runtime through
  * the arch_*() interface defined in asm/memory.h.
@@ -197,14 +180,6 @@ static inline void mte_enable_tco(void)
 {
 }
=20
-static inline void __mte_disable_tco_async(void)
-{
-}
-
-static inline void __mte_enable_tco_async(void)
-{
-}
-
 static inline u8 mte_get_ptr_tag(void *ptr)
 {
 	return 0xFF;
diff --git a/arch/arm64/include/asm/uaccess.h b/arch/arm64/include/asm/uacc=
ess.h
index f0924dc0bd64..9e3957ee3642 100644
--- a/arch/arm64/include/asm/uaccess.h
+++ b/arch/arm64/include/asm/uaccess.h
@@ -240,6 +240,24 @@ do {										\
 	(x) =3D (__force __typeof__(*(ptr)))__gu_val;				\
 } while (0)
=20
+/*
+ * We must not call into the scheduler between setting and clearing TCO. A=
s `x`
+ * and `ptr` may contain blocking functions, we must evaluate these outsid=
e of
+ * the critical section.
+ */
+#define __raw_get_mem_tco(ldr, x, ptr, label, type)			\
+do {									\
+	__label__ __rgm_err;						\
+									\
+	asm volatile(SET_PSTATE_TCO(1));				\
+	__raw_get_mem(ldr, x, ptr, __rgm_err, type);			\
+	asm volatile(SET_PSTATE_TCO(0));				\
+	break;								\
+__rgm_err:								\
+	asm volatile(SET_PSTATE_TCO(0));				\
+	goto label;							\
+} while (0)
+
 /*
  * We must not call into the scheduler between uaccess_ttbr0_enable() and
  * uaccess_ttbr0_disable(). As `x` and `ptr` could contain blocking functi=
ons,
@@ -286,27 +304,18 @@ do {									\
=20
 #define get_user	__get_user
=20
-/*
- * We must not call into the scheduler between __mte_enable_tco_async() an=
d
- * __mte_disable_tco_async(). As `dst` and `src` may contain blocking
- * functions, we must evaluate these outside of the critical section.
- */
+/* We handle synchronous exceptions so only use PSTATE.TCO in non-sync MTE=
. */
 #define __get_kernel_nofault(dst, src, type, err_label)			\
 do {									\
 	__typeof__(dst) __gkn_dst =3D (dst);				\
 	__typeof__(src) __gkn_src =3D (src);				\
-	do { 								\
-		__label__ __gkn_label;					\
 									\
-		__mte_enable_tco_async();				\
+	if (system_uses_mte_async_or_asymm_mode())			\
+		__raw_get_mem_tco("ldr", *((type *)(__gkn_dst)),	\
+		      (__force type *)(__gkn_src), err_label, K);	\
+	else								\
 		__raw_get_mem("ldr", *((type *)(__gkn_dst)),		\
-		      (__force type *)(__gkn_src), __gkn_label, K);	\
-		__mte_disable_tco_async();				\
-		break;							\
-	__gkn_label:							\
-		__mte_disable_tco_async();				\
-		goto err_label;						\
-	} while (0);							\
+		      (__force type *)(__gkn_src), err_label, K);	\
 } while (0)
=20
 #define __put_mem_asm(store, reg, x, addr, label, type)			\
@@ -337,6 +346,24 @@ do {										\
 	}									\
 } while (0)
=20
+/*
+ * We must not call into the scheduler between setting and clearing TCO. A=
s `x`
+ * and `ptr` may contain blocking functions, we must evaluate these outsid=
e of
+ * the critical section.
+ */
+#define __raw_put_mem_tco(str, x, ptr, label, type)			\
+do {									\
+	__label__ __rpm_err;						\
+									\
+	asm volatile(SET_PSTATE_TCO(1));				\
+	__raw_put_mem(str, x, ptr, __rpm_err, type);			\
+	asm volatile(SET_PSTATE_TCO(0));				\
+	break;								\
+__rpm_err:								\
+	asm volatile(SET_PSTATE_TCO(0));				\
+	goto label;							\
+} while (0)
+
 /*
  * We must not call into the scheduler between uaccess_ttbr0_enable() and
  * uaccess_ttbr0_disable(). As `x` and `ptr` could contain blocking functi=
ons,
@@ -383,28 +410,19 @@ do {									\
=20
 #define put_user	__put_user
=20
-/*
- * We must not call into the scheduler between __mte_enable_tco_async() an=
d
- * __mte_disable_tco_async(). As `dst` and `src` may contain blocking
- * functions, we must evaluate these outside of the critical section.
- */
+/* We handle synchronous exceptions so only use PSTATE.TCO in non-sync MTE=
. */
 #define __put_kernel_nofault(dst, src, type, err_label)			\
 do {									\
 	__typeof__(dst) __pkn_dst =3D (dst);				\
 	__typeof__(src) __pkn_src =3D (src);				\
 									\
-	do {								\
-		__label__ __pkn_err;					\
-		__mte_enable_tco_async();				\
+	if (system_uses_mte_async_or_asymm_mode())			\
+		__raw_put_mem_tco("str", *((type *)(__pkn_src)),	\
+			      (__force type *)(__pkn_dst), err_label, K); \
+	else								\
 		__raw_put_mem("str", *((type *)(__pkn_src)),		\
-			      (__force type *)(__pkn_dst), __pkn_err, K);	\
-		__mte_disable_tco_async();				\
-		break;							\
-	__pkn_err:							\
-		__mte_disable_tco_async();				\
-		goto err_label;						\
-	} while (0);							\
-} while(0)
+			      (__force type *)(__pkn_dst), err_label, K); \
+} while (0)
=20
 extern unsigned long __must_check __arch_copy_from_user(void *to, const vo=
id __user *from, unsigned long n);
 #define raw_copy_from_user(to, from, n)					\
diff --git a/arch/arm64/include/asm/word-at-a-time.h b/arch/arm64/include/a=
sm/word-at-a-time.h
index d7a3b69dc8c6..ec72126210d1 100644
--- a/arch/arm64/include/asm/word-at-a-time.h
+++ b/arch/arm64/include/asm/word-at-a-time.h
@@ -10,6 +10,9 @@
 #include <linux/bitops.h>
 #include <linux/wordpart.h>
=20
+#include <asm/mte-kasan.h>
+#include <asm/sysreg.h>
+
 struct word_at_a_time {
 	const unsigned long one_bits, high_bits;
 };
@@ -41,12 +44,10 @@ static inline unsigned long zero_bytemask(unsigned long=
 bits)
  * and the next page not being mapped, take the exception and
  * return zeroes in the non-existing part.
  */
-static inline unsigned long load_unaligned_zeropad(const void *addr)
+static __always_inline unsigned long __load_unaligned_zeropad(const void *=
addr)
 {
 	unsigned long ret;
=20
-	__mte_enable_tco_async();
-
 	/* Load word from unaligned pointer addr */
 	asm(
 	"1:	ldr	%0, %2\n"
@@ -55,7 +56,20 @@ static inline unsigned long load_unaligned_zeropad(const=
 void *addr)
 	: "=3D&r" (ret)
 	: "r" (addr), "Q" (*(unsigned long *)addr));
=20
-	__mte_disable_tco_async();
+	return ret;
+}
+
+static inline unsigned long load_unaligned_zeropad(const void *addr)
+{
+	unsigned long ret;
+
+	/* We handle synchronous exceptions so only use TCO in non-sync MTE. */
+	if (!system_uses_mte_async_or_asymm_mode())
+		return __load_unaligned_zeropad(addr);
+
+	asm volatile(SET_PSTATE_TCO(1));
+	ret =3D __load_unaligned_zeropad(addr);
+	asm volatile(SET_PSTATE_TCO(0));
=20
 	return ret;
 }

--=20
2.56.0.455.g6c5a503b38-goog


