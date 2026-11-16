Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9AD1606A321
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 02:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AeeYQtjz;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=CnY6IYo7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=ZkR5ltf4EA92amxJ4UvX2REcvWhX9X9ctWCrFGNdh74=; b=AeeYQtjzZTUOs3REwKsGaFJ0+j
	eYff+p5mj3z89CgOvSAChlQ3bUtXI+vXFCQZqGAURMZpyCTd0C1sM1etCbVC4lBQhkKrVHwVO0ydg
	cqStSGw6p5Lm5L84qy6FH/9K8c688aCqfE4EbAbDWoS5mOW+NDUJrI5N/mND4wxojxU8RlMPATjNY
	akoBRkeSvXp7sBZ6Zr6bvZj755dNvp2uWKKhNkv69U9XQwdvzd28NADi1euMoEGtcrpbH+kBSJ3M4
	LrkJ4ilHXYN3AZX3UV2nS8G4j83OKOjNlXoO/CHDiZNg8EN4ZPkynxylGbd2PIJYyMUkUohLWSIpC
	GwVpNKLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSmO6-00000000vou-2zt3;
	Mon, 16 Nov 2026 02:24:06 +0000
Received: from canpmsgout07.his.huawei.com ([113.46.200.222])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSmO2-00000000vnl-37Wp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 02:24:05 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=ZkR5ltf4EA92amxJ4UvX2REcvWhX9X9ctWCrFGNdh74=;
	b=CnY6IYo7feReTTm3+150hWXDoFEnHqfHvrhP1qU6jOyVsi+mbRRzj2amG0eC6UnTb4JzGp9MK
	IyOo47sQC2NwPNhDf/JWRpT7a1ZlS8XuR6nOTVzwfU5XZ1pTm6cHW3CBFSXLk7JorWaiPpgt9vf
	oehjQFag6QAGyYe2bmN8i90=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4jSWr82GMSzLlYQ;
	Mon, 16 Nov 2026 10:23:36 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 743AE4048B;
	Mon, 16 Nov 2026 10:23:54 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 16 Nov
 2026 10:23:53 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <maz@kernel.org>, <tglx@kernel.org>, <radu@rendec.net>,
	<jason@lakedaemon.net>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH] irqchip/gic-v3-its: Size the collection table for all possible CPUs
Date: Mon, 16 Nov 2026 10:23:30 +0800
Message-ID: <20261116022330.273840-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_182403_126500_5FDC370C 
X-CRM114-Status: GOOD (  12.12  )
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

The ITS collection table is sized from the hardware default described by
GITS_BASER: a single ITS page holding entry-size objects.  With the usual
16-byte collection entry and a 4K ITS page that is 256 collections.

its_cpu_init_collections() installs one collection per CPU using MAPC with
the CPU number as the collection ID, so on a system with more than 256
possible CPUs the MAPC commands for the remaining CPUs fail with
E_ITS_MAPC_COLLECTION_OOR (0x010903) and their redistributors end up
without a valid collection.  LPIs targeted at those CPUs, which is where
managed MSI/MSI-X affinity places a large part of the device interrupts,
are then dropped by the hardware: the DMA completes but the completion
interrupt never arrives, so drivers fall back to polling and time out.

On a 384-CPU HiSilicon HIP12 system running v7.4-rc2 every ITS reported

  ITS@0x488000000: allocated 256 Interrupt Collections (flat, esz 16, psz 4K, shr 1)

and all four NVMe controllers logged repeated

  nvme nvme0: I/O tag 256 (1100) QID 182 timeout, completion polled

while the hinic driver failed to probe with -EIO.  With the table sized
for num_possible_cpus() it holds 512 entries and both symptoms are gone.

Handle GITS_BASER_TYPE_COLLECTION in its_alloc_tables() the same way as
the device and VCPU tables, requesting order_base_2(num_possible_cpus())
IDs.

Fixes: 1ac19ca6bf97 ("irqchip: GICv3: ITS: tables allocators")
Cc: stable@vger.kernel.org
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/irqchip/irq-gic-v3-its.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
index c952c069f937..319b6edefd37 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -2716,6 +2716,21 @@ static int its_alloc_tables(struct its_node *its)
 			indirect = its_parse_indirect_baser(its, baser, &order,
 							    ITS_MAX_VPEID_BITS);
 			break;
+
+		case GITS_BASER_TYPE_COLLECTION:
+			/*
+			 * Size the collection table for every possible CPU.
+			 * One collection per CPU is installed via MAPC with
+			 * col_id == cpu, so a table sized only for the
+			 * hardware default page (e.g. 256 entries with
+			 * esz 16 / psz 4K) is too small on systems with more
+			 * CPUs than that: MAPC for the remaining CPUs fails
+			 * with E_ITS_MAPC_COLLECTION_OOR and LPIs targeted at
+			 * those CPUs are never delivered.
+			 */
+			indirect = its_parse_indirect_baser(its, baser, &order,
+							    order_base_2(num_possible_cpus()));
+			break;
 		}
 
 		err = its_setup_baser(its, baser, cache, shr, order, indirect);
-- 
2.34.1


