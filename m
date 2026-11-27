Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18103606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 08:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=n50mghOa;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=uJr78QnG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=wD0+PxnMuLm+M4cynxJmtK3MHUa9fIPsTXYebXefS1Q=; b=n50mghOagQgJcK
	5BpCG+2PaFOUmFFKAjOOce1p00mhMX+CHZ0ktPHH1C1Sz8523Zu8djJMCleT4RwYJxP+uA5h2LS+A
	MIR1b4C4srcVGb5PaRTv9Qqz0JeYcCE/s/8UHFvxETSVI/Xs65I6SE6oAJcwddFE7GW3bBoJD2AWj
	+9ItyV02Ho022VXyb4op8Sfja+miuIO7p01iRDA5Xd8MwH5YciooHjmAl2B6Npd5KnVYhmlH5Jnu3
	LbTeS5GCnvwIziihxKp2cEGrNZdOGlCXoZOvVaS6Ykcy9aJYXd55gIx4/+Fg9V+jJC09t9A0dnYz+
	0w4LihVyvp87nTqbo+nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWqdh-0000000FAAu-2fhI;
	Fri, 27 Nov 2026 07:45:01 +0000
Received: from out-186.mta0.migadu.com ([2001:41d0:1004:224b::ba] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWqdO-0000000FA4R-1OK3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 07:44:43 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=pwxQp22NV+Zlu+S0Fd1cIALq98HnRL9je8Varj/Rr2w=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795765480; v=1; x=1796370280;
 b=uJr78QnGRFLJU/1dS8rGJXhm1Ge4o2o5F2l7mNrowTpkB6fUwA4UJ6IJSKnYg3EhwtcJlQop
 UFWLymw9KLXqHr1s2wP7WdHh8Zry8mY+UAm76smExl8hucniPyJlXchtRJHscbpH7QL37p4OjqD
 3oMHan9gHJqLsJ1wK68REnTA=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 2237a9663b6448c9;
	Fri, 27 Nov 2026 07:44:39 +0000
X-Mizu-Trace-ID: 2237a9663b6448c9
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Fuad Tabba <tabba@google.com>
Subject: [PATCH v2 03/10] arm64: sysreg: Reject a Sysreg and a SysregFields with the same name
Date: Fri, 27 Nov 2026 07:44:19 +0000
Message-ID: <20261127074426.50739-4-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127074426.50739-1-fuad.tabba@linux.dev>
References: <20261127074426.50739-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_234442_512777_1B881139 
X-CRM114-Status: GOOD (  10.80  )
X-Spam-Score: -2.1 (--)
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

The generator rejects two Sysreg blocks, or two SysregFields blocks,
with the same name, but tracks the two kinds separately. Both kinds name
their macros for the block, so a Sysreg FOO and a SysregFields FOO that
each have a field A both define FOO_A, as well as FOO_RES0 and the other
masks, and the compiler warns only where the definitions differ.

Track both kinds of name in defined_regs, so that a block is rejected
when either kind already has its name, and leave the kind out of the
error.

Suggested-by: Mark Rutland <mark.rutland@arm.com>
Reviewed-by: Steffen Eiden <seiden@linux.ibm.com>
Reviewed-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/tools/gen-sysreg.awk | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/tools/gen-sysreg.awk b/arch/arm64/tools/gen-sysreg.awk
index b299342463631..8ce4981273dd3 100755
--- a/arch/arm64/tools/gen-sysreg.awk
+++ b/arch/arm64/tools/gen-sysreg.awk
@@ -137,9 +137,9 @@ $1 == "SysregFields" && block_current() == "Root" {
 	res1 = "UL(0)"
 	unkn = "UL(0)"
 
-	if (reg in defined_fields)
-		fatal("Duplicate SysregFields definition for " reg)
-	defined_fields[reg] = 1
+	if (reg in defined_regs)
+		fatal("Duplicate definition for " reg)
+	defined_regs[reg] = 1
 
 	next_bit = 63
 
@@ -181,7 +181,7 @@ $1 == "Sysreg" && block_current() == "Root" {
 	unkn = "UL(0)"
 
 	if (reg in defined_regs)
-		fatal("Duplicate Sysreg definition for " reg)
+		fatal("Duplicate definition for " reg)
 	defined_regs[reg] = 1
 
 	define_reg("REG_" reg, "S" op0 "_" op1 "_C" crn "_C" crm "_" op2)
-- 
2.47.3


