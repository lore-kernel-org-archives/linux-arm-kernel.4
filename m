Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DF5260A2621
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 19:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VlPeM00b;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=XsSt7yUJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=P0nl3az0FrnI86MzNYtGIeDDnt/B5ura6HZHXXE3EeU=; b=VlPeM00b1zbSi4K0c4jhVFpp9Q
	Lf38ZPylmIHecQvEXGbQHEFBt3WVtZBg03pquWRn1z3z0UvSQW0qSPWlLIE3ktZ578tJTUtoxCCCb
	JZWvKBdN/9T88jn0+ZC9Pm41WjUho1wPaRQxZs6qE1v1JFAJ9FiNncKp65jdH+v6dXYOfPaWDGyz5
	Yf/idfDHak9YHGfbOFEGjwwJBIrE27YwTkP0prPQ/GvTE8OyUwofehCMDjGm2H/gfIDg28A1JNDKT
	PIx8Aydc1dL8eNEaQroQP2Somo7GWO8e8I+QX5kWWAVTa7uafywCJ8fuq/mLvwdAaj+bU889jYBHp
	danW9JYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTOkw-00000006r9y-3KiZ;
	Tue, 17 Nov 2026 19:22:15 +0000
Received: from mail-westus2azlp170120002.outbound.protection.outlook.com ([2a01:111:f403:c007::2] helo=MW6PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTOku-00000006r9B-1O6F
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 19:22:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ybbRBqvWG0yJ6kkTCOuqMUZMK+Yxa4rchX7M8z9IG8Fk8uQKwWvfK+RlcOgdc0JbiodsllYhyRcHT0FOUc7MpGbme+MbIQaFv3MbpXjnNRXq5OzKdzLsMI5hUGG++A09vWyThYufWTPw6mhlRG1P8In3I/9yyILYF84sIRcU849gOGm3V38AmJ5rJypivG7ugVVQJDPJZ6yO8UB0h41pn9yIg99t41UodvEFZZV6J1N1X+oLAOp4MHaXQObLs9BVxeL/glO7yiF6drGKkEzbkRweWVuz070nbFxq1ra78xEwEcZ138UxM6ZK6DDKJ9zah2WKDHew++u4ZbKaK49u6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P0nl3az0FrnI86MzNYtGIeDDnt/B5ura6HZHXXE3EeU=;
 b=uxCZC4Q9AQTAbL8y3yJxqSPyusewd8VCm5J5usHuoRy60FBbZ7ymux8QncGqqq+8O08L0PlLgHJCD49qBKd84gmr/q7Q3rgeKjal6UqAb4OVqxwySo1SyRYKxfwQWtAGlBo/HFGcMxh62vh6utevuwTjPB7ff5kF2wx1cjRTbC9TV3pw61G2WPfEnTKkO5UtmoT3PNBTgriFgbYJB3/U4CeOkHqbaG5KNdFI15Y/UvdS3rm0AkpOfvLWQRNuscsiiyr3PO/9qSVI9oApG+bP1EOB4Up1BiE01qoAV4am3eiCR0uGXZR5MyvvWkAUVG7TiSAslfZPiEe5n4FPjIlLjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P0nl3az0FrnI86MzNYtGIeDDnt/B5ura6HZHXXE3EeU=;
 b=XsSt7yUJfcHZERcfEjygy0B2JAOuQ9k8W6R85f7N6fvR1UuFH9433vBjeLgv2k+OhTRGvamP1+KgIHUppgKvZ8EKn0IJ/nCmMRVAAxZ5iLe9A5TJQn0uNSOuo8U609jp+F+SR4BMBa01z9Nr1hNG37tgQm5xIMcLWrYrKAM5oMIgUepn1CGtVVjrK26wrOzPgPWDUrTzPd8v3OJqZze4QlGL9dEG90LoJ8zNiLde6SqUidviSsq1cl6P462tDNTvCAHa/zAcmb1U8acL0Tr0VbDF6dVtBpbstvZ9Tg0Hkzh9MEx3IGPcwNpnGKGlj/7zCwoWSclizy28yCZbokyhUw==
Received: from BL1PR13CA0154.namprd13.prod.outlook.com (2603:10b6:208:2bd::9)
 by SA1PR12MB9246.namprd12.prod.outlook.com (2603:10b6:806:3ac::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Tue, 17 Nov
 2026 19:22:03 +0000
Received: from BN2PEPF0000A990.namprd04.prod.outlook.com
 (2603:10b6:208:2bd:cafe::48) by BL1PR13CA0154.outlook.office365.com
 (2603:10b6:208:2bd::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.0 via Frontend Transport; Tue, 17
 Nov 2026 19:22:03 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.118.233) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 BN2PEPF0000A990.mail.protection.outlook.com (10.167.248.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 17 Nov 2026 19:22:02 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 17 Nov
 2026 11:21:36 -0800
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Tue, 17 Nov 2026 11:21:35 -0800
Received: from Asurada-Nvidia.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Tue, 17 Nov 2026 11:21:35 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: <will@kernel.org>, <jgg@nvidia.com>
CC: <robin.murphy@arm.com>, <joro@8bytes.org>, <praan@google.com>,
	<kevin.tian@intel.com>, <smostafa@google.com>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <jamien@nvidia.com>, <kas@kernel.org>,
	Cristian Prundeanu <cpru@amazon.com>, Breno Leitao <leitao@kernel.org>,
	<xueshuai@linux.alibaba.com>, <john.garry@arm.com>
Subject: [PATCH v13 01/12] iommu: Pass in NULL old_domain when attaching a deferred device
Date: Tue, 17 Nov 2026 11:21:18 -0800
Message-ID: <d38f0479995fe866a56bfcedb55368816622f9fa.1794942324.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1794942324.git.nicolinc@nvidia.com>
References: <cover.1794942324.git.nicolinc@nvidia.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000A990:EE_|SA1PR12MB9246:EE_
X-MS-Office365-Filtering-Correlation-Id: be9ba46a-dd41-4a5e-31af-08df44e00f4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700016|7416014|23010399003|18002099003|6133799003|22082099003|261009223027099003|11063799006|56012099006|261102123227099003|261026121527099003|261021135927099003|261026140227099003|10067099003|261022075727099003|261028144727099003|261021121427099003|261022105027099003|261021123027099003;
X-Microsoft-Antispam-Message-Info: ruywKT1L/zQo5jtffKvamoywthkcEcfNYEkCjJZxynLERE8g10wIakDslUquycF/9Lfpht81l/v/X1/3xmdmnsu5Glg7fLPDfvwErjI0s64Yc+QP9AL539aqTbDSp/gAzNO0jWPmryJVm1CZZeWucfjzdkIKbxnOxP5gJY4qWpNgmAW1pW/5vtUKYPw898nPC/fKWLPacRXP22o0hCAswolr4WXt89FGvH8vyNHz1JZrYr9NpzQLIOi5Y90oktgYTxJisfjLnysyrz/lJuDQSzN93AYBf5O9NtSfqwC51XZtAqWw54LckE0S5ud1o2CBiK5xN5OW/6E46djlFNQxzQEw9rc76l10MxxLNeeP2QeYUYjFpJDbWBiE+tF0pC76zWcNHfrM1N7ynLb8x2h/M+xR/2KPI2pY2IqVDc2sqjaVfC4jLCrvay7Jzrv2//7q96JnT1ung0d9jiGNW2xFnIlxMf1OeHYRoSmQRgWl7/jQl7uKF7fWa7O5KfjHfwgNQk29Z10maIphHDilQX8emHhP61i1haIifpnuhsCaIRDhgPR+fUmNFU2eEN0ayUCQomkjl74YiCjmF4ML2Yfg9ogTHWe9jtUyBlcKBKALpvT8u++A2S2L7ZHovnWf/2IrauRcQPTRRvE8MKr1I8t3DFJa0fEG9UK4J/pRNO6RiI78ztMTCdM81T7InWQoVD4J9LckctQ9o1DsXpeYVRl01w==
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700016)(7416014)(23010399003)(18002099003)(6133799003)(22082099003)(261009223027099003)(11063799006)(56012099006)(261102123227099003)(261026121527099003)(261021135927099003)(261026140227099003)(10067099003)(261022075727099003)(261028144727099003)(261021121427099003)(261022105027099003)(261021123027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: JfXIBH6ienMAUj2U8bKTTgPVOsLm1C6WkrOsyU89LrB17bDbwxu2/dGijaYb2ClmwsJrK+vqpPDLj100+enaUUmicE3sDuro7Yao7WvKIxQpIPLU7WbhxgKO/TSaVkLQkxQTLfKxtWwjKYZQw1+Z9VZRDGvK5zUAGYDXwpqWq8Vv5x5YkJqCr9kk16H3TWmvgXy9kRZXP4Y0BF1o+44ka29CQFa9huyt19qJa6KCgFjsjD5q+vPu7w8qD1aUlmdZluTYQYKmw1a5gfhF0G/tpg6/wH6XEVOC2L7MV4C2RUYe6rvrMFsqBzSri5olArydKPyX6W46Iol20LISw66iklQID4a6Q30Wy2HVmLHBpnx6sjA9OLhDFMpDklvKpRP5YEqalK/9hGAxZgL/uOj3ueVnRwTHi2DwIAHIpK7Po8aQZUv8QOUKUPdL9hFXnj7g
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 19:22:02.8130
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: be9ba46a-dd41-4a5e-31af-08df44e00f4d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF0000A990.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9246
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_112212_377371_F016BACE 
X-CRM114-Status: GOOD (  18.99  )
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

When a driver defers the default domain attachment of a device, the IOMMU
core skips the attachment in __iommu_device_set_domain() but still sets the
group->domain to the group->default_domain. Since the driver has not seen
this attachment, iommu_deferred_attach() later finalizes it by passing in a
NULL old_domain.

However, two other paths pass in the group->domain as the old_domain for a
deferred device:
 - __iommu_device_set_domain(), when attaching a non-default domain
 - pci_dev_reset_iommu_prepare(), when attaching the group->blocking_domain

A driver uses the given old_domain to clean up the device's state in that
domain. However, a deferred device has no state in the group->domain, since
the driver has never attached the device to it. So, the driver would end up
cleaning up a state that does not exist.

In practice, the first path is unlikely, since it requires the device to be
attached to a non-default domain before its first DMA mapping. The second
path is reachable when an ATS supported device gets reset before its first
DMA mapping.

Pass in a NULL old_domain on both paths for a deferred device.

Note that pci_dev_reset_iommu_done() can keep using the group->domain for
recovering the device, because pci_dev_reset_iommu_prepare() has unset the
attach_deferred flag.

This will be needed for the SMMUv3 driver to support the kdump mode, where
it relies on the given old_domain to unreference the invalidation entries
of a master.

Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/iommu.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index b486b8bbd1fcd..4585ffa9a73c9 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -2420,6 +2420,8 @@ static int __iommu_device_set_domain(struct iommu_group *group,
 		if (new_domain == group->default_domain)
 			return 0;
 		dev->iommu->attach_deferred = 0;
+		/* The driver has never attached the device to old_domain */
+		old_domain = NULL;
 	}
 
 	ret = __iommu_attach_device(new_domain, dev, old_domain);
@@ -4059,8 +4061,13 @@ int pci_dev_reset_iommu_prepare(struct pci_dev *pdev)
 
 	/* Stage RID domain at blocking_domain while retaining group->domain */
 	if (group->domain != group->blocking_domain) {
+		struct iommu_domain *old_domain = group->domain;
+
+		/* The driver has never attached a deferred device */
+		if (pdev->dev.iommu->attach_deferred)
+			old_domain = NULL;
 		ret = __iommu_attach_device(group->blocking_domain, &pdev->dev,
-					    group->domain);
+					    old_domain);
 		if (ret) {
 			gdev->reset_depth--;
 			return ret;
-- 
2.43.0


