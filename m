Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19A22606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 10:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=A9gOUQer;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=Dcdz+2pv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=MMda2ZonN7mWbBIhNNw84Y+f47qIKxrGXbrPKDvo0ts=; b=A9gOUQerTf3v+r
	VjGhWDoU9p9EISXV4gckSwAGk/L1tv536qE/OocIGg8LnAmnWdeCtfFA9YGBISIIQorSLdJyLNw+j
	6YRQH18CO/JIdYtW+A40nFuObFjDw0c76OOfPoauPxm6ftabiS+I4tni3gFOwjizLEd9j7hcvXPGV
	HL7WWFouFeaHcCFi64z8W8AI//1kaKqLap+g5zyBc4kMoTpscH5Hf5T2GgSq97kUVVxjgk52pJjQh
	HWLkAmrY4VH9txTmf+wIIor/KSHLy1SRjV7ghS038ITsV1p6JyDdF9rNsLMSW9VWObrhcxNXmgTF+
	l6ox2ADw46U1ujzk6zlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQCx-00000002gG6-2DEf;
	Mon, 23 Nov 2026 09:19:31 +0000
Received: from mail-francecentralazon11013029.outbound.protection.outlook.com ([40.107.162.29] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQB3-00000002fk4-46y7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 09:17:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lHcSLFEECQwu0OiXYCIXKFisl0pQhysvIumVeSRKpstUuF+0G0KJiEGpn3wxhsqIj+NURcD7XuRoF5E61hc+39Eue011P6o2HHLsGosuj9c8m9e9kprEJ6Tp0kDutNZLTSDkb1uOd8oGL9euMXKkqPbgs165fwtkx+IblX3VbxZEccROlXBe9JCtrIEIAi2iIOrenkwIhFFfeUAi7pb9/MK3JLhEsTwmudRuThX2y8sVvG5PX8K/4oS3UU7tnVqKppOkdQ+gmz4zwes+NYA0fHlBcAb4oRC0HBZruZ3TtmU3QtUWu4TOgo2c71Ys9hRSr7IKQ6osId5gJNxHjSCL8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MMda2ZonN7mWbBIhNNw84Y+f47qIKxrGXbrPKDvo0ts=;
 b=ipkCBK3h1OwAuhoJl8Fgpiioccp4VSwqypVyVnoxQT86c1F5myr+XRHVFCoA+gSpKVTjx6DamgM7bIyGAS8Zdjtd91yQHw3Wg+Qm4eX01EmzzWfUgfhqGLg5pxge1FpyS2fYTrso07sRc4RoN5AtDgJg8cLrWaFkey0htUaReIifiqR3WXMtSCE2+gTOelSvhvChnc9zzVCSH7mmInXsR2LgQhKTaQvTLO7gSVNrIXPr7PjheHkknKHufAHAS8ygppfkWfb9LClVgcUUuBnSj2X/5kOVIP5M0d5zHkt0FCkEv016feqwbYWM8znqBrMUxHjju8Xzir6ltrCfZeHcTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MMda2ZonN7mWbBIhNNw84Y+f47qIKxrGXbrPKDvo0ts=;
 b=Dcdz+2pvRmsNwn6ffzXqICH/kO/MaJPILOOWfo3hoKLeHje8D86GG65/Ly0NkR4BkarmFxvI/CTmUalFcQmE598wtnSGmDecbcc33tyNFDo7Fjz4yN/FbjIFIYe3/2UnysQyi3R0goBr1gdIdljyRAsnSjjg/CU26OrKm7nLADAd1IEucrDpc4zIgU6IAyx995hdBTMoRLQMEgBZbpSKUVPElHnnoT+XgPUXsEjpfzFajXYwCXnHsh6ZfP6vsz4Z3ZyN8djZbas2dml/qSCoWzutOyjk44SzMhvtffASiukr2UCQ+zoqEsIEAIeY8rELpldr8HUkHESoinlqN2lDsQ==
Received: from VI1PR07CA0271.eurprd07.prod.outlook.com (2603:10a6:803:b4::38)
 by DU0PR10MB5362.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:34d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.3; Mon, 23 Nov
 2026 09:17:29 +0000
Received: from ZR1PEPF0000E6BB.eurprd07.prod.outlook.com
 (2603:10a6:803:b4:cafe::8e) by VI1PR07CA0271.outlook.office365.com
 (2603:10a6:803:b4::38) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.5 via Frontend Transport; Mon, 23
 Nov 2026 09:17:29 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 ZR1PEPF0000E6BB.mail.protection.outlook.com (10.167.241.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Mon, 23 Nov 2026 09:17:29 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Mon, 23 Nov
 2026 10:18:26 +0100
Received: from localhost (10.48.87.222) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 23 Nov
 2026 10:17:22 +0100
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
Date: Mon, 23 Nov 2026 10:17:08 +0100
Subject: [PATCH v2 4/4] dmaengine: stm32-dma3: replace hardcoded LLI size
 with aligned descriptor size
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261123-dma3-fixes-v2-4-0a5b013f79d2@foss.st.com>
References: <20261123-dma3-fixes-v2-0-0a5b013f79d2@foss.st.com>
In-Reply-To: <20261123-dma3-fixes-v2-0-0a5b013f79d2@foss.st.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>, =?utf-8?q?Am=C3=A9lie_Delaunay?=
	<amelie.delaunay@foss.st.com>
CC: <dmaengine@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	"Frank Li" <Frank.Li@nxp.com>
X-Mailer: b4 0.16.0
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZR1PEPF0000E6BB:EE_|DU0PR10MB5362:EE_
X-MS-Office365-Filtering-Correlation-Id: a27442e6-1bc7-40f1-8dc5-08df494298ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|82310400026|36860700016|1800799024|376014|18002099003|22082099003|56012099006|11063799006|261102123227099003|261022075727099003|261021123027099003|261021121427099003|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info: pSc+2IhykjY47oDOv2oB7UgLklNU3UzGV8ZWXoj+YEimQq33uiNnzhGtkZL0zOC8mXeli5JX3cCLRKnHa//FB4BVFm4/92BRZj9R8WQcCnjhOmEKKy15Cjda16RNDXJel2SMVp57iY61vJeryi/GF9DgMRUYbdsjDlrNoPuU49/hMM/JK6ldPlOOtpNsRiUtqkc5m0HK0WW5S8W272qoPQpb5s1vWQQRLi36rjs2wPXxGMioy1RmtZUt0Nm7lZsWJnBjnJ0CuRjQPDOPxB1kCNGxV0cxmdeqnx1A6Tb0ptC/7dfTdn+a7z3zcnLifT0BKgWNeh2R3X798cIXRVDe3Xs3wGQI7/TeQpzjdlK062V4VNZUZMDFLSUcsjbJiGcchYQKEP7CJU10LAeHUKub0fP3B5gW36a0m4Dv55/EyEQtF/KPMFDJ28aqNPJNUF+lKuNh745LPDhJMH6/qGTMPPpzamh28XRuyDRniI/ooRQRCR3O0EClhSOMPOu8AjV9Aoy/mj20omZPC38gGfOiNyD1VtvovHwGkoSFU9Nl8m+WavSECZ7/wfSFwmIF6ZeM0eZvy49S41ymc3UYcsnzR/gWoABpyg7Uel5180wfALjrnQJ7WiV48tvdsPAe3m8iL1E+hLBj/XrtOAQFjGJyQMSic5581AuPONcWWrcu2FZE6Hvh2vzzcGXQounxbeuxRME8ynPnF5vZzLRe/Ct4yQ==
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(1800799024)(376014)(18002099003)(22082099003)(56012099006)(11063799006)(261102123227099003)(261022075727099003)(261021123027099003)(261021121427099003)(261009223027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ruVl0aoaFMyHqT00P2/Q0AnwkMyOJN0dMP0A7BBhV5A8iJsca0ufjF945KYuuPojc1FjmKmfPs+eKGL5PkYl64PbhT+H5/1Y22054mdXUTZlJeSIZ7kTqWUcT3YU/tOSVlSFcU/VBCiXJIF7jYkRqokaIMCX+0rsGhSqNEUQIUrVZ/llkp7FmKgZEIw2wgesnwGMBuerETg+k9v45Gk8nq4ZtxAbt0wWvNXplyC002xDe4mj0s4DMSQ/4BlyOcoXPrjHBaSIqu0oiMvYkMUugUlfmLTSO9IF4P9fS40PVXKDNDJ59Ah157R+pProIolM7dxvxH/bMMILgloR+vSQj4EvVuUH8jKpHbc/hczJ1q2gBgLUHV7tpZt2/vNO5hVqLTE1bpAFv3ZU06SjDzgVfjAxpvC6Z5wRWjcTm0kLh08UJVIL8FDH7G6uwZeo/1He
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 09:17:29.2140
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a27442e6-1bc7-40f1-8dc5-08df494298ef
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: ZR1PEPF0000E6BB.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB5362
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_011734_027242_44601475 
X-CRM114-Status: GOOD (  14.82  )
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

The DMA3 driver currently hardcodes a 32-byte descriptor size when
computing the maximum linked-list size and validating the number of
descriptors to allocate.

Compute the descriptor size from the aligned size of
struct stm32_dma3_hwdesc, introduce a dedicated STM32_DMA3_MAX_DESC_COUNT
macro, and use it both for the segment size limit (STM32_DMA3_MAX_SEG_SIZE)
and for the descriptor count check (in stm32_dma3_chan_desc_alloc()).

This also corrects the maximum descriptor count: CLLR_LA holds the offset
to the next descriptor, so for a descriptor size of N bytes the last
valid descriptor is at offset (count - 1) * N, and the maximum number of
descriptors is (CLLR_LA / N) + 1.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
---
 drivers/dma/stm32/stm32-dma3.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/dma/stm32/stm32-dma3.c b/drivers/dma/stm32/stm32-dma3.c
index 7c509a69f5e5..e5724c4b2c84 100644
--- a/drivers/dma/stm32/stm32-dma3.c
+++ b/drivers/dma/stm32/stm32-dma3.c
@@ -251,12 +251,14 @@ struct stm32_dma3_hwdesc {
 } __packed __aligned(32);
 
 /*
- * CLLR_LA / sizeof(struct stm32_dma3_hwdesc) represents the number of hdwdesc that can be addressed
- * by the pointer to the next linked-list data structure. The __aligned forces the 32-byte
- * alignment. So use hardcoded 32. Multiplied by the max block size of each item, it represents
- * the sg size limitation.
+ * (CLLR_LA / STM32_DMA3_DESC_SIZE) + 1 represents the number of hwdesc that can be addressed
+ * by the pointer to the next linked-list data structure.
+ * Multiplied by the max block size of each item, it represents the sg size limitation.
  */
-#define STM32_DMA3_MAX_SEG_SIZE		((CLLR_LA / 32) * STM32_DMA3_MAX_BLOCK_SIZE)
+#define STM32_DMA3_DESC_SIZE		ALIGN(sizeof(struct stm32_dma3_hwdesc), \
+					      __alignof__(struct stm32_dma3_hwdesc))
+#define STM32_DMA3_MAX_DESC_COUNT	((CLLR_LA / STM32_DMA3_DESC_SIZE) + 1)
+#define STM32_DMA3_MAX_SEG_SIZE		(STM32_DMA3_MAX_DESC_COUNT * STM32_DMA3_MAX_BLOCK_SIZE)
 
 /*
  * Linked-list items
@@ -401,11 +403,10 @@ static struct stm32_dma3_swdesc *stm32_dma3_chan_desc_alloc(struct stm32_dma3_ch
 	dma_addr_t base_addr = 0;
 
 	/*
-	 * If the memory to be allocated for the number of hwdesc (6 u32 members but 32-bytes
-	 * aligned) is greater than the maximum address of CLLR_LA, then the last items can't be
-	 * addressed, so abort the allocation.
+	 * If the memory to be allocated for the number of hwdesc is greater than the maximum
+	 * addressable by CLLR_LA, then the last items can't be addressed, so abort the allocation.
 	 */
-	if ((count * 32) > CLLR_LA) {
+	if (count > STM32_DMA3_MAX_DESC_COUNT) {
 		dev_err(vchan_chan_dev(&chan->vchan), "Transfer is too big (> %luB)\n", STM32_DMA3_MAX_SEG_SIZE);
 		return NULL;
 	}

-- 
2.43.0


