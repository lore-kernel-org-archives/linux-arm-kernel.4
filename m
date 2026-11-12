Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7FE8606A327
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 13:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=c7wv7Iji;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=tdrhm8qf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=3sUAWr2q9CKipixLE2UoY3b/UInfx3Z5oxsu5CofM7Y=; b=c7wv7IjiBLVqef
	DEGH8OSIcvHsPvc4FYTVBKfI+d/lGRX/yciEEGt3a0+7j1KofPN8aoNGb/CHCV6JbXlaHB4FojxlR
	suTHtEWOy6H+MiGj8QUv3Jqj1XaZfsK/vq0oT5UEbhrcSIJaPqOuRUQIWJkkn+UkGFN1Ygp5Y4017
	nuVQfrvNZhLL5Y83xYT0DhIu+kzgp3/WEq1AZ0jqS5iZM+ZSg70thWCLYO/R4Tbxb3egyOw8bhyK9
	T7QM/6St7SucnlFqOjsSjjXFegMVqWFMnR0/dDNpYwFu3LyYJycUbdFSmLRZuSGZD0C5ZR04Tu090
	T3fxu1iA/q+1dD8guOMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRUlO-0000000A1Kb-058b;
	Thu, 12 Nov 2026 13:22:50 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRUkh-0000000A0ma-2ROm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 13:22:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 13D581576;
	Thu, 12 Nov 2026 05:22:04 -0800 (PST)
Received: from login2.euhpc2.arm.com (login2.euhpc2.arm.com [10.58.100.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 860AF3F632;
	Thu, 12 Nov 2026 05:22:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794489727; bh=v+c5iq1Ag+d2lBeWb+REWCv91ZTKWmHu6m4fkjYZ9xQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tdrhm8qfTBCZCxg4pYAtBT3ht0KZW8BLy+olrDQsPEM/p8c3bQhFIZ9Y/n+idegIv
	 oUepgk0KrDrrMABbhFFzkYbAY76XmTlQchNY2C3pVfJj+LkbXjQZRa4eyIFtCfHuUG
	 ztFQIy838JwZ+tkSSAYMd+8GhfA0JeOsKYZMI4Io=
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
Subject: [PATCH v2 14/39] arm64: irqflags: Switch to CONFIG_DEBUG_IRQFLAGS
Date: Thu, 12 Nov 2026 13:20:17 +0000
Message-Id: <20261112132042.129062-15-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20261112132042.129062-1-vladimir.murzin@arm.com>
References: <20261112132042.129062-1-vladimir.murzin@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_052207_688316_919E00ED 
X-CRM114-Status: GOOD (  10.49  )
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

All exception state debug logic now lives under the generic
CONFIG_DEBUG_IRQFLAGS. Move the two remaining cases from the dedicated
config option to CONFIG_DEBUG_IRQFLAGS as well, keeping all related
debug logic under a single configuration option.

Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
Tested-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/include/asm/irqflags.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/irqflags.h b/arch/arm64/include/asm/irqflags.h
index 9f5c774cbe68..eedbdf7358e6 100644
--- a/arch/arm64/include/asm/irqflags.h
+++ b/arch/arm64/include/asm/irqflags.h
@@ -49,7 +49,7 @@ static __always_inline void __daif_local_irq_enable(void)
 
 static __always_inline void __pmr_local_irq_enable(void)
 {
-	if (IS_ENABLED(CONFIG_ARM64_DEBUG_PRIORITY_MASKING)) {
+	if (IS_ENABLED(CONFIG_DEBUG_IRQFLAGS)) {
 		u32 pmr = read_sysreg_s(SYS_ICC_PMR_EL1);
 		WARN_ON_ONCE(pmr != GIC_PRIO_IRQON && pmr != GIC_PRIO_IRQOFF);
 	}
@@ -78,7 +78,7 @@ static __always_inline void __daif_local_irq_disable(void)
 
 static __always_inline void __pmr_local_irq_disable(void)
 {
-	if (IS_ENABLED(CONFIG_ARM64_DEBUG_PRIORITY_MASKING)) {
+	if (IS_ENABLED(CONFIG_DEBUG_IRQFLAGS)) {
 		u32 pmr = read_sysreg_s(SYS_ICC_PMR_EL1);
 		WARN_ON_ONCE(pmr != GIC_PRIO_IRQON && pmr != GIC_PRIO_IRQOFF);
 	}
-- 
2.34.1


