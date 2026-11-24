Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BF46606A332
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 18:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UhlY0cSL;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=SDuX1jxa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=C5VXzf4Wa1lhX2ksPd9/hpcbYb6TN8p+z49lAEiFxys=; b=UhlY0cSLj/ioV9
	kkXa5H94sWtUblSoHR+DQiL0/x3nBDnUxv8SAh8Gdvk6g0Al6a4muuvw39xucELbQ5zCdk95F7ERG
	F1henUiAIVmY6tHFs75jvWE82V5QggTcbVSSepOZsF/lQGCFoTI3bIXiuWUriBU1E404xHSSoGWHY
	Y0X1cZIfL3NF2YAANeXK6H2EPR9FsQQRRKpanr5/iXjF120y0ko1Oc6UPdvpcXEXk7tXWmhi4w6BN
	L7RhnANTdRB47Zfoxn+vCvQTAihtIvEB5/PTtjnaiqnM/y+gXUreGTN2nlXV1ckmvERk/+KgTUDcz
	/NeJKXpqS5wQAO3sJxnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVtgx-00000007BuS-2tIw;
	Tue, 24 Nov 2026 16:48:27 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVtgu-00000007Bpr-0Fl2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 16:48:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ubsepBzDP2YIuhM4y8eucSmXI7KrW5K9ShLwQHyaO2VjAF3+p2rmKFYW7dLHgtDrA3kq3+8sI+4gLC5Lrtnr1BNBNFnaaHAw9gDHQVNebEuKHWSBCUcunPcmNbNAHuwf/BBrYZeou2byXUMbIY7weiTFDGSUhCMeZ8UnArPoh035+qhebIMjz7he7FRTRv7+tJR3WQGy6kbTIuWskT1pivinVu1bxzi+/7O9iWeJ+2OpxXWASySwzY5xJDLnnznohVh9p5EtIiB7ry6oP2iYten+q3575p94hekIp5hvj6luL9aqB/jHbNMUiBTcd6NcaxxBM5fpw0yWG9I5MB83Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C5VXzf4Wa1lhX2ksPd9/hpcbYb6TN8p+z49lAEiFxys=;
 b=Qi6QHVapXfizyrSjYN1Bbu/aF69bQf2TKMWOHrdyneME+u/FSSWHyLlBxifVC+nwvMlQN9MVAU4EBE+zQVL0ZpPBpyadi7TQtSTVMHgiMAwTXYO6QeF6uyOXHaRsLO4adBoyCOoZM5Tjp/jl8Ancqul+jKkmaqm+/4mFotG+HuR7fAqi0YtxyU2lHQqqJBN0S5zw65WUlydMXwYkZQxIkUOeEmZmKx5NtRab1Z/BF9flpynRlmkjUxbYCNzvpGWb4EJ3dl30/eIZvLJVHXidiNLtidqwTefRldDjzaFDDpSKBgmxOTUE60BXM9Dq9n3uA3lXyBt1FZ6C0kF4kFoA8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C5VXzf4Wa1lhX2ksPd9/hpcbYb6TN8p+z49lAEiFxys=;
 b=SDuX1jxa2BxFU7YRWjCDIhvcr0UvMmg0F6iimhgsuQZWIFCdVhH3P/pGW1A+12JksR59EOlwwdhzR2KKaUl93HsrhetsyxhfkRctfoQCGRG0uygNWBvsJRRS7/e3SsdrdT81pDHzn27lxjQJQFa9+JRi8yTQzN2tOrrYexb2J/TojHdaUvK8yMpP+qAxJjXEsj/gN/9KBnZazKZvfo81NBCEEw3MS4s80u2mrnmscrO+qM2nTtYb5wJcpUopu8mIZARpK9dI4FPtfd2DOKmJbtGrKogLxNGFkFsNY3xN9lNZ81etLhpWkbn8pgD2cVfCfpag1eogL71ls1h40P28Zg==
Received: from DU2P250CA0020.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:231::25)
 by GV1PR10MB8369.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:1c9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.4; Tue, 24 Nov
 2026 16:48:18 +0000
Received: from DB1PEPF000509FA.eurprd03.prod.outlook.com
 (2603:10a6:10:231:cafe::26) by DU2P250CA0020.outlook.office365.com
 (2603:10a6:10:231::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.5 via Frontend Transport; Tue, 24
 Nov 2026 16:48:18 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB1PEPF000509FA.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Tue, 24 Nov 2026 16:48:18 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Tue, 24 Nov
 2026 17:48:44 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Tue, 24 Nov
 2026 17:47:45 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Tue, 24 Nov 2026 17:47:42 +0100
Subject: [PATCH v6 09/10] ARM: multi_v7_defconfig: Enable NVMEM_STM32_TAMP
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261124-upstream_nvram_reworked-v6-9-ea0cfccc20b0@foss.st.com>
References: <20261124-upstream_nvram_reworked-v6-0-ea0cfccc20b0@foss.st.com>
In-Reply-To: <20261124-upstream_nvram_reworked-v6-0-ea0cfccc20b0@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Christophe Roullier <christophe.roullier@foss.st.com>, Srinivas Kandagatla
	<srini@kernel.org>, Russell King <linux@armlinux.org.uk>
CC: Simeon Marijon <simeon.marijon@foss.st.com>,
	<linux-stm32@st-md-mailman.stormreply.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Patrice Chotard <patrice.chotard@foss.st.com>
X-Mailer: b4 0.16.0
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FA:EE_|GV1PR10MB8369:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a86d388-bf57-45db-ca52-08df4a4abe21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|1800799024|23010399003|7416014|36860700016|22082099003|18002099003|261009223027099003|11063799006|56012099006|10067099003|261102123227099003|261022075727099003|261021121427099003;
X-Microsoft-Antispam-Message-Info: EXu+dJXvXd6jObsZa+eg5whq0Cm/84K7pHCHoeu5dZCSM5MPvVLRk9iU0VaiJViNlXwrd3zEJFnOTT2JTU8GnEqiWc8RMwmfdenaulY80dlkL1gEnW1v2LtO+T8FdaZJNEc8OQciOYr5TKqNvKGF5AAjCQKa7D4jAIjUHY0QO/19TWGrPYoiIPmgIHWZhskx7H0F4QYbODtGMjBCWg+uKO4HEJoZ2ehQNTnNTRcRX2ZyoPAKtBy7Dst8z/LQ8x9tE670TZYhjsYqs22RAdKoyK36FlyPW0LVXBukMdvsds51fE3kNHAhPS7vlbXrb3nJFTsnWrRu7O1tqXyIat4yL4nAf5VQaIjKsAarnLP/SxjcPSYoCHVFR9g5o9kjtAo8HtW4akq3UA9m5jLAgLXGud9Qs66MZY39/M8YiykpCCTETiGkc1yizy52HXMM98ujLD0WcygORbPur7Cws+yCPTzQNFUWfgWsYVJ4PbOSTApYHtUl5K+EEv5vjO7aLAXrzE0kuROsj5ohemyX1HS+03YRi8ry0Vxcs3vTbw8XFG9DyECkjjNc3QOHsL/vr+V/E7S7D5lKaeBhDBgNgZ+m+nQO+Jl94nXEP2ZRY3n6P7/yzH84OTuzTpy0p4Bx/sT63XCGIGpGjUP+GCUs3bircoRccuytxV9C5O5vfPf43xaiTBjiiHbPn2GNrau8IjiTLIeWmLaEk/XyZhywNWFF8Q==
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(23010399003)(7416014)(36860700016)(22082099003)(18002099003)(261009223027099003)(11063799006)(56012099006)(10067099003)(261102123227099003)(261022075727099003)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: qgPmUok/VpgsziyVNbKFNH9ZbBDJJwH1WPno2RR2vdALXQlBnVZ58QOLcP5eVc3X/DBPPb/kQuqZI5e6tOcIt4K/G8mmszbAbzAkjXb+xm/aiiqkyn1ND2/TOtcrJplmnOBvC/+H3sudSib3W8uf6m8ya06b3+Oa0Ml8L5wIFpSyqz1nkxW3Jsu3qsYEAp65s4wIr0P2VyNCGx0zdu60iPUTuEOeIchFm8zTtOuNBjproV6XvzcpTSYFVoCKzyVDeClBu2Lb8Pju/cK+Zd33+/Kc3g9yOuNg9RJ8VAKbJ0bIbDRa8fj/NlxGE2OKruizu2boOZlJiCflj/Z88Aj1+CBp3TEGIE95CswFQpISS3jS6ypeFzWq54VjOhVxjwwxvcEpiMS0SNs46bnjv6wy5rJsVMgEYKwGTdkZ3RNdnW63fTiZ7urDHY7N5nc49hWE
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 16:48:18.6711
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a86d388-bf57-45db-ca52-08df4a4abe21
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509FA.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB8369
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_084824_129375_0FF33843 
X-CRM114-Status: UNSURE (   8.14  )
X-CRM114-Notice: Please train this message.
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

Enable stm32-tamp-nvram driver as module in multi_v7_defconfig.
This driver is needed on STM32MP1 platforms to get access
to TAMP backup registers.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 arch/arm/configs/multi_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 069d5a49f01c..5dce10ccbfc0 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -1260,6 +1260,7 @@ CONFIG_NVMEM_QCOM_QFPROM=y
 CONFIG_NVMEM_RMEM=m
 CONFIG_NVMEM_ROCKCHIP_EFUSE=m
 CONFIG_NVMEM_STM32_ROMEM=m
+CONFIG_NVMEM_STM32_TAMP=m
 CONFIG_NVMEM_SUNXI_SID=y
 CONFIG_NVMEM_VF610_OCOTP=y
 CONFIG_FSI=m

-- 
2.43.0


