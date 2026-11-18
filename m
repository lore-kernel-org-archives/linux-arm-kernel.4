Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1429460A6F5B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 23:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=z56jHB7Y;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=dYl4jP/t
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=am3V468DuHp4DRiSd4+Y2x/+bxYIJ7R8lgMYTP4Hdrw=; b=z56jHB7YQHG7KDLGcSx6/XjLg8
	WSBp9pURxtk3dehi16ShQwGdsdPhfIn2KljrOUzWikBoUCU2mhHrYsmzAIJ6LNgLv517yGYH13fyp
	kvTvuSWhoc/o2taiNOO4OTyi9x1aqN8Iz1RaSbLoJTHSxTcD2l2ugexQEzb/QhOPejrZZpQ/KQklF
	EFY8/P7cQid1e8v+cR6HxGRbnTuuEdPoNxuaB4XBZBeTsm5JMLg6hmFtlc1MoOrBGU3ojUlvTdH9B
	tmzTxP+Oid/pAztq7YEuRFFiclHjMlhGBuno73pGQVSIquotKhy52/hfULzNID/oRUsMOSLZd5aTq
	JI8dyLRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTp8o-0000000AV3t-3qRR;
	Wed, 18 Nov 2026 23:32:38 +0000
Received: from mail-eastus2azlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c110::1] helo=BN1PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTp8c-0000000AUyR-1Y2o
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 23:32:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ypTiq2o3TaujgpvwNMEB52MiSXhtaZtVILZNgiT79r84VN+cbIhHJtizmIDFVpt/lOeKkgKpJq4/2Fb/mm72h+0nkQoSLx521YpXwosJMRKUInk9QZUSfESW2E9O9YXjpJL4Zjpz8EKdBO6pefYyDesAJQRyDtYulh/ubtC3+OpTevWUja/aDuFWFU9ou9dd+f2JmblJvUw/12BozFWh4ulMZBpkJRnT/Cb1LnZRK6uv/0xChIRPyLFCcpUWxxcGuJ5+BfMsH2+yRC6JBj8E55nM90UaqnncPml5V7Zbsu8Px4zMdl9xi6ydWZlYsccvBKtIskQgh5QRRONGwSz8KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=am3V468DuHp4DRiSd4+Y2x/+bxYIJ7R8lgMYTP4Hdrw=;
 b=eeb59SuSjc9pWiwOJEXLJXTQ1+3jQhDmzOAO97r8fBzUwQ0Xsh00Ssnnpn5luxjF/AtHB97hty8GQz60/YzzP6m5bqeGY+CzQ8F5jG4sCM3kKaFMMmg5z+WvsQ4HZU5zGwY+HgZ6QWAjrwUmZ5WXhs2vGAtYD3889xEcNjDdLmoioEVCtILVspwAeEfe2a09wVGHOieoA7GQ2nw5z/WVBa8dTFqgRrxxfqyJntB+FyBtJ4JZnLyCUOx2k9H2PoG6fOQ6DJcLYAjV1G2+QosiIQ+hLE2H5Ap0VP3v5wowFdkKkeWxUxfw0a883/XkJ4BLnuP2M3PjGqzOF4rgrgaRQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=am3V468DuHp4DRiSd4+Y2x/+bxYIJ7R8lgMYTP4Hdrw=;
 b=dYl4jP/tu9h0duS5vDNZbFGPFc3zIsiYYcZmLOvWsnHWbeeAiV9INsn+Gs14H0MnGfAVRqoQsdc5bRkjVoXYEKfRw2zXADZ09opYEYpgZJVGA3zQlE/cglMbps9y/vXIWuNCfF3gDddAJzjY4cWHrkqP+oMlVAkegzOwBT1rqEE=
Received: from MN0PR02CA0003.namprd02.prod.outlook.com (2603:10b6:208:530::6)
 by DS0PR12MB8502.namprd12.prod.outlook.com (2603:10b6:8:15b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 23:32:20 +0000
Received: from IA0PEPF00000039.namprd03.prod.outlook.com
 (2603:10b6:208:530:cafe::8e) by MN0PR02CA0003.outlook.office365.com
 (2603:10b6:208:530::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Wed,
 18 Nov 2026 23:32:20 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 IA0PEPF00000039.mail.protection.outlook.com (10.167.249.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 18 Nov 2026 23:32:20 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 17:32:17 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 17:32:17 -0600
Received: from xsjgregoryw50.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Wed, 18 Nov 2026 17:32:17 -0600
From: Gregory Williams <gregory.williams@amd.com>
To: Michal Simek <michal.simek@amd.com>
CC: Senthil Nathan Thangaraj <senthilnathan.thangaraj@amd.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 03/15] firmware: xilinx: Add comments about number of arguments
Date: Wed, 18 Nov 2026 15:31:59 -0800
Message-ID: <20261118233211.4121361-4-gregory.williams@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261118233211.4121361-1-gregory.williams@amd.com>
References: <20261118233211.4121361-1-gregory.williams@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PEPF00000039:EE_|DS0PR12MB8502:EE_
X-MS-Office365-Filtering-Correlation-Id: 36801715-31d7-4359-ed6b-08df45cc30b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|82310400026|36860700016|1800799024|376014|261102123227099003|261026140227099003|261028144727099003|11063799006|261022075727099003|261021121427099003|261021123027099003|261022105027099003|5023799004|56012099006|10067099003|18002099003|22082099003|261009223027099003|6133799003;
X-Microsoft-Antispam-Message-Info: AH71FgN5W1fVuq6bHQb4+l4A0RMsJQC+fhOXpIRzZOpjNv3tjg+1e4KO99RxUmVYymKYhF96n3MTc2CZPzeJ0IpaE9o6TXYHqC3vXiYLlJFT3m7UpYpxNpKEm/gjmmk5S3xIaASfrmY4KpKJWABy83SQOxoZDso3tcRJCyyNW+ueIvKVSyrCD3IRRMwl5I84LYwTwy/pZLvZjch7aP5LyhTI9DL1ZIFLte9rLJFQeykRtn07HqgnGW+V24NCilHWWO5sKbFlA0TFnB/vUwE4yBm5CZMz3a1mDxWBba9Af6s2VlYD2Ti43O3MQw7hahPTglyiMxOOkdqWt3OgW+zwF7RX6ZBZb+8342T4kGAJOTDH9Q4rzmP7L8Gccy/iRH3aLSa3QB3WBsyVcAyPir4A5dO6Jedkz3fbbndvHUTQHJnAnzQs00wo4OdW0apAeA7rKE4Tn4/EdHULLUDsqrEIKu6dycvJA0rpq1Y5Qnw7CVV190YCKYfKRP8JF8hfQLkZjvBUi/gEuOiDlIjOWzXic/1DBnAQXkzLHtXp/i541/zdgmWNeiHQnPE+lsVK8z/M2UO0YKsrpfrYn8qfhDJ9nUdiuCTzTgqDwqakqVXYOxDolHOXOFri+nvf5wU9KSLBDG5W0rFWPTDL65lK5doy+1PqPEtP7Qfi0LKQBG96+wKLnbxtsXLA8SGxJoeL2PlW9YiRegfyMWGVqsgr9Nzubw==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(1800799024)(376014)(261102123227099003)(261026140227099003)(261028144727099003)(11063799006)(261022075727099003)(261021121427099003)(261021123027099003)(261022105027099003)(5023799004)(56012099006)(10067099003)(18002099003)(22082099003)(261009223027099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 8dqnKjd6uLKhZzCm6Ijw+U7mguSGRNQE0Urd0yRy/eon4HJnDWMeJw/ejsa+6oaMfJvFpjIik6WDteAPiNBCY0+GOM32BbYQeLuT40grHgR2JH0ny1vx2AsjI2P/eCJo4ym8MWEAadBdG8a02AU3zgxuuGMZNi/Nminvga5ocac0jHrpEgecLf9BSyrJj55WtbfGgh6ZHc3zhIBVEM1Vfrk6m/v5cRUTWqxIQmWCGpTWGMQmh8R3fvAUa1o+GBYICLeFDu65as7nll3+U5bS0iDz32MpKuY4x/HHPbwooVxCP6XUkf5magO/njI7PnQrA5ALKVQffWj/iOKfookbn5+1jvHGrkZqoe4lpmze7ekDUHCXyVKDrZGLDdUl3+cIakdaGSd29x1KFfsoQL7Wv/p3VFwYPlKbWT5ucgrY+hIc0W7tAX5wLeN7pxyVX8aM
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 23:32:20.2357
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 36801715-31d7-4359-ed6b-08df45cc30b4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: IA0PEPF00000039.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8502
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_153226_418086_69BD127F 
X-CRM114-Status: GOOD (  17.75  )
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

From: Senthil Nathan Thangaraj <senthilnathan.thangaraj@amd.com>

The driver checks the number of arguments, but it is not clear what those
values reflect. Introduce the SMC_ARG_CNT_BASIC_32 macro and add comments
to clarify.

Signed-off-by: Michal Simek <michal.simek@amd.com>
Signed-off-by: Senthil Nathan Thangaraj <senthilnathan.thangaraj@amd.com>
---
 drivers/firmware/xilinx/zynqmp.c     | 14 +++++++++++---
 include/linux/firmware/xlnx-zynqmp.h | 10 ++++++++--
 2 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/firmware/xilinx/zynqmp.c b/drivers/firmware/xilinx/zynqmp.c
index e264a1914f06..fb8ea7b9fdb1 100644
--- a/drivers/firmware/xilinx/zynqmp.c
+++ b/drivers/firmware/xilinx/zynqmp.c
@@ -454,6 +454,10 @@ int zynqmp_pm_invoke_fw_fn(u32 pm_api_id, u32 *ret_payload, u32 num_args, ...)
 	u32 args[SMC_ARG_CNT_32] = {0};
 	u32 module_id;
 
+	/*
+	 * Of the 16 32-bit argument registers, the extended SMC header uses 3,
+	 * leaving at most SMC_ARG_CNT_32 (13) for arguments.
+	 */
 	if (num_args > SMC_ARG_CNT_32)
 		return -EINVAL;
 
@@ -512,12 +516,16 @@ int zynqmp_pm_invoke_fn(u32 pm_api_id, u32 *ret_payload, u32 num_args, ...)
 	 * Added SIP service call Function Identifier
 	 * Make sure to stay in x0 register
 	 */
-	u64 smc_arg[8];
+	u64 smc_arg[SMC_ARG_CNT_64];
 	int ret, i;
 	va_list arg_list;
-	u32 args[14] = {0};
+	u32 args[SMC_ARG_CNT_BASIC_32] = {0};
 
-	if (num_args > 14)
+	/*
+	 * Of the 16 32-bit argument registers, the basic SMC header uses 2,
+	 * leaving at most SMC_ARG_CNT_BASIC_32 (14) for arguments.
+	 */
+	if (num_args > SMC_ARG_CNT_BASIC_32)
 		return -EINVAL;
 
 	/* Check if feature is supported or not */
diff --git a/include/linux/firmware/xlnx-zynqmp.h b/include/linux/firmware/xlnx-zynqmp.h
index 41a1cd810bda..681ab99ceffc 100644
--- a/include/linux/firmware/xlnx-zynqmp.h
+++ b/include/linux/firmware/xlnx-zynqmp.h
@@ -79,8 +79,14 @@
 /* Number of 64bits arguments for SMC call */
 #define SMC_ARG_CNT_64	8U
 
-/* Number of 32bits arguments for SMC call */
-#define SMC_ARG_CNT_32	13U
+/*
+ * The SMC call provides 16 32-bit argument registers. The header consumes
+ * some of them, so the number left for arguments depends on the SMC format:
+ *  - Extended SMC: 3 used by the header, SMC_ARG_CNT_32 (13) for arguments.
+ *  - Basic SMC:    2 used by the header, SMC_ARG_CNT_BASIC_32 (14) for arguments.
+ */
+#define SMC_ARG_CNT_32		13U	/* Extended SMC 32-bit arg count */
+#define SMC_ARG_CNT_BASIC_32	14U	/* Basic SMC 32-bit arg count */
 
 /* Number of arguments for a callback */
 #define CB_ARG_CNT     4
-- 
2.34.1


