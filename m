Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DEEB606A329
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 12:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RuukeNPQ;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=6OI71rL0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=2YE/RceU1BDrUGj03KVYMBZ/+cla8lPDeG78rZvZ+NI=; b=RuukeNPQNZMf9V9RoYOckxi5sl
	OCRaHqQJ64bFIQQSvuaJX/4/NbeZcZKLhBHnNwlTJt8eOxYUh5kmi03+4l4dBbotaXORqBkH2rbLt
	jbbyiZwhITnLr9f0XfDJ15UV6bgUkBhENK871Bq7BWD602fTBlH0ockb9fVwqcqgMNPUeQjRs6PSB
	vbiTTNNSb8amVu2YjXJghKSBbyAjkW1CXM21vwykZTy9JTHy7NPUYGUJSEwzyTifdswNK0TitVehu
	W96P/aUg0/jtQDuZJ4yQng55SL8kMwACRqFZ+Ag/oMl0Y977WuDXSnoi0+sZg5tC80dhKB9RtkKU7
	WluE1tDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTILX-00000005dCI-2VKX;
	Tue, 17 Nov 2026 12:31:35 +0000
Received: from canpmsgout06.his.huawei.com ([113.46.200.221])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTILU-00000005dBQ-1qwn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 12:31:34 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=2YE/RceU1BDrUGj03KVYMBZ/+cla8lPDeG78rZvZ+NI=;
	b=6OI71rL0RN45D+2CBfhLv98JGQUKCc2nx0isLeQRxf8r6ERJPK+ReoiY+L05GjMXiuloDCk8r
	ea+ImJUJDiRuvvdQKO1ukQWNPFOShOGOdRnPQ1xlSOTdyUkDS/TtYYFusHwWf2pGqYA81+sFbZx
	kt70sEGchJoGC8EoaCPVq3U=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4jTPGk56JZzRhXK;
	Tue, 17 Nov 2026 20:31:10 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id BD320203AB;
	Tue, 17 Nov 2026 20:31:24 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 17 Nov
 2026 20:31:24 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <maz@kernel.org>, <tglx@kernel.org>, <radu@rendec.net>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v2] irqchip/gic-v3-its: Size the collection table for all possible CPUs
Date: Tue, 17 Nov 2026 20:31:16 +0800
Message-ID: <20261117123116.591621-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_043132_650627_143B418E 
X-CRM114-Status: GOOD (  13.11  )
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
and the driver's allocation policy is to allocate a single collection
per CPU. On systems with more CPUs that the ITS can fit in a single
page, no LPI can be routed to the CPUs that don't have an allocated
collection, and the system grinds to a halt.

Change the allocation policy to allow two-level tables, similarly to
the other tables.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
v1 -> v2:
- Cleanup the similar calls of its_parse_indirect_baser() (Marc).
- Simplfy the commit message (Marc).
- Drop fix tag and comment (Marc).
- Give nr_ids a default for unrecognised BASER types.
---
 drivers/irqchip/irq-gic-v3-its.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
index c952c069f937..41cd359e52a7 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -2682,7 +2682,7 @@ static int its_alloc_tables(struct its_node *its)
 		u64 val = its_read_baser(its, baser);
 		u64 type = GITS_BASER_TYPE(val);
 		bool indirect = false;
-		u32 order;
+		u32 order, nr_ids;
 
 		if (type == GITS_BASER_TYPE_NONE)
 			continue;
@@ -2696,8 +2696,7 @@ static int its_alloc_tables(struct its_node *its)
 
 		switch (type) {
 		case GITS_BASER_TYPE_DEVICE:
-			indirect = its_parse_indirect_baser(its, baser, &order,
-							    device_ids(its));
+			nr_ids = device_ids(its);
 			break;
 
 		case GITS_BASER_TYPE_VCPU:
@@ -2713,11 +2712,19 @@ static int its_alloc_tables(struct its_node *its)
 				}
 			}
 
-			indirect = its_parse_indirect_baser(its, baser, &order,
-							    ITS_MAX_VPEID_BITS);
+			nr_ids = ITS_MAX_VPEID_BITS;
+			break;
+
+		case GITS_BASER_TYPE_COLLECTION:
+			nr_ids = order_base_2(num_possible_cpus());
+			break;
+
+		default:
+			nr_ids = 0;
 			break;
 		}
 
+		indirect = its_parse_indirect_baser(its, baser, &order, nr_ids);
 		err = its_setup_baser(its, baser, cache, shr, order, indirect);
 		if (err < 0) {
 			its_free_tables(its);
-- 
2.34.1


