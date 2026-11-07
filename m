Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 217AB6083638
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 15:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yNfca91S;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=ZZ5RksHz;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=BZP9tWKz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=nX/BKmNSgCueREMdF/8Pl/MQjIYzPNWNVVbIpr0RXxI=; b=yNfca91SfrE+fQ2e4aAn7NykVi
	W7PhkoOF3/hcbkB1xsWAv3QO55IxtV2mZ+IMHYc4OtjU2oDPxEMm9veFAqvuDXL3OkKr8NVB7Gihe
	YcACE3nUxVqHr9RXRSuViBgwU2aCL4PXd210jJ3hpVv3RlILe7WtbczGlxKK92C1FTKxO7fOaRLtf
	NWwV6M5jL/zh4R5zDR7/+r5+ZZ+f5Z8IOQgycjJx0RaaIbYrhqVBiaXUxqsSk8XtxXXrdVIIq8HEm
	dR7L0nABeAR/5n0cbI4VdndRCQkbIQvtuj+2eWKVSK9xyyqRLxvDkR9NXSdqm7/q+QjGuPQBFjdj8
	wjaU/A1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPiU0-0000000Ev2j-3ng2;
	Sat, 07 Nov 2026 15:37:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPiTw-0000000Euv2-2hWf
	for linux-arm-kernel@bombadil.infradead.org;
	Sat, 07 Nov 2026 15:37:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=nX/BKmNSgCueREMdF/8Pl/MQjIYzPNWNVVbIpr0RXxI=; b=ZZ5RksHzqhLnegwrM3AkeZjdub
	zJN82cGYWBT1kcenhbs17vI8IcUm1tgOsDdjwKa/4gH4w/nXgkY1IsENmpE9//N0h9D1Q5JtLRlNw
	eKrkPFeJP25kbhMte3qch5rE47+udPTkrTskufMSOyx68dj01/svUKh6EJs/L42rtkCIgD3hs35pG
	Jbl7U5VJvK1tq/XOs3KutO06SAFqGuMFkSzjtOmHabdoESeixOSgEsoBQlMIg09gB+zJUHPQAnoao
	vWnW2uz539OXaudyhT6ybk3v1SCuKwMvWtsKLzRVfMIlLreaalB9QJmTTOqRxmJueabyiTL9Q+LoN
	eOLDd5FQ==;
Received: from mail-ej1-x647.google.com ([2a00:1450:4864:20::647])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPiTu-00000005Hwz-05CD
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 15:37:27 +0000
Received: by mail-ej1-x647.google.com with SMTP id a640c23a62f3a-c3f88d2ff28so137684366b.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Nov 2026 07:37:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794065844; x=1794670644; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nX/BKmNSgCueREMdF/8Pl/MQjIYzPNWNVVbIpr0RXxI=;
        b=BZP9tWKzT8ZHRjAbvuNEP9PrnkJgcOOwL+EKQyJIUGPWqoQm6uicNlEQdJ6NRCpaLZ
         LjBraQXxdLGukHcmmzPY7tSKKlWik1yTogvfUi6ADVpG/e3LcdTCtbOzk26K//P86EPk
         R5fdLyb9VGf6T5lBSvyxyIuX+WOD5QOXsexb496uK6gPtwpveCBS9vuHyoioxoo3iZr4
         exaDFEtiD239a56gMB95i0wnH6Zyx7KC1UoHkoUfcyu32ChLghk6D+7gPaLFXnVAj3KP
         gk7zt7eULVmtw4bUPqrHVDUlLJRWgade7lTdeWJaj4OKX+rImiw4+okP+bv2a7H0kAGG
         6SCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794065844; x=1794670644;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nX/BKmNSgCueREMdF/8Pl/MQjIYzPNWNVVbIpr0RXxI=;
        b=r6O6Mkxei/Ow2sWNI5PjeP7vGDb+xezGQo9hL7AKvAtmzWh7GgkU9kOTw2aYW0vs0t
         yAT3BMSYIjEiqw67gP9MXANICHIUg9D5DpSAAtAD3qfxVf0gnush5ZsydL3u/D4sv32T
         Fu6D2dXMXrn5lJACSayFRVKUJzRHbxgrrPzHhvibXWHBBvX96Y5rlZY1Ht7YXrkLH5ll
         WM3elhrG1lrwPhSQqTmLcjnlHOEzmg19XAwibqQdEHLgUsSE/mqhz+EBQOg2d1eWYf1G
         pOynvbyMCY95oyxRZ/79VRkZyaEDkaEFd5kmKYBivXn9U4fDpYXIjoGMjr0UUDojRUeG
         1TOg==
X-Forwarded-Encrypted: i=1; AL+hErEZnFWaTA7DbTJ+cb4z67/L2GuXiJQKRXgrSSlr1eVQ+vyc99Fq3QTR9cmtnGknF/YL8EvgF6Y8WAKoJI9N2PVp@lists.infradead.org
X-Gm-Message-State: APuU4Z+sGtCX9zmpf5k8HkfS2I2fSsdHLLkBbyRgpQwx2I2w8cyc0TmZ
	1nOhiHOIWLi9QL9vS6mcdQIYpKRr8W4LGMhUg3ajW9ctoZZJ5MH+N+sxBGP4RGqFq3lMwb6LhTc
	rQw==
X-Received: from ejcr19.prod.google.com ([2002:a17:906:2813:b0:c31:9562:e7c8])
 (user=ptosi job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:3c8f:b0:c3f:d8f2:f08e
 with SMTP id a640c23a62f3a-c4d3542619emr438107666b.44.1794065843438; Sat, 07
 Nov 2026 07:37:23 -0800 (PST)
Date: Sat, 07 Nov 2026 16:36:17 +0100
In-Reply-To: <20261107-mte-kasan-split-v1-0-d84ea5f30f94@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261107-mte-kasan-split-v1-0-d84ea5f30f94@google.com>
X-Mailer: b4 0.14.3
Message-ID: <20261107-mte-kasan-split-v1-11-d84ea5f30f94@google.com>
Subject: [PATCH 11/24] kasan: provide empty stub for kasan_report_async()
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
X-CRM114-CacheID: sfid-20261107_153725_959241_C066F014 
X-CRM114-Status: GOOD (  11.57  )
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

Allow callers to compile without #ifdef guards.

Cc: Alexander Potapenko <glider@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Andrey Konovalov <andreyknvl@gmail.com>
Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>
Cc: Dmitry Vyukov <dvyukov@google.com>
Cc: kasan-dev@googlegroups.com
Cc: linux-mm@kvack.org
Signed-off-by: Pierre-Cl=C3=A9ment Tosi <ptosi@google.com>
---
 include/linux/kasan.h | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/include/linux/kasan.h b/include/linux/kasan.h
index bf233bde68c7..e429fb483176 100644
--- a/include/linux/kasan.h
+++ b/include/linux/kasan.h
@@ -541,12 +541,6 @@ static inline void *kasan_reset_tag(const void *addr)
=20
 #endif /* CONFIG_KASAN_SW_TAGS || CONFIG_KASAN_HW_TAGS*/
=20
-#ifdef CONFIG_KASAN_HW_TAGS
-
-void kasan_report_async(void);
-
-#endif /* CONFIG_KASAN_HW_TAGS */
-
 #ifdef CONFIG_KASAN_GENERIC
 void __init kasan_init_generic(void);
 #else
@@ -562,9 +556,11 @@ static inline void kasan_init_sw_tags(void) { }
 #ifdef CONFIG_KASAN_HW_TAGS
 void kasan_init_hw_tags_cpu(void);
 void __init kasan_init_hw_tags(void);
+void kasan_report_async(void);
 #else
 static inline void kasan_init_hw_tags_cpu(void) { }
 static inline void kasan_init_hw_tags(void) { }
+static inline void kasan_report_async(void) { }
 #endif
=20
 #ifdef CONFIG_KASAN_VMALLOC

--=20
2.56.0.455.g6c5a503b38-goog


