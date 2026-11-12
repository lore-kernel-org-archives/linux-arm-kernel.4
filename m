Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD58E606A323
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 13:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VpP/BK9J;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Mpp1OMi/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=e0N5e+4TzGm3TiKZLmGdAnkF+W+LyfZP4LJQrrPE5J4=; b=VpP/BK9J1pwMdAZhY4VTOgs7UM
	sNNvOGxQRrOAsJ4khZA2S7B9Wpb0WpxN295CvW+G6psrPGZx/F3E+NTT0MFRhaVIkUbnEqmM43JKd
	Jb8QhvH/4KlC4FPPjGOQSm55Kp3PNYrPo15y6KEhb44YbTvbZXvXh3zuF2L0csh24rVl8vvq6W5X9
	8SZw6ExJGZjBajaJyUyNQhrMwGG6Eegq7uVAB/V4j9oEBICHQbPw5H9LW/w1supg2RvvTlP3lxP2e
	0iS3iU6G5bVOWPtBxaKB7Ull+GEXomPqdaXK8NttqP3tLQWit7HpGkEPBkGF4f823GX/Js50hDAvA
	1Y5BY4cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRUlT-0000000A1R1-1P91;
	Thu, 12 Nov 2026 13:22:55 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRUke-0000000A0j4-0EIN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 13:22:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 27F401477;
	Thu, 12 Nov 2026 05:22:00 -0800 (PST)
Received: from login2.euhpc2.arm.com (login2.euhpc2.arm.com [10.58.100.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 66E423F632;
	Thu, 12 Nov 2026 05:22:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794489723; bh=70tsAPMkqW1vkKq5VgkmhXRBIU974CVsIhAkRCl1O7s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Mpp1OMi/c80wwAND0EtcfnO/BXhk1LU/BbRPDQUYfGycbFxQHahj58BXFdkhYdY15
	 U21PRXxzxoqE9Fd+fZ+gDpUmdMQhHGQE7dzFNDkAZb4wNSy9dPLkSnLh5kwshz/Rpv
	 v+5Xro0ch1zXFQVIT5t/HVluNdx8HTwhc2QMLnMc=
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 12/39] arm64: gicv3: remove GIC_PRIO_PSR_I_SET
Date: Thu, 12 Nov 2026 13:20:15 +0000
Message-Id: <20261112132042.129062-13-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20261112132042.129062-1-vladimir.murzin@arm.com>
References: <20261112132042.129062-1-vladimir.murzin@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_052204_284352_B369D713 
X-CRM114-Status: GOOD (  12.02  )
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
Cc: mark.rutland@arm.com, catalin.marinas@arm.com, lpieralisi@kernel.org, liaochang1@huawei.com, ashok.raj@oss.qualcomm.com, maz@kernel.org, will@kernel.org, ruanjinjie@huawei.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ada Couprie Diaz <ada.coupriediaz@arm.com>

`GIC_PRIO_PSR_I_SET` was used to keep track of sections of the kernel
where interrupts always need to reach the CPU and could not be masked
via interrupt priorities, or DAIF bypassed the status of the PMR.

This flag unmasked IRQs when OR'd to GIC_PRIO_IRQON and ensured that
that IRQs were seen as disabled by the `local_irqs_...` functions,
as they would only check the PMR if pseudo-NMIs were enabled.

This is not needed anymore as our IRQ masking APIs now know how to handle
interrupt priorities properly and in parallel with DAIF : remove it.

Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
Tested-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/include/asm/ptrace.h         | 2 --
 include/linux/irqchip/arm-gic-v3-prio.h | 8 --------
 2 files changed, 10 deletions(-)

diff --git a/arch/arm64/include/asm/ptrace.h b/arch/arm64/include/asm/ptrace.h
index 7d7b54308b90..a64eb588a781 100644
--- a/arch/arm64/include/asm/ptrace.h
+++ b/arch/arm64/include/asm/ptrace.h
@@ -24,8 +24,6 @@
 #define GIC_PRIO_IRQON		GICV3_PRIO_UNMASKED
 #define GIC_PRIO_IRQOFF		GICV3_PRIO_IRQ
 
-#define GIC_PRIO_PSR_I_SET	GICV3_PRIO_PSR_I_SET
-
 #if ARM64_S390_COMMON == 1
 
 /* Additional SPSR bits not exposed in the UABI */
diff --git a/include/linux/irqchip/arm-gic-v3-prio.h b/include/linux/irqchip/arm-gic-v3-prio.h
index 44157c9abb78..464bf1d29453 100644
--- a/include/linux/irqchip/arm-gic-v3-prio.h
+++ b/include/linux/irqchip/arm-gic-v3-prio.h
@@ -20,17 +20,11 @@
  * GICV3_PRIO_NMI is the PMR view of the priority of pseudo-NMIs. This can be
  * written to the PMR to mask pseudo-NMIs.
  *
- * On arm64 some code sections either automatically switch back to PSR.I or
- * explicitly require to not use priority masking. If bit GICV3_PRIO_PSR_I_SET
- * is included in the priority mask, it indicates that PSR.I should be set and
- * interrupt disabling temporarily does not rely on IRQ priorities.
  */
 #define GICV3_PRIO_UNMASKED	0xe0
 #define GICV3_PRIO_IRQ		0xc0
 #define GICV3_PRIO_NMI		0x80
 
-#define GICV3_PRIO_PSR_I_SET	(1 << 4)
-
 #ifndef __ASSEMBLER__
 
 #define __gicv3_prio_to_ns(p)	(0xff & ((p) << 1))
@@ -45,8 +39,6 @@ static_assert(__gicv3_prio_valid_ns(GICV3_PRIO_IRQ));
 static_assert(GICV3_PRIO_NMI < GICV3_PRIO_IRQ);
 static_assert(GICV3_PRIO_IRQ < GICV3_PRIO_UNMASKED);
 
-static_assert(GICV3_PRIO_IRQ < (GICV3_PRIO_IRQ | GICV3_PRIO_PSR_I_SET));
-
 #endif /* __ASSEMBLER */
 
 #endif /* __LINUX_IRQCHIP_ARM_GIC_V3_PRIO_H */
-- 
2.34.1


