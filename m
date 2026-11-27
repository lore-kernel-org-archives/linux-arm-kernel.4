Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B52F1606A327
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 09:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=t/nSo9uq;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=tHzS949P
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=TLKRd8QC/BYL1fg8i3fNARnXOmRuwMr6bd5jMLPGN9Y=; b=t/nSo9uqRQOA2y
	/uSTm8/QsvdIBp/1CUs6rTJz7uXQta2sBlkwuQzEpYUHkVaHzlDR9IHtijX+W2/ceRcPQILHxYRfD
	0JoPY84+lJI0W0QzWikM5zpS87YEu4UdiBfZPN9udh07z3TYeNLkq6Yp1goCglqLCm6lJizzOzpx7
	hJ2DyfZ0pt5/rzWxN6G7Ln8GV74saQbrm+t0YEmeb6BHVgDqs/3DulIA8LhUYmFKxt0lM43Eu2MeM
	eZFLrv7yT5MZefUiFaaEsoiTdZdBaCy/15QKDBSpjPN28Nf2LTGIUqhfkbgXxch0x2/Cq/PAq4R9P
	iaWbigwazWC0MhMZWMHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWqeN-0000000FAZc-1cZf;
	Fri, 27 Nov 2026 07:45:43 +0000
Received: from out-196.mta0.migadu.com ([2001:41d0:1004:224b::c4] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWqdi-0000000FA9t-1TCf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 07:45:03 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=7/9aubeJ7ANPjxxvP5vIEXNZStyv5Yrfe+pB6O5E5RA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795765500; v=1; x=1796370300;
 b=tHzS949PZslHjwPsfRnaCVI068Ai9AFQGLt7fduaz+hwvBtKMtyKCDTpL6ELL73yDcTJJ5dU
 yAt/dh2mdgFV1MDJeOeJpIgLeEY2lVXfv0DEtetzz8Uxg+iuk3R/aaCLzrSUtovhPTmbn4i6fM4
 +BYg0uPSVlLIZdPi8jt607jU=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 363d26472d9a53f3;
	Fri, 27 Nov 2026 07:45:00 +0000
X-Mizu-Trace-ID: 363d26472d9a53f3
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
Subject: [PATCH v2 07/10] arm64: sysreg: Reject an enum value not written at its field's width
Date: Fri, 27 Nov 2026 07:44:23 +0000
Message-ID: <20261127074426.50739-8-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127074426.50739-1-fuad.tabba@linux.dev>
References: <20261127074426.50739-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_234502_532702_539B1474 
X-CRM114-Status: GOOD (  10.88  )
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

The generator emits each enum value as written and doesn't check it
against the width of its field, so a value wider than the field defines
a constant the field can't hold. The duplicate value check compares the
strings as written, so 0b01 and 0b001 in the same field pass as distinct
values, and the rule's pattern, an unanchored /0b[01]+/, accepts 0b12
too.

Require each value to be 0b followed by exactly as many binary digits as
its field has bits. Test it in the rule's action rather than by
tightening the pattern, so that a value such as 0b12 is reported with
its field's width, instead of falling to the generic "unhandled
statement" error.

Reviewed-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/tools/gen-sysreg.awk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/tools/gen-sysreg.awk b/arch/arm64/tools/gen-sysreg.awk
index 1843d283192d2..cde526896ed96 100755
--- a/arch/arm64/tools/gen-sysreg.awk
+++ b/arch/arm64/tools/gen-sysreg.awk
@@ -367,6 +367,9 @@ $1 == "EndEnum" && block_current() == "Enum" {
 	val = $1
 	name = $2
 
+	if (val !~ /^0b[01]+$/ || length(val) - 2 != msb - lsb + 1)
+		fatal("Enum value " val " for " name " is not " (msb - lsb + 1) " binary digits")
+
 	if (val in seen_enum_vals)
 		fatal("Duplicate Enum value " val " for " name)
 	seen_enum_vals[val] = 1
-- 
2.47.3


