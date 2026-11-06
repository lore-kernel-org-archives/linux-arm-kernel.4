Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 326D7606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 15:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nTKwq/gy;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=Dysud9eh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ycJ4V2KYOSDC9vxajOLoms8rd3FqlmvZGzc7iSgYJrs=; b=nTKwq/gy1crIhy
	IK+DRdsxOsiVutOBrv3mlDePLvcauSs4F/I++CK9GhajVctH4J/fppqEmnSrd0uOSHg8Mh8mk4CXR
	eTYVaNTZqz/a1t6J83vrBPm/pCO9doiFAbzIrlXP1SV45e06K1BsMo4a5t9ep0+e5x+XFrNhuljVv
	c7PvvfHO57e3gomRVzyem/HlEOgR8USER322LFa+N6svAixETewbr3Mgn2btyMozqV8h7yt3qOThO
	nu2Zrk8jdm/aXudjw4Nbj+p7p5OWqoVB+8T08bchbnsyC/cE/KygyPtwL/CtSMRH9cLIvwWJ93X4b
	LIuXmmYLhWxEBqLGCTLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPLz5-0000000CqK2-0t39;
	Fri, 06 Nov 2026 15:36:07 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPLz1-0000000CqG1-0Uhq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 15:36:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yMDkcc69eLTOS1aGCLgC1RAaMbVD4HiYmd8t2gm+Q0vvAJek7RU/YsuXJuyE272kpTbN5VtiAr/ar0KhRyvs4APXjY9TxQnljk1rozxozev3K8u9/YJRspSzIuUPSKscVj+e5u7/vb2gp+PzGLVBdeKQ6WUShDasoyeQ7K3fm7QjkVWAFqN61ysXZSnt1f7DY4/5HvFAFeSbsh9ET55SGzx3LynVAXaSqwzApJJoJalmoXhPRcS3BhBM/lWbRzZuimHZEUkVavwIT+05R48o7zOQWd0oO+QpUX7IdV/jnHlSf5y30KFYaKChe/6kY1wXNfmNwUndLkASnO7WiocgRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ycJ4V2KYOSDC9vxajOLoms8rd3FqlmvZGzc7iSgYJrs=;
 b=m77hzVjKXiir9Wf0eBWBQyy6iUXMtIPZSFuBvwIZhRGJ7AnhOuniy4/IAQEpH/tmO5I3es8Bb3B0ERuXBotzkoQfNYUGsdJy289Tps4/7ejXWBQ/E/b4SY7YejUdahFN8duo/6/rVBWlLu7s6CJPqkFL/xKO61//NhKiP+mttxdsKxRUNnN/T36rUGOETFdPi9W5TPxb7BKK14FzCckaQoH+U8G8JzjkGxvuEFatnjeQMFLv+ZFjHY3jhuQTu7GIzfu/l0V/OS9JXuXLbuYBIQnYhYecgs+IXxLugM4PX4DK1MnOaE4LQPZJNA8uZMfmX27kEJykUkWhjCcS4t2Nlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ycJ4V2KYOSDC9vxajOLoms8rd3FqlmvZGzc7iSgYJrs=;
 b=Dysud9ehXQIuPEuQI8ikyBIqrQBViCbTCcrk2RtfBeJbd8yVgQspHQ8pdOgOUp2nAbyPwp1caaQUIwrLvCpDkHcAoL08vGfC2Lyl3ABbEGYj5JCBriFkTDfObVZk/xtbL9vkmiym0SPbArDRrw6wzUh4cSB8JIwzrRmFvlaRl8690MUd5Qg5ZQTMC57y7v/tFGue6O8YwYSWhrvAY6shTtcvY78BLga1HyDwPI2CgsFbmWzwetIjHmP7ApfMX6NNowXki34ioRyM+Y6RqoaqkF4CqN1/5H+9GCoBh8ngReu7L42kSz/uNO3hITBUEQneSzrUCsx3NQncjUSk/vtYKA==
Received: from PA7P264CA0170.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:36f::7)
 by AS1PR10MB7617.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:4a1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.4; Fri, 6 Nov 2026
 15:35:58 +0000
Received: from MI3PEPF00008499.eurprd03.prod.outlook.com
 (2603:10a6:102:36f:cafe::1b) by PA7P264CA0170.outlook.office365.com
 (2603:10a6:102:36f::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Fri, 6
 Nov 2026 15:35:58 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 MI3PEPF00008499.mail.protection.outlook.com (10.167.240.184) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 6 Nov 2026 15:35:58 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 6 Nov
 2026 16:36:39 +0100
Received: from localhost (10.48.87.14) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 6 Nov
 2026 16:35:52 +0100
From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Date: Fri, 6 Nov 2026 16:35:35 +0100
Subject: [PATCH v3 6/8] dt-bindings: stm32: add usb2phy1stp clock on
 stm32mp25
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261106-ups_mp25_clk_update-v3-6-4a32f68119ed@foss.st.com>
References: <20261106-ups_mp25_clk_update-v3-0-4a32f68119ed@foss.st.com>
In-Reply-To: <20261106-ups_mp25_clk_update-v3-0-4a32f68119ed@foss.st.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793979349; l=800;
 i=gabriel.fernandez@foss.st.com; s=20261013; h=from:subject:message-id;
 bh=1uz0HoDkpaORv5D7C6jF0IEFFUgf6oU2O5irmDVVAtc=;
 b=wuShiSA9stFnyP+khfYWnG05RVHfx0mBACsL0h+3d1zaNc8zmPgbzRwebEe1l9yxJVQ6KTqCT
 dO/ZBMwz+nSBqAVum4Y60ZukMjobrYsLuXpsYKzPzgu3DRC1f7N5WHO
X-Developer-Key: i=gabriel.fernandez@foss.st.com; a=ed25519;
 pk=BVZE1QjIfcrviw9RyyOGQGGsg9CNbaxyjYn9pAlkNyQ=
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PEPF00008499:EE_|AS1PR10MB7617:EE_
X-MS-Office365-Filtering-Correlation-Id: b2787e5d-98e2-4404-dc70-08df3c1ba789
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|23010399003|1800799024|376014|7416014|82310400026|11063799006|56012099006|261021121427099003|261009223027099003|261102123227099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: Pu8lvvX92+DNMcgzPu0wcTKnIDlxq+H296nZhBOnyiovYVyctXYMqVivRfDn6GrEaDJ8CtvnIjMWfiDy4fakzTyNq7kBjwP94JQ+SOzRitdhtlCFhSbrThHqP/rpYh32fpoiOPRyYouZI93vJbY9tePoXV7XVU82FqaZ403vMxBEZRBzPFfrMNpg1WYb/2mxyukUqzbtSqq90MlBd415W6+OMET5kAmJRvEmW1wTGL9ijRfUh/iD+Tl5Z4hRcca5v/cN3xQ5ZIXHLPFLaqKV/o9C78YZyb8kwSza+Sl9y3mQFUVzlgYdKkkoDcgnbVcA84ESyJggZR9tAitQdzHZHmPvWjTx/TBpYVA6Yom05Jl1cY0U6BdN2VhNBL+YdrOBUdcpjPzyuw57rxmLSn7RfwPe0biYf9HltlwutCo+AdBVgM1PRmnCSMqWWyKBriEz633DrbTtFMdnG0OMUlBYF6NH6BY1dtmxrxCQ9rjUGsE4BP/Xwtm2JtExtBWTGL7gBCfRg35E36Xwivl9wdtPlrd9IhWerk+7nKVALlKJGZRa9DFrxRlE0QyLA9x8Vn2pqDocXy3sZXZeRpBh5ZxjChU5g0N2vrzZfVe8+OL9fIGuIarjying12rXYO1dUJmaSTtnfdZSD5h2+I7yc9vtthq7AZVXt4epTvt8qC90Mre/B2FaGAo20tA7DN8ApCocPN5ZbXSwYl+xiBgY+kA/ig==
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(1800799024)(376014)(7416014)(82310400026)(11063799006)(56012099006)(261021121427099003)(261009223027099003)(261102123227099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: j694LotyozSkyEIIJcjAwYuOIZTg5hmbR620e+ltxyLtyl9En3QnCuGDDS6rVYZq19OBaoutL9MDRnrR3OXtrS88RqeQYtgLNLkUa+Z1pxAQ55cdKfktKIRL72zoUPgfVsb61Dt4XkLWhAVPTC98z9vbERscO2yvn83XC0hkfeMJEY0YASbrDWJViDoy1nkkur/ietcJAOSLD05igFuHBcp942KxeKqYcNUL2KIjT/B0cpRbWkf6jCZWrKMSUAiRYeADkd449SNCVzHkAtIoyZD2x7/L+nUd6e+KvzUWkSl8NknUxDu54bCkKIAe2KhecTOOC9LuBYy3CMbBcJV5YhrL+8DLL/zdxf5qm+YFHXD7gzvYAhHWQN5LRnnbtPcYuGN11G0TeCC+Qi//3uN2rHKqw/OuztR4t+FS5WJ3a6E73ZgGjbeOYSJmoW1BcyAy
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 15:35:58.2139
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b2787e5d-98e2-4404-dc70-08df3c1ba789
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: MI3PEPF00008499.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR10MB7617
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_073603_191995_7D92D4EF 
X-CRM114-Status: UNSURE (   7.94  )
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


