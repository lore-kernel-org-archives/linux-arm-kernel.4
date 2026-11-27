Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB29606A335
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 09:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UHrh06Bt;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=AcLajVIL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=QK3iDQgYPVeMAaN6W5AdJFnxFZX7uO7hiMLiTGM3PCI=; b=UHrh06BtCmNT1t
	sOJdyzZtUQqLFienyBm4Ri1L81mUGzcRgrJCN3VtIPxn65pdUf/advw+kluTUj5qoCMbE0W1VwRL5
	PHM6PYCI57BoIJ5pcNw6FtkTDLYnivJTOFu5N1wlE3ShK27Qtk7AX1zXPnc20RFRoAd/I9KPAa8II
	cs68AesLibimAgVPjs14jsmqcN8GW75n7SDnCrOe3Wzu5139DmN/EZBz8xxyRd/lRkSqcCCi40FYU
	g7jZWACocGhw6xUq3OmdKryK2/9PfPOM20csvkZPNHBtxE8zcUvS4kTTyAbpLfR6YApBXot22e5iG
	Pgv9UYEXGDVaWrjuLznQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWqeN-0000000FAa0-2a9O;
	Fri, 27 Nov 2026 07:45:43 +0000
Received: from out-50.mta1.migadu.com ([2001:41d0:203:375::32] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWqdj-0000000FABt-0w9q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 07:45:04 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=jxiSiNbMWfOo9QUaR0n+zKrH/9ksb19ck5mP/+Gsoi0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795765501; v=1; x=1796370301;
 b=AcLajVILShRe07l8O+SF8QTOFIKnCzKXS+ex53darWyCsfno9HyQS13cvUhJlyGfKONzbMWc
 Iy0AkYeUv+6TlERpylVRQfoM22Y9IWAaHpLSl6m7iCbGgLJhxQkR1CxlhQB1hkEBFn4FzPcN5i0
 zXYRWX+hLvxNd5qv83aVjACo=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id fa540e720c5a858f;
	Fri, 27 Nov 2026 07:45:01 +0000
X-Mizu-Trace-ID: fa540e720c5a858f
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
Subject: [PATCH v2 09/10] arm64: sysreg: Reject an out-of-range register encoding
Date: Fri, 27 Nov 2026 07:44:25 +0000
Message-ID: <20261127074426.50739-10-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127074426.50739-1-fuad.tabba@linux.dev>
References: <20261127074426.50739-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_234503_421669_64CA3A18 
X-CRM114-Status: UNSURE (   9.50  )
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

Reviewed-by: Steffen Eiden <seiden@linux.ibm.com>
Reviewed-by: Mark Brown <broonie@kernel.org>
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


