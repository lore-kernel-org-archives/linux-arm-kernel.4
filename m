Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D10606A323
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 14:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fLFAWZfS;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=SWftCDPY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=iPw+rE2Uc0+f2QO/Bmk5DxjcUgLAgTCNG01JNYLDzSY=; b=fLFAWZfS+L1OEW
	iSPwy3NFbL9+zDrZ/g/rF3nNieEey0GLR0+MKJJKnn3afBIMoZoeJ1d9kvDfcRUnf0xBg7L+xoH8z
	4jEDl4JFL4lJfpYOSOE/dKRPQZe6PLZjWMhf7rShB+qiR8cS2X1NfBTrjwzsdyQXo0eB6iuNjAuWy
	gOdQr63gLluVzPPmLC2gSNme34/KJbynnMAUxv+wErGikagIwpHthTOpa6M8Z0E1UU9MpX4S1z0Wy
	udvD6eoBa3sKwLuTxAi0esCaczQRh2OWD/BE1Iqv6gL7W6Cwf/RxCEoZ5bKPLVKCNHpjCge1PKKyx
	9MJGZqTxtQrK8jlNreGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRsc7-0000000DEBn-2XsF;
	Fri, 13 Nov 2026 14:50:51 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRsc1-0000000DE7f-1ilI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 14:50:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 556841576;
	Fri, 13 Nov 2026 06:50:41 -0800 (PST)
Received: from e144440.cambridge.arm.com (e144440.arm.com [10.2.199.104])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 30D5F3F673;
	Fri, 13 Nov 2026 06:50:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794581444; bh=g4tVmyvNqyscAXWxIbsOz98wvJc4+4piUxxDN1ozCdM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SWftCDPY7fWN4qJFZ1qCq5a0Tg7HpjOrO0Fo+ME8O7OArsbQaXmNw4aQ0FrvFDVAJ
	 LVHxoWWqPBE2yMTe9GBffiejJCN1U5DG0+i+OVmppIoDgqu3uKmW7wwolwEDRmri/3
	 bWjBEgAuCKhZDOqlbgaqHXjCSFk0xqfQd6tMX0h4=
From: Ryan Roberts <ryan.roberts@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Linu Cherian <linu.cherian@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 4/6] arm64: cputype: Add C2-Ultra definitions
Date: Fri, 13 Nov 2026 14:50:18 +0000
Message-ID: <20261113145022.2592454-5-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261113145022.2592454-1-ryan.roberts@arm.com>
References: <20261113145022.2592454-1-ryan.roberts@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_065045_488651_735269A2 
X-CRM114-Status: UNSURE (   8.66  )
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

Add the C2-Ultra part number and MIDR definition. The MIDR_EL1
description in the C2-Ultra Technical Reference Manual specifies
implementer 0x41 and part number 0xd96.

These definitions will be used to identify C2-Ultra in the BBML3 allow
list.

Link: https://support.arm.com/documentation/109736/0001?lang=en&rev=0001-05
Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
---
 arch/arm64/include/asm/cputype.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/include/asm/cputype.h b/arch/arm64/include/asm/cputype.h
index abff1ba1c305..55493e01009e 100644
--- a/arch/arm64/include/asm/cputype.h
+++ b/arch/arm64/include/asm/cputype.h
@@ -104,6 +104,7 @@
 #define ARM_CPU_PART_C1_PRO		0xD8B
 #define ARM_CPU_PART_C1_PREMIUM		0xD90
 #define ARM_CPU_PART_CORTEX_A320	0xD8F
+#define ARM_CPU_PART_C2_ULTRA		0xD96
 
 #define APM_CPU_PART_XGENE		0x000
 #define APM_CPU_VAR_POTENZA		0x00
@@ -202,6 +203,7 @@
 #define MIDR_C1_PRO MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_C1_PRO)
 #define MIDR_C1_PREMIUM MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_C1_PREMIUM)
 #define MIDR_CORTEX_A320 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_A320)
+#define MIDR_C2_ULTRA MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_C2_ULTRA)
 #define MIDR_THUNDERX	MIDR_CPU_MODEL(ARM_CPU_IMP_CAVIUM, CAVIUM_CPU_PART_THUNDERX)
 #define MIDR_THUNDERX_81XX MIDR_CPU_MODEL(ARM_CPU_IMP_CAVIUM, CAVIUM_CPU_PART_THUNDERX_81XX)
 #define MIDR_THUNDERX_83XX MIDR_CPU_MODEL(ARM_CPU_IMP_CAVIUM, CAVIUM_CPU_PART_THUNDERX_83XX)
-- 
2.43.0


