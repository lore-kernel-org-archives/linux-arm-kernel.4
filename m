Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F833606A332
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 09:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LVxePSlU;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=NxUnyJNv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=6uf3MBc3V2g1zBvM6rT+T4LoTTN981m1+NShEL0RYGU=; b=LVxePSlUb6MONC
	1YKXSLWWBo3nKC7INn/tpg5prj05sY1FFmDpAHjQGr6cnvY68qdGmLucNH0z250tBsQMNhVB/OphF
	Pso+4Sbq6d0yrnX1z2DGl1d4VZgSXQzC32vAvsn/AGZiEH9y03ylGFnvvTHk/3NvzXa3o5K+62g1w
	bQMtQP3ylecarz6vHEghzP+DTelomgu0aUq8608hqzG2LTW05x9ArmeP1KMVwL6b2qWeIcFFpuoFF
	YMz9oiiQIBIae325bPVDxCL+UFuMkWllace9f9Ve39Yle55dw1dNU4eNrXt66xqHA7DSqaF0Zy2kP
	P2X2tTqE60w9OCqwnG5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUKlA-0000000EREg-0ksp;
	Fri, 20 Nov 2026 09:18:20 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUKl5-0000000ERDZ-40nb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 09:18:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fm4VdBBmDsL6u3dUOi8ACmunyfIvyzVCQxc6cI41azlIxOdhQsB9uORNit/jriv/T/ftYPy4poShTPgyMjBLE5UVRVIcebCn5StAZg5jr4mfv5YnOSPS78SpycAu9YzeBb3kTszJZvsANFPtJaqD9M3tfit4ftQmtxSWzw2Eog9mU9dYk23JSgeZGJmNnEYORBN3mWsCmNZZXaKRTH9vrDiLfKsnOTF4+uokBhKYHWalpmxHi6jAgDs1ph27Cji7erag2sYbv5S2A+g3l4379YwRSYVnNB9e9jxz7CVr+8l3j7gdESK88Fyk/06OrKh1drfNkWINhNxiBeiuQwgTUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6uf3MBc3V2g1zBvM6rT+T4LoTTN981m1+NShEL0RYGU=;
 b=WMxO77CfMFFLQoWbzAzPt+1589M3tEBinZbhdGEYmgKkzXndQFf301UlssMULscvRJmFnJtWiOUPpPHff7evzKO1dOJJD8kr8666OGCrtaOt75hFUddFmHEDh8ziKQJvsappvschcztbVY1lzkj5QaklqKyQQ7svNITQ7fy25VtoPB1AwMVsDbTZ99HUU8Y0RHkavKz1XvVZzyJ70peQaOQW828Ri0mu4Jd0uhQ+LqWj3Xr/WdIEirTE/DTwg8sR+ajKt/lVfNqbBizJSTghGlH/jnA4ctq4SYq2tNkSu8ztVyjSpGbqYz/RoEnUkg9msCqwUOe4VJjankNpVmeXbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6uf3MBc3V2g1zBvM6rT+T4LoTTN981m1+NShEL0RYGU=;
 b=NxUnyJNv/7X7CXbUR08IE8BOD9KnahLmS3Aoa7cjwn12bKzZ2FDzC/SYEYrKEqIvMzW5abFw2uY/PwF3hrOBg3F/DB8P5+h2tIbmBsJab/HEwegAiETeQt/Ll1++ZK6MATp5n5GSKZVdCcktfWuVccQ3eszMltVn1r5hF9k2I9nV7QcfT8tPvmf6RzdH9YUL3eheH8MbqXTY4GrOh4Qf1KZ8nSZr2+wW05u6Ip3xPyPJqRcsauCpsAyqt9DrPlCDk2degR4I9EZDYr4JS/LjpM58jmtFZTc0apvfExKGUP866M0ZOWfUsQuT621CsobS4GwDXUn6hhwbcUv3NDBiHw==
Received: from DUZPR01CA0265.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b9::15) by AMBPR10MB9814.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:722::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.1; Fri, 20 Nov
 2026 09:18:09 +0000
Received: from MAD0EPF000008A8.eurprd04.prod.outlook.com
 (2603:10a6:10:4b9:cafe::7f) by DUZPR01CA0265.outlook.office365.com
 (2603:10a6:10:4b9::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.12 via Frontend Transport; Fri,
 20 Nov 2026 09:18:08 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 MAD0EPF000008A8.mail.protection.outlook.com (10.167.241.180) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Fri, 20 Nov 2026 09:18:08 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Fri, 20 Nov
 2026 10:19:10 +0100
Received: from localhost (10.48.87.222) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 20 Nov
 2026 10:18:07 +0100
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
Date: Fri, 20 Nov 2026 10:18:03 +0100
Subject: [PATCH 3/4] dmaengine: stm32-dma3: validate LLI pool allocations
 and fix cleanup
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261120-dma3-fixes-v1-3-f29c1f437399@foss.st.com>
References: <20261120-dma3-fixes-v1-0-f29c1f437399@foss.st.com>
In-Reply-To: <20261120-dma3-fixes-v1-0-f29c1f437399@foss.st.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>
CC: <dmaengine@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Amelie Delaunay <amelie.delaunay@foss.st.com>, <stable@vger.kernel.org>
X-Mailer: b4 0.16.0
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAD0EPF000008A8:EE_|AMBPR10MB9814:EE_
X-MS-Office365-Filtering-Correlation-Id: 4dd6d878-6286-4208-119c-08df46e73158
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|36860700016|82310400026|376014|1800799024|261022075727099003|10067099003|261026121527099003|261026140227099003|56012099006|11063799006|261021121427099003|261021123027099003|261022105027099003|261102123227099003|261009223027099003|261102124527099003|261028144727099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: 63VmWXk6cPc8RxYFAb2RieEd4Q1BxwHjIzMoVcuyKrXXo6BSAo/mC37nuxZVp2HY9Im/IScRYhjSomoc3yIcHGaFNHubByZtKTWYyCqAlYEqE2XVZCQ3JC4mQff/9dbxzdEzUEm7oyBIUFym/YkJZFOyMEQwO7tnU6v5fCTUMMeInrhhY2vor3nG5OK9rQbiLJCW32R4ieXRU60wNy6A1U/i9gQ7dEdIkkJV9mU+NLGC3cfEAxQhVq8YbaFoqtRYv76RzWlHG/ljue8SJdQZVA0XV5jz5mm2gINN2pOLeP/qMd+ClQbccmyRU97BHuKutv/sPL0pucwWXJv5+Z4YE2RqMwLiijAcr3UEb/q4Z13tqo3s6X0LwGa5JjVyDDdbVurGVwJGmcx9B6NI79qReQ6gr/DgCFROaq4D6QdnhZRSik6kmaDzJAA90L8GCHEUfZzFwM6cBu5sxZcBARDDkbsApwqkyaHdgeQogKif3IJ4RyWh2yhPj8S5ByvXi0FxvggTWNGJ4rapY0lv3jsfamhxAucJfwFTURX1it3PkjVSX9wgNKxoa4Q8z/3dqIUVxCx2UhhmlpfRzsXLWHRwPwTdox3GQIj+OgMTs3iy4WtQBpLaDoDzZC+HssnA4UH3jdoTn5NhEyfxs7GLU54j7yV/n4jRFF3re3BHMe/ErODB6fFkgZVK6p5sr5wo88d9U9C5h9x7F0l/49WSsuScQQ==
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(376014)(1800799024)(261022075727099003)(10067099003)(261026121527099003)(261026140227099003)(56012099006)(11063799006)(261021121427099003)(261021123027099003)(261022105027099003)(261102123227099003)(261009223027099003)(261102124527099003)(261028144727099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: IRjPrxm2z4j4IaXN5DLTnvNLsGw/ygU1K9asqxiQPQCvyTcLOsXqEw2qGOd+3eiaq4p1MBEOHoUDBswcrRh5e2NCpfAsHo5isBMsz23JR7QnuGnnTpaQ5G6WI+t1TRWENh21FHZfQy0+i6QqzplxaxHNMxZfY+KEa7DSU7IKFQtorKsjzgW2rLyVcCqqGHP4EjBi4cjWJmXJPdyXlMVTb3nM987dqOyP+lUQznQe0sKqDiKcMKGELK83507nENfPGWDKVS4GljojEqHeOHcXzObsmvbd6OLdlqwlgtMbaqLw6xlkBFluVayq36XMlexK5qSnCzcAO28AjH+fkjyq+0nU2vBUD6V2epudLLWJvck5Q9aDZ7m8nRwzBE7QK/sHJCQXnbknmNNDw8I0rJozzuxCg1nA3ORfw06uSXlAm6dom0VATdQ8FXFkNGVfqsZT
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 09:18:08.7951
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dd6d878-6286-4208-119c-08df46e73158
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: MAD0EPF000008A8.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR10MB9814
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_011816_960092_2C7A4560 
X-CRM114-Status: GOOD (  15.94  )
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

All descriptors in a linked list must share the same 64 KiB address
window because CLBAR provides the common upper address bits. The DMA pool
boundary only constrains individual allocations, not the whole list, so
descriptors in a single list may be allocated from different pool pages in
different windows.

Check each descriptor's base address and reject lists that span multiple
windows, instead of letting the hardware fetch descriptors from wrong
addresses. Track the last allocated entry so that the error path frees
exactly the descriptors that were allocated, including the one that
failed the window check.

While at it, simplify the ccr initialisation, which is functionnaly
equivalent to the previous code.

Fixes: f561ec8b2b33 ("dmaengine: Add STM32 DMA3 support")
Cc: stable@vger.kernel.org
Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
---
 drivers/dma/stm32/stm32-dma3.c | 31 ++++++++++++++++++++++++++-----
 1 file changed, 26 insertions(+), 5 deletions(-)

diff --git a/drivers/dma/stm32/stm32-dma3.c b/drivers/dma/stm32/stm32-dma3.c
index a056f73fbe02..7c509a69f5e5 100644
--- a/drivers/dma/stm32/stm32-dma3.c
+++ b/drivers/dma/stm32/stm32-dma3.c
@@ -397,7 +397,8 @@ static void stm32_dma3_chan_dump_hwdesc(struct stm32_dma3_chan *chan,
 static struct stm32_dma3_swdesc *stm32_dma3_chan_desc_alloc(struct stm32_dma3_chan *chan, u32 count)
 {
 	struct stm32_dma3_swdesc *swdesc;
-	int i;
+	int i, last_alloc_idx = -1;
+	dma_addr_t base_addr = 0;
 
 	/*
 	 * If the memory to be allocated for the number of hwdesc (6 u32 members but 32-bytes
@@ -419,18 +420,38 @@ static struct stm32_dma3_swdesc *stm32_dma3_chan_desc_alloc(struct stm32_dma3_ch
 							&swdesc->lli[i].hwdesc_addr);
 		if (!swdesc->lli[i].hwdesc)
 			goto err_pool_free;
+
+		last_alloc_idx = i;
+
+		if (i == 0) {
+			base_addr = swdesc->lli[0].hwdesc_addr & CLBAR_LBA;
+			continue;
+		}
+
+		/*
+		 * dma_pool boundary=SZ_64K only guarantees that one allocation does not span a 64KB
+		 * boundary. It does not guarantee that all allocations of a given linked-list land
+		 * in the same 64KB address window required by CLBAR/CLLR addressing.
+		 */
+		if (base_addr != (swdesc->lli[i].hwdesc_addr & CLBAR_LBA)) {
+			dev_err(vchan_chan_dev(&chan->vchan), "LLI crosses a 64KB window (%pad)\n",
+				&swdesc->lli[i].hwdesc_addr);
+			goto err_pool_free;
+		}
 	}
-	swdesc->ccr = 0;
 
 	/* Set LL allocated port */
-	swdesc->ccr &= ~CCR_LAP;
+	swdesc->ccr = FIELD_PREP(CCR_LAP, 0);
 
 	return swdesc;
 
 err_pool_free:
 	dev_err(vchan_chan_dev(&chan->vchan), "Failed to alloc descriptors\n");
-	while (--i >= 0)
-		dma_pool_free(chan->lli_pool, swdesc->lli[i].hwdesc, swdesc->lli[i].hwdesc_addr);
+	while (last_alloc_idx >= 0) {
+		dma_pool_free(chan->lli_pool, swdesc->lli[last_alloc_idx].hwdesc,
+			      swdesc->lli[last_alloc_idx].hwdesc_addr);
+		last_alloc_idx--;
+	}
 	kfree(swdesc);
 
 	return NULL;

-- 
2.43.0


