Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 740A1606A33B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 09:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EjoBA5lY;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=PSoFoPap
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=vzpnFzwjfWEsLLsPnJugbzKL0q33uuBU4HJObMKkBHI=; b=EjoBA5lYwtm6rlH6lumSwtk6UD
	HAfC7yrfbMsUjldKi43ENGcMGF/yZ7LnXb32BrtbBgHddZ/czYrg5OVluHJelmlqNB4+h2z5TMxmW
	FBdbShE2Rw7EjCOTtwc0tS34rlHbE7ZUndrFkDDxvWGgGLP+yJABbcrStqR3W9Cf8msGdANF5lrfk
	dXunpHu9Neu7LG2paTP8i1uiK/qVpH3VfgYe4+TF/c4n/9vd97YKMYmfcSctlwdZBYu55ss9WBoF/
	zeZgbVUNampGFuXRXPZNtDglo1FBnewIHDnAMHhM8Zbe8tGwkNLaYKGukXwkWc2xtjzyNMxb4rPMS
	efB8as7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVmlD-000000063Ac-2ZXe;
	Tue, 24 Nov 2026 09:24:23 +0000
Received: from mail-eastus2azlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c110::1] helo=BN1PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVml9-000000063AG-2HfY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 09:24:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rqrw/RHE3mrY1Gh2i5za5osZkYU4sTXYcUlb15ehVPcyiOLHywbytMDYSyBEQlHLFeBUSPPl7myp96DkzfnUINOonhafPphqKn+eM0jbOTrrvKqfvJwoebhYcfJvQw2nwhHN/iRmTbwRVlYHJzlMIlUzj69EkmHiS7CJV/uy6f87qd5RM6sH2eMyIcPgkXeDHQEhTsbiau075WXCEP7OJzqV90zodxr+SJZjjj8k12E3Bkxr6jiD5FkdIq/YIlV47/AcflvO8Ma7cRPkMODJ/KQDoXOgizPz3fBm7KCFUElUc/tI9/jW453QTc6Y6tneddciGbxzIMiEjVAaROwbFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vzpnFzwjfWEsLLsPnJugbzKL0q33uuBU4HJObMKkBHI=;
 b=SGQX1rQDugIGaMA97JrVxd4e5V9nruu2yt0r3qIFffDhDKDd2FyWvzDulfPOM2e7fT4A2BPw0QnwL5Dl0aucI4Xbe85f2W7ppUYzajCNVbMhOzthTpa0JkW39JOVreO8NSlOqGoC8tnmKWEim1x2j4obrsSNwiDfb2k2EFeB9WfGI+AVNY1z1MmbdcMZFrdX0o+WH8CMurjFZ6UYUhEbth4AJ87mKQewnDHOOj12epo2ndnmD/XCVRw9xoCrQ8H3KHLePE5QM0/nzEH2EPpigKTzYLvBUjzgs43aF9ZLmGmwyKpxZ3kSHi3iNTfCPcAE1NWmMHeERwc6h1qWG829rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vzpnFzwjfWEsLLsPnJugbzKL0q33uuBU4HJObMKkBHI=;
 b=PSoFoPapL+xV73hBuvQWKZsCCEPM+WAXwiwRUiVofJ8hlZdO3WS4d/MDjH5mkJ/OnOvsM4Ff9V59iI2qRoRsdrIljiN4UWkVKxv18HLOgbcJvjuIK8rcJdkbOMruY5ZUrjP0tkB+yajMOuxSh/CRM9usZB2jQWU5et+w2aaCrWE=
Received: from CH0PR03CA0349.namprd03.prod.outlook.com (2603:10b6:610:11a::33)
 by IA0PR12MB8349.namprd12.prod.outlook.com (2603:10b6:208:407::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Tue, 24 Nov
 2026 09:24:12 +0000
Received: from DM3PEPF000265B0.namprd02.prod.outlook.com
 (2603:10b6:610:11a:cafe::86) by CH0PR03CA0349.outlook.office365.com
 (2603:10b6:610:11a::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Tue, 24
 Nov 2026 09:24:12 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 DM3PEPF000265B0.mail.protection.outlook.com (10.167.23.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Tue, 24 Nov 2026 09:24:11 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 24 Nov
 2026 03:24:09 -0600
Received: from localhost (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57 via Frontend
 Transport; Tue, 24 Nov 2026 03:24:09 -0600
From: Michal Simek <michal.simek@amd.com>
To: <linux-kernel@vger.kernel.org>, <monstr@monstr.eu>,
	<michal.simek@amd.com>, <git@amd.com>
CC: Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, "open list:OPEN FIRMWARE
 AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated
 list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH] ARM: zynq: zc706: Reset board on watchdog timeout
Date: Tue, 24 Nov 2026 10:23:56 +0100
Message-ID: <0fbccd782427bca181c2f563aa4a91c973d397ca.1795512234.git.michal.simek@amd.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=798; i=michal.simek@amd.com; h=from:subject:message-id; bh=wZyowtHRwKutzupiSIeG4pzLqLeftCOBRPVQjR/Blbg=; b=owGbwMvMwCG2mv3fB7+vgl8ZT6slMWSzhm9aUqvzdpbuyYVa6bMUt0/nktj/Tujtjg4X83MmV /JT65m8OkpZGMQ4GGTFFFmmM+k4rPl2banY8sh8mDmsTCBDGLg4BWAiBs0M/0tmib/at72a90Cz Z6tE5WebyC0Moddr50zaFdHu1Lvu8CFGhpcxO3eWTf4fv6Lm/NbTIu1XH6etynlvHL02iNvl9of ZDdwA
X-Developer-Key: i=michal.simek@amd.com; a=openpgp; fpr=67350C9BF5CCEE9B5364356A377C7F21FE3D1F91
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PEPF000265B0:EE_|IA0PR12MB8349:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ad27ef6-784e-41e4-fed3-08df4a0cb35f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|36860700016|1800799024|82310400026|10067099003|11063799006|56012099006|261021121427099003|261102123227099003|261009223027099003|261026121527099003|18002099003;
X-Microsoft-Antispam-Message-Info: sZEGrU6TqFYPuP/BPxfrkLr6S0G5bVAz15kqnG2EOcYI1FqvAEMz8cvSVcbcBbgrPcaGR68YXszXQSdcLnPptcE8nUW0b15gcxt4Iap5EAKpc741rRUTahxD6agUzFvdLrbdZsiNqNi+4jrVrUuQkaUIu192CtuS9zrM9DUWk3hjBI+IJflHEReSF1IbQhRW7AW504sNkJQ++UcDvvaj0Niy4MAXK+HhpurEbKsKW3riHTXEnKN3qwXokDlkGD7RDRCw8ELHmRzyLWgUyzH4cnh4VH0aU9kM4OCUKlr/bWch1XXKJeG8OQE+nxw6mygshtFkd9kHSfwq9GO7Gvf/DtpCXWchl819/3ikT4SKXwSE0t0Z0XFIxYpd1F7gC3QWi/sSV+T810KFk9SzomIDveRGzw4NUKKPG35RcYKenC3TYY1MvBSQVCngVc/rKxypmbWWgKiU0pSktq2HjjJUrz7VZqRcDVYHdYSmZLk7BCw9/8ak0IZ0/jOulFokz36uO2zNvnW9t28J3oGxeI7A3xfG3fBR0mwUBqCCP45ZW7f30sUk5DzqcAIeBHzmDSRwpXYcfMylSvAun1wRY6g7abQ4LtDMCNP1dsgXXHY2MrEbfmefJVRJGHQuDDwk4Qt5eSGoKr3ksnNWBtfH9R3aX31pXZmw+S4yolW5Ie+7x+RLKerjgo0RSqgYJzVVjvp1PIZf1xhIdRn6G+u0esR33A==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(36860700016)(1800799024)(82310400026)(10067099003)(11063799006)(56012099006)(261021121427099003)(261102123227099003)(261009223027099003)(261026121527099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Jc247t/sNvSF0jYfvnEMYjiddCZuvV+nWiNowYEpbO54JlKxByqBXrN6MOcyjMSxYn2jLLSvD2/Vy6Uu/gwio3nrzHXvlPf4s3GrqGkU5yLR3e9D8cRPJGUGFRAHSLmcCeM2TuVhkaSbFVLgwqHo63v1OG6bOkcyO/R48HVdpcYXq5pUNsigzeI/vZcDbVpiBrkmOzja250/wvdpfiq/fIsRok28aq0Rn69JUWZ35EMjRlKAQu3zVB7gEl/X3sTMpPV2WV2lUw1nczbvwWeRWB8Hd/ZKkXl/abLKM8K99qh9BAa4ARSNDp4nXcWRXsdap0RaKYocIg10B60mAKjezTJq+Z0BCfklsCrGIFB5hMJsVvmVCZgEc26G3xEz4OdmJuS0ih4Jhk893wuehzp73bbokHui7pOjaM/g6z8w5GCCfrfq4wT6J//3SBjI8wCb
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 09:24:11.8950
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ad27ef6-784e-41e4-fed3-08df4a0cb35f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3PEPF000265B0.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8349
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_012419_581945_ABC836C0 
X-CRM114-Status: GOOD (  10.77  )
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

The watchdog resets the board when it expires, instead of only logging it.
This lets the board recover from a hung system without a manual power
cycle.

Signed-off-by: Michal Simek <michal.simek@amd.com>
---

There is no any other Zynq board with it that's why enable it to have this
mode covered.
---
 arch/arm/boot/dts/xilinx/zynq-zc706.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/xilinx/zynq-zc706.dts b/arch/arm/boot/dts/xilinx/zynq-zc706.dts
index 1ce35eaa607b..93b603df346d 100644
--- a/arch/arm/boot/dts/xilinx/zynq-zc706.dts
+++ b/arch/arm/boot/dts/xilinx/zynq-zc706.dts
@@ -363,3 +363,7 @@ &usb0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_usb0_default>;
 };
+
+&watchdog0 {
+	reset-on-timeout;
+};
---

-- 
2.43.0


