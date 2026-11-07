Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECAB2606A326
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 16:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qr4oXued;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dVtDx4FF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=lNlRk5+oFZ111i0wzJnmLszJVAJnN8GZxBjHa+ttev0=; b=qr4oXued20OUsRmArVwH+4QMuX
	8vdfyyywQutsAE3lbLzJ5p5NVWPpRVJ9vBEYroCnY0vlkC63Qyl94jP4stxMgKc4jCxxF5U9LNRVX
	4UoQYbB36C3kRe3Lcent0+WQFqMv1/lHe8myeqzkWVWfR7bew9fREKzeLVRMSkpfPqeU/XwmRwtM6
	qNXdtYKcQApH6QX3Pcwfq1JrzI5a83N4wmUMDYkM786+aUPkcpNUiCOHy2N4cldJEsKLxECULtB7k
	BDrtD0atGT1/8fM0eRfRPrf1wJBSBrvRu/t815hvxytBxNrHVf7ZByyPF9l7f864wT7EDRUCnjAop
	V9IrJgzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPiU1-0000000Ev40-1pze;
	Sat, 07 Nov 2026 15:37:33 +0000
Received: from mail-ed1-x546.google.com ([2a00:1450:4864:20::546])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPiTs-0000000Euqg-2Wb6
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 15:37:29 +0000
Received: by mail-ed1-x546.google.com with SMTP id 4fb4d7f45d1cf-6b6ed7a9ffaso1277825a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Nov 2026 07:37:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794065842; x=1794670642; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lNlRk5+oFZ111i0wzJnmLszJVAJnN8GZxBjHa+ttev0=;
        b=dVtDx4FFFTuamo+/I2xSJKxCJmisxeOxkTuisdXzwf/r81ArLqnwGu3IZipLJCBISk
         0/u8rd/7PcXyOvD6uE8YPeH6ibTCrtoaS+y2gUeIHqTvAqby+agLlN0D78gTAagiLAal
         LEfrIiQfX9pVCB8eWpkY42lbNbf6CgIxF7s5NCawZgRZVRWb7uA71x3eNUFkYn2ZvgJB
         CXXVZYSytYH9zh3vDS52TcdapuNqJlZAQ4Pf7d+fbVxrlur3rAFV8/68hB+px6J1uAou
         ol4EUlGMaOxCgV2zYdJvY8f1HINJNgGGRmEwq0TtJ1Gbn9N2UQaK3rl+5UEWBGJ51ty9
         KJdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794065842; x=1794670642;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lNlRk5+oFZ111i0wzJnmLszJVAJnN8GZxBjHa+ttev0=;
        b=W8toMV6obPCi+0wAbj0C8TfQVZgw7XRnl6yyto28bFtUfcoVBAd5nFOYyeW2uNEDBr
         DCybnvgqsdSODCuJ9B1jOhEihw6bbSFWFqmpbntMypJXLWY1jsrlY6aTza0qNlUx1bOp
         nvt0a3w8/QpyxKnyQwYXmuZBS76ryanFyYwx99ath0mZkPE9XXAW8JxXwce5r4sCeNO8
         wtUPIv302U2RqO6V+ZhnlKAInqRHExmZU1C3T7bzG5lWBDJ7k3rdhJ1+YMQ+fDzHnqlE
         REN3kyR3glWdmIiDEUVTP99MyvSpIjn403dDr1Nne+DcgFkCCN7xZnKdK0Zdu056aU+Z
         MgiA==
X-Forwarded-Encrypted: i=1; AL+hErEAcFUrNBIwRnCECKZYV1eN7YadOBWttKVcA3I7+o8tSxWIlNs6SNF9TsNjQa6DC7Xn0Ec4LIGz3ZYPYVDQh+SQ@lists.infradead.org
X-Gm-Message-State: APuU4Z8mQRjxEJqdPim21T1o7YSC1aNCjJtS4gO3L/9P3o9+yMYp+Qp/
	iyHocll15fDTfpSq23CjvJSCPl2ng3sHw7CAT6/2zyzBspXGDWf9krkH+578KaIdVjOkyv7eWzB
	THw==
X-Received: from ejebc11-n2.prod.google.com ([2002:a05:6938:e08b:20b0:c41:2fad:5f39])
 (user=ptosi job=prod-delivery.src-stubby-dispatcher) by 2002:a17:906:dc8b:b0:c49:cdc8:10cf
 with SMTP id a640c23a62f3a-c4d35531e7fmr425425766b.40.1794065841807; Sat, 07
 Nov 2026 07:37:21 -0800 (PST)
Date: Sat, 07 Nov 2026 16:36:16 +0100
In-Reply-To: <20261107-mte-kasan-split-v1-0-d84ea5f30f94@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261107-mte-kasan-split-v1-0-d84ea5f30f94@google.com>
X-Mailer: b4 0.14.3
Message-ID: <20261107-mte-kasan-split-v1-10-d84ea5f30f94@google.com>
Subject: [PATCH 10/24] kasan: rework hw_{get=>set}_random_tag()
From: "=?utf-8?q?Pierre-Cl=C3=A9ment_Tosi?=" <ptosi@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Alexander Potapenko <glider@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
	Dmitry Vyukov <dvyukov@google.com>, kasan-dev@googlegroups.com, linux-mm@kvack.org, 
	"=?utf-8?q?Pierre-Cl=C3=A9ment_Tosi?=" <ptosi@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_073724_697788_ECCF535A 
X-CRM114-Status: GOOD (  14.69  )
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
	USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

With MTE, the IRG instruction tags a pointer in-place, so that

    set_tag(ptr, hw_get_random_tag())

can conceptually be synthesized as a single "IRG %[ptr], %[ptr], 0".

However, with the way the API is currently defined, we confuse the
compiler into generating a random tag with invalid address bits, to then
bitfield-extract the tag and shift-and-mask it into another pointer.

Furthermore, every single (indirect or direct) use-case for a random tag
in arch-agnostic KASAN ends up passing it to set_tag(), which likely is
an indicator of a suboptimal API design.

Therefore, make the function clearer and more optimization-friendly by
directly taking the pointer to be randomly tagged.

Update the only definition (in arm64) accordingly.

Intentionally keep this patch minimal (and limited to KASAN_HW_TAGS) to
reduce its associated risks and make it as uncontentious as possible. A
future patch will refactor the arch-agnostic KASAN code to enable the
optimization mentioned above.

Cc: Alexander Potapenko <glider@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Andrey Konovalov <andreyknvl@gmail.com>
Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>
Cc: Dmitry Vyukov <dvyukov@google.com>
Cc: kasan-dev@googlegroups.com
Cc: linux-mm@kvack.org
Signed-off-by: Pierre-Cl=C3=A9ment Tosi <ptosi@google.com>
---
 arch/arm64/include/asm/memory.h    |  2 +-
 arch/arm64/include/asm/mte-kasan.h | 14 +++++++-------
 mm/kasan/kasan.h                   |  7 +++++--
 3 files changed, 13 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/include/asm/memory.h b/arch/arm64/include/asm/memor=
y.h
index 8e751b56d20c..29e7537f5e58 100644
--- a/arch/arm64/include/asm/memory.h
+++ b/arch/arm64/include/asm/memory.h
@@ -317,7 +317,7 @@ static inline const void *__tag_set(const void *addr, u=
8 tag)
 #define arch_suppress_tag_checks_start()	mte_enable_tco()
 #define arch_suppress_tag_checks_stop()		mte_disable_tco()
 #define arch_flush_async_tag_fault()		mte_get_reset_tfsr()
-#define arch_get_random_tag()			mte_get_random_tag()
+#define arch_set_random_tag(addr)		mte_set_random_tag(addr)
 #define arch_get_mem_tag(addr)			mte_get_mem_tag(addr)
 #define arch_set_mem_tag_range(addr, size, tag, init)	\
 			mte_set_mem_tag_range((addr), (size), (tag), (init))
diff --git a/arch/arm64/include/asm/mte-kasan.h b/arch/arm64/include/asm/mt=
e-kasan.h
index b474fca3ea56..17e4155781fc 100644
--- a/arch/arm64/include/asm/mte-kasan.h
+++ b/arch/arm64/include/asm/mte-kasan.h
@@ -73,14 +73,14 @@ static inline u8 mte_get_mem_tag(void *addr)
 }
=20
 /* Generate a random tag. */
-static inline u8 mte_get_random_tag(void)
+static inline void *mte_set_random_tag(const void *addr)
 {
-	void *addr;
-
+	/* Writes the random MTE tag in bits [59:56]. */
 	asm volatile(__MTE_PREAMBLE "irg %0, %0"
-		: "=3Dr" (addr));
+		: "+r" (addr));
=20
-	return mte_get_ptr_tag(addr);
+	/* Sets bits [63:60] as KASAN expects. */
+	return (void *)__tag_set(addr, mte_get_ptr_tag((void *)addr));
 }
=20
 static inline u64 __stg_post(u64 p)
@@ -190,9 +190,9 @@ static inline u8 mte_get_mem_tag(void *addr)
 	return 0xFF;
 }
=20
-static inline u8 mte_get_random_tag(void)
+static inline void *mte_set_random_tag(const void *addr)
 {
-	return 0xFF;
+	return (void *)__tag_set(addr, 0xFF);
 }
=20
 static inline void mte_set_mem_tag_range(void *addr, size_t size,
diff --git a/mm/kasan/kasan.h b/mm/kasan/kasan.h
index be5dcf6b052c..0df7daee1864 100644
--- a/mm/kasan/kasan.h
+++ b/mm/kasan/kasan.h
@@ -433,7 +433,7 @@ static inline const void *arch_kasan_set_tag(const void=
 *addr, u8 tag)
 #define hw_suppress_tag_checks_stop()		arch_suppress_tag_checks_stop()
 #define hw_flush_async_tag_fault()		arch_flush_async_tag_fault()
 #define hw_enable_tag_checks_write_only()	arch_enable_tag_checks_write_onl=
y()
-#define hw_get_random_tag()			arch_get_random_tag()
+#define hw_set_random_tag(addr)			arch_set_random_tag(addr)
 #define hw_get_mem_tag(addr)			arch_get_mem_tag(addr)
 #define hw_set_mem_tag_range(addr, size, tag, init) \
 			arch_set_mem_tag_range((addr), (size), (tag), (init))
@@ -469,7 +469,10 @@ static inline bool kasan_write_only_enabled(void)
 #ifdef CONFIG_KASAN_SW_TAGS
 u8 kasan_random_tag(void);
 #elif defined(CONFIG_KASAN_HW_TAGS)
-static inline u8 kasan_random_tag(void) { return hw_get_random_tag(); }
+static inline u8 kasan_random_tag(void)
+{
+	return get_tag(hw_set_random_tag(NULL));
+}
 #else
 static inline u8 kasan_random_tag(void) { return 0; }
 #endif

--=20
2.56.0.455.g6c5a503b38-goog


