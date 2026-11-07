Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0490F60A3821
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 15:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aChuWbSi;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=l2Lv/S+Z
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=xZJrP1aJDDxFBFBygqsoNEypPFzVS6oeHoKisvrveOQ=; b=aChuWbSiswl+TJWI8sJGOPbnAp
	sLUChw3jlM1OKcFkW6sjXxV2dE1Th9EsowN3IPkh7gIHaDs48CQskLe5g5zsDnzlxhpVrdb5HcRZm
	+k+u6+tWQYayB4xKQ4v2JqpiJb9iJtjrfve8gq/t7TBNFEAqch8rm5i3vTnBBnPvfbzCljdMsmtrX
	trA4PONSFXWhY20UpL64DbnsZwTztATekFoCUdF37pMKAOfGGot/A6giFghMhK4YSiLpw31QnbGBr
	4kM8pyemGS0GS0v5JzqH3U3Q4cG0niMuZNls03mTkUmUA9MTmg7q7lrpx6azKC4ZVA9jGI/ri78Jm
	mumn8htw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPiU0-0000000Ev1F-0uQt;
	Sat, 07 Nov 2026 15:37:32 +0000
Received: from mail-ed1-x546.google.com ([2a00:1450:4864:20::546])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPiTq-0000000Euom-37wu
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 15:37:28 +0000
Received: by mail-ed1-x546.google.com with SMTP id 4fb4d7f45d1cf-6b3f6d9827eso1512779a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Nov 2026 07:37:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794065839; x=1794670639; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xZJrP1aJDDxFBFBygqsoNEypPFzVS6oeHoKisvrveOQ=;
        b=l2Lv/S+ZtoJ9BQg5zVV748n2GBNHdhS03JZrP7pvgXUDn6zsjKNPO2Yu+eebrTN7Vl
         RADQSX78bie+f6rwiHfw03g7y3/07r6K81oNP97xSIJOqwLHF8EsBtG+MWFH9WsUqdbz
         LEdfKX22ftF6ElrD7nLYYf65CCLc2714ExBUtrWI3Hqda0OZkGPCACi+2ldf6J0p4nsf
         0Vn+uBsKZbihKWnJ3QCh+WBT1d6DjoahUT1tvBBYk8duTOZ++JmMXJJtMesv+RqIHyLk
         /LewQrWkast3YhftJ4xR6Qr7IpnDo3PoMVSVuDQIMG1Pr5BZCHCoR0NL7ZniDsLMsfY1
         SOKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794065839; x=1794670639;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xZJrP1aJDDxFBFBygqsoNEypPFzVS6oeHoKisvrveOQ=;
        b=iSi/8fkkp3eSWN9lXWqJ/1eQiCq0Oz7ffTy5vaEVpkyy7b1uuWLrT3XVUGJfGxmr7h
         W1Kp3azD9ZPoLEMUUvvilQ3vxGxjH2AeGovAKATg++d3NTU89ecCaJ1PfecPN5GB8IB8
         Lw4Q8MWh0iAff9MkCGwre5UVnpgJN6tUjCZ5NN7QjY4NZCgAm8576z9f+Hd9Qfn9fkhA
         mGCffVXmu4yWG6/MGDQPSZuuBJjYESn1OuqU6Cf+wnPEPxv/8XAS7sHra+ftxAGjsw+j
         L+FOcf+xR9MdcHI2RzwYLhAypwTH96SKM+FPVOiyQfcJnIqEy/dtFO3I2qoc9mJw9ve3
         oF8Q==
X-Forwarded-Encrypted: i=1; AL+hErHG5a+qGWSVzw16KWz6LVXO+Pb5MMceZW1xXtsstyJkbNHOGAu+x6EZrRGiKUv+KThLNPvV7bzDGzddnbP3lNm9@lists.infradead.org
X-Gm-Message-State: APuU4Z/fWm9tosUdRgqHVGFHUHqY7JtoWAzq6sTG5fFyeVIVoN/CHEjl
	LhnU104A3t1CsME6tDb2hcxSiWtDW0ZgL715sjFBq4WuVeJQZBEaJl/XlPT4UdV9/RB4UAIe0JO
	+5Q==
X-Received: from edt6.prod.google.com ([2002:a05:6402:4546:b0:6b5:77e8:bf7d])
 (user=ptosi job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:90d:b0:6b4:88e8:6074
 with SMTP id 4fb4d7f45d1cf-6b5977caf87mr3835118a12.22.1794065838990; Sat, 07
 Nov 2026 07:37:18 -0800 (PST)
Date: Sat, 07 Nov 2026 16:36:14 +0100
In-Reply-To: <20261107-mte-kasan-split-v1-0-d84ea5f30f94@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261107-mte-kasan-split-v1-0-d84ea5f30f94@google.com>
X-Mailer: b4 0.14.3
Message-ID: <20261107-mte-kasan-split-v1-8-d84ea5f30f94@google.com>
Subject: [PATCH 08/24] arm64: Introduce mte_get_reset_tfsr() helpers
From: "=?utf-8?q?Pierre-Cl=C3=A9ment_Tosi?=" <ptosi@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	"=?utf-8?q?Pierre-Cl=C3=A9ment_Tosi?=" <ptosi@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_073722_798374_6EB1AF3A 
X-CRM114-Status: GOOD (  15.61  )
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

In an effort to untangle MTE from KASAN, split a reusable MTE helper out
of mte_check_tfsr_el1(), providing two variants, to accommodate the
contexts under which it gets called: one synchronising TFx before
reading it and another delegating that responsibility to the caller.

Name the helpers similarly to __dsu_pmu_get_reset_overflow().

This prepares for a rework of the KASAN API to simplify circular header
dependencies, as KASAN calls into mte_check_tfsr_el1(), which calls back
into a kasan_*() function.

Signed-off-by: Pierre-Cl=C3=A9ment Tosi <ptosi@google.com>
---
 arch/arm64/include/asm/mte.h | 31 +++++++++++++++++++++++++++++++
 arch/arm64/kernel/mte.c      | 12 +-----------
 2 files changed, 32 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/include/asm/mte.h b/arch/arm64/include/asm/mte.h
index 1d6113ae786f..614fff7dc35f 100644
--- a/arch/arm64/include/asm/mte.h
+++ b/arch/arm64/include/asm/mte.h
@@ -17,7 +17,9 @@
 #include <linux/sched.h>
 #include <linux/types.h>
=20
+#include <asm/barrier.h>
 #include <asm/pgtable-types.h>
+#include <asm/sysreg.h>
=20
 void mte_clear_page_tags(void *addr);
 unsigned long mte_copy_tags_from_user(void *to, const void __user *from,
@@ -31,6 +33,35 @@ void mte_invalidate_tags_area(int type);
 void *mte_allocate_tag_storage(void);
 void mte_free_tag_storage(char *storage);
=20
+static __always_inline bool __mte_get_reset_tfsr(void)
+{
+	u64 tfsr_el1 =3D read_sysreg_s(SYS_TFSR_EL1);
+
+	if (likely(!(tfsr_el1 & SYS_TFSR_EL1_TF1)))
+		return false;
+
+	/*
+	 * Note: isb() is not required after this direct write
+	 * because there is no indirect read subsequent to it
+	 * (per ARM DDI 0487F.c table D13-1).
+	 */
+	write_sysreg_s(0, SYS_TFSR_EL1);
+
+	return true;
+}
+
+static __always_inline bool mte_get_reset_tfsr(void)
+{
+	/*
+	 * The barriers are required to guarantee that the indirect writes
+	 * to TFSR_EL1 are synchronized before we report the state.
+	 */
+	dsb(nsh);
+	isb();
+
+	return __mte_get_reset_tfsr();
+}
+
 #ifdef CONFIG_ARM64_MTE
=20
 /* track which pages have valid allocation tags */
diff --git a/arch/arm64/kernel/mte.c b/arch/arm64/kernel/mte.c
index 8025ee1f7fdb..47432c9c4de0 100644
--- a/arch/arm64/kernel/mte.c
+++ b/arch/arm64/kernel/mte.c
@@ -182,18 +182,8 @@ int mte_enable_kernel_store_only(void)
 #ifdef CONFIG_KASAN_HW_TAGS
 void mte_check_tfsr_el1(void)
 {
-	u64 tfsr_el1 =3D read_sysreg_s(SYS_TFSR_EL1);
-
-	if (unlikely(tfsr_el1 & SYS_TFSR_EL1_TF1)) {
-		/*
-		 * Note: isb() is not required after this direct write
-		 * because there is no indirect read subsequent to it
-		 * (per ARM DDI 0487F.c table D13-1).
-		 */
-		write_sysreg_s(0, SYS_TFSR_EL1);
-
+	if (__mte_get_reset_tfsr())
 		kasan_report_async();
-	}
 }
 #endif
=20

--=20
2.56.0.455.g6c5a503b38-goog


