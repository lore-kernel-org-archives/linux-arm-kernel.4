Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1FA0606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 13:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3uxkAusR;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=EKjgLGlv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=1WvgEoViALpfLI7OJM/d+JkW5eFepSDcmFxNu/FXUP4=; b=3uxkAusRKSv+SVf8u6CbdlSjWC
	z+xilTUF9V952Fk4otj435uRZPYH1Z2WDliL/dhHiU4tYqO2z9DhklbS0+UcHGO+FGddJl6QBNdOx
	uRYxwX0CgOKiudj/sePEQbV6+ur8DYdGodRKq56wxEPu5RWVA2VWhqBhMDYs5EetXCOH8bmNzbC49
	R/jLGRsvDap1TMJy+yXvNlqO6cRnSrVR0k4yRZ6eVpcSc7k2YsYQxFeAGAAptGYo3nYRng9vfGLe/
	2HdOaw8jEn6ZVun75A1EYhq3w7u2MOfmEvIeNA/Z8xVrW850mHZfc/htlJveAerVuhm9/OrSq/lWc
	sA15B7SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRUlg-0000000A1dM-1FRM;
	Thu, 12 Nov 2026 13:23:08 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRUkv-0000000A10U-3eWv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 13:22:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 26302165C;
	Thu, 12 Nov 2026 05:22:18 -0800 (PST)
Received: from login2.euhpc2.arm.com (login2.euhpc2.arm.com [10.58.100.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5013B3F632;
	Thu, 12 Nov 2026 05:22:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794489741; bh=TIgcKQyr96RhuCIrJXK3tBYkBWE48ayxp0JVfQj9xEI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EKjgLGlvT1iAstsCOdxa9YzP8UJerpNF2T/hpQf933vCKtUkmW99sp/PcbOb7Do1z
	 IyqHiaCzD042coQogJowCBPUJZfVHs/zVfz+/bUd5WHfN/I/msgHGVKBxigsY7H2Ej
	 7cTFcZKuatYv5RmkCsyBOCI1IuE++9WZ2wCJnVEU=
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 21/39] arm64: ptrace: Add PSR_ALLINT_BIT
Date: Thu, 12 Nov 2026 13:20:24 +0000
Message-Id: <20261112132042.129062-22-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20261112132042.129062-1-vladimir.murzin@arm.com>
References: <20261112132042.129062-1-vladimir.murzin@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_052222_453666_0BFBA513 
X-CRM114-Status: GOOD (  10.06  )
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

When FEAT_NMI is implemented, ALLINT is part of PSTATE and will be saved
to SPSR on exception entry.
As it can mask interrupts, depending on configuration, we will need to
check its value in interruted tasks, so add the corresponding bit
to ptrace.h.

Given its impact on interrupt and NMI masking, use it to update
`print_pstate()` so that it displays ALLINT state.
Display it after DAIF so that interrupt masking fields are together.

Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
Tested-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/include/uapi/asm/ptrace.h | 1 +
 arch/arm64/kernel/process.c          | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/uapi/asm/ptrace.h b/arch/arm64/include/uapi/asm/ptrace.h
index 0c8c6a126c3b..f43023d561c7 100644
--- a/arch/arm64/include/uapi/asm/ptrace.h
+++ b/arch/arm64/include/uapi/asm/ptrace.h
@@ -48,6 +48,7 @@
 #define PSR_D_BIT	0x00000200
 #define PSR_BTYPE_MASK	0x00000c00
 #define PSR_SSBS_BIT	0x00001000
+#define PSR_ALLINT_BIT	0x00002000
 #define PSR_PAN_BIT	0x00400000
 #define PSR_UAO_BIT	0x00800000
 #define PSR_DIT_BIT	0x01000000
diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
index 1013343de671..860bfabea04a 100644
--- a/arch/arm64/kernel/process.c
+++ b/arch/arm64/kernel/process.c
@@ -183,7 +183,7 @@ static void print_pstate(struct pt_regs *regs)
 		const char *btype_str = btypes[(pstate & PSR_BTYPE_MASK) >>
 					       PSR_BTYPE_SHIFT];
 
-		printk("pstate: %08llx (%c%c%c%c %c%c%c%c %cPAN %cUAO %cTCO %cDIT %cSSBS BTYPE=%s)\n",
+		printk("pstate: %08llx (%c%c%c%c %c%c%c%c %cALLINT %cPAN %cUAO %cTCO %cDIT %cSSBS BTYPE=%s)\n",
 			pstate,
 			pstate & PSR_N_BIT ? 'N' : 'n',
 			pstate & PSR_Z_BIT ? 'Z' : 'z',
@@ -193,6 +193,7 @@ static void print_pstate(struct pt_regs *regs)
 			pstate & PSR_A_BIT ? 'A' : 'a',
 			pstate & PSR_I_BIT ? 'I' : 'i',
 			pstate & PSR_F_BIT ? 'F' : 'f',
+			pstate & PSR_ALLINT_BIT ? '+' : '-',
 			pstate & PSR_PAN_BIT ? '+' : '-',
 			pstate & PSR_UAO_BIT ? '+' : '-',
 			pstate & PSR_TCO_BIT ? '+' : '-',
-- 
2.34.1


