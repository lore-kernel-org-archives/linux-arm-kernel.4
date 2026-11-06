Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79027606D80F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 16:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XWd0FVdX;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=WGvzzg7n
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=x+x3myP3dhgp56Q/KxWhhIcXg+i8PROVfJPxptEdG3Y=; b=XWd0FVdXviXqXe
	r5jDnGckTuXctd9OCUqqloruoJyv2XMIOOALvSqoXD1AJmVMdre7RmzaRySn//kOutFY5ZAqyQ2/V
	/FM+yiLKLSElz4Oa8I8gopAEwBf2F+FioDvEP/b4Cvus9F2SzW2o4BruJUoSBRI8TaKOzPYrCqMgr
	aqb1gxfE286vyGQLWHfkjxBPRxyzuU6F2ax2Xw2GsAJweymJJkxUbeaDB5t+EPhhetGf7w8OqpQ1J
	JAQlF6k4jT41HmQx40KwTJRqqVbzFYjgzGMuF1DGTZBOwlcYwvAGc9IKWsGXSdz17WqvNcSMKG6cD
	KSxGCSMah1Falrc33kXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPMcX-0000000D19p-0K4d;
	Fri, 06 Nov 2026 16:16:53 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPMcP-0000000D11a-21Rm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 16:16:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c+7atzKV5FBEG1N88UrOnD7orl12+rrLX5LdiuT83kIhlUks9jOUaNTBt4l4Cz0IuVyFlFUywkmEun+FkqMEx4AYHG7/Ldn07Fou2sNEzHYS3Yb+OhO6ueXQtJhRDkHmPneN144ge99uiwaf4R5w5vCAbf8dmMFSgX02mwnGiRvf1uJpGEy34YmvHhCjs+3UYJkkyiquSQobNisQML/Lmbkoixdx+ZX1n1XHCmzkPYYLMxhQCQ9a4zvH1/wUZ7pV6/gFu/pvM2nAdaqrdkoXEfxOk+csDtzgTvnKliltfJ0g3AKwYnrcl6BRqhK2BRt9RmJ3qSmcKj/4WpBh9Z58fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x+x3myP3dhgp56Q/KxWhhIcXg+i8PROVfJPxptEdG3Y=;
 b=ZkdqDKVZGxkA8ACj+JZuUFnTx9I+n/85Jm0zF1rlIQR7icwm6e/2ynysnm1VdY77kCJ25nzbDi/zKE85OnH2GSPrxexa0VwB0hDMDiEElfj2YP/Opin8rE3pkNa+Njvxg1Xd6BZM8lkEh42+Qa0gqk4EVzJJeKqrEso+ld1G4m67c0FeiOQz1qfR1TNM20qlh0BdRDkWu98sRon+KUIklEChkoA4ZicSTW5xre9iT5H1GdQUqkTCzgaxF0DKa40+gb2665Apf8CNuebMka+rVtG7qZ5vsTW7oWsCTug16dSj2lZLCnI7cKV5DUptYIP/nT4dU1Yb7jP5g1fLMnf3Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x+x3myP3dhgp56Q/KxWhhIcXg+i8PROVfJPxptEdG3Y=;
 b=WGvzzg7niCpKPsYMGEmkgOx30Fzo2p57YslrCEwRnvwlu7FIOOcc8D1GSTsj6mOKQOKLg1YY5OftShA+bIrAj1SXcpcUouLlPO5s7ur1i+Nmm0QqDKj+5K9B+uCeNixNHfPebL3FOniBf4G6XbZBzeaHTrjp2ygmpH4yR6kmued7KdAifNvqf50PMAMeo3xkoKf2uAo0hTFTQEIZJrm3+/l7KiYrxH9VZqgVOdbZlhtY70YFkyEy1FGJmUaJ92Eqk0TpP4Ma1TGnDyF2I2YCBcDBHT9pr+1K7cRhMmLIWs+eHDMbDOTZMXAcV82xa3WW5h7ny0jBOvsA8RXvKdzJoA==
Received: from PAZP264CA0226.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:238::17)
 by AM7PR10MB3286.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:dd::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Fri, 6 Nov
 2026 16:16:41 +0000
Received: from ZR1PEPF0000E45E.eurprd04.prod.outlook.com
 (2603:10a6:102:238:cafe::4c) by PAZP264CA0226.outlook.office365.com
 (2603:10a6:102:238::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Fri, 6
 Nov 2026 16:16:40 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 ZR1PEPF0000E45E.mail.protection.outlook.com (10.167.241.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 6 Nov 2026 16:16:40 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 6 Nov
 2026 17:17:20 +0100
Received: from localhost (10.48.87.14) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 6 Nov
 2026 17:16:34 +0100
From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Date: Fri, 6 Nov 2026 17:16:33 +0100
Subject: [PATCH v4 3/8] clk: stm32mp25: update register with reference
 manual
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261106-ups_mp25_clk_update-v4-3-9e32b817c38d@foss.st.com>
References: <20261106-ups_mp25_clk_update-v4-0-9e32b817c38d@foss.st.com>
In-Reply-To: <20261106-ups_mp25_clk_update-v4-0-9e32b817c38d@foss.st.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>
CC: <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Gabriel Fernandez <gabriel.fernandez@foss.st.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793981792; l=760;
 i=gabriel.fernandez@foss.st.com; s=20261013; h=from:subject:message-id;
 bh=IR7Qf83XRHd9KKifUWIA16iA5fTVyfnLbI2U7E5fr7U=;
 b=I5YTsARUcv6aY/AiMpqUjKhxl0/FjFP/KmcdPe0vpM8IfF3f23k4Wl/HQ2v3OOv9zJJmiv9Zd
 m1ejI5ZTNKuBAGogm4/8pHrFbD7SdCy+AYANa6sJVRwrKj2MJSUD7g9
X-Developer-Key: i=gabriel.fernandez@foss.st.com; a=ed25519;
 pk=BVZE1QjIfcrviw9RyyOGQGGsg9CNbaxyjYn9pAlkNyQ=
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZR1PEPF0000E45E:EE_|AM7PR10MB3286:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c85656c-1a99-440b-11c3-08df3c215770
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|82310400026|1800799024|36860700016|376014|23010399003|22082099003|56012099006|10067099003|18002099003|261102123227099003|261021121427099003|261021123027099003|261009223027099003|11063799006;
X-Microsoft-Antispam-Message-Info: D6cS8V2Y8BFXIgn13RJa9u4MMklrU34aw4ROuLbBNJsPkR+P68Ik420f5S6QUot/4LcaU0ZAxFQAyf8649I3czp3nYz1WWFhGHPhvkJthYCj/295ig1LRvG1dfvljGIG/I5L2tgFNQMNFDQadLiQ2zv9J7fh5xtcXGEjOExs1Fa1G95Wu4UL7lpZPDEWJ91dc07REX/zCnLsP2TA05mgU9XE22pEX+h0m+OkH8I5Cyp0v40CXk8nU0eb6W5/4Rh6FUVp+Box74BXe+lKXl9ckEcjtYD09K2v4GHyMfuB2g5jvrFEf6WjDVV0kdHszqsGWpo8kN11V63BfmOAhhjPLuI8lrzcaoTRvMIs/YQJH1PrqKro5atR+pvfFYCC3bjGm554jCBUCOxdwihQPNAg1IWCf/jBkqB8ZWN5bpCu9aa6kyZL5k6lN3zazGcZ6UxP2EIDP6fIqgcZKHRywm+YmS0CgKAafTr3zzb6p3AD4gr7jfGOkEqynynALVienTsQlLPR/FNvdg6lEhBgtfXRRRVH3PVjpbzrQTu/vPOjHL5jn/AAovQjWFROk877fQIRlcF+EYxnyg99dVVDrzlKcR7HiAG4qy4N+X7qwMkk2997DUF7IYOW3aF1l9Yna0GqTeLYRZOsvxc6GvetsXcpHdDCQ4bwkqG0S0Fa6dbxDeJvn6KVKazzPYMvjTC7T2Udn37iZRMoqHVBMP5BK6Btrw==
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(82310400026)(1800799024)(36860700016)(376014)(23010399003)(22082099003)(56012099006)(10067099003)(18002099003)(261102123227099003)(261021121427099003)(261021123027099003)(261009223027099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ZW+CA5eCkOOdm5Zy+Idi1beetkbFxajq1GSZQth4KuXs9l+Fxl3wcUl6URvsGDlgI71NFpKBcJM8i9Uz7R2LN+eZ781bklumqxz4KpJ0Ly05D/sGWn5kBAMZXwE/zoDHPc26SrNxyw01osRFa/9jj94EtNYs3ugnyJu5LTPrniRIp9k0zlHOjVYnXIr1K5v6sIrGnXU/SeycYRTyU2by7K2O8om+EngsoIF+OWap+MzaFCoX5ll2MgtPvDjYLUQYELfdTqpDeYCZ9PH9CRi/DBlCNho6VVPhwhp/8zYUdbyVKkRVpU6pIwgl7mFEIW3WOeHFpGkyk6dZM8ZaqhXWeoLqaBlqgICG2CdjlC31M3Ro/FN0twqAdUGgmBEHDktmKq63FRB5Jh3wserSE/Bk36ZB/Kbu67WqtlhVpdnMw1J9C4EwmALG4Ea+fyWvFAPd
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 16:16:40.8199
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c85656c-1a99-440b-11c3-08df3c215770
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: ZR1PEPF0000E45E.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR10MB3286
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_081645_515595_F396A85F 
X-CRM114-Status: UNSURE (   9.62  )
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

Rename RCC_STM500CFGR into RCC_STMCFGR to match the reference manual.
No functional change.

Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
---
 drivers/clk/stm32/stm32mp25_rcc.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/stm32/stm32mp25_rcc.h b/drivers/clk/stm32/stm32mp25_rcc.h
index 687bc6a78627..421c74dadf8c 100644
--- a/drivers/clk/stm32/stm32mp25_rcc.h
+++ b/drivers/clk/stm32/stm32mp25_rcc.h
@@ -319,7 +319,7 @@
 #define RCC_OSPI2CFGR				0x518
 #define RCC_FMCCFGR				0x51C
 #define RCC_DBGCFGR				0x520
-#define RCC_STM500CFGR				0x524
+#define RCC_STMCFGR				0x524
 #define RCC_ETRCFGR				0x528
 #define RCC_GPIOACFGR				0x52C
 #define RCC_GPIOBCFGR				0x530

-- 
2.43.0


