Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E62606A321
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 13:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=m/wVRjGv;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=MSEz9H39
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=3Y78R8ZNz+dtxYX7q0G2VtXUfGJz72OxM2IZsq499fk=; b=m/wVRjGvKwfH/O
	RMNZBxrq7oazJTjROX4lSxAvhx/DEXlBkYtdW1TsBoBd3Q43jfjNOIoemr06YeJxOIgyPOBNhQuvP
	lbREJi6wytYsXDBK6DFYf73wM4SCljYeF40YiP1Clcv0iCJqWmQcdfwre1SfkAho9hz+vqxpyPa5w
	BsIan4OpJQ5M116MO87ysF8WFfzRTwv9E696r2xJfR6agOVVdH3SEgVBpGCGwWgCz1OpIMFqxII5i
	QWlrBH+EEU9Gu3KVVZes+OQGf+smP/sOz9raOTSqQlrKqAv+QaPG05gklz6tL/w1jH5tlVk4FH2S5
	BDvd1KBqj4YwUeyjdG3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRUlf-0000000A1by-26rS;
	Thu, 12 Nov 2026 13:23:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRUkt-0000000A0vT-1HJj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 13:22:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E8868153B;
	Thu, 12 Nov 2026 05:22:15 -0800 (PST)
Received: from login2.euhpc2.arm.com (login2.euhpc2.arm.com [10.58.100.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5AE0B3F632;
	Thu, 12 Nov 2026 05:22:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794489738; bh=grPTOpBwcTjjJaTKJllD1HQydB7TrAOeD6L+8eZSPBk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MSEz9H39C9ARTBC4Y4crvw7mDxWhXhKGQj/TK8llA7PWE9GKACrH8/d1yp4+IrgY7
	 6l0qlGtfmN7u6u19nGNF+Z40eojVjGD/Q9IDTc1TcjInZc2CIvK5ilcPOs0E/oL2xS
	 Oahpm8GBKyyuxGaFsl/guVyyiYHsyc0nWcKdehoQ=
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
Subject: [PATCH v2 20/39] arm64: probes: Reject stepping over ALLINT
Date: Thu, 12 Nov 2026 13:20:23 +0000
Message-Id: <20261112132042.129062-21-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20261112132042.129062-1-vladimir.murzin@arm.com>
References: <20261112132042.129062-1-vladimir.murzin@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_052222_367025_4766644A 
X-CRM114-Status: GOOD (  12.32  )
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

ALLINT instructions are not safe for probing. Both the register and
immediate forms of MSR for ALLINT are currently rejected because they
match aarch64_insn_is_msr_{imm,reg}(). However, MRS instructions
accessing ALLINT need to be rejected explicitly.

Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
Tested-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/include/asm/insn.h          |  1 +
 arch/arm64/kernel/probes/decode-insn.c | 11 +++++++----
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/include/asm/insn.h b/arch/arm64/include/asm/insn.h
index 1ce75a442638..0a81b5feb2ed 100644
--- a/arch/arm64/include/asm/insn.h
+++ b/arch/arm64/include/asm/insn.h
@@ -118,6 +118,7 @@ enum aarch64_insn_special_register {
 	AARCH64_INSN_SPCLREG_SP_EL0	= 0xC208,
 	AARCH64_INSN_SPCLREG_SPSEL	= 0xC210,
 	AARCH64_INSN_SPCLREG_CURRENTEL	= 0xC212,
+	AARCH64_INSN_SPCLREG_ALLINT	= 0xC218,
 	AARCH64_INSN_SPCLREG_DAIF	= 0xDA11,
 	AARCH64_INSN_SPCLREG_NZCV	= 0xDA10,
 	AARCH64_INSN_SPCLREG_FPCR	= 0xDA20,
diff --git a/arch/arm64/kernel/probes/decode-insn.c b/arch/arm64/kernel/probes/decode-insn.c
index 4137cc5ef031..a98d9d30fb4a 100644
--- a/arch/arm64/kernel/probes/decode-insn.c
+++ b/arch/arm64/kernel/probes/decode-insn.c
@@ -36,11 +36,14 @@ static bool __kprobes aarch64_insn_is_steppable(u32 insn)
 		/*
 		 * The MRS instruction may not return a correct value when
 		 * executing in the single-stepping environment. We do make one
-		 * exception, for reading the DAIF bits.
+		 * exception, for reading the DAIF and ALLINT bits.
 		 */
-		if (aarch64_insn_is_mrs(insn))
-			return aarch64_insn_extract_system_reg(insn)
-			     != AARCH64_INSN_SPCLREG_DAIF;
+		if (aarch64_insn_is_mrs(insn)) {
+			u32 sysreg = aarch64_insn_extract_system_reg(insn);
+
+			return (sysreg != AARCH64_INSN_SPCLREG_DAIF) &&
+			       (sysreg != AARCH64_INSN_SPCLREG_ALLINT);
+		}
 
 		/*
 		 * The HINT instruction is steppable only if it is in whitelist
-- 
2.34.1


