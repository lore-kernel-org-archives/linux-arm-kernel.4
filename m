Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B85DE606A681
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 08:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=efZZOAZr;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=oLbU4aP6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ovUFY90e6TBeDEMLcD+XQ14+5xbpH/4Hs85p1IaHKwc=; b=efZZOAZr71k5Dt
	viF3imGpAM6AGJDq1t4N1JF/j8Sbrxpt7aRvbFdgo15kEClEFe+B25UWT1/JyWIg4jWtjDqLvz+L7
	3/VBcU0vKuOMXBp5XiHIWQudS6zz8yufgzUgG6at7FJMMDw0Qjsu6WEz1j1gKbOOQnI00TJXcCFEZ
	2ZfySddzyqO/JJr605XZoNwkug/7FOzIwtQC3vDdZictU4Mw8RO5R0IRvMIykPl3NPU8XKH2k/3hb
	BeseOEjeIV32vYOX2eAj0TGgSHi6medVVWPWyUvCUyFMnGYft5F455xWYve9oVRUO3PWA8HjbGaPD
	Ggb7VSE42Hce9LXuR1cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVOqn-00000002Uh6-0ol5;
	Mon, 23 Nov 2026 07:52:33 +0000
Received: from out-147.mta1.migadu.com ([2001:41d0:203:375::93] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVOqi-00000002UeJ-073r
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 07:52:29 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=0Wb1aSE//fFVyU0JXIDWtBGcmmyyDDV9MfInC/0NCF0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795420346; v=1; x=1796025146;
 b=oLbU4aP6+t1oBCPfyT4jNAr4PNz8033nOYN4BFFbBWhBdJ03CFJBYynFPsKCk7xk/cyKaHvn
 UF0YiUEMIs4AAkTR/xLqjA7P+mSuS6pYe3VjmIPTbOuCxYH+qhyip/pLDlK3u/Uwu7ZLfUBdAeh
 0Rsmzhn0Za3CRVw2tQsD9BOw=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id d63a0246b9e4f8c7;
	Mon, 23 Nov 2026 07:52:25 +0000
X-Mizu-Trace-ID: d63a0246b9e4f8c7
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
Subject: [PATCH 2/9] arm64: sysreg: Remove the dead range check from parse_bitdef()
Date: Mon, 23 Nov 2026 07:52:12 +0000
Message-ID: <20261123075219.369042-3-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123075219.369042-1-fuad.tabba@linux.dev>
References: <20261123075219.369042-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_235228_217656_306EE6B4 
X-CRM114-Status: UNSURE (   8.87  )
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

parse_bitdef() ends by testing "low > high", but the script doesn't
assign either variable, so the test compares two empty values and never
fires. The "msb < lsb" test just above it already rejects an inverted
range.

Remove the dead test.

No functional change intended.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/tools/gen-sysreg.awk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/tools/gen-sysreg.awk b/arch/arm64/tools/gen-sysreg.awk
index 53844f5c5e525..b299342463631 100755
--- a/arch/arm64/tools/gen-sysreg.awk
+++ b/arch/arm64/tools/gen-sysreg.awk
@@ -100,8 +100,6 @@ function parse_bitdef(reg, field, bitdef, _bits)
 		fatal(reg "." field " invalid low bit in '" bitdef "'")
 	if (msb < lsb)
 		fatal(reg "." field " invalid bit-range '" bitdef "'")
-	if (low > high)
-		fatal(reg "." field " has invalid range " high "-" low)
 
 	next_bit = lsb - 1
 }
-- 
2.47.3


