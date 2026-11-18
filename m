Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5112460A6F64
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 23:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Gl/BdFC4;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=pHawinzM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=6LfuT88PV6xJev1MTBRf+xgrNQnm7N0fKmbDA8qNmjA=; b=Gl/BdFC4JbJ5BvUoPMRx9bMwJe
	DFIvNbpdpRz02BoSqBoYqsVfLVo7+QHyY+8snr7+bSmeSJOqqEfSqsEtZ4g8kL96H59qeSe4dhsIk
	IOmYoZyFLrssKi4STDeNFV1BISpyzKGZZ6O3M7UsWX/tmNWX4J9Pn0eTiM8EGFI/jF8OX31Tdk1Be
	ZCvAX/ZsgFp4S2gcLVceLpvOP6BSamjE4yg8cQyC2InHjTmwZvZ2v3t86XX2oPKQyl6+Ic2IHpxO7
	A6r/x+T1WW2m4yJxtjuSjL56D0VOS+30TvDR3D5zV73Iu2L0vJnZnBSErvz9qFhRakAdg0HVK2hWj
	l5DlKw6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTp8p-0000000AV46-09J2;
	Wed, 18 Nov 2026 23:32:39 +0000
Received: from mail-westusazlp170120002.outbound.protection.outlook.com ([2a01:111:f403:c001::2] helo=SJ2PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTp8b-0000000AUyQ-2teN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 23:32:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mIUZeX7Xe4uQ7+mr4YSTXMUX+p/HUxpQgOdTQ/39xNVzPUh0pPe744hksceHEuWrYBaBSmqPUM8Cb9ulukjC0HG0Y+DYxDWDDHC188EALcVOFZM2TBmpnRceJcIBu/WWZX8FTgHMnyjf++wr08xO+Fu3hegw9FpSOLF5WZdYO67kKgxHjnKik6M+90ZkPZ8aaoc+HbOPaxV/asT86AmYyoCNE9Jlufy2ZT7f999660wMHjrAYJzlTFUu1oS5TwyXK4oRo6tOY5AVAa535+JfXpP2zuf6g4jFOSnSfutwL+WjVXk6ww2WM4aFVYHj09O3wV0FKdBPvXEXd3G1xs+X9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6LfuT88PV6xJev1MTBRf+xgrNQnm7N0fKmbDA8qNmjA=;
 b=V+ynCHOodGSUbX2dVvmdAu4Af1MQ+2ocsfKZXKWMsPB5DCyG+KOibYocePCIVz/P3ayxXz1BlB54Co18UFUElot5OI/cfHtZnofzO4dw7EQB1IEu9yGeoSuKZynvBb7AFfrOV2L2UkTVHGtXjrW2ugXL7jz20PORwsTv1mCjuJ8vSuzWtUnRh1Zx+oS+CKMpqnXjBTDS7ww3PibRDFjPplbpJ58sJc/qaKGLgYN2qWMDcNdSWVNbmYNggNxi+kC62mZ7fl2eqVngQSh0Uz6ZCpENDe10aI96VySO+Ohc1WTGt6bluR9aDDf9vZNrw/6ixmCJRajGXj8Dir/MzHMVgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6LfuT88PV6xJev1MTBRf+xgrNQnm7N0fKmbDA8qNmjA=;
 b=pHawinzMTUSkcpFNRjaZ4I8ya+fSw1Ap2Ozu5GbKIDnHmfqPVYp4RlLjWFmSt+qnIzkfYnYUCH2BWTFIuwMRyjwhuJLujCb3Mzb8KiQceOxATKpz4iPmdof3zcoknA2s9+Uu8L7rBtAfUuqwNowvN8OSu5hXcwin1TC1S4CX+Hk=
Received: from MN0PR02CA0010.namprd02.prod.outlook.com (2603:10b6:208:530::8)
 by MW4PR12MB5626.namprd12.prod.outlook.com (2603:10b6:303:169::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 23:32:17 +0000
Received: from IA0PEPF00000039.namprd03.prod.outlook.com
 (2603:10b6:208:530:cafe::9d) by MN0PR02CA0010.outlook.office365.com
 (2603:10b6:208:530::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Wed,
 18 Nov 2026 23:32:16 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 IA0PEPF00000039.mail.protection.outlook.com (10.167.249.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 18 Nov 2026 23:32:16 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 17:32:14 -0600
Received: from xsjgregoryw50.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Wed, 18 Nov 2026 17:32:14 -0600
From: Gregory Williams <gregory.williams@amd.com>
To: Michal Simek <michal.simek@amd.com>
CC: Senthil Nathan Thangaraj <senthilnathan.thangaraj@amd.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 01/15] firmware: xilinx: Separate TF-A checking
Date: Wed, 18 Nov 2026 15:31:57 -0800
Message-ID: <20261118233211.4121361-2-gregory.williams@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261118233211.4121361-1-gregory.williams@amd.com>
References: <20261118233211.4121361-1-gregory.williams@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PEPF00000039:EE_|MW4PR12MB5626:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ed7e302-7bdb-4a08-26ed-08df45cc2e68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|36860700016|376014|82310400026|261022113327099003|261022075727099003|261021123027099003|10067099003|56012099006|11063799006|261022115727099003|261026140227099003|261028144727099003|261021130227099003|261021121427099003|261022105027099003|261026130827099003|261026121527099003|261102123227099003|261021135927099003|261009223027099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: LxFfmSi8lh2Eak/fqPO7H1ZUccJtoaecIazK7oS3p73zo9D4invhfvkMsZI/5jcbzStXVVf7/QqnonMHoy8R3SAbtvb9LMfzesbFaXwc6UY4uvBTHbjtHzJKGtR4bxa83hJ6kPpZ/5KVvwpx8LqOJYitkfWhA4n+0b1d5D9Tvmtb13y3a/CupB/129xP7ilA1pwhyST9MP0ZRY3xHn684yuVBLmrS3Dsl7hQ0HXgi+VqUYI8OC9uW1Dki1sBnt/QAbIz71hL3wd8am015u0gFBY0uguYNtqyJZhj71XHxduOnKUKCJyZ2sslAz/0AoKtFIR7zDw8SvfYiJ2VS98+OMAx29P+VKudkZkbejcFIN2HJbyMh6jNmsRAgzmWHfB6WwWlCnO3le3SYSp6DnweTMpbi1M9rNlQhDVmHdHuA6cTff2C03t6f3iwAeYNfx+m2lF7m9ewFWCpdUeivvJXfqILZXhxGe/3FdCgofqYSqvqOGNW3z6owm6ToTiqEInYC4MF3P93wxfhu5JoAYGt0bOkxyGgSwCAAg1t8u+XK5brNd7Jf84FL0Ng3scNpg+/Y87eBJ6GKeiSsr41c9Xs+CLVojf+tqcI5VILxERuliZI1vrH2OKNehYsY4HuDawuctexqtJ2Nglc1U4Z0hvh7k54o02q9vE5oIUX5M5gCzDaCtVHR1Kzs7gv5I0/VIX8PsfkXTJoEWUE67v6TcWQNg==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(36860700016)(376014)(82310400026)(261022113327099003)(261022075727099003)(261021123027099003)(10067099003)(56012099006)(11063799006)(261022115727099003)(261026140227099003)(261028144727099003)(261021130227099003)(261021121427099003)(261022105027099003)(261026130827099003)(261026121527099003)(261102123227099003)(261021135927099003)(261009223027099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: teuFRJnFIWBRSNez8X/xfQ9TF4ipDlwXT0WWYdiBM9wADrdydz6X0vNZ59PMcGwL16ZmDPQtdK/d1+xjOBu5AdfoEHwLzHw3STwbSnhqwDzk/38urGUYOjgmWnvxk9p7jGx/PDCp3JrwsG7e3iWWNbDoZ4YzkRFuMFLu4r/zGvXIY3RvIqOs0YNBU+X+c6dOOqdunNfaE882ZCJ/dwYb/GM6ldM1pNfm4qGWWXeZYyafgk0XUXjNKK00eTlYRP18zI4E6O0LbKyomIZCZeAuLKxRcZeqYlA4Q90ZQDV5ZvvrKhWnJQ6wpgICKminCBxddIeBPGBr80Z2Cl8wliB8JAgiGzVZ3wDaLxrcX28MLdXaubFydWilhsGWq12Vem8VlCX8SbliuG1SB/I8bF+CaFxgQ6XqgTFX0VGpafkiCBlR9vk7D8K7VCDX2Fly8g/0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 23:32:16.3692
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ed7e302-7bdb-4a08-26ed-08df45cc2e68
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: IA0PEPF00000039.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5626
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_153225_831315_2631DF5E 
X-CRM114-Status: GOOD (  18.44  )
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

Feature check of TF-A APIs has special requirement to fill in specific
module/id and API ID based on the platform requirement.

This separation of TF-A feature checking facilitates a smoother transition
to extended SMCCC format.

Co-developed-by: Michal Simek <michal.simek@amd.com>
Signed-off-by: Michal Simek <michal.simek@amd.com>
Signed-off-by: Senthil Nathan Thangaraj <senthilnathan.thangaraj@amd.com>
---
 drivers/firmware/xilinx/zynqmp.c | 105 +++++++++++++++++++++++++------
 1 file changed, 85 insertions(+), 20 deletions(-)

diff --git a/drivers/firmware/xilinx/zynqmp.c b/drivers/firmware/xilinx/zynqmp.c
index 727a9888a933..940306079a78 100644
--- a/drivers/firmware/xilinx/zynqmp.c
+++ b/drivers/firmware/xilinx/zynqmp.c
@@ -214,12 +214,65 @@ static noinline int do_fw_call_hvc(u32 *ret_payload, u32 num_args, ...)
 	return zynqmp_pm_ret_code((enum pm_ret_status)res.a0);
 }
 
-static int __do_feature_check_call(const u32 api_id, u32 *ret_payload)
+/**
+ * prep_pm_hdr_feature_check - Prepare SMC header for PM_FEATURE_CHECK.
+ *
+ * TF-A expects the module field of arg[0] to be PM_MODULE_ID for its feature
+ * check, independent of the queried API's module; hence no module_id arg.
+ *
+ * Return: SMC arg[0] header value.
+ */
+static u64 prep_pm_hdr_feature_check(void)
+{
+	return PM_SIP_SVC | FIELD_PREP(MODULE_ID_MASK, PM_MODULE_ID) | PM_FEATURE_CHECK;
+}
+
+/**
+ * do_feature_check_for_tfa_apis - Perform feature check for TF-A APIs.
+ * @api_id: API ID to be checked.
+ * @ret_payload: Pointer to store the firmware's response payload.
+ *
+ * Prepares the command header and payload for TF-A APIs and makes the FW call.
+ *
+ * Return:
+ * - Feature status word from ret_payload[1] on success
+ * - -EOPNOTSUPP if the firmware call fails
+ */
+static int do_feature_check_for_tfa_apis(const u32 api_id, u32 *ret_payload)
 {
+	u64 smc_arg[2];
 	int ret;
+
+	smc_arg[0] = prep_pm_hdr_feature_check();
+	smc_arg[1] = api_id;
+
+	ret = do_fw_call(ret_payload, 2, smc_arg[0], smc_arg[1]);
+
+	if (ret)
+		return -EOPNOTSUPP;
+
+	return ret_payload[1];
+}
+
+/**
+ * do_feature_check_basic - Perform feature check for an API ID with
+ *			    basic SMC format.
+ * @api_id: API ID to be checked.
+ * @ret_payload: Pointer to store the firmware's response payload.
+ *
+ * Determines the appropriate API (PM_FEATURE_CHECK or PM_API_FEATURES) based on
+ * the module ID in the given API ID. Frames the SMC call arguments in the basic
+ * format, executes the firmware call, and processes the result.
+ *
+ * Return: Feature status word from ret_payload[1] on success; -EOPNOTSUPP if
+ * the firmware call fails.
+ */
+static int do_feature_check_basic(const u32 api_id, u32 *ret_payload)
+{
+	u32 feature_check_api_id;
 	u64 smc_arg[2];
 	u32 module_id;
-	u32 feature_check_api_id;
+	int ret;
 
 	module_id = FIELD_GET(MODULE_ID_MASK, api_id);
 
@@ -232,29 +285,41 @@ static int __do_feature_check_call(const u32 api_id, u32 *ret_payload)
 	else
 		feature_check_api_id = PM_API_FEATURES;
 
-	if (module_id == TF_A_MODULE_ID)
-		smc_arg[1] = api_id;
-	else
-		smc_arg[1] = (api_id & API_ID_MASK);
-
 	smc_arg[0] = PM_SIP_SVC | FIELD_PREP(MODULE_ID_MASK, module_id) | feature_check_api_id;
+	smc_arg[1] = (api_id & API_ID_MASK);
 
 	ret = do_fw_call(ret_payload, 2, smc_arg[0], smc_arg[1]);
+	if (ret)
+		ret = -EOPNOTSUPP;
+	else
+		ret = ret_payload[1];
 
-	/*
-	 * For TF-A APIs, if the feature check with PM_API_FEATURES fails,
-	 * retry with the legacy PM_FEATURE_CHECK for backward compatibility.
-	 */
-	if (module_id == TF_A_MODULE_ID && ret) {
-		smc_arg[0] = PM_SIP_SVC | FIELD_PREP(MODULE_ID_MASK, PM_MODULE_ID) |
-			     PM_FEATURE_CHECK;
-		ret = do_fw_call(ret_payload, 2, smc_arg[0], smc_arg[1]);
-	}
+	return ret;
+}
 
-	if (ret)
-		return ret;
+/**
+ * dispatch_feature_check - Dispatch feature check based on module ID.
+ * @api_id: API ID to be checked.
+ * @ret_payload: Pointer to store the firmware's response payload.
+ *
+ * Determines the appropriate feature check function to call based on the
+ * module ID extracted from the API ID. If the module ID corresponds to
+ * TF-A, it calls do_feature_check_for_tfa_apis(); otherwise, it calls
+ * do_feature_check_basic() which uses basic SMCCC format.
+ *
+ * Return: Feature status word from ret_payload[1] on success; negative error
+ * code on failure.
+ */
+static int dispatch_feature_check(const u32 api_id, u32 *ret_payload)
+{
+	u32 module_id;
 
-	return ret_payload[1];
+	module_id = FIELD_GET(MODULE_ID_MASK, api_id);
+
+	if (module_id == TF_A_MODULE_ID)
+		return do_feature_check_for_tfa_apis(api_id, ret_payload);
+
+	return do_feature_check_basic(api_id, ret_payload);
 }
 
 static int do_feature_check_call(const u32 api_id)
@@ -276,7 +341,7 @@ static int do_feature_check_call(const u32 api_id)
 		return -ENOMEM;
 
 	feature_data->pm_api_id = api_id;
-	ret = __do_feature_check_call(api_id, ret_payload);
+	ret = dispatch_feature_check(api_id, ret_payload);
 
 	feature_data->feature_status = ret;
 	hash_add(pm_api_features_map, &feature_data->hentry, api_id);
-- 
2.34.1


