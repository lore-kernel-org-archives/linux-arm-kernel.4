Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C1EA606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 13:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1zGQXvDL;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=dF3nu3UK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ZsQ1mwKsS1XNg3Dx5Y2uoF3+GW5QKTOrw9DiGj3cy70=; b=1zGQXvDLDY8EhO
	6L1UQx0EPc4b+dZ9aTahFXlCbUR566yQzCENyAQ3hHfIKOi4DrHKSNmIi/Fyz3FensVpcJL9NYGrm
	ejn1MAzW9FnEJy3OOSjAPm8bBKw8v5o0WnKj1grGGCdUQgAcXXZZ6axAcv0lTzVJ548Xb+OjUQu8o
	5cL2Qa/K7XJKAD5P6pZSZDXrALW5PrYi7N5gerPQbJERa9Yua1X7EhWjDPCw9TENC6L4XWL+fOnMC
	nt5h3sYW7oIMQ8l/FcI0PiiOWpuZgqWjegZ4sLDmKQPJv5K1vUQtlJ057mgoxllQ54wqSfxggpjIM
	xZ9Tn4FnKp6Xna61Ilyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRUle-0000000A1a6-2xHJ;
	Thu, 12 Nov 2026 13:23:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRUkn-0000000A0tP-0rNp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 13:22:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 956521576;
	Thu, 12 Nov 2026 05:22:09 -0800 (PST)
Received: from login2.euhpc2.arm.com (login2.euhpc2.arm.com [10.58.100.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0BC1B3F632;
	Thu, 12 Nov 2026 05:22:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794489732; bh=D/eH1g/fXFcSb6rSdmfL98ei8HFrcvmKQxO9EAIO5VA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dF3nu3UKd+2ORfCpSDv6P8YExfBIcKXCfW+VBXH9KzLA9l+FhNvfvkJFAWvB/e/rn
	 dk1L7H2Bbtjzs1rUaaQ7K04nt8rXLTblWLLYNrzy0uex5sGWKQHU1Th7JnIka0ZOrI
	 svRnQyPFk8ARtYpEDO+cCXtVR7bFP9+is39PouxA=
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
Subject: [PATCH v2 17/39] arm64/efi: Implement override for IRQ flags checks
Date: Thu, 12 Nov 2026 13:20:20 +0000
Message-Id: <20261112132042.129062-18-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20261112132042.129062-1-vladimir.murzin@arm.com>
References: <20261112132042.129062-1-vladimir.murzin@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_052213_358060_DC9418F6 
X-CRM114-Status: GOOD (  12.55  )
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

Take advantage of the recent changes to the way arm64 represents IRQ
flags and implement an architecture-specific override for the EFI IRQ
flags check.

IRQ flags now carry both DAIF and PMR state. EFI is not expected to
modify either of them, so check both when verifying that IRQ state is
preserved across EFI runtime calls.

Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
Tested-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/include/asm/efi.h | 38 ++++++++++++++++++++++++++++++------
 1 file changed, 32 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/include/asm/efi.h b/arch/arm64/include/asm/efi.h
index e8a9783235cb..0fc5a8cd5850 100644
--- a/arch/arm64/include/asm/efi.h
+++ b/arch/arm64/include/asm/efi.h
@@ -5,6 +5,7 @@
 #include <asm/boot.h>
 #include <asm/cpufeature.h>
 #include <asm/fpsimd.h>
+#include <asm/interrupts/common_flags.h>
 #include <asm/io.h>
 #include <asm/memory.h>
 #include <asm/mmu_context.h>
@@ -48,18 +49,43 @@ void arch_efi_call_virt_teardown(void);
 	(efi_rt_stack_top != NULL &&					\
 	 on_task_stack(current, READ_ONCE(efi_rt_stack_top[-1]), 1))
 
-#define ARCH_EFI_IRQ_FLAGS_MASK (PSR_D_BIT | PSR_A_BIT | PSR_I_BIT | PSR_F_BIT)
-
 /*
  * Even when Linux uses IRQ priorities for IRQ disabling, EFI does not.
  * And EFI shouldn't really play around with priority masking as it is not aware
  * which priorities the OS has assigned to its interrupts.
  */
 #define arch_efi_save_flags(state_flags)		\
-	((void)((state_flags) = read_sysreg(daif)))
-
-#define arch_efi_restore_flags(state_flags)	write_sysreg(state_flags, daif)
-
+	((void)((state_flags) = arch_local_save_flags()))
+
+#define arch_efi_restore_flags(state_flags)			\
+do {								\
+	arm64_exc_hwstate_t __st = {.flags=state_flags};	\
+								\
+	arm64_update_exc_hwstate(__st);				\
+} while(0)
+
+#define arch_efi_check_flags(state_flags, caller)									\
+do {															\
+	arm64_exc_hwstate_t __actual = {.flags =  arch_local_save_flags() };						\
+	arm64_exc_hwstate_t __expected = {.flags=state_flags};								\
+															\
+	if (__expected.flags == __actual.flags)										\
+		break;													\
+															\
+	add_taint(TAINT_FIRMWARE_WORKAROUND, LOCKDEP_NOW_UNRELIABLE);							\
+															\
+	if (system_uses_irq_prio_masking()) {										\
+		pr_err_ratelimited(FW_BUG "DAIF+PMR corrupted (0x%x + 0x%x=>0x%x + 0x%x) by EFI call from %pS\n",	\
+				   __expected.daif, __expected.pmr, __actual.daif, __actual.pmr,			\
+				   caller ?: __builtin_return_address(0));						\
+	} else {													\
+		pr_err_ratelimited(FW_BUG "DAIF corrupted (0x%x=>0x%x) by EFI call from %pS\n",				\
+				   __expected.daif, __actual.daif,							\
+				   caller ?: __builtin_return_address(0));						\
+	}														\
+															\
+	arch_efi_restore_flags(state_flags);										\
+} while(0)
 
 /* arch specific definitions used by the stub code */
 
-- 
2.34.1


