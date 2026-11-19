Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1391C606A33D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 13:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0F1TZAMQ;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=pW8Y5Zrc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=LRmSkAGfkJEgHbbUvBygkg+5gTIZwqYYMC2rxV7IdXU=; b=0F1TZAMQM161PB+GV0vz03vFUy
	jouBeMDnvNyiaqxea1OI5kHMaiRzUuwXnKv8uh9EnSem4VX4p1IW2fyBgA5BJkabekuMjGBecrAoj
	fPwTsP05JPyoKd84CDHSTQXJTrvrWKe4xrQ9vVMe1th7mmtgiVvKVgYuOHzFcsejEc8A5w07NO/hD
	qBqpQV+tWqF1VoMrzerpP2sPLCKnMky3PG0tAH3U/4yZaX1bEW/WSMIxtm9iPaQ0KoVwmAY6CPMAL
	B4IRER0+4+13qWE+0heUtlml6xobamxsu/xLy2qYxqXm/y0aBoyq02oHJi33C3haMfo8SDc3zmZmh
	JiPBfvqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU23R-0000000C0sj-0Yj0;
	Thu, 19 Nov 2026 13:19:57 +0000
Received: from mail-centralusazlp170110009.outbound.protection.outlook.com ([2a01:111:f403:c111::9] helo=DM5PR21CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU23O-0000000C0s1-0edU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 13:19:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TjXmBpRhg3ekM+k2nDpZe5xS5nLl8TW8sS14uYqQf73K3HhCzFnkBbq8IPiqoj/w4mOn5Oht2ZuQBOncA+GpfB0SsqTqRuys6VtrlfPxk6yPQB7q4piwlZb3gDh1W53Cot82LlX4ANLsuqYmwhIx5KRIJuMDkR/95Je6h/f5cUA034/3hYMS1XeHTrgjkKxg7QqxPGP0/nHk6+cAM594j2H0cEMZqHOsg6EhVSyheGiXd631Xxo/W5Oz04ADh9To10rXgE40SO+MOrUbd1XO4gJ3PqA5sB3z65IgFGeJCHmdvZsCS3X3I4IOL/F2HJIuhm9PwdhinuBTtX94MXsimg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LRmSkAGfkJEgHbbUvBygkg+5gTIZwqYYMC2rxV7IdXU=;
 b=VIKepMKhd7PyUMCsCQmiZKMr034yFhwxM0RW8ORGX4eRQTvO10ZIkFEOI9p9/VMpT7LwGtxaN43ExQ0BXL1lJbjA/g10m064fcKHeNVShci1TTXArMM5h+LeTeLGoXYmqR7a75MeNcVKuWQyJgoF+AFQS3SbfQDeD0+MklFko1Nt/FduTIaNcGhonByk2DfxIQ8MbDUYSFprDOeNj+URCjgudt3FXT4qyoVd//ThouVPWL1B5sgFW5EQg3DWlJKdck4wUtTybGLFKDQkPVK5HW79dJgfr860qF4qmjKlYGjqJ3mcQgK+kgNd/Hmhs/drORATwL8j1Klw4/vNheq2XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LRmSkAGfkJEgHbbUvBygkg+5gTIZwqYYMC2rxV7IdXU=;
 b=pW8Y5Zrcs9MPK7YL5+/UCLqf30tEedGdTBzvOirUgg7ZipqxcPEsJ1rc0lM8AUTppWyjH0J6T/NDDLQioCCypdN/UZbZf/lY4aSrNd9yUuLHcJdaqb+C9DViTOBeDWOjlPD36YykFL7bdDug8Eus8/fl+jbq32sa6QUXA8rYGWs=
Received: from PH0PR07CA0082.namprd07.prod.outlook.com (2603:10b6:510:f::27)
 by MW3PR12MB4426.namprd12.prod.outlook.com (2603:10b6:303:58::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 13:17:47 +0000
Received: from CY6PEPF00000049.namprd03.prod.outlook.com
 (2603:10b6:510:f:cafe::aa) by PH0PR07CA0082.outlook.office365.com
 (2603:10b6:510:f::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Thu,
 19 Nov 2026 13:17:46 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CY6PEPF00000049.mail.protection.outlook.com (10.167.247.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Thu, 19 Nov 2026 13:17:46 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 19 Nov
 2026 07:17:45 -0600
Received: from localhost (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57 via Frontend
 Transport; Thu, 19 Nov 2026 07:17:44 -0600
From: Michal Simek <michal.simek@amd.com>
To: <linux-kernel@vger.kernel.org>, <monstr@monstr.eu>,
	<michal.simek@amd.com>, <git@amd.com>
CC: Ulf Hansson <ulfh@kernel.org>, "moderated list:ARM/ZYNQ ARCHITECTURE"
	<linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 1/6] firmware: xilinx: Use late_initcall for pm_init_finalize
Date: Thu, 19 Nov 2026 14:17:25 +0100
Message-ID: <b22f67ed91d6a49f240a63bb57a87dfda2ddf062.1795094242.git.michal.simek@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795094242.git.michal.simek@amd.com>
References: <cover.1795094242.git.michal.simek@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3602; i=michal.simek@amd.com; h=from:subject:message-id; bh=DZTJxT3i4+YgknS3JQ14d4XkYT+fW0yPYO3JGZ9rpBc=; b=owGbwMvMwCG2mv3fB7+vgl8ZT6slMWT9+/a+YDn7nFhn0263qyIu33q/+ab0LJMUmqWj5b+yk eHgGWGXjlIWBjEOBlkxRZbpTDoOa75dWyq2PDIfZg4rE8gQBi5OAZjIv0JGhg8b9jApz9zzPmO9 oqRxQvjVA8eufOGNuc37TNpxbfCCVTWMDAsCbS5pJc64eybT4f6j83+Smo7Jvvu2X4El+Wt1QsP qW1wA
X-Developer-Key: i=michal.simek@amd.com; a=openpgp; fpr=67350C9BF5CCEE9B5364356A377C7F21FE3D1F91
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY6PEPF00000049:EE_|MW3PR12MB4426:EE_
X-MS-Office365-Filtering-Correlation-Id: 484f61a8-dd03-4130-5a04-08df463f8086
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|36860700016|23010399003|82310400026|56012099006|261022105027099003|261021121427099003|261026121527099003|11063799006|10067099003|261026140227099003|261021123027099003|261022075727099003|261028144727099003|261102123227099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: Z8cDnNqILTAArV/21S0SkZoxBpbS/tTe7YdCjGRXuL4cXmVOBp9zCQDNHbmLjIsY20XSCx5DXz0dBcwMfScFSrO0laJjy0L7SGv/z2e9EUop7R3Hm4qnfDD6scaigDYVkdHk7VkIaK76y/zsavNnHd2UgvYSFk/br7GnoOhrfGn0OzOc+ZcJ398rlF/PN1VetyV/v2MR76kLAEe3tx5/F40mUgXmzET94VEZQ27tkHZb85XCGMu0Jc5ecrAb9amSVS79Lc3CGhAdC4TBiiIIycU+fA/XS1qgyAjbO2e0h40ymgYMmi6bcVkXGpsFzcv0EvCRGSetN5T/Llw8xQL7ALrlMjnkRvjNGp7UrUwN+4YP/91wkohiILHDWHwmQMZCORc8cscy9F/mNJVm5gThPqlR+NVTh269s3Dtd2QHS0uT1GIRW4PFRe0IEVfyr7NUitoWDK1SrPyJffjqDBDW3O7FMZL5FLKtFN91JV6+Zfh1O3ilZy/LjQEJEJgPF831g96zrIaIToCivta4L+2/Ag+uRGTxfyvAcJBSE3+othJurBx9o1t7f+ctNRRgrZaqXUQ78WLdR64zwtj70l1EoOeNULajdfQyxemSFvjlBaXIH1Qk/HZ+J6lwJKg7XixEJTHc5TvIK9v9brJ/EWHJPUM5Dnrl+FKGuq1vpSrumst8PoskG1zAWgLpzI5HOhpm/scuJUlzEQP/LrAmZEB1Dw==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700016)(23010399003)(82310400026)(56012099006)(261022105027099003)(261021121427099003)(261026121527099003)(11063799006)(10067099003)(261026140227099003)(261021123027099003)(261022075727099003)(261028144727099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: BRlJc8v8ulVM1kwdbEff1nDhl1n3wmRegCHVzDBzpUiT5otrkjtnozp3Ou1/5La4jAMRI/PQFYgEBPbGHZZqDqpFpF75J4dcHMU8iW+VwLu1swXhk/85n66JPBT9QNKGrNkuPfgcIqJmyRs5vB9aQPQMAKQ0a5CNX/zxWbJ1BCPG8aZ/DsmTXpDsv1ElaxPwVY/5Lqngihii46gOBaL+0P+nrlMN91WWooRuhhQOQr0tU0BMOeMkiIZi9kfQguNX98CIbAC0J3uz4IWJXWVwbU2H6LS8pWPwub52v3PsVztRJHqZJe7gSrJ1nVObDz48gKXhXD88b0GFhDRXCuOLeffuZHNMieUUaPv5LmKF4NHbene6MDrvqo+vQr2b547OVopVj9VkE6BltM2nVsj+/begX3hdvb4iiHU9I6baRMFVyV9QZOFaW8pLNEhv1tq9
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 13:17:46.2125
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 484f61a8-dd03-4130-5a04-08df463f8086
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY6PEPF00000049.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4426
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_051954_221924_C695B226 
X-CRM114-Status: GOOD (  19.95  )
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

The current implementation uses the driver sync_state callback to call
zynqmp_pm_init_finalize(). This callback only fires when all consumers
of the firmware node have probed their drivers. If any consumer device
has its driver disabled or built as a never-loaded module, sync_state
never fires and pm_init_finalize is never called.

This causes PMUFW to remain in UNINITIALIZED state, leading to IPI
deadlock during CPU idle on ZynqMP platforms.

Replace sync_state with late_initcall to guarantee pm_init_finalize is
called. By late_initcall time, all built-in drivers including the
console UART have probed and requested their power domains, avoiding
any race with early console.

Removing of_genpd_sync_state() from the firmware driver is safe
because the genpd framework automatically sets up its own sync_state
handler on the firmware driver via dev_set_drv_sync_state() when the
PM domain driver registers with of_genpd_add_provider_onecell().
Power domain cleanup continues to work independently without the
firmware driver explicitly calling of_genpd_sync_state().

Fixes: 3da405ead651 ("firmware/pmdomain: xilinx: Move ->sync_state() support to firmware driver")
Signed-off-by: Ronak Jain <ronak.jain@amd.com>
Signed-off-by: Michal Simek <michal.simek@amd.com>
---

 drivers/firmware/xilinx/zynqmp.c | 41 ++++++++++++++++++++------------
 1 file changed, 26 insertions(+), 15 deletions(-)

diff --git a/drivers/firmware/xilinx/zynqmp.c b/drivers/firmware/xilinx/zynqmp.c
index d76660c55354..22ee6ccdb02c 100644
--- a/drivers/firmware/xilinx/zynqmp.c
+++ b/drivers/firmware/xilinx/zynqmp.c
@@ -21,7 +21,6 @@
 #include <linux/of.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
-#include <linux/pm_domain.h>
 #include <linux/slab.h>
 #include <linux/uaccess.h>
 #include <linux/hashtable.h>
@@ -2370,19 +2369,6 @@ static void zynqmp_firmware_remove(struct platform_device *pdev)
 	platform_device_unregister(em_dev);
 }
 
-static void zynqmp_firmware_sync_state(struct device *dev)
-{
-	struct device_node *np = dev->of_node;
-
-	if (!of_device_is_compatible(np, "xlnx,zynqmp-firmware"))
-		return;
-
-	of_genpd_sync_state(np);
-
-	if (zynqmp_pm_init_finalize())
-		dev_warn(dev, "failed to release power management to firmware\n");
-}
-
 static const struct platform_fw_data platform_fw_data_versal = {
 	.family_code = PM_VERSAL_FAMILY_CODE,
 };
@@ -2408,10 +2394,35 @@ static struct platform_driver zynqmp_firmware_driver = {
 		.name = "zynqmp_firmware",
 		.of_match_table = zynqmp_firmware_of_match,
 		.dev_groups = zynqmp_firmware_groups,
-		.sync_state = zynqmp_firmware_sync_state,
 	},
 	.probe = zynqmp_firmware_probe,
 	.remove = zynqmp_firmware_remove,
 	.shutdown = zynqmp_firmware_shutdown,
 };
 module_platform_driver(zynqmp_firmware_driver);
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
-- 
2.43.0


