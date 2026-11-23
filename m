Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFE19606A6B2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 09:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bX7AAuF6;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=bY/x1nM6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=qIJrEsV8q5q46A4SsJPRQvMZx8idsb7sIBvke3Yk/1c=; b=bX7AAuF6CWlKGD
	xtY6WUzkKSm9G/U2V4Ksi1MElTYwBPaz1wkl1BR1YkkoI9wDZqZ0aAVgbPggouWms7qgMaVliae8W
	3fAlMplKL109HqoFu6ZkCTLAdulQOvw/WRYmf/C23mJpMaE57ml+i8mmn2TtAwz22vjRoD0vxrBXj
	TRwXMxTPywcxzGCY5wVDFV/Yc5upA67l8JlxpJjY8n0Uzy2EHGZ3/SHiACxrxD9T6aP7T1Jvi9s8V
	tzkzTiNYHUrq8E/E4h0oC/tfPGaPxzQH2gNCaQx0AXmkg4JRXxWFlii48na5RJj4OIbnpXzbn846G
	IfULSQ/Ntxf9Yfn6F+dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVOtC-00000002VHX-31k0;
	Mon, 23 Nov 2026 07:55:02 +0000
Received: from out-124.mta0.migadu.com ([2001:41d0:1004:224b::7c] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVOrA-00000002UrK-1se0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 07:52:57 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=Tw6dB4B92oC7xpmbobifcQLnjJ3eaMJDfve4ZFo9YAw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795420374; v=1; x=1796025174;
 b=bY/x1nM64e3fEjvdFSh7LZ93NgGsJMGuQDn0JXXUvCFtmlrls7Yi2p4bR7ZG6Bn3+GeD/l0A
 bCpo8QDrAfTR1dapAgJueQdao4sr+XqL7j1UyHduDSlzq+QL1n97DV0mbPVQ47R6NYiBVQWyVK7
 xBPbqnRsIoH+2KtHC0oqqjqI=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id bbb240c3c967fa07;
	Mon, 23 Nov 2026 07:52:54 +0000
X-Mizu-Trace-ID: bbb240c3c967fa07
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
Subject: [PATCH 8/9] arm64: sysreg: Reject an out-of-range register encoding
Date: Mon, 23 Nov 2026 07:52:18 +0000
Message-ID: <20261123075219.369042-9-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123075219.369042-1-fuad.tabba@linux.dev>
References: <20261123075219.369042-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_235256_643111_DC926127 
X-CRM114-Status: UNSURE (   9.90  )
X-CRM114-Notice: Please train this message.
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

The generator copies a register's op0, op1, CRn, CRm and op2 into
SYS_<reg> without checking them. sys_reg() shifts each into place
without masking it, so a value too wide for its field spills into the
next one. SYS_<reg> then names a different register's encoding, and the
build doesn't report it.

Require each of the five to be a decimal number that fits its field (two
bits for op0, three for op1 and op2, four for CRn and CRm). Reject a
leading zero too, since C reads such a value as octal.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/tools/gen-sysreg.awk | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/tools/gen-sysreg.awk b/arch/arm64/tools/gen-sysreg.awk
index 0bd6aab8aae0f..057dc98082b5e 100755
--- a/arch/arm64/tools/gen-sysreg.awk
+++ b/arch/arm64/tools/gen-sysreg.awk
@@ -43,6 +43,12 @@ function expect_fields(nf) {
 		fatal(NF " fields found where " nf " expected")
 }
 
+# Check that one field of a register's encoding is a number in [0, max]
+function check_encoding(reg, name, val, max) {
+	if (val !~ /^(0|[1-9][0-9]*)$/ || val > max)
+		fatal(reg " has invalid " name " " val)
+}
+
 # Print a CPP macro definition, padded with spaces so that the macro bodies
 # line up in a column
 function define(prefix, name, val) {
@@ -198,6 +204,12 @@ $1 == "Sysreg" && block_current() == "Root" {
 		fatal("Duplicate definition for " reg)
 	defined_regs[reg] = 1
 
+	check_encoding(reg, "op0", op0, 3)
+	check_encoding(reg, "op1", op1, 7)
+	check_encoding(reg, "CRn", crn, 15)
+	check_encoding(reg, "CRm", crm, 15)
+	check_encoding(reg, "op2", op2, 7)
+
 	define_reg("REG_" reg, "S" op0 "_" op1 "_C" crn "_C" crm "_" op2)
 	define_reg("SYS_" reg, "sys_reg(" op0 ", " op1 ", " crn ", " crm ", " op2 ")")
 
-- 
2.47.3


