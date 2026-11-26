Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77EFE606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 11:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Oc1aFJH5;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=gCA6Z8AL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=UCc4VFep4IEKwOk9M4oKJyowwijB1wqwaF7WgKf1WAs=; b=Oc1aFJH5Sq4J64JaSdn7S/vTnt
	jibOFbs5l7P1EWOmgOesqg6oXiNBxzDYEMnbX3AF/zHwFjwnd9GtFJkmFK/AXHtFdukX6RPD+Qqqs
	XRZMn1QKxZs/azyaJkJekhGQUlBv55dNjW05iMZC4Lxx+cfj9jTot0D3vQkBH7u5oPFsU6BOoOoo+
	sYdqLCfttBQjTMEaCDpaCGgdA0+FrdPaW4dInofNu7SOQCzhp52IT5azq64cR9HkxiXlvyyDgiP8+
	AEUgzLrGSH4uMeqCZ2Hw8EIHhYVF3YMSBvCMRPXa0XlHsNCHSoxeLDU8fS2suUEp1RuBdbCfYIGFn
	jNVMO3Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWXeZ-0000000D12k-0cSi;
	Thu, 26 Nov 2026 11:28:41 +0000
Received: from mail-eastus2azlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c110::3] helo=BN8PR05CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWXeO-0000000D11N-2DJ8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 11:28:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lLd8z7sTDPsnL3Yl+RrsXJBsNadMKHtKV+eoyiMACw1Mxlx/PX9+rBxBxEeFsHylKcvxkrlbDnPOyOoOjrKSyc7nIDKHSArT2/aXp2CjTd8M8o7tq7KSWmB6VFGaCU6U7uaKldIJk7yzcUxGkJ425rrZtZQQa+wISRh7w8q+gYhBf471u5gE4hNVaLlke5oH3rzc6jVyV1ggeKjc2Rqn5cbOpFdtuWGuMdMZkG6TYC7HmYJicQ1gPbjpkdDqSc839S2lt+fdRQOQ4zUt4LvQ3XhBvAC3vi9du0oYvH0Lu02CXVMuk82aqMXECiDrdELW9fz9HwxnXPnnDqBU5723Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UCc4VFep4IEKwOk9M4oKJyowwijB1wqwaF7WgKf1WAs=;
 b=j4OnCmc0WYHkUdmd+ij8d+wOhM1KY/s8L4zindnvirALRDUGMyqRWiPFihfe3vQ4bKFv8vO/P7O/jhAcJrtiu7yGtFr7RC8+AWK8aBj0+ZEB7b4V05NsGvzX1bGbysQ4Eu0GNIqZ/8XSUPJz82Sn6Mxoyn0Kuu5KESLHGHVf/+LaSq8CVNzPdvXGKvMMhGqheeq10DfUDKBlCcxALAljIseZ72CtlZW9TvpS39OsTXVwDXgY0DzkjeF0w1uxlqOgapTpho2u30p84ZhHgQj3QCJdS8PPumfIj7z/Rbgq/JFwoxbanGYM1GjVnuSsexb3r9riA0q5Q+bydxnwoU0qMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UCc4VFep4IEKwOk9M4oKJyowwijB1wqwaF7WgKf1WAs=;
 b=gCA6Z8ALDAiAikIdOdxB1P+GyPtnNrx/x4MvW17KD5DmqSZ70VYn3KdUdkYMoWsPzRe62T2NfqElMWEz5k7Xj5Q88uoLyuieLN//H0sNHE+epBsxpn152Snhs43Wb/yYcpN1fY34tO2V5dZB0J4/Vo5VydVy/9oNBO3tAMkcq0c=
Received: from CH2PR20CA0028.namprd20.prod.outlook.com (2603:10b6:610:58::38)
 by PH7PR12MB6396.namprd12.prod.outlook.com (2603:10b6:510:1fc::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Thu, 26 Nov
 2026 11:28:22 +0000
Received: from DS8PEPF000000E0.namprd05.prod.outlook.com
 (2603:10b6:610:58:cafe::4f) by CH2PR20CA0028.outlook.office365.com
 (2603:10b6:610:58::38) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.7 via Frontend Transport; Thu, 26
 Nov 2026 11:28:22 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS8PEPF000000E0.mail.protection.outlook.com (10.167.23.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.688.5 via Frontend Transport; Thu, 26 Nov 2026 11:28:21 +0000
Received: from xhdlc220225.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 26 Nov
 2026 05:28:18 -0600
From: Jay Buddhabhatti <jay.buddhabhatti@amd.com>
To: <michal.simek@amd.com>, <ajay.neeli@amd.com>,
	<sai.krishna.potthuri@amd.com>, <git@amd.com>, <linux-kernel@vger.kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, Jay Buddhabhatti
	<jay.buddhabhatti@amd.com>
Subject: [PATCH] MAINTAINERS: Add AMD Versal2 UFS firmware files
Date: Thu, 26 Nov 2026 16:57:54 +0530
Message-ID: <20261126112754.907756-1-jay.buddhabhatti@amd.com>
X-Mailer: git-send-email 2.16.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS8PEPF000000E0:EE_|PH7PR12MB6396:EE_
X-MS-Office365-Filtering-Correlation-Id: d67960ce-b61a-416f-3911-08df4bb060ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|23010399003|376014|1800799024|82310400026|261022105027099003|10067099003|56012099006|11063799006|261026121527099003|261026140227099003|261028144727099003|261021121427099003|261102123227099003|261009223027099003|18002099003;
X-Microsoft-Antispam-Message-Info: Do3DsH97l7yNRTjsYK5U+7XgHhxQsOYLaJyKxCbRVkXZwFJdzoCJn8DqL0hslhxDJwS4Q5XLZ4eVK8iL9BhxU5CRP4W8zRRzsZwD8LPMdbLwV3dUj67/fAAq8mG8kKKLadpwsed0hHYi8Xz7dW5evH/nPRYb4lMacgDSZ+nYjkX5SqAO95CGIm/VeWAVdZsvunfWDvNu/8u9DNgs+jGANc+Z5TA32C1RDhSCoK28zHIMtsyDQcfvgIRiCdXGazIEnzY3DHRBxhzuCpV9JZ453N8oJH/u+3fAkFMdWQWQaS+8IHFv8EnzIw3xCmvHWbRdAwv9sv0LLylef/DhWVshnjn255RnnB2UDsY9hW5QVhsN1RS9i+ZabA9uitoxRejog+LsSEDiSHus6+Kl9UMBcRxDPFObI2Upknk8BKJfETH+e72xRXGe01y4K+BP7scI2rxFZpGhgS4JYoBq6ipwJzP9im38KhUXQW69sO05K8gnlpfqI9GZWfl7+B+6rW8QDXc14YfkQzlQbGSeKX9CAht9fYHYvIAt2M9BP3NFLHF8Id21v65sH4T30becoJxWRCLpLDkXmA1uOCA00GQrvZXPeley12nIGDMZ3DYgBZUUVLiX3nrHo2Bq7/AKEtlOqFuix/1jkFhM9kFFgrLsanNtpfg0WXviuWLPOzf/oCiqjxAMWPtait+t9QFYa1E4RM98Z665gFVhALefXeOhLA==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(1800799024)(82310400026)(261022105027099003)(10067099003)(56012099006)(11063799006)(261026121527099003)(261026140227099003)(261028144727099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: MOtqP25PE7wXjMCgSwgbrs7dMB2m5kBEiMZcyRjmwiUt8N6mM5Y5015ZihRE6+3G0UbJ9z9tsMvhuBdlKyh/Jq2RK15p0e63Zhm9knyFYCLM7woU+xB4XulzaRlYeLfllka5GHUJpCLBEmDMm9PX0eQFqG76JXjruegKgGKmlJKpiwa8wwb0whrELrOkSao09ht7rYZ9Zq6nQEdAW2sPLTAz6kIFqtiLabBvOyY0QIPFz+sZaqnRLhdii+QrSkaKuM51TBTWS9eO98czJ0b62wCnyZNOXXvHilJbtVudzVuM3TB0KOga5iavesO1peoaaiMgYhS+HzBSmBPWpKOxMBh/PtNE3/mGe9X5aY66TyAv2qczTvn8zaq8g9iZ/gNyS0IFkpPh/vjUuYeNzPwpipz6D/1h83gCT3zrxOgD5GKR4LxJtA8WahLtIKXxe0BP
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 11:28:21.7391
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d67960ce-b61a-416f-3911-08df4bb060ad
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS8PEPF000000E0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6396
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_032828_596190_913B70A4 
X-CRM114-Status: GOOD (  10.35  )
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

Add the AMD Versal2 UFS firmware files to the existing AMD Versal2 UFS
host controller entry.

Signed-off-by: Jay Buddhabhatti <jay.buddhabhatti@amd.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 742c4e6b291f..3c0dcd9feb94 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -28818,7 +28818,9 @@ M:	Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
 M:	Ajay Neeli <ajay.neeli@amd.com>
 S:	Maintained
 F:	Documentation/devicetree/bindings/ufs/amd,versal2-ufs.yaml
+F:	drivers/firmware/xilinx/zynqmp-ufs.c
 F:	drivers/ufs/host/ufs-amd-versal2.c
+F:	include/linux/firmware/xlnx-zynqmp-ufs.h
 
 UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER DWC HOOKS
 M:	Pedro Sousa <pedrom.sousa@synopsys.com>
-- 
2.43.0


