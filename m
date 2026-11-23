Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C0C606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 07:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YsElwFNt;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=j55B32L/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=VUq1FwUBes476hqYf0N3+rNKTNIoG0zuocLy5Eg3cmU=; b=YsElwFNtNMlofd
	m33/sPPeRW7pOUYP58SpJ6hp1BBLlMma1FnzNP/A4oIl9dOwP82Uihf8Oub/Y6bWnijozp6g32s9a
	tSHcEJCp8Sb+l/iI068btXNFakMerYgmQt0ypEtqcu51J8nA+bNAOIfku5BLxMWwIf7OWVyFSgJmt
	lZWiGfOvrfeyl1PyWwjyVy+heFznCnMoYWep/ffGy34RYZ5Djp7dH9VtmuGv2PAWLCHmbTu5vIi/t
	iMaIcW9Vy29giM9NUehzYinrthGPlZCu/8CxAwLvGCWJMkkyaFn78r9xs6SlEHxgwYXCdcFDY9HcF
	LDbt4jPBAF3WR+uUpaUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVOqn-00000002Ugj-0DTG;
	Mon, 23 Nov 2026 07:52:33 +0000
Received: from out-94.mta0.migadu.com ([2001:41d0:1004:224b::5e] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVOqh-00000002Udy-2WFC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 07:52:29 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=PA8f4ndtDotBrMDWYs5zhgHdu0JkHQRg3GkPu9g17Y4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795420345; v=1; x=1796025145;
 b=j55B32L/YJCn19yUNEE3qLhbHeudFU/ZtaS0F1MM4PtBi+TOqHPHBmXzGB8AVgI1Z8bYG0Bq
 XGSo6Gh4RWWnvgyXvj5skRHSJHGaxMhyIcvW8l4BSEfWDCaFnHrHmfnhijYWiCOeCDF78VWqVbR
 e00o49yPhbetxBPAHkHIy1Cc=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 5fb6a7c82f35303c;
	Mon, 23 Nov 2026 07:52:25 +0000
X-Mizu-Trace-ID: 5fb6a7c82f35303c
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
Subject: [PATCH 1/9] arm64: sysreg: Map MPAM1_EL12 to MPAM1_EL1
Date: Mon, 23 Nov 2026 07:52:11 +0000
Message-ID: <20261123075219.369042-2-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123075219.369042-1-fuad.tabba@linux.dev>
References: <20261123075219.369042-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_235227_939086_A747B8E5 
X-CRM114-Status: GOOD (  10.69  )
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

MPAM1_EL12 is the EL12 alias of MPAM1_EL1, but its entry in the sysreg
file is "Fields MPAM1_ELx", and the file doesn't have an MPAM1_ELx
block. Since commit 6ae7fab7d9d33 ("arm64: sysreg: Emit RESx/UNKN values
for Mapping/Fields definitions"), the generator's MPAM1_EL12_RES0, _RES1
and _UNKN expand to MPAM1_ELx_RES0 and the like, which aren't defined.
They aren't used yet, but the first user would fail to build.

Describe the register as a mapping of MPAM1_EL1.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/tools/sysreg | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 997c62ab72e68..ebe5c5bd6fef6 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -5501,7 +5501,7 @@ Field	63:0	ADDR
 EndSysreg
 
 Sysreg	MPAM1_EL12	3	5	10	5	0
-Fields	MPAM1_ELx
+Mapping	MPAM1_EL1
 EndSysreg
 
 Sysreg	CONTEXTIDR_EL12	3	5	13	0	1
-- 
2.47.3


