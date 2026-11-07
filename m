Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40862606A333
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 15:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2/pTH8E2;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=lY0ESBVz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=uQCqr85B7TpVTwUE8AIWjkQSCKDYHOd0Anwd+zR/j2g=; b=2/pTH8E2xnKmLyLyQ5GK3rwDqk
	J/pIU1eGxVYEpF+CoLzp1GCWMuPOHSR7QCboiPNAnfSrxxTOXiUOkWiC3Rhl9+8P36/O1CyDZnfjD
	Be2CNmdAxlgTj0XLpk+CYFsNGM0tBhtexI/E/SMl7+A4M7+cEVfZu5hjiXVpeCCoIJdb4PIGueiSN
	XLS1GV6m5fyS7LrAtoDlfkCK0gODv7vI2Ujz9FbFclDhAr5zSMhwiO7SHHt1KYzYVuxnqv2SbZnwO
	BOoT68hL8/Mli1pRmP3wDVstgWqIGK06dP+7Z5+OyazF/xQfFmIA2TvA/i/31GY6ZFEqVJy3peaQS
	MsYORaLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPiUR-0000000Evoq-19b6;
	Sat, 07 Nov 2026 15:37:59 +0000
Received: from mail-ed1-x547.google.com ([2a00:1450:4864:20::547])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPiUB-0000000EvMb-16Ih
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 15:37:45 +0000
Received: by mail-ed1-x547.google.com with SMTP id 4fb4d7f45d1cf-6b6fb975053so171069a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Nov 2026 07:37:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794065861; x=1794670661; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uQCqr85B7TpVTwUE8AIWjkQSCKDYHOd0Anwd+zR/j2g=;
        b=lY0ESBVzluqJjjgDmIgH7UVp5MNTo8+0pSsLSgX+SZ81ERJ4bV9kO8p3RDm+9E7X1g
         MRg9f2CGn3VphmPZ/FgmmWomCRl5xUjrGzMfNWyUGoyfMUbarPlFTkShwv+YGdrUBss6
         8v8RrDlaRP5KCIadcdgQMdyC00BaS3F3CQZ/4aTvNhHLu2gfQOpPHXDY8W8t26qTrtYM
         htD/VHsf4AdbVEqvlpjJDvtEphXjBQRWjnMrkkzAImqwKvuz48fDXg11rnGtQHaP4WJR
         JXkwoZ9McMN5r15P71hJur2/es2QYJ14JVsHCGrz0/Qre0HcMtjL0EVX5Eof7hwnnj9m
         w/4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794065861; x=1794670661;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uQCqr85B7TpVTwUE8AIWjkQSCKDYHOd0Anwd+zR/j2g=;
        b=h3dJLk7UhQpN8bikLca05uF74joozDxRytMtj/IMZSKGEtIzjtvyYto9nvktscxr6Y
         ClaOynwl1QfIZsLsW5iixHIWjMvSNuxMaWWq900qcPNQv9ZBxiJgH6OHRhzQEj21LzKf
         PxujVhtXsGAKLTVdb/y0ls+xPerpEjtDdEA8ke1+ajx3Q5A8qiRN2DnaKaJzevn/7pGA
         B/FzUke1Zfk8jNmMabTBQcb4Jmat3OBeFF20dxrNp3T5+7J83cKcFl7RHwK9NIF6ihAb
         jKbtm7uSRKr1uolB2H2DknCto4fu5bi7Uu0/sRy4WTnAeVOi73f/h5rmUxhxa9Os+Q1m
         /HoQ==
X-Forwarded-Encrypted: i=1; AL+hErHH8D1Qt1f8Wcprd4O6HUYg6tv7hT5aSDJRyGRak6gevv2/PapIlTLWXtnHihtNOI0UCyrNe1sgKhLPZd070hXJ@lists.infradead.org
X-Gm-Message-State: APuU4Z9+E1DxeCZ+zFZ/DiOjJs0GOxvbHr1cQMOkuvi5Poap0rIMUmNt
	8Hns0JdMnXclggd2HNERUehYYp09MflPxBFaPfYyfbMq/bJK6wsbnKJctr0uG3BwPwTwnPcW+i2
	MKg==
X-Received: from edl18-n1.prod.google.com ([2002:a05:6402:4252:10b0:6b1:b9fe:f2a2])
 (user=ptosi job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:90d:b0:6b6:f3dd:bb86
 with SMTP id 4fb4d7f45d1cf-6b6f3ddbe74mr2222078a12.35.1794065860804; Sat, 07
 Nov 2026 07:37:40 -0800 (PST)
Date: Sat, 07 Nov 2026 16:36:30 +0100
In-Reply-To: <20261107-mte-kasan-split-v1-0-d84ea5f30f94@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261107-mte-kasan-split-v1-0-d84ea5f30f94@google.com>
X-Mailer: b4 0.14.3
Message-ID: <20261107-mte-kasan-split-v1-24-d84ea5f30f94@google.com>
Subject: [PATCH 24/24] arm64: Introduce CONFIG_ARM64_MTE_KERNEL
From: "=?utf-8?q?Pierre-Cl=C3=A9ment_Tosi?=" <ptosi@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	"=?utf-8?q?Pierre-Cl=C3=A9ment_Tosi?=" <ptosi@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_073743_351232_87753905 
X-CRM114-Status: GOOD (  18.08  )
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

Add a dedicated Kconfig symbol to top off the first round of patches
decoupling MTE code from KASAN. Although the config isn't intended to be
used by anything other than KASAN_HW_TAGS today, it already provides a
clearer distinction between code that is architecturally required for
supporting MTE at EL1 (e.g. TCO management) and code that is specific to
KASAN (e.g. allocation alignment).

Signed-off-by: Pierre-Cl=C3=A9ment Tosi <ptosi@google.com>
---
 arch/arm64/Kconfig           | 8 ++++++++
 arch/arm64/include/asm/mte.h | 2 +-
 arch/arm64/kernel/mte.c      | 4 ++--
 arch/arm64/lib/strlen.S      | 4 ++--
 4 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 1075bc661833..af5a7f5a0d94 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -2255,6 +2255,7 @@ config ARM64_MTE
 	select ARCH_USES_HIGH_VMA_FLAGS
 	select ARCH_USES_PG_ARCH_2
 	select ARCH_USES_PG_ARCH_3
+	select ARM64_MTE_KERNEL if KASAN_HW_TAGS
 	help
 	  Memory Tagging (part of the ARMv8.5 Extensions) provides
 	  architectural support for run-time, always-on detection of
@@ -2275,6 +2276,13 @@ config ARM64_MTE
=20
 	  Documentation/arch/arm64/memory-tagging-extension.rst.
=20
+config ARM64_MTE_KERNEL
+	bool
+	depends on ARM64_MTE
+	help
+	  This option enables the support for the Memory Tagging
+	  Extension at EL1 (i.e. for kernelspace).
+
 endmenu # "ARMv8.5 architectural features"
=20
 menu "ARMv8.7 architectural features"
diff --git a/arch/arm64/include/asm/mte.h b/arch/arm64/include/asm/mte.h
index 34d1438019ed..7a49729f6a48 100644
--- a/arch/arm64/include/asm/mte.h
+++ b/arch/arm64/include/asm/mte.h
@@ -34,7 +34,7 @@ void mte_invalidate_tags_area(int type);
 void *mte_allocate_tag_storage(void);
 void mte_free_tag_storage(char *storage);
=20
-#ifdef CONFIG_KASAN_HW_TAGS
+#ifdef CONFIG_ARM64_MTE_KERNEL
 DECLARE_STATIC_KEY_FALSE(mte_sync_or_asymm_mode);
 DECLARE_STATIC_KEY_FALSE(mte_async_or_asymm_mode);
=20
diff --git a/arch/arm64/kernel/mte.c b/arch/arm64/kernel/mte.c
index d072cb76ad05..888519e14a76 100644
--- a/arch/arm64/kernel/mte.c
+++ b/arch/arm64/kernel/mte.c
@@ -31,7 +31,7 @@
=20
 static DEFINE_PER_CPU_READ_MOSTLY(u64, mte_tcf_preferred);
=20
-#ifdef CONFIG_KASAN_HW_TAGS
+#ifdef CONFIG_ARM64_MTE_KERNEL
 /*
  * The asynchronous and asymmetric MTE modes have the same behavior for
  * store operations. This flag is set when either of these modes is enable=
d.
@@ -100,6 +100,7 @@ int memcmp_pages(struct page *page1, struct page *page2=
)
 	return ret;
 }
=20
+#ifdef CONFIG_ARM64_MTE_KERNEL
 static inline void __mte_enable_kernel(const char *mode, unsigned long tcf=
)
 {
 	/* Enable MTE Sync Mode for EL1. */
@@ -110,7 +111,6 @@ static inline void __mte_enable_kernel(const char *mode=
, unsigned long tcf)
 	pr_info_once("MTE: enabled in %s mode at EL1\n", mode);
 }
=20
-#ifdef CONFIG_KASAN_HW_TAGS
 void mte_enable_kernel_sync(void)
 {
 	/*
diff --git a/arch/arm64/lib/strlen.S b/arch/arm64/lib/strlen.S
index a8c49a3886f6..80557af775de 100644
--- a/arch/arm64/lib/strlen.S
+++ b/arch/arm64/lib/strlen.S
@@ -44,11 +44,11 @@
 #define REP8_80 0x8080808080808080
=20
 /*
- * When KASAN_HW_TAGS is in use, memory is checked at MTE_GRANULE_SIZE
+ * When ARM64_MTE_KERNEL is in use, memory is checked at MTE_GRANULE_SIZE
  * (16-byte) granularity, and we must ensure that no access straddles this
  * alignment boundary.
  */
-#ifdef CONFIG_KASAN_HW_TAGS
+#ifdef CONFIG_ARM64_MTE_KERNEL
 #define MIN_PAGE_SIZE MTE_GRANULE_SIZE
 #else
 #define MIN_PAGE_SIZE 4096

--=20
2.56.0.455.g6c5a503b38-goog


