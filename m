Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB5EE606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 15:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=brcLGD5V;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=A7gq8Wxq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=EW6O7IX+lZj9zLE/PiayELXWaVWN1Nbov8vCucdwVl4=; b=brcLGD5VNcY9+d
	R8fUeQc1VnnKpCzVkPr/i7c+qUgCCWAtzHJHCMqz9fvAEH7Q6om7IpQoWzaMNf+Hhx/VhYtUsj4P9
	qL+iSZeSvyn2OR89rtArXw5BIA7RtDxjhKHX7YhDkaiqEtlUGvgwGKJDXe96yoXxZH6fR16WwQVt5
	+hrTuQnarekjZMLNDCmmSK0xcd1z5JVESKV5Me+ixZVFdOABYYe9WPu1HI7U+69gbOGK1ZoiwYWyZ
	8F3yGCw0xPT3UXG3t9XS4YN3+JXAi10Jbikp8mut5tkc+WDpaK2msiefakHO/C95aoL2DEEq8JCcg
	LjFqtP4tMPPxRe+SN51Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxcg-0000000GiIy-3FzS;
	Fri, 27 Nov 2026 15:12:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxcR-0000000GiBU-3Cng
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 15:12:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9DAD81758;
	Fri, 27 Nov 2026 07:12:06 -0800 (PST)
Received: from e144440.cambridge.arm.com (e144440.arm.com [10.2.199.104])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1FAEA3F632;
	Fri, 27 Nov 2026 07:12:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795792329; bh=CqJyYJhYvd31ezVbNyoKavdQzrZfJ6U+MBqZ2Ikozgo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=A7gq8WxqiRTqGer77NYMKxxKmoGbcn8544O0XLdXB/VqIc7TDuRTsbEJITz5jlm2k
	 +0uiif8pbKmzVp9aQ5pg2uaif/CGy84d7zaQUSsZKvloa3UbLZPxnAIdLci3c5HuKd
	 GfQ0ZKOp16414Hw7fN4gmWo55Y+lMZWLEbHw9QLQ=
From: Ryan Roberts <ryan.roberts@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Linu Cherian <linu.cherian@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] arm64: cputype: Add Cortex-A320 definitions
Date: Fri, 27 Nov 2026 15:11:54 +0000
Message-ID: <20261127151157.406111-2-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261127151157.406111-1-ryan.roberts@arm.com>
References: <20261127151157.406111-1-ryan.roberts@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_071211_844486_C935E62A 
X-CRM114-Status: UNSURE (   8.95  )
X-CRM114-Notice: Please train this message.
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

Add the Cortex-A320 part number and MIDR definition. The MIDR_EL1
description in the Cortex-A320 Technical Reference Manual specifies
implementer 0x41 and part number 0xd8f.

These definitions will be used to identify Cortex-A320 in the BBML3
allow list.

Link: https://support.arm.com/documentation/109551/0002?lang=en&rev=0002-04
Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
---
 arch/arm64/include/asm/cputype.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/include/asm/cputype.h b/arch/arm64/include/asm/cputype.h
index 6002d1d5f55f..abff1ba1c305 100644
--- a/arch/arm64/include/asm/cputype.h
+++ b/arch/arm64/include/asm/cputype.h
@@ -103,6 +103,7 @@
 #define ARM_CPU_PART_C1_NANO		0xD8A
 #define ARM_CPU_PART_C1_PRO		0xD8B
 #define ARM_CPU_PART_C1_PREMIUM		0xD90
+#define ARM_CPU_PART_CORTEX_A320	0xD8F
 
 #define APM_CPU_PART_XGENE		0x000
 #define APM_CPU_VAR_POTENZA		0x00
@@ -200,6 +201,7 @@
 #define MIDR_C1_NANO MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_C1_NANO)
 #define MIDR_C1_PRO MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_C1_PRO)
 #define MIDR_C1_PREMIUM MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_C1_PREMIUM)
+#define MIDR_CORTEX_A320 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_A320)
 #define MIDR_THUNDERX	MIDR_CPU_MODEL(ARM_CPU_IMP_CAVIUM, CAVIUM_CPU_PART_THUNDERX)
 #define MIDR_THUNDERX_81XX MIDR_CPU_MODEL(ARM_CPU_IMP_CAVIUM, CAVIUM_CPU_PART_THUNDERX_81XX)
 #define MIDR_THUNDERX_83XX MIDR_CPU_MODEL(ARM_CPU_IMP_CAVIUM, CAVIUM_CPU_PART_THUNDERX_83XX)
-- 
2.43.0


