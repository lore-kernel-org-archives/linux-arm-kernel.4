Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF23606A9D0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 23:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nf5Vjjle;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=oKdB8HG+;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=fu9jL5m7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=JorPTiacwS74P1OKvh5U1c+yCkBeFH5wY6zitGMy7QE=; b=nf5VjjleR3GN5XUgL4hLtHPyRe
	Sqr5uHYdX1XeKEQ2B35LCQSWh0OKBdy6oAYL/UcKwFtKku2A8QpJbRmw8p3bZIAokovUtLZcMM56k
	NJaXxix5jEXPHTGfiuj1Ch8w8Avald2VpDRArs1qtWRVI1a4JXyCsxA2sWl9wtK8CgLM+TeJaRj9f
	FrYtBPnSu1RYkrRPVME7eTxsJruwN8L7fGhfc+mAvdKDfuR0a1cgFJUA/1DdS5TSiVBjigEsIj8Qk
	bThUEVpbC/kI3L3AOgZkptMOoPL+Y3XrxwaoFa90iRbxmNP9bJCPUxqSNZE1bCCl0ypCFrGC7qevR
	0eQw03Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTpAK-0000000AVq5-0X7T;
	Wed, 18 Nov 2026 23:34:12 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTpAI-0000000AVpr-1JDF
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 18 Nov 2026 23:34:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=JorPTiacwS74P1OKvh5U1c+yCkBeFH5wY6zitGMy7QE=; b=oKdB8HG+Dd3PhGUKLiFPc5ZBvT
	gwa6E/RWLaKtsa/HkUkYnY+0H3XaQe5+l0CU9kBI6N0Un7Y2Sc2XLeAO4H2Y5cUfSQZQzUDfx8fP9
	GZdD5kej5z7jg6ntZM+2cheaiEepWrXcncLYuzI7QA43sp0XnSRwG1nj9fSntXkqJL4D5aMIvlg8g
	4d9kmzSY1lUYzxDkL/y2jCpdL00tSaN6Ia4q/0T+riIGC9opHf5reLlXWz9qY3BFoJBmYxu4Oew25
	G84i7zBtVG8v1cCIPwguPxRK3s0oDo2oh6sznI+QfWmVrXdor12jZbRV6bq3cZh1vYMWHeqqtfWFv
	xQbT+c3Q==;
Received: from mail-centralusazlp170110009.outbound.protection.outlook.com ([2a01:111:f403:c111::9] helo=DM5PR21CU001.outbound.protection.outlook.com)
	by casper.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTpAE-00000000gry-1gJH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 23:34:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SIQkWJU5CgY7izHFbYPFkSaHxWk6LdCq2Z9pdfv5ZMhtQSQf9VDiSYMTrccWkVaY8Ios559jOuI3uOrE0vqSp8DS/e/J4IZZUalXmz7+tiOGnhoSc/UZQXgepy/+E+nO1YLC72OeTTI0VNbuyCmpLn433KdWG4L4bkAxqIQ0f+YdCiAL8ieGCr6Lv24lSwDI6TcGJfVu4XtzJPafoAIHsVwXrCDi5YR2VyYGyXDNHl+6s9K50r4uDNBWhmLlNwxiutrskG+svPtH7/9Vi9i2L+RLzmgS4W/zTjUo8HSWeG3eJ+iSkV8G7xv72rOJ12EjqhLMug1aMWC+DlMaVLCWwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JorPTiacwS74P1OKvh5U1c+yCkBeFH5wY6zitGMy7QE=;
 b=o2raEEu++/T6/9ONBjDLuYZe/xEypi7yAqDl+a7EyQmdgzRy3nsWcbbpsZN3d8ZN6LJBSjVJixwFq02wJ6DxsgNfgqUZU9PkZyLicZpiORJDoPe6H5sA8h9EcOdlhJgk5twQ0WevJOPnfXfs8H3IU9MNQGXtWn0qhuOp2hwEzpS+Fue0VxSLnDFwRJZghInhGFTt42RONKgQ2yU0TYrM0EKaJEABDVW0VY2znC0uUGxVrNR9FK+ltiDZtgS6fUbMfyFIB/DumKM1pWrfiJfmU9A5muYKEvIQbGoXg7zGxG27x+RsDhf91UwA+15If53rz6/naqTPp9OynLPyAxqruQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JorPTiacwS74P1OKvh5U1c+yCkBeFH5wY6zitGMy7QE=;
 b=fu9jL5m7Mry7XJRrMBReXufv8Ta6eS/ie5dpoi+FxzeX4BH4hPDntqvw7W6PJSROSzyRkAffoLcut9+XM6BzHnbKZrJuHhE9xXds8IcoilGKwMfHWLIz5wg+3I5gHzaOLxaGzg4dwTc7MzuxwoX8qbWJTbVQIFL8Hle8XsbX5jA=
Received: from BL1PR13CA0145.namprd13.prod.outlook.com (2603:10b6:208:2bb::30)
 by IA4PR12MB9811.namprd12.prod.outlook.com (2603:10b6:208:54e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 23:32:21 +0000
Received: from IA0PEPF0000003E.namprd03.prod.outlook.com
 (2603:10b6:208:2bb:cafe::7a) by BL1PR13CA0145.outlook.office365.com
 (2603:10b6:208:2bb::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.0 via Frontend Transport; Wed, 18
 Nov 2026 23:32:21 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 IA0PEPF0000003E.mail.protection.outlook.com (10.167.249.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 18 Nov 2026 23:32:21 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 17:32:20 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 17:32:20 -0600
Received: from xsjgregoryw50.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Wed, 18 Nov 2026 17:32:19 -0600
From: Gregory Williams <gregory.williams@amd.com>
To: Michal Simek <michal.simek@amd.com>
CC: Senthil Nathan Thangaraj <senthilnathan.thangaraj@amd.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 05/15] firmware: xilinx: Rename zynqmp_pm_invoke_fw_fn()
Date: Wed, 18 Nov 2026 15:32:01 -0800
Message-ID: <20261118233211.4121361-6-gregory.williams@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261118233211.4121361-1-gregory.williams@amd.com>
References: <20261118233211.4121361-1-gregory.williams@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PEPF0000003E:EE_|IA4PR12MB9811:EE_
X-MS-Office365-Filtering-Correlation-Id: 11deb09b-3155-48c8-6bf6-08df45cc31b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|82310400026|36860700016|1800799024|376014|261102123227099003|261026140227099003|261026121527099003|261028144727099003|11063799006|261022075727099003|261021121427099003|261021123027099003|261022105027099003|261102130727099003|5023799004|56012099006|10067099003|18002099003|22082099003|261009223027099003|6133799003;
X-Microsoft-Antispam-Message-Info: sElF/Lf4+BBDJk7wiK7TRyxvQVSlgq4IDsh+zkv8BSO+Gsne81SkMHSCFW5aQ2tknEDXScZl3YxvwT/2ln8W7LaHX8J1sY+C7WS0rwJWk3eRIBCAG9IaxtQtCA/EzXZdxmJ4A290WzPfor3AU9D9bWsw7kRDvwKZ28FyqrWXqfoHnEFZ0LE4NhsyPLrOBlA51kUfybRLVOmStJDDkA35nw33bFeQxwYEnkKLIwsFTa4DTmtYQ+ToApG+bDaH5Uh/3Mt8LTPblwY0L6ZqieE3hlU19HDbykwvdg8bROHzNKspJj6Hz+tE4GXhuFIUmVHsMrhVpW4ANOF9XdZ2dgXETbsvUZ26WxQWE7vUxFO5k5groShXZoW/u9BrKuksp/Tb8uOTYzAoxyFznct8BLd2h3TR7vSJjN9OeTgH2b4Yc3b38kWdkLFQPdbRSvKrjlZcapf5t2dxUHohZYSgJjvc9bPi5hkhBKq0ORAx8nbpDBklwL9RqgvI5gbCk7Y40MuH1sY+nGFGYuVZE/m4tANXOgNl52tBSO0mQHdadm+sxZy+kaJk5HYGVBjcm7aACKJF45hTI6OGbuBmoVheBsKvXzS4uqafTqgpvP2oBL1DxyT5Xg15aW27VO93of7me+2VNt2g4e95fGBnQSGvD0OfUzlXB6x5cjkU1cZ/3+BztNkK6ESuDSSQMB9O5LXN+EX2IEJqeNSomEEpm+F8MWxw4g==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(1800799024)(376014)(261102123227099003)(261026140227099003)(261026121527099003)(261028144727099003)(11063799006)(261022075727099003)(261021121427099003)(261021123027099003)(261022105027099003)(261102130727099003)(5023799004)(56012099006)(10067099003)(18002099003)(22082099003)(261009223027099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 01pXQi2JR3srvYKhZ/vUz/moVv2OHhz8UG+znLvCAyWB4qb7s+8o31v7PhRXs5W46NKbdZyb+UzL79cKYYprHFbbVpo9RbxOTHEnOxU8zXg18521fyXiJX5SCPeT8/HPbf2nF06USYYX1/gDItt/mXWhHyTDPkdEoKQLeGI0RhCHhL7IArGCkixD+t3IOUewoih8xplv6YQv5xCS1eGCXmGNgtwNGeUAVjNlvyqRRVe9rJFCJQTIrVn71IRZVlrha/kwJnM65Tpa7iZom++bZHX1lMR6UlM9Em9MLv7R386OuK8xRr2ZpX0A2A+TvpnTiJDxnxsMlQKx8atZFHb3QF32iPHJJySrrfWPjp7dXyhmaJnft7j+VRkGFNj38oLR5ULjaP9i7lTCoLf6nVv71OyZsRUENeupJDFXNDOo+l3Exoc2DfHoeXeP4roVOpX8
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 23:32:21.9105
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 11deb09b-3155-48c8-6bf6-08df45cc31b4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: IA0PEPF0000003E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR12MB9811
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_233406_646615_D28717F3 
X-CRM114-Status: GOOD (  13.40  )
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

The function name zynqmp_pm_invoke_fw_fn() doesn't really reflect what this
function does, so rename it to zynqmp_pm_fw_call_extended(), which reflects
which firmware format is used.

Signed-off-by: Michal Simek <michal.simek@amd.com>
Signed-off-by: Senthil Nathan Thangaraj <senthilnathan.thangaraj@amd.com>
---
 drivers/firmware/xilinx/zynqmp.c     | 10 +++++-----
 include/linux/firmware/xlnx-zynqmp.h |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/firmware/xilinx/zynqmp.c b/drivers/firmware/xilinx/zynqmp.c
index f5ad99e0026c..709370933741 100644
--- a/drivers/firmware/xilinx/zynqmp.c
+++ b/drivers/firmware/xilinx/zynqmp.c
@@ -440,7 +440,7 @@ int zynqmp_pm_is_function_supported(const u32 api_id, const u32 id)
 EXPORT_SYMBOL_GPL(zynqmp_pm_is_function_supported);
 
 /**
- * zynqmp_pm_invoke_fw_fn() - Invoke the system-level platform management layer
+ * zynqmp_pm_fw_call_extended() - Invoke the system-level platform management layer
  *			caller function depending on the configuration
  * @pm_api_id:		Requested PM-API call
  * @ret_payload:	Returned value array
@@ -461,7 +461,7 @@ EXPORT_SYMBOL_GPL(zynqmp_pm_is_function_supported);
  *
  * Return: Returns status, either success or error+reason
  */
-int zynqmp_pm_invoke_fw_fn(u32 pm_api_id, u32 *ret_payload, u32 num_args, ...)
+int zynqmp_pm_fw_call_extended(u32 pm_api_id, u32 *ret_payload, u32 num_args, ...)
 {
 	/*
 	 * Added SIP service call Function Identifier
@@ -796,9 +796,9 @@ int zynqmp_pm_query_data(struct zynqmp_pm_query_data qdata, u32 *out)
 	u32 ret_payload[PAYLOAD_ARG_CNT] = {0};
 
 	if (sip_svc_version >= SIP_SVC_PASSTHROUGH_VERSION) {
-		ret = zynqmp_pm_invoke_fw_fn(PM_QUERY_DATA, ret_payload, 4,
-					     qdata.qid, qdata.arg1,
-					     qdata.arg2, qdata.arg3);
+		ret = zynqmp_pm_fw_call_extended(PM_QUERY_DATA, ret_payload, 4,
+						 qdata.qid, qdata.arg1,
+						 qdata.arg2, qdata.arg3);
 		/* To support backward compatibility */
 		if (!ret && !ret_payload[0]) {
 			/*
diff --git a/include/linux/firmware/xlnx-zynqmp.h b/include/linux/firmware/xlnx-zynqmp.h
index 681ab99ceffc..58f2e3fddfaf 100644
--- a/include/linux/firmware/xlnx-zynqmp.h
+++ b/include/linux/firmware/xlnx-zynqmp.h
@@ -578,7 +578,7 @@ struct zynqmp_pm_query_data {
 };
 
 int zynqmp_pm_invoke_fn(u32 pm_api_id, u32 *ret_payload, u32 num_args, ...);
-int zynqmp_pm_invoke_fw_fn(u32 pm_api_id, u32 *ret_payload, u32 num_args, ...);
+int zynqmp_pm_fw_call_extended(u32 pm_api_id, u32 *ret_payload, u32 num_args, ...);
 
 #if IS_REACHABLE(CONFIG_ZYNQMP_FIRMWARE)
 int zynqmp_pm_get_api_version(u32 *version);
-- 
2.34.1


