Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A707606A326
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 12:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZVbKMK2+;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=h/zQHzqw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=BCDud0ma4gL3NvurX1mO3fYYWW6CTWqrWca8jGfBy/I=; b=ZVbKMK2+7CbeMI
	ttlJdVcutJEYjZoI4sz7FWj/YvKr4WxtwbFWi8dG9Fw6j9Rca/pq9imHX0iAtxe/zlXkj5q7P2pa/
	Frjp0CFLcTGddi1TmT1uYN0OLehA3+Zhz7GWenITWHRmGaaxouJSZB951SUPkHRoU7oC4hXg12GRA
	G+8ioJzq1hB1Hxgn2feC/d8gdbDLu4kgNg4e5MlBDcMxVQ90/SY7hCVnjwGHuDGzCYsQXlnUJ7fs2
	8ZQSKGOld++nP+lx12tbwyFH7mdaIrZf9/aHr+Rtvdoe2u7Gue50RhuZH4PVscO5RViwoYo61S9uQ
	Skeh96npJ7UplcoVo9Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuiv-0000000G0DW-2Bto;
	Fri, 27 Nov 2026 12:06:41 +0000
Received: from out-35.mta0.migadu.com ([2001:41d0:1004:224b::23] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuii-0000000G085-3jPr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 12:06:34 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=9wSce90jYtvUGi+gWq89MFzO5ynOmy1PX90qD9Hp7SM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795781185; v=1; x=1796385985;
 b=h/zQHzqwxGv+m2J50HZC4HcchxvRaQjzw7MpYXydP6i0UkPafft2aiqwz9ZufikUHVXwHNLl
 XieN6KPvvr9QcGN7zGTxhWtPU2/avF5bYw3aAXoD9HBlw4GaJTTXki4QjtddHatJGVfMhMjkfSt
 atzZ0PWuLncnCZptZRfOv4qs=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 648cc0375cc565d6;
	Fri, 27 Nov 2026 12:06:25 +0000
X-Mizu-Trace-ID: 648cc0375cc565d6
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
Subject: [PATCH v3 1/5] irqchip/gic-v3-its: Order table zeroing before the GIC can see it
Date: Fri, 27 Nov 2026 12:06:19 +0000
Message-ID: <20261127120623.891129-2-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127120623.891129-1-fuad.tabba@linux.dev>
References: <20261127120623.891129-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_040629_069540_B3474938 
X-CRM114-Status: GOOD (  11.17  )
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

The ITS driver allocates the ITS tables and the vPE tables as zeroed
pages. It exposes each table with a single store: a relaxed
GICR_VPROPBASER write with Valid set, the relaxed GITS_CTLR write that
enables the ITS, or a valid level-1 entry for a level-2 page.
However, on a shareable table the zeroing isn't ordered before that
store, so the GIC can read the page's previous contents as table
entries, which the spec makes UNPREDICTABLE (IHI 0069H.b 5.2.1, and
GICR_VPROPBASER.Z in 12.11.39). A level-2 page is exposed at runtime,
when the GIC may already be walking the level-1 table for other IDs.

Add a dsb(ishst) at the end of its_alloc_pages_node(), as
its_flush_cmd() does for a command. The allocator doesn't take a
shareability argument, so the barrier is unconditional. On a
non-shareable table it doesn't hurt.

Reviewed-by: Zenghui Yu <yuzenghui@huawei.com>
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 drivers/irqchip/irq-gic-v3-its.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
index c952c069f9373..9900c6a53526e 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -233,6 +233,9 @@ static struct page *its_alloc_pages_node(int node, gfp_t gfp,
 	if (ret)
 		return NULL;
 
+	/* Order the zeroing before any store that exposes the page to the GIC */
+	dsb(ishst);
+
 	return page;
 }
 
-- 
2.47.3


