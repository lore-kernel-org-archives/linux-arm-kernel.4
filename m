Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B81C9606A326
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 16:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sutVvEM6;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=FB/TJgoi;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=jiu78q1X
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=dKqRRHhy6BHS4ck54ga2pt3P+7mkrZNg70kpGu+nmOs=; b=sutVvEM6qf1GixLb1N/fqYXgsD
	CubGlTQABHeXgNoqsaBuRo8G/gKIputCCrvy6uJNPcNRHnd0M8lT4Cwdt7oeR6ac4QaUp4QT009Th
	HVCPnyXBZFpLValbivDBWRrDl9nLbEw0Qx9zbnsTC96gcXlLpV1b4mcm6zhCgdRWJ2WLSUGOj4dtO
	D7VBEZc2Njp2fW/fnI43kvaxrNW+MIbamvRFO1MPJNoggyJ3XuBozBMWlJTm4xzqYQ3WQ4yQOI1Sn
	oXKUWFm6SOEI8ItpwfMeeJ0zZ3dxn3WLbJStjcbrKTh1xTOnkFteCg2KWTn17iY9DQS9bZviEsfq7
	EYurPrDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPiU2-0000000Ev7A-2OxS;
	Sat, 07 Nov 2026 15:37:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPiTy-0000000EuxW-0UXb
	for linux-arm-kernel@bombadil.infradead.org;
	Sat, 07 Nov 2026 15:37:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=dKqRRHhy6BHS4ck54ga2pt3P+7mkrZNg70kpGu+nmOs=; b=FB/TJgoipFExwZ1pdT1zNXgTLY
	mAvzJkxLqYe+20f4+tZPj3vlJL5IHi+d6PX6NEYhYd997mu0cNOa+w+i2hPpRjQyr9cCNQ8fIgJk3
	g1cF4HlDMJw2XCfEp3vpSBtdEApf7Jn7YFcMxo1+s6U4qYYRMR4qfK/llS2aG1zSKshNsTr+zT3+P
	eKjrmrbqqIRfmqWBP3NMcbCIJL4QXpGdxcTFnku1tNhQNQGelAt217WIpdyu4tNWcNvnSbA1e2r2K
	NJVDzr/5bbRy7gVee9dqRq9+h9FC/+HihDVq5/L2Ze05Z1ebXUk97iKtsfdlu9oCTc6eEHvuA5TwG
	CLUL9GEQ==;
Received: from mail-ej1-x647.google.com ([2a00:1450:4864:20::647])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPiTv-00000005HxI-2jNv
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 15:37:29 +0000
Received: by mail-ej1-x647.google.com with SMTP id a640c23a62f3a-c40bbd26f74so144384066b.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Nov 2026 07:37:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794065845; x=1794670645; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dKqRRHhy6BHS4ck54ga2pt3P+7mkrZNg70kpGu+nmOs=;
        b=jiu78q1XfCFQ009pqSaJi9RYoN72NQl49PrC+g8DXl6npyImGPOCSX3MR25/TXVh7C
         dAF8FZIgvtRnuT4yzgK7XUDjiOtPhfVLdMNTEd7mUoKZv3W2Zib+Ay9usWUDMs4R/FEV
         e5zX7GiBsoKj4U5n3Gc9oglSpK1vCx2wYQGuSzlrGhPEOefzXITwhZDIRYeMSL/q1e7k
         TzQsnnQo6BNY4uA27mvu1ktst66P0In6YyUUFloqXheuy/RuigLK1FEw/4PsJKtiI2Nz
         nEaNyb8tmqiKdhSxj2GOo/aKUbTo4e62Qyl39319Wk2ZPSZ8pUq4jbEyagPxlf2Dd6Vn
         14+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794065845; x=1794670645;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dKqRRHhy6BHS4ck54ga2pt3P+7mkrZNg70kpGu+nmOs=;
        b=GPUmJ4ueAIPzsHio9mgi4PkXzXzX0+B0aZURGauhWPG3v6WHLUgbUet9r+8/vJWaVS
         mQDz4DKiJAGkYeWGNoW3gF1AL0lL/pWG1olmrZ+NEm4CaG3mvGBonqDAsiQd/t4SmNlH
         KcoSp8qt2IomAJSalSi1UH/rXicPb/yI9vJxvW5i3dzGtnkRkG7dZneMDkhAxMUBmJv7
         TCjHTKLLuqtJLuxxVNlmaPQ0EsTZ6PZ/+vi1qXYHg2vc6AMFKgQU1AerOWe9mI3XmyIT
         nmEbwYn6Sf5kupr7x4m6nxx4nZBk9j6jPKtBsoKckVLC14nrAB6WARhTzbb/4+qDkJ3D
         YGkw==
X-Forwarded-Encrypted: i=1; AKwUvByfNUNpSB9A+kv1LenI+9E1vFS8gefqhWKuvQkILYzmT6j0PIDcsidByBWVt2JFn6X8vYIDSvpIlORO9/EAuN8x@lists.infradead.org
X-Gm-Message-State: APuU4Z97p5kxv5u/QdaH0IJRrC9gZik0WnqwNS4khvyz0vXyMwXeZJY/
	rMszsxL16BEwvLH738BsLGy9ul5pxVkMsbwDhlgXXN4jOuH0O7n3IZNGCQyqKUmhnxemizFe6tN
	j/Q==
X-Received: from ejcyb22-n1.prod.google.com ([2002:a17:907:e0d6:10b0:c4d:32b9:af48])
 (user=ptosi job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:9c05:b0:c41:cf68:bbcf
 with SMTP id a640c23a62f3a-c4d34c42700mr430478966b.32.1794065844907; Sat, 07
 Nov 2026 07:37:24 -0800 (PST)
Date: Sat, 07 Nov 2026 16:36:18 +0100
In-Reply-To: <20261107-mte-kasan-split-v1-0-d84ea5f30f94@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261107-mte-kasan-split-v1-0-d84ea5f30f94@google.com>
X-Mailer: b4 0.14.3
Message-ID: <20261107-mte-kasan-split-v1-12-d84ea5f30f94@google.com>
Subject: [PATCH 12/24] kasan: drop mte-kasan.h from arch-agnostic header
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
X-CRM114-CacheID: sfid-20261107_153727_573447_56067EFE 
X-CRM114-Status: GOOD (  14.19  )
X-Spam-Score: -7.6 (-------)
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

The inclusion of <asm/mte-kasan.h> (only defined by arm64) is based on
the brittle assumption that KASAN_HW_TAGS is equivalent to MTE, which
will break as soon as another architecture supports it. Furthermore,
exposing the header's contents to common KASAN_HW_TAGS code risks
spreading this wrong assumption further.

Allow KASAN_GRANULE_SIZE to be arch-defined, with a fallback.

Define KASAN_GRANULE_SIZE in arm64's KASAN header when KASAN_HW_TAGS.

Remove the #include, which is now unused as a result.

Cc: Alexander Potapenko <glider@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Andrey Konovalov <andreyknvl@gmail.com>
Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>
Cc: Dmitry Vyukov <dvyukov@google.com>
Cc: kasan-dev@googlegroups.com
Cc: linux-mm@kvack.org
Signed-off-by: Pierre-Cl=C3=A9ment Tosi <ptosi@google.com>
---
 arch/arm64/include/asm/kasan.h | 5 +++++
 mm/kasan/kasan.h               | 5 +----
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/include/asm/kasan.h b/arch/arm64/include/asm/kasan.=
h
index b167e9d3da91..3106a2271781 100644
--- a/arch/arm64/include/asm/kasan.h
+++ b/arch/arm64/include/asm/kasan.h
@@ -6,6 +6,7 @@
=20
 #include <linux/linkage.h>
 #include <asm/memory.h>
+#include <asm/mte-def.h>
 #include <asm/mte-kasan.h>
 #include <asm/pgtable-types.h>
=20
@@ -22,5 +23,9 @@ void kasan_init(void);
 static inline void kasan_init(void) { }
 #endif
=20
+#ifdef CONFIG_KASAN_HW_TAGS
+#define KASAN_GRANULE_SIZE	MTE_GRANULE_SIZE
+#endif /* CONFIG_KASAN_HW_TAGS */
+
 #endif
 #endif
diff --git a/mm/kasan/kasan.h b/mm/kasan/kasan.h
index 0df7daee1864..52c2e7dca739 100644
--- a/mm/kasan/kasan.h
+++ b/mm/kasan/kasan.h
@@ -128,11 +128,8 @@ static inline bool kasan_requires_meta(void)
=20
 #endif /* CONFIG_KASAN_GENERIC */
=20
-#if defined(CONFIG_KASAN_GENERIC) || defined(CONFIG_KASAN_SW_TAGS)
+#ifndef KASAN_GRANULE_SIZE
 #define KASAN_GRANULE_SIZE	(1UL << KASAN_SHADOW_SCALE_SHIFT)
-#else
-#include <asm/mte-kasan.h>
-#define KASAN_GRANULE_SIZE	MTE_GRANULE_SIZE
 #endif
=20
 #define KASAN_GRANULE_MASK	(KASAN_GRANULE_SIZE - 1)

--=20
2.56.0.455.g6c5a503b38-goog


