Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9324060A263B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 07:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=s2SJPj0z;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=ue/XGSEz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=ACMszO6yIjeEHdllxoWhhw6yoEA0sHblzco0Hv5GICU=; b=s2SJPj0zKV/3AhjQkS/XOwgMsV
	GKz9KSH+XmnLYYSwSOoW6oVvLVv1B6nuv/QRuwJCjy6bqIi/feibqoLCeDEcPb09JVyCuj5WeTEfG
	FcXJMNR8fRjAWGpnaZNnKB9oO0IDOmOT096tEEkbSURIDBxrc7whxXmhV71W7wwlU0QuU76Lsqefu
	C9MI4/oKAvTuWe8/8jSE10Ysgn1GikO9KpHt+TVlFFxvNU8gZ/vxsS1qKYVBTglSThu8Z7pAjrGDe
	RRLiJOYZdb4w+qJD0xfgkOKq7t9i/ziT8kN3Vgb3dMa8RYNfmIXZxeqPYORtoEcIIHBnVqJfIZmnM
	cUOQlB6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQg6j-00000002omH-3ZOa;
	Tue, 10 Nov 2026 07:17:29 +0000
Received: from mail-northcentralusazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c105::5] helo=CH5PR02CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQg6c-00000002oiu-1FaX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 07:17:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e4shnVKPYr/1jnzrs2jIq3A46waUHHZL0zRtPFgoTRfbEypKGX2MZhewIlu0nRz2SvJsnt1rRX/kK5M6dnpknSyAMMuqYQun1UWjkyroiwpKmaa59ndpteGRrH0tge4f4H0+5DbehR2i6WO7HvakgeebsMZGut8t921UtzEQbOqRi2WebimJxa2XKxHhctM3rNpDM3K1uv9SVcmO4qyG5VgDijbzIGKrV7QH62mpP2EPFJFQVvGrxDCeRNseXKwKEcokWL+0DpUjpztuurKya5FPzL/ghaIxqY66W+FlBu+bhb5DFTReAehLmdpgGJmMpAiue4IY4Xm7UktPilUFqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ACMszO6yIjeEHdllxoWhhw6yoEA0sHblzco0Hv5GICU=;
 b=vKsyXPCTr5oS2zraxz4k5DUWok80kzjx6Kr1TDDQAO987QmrLWwDtqNk85BjPgsK+PZXXhx1XXyxeIveZxdx/qCuWQoHF42AFimEjNV3Gxz/C9tbVqlBZTldZj44HG2AVkbxg+87vD19z7gtxerOXB+GeeTeScnSH81SSRBno4mQM5IQ5gOHqnqhEqoQQDqG3HWdv3YHCZfXDlLvyCvyT94YLPLoDcMO9MvNclQDZBIISmHhQhKH6DCCWBL82VZRwB7kW4vGfuZR1jnvMuj2Shy0n2lVzcHcccXYs9H5IxjlR6JpdY8Uud1J1hOUW7unT6kOOI2OCd3pSUu7X587XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ACMszO6yIjeEHdllxoWhhw6yoEA0sHblzco0Hv5GICU=;
 b=ue/XGSEz47BgyMHaAnuzm1+UX6h0lPG33oZKvfYH11sHHsI5T5Mmh2w7xgwEQ20ZwLkys4H/iQW9U9PmWwJlufdYyOxBiix81b5nb7irqLUKb4m0u8N7kqgBcuwUhpvC90ZrWEjtv6SqWXy/FZIzxJEDicNXfXGJ7nc8kXsLrZg=
Received: from BN0PR04CA0154.namprd04.prod.outlook.com (2603:10b6:408:eb::9)
 by IA4PR12MB379828.namprd12.prod.outlook.com (2603:10b6:207:143::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Tue, 10 Nov
 2026 07:17:16 +0000
Received: from LV8PEPF00000059.namprd02.prod.outlook.com
 (2603:10b6:408:eb:cafe::47) by BN0PR04CA0154.outlook.office365.com
 (2603:10b6:408:eb::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.13 via Frontend Transport; Tue,
 10 Nov 2026 07:17:16 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 LV8PEPF00000059.mail.protection.outlook.com (10.167.245.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 10 Nov 2026 07:17:16 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Tue, 10 Nov
 2026 01:17:16 -0600
Received: from xhdappanad40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Tue, 10 Nov 2026 01:17:13 -0600
From: Aravind Thokala <aravind.thokala@amd.com>
Date: Tue, 10 Nov 2026 12:46:35 +0530
Subject: [PATCH] fpga: xilinx-pr-decoupler: add shutdown() handler
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261110-pr_decoupler_shutdown_handler-v1-1-b833dfe9d380@amd.com>
X-B4-Tracking: v=1; b=H4sIANLE8moC/yXM0QrCMAyF4VcZubawFCzoq4gU16QuIm1J1ymMv
 btVL//D4dugsgpXOA8bKK9SJaceeBggzLd0ZyPUG+xoHSKOpqgnDrmVJ6uvc1sov5LvV+qDmaI
 9nlx0hMTQjaIc5f3zL9d/1zY9OCxfFPb9A4plStqBAAAA
X-Change-ID: 20261110-pr_decoupler_shutdown_handler-bf2596f6d1de
To: Moritz Fischer <mdf@kernel.org>, Xu Yilun <yilun.xu@intel.com>, Tom Rix
	<trix@redhat.com>, Michal Simek <michal.simek@amd.com>
CC: <linux-fpga@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <git@amd.com>, Aravind Thokala
	<aravind.thokala@amd.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794295033; l=1742;
 i=aravind.thokala@amd.com; s=20261110; h=from:subject:message-id;
 bh=dsrA1WAi8TbxqO5q0bCmjKadRMF9aX4i+KtydGhSXbQ=;
 b=H4uYUjw5HpQIk1Rfixita+tNlnbjkAGledo3u5lK45S6J7SKywmLRxzQ51xkd4vOdm33kaN3H
 eGg1WJDT/iqAhnDzYPiWevcd3yUpV5S6w2KDl8ZUU15s9W02iwLjRns
X-Developer-Key: i=aravind.thokala@amd.com; a=ed25519;
 pk=PRM+iqXzDj0C0C/vWTONu+tBeWoTqWRDeeXllRQZ7ZY=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PEPF00000059:EE_|IA4PR12MB379828:EE_
X-MS-Office365-Filtering-Correlation-Id: ae44d356-2f5b-48c1-2795-08df3efaa6aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|1800799024|36860700016|82310400026|261009223027099003|56012099006|11063799006|261026121527099003|261021121427099003|261102123227099003|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info: 3cPjmVYUdb0dz91ZNWxzIr8/Kc2kOG+oXx+G1J0UbcGuq8Hjrc1UipFwwpIm1eqHGfUGRO7as1y/8T+KQdqs5zMnHMce6MMG/5Z1OZLZOqpp8LseaB1+QUCYUTY7BSRsuLtmb6Ool4f+YsPF2wCjmJHKZfdWs3stGPCS25lFHHxzlw/9kvcturUuwq1rhJNnHAXQ3Ii1vgxwBxRcx9jKePKuZNxPmnfq3gbxfbrXtEcixN5Wqw4i/9wJekQxPEpaRQgIPOCMOaeTHsEUKRyiXIxWMBF+sNJP3mPQvyBtOWmZRUv9chCfiofXlkc+19ZnuYkyjaA40EEpMjBrOgUtBhqhMUxda5Y3YK3AOUfLa8vhOKPahMGP5TKKNsoUbQFjeu0kDLMlC4sZwq9lCQ2i0wMHEyg+IBb+YX0OpLJryiMCEw6mugVAXk/YpZh4j3i/1iNitzpWkwTa6ko4kN92QgLcla8fl2yBujxxRJ4fcjnPEJ8P7OiLIqQgiPKm3fU0Bi/LHtpkcqdKHshkt97Vd8zVjLcfrSkBopwL27T75FZOXd2gPKgp/gab1wDvCKpvgQbQO0UIPJjXJmitvC2hOFCwUGtp2i/1zUeALrmWrORHik6GxMIYvl8YdDwJ+HA4u0MjOyyW90HxwCbVMKMl2P94pqBE1umiEnvEhNx6ZDhwVCkglEGyP6S1BDbk0hd9Kc74Pv/oFbo0Qe5rlLbFog==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(36860700016)(82310400026)(261009223027099003)(56012099006)(11063799006)(261026121527099003)(261021121427099003)(261102123227099003)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: UrL2dKfj7vtIAlFaV0MlxsRmCCdbA+DPheo+PFpIKinxdxxwqQJidKD2E7m6c61ELpzQNtXt9LaHSKZQBmihqC0emIqv4IvaJ2zPn1MmigzqbXtAfn0bp9uJ6Kiq0jUEt28X+ujLuoSjmoKYo16ErcmAIdU+aPQcHazXpUm8JVJePlK1z1d7oFt4mi596jNkpiQy0xxL6hijq9QHaTfouC6oI+HuQCrzMKlvQ2kG7EJDJ6mwrqNgJ3nNhIyYubRhPu/givLq7rLfQn11NxFHy+Rs8aUpxsjPOhanZdD9/nIsI9KC4WdYQZXGrBpJBkGEGGmRpSL1uGRN0eQ75PBSvg60IFnbdLsvhq4msTXF616KuK5XXG9C9xJI5Y19PrrUKPZi/RxNOBy0KsoJuuhoAM7iQK205oRsa2LSVrFys+EIR6EiD0jCrWFm0vBhuK1h
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 07:17:16.8367
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ae44d356-2f5b-48c1-2795-08df3efaa6aa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: LV8PEPF00000059.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR12MB379828
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_231722_391464_6EA92488 
X-CRM114-Status: GOOD (  13.57  )
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

Add a .shutdown() handler to decouple the Reconfigurable Partition
from the static logic on reboot, shutdown, and kexec.

The handler writes CTRL_CMD_DECOUPLE to the control register. On the
PR Decoupler, this turns decoupling on, which stops signal changes
passing through the bridge. On the DFX AXI Shutdown Manager, it
requests that the IP stop passing AXI transactions through.

Signed-off-by: Aravind Thokala <aravind.thokala@amd.com>
---
 drivers/fpga/xilinx-pr-decoupler.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/fpga/xilinx-pr-decoupler.c b/drivers/fpga/xilinx-pr-decoupler.c
index 1405ddbe88f1..75b59edbf440 100644
--- a/drivers/fpga/xilinx-pr-decoupler.c
+++ b/drivers/fpga/xilinx-pr-decoupler.c
@@ -137,6 +137,13 @@ static int xlnx_pr_decoupler_probe(struct platform_device *pdev)
 	return 0;
 }
 
+static void xlnx_pr_decoupler_shutdown(struct platform_device *pdev)
+{
+	struct fpga_bridge *bridge = platform_get_drvdata(pdev);
+
+	xlnx_pr_decoupler_enable_set(bridge, false);
+}
+
 static void xlnx_pr_decoupler_remove(struct platform_device *pdev)
 {
 	struct fpga_bridge *bridge = platform_get_drvdata(pdev);
@@ -147,6 +154,7 @@ static void xlnx_pr_decoupler_remove(struct platform_device *pdev)
 static struct platform_driver xlnx_pr_decoupler_driver = {
 	.probe = xlnx_pr_decoupler_probe,
 	.remove = xlnx_pr_decoupler_remove,
+	.shutdown = xlnx_pr_decoupler_shutdown,
 	.driver = {
 		.name = "xlnx_pr_decoupler",
 		.of_match_table = xlnx_pr_decoupler_of_match,

---
base-commit: b3dfbde62cf1981c4638939c159dfd087b7a72e9
change-id: 20261110-pr_decoupler_shutdown_handler-bf2596f6d1de

Best regards,
--  
Aravind Thokala <aravind.thokala@amd.com>


