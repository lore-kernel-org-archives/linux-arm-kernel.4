Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A640B606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 13:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=H8FCLNlc;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Zt1qB9Qo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=PRcoUmghBBngyjtq4d1TUdxRdwezRzM7mDTz+5D0zfU=; b=H8FCLNlcNgZkEcNUUHKyLiiByR
	dI7qzn6ZHc+m8H4hTrWWWYeZ4CgA0uRMo4BkXm5RSPzDm3sebknE4cRToj0fOZdbucLXIVioebYt4
	/OLN52tLAT4G01X55yGd6482iPWcAwwz4rDjx1y3QighImoN+CqHTXQgd/pgKsdSq6wwVIVC1neys
	KtvqKapyG/M7s16J/G3j7uRCTJjmc22PLhFaKxE5s9T8C4JmdNJIdIwwCr1kXHQOggNkm+5UYoCH9
	mJqeFGWh1AQIQBOLwDtj0rXH0jr5ehkKpy5iNj5wHIlaAuYEuZnpXutEZmbdJ4LFMIej3v86Axwy0
	zDCFESOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU2RA-0000000C6tA-2OkF;
	Thu, 19 Nov 2026 13:44:28 +0000
Received: from mail-westusazon11012017.outbound.protection.outlook.com ([52.101.43.17] helo=SJ2PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU2R8-0000000C6so-0uzp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 13:44:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yh3ybP9gOO0fdgxX8x1hEO2VXGqsmYUkeSJLZuldZCzTojDjkMTjsoFmebMmpi76PHgPb1Yv5XHUyhWbYsmsuuXrfYIhKo94EXUkNAq0HBUIrO5yNSBFA4GhCYgXbcrqahASQ1NhNxnLGj7weInwFhWxpTam8mHQs1NLYo/747ckJ6GkwFmX+stdQaJXXNDX3DMBcdxUsKbmPHZmAM3tuJllj9USlDd7aNz6dWLmZo5AfsosACO2khZij/To5vGyc3uCh7xy3+AVZBfx5Fb0/cwUmnKyGjYfArJhZRXKCpGHMi5VugX+FkrJw19mGsYtTu8FFokmkDJsgT/GrYWKDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PRcoUmghBBngyjtq4d1TUdxRdwezRzM7mDTz+5D0zfU=;
 b=OgJxzvmzBj0IrIhWdjnbaDaEa4oncAmbGvDq1otu77uFOXuB607Tf43aWBSCU+GUsAH79DuC/UqBVg8JisGbrYNkaswybEMQ69D5hcYyw48RiogXip01+RZg/4rgnzegQ+dz16r/dWf1K60N/4bAE8TTe9BAhJICxlkdWzKW78nyQoGzDKV9lcIua1EQeuFchkC9MdnIyOP08Rtijk1UsJe+2ESuI3Xf2d5JYIA1bA6+CL8cKoIjjwjpQUob+ZLCToedVYNgLiGgq1p0KrqyInfPcczoLTScXzN15YUvje4Xgb0EWultPuoiZOGBtUDNA0h5dlAwLqvQRpkSFAOqdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PRcoUmghBBngyjtq4d1TUdxRdwezRzM7mDTz+5D0zfU=;
 b=Zt1qB9Qo0yCxQnqQu4ICMTphMZXyeeNd25C0rNdb8d8b2Xi1T47CNd/otm5MKlL0Tm55SQ33MmU6G9ibP2NlFNUFR93KSIiC528OVHPjZtRq1ifcbLQxbWD/o4q2jKFlxWq6tumKv7fcXKIM5bo7LZTRFmWEu/MMsKWI274nTOg=
Received: from BN9PR03CA0748.namprd03.prod.outlook.com (2603:10b6:408:110::33)
 by SN7PR12MB7322.namprd12.prod.outlook.com (2603:10b6:806:299::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 13:44:20 +0000
Received: from BN3PEPF0000B372.namprd21.prod.outlook.com
 (2603:10b6:408:110:cafe::81) by BN9PR03CA0748.outlook.office365.com
 (2603:10b6:408:110::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.10 via Frontend Transport; Thu,
 19 Nov 2026 13:44:20 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF0000B372.mail.protection.outlook.com (10.167.243.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.0 via Frontend Transport; Thu, 19 Nov 2026 13:44:20 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 19 Nov
 2026 07:44:20 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 19 Nov
 2026 07:44:19 -0600
Received: from localhost (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57 via Frontend
 Transport; Thu, 19 Nov 2026 07:44:19 -0600
From: Michal Simek <michal.simek@amd.com>
To: <linux-kernel@vger.kernel.org>, <monstr@monstr.eu>,
	<michal.simek@amd.com>, <git@amd.com>
CC: Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, "open list:OPEN FIRMWARE
 AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated
 list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH] arm64: zynqmp: dts: Fix file descriptions to match actual filename
Date: Thu, 19 Nov 2026 14:44:15 +0100
Message-ID: <c552d657b81c55f0ac2ae78b8d8abbde5deaebdb.1795095853.git.michal.simek@amd.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=867; i=michal.simek@amd.com; h=from:subject:message-id; bh=01mzse8pu4st/hXc64al8g/C8dA71Dy30of3QDVetaQ=; b=owGbwMvMwCG2mv3fB7+vgl8ZT6slMWT9+2uQnrHjxbWjzF6zLLfw/9vzck3Oinm/OK9z71gbJ 6mb/SbCtqOUhUGMg0FWTJFlOpOOw5pv15aKLY/Mh5nDygQyhIGLUwAm8v0YI8MTlgTeP+kWheq7 KuzOX6jxjw16oxGQ66Z79JLpy9mOS98wMjxkyhZcluy42ErP22Lia4OvLC/WiIkfPF2i/rHU0f5 6ABMA
X-Developer-Key: i=michal.simek@amd.com; a=openpgp; fpr=67350C9BF5CCEE9B5364356A377C7F21FE3D1F91
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B372:EE_|SN7PR12MB7322:EE_
X-MS-Office365-Filtering-Correlation-Id: 18155bf8-79f7-4cf5-e9ba-08df464336f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|23010399003|82310400026|1800799024|376014|261102123227099003|261021121427099003|10067099003|56012099006|11063799006|261021123027099003|18002099003|261009223027099003;
X-Microsoft-Antispam-Message-Info: Qw5h8kunzUFIpzmc/hzaf9Ht6kj7Z0S78znAtJqXHXikwyZAnU5Wv6Qo0OFz9EIS4Mvu9Yo9dKg4kK0VGJlZ/RNrXon/QecOvEIVd3xaxqkALW9WZo9OG+Ks0TiQJsLl7t4GCN7v+Btbz+DZbE4i1nZXHKkxnorHtLQPxigtbvNSypxy250PBU7reoomQLH7AQ3wpJmO/bhQH0t1Pxz0PIx7Yf5qIUpJM19xNryBHaO/Z3tI7u5cgdN/wXZ8HizD5m3KVqnHxMLaZpruJ69BNTQbJfNQAH9o6H1awoC7mNi6vQWpDreDwAvgztkxPNrHB9BUNNl+1+FcwHVMGHlVhbchHXIBxTJ7999dKwO1FkDBMF22GcjqJSp60HCHY02pAsazD/X4HpLAjelEp+76ekDjbG0PoDANPEjz1GigWUGXJhQ1D7l8a133W3/EpcObHDEfugfxHWFOb4HVtW+VuqFGRNqqFcb3SJJz5cBGJ85jqW8NOE6lCbm6tbqOa0HzWz9l9nopM6gJlROUF6br0z7wskeiH1d95o2zZRDnL/CRoTjLcpZ9N0E11cwEeXTckHlBb+bu09ydUlAwmrmhpq7b30r8wf2VUUTfKLoNWuZQvO8yructxzUnMcG+fYSOQF2Wg8Y8yiaQFgCiwLvpYLGNODO7nnl+QjTFIzZIxlYtXs2A24xgqwowPCM+pX//GR3dWivcgQd5VOJ/FlGISQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(82310400026)(1800799024)(376014)(261102123227099003)(261021121427099003)(10067099003)(56012099006)(11063799006)(261021123027099003)(18002099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 4XBhRN5Tj3d3vgbO+xYSi/3lF0rsK0c7v2y2mQbvEn13cgIYgXLPXpAbBeLJXYiwaS8ANj6oq6GJtPhXGG0xT89VY8u+JrKPexQ6Wx4edbBYnO87S2gScm4dn6zjPf+WI4+Zk39vueyFZ/h3bc7Kfayf5vge0j6aVaoq621h5Sm4dRl9XOl6rYAsxFDIwxIQ/1KU6BldHR0aaoeriEYhWjIihmUcFaOE1vdAVnyWPw5UMGu3UYLNdWGjVF/xgyL1+qV4wi4yGHbjb+8evNyhpdlBxDLf0BjnLTDqNDYhRKCswGbLLfe6yEsmcrl1CQyj6aAYDjjOofjzGCRf+7ZgGAn6vlOCOpHwItooYJfJ3vM78yN9vipyfLY9eoRARczGnzVuvWKMn4IJd4DCetsWO9HEJZRY+zRh9LTDvR/bqG9nMDLC2mVJDMiZSu34m1oN
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 13:44:20.8362
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 18155bf8-79f7-4cf5-e9ba-08df464336f6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B372.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7322
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_054426_267693_4412A63D 
X-CRM114-Status: GOOD (  11.54  )
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

zynqmp-sck-kv-g-revB.dtso: described as revA instead of revB.

Signed-off-by: Michal Simek <michal.simek@amd.com>
---

 arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revB.dtso | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revB.dtso b/arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revB.dtso
index 49732de5fa4b..e919155bac9d 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revB.dtso
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revB.dtso
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * dts file for KV260 revA Carrier Card
+ * dts file for KV260 revB Carrier Card
  *
  * (C) Copyright 2020 - 2022, Xilinx, Inc.
  * (C) Copyright 2022 - 2023, Advanced Micro Devices, Inc.
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
branch: xnext/dt

-- 
2.43.0


