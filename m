Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E4EB606A685
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 16:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mWP16P1+;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=Y0khk93Z
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=N54DgVy4XZcAQ0m9k/l3C53+indIt2igxkY08LPZUU8=; b=mWP16P1+32oLqj
	M7hGpWb3n1uiotfYcXH2IL788OlWDbgj3TJhTV8DWRqLlk9f668WRP09aPeG/d/GOH5Cimfh7WiR0
	O6DT6ynKymshSePsZYiTxq3OM74NjGa5VRfTjiR9Hy66upwLuyrY8ZRNywwibpD2vCWGH5GhlZdaQ
	5CxDfXkBGDctsPb2ERlyuxDVl1zTOc1Q4hThrrF44uCdqigr4FnEmea846wI0aZ1bnd8iL8UmXhL/
	Xfblw1syWwFWYLzVYo+5fPC/MYZazmUMefwNHgmVxnXpDCoPYJ4RGkwe+qXdJnFVvctkUf8sNfOQA
	/8jkGIstHixtoHhOQZJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVtgx-00000007BuB-2OMt;
	Tue, 24 Nov 2026 16:48:27 +0000
Received: from mail-westeuropeazon11013036.outbound.protection.outlook.com ([52.101.72.36] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVtgt-00000007BpT-48ua
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 16:48:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DDbA8Y9EDnAmmRR4z02k4P3Rr4HTJMhiFOPSQLTZjyfm4kKB2OQk8eW8daVcXc3Y81hZcyqq8NEuCV3hi/A8pf6iqntm4Qedtf/M50cy6vnnt32DKFg9qt5TQZdTUD7WasTgBgBQIRNXUtozfMhP0TpPEuA168P8zArAAEjA1GD8ho/nSa9UJ2XUFgvuUcaKUMdunGsy4RLSHceHK+RN2JyvYF9r7fvu6Wleepsyg48MINCdeW7S2WUbmqZ2v5SNix6Pue0fuEBC1yRYdEvNa2bg+pXZ1OupkwUymhrq/Q3ogHmu8627Ka8nnnAGg28om+x7DFjA3sXsxyBKBwXsvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N54DgVy4XZcAQ0m9k/l3C53+indIt2igxkY08LPZUU8=;
 b=BQTp/pHPMWShMVg2ewj7SWJigGgbZHh7cZjhHL44bivpTQSpq23+188fdeW/eF3/OYQP7OqDi4s9KEpTitrwfKjNM3ZiXJpdCJON6mYKfTH7FvdIN/7UL578ePtGNhOkpJonUOpV8q2is11BjGui8+9EC7epwUFK1VphWp4M2lEiaq4P3OL6japaovyzUXbiT/GMC3R4xcr8FcqPBqihu5vXTw81GsyOWIlQdNSxDFGMy0Tkp3vn3FbR9eoqVyRcK0BxeisbtSkZwgyK+jKLkZN8OE0mCJ40RZBtikKtBsRQjrzujFwpb1x5v/c66Je32EUJRcm+XHNp6oiPhbpxoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N54DgVy4XZcAQ0m9k/l3C53+indIt2igxkY08LPZUU8=;
 b=Y0khk93ZU80Qt+cr1O5zod+I7vHuWFZVzD5IFkJH1Ep1fCOQ+gtdPpUnxhEbT5OqQWcqrtmIrfL5dkXLzvBfFetuOUMi1TBv3Eq81Bp4lhYkSTon64vvfyNSjRx1H1AE9njmekFUJDS4prnZK+3bKUfV9eJ5n0hoLdAPpv8489vU5Fum2es0kkt0PBKFjfk4BJWs2yPa69amUOtd8f1aCemOVKrte9NlMqQhc2OvEEYXnQrJ2zUVso9BDLUOacVh3ki859RWVg8v7WIXRMz8mNnH0IjgVmPnfbD2IQXfDQtXyAS0+Pjh7KCyPYl2M2DtLeAYMLr44G5EEXywzJzGKQ==
Received: from DU2P250CA0011.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:231::16)
 by GV1PR10MB8345.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:1d2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.3; Tue, 24 Nov
 2026 16:48:17 +0000
Received: from DB1PEPF000509FA.eurprd03.prod.outlook.com (2603:10a6:10:231::4)
 by DU2P250CA0011.outlook.office365.com (2603:10a6:10:231::16) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.14
 via Frontend Transport; Tue, 24 Nov 2026 16:48:17 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB1PEPF000509FA.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Tue, 24 Nov 2026 16:48:17 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Tue, 24 Nov
 2026 17:48:44 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Tue, 24 Nov
 2026 17:47:44 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Tue, 24 Nov 2026 17:47:41 +0100
Subject: [PATCH v6 08/10] arm64: dts: st: add TAMP backup register in
 stm32mp251.dtsi
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261124-upstream_nvram_reworked-v6-8-ea0cfccc20b0@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FA:EE_|GV1PR10MB8345:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c0dafe0-26e3-46c6-7f57-08df4a4abd65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|36860700016|7416014|376014|82310400026|1800799024|10067099003|11063799006|56012099006|261009223027099003|261022075727099003|261102123227099003|261021121427099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: QdKHfL1AsByKtmeTzxnaukSyXzRAjbZX6E6eyGN9vLQSkTN+yITrkJVVQMPNZsQsaQNB+LV37j3xYhVnjcwHiLLViawqEyeEAfheOsre1PixUo6Z+o3BGLbXfFEjwfCWgyw57g6fBjPPudh5E70D962x501x4PxgyBdXv14SZRQd1EHbUbEhqHrR+vA5czEliplmr8KtTvGdUMe8TVHIsPcgfnv0rhFtNC5PGAcLWuAJJzP18/DjMUlEqjhlRNWaawXyLSXXykMfeDLp7VHwFJysOK98mgav5LgcAKRd9a+vScwyOKLy0O8iDHe2xKBnjrR8C3fj6ZvH/sG6P/2qv9vqqI+hgDKKqYjiu1dOAQe5UMDEOq+nQIEj1WA+V4E6MFyffTmGgdILfSlI/NQgyXYcIsWGGKj5n9Z5CuHip1XXUFg9/gRPk3cXB2vspt6LYfLV0MB421KtfJfEELhuqpqAjOCyu00a8pakRUVue0WXS59TE/9WAYBfKPlNx83HzQe3q3DsgnRJ0Z8AKkmsvCB2HrhWgxqi6/zHhPh0yhR9fhAdXpCRvEn/mK85rfB6ljHQoxPHJe/cQ0RFrrNbPCMbbKuWRLusF2ILExd5wEurmIkRySsyY4ILbIZ2NAOC5HxI3KJG7vt7G+eZgOrRBOg6tjrONJtvxAZmEd1RaeZXEILS1Npe2XaRJh09z4oU
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(7416014)(376014)(82310400026)(1800799024)(10067099003)(11063799006)(56012099006)(261009223027099003)(261022075727099003)(261102123227099003)(261021121427099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: cLL0peyhDz3v5X9gmP6IIn0cNlM5uUwTIyHh8OX5dZSZo2o4/x0zohR9fAW0JYf3EZvAEjoFqsU7/uu3/fdC/k6j592jDumQOh6a8SDNR4IS09fxhZUyr5iHr21nyGl4F7U8i8PsIoOWeH3llnTna6EjG3pbtqWCsqLNWAX1LhHsz4N8WnhyLlYaF6Uk9v1yQgZVnXccKMnpIhtsWW2SEi8VoYMKsQRSnpDXxdaEgtGsykqjHT0Gp6IDFCoI+6OUHTlcLdqoYBvEueU232rjPY5rV+wMrX7EYiOdptsVPT+rOyejrGYjlO/aqZTIhj/G6Hi1fqkbSt1T1lrVVEb0STXGq0rLeQa2GXwoFsE666Gs7og7UFZ36TG0OR1D/2QK80THaqMFeM30B5RxHG4mL1ohVqtC+odS0jhgrUrUyt616n7xGDWLaVmziYrNM2nw
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 16:48:17.4371
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c0dafe0-26e3-46c6-7f57-08df4a4abd65
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509FA.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB8345
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_084824_036775_43A885F4 
X-CRM114-Status: UNSURE (   7.80  )
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

From: Simeon Marijon <simeon.marijon@foss.st.com>

TAMP backup registers allow information sharing between different
software components/execution levels.
They are described individually as nvmem cells.

Signed-off-by: Simeon Marijon <simeon.marijon@foss.st.com>
Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp251.dtsi | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index dac3d2d23ff0..9748834ae9de 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -2242,6 +2242,37 @@ rtc: rtc@46000000 {
 			status = "disabled";
 		};
 
+		tamp: tamp@46010000 {
+			compatible = "st,stm32-tamp", "syscon", "simple-mfd";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			reg = <0x46010000 0x400>;
+			ranges;
+
+			nvram: nvram@46010100 {
+				compatible = "st,stm32mp25-tamp-nvram";
+				reg = <0x46010100 0x200>;
+
+				nvmem-layout {
+					compatible = "fixed-layout";
+					#address-cells = <1>;
+					#size-cells = <1>;
+
+					boot_mode: tamp-bkp@180 {
+						reg = <0x180 0x4>;
+					};
+
+					rsc_tbl_addr: tamp-bkp@184 {
+						reg = <0x184 0x4>;
+					};
+
+					rsc_tbl_size: tamp-bkp@188 {
+						reg = <0x188 0x4>;
+					};
+				};
+			};
+		};
+
 		pinctrl_z: pinctrl@46200000 {
 			#address-cells = <1>;
 			#size-cells = <1>;

-- 
2.43.0


