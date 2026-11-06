Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 924F9606D80F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 16:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XAZSWawa;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=N/K1GX2v
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ycJ4V2KYOSDC9vxajOLoms8rd3FqlmvZGzc7iSgYJrs=; b=XAZSWawahBWzvt
	9nLgU90riTzn2V4sgou5m1NzmwtPaSeCSHcPvjESM7C/1sMfo/2nHn+nBrKeamRVhPEtf4SOohT8L
	b/lgPThSIDIcDQMd8r6F/xcAsZPBUyuBuHkMxSIsJIdgV+ux6Qrm+8KacQTSHIKAjfts/G3oyrbHF
	J/lLZ68Nei2f1c08ifr9TGNYeZqUO/9xxgrfxHwRj07DZxUgimoVWbQtD6SarHCIS8VEyzx41HN2L
	o6QTPaNFt7HBYddbtcQJyupGGyBM6gzLs26LBE2YWzx5SdWOELxTncdEGdOMc0gDxOhmcuD/L8gYy
	sywyP/J2e7uviPk7J+ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPMcW-0000000D18a-1KPy;
	Fri, 06 Nov 2026 16:16:52 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPMcO-0000000D116-3mX9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 16:16:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E5MzKYhXwibF6RgRJ+2t0wQ0K1tQEMEWCjKsgBvk9rVxOtrobIcrjO+yBfTPpoEMZRVQ+ok6+wV7W4AAN6q2ap9a4WJP6EX/maxeEciLoWP0BTvt8R7mj+8hNOOm0ww+RZjLrAncMDn+TsOF9aRzv5E8dvF/Oaw8+G8emwvHr36Oij/7O0lRpat+l3EKBesL9nPqtDVNOEYZXC9M3s9B6xBUsdx8biS3niYBZbo8Bg4fGiBKKE8pa57rt9puWm7KVcSAztz+yMp4Hs0dGJYFrYVmkesE+hh40Ztw3kFcuQdL0m3yLFaKM17A//EMWvIttQC5NbSf0JbRj9CF5SqWoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ycJ4V2KYOSDC9vxajOLoms8rd3FqlmvZGzc7iSgYJrs=;
 b=jKhdi94Kds0lk+S6ipPpO7gWWaR4UkeFZpTTYF+zAl51i1mHn4DqZNPl5pFgeWF17Z6d2uZoi8DBP6k4g6QgqdkMvYS64gQFkultfXHg+VLIUp4/ZZC+ViLwew22rl626YAVgkUfpc+oNonI6G3SsOXMviLiUS4JUzk7M83RFJNMQUxX7OBVy33WmvG360AS2mGD5UtBLVAmcFHcQ1YrXMiGpw6iRotx1M9+99EEFVQESRUT4Q/J7pTR5Pp+l3fk/IU/1qmiy7nZ3I30rett3IBK15dRFJ9/QnJhskSI8Xnk7dJmFUrQYAIOMcycxMIX97nj5BUNI/UdXAsD87DtPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ycJ4V2KYOSDC9vxajOLoms8rd3FqlmvZGzc7iSgYJrs=;
 b=N/K1GX2vPX0bJcQWIn5mcs+HCAYFOnTOq9qq5dt7Q4FRXoJp5UuKCyMfli/uOXw0euXKCxU7gC3DVXuwVLBqj61ciz+7Gez/ZQXo5NnTApBvcJ46CocAhfMcboIBRByTi7YV/b0cvmdN8hLyIyKg5fLD6JMLRCt4M5TGXLN8Yq6Mk5Sa901MpL490zNDj5VgdJjZ3MKHyKAiBmXVTqMaO8eyzAuMTm5ziYWXzV6xQzUM4FeF3/H5tX64iOpFOMEtln+Wh685j6aSGZJQHEeb8OvnmNvMBF6kNwazoWcHWmG9U8Ih+LM5hN86xkxdR3kZLV+JC9u8sT4VLK32CXVvwA==
Received: from MA3P292CA0070.ESPP292.PROD.OUTLOOK.COM (2603:10a6:250:49::7) by
 AM0PR10MB3698.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:158::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Fri, 6 Nov 2026
 16:16:37 +0000
Received: from MAD0EPF000008B1.eurprd04.prod.outlook.com
 (2603:10a6:250:49:cafe::f) by MA3P292CA0070.outlook.office365.com
 (2603:10a6:250:49::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Fri, 6
 Nov 2026 16:16:37 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 MAD0EPF000008B1.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 6 Nov 2026 16:16:36 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 6 Nov
 2026 17:17:06 +0100
Received: from localhost (10.48.87.14) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 6 Nov
 2026 17:16:36 +0100
From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Date: Fri, 6 Nov 2026 17:16:36 +0100
Subject: [PATCH v4 6/8] dt-bindings: stm32: add usb2phy1stp clock on
 stm32mp25
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261106-ups_mp25_clk_update-v4-6-9e32b817c38d@foss.st.com>
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
	Gabriel Fernandez <gabriel.fernandez@foss.st.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793981792; l=800;
 i=gabriel.fernandez@foss.st.com; s=20261013; h=from:subject:message-id;
 bh=1uz0HoDkpaORv5D7C6jF0IEFFUgf6oU2O5irmDVVAtc=;
 b=CptywPa7qEsZvKHVukGwaMcV5eoMgHrYvHrEPSuUYl5I3dkbr4x3aD05LUiHRSKy3CDLu+TpG
 5Adphc9UIOQAq+ShydyjBoTjisU4GxlBSxzWApRMTh2pjzCK3V/WSdX
X-Developer-Key: i=gabriel.fernandez@foss.st.com; a=ed25519;
 pk=BVZE1QjIfcrviw9RyyOGQGGsg9CNbaxyjYn9pAlkNyQ=
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAD0EPF000008B1:EE_|AM0PR10MB3698:EE_
X-MS-Office365-Filtering-Correlation-Id: 347c2df5-7364-42ea-e2c4-08df3c215511
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|82310400026|1800799024|376014|36860700016|23010399003|261102123227099003|22082099003|18002099003|56012099006|10067099003|261009223027099003|261021121427099003|11063799006;
X-Microsoft-Antispam-Message-Info: muIR6+wDZKpN3GkUW7CeLSELm6JrwZyazY1LU5C4EQCrs3JcYIUSGN7Ny2mFzI252GhsU+EOFyKCINsUdDCOT+57XyRCbHxPF31J75IlpQGg4pqE0kd2F7UGHv9Rjd+cT8TOe7TqGrAhcQyEQphYaI8i7/ayQ+9pQqbL0OxCdHeV3flRTUXJ8PyUCzgap+Sn+zEz1mRL0LiKiKsPXYrMBdjjwkCiVAHpskdjp7t/s+XRP5SoM7ysvHHzBszNqhnKyVUgnNkHaSCmYr+QRP2zOlSLYlPnaLwL7wBktkeN9HXmkaA2DYSZ+FS+M1pAJcyg+XjR/EwCxQHxuFeBZFF8TvUJ7KfyB/TyAsfQP8BAzmu1a2Ag8AErVTd3GVwmZdsJz0ZXKRvQW/nOWtfUYDVMIbojR+3/AxPPgRO7lP84nfysgbqYSh7SngK8giZrTxIwbw5c3V0PloTLUR7pFoER7SyukfU/F49FzcZjSXMON5l5QFGhYWkQVX3bZ18S9kUTtWnNhtU/NJXCEu8MDdE1dfjBAlnd9MKEIBwiNzxI3hiTaMghoTSrGl6qH+dhIJII4kfP8h8qT52yCzcTlB86+3EdU0SXtxPaPmEa0THPNzP5tfC01jhQm42zEkRmm2kDei+pHgNzfIMrSVF8Ow1hbXPZitvRpss/wxjXmlWkfC29xSYPwCXpLaI2WSDhOJ+FRuL0gS2h9Sdac/g1Q8rVng==
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(82310400026)(1800799024)(376014)(36860700016)(23010399003)(261102123227099003)(22082099003)(18002099003)(56012099006)(10067099003)(261009223027099003)(261021121427099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 9fUayobvpUu4We/rUBwU2yPxV0weQ8R7U8ARaOyjgQ7yE0Ua9Gv8cdkHqoqYWyNn+os3ijLPBJbJpI4p8N+OKvNiTH4xcZkhUkPuekF1KJJWjuLsJCARQrmn32qCb3q3tkmOjTsByEBTHgPONbUATbRKpANcPjm/OqNA1o2tCE/1ZzNKOc6gVV65uZ8tTz83vg7n4qLbZLkCvM0QcHiWOqQcmxyq4X21wCOdnXuSbKfOiWViKfAUmBIv1rJgtMNX0CN9oTL++pcREuoGX4Y03clDGnHe4v+rmlqPW0n9H0n9dh6Gtd8dP78fAYk6eU/qq+yp4vdUNymGsQRvlJkDq/Qs+wPIKr3rQyodkeSBwPhw2yPsj15Mk6tMSF6niAYpsp2LXUFtw0XgOovZQWmC7mL69LsuWFt6idY4EOjxnisR/Bl/8DEj73o0HRYfC7+n
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 16:16:36.7664
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 347c2df5-7364-42ea-e2c4-08df3c215511
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: MAD0EPF000008B1.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3698
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_081644_969868_F350BD3B 
X-CRM114-Status: UNSURE (   7.84  )
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

Add the ck_ker_usb2phy1_stp clock binding required for USB Host (USBH)
low power support on STM32MP25.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
---
 include/dt-bindings/clock/st,stm32mp25-rcc.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/st,stm32mp25-rcc.h b/include/dt-bindings/clock/st,stm32mp25-rcc.h
index 7d25c2747a9f..166b4fa1ac2e 100644
--- a/include/dt-bindings/clock/st,stm32mp25-rcc.h
+++ b/include/dt-bindings/clock/st,stm32mp25-rcc.h
@@ -393,6 +393,7 @@
 #define CK_LPUART1_AM		371
 #define CK_RTC_AM		372
 #define CK_SPI8_AM		373
+#define CK_KER_USB2PHY1STP	374
 
 #define CK_SCMI_ICN_HS_MCU	0
 #define CK_SCMI_ICN_SDMMC	1

-- 
2.43.0


