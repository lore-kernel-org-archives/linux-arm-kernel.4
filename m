Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 098AD606A323
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 11:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kg9x/BaO;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=C8r62coM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=6lFVLvYNlMDoD4lsdlxqlcB51QCtxEpQW4nlj/eLPzU=; b=kg9x/BaOgeRxm6
	FQM/HcGmdy+KWUYhSibpJc3vZX5nQg/J+B5MBbJP+PFp4tU2WBrCNkxIXwYg+Uw2VZOVTDLsyqn3v
	CAuuBiIUZi9M/vpqCGUD7iDhw+R5C0Mel9vdQhBYy5rk5WQLY3gyNkSXhFw5BT+RFB8kHc2l+uXJr
	88GQ9hmVN815M7snnnDAYwEr20Df3hImJckDSCrv8dgclSIeC9j+9sQDTXJMN4zKfe/sw1u+vFcKQ
	jAqb6XDBaBaaMqLvanGkCKmCtzhtzJ5VdHe/CPbxGbaii3d5f+iG3GCKFTHQlEypW20ZnHRgR5tbE
	gDkPjhE+WK5vWQTb+0/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSv1H-00000002Cpq-0xIZ;
	Mon, 16 Nov 2026 11:37:07 +0000
Received: from mail-westeuropeazon11013000.outbound.protection.outlook.com ([52.101.72.0] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSv18-00000002CkP-3tDv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 11:37:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pHIsBmQlwkslhAr6UxY897wV1oo/uf0oXMK81hgfI87eJ/gKmt84iK+CtykXZpfzlLqJ0EaDh5MZRXXHrlnGALVsMDqshWYW1vm+WxplovaEj51Qe4aO+MUg1YHY9oEA8qzavtHxkypVoIycf+RVpsMvhgBvdtGQ2ujlmLO7xmV7EoffRTvvjchFBrs6KSr5iaaf4ibutL2E+51oUY2q2A1v1J8xoJemHNXo7sFYh8+Rus8HOyi9vNWHolw1toNgbL3iQ4f0awqvUq09YU+bX9RzymtYopUZMbooiMbMrsE1ISUXV7BPr7t5gfPmLUygdSEaa2m7iHE2nrOjcy9dWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6lFVLvYNlMDoD4lsdlxqlcB51QCtxEpQW4nlj/eLPzU=;
 b=Pgz+17SPR0EDHEBBBw/76vPTZnwoSj8pbVG8KzdhUdwJdu3MgHc6KH6v+6tYjJbGLrCT5nuXIbQOw0VmhFkqHLJQjwSivqF0fgJ/AQhLjOkK8aWCoscewevjeJwUtC43p5l3oFD07qUR01xootfs05kDLNgv/khwafjBgoNZk0IlxK1iVTixx0IoP14sOeDnqa4V/a67jCYEvbu+Mt1D5ngDZd2rCE3TlF/FOGopdlH01F34uvz9ZH9V1M55b8y15BIctje7NlIr5+Yqire+Y40Bsz6g1+l5bUzRQP+rKhRiUVL5voIr/9IpQWcgJancpjh09SlknsML9oc6zm1/Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6lFVLvYNlMDoD4lsdlxqlcB51QCtxEpQW4nlj/eLPzU=;
 b=C8r62coMsDNVftIjfdMLEjrYzptupguJ1telFbXeWmOTvMhJQaRJjqe9XYfns5YKOSFpNGoo0zBuJrEHXLG1vglMVyau0TPgXKXA8OlYTCVi6PFdkpF1+p52L/SaqZZfOE9np2XpOrdhpQN65QQ5gvStPANFsRA2IbF1ApjPeLr/jqWflx+FsM8hzFgU/aOGGj3X5pMjRPznr0vRpcws1+TracUAYLLtLj+QqwnNJ4s4C4LhRvUJL2o+3MNReHxhAlFGGYDmRjketHi4yhmFGSpFE1gioR4U3EH2OmxptU1Lnj9LnTpczHhZBrNtyDkLvk6+1Ku5pYaUkaZRiSnPRw==
Received: from DUZP191CA0011.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f9::9) by
 VI0PR10MB9741.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:33f::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.7; Mon, 16 Nov 2026 11:36:50 +0000
Received: from MA3PEPF00000405.eurprd04.prod.outlook.com
 (2603:10a6:10:4f9:cafe::44) by DUZP191CA0011.outlook.office365.com
 (2603:10a6:10:4f9::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Mon,
 16 Nov 2026 11:36:50 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 MA3PEPF00000405.mail.protection.outlook.com (10.167.241.150) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 16 Nov 2026 11:36:47 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Mon, 16 Nov
 2026 12:37:40 +0100
Received: from localhost (10.130.77.105) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 16 Nov
 2026 12:36:39 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Mon, 16 Nov 2026 12:36:03 +0100
Subject: [PATCH v2 3/3] arm64: dts: st: add delay on imx335 reset gpio on
 stm32mp235f-dk
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261116-stm32mp-imx335-fix-v2-3-5f2f8ce7e4eb@foss.st.com>
References: <20261116-stm32mp-imx335-fix-v2-0-5f2f8ce7e4eb@foss.st.com>
In-Reply-To: <20261116-stm32mp-imx335-fix-v2-0-5f2f8ce7e4eb@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	"Alain Volmat" <alain.volmat@foss.st.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA3PEPF00000405:EE_|VI0PR10MB9741:EE_
X-MS-Office365-Filtering-Correlation-Id: 26c4e14b-0fcc-48ba-68d5-08df43d5e600
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|82310400026|36860700016|376014|1800799024|22082099003|18002099003|261009223027099003|11063799006|56012099006|10067099003|261102123227099003|261028144727099003|261026140227099003|261021123027099003|261021121427099003|261022105027099003|261022075727099003;
X-Microsoft-Antispam-Message-Info: sZxOhlBzK6bX4YX4bUHcwjLdxAe7/baZYmE1KTMMHqmx6eURirdHKhUd2/zQi2lYX7FkzYDkYihGEWjlGkY0mSVThmwpK5Fvs87Jv6gmg0EgRrhinTnt4DBGrLCgokxEucBU9YJ+OeGX3Hv5I4X+6seswG3IanVDvhFV8x38NQN8WTzIkCqfA7Yj6LXsdl0vs8UkDVyo/tCPnukt7Eb+5YDG1IXTAfNoHx6Ru2PvOAmEOUWzOXoPiMKZt3YRKGpuif5IGXNJaDQP0WMKIcCLRdrxdlnai0DCtEBQ/P3s7nPi9RGZpjSZaGi4xISsg86Ebg1Ew7GcbTWLw6Uzi/2p06/JC6Bhg3BWHcUJFZk2wyor6862okAZeVzpzUVL/3o3ihsDGeP6MFQiuEvIUF8ndz6eAhLjVvzl7sHIDwqH//x0Z60cucLv20ODYBjMaHSpSJzZU1lG6phuVX4wQ9tr3eUVWmxlvvupIZ4FQdvaGS2AXNFlGfZX/wEXZuOPZNqV54gh781rhmV3OFeldqQbYWQQMQj0rya1zFzsqerii+R3/rwHOnwn6HdSF4A5gdgAL2rB9k2PN0LbqM5G9Oqgg34BW3hsqkuPIMdISY2wcLTYSAydCNfbGJol6JRmkL+YKWzUEOv+X8Scc/lRpZlOTcdTFbi8CIpGcGByrj9TssYT4R6phfR0vUjIFN0E5ptTX1hehs1vLgZYwdqUnIVuww==
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(376014)(1800799024)(22082099003)(18002099003)(261009223027099003)(11063799006)(56012099006)(10067099003)(261102123227099003)(261028144727099003)(261026140227099003)(261021123027099003)(261021121427099003)(261022105027099003)(261022075727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: pD+ziJzbTMn9HSucQQjd4pZSxLOzk3CdAojWchvgmV1MoqEzD8zstn/G2S/Qpy60yl+j2VFhCHMRJf8XgqxRnCsKx/yBK/Is7ih9GbYLGdAHhtpD8pmGgkQ1MmPILgxlnRdku0VlyFN7006a62t1Yr/k91Sfsf87pePZQKP+AlTCOD7QqimHCAyHnGLadk8Fh118q7WvO6wd+YASz6qgErXKIt0hxgOPpWueav8nbxHOoaW1FKmf/eKh4CrbCob0rp4YWv5cKFD4d52wDYs1ryGnLHo7I8K9TDq43LPcp9j0RHCysJq2T3ohpYf9ntHT8FrCv5O//qr87nAlQ6m7ARuczoNvMO5gvfHTahnk2I1T+dv5CipljUUB/X6mDfTURhU6AfkO9DdcGejF2Lg34hWCh+4yLK/k8z7i/noSuz0g8ZVQeMsWOmXuYBb8Iwm0
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 11:36:47.4307
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 26c4e14b-0fcc-48ba-68d5-08df43d5e600
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: MA3PEPF00000405.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR10MB9741
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_033658_974253_EE7945C1 
X-CRM114-Status: GOOD (  12.34  )
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

The imx335 reset gpio is connected to the sensor reset via an RC hence
a delay is needed in order to take into account the time needed to
reach the level for which the sensor sees the correct level.
This prevent having imx335 power-on issues due to the fact that the
driver is trying to access to the sensor while the reset hasn't been
yet properly handled.

Fixes: ed9056f9a042 ("arm64: dts: st: add imx335/csi/dcmipp nodes on stm32mp235f-dk")

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp235f-dk.dts | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/st/stm32mp235f-dk.dts b/arch/arm64/boot/dts/st/stm32mp235f-dk.dts
index f06b334dc9ce..137bed62b2ad 100644
--- a/arch/arm64/boot/dts/st/stm32mp235f-dk.dts
+++ b/arch/arm64/boot/dts/st/stm32mp235f-dk.dts
@@ -74,6 +74,13 @@ led-orange {
 		};
 	};
 
+	imx335_reset_delay: imx335-reset-delay {
+		compatible = "gpio-delay";
+		#gpio-cells = <3>;
+		gpio-controller;
+		gpios = <&gpiob 1 (GPIO_ACTIVE_LOW | GPIO_PUSH_PULL)>;
+	};
+
 	memory@80000000 {
 		device_type = "memory";
 		reg = <0x0 0x80000000 0x0 0x80000000>;
@@ -227,7 +234,7 @@ imx335: camera@1a {
 		avdd-supply = <&scmi_v3v3>;
 		ovdd-supply = <&scmi_v3v3>;
 		dvdd-supply = <&scmi_v3v3>;
-		reset-gpios = <&gpiob 1 (GPIO_ACTIVE_LOW | GPIO_PUSH_PULL)>;
+		reset-gpios = <&imx335_reset_delay 0 1000 1000>;
 		status = "okay";
 
 		port {

-- 
2.34.1


