Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26E8D606A323
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 07:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cfZqhmLJ;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Hvhj66vo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Edaz0a8Pn7RwmCSYLpiyB9Hw6aP0EcYCTitOem48uaY=; b=cfZqhmLJR3gkoX
	xTSZYhj6kHHRqCCmKvD3kyWrDa02uDYTyLIgifuDyb6+dN0RH2xM6vPhdq9zdQ5gDglp28sEvxGqX
	iE/ec2LweiFBpClVzheIES54jov9qRoyzf3xil6Gd6u5xsogGTEWSNfRkWG5A3pnMrf3R3ok38/uj
	pMhOkLF5UvBck4uS0pOZaGZX0cfMTnMV49BTAiz18Rrnhd7aa0QsD//FVpZPuv9rTISLKtzkKr6p4
	Wd+d1E43mTmtGN4DeDOLtvMrwmliWTaKxhzdsa+WRKj9sm0atxCiVfOjxfTvot4P6krPwJ2VvFUAH
	Yy8OItSFfha4s1bjkEPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWqeN-0000000FAZn-23M6;
	Fri, 27 Nov 2026 07:45:43 +0000
Received: from out-200.mta0.migadu.com ([2001:41d0:1004:224b::c8] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWqdj-0000000FAAN-0SYm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 07:45:04 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=QauHdFkdMY5QnZ6hX3/Ka5uYXIegeVDxxJXsQ1MBmSU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795765501; v=1; x=1796370301;
 b=Hvhj66voT1cHMAKbs4RsyS9ML7mtXBRyiN7Ndm3qKUGrgtP7t9tVbdjZbc3qjPhrCsiYLUQh
 V7e4SNLJbNUmYeEMCsfq4ufuThk43Ibwzeb8/5/EiWh4qo/dc7HsddLbHp1m6PfrdUkEFkl7mmG
 FIQ1F8yu8xAyqOKV0Dn0atKc=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id bc1b4c27aa684e86;
	Fri, 27 Nov 2026 07:45:00 +0000
X-Mizu-Trace-ID: bc1b4c27aa684e86
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
Subject: [PATCH v2 08/10] arm64: sysreg: Reject a macro name defined twice
Date: Fri, 27 Nov 2026 07:44:24 +0000
Message-ID: <20261127074426.50739-9-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127074426.50739-1-fuad.tabba@linux.dev>
References: <20261127074426.50739-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_234503_318159_11928734 
X-CRM114-Status: GOOD (  10.39  )
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

The generator rejects a duplicate register, SysregFields block, prefix
or enum value, but not two definitions of the same macro. Two fields
called F in REG make it emit REG_F twice with different masks, which the
compiler reports only as a redefinition warning against the generated
header, in every file that includes it. Two values of one enum sharing a
name do the same, and so do names that collide only once the generator
joins them: a field A_B beside value B of field A, a field F_MASK beside
F, or a field B_C in FOO beside a field C in FOO_B.

Record every macro name the generator defines, and fail on the second
definition. This covers a duplicate block or prefix too, but their own
checks stay, since they report the duplicate at the block's own line, by
block name.

Reviewed-by: Steffen Eiden <seiden@linux.ibm.com>
Reviewed-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/tools/gen-sysreg.awk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/tools/gen-sysreg.awk b/arch/arm64/tools/gen-sysreg.awk
index cde526896ed96..0bd6aab8aae0f 100755
--- a/arch/arm64/tools/gen-sysreg.awk
+++ b/arch/arm64/tools/gen-sysreg.awk
@@ -46,6 +46,10 @@ function expect_fields(nf) {
 # Print a CPP macro definition, padded with spaces so that the macro bodies
 # line up in a column
 function define(prefix, name, val) {
+	if ((prefix name) in defined_macros)
+		fatal("Duplicate macro " prefix name)
+	defined_macros[prefix name] = 1
+
 	printf "%-56s%s\n", "#define " prefix name, val
 }
 
-- 
2.47.3


