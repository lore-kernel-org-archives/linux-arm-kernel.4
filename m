Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDCEF606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 10:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1ltJTOdg;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=efdoQU1Q
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=6uf3MBc3V2g1zBvM6rT+T4LoTTN981m1+NShEL0RYGU=; b=1ltJTOdgRZL59d
	w7W5bYfc+GON1ajkfA71SwgF4dT3R450uzd1NhBemmv2IVT9WbI2JjWMMnE2NnxK1E5KbVUWkMG33
	ismqPAIJGfDXP+J+yoHpZeO9+aqQUYxae9xSVZwtxGEn5uCoDfWFLOAKdbtGAUXNRZr8pfMjw23rG
	Io9S8WirgMSrDtDRZMkeoKeeaYX3Cvbc4EsGalI87i/U1QQ/EF8PpdX+ggF0HeGR3Zc5ZPgmF7L90
	rUE6zAFAJ/zF9p7mNjH6FrqmgK9VOBovPPoWp7EBVZ30SbcWhx/373lSzEWB2LmXfZDnruL3fGCBP
	RTQg4KixTZM+RVJMmVsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQCx-00000002gGU-4B0X;
	Mon, 23 Nov 2026 09:19:32 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQBA-00000002flE-2O6W
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 09:17:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pPLwAnJ7MFeGQ+BKnepyDZHwuaZv58mn43JL02nvD39/AFbD3u0hoBluHCsQr6IQ8djGRF3dqcqWprE26092kZxmIA0He8Ca9jf+SX8PU0KS0XDrz6sTaB9S8t3ZoSJ5Eb57H9stTrgPwCiU8NH2dnXv/AdxAvM7nFfrTstuIy6mRpVd6zDhIBhQW/ZK8FbKYRqJT1AzYXW2qU0KK20ni5YcCe1L2jvVxDFdfaqo1vQPnIcgtvRDJKpixz6uV81xEWXL9DH6TlXmsVv9Ju1I4y7uMLbY+P4BTf1Taquc/9IF215Kh/zAzxn/rNlah90Q9RLI4FU2w/ugBjeClwirnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6uf3MBc3V2g1zBvM6rT+T4LoTTN981m1+NShEL0RYGU=;
 b=x5h9/hOXqOEWbyvXek2793Hm1un/lh/ouGFDwJt6oohapkklUJKEGrX+ejiHfzQmyItczVrLgjwMq4fjwbatwvwTm7qDp87LZjh5oWcv9/EsFtq7MGKbThAmHYnay+EMrxHKCpwzatHepsbDjaOJ9EliQ3yiHLBVBudhggEy2pKhtIQZSKq5mHUFFW2CyvqcLbIJyBFS9PC0KlEq73Y3n8q08e9Pe2/dQtcN3coC9EvRvhyZD8ycuHSuaCdpiD/1wBXc24P83K88g9PepSgD38z6YWHujeeaObKREsfNoiH9fTcytBEH2PL3BNWD7a6ajNWL/VFh2E9Yplb79J9Atw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6uf3MBc3V2g1zBvM6rT+T4LoTTN981m1+NShEL0RYGU=;
 b=efdoQU1QgYD+c3oZHiLMkdZrSJ7wN9wzj6xoTN/vXOQznt6lS0JzmTf710uwjjk+srRh7bQD/u3KMQZvXzNCcy5D61PP0TP1K8buFj4z+xcoffVwYRRwGmteWrvOcxcwyt5w25etvYKpy7e0yoerRSUENJg74jiMH2ixt0LoBmEabEqVaOSt81wkJksSlbw3znuH4trSTBXKJfdfghnFO3EoxDvqxqI9t3SKAxpH6/ltIuB7LVPD4E8jqv2XJ7aDUZ2nnrSKo6giHMGu5jHIgHM97YkZn9U+vTalnwEzp9kGL9yheWtNR7ng8geJTxvjobRoFSPewqMzc6qCqlSsrg==
Received: from VI1PR07CA0273.eurprd07.prod.outlook.com (2603:10a6:803:b4::40)
 by PA1PR10MB9201.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:4eb::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.3; Mon, 23 Nov
 2026 09:17:22 +0000
Received: from ZR1PEPF0000E6BB.eurprd07.prod.outlook.com
 (2603:10a6:803:b4:cafe::17) by VI1PR07CA0273.outlook.office365.com
 (2603:10a6:803:b4::40) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.5 via Frontend Transport; Mon, 23
 Nov 2026 09:17:22 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 ZR1PEPF0000E6BB.mail.protection.outlook.com (10.167.241.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Mon, 23 Nov 2026 09:17:22 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Mon, 23 Nov
 2026 10:18:26 +0100
Received: from localhost (10.48.87.222) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 23 Nov
 2026 10:17:21 +0100
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
Date: Mon, 23 Nov 2026 10:17:07 +0100
Subject: [PATCH v2 3/4] dmaengine: stm32-dma3: validate LLI pool
 allocations and fix cleanup
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261123-dma3-fixes-v2-3-0a5b013f79d2@foss.st.com>
References: <20261123-dma3-fixes-v2-0-0a5b013f79d2@foss.st.com>
In-Reply-To: <20261123-dma3-fixes-v2-0-0a5b013f79d2@foss.st.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>, =?utf-8?q?Am=C3=A9lie_Delaunay?=
	<amelie.delaunay@foss.st.com>
CC: <dmaengine@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<stable@vger.kernel.org>
X-Mailer: b4 0.16.0
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZR1PEPF0000E6BB:EE_|PA1PR10MB9201:EE_
X-MS-Office365-Filtering-Correlation-Id: c6e05402-bbf3-46ae-5b53-08df494294db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|23010399003|18002099003|22082099003|6133799003|261009223027099003|11063799006|56012099006|261102124527099003|261102123227099003|261021123027099003|261021121427099003|261028144727099003|261022075727099003|261026140227099003|261022105027099003|261026121527099003|10067099003;
X-Microsoft-Antispam-Message-Info: 4lgtPJLXx2n4lRh0pHu2YK0oApKov9iDp2CyKXZ6JM5m10dHX599LxBeQZc1u7cRRs1HUpjJZ536WXqP1G89cddTtr8DC+Ej7FWmXsZNcRJDWZtUOhkdCyC32GEBv+QIIU+xHuL+BK8qYJXN8JONyL5sQQNsKuz36h0RY3v+anNkk5zbMgueq0NcxfQx3+XRhQx4ZolAqZcead+rRvyJa3a0AW4XphD1h/vOGK9rsjUFCEngQnMubxYIjV/YfqqXeCjP+j213V2BkM7aIziTL5E+tcQLl2RPI0AOOjroWaRsj1TlUSEJH3Rjz0GuOvXT6B07VKgXJExUYAlipWNEn1BucPq7rrDU+u+Ute++qZbiUBUuZnKDua/t++rcixbKhQ/CTmuhdp6BKi2YbfeHriRXCn3juWuJ5KqNmckVS5xtIFbIH1UCdjsKlO3Le8k8EDJvAB7hfWiJ5/Gey1wNgU8eeFyZOHQ6MRWI/YXilcdPMz/969TnAQSl8ucYtyCthiBUEO7AYi6nWE8CVpmkitNX0nXRb2HFyBlCGa3imWfKVz0vh0mFJR/hwtOhRpNk5wNQa5HEzUsVbyuBOj/Meu94m6m3/sIzzhBV84tpSB6hjMhyg3D+FK5/pDvHGt0R+Y0tbcxsUlSljqq2nAw4Fg5ywP2NEHQO2SCSmp8I6EBN88Zh9DOVaHYSyUZ7xFev+pxux7kF3u5W9BQ4jw4NQg==
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(23010399003)(18002099003)(22082099003)(6133799003)(261009223027099003)(11063799006)(56012099006)(261102124527099003)(261102123227099003)(261021123027099003)(261021121427099003)(261028144727099003)(261022075727099003)(261026140227099003)(261022105027099003)(261026121527099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Rs9vkVWiGmFgWy4WZKHqDkZPo0yUAYjoLh9fSaurqYEVZieJCZYaOHzdJnvjaxVUMbDsgqS1G14OxcHlvw5E2C548yFp08ZKD74CoOi42zsaET+fNwEW3iEK1hV9HpTX21PbuxAcHPaabsyXys+sr4SFiOa+Li7xVPvgRLbXOhu4P25xuQYE9VUvwDWW0MJzD4oe+vAst6xr01mL/Gvu+IVTpMy63EatnhNIMY1LTlNflnuAx82Cgpzx3HR0KZahS0bddaNzX4+iiTojUNdISh6kd6ikE75TuTU4R0nL0F/3C4xSdnKlxhjk3vGjDy6ylej0fTahitZu1fcqV7qOBvnKtngLy4Filoo/c0YWHYCc6l2102SwcipAS15kXezadRtlhIGvmNTUwNHPIgT215Hn/fDZfoDHbBY6JIcLRfTK/h0W7yp0tmJh+MBK6Uop
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 09:17:22.3622
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c6e05402-bbf3-46ae-5b53-08df494294db
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: ZR1PEPF0000E6BB.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR10MB9201
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_011743_186768_B36C7D80 
X-CRM114-Status: GOOD (  16.25  )
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


