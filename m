Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18A6F606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 19:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=V1GPTvHg;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=QgQWt9IT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=YA+c/r7jwEoZRrivr0HoKdqtCf9ZqpVd1SpGlIdUQoY=; b=V1GPTvHgHzbccp0X/a1qsyKDMA
	tfvHSBeuTo/je2bj9DfhQN0dOFF48jrVqpu3Pt65xfn6GnYTeJ1pwkEQ5pMboiTmzCFhmcHBBIjw/
	2HAyBQBCDFLnv0WqVaCHXGzT47cyJHXYgKeLP8qEW38XGKEyO+5BSkRJYVdOLnntbARqGt4qZCl+m
	yx5L/P7UkSAoB01wZnx/shCIv5/I8K5lQZgkbT+LMEj8tlrSYUQ9ZK8zpNHBZNvcc2hROEPzlrsBr
	rJQqikogD8vV6DCcyipTYOArBiQQv3a+VLoay1iH/QqIKByh283BBC/qsvXrkPQAWlAZp+b3qc9x8
	tdAdKXgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTOlY-00000006rbC-37PU;
	Tue, 17 Nov 2026 19:22:52 +0000
Received: from mail-westus2azlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c005::5] helo=CO1PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTOl9-00000006rK6-2ebF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 19:22:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mclNi6peMfXgD4P2I0eevm6Jo8O0y4t6HoRKxSTYr1n7mIJMEnwp89sJQYg9Gyj7Us8H+9b6L01KjrkmRpfN9KOg1tifnK6dspJuzfDCxArTxugfZyy/qVSSrDUnmBekDjdQryy+5ACFx39FMHshAKL9dBhxCY+C2CrdETSUWAbGz0vbAHyAkg0KxjhM0CIuAq0/dgm7XiVfIzgIyZBSDYVDXKyGgRENYV/Rn8oK4QLcmbgFx71yfN/kuzOqikuy7TOCztAkwFkKTIthWJYsl5Z4BTgz0UCK4HJEEqIEWhHKJbG4LaYkg81bEJaVfpgok1Yh/e9FUd6Fm1mxXSZDYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YA+c/r7jwEoZRrivr0HoKdqtCf9ZqpVd1SpGlIdUQoY=;
 b=v9H2ugxvYFgdn/rZAlSSMAxFXEhOMNqVcBrLY8tHL6s+VefBOPwfcnH6gQEC+Nmu/mjiHo4du7VOeBI6rtxQuv6E4roUfjyezCiK/jD2eOFfm3AEix0NfyXUwZUk9QphTqE9JhIv4EUxZ++n7RnUYPvibDRbaey2ymxriVXugZ4zZvDNr6a3J+1jjuRxc9jasZneFTqGw6SLnTB3njYPR5TFHg4cM1nNmbBKHPQsByN92ZVvWn4Ll7xbx+UlYXPcsYEiWtAbYxzzM/2jcyhR/46S3+fkm+89/KatIxHcWp6b7IP4dU00SEumEZd572GC/BWJCzTlHfd5azxFUqW3VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YA+c/r7jwEoZRrivr0HoKdqtCf9ZqpVd1SpGlIdUQoY=;
 b=QgQWt9ITEiD1fMyHX0z/y8lS8LjNIyrT2dviq9h3HQcTRHYTXaQM22+ZPSxfpgHHnl1vyc+H/YcTeQssfxgZyRR4iPtPdSCi3jxgZga4ab3MFLXGS8KQ+ac4x465kNi7UhNRUnEdK5rBNmnRcPZnEP2w16JmdWmaT8YSYgRqU3ZMQYKtST4WjdLuzZf5smx1fllVao8NrdNEK+vhMt0rfV/VcKxVH7I4R3+O9wsthZCRuSIrAfhYHwn9+EZxu/qMCH83VFNWZcNe2o+uoRI7XACBczCKDYA493ZehVkNSOqgeKJ7YUaLdV7Pdjw+rm/FsEuAWl+mHdz9LGu9UdQusw==
Received: from BN9PR03CA0384.namprd03.prod.outlook.com (2603:10b6:408:f7::29)
 by DS0PR12MB7900.namprd12.prod.outlook.com (2603:10b6:8:14e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 19:22:14 +0000
Received: from BN7PEPF00000090.namprd03.prod.outlook.com
 (2603:10b6:408:f7:cafe::68) by BN9PR03CA0384.outlook.office365.com
 (2603:10b6:408:f7::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Tue,
 17 Nov 2026 19:22:14 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.118.232) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 BN7PEPF00000090.mail.protection.outlook.com (10.167.245.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 17 Nov 2026 19:22:14 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 17 Nov
 2026 11:21:47 -0800
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Tue, 17 Nov 2026 11:21:47 -0800
Received: from Asurada-Nvidia.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Tue, 17 Nov 2026 11:21:46 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: <will@kernel.org>, <jgg@nvidia.com>
CC: <robin.murphy@arm.com>, <joro@8bytes.org>, <praan@google.com>,
	<kevin.tian@intel.com>, <smostafa@google.com>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <jamien@nvidia.com>, <kas@kernel.org>,
	Cristian Prundeanu <cpru@amazon.com>, Breno Leitao <leitao@kernel.org>,
	<xueshuai@linux.alibaba.com>, <john.garry@arm.com>
Subject: [PATCH v13 12/12] iommu/arm-smmu-v3: Detect ARM_SMMU_OPT_KDUMP_ADOPT in probe()
Date: Tue, 17 Nov 2026 11:21:29 -0800
Message-ID: <c9d4b83597ae233cff1ab4b3a7de26b0c6e3c4a8.1794942324.git.nicolinc@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN7PEPF00000090:EE_|DS0PR12MB7900:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a4c736e-0b63-44ae-cb48-08df44e0163b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|36860700016|7416014|376014|23010399003|22082099003|6133799003|18002099003|261009223027099003|56012099006|11063799006|261026140227099003|261102123227099003|261028144727099003|261022075727099003|261026121527099003|261022105027099003|261021135927099003|261021121427099003|10067099003;
X-Microsoft-Antispam-Message-Info: YgF7GzU409+Q/v18G7/jI0ahmWsQ/mng4bq+e1mML5RlEz4MpwRkOAo7Y3S1IGEaIBl+GxlhOmFrl/qnUIa7nnBMpAT/6kk+1WLQ3j3yeYhJZemy/Es0pH2n6poQqq+eUGt2aR1qM0jIvewJZTPp58thwtaWJGVThiqBHIGU/Jz3BGZxYVwgcrshpPyOydmzqT5Fs20a8UwB9vBlwH0TARfOoaIjpweDSnI5DPsxrUhapDr+HUk+V/qctaDyKnpp3OIVnudQdEJ7o8uO+Imnv/OrkoQ5wE9i/sBPz+aWivuFT8m77Emj59uQBjl1viyMlR6BfbQ/RmmdYzWwx9OGe/QV2L8KVsHU69JBsReDXIdHuwmFsQRlPJwoEz4v30+jFIcnbNjOiz8F09QJ9sXkvLDMPLyVMxlhs7hoaSNrJHYJlvUW31xfhvHcej2oybkpwKvMSBp3icJrmClGKYYZhMY6Um5GRedHss9I9ZCEySjUFElK49KwveCcJWYxduHKLZjpLu7Hs5wPvS8jT6x7402bSM85D5IngzrTy8cQbSMf63kKT04QdnnknZcGIdy6U3yJa3tBTRL5TpbD2sRrTXgwojR5Oz7vTVvnSDwxiX2j1I/OgXA5r+Riuudqjgo4ibFGW/fxSeyme3/1LOwFM8DfHipUvijbR85Vu8Tx9er6uoqJWzHsyTgRwbtZPs2qG/U2n/gYlMvP9kK1uYPnpg==
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(7416014)(376014)(23010399003)(22082099003)(6133799003)(18002099003)(261009223027099003)(56012099006)(11063799006)(261026140227099003)(261102123227099003)(261028144727099003)(261022075727099003)(261026121527099003)(261022105027099003)(261021135927099003)(261021121427099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: KK+pqfyilF7rl0WBVO2pKKzhN02bG1gFcRIngb50kbcIhmaM9VzMXUxD7Fi6OJUbhnHmO4D2gq81DqY5arKfU/efYAbidDCMXehSNHgYkb1v5WeSCqEhKMHMiQbiczM5PI4oKXs7IRaaX6NUJhk52MYPLDwxeurqiWcG3WH56BiaKLlvR9jYJvTq6R+cm4AIq+7TxKT9TKAcK03NddsdWDUJth5B9zOqWQl9dDjqK0MG/eEC9Qxq96FCzd7u82F8nA3U6o1wk/ZtaVp38wmnR4e9VcLo1+Bv7luofM4AccAkfzTC8S02pE0N6Q4+77oOR/j9lrwB7+VLK4gzTptciJOepUHes6TTMjen7+6wf9laF01UP5IW+1KUYqoaeWFpccCg05k5SdaQV212zXmtIi03OKQ9j56JMY3GF03lYKDroyVcPR5kR9osTpMCswps
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 19:22:14.4446
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a4c736e-0b63-44ae-cb48-08df44e0163b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN7PEPF00000090.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7900
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_112227_703728_436CBB3A 
X-CRM114-Status: GOOD (  13.53  )
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

arm_smmu_device_hw_probe() runs before arm_smmu_init_structures(), so it's
natural to decide whether the kdump kernel must adopt the crashed kernel's
stream table.

Given that memremap is used to adopt the old stream table, set this option
only on a coherent SMMU.

And make sure SMMU isn't in Service Failure Mode.

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Reviewed-by: Pranjal Shrivastava <praan@google.com>
Reviewed-by: John Garry <john.garry@arm.com>
Tested-by: Breno Leitao <leitao@kernel.org>
Tested-by: Cristian Prundeanu <cpru@amazon.com>
Tested-by: Shuai Xue <xueshuai@linux.alibaba.com>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |  5 ++++
 .../iommu/arm/arm-smmu-v3/arm-smmu-v3-kexec.c | 27 +++++++++++++++++++
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   |  4 +++
 3 files changed, 36 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
index 3bedc328a5cb0..88771758d3a6c 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
@@ -1344,6 +1344,7 @@ int arm_smmu_kdump_adopt_deferred_l2_strtab(struct arm_smmu_device *smmu,
 					    u32 sid, phys_addr_t base, u32 span,
 					    struct arm_smmu_strtab_l2 **l2table);
 bool arm_smmu_kdump_is_attach_deferred(struct arm_smmu_master *master);
+void arm_smmu_device_kdump_probe(struct arm_smmu_device *smmu);
 #else /* CONFIG_CRASH_DUMP */
 static inline int arm_smmu_kdump_adopt_strtab(struct arm_smmu_device *smmu)
 {
@@ -1363,6 +1364,10 @@ arm_smmu_kdump_is_attach_deferred(struct arm_smmu_master *master)
 {
 	return false;
 }
+
+static inline void arm_smmu_device_kdump_probe(struct arm_smmu_device *smmu)
+{
+}
 #endif /* CONFIG_CRASH_DUMP */
 
 struct arm_vsmmu {
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kexec.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kexec.c
index ce0cbd73f453f..93686143c7471 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kexec.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kexec.c
@@ -709,4 +709,31 @@ bool arm_smmu_kdump_is_attach_deferred(struct arm_smmu_master *master)
 
 	return false;
 }
+
+void arm_smmu_device_kdump_probe(struct arm_smmu_device *smmu)
+{
+	u32 gerror, gerrorn, active;
+
+	/* No adoption if SMMU is disabled (i.e., there is no in-flight DMA) */
+	if (!(readl_relaxed(smmu->base + ARM_SMMU_CR0) & CR0_SMMUEN))
+		return;
+
+	/* For now, only support a coherent SMMU that works with MEMREMAP_WB */
+	if (!(smmu->features & ARM_SMMU_FEAT_COHERENCY)) {
+		dev_warn(smmu->dev,
+			 "non-coherent SMMU unsupported; reset to block all DMAs\n");
+		return;
+	}
+
+	gerror = readl_relaxed(smmu->base + ARM_SMMU_GERROR);
+	gerrorn = readl_relaxed(smmu->base + ARM_SMMU_GERRORN);
+	active = gerror ^ gerrorn;
+	if (active & GERROR_SFM_ERR) {
+		dev_warn(smmu->dev,
+			 "SMMU in Service Failure Mode, must reset\n");
+		return;
+	}
+
+	smmu->options |= ARM_SMMU_OPT_KDUMP_ADOPT;
+}
 #endif /* CONFIG_CRASH_DUMP */
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index a2687855a1e66..e7f79bd19ac6b 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -5646,6 +5646,10 @@ static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
 
 	dev_info(smmu->dev, "oas %lu-bit (features 0x%08x)\n",
 		 smmu->oas, smmu->features);
+
+	if (is_kdump_kernel())
+		arm_smmu_device_kdump_probe(smmu);
+
 	return 0;
 }
 
-- 
2.43.0


