Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08845606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 07:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gZKuI2ax;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=UdViQ2OB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=T7Gl0BHsaIw0ZQTFVbcTmIDA3k5DivfNbi4SDKTIWxk=; b=gZKuI2axg6dJly
	Ixpoxa9e9V+qGLY9n5wCewsjfWRFJN6V95TJZg+cidku7gmdyJzycnsxvxePJdaF4P7IyIpdjBZGd
	e2reJUXMN38yLT9h69Afg0iKdoOcfR0TCx1I/ObJgoQiRmqhlYb2L8eWLiwJlfCF+dYFWbSNbwc9a
	1BEU08hDJL43tO//8Oi5q/a/aS6NlmFjH7noyrofkmR4hrNFrEZRv1T1kxXn3tnbs+GiKLp5GxKsF
	c3aGLNugsf0JNqjrg4f5NEA3I8hBRTgYp8GHHma70QctK+t+LT5tggZFncgM1m5pPRN4NhqMfqr/o
	tpJZcxiYBV3ZjX30GViw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVOrA-00000002UsZ-2Ege;
	Mon, 23 Nov 2026 07:52:56 +0000
Received: from out-151.mta1.migadu.com ([2001:41d0:203:375::97] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVOql-00000002Ufg-25R3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 07:52:33 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=M2gAmx56TmZSrMtnBNalKAcRoPlTSuspteY76LphWew=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795420349; v=1; x=1796025149;
 b=UdViQ2OBQQruruXbO/CGixvrdHyBL6nujWxwdi/hHaSlaz1Awhwr3R1ShOvCTWf4b/4BpFZm
 7zeY5GDQeqFParMOI6sJENdnlVDtPb5tRPXlZmtvr7Z51tBeZMuOemwzeZBiknv1kwSebwc3CI9
 Kn/zwRp0O/dQfbxm+JhvFDIg=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 292ad1cbb883b4d7;
	Mon, 23 Nov 2026 07:52:29 +0000
X-Mizu-Trace-ID: 292ad1cbb883b4d7
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
Subject: [PATCH 3/9] arm64: sysreg: Reject a Sysreg and a SysregFields with the same name
Date: Mon, 23 Nov 2026 07:52:13 +0000
Message-ID: <20261123075219.369042-4-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123075219.369042-1-fuad.tabba@linux.dev>
References: <20261123075219.369042-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_235231_682208_C7345E75 
X-CRM114-Status: GOOD (  11.17  )
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


