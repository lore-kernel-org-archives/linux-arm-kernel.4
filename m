Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE6FA606A326
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 13:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tDaIB/Vw;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=rgGlMBa7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=1Ig72pQmix6onW83S/BhP0UxiKgxuXHoDOBJ8rw+ufk=; b=tDaIB/VwqCMXJZc5xZzdsnVI0K
	MmJP9j77LcqkMeIGQG+/zgKp4h05xizdAeYepGH0+fRW7qd+tcJiM2fxzFMxG0YWOs0yPgIOk5Pen
	LHq57NxVJl6xwgTQ08C3BDn0fm+aEPmQHEjWiXpSgpxN180QhO7qUICgQ4lzwueecRBOlkQ7EI+Io
	LYQqStUSHWwGBE8RB0WzudQw8BgeK43TuuUk/gAwZ/zzMdfzAzVDamjQ56mKoZ6iQ55UeFLUV59dA
	qP89e8MEFH/8YNDWYwshbsf/INaCXpfEc5KCKtgycO0/7G7tLsJPDalrFnqTCB042MAtQme76oXG7
	E7k5seXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU21o-0000000C0KM-1hyp;
	Thu, 19 Nov 2026 13:18:16 +0000
Received: from mail-northcentralusazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c105::7] helo=CH4PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU21b-0000000C0GK-1NEc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 13:18:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DUDiv9w8IAIgDaXSpcaRMJWtL7gGJcFBnmEbF6RckCFKUjw0WTZTToIJfQXWJRnldN42l/re5kCYyM7f7Dhob1CidQJCZfWZe+irnJ7ZaIhghGoEW8z0wKfoGvHIechbjbeXb9gwIJ5zpvllpU9T35+WUKI8FHTdPmocv+wmNI0YgUcc/ncRNlD1uShwhCm38dbK9Ux1nSQd/xNAn83doKPYWC6SZ/cqRHPzKI2HLRvuHSqJ322ecaOrLtdgJp0Rpo3FZbbzGR4becNahQ195ggjMC6ynTS4W2jyRzUhgeNvxBVtVVJ8TASqmWhiScZGodzrkgrRrY1a9ISWUEvwLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Ig72pQmix6onW83S/BhP0UxiKgxuXHoDOBJ8rw+ufk=;
 b=loCuMoNUZk9v2B7yZ7ftFVO709bJ3oygwskmeXNKFuj4GLbB23k0uh3TF0rzHKcUrZNZkcXcUABQHAIwlABce1PffU+1HddgwXTi8VmF3I/ic+mPoF4+NLCINIWlRdEZb+2LBP1ApIk49+WD3KoVe5Lckcccgxy5CYmrWbw5X7KuduFePWVkHROTyQSYbGKYBemrvZffa08Sr+AsP9WnEAp2LvRFqk6KLrGOX6B3dfk5tOEyzIPDruFPcJEqKSJ1Ebgc1JAyP1wCQo/gZeS3zYhyeNXfMPCU1byfbkPHhrv6ArTYlanMt69mM5cb46/gyUei95JXzYf5bY7ndN3Bvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Ig72pQmix6onW83S/BhP0UxiKgxuXHoDOBJ8rw+ufk=;
 b=rgGlMBa7wKxqan3KF8hDBF1n3CEPtacqh3C7nRv4IYDxBPUUmPRzzbJ0yhby19Y/BqqckYadSkoIqvoGTaOvTREV2Rh/G5IOoWrf64rrj7NZHFza3Wo6R1gb1zYd1vB+HH68WpcB9vqrnCkBcpr80oPai859WC3gpzjcnmnqQqY=
Received: from CH2PR12CA0001.namprd12.prod.outlook.com (2603:10b6:610:57::11)
 by BL1PR12MB5874.namprd12.prod.outlook.com (2603:10b6:208:396::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.13; Thu, 19 Nov
 2026 13:17:56 +0000
Received: from CH2PEPF00000149.namprd02.prod.outlook.com
 (2603:10b6:610:57:cafe::23) by CH2PR12CA0001.outlook.office365.com
 (2603:10b6:610:57::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Thu, 19
 Nov 2026 13:17:56 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH2PEPF00000149.mail.protection.outlook.com (10.167.244.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Thu, 19 Nov 2026 13:17:55 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 19 Nov
 2026 07:17:55 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 19 Nov
 2026 07:17:54 -0600
Received: from localhost (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57 via Frontend
 Transport; Thu, 19 Nov 2026 07:17:54 -0600
From: Michal Simek <michal.simek@amd.com>
To: <linux-kernel@vger.kernel.org>, <monstr@monstr.eu>,
	<michal.simek@amd.com>, <git@amd.com>
CC: "moderated list:ARM/ZYNQ ARCHITECTURE"
	<linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 4/6] firmware: xilinx: Call pm sysfs out of dev_groups
Date: Thu, 19 Nov 2026 14:17:28 +0100
Message-ID: <08f5c8adb895d37850ad0940e03009a6c010b9ed.1795094242.git.michal.simek@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795094242.git.michal.simek@amd.com>
References: <cover.1795094242.git.michal.simek@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2092; i=michal.simek@amd.com; h=from:subject:message-id; bh=wWQ4waoaBwmyszMTlqFaNFVXUpFgIohyHdgUpuUd51Y=; b=owGbwMvMwCG2mv3fB7+vgl8ZT6slMWT9+/bx3M1jn19q+Dv/e/LaeOa01I/KH18Fi73eVPb3e PM5r/JvXR2lLAxiHAyyYoos05l0HNZ8u7ZUbHlkPswcViaQIQxcnAIwkU1SjAwvpi3LW/fC+838 jUcu/zvkd/HWfoF98ntvFvMX55VvF446yvA/qGfZu2X3WWxOKr3wlZMutvowsaNBY34oyxrh13o ZusEMAA==
X-Developer-Key: i=michal.simek@amd.com; a=openpgp; fpr=67350C9BF5CCEE9B5364356A377C7F21FE3D1F91
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000149:EE_|BL1PR12MB5874:EE_
X-MS-Office365-Filtering-Correlation-Id: f98fc9a4-b2d5-4aab-6308-08df463f8641
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|36860700016|82310400026|23010399003|261102123227099003|56012099006|261026140227099003|11063799006|261021123027099003|261021121427099003|261028144727099003|10067099003|261022105027099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 6DAnH44cAX13Mp3w0Cyw4fS2lVIlkxT33GDFryAoRR1TCRwAEln43wZsgZWEs7ajUNs0YCnjUNHkdWWsfkXJDuDmlkjChiAB4kFdTD42da4nl1EmefToQSF1Jl+3ztrdsY+5906ZcLVqudsFAYIutGLSKpup9m0bLGJ/gz0hBkDAspc1p5DDyxgEWs0hs3xdwO0YU3jyT7aT85HXSGhMmApXyN2W0I/BaliT81tN8sfH0R6IuTPHAxm7tyk4c0kHqa/OWGPXrDwK6Piq6tITUtCupT8oBZl04hZ+GpnqJ7z+Qh6Oap1S15P1LavOc4to3RN5zsqYcZGC7AxoaVxwAMVfxORvOpgdlMitVG+dK3Ukrnshg408UJZjLNx4WKE5aao2rO6dC777ZYuREWV4yqE8CJZlw8E2Vby8J2IUf9TjoAI0Lc0Z0MF43C7vh73oLIFZL6EXKdEN0nQs3AAWbaLdJq/TeP0tQxkbj0YppJmaCdoxejmwYpPmT34T54Dw971VrgSyaI/rU4HzGlqvnSRpMvZFwsTcC/RRT3z7W6YxqNaTZMTYbf+EKpFuuMnpvTzb/QxL4il/RooI0L64Q22nmgBAVu9zwQaw8s0qN8mL54I2DwJDCd9gC3Wmal3QpUeZDAAyhlw/KBm1WLiIek1BO+TZCflVb4OIFqetuLLbkQhyBj1ww4FM4TqV/IIet4xnI7clivWyCzmqkFtt8w==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(82310400026)(23010399003)(261102123227099003)(56012099006)(261026140227099003)(11063799006)(261021123027099003)(261021121427099003)(261028144727099003)(10067099003)(261022105027099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: W8kJwEiKC0E6fwNXv9pKPET8ail2rqGwDQQA2688jJEk+bMQbPMzA6P6X6892gNwVOnHbaNC5/IODtQv9SWgh6/9qLgMUD/LHA1ytI0j1dhz+TIAMjTtBklyavWPAknLKlv/FoeO1UzUdK9QyOcSNlFMzPzxxDoX8n+mHKrV36XhANp1xfljZrKRHvoPUsPXy9ORi/3wZKRLv3BQBMt9LieY+zkCCdfTJAq0xjWTQ1PbU3c9EYBqbOXtv5DqYY0hzYDSE9CE5LNIpNGTljcRoxb1g/3HPhLYZBJx0ZfiXZ26Hn6TZThqSD6+Fb/ZmGUMvg1eAKaopwnP8nbmldsHHWZlZXeZ0Cnpo/iBFKy6iMZLvYW/WKCGURgyAo0MdJqbUze6nCmM8O8wUtE1SCC0cGEyDcAhYNjt5jLhudJTl73bcxutC8n4xJVt4ui4KBat
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 13:17:55.8598
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f98fc9a4-b2d5-4aab-6308-08df463f8641
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000149.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5874
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_051803_372493_64F9DD8A 
X-CRM114-Status: GOOD (  15.27  )
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

PM (Power Management) functionality is only one part of firmware interface
that's why move sysfs registration to own function and call it separately
as preparation for spliting functionality based on service type.

Signed-off-by: Michal Simek <michal.simek@amd.com>
---

 drivers/firmware/xilinx/zynqmp.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/firmware/xilinx/zynqmp.c b/drivers/firmware/xilinx/zynqmp.c
index 597393d5ea69..43db81af678c 100644
--- a/drivers/firmware/xilinx/zynqmp.c
+++ b/drivers/firmware/xilinx/zynqmp.c
@@ -2189,7 +2189,7 @@ static ssize_t feature_config_value_store(struct device *device,
 
 static DEVICE_ATTR_RW(feature_config_value);
 
-static struct attribute *zynqmp_firmware_attrs[] = {
+static const struct attribute *zynqmp_firmware_attrs[] = {
 	&dev_attr_ggs0.attr,
 	&dev_attr_ggs1.attr,
 	&dev_attr_ggs2.attr,
@@ -2205,7 +2205,18 @@ static struct attribute *zynqmp_firmware_attrs[] = {
 	NULL,
 };
 
-ATTRIBUTE_GROUPS(zynqmp_firmware);
+static int zynqmp_firmware_pm_sysfs_entry(struct platform_device *pdev)
+{
+	int ret;
+
+	ret = sysfs_create_files(&pdev->dev.kobj, zynqmp_firmware_attrs);
+	if (ret) {
+		pr_err("%s() Failed to create PM firmware attrs, err=%d\n",
+		       __func__, ret);
+	}
+
+	return ret;
+}
 
 /**
  * zynqmp_clear_pm_state() - Clear subsystem state
@@ -2349,6 +2360,13 @@ static int zynqmp_firmware_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	ret = zynqmp_firmware_pm_sysfs_entry(pdev);
+	if (ret) {
+		pr_err("%s() Failed to create sysfs file with error%d\n",
+		       __func__, ret);
+		return ret;
+	}
+
 	zynqmp_pm_api_debugfs_init();
 
 	if (pm_family_code != PM_ZYNQMP_FAMILY_CODE) {
@@ -2407,7 +2425,6 @@ static struct platform_driver zynqmp_firmware_driver = {
 	.driver = {
 		.name = "zynqmp_firmware",
 		.of_match_table = zynqmp_firmware_of_match,
-		.dev_groups = zynqmp_firmware_groups,
 	},
 	.probe = zynqmp_firmware_probe,
 	.remove = zynqmp_firmware_remove,
-- 
2.43.0


