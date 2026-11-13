Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A40606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 14:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KiLZ+DaP;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=K1YxhUhk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=XbNWapuzSaf5KG22a7I2EIHG5FH6oWrYJcixLnqJUbU=; b=KiLZ+DaPvxq1Ef0S5ecGg9/3/R
	0UjAaZrCeaVa7Q71jAL+Ox6MwrVPwytYRMENEnfo2U6VxCx2dUivRTlZA9yx2E0WHuxTlGEWw9RzN
	VTTxhAgYqpfYUUoN36txFoHcVSN/SLDdWgu2XdaRLOPigYaL/PdD2oYlQwOgAzOHW3dk5UzZYiqic
	H/amFgSiAbBfFH5s5SFev2+Ny7QGtLsAE982oIA4JXpXtzKAtnUZrVofR9oNfyO0pEkIoHg5gJ6m1
	U3jMur7hwQJY0LZMzS7yUDg/Hp9CCibS07DzrpaodDsSQ7FwFwiS/ZAzFjWkHtN9kFhF5JV/Ngty2
	OFeW1Izg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRsA1-0000000D7wq-0Uls;
	Fri, 13 Nov 2026 14:21:49 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRs9z-0000000D7vY-26ZY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 14:21:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xgaJ24ygOHKIEGehpMyp8dGzoYpgRTo1Dl47BSDDLecP63ijRQ7J/3TuoeMYxZDEiidCb2kisNeD/ZqVoO69QrHeb/K/SC6oJ0C8qyYnlujI/LHLrmb6J4qf0jq0yvYh4v+/oqVjI+w7nZdojQCLjbci4Utzvk/Zw81DGsqDUiE7ZxddRxjh73N11PfyB2FDcX5NSyB0G1j38lmDG+nL4hb9suZMV5UWmG2OGpg6EuwwuTd+J80W3v/u4wgMG+99zXPKeMhnjTUZnRloB5TdEJu4lZSjGpvJzWPX8zqsz4mtWhmP9lzPhTl4rNeSkxygFw+AvVcelvyDIwxVJcL0qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XbNWapuzSaf5KG22a7I2EIHG5FH6oWrYJcixLnqJUbU=;
 b=V5GiticHHe8cGEEJl21UVyvWNnO+YwZE2qA3Cf97jLEUVOhgR2tCm8mzHQoaoADpmUsLh+krQj0wQSy9bZSs+0HPFHq6RspazTqpr8MWbxfwlAZIgAs50RR17MJDbe2MOB23W5fHf+hRqf5izvg9u7hisrK5xKzAI5owtuvtvcmYb0vr2EhHFGY/zfyLHmGUZGbCd/izRHe4fuU1KoFIY7GYTNCp625qcjTuj2YvKfvWBIg5DWYJH4gUjWrEUvrBtj/HgnilIfJdar+/hw/18oSv2MeBYYb2oxLz5Ti4/kgzPrke1TKSHz3IPtzBOw9hNbtzKMKEDpJ3m4DZqHC6Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XbNWapuzSaf5KG22a7I2EIHG5FH6oWrYJcixLnqJUbU=;
 b=K1YxhUhkadmDPqX0VvcwMfc4KYKVQe5eBfNtAXuXF6i1C0svfoExf2PgquHh2NUc+V/mf+P7TU9HrWGTzE6tBxeBgcqhH5TJJ/tgMKx7SA2iep9M1m9R30Hz/PErTzxifRAc1u6PyfZBDje/sIR3ifW78v13oA7x8LLSbb+DGSL4NNNpK5C5XFL2Nm7gLPqeJRvd9l2qRPgc7/rVy3dDLKLJ753jRsqjI5CrKhCc6NbOLyaC2hZ8rHCz0QvRTQbsMy7awCC59TXMai6VXr654YuuvwJrWnacCYCeC7p/uN3L0mPhSStCluSgn/Vae9uT0/HCA01IMLJAt8Km+I31Sg==
Received: from PR3P251CA0010.EURP251.PROD.OUTLOOK.COM (2603:10a6:102:b5::17)
 by GVXPR10MB8252.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:11b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Fri, 13 Nov
 2026 14:21:43 +0000
Received: from ZR1PEPF0000E6AD.eurprd05.prod.outlook.com
 (2603:10a6:102:b5:cafe::15) by PR3P251CA0010.outlook.office365.com
 (2603:10a6:102:b5::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Fri, 13
 Nov 2026 14:21:42 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 ZR1PEPF0000E6AD.mail.protection.outlook.com (10.167.241.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 13 Nov 2026 14:21:42 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Fri, 13 Nov
 2026 15:21:57 +0100
Received: from localhost (10.48.87.100) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 13 Nov
 2026 15:20:33 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: Linux STM32 <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, Patrick Delaunay
	<patrick.delaunay@foss.st.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 2/3] arm64: dts: st: add SCMI voltage domain regulators for STM32MP211
Date: Fri, 13 Nov 2026 15:10:40 +0100
Message-ID: <20261113151038.2.I7bc9202635a4961733bf6f80fb06d89703bce1fc@changeid>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261113141342.557258-1-patrick.delaunay@foss.st.com>
References: <20261113141342.557258-1-patrick.delaunay@foss.st.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZR1PEPF0000E6AD:EE_|GVXPR10MB8252:EE_
X-MS-Office365-Filtering-Correlation-Id: f4a84560-5afa-4922-8881-08df41917071
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700016|23010399003|261026121527099003|261009223027099003|56012099006|261028144727099003|11063799006|261021123027099003|261022105027099003|261021121427099003|261026140227099003|261021135927099003|261102123227099003|18002099003|22082099003|6133799003|10067099003|3023799007;
X-Microsoft-Antispam-Message-Info: AprBiL2dPSnCFez6vhuQarISNX/rNK3AT1T+My7x0ncOVaARJkxoYSsX+E+pmsYsCW3B2khXnCQ9aYK3yx66ZPWeTz0Y9alA+BBFSETp9FqXQxkiugQ4VBxZDxKcYHgWSIpV774XxQDgQ09cxNV8LHRDHwz8tClofN5iHpmdmXvT46tJt6htt/dCZG8zGbTmwn+dTgxxgiLGgtaXxxsDR2f/SEeqFb4LS3p9jjmIwS7F1WjlxEWtNppZ0p4NRq0dj8vx/UdM28shnoImqJQ4o1RT/vrT8hHaD/5YyREwiF5+i9Frq3dKzmG5ZvdbtP2zdaAmenex9tox2W5ISuEU3KVl1tD+gDRrv4EcV6+Ga+vYAdUTbCxCm1laUcJJ8SYnoJB6RuE9CvOonMB+2oOWccRIERNHPRg46nKtSU0a9RHCABANDOKco1Qrqasz74CDJo3Gh5tzmlWpVCGRfXG4I4wA4zH94qSwID3ukoKEiKzV3DXWWmNueCi8dL6fExRWtPXKuF7aOsWV1Bnr3mzm1BQQ3qSXMQkAfJNgYkSi/E2XA5dbbeS/OGUql42Nb0rC+b8hOrhxhAExP6oj+KvKavE/xEpJjSKutSiMl8EIYDAzynUThLANsks4aYM199Wvv3wjRz0lbmHukuySLaH5IKaPwlOdl4bVAdyGngs1aJuisACBf2LAlj2nIEG2cR3a+lxO4lk2PcMQZbcv1SRPRg==
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700016)(23010399003)(261026121527099003)(261009223027099003)(56012099006)(261028144727099003)(11063799006)(261021123027099003)(261022105027099003)(261021121427099003)(261026140227099003)(261021135927099003)(261102123227099003)(18002099003)(22082099003)(6133799003)(10067099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: +ENA1aFPVQb0jzN/D7Hu9+Xx8HeBLt5TUXgioG0NMwTwVAHI0rpHDdaMHlpORZEW/1NESuqFgiFi99SY8iHCrOceuW+F5HOtTDuXQ5cI2USUPCejovITGmJ+cz568TaIxct7GIPkYocho9Q+kJHbuJ75APguPm06E845FJlMloEL702k3gft1AOyRjLcXNCAYGXnf94POWMR4PWg2YqCSb7lKZteYS7yKsnCzJTZgc044Pa7IfxP63QL7vE/7eLfx3H3kUWQ35yF42XMiugbiyQ1SfD5smUTrsv1i4Eq9yfttaaLTjd4H04LZRSXLwPHVmkDzTPuTwgLztW6Y4W/ag8rZK/fRuyxDEnFXyTUOctamlhnSGvH+M/IAIMhbxtLDEUC8MJ+sCBiLN5Q1KNAgVmSG2JP358heLaI6UhBx/EDmQ5ok3pQ7sRj/cUhSk1c
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2026 14:21:42.1854
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f4a84560-5afa-4922-8881-08df41917071
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: ZR1PEPF0000E6AD.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR10MB8252
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_062147_550411_173D60BE 
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

Add SCMI-based regulator descriptions in the STM32MP211 SoC DTS,
covering VDDIO1, VDDIO2, VDDIO3 and VDDA18ADC voltage domains.

These regulators are exposed through the SCMI voltage protocol
and will be referenced by board-level DTS files.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 arch/arm64/boot/dts/st/stm32mp211.dtsi | 27 ++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp211.dtsi b/arch/arm64/boot/dts/st/stm32mp211.dtsi
index 4bfd58b26b51..8ae19e1aedcc 100644
--- a/arch/arm64/boot/dts/st/stm32mp211.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp211.dtsi
@@ -4,6 +4,7 @@
  * Author: Alexandre Torgue <alexandre.torgue@foss.st.com> for STMicroelectronics.
  */
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/regulator/st,stm32mp21-regulator.h>
 
 / {
 	#address-cells = <2>;
@@ -67,6 +68,32 @@ scmi_reset: protocol@16 {
 				reg = <0x16>;
 				#reset-cells = <1>;
 			};
+
+			scmi_voltd: protocol@17 {
+				reg = <0x17>;
+
+				scmi_regu: regulators {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					scmi_vddio1: regulator@0 {
+						reg = <VOLTD_SCMI_VDDIO1>;
+						regulator-name = "vddio1";
+					};
+					scmi_vddio2: regulator@1 {
+						reg = <VOLTD_SCMI_VDDIO2>;
+						regulator-name = "vddio2";
+					};
+					scmi_vddio3: regulator@2 {
+						reg = <VOLTD_SCMI_VDDIO3>;
+						regulator-name = "vddio3";
+					};
+					scmi_vdda18adc: regulator@3 {
+						reg = <VOLTD_SCMI_ADC>;
+						regulator-name = "vdda18adc";
+					};
+				};
+			};
 		};
 	};
 
-- 
2.43.0


