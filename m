Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78FAF606A329
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 07:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TFz1uJEr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=wHu+RoLOc9OKStuixhr8wHUuP3glCxXDFrnP4NDRuK0=; b=TFz1uJErsHJ2wMzLKfL54RtY1x
	POfFMCBSFVpzhPBy8rt+kda1E1gOEa3uzePkTrT2sNTFiYh+C54Wv/vsMhiTWZq10GJ25ur7VOeqw
	d3eowtEAgUXErCbx/RBBTgxAIL/txU9BkzHemuiZy+ICyIYRCv1IJoe6rM0qzScsV4HM4+37cFjK3
	/LuCxDszeSoiNm+mJiT9XvKJGry11zVsYGSbJQoBE5cFvbT0995ob5qdQBtKTCNjOTOFbBOO7mbY7
	WNrWkuvCjgK/7cyii91LgKbRAvDzg/RHRp+hYAumXY3eELiQkWe3gwoiBBcmz0kuK+XYKkdDGrCHG
	gi3rxXoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSrI4-00000001QFo-3gId;
	Mon, 16 Nov 2026 07:38:12 +0000
Received: from mail-japanwestazlp170120003.outbound.protection.outlook.com ([2a01:111:f403:c406::3] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSrI0-00000001QDx-3TMr;
	Mon, 16 Nov 2026 07:38:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q5/6Wq6Je2yd4ip/IoDJnkLOhHIxj0zEz0crowqbLY5gdgv1YY1SBHeLA05DzQEgmYSOWqVnGP75NhUsG7DCywNBDXSl8fY2uelnm8SypwHZFeLzEVcNT7lQiPq2eSf3ONZlJrYT58QTwM1uiZr/gPXuLDX60kXiMZAQC1dGeR0rEv4HtxxtQmVtreLQRp7eEbFk+JBWHaC/J0dZ3z5TmM3vqwTWgK2MGEAO9AnVdSoYcr2CTB0x+cL5w3WFecLM4Q7o3KMZ0ITizzhZ3K6RHM0iTgsTscsBn7bYb41Oll7+PEgw4KrM3OGvRF7Epyvc8RQFaZgb8pgIMXvNDy160Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wHu+RoLOc9OKStuixhr8wHUuP3glCxXDFrnP4NDRuK0=;
 b=JOjwuu0DJ8MtqUiYIBsRjeQzjWR2zq57TyvtC1DiXEb8FnMWA8xFQJoPR/LDKYu44DQ9hP1HFsedJ/GIN0Hm9i1r8lZYAjltkGxYUxrb5n4F9Ur/nNMpAarAG7VaCsT9sU+JFpdMKlNhxMXsP+cyR34xoih6GpZSSgcicALtU1kJ1+Y8uhffLWL+9YHXphR9eZFddt300ENqVRTsNqdMohD9p1kFkFKr4pCbr/txMlq479K2/dcv9MFo0MFGZ0YHJuaAZSwErnfJV/yzjqPDUi2PtwEVfQtJAHVcW2ETuC+FyWRYqIBSMbky0koYM2Pg/W5yrpcv4U+ja3vL/yq2kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI1PR02CA0033.apcprd02.prod.outlook.com (2603:1096:4:1f6::14)
 by SEZPR06MB6458.apcprd06.prod.outlook.com (2603:1096:101:179::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.7; Mon, 16 Nov
 2026 07:38:02 +0000
Received: from SG1PEPF000082E5.apcprd02.prod.outlook.com
 (2603:1096:4:1f6:cafe::38) by SI1PR02CA0033.outlook.office365.com
 (2603:1096:4:1f6::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Mon,
 16 Nov 2026 07:38:02 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG1PEPF000082E5.mail.protection.outlook.com (10.167.240.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 16 Nov 2026 07:38:02 +0000
Received: from localhost.localdomain (unknown [172.16.64.56])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 2C7CE40920E2;
	Mon, 16 Nov 2026 15:38:01 +0800 (CST)
From: Luo Liu <Luo.Liu@cixtech.com>
To: vkoul@kernel.org,
	neil.armstrong@linaro.org,
	mani@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	gary.yang@cixtech.com,
	fugang.duan@cixtech.com,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: cix-kernel-upstream@cixtech.com,
	p.zabel@pengutronix.de,
	linux-kernel@vger.kernel.org,
	Luo.Liu@cixtech.com,
	Wuyi.Shen@cixtech.com,
	EastLake.Yang@cixtech.com
Subject: [PATCH v5 3/3] arm64: dts: cix: Add Sky1 DP PHY node
Date: Mon, 16 Nov 2026 15:38:00 +0800
Message-Id: <20261116073800.2396894-4-Luo.Liu@cixtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261116073800.2396894-1-Luo.Liu@cixtech.com>
References: <20261116073800.2396894-1-Luo.Liu@cixtech.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E5:EE_|SEZPR06MB6458:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 17afe3a7-21cb-4073-e18e-08df43b48b77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|36860700016|1800799024|23010399003|82310400026|42112799006|921020|10067099003|56012099006|261021121427099003|261102123227099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 008ynY9KNTmK2RddxJSFYB+BOGsMaVpYsAJg8sGNGwe4P8whQXvTyFDYiu1VRJ/ZIAi5pBbBnbxvOG5t7y9L0Bn28Y1rPcV1TL3nNzqIvI1mcjgF0ZDSNGtnGxDJ8UJLAaEPih748QlBuLWKOIKmWoeehPDa5JvEeZWqdsN8A3TqivsAKaEKz37cS+eMVqZEOsviEVzxyJhrj/LJueWdwRDfTAEwx6pRVsdsImVWTM4CoePUNVGpEYrNoxxswF6tWRjzU6MDfS0DP+u/TTRH+eGrzKBnV/WzzhnFCOIAdvn+yf1/CbgB9RN34wECxTuEvXiVAweC22ISTKwrPyT1Dj+5NAFhZsE0DV2uZd4KmR21kN36+2HAlJ8As9UfjovMJoMIi/fJFHkdRkrq7gwdjvyb2AtSHmffzzjrguM8bT5JekyKv4LloPMZS90PDiy09rdTqq/N/PTefzosVVAmA+yWyoTCdzEG5XrDKS4lXxkj4El+/ebtABE8ojaBDS13/ub8vTaMtTIfXbyqnOyKhChLNjYVBDrkgyiVDQfaoiCvhIAJS+RPeAGjSGMTspPktJCyjkCusDhs5d3jeYVQZFTHZCXmU/GFwTZ9COHhgXYh8Qo3odXRWCP0ARDWnLI/hBkJwf0h933Jo8QRcBw+Dq1dQ0in7CVTjj4MsGdx2Sk/38oIzneaF9AcZLpkXYg9Ey36fIRo2md+xS5s1ANsCtf6d0CJbNpAz3F56GxYWPd+5QKSOC2V2VrgyJP24hxn
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700016)(1800799024)(23010399003)(82310400026)(42112799006)(921020)(10067099003)(56012099006)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: dqeE/Rq0WZr3o9LjFFhBHeWM/9PxGv6JvYUNsEIarPivFM3xzdyP8BYdgqM+tb4X1nCs7areAyAPt7tXrO46N4R+E2pw5nJ7A5ikKHlSDQe9/MqcPF06sZBzEUEW8o0soNWDYeOslAwh4V8xvc993OaU0wun4biliQdAx0jVYeHP1d/HPiFACEXvXJ3FCL9XglRS8yFPkiCPv7wG22dGMb7bM3C/edtb1uO8XOC94cC5sjE0j7GFHIrCXGbytDddD87YP87cfIj5Jdh9A3+OZOwuDizr0wvh/JX+jFFx8QtvrLqWVpqJFGJDJsyMz/5VVM15gAyVmZUrZVdGg+sAz7RF2N+oob4cqH/n0rrvp8uwTYE8fvrK7wbjirLOG+O7BQEM/y0RQ5GUZt5JhcMYaNFL66BrO4FOaRUyO4D5cvqmOjlIpM+wJe6Tl7HhxNNx
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 07:38:02.1108
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 17afe3a7-21cb-4073-e18e-08df43b48b77
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SG1PEPF000082E5.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB6458
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_233808_866418_F9F0A5F3 
X-CRM114-Status: UNSURE (   8.47  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Describe the Sky1 DP PHY in the SoC DTSI, including the DPC2 APB
clock shared with the DisplayPort controller, so DisplayPort can
consume it once the controller is enabled. Enable the PHY on the
Radxa Orion O6 board.

Signed-off-by: Luo Liu <Luo.Liu@cixtech.com>
---
Changes in v5:
- No changes.

 arch/arm64/boot/dts/cix/sky1-orion-o6.dts |  4 ++++
 arch/arm64/boot/dts/cix/sky1.dtsi         | 10 ++++++++++
 2 files changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/cix/sky1-orion-o6.dts b/arch/arm64/boot/dts/cix/sky1-orion-o6.dts
index e39c87774c12..b659c10f1f4d 100644
--- a/arch/arm64/boot/dts/cix/sky1-orion-o6.dts
+++ b/arch/arm64/boot/dts/cix/sky1-orion-o6.dts
@@ -36,6 +36,10 @@ linux,cma {
 
 };
 
+&dp_phy {
+	status = "okay";
+};
+
 &fch_gpio0 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/cix/sky1.dtsi b/arch/arm64/boot/dts/cix/sky1.dtsi
index 0a820f45feb9..cbc14ac5b2b7 100644
--- a/arch/arm64/boot/dts/cix/sky1.dtsi
+++ b/arch/arm64/boot/dts/cix/sky1.dtsi
@@ -762,6 +762,16 @@ ppi_partition1: interrupt-partition-1 {
 			};
 		};
 
+		dp_phy: phy@1414c000 {
+			compatible = "cix,sky1-dp-phy";
+			reg = <0x0 0x1414c000 0x0 0x4000>;
+			clocks = <&scmi_clk CLK_TREE_DPC2_APBCLK>;
+			clock-names = "apb";
+			resets = <&s5_syscon SKY1_DP_PHY_RST_N>;
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+
 		s5_syscon: syscon@16000000 {
 			compatible = "cix,sky1-s5-system-control", "syscon";
 			reg = <0x0 0x16000000 0x0 0x1000>;
-- 
2.25.1


