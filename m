Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83AA6606A331
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 23:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HGgphFw3;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=F63El211
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=63m/7o1O8LPb1Ef3SLMh71fdRN6m9po1cxf6iscNjeg=; b=HGgphFw3BrSUopTHQ7rNzzUtbR
	xvzv9XOQRBOwtkXBp9dCrvk2RQACEp3rO23o2FhblpEqsQKZkUqUpekydUKLtk/lJvPHhFyNcHREA
	981PYa6Bb4siim7r1r3B510N9WqWH7nskgkinlnxEPWl3no3vY5sz7lTwa9EvQXaqx6UiZpK4OLzR
	tAXFbsePQZLq1kfHHjRRwVOGCedVReT7q4V7VPudwA83ztH8rvbeOIbpCKQ+bfpDwOHfsgxkdLMzt
	3F4ITVUh/XWiTkvsvc+WrEMXQzy28gSnV8GCEdQEJIDPyXk8hDI7E7hiJXJ0snXPccaFwCpYufz4b
	yBkY1gLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTpAa-0000000AVsz-17Kj;
	Wed, 18 Nov 2026 23:34:28 +0000
Received: from mail-westus2azon11012023.outbound.protection.outlook.com ([52.101.48.23] helo=MW6PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTpAX-0000000AVs4-1ybT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 23:34:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P1E0XDPyMr0wuLDKmHwEXQLNOG92QsJ7U5OBb/DtGNprx+T8vrTvOR1+1/DYCc5xy4Kvo+0aob07Vy39FnT1HpA+ZC9yFQnrLPLl9/bEiUqYOUFiwqSzJk4sQMJscYZspkWztAVumu/ZnW8rQtP4ZhAxpol46k6ggMx8djIIwPakC5z2llESxFrgX75riQ6zVVUfUOSZSLPv2FyrrlT45JwZi1PEXZM415oHGAiZrv5h0jkQ/eQRBihlojl01ssABxrKl0/pFwwj4mirsUcavxzcQK+K/8Oof+xvl38ipeEAIAHLcwBhxqAybwvFJsRq/Ue3oBaEosIdrIl57X4dbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=63m/7o1O8LPb1Ef3SLMh71fdRN6m9po1cxf6iscNjeg=;
 b=oYKid/mm8V7EXzY80OJY+4AnbW99Zf+kRtqgHvViXipU+Ya09vkGhS/N0YATZTmYQU1XDg6aQ0yxDXpoKE7hsnURT0eWQYj3z5SlLk1Csb529yzpF5OYKOCvuGJV6opj5nn+w9OIaZHLA7r2lXQRGudxbEj2DesiLorLt/80gtuWvrWGHdmBSHpNcPIN5ZPesN6NNtJWAK1VOjwmzBZga3w37s9j+Ojix4Mo25L0gt7EKEuLKi6ZdViCravX5XxHreXSo90UrhSsWsUmBpLBmTOvXCR4lU0guZcW8HJLP8E474IiVwfYAvDnm3X63ICGDyhIaDWCDYEQr3/zqt130g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=63m/7o1O8LPb1Ef3SLMh71fdRN6m9po1cxf6iscNjeg=;
 b=F63El2114QaYobYQK3sgSOXDluIYk8Z8bL+jQgZRNdTrbea4w6XDaemD366DbubkhLRfP2hixekUPq0gKlwxAuln/MB1Bwfbr4ThxW00tPgG+GJHXyC9zWNtiV4+0Lvv5Pp/U0WIw7r3BurBVdxBUnSfMtPBvoSO/K/wlFMIckg=
Received: from BLAPR05CA0006.namprd05.prod.outlook.com (2603:10b6:208:36e::9)
 by BY5PR12MB4179.namprd12.prod.outlook.com (2603:10b6:a03:211::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 23:32:30 +0000
Received: from IA0PEPF00000038.namprd03.prod.outlook.com
 (2603:10b6:208:36e:cafe::2d) by BLAPR05CA0006.outlook.office365.com
 (2603:10b6:208:36e::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.10 via Frontend Transport; Wed,
 18 Nov 2026 23:32:29 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 IA0PEPF00000038.mail.protection.outlook.com (10.167.249.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 18 Nov 2026 23:32:29 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 17:32:27 -0600
Received: from xsjgregoryw50.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Wed, 18 Nov 2026 17:32:27 -0600
From: Gregory Williams <gregory.williams@amd.com>
To: Michal Simek <michal.simek@amd.com>
CC: Abhyuday Godhasara <abhyuday.godhasara@xilinx.com>, Naman Trivedi
	<naman.trivedimanojbhai@amd.com>, Senthil Nathan Thangaraj
	<senthilnathan.thangaraj@amd.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 10/15] drivers: firmware: xilinx: Add IOCTL support for the AIE run time operations
Date: Wed, 18 Nov 2026 15:32:06 -0800
Message-ID: <20261118233211.4121361-11-gregory.williams@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261118233211.4121361-1-gregory.williams@amd.com>
References: <20261118233211.4121361-1-gregory.williams@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PEPF00000038:EE_|BY5PR12MB4179:EE_
X-MS-Office365-Filtering-Correlation-Id: 8176662d-ceaa-499a-901c-08df45cc365e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|82310400026|36860700016|376014|1800799024|261102123227099003|56012099006|261026121527099003|11063799006|261102130727099003|5023799004|261026140227099003|10067099003|261022105027099003|261022075727099003|261021121427099003|261028144727099003|261009223027099003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: KAllQuRrpBzN4ECxQWYGntS915uG/N7S0n/vGexNvxQsLYKAHp6cl5rsuqm42Ywt13P+5Qy9AOgpwHbJbPyHwruPwmo3r/pOBNldbqyok+IVvjdhR1FdEqvdvz4F+Az8o2Xeab6YYyFxE9bWE8e2aU2bfHdI/FIcG6QsaQbXcgePKP6yR1rMHOi5Fklmm8TK53qVR1w6pkJdDwnuES16lZ2QsBlntL9QZvJdiaSFSk9VQo18CxQSn9FpiHDvdEdP9KhN/3MUvtD2tFgc7qUTIfOPka7FXC4WFF0F/6QOxqwahGT4ZK5X1vJqG/oKa1JlIldwAnaTseC/8t66QtAD9ImuXWdptIWkXijHVngbg82LP/JZNuAVoxWz+cvki5jVnlG8pu9DP2APVpe+Av5y7LSGwwgYuA11KJ9k1n7uYdG49Z4EMVE8hpHj+TbepGgGgFPXAc6IJJEQQ7G0/AmO7aWPcYX1KVNkovcPPMrtLq2CCdgLIPPUMUHaywzUb6Yy5zMJ4LcJ35mpciqSZn6+ZRhjaphVaI8amgPpmFEVJw+dBX/82BZBcrwPeMMNL44C+gD8lXuZmvIPCah1IWV4g7TFzjEg83CzHdnrsumvEVC6ImTgKQVYshFHCXBqrZGw8CwSrFIbCcsHF4TBGosm29oNOWUqdNP/5/Jplph8tIBmtYKsAUemfodWsBIgTYdwJuowXHWhmoWHZIGaBMcV6Q==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(376014)(1800799024)(261102123227099003)(56012099006)(261026121527099003)(11063799006)(261102130727099003)(5023799004)(261026140227099003)(10067099003)(261022105027099003)(261022075727099003)(261021121427099003)(261028144727099003)(261009223027099003)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: L/Gx/DOi7Wo3atgwzVvj4Dblf2ycfj0Q8YAOQ4LYF5mXqaRq+c5TX18RybtcFgTm1254vaDUF9iqncAMt/f3pILuna5fGBIu7Eq5JZJd5yH4AOfPXpQygi4HCdedb7ty+wIqyHVKddlXKu2O94NBfj5V/KZPWlWGm6N6i/ZYPeweZp/bo44UmsH9uDWGqyyCXtdJKYFGm+fW5YBuEHdC+90Lkp1KoaGdISm/+pT5jQIh/vPzN7jzQlgxAi4ky9/3DOtbMyNxeL4ntkVeYyoZdNUPbV8tT1Dq9meJunV0l+0+zR2yIKqyDL8NkO6+4M+vbHk6VMHb6SEQf3DnLczsABY07DWsNgCCl7l992PeIVgcgGqHAitRhoAIPKarne8GM1cBVulPbPM0Wmx8IlcxSjMl2Au61yegFmmHI+wSHRr1Ro97+4Ay5L/jpAFw6ZiN
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 23:32:29.7372
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8176662d-ceaa-499a-901c-08df45cc365e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: IA0PEPF00000038.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4179
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_153425_520909_633AB64C 
X-CRM114-Status: GOOD (  14.56  )
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

From: Abhyuday Godhasara <abhyuday.godhasara@xilinx.com>

Add IOCTL support for the Versal 2 AIE run time operations listed as below
- Column Reset
- Shim Reset
- Enabling of column clock buffer
- Zeroisation of Program and data memories
- Disabling of column clock buffer
- Enabling AXI-MM error event
- Set L2 controller NPI INTR

Signed-off-by: Abhyuday Godhasara <abhyuday.godhasara@xilinx.com>
Co-developed-by: Gregory Williams <gregory.williams@amd.com>
Signed-off-by: Gregory Williams <gregory.williams@amd.com>
Signed-off-by: Naman Trivedi <naman.trivedimanojbhai@amd.com>
Signed-off-by: Senthil Nathan Thangaraj <senthilnathan.thangaraj@amd.com>
---
 drivers/firmware/xilinx/zynqmp.c     | 16 +++++++++
 include/linux/firmware/xlnx-zynqmp.h | 52 ++++++++++++++++++++++++++++
 2 files changed, 68 insertions(+)

diff --git a/drivers/firmware/xilinx/zynqmp.c b/drivers/firmware/xilinx/zynqmp.c
index a8c70e775ae3..995db401519c 100644
--- a/drivers/firmware/xilinx/zynqmp.c
+++ b/drivers/firmware/xilinx/zynqmp.c
@@ -1268,6 +1268,22 @@ int zynqmp_pm_set_boot_health_status(u32 value)
 	return zynqmp_pm_invoke_fn(PM_IOCTL, NULL, 3, 0, IOCTL_SET_BOOT_HEALTH_STATUS, value);
 }
 
+/**
+ * versal2_pm_aie2ps_operation - AIE2PS run time operations
+ * @node:	AI engine node id
+ * @size:	Size of the DMA addr
+ * @addr_high:	higher 32 bits of DMA addr
+ * @addr_low:	lower 32 bits of DMA addr
+ *
+ * Return: Returns status, either success or error+reason
+ */
+int versal2_pm_aie2ps_operation(u32 node, u32 size, u32 addr_high, u32 addr_low)
+{
+	return zynqmp_pm_invoke_fn(PM_IOCTL, NULL, 5, node, IOCTL_AIE2PS_OPS,
+				   size, addr_high, addr_low);
+}
+EXPORT_SYMBOL_GPL(versal2_pm_aie2ps_operation);
+
 /**
  * zynqmp_pm_reset_assert - Request setting of reset (1 - assert, 0 - release)
  * @reset:		Reset to be configured
diff --git a/include/linux/firmware/xlnx-zynqmp.h b/include/linux/firmware/xlnx-zynqmp.h
index effa1a2445b3..042dcb164fc3 100644
--- a/include/linux/firmware/xlnx-zynqmp.h
+++ b/include/linux/firmware/xlnx-zynqmp.h
@@ -141,6 +141,16 @@
 #define SD_ITAPDLY	0xFF180314
 #define SD_OTAPDLYSEL	0xFF180318
 
+/**
+ * XPM_VERSAL_EVENT_ERROR_MASK_AIE_CR: Error event mask for ME Correctable Error.
+ */
+#define XPM_VERSAL_EVENT_ERROR_MASK_AIE_CR	BIT(16)
+
+/**
+ * XPM_VERSAL_EVENT_ERROR_MASK_AIE_NCR: Error event mask for ME Non-Correctable Error.
+ */
+#define XPM_VERSAL_EVENT_ERROR_MASK_AIE_NCR	BIT(17)
+
 /**
  * XPM_EVENT_ERROR_MASK_DDRMC_CR: Error event mask for DDRMC MC Correctable ECC Error.
  */
@@ -166,6 +176,37 @@ enum pm_module_id {
 	TF_A_MODULE_ID = 0xa,
 };
 
+/* AIE Operation */
+enum pm_aie_operations {
+	XILINX_AIE_OPS_MIN = 0U,
+	XILINX_AIE_OPS_COL_RST = 1U,
+	XILINX_AIE_OPS_SHIM_RST = 2U,
+	XILINX_AIE_OPS_UC_ZEROIZATION = 3U,
+	XILINX_AIE_OPS_ENB_COL_CLK_BUFF = 4U,
+	XILINX_AIE_OPS_HANDSHAKE = 5U,
+	XILINX_AIE_OPS_CLR_HW_ERR_STS = 6U,
+	XILINX_AIE_OPS_START_NUM_COL = 7U,
+	XILINX_AIE_OPS_ZEROISATION = 8U,
+	XILINX_AIE_OPS_AXIMM_ISOLATION = 9U,
+	XILINX_AIE_OPS_NMU_CONFIG = 10U,
+	XILINX_AIE_OPS_DIS_MEM_PRIV = 11U,
+	XILINX_AIE_OPS_DIS_MEM_INTERLEAVE = 12U,
+	XILINX_AIE_OPS_ENB_UC_DMA_PAUSE = 13U,
+	XILINX_AIE_OPS_ENB_NOC_DMA_PAUSE = 14U,
+	XILINX_AIE_OPS_SET_ECC_SCRUB_PERIOD = 15U,
+	XILINX_AIE_OPS_DIS_COL_CLK_BUFF = 16U,
+	XILINX_AIE_OPS_HW_ERR_INT = 17U,
+	XILINX_AIE_OPS_HW_ERR_MASK = 18U,
+	XILINX_AIE_OPS_ENB_MEM_PRIV = 19U,
+	XILINX_AIE_OPS_CTRL_PKT_TLAST_ERR = 20U,
+	XILINX_AIE_OPS_ENB_AXI_MM_ERR_EVENT = 32U,     /* Backward compatibility for AIE1/AIE2 */
+	XILINX_AIE_OPS_SET_L2_CTRL_NPI_INTR = 64U,     /* Backward compatibility for AIE1/AIE2 */
+	XILINX_AIE_OPS_PROG_MEM_ZEROIZATION = 128U,    /* Backward compatibility for AIE1/AIE2 */
+	XILINX_AIE_OPS_DATA_MEM_ZEROIZATION = 256U,    /* Backward compatibility for AIE1/AIE2 */
+	XILINX_AIE_OPS_MEM_TILE_ZEROIZATION = 512U,    /* Backward compatibility for AIE1/AIE2 */
+	XILINX_AIE_OPS_MAX = 1023U,                    /* Backward compatibility for AIE1/AIE2 */
+};
+
 enum pm_api_cb_id {
 	PM_INIT_SUSPEND_CB = 30,
 	PM_ACKNOWLEDGE_CB = 31,
@@ -257,8 +298,12 @@ enum pm_ioctl_id {
 	/* Dynamic SD/GEM configuration */
 	IOCTL_SET_SD_CONFIG = 30,
 	IOCTL_SET_GEM_CONFIG = 31,
+	/* AIE/AIEML Operations */
+	IOCTL_AIE_OPS = 33,
 	/* IOCTL to get default/current QoS */
 	IOCTL_GET_QOS = 34,
+	/* AIE2PS Operations */
+	IOCTL_AIE2PS_OPS = 39,
 };
 
 enum pm_query_id {
@@ -659,6 +704,7 @@ int zynqmp_pm_stop_rpu(const u32 node);
 int zynqmp_pm_set_sd_config(u32 node, enum pm_sd_config_type config, u32 value);
 int zynqmp_pm_set_gem_config(u32 node, enum pm_gem_config_type config,
 			     u32 value);
+int versal2_pm_aie2ps_operation(u32 node, u32 size, u32 addr_high, u32 addr_low);
 #else
 static inline int zynqmp_pm_get_api_version(u32 *version)
 {
@@ -996,6 +1042,12 @@ static inline int zynqmp_pm_set_gem_config(u32 node,
 	return -ENODEV;
 }
 
+static inline int versal2_pm_aie2ps_operation(u32 node, u32 size, u32 addr_high,
+					      u32 addr_low)
+{
+	return -ENODEV;
+}
+
 #endif
 
 #endif /* __FIRMWARE_ZYNQMP_H__ */
-- 
2.34.1


