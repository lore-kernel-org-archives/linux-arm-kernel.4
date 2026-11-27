Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2884E606A324
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 07:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sz4Pqsxn;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=chZuL7G+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=cerfVBgu9YPI0O+wyBK+FTIgV6wt8zLv1/3eHjoa+4E=; b=sz4PqsxnrEVbph
	8mWsQOhrlZtZxe0Lku4GQR1yDr4EPbywlrRAOOa5j4ZPfJL2ifsah45YTAP27WyJGect+Lpd8/4Se
	QLUsG2kYUyLKkaqNrA6eOFBLMUJOPXEHJTuJ7QJnkYQbRVYT/iMgJrK7bGEwc3ch2yaCopDKtbLT+
	fshc0ZTxYnUaiOJpsd4S//QfhPWpAut3UkmU6B0Wh+NRDVQfiyG4aGJI1kHtojg7A5axTIZUhNXVi
	+j9beeL0YcV66U/JxoEcKaR7DXMxZrmS/iz7hEX8eNnrlOoH8SZcD7PHN4i/gyE6gsvOBk/752TQa
	sFfo9dmHG73qB5nACjww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWqeN-0000000FAaB-35JO;
	Fri, 27 Nov 2026 07:45:43 +0000
Received: from out-215.mta0.migadu.com ([2001:41d0:1004:224b::d7] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWqe1-0000000FAMu-1EXb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 07:45:22 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=qYRjslUDVcj1lt8KzDUu0lRPd6BDIf6Rmbfrgg+NzNY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795765519; v=1; x=1796370319;
 b=chZuL7G+6HfoI+6F9a1JfOh2WWb3e0Fm26cBoS3v7TXKdjMOkhX0jXo/UjTahdUPSAFHXviB
 KjrlsEe/3NjlgWGLwFMybOuxqbwPqt/FEkg4cJFVGM/xkZIz2uWTH4Fpa4cnb71jLDEBeQS+yXH
 xRBZO5VgWZBPX1p6bviRzotM=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 4d49051ba8f4cc3e;
	Fri, 27 Nov 2026 07:45:17 +0000
X-Mizu-Trace-ID: 4d49051ba8f4cc3e
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
Subject: [PATCH v2 10/10] arm64: sysreg: Reject a bit position written with a leading zero
Date: Fri, 27 Nov 2026 07:44:26 +0000
Message-ID: <20261127074426.50739-11-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127074426.50739-1-fuad.tabba@linux.dev>
References: <20261127074426.50739-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_234521_472877_FDDE66A0 
X-CRM114-Status: GOOD (  10.06  )
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

parse_bitdef() reads a field's msb and lsb as decimal and checks the
layout with them, but the generator copies the digits into GENMASK()
unchanged, and C reads a leading zero as octal. "Field 63:010 A" is
accepted as bits 63 to 10, with the next field starting at bit 9, while
its mask is GENMASK(63, 010), bits 63 to 8, which overlaps that field.

Require both ends of a bit range to be decimal numbers without a leading
zero.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/tools/gen-sysreg.awk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/tools/gen-sysreg.awk b/arch/arm64/tools/gen-sysreg.awk
index 057dc98082b5e..103420b58d24c 100755
--- a/arch/arm64/tools/gen-sysreg.awk
+++ b/arch/arm64/tools/gen-sysreg.awk
@@ -102,7 +102,8 @@ function parse_bitdef(reg, field, bitdef, _bits)
 		fatal("invalid bit-range definition '" bitdef "'")
 	}
 
-
+	if (msb !~ /^(0|[1-9][0-9]*)$/ || lsb !~ /^(0|[1-9][0-9]*)$/)
+		fatal(reg "." field " non-decimal bit-range '" bitdef "'")
 	if (msb != next_bit)
 		fatal(reg "." field " starts at " msb " not " next_bit)
 	if (63 < msb || msb < 0)
-- 
2.47.3


