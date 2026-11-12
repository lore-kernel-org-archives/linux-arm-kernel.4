Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC89B606A321
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 13:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=syNxx4IS;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=f7b/0RBC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=jQSL4sfuE5Ic6WP1fa4zTqhvsSVe2u8x+1Sky4nyc1E=; b=syNxx4ISwrKRkc
	hZmFRmD/kjeTDncqlzvetH58VHKCVkNZTys7ef22nZZruA1Hgp1lcEJbuXdjL0iPORgGomO0HJMu/
	y0dxwKZRYWCyS6kI96ttumFk7gvB0MdnhyfDhtzZqNfoELmEw+9g7JOLXrcYdthihHmSfReCjmrN0
	45X6AFhGdtVDd/6lg4slHci+Ft438jeHy3cVom7uGKoBM5cDaTIggJM88YFrmyzuMUS2ufme8GE17
	bF61tQNRI+WfSeny6CRaN2AA7N+fQ8jtmjf0d4ewe9jL5S693DEecIoR8hSihyYHbU32G0og+XP0i
	qLJXiqItbyp2NZl4U7pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRUlY-0000000A1VF-2rTC;
	Thu, 12 Nov 2026 13:23:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRUkl-0000000A0oV-16TW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 13:22:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A6E9E153B;
	Thu, 12 Nov 2026 05:22:07 -0800 (PST)
Received: from login2.euhpc2.arm.com (login2.euhpc2.arm.com [10.58.100.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3A8B13F632;
	Thu, 12 Nov 2026 05:22:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794489730; bh=jI16w2LgqjtHdfzmC8TBGMuDt5Hp5PO38NOKDtrhXWY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=f7b/0RBCqRWEYriBLpnwVj62HBzZriM6IstHrnG4J04AI0hVhljcHkr3jy1qCLHQP
	 +aTfG4G/yKbHdxm/vqOKsw7cXYkT/79rBO4cId3jLbcvTz6ZNV7nYhF58UfpRKrlwW
	 IRSstxEmKcZQmNOgoL9/3x7Uy9GpfJwc1MgTZg2I=
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
Subject: [PATCH v2 16/39] efi/runtime-wrappers: Permit architectures to override IRQ flags checks
Date: Thu, 12 Nov 2026 13:20:19 +0000
Message-Id: <20261112132042.129062-17-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20261112132042.129062-1-vladimir.murzin@arm.com>
References: <20261112132042.129062-1-vladimir.murzin@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_052211_525490_7BB382AA 
X-CRM114-Status: GOOD (  11.35  )
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

Representation of IRQ flags on arm64 has recently changed. They now
track both DAIF and PMR state while remaining compatible with the
irqflags API by encoding the state in an unsigned long.

While the generic check can still detect corruption of the IRQ flags
caused by EFI runtime services, the resulting error message is cryptic
because it does not understand the arm64-specific representation.

Permit architectures to override the IRQ flags checks and associated
error messages, while keeping the existing implementation as the
default.

Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
Tested-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/firmware/efi/runtime-wrappers.c | 32 +++++++++++++++----------
 1 file changed, 20 insertions(+), 12 deletions(-)

diff --git a/drivers/firmware/efi/runtime-wrappers.c b/drivers/firmware/efi/runtime-wrappers.c
index eea4f32e6474..6be9cb844303 100644
--- a/drivers/firmware/efi/runtime-wrappers.c
+++ b/drivers/firmware/efi/runtime-wrappers.c
@@ -151,6 +151,25 @@ static bool efi_rts_abandoned;
 #define arch_efi_restore_flags(state_flags)	local_irq_restore(state_flags)
 #endif
 
+#ifndef arch_efi_check_flags
+#define arch_efi_check_flags(state_flags, caller) 							\
+do {													\
+	unsigned long cur_flags, mismatch;								\
+													\
+	cur_flags = efi_call_virt_save_flags();								\
+													\
+	mismatch = state_flags ^ cur_flags;								\
+	if (!WARN_ON_ONCE(mismatch & ARCH_EFI_IRQ_FLAGS_MASK))						\
+		break;											\
+													\
+	add_taint(TAINT_FIRMWARE_WORKAROUND, LOCKDEP_NOW_UNRELIABLE); 					\
+	pr_err_ratelimited(FW_BUG "IRQ flags corrupted (0x%08lx=>0x%08lx) by EFI call from %pS\n",	\
+			   state_flags, cur_flags,							\
+			   caller ?: __builtin_return_address(0));					\
+	arch_efi_restore_flags(state_flags);								\
+} while(0)
+#endif
+
 unsigned long efi_call_virt_save_flags(void)
 {
 	unsigned long flags;
@@ -161,18 +180,7 @@ unsigned long efi_call_virt_save_flags(void)
 
 void efi_call_virt_check_flags(unsigned long flags, const void *caller)
 {
-	unsigned long cur_flags, mismatch;
-
-	cur_flags = efi_call_virt_save_flags();
-
-	mismatch = flags ^ cur_flags;
-	if (!WARN_ON_ONCE(mismatch & ARCH_EFI_IRQ_FLAGS_MASK))
-		return;
-
-	add_taint(TAINT_FIRMWARE_WORKAROUND, LOCKDEP_NOW_UNRELIABLE);
-	pr_err_ratelimited(FW_BUG "IRQ flags corrupted (0x%08lx=>0x%08lx) by EFI call from %pS\n",
-			   flags, cur_flags, caller ?: __builtin_return_address(0));
-	arch_efi_restore_flags(flags);
+	arch_efi_check_flags(flags, caller);
 }
 
 /*
-- 
2.34.1


