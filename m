Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8214C60A380A
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 15:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mctug38M;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=W2lxtKYh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=BA87cHxXtTWR3BYiMzRslM1IopR1GCSiZApOjRzAgt8=; b=mctug38M/BaDMYAYAkd88TGIzt
	dUrOMDZ6EOhI3DuFgbAKg8gQl+EtHrzH7OU1mbgRZGH7pnNyIPYCTX/2ib+7OZ+opgBXF/l9GtZ2k
	9cCDEGME5fQL0sCy3CumMLiBx978KA7Cv3mKd5pINuRPM2aJlpVOCLWwBEaP21jailaphg90ENIcV
	URHIOpuihfYr4VS53ITnfM151Vw9ZI3kukDBXXQwd4Le9qyZO9Yk2D7gNNE3FCi3ouVHWKCQv9hhE
	ouImuflaQ4/80uwv7xZWQmWC6yt7gKo0DYoRisun8apfCUBbqJzQumXnHaz5iRENP9dP2IOtgn8D9
	iQzzUhng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPiU0-0000000Ev1t-2QBv;
	Sat, 07 Nov 2026 15:37:32 +0000
Received: from mail-ej1-x647.google.com ([2a00:1450:4864:20::647])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPiTr-0000000Eupl-0t5b
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 15:37:28 +0000
Received: by mail-ej1-x647.google.com with SMTP id a640c23a62f3a-c41b03cd1dcso155942666b.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Nov 2026 07:37:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794065840; x=1794670640; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BA87cHxXtTWR3BYiMzRslM1IopR1GCSiZApOjRzAgt8=;
        b=W2lxtKYh7Yw3aBu1ffdTlh8pOaxaFnJkEubjAsGcEN9efwBkdXKMVtGSIOegf4Vdbn
         aIRYR1x+y2SyX5//O14dNl03ADSsZf58lIkki5BGG7MJgyuY2qsjv1uFAx7gIGr1D3wT
         7KTM899/tEpgRy6WGtiRm994ufqBlrUot2sxvexTL7/D3/JZja+4sIZPxwLoEcRPsHhm
         t+KfGA8e+yrRDQ3rzfFyqiDU0gwC6xVQ/RJ/BLTmA4QNGhmFs2Nf1AAQ1beZmIaPfitJ
         R8m6F2qBusNSK3POHY7MihYF7mP59NKmcNwxbiZA4y97zKMO6UDd8xItzSBqGw++10PU
         NOmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794065840; x=1794670640;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BA87cHxXtTWR3BYiMzRslM1IopR1GCSiZApOjRzAgt8=;
        b=j590EeWdG9ANpkw3TEBZa0pqC3xgETwLddj/IfcClmcsbMdSHm2UkKo+zpOptZ+ZeF
         Qx9mrDbl9BveMPNUoLG7pAemZ0Uw9nISo3SHnzTDj9TCQa4vJ9jDlq/BzrWwjdNCcSlL
         myxHuqr6amvBCt+uZPAHuzwLcJxU0z/XaERIYp8FL83AMY07YkfA/kIf5iQQqIHEWdty
         56hG0b6LOsXyAZxuc9JKJBjQktu9O4kr28mWgbBCFOPfBs2GX04hOypLrk0JBI36DuUt
         z4wi48oVZ+l/xlKdQjkHAxFLOsTp1oLX83iLAOHFvHwgbi2lYk7qr0L9LpJd3t9bm8G7
         HJMQ==
X-Forwarded-Encrypted: i=1; AKwUvBxjhb/3UXG4BMtnH6HX9hAy5tSeWJ3O0Po+2N5pDOSRay39ncI3kF+mPROojv4rPb+yhYJ6pnfl1oRU99qKfO6G@lists.infradead.org
X-Gm-Message-State: APuU4Z/79zwDcQdyneAwlCRrVU8E1SMi/cIPYMTrFgWASpgkqimWqU5e
	Iyy/rf2Wnq2gtZW8bA4gUfYYxbMPaLEjet+BROjRpEiplSn9Adqa9HHUciBnDncfS1FJwix0u7J
	6Qw==
X-Received: from ejblu34.prod.google.com ([2002:a17:906:fae2:b0:c4d:356c:195b])
 (user=ptosi job=prod-delivery.src-stubby-dispatcher) by 2002:a17:906:9fd0:b0:c40:80eb:c54e
 with SMTP id a640c23a62f3a-c4d3449c0c7mr421982466b.4.1794065840288; Sat, 07
 Nov 2026 07:37:20 -0800 (PST)
Date: Sat, 07 Nov 2026 16:36:15 +0100
In-Reply-To: <20261107-mte-kasan-split-v1-0-d84ea5f30f94@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261107-mte-kasan-split-v1-0-d84ea5f30f94@google.com>
X-Mailer: b4 0.14.3
Message-ID: <20261107-mte-kasan-split-v1-9-d84ea5f30f94@google.com>
Subject: [PATCH 09/24] kasan: rework hw_{force=>flush}_async_tag_fault()
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
X-CRM114-CacheID: sfid-20261107_073723_264398_DE4D30D5 
X-CRM114-Status: GOOD (  12.13  )
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

Separate common arch-agnostic KASAN policy (fault reporting) from arch
HW details (fault flushing) by reworking the function's signature.

Update its only definition (in arm64) accordingly.

This resolves #include challenges arising from the circular dependency:

  mte_check_tfsr_exit() =3D=3D> kasan_report_async()
    kasan_report_async() =3D=3D> <linux/kasan.h>
      <linux/kasan.h> =3D=3D> hw_force_async_tag_fault()
        hw_force_async_tag_fault() =3D=3D> arch_force_async_tag_fault()
          arch_force_async_tag_fault() =3D=3D> mte_check_tfsr_exit()

Cc: Alexander Potapenko <glider@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Andrey Konovalov <andreyknvl@gmail.com>
Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>
Cc: Dmitry Vyukov <dvyukov@google.com>
Cc: kasan-dev@googlegroups.com
Cc: linux-mm@kvack.org
Signed-off-by: Pierre-Cl=C3=A9ment Tosi <ptosi@google.com>
---
 arch/arm64/include/asm/memory.h | 2 +-
 mm/kasan/hw_tags.c              | 3 ++-
 mm/kasan/kasan.h                | 2 +-
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/include/asm/memory.h b/arch/arm64/include/asm/memor=
y.h
index a2b7a33966ff..8e751b56d20c 100644
--- a/arch/arm64/include/asm/memory.h
+++ b/arch/arm64/include/asm/memory.h
@@ -316,7 +316,7 @@ static inline const void *__tag_set(const void *addr, u=
8 tag)
 #define arch_enable_tag_checks_write_only()	mte_enable_kernel_store_only()
 #define arch_suppress_tag_checks_start()	mte_enable_tco()
 #define arch_suppress_tag_checks_stop()		mte_disable_tco()
-#define arch_force_async_tag_fault()		mte_check_tfsr_exit()
+#define arch_flush_async_tag_fault()		mte_get_reset_tfsr()
 #define arch_get_random_tag()			mte_get_random_tag()
 #define arch_get_mem_tag(addr)			mte_get_mem_tag(addr)
 #define arch_set_mem_tag_range(addr, size, tag, init)	\
diff --git a/mm/kasan/hw_tags.c b/mm/kasan/hw_tags.c
index a848eb2f9910..c4772eebb80d 100644
--- a/mm/kasan/hw_tags.c
+++ b/mm/kasan/hw_tags.c
@@ -428,7 +428,8 @@ EXPORT_SYMBOL_IF_KUNIT(kasan_enable_hw_tags);
=20
 VISIBLE_IF_KUNIT void kasan_force_async_fault(void)
 {
-	hw_force_async_tag_fault();
+	if (hw_flush_async_tag_fault())
+		kasan_report_async();
 }
 EXPORT_SYMBOL_IF_KUNIT(kasan_force_async_fault);
=20
diff --git a/mm/kasan/kasan.h b/mm/kasan/kasan.h
index fc9169a54766..be5dcf6b052c 100644
--- a/mm/kasan/kasan.h
+++ b/mm/kasan/kasan.h
@@ -431,7 +431,7 @@ static inline const void *arch_kasan_set_tag(const void=
 *addr, u8 tag)
 #define hw_enable_tag_checks_asymm()		arch_enable_tag_checks_asymm()
 #define hw_suppress_tag_checks_start()		arch_suppress_tag_checks_start()
 #define hw_suppress_tag_checks_stop()		arch_suppress_tag_checks_stop()
-#define hw_force_async_tag_fault()		arch_force_async_tag_fault()
+#define hw_flush_async_tag_fault()		arch_flush_async_tag_fault()
 #define hw_enable_tag_checks_write_only()	arch_enable_tag_checks_write_onl=
y()
 #define hw_get_random_tag()			arch_get_random_tag()
 #define hw_get_mem_tag(addr)			arch_get_mem_tag(addr)

--=20
2.56.0.455.g6c5a503b38-goog


