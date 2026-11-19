Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8EC0606A320
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 07:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yaaFLeqB;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=kb10qA8f
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=GnODKpOKYkb1iTCbBG4IPOuP50k3iuM6bl6HF33WrpM=; b=yaaFLeqBtQbf3FCyLwCgL7eQ56
	wdDqSG1Rnbf4/n2isNp07d00NNQnJQcbKr8ezX7sf+eLIoO0wGD5j+O58Ps9SAOpuAw4yj37KL1tb
	To3n6bqO9i79fUCb9yOxjKx2Fizk5DT7CZPsIfgdlU2kgYUXbp/dkCazELMvUtQx3JLRBLlC1pp25
	Kb2Fwpg6235Sk0xUy2eqzwjlRSKbeYkvOp6CNIyfLa2gksTRe9vFayzBCDvMwr4q9nXkLBRn2NgZT
	ZIznOeU2M5v5298TXnx+hH5i7tdY4O8SPdjbCyGcpNZwJTug8s8wsbTuY0xZdhbMy8l2zrd98+Y6E
	HGoLtcHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTwyU-0000000B75D-3rj2;
	Thu, 19 Nov 2026 07:54:30 +0000
Received: from canpmsgout05.his.huawei.com ([113.46.200.220])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTwyR-0000000B74C-2ZNI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 07:54:29 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=GnODKpOKYkb1iTCbBG4IPOuP50k3iuM6bl6HF33WrpM=;
	b=kb10qA8fV7tiwaVBRx4EQFfagY7kGymSdzV5lNF8O6mXJ2UIb39siiKV2dxRZc624c5abc6cF
	BG7zJVUZdEuhgQ8kdrU60tiDEzNqC8TFpHpAMgSkhql5F4uZe1bKOTUzfeiFdRH6VfqZxVx3Yb/
	2xmw7nRgu5RrnPbOPO3PcVM=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4jVW1J51KJz12LGc;
	Thu, 19 Nov 2026 15:53:24 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 66C4C4057A;
	Thu, 19 Nov 2026 15:54:16 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 19 Nov
 2026 15:54:15 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <maz@kernel.org>, <tglx@kernel.org>, <radu@rendec.net>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<zenghui.yu@linux.dev>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v4] irqchip/gic-v3-its: Size the collection table for nr_cpu_ids
Date: Thu, 19 Nov 2026 15:54:05 +0800
Message-ID: <20261119075405.774417-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_235428_343563_BD82E37C 
X-CRM114-Status: GOOD (  21.34  )
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

The collection table is currently sized at a single ITS page size,
while the driver allocates one collection per CPU indexed by logical
CPU number. On systems with more CPUs than fit in a single page, no LPI
can be routed to the excess CPUs and the system grinds to a halt.

Change the allocation policy to size the collection table for nr_cpu_ids
entries and allow two-level tables, matching the device and VCPU tables.

Because Level-2 tables of an indirect table are normally allocated on
demand and nothing calls its_alloc_table_entry() for collections,
populate all Level-2 tables upfront in its_alloc_collections() while
sleepable allocations are still permitted, and free them in
its_free_tables().

Suggested-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
v4:
- Size the table from nr_cpu_ids, not num_possible_cpus().
- Populate the Level-2 tables of an indirect collection table, and
  free them alongside the Level-1 one.
- Link to v3: https://lore.kernel.org/all/20261118025106.623070-1-ruanjinjie@huawei.com/
v3:
- Bail out on a BASER type the architecture does not define.
- Add Suggested-by.
- Link to v2: https://lore.kernel.org/all/20261117123116.591621-1-ruanjinjie@huawei.com/
v2:
- Cleanup the similar calls of its_parse_indirect_baser() (Marc).
- Simplfy the commit message (Marc).
- Drop fix tag and comment (Marc).
- Link to v1: https://lore.kernel.org/all/20261116022330.273840-1-ruanjinjie@huawei.com/
---
 drivers/irqchip/irq-gic-v3-its.c   | 74 ++++++++++++++++++++++++------
 include/linux/irqchip/arm-gic-v3.h |  2 +
 2 files changed, 63 insertions(+), 13 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
index c952c069f937..50308af8936f 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -67,6 +67,9 @@ static u32 lpi_id_bits;
 
 static u8 __ro_after_init lpi_prop_prio;
 static struct its_node *find_4_1_its(void);
+static struct its_baser *its_get_baser(struct its_node *its, u32 type);
+static bool its_alloc_table_entry(struct its_node *its,
+				  struct its_baser *baser, u32 id);
 
 /*
  * Collection structure - just an ID, and a redistributor address to
@@ -2601,16 +2604,43 @@ static struct its_node *find_sibling_its(struct its_node *cur_its)
 	return NULL;
 }
 
+static void its_free_l1_entries(struct its_baser *baser)
+{
+	__le64 *table = baser->base;
+	u32 i, nr_entries;
+
+	if (!(baser->val & GITS_BASER_INDIRECT))
+		return;
+
+	nr_entries = PAGE_ORDER_TO_SIZE(baser->order) / GITS_LVL1_ENTRY_SIZE;
+
+	for (i = 0; i < nr_entries; i++) {
+		u64 entry = le64_to_cpu(table[i]);
+
+		if (entry & GITS_LVL1_ENTRY_VALID)
+			its_free_pages(phys_to_virt(entry & GITS_LVL1_ENTRY_ADDR),
+				       get_order(baser->psz));
+		table[i] = 0;
+	}
+}
+
 static void its_free_tables(struct its_node *its)
 {
 	int i;
 
 	for (i = 0; i < GITS_BASER_NR_REGS; i++) {
-		if (its->tables[i].base) {
-			if (!its->tables[i].shared)
-				its_free_pages(its->tables[i].base, its->tables[i].order);
-			its->tables[i].base = NULL;
+		struct its_baser *baser = &its->tables[i];
+		u64 type = GITS_BASER_TYPE(baser->val);
+
+		if (!baser->base)
+			continue;
+
+		if (!baser->shared) {
+			if (type == GITS_BASER_TYPE_COLLECTION)
+				its_free_l1_entries(baser);
+			its_free_pages(baser->base, baser->order);
 		}
+		baser->base = NULL;
 	}
 }
 
@@ -2682,7 +2712,7 @@ static int its_alloc_tables(struct its_node *its)
 		u64 val = its_read_baser(its, baser);
 		u64 type = GITS_BASER_TYPE(val);
 		bool indirect = false;
-		u32 order;
+		u32 order, nr_ids;
 
 		if (type == GITS_BASER_TYPE_NONE)
 			continue;
@@ -2696,8 +2726,7 @@ static int its_alloc_tables(struct its_node *its)
 
 		switch (type) {
 		case GITS_BASER_TYPE_DEVICE:
-			indirect = its_parse_indirect_baser(its, baser, &order,
-							    device_ids(its));
+			nr_ids = device_ids(its);
 			break;
 
 		case GITS_BASER_TYPE_VCPU:
@@ -2713,11 +2742,21 @@ static int its_alloc_tables(struct its_node *its)
 				}
 			}
 
-			indirect = its_parse_indirect_baser(its, baser, &order,
-							    ITS_MAX_VPEID_BITS);
+			nr_ids = ITS_MAX_VPEID_BITS;
 			break;
+
+		case GITS_BASER_TYPE_COLLECTION:
+			nr_ids = order_base_2(nr_cpu_ids);
+			break;
+
+		default:
+			pr_err("ITS@%pa: BASER%d has invalid type 0x%llx\n",
+			       &its->phys_base, i, type);
+			its_free_tables(its);
+			return -ENXIO;
 		}
 
+		indirect = its_parse_indirect_baser(its, baser, &order, nr_ids);
 		err = its_setup_baser(its, baser, cache, shr, order, indirect);
 		if (err < 0) {
 			its_free_tables(its);
@@ -2885,7 +2924,7 @@ static bool allocate_vpe_l2_table(int cpu, u32 id)
 		if (!(val & GICR_VPROPBASER_SHAREABILITY_MASK))
 			gic_flush_dcache_to_poc(page_address(page), psz);
 
-		table[idx] = cpu_to_le64(page_to_phys(page) | GITS_BASER_VALID);
+		table[idx] = cpu_to_le64(page_to_phys(page) | GITS_LVL1_ENTRY_VALID);
 
 		/* Flush Lvl1 entry to PoC if hw doesn't support coherency */
 		if (!(val & GICR_VPROPBASER_SHAREABILITY_MASK))
@@ -3025,6 +3064,7 @@ static int allocate_vpe_l1_table(void)
 
 static int its_alloc_collections(struct its_node *its)
 {
+	struct its_baser *baser;
 	int i;
 
 	its->collections = kzalloc_objs(*its->collections, nr_cpu_ids);
@@ -3034,6 +3074,15 @@ static int its_alloc_collections(struct its_node *its)
 	for (i = 0; i < nr_cpu_ids; i++)
 		its->collections[i].target_address = ~0ULL;
 
+	baser = its_get_baser(its, GITS_BASER_TYPE_COLLECTION);
+	if (!baser || !(baser->val & GITS_BASER_INDIRECT))
+		return 0;
+
+	for (i = 0; i < nr_cpu_ids; i++) {
+		if (!its_alloc_table_entry(its, baser, i))
+			return -ENOMEM;
+	}
+
 	return 0;
 }
 
@@ -3395,7 +3444,7 @@ static bool its_alloc_table_entry(struct its_node *its,
 		if (!(baser->val & GITS_BASER_SHAREABILITY_MASK))
 			gic_flush_dcache_to_poc(page_address(page), baser->psz);
 
-		table[idx] = cpu_to_le64(page_to_phys(page) | GITS_BASER_VALID);
+		table[idx] = cpu_to_le64(page_to_phys(page) | GITS_LVL1_ENTRY_VALID);
 
 		/* Flush Lvl1 entry to PoC if hw doesn't support coherency */
 		if (!(baser->val & GITS_BASER_SHAREABILITY_MASK))
@@ -5305,7 +5354,7 @@ static int __init its_probe_one(struct its_node *its)
 
 	err = its_alloc_collections(its);
 	if (err)
-		goto out_free_tables;
+		goto out_free_collection;
 
 	baser = (virt_to_phys(its->cmd_base)	|
 		 GITS_CBASER_RaWaWb		|
@@ -5356,7 +5405,6 @@ static int __init its_probe_one(struct its_node *its)
 
 out_free_collection:
 	kfree(its->collections);
-out_free_tables:
 	its_free_tables(its);
 out_free_cmd:
 	its_free_pages(its->cmd_base, get_order(ITS_CMD_QUEUE_SZ));
diff --git a/include/linux/irqchip/arm-gic-v3.h b/include/linux/irqchip/arm-gic-v3.h
index ea5fd2374ebe..9792d2052d6d 100644
--- a/include/linux/irqchip/arm-gic-v3.h
+++ b/include/linux/irqchip/arm-gic-v3.h
@@ -493,6 +493,8 @@
 #define GITS_BASER_TYPE_RESERVED7	7
 
 #define GITS_LVL1_ENTRY_SIZE           (8UL)
+#define GITS_LVL1_ENTRY_VALID          (1ULL << 63)
+#define GITS_LVL1_ENTRY_ADDR           GENMASK_ULL(51, 12)
 
 /*
  * ITS commands
-- 
2.34.1


