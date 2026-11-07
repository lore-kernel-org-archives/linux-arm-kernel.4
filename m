Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB420606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 15:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=y64moWJf;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=J3n5FnR2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=fUqLbT1aPE4Hq0PuxNR+9Tpfb7T6wfFXEKCxvCwatAI=; b=y64moWJfM2l12/H+B3NcW9Hkq5
	i/MP1ot6E4by8A7JLOQuOGCSrQDeElewyUbGXEuehEVJUZ52I9Z0IdMVcDPRhkgmJ89nrjWmV+kFQ
	CxvdHlKftQ7xJEptDONpqXFtU/ayj8+3hG72LIX338B0LdWmk3KP3CCUDqMOlBpw3U3HZ4Tw12/i7
	fQqAh6XQbqzwt5RmZQQPvsEheI8khmdaNWtA5YFnS6k2VtHZIurUbuP34/WgY1tnpuBi5RYGRYwhA
	tKhMKbLe5oZ2R7XLcJORipzw3oGwUnM2apCYNlR8MNUpdiI+3WUuMhMNn9/rCUrEE5xJGSbh9h54K
	VuDjk/Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPiTl-0000000EunD-1kJ7;
	Sat, 07 Nov 2026 15:37:17 +0000
Received: from mail-ej1-x645.google.com ([2a00:1450:4864:20::645])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPiTi-0000000EukZ-1wsm
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 15:37:15 +0000
Received: by mail-ej1-x645.google.com with SMTP id a640c23a62f3a-c210c66672eso190352066b.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Nov 2026 07:37:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794065832; x=1794670632; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fUqLbT1aPE4Hq0PuxNR+9Tpfb7T6wfFXEKCxvCwatAI=;
        b=J3n5FnR2Ow3jq8mAKluQqwnf+4jnrPsO8Xo4u05QbKoxns5FKUKoWuHVvFNNHDwB0m
         mWQ/bCGapu/5wogP+iMiQZatnYq9dGhX0PbnlH7XnbtprXAe53x8UusVYMMCIkNFLUI/
         VMx3lfW6kBzApcPxJ3kao1FM4Vw7WLGNUkyZ4rI8gn8z/+yFGldcr1Jud7I0LIaZssPj
         YhdqprJ51f/zPxWuJzSEi+XUAcRJCcaKTwMVEGJVWMHrFbArPAZ2Zv91pItP2mHRVXb3
         c3SNwx0pHuc+t8UwpluCmw/dIK69t52AizI7AhveK5v/8254ryLm42D0E/2BR5FbOlyZ
         MjQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794065832; x=1794670632;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fUqLbT1aPE4Hq0PuxNR+9Tpfb7T6wfFXEKCxvCwatAI=;
        b=rQq8r/ZzKu72ZuyvYpnrBt3RtfE+QoEXNYgDO2kKP0iVEhZtqfrVAd1U4Ufkku6qn5
         p1b8Z/ZZDY+x8mNdBbXsYeMbNNlEVhtFAQE/Rw42vIfsQbWoUDhrpMa/vpeVaWYmSK8g
         W1VRUWxl2eCQKjL2fYnVPOBvRUw4GTENPXu4cl1pPrH8Lspaz0Ov5wxyC/MLa0f8PECv
         dM9C0iKuUyRxTzD1E4fhj4Pt5E50m+eqzZ2uVhpwDdwTdRumcaR6NuVdHKqkKd8qnE2s
         0mEH1HTfPCUSm7RDu/9U80w0kEDmQELfYhv4rQXvO+biYQmaB5Kp9d9RxhpOV+sTCjdS
         0Lmg==
X-Forwarded-Encrypted: i=1; AKwUvByvf8eYrC9jfTeCi+tC3blqTiiWlASrcY1bRP7SyPGv4RXrjLIomYHIPkoCyk4kGafkezW1ufqjzQ/qY3UcrnOI@lists.infradead.org
X-Gm-Message-State: APuU4Z/WXgi7SgQGPULU7Ir66nN39DHEjJhUByrk4r5V4Sqrpxs6DXOm
	G/oJ6RK9yF3LfCrASDHO0XagknxFVAEgKRvHeHUQwr/bnVSgb47sHsqDXYvtL3wMapvGDBsx/o4
	+nQ==
X-Received: from ejczw11-n1.prod.google.com ([2002:a17:907:e00b:10b0:c46:6df1:aa6e])
 (user=ptosi job=prod-delivery.src-stubby-dispatcher) by 2002:a17:906:4788:b0:c41:1750:59a2
 with SMTP id a640c23a62f3a-c4d3522aadamr458981866b.12.1794065831931; Sat, 07
 Nov 2026 07:37:11 -0800 (PST)
Date: Sat, 07 Nov 2026 16:36:10 +0100
In-Reply-To: <20261107-mte-kasan-split-v1-0-d84ea5f30f94@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261107-mte-kasan-split-v1-0-d84ea5f30f94@google.com>
X-Mailer: b4 0.14.3
Message-ID: <20261107-mte-kasan-split-v1-4-d84ea5f30f94@google.com>
Subject: [PATCH 04/24] arm64: Skip TCO on privileged uaccess without kMTE
From: "=?utf-8?q?Pierre-Cl=C3=A9ment_Tosi?=" <ptosi@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	"=?utf-8?q?Pierre-Cl=C3=A9ment_Tosi?=" <ptosi@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_073714_519857_BDA393EF 
X-CRM114-Status: GOOD (  15.72  )
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

PSTATE.TCO toggling can be expensive but uaccess_*_privileged() (used in
futex()) were doing it unconditionally when built with KASAN_HW_TAGS and
running on MTE-capable CPUs, due to mte_{enable,disable}_tco(). This was
unnecessary when 'kasan=3Doff', adding overhead despite the care taken in
mte_disable_tco_entry() to keep TCO set.

Instead, only toggle TCO if EL1 accesses risk triggering tag faults.

Name the new helpers by following the example of __uaccess_*_hw_pan().
Specifically, this favors a simpler terminology ("re-enabling MTE")
over confusing double-negations ("disabling the override").

Move the comment intended to document this out of a shared KASAN header,
to be next to the code it explains.

Signed-off-by: Pierre-Cl=C3=A9ment Tosi <ptosi@google.com>
---
 arch/arm64/include/asm/mte-kasan.h | 17 -----------------
 arch/arm64/include/asm/uaccess.h   | 21 +++++++++++++++++++--
 2 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/arch/arm64/include/asm/mte-kasan.h b/arch/arm64/include/asm/mt=
e-kasan.h
index 43510341b965..467d1d41a392 100644
--- a/arch/arm64/include/asm/mte-kasan.h
+++ b/arch/arm64/include/asm/mte-kasan.h
@@ -34,23 +34,6 @@ static inline bool system_uses_mte_async_or_asymm_mode(v=
oid)
=20
 #ifdef CONFIG_ARM64_MTE
=20
-/*
- * The Tag Check Flag (TCF) mode for MTE is per EL, hence TCF0
- * affects EL0 and TCF affects EL1 irrespective of which TTBR is
- * used.
- * The kernel accesses TTBR0 usually with LDTR/STTR instructions
- * when UAO is available, so these would act as EL0 accesses using
- * TCF0.
- * However futex.h code uses exclusives which would be executed as
- * EL1, this can potentially cause a tag check fault even if the
- * user disables TCF0.
- *
- * To address the problem we set the PSTATE.TCO bit in uaccess_enable()
- * and reset it in uaccess_disable().
- *
- * The Tag check override (TCO) bit disables temporarily the tag checking
- * preventing the issue.
- */
 static inline void mte_disable_tco(void)
 {
 	if (!IS_ENABLED(CONFIG_KASAN_HW_TAGS))
diff --git a/arch/arm64/include/asm/uaccess.h b/arch/arm64/include/asm/uacc=
ess.h
index 9f5bd9c69c24..f0924dc0bd64 100644
--- a/arch/arm64/include/asm/uaccess.h
+++ b/arch/arm64/include/asm/uaccess.h
@@ -16,6 +16,7 @@
  */
 #include <linux/bitops.h>
 #include <linux/kasan-checks.h>
+#include <linux/kasan-enabled.h>
 #include <linux/string.h>
=20
 #include <asm/asm-extable.h>
@@ -132,9 +133,25 @@ static inline void __uaccess_enable_hw_pan(void)
 	asm(ALTERNATIVE("nop", SET_PSTATE_PAN(1), ARM64_HAS_PAN));
 }
=20
+static inline void __uaccess_disable_mte(void)
+{
+	/*
+	 * Unlike get_user(), privileged uaccess (TTBR0) uses TCF (not TCF0)
+	 * such that a bad user address tag could trigger a kernel MTE fault.
+	 */
+	if (kasan_hw_tags_enabled())
+		asm volatile(SET_PSTATE_TCO(1));
+}
+
+static inline void __uaccess_enable_mte(void)
+{
+	if (kasan_hw_tags_enabled())
+		asm volatile(SET_PSTATE_TCO(0));
+}
+
 static inline void uaccess_disable_privileged(void)
 {
-	mte_disable_tco();
+	__uaccess_enable_mte();
=20
 	if (uaccess_ttbr0_disable())
 		return;
@@ -144,7 +161,7 @@ static inline void uaccess_disable_privileged(void)
=20
 static inline void uaccess_enable_privileged(void)
 {
-	mte_enable_tco();
+	__uaccess_disable_mte();
=20
 	if (uaccess_ttbr0_enable())
 		return;

--=20
2.56.0.455.g6c5a503b38-goog


