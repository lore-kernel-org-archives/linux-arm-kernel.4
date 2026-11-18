Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7A16606A334
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 10:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KvofOF+7;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=EOYbGoE/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=zZpuBE8KcTUxo+9gMmuk7Zt6g1OeOP5dFrwFOJ+0ndQ=; b=KvofOF+7vOqxnIpXDPXJ7kBY7s
	IhWr1JwIIQSuofRRjlVSaJJzaXcW+nHJl/tX1P54RtIUs3fyLkvWzupXFXSPEsj2lHjmk8EuHuKZY
	9dUYNhawBihTgtAT4y5GYkhbOMQ+R9+TnnxOuhdQlPktOFLN+xWdRb8pqjvYCxI2T20y3UT5ZaLR5
	WY+ur+gbrGsnZwN8BmGMRgDW0poB9jf03V7KWtT7xcntShqqh0xF793QiHEKlAEn/+Bl88Ahq2iQm
	xtSecvpTWq11dGq0j6W88mbsLMO1FVW6akR5nkKCJ1/2QRuT+/HSGcpfN21kTaVr8uIPWUnvM/tlm
	m+QEJ0yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTd2E-00000008a7d-1vJH;
	Wed, 18 Nov 2026 10:37:02 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTd2C-00000008a6R-1AZ0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 10:37:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KMWkPsjoPfm8EfRqnVuPy5DtG0R14Nu17CKGsFHYud0mncAgEvWOQyGX5n/TbK/fURU8j1OAMCUwt33LrPZc+8WiJgAU+f28l/78nHIc5cl0u7RgxX6g8zYXURuwO6ztb+oRx5Lvi3F507fhIuY8ac/IXKDOxI/NJe4T0n/eelvc7fEoXjlVH6h7B0/JVi6m3iBppgTWWS67NNGdGoAWOjYFaHde7XSnx34HeJCsfP7s8tfSO01rGKUSKdwUJ0duF/JhvQmv8EP7gnMgJMkUwXD8nH5x+GwkdNZ8zoJ1tNaIA3ko5cz23eGKjy40m6Wb7/TfLMPfIgbtyR8WXhmbLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zZpuBE8KcTUxo+9gMmuk7Zt6g1OeOP5dFrwFOJ+0ndQ=;
 b=HMgf8RE5UZNi0bHVGWWyvE9ckzUF4DroLAReMSz9708ZU/jpVV9Pg4bOA6cYf13YTjwrsmwreHBhzlRV55bBHNVpMOLmyrC3htyXZIAoE9r62fTp1ABVNOHiTcerfNE/JuTFx6zxPqO911AIPcoe7vfZoSKVeSKNRSzk70w72OHdq+fHuHPceG6zTu20diBX00b95fH7Xak6hKyj1urZuHuLclQwPk8GqFW5snmeqith+zFtv1KpZitag0d/rH6tmeatqPCTAdcgqhbCePJazzqt1Hd0W/oAFn6U+K5PdyHeX83Et9J+IaBXb1jTygzuZvZHM7yXXvSdf15DpAEYBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=armlinux.org.uk smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zZpuBE8KcTUxo+9gMmuk7Zt6g1OeOP5dFrwFOJ+0ndQ=;
 b=EOYbGoE/tGsZq2gvZpHvxEqScQbuCzJOQxlmj9gsEwiAMe6qeERbKcZzczvnlz78PXrFxMMt4pWO+xOWyGTQt6IOAiLMRZ/gURfE/Sjr1uea5Xp5vKpbKrItB1bejx+BSi/PGYCMo56WfMIrKWRbpoJVXz+LyVf4gjkQIhOxlDdb7CXm4oMUQO2U1eo0OgyxIETVtcpQkHxY3ac23cNiLrAyAh7IYH/Hq9lo6hRZfcZsJGk71e2sfkijKEyvS009RoWHEUJwt5nIsPiVNNAxP9HGFJBEPijJ0a5MHpDAf/iKWxHViHmE1BPLQpMWITjjhAWXJxAoQ4sSTBXQZfMtwA==
Received: from WA2PEPF000008A6.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d8::64b)
 by PR3PR10MB4142.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:ac::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.8; Wed, 18 Nov
 2026 10:36:50 +0000
Received: from WA1PEPF000099CE.eurprd04.prod.outlook.com (2603:10a6:1d8::166)
 by WA2PEPF000008A6.outlook.office365.com (2603:10a6:1d8::64b) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14
 via Frontend Transport; Wed, 18 Nov 2026 10:36:49 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 WA1PEPF000099CE.mail.protection.outlook.com (10.167.242.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 18 Nov 2026 10:36:49 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Wed, 18 Nov
 2026 11:37:33 +0100
Received: from localhost (10.48.87.124) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 18 Nov
 2026 11:36:48 +0100
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Russell King <linux@armlinux.org.uk>, Krzysztof Kozlowski
	<krzysztof.kozlowski@oss.qualcomm.com>, Linus Walleij <linusw@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, "Kevin Hilman (TI)" <khilman@baylibre.com>,
	Eric Biggers <ebiggers@kernel.org>, Parvathi Pudi <parvathi@couthit.com>,
	Andreas Kemnade <andreas@kemnade.info>
CC: Antonio Borneo <antonio.borneo@foss.st.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>, Guenter Roeck
	<linux@roeck-us.net>
Subject: [PATCH] ARM: multi_v7_defconfig: Enable ARM_SMC_WATCHDOG
Date: Wed, 18 Nov 2026 11:36:44 +0100
Message-ID: <20261118103644.1360527-1-antonio.borneo@foss.st.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: WA1PEPF000099CE:EE_|PR3PR10MB4142:EE_
X-MS-Office365-Filtering-Correlation-Id: ac8edfbe-c44b-4b81-c67b-08df455fda1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|36860700016|376014|7416014|1800799024|82310400026|11063799006|56012099006|261021121427099003|10067099003|261022075727099003|261102123227099003|261009223027099003|261026121527099003|18002099003;
X-Microsoft-Antispam-Message-Info: 5OMyzP0gcKemMF9GM4dZANDH8Ey2j2FwSMu7N33qd8O2wpVhBd3F2X1OLigC5TKWswAUIGGrE33xvALDAX+0NViKu+HjP++W71Yd0jyvJqohnXLlBRDad5MXw8oDL/zuj+3un0Z5RMkof6Ptc6ai23kRe5TMm8Gr4uyembJHE39fagS15gHHXYhn/59Ii8zoNOWqVI9DRvmX/vAvY2Zsisslwr/bGCLqMXLjxQMcj6RdTmIoiwa5vXDwBlaZ/U0y+xzElmMAq7LuWQQ2OH1JxDqZE0+Dx89jBG8cAeXQjQ7nTEm+sVDkK5iczFpnKLCyVRM77TxeJdiORAufPzQfhMh3kRhM075a0JQMbYnC9DXfigVwysgAVYDiQQmJpwubrZNx0pdOAwydLMiuj+84AT5ZFtqfWj2lI+YOX61MUEG8JciKrkyv88ABBCBDVdW1CODLLP2niejGFt9cV314L85NsbuWhuyxwQFlKqbuh1Ssz9rf/yBqM5oPELGCQDm9rN2dUeAapxd+eOIz2KTERY8z0jkh9FVXlfGib5zw8KPRl8NLEL8cC4pAv6CwVYmU+Rug3qQcrCkehb6Gd+LQ4smMRn+cqUugSqmgpUB8cAjM/URUb5tjbyMzCCT5bgU8ACptAmJMPQ3lAm6DedZC+AEBbtwvEVJdZh7ZC15liHtc/NHzTrnCU+yCHIKDEWkGw5m2vsuY3+xLw00bhwWENQ==
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(376014)(7416014)(1800799024)(82310400026)(11063799006)(56012099006)(261021121427099003)(10067099003)(261022075727099003)(261102123227099003)(261009223027099003)(261026121527099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: jhAzDJAsJZ2JM8vaKccxHwTlgD4neXQQg7hJYFNDZ/nGJm7nrNylfRx0KZGm9MftsyRoMrv4SCoigl5DKGHFWIvIfUUN8m8ukcCn9VKejZ6Y57rIB+W803QefNFzjFZcQDvsvzNu4Gr7QVGHIbdAYumEY5oPZXPnmTjp1PI/U2LuedYIF1TMgpYeEC2/wULHmIydUMe1netYP45gKKmNzJ0LslKmY9galLOU1r+RP3Gkk0VENHJ3OyVBXGVErEI7Pv0i7VwujO22IRewOwpYwIaLnCS6BmWcMBdcHQtiY8h8uHTu2vnh0u1bn56LG/917erh7nhYp9ltxfVyLuPB4R0XxgRYBzDkS5HCT2S5wmzhz9xwullAv7TJjhfEeelJIRdtrCfa4mVw1p79M7qoU7GAvKYacd0J0oVPYE4QMZJn8VwzYe8HYHrWfnlOJyPv
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 10:36:49.2355
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ac8edfbe-c44b-4b81-c67b-08df455fda1c
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: WA1PEPF000099CE.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR10MB4142
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_023700_596673_98E9E03E 
X-CRM114-Status: UNSURE (   9.59  )
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

On platforms STM32MP1xx the trusted firmware starts the watchdog
IWDG1 as secure watchdog.
On such platforms the kernel configured with multi_v7_defconfig
needs ARM_SMC_WATCHDOG to ping the watchdog and prevent a reset
during kernel boot.

Enable the driver as module in multi_v7_defconfig.

Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
---
 arch/arm/configs/multi_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 069d5a49f01cb..4d463608c3b6e 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -581,6 +581,7 @@ CONFIG_TEGRA_WATCHDOG=m
 CONFIG_QCOM_WDT=m
 CONFIG_MESON_WATCHDOG=y
 CONFIG_DIGICOLOR_WATCHDOG=y
+CONFIG_ARM_SMC_WATCHDOG=m
 CONFIG_RENESAS_WDT=m
 CONFIG_RENESAS_RZAWDT=m
 CONFIG_RENESAS_RZN1WDT=m

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.34.1


