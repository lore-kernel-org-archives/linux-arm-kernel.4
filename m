Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41441606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 07:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=j7VwwLvM;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Rnd1BRq9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=mRhs8+NkIpWLpYOBzCKycgFylDjzXxuUt8PjUFydA1k=; b=j7VwwLvMi7XibK
	LHOb14bDhRop66i2Q0KweSJeK2CYKuF46wKFGHri2wfPU9WL3VB/1p/TaM2oXA2/fp1buXlqmj9qR
	8lUXE8JqfENKKjhadDlqCv+6SLKnnW52f7VlY10bRRpevotA+ijpvvAL5Fj7oY4mnLmyc80qkMaQA
	ApnGqJD3MfPpLRfZTJZEaI/L7hyI+qaJRKMEHTB44F0t+TB0j7LMj0egjpDLNhQQIU52zXNkOFDcS
	dnVXFkpl+8ltBIVOtoLQcFEH3gkJYz9yyIY6Bw/5NjnkM/vFYQUwmZHePDWXrKXDqhD729+C9EWAw
	EtCNX4pBO/1ibTn/7bOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWqeN-0000000FAZ0-0ivN;
	Fri, 27 Nov 2026 07:45:43 +0000
Received: from out-192.mta0.migadu.com ([2001:41d0:1004:224b::c0] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWqdf-0000000FA8b-14Vb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 07:45:00 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=zMl0M0QUmSAz5mu18JLZEbsKm6FWjal0JM5qpuC24jA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795765497; v=1; x=1796370297;
 b=Rnd1BRq91mfj5TWs00P8cD3c41mifRXjRQHxD377OghRsTogr8THsSAJmf6Xq1U++sH4/gOV
 OxpClbM20st/lNWh5Hl3syyGItByRO59MWE24uafUJXLka1KbprxYgIO+hhAgYhg/iS+Hlxigm2
 aQnE7tPFYSOM910NurCKAWGU=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id ad0523395ea71a30;
	Fri, 27 Nov 2026 07:44:57 +0000
X-Mizu-Trace-ID: ad0523395ea71a30
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
Subject: [PATCH v2 05/10] arm64: sysreg: Reject a Fields or Mapping line with an undefined target
Date: Fri, 27 Nov 2026 07:44:21 +0000
Message-ID: <20261127074426.50739-6-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127074426.50739-1-fuad.tabba@linux.dev>
References: <20261127074426.50739-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_234459_437800_3FB9D4CA 
X-CRM114-Status: GOOD (  11.35  )
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

A Sysreg block can use another block's layout. "Fields X" names a
SysregFields block and "Mapping X" another Sysreg. The generator emits
the register's RESx and UNKN masks as X_RES0, X_RES1 and X_UNKN, but it
doesn't check that X exists. A misspelt or missing X gives macros that
expand to undefined names, and the build fails only once something uses
them. MPAM1_EL12 had such a line.

Check every Fields and Mapping target once the whole file is read, since
a target may be defined after the register that names it (MPAM1_EL1
follows MPAM1_EL12). Either kind of block defines the masks, so the
check accepts either kind as the target of a Fields or a Mapping line.
Give fatal() an optional line number, so that the error is reported at
the Fields or Mapping line.

Reviewed-by: Steffen Eiden <seiden@linux.ibm.com>
Reviewed-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/tools/gen-sysreg.awk | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/tools/gen-sysreg.awk b/arch/arm64/tools/gen-sysreg.awk
index c4fa27cd9beff..1843d283192d2 100755
--- a/arch/arm64/tools/gen-sysreg.awk
+++ b/arch/arm64/tools/gen-sysreg.awk
@@ -9,8 +9,8 @@ function block_current() {
 }
 
 # Log an error and terminate
-function fatal(msg) {
-	print "Error at " NR ": " msg > "/dev/stderr"
+function fatal(msg, line) {
+	print "Error at " (line ? line : NR) ": " msg > "/dev/stderr"
 
 	printf "Current block nesting:"
 
@@ -124,6 +124,11 @@ END {
 	if (__current_block_depth != 0)
 		fatal("Missing terminator for " block_current() " block")
 
+	# A Fields or Mapping target may be defined after its user.
+	for (line in refs)
+		if (!(refs[line] in defined_regs))
+			fatal("Undefined Fields or Mapping target " refs[line], line)
+
 	print "#endif /* __ASM_SYSREG_DEFS_H */"
 }
 
@@ -241,6 +246,8 @@ $1 == "EndSysreg" && block_current() == "Sysreg" {
 	print "/* For " reg " fields see " $2 " */"
 	print ""
 
+	refs[NR] = $2
+
 	next_bit = -1
 	res0 = $2 "_RES0"
 	res1 = $2 "_RES1"
-- 
2.47.3


