Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8684D606A336
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 19:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dlupigV3;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=G2DWgwWw;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=rmIny4Pp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=NoaRM77SkpGQSLTsXAkslK7Qes05iRGHMTNuptGOVrc=; b=dlupigV3nO+50j26TCIctPmVR+
	3ykXkf6mMDmlPnXrtzqn1xk68HdCrqJYtabGq4CiIN/PUJKibHhCjtP4GnG0jSl9isKjeCoFvHIHw
	7U4h88AMaUWevhgXI8NMDKhxJR/ulGkN8mE403v0H6s1893F+fWiKcMICIVdfWTDOIKSiwv7EAwNN
	qhUr6STFV7ILpw7EIj2/EzZLFsBA8Cf6TI3spJlEwQ7h1m1WHAjWpoHI+Xpq/5258TvUqaWp0m2s8
	QpeNR/a13ukT1oT0csAoyzhbZpFpQXFY4DeSL3AC2GegllnU3VwUAC+Kj2fu2mgy+RH5iOZE4JnI3
	K0CQ33vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTOmv-00000006sUG-27oI;
	Tue, 17 Nov 2026 19:24:17 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTOmu-00000006sTc-1aDu
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 17 Nov 2026 19:24:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=NoaRM77SkpGQSLTsXAkslK7Qes05iRGHMTNuptGOVrc=; b=G2DWgwWwUu8nKb02+ugG+aQPGJ
	DSI/uaBoVuiUgdv299R8em/FewFrGcVpCvD92DcbauReL6qPCfoB5X1kYeb4QmR25B2XJsnJKtU8A
	x32IGk4TNadZ8OfJ+jK02Kfz7UDLz/9SyITmrT/H3QtRucKmXfhTmlluYRsS+VSFDVYF78/0MfwHA
	C7CPPBe+XSC/8zPxxy7D879yy6zsW6Pf6xDHiVR9U0uO8EIZhTZP9p5q4HX4UaN/gCwU3MPsR94bD
	JtLteoQ9ZVsLddgeErXa9rtiM9XEhhH59RIFWs8kPsPKKKKY+BJLQtkNckpBgwe11IgyPvbKquwq5
	RgB6dDbw==;
Received: from mail-centralusazlp170110009.outbound.protection.outlook.com ([2a01:111:f403:c111::9] helo=DM5PR21CU001.outbound.protection.outlook.com)
	by casper.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTOmr-00000004kQt-0uOM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 19:24:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pGG0RNUrg3ULU5yOgzQeoao3BjZ3D23FT/rDY93hCauW3z2gl9Qvdw4YEa6j6F7ZW68v/PxAnM4YDG/x/Qo+I5Ct7YtI0/eSPYPB4hsMeQODhfQJreDPE7+4ka1isS8FG9uUPJjVfVMpUq1Pbj3dvTfY7oX3V8YvJfxle3NYYbVaObTPy/o5XKJestbAK0gyafem0naR0ePl/Yrxin+aBe3PrpJIJ5h7oYYnRNR8vw30nKJt6UiPx0fGGaTnn12F0wdOx6Q6LFfi48pGDH6allikuRv/OCahSmvHqwXW+g9+bzhNPebW7c1vQnDXxTFzFJphDGy4h2RFYQ4aUYDyxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NoaRM77SkpGQSLTsXAkslK7Qes05iRGHMTNuptGOVrc=;
 b=eBhPv91IPDcEndD5iUy2lLvPCllfGBumlUCgfL/yMqJMB3aeux8SMmxxMB7LaIyb0sZacuZQJ77xzuWXwll0OiTwCZGY+v7hADhTBoQSDGgHZCVeYXZrDziIHCKqIC5Q9jZiTPkrMMIvzeThnS6cDoGokjdIPm4PfE0qPuj8kqrvxCijAo57Eyqz27VBKht5d8vuRKZBeSOi4K27QC8rWhnIpP3IHhVdV+nUAh/1iU1HEtgaUNT1x11MTux1KfxbIXIMsjL0umnGSFys2lyCnKrRJMRFJazj7Fj8uKh2E8V0hGVM6STydyRi+xU6NpXUKz0KKUrYnEgRBnQrzafccw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NoaRM77SkpGQSLTsXAkslK7Qes05iRGHMTNuptGOVrc=;
 b=rmIny4Ppk4/kdaN8HG6KkKQOBx16k/MqKU2pjMtlo79SHHw9hpfIb1lOKSP8yHILehwuodO+4mCcGQKOd/KHP964e3NY1yzlVm7U2pxXp1Qm0m2Fh7yho9EKSnfQQnte0BlzimTazOD8A9VlOmAfgYSgaHcqhmq1QBH7XrxlB6d2sfOLhyje29vgfd+NG26LWzSpvRzYyjsYVAdi7VxxfU8nxoZ3mA0d+YCi49EwRmDwle8MleDVHW5xXvlTGQt7ZFUhnxhm/0+cOUkyMo9tuh9uHD7ONeQGubUibBF0JNbhOmle8tB2CmSMO+9pxO5R2iLKdGaHcAoxSHHTwuJ0gA==
Received: from MN0P220CA0007.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:52e::25)
 by SA1PR12MB6917.namprd12.prod.outlook.com (2603:10b6:806:24c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 19:21:59 +0000
Received: from BN7PEPF00000096.namprd03.prod.outlook.com
 (2603:10b6:208:52e:cafe::24) by MN0P220CA0007.outlook.office365.com
 (2603:10b6:208:52e::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Tue,
 17 Nov 2026 19:21:59 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.118.232) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 BN7PEPF00000096.mail.protection.outlook.com (10.167.245.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 17 Nov 2026 19:21:58 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 17 Nov
 2026 11:21:37 -0800
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Tue, 17 Nov 2026 11:21:36 -0800
Received: from Asurada-Nvidia.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Tue, 17 Nov 2026 11:21:36 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: <will@kernel.org>, <jgg@nvidia.com>
CC: <robin.murphy@arm.com>, <joro@8bytes.org>, <praan@google.com>,
	<kevin.tian@intel.com>, <smostafa@google.com>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <jamien@nvidia.com>, <kas@kernel.org>,
	Cristian Prundeanu <cpru@amazon.com>, Breno Leitao <leitao@kernel.org>,
	<xueshuai@linux.alibaba.com>, <john.garry@arm.com>
Subject: [PATCH v13 02/12] iommu/arm-smmu-v3: Init the vmid_map ida before the stream table setup
Date: Tue, 17 Nov 2026 11:21:19 -0800
Message-ID: <861ac68481df5de6f24913ed6dc94112a9ba1066.1794942324.git.nicolinc@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN7PEPF00000096:EE_|SA1PR12MB6917:EE_
X-MS-Office365-Filtering-Correlation-Id: 1feb3d13-5f8e-4b3c-e7b4-08df44e00cf4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|7416014|376014|36860700016|23010399003|22082099003|18002099003|6133799003|261009223027099003|11063799006|56012099006|261102123227099003|261026121527099003|261026140227099003|10067099003|261021121427099003|261021135927099003|261021123027099003|261022105027099003|261022075727099003|261028144727099003;
X-Microsoft-Antispam-Message-Info: m1xGKiTDu1iYNjKBIoK2je4aRYc56yDcyoFESfnU2baUWQDdZ7o4nO7XHd+21F6X/PwpJ74UZV+D2armHzh0z1e06ipGYBNVCbTQe57KZI8jj3I3XpYe/ptBdMK+f4WfJGjJohhhDck31mDATrNc8yyW9/g7n/PXOko794KiSrCOz6Q9AB1Ed68W7jU+vatr+QiiLtwcNoPB8EWWLDcQp+9wvh9UNFZsQYsD6RX3bRSdqluXGZ6B5qQZfOnvxCUcIXkCCqlLggdb1+W0ANm/qIPBmDGvU5/52lZazOPahbLasfgrnOFUIraNVrDBNnABVgejdsJoB3ZIV2rx8j3RDpcaWJzrtXpeVv6MwXmdcQ2r52J4QTAV1GuYciHeG/X7xViC7DjtaJAcrn8EaFgkLF2+hnqiZvQaFNvkEPj5wN1RvPoDyJZ1KT+HoT5mgeGUxzzqjS3BrSE1R7hc1JdXnsXo+l7KyAzWtGbTUwjvGUlbxQtaFc0bNwkp2xs9UGlGqKfAJeZiLKEAKlLu9Li2Ptgt10/8GMjXI4oD5xHPKsSj+oBhElaZum2hrsRXJ+MNPUimJn/tPYNNRyXW09xmjlgx0mp9PpSYqeGQ/9yr6oYeq5HNuuf2aLGp7It73aPR45rDTXAaDbI+EhQ3xv/2YIhotKxxsVsphvLZC9LcTiCDn0+9VEhJT8GNOMlxk5SRMyigRDhXet3QziK0s0q9Jg==
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(7416014)(376014)(36860700016)(23010399003)(22082099003)(18002099003)(6133799003)(261009223027099003)(11063799006)(56012099006)(261102123227099003)(261026121527099003)(261026140227099003)(10067099003)(261021121427099003)(261021135927099003)(261021123027099003)(261022105027099003)(261022075727099003)(261028144727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: q0JXaxnCQqrozpk1nby+cpP+F7J84p9awFe90Qiu/4sY7c+QKgBoxy+3yfhGCklw5EfUgACI8+6FF0K8JAtZK45jOJcZmy84pKsfEWsF/jFTcy5CaoBup9+y0uu8ghkVlGyNDLeQHuYUzskpggiK2qOx6leD5Plt6lFbOawm+79VatxbnE4xJqZlx1AjKikU23Vrzs0x8yxPnoajy45deKPIhON8UxZGEMgDFaluTngVx9k9MHar/IfY0UZ6xQSxgciRzC1aTaKtT/yDbpgA7KNn4OhSiS18ed5a98p2kfFXSyO9RL3lk1hb9xy90szf0m+iIGDAYjsUuzv29O7CwwzReHwrtAVvCvH1jkKJnNGEMEy/6Ewvw1h72DeIli1Ic8b/ROJI/vadUcw0Xb0ujpXzizSZ03Un9dp4s3HPhw5mg4O2ifnU3yNMt0xsAq9U
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 19:21:58.8520
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1feb3d13-5f8e-4b3c-e7b4-08df44e00cf4
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN7PEPF00000096.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6917
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_192413_290054_49D787A1 
X-CRM114-Status: GOOD (  11.07  )
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

The vmid_map ida is initialized after the stream table setup, along with
the devres action that destroys it.

An upcoming change will reserve the crashed kernel's in-use VMIDs in this
ida, from a kdump kernel's stream table adoption that runs in place of the
regular setup and returns early.

Move the ida_init() and its devres registration to the entry of the whole
function, so that the ida is ready by the time the adoption path runs.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Reviewed-by: Mostafa Saleh <smostafa@google.com>
Reviewed-by: John Garry <john.garry@arm.com>
Tested-by: Breno Leitao <leitao@kernel.org>
Tested-by: Cristian Prundeanu <cpru@amazon.com>
Tested-by: Shuai Xue <xueshuai@linux.alibaba.com>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 6d4520c473086..5cabbe5652dc6 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -4842,17 +4842,17 @@ static int arm_smmu_init_strtab(struct arm_smmu_device *smmu)
 {
 	int ret;
 
+	ida_init(&smmu->vmid_map);
+	ret = devm_add_action_or_reset(smmu->dev, arm_smmu_destroy_vmid_map,
+				       &smmu->vmid_map);
+	if (ret)
+		return ret;
+
 	if (smmu->features & ARM_SMMU_FEAT_2_LVL_STRTAB)
 		ret = arm_smmu_init_strtab_2lvl(smmu);
 	else
 		ret = arm_smmu_init_strtab_linear(smmu);
-	if (ret)
-		return ret;
-
-	ida_init(&smmu->vmid_map);
-
-	return devm_add_action_or_reset(smmu->dev, arm_smmu_destroy_vmid_map,
-					&smmu->vmid_map);
+	return ret;
 }
 
 static int arm_smmu_init_structures(struct arm_smmu_device *smmu)
-- 
2.43.0


