Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A64DC606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 10:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AT8FiKl+;
	dkim=pass (2048-bit key, unprotected) header.d=bshg.com header.i=@bshg.com header.a=rsa-sha256 header.s=selector2 header.b=njwrf6FA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ZgdwLacYRWOan3Xl4C1GDvskqNESmBgLCOSEkDITdRE=; b=AT8FiKl+0lo9YvLP7ipaKBnJ4S
	1JSAfYXvv1rb3osrnYoB9atwPQZTNLMJ1Ntd0LYjOy4pCiUSGe0tpw8XwzPEk/FFWqY5yFP1kaT1e
	I/NToKmUHMCbWXmJHrw0SdRcGk5NqPRY45ar8OSdCuDbB7ceOanEOs9UzxFpvOatot+gGe2wN03yo
	X/GWxd866cDzpBErSrDqEnTzv96aZeobUsC3FGIFlHBibr6aY+h2HxfEwP0LKT46Td/YmFTdLnPY3
	0N3OfISb/K9nKH6+fidnLgxaegdfPnLWqQZLxZEH3TZHJkKnkz7ZJVODLq72mpmVFuZFDDAIcNlpt
	duvFlPhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW9fO-00000009NR0-0zF5;
	Wed, 25 Nov 2026 09:51:54 +0000
Received: from mail-northeuropeazon11012039.outbound.protection.outlook.com ([52.101.66.39] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW9eI-00000009N3f-2xX0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 09:50:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=okP8VVEiuHxBGXPxYGcVGRDbj74cIR4g7MzDEYlr7gjJU1cB5YpuSHEzHmmoF6/FbRGnL2p+QQfmHbHzgXAuqbvlUETCvYbyMKi/u4iR+mPhsYhSI+KPWTRsWp9J8Z0pxerxbRMBG7Mq4iI+m6Oao7pbh5/BH51+AffupVMhxSTE5AthJWywD+eve8g3sdfdKQR+WNSK07YfJpHweTMQOG8+v9C7eZ31EUL/W9pRFmBR38rDtWB203F2CwYSqCrzYVU+GY1ufPbc5yLsna/wgDLEHcNxYFmoQ8bfsGm7HOar/zuSS5/AoQNMzK6Vg3BvX9i4U4o2p6YxIxW6wpAAgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZgdwLacYRWOan3Xl4C1GDvskqNESmBgLCOSEkDITdRE=;
 b=nrHIAVKLAY8l46t65RLTy294/8su/jXcKHWGHKsKmzFRjNST+PC4FN8meDZYmBi/zj+wyIPOY96ZAnvRZ8fV677VL9nZ9LUOQCBCGncZuTz4P9FmEKjXd0JLZSX1k2ZUserT0z7dJDkrKrXixGvSA74qkhif6FJPpx0VvvrV1RRvdM0YklPf+VEURohivWEX1D5aYai3OgDPiRq5MKkm8ys2s7PITw3WrwW8OHGzKbKSN7BAL/ABzsBYU13W7eU0lUFxvavIm9NffMYbIaCEQX0AcnjGXDHc8rUIDt6UhhSgnSnA1yZSm77jFS+RaSAmRs+686FzFw6HTUF41yjeXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.206) smtp.rcpttodomain=kernel.org smtp.mailfrom=bshg.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=bshg.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bshg.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZgdwLacYRWOan3Xl4C1GDvskqNESmBgLCOSEkDITdRE=;
 b=njwrf6FA1rDrIhZtXzHhUE1yNbIfL80u3lCMTN+5y54HyiInsy+MlPLjKbLpcFmMN7EtrQnffr2uqZBIjMNtKXujxs7WT0DX2Q56SmVFNo2YaPQhQfZh0iTMz6tSB//58dWqBxQ2DaVAcyItN4Vtqr11mZSPkNETyiio31fT5dbAZxRJzJMM0Poa8XN0j/ZmHZTgFp+qnJ9IC4qCHmHhtk19UffacNhFv2OUzFi/C75BDmfwU+slK1VL7aW3B3cJXlCrjdad8yz27GzCRnAiynH/5yVk3ts3ByDjKlbh2HFv9y58rk2CKHRhjLC7PUVRWk6O7FXHLsJWiB7ni/lQwA==
Received: from PAWP194CA0020.EURP194.PROD.OUTLOOK.COM (2603:10a6:102:4c5::29)
 by PA3PR10MB9310.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:4ad::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.2; Wed, 25 Nov
 2026 09:50:36 +0000
Received: from MI3PEPF00008482.eurprd02.prod.outlook.com
 (2603:10a6:102:4c5:cafe::34) by PAWP194CA0020.outlook.office365.com
 (2603:10a6:102:4c5::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.7 via Frontend Transport; Wed, 25
 Nov 2026 09:50:35 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 139.15.153.206) smtp.mailfrom=bshg.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=bshg.com;
Received-SPF: Pass (protection.outlook.com: domain of bshg.com designates
 139.15.153.206 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.206; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.206) by
 MI3PEPF00008482.mail.protection.outlook.com (10.167.240.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Wed, 25 Nov 2026 09:50:35 +0000
Received: from RNGMBX3002.de.bosch.com (10.124.11.207) by eop.bosch-org.com
 (139.15.153.206) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 25 Nov
 2026 10:50:10 +0100
Received: from TRTWCN12235.de.bosch.com (10.44.104.101) by smtp.app.bosch.com
 (10.124.11.207) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 25 Nov
 2026 10:50:10 +0100
From: Waldemar Rymarkiewicz <external.Waldemar.Rymarkiewicz@bshg.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, Sascha Hauer
	<s.hauer@pengutronix.de>
CC: Shawn Guo <shawnguo@kernel.org>, Waldemar Rymarkiewicz
	<waldemar.rymarkiewicz@gmail.com>, <devicetree@vger.kernel.org>,
	<imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>, "Michael
 Trimarchi" <michael@amarulasolutions.com>
Subject: [PATCH 2/2] arm64: dts: imx8mn-bsh-smm-s2/pro: keep SDIO Wi-Fi powered during suspend
Date: Wed, 25 Nov 2026 10:48:25 +0100
Message-ID: <20261125094825.3873696-3-external.Waldemar.Rymarkiewicz@bshg.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261125094825.3873696-1-external.Waldemar.Rymarkiewicz@bshg.com>
References: <20261125094825.3873696-1-external.Waldemar.Rymarkiewicz@bshg.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PEPF00008482:EE_|PA3PR10MB9310:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b70bef9-dc5d-4d13-0568-08df4ad98d91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|19092799006|36860700016|7416014|23010399003|376014|22082099003|18002099003|261028144727099003|11063799006|56012099006|261022075727099003|261026121527099003|261026140227099003|261009223027099003|261021121427099003|261022105027099003|261102123227099003|10067099003;
X-Microsoft-Antispam-Message-Info: TuxStOPpj9lXy/MzlnWKdKPQbFpEpEfN8sqWtQlFZLF3jt/TXkAXd4cekQt9tT6+ol2QPevTXk3THMHHO6usEj6KDTI72MnnWfomE1DU6tvR+65jbSCCqaMunao1Lg8ucBDx4AWPULImP1cW/SgUPBEQMzG3rc35/GT3GXiYn38j8JmwjSuy+R/oZqpB7mO2E7TouhZrkGb8zjd9WbHFTX93cS14tcVjjLHfSf8lK12cuxxzdgabpuBwBe+TT1hAvo9JMjFjXtH2QqxVlSJ/0HOPya46t6yVeG/xO1MO9riJpYNQlsMNLU0DigvUIz0LHP1tjacSSAO/1WtiYvQJmjQ5GehQF2WTrLee8+4WsBSR57DXn7GRCFJ/+zZNf/7O4EGldPVzfH0UdL1FN8G/LHJ6RUq0g7KT/IQoBqXj2M2pn9czusRSkpJ8HONp1IBe9QCC9hrv3CLzzivwiXhqSNVz9KF6aGX6yaS5mlfh0rysubpPvkvqZyq/Sz4Ok1oVpEB0AJhz6gMF9ZLixBgSsNiU51Sxp0h+BJp4JRiCr0U08/OV5WZ5f+/77IRYluFm/4inqUIrzWiHhlZXPRNdwEwKSL2ONz53iH9DVC4xIuyF4+H3GF0cawALsht+YAGy8m8REuWupnvyjyOceztl5Ni9cd5GC6V0w4bhkc+NlE+T3xRkhHMzvDMms9mWEOrOgCfevZKIjmBbi/QIOgr+tw==
X-Forefront-Antispam-Report: CIP:139.15.153.206;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(19092799006)(36860700016)(7416014)(23010399003)(376014)(22082099003)(18002099003)(261028144727099003)(11063799006)(56012099006)(261022075727099003)(261026121527099003)(261026140227099003)(261009223027099003)(261021121427099003)(261022105027099003)(261102123227099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: pE/xKq0SMKC1eHfw/hBc5Mn4kkz3d5wxy2hXM5kHZV2mv1VKieTl/5NwpIm63FUqDOVhaXopIRz6V2zRMDJ0M+Bq930iAsMtfR3lfIVTh7Fe1c7Aks7mvTkAhSdJg/XHHXXtlnsZeFOWmJ0Mdec59WA3zOc/4O3uQplJYqPc8QEj41brY2a4M+5mMjDzSxYUJRDmyrFzyyWfGQtoVA9hwxDgwvE37ZIIl9kpckiusyQQfQpuCdbv0HbtoqSnxgSo/1CJGrKSgEeGv3jYBT3Qa5ovE5otMfyW4czMlMdIqHC8CEpJWlM2lll9bImIgf7+pdq2Ex+EG18EqLDQMCK6UkKmPUseINe18R2f0C559C3r71GtB3Gz57IkYQpqa5wkUvhsiuN5B4ylsPE0esDEsfLLALOH6uzLvJftjDSa13Fa/V/X3eul7dQHXBG58ZfS
X-OriginatorOrg: bshg.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 09:50:35.2517
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b70bef9-dc5d-4d13-0568-08df4ad98d91
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.206];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource: MI3PEPF00008482.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA3PR10MB9310
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_015046_750279_B5A83C63 
X-CRM114-Status: UNSURE (   9.96  )
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

From: Michael Trimarchi <michael@amarulasolutions.com>

Add the keep-power-in-suspend property to the usdhc2 node so the onboard
SDIO Wi-Fi module retains power across system suspend instead of
being powered down and re-initialized on resume.

Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Waldemar Rymarkiewicz <waldemar.rymarkiewicz@gmail.com>
---
 arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
index 67c4f3e364eb..dee126fbf4e2 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
@@ -264,6 +264,7 @@ &usdhc2 {
 	bus-width = <4>;
 	non-removable;
 	cap-power-off-card;
+	keep-power-in-suspend;
 	status = "okay";
 
 	brcmf: wifi@1 {
-- 
2.43.0


