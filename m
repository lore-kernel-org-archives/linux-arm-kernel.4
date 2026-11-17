Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 345F9606A8A1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 09:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Z3/6QYfP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=CYZRM522jsotT+mYGbZi/HF1GOonj0Msu3pPKcHltIQ=; b=Z3/6QYfPFmqFngSdUdb/jRDbHB
	1da7Glyc3JLahQPBf+1J0Zc+HTcMPifiMP8/O/An30DVB2KOZYAHk+KBXceCM8PyetVmp8PBO+mB7
	tasJzoMwXO6HevnauqW33KlJcYqPcLQ/eoI2N/z47J0F8oJIbjikB7FP3eSDZ2++ptjqe+eCE+uCS
	n7YDOQ3NnpxRAjTIwUFi86mjxmwA9SWWeQ30Y9NRJE7kt/MPVV9odZmGtpPruTlq8iIUPBBUAhH8v
	gi15j0lDYns6hi1FYd+Zyltbb/ri42ViFtfBzEdgdCq6GllgeXwdrswIQ64TaodDvu+QxZxTVEnEh
	Ve4ClHxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTFjM-0000000590v-3aPk;
	Tue, 17 Nov 2026 09:44:00 +0000
Received: from mail-koreacentralazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c40f::6] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTFjE-000000058sT-47u0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 09:43:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GJyHjbbOp9y/5E5wf3P4luw2P2vRuCNGf7mzyfX51O6fcrkVls0jsckLe3yxOp5kg8tExKVcncdXyFHJa/qOq3vcfeCdEGKQ4Th/wwwozWPcy+ssEV5V7p91rdl7j6LIj3rS8AmlJ66wtLmxT1WFI/URkRrWo9Pkm06I9EYnFAlwkkqBShRL2B44Vz9o0nFylk2nM7FNLxMzKTv86qSD2kLLtOnKwGcPRenyqwbfcL/Te1igkH1dEcKYC4sGaLwAkvtbj10/ptRV72SLhRScjZqiVT2hTCGRStOVjHLgRvKSC3Wg8vuvxbpR3uuktM32VtXka88c9z2KLiBK/8xkyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CYZRM522jsotT+mYGbZi/HF1GOonj0Msu3pPKcHltIQ=;
 b=ZUp38fb3MCYb86I3kM6/HrRF0U/IZuR1xZoCR/oOI/TnD3GIey+akN5+DckpxYYpKJ/qRccUJJSUHzllL89Cxn6RoAbhNsNVrwQpn1A7Kku6yWLDiLU21uMjUVh7DDZrNyIeDBL4n/UwDXmCq5Jwi/x98vn3QnRho03eMJSKNCNyJqescoPGCRbKfeXCy6ytkF3hF1Lk2BrrB7SX7ywauXGnS7TePvBWwqzZCFQQescaQ/L/z7Djy/MCff3gsbzp0cuz4ZdhrFPFsfXSZzOKXXDbmRqKZudVwEWlHv22eovJo/x87EN1HN6YIexn+NlPjJkl/U42NP/1UvoUvpZD4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from TY4P286CA0034.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:2b2::13)
 by TY1PPFB8C1195D3.apcprd06.prod.outlook.com (2603:1096:408::922) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.7; Tue, 17 Nov
 2026 09:43:44 +0000
Received: from TY2PEPF0000AB88.apcprd03.prod.outlook.com
 (2603:1096:405:2b2:cafe::3) by TY4P286CA0034.outlook.office365.com
 (2603:1096:405:2b2::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Tue,
 17 Nov 2026 09:43:44 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB88.mail.protection.outlook.com (10.167.253.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 17 Nov 2026 09:43:44 +0000
Received: from ubuntu (unknown [172.20.64.99])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 7375F40920EB;
	Tue, 17 Nov 2026 17:43:38 +0800 (CST)
From: Jelly Jia <Jelly.Jia@cixtech.com>
To: vkoul@kernel.org,
	Frank.Li@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	robin.murphy@arm.com
Cc: devicetree@vger.kernel.org,
	cix-kernel-upstream@cixtech.com,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jelly.Jia@cixtech.com
Subject: [PATCH v7 07/10] dmaengine: arm-dma350: Track descriptor byte lengths explicitly
Date: Tue, 17 Nov 2026 17:43:32 +0800
Message-ID: <20261117094335.1393735-8-Jelly.Jia@cixtech.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261117094335.1393735-1-Jelly.Jia@cixtech.com>
References: <20261117094335.1393735-1-Jelly.Jia@cixtech.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB88:EE_|TY1PPFB8C1195D3:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 4f0b8b3b-d62b-43ed-db57-08df448f454d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|7416014|376014|1800799024|82310400026|23010399003|261022105027099003|261026130827099003|56012099006|261021123027099003|261021121427099003|10067099003|261021130227099003|261021133027099003|261021135927099003|261102123227099003|261026140227099003|261009223027099003|261026121527099003|261022075727099003|261022113327099003|261026135527099003|261022115727099003|261028144727099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: osignJsEbbxtuB8s1+2aC0f2WoDseOWTlao7ePAlmCNjU/jyBuQY8oFnSnPdV6Mag2ZxM7ZRMiIPq8r+ODXYSZ1pYkiFLQB4MRjfOgeJR/Gx7l8neLWVGjFQoqcTWaHeqSlZ7lcGNwOLYN8cmrqbMFAO+4KX/ym+DmYKF4WM6FNZH8Xz8SQwCXTdPHNQ3SW9jPHktml7129US7cw+pCE66/DGwsFqKiKfJJzGwmc5vPifO3X8hFZxcWTzIepificWLk4dEyKRimqoJ6W6yunpFpwLcwtEhTmZzt+fj0QT2K061iFAqXut4L1LqNrUUvGN3KA7O1K84EvvvI9LgMrJQP2/4k3Cg6U/Ded6R8gv4to/JoMdkTi3+0v1cav3E5sPQWfMgR2WhRKyTscmSoxDtLAB8KJAm/cDFzPxOnOnc27o5sX5AMlhxNd7d2Wp6ZkhJeh6wrkv/kxsEFCldqoB0s1TkbUm+G9MhLMosMz9AHLhIepL3rGw4znE5GP9GqR958pdkUwnaVC0wi0tp7OMkWV4FLfjSncilHnDvByQqNFUYCAYS893EOzZDZJVIFODQTbVK3NzVpEiaNQapsRK00BVa5crVJvkfSO9a5lh7nlza34HN6lGHZXl/z0/Zbv1CZEIYtslcUDiQcFD6KeuH4/OFtEAXbPigV13CUELoJsZlOvbHaWz0/wBnFVG5mw1p6rr49cHwHovPmXMm9BhQ==
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(7416014)(376014)(1800799024)(82310400026)(23010399003)(261022105027099003)(261026130827099003)(56012099006)(261021123027099003)(261021121427099003)(10067099003)(261021130227099003)(261021133027099003)(261021135927099003)(261102123227099003)(261026140227099003)(261009223027099003)(261026121527099003)(261022075727099003)(261022113327099003)(261026135527099003)(261022115727099003)(261028144727099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 5CpbyMqPcfcTecdvFGYCD+cfpy0BfurY99StJbBOqcNsoo7yDk5QkmoTyQkFVDH3YXcdpsrAZd+/NaktrP/ifF5qFQASIj+6R4NJR8zHvJ4F+AU8FQbAx7vSSzku0vCv32d39le3xNLYPZj2pRWsEmq09GcTeF8Ev5s0Nc2+AAMOHzUXi7yh2bAeVQXIBiJ9WiT3wIpYbNaFNHTsvlQ2p4JQ9/bkF5Mg4ZUwRDQmQjdfBvzflf3I36Pd9mdAwOP2RroijkvpBlVrn/CgH+QZSvrOrE3tkZTELk91FRq0YFpNAvaKaB5nXlgyMUw3KFNTiUv+Iwrxl9qR2UXzg4g5KiWGAdJU/ud3YpFAqYnxWL8Nl0fji8XEdqDrgkfmR88G90OZ0fof/h3xwz9DVnVaD4wQx9LNOEzsYSOsUF8JI3yxr7syppuOk9Vl4LLMV3aJ
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 09:43:44.1593
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f0b8b3b-d62b-43ed-db57-08df448f454d
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: TY2PEPF0000AB88.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PPFB8C1195D3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_014353_028318_EE443DD2 
X-CRM114-Status: GOOD (  10.94  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Keep the total transfer length in the descriptor instead of deriving it
from memcpy/memset-specific size fields. This allows the queued-status and
start paths to report the total length for linked peripheral work.

Use local size fields when constructing existing memcpy/memset commands.
Keep these CPU-consumed command words and their MMIO loader in CPU byte
order; little-endian pool storage is introduced with peripheral support.

Signed-off-by: Jelly Jia <Jelly.Jia@cixtech.com>
---
 drivers/dma/arm-dma350.c | 27 ++++++++++++++++-----------
 1 file changed, 16 insertions(+), 11 deletions(-)

diff --git a/drivers/dma/arm-dma350.c b/drivers/dma/arm-dma350.c
index bf87460c1c20..465a8b9b722a 100644
--- a/drivers/dma/arm-dma350.c
+++ b/drivers/dma/arm-dma350.c
@@ -178,8 +178,7 @@ enum ch_cfg_memattr {
 struct d350_desc {
 	struct virt_dma_desc vd;
 	u32 command[16];
-	u16 xsize;
-	u16 xsizehi;
+	size_t bytes;
 	u8 tsz;
 };
 
@@ -224,15 +223,18 @@ static struct dma_async_tx_descriptor *d350_prep_memcpy(struct dma_chan *chan,
 {
 	struct d350_chan *dch = to_d350_chan(chan);
 	struct d350_desc *desc;
+	u16 xsize;
+	u16 xsizehi;
 	u32 *cmd;
 
 	desc = kzalloc_obj(*desc, GFP_NOWAIT);
 	if (!desc)
 		return NULL;
 
+	desc->bytes = len;
 	desc->tsz = __ffs(len | dest | src | (1 << dch->tsz));
-	desc->xsize = lower_16_bits(len >> desc->tsz);
-	desc->xsizehi = upper_16_bits(len >> desc->tsz);
+	xsize = lower_16_bits(len >> desc->tsz);
+	xsizehi = upper_16_bits(len >> desc->tsz);
 
 	cmd = desc->command;
 	cmd[0] = LINK_CTRL | LINK_SRCADDR | LINK_SRCADDRHI | LINK_DESADDR |
@@ -247,8 +249,8 @@ static struct dma_async_tx_descriptor *d350_prep_memcpy(struct dma_chan *chan,
 	cmd[3] = upper_32_bits(src);
 	cmd[4] = lower_32_bits(dest);
 	cmd[5] = upper_32_bits(dest);
-	cmd[6] = FIELD_PREP(CH_XY_SRC, desc->xsize) | FIELD_PREP(CH_XY_DES, desc->xsize);
-	cmd[7] = FIELD_PREP(CH_XY_SRC, desc->xsizehi) | FIELD_PREP(CH_XY_DES, desc->xsizehi);
+	cmd[6] = FIELD_PREP(CH_XY_SRC, xsize) | FIELD_PREP(CH_XY_DES, xsize);
+	cmd[7] = FIELD_PREP(CH_XY_SRC, xsizehi) | FIELD_PREP(CH_XY_DES, xsizehi);
 	cmd[8] = dch->coherent ? TRANSCFG_WB : TRANSCFG_NC;
 	cmd[9] = dch->coherent ? TRANSCFG_WB : TRANSCFG_NC;
 	cmd[10] = FIELD_PREP(CH_XY_SRC, 1) | FIELD_PREP(CH_XY_DES, 1);
@@ -262,15 +264,18 @@ static struct dma_async_tx_descriptor *d350_prep_memset(struct dma_chan *chan,
 {
 	struct d350_chan *dch = to_d350_chan(chan);
 	struct d350_desc *desc;
+	u16 xsize;
+	u16 xsizehi;
 	u32 *cmd;
 
 	desc = kzalloc_obj(*desc, GFP_NOWAIT);
 	if (!desc)
 		return NULL;
 
+	desc->bytes = len;
 	desc->tsz = __ffs(len | dest | (1 << dch->tsz));
-	desc->xsize = lower_16_bits(len >> desc->tsz);
-	desc->xsizehi = upper_16_bits(len >> desc->tsz);
+	xsize = lower_16_bits(len >> desc->tsz);
+	xsizehi = upper_16_bits(len >> desc->tsz);
 
 	cmd = desc->command;
 	cmd[0] = LINK_CTRL | LINK_DESADDR | LINK_DESADDRHI |
@@ -283,8 +288,8 @@ static struct dma_async_tx_descriptor *d350_prep_memset(struct dma_chan *chan,
 
 	cmd[2] = lower_32_bits(dest);
 	cmd[3] = upper_32_bits(dest);
-	cmd[4] = FIELD_PREP(CH_XY_DES, desc->xsize);
-	cmd[5] = FIELD_PREP(CH_XY_DES, desc->xsizehi);
+	cmd[4] = FIELD_PREP(CH_XY_DES, xsize);
+	cmd[5] = FIELD_PREP(CH_XY_DES, xsizehi);
 	cmd[6] = dch->coherent ? TRANSCFG_WB : TRANSCFG_NC;
 	cmd[7] = FIELD_PREP(CH_XY_DES, 1);
 	cmd[8] = (u8)value * 0x01010101;
@@ -387,7 +392,7 @@ static void d350_synchronize(struct dma_chan *chan)
 
 static u32 d350_desc_bytes(struct d350_desc *desc)
 {
-	return ((u32)desc->xsizehi << 16 | desc->xsize) << desc->tsz;
+	return desc->bytes;
 }
 
 static struct virt_dma_desc *d350_find_queued_desc(struct d350_chan *dch,
-- 
2.54.0


