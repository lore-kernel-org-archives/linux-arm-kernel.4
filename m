Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55F2B606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 16:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dsS7ZhTU;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=2mU5GQlq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=FkwbwviojkM4gKR0Wj2UdEk1IhthcXzsco0vEBT+c3Y=; b=dsS7ZhTUIbE+WXg2Qod1oDPLWs
	UA08L8oPBWVNo11N+/gsZTGYmwwDMgDR9z8r+uaiV/MGPJSJYyvhmP1tal8pElPZK5cAMSiT7ZDbZ
	EjvQYdrX1gLk+LcCfJu8g8WUFk2PnRgDYTDjiHeEQ6F0l3TFhzXjtVR9695oTImUEJ5m6x13Aooo7
	yWxufC5JkL+pkE6AeKLnDMJFQFDsYfTJQ6hphfZ8IiSTXFp0vO1hh3eN1wyizfpQBfvXSVxBe7xn6
	5PtW45R4f9tFLANUvRR7LaDmsJ1ENOBzKKhu/VLzBqv0qWKWIb0tDHZXurLwNgg4iMTIP99H1CllJ
	dee5CH2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVX8H-00000004ET3-0DXG;
	Mon, 23 Nov 2026 16:43:09 +0000
Received: from mail-westus3azlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c107::1] helo=PH8PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVX8D-00000004ESG-3vGt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 16:43:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QWolYgO26gWeFlLGX44Jen1GudTtdhod9/KAC8cQhJxQOyuQmLUXZl2qroBQzgNHH1ly6+BAY532p3FN58P5TElDKda2iuie9A01FMhwcUSKYSk9JIjQKRyGfNxTn1MX5z6br6qXp1HRnKLAuIlp0WAu2O695pHluKLEXQITqkISjr5ARqTkZDzExS+JltnDRmNfOOQJtP5lnppjp/1woF2x/XYPf8IKRMS3iihT0dTVmRI4uVHg4+HVd4MAMRcsLhicAItiPRCRg+IvBXLgdBIvkI0L4nCjtp8v3Cnz+CSBJs5sHWDcPkaoJ7Sm1Lw4ZGQiiQxVlqxUKgPYRDCbDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FkwbwviojkM4gKR0Wj2UdEk1IhthcXzsco0vEBT+c3Y=;
 b=OX5q4WYc2dLRK5EDZSDcCU9ykm2WgzuILcLEbfoYlaU45nGqNwfCp2gBEgKHnF19AaqDHHEblMldVEKHfpmRw8ho/bIJtZtVhoCGI+PwJ3PKEcVqmeetyl8FaUP/FihIBHSBCqP8G93tSQ0Rpg+GBKY9YSc9C7dTADS5+krrt810pu6lrlQchm2+0wB+OAJZ5W8hQmfY5GswdbUVcittwWNkeqZv7XeHWTT1vfBAsBVhHwUmAsVc8HIQ8q99ZxaqfVcBKz0MF3fXny6GUJXXEjxccAjn3J7uw4radsVEei3Mz8f5YdWiYeT5awk6jFeG1bNChmeAlQKQWKJyFJR2vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lunn.ch smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FkwbwviojkM4gKR0Wj2UdEk1IhthcXzsco0vEBT+c3Y=;
 b=2mU5GQlqWVedpPiX8SfZGqFxRr4IVfJ5ehQKlF4KGC3t+9pbGVongLYdnp1q9h2SPtp0RLoDOobkZHlxdLvYKjjwlzN/ltam15grhVY5LFdNPwC80S5tmUXeZRF/waf1CDJawG3ePWOzS5xlEKlqF7KGDoQYLnc65GcrxM9POVA=
Received: from PH8PR22CA0014.namprd22.prod.outlook.com (2603:10b6:510:2d1::29)
 by SJ2PR12MB8883.namprd12.prod.outlook.com (2603:10b6:a03:538::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Mon, 23 Nov
 2026 16:42:59 +0000
Received: from BY1PEPF0001AE17.namprd04.prod.outlook.com
 (2603:10b6:510:2d1:cafe::93) by PH8PR22CA0014.outlook.office365.com
 (2603:10b6:510:2d1::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.14 via Frontend Transport; Mon,
 23 Nov 2026 16:42:59 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BY1PEPF0001AE17.mail.protection.outlook.com (10.167.242.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Mon, 23 Nov 2026 16:42:58 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 23 Nov
 2026 10:42:55 -0600
Received: from xhdsneeli40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Mon, 23 Nov 2026 10:42:52 -0600
From: Srinivas Neeli <srinivas.neeli@amd.com>
To: <radhey.shyam.pandey@amd.com>, <andrew+netdev@lunn.ch>,
	<davem@davemloft.net>, <edumazet@kernel.org>, <kuba@kernel.org>,
	<pabeni@redhat.com>, <michal.simek@amd.com>, <horms@kernel.org>
CC: <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <git@amd.com>
Subject: [PATCH net-next v2] net: xilinx: axienet: Derive RX frame length from residue in dmaengine path
Date: Mon, 23 Nov 2026 22:12:51 +0530
Message-ID: <20261123164251.48234-1-srinivas.neeli@amd.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE17:EE_|SJ2PR12MB8883:EE_
X-MS-Office365-Filtering-Correlation-Id: dd8a27e0-31a8-4c78-6f62-08df4980d503
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|36860700016|82310400026|1800799024|376014|261102123227099003|261026121527099003|261026140227099003|261022075727099003|261022105027099003|261028144727099003|261021121427099003|261021123027099003|11063799006|56012099006|10067099003|261009223027099003|18002099003|6133799003|13003099007|3023799007;
X-Microsoft-Antispam-Message-Info: mOG0yGFkax9pzAIkolMhn4iVmpZKbVxM3xT9VBqYhIqPG7gTYv9Dqfb9yYLifEf0ltNSB58b07t7ofiQw3mBVCumMsz2Vdh6VpeGNBJA2hsFV4QKDdvaPxsUuVbmLutknOyI088q7F2b7zYa1mdrzO92yLaUAK0cUXsFjt8rK2L4ub/wIEpbcZiXnyHnhKU41eoJx2moamKAJBDbkQ12U/+P0UprcoQL8WXsAmXkTUTuUwKknnrbfM2/V0Y62HyXNU+b+S2XSZhan+4Bnvzy1t+TY1o8Je9qDVWX4/itYwdfmqvv8rVNJMx4PoCnEuEGINF/a1OX2mnvl5rDjXms41PlZ2RnRby0JUxW8XMN2FNxn4f6i5JQtHQIrtaBYsTaAkcUNADGeys4RnkyNorfa+c5kLjTs0P3fLNwDBwNAVxgdB/uO46uYmySYvP6+u8DkTldL1QAyTI0aPl2PAkKtMaG8LmXi2sw0EXziS4dhoMjiMMzuDo+8eiGH9jv0dhL8Gpg8GzZ/BRriUdQaeSUhvZ05e7Qz78g3zSIi+BwhYFBKtAznK4rgBw0JMrtkuPvLgXUil8u1LT/e3Bwoot6qXLj0CAQbTyRRc46zWaPy11to0PJjk0G1Ay3aZ/fdxaiKJqDbxRdkyEw3Aea1gnV7XEgWxzdpT9w10KUHu/awP8=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(1800799024)(376014)(261102123227099003)(261026121527099003)(261026140227099003)(261022075727099003)(261022105027099003)(261028144727099003)(261021121427099003)(261021123027099003)(11063799006)(56012099006)(10067099003)(261009223027099003)(18002099003)(6133799003)(13003099007)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: NPGtpyWmRI6l5G7fZcJZ0G9eYTyeG3j3+bZlUhdXRlyreR7jhL55XUCJWZyenx+JQ8UzPeX1Y/ftKxf63AdNVe4chvRmJx7ZUbN75hb5k3OKuP4rIucjxPNRwhDD7UhGfCCV0oor/0fHvudIQXslwn+y0RRTLhSYKSm6XtDSJNC1z8mXLAWl+Ph0ir1PgqMDT9PkmbTnbRWbnI4RMcnIIMdAt+4AcHg037AaXktFubbNpoyAUTE+K9u4tLDdY730c67bIdWx5En1dhaDaXgkZtlioQPthJ7bYWlSF4ZSwkhj67gL+eGdGzKbxYhC9Nz0SZsXRRcaC94ywPFp5c+pljbnqZI48/QxAoptGaYu6yzRZg5Sd+MjBE6Ft/kv1yzxYDjZNlOd9AmlNkPmH/h54MKxDmHuB+XMCqmWTBLSPjMGvKCs99ULkPGkKiTO+pOh
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 16:42:58.7065
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dd8a27e0-31a8-4c78-6f62-08df4980d503
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF0001AE17.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8883
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_084306_106908_67FF6267 
X-CRM114-Status: GOOD (  17.43  )
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

The dmaengine RX path derived the received frame length from the descriptor
APP metadata. That only works when the optional AXI4-Stream status/control
interface is present, because the hardware populates the APP fields solely
when that interface is enabled. On designs without it the length read back
is invalid.

The AXI DMA engine already reports how many bytes it wrote into the buffer
through the standard dmaengine residue mechanism. Compute the RX frame
length as the posted buffer length minus result->residue, which is
independent of the status/control interface and correct across all designs,
including multi-descriptor frames where the residue is summed over the
chain.

Drop the descriptor metadata lookup, which was only used for this purpose.
Detect a failed transfer from dmaengine_result.result instead of the
metadata pointer return value, and remove the now unused LEN_APP macro.

The transmit path is unaffected. It still passes APP metadata for checksum
offload and derives its length from the skb.

Reviewed-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Signed-off-by: Srinivas Neeli <srinivas.neeli@amd.com>
---
Changes in v2:
- Refresh the patch against next-20261120 to address the reported
  git am failure. No intended change to the RX logic.
base-commit: 909ef7a9a30fa139e69e555e3606680f5cca7726

Apply failure reported in:
https://lore.kernel.org/lkml/20261123140311.GB31322@horms.kernel.org/

This patch was originally posted as part of the MCDMA series and can
be applied independently of the other patches in that series.
https://lore.kernel.org/lkml/20260818174151.1608971-4-srinivas.neeli@amd.com/
---
 drivers/net/ethernet/xilinx/xilinx_axienet_main.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
index 7e83c4b5f193..5b4998e2ca14 100644
--- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
+++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
@@ -55,7 +55,6 @@
 #define TX_BD_NUM_MAX			4096
 #define RX_BD_NUM_MAX			4096
 #define DMA_NUM_APP_WORDS		5
-#define LEN_APP				4
 #define RX_BUF_NUM_DEFAULT		128
 
 /* Must be shorter than length of ethtool_drvinfo.driver field to fit */
@@ -1219,30 +1218,27 @@ axienet_start_xmit(struct sk_buff *skb, struct net_device *ndev)
 static void axienet_dma_rx_cb(void *data, const struct dmaengine_result *result)
 {
 	struct skbuf_dma_descriptor *skbuf_dma;
-	size_t meta_len, meta_max_len, rx_len;
 	struct axienet_local *lp = data;
 	struct sk_buff *skb;
-	u32 *app_metadata;
+	size_t rx_len;
 	int i;
 
 	skbuf_dma = axienet_get_rx_desc(lp, lp->rx_ring_tail++);
 	skb = skbuf_dma->skb;
-	app_metadata = dmaengine_desc_get_metadata_ptr(skbuf_dma->desc, &meta_len,
-						       &meta_max_len);
 	dma_unmap_single(lp->dev, skbuf_dma->dma_address, lp->max_frm_size,
 			 DMA_FROM_DEVICE);
 	skbuf_dma->skb = NULL;
 
-	if (IS_ERR(app_metadata)) {
+	if (result->result != DMA_TRANS_NOERROR) {
 		if (net_ratelimit())
-			netdev_err(lp->ndev, "Failed to get RX metadata pointer\n");
+			netdev_err(lp->ndev, "RX DMA transfer failed\n");
 		dev_kfree_skb_any(skb);
 		lp->ndev->stats.rx_dropped++;
 		goto rx_submit;
 	}
 
-	/* TODO: Derive app word index programmatically */
-	rx_len = (app_metadata[LEN_APP] & 0xFFFF);
+	/* Actual length = posted buffer length - residue. */
+	rx_len = lp->max_frm_size - result->residue;
 	skb_put(skb, rx_len);
 	skb->protocol = eth_type_trans(skb, lp->ndev);
 	skb->ip_summed = CHECKSUM_NONE;
-- 
2.43.0


