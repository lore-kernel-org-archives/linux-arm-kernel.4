Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08103606A321
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 13:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wInzQjRm;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=gbEQtiQn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=B/de5ReARPW8/CL4gB96zHViDJROmcLll1MToNdFvMk=; b=wInzQjRm6BsVe9
	JrTb5z5wS+6i2cRqlcNuKmAxeWJSAd2jAdAir7+f1k0t1TLN2HQ5CrbEr6fq6VdDY+V0cE874f4NL
	DEYfVqI4BSME+OtJ/AfCp+FCaMV7tRiCaFTLzZ8CJIhaW4edevuF2SvL9Kfpb+4nA+knRswqxoOm7
	q09QkfAY2jZOdMgBRsyzYosSbbU5//DhdY9WWxVNadugi2V1tkw8VckLsZBf0ikx1FhxLZ3AXXxbn
	XBrjKljXHdO/Hn0fuDuxksEnOozZjfWEwIL+Va0ws67cVGMqYr2S+HT95qWrUkuCGPiVmiGzDWd9l
	/AzEUbKOmSdQmNKQlbvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRUkb-0000000A0hR-3fJ8;
	Thu, 12 Nov 2026 13:22:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRUkO-0000000A0Uc-0vuO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 13:21:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5CF98169C;
	Thu, 12 Nov 2026 05:21:44 -0800 (PST)
Received: from login2.euhpc2.arm.com (login2.euhpc2.arm.com [10.58.100.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id DC2023F632;
	Thu, 12 Nov 2026 05:21:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794489707; bh=9N3M/kNrkwdXCc+g+cvBBWSIBoToqpoy/dnTvM+A+k4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gbEQtiQn8RJDnJl1xB2dzY6df+VzxQ05nsxvSG2swhGM8DSn0SYTARB8VPQydojIO
	 5lpXMoX2fULc2TuoPGpT81jMHlqSYH1OCHDU/X9tIJ7x9Oo5Hw8eqxfpu9HXlJ7KpM
	 CbQdovaW9Cf/qcSYvE4BmyCYQCgo4Ihed8DIOWHY=
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	lpieralisi@kernel.org,
	ruanjinjie@huawei.com,
	liaochang1@huawei.com,
	ashok.raj@oss.qualcomm.com,
	maz@kernel.org
Subject: [PATCH v2 04/39] arm64: process: Lift check for exception state to generic infrastructure
Date: Thu, 12 Nov 2026 13:20:07 +0000
Message-Id: <20261112132042.129062-5-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20261112132042.129062-1-vladimir.murzin@arm.com>
References: <20261112132042.129062-1-vladimir.murzin@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_052148_375540_BF934343 
X-CRM114-Status: GOOD (  10.97  )
X-Spam-Score: -4.4 (----)
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

debug_switch_state() explicitly checks the hardware exception state
for both the pseudo-NMI and non-NMI paths. The expected state matches
the NOIRQ_CONTEXT exception context introduced alongside the exception
masking helpers and state checkers. Such checks are handy outside of
task switch, so turn them into generic helpers available for wider
use. Make debug_switch_state() the first user of newly introduced
helpers.

Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
Tested-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 .../include/asm/interrupts/common_flags.h     | 30 +++++++++++++++++++
 arch/arm64/kernel/process.c                   | 21 ++-----------
 2 files changed, 32 insertions(+), 19 deletions(-)

diff --git a/arch/arm64/include/asm/interrupts/common_flags.h b/arch/arm64/include/asm/interrupts/common_flags.h
index 41364a4e9726..8f79e8179601 100644
--- a/arch/arm64/include/asm/interrupts/common_flags.h
+++ b/arch/arm64/include/asm/interrupts/common_flags.h
@@ -107,6 +107,36 @@ arm64_exc_hwstate_t arm64_exc_hwstate_of_context(arm64_exc_context_t context) {
 	}
 }
 
+static __always_inline
+void arm64_debug_exc_hwstate(arm64_exc_hwstate_t expected)
+{
+	arm64_exc_hwstate_t actual;
+
+	if (!IS_ENABLED(CONFIG_DEBUG_IRQFLAGS))
+		return;
+
+	actual.flags = arch_local_save_flags();
+
+	if (expected.flags == actual.flags)
+		return;
+
+	if (system_uses_irq_prio_masking()) {
+		WARN_ONCE(1, "Unexpected DAIF+PMR: 0x%x + 0x%x (expected 0x%x + 0x%x)\n",
+			  actual.daif, actual.pmr, expected.daif, expected.pmr);
+	} else {
+		WARN_ONCE(1, "Unexpected DAIF: 0x%x (expected 0x%x)\n",
+			  actual.daif, expected.daif);
+	}
+}
+
+static __always_inline
+void arm64_debug_exc_context(arm64_exc_context_t context)
+{
+	arm64_exc_hwstate_t expected = arm64_exc_hwstate_of_context(context);
+
+	arm64_debug_exc_hwstate(expected);
+}
+
 static __always_inline
 void __arm64_update_exc_hwstate(arm64_exc_hwstate_t hwstate, bool force)
 {
diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
index 42b15b0c069f..1013343de671 100644
--- a/arch/arm64/kernel/process.c
+++ b/arch/arm64/kernel/process.c
@@ -51,6 +51,7 @@
 #include <asm/exec.h>
 #include <asm/fpsimd.h>
 #include <asm/gcs.h>
+#include <asm/interrupts/common_flags.h>
 #include <asm/mmu_context.h>
 #include <asm/mpam.h>
 #include <asm/mte.h>
@@ -720,25 +721,7 @@ void update_sctlr_el1(u64 sctlr)
 
 static inline void debug_switch_state(void)
 {
-	if (system_uses_irq_prio_masking()) {
-		unsigned long daif_expected = 0;
-		unsigned long daif_actual = read_sysreg(daif);
-		unsigned long pmr_expected = GIC_PRIO_IRQOFF;
-		unsigned long pmr_actual = read_sysreg_s(SYS_ICC_PMR_EL1);
-
-		WARN_ONCE(daif_actual != daif_expected ||
-			  pmr_actual != pmr_expected,
-			  "Unexpected DAIF + PMR: 0x%lx + 0x%lx (expected 0x%lx + 0x%lx)\n",
-			  daif_actual, pmr_actual,
-			  daif_expected, pmr_expected);
-	} else {
-		unsigned long daif_expected = DAIF_PROCCTX_NOIRQ;
-		unsigned long daif_actual = read_sysreg(daif);
-
-		WARN_ONCE(daif_actual != daif_expected,
-			  "Unexpected DAIF value: 0x%lx (expected 0x%lx)\n",
-			  daif_actual, daif_expected);
-	}
+	arm64_debug_exc_context(NOIRQ_CONTEXT);
 }
 
 /*
-- 
2.34.1


