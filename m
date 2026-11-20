Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1000A606A325
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 12:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=08M6WEKr;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=fQEPpI7U
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=WFGUsPib7UYtVJ1BiXTL9SeVte53OesLIVWmVAJzm2E=; b=08M6WEKrE7ogbZ
	/lHinzSv+Db86ydHE0WETDD24j1eRAroBfJs/P0rtwPArVAe8bm7KFf7wczHZC3Mu1mhMG7EvhUIC
	e/9BO5qTXXc/YwKKKqtIBeU27mdTi+V0mBYGqWtn6AvRhk+wjqG+E1Foe7QYQkHd+ircZUGXLzNXQ
	y3DipYZJ6szLIU4BKCiesM8sCnzIlWKxPH4StxeUIKsIzafMTWt/PzbOkZe+P298a+na3mZWqR7G8
	oN2D/YkAbMM77mvz1mz+AOtUpnHv1rrxv/pwFI32L+6Ri/lE/ZzJ+L/Jh/NXqkNtnEqUye+MnkqNS
	rpfB027LhL3wDd0q2BIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUNY1-0000000EvWp-3SFM;
	Fri, 20 Nov 2026 12:16:57 +0000
Received: from out-93.mta0.migadu.com ([2001:41d0:1004:224b::5d] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUNXw-0000000EvU3-3Bt8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 12:16:54 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=rMvHJji9BqzVdUvxXHqbG2A1RgJoNeZr1+rKa6jfFow=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795177010; v=1; x=1795781810;
 b=fQEPpI7UEavaI3A5R6eX3FsR9hpzgnSl38j0Cq5nwGsnq5iMqWeGoSQQIZM6bLsC5FkeyHqt
 S3u/REx3m3aPeNo1udcB8Txj0SCAEIMKGjKzFOQc4/aZ+QWFR43lceJOOi4m0dDZ9ooKAgGF6qb
 6gC1SW2Y7yczut054rqU6QoI=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id d94a9313021c98ac;
	Fri, 20 Nov 2026 12:16:50 +0000
X-Mizu-Trace-ID: d94a9313021c98ac
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Yang Shi <yang@os.amperecomputing.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Fuad Tabba <tabba@google.com>,
	stable@vger.kernel.org
Subject: [PATCH 2/3] arm64: mm: Add an ISB after remapping the KPTI page-table slot
Date: Fri, 20 Nov 2026 12:16:37 +0000
Message-ID: <20261120121638.194154-3-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261120121638.194154-1-fuad.tabba@linux.dev>
References: <20261120121638.194154-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_041652_944968_BCC72554 
X-CRM114-Status: UNSURE (   8.07  )
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

kpti_map_pgtbl remaps a temporary slot with break-before-make, and
kpti_mk_tbl_ng then reads the page tables through it. The make ends in
a DSB alone, so the reads can fault on a translation of the slot made
speculatively before the new entry was written. With the temporary page
tables in TTBR1 the kernel's vectors are unmapped, and the boot hangs.

Add an ISB after the DSB.

Fixes: 47546a1912fc4 ("arm64: mm: install KPTI nG mappings with MMU enabled")
Cc: stable@vger.kernel.org
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/mm/proc.S | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/mm/proc.S b/arch/arm64/mm/proc.S
index 12aacc74f7647..7ca36d59bf77f 100644
--- a/arch/arm64/mm/proc.S
+++ b/arch/arm64/mm/proc.S
@@ -262,6 +262,7 @@ SYM_FUNC_ALIAS(__pi_idmap_cpu_replace_ttbr1, idmap_cpu_replace_ttbr1)
 	orr	pte, pte, pte_flags
 	str	pte, [temp_pte, #8 * (\level + 2)]
 	dsb	nshst
+	isb
 	.endm
 
 /*
-- 
2.47.3


