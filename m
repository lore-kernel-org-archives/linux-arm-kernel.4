Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AF46606A327
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 12:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mJQ1E5mX;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=ezb9gxUD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=+M2NDpTAK88Z0LDqgM073i2PhmDr3pahaBfpGq1WpkI=; b=mJQ1E5mXyz6CowMgOECCrgEveW
	/5ro/LC+60yJzxavXfQ+6dXpaJKcKVq7sHVEnURGKfoHJcKymIety04qcy4Aj9jFu3vjCiZlgyarP
	3paWboLYquI5wIINabJ7PHUC5iRuCWOxsCihTgOQWOrTiL0W95w6BUlTu+qcSSpOODroqSvvg6Tow
	lIn4NIPIUWpfPcjSVTjj4GlRjF6cSOWCIj9kga8PxYynLwo+UOse3Y3EdkmmQBVHtX80nYqnws0hT
	Q6JHNyTc936OqdXDzoUkLxONGIxy1Tx9RqYeoRb4mQNgDXQ5Lmrd3AClmWRpItr0MAdMyN+PTjubP
	xOX4tnrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuSJ-0000000FtQJ-1CNe;
	Fri, 27 Nov 2026 11:49:31 +0000
Received: from mail-southcentralusazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c10d::3] helo=SN4PR0501CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuSC-0000000FtL1-0BH9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 11:49:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n1E/EIrHSTIxoVvHFqAJaUn0aBhF+IuEzh1GJtxdA3VRuHhTgbJl6PQmWXsgiK4Q1wOCaTE/1dahaSQFgg3Ynkw/4om3FJCwdlnLx0Wk4+eA1RLJBiVNVAgTmC65aGveXrkh38kQniQvfFXM2WaH4e6xAxWLikQCnsJelHchCTXcfpbB3LEVzbGPPhwyY16fHO6NfTK6VhKAf05zz/WDI+KhzXTIrZoRaJtG9OpOI6dwk5yYcuR3UWcaDpbjkVxS2z/OrFetnlR1En37RHQfHa9JN6SbRz91pmvKvnsSnck9XxsjtU1x9R/OK0wu8ELBXFgMFhi7+Qj4SnJ1aZev6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+M2NDpTAK88Z0LDqgM073i2PhmDr3pahaBfpGq1WpkI=;
 b=EyP7J2USiFpd4vfP6WOtufI+mnG6hqhNv2hvy09D9CKosNcbeErHRe1MtQxa+SLiVblFh0iufdS1fgJRMdUodZumF0oviKLbnf/I9+sFio35/XSi5hOuYNwAq5xuOSqWH0AyI8blq5+RbX0w+umm/djQTXEP+ZtCFbI1MuKwZeRkiJ2sEGXyixIEyRFRzz4IgQDYuhloez+DgxFKClywYM8ctWd8YReizGieUtMfV2FVRCGrneok16av4Uctrw+m9Ezl7A7EYwa30Z7XAN8P8aC8QaQoEj9VWIy5Avab3AIuoaHdaTaGF45IrXU+gv0SglZEvfL4HsBFlrBX3R+JAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+M2NDpTAK88Z0LDqgM073i2PhmDr3pahaBfpGq1WpkI=;
 b=ezb9gxUDTAjDqHhgtIW0B7lPu695X92jAt0eQG2pqfUlNM+Nz2AIEcSVumRnvu3yj2wbWkm+9GTYYSNrRpwluR3F2t7FXYPOeKnoStCT1q6AsXvrXDawuWsWi5q91trmSGZpLEaxj5A++Tl+E+h79L2o1dLEyxmcPDAKM8Y92yo=
Received: from CY5PR19CA0030.namprd19.prod.outlook.com (2603:10b6:930:15::26)
 by DM4PR12MB5844.namprd12.prod.outlook.com (2603:10b6:8:67::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 27 Nov
 2026 11:49:20 +0000
Received: from CY5PEPF00000E84.namprd05.prod.outlook.com
 (2603:10b6:930:15:cafe::46) by CY5PR19CA0030.outlook.office365.com
 (2603:10b6:930:15::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.11 via Frontend Transport; Fri,
 27 Nov 2026 11:49:20 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY5PEPF00000E84.mail.protection.outlook.com (10.167.247.184) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.688.5 via Frontend Transport; Fri, 27 Nov 2026 11:49:20 +0000
Received: from xhdlc220225.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Fri, 27 Nov
 2026 05:49:16 -0600
From: Jay Buddhabhatti <jay.buddhabhatti@amd.com>
To: Michal Simek <michal.simek@amd.com>
CC: Jay Buddhabhatti <jay.buddhabhatti@amd.com>, Ronak Jain
	<ronak.jain@amd.com>, Aravind Thokala <Aravind.Thokala@amd.com>, Harsh Jain
	<h.jain@amd.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <git@amd.com>
Subject: [PATCH 4/5] drivers: firmware: xilinx: Localize firmware version caches
Date: Fri, 27 Nov 2026 17:18:38 +0530
Message-ID: <20261127114839.1428778-5-jay.buddhabhatti@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY5PEPF00000E84:EE_|DM4PR12MB5844:EE_
X-MS-Office365-Filtering-Correlation-Id: 51020ab4-e46e-437e-f359-08df4c7c794a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|23010399003|6133799003|18002099003|22082099003|11063799006|56012099006|261022105027099003|261022075727099003|261028144727099003|261021121427099003|261102123227099003|5023799004|10067099003|261009223027099003|261021123027099003|261026140227099003;
X-Microsoft-Antispam-Message-Info: IiVzZtaUQsX4RL1CYt1cyEv94K4lc6l7xfviL4iKndh2/KjZ4Dr9TRkAS0gPvbljym5uKvCxsgdfGHQdfdKl7y9j/uj9ykr3QFWBw/ZN5GVrQcKR7FqxC/T0f7FUVqMVg9t9AlfMB4erXlSrA2fY7QLPXGvYQkrCHw8SHu1ah4ynW9qd/GcxNRKR9DKpx7XYYo39fkSPr9xWFllhI7Qu3ObQ0SQJQfpLTJhWf30tztJwouGKLUMUt9FeOgxf7uUF0OVReEeYs66safPfhqEvSfLQFITWAMhmQ2tZPIo+OeFqvdZmkFvtSGi6hgUic+dc04NSPGWqu69VLzzEA5gUAKF5EaaI5YFqTti5wYvJELBBrLFfjASt6tyFBZB7xJEWpFb+31FZZnpjkgPgU0Nq/f2UGZLNZZmfTbseZ0jI02FuCR2F4ivocdNP+Ms0NXazIPQJyahdoRFNzkWZGVWfuv2IZXnUs23qi/FQ57iR4ChoMC57r/ZJ3WRiaric4cY2kzQ59aOPTLtONcWXfNdDddbpZXppWpH1XVCmo/4F1gMm2PQiE3//UToyJ7n5x1ridQOFzefhmsy0p80Lde9H5cyBUgvrpYglHxHSUB0zv91mOqzGjL4l1VEjp/pDwzyColxAO1A0s0JM0EqVyqPJeqsIJmNEvXMUAhCDSFCRlPElO8Ym/3hFTMijUAHCnI9Fm2k9c789Fn/dEDdkYAeyQw==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(23010399003)(6133799003)(18002099003)(22082099003)(11063799006)(56012099006)(261022105027099003)(261022075727099003)(261028144727099003)(261021121427099003)(261102123227099003)(5023799004)(10067099003)(261009223027099003)(261021123027099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: mIUiLLVaBISzQLBWLR5XbPu+1LZGLXg9cGGKXx9zHI3QNtX9jQTokz763rLJMQE4eK2zRuofW+/vgMiqO9LG6ko+HrPVc1/pBmj2J0T4dwX3kuowRW4PY6ELDZKAw4TQHt8XO+5pi7++jgkGORxSMmaOzueBK5AKetiDOiUPr9k3/Q7hQV1SF9ioAv1d68x03eqhVgwSq+VZ7uTn4nAjJZ7r+QKlsOeNiXuycAc154mT+V1SFqnez3DKCFp3KRXnmZdxXRyWeNh1jUeRHibXbTBzZpZWIY8VqvSWMCubdvD/PUD0tCZZ/5rnHnBjxZgl7gCGLJIG5ZgBZFKaCH+8Lb+C4PfDRgrwiUg09gs8n9Mhh9ryfcKULtw4QWNdAM6L1K1f4nzNMywgLJypehFMvu9DfC6oeejqsNzXN28ZrBSL1zuJ1qXLq3eSo+7ph40u
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 11:49:20.3631
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 51020ab4-e46e-437e-f359-08df4c7c794a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY5PEPF00000E84.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5844
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_034924_151029_A3DFD1CB 
X-CRM114-Status: GOOD (  15.93  )
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

Keep the PM API version cache local to its getter and populate it after
a successful query. The firmware probe now keeps the returned version in
a local variable instead of passing the address of a file-wide cache.

The firmware probe is the only caller of
zynqmp_pm_get_trustzone_version(). Remove the unnecessary trustzone
version cache and keep the returned version local to the probe.

Signed-off-by: Jay Buddhabhatti <jay.buddhabhatti@amd.com>
---
 drivers/firmware/xilinx/zynqmp.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/firmware/xilinx/zynqmp.c b/drivers/firmware/xilinx/zynqmp.c
index 619ead2069c5..374d39f34480 100644
--- a/drivers/firmware/xilinx/zynqmp.c
+++ b/drivers/firmware/xilinx/zynqmp.c
@@ -488,9 +488,6 @@ int zynqmp_pm_invoke_fn(u32 pm_api_id, u32 *ret_payload, u32 num_args, ...)
 			  smc_arg[4], smc_arg[5], smc_arg[6], smc_arg[7]);
 }
 
-static u32 pm_api_version;
-static u32 pm_tz_version;
-
 int zynqmp_pm_register_sgi(u32 sgi_num, u32 reset)
 {
 	int ret;
@@ -512,6 +509,7 @@ int zynqmp_pm_register_sgi(u32 sgi_num, u32 reset)
 int zynqmp_pm_get_api_version(u32 *version)
 {
 	u32 ret_payload[PAYLOAD_ARG_CNT];
+	static u32 pm_api_version;
 	int ret;
 
 	if (!version)
@@ -524,6 +522,8 @@ int zynqmp_pm_get_api_version(u32 *version)
 	}
 	ret = zynqmp_pm_invoke_fn(PM_GET_API_VERSION, ret_payload, 0);
 	*version = ret_payload[1];
+	if (!ret)
+		pm_api_version = ret_payload[1];
 
 	return ret;
 }
@@ -616,11 +616,6 @@ static int zynqmp_pm_get_trustzone_version(u32 *version)
 	if (!version)
 		return -EINVAL;
 
-	/* Check is PM trustzone version already verified */
-	if (pm_tz_version > 0) {
-		*version = pm_tz_version;
-		return 0;
-	}
 	ret = zynqmp_pm_invoke_fn(PM_GET_TRUSTZONE_VERSION, ret_payload, 0);
 	*version = ret_payload[1];
 
@@ -2178,9 +2173,9 @@ static int zynqmp_clear_pm_state(struct device *dev)
 
 static int zynqmp_firmware_probe(struct platform_device *pdev)
 {
+	u32 pm_api_version, pm_family_code, pm_tz_version;
 	struct device *dev = &pdev->dev;
 	struct zynqmp_devinfo *devinfo;
-	u32 pm_family_code;
 	int ret;
 
 	ret = get_set_conduit_method(dev->of_node);
-- 
2.43.0


