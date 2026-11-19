Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62A97606A320
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 17:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0VPck928;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=oYt4Wa0I
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=FTLk4NnZeFZmoBRlxFHmqfllD0CM8928NVbyEN0WOsI=; b=0VPck928G0SAj/4Eo0J4o0jy8d
	iWdag/t3t32F8t+8bCGmDhFLp4guPoIOIxmHSJ4eEkpPMzgXuqr1bdh8J5SL5MyAshiK1UMtqimE7
	io5WeY+0iKdQjdKc2gRzBo87EPOVRLNS09AkJKpJ1WY3z2ExRGf0KVZBeYtfLEuksrREJthOpk8qh
	uqIitZ7YWvb0QboNR+YbDlfuZXQKbjAzAFEo8rnMJ+mpn0DJkKuetyuqkyUVZ5MXrmrEl7Cb1ZAUo
	ooTkrQJar+qoTtvnf3JR4wqQQICKLUuxSz0DJJkQ6g+sBPU+hJuFXgkQmQ1KqLbCM5veGMF2tHeka
	80fiWbsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU5mk-0000000CosV-1Fh2;
	Thu, 19 Nov 2026 17:18:58 +0000
Received: from mail-northcentralusazon11010066.outbound.protection.outlook.com ([52.101.193.66] helo=CH1PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU5mh-0000000Coq0-3Zzs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 17:18:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xSlvy+jrntt0Xb+AirMJDzN8UaDQn5akbu3jO+3AUTnEItgKJQ6dC+Y/oIQVzoqF81rXIzlNy4hSFrIidnd60sea888IMnQpWWACY5CzQsdmFbstHAzDEqdFqPqUG0aWugLiHDShHv5VI6+Hxw/nbc3QSRwwZNKzdlCrE4h/IXTtRm/mig/34Ofj3PLWo18CAqcOF/HCW2tmjLRyCVrPuGM0GyO+hCI1rBgnBw+2lZznf4o9jflDRsd3rTT1/sh/c754cfhwby64cYP+hyzQPDDJo48ORviWCM1RnxTyuNAv42kSEnDbnuo2vmoJZN4T7Ykz8MnXgrVRnqmXNN4UtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FTLk4NnZeFZmoBRlxFHmqfllD0CM8928NVbyEN0WOsI=;
 b=l7TM6m/ic/uyQLfo2JNIZ0nH6Xaslj267e9fbc4T7cKafjqdwOxylSODsYQxbgbmZRhsSK3mCa067TU6AVJACdTDYsOC8LaSbgMHtIPbVYq8PXsvUa9HTxP6Adb/npx9bHRHfmD0bEAkusKnVBNmqQtXSmT7cANcy1g5XSRNVP8azkaGvGVorduanGCnjRgnqLYDv/08LqqC3IMIBS8kWhEBKZ9tKZQsq+euEMz5d0uN/fqz02eP901zDW9i5DVBPpHYA5mSXhvPIEu253b/AfloOkYzenthpU8Dg4LmhL2iPQRUXfCsPtQ3V4KVffuRKUeb6XXL1ztPI8Z/7rWzTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FTLk4NnZeFZmoBRlxFHmqfllD0CM8928NVbyEN0WOsI=;
 b=oYt4Wa0IRi0eUt7Bamp52c6lDhRPUfr0wLbFFE1XcbWMYpoEPorCIJFDcw3lPXz4V0abPiZ2No5P5pZ7yyTh9os9GQ+rTcBs6ws3WwnmUIcPBBmuVDS1p+Fz2k+pepekinFUfNpTg+dzokz5FpYtvtSXfJzlnpquUClKrW8b8UM=
Received: from CH0PR03CA0051.namprd03.prod.outlook.com (2603:10b6:610:b3::26)
 by CY8PR12MB7435.namprd12.prod.outlook.com (2603:10b6:930:51::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.16; Thu, 19 Nov
 2026 17:18:35 +0000
Received: from BN3PEPF00022BC8.namprd05.prod.outlook.com
 (2603:10b6:610:b3:cafe::54) by CH0PR03CA0051.outlook.office365.com
 (2603:10b6:610:b3::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Thu,
 19 Nov 2026 17:18:35 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN3PEPF00022BC8.mail.protection.outlook.com (10.167.248.214) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Thu, 19 Nov 2026 17:18:34 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 19 Nov
 2026 11:18:14 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 19 Nov
 2026 11:18:13 -0600
Received: from xhdradheys41.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Thu, 19 Nov 2026 11:18:11 -0600
From: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<michal.simek@amd.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<git@amd.com>, Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [PATCH] arm64: dts: versal-net: disable GIC ITS by default
Date: Thu, 19 Nov 2026 22:47:57 +0530
Message-ID: <20261119171757.2558318-1-radhey.shyam.pandey@amd.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BC8:EE_|CY8PR12MB7435:EE_
X-MS-Office365-Filtering-Correlation-Id: d8baf09f-1456-4839-9715-08df4661249c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|23010399003|82310400026|36860700016|10067099003|56012099006|11063799006|261022105027099003|261026140227099003|261028144727099003|261026121527099003|261022075727099003|261021121427099003|261102123227099003|261009223027099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: VFW7NX4LDm1eOWu6ddjaTBud2FsU7w7w6cYW4cTaVp9H0VA+KrZ2sepP569Qei+uLRi2OevdUBEGT0BlR14oFu+v8YnV0chk9gXrm5hKvFRlZpO7eb3AmMbDVyJQR48c+HnXLhyeQe9pzudnOR0GUsxEfC6PxyG99YH19NwFglH/WbJfja/FkLLsAEsCS3RiMEdyO7nDnnWBGCfbV1gIsDn3/XoewmVBrY/8tC1gWD8wAlaRjrveTbS6zIhtdPutua3paPrOETlJ4/eClTNq7DM//jARYgLGkbIRm1mJV0mik1IOzjChluMGYaHa7JRAX7WUtebf5Z/ikw2ca+O2zxmvu4ykh7jDrEOAa4DFWBqLYGo8KgadUKciAwgfBEbUAMeRhfpA5CHnVXos6+tzTK8IdKvVcYfQ3cS/TMHG0q7o/g9hXmoKLOVsfMFuuQEbcSfRJ/+62I4GLCH9ZxLOxO03hbQRfudbeITYcBbq6ULy570P6pJma2OmoPfNhHWTyFlypcwjIy5uMKUAGoeXxJRN/0Uud17oFe8YUudr9uh/iSAvKSo+/BT5WJSmhao0iGBli0HN1XfVt1nGr0NXJeSDScBOvBuarn4YngXom3JLNdpdung1O6rTKRwHGY+blQtET2rI0nUmhq5NljoavztchiDo7HvrPTOQszhhaaxR2Os0qQIqPQrtF7yyUx5T5HPSYz+z3KLbe18VaBsokg==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(82310400026)(36860700016)(10067099003)(56012099006)(11063799006)(261022105027099003)(261026140227099003)(261028144727099003)(261026121527099003)(261022075727099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: wBxw2xjrCX8VFrQZyY3z4bBOZus/maoF0269iYRdi2ONAA7iMxAJcFj2fbvUtAphTbUyzF7gUHubX5GL7a/kkFTeuwQmZ68Y1Q+bfcG+sZ6bj4G1q/hl2Xu41XEEsNCKvHEJo6zrct2MktwuzcmyceJkyOXS+xhuVj3I7+VThfaMgFBpqSh4PvyC3T04Fd6HN8dI63Antjy6xloEhdPVFDeMOUW/NiI+8Q6P2u1anlvn6vpEXB2h6rSmAhVLJJg7YBnAivN3LVrm220E46tGSpu6/DGLOuFTuHDpwiFE0thGH8yz+g3RRNRVWUl+rx90UTi4JV9wUA9XIq9vXWLv3pWp8xyHTexT6sAZDWmWLLB8seChPVoaxg5LnUR6qxLz/MybH7yCkHWdHM2VjJPtMJOGzsj0oRGLuk0//VmvGwxSFhtTTD5+987E0lVnU4E3
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 17:18:34.9477
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d8baf09f-1456-4839-9715-08df4661249c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF00022BC8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7435
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_091855_901569_105B0BB8 
X-CRM114-Status: GOOD (  11.67  )
X-Spam-Score: -2.0 (--)
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

The GIC ITS is only useful when something in the design generates MSIs.
On Versal NET the default configuration has no MSI producer so disable
the node in the SoC dtsi and let boards that do have an MSI producer
turn it back on. versal.dtsi already follows this approach.

Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
---
Disable GIC ITS by default to prevent potential memory corruption during
kexec. The second kernel can inherit stale LPI configuration pointing to
memory owned by the first kernel, resulting in warnings and potential
memory corruption.

Alternative solutions are to reserve memory for the GIC ITS tables using
a DT reserved-memory node or use EFI to provide dedicated memory for the
LPI tables.

Since there are no GIC ITS users on this platform, disable GIC ITS by
default instead. Intentionally not added linux specific details to
DT patch.
---
 arch/arm64/boot/dts/xilinx/versal-net.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/xilinx/versal-net.dtsi b/arch/arm64/boot/dts/xilinx/versal-net.dtsi
index 21bb917bcba1..00b857b5c4f2 100644
--- a/arch/arm64/boot/dts/xilinx/versal-net.dtsi
+++ b/arch/arm64/boot/dts/xilinx/versal-net.dtsi
@@ -872,6 +872,7 @@ gic: interrupt-controller@e2000000 {
 			ranges;
 			its: msi-controller@e2040000 {
 				compatible = "arm,gic-v3-its";
+				status = "disabled";
 				msi-controller;
 				#msi-cells = <1>;
 				reg = <0 0xe2040000 0 0x20000>;

base-commit: 4405c18c95d2d0f99f6c581ef0ee8591a1aa6ccd
-- 
2.43.0


