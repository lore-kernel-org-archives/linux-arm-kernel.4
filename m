Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9938D606A881
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 15:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=v0L4Rcqj;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=X6tY4dva
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=guFep6QzTrHGOlc9c3RVLnl29a/yp/CwFH46HqDgXRw=; b=v0L4Rcqj6AeL6fgq9CC9Pzx1QY
	uSKwILT/ceW9yis4Q2wCvLyqdQeEFuUjP8OWQwi1imXf0sg7ZgCFVLyo1GgIAGWH5nW4okC3srRTN
	+s28CYkNfLRt4GLozExa+jxszci61A47xtUL4N/k/LstCgAQoZfxlk6mn3lRsScLCEXu74QBA+ufb
	x/g2gEB2N+Grnb4Q6gO9ZvvjzrbQqQ+aBIDNI+sEvCaVUizItNny7PH0NKyEJimGiP0R4N9wSzJ/T
	y5MUwBYB9h4GuWnmx0T0K98z8RbZJjuLo1R/Mg7pGcoiPBW9TaaFDOXkmh6Gk0Ny5XzvKmeeUyKAy
	b9OcNuzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTKiS-00000006FW1-2ToH;
	Tue, 17 Nov 2026 15:03:24 +0000
Received: from mail-eastusazlp17011000f.outbound.protection.outlook.com ([2a01:111:f403:c100::f] helo=BL2PR02CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTKiM-00000006FUR-1HaX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 15:03:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F8DrwAcZ+s3CcI1BtCNHZnGXc1EE626x6Gu4C8zvV1hNuw28uEd/m6LETnTxws1WWi5pEwPG/FVvKrA8lUcmOGwiEwApYcoyydK3yRLFMLTYXHnmsu3thVZGP9fKq9Nb6E0R/C8GHpOvkOgFtyvUE6b34CDLQtmsaTnMAhlNrPv52prmdfUt0+Q3I31zzp0LIEbyXJRD5XgJjIV5YM6I50wUBy8xm1i1ROqwfOg/mOOC5EiNMdFgIq7Thwa8hE2PWITBqut2HkV+tk9uWYEdGvkPaVx2ukurCuTK6Wr3EJd/mjxIK+OhkOUpLMAU2ajSKiE1ny3lyq1qLGMwe93riw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=guFep6QzTrHGOlc9c3RVLnl29a/yp/CwFH46HqDgXRw=;
 b=M8opHcMjix04tZKO9lvFnNaOL9uakYr4ZnBYHTzsZOX5UwEhz8zM8Yh6Xii3qqvk9WcnwRXYaKagS4FBEP6B4fnQ8C9P+M8F5tnV/8UxA7ZBafUF4fKePFp/lYHhLWKzkgNdblJNAL467iq/RelHL9Sy3rPfSQZcJoLy/W5Khe7PMaia+8KmMyYEmD2zVEgYPYyeU/bpKw7T8S5JRHCtwHD+x9XmLZyQYGeXyZ/3iJEXWs+3J45c/CtUNhN62og48Twq+G7W4GU0QbWzQm8KSbtXSk2ZzWkdHF6x2Q2Ga3MEeFZ1iWVjqo6ot3vldl175ivC6cuEXB+3W8t4lp3OAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linuxfoundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=guFep6QzTrHGOlc9c3RVLnl29a/yp/CwFH46HqDgXRw=;
 b=X6tY4dvaeFn3F5gBenHep+XFhZDf8VgADRvGfze1zg+xUL2HadpMcsRB5kxHUP2RSTi4rFbyQ+KMvYijW4eIOYTHr6yBRHFwva0DNWkecNlAdrx3GRamIGMIW3QJ0u7nBFIwaHDqsU2v+OUbd0Zwze7+s5dwlAV4edhOp7Runro=
Received: from DM6PR01CA0007.prod.exchangelabs.com (2603:10b6:5:296::12) by
 DM4PR12MB9069.namprd12.prod.outlook.com (2603:10b6:8:b8::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.14; Tue, 17 Nov 2026 15:03:05 +0000
Received: from CH01EPF000BE942.namprd02.prod.outlook.com
 (2603:10b6:5:296:cafe::3) by DM6PR01CA0007.outlook.office365.com
 (2603:10b6:5:296::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Tue,
 17 Nov 2026 15:03:05 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH01EPF000BE942.mail.protection.outlook.com (10.167.244.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 17 Nov 2026 15:03:05 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 17 Nov
 2026 09:02:33 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 17 Nov
 2026 09:02:32 -0600
Received: from xhdradheys41.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Tue, 17 Nov 2026 09:02:28 -0600
From: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
To: <gregkh@linuxfoundation.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <Thinh.Nguyen@synopsys.com>, <michal.simek@amd.com>,
	<p.zabel@pengutronix.de>
CC: <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<git@amd.com>, Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [PATCH v5 1/4] usb: dwc3: xilinx: use device_get_match_data() in probe
Date: Tue, 17 Nov 2026 20:32:15 +0530
Message-ID: <20261117150219.1326693-2-radhey.shyam.pandey@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261117150219.1326693-1-radhey.shyam.pandey@amd.com>
References: <20261117150219.1326693-1-radhey.shyam.pandey@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH01EPF000BE942:EE_|DM4PR12MB9069:EE_
X-MS-Office365-Filtering-Correlation-Id: adc561ca-891e-4747-fee3-08df44bbe21a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700016|82310400026|23010399003|7416014|376014|22082099003|18002099003|261009223027099003|56012099006|11063799006|261102123227099003|261028144727099003|261026140227099003|261021121427099003|261022113327099003|261022105027099003|261021123027099003|10067099003;
X-Microsoft-Antispam-Message-Info: KAbzObPyrhAzKEH1kSutjH/yNILBWitTF9qXv3Bm2YFo+7uREcpJHZjopGl/D70V1RSydMB0NQUA1wHMFna420XVNyI6xDObfueKmfQuUAg0Io3kAEc5ceV/op3fOGKtRY2Y2yd6cacmgngRCYefgfgwAPdW61DB9S3szNx3oBJIEBv1sFAtenzHEqgu7O5WEYa7MgpSCucjmhnc9nnxZ2/werw4ZyUaAOhRMAH/ipW6K8IpAteY5B8eRfRWitUkSnyv7H9UdP54qGhp/KfIzoV/cwhYuyOaR4pd1hAZ69cYfH1JqB+lPfUIit5w+mX+J/qViGncdxmNH2AaLUHDQ/q7qGDltrP1CqHT5ik7OzjpxlCBwL19gCTEixOOWaDMy+nYSVo/GM8aDTLKcNL6mbc/+iZ1XrP5tbLC6mzog7ROF4qcMC2N83UiOOy/SK8SeQayuaK0Dm4N6O5grR32VKI3dAZ/6gUDyy1Qb+86ix4VH6mskpoyCSIH+d3q9/o87TE7XpUWQ9NjwD09ooBTrgakXI0RewGaHV9fLLAAvFKVGe3lwcEWjKZmk896goivGfm/oqCfXGJADjHdTJr8Gyu0D7SEtJHYdlJ7YgmZMmMgAkeQBlcihS5l+aopWlPEBqU5wtzangjTaciW+o+YeYJHFT6SjOoKqXP7PcqDvE+/3Po5JLh6YEALJQgoOqFEn4M2c9ck2XslND4N1hd+Yw==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(23010399003)(7416014)(376014)(22082099003)(18002099003)(261009223027099003)(56012099006)(11063799006)(261102123227099003)(261028144727099003)(261026140227099003)(261021121427099003)(261022113327099003)(261022105027099003)(261021123027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: qWR/IIEoDJ02p3126X6p+UzoZpYDQXb10szuDnsq4sLsKE361nurTKgh6jKXo16xxDzougYQlgV2Hw3pmowTcXYx9Pk3xBl071+mh0K7OktNW0ShIVtQH8HO+/MFImGuMQenM3wB82i2bgXghs4jC4PUfbG4kpR1+QdoEweBOKcYIiOwLLemTqHDWe7hm8Mw7pVYlmqCjgFAx7RATs39ac1hb4hmlhUa88ih0gRQCYQ2oL9+ZHuMj04KyGd6RkMuxpXWbiAumQSUHPZu3f40FdwCZVzLIGw9glqaAWkgIX8E4xjWFXwpxp5IqRbsbDlNmt+IzNFENBzc82U60yRZba9svxEJ82MsuIL/EfWqKhJObkBN9bObCep6mNEGV8JeKXLByhoVKUBmUHrkytNceyfLCzgrfAoz/48bWbTaANatKIjWo6YWFit3pnWhmNi3
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 15:03:05.2326
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: adc561ca-891e-4747-fee3-08df44bbe21a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH01EPF000BE942.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB9069
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_070318_346837_565243C2 
X-CRM114-Status: GOOD (  13.94  )
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

Use device_get_match_data() to obtain the platform init callback from
the OF match table instead of calling of_match_node() and dereferencing
match->data directly.

Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
---
Changes for v5:
- Existing standalone patch merged to MMI USB support series.
---
 drivers/usb/dwc3/dwc3-xilinx.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-xilinx.c b/drivers/usb/dwc3/dwc3-xilinx.c
index 095bc3dde0fa..b58fe034a94d 100644
--- a/drivers/usb/dwc3/dwc3-xilinx.c
+++ b/drivers/usb/dwc3/dwc3-xilinx.c
@@ -12,6 +12,7 @@
 #include <linux/clk.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/dma-mapping.h>
 #include <linux/gpio/consumer.h>
 #include <linux/of_platform.h>
@@ -330,7 +331,6 @@ static int dwc3_xlnx_probe(struct platform_device *pdev)
 	struct dwc3_xlnx		*priv_data;
 	struct device			*dev = &pdev->dev;
 	struct device_node		*np = dev->of_node;
-	const struct of_device_id	*match;
 	void __iomem			*regs;
 	int				ret;
 
@@ -342,9 +342,11 @@ static int dwc3_xlnx_probe(struct platform_device *pdev)
 	if (IS_ERR(regs))
 		return dev_err_probe(dev, PTR_ERR(regs), "failed to map registers\n");
 
-	match = of_match_node(dwc3_xlnx_of_match, pdev->dev.of_node);
+	priv_data->pltfm_init = device_get_match_data(dev);
+	if (!priv_data->pltfm_init)
+		return dev_err_probe(dev, -ENODEV,
+				     "missing platform init handler\n");
 
-	priv_data->pltfm_init = match->data;
 	priv_data->regs = regs;
 	priv_data->dev = dev;
 
-- 
2.44.4


