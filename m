Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E5C4606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 19:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rk15xDCE;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=PtkongnB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=vJEbZH6eaYa4UjBbDZ8rCzoQ5k9p221jQ4CKj+w5k/c=; b=rk15xDCEKjPWYw
	90+JQmVyy/q95Wr4lZNj+t5S2rlZvr4M8AhvXOo0qcS5TkMLJiVDBAXowGVOwKfVcZoWnUkhDKKzb
	KAN/FKbHPyhacCNGJM2nXZbnLf6BPrlZLQ79FHOCcuLZPtVivbY3oIbU/tf6Cbam4gSDFB26TcD67
	W7PGvB8Wu1f+6IMgv117ZhsvzfbYJ9RCJQEyzEKNDpH/FLQ2e1oGlLVpBY+L/mUE0Pl4A7bexXa4r
	aQLSWsKPN5V5/fODxqKdgY+YG0VnwCKtgitpacS+XahtHAZVBbVqvAxiN6Dt4BTYY5LAuzEoHb32F
	N3BdRVSipU4i3uWMv5LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT2Oz-00000003l8x-17gk;
	Mon, 16 Nov 2026 19:30:05 +0000
Received: from out-40.mta1.migadu.com ([95.215.58.40] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT2Ov-00000003l5r-2BEp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 19:30:04 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=ZvntSmCaLaNIEC3B3jSfAuRkr5837gnvJKZs8RlOmFs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794857399; v=1; x=1795462199;
 b=PtkongnBsllQIQAs+kqWE4w6/w6Ay2PZB9U8fAeYZfstqKoQTmE9hXtapebAD0kYf2fSpr7z
 eTflYbQIR0Vc8sk92GFVBEfFxdWUp6jMT44CgnvYyyUwVfBjYIZOz1UL+eVwwvi8riAy0dj57SQ
 r3cUavVzkR8+4AeWZ1SbiCXw=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 4b31c3f78b985d69;
	Mon, 16 Nov 2026 19:29:59 +0000
X-Mizu-Trace-ID: 4b31c3f78b985d69
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>
Cc: Radu Rendec <radu@rendec.net>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Will Deacon <will@kernel.org>,
	Fuad Tabba <tabba@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/5] irqchip/gic-v3-its: Free the page when gen_pool_add() fails
Date: Mon, 16 Nov 2026 19:29:33 +0000
Message-ID: <20261116192933.3266502-6-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261116192933.3266502-1-fuad.tabba@linux.dev>
References: <20261116192933.3266502-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_113001_710653_7F0E73EE 
X-CRM114-Status: GOOD (  11.00  )
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

When the ITT pool has no room, itt_alloc_pool() grows it by a page and
retries. gen_pool_add() fails when it cannot allocate its chunk
descriptor, but its return is ignored, so the page is leaked and the
retry allocates another page to leak, until an add succeeds or a page
allocation fails.

Free the page and fail the allocation instead.

Fixes: b08e2f42e86b5 ("irqchip/gic-v3-its: Share ITS tables with a non-trusted hypervisor")
Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 drivers/irqchip/irq-gic-v3-its.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
index 33aa8a355ec65..74fda3a6efed0 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -279,7 +279,10 @@ static void *itt_alloc_pool(int node, int size)
 		if (!page)
 			break;
 
-		gen_pool_add(itt_pool, (unsigned long)page_address(page), PAGE_SIZE, node);
+		if (gen_pool_add(itt_pool, (unsigned long)page_address(page), PAGE_SIZE, node)) {
+			its_free_pages(page_address(page), 0);
+			break;
+		}
 	} while (!addr);
 
 	return (void *)addr;
-- 
2.47.3


