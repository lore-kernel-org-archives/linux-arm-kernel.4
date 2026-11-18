Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4512F60A2620
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 23:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3+HhNgcK;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=5Z9lWqLz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=t7lRKi81jotThQ4nAMzqZzLylswWMXvcbKHPOtLo4Gw=; b=3+HhNgcKrDuqzjbeAG7WpShw8x
	hVcRey8zikfRUcvELRnWA0lqjgZ3PflMX/FKZxbH85YSg5Nul7Xaon5wirdzfzpkQYM6mqyL/x2lY
	xoTp6Yk08BJsiR5GQXw359Fbf/emEqbebHxJUgHwvXc5LG9AfIEwXS3y4VCP99K205kUrCgUs8vcG
	At48fKv9Mm0fE5F4Msu5yu6gs223w/fqBUoth4QlLGH8uubxbpjC4OfZSelv4Ct9WMMcG0GL1SWsB
	Wqb/yfZO+UXffXoL0dDVRa7DWI5N2nJmJ6QtYb8zcDtska8jsZqxx8rkdosHezFpCb+VOS8fUzA0c
	q6Clv0ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTp9J-0000000AVNN-3myH;
	Wed, 18 Nov 2026 23:33:09 +0000
Received: from mail-westcentralusazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c112::7] helo=CY3PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTp8p-0000000AV3c-0pYE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 23:32:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jpfj9453pa+fHPlTfckoiWaomo16hJ3mJBHObBphYsJ/hewmB1+KokQuNTnba34AJlkEOqehlf5HLr/eP+mEuJgdUDk2KBLR3pMQpcQW0EqYY5CS3KySON+FYFYEg/TZ7/e5E1EEjudd6beDsLLmcCPuK8xQ9nCkbGph9eTguIw6X4gyzPmvRhKBQWU0SwYCJC9gUdN5n0N7JiR99ChIVmwWVqEmVrOEc/dA0jyhKoHLygxFGoh7STmSjrJdgO0YNNJO2G6F4016810V5XJgL3ssHUe27TyWBi6ERnDl2zXvKTgLz/w6yYFtMye8Lyc5dhwpzONcYp6EzrdOgU1OEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t7lRKi81jotThQ4nAMzqZzLylswWMXvcbKHPOtLo4Gw=;
 b=oEsKtkC8LQl8dyQPDvMAl5B4FKCISe1tuJsxc/IqcjWGD7NJk0LxI0kPz25UPb2XSPO2YVrUlyLtcbwzZtP3je2tspLNxASzhhF4nsSR+keGF5SYQPNU3y0QYcP5RDCpb+cEUoomyKG6oaLy3F1A7Toh2bgDfZysZa7rqrzptw1yAHfO7j80GOhDDBEridRm0rOD7OlFBSdXXoSaD0Q2+rSoII/A7LlFYxx7JHLx/+3qQvDqt7JKD1Ji0uTJO6KixZtPrb5AKK3pky43WLyhk1AX6sMbsEV5B/H8pvzyBqTHdHfA9+1xb3sQ2OwijdEBTf6IUqAJQJ/jirr81T0WxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t7lRKi81jotThQ4nAMzqZzLylswWMXvcbKHPOtLo4Gw=;
 b=5Z9lWqLzRfOs6lA271tiJwlzScyWEKQa5LKc2jUEaomEbv7LTlvO7h0BuBAG2L7P1nOMB9f/Nhq2R5NunRzZSAgNbRik//ziJBNs72OPOYHh9bJnLp60A0Yo/uiZA+tbfWTaUy6J0y5WSHZTyc8oPu3sx58rptyeux9GeyVSNt4=
Received: from BLAPR05CA0009.namprd05.prod.outlook.com (2603:10b6:208:36e::16)
 by SA1PR12MB8987.namprd12.prod.outlook.com (2603:10b6:806:386::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Wed, 18 Nov
 2026 23:32:28 +0000
Received: from IA0PEPF00000038.namprd03.prod.outlook.com
 (2603:10b6:208:36e:cafe::14) by BLAPR05CA0009.outlook.office365.com
 (2603:10b6:208:36e::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.10 via Frontend Transport; Wed,
 18 Nov 2026 23:32:25 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 IA0PEPF00000038.mail.protection.outlook.com (10.167.249.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 18 Nov 2026 23:32:24 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 17:32:23 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 17:32:23 -0600
Received: from xsjgregoryw50.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Wed, 18 Nov 2026 17:32:22 -0600
From: Gregory Williams <gregory.williams@amd.com>
To: Michal Simek <michal.simek@amd.com>
CC: Senthil Nathan Thangaraj <senthilnathan.thangaraj@amd.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 07/15] firmware: xilinx: Add support for Versal Gen 2
Date: Wed, 18 Nov 2026 15:32:03 -0800
Message-ID: <20261118233211.4121361-8-gregory.williams@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261118233211.4121361-1-gregory.williams@amd.com>
References: <20261118233211.4121361-1-gregory.williams@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PEPF00000038:EE_|SA1PR12MB8987:EE_
X-MS-Office365-Filtering-Correlation-Id: ac2eddbd-cf4f-45f0-eee2-08df45cc336a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|36860700016|82310400026|1800799024|22082099003|18002099003|6133799003|10067099003|261028144727099003|261021123027099003|261026130827099003|261021121427099003|261026140227099003|5023799004|261021130227099003|11063799006|261026121527099003|261022075727099003|261021135927099003|261022105027099003|261009223027099003|261022115727099003|56012099006|261022113327099003|261102130727099003|261102123227099003;
X-Microsoft-Antispam-Message-Info: 5vev1zyBQtvMuNFFi3jvnO9lN+ziNAJKoQvjJPU0iW+cp/boIH7FQ/AAdvBB6yQf3449lIs5xdNzzHhz4HHN3/HkBaKubptyB0pU3MlH2EXsPiP/fvpEP765VHJkRlYxfrccfjsMA92PIbCLJyMrrb5+2XkAeZsGW22iDrasl9yYSzoNc/EHnpIIoaA6isFtpF7SWnOx8OsoSri5d127fEBA/yz5YHzdAT5vGSc/twKLhdhFefTT3WQRsPvHePpKsA+ka2Rd5ZN0HrmVLe2D3r6z/TV6fq5MbpOXWZ7Ykt+/qa866zBg4Zj43Nq8GEgxAzHr3mtBtkkRAv0PiuZbpr9YgWXsi9midiTa1+BIE15WvkEiYWYjWcExuPoXdAt1Rs3u6dXrmP8qwdY8iS+zt6+cIlVe8jnKLwFVlOQjm78DVdFGfRzqqQP+kuKRgE11V07ztjNyHE4FlqPpVMLGptUIZ79Sn0OpUJsJ6JIeG85aBYW5ydhX92mKRe1E+J4R0i7tVq4PmXpPXJ6hZ6ptRcZ0RXvyQRW0aE3Q7nBAaqwcn/HoiKEv47AHCI7y2O0xNLLXts19peQS+o21IgC/vQjqnaJ7ROJpzxl6pNK1ModS+wUhvt1D9z1Opj737QlTvWfc3zfc+r5/Nm/SmGZBs3CvPBd7rxcwAo2NtJB3DMRA5ifQKqIdbhdN2o8KW7DW2/Oc7C25S1G+tOu8Q5/9TA==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(36860700016)(82310400026)(1800799024)(22082099003)(18002099003)(6133799003)(10067099003)(261028144727099003)(261021123027099003)(261026130827099003)(261021121427099003)(261026140227099003)(5023799004)(261021130227099003)(11063799006)(261026121527099003)(261022075727099003)(261021135927099003)(261022105027099003)(261009223027099003)(261022115727099003)(56012099006)(261022113327099003)(261102130727099003)(261102123227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: VFdbTOCCJbu1Wplsr9tQEZMRmZlEDkLNsr5Zi/YJuo6JKjKvURdLUmVS4ZNWRtpi03srsXIWr6R3eYhEjq95z7v65KJlKT12DGcNZLmHaCXZ5qLJHQpwRChL9Yb4Xy6QacTejvCilosbff7YbyvppY4S7eyE5m2yqWmF4pKj+iKKHlwAJUlf/sYCLfca5aosBmp8q3z2mFurWaAJ0vd7HYq9hXCyGqZSAf00v8DyGOwxS11/Ju52HJwpPQy2qM/lYQ9weET6WEQOpjfah3NlrfmObARUkwb46xaC80TK8MV4QWUfP0bTzrkkLGDqJix1nG7KCHn6SspfjNCYo2WPVrbZlER/9AG7o6ueWM67wKu2VkLT0m6xxbFJBB52XaXInj4+Rq2Ufu+K6YhdlQ5xO7TeMJGzeEwHLxt+cdTBZnlRbUj8z5Jsc3LDhIW5hl3J
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 23:32:24.7824
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ac2eddbd-cf4f-45f0-eee2-08df45cc336a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: IA0PEPF00000038.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8987
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_153239_322282_F2F7B042 
X-CRM114-Status: GOOD (  22.68  )
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

Until Versal, the extended SMCCC payload was supported only for QUERY_DATA,
while other APIs used the basic SMCCC format.

In Versal Gen 2, all EEMI APIs are supported with extended SMCCC payload
only, enabling a simplified and efficient pass-through implementation.

The TF-A feature check now tries PM_API_FEATURES first and falls back to
PM_FEATURE_CHECK so the same code path works on Versal Gen 2 (where TF-A
only exposes PM_API_FEATURES on the SiP service) and on the older
ZynqMP/Versal/Versal NET platforms (where TF-A exposes PM_FEATURE_CHECK).

Signed-off-by: Michal Simek <michal.simek@amd.com>
Signed-off-by: Senthil Nathan Thangaraj <senthilnathan.thangaraj@amd.com>
---
 drivers/firmware/xilinx/zynqmp.c     | 117 ++++++++++++++++++++++++---
 include/linux/firmware/xlnx-zynqmp.h |   1 +
 2 files changed, 109 insertions(+), 9 deletions(-)

diff --git a/drivers/firmware/xilinx/zynqmp.c b/drivers/firmware/xilinx/zynqmp.c
index 709370933741..a8c70e775ae3 100644
--- a/drivers/firmware/xilinx/zynqmp.c
+++ b/drivers/firmware/xilinx/zynqmp.c
@@ -242,12 +242,24 @@ static u64 prep_pm_hdr_feature_check(void)
 	return PM_SIP_SVC | FIELD_PREP(MODULE_ID_MASK, PM_MODULE_ID) | PM_FEATURE_CHECK;
 }
 
+/**
+ * prep_pm_hdr_api_features - Prepare SMC header for PM_API_FEATURES.
+ * @module_id: Module ID of the API to be checked.
+ *
+ * Return: SMC arg[0] header value.
+ */
+static u64 prep_pm_hdr_api_features(u32 module_id)
+{
+	return PM_SIP_SVC | FIELD_PREP(MODULE_ID_MASK, module_id) | PM_API_FEATURES;
+}
+
 /**
  * do_feature_check_for_tfa_apis - Perform feature check for TF-A APIs.
  * @api_id: API ID to be checked.
  * @ret_payload: Pointer to store the firmware's response payload.
  *
  * Prepares the command header and payload for TF-A APIs and makes the FW call.
+ * Tries PM_API_FEATURES first, then falls back to PM_FEATURE_CHECK.
  *
  * Return:
  * - Feature status word from ret_payload[1] on success
@@ -256,13 +268,68 @@ static u64 prep_pm_hdr_feature_check(void)
 static int do_feature_check_for_tfa_apis(const u32 api_id, u32 *ret_payload)
 {
 	u64 smc_arg[2];
+	u32 module_id;
 	int ret;
 
-	smc_arg[0] = prep_pm_hdr_feature_check();
+	module_id = FIELD_GET(MODULE_ID_MASK, api_id);
+
+	smc_arg[0] = prep_pm_hdr_api_features(module_id);
 	smc_arg[1] = api_id;
 
 	ret = do_fw_call(ret_payload, 2, smc_arg[0], smc_arg[1]);
 
+	if (ret) {
+		smc_arg[0] = prep_pm_hdr_feature_check();
+		ret = do_fw_call(ret_payload, 2, smc_arg[0], smc_arg[1]);
+		if (ret)
+			return -EOPNOTSUPP;
+	}
+
+	return ret_payload[1];
+}
+
+/**
+ * do_feature_check_extended - Perform feature check for an API ID
+ *				 using extended SMCCC format.
+ * @api_id: API ID to be checked.
+ * @ret_payload: Pointer to store the firmware's response payload.
+ *
+ * Determines the appropriate API (PM_FEATURE_CHECK or PM_API_FEATURES) based on
+ * the module ID in the given API ID. Frames the arguments in the extended
+ * SMCCC format, executes the firmware call, and processes the result.
+ *
+ * Return:
+ * - 0 on success
+ * - -EOPNOTSUPP if the firmware call fails.
+ */
+static int do_feature_check_extended(const u32 api_id, u32 *ret_payload)
+{
+	u32 feature_check_api_id;
+	u64 smc_arg[2];
+	u32 module_id;
+	int ret;
+
+	module_id = FIELD_GET(MODULE_ID_MASK, api_id);
+
+	/*
+	 * Feature check of APIs belonging to PM and XSEM are handled by calling
+	 * PM_FEATURE_CHECK API. For other modules, call PM_API_FEATURES API.
+	 */
+	if (module_id == PM_MODULE_ID || module_id == XSEM_MODULE_ID)
+		feature_check_api_id = PM_FEATURE_CHECK;
+	else
+		feature_check_api_id = PM_API_FEATURES;
+
+	if (module_id == PM_MODULE_ID)
+		module_id = XPM_MODULE_ID;
+
+	/* Frame extended SMC format */
+	smc_arg[0] = PM_SIP_SVC | PASS_THROUGH_FW_CMD_ID;
+	smc_arg[1] = ((u64)(api_id & API_ID_MASK) << 32) |
+		      FIELD_PREP(MODULE_ID_MASK, module_id) |
+		      feature_check_api_id;
+
+	ret = do_fw_call(ret_payload, 2, smc_arg[0], smc_arg[1]);
 	if (ret)
 		return -EOPNOTSUPP;
 
@@ -440,11 +507,13 @@ int zynqmp_pm_is_function_supported(const u32 api_id, const u32 id)
 EXPORT_SYMBOL_GPL(zynqmp_pm_is_function_supported);
 
 /**
- * zynqmp_pm_fw_call_extended() - Invoke the system-level platform management layer
+ * __zynqmp_pm_fw_call_extended() - Invoke the system-level platform management layer
  *			caller function depending on the configuration
  * @pm_api_id:		Requested PM-API call
  * @ret_payload:	Returned value array
  * @num_args:		Number of arguments to requested PM-API call
+ * @arg_list:		va_list initialized with va_start, containing arguments passed
+ *			to the firmware.
  *
  * Invoke platform management function for SMC or HVC call, depending on
  * configuration.
@@ -461,7 +530,8 @@ EXPORT_SYMBOL_GPL(zynqmp_pm_is_function_supported);
  *
  * Return: Returns status, either success or error+reason
  */
-int zynqmp_pm_fw_call_extended(u32 pm_api_id, u32 *ret_payload, u32 num_args, ...)
+static int __zynqmp_pm_fw_call_extended(u32 pm_api_id, u32 *ret_payload,
+					u32 num_args, va_list *arg_list)
 {
 	/*
 	 * Added SIP service call Function Identifier
@@ -469,7 +539,6 @@ int zynqmp_pm_fw_call_extended(u32 pm_api_id, u32 *ret_payload, u32 num_args, ..
 	 */
 	u64 smc_arg[SMC_ARG_CNT_64];
 	int ret, i;
-	va_list arg_list;
 	u32 args[SMC_ARG_CNT_32] = {0};
 	u32 module_id;
 
@@ -485,12 +554,8 @@ int zynqmp_pm_fw_call_extended(u32 pm_api_id, u32 *ret_payload, u32 num_args, ..
 	if (ret < 0)
 		return ret;
 
-	va_start(arg_list, num_args);
-
 	for (i = 0; i < num_args; i++)
-		args[i] = va_arg(arg_list, u32);
-
-	va_end(arg_list);
+		args[i] = va_arg(*arg_list, u32);
 
 	module_id = FIELD_GET(PLM_MODULE_ID_MASK, pm_api_id);
 
@@ -507,6 +572,33 @@ int zynqmp_pm_fw_call_extended(u32 pm_api_id, u32 *ret_payload, u32 num_args, ..
 			  smc_arg[4], smc_arg[5], smc_arg[6], smc_arg[7]);
 }
 
+/**
+ * zynqmp_pm_fw_call_extended - Invoke a PM function with variable arguments
+ * @pm_api_id: ID of the PM API to be called
+ * @ret_payload: Pointer to the buffer for storing the return payload
+ * @num_args: Number of arguments to pass to the PM API function
+ *
+ * This function serves as a wrapper around __zynqmp_pm_fw_call_extended(),
+ * facilitating the invocation of platform management (PM) functions that
+ * require an extended SMC (Secure Monitor Call) format with variable
+ * arguments. Specifically, the PM_QUERY_DATA API necessitates this extended
+ * payload format, making it essential to retain zynqmp_pm_fw_call_extended
+ * with variable arguments.
+ *
+ * Return: 0 on success; a negative error code on failure.
+ */
+int zynqmp_pm_fw_call_extended(u32 pm_api_id, u32 *ret_payload, u32 num_args, ...)
+{
+	va_list arg_list;
+	int ret;
+
+	va_start(arg_list, num_args);
+	ret = __zynqmp_pm_fw_call_extended(pm_api_id, ret_payload,
+					   num_args, &arg_list);
+	va_end(arg_list);
+	return ret;
+}
+
 /**
  * __zynqmp_pm_fw_call_basic() - Invoke the system-level platform management layer
  *				 supporting basic SMC format.
@@ -2522,6 +2614,12 @@ static void zynqmp_firmware_sync_state(struct device *dev)
 		dev_warn(dev, "failed to release power management to firmware\n");
 }
 
+static const struct platform_fw_data platform_fw_data_versal2 = {
+	.do_feature_check = do_feature_check_extended,
+	.zynqmp_pm_fw_call = __zynqmp_pm_fw_call_extended,
+	.family_code = PM_VERSAL2_FAMILY_CODE,
+};
+
 static const struct platform_fw_data platform_fw_data_versal = {
 	.do_feature_check = do_feature_check_basic,
 	.zynqmp_pm_fw_call = __zynqmp_pm_fw_call_basic,
@@ -2544,6 +2642,7 @@ static const struct of_device_id zynqmp_firmware_of_match[] = {
 	{.compatible = "xlnx,zynqmp-firmware", .data = &platform_fw_data_zynqmp},
 	{.compatible = "xlnx,versal-firmware", .data = &platform_fw_data_versal},
 	{.compatible = "xlnx,versal-net-firmware", .data = &platform_fw_data_versal_net},
+	{.compatible = "xlnx,versal2-firmware",	.data = &platform_fw_data_versal2},
 	{},
 };
 MODULE_DEVICE_TABLE(of, zynqmp_firmware_of_match);
diff --git a/include/linux/firmware/xlnx-zynqmp.h b/include/linux/firmware/xlnx-zynqmp.h
index 58f2e3fddfaf..effa1a2445b3 100644
--- a/include/linux/firmware/xlnx-zynqmp.h
+++ b/include/linux/firmware/xlnx-zynqmp.h
@@ -58,6 +58,7 @@
 #define PM_ZYNQMP_FAMILY_CODE 0x1 /* ZynqMP family code */
 #define PM_VERSAL_FAMILY_CODE 0x2 /* Versal family code */
 #define PM_VERSAL_NET_FAMILY_CODE 0x3 /* Versal NET family code */
+#define PM_VERSAL2_FAMILY_CODE 0x4 /* Versal Gen 2 family code */
 
 #define API_ID_MASK		GENMASK(7, 0)
 #define MODULE_ID_MASK		GENMASK(11, 8)
-- 
2.34.1


