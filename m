Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65D85606A321
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 07:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=b5B+sDqQ;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=FIzo7vBZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=BcY3zhewcC/gjXkdCrNzCSoLVp0i4+/wkiIUb/zH1l4=; b=b5B+sDqQtyQWcI
	LDfq2lVTV0TPJ2Kc6vT0KmrEzhhEURKmfPdDlOj0uMTfu6m57p9mVc8zlUEKHLHvd/igJhEJIMEbN
	q3VnLxbnaX+JA5mrrlFN4huTMAKY//32uLOA/ga8nepa8axoyJi7Dph5tm+ZoZ7Nqg5ovgO3lDQSy
	k9AXfx0OnYqFaV/1OReI6/m6j5sSX44ON4iNCPy7WxHSk7FBoinqIuTXFskGj4hI7fU+yvA2p5Yo2
	BXTAzlJpSU2k8+xYBihCgWHGRk6VxIV6QM5CuK7UpykzlkBsHwV7owBclurjxcMy+cn3UwNmYa9fi
	Xwer8eV8LpMjhKC+KnXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVOtB-00000002VGt-3JUj;
	Mon, 23 Nov 2026 07:55:02 +0000
Received: from out-117.mta0.migadu.com ([2001:41d0:1004:224b::75] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVOr9-00000002UqZ-12zd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 07:52:56 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=A0IV6vF9Ca8CUPIZGwVPYNr9oyhhI8zHxDxiCNop38c=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795420373; v=1; x=1796025173;
 b=FIzo7vBZYPtfTHdKgCqhrqY/sbBrN3huxLvuZ07DLQWIoErDRL/uw2SEJ7ft8e9d77EmaGlo
 ITsX/XpjoirdzFC/bcvtCoKTY774XKMQMctmF5Dal2kW7stdKhKZ+PQ2b8iQrCxOzZkMKagDYaH
 Xc1FUgtLJlYMML0Md9uxkBHQ=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id a3fa72e7f477d5c7;
	Mon, 23 Nov 2026 07:52:53 +0000
X-Mizu-Trace-ID: a3fa72e7f477d5c7
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
Subject: [PATCH 6/9] arm64: sysreg: Reject an enum value not written at its field's width
Date: Mon, 23 Nov 2026 07:52:16 +0000
Message-ID: <20261123075219.369042-7-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123075219.369042-1-fuad.tabba@linux.dev>
References: <20261123075219.369042-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_235255_434882_B7D289A2 
X-CRM114-Status: GOOD (  11.63  )
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
its field has bits. The one enum written otherwise is TS, a two-bit
field of TRFCR_EL1 and TRFCR_EL2 whose values have four digits. Write
them with two digits, which leaves the numbers unchanged.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/tools/gen-sysreg.awk |  3 +++
 arch/arm64/tools/sysreg         | 14 +++++++-------
 2 files changed, 10 insertions(+), 7 deletions(-)

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


