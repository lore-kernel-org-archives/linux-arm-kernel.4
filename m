Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D03A606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 07:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KvclWUYE;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=jXR76Lgo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=rjFAFSnQzww/PMhe+fBcGKSmoYrWoHrEwbrRVCL/1+U=; b=KvclWUYEKcRTVc
	d0MbgkQ3I0NclWRKR1Z5szVtpGtvRS3KrTStRqy8Z1JPTvH/bIP+magG0uXEL/YXlcCRH70GtmOQx
	h6IbLR5/OIHRfy2uV5w+toqZNXkzQlc7NeauE1TM6SYHnBIixSvHPfL+BHdM+spMXxk5nZd9RMoTs
	7PjlEV42as0Cq1nrn7h8+wytsm2Nc9/pjGKtma+vFh3yvJQ4DF3H4ET5r8noQHlZ2MWTP9+eh4Et8
	kQvBxJk8xgAxXmWdM3gJLkcpoxm5F38+CpHAKztqu/UKHfBRkklbCHjUlKJ63FRUuvBOBS2sF6mbK
	5169V6wIKDMjVbiN+pNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWqeN-0000000FAZJ-1DXS;
	Fri, 27 Nov 2026 07:45:43 +0000
Received: from out-194.mta0.migadu.com ([2001:41d0:1004:224b::c2] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWqdh-0000000FA9R-3JH1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 07:45:03 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=91/MbW0Ihq5jKcyTwvbVGk1O26qhFoJZjfsNrSheUvs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795765499; v=1; x=1796370299;
 b=jXR76LgoW5U3C9Y1wdBOB9e9PkSN85+XjTdklfsWZqcrEbzMtCoYaQKiNJ6NNcyPhRG4Pbib
 JC4D0huHCQEexg1ng5tEGZNmC29Hg2xTyFKIw2SMFzvZCeXoBGnXAcky7qkn81YzxWUZmoWUXbB
 FrzbeD7sh9DtLdJLRG+rPLpQ=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 4f765abdede48262;
	Fri, 27 Nov 2026 07:44:59 +0000
X-Mizu-Trace-ID: 4f765abdede48262
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
Subject: [PATCH v2 06/10] arm64: sysreg: Drop the leading zeros from the TRFCR_ELx.TS values
Date: Fri, 27 Nov 2026 07:44:22 +0000
Message-ID: <20261127074426.50739-7-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127074426.50739-1-fuad.tabba@linux.dev>
References: <20261127074426.50739-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_234501_991342_C12A960A 
X-CRM114-Status: UNSURE (   7.52  )
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

TS in TRFCR_EL1 and TRFCR_EL2 is a two-bit field, but its enum values
are written with four binary digits. They're the only enum values in the
sysreg file whose number of digits differs from their field's width, and
the values themselves fit.

Drop the two leading zeros from each, ahead of a check that requires
every enum value to have as many digits as its field has bits.

No functional change intended.

Reviewed-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/tools/sysreg | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index ebe5c5bd6fef6..5b587a7544e40 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -2919,9 +2919,9 @@ EndSysreg
 Sysreg	TRFCR_EL1	3	0	1	2	1
 Res0	63:7
 UnsignedEnum	6:5	TS
-	0b0001	VIRTUAL
-	0b0010	GUEST_PHYSICAL
-	0b0011	PHYSICAL
+	0b01	VIRTUAL
+	0b10	GUEST_PHYSICAL
+	0b11	PHYSICAL
 EndEnum
 Res0	4:2
 Field	1	ExTRE
@@ -4300,10 +4300,10 @@ EndSysreg
 Sysreg TRFCR_EL2	3	4	1	2	1
 Res0	63:7
 UnsignedEnum	6:5	TS
-	0b0000	USE_TRFCR_EL1_TS
-	0b0001	VIRTUAL
-	0b0010	GUEST_PHYSICAL
-	0b0011	PHYSICAL
+	0b00	USE_TRFCR_EL1_TS
+	0b01	VIRTUAL
+	0b10	GUEST_PHYSICAL
+	0b11	PHYSICAL
 EndEnum
 Res0	4
 Field	3	CX
-- 
2.47.3


