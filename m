Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A37C606A332
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 13:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=djSienns;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=GIF8codQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=k128ZcR2Uar3siuYTAuf1rHHRp9uXYO9JcYIwAYL+FU=; b=djSiennsct/WjJnahl0ktS94Dm
	qkJxJcmL4dMBoC6ZUDkcAyt/QCCQeEWf6ThPQUEQKnidkQb8UxXD1GoHdRiOKCMgRecpnXSP381EK
	9zIHjnG/aFQ544n7rocUbbDEdCKnwo6tjRrgOOZ3fBeV1GdqB9tcimUJjS8fO2vNqOV1NtY4QsCLE
	vQWCaibo7sEeZKmVBcyzdPwbWXWjJWh6233ob56g0QFMcXLiKWA67vQeArpj2a3zJW7KN/nwp8/1+
	H5NXib3PgsIhjGyM8hac63o7pnis0UG9M1Rdov7DNSuwyDxV5St540GorIC4hqIKEzLcnaCm/9AWg
	iQIWnMGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSwhP-00000002bS3-3SdY;
	Mon, 16 Nov 2026 13:24:43 +0000
Received: from mail-northeuropeazon11010067.outbound.protection.outlook.com ([52.101.84.67] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSwhK-00000002bMF-0RWn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 13:24:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n7rJz4dS01vI3jBpWj8O9CwP2Cv/S19T8++YrtuGyXD0LgNSTjlIW5dAn6uppYs8dYDtkeguVODeXI/eFFrQFmoOEcqMaJDJRpoHdwDSSZhhchLVZ7nXay6DnpQ2hJR35OrKOibupkCpJR6JczTs+O7fh4ajAFkGOCTsLsw+RC87RXEigwqlP2YGKtf5a4mh1iIIEMApuIJpCJdE7dpz5xIKtUFMT2w547fTYfd+UP15ekCcbT6A8CGA6br1g17eoJBuLdsQklXGCpRSeNWjxBNsfSAFq86oh15eV97twvx7m7PPDLyB8o2XSJZFxH/ofe1YGbBrtkHh4a/y0Z+InQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k128ZcR2Uar3siuYTAuf1rHHRp9uXYO9JcYIwAYL+FU=;
 b=vJnfeQXTupz2YdsIB4b7bkmlC9yh2Xk51aNkHj/wq0pg1FX3cKrB7BTfiudJSZLZwBPQmOqPFmaree1zTqmfV2x3g+umSHUZG8KcrQ+PzONTFcaM8X25xogtI6O0xc4vnpsKDxurVF7A3ZVjU0w3QZ8fZlET6evmu7u1iWjWHpvsbmiFoWxvVdyNR604i9jS2mnYvfOuOG5AnZfHkXhK2BylcINrn9+uHCTtLBdFeyKnup/aP24adlKe93eTa4ZyzttS1RQ4CkL9lUhEFge4yE3VlCAXp0Lyt4lcbJVU76eKYl0fBETipzLbtfCODgBQqPYZ62EA2OA9s3qBd48oiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k128ZcR2Uar3siuYTAuf1rHHRp9uXYO9JcYIwAYL+FU=;
 b=GIF8codQYF5evsdC2eewbj9BxCHIX39RQY9JLWEbbTdfTxh8Eip3DXsND6FwooJhfzYNsPM0J6peyo3D1MVHFCn1eVPQtSQnBs7mUxdU1ChKPjzER1W6V2dw2sb60IN9aN05tEfZdyDSbKWC09UAyCprJ9teaL0favBfDlGU0PijTGDnEtkDlEGGqwxvQqziXuwo6UxqPm1nOhtkYQNnE7hjh9LlK5ZSEN7MHxdC0JMwNd29s89fsaZUCfNSts2e0J7icsTzFXrFlbUYqzQATvfHagBC/pxm7tgiWtRLFEYKJKM/Lut13WVGcJfBQvNL+iqdDPnKt6QriZ6dz5kqUQ==
Received: from AS9PR06CA0222.eurprd06.prod.outlook.com (2603:10a6:20b:45e::32)
 by PAVPR10MB7162.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:314::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.6; Mon, 16 Nov
 2026 13:24:28 +0000
Received: from CPH1EPF0000052D.eurprd05.prod.outlook.com
 (2603:10a6:20b:45e:cafe::75) by AS9PR06CA0222.outlook.office365.com
 (2603:10a6:20b:45e::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Mon,
 16 Nov 2026 13:24:28 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 CPH1EPF0000052D.mail.protection.outlook.com (10.167.241.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 16 Nov 2026 13:24:27 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Mon, 16 Nov
 2026 14:25:07 +0100
Received: from localhost (10.48.87.124) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 16 Nov
 2026 14:24:22 +0100
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Russell King <linux@armlinux.org.uk>, Wim Van Sebroeck
	<wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, Yannick Fertre
	<yannick.fertre@foss.st.com>, Christophe Roullier
	<christophe.roullier@foss.st.com>, <devicetree@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: Antonio Borneo <antonio.borneo@foss.st.com>,
	<linux-watchdog@vger.kernel.org>, =?UTF-8?q?Cl=C3=A9ment=20Le=20Goffic?=
	<clement.legoffic@foss.st.com>, Amelie Delaunay
	<amelie.delaunay@foss.st.com>, Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v4 06/15] ARM: stm32: enable arm smc watchdog on stm32mp1xx
Date: Mon, 16 Nov 2026 14:24:07 +0100
Message-ID: <20261116132416.1184447-7-antonio.borneo@foss.st.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261116132416.1184447-1-antonio.borneo@foss.st.com>
References: <20261116132416.1184447-1-antonio.borneo@foss.st.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CPH1EPF0000052D:EE_|PAVPR10MB7162:EE_
X-MS-Office365-Filtering-Correlation-Id: 91c5c8ec-b6d8-4ba9-f2ef-08df43e4f0c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|82310400026|36860700016|921020|10067099003|56012099006|11063799006|261026121527099003|261021135927099003|261021121427099003|261102123227099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: NyqUWPRNm0Z5/6VVX7stYFEXmr5kv88aJ/5DxY3zHDuLG7p7yhM0CGzLgpNxwCg1qg/1XfcDxsO0xlklwXjpauMUR6xQND1JgSjCrwyOKnM96pah4HxVLUKkpl3K2e5mAjGdIzlZVUam4B9kz0MGHGVU/mhasILebzO70KPA83+jDpoHMsFomWWE5ixJ493tgbJZx0Za/ZQGwC55gjwSM5lN9aTBQVMf0ucDSNZSfE1cLg9vtCaxFI2R8TBtGFBNL7W1+SLaKrU8T2L8n58syHNatvKjFCsFFIIW/wHPR/ZhODdxLiB+cRhpPD+sAna2PTB0vPrGiRuJ9XalNRjXKZbN7hKRzgn0zeCctPTqXJx7Lx2/NIPBVCRyeZsX3RZ38SiAKVBnzsM6rBa7h0gMIwbDET5I/eBQDYa5I0lJ3Ao49eCH5cUiYFghTdymNsOVy/d38r58EiQEP9Jg7fivaIf7KwVAjlk5xY46HO9E7luyygh/7bhFopuuRkIAdKam3vD1A6cDKLh1tyJJGomr9RWV+fr6kqtt7wcZGzGey2CAN/TsAsrwElX1+dJmfiyqu8LUem3SfZ3uvk1464gBn/IuduNdD61S/bpL1xT96k5q0gMwI0pCPJ90RZNRlUD5iGL4Fk1tf8Jq1xXI9v+jQbn8LM6+XoPn9neR+GlcUWEenNjKXthEkRaofs6JZbGSR5H1i2+aglKDluwycJymhLz9K22e51XvNOFy8zUhRoqKPrZO0/Kk01HrEgIJzwTr
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(82310400026)(36860700016)(921020)(10067099003)(56012099006)(11063799006)(261026121527099003)(261021135927099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ZTmdgFobm7yc3IX/lEhKfQsXadj24asEILmUEA1bL6jaa7IZL0XNlfPtPabEJzmgpmdLdqx/e8Wcr4v96PM3ZgPFFq12HYJF++X8x2bralytDuuvwVfQPUsWaQJRx7Gou1M/5AmucjPlgI7q8X4y3FMu3oiuT/071jJNuYKg8qz9zgXTfRN8IqGlssuBrqDmqoaIVDegIysZ/6Q7UeG46v6n5d26AUthDCM6H5Vtz5rghmP6nWmK0Adf7O1wUtpy05OfR/YdisZzpmLZ4cTz2BvaoZKlXJsiO2/h/EfLmON/CFziBlqqHjJ2MoZ9Zkuqu0xg7g+ZtsCjpIGN9xzVc1DpUx9TydqDhtD529Ss2C2LdtK2mKu1YhoZzXk4MKtzl+pcxtZMzZ2belR9wCVXju+8ZuJIWlH5A/eXAEXxzAG8smiFTy0xGA3AzhWaTdJX
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 13:24:27.9762
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 91c5c8ec-b6d8-4ba9-f2ef-08df43e4f0c0
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: CPH1EPF0000052D.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR10MB7162
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_052438_167912_3C67EA2B 
X-CRM114-Status: GOOD (  10.61  )
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

The watchdog IWDG1 is secure by default on STM32MP1xx SoCs.
On boards that keep it secure, Linux must use the arm,smc-wdt
driver to ping it.

Enable the driver for mach-stm32 when ARCH_MULTI_V7 is enabled.

Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
---
 arch/arm/mach-stm32/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/mach-stm32/Kconfig b/arch/arm/mach-stm32/Kconfig
index 4ac3384e397aa..de09b2afa0f2e 100644
--- a/arch/arm/mach-stm32/Kconfig
+++ b/arch/arm/mach-stm32/Kconfig
@@ -13,6 +13,8 @@ menuconfig ARCH_STM32
 	select RESET_CONTROLLER
 	select STM32_EXTI if ARM_SINGLE_ARMV7M
 	select STM32_FIREWALL
+	select WATCHDOG if ARCH_MULTI_V7
+	select ARM_SMC_WATCHDOG if ARCH_MULTI_V7
 	help
 	  Support for STMicroelectronics STM32MP1 processors using Cortex-A7
 	  cores. Note that support for the earlier Cortex-M based variants
-- 
2.34.1


