Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75976606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 16:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ykhe40X5;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=WfrHL1j4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=peFTPYaki5hbZwY8m1EKGJ0s5OlvPFjEOnjM/I72Ah8=; b=Ykhe40X5GT1I/7
	exrRh0VH8Hpjcf1LRGs+vTHKEKBGeylRDYuckqUORaIOHteDfaKuZZQv9wlVx6PYgg9PJwWlvqsNT
	eyGXRK+sJdzNr8HqzER9k2BOfmBqKLskfp69cx8LGkUEme56FIdRYoRVKYE5Ud40D6Wuv64lL4RBQ
	ZoHam6Q5s/U5FooAWtuAGYa7PvBHq9pyDRCFnQ6kyvvWiCU2VOPkLSrItXwQ7TyZsy388n3sEwzEP
	ZrIGQQs3Xs/HlwGLgczRq0+Ub0CvCEaUzQopyssAueI6edb3uowlwLkDnk1D6+/UWtJTDZmCHWU/9
	AMzNdR6rzWbN/4j7v/HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVtgx-00000007BtM-0zOo;
	Tue, 24 Nov 2026 16:48:27 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVtgo-00000007Bmt-2DxY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 16:48:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a7YYscEWYwWbxL+yWqEEzZqiFrRSB8Pv4vP63JQEUoeiv8P0+CIuG3//pyv9C4Lz3LHWdOUGJsAwOetOy//VIQjRK+W9ridcy3uTG0NrdpbSCzOw5r3loWCdOPDUXhKaSpxFc8Nk/y38Y2f30Iv3T+xtQyvOw7c/GKIQJJYfXWbTAOpS+BQ3XpP5DaeXTwSjzoYUeRTcHnbTqbANQ/g138XWIJ2mb2VMjVUXzZLeea+jPMwEr0MuTKmmr0qIgY9SzCg+TA/PzsrJpukb1Ki01q/4ywcvSAwCtiVGfAANd1JxArEpIZdgl/ipoqhd2GCgZtT5i2SSV0i3KTJJY7Njug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=peFTPYaki5hbZwY8m1EKGJ0s5OlvPFjEOnjM/I72Ah8=;
 b=ShyrxTxN3IOr+4hi4KKmze/G4d4xWNs4fXplpSyLQCF8gFjn4nTqx/tqUUW8tN1XRT6FkRSDR76a8QlOd0ZqDtcp8ZhkivdKT08XvZ1+X7EGG24BrEWJ4e8DuB8Ck1dEv3LQ1/uz108g7uPXhPbaDmYs0TJkpkh3RHpbNBvDh1ccIPSliReS2jJ716rE/OEwW/m/m0xH61c2l048wtV13c5Za+HYPK1hgseAWmPnVdYfxmMNxR8dgWChpjR7beAcmYHG6E/7eQmj5jozKVmNnb7KRz633hK27Umtl2rWyNBzpp4xdQNUWXWkHcSjgG4UMGDGa8WfoXxasqHodsxcOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=peFTPYaki5hbZwY8m1EKGJ0s5OlvPFjEOnjM/I72Ah8=;
 b=WfrHL1j43EMWmqAkmmTq9ujQksDbDJhYCMJDYMcVV5xR9thf1uphGoHKcWnrR3c3R4OEAgGV4o5AoXdvYvBOtduqXNF+rMYlL3eR9Lr3SvBGIArKgL0GSU5PovWXuO5FDGEIEUx86cFX31wxcYOhyXzwFJmn2NWQGRZcz7cFu5q4P2GtG6Rq0MB2jQagz27wC46Gf4LVPzkH3tHm5rEcxHtr7e/9zZ2/8Wnqukz3m2VHr08KkC6m24UZz7Me47dk8sKaJL64Cq0gzPY+OYS6WEVCUHrkeLM8Cav6SNMIMrXWLjRc6M1Yrg1r3C1CNsIdvfaq9DlqeNFlsY6RGl6snw==
Received: from DUZPR01CA0305.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b7::26) by AM6PR10MB9208.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:6d1::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.4; Tue, 24 Nov
 2026 16:48:14 +0000
Received: from MAD0EPF000008B6.eurprd04.prod.outlook.com
 (2603:10a6:10:4b7:cafe::5c) by DUZPR01CA0305.outlook.office365.com
 (2603:10a6:10:4b7::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.5 via Frontend Transport; Tue, 24
 Nov 2026 16:48:13 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 MAD0EPF000008B6.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Tue, 24 Nov 2026 16:48:13 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Tue, 24 Nov
 2026 17:48:43 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Tue, 24 Nov
 2026 17:47:42 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Tue, 24 Nov 2026 17:47:38 +0100
Subject: [PATCH v6 05/10] ARM: dts: stm32: add TAMP backup register in
 stm32mp151.dtsi
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261124-upstream_nvram_reworked-v6-5-ea0cfccc20b0@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: MAD0EPF000008B6:EE_|AM6PR10MB9208:EE_
X-MS-Office365-Filtering-Correlation-Id: a54f8879-b976-4604-5359-08df4a4abb1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|36860700016|1800799024|82310400026|376014|7416014|261102123227099003|261022115727099003|261022075727099003|11063799006|56012099006|10067099003|260925021911599003|260925021311599003|18002099003|261021121427099003|261009223027099003|22082099003|260925022911599003;
X-Microsoft-Antispam-Message-Info: BRzRa702+Rm68ih2r1iVDwIlKpuFxvwNY+u4u+ERFmmAnhAY56QmeYT3vpNmfqewHpejFk3cfn9EZDZOLXCR6ppi9TxPPZfV/7Q/srVr6ZkMugcw4RBrSPWGDuxn5MlIRHg3IQDEteHB2Kk/1ZGn34cIfqqSjOvg8KNB7ksyJEah4tkOfXV2wmTKQ6w2Rb/sK1nTHKnngKx5kTI+hndANNBUz4uNn+wmCeU+E7s4/i5t8oY274FfoN4T0r/Gvw1WHsPH0bK80RXyu5UpNFbBQaY3/VqXsXQ804dO0af5D1iptQWZbAnp7D82uDe9QnGzUg1iRqSmaU9goHMzkx1kut4VNGe2tVcwY8sLQZrD4h5NwDfYZwqPo5eeIm/oY3MSE4NbFdK4+/fRY1EhjiitLg5aLnoMARFJIN4lKj9FGqeWCdphPgXtKGzzqbXR07iuUpv+arx3TvLksqArWB6cGd1BAk0e/zeyhH3UlU96lu4Pn5awwF0Ivn3+NIPjyQtxvY/7v6djkOAtjRaa04/61Bl3XnhqYmbJkCTECut+siZ/iogEHcMPH+2arJHHYdvGv59Iz8rxEwityylJs+u5EsGl1aDWOux3Du1ZB8p50mmtR91zlLELpm/AiN+ESfw8yK9NOBneuN6ZtyWO3zyN4BWDcC94HwCIg/PervwA1cVZn2THD5OiH7jLRw+PtT9eHW2YQjF/9TxFDP16spDyrg==
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(1800799024)(82310400026)(376014)(7416014)(261102123227099003)(261022115727099003)(261022075727099003)(11063799006)(56012099006)(10067099003)(260925021911599003)(260925021311599003)(18002099003)(261021121427099003)(261009223027099003)(22082099003)(260925022911599003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: wx3QtPRG3LIZudkHf66m1wghq/Hc4nnN9PDOZ3sAb2OC+TOhdhsBJdlpEQK5m9TyvdTLyDLb2e3kCari9Hu/ehkPcq+oehSYuNkOYKm0OjzaSOzSrU28pKy1V/ZfufIYBGddD1R2z6gQLqRCDhKRbLEzG2DrJeQkycFKrLQy+4AaGVdri98RxmBP7QcZR/PwXgSUMjHWV9ebPr+ohow7tKbRDwI3f6RARz9JJFt17N8ppdAptkivNlZJQoH3UKDUNXpOGwWeCvvL75oAZGJxJ5H6xxREFJmMew7ONzpwMLBfsCm/rhV1w49WtqrAwZjsm2QkbnlaWCC6e6TgsbBmcHgf1o718jaCzPCgjnLCkshsdriTXKOkkrF0kXzur3tqRDgkXIc0ml0ZiFByGpdWu8SV/wShcpdY2p5EJ2yVqHCyqPG4VhxhAaCYSnV43g8N
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 16:48:13.5876
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a54f8879-b976-4604-5359-08df4a4abb1b
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: MAD0EPF000008B6.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR10MB9208
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_084818_578511_243A7306 
X-CRM114-Status: UNSURE (   7.68  )
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
 arch/arm/boot/dts/st/stm32mp151.dtsi | 83 ++++++++++++++++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp151.dtsi b/arch/arm/boot/dts/st/stm32mp151.dtsi
index ae3188373238..ac7ed857cbf5 100644
--- a/arch/arm/boot/dts/st/stm32mp151.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp151.dtsi
@@ -2060,7 +2060,90 @@ i2c6: i2c@5c009000 {
 
 		tamp: tamp@5c00a000 {
 			compatible = "st,stm32-tamp", "syscon", "simple-mfd";
+			#address-cells = <1>;
+			#size-cells = <1>;
 			reg = <0x5c00a000 0x400>;
+			ranges;
+
+			nvram: nvram@5c00a100 {
+				compatible = "st,stm32mp15-tamp-nvram";
+				reg = <0x5c00a100 0x80>;
+
+				nvmem-layout {
+					compatible = "fixed-layout";
+					#address-cells = <1>;
+					#size-cells = <1>;
+
+					wakeup_sec: tamp-bkp@0 {
+						reg = <0x0 0x4>;
+					};
+
+					m4_security_perimeter_exti1: tamp-bkp@4 {
+						/* see cortex-m4 wake up feature */
+						reg = <0x4 0x4>;
+					};
+
+					m4_security_perimeter_exti2: tamp-bkp@8 {
+						/* see cortex-m4 wake up feature */
+						reg = <0x8 0x4>;
+					};
+
+					m4_security_perimeter_exti3: tamp-bkp@c {
+						/* see cortex-m4 wake up feature */
+						reg = <0xc 0x4>;
+					};
+
+					magic_number: tamp-bkp@10 {
+						/* see ddr and cpu wake up management feature */
+						reg = <0x10 0x4>;
+					};
+
+					branch_address: tamp-bkp@14 {
+						/* see ddr and cpu wake up management feature */
+						reg = <0x14 0x4>;
+					};
+
+					fwu_info: tamp-bkp@28 {
+						/* see firmware update info feature */
+						reg = <0x28 0x4>;
+					};
+
+					copro_rsc_tbl_address: tamp-bkp@44 {
+						/* see cortex-m4 management feature */
+						reg = <0x44 0x4>;
+					};
+
+					cortex_m_state: tamp-bkp@48 {
+						/* see cortex-m4 management feature */
+						reg = <0x48 0x4>;
+					};
+
+					boot_mode: tamp-bkp@50 {
+						/* see boot mode selection feature */
+						reg = <0x50 0x4>;
+					};
+
+					boot_counter: tamp-bkp@54 {
+						/* see boot counter feature */
+						reg = <0x54 0x4>;
+					};
+
+					m4_wakeup_area_start: tamp-bkp@58 {
+						/* see cortex-m4 wake up feature */
+						reg = <0x58 0x4>;
+					};
+
+					m4_wakeup_area_length: tamp-bkp@5c {
+						/* see cortex-m4 wake up feature */
+						reg = <0x5c 0x4>;
+					};
+
+					m4_wakeup_area_hash: tamp-bkp@60 {
+						/* SHA-256 value see Cortex-M4 wake up feature */
+						reg = <0x60 0x20>;
+					};
+				};
+			};
 		};
 
 		/*

-- 
2.43.0


