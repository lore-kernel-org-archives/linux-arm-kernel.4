Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 343A0606A323
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 17:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KwnPo2iX;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=A2W+jtT2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=t81DjBTedE75MIMiVf4od5W2d7EJxdasTFzSumBugyE=; b=KwnPo2iXDn4+cp9PNQK8flZStV
	PbftBbjSGqxEgNCqpoXQ/CVIM0K68mUu4AsHoddT++ToWCPuB1L9+C+mXZvCU8bTfKuwoxQrYsD1K
	0q/ffpU7SFyJFSIMxDUlI+d0zqzMxbcHJFpLXf7Q1HL7u4xUX4MStra90uIFraKyzFHKPyvSF0LDT
	UDiujX6pK6aER/EQJOCq6YHPZS3PBIYsSwpxNWPVZw12IMiWpB2XsULamNM35+vw4jw+Qj+P28wtW
	yuIPMV4i7AUFYQi7bDRd8QzHwFrmyPCILCzGEicRBgIQvu44Pc/t9GZ47TISezrrGnZRFKejjKLLf
	a1aYvcwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRYu0-0000000AnaB-0Wm8;
	Thu, 12 Nov 2026 17:48:00 +0000
Received: from mail-westcentralusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c112::5] helo=CY7PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRYtw-0000000AnZl-1n5C
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 17:47:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xrss0AG/N6r46pXFx4HgjHiF9oRJcFKsX54YVhfPxBFaMW8VritVX9tsi0WZVtLprNT+CkxyPWjTvuV6GSk+yzN30+oz2OK3wt4nqmCKLQR5eE+iw+dBzKTod2Tgzc/nowHjrSX0u8zSFA3StzFH1QuPLReB1Wx6hKuvhbCMLnus+z+sVd+YsQ6n2FegTbeBYOdZrgu8tz8jQ4Bmy+dwRwZS+D/XejlXjpA42Bd0xYmVHfZpoWpWkl89gEdhoAWu6LqXyIbYrXGRVJjtDBjboOWYorS5fRwxbucr2sI7R4SV7eJmlxNCy9t8DcFMLr+5DgZ0kwMK3h4c/XotcD2SQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t81DjBTedE75MIMiVf4od5W2d7EJxdasTFzSumBugyE=;
 b=UQDMsWuM79yOLFr8mkL4v4ZU4UlBJBQ37bqcu9fCAW1rxCq0nMYoO3iLE5pDha/ReNqLtGWfbXpPYwScNkucNW09F1i0bxadMCmUkzrK3wpFE0CvV8GUzmVEXbapxlQMCWV2hYh4Nnq0YKbwr5OlHTS07k+AvfQoOBr+/Ttaap3vv4mah5pjpkX1Nw3W4hGZqJwNiQ7qF9wmbsGt2jGYg2nBPtrjcB0L44cIiMDn3WbnQK0KmfoBm55p0EgHI2S0M7mtZEgW0WuS+qXtiGMEb6kJ1tYcwNfQYtziOPliBwcNlRS5vyAZ17NYegtknjqf6EwdX9HXvwx3/K2YZds4hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t81DjBTedE75MIMiVf4od5W2d7EJxdasTFzSumBugyE=;
 b=A2W+jtT2onA87vLb/YJi/VNTbVoauHU0s64Vk0gmLtLmpkT+73IxMVulfA4KJHnpS+ZBXbNdJNik+0YJ52S4pkFgOxk5EqXlO33vZPplbyvT5DegAFB71eYyZL4JYtkTknn7Sj03lqSD+Al9mgiuZy/2rgEPj9EMOdUhcznHjuQ=
Received: from CYZPR20CA0017.namprd20.prod.outlook.com (2603:10b6:930:a2::24)
 by PH8PR12MB6985.namprd12.prod.outlook.com (2603:10b6:510:1bc::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Thu, 12 Nov
 2026 17:47:44 +0000
Received: from CH2PEPF000166BB.namprd04.prod.outlook.com
 (2603:10b6:930:a2:cafe::36) by CYZPR20CA0017.outlook.office365.com
 (2603:10b6:930:a2::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Thu, 12
 Nov 2026 17:47:44 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH2PEPF000166BB.mail.protection.outlook.com (10.167.252.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Thu, 12 Nov 2026 17:47:43 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Thu, 12 Nov
 2026 11:47:08 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Thu, 12 Nov
 2026 11:47:07 -0600
Received: from xhdsuragupt40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Thu, 12 Nov 2026 11:47:05 -0600
From: Suraj Gupta <suraj.gupta2@amd.com>
To: Vinod Koul <vkoul@kernel.org>
CC: Frank Li <Frank.Li@kernel.org>, Michal Simek <michal.simek@amd.com>,
	Srinivas Neeli <srinivas.neeli@amd.com>, <dmaengine@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Suraj
 Gupta <suraj.gupta2@amd.com>
Subject: [PATCH] MAINTAINERS: Add entry for Xilinx AXI DMA driver
Date: Thu, 12 Nov 2026 23:16:13 +0530
Message-ID: <20261112174613.2101876-1-suraj.gupta2@amd.com>
X-Mailer: git-send-email 2.25.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF000166BB:EE_|PH8PR12MB6985:EE_
X-MS-Office365-Filtering-Correlation-Id: e4dac66c-8fae-466e-93a8-08df40e50e32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|1800799024|82310400026|36860700016|10067099003|11063799006|56012099006|261026121527099003|261026140227099003|261022105027099003|261021121427099003|261028144727099003|261102123227099003|261009223027099003|18002099003;
X-Microsoft-Antispam-Message-Info: vI3pcPc9FRk0EnqOCFTPnR7BvlWXB5sQD70nzZHzIcJV7Uaecfim4t25wQLbKhsugXWwCAqbuOL+OH5vZL02eYHfH1mry7kFJ9VqxkhWtb+Lb7vkyTNYYG9Pn2QPB//PBImXr8uDCTSZTLXBc44qL6RzOVJUE2OSqcCoqlGvYdIidjnifaXwbB1ld8r0nPuS3XRKYdcplyMJ1EqGj5rCq/yVNVoveOccaS1PASTsCM25lU6FaK48Xjn17FxT/1og8uZbhVpE7Bpov9hNnerNciBsYCxS6rtGtcrD0oIWWCYI6ozpJkMZYgoVd9KuXtWAdGLesk4BNLkAwGj+1M0cOaKoj/Jd7fc7I0qsTZkpspjVaJX9q8uge/+cvW8vz7yHpyeCarPjvvAJPYLi22nnDgjVoVEAeD0hSEQKDgN+iGn2LOX7cQTu9TLYq+fqvcyJXxGN/wS1EelavX+kiSKdCM+G5a/g1/TYThMt9+AEUgQep0+aZb57QS1t9KsA8agGAmMOqzsaogTllXoh6FqlQkwSsKJCmNhE+GLjjeknR7Kha9RZaT6Jah8smvZj+KkHvq/Q/DqNGfTbkAfAu6VyBoNm/N5a8NiU81uhER4H5lEddnocrvbEhuztpTLoLbnvrEdNhEdz8z8x1P1xCK/xzJv97FckeQQZFTT7GjBKlYeNRsZ2Nc7Vw7kO0ysuePV06uAw/W87wHFe3aKhFbqrYQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(82310400026)(36860700016)(10067099003)(11063799006)(56012099006)(261026121527099003)(261026140227099003)(261022105027099003)(261021121427099003)(261028144727099003)(261102123227099003)(261009223027099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: EN5cQWaPh+1ySBVAMFBEnkR5Jd8777khF2Qv3PXqfgGvGtrQwQwDgndeTh4b26r6dhuIw36S8hYSwdTvcWSW8bhoAfnWQ0lKVGG7jqbfKZ14cqtp8VppovHuGY4X4RR0I9t5C166kt+uyD2JTdP7n6ATtTIUAoD4JfIxjoQAmzEJnffe5Oxg5AMqfymaMV2X8b1rZaw+8t1wYDFCkSY83OpOLDaerC53Fp9y/PENgFj/UPPIsXNNp6XWzrtksO2Qs9QNEZSmuycAtIfQnK3rYstUsBkcgFVoGwziFTGIqTHjtsXVyP5G1jLZucJNVmfApwfrAtsq8l6QnQ1iwxKBwloubDb4SmZ5cxly4iyrADmlGoHE6bCpKE5cLgSd2Jp3f42selOCnN63s6b2Eiu5dw4l2+tk2wIR3us6nKMD93FBrHrIfG+JvBj8tnkMgydy
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 17:47:43.9474
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e4dac66c-8fae-466e-93a8-08df40e50e32
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF000166BB.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6985
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_094756_534803_43B74BD6 
X-CRM114-Status: GOOD (  10.39  )
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

The Xilinx AXI DMA driver, which supports the AXI DMA, AXI CDMA, AXI
VDMA and AXI MCDMA IPs, has no MAINTAINERS entry, so patches touching it
are only picked up by the dmaengine subsystem catch-all.

Add an entry covering the driver, its binding and its header, with
Srinivas Neeli and myself as maintainers.

Signed-off-by: Suraj Gupta <suraj.gupta2@amd.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 93abbb315065..8f75c8cb6acf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -30611,6 +30611,15 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/iio/adc/xlnx,zynqmp-ams.yaml
 F:	drivers/iio/adc/xilinx-ams.c
 
+XILINX AXI DMA DRIVER
+M:	Suraj Gupta <suraj.gupta2@amd.com>
+M:	Srinivas Neeli <srinivas.neeli@amd.com>
+L:	dmaengine@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/dma/xilinx/xlnx,axi-dma.yaml
+F:	drivers/dma/xilinx/xilinx_dma.c
+F:	include/linux/dma/xilinx_dma.h
+
 XILINX AXI ETHERNET DRIVER
 M:	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
 S:	Maintained
-- 
2.25.1


