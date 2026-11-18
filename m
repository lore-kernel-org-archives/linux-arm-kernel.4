Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 862C460A2616
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 23:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uXfXpMXo;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=AJQbsog2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=iH3XWwvl+sY7HHO28mEVaruPnW8RN4CxTXzr17svp4o=; b=uXfXpMXoBCQK4UfJ2DOOkWuE7v
	pShSk9VEdIjqy6Q2dtDDWOaQiiUUymjMP1+daskVsVTPJvCPA3B+X5vTK+ewJ2FxQ6klcCR1fyrrO
	Oisgqt9soHF8AP0P0Rq4vLEKXwaf6QVGOauI7jHwU59riXqZpDbNbt5athBgr7DY+F1YH9xe8NPJM
	8+5/P7l9EnRnxu1BlX3qkCSvTJReG0dNf3fPt61JR2r00B4uSQkYJVlv8zieTIYAPEoFO0N+s2dGd
	eR7d7/lZY17d+Jb7DVXoxT1RtYvWwUhl5OSFzW3G3g1qu9CQegt+uaCq8D6wns4Qk6+Mg+aw1Q8He
	WwL2W0GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTp8p-0000000AV4i-1FIA;
	Wed, 18 Nov 2026 23:32:39 +0000
Received: from mail-southcentralusazlp170130001.outbound.protection.outlook.com ([2a01:111:f403:c10c::1] helo=SA9PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTp8c-0000000AUz2-1wbO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 23:32:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vyNMP588Y/pfvbUw9QX5r2u5f49j9sqaH2N+eGGVGqnkoche9v6zOaX3mibW/fqhMn1ncQHLYlhEPP9CylPweQSJVk8mC1wZ0BfpYlm9dzmtRXDgb6/ib1oh+NE5TSd5dUbJcTD8rY8FtFxjIUXFgUG0IGDgvYpk1IPNewcYWhLBWTJ42nTNR2KQQ/+Es+FkYkG9C3dP3XgndLD5MJRUGBUD/fHAl0COLF8Gxo38muScvIJol3CRBm1b0ecD+itTJ1cimL1tBELq+r2Hy4Uvimq1vPTgZtDpO9/WAmoMuq8B8hFweIAq68Mj69d9lt8WRz9QSahvR+H/zj7ttxo2rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iH3XWwvl+sY7HHO28mEVaruPnW8RN4CxTXzr17svp4o=;
 b=JZ22BGOxZ57yKWsiWXghQoWHufPTU7JnDFR1b0KqoRPZ7LQJX4NODG/EvKaQEOmb7x13Q28ghqKcncvLioBtGnrs/VnKTfp4DHkN8BxFELnXv/BHosZKarN0TMGQw2vEFKA9cJTI0YWTUkBm0Iro9K4J0mWU5/QCUeY+bsXRLSYZ1mU8gDgiznjTtuQQZ5EIqO66VGu/EGPcsZaD+Vn9KnaHF+tQNUPO6MSn+rQuusI7B5rCg6+ykO7ncR3xfb3STVpOVAyBke+WzJZa6BzyiA9mxhlP09bzWB3ahtH2ner2zrUJoajHZpFFQoOgdvh/fJFwLsK1jjG2MSxVabvX2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linuxfoundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iH3XWwvl+sY7HHO28mEVaruPnW8RN4CxTXzr17svp4o=;
 b=AJQbsog251z2O7wKNbOmAX5u1lXrpwobc2vhAe30TxknxcONiZoCouJvGf5KswCzYNxhCz193fg+JK5HqLIjMi/c2eLko7fEWlnzl54yAYOu3TRgkKr7LwO3MgfouRIQofnih/d/+0wejdOdWI7rhGxls75Azs2dgZX9MQxMJyk=
Received: from BN0PR03CA0020.namprd03.prod.outlook.com (2603:10b6:408:e6::25)
 by CH2PR12MB4295.namprd12.prod.outlook.com (2603:10b6:610:a7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 23:32:20 +0000
Received: from IA0PEPF0000003D.namprd03.prod.outlook.com
 (2603:10b6:408:e6:cafe::24) by BN0PR03CA0020.outlook.office365.com
 (2603:10b6:408:e6::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Wed, 18
 Nov 2026 23:32:20 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 IA0PEPF0000003D.mail.protection.outlook.com (10.167.249.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Wed, 18 Nov 2026 23:32:20 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 17:32:16 -0600
Received: from xsjgregoryw50.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Wed, 18 Nov 2026 17:32:15 -0600
From: Gregory Williams <gregory.williams@amd.com>
To: Michal Simek <michal.simek@amd.com>, Izhar Ameer Shaikh
	<izhar.ameer.shaikh@amd.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Jay Buddhabhatti <jay.buddhabhatti@amd.com>,
	Ronak Jain <ronak.jain@amd.com>
CC: Senthil Nathan Thangaraj <senthilnathan.thangaraj@amd.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 02/15] firmware: xilinx: Call va_start after pm feature check
Date: Wed, 18 Nov 2026 15:31:58 -0800
Message-ID: <20261118233211.4121361-3-gregory.williams@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261118233211.4121361-1-gregory.williams@amd.com>
References: <20261118233211.4121361-1-gregory.williams@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PEPF0000003D:EE_|CH2PR12MB4295:EE_
X-MS-Office365-Filtering-Correlation-Id: 1dc0f9a7-39f9-4bf4-a056-08df45cc30a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700016|1800799024|82310400026|23010399003|261026140227099003|261022105027099003|261028144727099003|5023799004|56012099006|11063799006|261021123027099003|10067099003|261021121427099003|261102123227099003|261009223027099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: mI7JlAvEE4q0baUO6+xAZTIJ63lII7TGc2Ik+BLu+yXm0JaCHPLdjWKyYwWg1rr7XBHj607eWhS1iWcwl2lMc+pCzZ3DfnXIP8O9b1E+1BLm1hL+AhpJNH6Ak7gnuHgkPDHKJY+thU0f1Jfh31iDdt0Abn1cg7DhEnJHC+XFM8nPMoXUbjaM9W2IfU4xst0Gpxy+jSkvFHh6UvzsuzZBqW1kCa8eNjuLmmu/iMLL4Crwh9udH3N34tIZCCnet1VChyLl/BNce/Dk/UmSUVCwrpOgvbeT4lE9/RxnEvzzv+8uHBCvNrVD8yuNa0h03UO9wxKDFW7KAvgDlfr0WO3k1YBBT/Ip0nvgdtBEhNrHFxQmFryMo30sj6NW52I7bSczqc3iBvUSjbD97fVDMYJlSjmVyERph5B4TCPSK2qGida6ybbiXs6sO+BugwPTJERMxVMdulOgl1HNJobB5Kh6AzTN3OVqqLDVt766M/eCJepZpHzd5qumH9RWoFfYrO0ipVRFrBXl6cFpyhxIt8thMRbLLu8THC96Uv3a5BGgsBsvuqS0yASn2RZZxx/R2CM8my0EhOMh3GToHFOkQjO/dbLpGy3WA1NDGKib3T8cBGKsQYeNmaz27Onx2Aa9zq/229+jDvLyGeulYm92q5LSRtjDCgDbrKa6429Z4pZZMnvz3rTwPOgIuin3D4of/unuRfG4dxbaJxJrlyrmGI8ueg==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(82310400026)(23010399003)(261026140227099003)(261022105027099003)(261028144727099003)(5023799004)(56012099006)(11063799006)(261021123027099003)(10067099003)(261021121427099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Z3pxi+KF1I1jyM0MfBKGGvC54TnPrXTJzWNcszJO0/YFlLnuQ/5MHpO1p2ZQl5ylYf43KpLwLahrjHCUoJHsYEm40ZXiNjD1yCFAVuBI6q6Y2wDEEISieH1lBlKT1rDRkWPcoRudCEsEXjuHCLPuwSm/rpxqHaz2FD4NBIZ/E8smkKxomF+74SZUpiMg9VEnQJ+A4v8o3Xo6DaFnrA/H7KYn5Q3W/5rWIqltKkJnaajJ6Mpl5O8i1PXKv/Z20A2sidwHQZGmzyRi/sPxuNjVPX3CisNxg0gj4rItRRA6nMUvYnHbHYb6/KPUBJfAWF2STkVFfVkR0pG1RpV22xAKj3/uIwasJED5l9q8Vcp4Ok2NeNk+5L+NYcs8LaSiQPSdZVEU84xV3XAPfY5VxmaHlw26o0McKSDq6a9DpVqCSh0/NmGYS/rI5hSA1CYeSYlx
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 23:32:20.1014
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dc0f9a7-39f9-4bf4-a056-08df45cc30a0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: IA0PEPF0000003D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4295
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_153226_506132_F634A79C 
X-CRM114-Status: GOOD (  14.74  )
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

zynqmp_pm_invoke_fw_fn() and zynqmp_pm_invoke_fn() call va_start() before
checking whether the PM API is supported. If the feature check fails, the
function returns early without a matching va_end().

Per the C standard, every va_start() must be paired with va_end() on every
exit path; calling va_start() and returning without va_end() is undefined
behavior.

Move va_start() to after the feature check so it is only invoked when the
va_list will actually be consumed.

Fixes: f922b16aa5fa ("firmware: xilinx: Update firmware call interface to support additional args")
Fixes: 92fb71333d57 ("firmware: xilinx: add support for new SMC call format")
Signed-off-by: Michal Simek <michal.simek@amd.com>
Signed-off-by: Senthil Nathan Thangaraj <senthilnathan.thangaraj@amd.com>
---
 drivers/firmware/xilinx/zynqmp.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/xilinx/zynqmp.c b/drivers/firmware/xilinx/zynqmp.c
index 940306079a78..e264a1914f06 100644
--- a/drivers/firmware/xilinx/zynqmp.c
+++ b/drivers/firmware/xilinx/zynqmp.c
@@ -457,13 +457,13 @@ int zynqmp_pm_invoke_fw_fn(u32 pm_api_id, u32 *ret_payload, u32 num_args, ...)
 	if (num_args > SMC_ARG_CNT_32)
 		return -EINVAL;
 
-	va_start(arg_list, num_args);
-
 	/* Check if feature is supported or not */
 	ret = zynqmp_pm_feature(pm_api_id);
 	if (ret < 0)
 		return ret;
 
+	va_start(arg_list, num_args);
+
 	for (i = 0; i < num_args; i++)
 		args[i] = va_arg(arg_list, u32);
 
@@ -520,13 +520,13 @@ int zynqmp_pm_invoke_fn(u32 pm_api_id, u32 *ret_payload, u32 num_args, ...)
 	if (num_args > 14)
 		return -EINVAL;
 
-	va_start(arg_list, num_args);
-
 	/* Check if feature is supported or not */
 	ret = zynqmp_pm_feature(pm_api_id);
 	if (ret < 0)
 		return ret;
 
+	va_start(arg_list, num_args);
+
 	for (i = 0; i < num_args; i++)
 		args[i] = va_arg(arg_list, u32);
 
-- 
2.34.1


