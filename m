Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF7C606A326
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 16:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ipc0wfLp;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=O8wHWHwz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=RvfpobJLqPxP8+OSP0sL8/VtaHPGJQNFwDAQtUC+4uw=; b=Ipc0wfLpYaLld+
	cnm1kIJ0MVL4NJJh4wVqJk+pAgFyeEPcS1OTy4W6CTEDHteA0F5M2vl0mPof1r1yB/tQySJD4ZkDW
	aV7TwtSdoVfE+GUGZXdDKoUi0JeZ62cS6//UjGT914YMODFWlq8ChVEW4MFsFDheqlsFGrvFGMyAe
	VusoX6ujD7LrO7BTyiBT3l5PkvKHhES3OFt9SRMHwYXS7P3geuLqhKmuzZUDtfMDVMyYPsc/LcRYP
	75YQKfkUj3CtbZpwtX7h1YgH4B3CFLe9YG5y63ojpL6MSK0QMhRMpkjXQAOMPWWNdKZactDH7Y3vR
	WT+qog3L49hZrukoTAPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVtgo-00000007Bn4-0VgT;
	Tue, 24 Nov 2026 16:48:18 +0000
Received: from mail-francecentralazon11013053.outbound.protection.outlook.com ([40.107.162.53] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVtgl-00000007BlO-0VNY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 16:48:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aeo1Zh3+zIYweBz/axY8s3SgQddQnWAVGqawmqh+Eq5m/AG4Zxc6qreQuQB1O/7HIKQ17oJVYivwiNmhaoCBC0AuvvxkUJq7aZz4w6gECfM29mIxke5j+EkTebsJdojyeyWhhZCMvCCm6slzPPmKaj518MHfDKRL836mBnjk3iFEtw9okffwqZ2AobRr5i/DOvyxuZeQ5Z3eNvjP1xTZZBbyRrvBdRdra/u5RVfqDpRzTJXh47Ag71RmyHZd46grkWIhd7jiqK7og5F0COZakEev/OugesIPHJ7ZI37zAnV3jrusiAvSExAUazgBFJYbF5+rUo5iVXfqtlMN6psfkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RvfpobJLqPxP8+OSP0sL8/VtaHPGJQNFwDAQtUC+4uw=;
 b=g3ihtsZgBirFUc3aZzsQUMg6U0PMTBtNKXe+jvcdYah3KskcPuwhA79Wfcap9IBlu1FwVk/ODMx33n9kx7excqwUgQVBNAyhfWAOln5qBNFcnRkGBhcgOVj0XFRdLyCSqWQYuSOF4mDyX248Met3qQ5C/rzlaptwSvEcw+++C1ARx9KuUVhMX8jRKgjCWOdQkarifVLGeAtpQljwjXzgyjtJ8LcblTJmER8kh42RfaH3Muzjsrq3oP/0KWXW0Xkz30r54O6tHISrvRW0wNWhEoXPnFtKewt5psRivhAWscJolE0Mjp/H1tBvjolris+1x7jcNpUGKmXntVfoGfzWSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RvfpobJLqPxP8+OSP0sL8/VtaHPGJQNFwDAQtUC+4uw=;
 b=O8wHWHwzSRUfa1acDIEUUmKxj4RtqFtGOoLrC1+eZ2QyMq4T+LOj8i2mgDNaV8hHO5Lin5Jdaapahh5cUck4i36+r3i0DkclyP5fkK6lDXNOR97dRcuD9JC6MCHVJUvkX9Aj87UmBs7rGaeYsZnSqZK9AylohGX2VO3PkicAfmlidcyei+/1+8m7lsLkO4TRCSOfiIqmecO1B9hPtMYBxMAn7atXSr7QOxaHByj40548ZxhU9mCHOhIDnj0to4FL4QeLvOWNRQnTnO+pyvLhuegg823HNCtkZ1617yjawUmv3l5FFwDI9EETsS5LqqWH7UtIqkjVvC1P3wb5IHfK7A==
Received: from VI1PR04CA0045.eurprd04.prod.outlook.com (2603:10a6:802:2::16)
 by AS1PR10MB5213.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:4a9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.4; Tue, 24 Nov
 2026 16:48:10 +0000
Received: from ZR1PEPF0000E6B6.eurprd07.prod.outlook.com
 (2603:10a6:802:2:cafe::45) by VI1PR04CA0045.outlook.office365.com
 (2603:10a6:802:2::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.15 via Frontend Transport; Tue,
 24 Nov 2026 16:48:09 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 ZR1PEPF0000E6B6.mail.protection.outlook.com (10.167.241.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Tue, 24 Nov 2026 16:48:09 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Tue, 24 Nov
 2026 17:49:13 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Tue, 24 Nov
 2026 17:47:41 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Tue, 24 Nov 2026 17:47:37 +0100
Subject: [PATCH v6 04/10] ARM: dts: stm32: add TAMP backup register in
 stm32mp131.dtsi
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261124-upstream_nvram_reworked-v6-4-ea0cfccc20b0@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: ZR1PEPF0000E6B6:EE_|AS1PR10MB5213:EE_
X-MS-Office365-Filtering-Correlation-Id: 99a25180-c49e-4682-93fb-08df4a4ab8d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|36860700016|376014|7416014|1800799024|82310400026|10067099003|11063799006|56012099006|261021121427099003|261022075727099003|261009223027099003|261102123227099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: gDcJFBUdXYL+sH3g2J0ZwcveOH+D8se1JULwhiAjKQRbhwUW8Af9cPHD+1GM8B81/lSqf4BL4IZSFZ61LubHU0yFyl2Q+XB/Tu2EExtkFv1Og3pnNtoi2QGCK/IUAmbgy8VJHppkZ7emfXLS2M9jPRvnZr2POyEN/ClHHha3nh0Ue426zJJdq70/a07d54HyIZQW+2eTV388QPfL6kcfUUOMFKHVINjwggNNqHqz6aRSbEfk5dG2axMZt4yyLW+WT4vxc2Bi0eASLuxT5bUn0BHPDm1cxAiDzlfLOvvjfLaAyXraMRlC82JRt98zqy96pY6ax4CgaaxgrrcNt+PCfPI88VDBYhKLv1PcFhb577Y8LFJsC8c5w2OAEsgqXXsG5PbXbgtwUyL15DTuEHpuoxJHz9DmF+ZkaV+AVjuXa1AL8VDGOU/RwMGUk9LBsi/JxDaYBAGYvykywZ6GS6sHinQEIh1Wgg8o8PMqBruz9pTczyMijr0P14DINi8Ep5ao6jgjed8xje/QQidiRSqFFm2npIAOVqcIqW+66/DGpP5Y3AQ4g0J1M8mByZzC/l6OgO0B1jksyyCQl1NvdxCbS27E/63eppDM/IZokoGcMMLjIOZvVMJzT29QzETFgktHSP9U0zxIEEN5GwEl9nC63+qVMNauFJc5+d2im02NeS6FBpe34lKObwoscqD+j1POagVOUGFyTEinBdw4egxmvA==
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(376014)(7416014)(1800799024)(82310400026)(10067099003)(11063799006)(56012099006)(261021121427099003)(261022075727099003)(261009223027099003)(261102123227099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 1y48WaLXaK6YkyKk4vNbgDfyF5pa0ArLoLh6jDEdk8wu0uSjVUw7aax855C3MqXvL2bO2Iqp1U8zRzCZWLfqHfgeANnP4nXvTCdF5IjUnN/hLszX/HqRcWqiuQJA1c6x4/qge9BAsHqlTOUB9eX8rf7pZsbz9ZesDBWu3mn3UVQ2IxYpMkr7ogP8YRq/2s7u+wMJK7rGqEVoNpS2qjyono+CtlT9Qyw3w+vZBdeqiy6Ah4epEXta7Zpc2tiDdZDGTJ+M4WheYXdHIsATYnxK9l1Z8Z6y5C71hQ5kSzJ+bA3CDmfAEt3WkYuuYn7m7gvoCrzHOuZBwzlmlC4SeDomB1vMVQQCb/TEfHlpxF/sXf9tAud1RyjO2vZoPap7/wMblMpq5hqdAbGtBEbrZjNtmA/3hPUiQUngK00DBhmmMAkGQixxRYCZ/3v4oegNIix1
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 16:48:09.8364
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 99a25180-c49e-4682-93fb-08df4a4ab8d0
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: ZR1PEPF0000E6B6.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR10MB5213
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_084815_717194_0C99C9D5 
X-CRM114-Status: UNSURE (   8.17  )
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
 arch/arm/boot/dts/st/stm32mp131.dtsi | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp131.dtsi b/arch/arm/boot/dts/st/stm32mp131.dtsi
index ae45c2023afe..e1e943e9d5a6 100644
--- a/arch/arm/boot/dts/st/stm32mp131.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp131.dtsi
@@ -1942,5 +1942,39 @@ gpioi: gpio@5000a000 {
 				gpio-ranges = <&pinctrl 0 128 8>;
 			};
 		};
+
+		tamp: tamp@5c00a000 {
+			compatible = "st,stm32-tamp", "syscon", "simple-mfd";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			reg = <0x5c00a000 0x400>;
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
+					saes_secret_key: tamp-bkp@0 {
+						/* see saes secret key feature */
+						reg = <0x0 0x20>;
+					};
+
+					boot_mode: tamp-bkp@78 {
+						/* see boot mode selection feature */
+						reg = <0x78 0x4>;
+					};
+
+					boot_counter: tamp-bkp@7c {
+						/* see boot counter feature */
+						reg = <0x7c 0x4>;
+					};
+				};
+			};
+		};
 	};
 };

-- 
2.43.0


