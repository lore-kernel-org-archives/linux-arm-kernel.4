Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78624606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 12:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wxuv1S+0;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=HNed3bhR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=z9q9jd84jaCoqubeBxx+V5v17+usCJpPuunEpG0X0oM=; b=wxuv1S+0W10glQ
	NY5z1MwGf8pDH/Da2eaI+QC75jOnHS/8bixaErxfp/Lclt89lIxwb5zYYVTDG43a5zKyL7IsynpTA
	03tHoumX2p9I5pip1RebpmAV02wk+0RVUFan5JRlLekFBZ87W4IkK97vYvB7Yafk1vWDgpCBeXj1q
	OJwEkUkRx7cAiigsbVZXd2mCfKgppKDy2QiKGXkuzi7Oto9z8cJkbKIasZ0j72PUCVkGDkSbJNgnM
	RLVjnPFSHf4R1ZN+0kMJ44vdkn3ZOwsQNE5bO+QAkZofCz4X5CVw43K3ylmWNh+iw5cypq9+omYIh
	EoYeRRWEwhisUW94hfgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuiw-0000000G0E4-0M3n;
	Fri, 27 Nov 2026 12:06:42 +0000
Received: from out-243.mta1.migadu.com ([95.215.58.243] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuij-0000000G08S-3LAH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 12:06:35 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=AS4+6+Tmk61XKYNBv6v+q6L2pUXMMn4YwtmRUcOY5Qg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795781187; v=1; x=1796385987;
 b=HNed3bhRPNgBL4Otwj7D6OgngJnPqMR6sxyvA2wf96VTRErCwyTGvuIwiHsj5rjLqE8l+azs
 TwWpJgyaHs0o/p9Xl3ok4zVbLoaeAN/tX0tHOV1XvYMHBpElMcpZbfBmQYZYGsG4YRFTymV5RQ8
 jXEmkl6S3RDn0j64TgEUTxpg=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id bda9cba14b9677bb;
	Fri, 27 Nov 2026 12:06:26 +0000
X-Mizu-Trace-ID: bda9cba14b9677bb
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
Subject: [PATCH v3 4/5] irqchip/gic-v3-its: Zero ITTs reused from the ITT pool
Date: Fri, 27 Nov 2026 12:06:22 +0000
Message-ID: <20261127120623.891129-5-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127120623.891129-1-fuad.tabba@linux.dev>
References: <20261127120623.891129-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_040634_302895_3D13F780 
X-CRM114-Status: GOOD (  12.07  )
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

Commit b08e2f42e86b5 ("irqchip/gic-v3-its: Share ITS tables with a
non-trusted hypervisor") moved sub-page ITTs from kzalloc_node() to a
genpool. An ITT freed back to the pool goes to the next device as the
previous one left it. MAPD is then UNPREDICTABLE: "When V == 1, the
specified ITT does not contain all zeros" (IHI 0069H.b, 5.3.10).

Zero every ITT that comes from the pool. The ITS then no longer needs
the pages added to the pool zeroed, so drop __GFP_ZERO from their
allocation. A pKVM guest shares each new pool page with the host,
though, and pkvm_set_memory_decrypted() doesn't zero what it shares, so
the host now sees that page's old contents.

Fixes: b08e2f42e86b5 ("irqchip/gic-v3-its: Share ITS tables with a non-trusted hypervisor")
Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Reviewed-by: Zenghui Yu <yuzenghui@huawei.com>
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 drivers/irqchip/irq-gic-v3-its.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
index 5756ffe4ec13e..6eb2dbec5f0ed 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -270,10 +270,12 @@ static void *itt_alloc_pool(int node, int size)
 
 	do {
 		addr = gen_pool_alloc(itt_pool, size);
-		if (addr)
+		if (addr) {
+			memset((void *)addr, 0, size);
 			break;
+		}
 
-		page = its_alloc_pages_node(node, GFP_KERNEL | __GFP_ZERO, 0);
+		page = its_alloc_pages_node(node, GFP_KERNEL, 0);
 		if (!page)
 			break;
 
-- 
2.47.3


