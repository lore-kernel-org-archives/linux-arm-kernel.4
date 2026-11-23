Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F83A606A336
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 10:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AsNB/s2w;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=cBPZwIo8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=vAXJFlo+YYwGzNbnzUk9I8X1XTMxTImLMqWG90QFCAQ=; b=AsNB/s2w4iVy8cwSv/X62iHsjG
	wU5f8it0G/ERvL2XCxW6pq+exyKDkzncBR9KMy3E4Jv/X96w5N7q415oDAuG4DVkHTXdd4tHAin2h
	llWawiQUrncDX1slW9HVyL9FBbZbxzoU7gmbfoC8ctxks4pUWDycqTtqQJ75NqBancO0wnkf1nceT
	pZyEu35uxfPD/gYUXWOwIMT93+tZ54aUyzUZg+P6tnoAIR95n5mhWsapIeP8QkK+4rsdUkWtMfmSz
	M+k4XfZ5QJX50OP4zg9LGgy+qdBBBKIKzREBkY+ChzIyFa/jLALK8cA2pCbJL3JNQKcO6so8ImBRR
	d0wBFpmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVOqm-00000002UgW-13lY;
	Mon, 23 Nov 2026 07:52:32 +0000
Received: from out-142.mta1.migadu.com ([2001:41d0:203:375::8e] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVOqg-00000002Udl-0CPl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 07:52:27 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=JBWy6UtAH7XEsQk9PT5UbS91XMRAaxx+pdJcqZHmb3Y=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795420344; v=1; x=1796025144;
 b=cBPZwIo8ozSLewwyQleEX0006BiDI+kpFJ2r9MBZJx+kjXoOVw2RpJ2hNuUG28jdnyW+pOe+
 vxRGEg4j7VlTXVmtlfMzkCbc63QpAZyYI/1PgfruLZ3ob4b5fWG+Y9cwu6FJa83DKyU4+0t5fyL
 +CgmhIedo5iS9yMlRimoPXBY=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 4922f193c2d48cd4;
	Mon, 23 Nov 2026 07:52:23 +0000
X-Mizu-Trace-ID: 4922f193c2d48cd4
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
Subject: [PATCH 0/9] arm64: sysreg: More input checks in the sysreg generator
Date: Mon, 23 Nov 2026 07:52:10 +0000
Message-ID: <20261123075219.369042-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_235226_327417_CEA8AAA1 
X-CRM114-Status: GOOD (  11.31  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi folks,

After finding yet another bug in the sysreg file, I think it's time to
stop filling potholes and have the generator reject them instead.

The bug is in MPAM1_EL12. Its Fields line refers to a SysregFields
block that doesn't exist, so its RES0, RES1 and UNKN masks expand to
undefined names. The masks aren't used yet. Patch 1 fixes it.

The rest of the series adds checks to gen-sysreg.awk for input it
accepts while the kernel still builds: a Sysreg and a SysregFields with
the same name (Mark's suggestion [1]), a Fields or Mapping target that
isn't defined, an enum value not written at its field's width, a macro
defined twice, and an encoding or a bit position that's out of range or
has a leading zero. Two patches prepare for them. One removes a range
check that can never fail, and the other stops the end-of-file checks
from running after an error.

With gawk, mawk and busybox awk, the generated header is the same
before and after the series, apart from the MPAM1_EL12 lines and the
number of digits in the TRFCR_ELx.TS values.

Based on Linux 7.4-rc3 (aebb727447640).

Cheers,
/fuad

[1] https://lore.kernel.org/all/aLF9mSCs1B2gk8BU@J2N7QTR9R3/

Fuad Tabba (9):
  arm64: sysreg: Map MPAM1_EL12 to MPAM1_EL1
  arm64: sysreg: Remove the dead range check from parse_bitdef()
  arm64: sysreg: Reject a Sysreg and a SysregFields with the same name
  arm64: sysreg: Don't run the end-of-file checks after an error
  arm64: sysreg: Reject a Fields or Mapping line with an undefined
    target
  arm64: sysreg: Reject an enum value not written at its field's width
  arm64: sysreg: Reject a macro name defined twice
  arm64: sysreg: Reject an out-of-range register encoding
  arm64: sysreg: Reject a bit position written with a leading zero

 arch/arm64/tools/gen-sysreg.awk | 48 ++++++++++++++++++++++++++-------
 arch/arm64/tools/sysreg         | 16 +++++------
 2 files changed, 47 insertions(+), 17 deletions(-)


base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
-- 
2.47.3


