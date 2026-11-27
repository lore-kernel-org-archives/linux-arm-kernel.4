Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F183606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 11:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=A/Md54We;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=OVnFhMS+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=6eRPDwbk88qmVqAstsDNu9z2YE1bMhzpVvtaJc8Q7es=; b=A/Md54We6HBfJwPiV6U9J6bOU+
	zsMMdQ8/Obm5xcAU+NUVTIQMkO98JgRMKlLhw8liOVYmywKYAoAURsXF3IsdcSK72B4DcdrurRA9I
	zNV2LGJE5EEmkBbT2UfUqHwv2Npe5xASwJyO3Zj5EIQeKF43yMSmmEYJY+zAIn0gFB29119jmKQE8
	iCAI7e0eoZBpBlVXXf3/uRGnvsjkg00w9dGEv0QocwIvZeraozyJCKp1tyWF64qqqgItkGDRPwL3C
	yiFDooHZjYr8w5F8O65cb9XDlHxckahVUzp26k+tT3BbfE8zVPto+t8PBgaP1U+K5mbK1XrhomMZd
	81cVVfhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuS8-0000000FtJb-3Cqn;
	Fri, 27 Nov 2026 11:49:20 +0000
Received: from mail-eastusazlp170120007.outbound.protection.outlook.com ([2a01:111:f403:c101::7] helo=BL0PR03CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuS6-0000000FtI9-29nm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 11:49:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xS3PIYii/89wSeTZKtDPEv+5lxl+DA/v/Lrf/7DKkTe5JOv1ERhiLfJetw/lWfUSaHIBqsySe63aGuGdpom5A5hV7ROAk8fAEn2S6Nod8VJyIs3BPXw2tksKp4gPDUV7szT5T9EbGN+piQRCu+rEsMQ9RURdm8nFrw4DYXs8eP3B1zXN0v2IsVvIjqZJ0GyAbJFH2JcnonAFDTIVAze1HWEmuPlNZ37rVa1aHL53jOWCgyEacvWt8McCrUVrrC/mCs5YTctEZOBL+gfqsXlPIJJyi69w/WCFXi0zTg4Tsyxjnvao98Ibxh903d5DTEYM8xcn8W2LNfeqf/yvCUZ+/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6eRPDwbk88qmVqAstsDNu9z2YE1bMhzpVvtaJc8Q7es=;
 b=aPiFfcJCsqXshKsXJNY6GElDZmpwDpHnJVaQ7IoBnIWr76po2SZ1UUibHWHZbUPFjjvamjZlSYBbUKFFtHr3ckRGlrMF1g18QKp144XR0APpqX1W+bvYhAF8iGjwt4LxqK7cqDDdcNduwtmX+pp7KbDiv08FVrNqmYglh7N2/Fzr3vy7peP0BBR5uhd6H5E30gV/zPr3fT1IqePwFXB/rmx0l2TE6i7yA+VGwOzlt37+4LGbkCnJpLVh56eOi2rvNmIRiwm/+SmrExfGrwKHeNkyn5etIW8WqHaAtteomTchapQqRtsJug7Nxpl+/9lXYQnx5O3UEDmnbfbiybwztg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6eRPDwbk88qmVqAstsDNu9z2YE1bMhzpVvtaJc8Q7es=;
 b=OVnFhMS+5qa61nDGiL3cFura7kqa2/STxH3vmGBrY0zJLVwaRacYZHSt/niLT0K0mfA+L4ndzq2lrPfF704q58YruUoJmUTTT54fz2TwWIzvzEschJS53rCxD4KzovK0QdIetgFZvVGZHyNWsZl6197GYtcwrD61LMdYdipdOBk=
Received: from CY5PR19CA0020.namprd19.prod.outlook.com (2603:10b6:930:15::19)
 by LV3PR12MB9167.namprd12.prod.outlook.com (2603:10b6:408:196::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.4; Fri, 27 Nov
 2026 11:49:12 +0000
Received: from CY5PEPF00000E84.namprd05.prod.outlook.com
 (2603:10b6:930:15:cafe::61) by CY5PR19CA0020.outlook.office365.com
 (2603:10b6:930:15::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.11 via Frontend Transport; Fri,
 27 Nov 2026 11:49:11 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY5PEPF00000E84.mail.protection.outlook.com (10.167.247.184) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.688.5 via Frontend Transport; Fri, 27 Nov 2026 11:49:11 +0000
Received: from xhdlc220225.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Fri, 27 Nov
 2026 05:49:08 -0600
From: Jay Buddhabhatti <jay.buddhabhatti@amd.com>
To: Michal Simek <michal.simek@amd.com>
CC: Ronak Jain <ronak.jain@amd.com>, Aravind Thokala
	<Aravind.Thokala@amd.com>, Harsh Jain <h.jain@amd.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<git@amd.com>, Jay Buddhabhatti <jay.buddhabhatti@amd.com>
Subject: [PATCH 1/5] drivers: firmware: xilinx: Relocate PDI library APIs to new file
Date: Fri, 27 Nov 2026 17:18:35 +0530
Message-ID: <20261127114839.1428778-2-jay.buddhabhatti@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY5PEPF00000E84:EE_|LV3PR12MB9167:EE_
X-MS-Office365-Filtering-Correlation-Id: 5defb38e-6bbd-4508-edf6-08df4c7c7430
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|23010399003|36860700016|376014|1800799024|22082099003|6133799003|18002099003|3023799007|261009223027099003|11063799006|261022113327099003|56012099006|261021135927099003|5023799004|261022075727099003|261102123227099003|10067099003|261022105027099003|261102130727099003|261026130827099003|261021123027099003|261021121427099003|261026121527099003|261022115727099003|261021130227099003|261026140227099003|261028144727099003;
X-Microsoft-Antispam-Message-Info: UEu2nkdyLWZ+62WfUxE/DDIId6dTnNfY5fO6jvfYQbQ66IuxpGlSERYEyFMIQ/8yz4hLJIWpxmxloxe/GMMB+mWgBfAOHI5mjQYtCWtKtNY49SKZl9gqo8jJFDq2BPgBePcBDfPozuEMKG+sZgYWPjRyPhKcrtFpZaozmcb3cW/tt6Z1ObKpUjfBdf+qQH542ULRQ4JzRJ7Que81XRKMzUGzqnmAF9m9qqVc5PILAj2mxTKlZIWm8wQQ5RxkAXmJaFRMFJvyqkQ850nh/+lfQtaGCVGdNLe2414zLsmwbD5g3DRBftAzMGfcyuN59B6lNHGaUuidFwKwmibF5A39a92xlmVxXQO5n4vKtmTViIeYhiIJy0IP0T7RsPDAc6e1fzTm/dIQsM37sAo1qar/BlU2cezOWzSbcQ8IIEX75pkuvEbhAzNy0uRJIRFPanyiufwU5D5VP/lTYF8qjV++mUZZth6DU2AuPECTn75WluywKbDrpzgLCCkjI9H+241IdbqKD5ilMXwTHSOA+qjIr8NQuzeqQZLJXiW0a8E6q/3N9/ydMb2zXTQghB3wzTjQ04fb4eizh9ML1/yZvR4q8dhnuzypeEVlGXGFqzxHMkbPq+0VTTNhwKdpde7kIndP7w+DovaoQNOZ1ZBLivj/BCFPNjrivnCeheSw8j9EY2jhzkUPRW2o0gJNSaIUQLaujGtick+sTvsPB32ydWrLzg==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(36860700016)(376014)(1800799024)(22082099003)(6133799003)(18002099003)(3023799007)(261009223027099003)(11063799006)(261022113327099003)(56012099006)(261021135927099003)(5023799004)(261022075727099003)(261102123227099003)(10067099003)(261022105027099003)(261102130727099003)(261026130827099003)(261021123027099003)(261021121427099003)(261026121527099003)(261022115727099003)(261021130227099003)(261026140227099003)(261028144727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: mRyyHo2hjXiaikf3ZgSn0JSvKw2GpSSKm6fP637N0Vib6zzkgXybEBpiEoxktv1qnabxhK5hzBNl+G521u0Pm2HTVBazy6fkXyyVYLGm9ki3Yb7nO8uv7jtDkdyu+5RhMIEAfFFX6Q7ML3YtxWrr9knoNS6PUGEZC/JGIajchhDJzlHAPysC888vxvlI5Xla00EAgXQ7GNswsQsJ8GMw1sRjGeWiJcoLoaKwnOHMusU428dchfHQDYBFurlCgzBl+olHNSzpbOql8sxbiVFJzDTETVDvi6B5w7aO9MMwBhpI4LBDqUjfryxpdkFjJXrKWdRfH+7ATIATbOxf8GxOJhiizqSA0XyoTZSS9po6bBvnVo2oD8L7Ew5fwZGR+JYGJhHS+fABH6DUesTo205D30Y+ONlRcbQd4NxD2GavCq6sy9CZ+8fF2amXaf63kChO
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 11:49:11.8278
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5defb38e-6bbd-4508-edf6-08df4c7c7430
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY5PEPF00000E84.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9167
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_034918_558818_EC669E88 
X-CRM114-Status: GOOD (  21.49  )
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

Move the PDI library APIs into a dedicated file and header to improve
maintainability and reduce complexity in the firmware driver. Keep the
existing behavior unchanged.

Add a MAINTAINERS entry for the FPGA and PDI firmware files. List the
new PDI files in that entry.

Signed-off-by: Ronak Jain <ronak.jain@amd.com>
Co-developed-by: Jay Buddhabhatti <jay.buddhabhatti@amd.com>
Signed-off-by: Jay Buddhabhatti <jay.buddhabhatti@amd.com>
---
 MAINTAINERS                              |  7 +++++
 drivers/firmware/xilinx/Makefile         |  3 ++-
 drivers/firmware/xilinx/zynqmp-pdi.c     | 27 +++++++++++++++++++
 drivers/firmware/xilinx/zynqmp.c         | 16 -----------
 include/linux/firmware/xlnx-zynqmp-pdi.h | 34 ++++++++++++++++++++++++
 include/linux/firmware/xlnx-zynqmp.h     | 13 ++-------
 6 files changed, 72 insertions(+), 28 deletions(-)
 create mode 100644 drivers/firmware/xilinx/zynqmp-pdi.c
 create mode 100644 include/linux/firmware/xlnx-zynqmp-pdi.h

diff --git a/MAINTAINERS b/MAINTAINERS
index c72a281a8167..9dfdb7ade5f6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -30666,6 +30666,13 @@ S:	Maintained
 F:	drivers/soc/xilinx/xlnx_event_manager.c
 F:	include/linux/firmware/xlnx-event-manager.h
 
+XILINX FPGA AND PDI FIRMWARE DRIVER
+M:	Aravind Thokala <Aravind.Thokala@amd.com>
+L:	git@amd.com
+S:	Maintained
+F:	drivers/firmware/xilinx/zynqmp-pdi.c
+F:	include/linux/firmware/xlnx-zynqmp-pdi.h
+
 XILINX GPIO DRIVER
 M:	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
 R:	Srinivas Neeli <srinivas.neeli@amd.com>
diff --git a/drivers/firmware/xilinx/Makefile b/drivers/firmware/xilinx/Makefile
index 8db0e66b6b7e..684c3d43744e 100644
--- a/drivers/firmware/xilinx/Makefile
+++ b/drivers/firmware/xilinx/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 # Makefile for Xilinx firmwares
 
-obj-$(CONFIG_ZYNQMP_FIRMWARE) += zynqmp.o zynqmp-ufs.o zynqmp-crypto.o
+obj-$(CONFIG_ZYNQMP_FIRMWARE) += zynqmp-crypto.o zynqmp-pdi.o \
+				 zynqmp-ufs.o zynqmp.o
 obj-$(CONFIG_ZYNQMP_FIRMWARE_DEBUG) += zynqmp-debug.o
diff --git a/drivers/firmware/xilinx/zynqmp-pdi.c b/drivers/firmware/xilinx/zynqmp-pdi.c
new file mode 100644
index 000000000000..58085e9fdede
--- /dev/null
+++ b/drivers/firmware/xilinx/zynqmp-pdi.c
@@ -0,0 +1,27 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Firmware layer for XilPDI APIs.
+ *
+ *  Copyright (C) 2014 - 2022 Xilinx, Inc.
+ *  Copyright (C) 2022 - 2026 Advanced Micro Devices, Inc.
+ */
+
+#include <linux/export.h>
+#include <linux/firmware/xlnx-zynqmp.h>
+#include <linux/kernel.h>
+
+/**
+ * zynqmp_pm_load_pdi - Load and process PDI
+ * @src:	Source device where PDI is located
+ * @address:	PDI src address
+ *
+ * This function provides support to load PDI from Linux
+ *
+ * Return: Returns status, either success or error+reason
+ */
+int zynqmp_pm_load_pdi(const u32 src, const u64 address)
+{
+	return zynqmp_pm_invoke_fn(PM_LOAD_PDI, NULL, 3, src, lower_32_bits(address),
+				   upper_32_bits(address));
+}
+EXPORT_SYMBOL_GPL(zynqmp_pm_load_pdi);
diff --git a/drivers/firmware/xilinx/zynqmp.c b/drivers/firmware/xilinx/zynqmp.c
index e89251dab9a0..bebd2bfe5744 100644
--- a/drivers/firmware/xilinx/zynqmp.c
+++ b/drivers/firmware/xilinx/zynqmp.c
@@ -1675,22 +1675,6 @@ int zynqmp_pm_set_requirement(const u32 node, const u32 capabilities,
 }
 EXPORT_SYMBOL_GPL(zynqmp_pm_set_requirement);
 
-/**
- * zynqmp_pm_load_pdi - Load and process PDI
- * @src:	Source device where PDI is located
- * @address:	PDI src address
- *
- * This function provides support to load PDI from linux
- *
- * Return: Returns status, either success or error+reason
- */
-int zynqmp_pm_load_pdi(const u32 src, const u64 address)
-{
-	return zynqmp_pm_invoke_fn(PM_LOAD_PDI, NULL, 3, src, lower_32_bits(address),
-				   upper_32_bits(address));
-}
-EXPORT_SYMBOL_GPL(zynqmp_pm_load_pdi);
-
 /**
  * zynqmp_pm_efuse_access - Provides access to efuse memory.
  * @address:	Address of the efuse params structure
diff --git a/include/linux/firmware/xlnx-zynqmp-pdi.h b/include/linux/firmware/xlnx-zynqmp-pdi.h
new file mode 100644
index 000000000000..c7e00c255d51
--- /dev/null
+++ b/include/linux/firmware/xlnx-zynqmp-pdi.h
@@ -0,0 +1,34 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Firmware layer for XilPDI APIs.
+ *
+ *  Copyright (C) 2014 - 2021 Xilinx, Inc.
+ *  Copyright (C) 2022 - 2026 Advanced Micro Devices, Inc.
+ */
+
+#ifndef __FIRMWARE_ZYNQMP_PDI_H__
+#define __FIRMWARE_ZYNQMP_PDI_H__
+
+#ifndef __FIRMWARE_ZYNQMP_H__
+# error "Do not include this file directly, use <linux/firmware/xlnx-zynqmp.h>"
+#endif
+
+#include <linux/errno.h>
+#include <linux/types.h>
+
+/* Loader command */
+#define PM_LOAD_PDI	0x701
+
+/* PDI source identifier */
+#define PDI_SRC_DDR	0xF
+
+#if IS_REACHABLE(CONFIG_ZYNQMP_FIRMWARE)
+int zynqmp_pm_load_pdi(const u32 src, const u64 address);
+#else
+static inline int zynqmp_pm_load_pdi(const u32 src, const u64 address)
+{
+	return -ENODEV;
+}
+#endif
+
+#endif /* __FIRMWARE_ZYNQMP_PDI_H__ */
diff --git a/include/linux/firmware/xlnx-zynqmp.h b/include/linux/firmware/xlnx-zynqmp.h
index b489fbd21bd2..cffec74a0436 100644
--- a/include/linux/firmware/xlnx-zynqmp.h
+++ b/include/linux/firmware/xlnx-zynqmp.h
@@ -16,8 +16,9 @@
 #include <linux/types.h>
 
 #include <linux/err.h>
-#include <linux/firmware/xlnx-zynqmp-ufs.h>
 #include <linux/firmware/xlnx-zynqmp-crypto.h>
+#include <linux/firmware/xlnx-zynqmp-pdi.h>
+#include <linux/firmware/xlnx-zynqmp-ufs.h>
 
 #define ZYNQMP_PM_VERSION_MAJOR	1
 #define ZYNQMP_PM_VERSION_MINOR	0
@@ -101,10 +102,6 @@
 #define	ZYNQMP_PM_CAPABILITY_WAKEUP	0x4U
 #define	ZYNQMP_PM_CAPABILITY_UNUSABLE	0x8U
 
-/* Loader commands */
-#define PM_LOAD_PDI	0x701
-#define PDI_SRC_DDR	0xF
-
 /*
  * Firmware FPGA Manager flags
  * XILINX_ZYNQMP_PM_FPGA_FULL:	FPGA full reconfiguration
@@ -626,7 +623,6 @@ int zynqmp_pm_pinctrl_get_config(const u32 pin, const u32 param,
 				 u32 *value);
 int zynqmp_pm_pinctrl_set_config(const u32 pin, const u32 param,
 				 u32 value);
-int zynqmp_pm_load_pdi(const u32 src, const u64 address);
 int zynqmp_pm_register_notifier(const u32 node, const u32 event,
 				const u32 wake, const u32 enable);
 int zynqmp_pm_feature(const u32 api_id);
@@ -881,11 +877,6 @@ static inline int zynqmp_pm_pinctrl_set_config(const u32 pin, const u32 param,
 	return -ENODEV;
 }
 
-static inline int zynqmp_pm_load_pdi(const u32 src, const u64 address)
-{
-	return -ENODEV;
-}
-
 static inline int zynqmp_pm_register_notifier(const u32 node, const u32 event,
 					      const u32 wake, const u32 enable)
 {
-- 
2.43.0


