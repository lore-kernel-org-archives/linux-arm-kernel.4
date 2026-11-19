Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDAF9606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 13:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jUTUgU6N;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=0SwLF8nW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=1imU+HZSc1C6nJ4dNfnINLv0o8s059Gje2Ks/mgYZok=; b=jUTUgU6NrM8xbNelE6V0wY61P+
	g5pyyq9IFNuaWw0SZy+1ZCGBB/O3L4x2bjKzpCeqHunDB+yO/lCk1asUogVO0S8Hfvn3TiIxNtb5W
	vTw3HXAHks/f/1mmTdAvJfBzx8ziLhb3OoFqRc2neUaOjaxWSN04Fqxn8aOK+I1uzSppmZyDiLB27
	UeNKKtygEKB9rS4mR0b8lEqDMOQtIYdNIBtjKznAKDv9lPshgzIbRkvePwD+a8jn5T3F8Ps8pUeZp
	rID5uIad8tYt1aIg3U+cHa2NR795vy+LXGPsw4TadZBKBsBbi8y3VsXEkA75I9BR1rzuxuv9khK5R
	mT7TK5rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU21a-0000000C0Gj-0rQL;
	Thu, 19 Nov 2026 13:18:02 +0000
Received: from mail-westusazlp170120002.outbound.protection.outlook.com ([2a01:111:f403:c001::2] helo=SJ2PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU21X-0000000C0Fd-3RcK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 13:18:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R/b3y18s2uVak8WVfyaQrWUUEFUwprkvWSrxXunBguLUZdDuPS6t0k88FE7EeiNE34e4ju0xVxGqD69A5s0j8bEypMxiQZoMLLH6Qo0N4WYlJcX+UHwcd6yGjhZQIrkbczTJIkF7t1BmGXtyWvlgMsEPwvD02Xd5mUoL3ykKP+WM4SjQE5EBD20jDiKVNDJ0m2KRmJqDpJC+Vb5qRTVDDqoGop0Ig0B51mKWnfUJ9rvL4/bHa3CPF4CJWfOyS3g8y+9oQRqg2Ou78K7TjjaY/8QFwj8o91t9M8s5Ld30quxp9KoesTUJOmFjzvvbViFo5X55DJ14FnwFqtYHp3XV4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1imU+HZSc1C6nJ4dNfnINLv0o8s059Gje2Ks/mgYZok=;
 b=Tf2kctV8G563bW7cYi16MdleQFqqawp21O9UPNj33+kYLGHtYPLnFbxUx3SFOTZDwzo7qmM+BbCm6vPKnhgKQd1fOYT0R5HNT2rQNIR88w1/uA6mEBky4CYcRF56MDZn6Mb4BRuinADNo58UyH79oqThbl+3DsvJ63KczUsiWcBvfoTEJ3NcywJwhu7sXbFBVzDJEN76pvZw20MdLIaUQV1/rWfBa1+WWx6o4ixqrht6o5CKKFx1z6TjsDnhDXTRv154xtCRB7/0P5xEdWGR7HbGJ9d/DvSh4P84jfcYd08uS7PRbsoiZKOqqqFgFShbfCmp1PW0ZNmxKM8P8rHXUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1imU+HZSc1C6nJ4dNfnINLv0o8s059Gje2Ks/mgYZok=;
 b=0SwLF8nWcgGgg1sSL/pxlJswTlQK3FiXiM44aCIc+yBPtsl+pwkDXvEMPOIh7ZUcER3uMlfkSk+6ywYn6TaHIOZX/0E2m/6RB2+JfmBjdngVU2HzvKmZsyBsKMlLBHMu8g4cP5K2Cpu5r9qaI/gYwldIfd8/jMfiIuIsP1HhieE=
Received: from CH0PR03CA0212.namprd03.prod.outlook.com (2603:10b6:610:e7::7)
 by DSVPR12MB999172.namprd12.prod.outlook.com (2603:10b6:8:38b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Thu, 19 Nov
 2026 13:17:52 +0000
Received: from CH2PEPF00000146.namprd02.prod.outlook.com
 (2603:10b6:610:e7:cafe::19) by CH0PR03CA0212.outlook.office365.com
 (2603:10b6:610:e7::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Thu,
 19 Nov 2026 13:17:52 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH2PEPF00000146.mail.protection.outlook.com (10.167.244.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Thu, 19 Nov 2026 13:17:52 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 19 Nov
 2026 07:17:48 -0600
Received: from localhost (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57 via Frontend
 Transport; Thu, 19 Nov 2026 07:17:47 -0600
From: Michal Simek <michal.simek@amd.com>
To: <linux-kernel@vger.kernel.org>, <monstr@monstr.eu>,
	<michal.simek@amd.com>, <git@amd.com>
CC: Senthil Nathan Thangaraj <senthilnathan.thangaraj@amd.com>, "moderated
 list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 2/6] firmware: xilinx: Call va_start after pm feature check
Date: Thu, 19 Nov 2026 14:17:26 +0100
Message-ID: <61e18f7a0929eb5d16569c29141ef2a7b75aecfd.1795094242.git.michal.simek@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795094242.git.michal.simek@amd.com>
References: <cover.1795094242.git.michal.simek@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1511; i=michal.simek@amd.com; h=from:subject:message-id; bh=x8QACq4tebrBpU+csBKTf5v6pNWhd+EP61uFtvDSDyg=; b=owGbwMvMwCG2mv3fB7+vgl8ZT6slMWT9+/ahv9M+utSnQVmdd3eg0UNhB8VDsXqFx198tmxcU D9r5q3KjlIWBjEOBlkxRZbpTDoOa75dWyq2PDIfZg4rE8gQBi5OAZjIeQuG/x5akxZuiDNuN+3n NV61P+bK/hff3K+kdM/jV438M2G18TlGhnPaWtXMVvuneFu+6PPdYNbgfC7n/OH1/1baZKjtaKo 5yAkA
X-Developer-Key: i=michal.simek@amd.com; a=openpgp; fpr=67350C9BF5CCEE9B5364356A377C7F21FE3D1F91
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000146:EE_|DSVPR12MB999172:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c76f0e7-3aee-4755-d6d5-08df463f841b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|23010399003|36860700016|376014|1800799024|6133799003|18002099003|22082099003|11063799006|5023799004|10067099003|56012099006|261022105027099003|261026140227099003|261102123227099003|261028144727099003|261021123027099003|261021121427099003|261009223027099003;
X-Microsoft-Antispam-Message-Info: ZWBKhXl4olbR+XXRSpvRLxfxwaICfstOdCkzCr/zr4geMOw/7azW5kbxWlKDHSHvMNvs/AAePqH1P6/wG3p26QmDu7reW87TaqX63a6P2a/VZdWm4IvyEt95rzDDv17BeMHkh4PUUpuXUaRAIw2NvffksYDfMLkQbAShW7RaVr1TOPB157GnyDejzOfocPkV0DmYZxcix2Lp0QEUz7QaxS8IjH9iQY2SPxsnucsz4YvRIl5UsjJ1NZrrwv+hWwDezlLyP6Nid/TpHI5Ao9ysH2A3Ba/zjayGUUzukeKsVgxthAKAG4Ga9GvispSpMabnsMgWfWdM3MK3Irlv7I8vLm678lk2vOjueiitAnCpLwL0tLhX7NIESkzGjS10VatwGolF6CUQSKP14Rlyarh+q2Z5cWhnKAVfK3IoRV+X0JrQ64InzHWRXZsWbVjXAwNa5I2MsFho9+7Vx3Rvbk+k6DSgGgr/0I+OjH//v8HyVOFMQp59yT5SD2cSX7onaEMgfz7YYCJ6LEoaAHsYqSz27QpkQBXbHCF5n3LdyiKf+fQj+CSYhGEchCoARjHguSlel9x6co3TJ4fBnTii/CrA4yh4rrCsge1744aexWODg8W7PjXPnHVzo/5ZEm3zvsy8RzeoHzc7cl5yEJSZAOY6C+N4Wq5S6OEc6G4yGjX+lcEmL7JgoUbujDjhPGdysoMJpCW14uU7i6hnp2ilA3Ef/w==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(36860700016)(376014)(1800799024)(6133799003)(18002099003)(22082099003)(11063799006)(5023799004)(10067099003)(56012099006)(261022105027099003)(261026140227099003)(261102123227099003)(261028144727099003)(261021123027099003)(261021121427099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: tHo8EgxqU73gd4ohCO7SHHG6YCB7klaIA8Ba0dP4MNV2Y86+qNVK6uBVrViIpIJUpaCMZtnhk5mIC4s6yCQfawJC3tkdzy7uvi4YykruMNnMInBcIVA5MKbrzhJ2W1Pglqq/Tqp0hrueDy5JSVxpHF7WYt4/khpRCZStXQCsvmtnfXUHZLLz3YvxU7grOnkP4Qs+Nbnmf8zaaDx5MyAMGo+K0KtqTg8YXMJ4N1x+6NB+ScJKfraL9ZRwaiNbxq0qBMRmCtweNjfY4nfgVRGAXbtIHzDi9TrRkYPXrQA10ToBpRMTOeVG3K7uivDWAal/7djcBZnpiSAh3xyanVLPdawW6sWUPcYqoU/GeimviZT8GQM6h4hX1qsHCCit3GlkNrpcQLnsb/rbK82lt3rvXcr5LA/HpD7hkN2KLUpJZTw+RFDcWDkqy3BWkN1YNCdp
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 13:17:52.2595
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c76f0e7-3aee-4755-d6d5-08df463f841b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000146.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR12MB999172
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_051759_883464_2819DABC 
X-CRM114-Status: GOOD (  13.02  )
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

There is no reason to start to process va_list before calling pm feature
check which can still fail. Call it at a time when list can be process.

Co-developed-by: Senthil Nathan Thangaraj <senthilnathan.thangaraj@amd.com>
Signed-off-by: Senthil Nathan Thangaraj <senthilnathan.thangaraj@amd.com>
Signed-off-by: Michal Simek <michal.simek@amd.com>
---

 drivers/firmware/xilinx/zynqmp.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/xilinx/zynqmp.c b/drivers/firmware/xilinx/zynqmp.c
index 22ee6ccdb02c..a0ec904b1819 100644
--- a/drivers/firmware/xilinx/zynqmp.c
+++ b/drivers/firmware/xilinx/zynqmp.c
@@ -391,13 +391,13 @@ int zynqmp_pm_invoke_fw_fn(u32 pm_api_id, u32 *ret_payload, u32 num_args, ...)
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
 
@@ -454,13 +454,13 @@ int zynqmp_pm_invoke_fn(u32 pm_api_id, u32 *ret_payload, u32 num_args, ...)
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
2.43.0


