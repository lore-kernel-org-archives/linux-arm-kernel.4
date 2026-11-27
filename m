Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F320F606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 11:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VQQS0cL9;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=rvvpbxDR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=O49/EZhrxsbPU3NjNVcK5PBeHosMdI1Kl4Yj+l61Ff4=; b=VQQS0cL9FgvhxxkBFW4bHQ+pAU
	3ojte3zVD4gawdF5r2pL0pYVQpzQA+eEFyJCtb04PVeBDTjlBCcJXdUPf8wSYL9ZjnSAz8fvugzxu
	xYnq6TBeq/AfQFwmNb27IRyU5LyKGPUlkQmZd4ZDpo8sT9SM7Ituo96/vBIXBfq2FSYTnCPs1coer
	VhZ4Lqa7AVednVt4h+Yb4WJ8eUW8wbArD9x2pKtARzOMsZ5FBE1b1QULCCBbqQHM3vHVeEU2l522q
	KHcJ3eMILMOja5VwNqxmSCLUCHLo0CXONvZGNzXeFlbGKIToLGzjp2ZLirj3FDh6DP7EZt7CIyhy8
	ozYuiFwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuSx-0000000FtoQ-3VCM;
	Fri, 27 Nov 2026 11:50:11 +0000
Received: from mail-northcentralusazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c105::5] helo=CH5PR02CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuSK-0000000FtPv-0m5m
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 11:49:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HmYWfJX1/PlJAacnTO22jf1ec80tCpvw8kUQGKNBHN320cqmMU3PNqFwsdkZbUJ+hUvpxYPeeDnIrMu/CIS+mZ0jv7uaL3jSqr58svFb/G2Dr4OajpOSDkWPzynHET5U7xBY0NZ2Fsu7HUL+buIHPTOKN8edYk24x9TEcwpYIL8Jp1sotHWmmYKsyQUbU1EHxYRhcaAWILR1CyqTAOaDf+ZhEcyYE/w64KnwYD8llnQtKictD9MVMQHnl9SsJtSoutMPQ6PKPwjE0O3PfkbbHxBp2I+b0ZrcrOhRGTpsKiClETnSPS4QiJFelvBWb2B0aZWnwt/9akST00bnfv/oCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O49/EZhrxsbPU3NjNVcK5PBeHosMdI1Kl4Yj+l61Ff4=;
 b=P1twOPDdWX3uS3t3ok6mPR9R62gjxELBd2MeAQClWmHEd5B7wenrhEwJKAkOvyESJUYvBdfH7ZJZjqD/V9wDXpeeGRNrmYxPp/WIgKacAf7pjtWdpEJkOMdLWHTXDaFY1MnOOMJ+2AyyGD9EO4XrKkclRZS9Nj+hjHNrZ4Q3GbyBrgD0kkjcIQH2XPPVNU/GqkqMSdUD5wxpCKpqTTYWIyAx+SXKmbptb2xeEpS+sUyffMYvtgwEvHRo8x41vXuZDYGpcQv1BljugQ/N4UjGTI8XqKNauOk4WRdahluVQEenY2YtMB4WtflZqiULcGoq1E8bA88vixEdzAaE/YB6eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O49/EZhrxsbPU3NjNVcK5PBeHosMdI1Kl4Yj+l61Ff4=;
 b=rvvpbxDRfJTXEjlOLZxEZzXIaXm3+z5tWPjSuSy4+Nlqq14xzLm7nuHo4zWlg3waohXkbU29mxhE94w0ew8AIS14qoCGtyZd9rnG3EY/3DZWfhgQcfRpeH6hMTH23kdeUJa/RzYJcuiLD3jKKOa8KMXe/hE0NPwvNTTWRFdiQRE=
Received: from CY5PR16CA0023.namprd16.prod.outlook.com (2603:10b6:930:10::33)
 by LVUPR12MB999135.namprd12.prod.outlook.com (2603:10b6:408:3a1::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.9; Fri, 27 Nov
 2026 11:49:24 +0000
Received: from CY5PEPF00000E85.namprd05.prod.outlook.com
 (2603:10b6:930:10:cafe::2b) by CY5PR16CA0023.outlook.office365.com
 (2603:10b6:930:10::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.10 via Frontend Transport; Fri,
 27 Nov 2026 11:49:24 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY5PEPF00000E85.mail.protection.outlook.com (10.167.247.185) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.688.5 via Frontend Transport; Fri, 27 Nov 2026 11:49:23 +0000
Received: from xhdlc220225.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Fri, 27 Nov
 2026 05:49:19 -0600
From: Jay Buddhabhatti <jay.buddhabhatti@amd.com>
To: Michal Simek <michal.simek@amd.com>
CC: Ronak Jain <ronak.jain@amd.com>, Aravind Thokala
	<Aravind.Thokala@amd.com>, Harsh Jain <h.jain@amd.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<git@amd.com>, Jay Buddhabhatti <jay.buddhabhatti@amd.com>
Subject: [PATCH 5/5] drivers: firmware: xilinx: Split PM EEMI and core APIs in firmware
Date: Fri, 27 Nov 2026 17:18:39 +0530
Message-ID: <20261127114839.1428778-6-jay.buddhabhatti@amd.com>
X-Mailer: git-send-email 2.16.0
In-Reply-To: <20261127114839.1428778-1-jay.buddhabhatti@amd.com>
References: <20261127114839.1428778-1-jay.buddhabhatti@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PEPF00000E85:EE_|LVUPR12MB999135:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a2355db-91f3-48a1-fbe6-08df4c7c7b21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|82310400026|36860700016|1800799024|376014|5023799004|11063799006|6133799003|261009223027099003|18002099003|22082099003|10067099003|56012099006|261102130727099003|261102123227099003|261028144727099003|261026130827099003|261026135527099003|261026140227099003|261026121527099003|261021121427099003|261021130227099003|261021135927099003|261021133027099003|261021123027099003|261022115727099003|261022113327099003|261022105027099003|261022075727099003;
X-Microsoft-Antispam-Message-Info: iB4KNQHz29KhPK9jB6fJBdq+ruiUXVLtl6ciAdSyqX6OZHKeqxpjUvAmF8Eh5ZVUYGluLTAHqsgZiLziDpGcWbuUK5jcwJzSH7kI5+EdvUAIEeCNTjyXbBI3X2mI0LWh3aR2xVc7RS6g1GeEpCGh/Xn0wvtnib9drmx9rpZHslURwCe2A9jwjARvW+4t+lDHl0rdiv3TIAqDZ1mo8o/guCDM4CpIgsjS47BSTZyLiv+pRVHc4qV9BwYDPtdURkhnYEgId3MiywdZ/YXU1+SDNV/yNleWw/tesA4et7VFkxekhBjPWAAp/V7kZ7Q2hiGL3plfCjI1Mj5GhVQ4WGnbkmsiRjHo2KOnuAqZokTozoPDK37+vlPrD1KyozmOCSBMPIGxB6qFf8JD2lWuSJyYN4Hka1fpxrY7RqdiDNF4ALVt9kcj4p/nDngapiYWIoJlNs5aq6QGMc5ZamhxPYx+qlRq8MPZ2THVLKyagfCqx/87AJP2p1pvELlgMbBRaSIcJbnNNsD8bsxhnL26LR2L0qYdrydXlL7dGx9A143aFDLOzzzEmGQV6EdyrmLJHAYO+QY5cz8ekLebJBJiEfX2uValK0deeg0cULd1DzQRxFsCaTXXxM4W45JMqvxqp6pNcSqBVBh7DJFpPWQRcKfUsMPdaVBo0YTU+SLJiDfYPMaYieUm7qJVYQ4Wi33aNc4Nu+5Gcq4IV2MQfRzbXLkNcw==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(1800799024)(376014)(5023799004)(11063799006)(6133799003)(261009223027099003)(18002099003)(22082099003)(10067099003)(56012099006)(261102130727099003)(261102123227099003)(261028144727099003)(261026130827099003)(261026135527099003)(261026140227099003)(261026121527099003)(261021121427099003)(261021130227099003)(261021135927099003)(261021133027099003)(261021123027099003)(261022115727099003)(261022113327099003)(261022105027099003)(261022075727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 3WLOxirabdlUIylibuOWGLpGjyR7dueluCKCJ37iMPqITX2X8soktVHs4O8zn5sbzD+agYhjoC4UrndGFVMG6paWdZmnFYQYqDQBlnTIisDRneZ2TXd0SpCWTO5pRwMbzGVWXaaYT9cx0OAyXc0KbZXfyy4KJ6tSHI/HePmIQdMhksL2LNoT66KGTzzDORf49d1gzO1JWBxh/InqgHl79YokEjBDq1NlCLuyAQTYVpY0OEdr1lRmdfJ3wfs6JdtNzJf05/Z6qOlnfJI9XByhjPEVkPRt4OxuvaG1lRc0s42zsNplcL2M5hHmT665/pb7I/aF23R4XBRqJf+7LNtfAnxwG2OF06aQ0xQAclxjmpxxfeUbH1lBzFKkvPgy/X/Eo6kxLYmPqFj1oiFC6s6AFQMQHx6TtkwO5/bWoUlM7kxFjwGMiEzrt3EubEu4kOdu
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 11:49:23.4462
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a2355db-91f3-48a1-fbe6-08df4c7c7b21
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY5PEPF00000E85.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVUPR12MB999135
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_034932_440331_5430AFDD 
X-CRM114-Status: GOOD (  23.38  )
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

From: Ronak Jain <ronak.jain@amd.com>

Split the firmware driver into core and PM EEMI files to reduce
complexity and clarify ownership of each interface.

Add a MAINTAINERS entry for the Xilinx PM firmware driver. List the
core, PM EEMI, and debug files and the xlnx-zynqmp.h header.

Signed-off-by: Ronak Jain <ronak.jain@amd.com>
Co-developed-by: Jay Buddhabhatti <jay.buddhabhatti@amd.com>
Signed-off-by: Jay Buddhabhatti <jay.buddhabhatti@amd.com>
---
 MAINTAINERS                                   |  10 +
 drivers/firmware/xilinx/Makefile              |   5 +-
 drivers/firmware/xilinx/zynqmp-core.c         | 797 +++++++++++++++++
 drivers/firmware/xilinx/zynqmp-debug.h        |  20 +
 .../firmware/xilinx/{zynqmp.c => zynqmp-pm.c} | 808 +-----------------
 5 files changed, 841 insertions(+), 799 deletions(-)
 create mode 100644 drivers/firmware/xilinx/zynqmp-core.c
 rename drivers/firmware/xilinx/{zynqmp.c => zynqmp-pm.c} (66%)

diff --git a/MAINTAINERS b/MAINTAINERS
index e010589c13e5..b92675dc178a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -30699,6 +30699,16 @@ L:	netdev@vger.kernel.org
 S:	Orphan
 F:	drivers/net/ethernet/xilinx/ll_temac*
 
+XILINX PM FIRMWARE DRIVER
+M:	Jay Buddhabhatti <jay.buddhabhatti@amd.com>
+L:	git@amd.com
+S:	Maintained
+F:	drivers/firmware/xilinx/zynqmp-core.c
+F:	drivers/firmware/xilinx/zynqmp-debug.c
+F:	drivers/firmware/xilinx/zynqmp-debug.h
+F:	drivers/firmware/xilinx/zynqmp-pm.c
+F:	include/linux/firmware/xlnx-zynqmp.h
+
 XILINX PWM DRIVER
 M:	Sean Anderson <sean.anderson@linux.dev>
 S:	Maintained
diff --git a/drivers/firmware/xilinx/Makefile b/drivers/firmware/xilinx/Makefile
index d23d41c6a8ac..4688389b8367 100644
--- a/drivers/firmware/xilinx/Makefile
+++ b/drivers/firmware/xilinx/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 # Makefile for Xilinx firmwares
 
-obj-$(CONFIG_ZYNQMP_FIRMWARE) += zynqmp-crypto.o zynqmp-fpga.o \
-				 zynqmp-nvm.o zynqmp-pdi.o zynqmp-ufs.o zynqmp.o
+obj-$(CONFIG_ZYNQMP_FIRMWARE) += zynqmp-core.o zynqmp-crypto.o \
+				 zynqmp-fpga.o zynqmp-nvm.o zynqmp-pdi.o \
+				 zynqmp-pm.o zynqmp-ufs.o
 obj-$(CONFIG_ZYNQMP_FIRMWARE_DEBUG) += zynqmp-debug.o
diff --git a/drivers/firmware/xilinx/zynqmp-core.c b/drivers/firmware/xilinx/zynqmp-core.c
new file mode 100644
index 000000000000..ce9652256b9c
--- /dev/null
+++ b/drivers/firmware/xilinx/zynqmp-core.c
@@ -0,0 +1,797 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Xilinx Zynq MPSoC Firmware layer core APIs.
+ *
+ *  Copyright (C) 2014 - 2022 Xilinx, Inc.
+ *  Copyright (C) 2022 - 2026 Advanced Micro Devices, Inc.
+ */
+
+#include <linux/arm-smccc.h>
+#include <linux/bitfield.h>
+#include <linux/crash_dump.h>
+#include <linux/device.h>
+#include <linux/hashtable.h>
+#include <linux/init.h>
+#include <linux/mfd/core.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+
+#include <linux/firmware/xlnx-zynqmp.h>
+#include "zynqmp-debug.h"
+
+/* Max HashMap Order for PM API feature check (1<<7 = 128) */
+#define PM_API_FEATURE_CHECK_MAX_ORDER	7
+
+/* IOCTL/QUERY feature payload size */
+#define FEATURE_PAYLOAD_SIZE		2
+
+static bool feature_check_enabled;
+static DEFINE_HASHTABLE(pm_api_features_map, PM_API_FEATURE_CHECK_MAX_ORDER);
+static u32 ioctl_features[FEATURE_PAYLOAD_SIZE];
+static u32 query_features[FEATURE_PAYLOAD_SIZE];
+
+static u32 sip_svc_version;
+static struct platform_device *em_dev;
+
+static const struct mfd_cell firmware_devs[] = {
+	{
+		.name = "zynqmp_power_controller",
+	},
+};
+
+/**
+ * struct pm_api_feature_data - PM API Feature data
+ * @pm_api_id:		PM API Id, used as key to index into hashmap
+ * @feature_status:	status of PM API feature: valid, invalid
+ * @hentry:		hlist_node that hooks this entry into hashtable
+ */
+struct pm_api_feature_data {
+	u32 pm_api_id;
+	int feature_status;
+	struct hlist_node hentry;
+};
+
+struct platform_fw_data {
+	/*
+	 * Family code for platform.
+	 */
+	const u32 family_code;
+};
+
+static struct platform_fw_data *active_platform_fw_data;
+
+/**
+ * zynqmp_pm_ret_code() - Convert PMU-FW error codes to Linux error codes
+ * @ret_status:		PMUFW return code
+ *
+ * Return: corresponding Linux error code
+ */
+static int zynqmp_pm_ret_code(u32 ret_status)
+{
+	switch (ret_status) {
+	case XST_PM_SUCCESS:
+	case XST_PM_DOUBLE_REQ:
+		return 0;
+	case XST_PM_NO_FEATURE:
+		return -ENOTSUPP;
+	case XST_PM_INVALID_VERSION:
+		return -EOPNOTSUPP;
+	case XST_PM_NO_ACCESS:
+		return -EACCES;
+	case XST_PM_ABORT_SUSPEND:
+		return -ECANCELED;
+	case XST_PM_MULT_USER:
+		return -EUSERS;
+	case XST_PM_INTERNAL:
+	case XST_PM_CONFLICT:
+	case XST_PM_INVALID_NODE:
+	case XST_PM_INVALID_CRC:
+	default:
+		return -EINVAL;
+	}
+}
+
+static noinline int do_fw_call_fail(u32 *ret_payload, u32 num_args, ...)
+{
+	return -ENODEV;
+}
+
+/*
+ * PM function call wrapper
+ * Invoke do_fw_call_smc or do_fw_call_hvc, depending on the configuration
+ */
+static int (*do_fw_call)(u32 *ret_payload, u32, ...) = do_fw_call_fail;
+
+/**
+ * do_fw_call_smc() - Call system-level platform management layer (SMC)
+ * @num_args:		Number of variable arguments should be <= 8
+ * @ret_payload:	Returned value array
+ *
+ * Invoke platform management function via SMC call (no hypervisor present).
+ *
+ * Return: Returns status, either success or error+reason
+ */
+static noinline int do_fw_call_smc(u32 *ret_payload, u32 num_args, ...)
+{
+	struct arm_smccc_res res;
+	u64 args[8] = {0};
+	va_list arg_list;
+	u8 i;
+
+	if (num_args > 8)
+		return -EINVAL;
+
+	va_start(arg_list, num_args);
+
+	for (i = 0; i < num_args; i++)
+		args[i] = va_arg(arg_list, u64);
+
+	va_end(arg_list);
+
+	arm_smccc_smc(args[0], args[1], args[2], args[3], args[4], args[5], args[6], args[7], &res);
+
+	if (ret_payload) {
+		ret_payload[0] = lower_32_bits(res.a0);
+		ret_payload[1] = upper_32_bits(res.a0);
+		ret_payload[2] = lower_32_bits(res.a1);
+		ret_payload[3] = upper_32_bits(res.a1);
+		ret_payload[4] = lower_32_bits(res.a2);
+		ret_payload[5] = upper_32_bits(res.a2);
+		ret_payload[6] = lower_32_bits(res.a3);
+	}
+
+	return zynqmp_pm_ret_code((enum pm_ret_status)res.a0);
+}
+
+/**
+ * do_fw_call_hvc() - Call system-level platform management layer (HVC)
+ * @num_args:		Number of variable arguments should be <= 8
+ * @ret_payload:	Returned value array
+ *
+ * Invoke platform management function via HVC
+ * HVC-based for communication through hypervisor
+ * (no direct communication with ATF).
+ *
+ * Return: Returns status, either success or error+reason
+ */
+static noinline int do_fw_call_hvc(u32 *ret_payload, u32 num_args, ...)
+{
+	struct arm_smccc_res res;
+	u64 args[8] = {0};
+	va_list arg_list;
+	u8 i;
+
+	if (num_args > 8)
+		return -EINVAL;
+
+	va_start(arg_list, num_args);
+
+	for (i = 0; i < num_args; i++)
+		args[i] = va_arg(arg_list, u64);
+
+	va_end(arg_list);
+
+	arm_smccc_hvc(args[0], args[1], args[2], args[3], args[4], args[5], args[6], args[7], &res);
+
+	if (ret_payload) {
+		ret_payload[0] = lower_32_bits(res.a0);
+		ret_payload[1] = upper_32_bits(res.a0);
+		ret_payload[2] = lower_32_bits(res.a1);
+		ret_payload[3] = upper_32_bits(res.a1);
+		ret_payload[4] = lower_32_bits(res.a2);
+		ret_payload[5] = upper_32_bits(res.a2);
+		ret_payload[6] = lower_32_bits(res.a3);
+	}
+
+	return zynqmp_pm_ret_code((enum pm_ret_status)res.a0);
+}
+
+static int __do_feature_check_call(const u32 api_id, u32 *ret_payload)
+{
+	int ret;
+	u64 smc_arg[2];
+	u32 module_id;
+	u32 feature_check_api_id;
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
+	if (module_id == TF_A_MODULE_ID)
+		smc_arg[1] = api_id;
+	else
+		smc_arg[1] = (api_id & API_ID_MASK);
+
+	smc_arg[0] = PM_SIP_SVC | FIELD_PREP(MODULE_ID_MASK, module_id) | feature_check_api_id;
+
+	ret = do_fw_call(ret_payload, 2, smc_arg[0], smc_arg[1]);
+
+	/*
+	 * For TF-A APIs, if the feature check with PM_API_FEATURES fails,
+	 * retry with the legacy PM_FEATURE_CHECK for backward compatibility.
+	 */
+	if (module_id == TF_A_MODULE_ID && ret) {
+		smc_arg[0] = PM_SIP_SVC | FIELD_PREP(MODULE_ID_MASK, PM_MODULE_ID) |
+			     PM_FEATURE_CHECK;
+		ret = do_fw_call(ret_payload, 2, smc_arg[0], smc_arg[1]);
+	}
+
+	if (ret)
+		return ret;
+
+	return ret_payload[1];
+}
+
+static int do_feature_check_call(const u32 api_id)
+{
+	int ret;
+	u32 ret_payload[PAYLOAD_ARG_CNT];
+	struct pm_api_feature_data *feature_data;
+
+	/* Check for existing entry in hash table for given api */
+	hash_for_each_possible(pm_api_features_map, feature_data, hentry,
+			       api_id) {
+		if (feature_data->pm_api_id == api_id)
+			return feature_data->feature_status;
+	}
+
+	/* Add new entry if not present */
+	feature_data = kmalloc_obj(*feature_data, GFP_ATOMIC);
+	if (!feature_data)
+		return -ENOMEM;
+
+	feature_data->pm_api_id = api_id;
+	ret = __do_feature_check_call(api_id, ret_payload);
+
+	feature_data->feature_status = ret;
+	hash_add(pm_api_features_map, &feature_data->hentry, api_id);
+
+	if (api_id == PM_IOCTL)
+		/* Store supported IOCTL IDs mask */
+		memcpy(ioctl_features, &ret_payload[2], FEATURE_PAYLOAD_SIZE * 4);
+	else if (api_id == PM_QUERY_DATA)
+		/* Store supported QUERY IDs mask */
+		memcpy(query_features, &ret_payload[2], FEATURE_PAYLOAD_SIZE * 4);
+
+	return ret;
+}
+
+/**
+ * zynqmp_pm_feature() - Check whether given feature is supported or not and
+ *			 store supported IOCTL/QUERY ID mask
+ * @api_id:		API ID to check
+ *
+ * Return: Returns status, either success or error+reason
+ */
+int zynqmp_pm_feature(const u32 api_id)
+{
+	int ret;
+
+	if (!feature_check_enabled)
+		return 0;
+
+	ret = do_feature_check_call(api_id);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(zynqmp_pm_feature);
+
+/**
+ * zynqmp_pm_is_function_supported() - Check whether given IOCTL/QUERY function
+ *				       is supported or not
+ * @api_id:		PM_IOCTL or PM_QUERY_DATA
+ * @id:			IOCTL or QUERY function IDs
+ *
+ * Return: Returns status, either success or error+reason
+ */
+int zynqmp_pm_is_function_supported(const u32 api_id, const u32 id)
+{
+	int ret;
+	u32 *bit_mask;
+
+	/* Input arguments validation */
+	if (id >= 64 || (api_id != PM_IOCTL && api_id != PM_QUERY_DATA))
+		return -EINVAL;
+
+	/* Check feature check API version */
+	ret = do_feature_check_call(PM_FEATURE_CHECK);
+	if (ret < 0)
+		return ret;
+
+	/* Check if feature check version 2 is supported or not */
+	if ((ret & FIRMWARE_VERSION_MASK) == PM_API_VERSION_2) {
+		/*
+		 * Call feature check for IOCTL/QUERY API to get IOCTL ID or
+		 * QUERY ID feature status.
+		 */
+		ret = do_feature_check_call(api_id);
+		if (ret < 0)
+			return ret;
+
+		bit_mask = (api_id == PM_IOCTL) ? ioctl_features : query_features;
+
+		if ((bit_mask[(id / 32)] & BIT((id % 32))) == 0U)
+			return -EOPNOTSUPP;
+	} else {
+		return -ENODATA;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(zynqmp_pm_is_function_supported);
+
+/**
+ * zynqmp_pm_invoke_fw_fn() - Invoke the system-level platform management layer
+ *			caller function depending on the configuration
+ * @pm_api_id:		Requested PM-API call
+ * @ret_payload:	Returned value array
+ * @num_args:		Number of arguments to requested PM-API call
+ *
+ * Invoke platform management function for SMC or HVC call, depending on
+ * configuration.
+ * Following SMC Calling Convention (SMCCC) for SMC64:
+ * Pm Function Identifier,
+ * PM_SIP_SVC + PASS_THROUGH_FW_CMD_ID =
+ *	((SMC_TYPE_FAST << FUNCID_TYPE_SHIFT)
+ *	((SMC_64) << FUNCID_CC_SHIFT)
+ *	((SIP_START) << FUNCID_OEN_SHIFT)
+ *	(PASS_THROUGH_FW_CMD_ID))
+ *
+ * PM_SIP_SVC - Registered ZynqMP SIP Service Call.
+ * PASS_THROUGH_FW_CMD_ID - Fixed SiP SVC call ID for FW specific calls.
+ *
+ * Return: Returns status, either success or error+reason
+ */
+int zynqmp_pm_invoke_fw_fn(u32 pm_api_id, u32 *ret_payload, u32 num_args, ...)
+{
+	/*
+	 * Added SIP service call Function Identifier
+	 * Make sure to stay in x0 register
+	 */
+	u64 smc_arg[SMC_ARG_CNT_64];
+	int ret, i;
+	va_list arg_list;
+	u32 args[SMC_ARG_CNT_32] = {0};
+	u32 module_id;
+
+	/*
+	 * According to the SMCCC: The total number of registers available for
+	 * arguments is 16.
+	 *
+	 * In the Extended SMC format, 3 registers are used for headers, leaving
+	 * up to 13 registers for arguments.
+	 */
+	if (num_args > SMC_ARG_CNT_32)
+		return -EINVAL;
+
+	/* Check if feature is supported or not */
+	ret = zynqmp_pm_feature(pm_api_id);
+	if (ret < 0)
+		return ret;
+
+	va_start(arg_list, num_args);
+
+	for (i = 0; i < num_args; i++)
+		args[i] = va_arg(arg_list, u32);
+
+	va_end(arg_list);
+
+	module_id = FIELD_GET(PLM_MODULE_ID_MASK, pm_api_id);
+
+	if (module_id == 0)
+		module_id = XPM_MODULE_ID;
+
+	smc_arg[0] = PM_SIP_SVC | PASS_THROUGH_FW_CMD_ID;
+	smc_arg[1] = ((u64)args[0] << 32U) | FIELD_PREP(PLM_MODULE_ID_MASK, module_id) |
+		      (pm_api_id & API_ID_MASK);
+	for (i = 1; i < (SMC_ARG_CNT_64 - 1); i++)
+		smc_arg[i + 1] = ((u64)args[(i * 2)] << 32U) | args[(i * 2) - 1];
+
+	return do_fw_call(ret_payload, 8, smc_arg[0], smc_arg[1], smc_arg[2], smc_arg[3],
+			  smc_arg[4], smc_arg[5], smc_arg[6], smc_arg[7]);
+}
+
+/**
+ * zynqmp_pm_invoke_fn() - Invoke the system-level platform management layer
+ *			   caller function depending on the configuration
+ * @pm_api_id:		Requested PM-API call
+ * @ret_payload:	Returned value array
+ * @num_args:		Number of arguments to requested PM-API call
+ *
+ * Invoke platform management function for SMC or HVC call, depending on
+ * configuration.
+ * Following SMC Calling Convention (SMCCC) for SMC64:
+ * Pm Function Identifier,
+ * PM_SIP_SVC + PM_API_ID =
+ *	((SMC_TYPE_FAST << FUNCID_TYPE_SHIFT)
+ *	((SMC_64) << FUNCID_CC_SHIFT)
+ *	((SIP_START) << FUNCID_OEN_SHIFT)
+ *	((PM_API_ID) & FUNCID_NUM_MASK))
+ *
+ * PM_SIP_SVC	- Registered ZynqMP SIP Service Call.
+ * PM_API_ID	- Platform Management API ID.
+ *
+ * Return: Returns status, either success or error+reason
+ */
+int zynqmp_pm_invoke_fn(u32 pm_api_id, u32 *ret_payload, u32 num_args, ...)
+{
+	/*
+	 * Added SIP service call Function Identifier
+	 * Make sure to stay in x0 register
+	 */
+	u64 smc_arg[8];
+	int ret, i;
+	va_list arg_list;
+	u32 args[SMC_ARG_CNT_BASIC_32] = {0};
+
+	/*
+	 * According to the SMCCC: The total number of registers available for
+	 * arguments is 16.
+	 *
+	 * In the Basic SMC format, 2 registers are used for headers, leaving
+	 * up to 14 registers for arguments.
+	 */
+	if (num_args > SMC_ARG_CNT_BASIC_32)
+		return -EINVAL;
+
+	/* Check if feature is supported or not */
+	ret = zynqmp_pm_feature(pm_api_id);
+	if (ret < 0)
+		return ret;
+
+	va_start(arg_list, num_args);
+
+	for (i = 0; i < num_args; i++)
+		args[i] = va_arg(arg_list, u32);
+
+	va_end(arg_list);
+
+	smc_arg[0] = PM_SIP_SVC | pm_api_id;
+	for (i = 0; i < 7; i++)
+		smc_arg[i + 1] = ((u64)args[(i * 2) + 1] << 32) | args[i * 2];
+
+	return do_fw_call(ret_payload, 8, smc_arg[0], smc_arg[1], smc_arg[2], smc_arg[3],
+			  smc_arg[4], smc_arg[5], smc_arg[6], smc_arg[7]);
+}
+
+/**
+ * zynqmp_pm_get_sip_svc_version() - Get SiP service call version
+ * @version:	Returned version value
+ *
+ * Return: Returns status, either success or error+reason
+ */
+int zynqmp_pm_get_sip_svc_version(u32 *version)
+{
+	struct arm_smccc_res res;
+	u64 args[SMC_ARG_CNT_64] = {0};
+
+	if (!version)
+		return -EINVAL;
+
+	/* Check if SiP SVC version already verified */
+	if (sip_svc_version > 0) {
+		*version = sip_svc_version;
+		return 0;
+	}
+
+	args[0] = GET_SIP_SVC_VERSION;
+
+	arm_smccc_smc(args[0], args[1], args[2], args[3], args[4], args[5], args[6], args[7], &res);
+
+	*version = ((lower_32_bits(res.a0) << 16U) | lower_32_bits(res.a1));
+
+	return zynqmp_pm_ret_code(XST_PM_SUCCESS);
+}
+
+/**
+ * get_set_conduit_method() - Choose SMC or HVC based communication
+ * @np:		Pointer to the device_node structure
+ *
+ * Use SMC or HVC-based functions to communicate with EL2/EL3.
+ *
+ * Return: Returns 0 on success or error code
+ */
+static int get_set_conduit_method(struct device_node *np)
+{
+	const char *method;
+
+	if (of_property_read_string(np, "method", &method)) {
+		pr_warn("%s missing \"method\" property\n", __func__);
+		return -ENXIO;
+	}
+
+	if (!strcmp("hvc", method)) {
+		do_fw_call = do_fw_call_hvc;
+	} else if (!strcmp("smc", method)) {
+		do_fw_call = do_fw_call_smc;
+	} else {
+		pr_warn("%s Invalid \"method\" property: %s\n",
+			__func__, method);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+/**
+ * zynqmp_pm_get_family_info() - Get family info of platform
+ * @family:	Returned family code value
+ *
+ * Return: Returns status, either success or error+reason
+ */
+int zynqmp_pm_get_family_info(u32 *family)
+{
+	if (!active_platform_fw_data)
+		return -ENODEV;
+
+	if (!family)
+		return -EINVAL;
+
+	*family = active_platform_fw_data->family_code;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(zynqmp_pm_get_family_info);
+
+/**
+ * zynqmp_clear_pm_state() - Clear subsystem state
+ * @dev: Device pointer used for logging
+ *
+ * Clears PM specific data in EL3 and platform firmware.
+ *
+ * Return: Returns status, either success or error
+ */
+static int zynqmp_clear_pm_state(struct device *dev)
+{
+	u32 pm_family_code;
+	int ret;
+
+	/* Get the Family code of platform */
+	ret = zynqmp_pm_get_family_info(&pm_family_code);
+	if (ret < 0)
+		return ret;
+
+	/* Supporting on Versal and Versal Net platforms only */
+	if (pm_family_code == PM_VERSAL_FAMILY_CODE ||
+	    pm_family_code == PM_VERSAL_NET_FAMILY_CODE) {
+		/* Check if EL3 firmware supports TF_A_CLEAR_PM_STATE */
+		ret = do_feature_check_call(TF_A_CLEAR_PM_STATE);
+		if (ret >= 0 && ((ret & FIRMWARE_VERSION_MASK) >= PM_API_VERSION_1)) {
+			/* Clear PM specific data in EL3 firmware */
+			ret = zynqmp_pm_invoke_fn(TF_A_CLEAR_PM_STATE, NULL, 0);
+			if (ret)
+				dev_err(dev,
+					"Failed to clear EL3 PM subsystem state: %d\n", ret);
+		} else {
+			dev_warn(dev,
+				 "TF_A_CLEAR_PM_STATE is not supported by EL3 firmware: %d\n",
+				 ret);
+		}
+
+		/* Check if the firmware supports the PM_DEV_ALL_PERIPH node ID */
+		ret = do_feature_check_call(PM_RELEASE_NODE);
+		if (ret >= 0 && ((ret & FIRMWARE_VERSION_MASK) >= PM_API_VERSION_3)) {
+			/* Attempt to release all peripheral devices via firmware */
+			ret = zynqmp_pm_release_node(PM_DEV_ALL_PERIPH);
+			if (ret)
+				dev_err(dev, "Failed to release all peripheral devices: %d\n", ret);
+		} else {
+			dev_warn(dev,
+				 "Bulk device release is not supported by firmware: %d\n", ret);
+		}
+
+		/* Check if the firmware supports the PM_DEV_ALL_PERIPH node ID */
+		ret = do_feature_check_call(PM_REQUEST_NODE);
+		if (ret >= 0 && ((ret & FIRMWARE_VERSION_MASK) >= PM_API_VERSION_3)) {
+			/* Attempt to request all nodes via firmware */
+			ret = zynqmp_pm_request_node(PM_DEV_ALL_PERIPH, 0, 0, 0);
+			if (ret)
+				dev_err(dev, "Failed to request all peripheral devices: %d\n", ret);
+		} else {
+			dev_warn(dev,
+				 "Firmware doesn't support request all peripheral devices at once: %d\n",
+				 ret);
+		}
+
+		/* Check if the firmware supports the PM_ALL_NOTIFIERS node ID */
+		ret = do_feature_check_call(PM_REGISTER_NOTIFIER);
+		if (ret >= 0 && ((ret & FIRMWARE_VERSION_MASK) >= PM_API_VERSION_3)) {
+			/* Attempt to unregister all notifier callbacks via firmware */
+			ret = zynqmp_pm_register_notifier(PM_ALL_NOTIFIERS, 0, 0, 0);
+			if (ret)
+				dev_err(dev, "Failed to unregister all notifiers: %d\n", ret);
+		} else {
+			dev_warn(dev,
+				 "Firmware doesn't support unregister all notifiers at once: %d\n",
+				 ret);
+			ret = 0;
+		}
+	}
+
+	return ret;
+}
+
+static int zynqmp_firmware_probe(struct platform_device *pdev)
+{
+	u32 pm_api_version, pm_family_code, pm_tz_version;
+	struct device *dev = &pdev->dev;
+	struct zynqmp_devinfo *devinfo;
+	int ret;
+
+	ret = get_set_conduit_method(dev->of_node);
+	if (ret)
+		return ret;
+
+	/* Get platform-specific firmware data from device tree match */
+	active_platform_fw_data = (struct platform_fw_data *)device_get_match_data(dev);
+	if (!active_platform_fw_data)
+		return -EINVAL;
+
+	/* Get SiP SVC version number */
+	ret = zynqmp_pm_get_sip_svc_version(&sip_svc_version);
+	if (ret)
+		return ret;
+
+	ret = do_feature_check_call(PM_FEATURE_CHECK);
+	if (ret >= 0 && ((ret & FIRMWARE_VERSION_MASK) >= PM_API_VERSION_1))
+		feature_check_enabled = true;
+
+	devinfo = devm_kzalloc_obj(dev, *devinfo);
+	if (!devinfo)
+		return -ENOMEM;
+
+	devinfo->dev = dev;
+
+	platform_set_drvdata(pdev, devinfo);
+
+	/* Check PM API version number */
+	ret = zynqmp_pm_get_api_version(&pm_api_version);
+	if (ret)
+		return ret;
+
+	if (pm_api_version < ZYNQMP_PM_VERSION) {
+		panic("%s Platform Management API version error. Expected: v%d.%d - Found: v%d.%d\n",
+		      __func__,
+		      ZYNQMP_PM_VERSION_MAJOR, ZYNQMP_PM_VERSION_MINOR,
+		      pm_api_version >> 16, pm_api_version & 0xFFFF);
+	}
+
+	pr_info("%s Platform Management API v%d.%d\n", __func__,
+		pm_api_version >> 16, pm_api_version & 0xFFFF);
+
+	/* Get the Family code of platform */
+	ret = zynqmp_pm_get_family_info(&pm_family_code);
+	if (ret < 0)
+		return ret;
+
+	if (is_kdump_kernel())
+		zynqmp_clear_pm_state(dev);
+
+	/* Check trustzone version number */
+	ret = zynqmp_pm_get_trustzone_version(&pm_tz_version);
+	if (ret)
+		panic("Legacy trustzone found without version support\n");
+
+	if (pm_tz_version < ZYNQMP_TZ_VERSION)
+		panic("%s Trustzone version error. Expected: v%d.%d - Found: v%d.%d\n",
+		      __func__,
+		      ZYNQMP_TZ_VERSION_MAJOR, ZYNQMP_TZ_VERSION_MINOR,
+		      pm_tz_version >> 16, pm_tz_version & 0xFFFF);
+
+	pr_info("%s Trustzone version v%d.%d\n", __func__,
+		pm_tz_version >> 16, pm_tz_version & 0xFFFF);
+
+	ret = mfd_add_devices(&pdev->dev, PLATFORM_DEVID_NONE, firmware_devs,
+			      ARRAY_SIZE(firmware_devs), NULL, 0, NULL);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to add MFD devices %d\n", ret);
+		return ret;
+	}
+
+	ret = zynqmp_firmware_pm_sysfs_entry(pdev);
+	if (ret) {
+		pr_err("%s() Failed to create sysfs file with error%d\n",
+		       __func__, ret);
+		return ret;
+	}
+
+	zynqmp_pm_api_debugfs_init();
+
+	if (pm_family_code != PM_ZYNQMP_FAMILY_CODE) {
+		em_dev = platform_device_register_data(&pdev->dev, "xlnx_event_manager",
+						       -1, NULL, 0);
+		if (IS_ERR(em_dev))
+			dev_err_probe(&pdev->dev, PTR_ERR(em_dev), "EM register fail with error\n");
+	}
+
+	return of_platform_populate(dev->of_node, NULL, NULL, dev);
+}
+
+static void zynqmp_firmware_shutdown(struct platform_device *pdev)
+{
+	zynqmp_clear_pm_state(&pdev->dev);
+}
+
+static void zynqmp_firmware_remove(struct platform_device *pdev)
+{
+	struct pm_api_feature_data *feature_data;
+	struct hlist_node *tmp;
+	int i;
+
+	mfd_remove_devices(&pdev->dev);
+	zynqmp_pm_api_debugfs_exit();
+
+	hash_for_each_safe(pm_api_features_map, i, tmp, feature_data, hentry) {
+		hash_del(&feature_data->hentry);
+		kfree(feature_data);
+	}
+
+	platform_device_unregister(em_dev);
+}
+
+static const struct platform_fw_data platform_fw_data_versal = {
+	.family_code = PM_VERSAL_FAMILY_CODE,
+};
+
+static const struct platform_fw_data platform_fw_data_versal_net = {
+	.family_code = PM_VERSAL_NET_FAMILY_CODE,
+};
+
+static const struct platform_fw_data platform_fw_data_zynqmp = {
+	.family_code = PM_ZYNQMP_FAMILY_CODE,
+};
+
+static const struct of_device_id zynqmp_firmware_of_match[] = {
+	{.compatible = "xlnx,zynqmp-firmware", .data = &platform_fw_data_zynqmp},
+	{.compatible = "xlnx,versal-firmware", .data = &platform_fw_data_versal},
+	{.compatible = "xlnx,versal-net-firmware", .data = &platform_fw_data_versal_net},
+	{},
+};
+MODULE_DEVICE_TABLE(of, zynqmp_firmware_of_match);
+
+static struct platform_driver zynqmp_firmware_driver = {
+	.driver = {
+		.name = "zynqmp_firmware",
+		.of_match_table = zynqmp_firmware_of_match,
+	},
+	.probe = zynqmp_firmware_probe,
+	.remove = zynqmp_firmware_remove,
+	.shutdown = zynqmp_firmware_shutdown,
+};
+module_platform_driver(zynqmp_firmware_driver);
+
+/*
+ * pm_init_finalize was previously called from the firmware driver's
+ * sync_state callback, but sync_state can be blocked indefinitely if
+ * any device consumer never probes. Use late_initcall to ensure
+ * pm_init_finalize is called reliably regardless of consumer
+ * probe status.
+ */
+static int __init zynqmp_pm_init_finalize_late(void)
+{
+	u32 pm_family_code;
+	int ret;
+
+	ret = zynqmp_pm_get_family_info(&pm_family_code);
+	if (ret)
+		return ret;
+
+	if (pm_family_code != PM_ZYNQMP_FAMILY_CODE)
+		return 0;
+
+	if (zynqmp_pm_init_finalize())
+		pr_warn("zynqmp: failed to release power management to firmware\n");
+
+	return 0;
+}
+late_initcall(zynqmp_pm_init_finalize_late);
diff --git a/drivers/firmware/xilinx/zynqmp-debug.h b/drivers/firmware/xilinx/zynqmp-debug.h
index e1515a93e9e9..053f86103eb4 100644
--- a/drivers/firmware/xilinx/zynqmp-debug.h
+++ b/drivers/firmware/xilinx/zynqmp-debug.h
@@ -13,6 +13,26 @@
 #ifndef __FIRMWARE_ZYNQMP_DEBUG_H__
 #define __FIRMWARE_ZYNQMP_DEBUG_H__
 
+#include <linux/types.h>
+
+struct device;
+struct platform_device;
+
+/**
+ * struct zynqmp_devinfo - Structure for Zynqmp device instance
+ * @dev:		Device Pointer
+ * @feature_conf_id:	Feature conf id
+ */
+struct zynqmp_devinfo {
+	struct device *dev;
+	u32 feature_conf_id;
+};
+
+int zynqmp_firmware_pm_sysfs_entry(struct platform_device *pdev);
+int zynqmp_pm_get_sip_svc_version(u32 *version);
+int zynqmp_pm_get_trustzone_version(u32 *version);
+int zynqmp_pm_init_finalize(void);
+
 #if IS_REACHABLE(CONFIG_ZYNQMP_FIRMWARE_DEBUG)
 void zynqmp_pm_api_debugfs_init(void);
 void zynqmp_pm_api_debugfs_exit(void);
diff --git a/drivers/firmware/xilinx/zynqmp.c b/drivers/firmware/xilinx/zynqmp-pm.c
similarity index 66%
rename from drivers/firmware/xilinx/zynqmp.c
rename to drivers/firmware/xilinx/zynqmp-pm.c
index 374d39f34480..76fc88adc0c2 100644
--- a/drivers/firmware/xilinx/zynqmp.c
+++ b/drivers/firmware/xilinx/zynqmp-pm.c
@@ -11,27 +11,14 @@
  *  Rajan Vaja <rajanv@xilinx.com>
  */
 
-#include <linux/arm-smccc.h>
-#include <linux/compiler.h>
-#include <linux/crash_dump.h>
 #include <linux/device.h>
-#include <linux/init.h>
-#include <linux/mfd/core.h>
-#include <linux/module.h>
-#include <linux/of.h>
-#include <linux/of_platform.h>
+#include <linux/kernel.h>
 #include <linux/platform_device.h>
-#include <linux/slab.h>
-#include <linux/uaccess.h>
-#include <linux/hashtable.h>
+#include <linux/string.h>
 
 #include <linux/firmware/xlnx-zynqmp.h>
-#include <linux/firmware/xlnx-event-manager.h>
 #include "zynqmp-debug.h"
 
-/* Max HashMap Order for PM API feature check (1<<7 = 128) */
-#define PM_API_FEATURE_CHECK_MAX_ORDER  7
-
 /* CRL registers and bitfields */
 #define CRL_APB_BASE			0xFF5E0000U
 /* BOOT_PIN_CTRL- Used to control the mode pins after boot */
@@ -39,455 +26,6 @@
 /* BOOT_PIN_CTRL_MASK- out_val[11:8], out_en[3:0] */
 #define CRL_APB_BOOTPIN_CTRL_MASK	0xF0FU
 
-/* IOCTL/QUERY feature payload size */
-#define FEATURE_PAYLOAD_SIZE		2
-
-static bool feature_check_enabled;
-static DEFINE_HASHTABLE(pm_api_features_map, PM_API_FEATURE_CHECK_MAX_ORDER);
-static u32 ioctl_features[FEATURE_PAYLOAD_SIZE];
-static u32 query_features[FEATURE_PAYLOAD_SIZE];
-
-static u32 sip_svc_version;
-static struct platform_device *em_dev;
-
-/**
- * struct zynqmp_devinfo - Structure for Zynqmp device instance
- * @dev:		Device Pointer
- * @feature_conf_id:	Feature conf id
- */
-struct zynqmp_devinfo {
-	struct device *dev;
-	u32 feature_conf_id;
-};
-
-/**
- * struct pm_api_feature_data - PM API Feature data
- * @pm_api_id:		PM API Id, used as key to index into hashmap
- * @feature_status:	status of PM API feature: valid, invalid
- * @hentry:		hlist_node that hooks this entry into hashtable
- */
-struct pm_api_feature_data {
-	u32 pm_api_id;
-	int feature_status;
-	struct hlist_node hentry;
-};
-
-struct platform_fw_data {
-	/*
-	 * Family code for platform.
-	 */
-	const u32 family_code;
-};
-
-static struct platform_fw_data *active_platform_fw_data;
-
-static const struct mfd_cell firmware_devs[] = {
-	{
-		.name = "zynqmp_power_controller",
-	},
-};
-
-/**
- * zynqmp_pm_ret_code() - Convert PMU-FW error codes to Linux error codes
- * @ret_status:		PMUFW return code
- *
- * Return: corresponding Linux error code
- */
-static int zynqmp_pm_ret_code(u32 ret_status)
-{
-	switch (ret_status) {
-	case XST_PM_SUCCESS:
-	case XST_PM_DOUBLE_REQ:
-		return 0;
-	case XST_PM_NO_FEATURE:
-		return -ENOTSUPP;
-	case XST_PM_INVALID_VERSION:
-		return -EOPNOTSUPP;
-	case XST_PM_NO_ACCESS:
-		return -EACCES;
-	case XST_PM_ABORT_SUSPEND:
-		return -ECANCELED;
-	case XST_PM_MULT_USER:
-		return -EUSERS;
-	case XST_PM_INTERNAL:
-	case XST_PM_CONFLICT:
-	case XST_PM_INVALID_NODE:
-	case XST_PM_INVALID_CRC:
-	default:
-		return -EINVAL;
-	}
-}
-
-static noinline int do_fw_call_fail(u32 *ret_payload, u32 num_args, ...)
-{
-	return -ENODEV;
-}
-
-/*
- * PM function call wrapper
- * Invoke do_fw_call_smc or do_fw_call_hvc, depending on the configuration
- */
-static int (*do_fw_call)(u32 *ret_payload, u32, ...) = do_fw_call_fail;
-
-/**
- * do_fw_call_smc() - Call system-level platform management layer (SMC)
- * @num_args:		Number of variable arguments should be <= 8
- * @ret_payload:	Returned value array
- *
- * Invoke platform management function via SMC call (no hypervisor present).
- *
- * Return: Returns status, either success or error+reason
- */
-static noinline int do_fw_call_smc(u32 *ret_payload, u32 num_args, ...)
-{
-	struct arm_smccc_res res;
-	u64 args[8] = {0};
-	va_list arg_list;
-	u8 i;
-
-	if (num_args > 8)
-		return -EINVAL;
-
-	va_start(arg_list, num_args);
-
-	for (i = 0; i < num_args; i++)
-		args[i] = va_arg(arg_list, u64);
-
-	va_end(arg_list);
-
-	arm_smccc_smc(args[0], args[1], args[2], args[3], args[4], args[5], args[6], args[7], &res);
-
-	if (ret_payload) {
-		ret_payload[0] = lower_32_bits(res.a0);
-		ret_payload[1] = upper_32_bits(res.a0);
-		ret_payload[2] = lower_32_bits(res.a1);
-		ret_payload[3] = upper_32_bits(res.a1);
-		ret_payload[4] = lower_32_bits(res.a2);
-		ret_payload[5] = upper_32_bits(res.a2);
-		ret_payload[6] = lower_32_bits(res.a3);
-	}
-
-	return zynqmp_pm_ret_code((enum pm_ret_status)res.a0);
-}
-
-/**
- * do_fw_call_hvc() - Call system-level platform management layer (HVC)
- * @num_args:		Number of variable arguments should be <= 8
- * @ret_payload:	Returned value array
- *
- * Invoke platform management function via HVC
- * HVC-based for communication through hypervisor
- * (no direct communication with ATF).
- *
- * Return: Returns status, either success or error+reason
- */
-static noinline int do_fw_call_hvc(u32 *ret_payload, u32 num_args, ...)
-{
-	struct arm_smccc_res res;
-	u64 args[8] = {0};
-	va_list arg_list;
-	u8 i;
-
-	if (num_args > 8)
-		return -EINVAL;
-
-	va_start(arg_list, num_args);
-
-	for (i = 0; i < num_args; i++)
-		args[i] = va_arg(arg_list, u64);
-
-	va_end(arg_list);
-
-	arm_smccc_hvc(args[0], args[1], args[2], args[3], args[4], args[5], args[6], args[7], &res);
-
-	if (ret_payload) {
-		ret_payload[0] = lower_32_bits(res.a0);
-		ret_payload[1] = upper_32_bits(res.a0);
-		ret_payload[2] = lower_32_bits(res.a1);
-		ret_payload[3] = upper_32_bits(res.a1);
-		ret_payload[4] = lower_32_bits(res.a2);
-		ret_payload[5] = upper_32_bits(res.a2);
-		ret_payload[6] = lower_32_bits(res.a3);
-	}
-
-	return zynqmp_pm_ret_code((enum pm_ret_status)res.a0);
-}
-
-static int __do_feature_check_call(const u32 api_id, u32 *ret_payload)
-{
-	int ret;
-	u64 smc_arg[2];
-	u32 module_id;
-	u32 feature_check_api_id;
-
-	module_id = FIELD_GET(MODULE_ID_MASK, api_id);
-
-	/*
-	 * Feature check of APIs belonging to PM and XSEM are handled by calling
-	 * PM_FEATURE_CHECK API. For other modules, call PM_API_FEATURES API.
-	 */
-	if (module_id == PM_MODULE_ID || module_id == XSEM_MODULE_ID)
-		feature_check_api_id = PM_FEATURE_CHECK;
-	else
-		feature_check_api_id = PM_API_FEATURES;
-
-	if (module_id == TF_A_MODULE_ID)
-		smc_arg[1] = api_id;
-	else
-		smc_arg[1] = (api_id & API_ID_MASK);
-
-	smc_arg[0] = PM_SIP_SVC | FIELD_PREP(MODULE_ID_MASK, module_id) | feature_check_api_id;
-
-	ret = do_fw_call(ret_payload, 2, smc_arg[0], smc_arg[1]);
-
-	/*
-	 * For TF-A APIs, if the feature check with PM_API_FEATURES fails,
-	 * retry with the legacy PM_FEATURE_CHECK for backward compatibility.
-	 */
-	if (module_id == TF_A_MODULE_ID && ret) {
-		smc_arg[0] = PM_SIP_SVC | FIELD_PREP(MODULE_ID_MASK, PM_MODULE_ID) |
-			     PM_FEATURE_CHECK;
-		ret = do_fw_call(ret_payload, 2, smc_arg[0], smc_arg[1]);
-	}
-
-	if (ret)
-		return ret;
-
-	return ret_payload[1];
-}
-
-static int do_feature_check_call(const u32 api_id)
-{
-	int ret;
-	u32 ret_payload[PAYLOAD_ARG_CNT];
-	struct pm_api_feature_data *feature_data;
-
-	/* Check for existing entry in hash table for given api */
-	hash_for_each_possible(pm_api_features_map, feature_data, hentry,
-			       api_id) {
-		if (feature_data->pm_api_id == api_id)
-			return feature_data->feature_status;
-	}
-
-	/* Add new entry if not present */
-	feature_data = kmalloc_obj(*feature_data, GFP_ATOMIC);
-	if (!feature_data)
-		return -ENOMEM;
-
-	feature_data->pm_api_id = api_id;
-	ret = __do_feature_check_call(api_id, ret_payload);
-
-	feature_data->feature_status = ret;
-	hash_add(pm_api_features_map, &feature_data->hentry, api_id);
-
-	if (api_id == PM_IOCTL)
-		/* Store supported IOCTL IDs mask */
-		memcpy(ioctl_features, &ret_payload[2], FEATURE_PAYLOAD_SIZE * 4);
-	else if (api_id == PM_QUERY_DATA)
-		/* Store supported QUERY IDs mask */
-		memcpy(query_features, &ret_payload[2], FEATURE_PAYLOAD_SIZE * 4);
-
-	return ret;
-}
-
-/**
- * zynqmp_pm_feature() - Check whether given feature is supported or not and
- *			 store supported IOCTL/QUERY ID mask
- * @api_id:		API ID to check
- *
- * Return: Returns status, either success or error+reason
- */
-int zynqmp_pm_feature(const u32 api_id)
-{
-	int ret;
-
-	if (!feature_check_enabled)
-		return 0;
-
-	ret = do_feature_check_call(api_id);
-
-	return ret;
-}
-EXPORT_SYMBOL_GPL(zynqmp_pm_feature);
-
-/**
- * zynqmp_pm_is_function_supported() - Check whether given IOCTL/QUERY function
- *				       is supported or not
- * @api_id:		PM_IOCTL or PM_QUERY_DATA
- * @id:			IOCTL or QUERY function IDs
- *
- * Return: Returns status, either success or error+reason
- */
-int zynqmp_pm_is_function_supported(const u32 api_id, const u32 id)
-{
-	int ret;
-	u32 *bit_mask;
-
-	/* Input arguments validation */
-	if (id >= 64 || (api_id != PM_IOCTL && api_id != PM_QUERY_DATA))
-		return -EINVAL;
-
-	/* Check feature check API version */
-	ret = do_feature_check_call(PM_FEATURE_CHECK);
-	if (ret < 0)
-		return ret;
-
-	/* Check if feature check version 2 is supported or not */
-	if ((ret & FIRMWARE_VERSION_MASK) == PM_API_VERSION_2) {
-		/*
-		 * Call feature check for IOCTL/QUERY API to get IOCTL ID or
-		 * QUERY ID feature status.
-		 */
-		ret = do_feature_check_call(api_id);
-		if (ret < 0)
-			return ret;
-
-		bit_mask = (api_id == PM_IOCTL) ? ioctl_features : query_features;
-
-		if ((bit_mask[(id / 32)] & BIT((id % 32))) == 0U)
-			return -EOPNOTSUPP;
-	} else {
-		return -ENODATA;
-	}
-
-	return 0;
-}
-EXPORT_SYMBOL_GPL(zynqmp_pm_is_function_supported);
-
-/**
- * zynqmp_pm_invoke_fw_fn() - Invoke the system-level platform management layer
- *			caller function depending on the configuration
- * @pm_api_id:		Requested PM-API call
- * @ret_payload:	Returned value array
- * @num_args:		Number of arguments to requested PM-API call
- *
- * Invoke platform management function for SMC or HVC call, depending on
- * configuration.
- * Following SMC Calling Convention (SMCCC) for SMC64:
- * Pm Function Identifier,
- * PM_SIP_SVC + PASS_THROUGH_FW_CMD_ID =
- *	((SMC_TYPE_FAST << FUNCID_TYPE_SHIFT)
- *	((SMC_64) << FUNCID_CC_SHIFT)
- *	((SIP_START) << FUNCID_OEN_SHIFT)
- *	(PASS_THROUGH_FW_CMD_ID))
- *
- * PM_SIP_SVC - Registered ZynqMP SIP Service Call.
- * PASS_THROUGH_FW_CMD_ID - Fixed SiP SVC call ID for FW specific calls.
- *
- * Return: Returns status, either success or error+reason
- */
-int zynqmp_pm_invoke_fw_fn(u32 pm_api_id, u32 *ret_payload, u32 num_args, ...)
-{
-	/*
-	 * Added SIP service call Function Identifier
-	 * Make sure to stay in x0 register
-	 */
-	u64 smc_arg[SMC_ARG_CNT_64];
-	int ret, i;
-	va_list arg_list;
-	u32 args[SMC_ARG_CNT_32] = {0};
-	u32 module_id;
-
-	/*
-	 * According to the SMCCC: The total number of registers available for
-	 * arguments is 16.
-	 *
-	 * In the Extended SMC format, 3 registers are used for headers, leaving
-	 * up to 13 registers for arguments.
-	 */
-	if (num_args > SMC_ARG_CNT_32)
-		return -EINVAL;
-
-	/* Check if feature is supported or not */
-	ret = zynqmp_pm_feature(pm_api_id);
-	if (ret < 0)
-		return ret;
-
-	va_start(arg_list, num_args);
-
-	for (i = 0; i < num_args; i++)
-		args[i] = va_arg(arg_list, u32);
-
-	va_end(arg_list);
-
-	module_id = FIELD_GET(PLM_MODULE_ID_MASK, pm_api_id);
-
-	if (module_id == 0)
-		module_id = XPM_MODULE_ID;
-
-	smc_arg[0] = PM_SIP_SVC | PASS_THROUGH_FW_CMD_ID;
-	smc_arg[1] = ((u64)args[0] << 32U) | FIELD_PREP(PLM_MODULE_ID_MASK, module_id) |
-		      (pm_api_id & API_ID_MASK);
-	for (i = 1; i < (SMC_ARG_CNT_64 - 1); i++)
-		smc_arg[i + 1] = ((u64)args[(i * 2)] << 32U) | args[(i * 2) - 1];
-
-	return do_fw_call(ret_payload, 8, smc_arg[0], smc_arg[1], smc_arg[2], smc_arg[3],
-			  smc_arg[4], smc_arg[5], smc_arg[6], smc_arg[7]);
-}
-
-/**
- * zynqmp_pm_invoke_fn() - Invoke the system-level platform management layer
- *			   caller function depending on the configuration
- * @pm_api_id:		Requested PM-API call
- * @ret_payload:	Returned value array
- * @num_args:		Number of arguments to requested PM-API call
- *
- * Invoke platform management function for SMC or HVC call, depending on
- * configuration.
- * Following SMC Calling Convention (SMCCC) for SMC64:
- * Pm Function Identifier,
- * PM_SIP_SVC + PM_API_ID =
- *	((SMC_TYPE_FAST << FUNCID_TYPE_SHIFT)
- *	((SMC_64) << FUNCID_CC_SHIFT)
- *	((SIP_START) << FUNCID_OEN_SHIFT)
- *	((PM_API_ID) & FUNCID_NUM_MASK))
- *
- * PM_SIP_SVC	- Registered ZynqMP SIP Service Call.
- * PM_API_ID	- Platform Management API ID.
- *
- * Return: Returns status, either success or error+reason
- */
-int zynqmp_pm_invoke_fn(u32 pm_api_id, u32 *ret_payload, u32 num_args, ...)
-{
-	/*
-	 * Added SIP service call Function Identifier
-	 * Make sure to stay in x0 register
-	 */
-	u64 smc_arg[8];
-	int ret, i;
-	va_list arg_list;
-	u32 args[SMC_ARG_CNT_BASIC_32] = {0};
-
-	/*
-	 * According to the SMCCC: The total number of registers available for
-	 * arguments is 16.
-	 *
-	 * In the Basic SMC format, 2 registers are used for headers, leaving
-	 * up to 14 registers for arguments.
-	 */
-	if (num_args > SMC_ARG_CNT_BASIC_32)
-		return -EINVAL;
-
-	/* Check if feature is supported or not */
-	ret = zynqmp_pm_feature(pm_api_id);
-	if (ret < 0)
-		return ret;
-
-	va_start(arg_list, num_args);
-
-	for (i = 0; i < num_args; i++)
-		args[i] = va_arg(arg_list, u32);
-
-	va_end(arg_list);
-
-	smc_arg[0] = PM_SIP_SVC | pm_api_id;
-	for (i = 0; i < 7; i++)
-		smc_arg[i + 1] = ((u64)args[(i * 2) + 1] << 32) | args[i * 2];
-
-	return do_fw_call(ret_payload, 8, smc_arg[0], smc_arg[1], smc_arg[2], smc_arg[3],
-			  smc_arg[4], smc_arg[5], smc_arg[6], smc_arg[7]);
-}
-
 int zynqmp_pm_register_sgi(u32 sgi_num, u32 reset)
 {
 	int ret;
@@ -553,62 +91,13 @@ int zynqmp_pm_get_chipid(u32 *idcode, u32 *version)
 }
 EXPORT_SYMBOL_GPL(zynqmp_pm_get_chipid);
 
-/**
- * zynqmp_pm_get_family_info() - Get family info of platform
- * @family:	Returned family code value
- *
- * Return: Returns status, either success or error+reason
- */
-int zynqmp_pm_get_family_info(u32 *family)
-{
-	if (!active_platform_fw_data)
-		return -ENODEV;
-
-	if (!family)
-		return -EINVAL;
-
-	*family = active_platform_fw_data->family_code;
-
-	return 0;
-}
-EXPORT_SYMBOL_GPL(zynqmp_pm_get_family_info);
-
-/**
- * zynqmp_pm_get_sip_svc_version() - Get SiP service call version
- * @version:	Returned version value
- *
- * Return: Returns status, either success or error+reason
- */
-static int zynqmp_pm_get_sip_svc_version(u32 *version)
-{
-	struct arm_smccc_res res;
-	u64 args[SMC_ARG_CNT_64] = {0};
-
-	if (!version)
-		return -EINVAL;
-
-	/* Check if SiP SVC version already verified */
-	if (sip_svc_version > 0) {
-		*version = sip_svc_version;
-		return 0;
-	}
-
-	args[0] = GET_SIP_SVC_VERSION;
-
-	arm_smccc_smc(args[0], args[1], args[2], args[3], args[4], args[5], args[6], args[7], &res);
-
-	*version = ((lower_32_bits(res.a0) << 16U) | lower_32_bits(res.a1));
-
-	return zynqmp_pm_ret_code(XST_PM_SUCCESS);
-}
-
 /**
  * zynqmp_pm_get_trustzone_version() - Get secure trustzone firmware version
  * @version:	Returned version value
  *
  * Return: Returns status, either success or error+reason
  */
-static int zynqmp_pm_get_trustzone_version(u32 *version)
+int zynqmp_pm_get_trustzone_version(u32 *version)
 {
 	u32 ret_payload[PAYLOAD_ARG_CNT];
 	int ret;
@@ -622,36 +111,6 @@ static int zynqmp_pm_get_trustzone_version(u32 *version)
 	return ret;
 }
 
-/**
- * get_set_conduit_method() - Choose SMC or HVC based communication
- * @np:		Pointer to the device_node structure
- *
- * Use SMC or HVC-based functions to communicate with EL2/EL3.
- *
- * Return: Returns 0 on success or error code
- */
-static int get_set_conduit_method(struct device_node *np)
-{
-	const char *method;
-
-	if (of_property_read_string(np, "method", &method)) {
-		pr_warn("%s missing \"method\" property\n", __func__);
-		return -ENXIO;
-	}
-
-	if (!strcmp("hvc", method)) {
-		do_fw_call = do_fw_call_hvc;
-	} else if (!strcmp("smc", method)) {
-		do_fw_call = do_fw_call_smc;
-	} else {
-		pr_warn("%s Invalid \"method\" property: %s\n",
-			__func__, method);
-		return -EINVAL;
-	}
-
-	return 0;
-}
-
 /**
  * zynqmp_pm_query_data() - Get query data from firmware
  * @qdata:	Variable to the zynqmp_pm_query_data structure
@@ -662,8 +121,14 @@ static int get_set_conduit_method(struct device_node *np)
 int zynqmp_pm_query_data(struct zynqmp_pm_query_data qdata, u32 *out)
 {
 	int ret, i = 0;
+	u32 sip_svc_version;
 	u32 ret_payload[PAYLOAD_ARG_CNT] = {0};
 
+	/* Get SiP SVC version number */
+	ret = zynqmp_pm_get_sip_svc_version(&sip_svc_version);
+	if (ret)
+		return ret;
+
 	if (sip_svc_version >= SIP_SVC_PASSTHROUGH_VERSION) {
 		ret = zynqmp_pm_invoke_fw_fn(PM_QUERY_DATA, ret_payload, 4,
 					     qdata.qid, qdata.arg1,
@@ -1232,7 +697,7 @@ EXPORT_SYMBOL_GPL(zynqmp_pm_bootmode_write);
  * This API function is to be used for notify the power management controller
  * about the completed power management initialization.
  */
-static int zynqmp_pm_init_finalize(void)
+int zynqmp_pm_init_finalize(void)
 {
 	return zynqmp_pm_invoke_fn(PM_PM_INIT_FINALIZE, NULL, 0);
 }
@@ -2082,7 +1547,7 @@ static const struct attribute *zynqmp_firmware_attrs[] = {
 	NULL,
 };
 
-static int zynqmp_firmware_pm_sysfs_entry(struct platform_device *pdev)
+int zynqmp_firmware_pm_sysfs_entry(struct platform_device *pdev)
 {
 	int ret;
 
@@ -2094,254 +1559,3 @@ static int zynqmp_firmware_pm_sysfs_entry(struct platform_device *pdev)
 
 	return ret;
 }
-
-/**
- * zynqmp_clear_pm_state() - Clear subsystem state
- * @dev: Device pointer used for logging
- *
- * Clears PM specific data in EL3 and platform firmware.
- *
- * Return: Returns status, either success or error
- */
-static int zynqmp_clear_pm_state(struct device *dev)
-{
-	u32 pm_family_code;
-	int ret;
-
-	/* Get the Family code of platform */
-	ret = zynqmp_pm_get_family_info(&pm_family_code);
-	if (ret < 0)
-		return ret;
-
-	/* Supporting on Versal and Versal Net platforms only */
-	if (pm_family_code == PM_VERSAL_FAMILY_CODE ||
-	    pm_family_code == PM_VERSAL_NET_FAMILY_CODE) {
-		/* Check if EL3 firmware supports TF_A_CLEAR_PM_STATE */
-		ret = do_feature_check_call(TF_A_CLEAR_PM_STATE);
-		if (ret >= 0 && ((ret & FIRMWARE_VERSION_MASK) >= PM_API_VERSION_1)) {
-			/* Clear PM specific data in EL3 firmware */
-			ret = zynqmp_pm_invoke_fn(TF_A_CLEAR_PM_STATE, NULL, 0);
-			if (ret)
-				dev_err(dev,
-					"Failed to clear EL3 PM subsystem state: %d\n", ret);
-		} else {
-			dev_warn(dev, "TF_A_CLEAR_PM_STATE is not supported by EL3 firmware: %d\n", ret);
-		}
-
-		/* Check if the firmware supports the PM_DEV_ALL_PERIPH node ID */
-		ret = do_feature_check_call(PM_RELEASE_NODE);
-		if (ret >= 0 && ((ret & FIRMWARE_VERSION_MASK) >= PM_API_VERSION_3)) {
-			/* Attempt to release all peripheral devices via firmware */
-			ret = zynqmp_pm_release_node(PM_DEV_ALL_PERIPH);
-			if (ret)
-				dev_err(dev, "Failed to release all peripheral devices: %d\n", ret);
-		} else {
-			dev_warn(dev,
-				 "Bulk device release is not supported by firmware: %d\n", ret);
-		}
-
-		/* Check if the firmware supports the PM_DEV_ALL_PERIPH node ID */
-		ret = do_feature_check_call(PM_REQUEST_NODE);
-		if (ret >= 0 && ((ret & FIRMWARE_VERSION_MASK) >= PM_API_VERSION_3)) {
-			/* Attempt to request all nodes via firmware */
-			ret = zynqmp_pm_request_node(PM_DEV_ALL_PERIPH, 0, 0, 0);
-			if (ret)
-				dev_err(dev, "Failed to request all peripheral devices: %d\n", ret);
-		} else {
-			dev_warn(dev,
-				 "Firmware doesn't support request all peripheral devices at once: %d\n",
-				 ret);
-		}
-
-		/* Check if the firmware supports the PM_ALL_NOTIFIERS node ID */
-		ret = do_feature_check_call(PM_REGISTER_NOTIFIER);
-		if (ret >= 0 && ((ret & FIRMWARE_VERSION_MASK) >= PM_API_VERSION_3)) {
-			/* Attempt to unregister all notifier callbacks via firmware */
-			ret = zynqmp_pm_register_notifier(PM_ALL_NOTIFIERS, 0, 0, 0);
-			if (ret)
-				dev_err(dev, "Failed to unregister all notifiers: %d\n", ret);
-		} else {
-			dev_warn(dev,
-				 "Firmware doesn't support unregister all notifiers at once: %d\n",
-				 ret);
-			ret = 0;
-		}
-	}
-
-	return ret;
-}
-
-static int zynqmp_firmware_probe(struct platform_device *pdev)
-{
-	u32 pm_api_version, pm_family_code, pm_tz_version;
-	struct device *dev = &pdev->dev;
-	struct zynqmp_devinfo *devinfo;
-	int ret;
-
-	ret = get_set_conduit_method(dev->of_node);
-	if (ret)
-		return ret;
-
-	/* Get platform-specific firmware data from device tree match */
-	active_platform_fw_data = (struct platform_fw_data *)device_get_match_data(dev);
-	if (!active_platform_fw_data)
-		return -EINVAL;
-
-	/* Get SiP SVC version number */
-	ret = zynqmp_pm_get_sip_svc_version(&sip_svc_version);
-	if (ret)
-		return ret;
-
-	ret = do_feature_check_call(PM_FEATURE_CHECK);
-	if (ret >= 0 && ((ret & FIRMWARE_VERSION_MASK) >= PM_API_VERSION_1))
-		feature_check_enabled = true;
-
-	devinfo = devm_kzalloc_obj(dev, *devinfo);
-	if (!devinfo)
-		return -ENOMEM;
-
-	devinfo->dev = dev;
-
-	platform_set_drvdata(pdev, devinfo);
-
-	/* Check PM API version number */
-	ret = zynqmp_pm_get_api_version(&pm_api_version);
-	if (ret)
-		return ret;
-
-	if (pm_api_version < ZYNQMP_PM_VERSION) {
-		panic("%s Platform Management API version error. Expected: v%d.%d - Found: v%d.%d\n",
-		      __func__,
-		      ZYNQMP_PM_VERSION_MAJOR, ZYNQMP_PM_VERSION_MINOR,
-		      pm_api_version >> 16, pm_api_version & 0xFFFF);
-	}
-
-	pr_info("%s Platform Management API v%d.%d\n", __func__,
-		pm_api_version >> 16, pm_api_version & 0xFFFF);
-
-	/* Get the Family code of platform */
-	ret = zynqmp_pm_get_family_info(&pm_family_code);
-	if (ret < 0)
-		return ret;
-
-	if (is_kdump_kernel())
-		zynqmp_clear_pm_state(dev);
-
-	/* Check trustzone version number */
-	ret = zynqmp_pm_get_trustzone_version(&pm_tz_version);
-	if (ret)
-		panic("Legacy trustzone found without version support\n");
-
-	if (pm_tz_version < ZYNQMP_TZ_VERSION)
-		panic("%s Trustzone version error. Expected: v%d.%d - Found: v%d.%d\n",
-		      __func__,
-		      ZYNQMP_TZ_VERSION_MAJOR, ZYNQMP_TZ_VERSION_MINOR,
-		      pm_tz_version >> 16, pm_tz_version & 0xFFFF);
-
-	pr_info("%s Trustzone version v%d.%d\n", __func__,
-		pm_tz_version >> 16, pm_tz_version & 0xFFFF);
-
-	ret = mfd_add_devices(&pdev->dev, PLATFORM_DEVID_NONE, firmware_devs,
-			      ARRAY_SIZE(firmware_devs), NULL, 0, NULL);
-	if (ret) {
-		dev_err(&pdev->dev, "failed to add MFD devices %d\n", ret);
-		return ret;
-	}
-
-	ret = zynqmp_firmware_pm_sysfs_entry(pdev);
-	if (ret) {
-		pr_err("%s() Failed to create sysfs file with error%d\n",
-		       __func__, ret);
-		return ret;
-	}
-
-	zynqmp_pm_api_debugfs_init();
-
-	if (pm_family_code != PM_ZYNQMP_FAMILY_CODE) {
-		em_dev = platform_device_register_data(&pdev->dev, "xlnx_event_manager",
-						       -1, NULL, 0);
-		if (IS_ERR(em_dev))
-			dev_err_probe(&pdev->dev, PTR_ERR(em_dev), "EM register fail with error\n");
-	}
-
-	return of_platform_populate(dev->of_node, NULL, NULL, dev);
-}
-
-static void zynqmp_firmware_shutdown(struct platform_device *pdev)
-{
-	zynqmp_clear_pm_state(&pdev->dev);
-}
-
-static void zynqmp_firmware_remove(struct platform_device *pdev)
-{
-	struct pm_api_feature_data *feature_data;
-	struct hlist_node *tmp;
-	int i;
-
-	mfd_remove_devices(&pdev->dev);
-	zynqmp_pm_api_debugfs_exit();
-
-	hash_for_each_safe(pm_api_features_map, i, tmp, feature_data, hentry) {
-		hash_del(&feature_data->hentry);
-		kfree(feature_data);
-	}
-
-	platform_device_unregister(em_dev);
-}
-
-static const struct platform_fw_data platform_fw_data_versal = {
-	.family_code = PM_VERSAL_FAMILY_CODE,
-};
-
-static const struct platform_fw_data platform_fw_data_versal_net = {
-	.family_code = PM_VERSAL_NET_FAMILY_CODE,
-};
-
-static const struct platform_fw_data platform_fw_data_zynqmp = {
-	.family_code = PM_ZYNQMP_FAMILY_CODE,
-};
-
-static const struct of_device_id zynqmp_firmware_of_match[] = {
-	{.compatible = "xlnx,zynqmp-firmware", .data = &platform_fw_data_zynqmp},
-	{.compatible = "xlnx,versal-firmware", .data = &platform_fw_data_versal},
-	{.compatible = "xlnx,versal-net-firmware", .data = &platform_fw_data_versal_net},
-	{},
-};
-MODULE_DEVICE_TABLE(of, zynqmp_firmware_of_match);
-
-static struct platform_driver zynqmp_firmware_driver = {
-	.driver = {
-		.name = "zynqmp_firmware",
-		.of_match_table = zynqmp_firmware_of_match,
-	},
-	.probe = zynqmp_firmware_probe,
-	.remove = zynqmp_firmware_remove,
-	.shutdown = zynqmp_firmware_shutdown,
-};
-module_platform_driver(zynqmp_firmware_driver);
-
-/*
- * pm_init_finalize was previously called from the firmware driver's
- * sync_state callback, but sync_state can be blocked indefinitely if
- * any device consumer never probes. Use late_initcall to ensure
- * pm_init_finalize is called reliably regardless of consumer
- * probe status.
- */
-static int __init zynqmp_pm_init_finalize_late(void)
-{
-	u32 pm_family_code;
-	int ret;
-
-	ret = zynqmp_pm_get_family_info(&pm_family_code);
-	if (ret)
-		return ret;
-
-	if (pm_family_code != PM_ZYNQMP_FAMILY_CODE)
-		return 0;
-
-	if (zynqmp_pm_init_finalize())
-		pr_warn("zynqmp: failed to release power management to firmware\n");
-
-	return 0;
-}
-late_initcall(zynqmp_pm_init_finalize_late);
-- 
2.43.0


