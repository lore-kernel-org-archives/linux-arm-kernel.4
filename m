Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1713B606A326
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 12:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bbBtP1Oy;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Ew7t0BiM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=PSxLr1HHsETskvI6VvCsOfwe2CKjdeVgSnc6fyenuSA=; b=bbBtP1Oyy+4C17
	/ZkwU/QqenkWMp0JfTb41oX3yeoz1WvpVq+QyIwN6qyINX1AzFVprkZUyIDUxldnyBFVGN0Qo5Ase
	Bmj5NHYVsvINGtssba9yI3oFZsW9mIXNJGVXCKp8K78aeEILlFm5ModGwbWRIFkAnLHwQtOnPZT6b
	67yFpohQI+OhbLXa4JX2WnlThpeDhZBXf5JQeNIHBNoSCxtOYy8paJmEvpPAaay54ZGSz1ExUp4mB
	n3scAAalbT+ZjBKFg7l+d9zWQhSPmSfHLStWMT4jxgEux8vvPDxTzFvUOZ3PtBhPCcsbb9nD10LKa
	JCxEyPI6kfkAkKVA2eZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUNY1-0000000EvWj-356R;
	Fri, 20 Nov 2026 12:16:57 +0000
Received: from out-57.mta1.migadu.com ([95.215.58.57] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUNXu-0000000EvTY-0IHk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 12:16:52 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=8XiXryHIULlaN/y2rMXAN7tXMcBUgoQa55KwIlOF3YQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795177008; v=1; x=1795781808;
 b=Ew7t0BiMr3e7CVmdSlurASVTZhKw1/jT/GA3R/abcw65m0Z+SuR+peAbPzIMnEzsqXjh7HZV
 Ozo/C2SWRz+SAS+NAZ8L+dZ27G5so1ghoVYUa1jPuYKd8sPaOQyFR9iLUfoFTchFMEdImD+sXiR
 eGbs+VozdluDtnHCmM4UrXPs=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id b3526d582d4043ac;
	Fri, 20 Nov 2026 12:16:48 +0000
X-Mizu-Trace-ID: b3526d582d4043ac
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
Subject: [PATCH 1/3] arm64: pi: Add an ISB after mapping the FDT in the initial ID map
Date: Fri, 20 Nov 2026 12:16:36 +0000
Message-ID: <20261120121638.194154-2-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261120121638.194154-1-fuad.tabba@linux.dev>
References: <20261120121638.194154-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_041650_251642_35052F69 
X-CRM114-Status: UNSURE (   8.69  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.8 (--)
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

map_fdt() maps the FDT into the live initial ID map with only a DSB
before the caller reads it, so the read can fault on a translation made
speculatively before the mapping was written. This early in boot,
VBAR_EL1 doesn't yet point at the kernel's vectors, and the kernel fails
to boot.

Add an ISB after the DSB.

Fixes: 84b04d3e6bdbc ("arm64: kernel: Create initial ID map from C code")
Cc: stable@vger.kernel.org
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kernel/pi/map_kernel.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/kernel/pi/map_kernel.c b/arch/arm64/kernel/pi/map_kernel.c
index fb44cbdd2f292..f9338257adb7d 100644
--- a/arch/arm64/kernel/pi/map_kernel.c
+++ b/arch/arm64/kernel/pi/map_kernel.c
@@ -211,6 +211,7 @@ static void *__init map_fdt(phys_addr_t fdt)
 		  fdt, PAGE_KERNEL, IDMAP_ROOT_LEVEL,
 		  (pte_t *)init_idmap_pg_dir, false, 0);
 	dsb(ishst);
+	isb();
 
 	return (void *)fdt;
 }
-- 
2.47.3


