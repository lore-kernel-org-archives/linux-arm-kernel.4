Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A4FB60A260E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 05:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=N9ugnOfB;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=GCXojFui
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=yPo+zq6qy3HyxrgTMVhHuWe/HLnfaqXhXUkWOVI1OrI=; b=N9ugnOfBJfyWplTFmzHEGBQX/w
	XhU3u8moMd0m3sd/fMbWSooRruHSP3QpIBl7VjHR5Iq+X141hty1D/SjK4/DaiKcwl49X2ZjmlySd
	w2Js3RYqe1eXAXHTEbx/bvLjLtvrJGp4mlSrTLUHkQACCtrEqdai4W8SaOtXBalfkyMNknrRDOBLi
	p2smj36efCLBW8oEADAMvgTxHNHWD+WwE0LPhulnarN6m/mYlL+MDQLOuyWnfAiUWrXt+HXnrMi7p
	Nb3h52Gva9ypc87qz754fbK9R/uysM9arRciuTJZbmSaPRndEATNmq75xCsts96atlVn90o0a+MMo
	7HTS0bmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQe6r-00000002UbC-0AqO;
	Tue, 10 Nov 2026 05:09:29 +0000
Received: from mail-westcentralusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c112::5] helo=CY7PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQe6e-00000002UMr-21HK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 05:09:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pQ/odH5QHrpzJBMikfcuF6sgx20IUlEVR1ciLA9VuJsHFBQcBK6l2EVLa7CelWA1KDLKOlXiZabIAsQZu5m384iBToo6dXNt6p8Ayg6c4NNOsWnr06iP6vi4h38SEs15sudS+tzRcqgWReICjD2GPTgqOlXrn3b5lxnx1L2NRQCrsLys2lveOhwvHnUz0ZJgaY3yOPFdANeKOYfI6fejUk5acIEBkprUmVc5vLrNEnXVxN9WZy77wJJrGsumC05a3i5AlGBlmG5Sa4S+Y/As8w3lwEX/ITZ75bN0TJclyxXNaxOtFxVKia3vD/+BhYHb+U8NDIPKOgOwGLOYGQSPUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yPo+zq6qy3HyxrgTMVhHuWe/HLnfaqXhXUkWOVI1OrI=;
 b=iW0M5Nsgpj5F9TCE/5OMsuSs8T550hI4yjPARPqQsOkR+5xFVVkw57wMTAIkw/F5E62Et7/Suu4Vc2AAWQaR7nlTHbf/ODCZEvPTzt5HtI6XzRIXsqweNoWzd1Rjjlgj7rZ0f3RtUFOA+LkE4yjhd3NAP5nhSxVX64aM7FrLpfaBBFCvYTXqkhcjVufYSkVpr1DriPsnr/4AUmrGRrmaKAKixJtBnZd8wBFDfR54upVLxAYEe8PsDEEpE16BipwjT2p6VvEMFuXtCZ/Zdeb8Qv5SHCDfmiPmIWTovlXSQqrjT4uU0+LGPaIPBahIHaee380w4rIR3qoVxkKLC3Q6RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yPo+zq6qy3HyxrgTMVhHuWe/HLnfaqXhXUkWOVI1OrI=;
 b=GCXojFuibXVk0I+zKuxZ/lAGe0qBnV6+EsXAxe3jzUnQmPqARhJglrvLl4u1Gs1yWLACHYPfxdPGRyN3iKnRIuYdSq+MImN9LqWHNhQ1QUMp9GFncgJgdau6lAZZTv477kDNLu40t6Z+vw5+20qz3FdXkZF2aeaVq2uV3Y7qLkQ=
Received: from BYAPR21CA0029.namprd21.prod.outlook.com (2603:10b6:a03:114::39)
 by CH3PR12MB7620.namprd12.prod.outlook.com (2603:10b6:610:150::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Tue, 10 Nov
 2026 05:09:09 +0000
Received: from BY1PEPF0002695A.namprd05.prod.outlook.com
 (2603:10b6:a03:114:cafe::9f) by BYAPR21CA0029.outlook.office365.com
 (2603:10b6:a03:114::39) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.0 via Frontend Transport; Tue, 10
 Nov 2026 05:09:09 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BY1PEPF0002695A.mail.protection.outlook.com (10.167.244.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 10 Nov 2026 05:09:09 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Mon, 9 Nov
 2026 23:09:06 -0600
Received: from xhdappanad40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Mon, 9 Nov 2026 23:09:03 -0600
From: Dileep Kumar Nagavarapu <dileepkumar.nagavarapu@amd.com>
To: Jonathan Cameron <jic23@kernel.org>, David Lechner
	<dlechner@baylibre.com>, =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Michal Simek <michal.simek@amd.com>,
	Conall O'Griofa <conall.ogriofa@amd.com>
CC: <linux-iio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <git@amd.com>, Dileep Kumar Nagavarapu
	<dileepkumar.nagavarapu@amd.com>, Sai Krishna Potthuri
	<sai.krishna.potthuri@amd.com>
Subject: [PATCH v5 10/16] iio: adc: xilinx-xadc: Include appropriate header files
Date: Tue, 10 Nov 2026 10:31:55 +0530
Message-ID: <20261110050201.1850399-11-dileepkumar.nagavarapu@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261110050201.1850399-1-dileepkumar.nagavarapu@amd.com>
References: <20261110050201.1850399-1-dileepkumar.nagavarapu@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0002695A:EE_|CH3PR12MB7620:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c497bb6-6cf7-447b-104a-08df3ee8c08e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|36860700016|23010399003|376014|18002099003|22082099003|6133799003|10067099003|11063799006|261102123227099003|261028144727099003|261022105027099003|261009223027099003|261022075727099003|261021121427099003|261021123027099003|56012099006|261026140227099003;
X-Microsoft-Antispam-Message-Info: /W2BgMiFtmb2MP2VRXdZkA5cHzvP11Q4eIUYtlL9Gfh8V352FTJaM269Qb/8aHn0oya8XLRz2PoBvgfwRqXBgDZJMVXBtkNM3N/kMeJM/xLPSCUCOrJR+OYGsqa2Ad7xfaYj5eV7OvSfNKPQ+0YPxjd0dm4G+lnMppMD1TnFsytv8dEyOcuympAnLvTAGy3JnTVHMYABGBnn/o/app0qqKPoSggx0jfcL75bfF4mGdlowlOC5lrnQM5vADCyMJSLaWo6aORc1J8qH3ToK/x/AlLwKzpk2a7dlW4SY4KW5+l3zZu8qMnDBrY0n9+MqWeeTJ7HHAjjSDAxlXFP7aEej7kk1xz7pUhez3xgrwmzGjMGgjuTgZTNVswqrnd9dAmUhy3Of9Vm/slfOUZ/BUGzwOO6cVssoCcpBzaRglk8SuYMBpDSsvLOQYUHVRLcpsMuhxmN0pHSD6R2p09XswnZBypaij736zQpZkcu3/aU04w8/zNXkKsOkkjp1Qwm1AvBgQZhVHDqdLPuV0iDpv4jtHlU1cFvXgUk8CGh6EvhTEbnRtzXsJnGILY78TmliKap2Iv3cpi1WI/+HiDMHwjyERjJtgsHHbYsa9kK8nTcs6Zv92aOqouPF/ooEzeFj5Pm/dsymgh0780ytM0t+iP8rtpmg8wfgtovzl17Nxyc9hbMRPs/kDeoc88jOaauC/jpiBCo+61Zkp/xsMDkNJI4fA==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(23010399003)(376014)(18002099003)(22082099003)(6133799003)(10067099003)(11063799006)(261102123227099003)(261028144727099003)(261022105027099003)(261009223027099003)(261022075727099003)(261021121427099003)(261021123027099003)(56012099006)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: /k6oOpyHrSJ42UNaLc+Z+OUgLQZUHIh+FOAI1QtDgq7P41Hw/bUVQ6iGgAhFuBHErXhfoE6Q+Q+XiWt+FzIFoKMAiwP6aC2CbFftEkmIkVEw0Nz7qCqZ8vAiogZJKvdFk3J5igU0khhveD61ADyueN58vPM2AUKkleo9M0Y8tk/aHujAYgii2/oniNtKTAGM4d7mjGhve7gS1X3SMYszPY7YxcHR6VE6+shLi7MWwyfMpj00BdslousAHK5aV5LyoUehdlWUNWxBMC6HNOL5M5hWSTbPoRJkyyDNuqD5k18IxpCCRPvEwJxODfpiePKtb/kapNYHU0Q5+7OEH6F4ugZ9D1gTLdgUNXL+4K7t/IQMYTyml7PEsj6Sdf4VI5DGf6VxTjrMguCjwyRKVkVnYpuWlr2Ceh6bU3HvtH3xbkZwHB7WqHKKr3HZ3VizYpCT
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 05:09:09.3141
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c497bb6-6cf7-447b-104a-08df3ee8c08e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF0002695A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7620
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_210918_408914_C1C2594B 
X-CRM114-Status: GOOD (  12.11  )
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

Include the headers for the symbols the code uses directly
(linux/array_size.h, linux/bitmap.h, linux/bitops.h and
linux/container_of.h) and drop the ones that are no longer
needed after the recent cleanups (linux/kernel.h, linux/overflow.h,
linux/sysfs.h and linux/iio/sysfs.h).

No functional change intended.

Co-developed-by: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
Signed-off-by: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
Signed-off-by: Dileep Kumar Nagavarapu <dileepkumar.nagavarapu@amd.com>
---
 drivers/iio/adc/xilinx-xadc-core.c   | 7 +++----
 drivers/iio/adc/xilinx-xadc-events.c | 2 +-
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/iio/adc/xilinx-xadc-core.c b/drivers/iio/adc/xilinx-xadc-core.c
index 145bb7614523..12df599358b8 100644
--- a/drivers/iio/adc/xilinx-xadc-core.c
+++ b/drivers/iio/adc/xilinx-xadc-core.c
@@ -11,27 +11,26 @@
  *  - AXI XADC interface: Xilinx PG019
  */
 
+#include <linux/array_size.h>
 #include <linux/bitfield.h>
 #include <linux/bits.h>
+#include <linux/bitops.h>
 #include <linux/cleanup.h>
 #include <linux/clk.h>
+#include <linux/container_of.h>
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
-#include <linux/kernel.h>
 #include <linux/module.h>
-#include <linux/overflow.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
 #include <linux/slab.h>
-#include <linux/sysfs.h>
 #include <linux/types.h>
 
 #include <linux/iio/buffer.h>
 #include <linux/iio/events.h>
 #include <linux/iio/iio.h>
-#include <linux/iio/sysfs.h>
 #include <linux/iio/trigger.h>
 #include <linux/iio/trigger_consumer.h>
 #include <linux/iio/triggered_buffer.h>
diff --git a/drivers/iio/adc/xilinx-xadc-events.c b/drivers/iio/adc/xilinx-xadc-events.c
index f20614edd153..a63ea766b712 100644
--- a/drivers/iio/adc/xilinx-xadc-events.c
+++ b/drivers/iio/adc/xilinx-xadc-events.c
@@ -6,9 +6,9 @@
  *  Author: Lars-Peter Clausen <lars@metafoo.de>
  */
 
+#include <linux/bitmap.h>
 #include <linux/iio/events.h>
 #include <linux/iio/iio.h>
-#include <linux/kernel.h>
 #include <linux/types.h>
 
 #include "xilinx-xadc.h"
-- 
2.34.1


