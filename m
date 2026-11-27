Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2503B606A326
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 07:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fc9mxeSk;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=smmb1TdP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=32F+dteGpI4OSC7Oxea+gbzCBa3IpwvHXw14v4GKoqg=; b=fc9mxeSk4Bavue
	wpiseAyKysfVLxX5OBI4b7AarALgQJDl4MVHo7y7f2gw8wV6t9pEEi2U5rl/Za3s30WyS1EdH4B4E
	xHvDz8pyOTuyuvLrMcjkDQHEIYy7obu7T/dP/1W19iJgB2gu5sSuOs3ypF4VYsmHplrMEuxcpqsr2
	T6oqAWNSmyBlgLhFDwOa9sntC+/V/AhdkMu6rI00MkQZ6nrPTWsECLtbf4y4EtxURoal+bcvWfcjx
	fKH2MbrgmVUan7IIUr/Zetyfl2hyxVQn8el4tOJdQnYD3XTLPgqlanQ0CDZj0uXk/m2TBEL81Wtm+
	hhP5fI8iZqkTZgCvzVpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWqdh-0000000FAAf-2A7K;
	Fri, 27 Nov 2026 07:45:01 +0000
Received: from out-50.mta1.migadu.com ([2001:41d0:203:375::32] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWqdO-0000000FA2i-11fU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 07:44:43 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=k+kNS9/yC5H3dUfVUZLdt6GwIbmdmFem0AL769/L13M=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795765481; v=1; x=1796370281;
 b=smmb1TdPoZBHG+Rxs+wEUarNd/4GBEorRh8Gl6zJE0TZ9g98jDTdg/fRsgQEHzuK7PDrLcfp
 zZpadWz+FeA2K4gdq1qlfsYuLMdp7cBwhdSBSl1sZJ1863dbmuEARb8Ex74ZHGVL3jBjq0hCa6y
 Hja/itUcflgwF/HVbOe0og7g=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id bf1ec0af72a262ed;
	Fri, 27 Nov 2026 07:44:41 +0000
X-Mizu-Trace-ID: bf1ec0af72a262ed
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
Subject: [PATCH v2 04/10] arm64: sysreg: Don't run the end-of-file checks after an error
Date: Fri, 27 Nov 2026 07:44:20 +0000
Message-ID: <20261127074426.50739-5-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127074426.50739-1-fuad.tabba@linux.dev>
References: <20261127074426.50739-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_234442_422540_BCBFBFCC 
X-CRM114-Status: GOOD (  11.08  )
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

fatal() ends the run with exit, but awk still runs the END rule after
it, and END checks the file as though it had been read to the end. An
error inside a block leaves that block open, so the error is followed by
a second, bogus one about a missing terminator.

Skip the END checks once fatal() has run.

Reviewed-by: Steffen Eiden <seiden@linux.ibm.com>
Reviewed-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/tools/gen-sysreg.awk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/tools/gen-sysreg.awk b/arch/arm64/tools/gen-sysreg.awk
index 8ce4981273dd3..c4fa27cd9beff 100755
--- a/arch/arm64/tools/gen-sysreg.awk
+++ b/arch/arm64/tools/gen-sysreg.awk
@@ -19,6 +19,7 @@ function fatal(msg) {
 	}
 	printf "\n"
 
+	__fatal = 1
 	exit 1
 }
 
@@ -116,6 +117,10 @@ BEGIN {
 }
 
 END {
+	# fatal() exits before the whole file is read, and exit still runs END.
+	if (__fatal)
+		exit 1
+
 	if (__current_block_depth != 0)
 		fatal("Missing terminator for " block_current() " block")
 
-- 
2.47.3


