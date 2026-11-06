Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2936F606A331
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 16:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dU9Jb+Sb;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=Lr2+gm3X
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=aQwAv6WnSs+J2ruf4myxwVwMq1MyTJ3pd5/KTrKAqFo=; b=dU9Jb+SbnpMSjOQQsVf56Y6IO2
	+5LR9Nwh6X2pJ9bJNTTS54iPrccXXAEOupUfcoOHqTm1O1T57Fbj9yVeqM6993O1xGu0hBhvfopNl
	/4qG0neYNi3PfCBXK5R4ZzkM65U/+S9bAttS0O954zxQR4MdY4MsYNeb7DgH7vwWQtGGwcYZ6SdKD
	4GekS6sUh0wv/92IdBXuSXGYBJwTUM1ngf3mquTRpqhfhrd8EZnFYbobRWLRc0C2+A58nu6xS60nI
	kdrwNgB/voB2ZBhI+EVWr1As0rhFCOWJJADYI1ocAkdLSDNJQli87pbi4OxRaJfgdHmpNTJB9Ja/t
	Dn/MqwYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPMuD-0000000D55i-23z8;
	Fri, 06 Nov 2026 16:35:09 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPMtq-0000000D4X2-1aE2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 16:34:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HgxHXsWBX7qhFHq3hdWQzufUaBNuXC6l7yGjEfJzD2DBX1vT1OepZLm0GMFB1zrwlR3jmIKKIeG4tdYQV+dTL/iQ8l+mNwT1YD0GhT3plEzRB9KbOBjHyegbc5f3P3/e8OIc3b49S7fP+YLOYzJ9qXaC7sIoXhxpyYlfYnz0Cb6EMvxp40O3PFAkVKwXJ3xmGcio5eKGPYq4BAsQTtCLWLrZ04Urunux1bVmtAZC216EyTN5qOMML1UuDrH5wX+PYZaPa3L0Y69TFbr9moZrbbN5JIj/Mq7V9n/440mDrfdF2vtuwQO5ledoSxw31hAOhVOUlU0h+f0uFrWz4GyzEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aQwAv6WnSs+J2ruf4myxwVwMq1MyTJ3pd5/KTrKAqFo=;
 b=TOE2HVrtyvSxklIRelSnUkfPcCPm8Px3kfjOpJILZRL4fr/RAa7AquqUL/7PfrshnrPQ5Ofm2ClKoeQfaX30pyUX9hMMjfV5CNsIQ4LQwWeYPT61jHQnDbsq0uOnCs0bM6M2ztdWhqTLFWTMDJcGxgxvP0c3DlV99W0L7u6iNR2k3XJbxW25qid/Qp51s3j7dkJ+EBlU2e0J9vh3sCqSgqF0lrQji0DmyJofQ05/C6CM2fe/D/CiEJMrlIonQw+YYP8vfSNUZBD5QX1RHZ+kN2+mYGKLZWBRWwvlSltZsFbS8YLJ2GnZzCgeUmtgDe6j17tuHjLUDCOnzM7JhB4stw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aQwAv6WnSs+J2ruf4myxwVwMq1MyTJ3pd5/KTrKAqFo=;
 b=Lr2+gm3XqBm8zMbpUthQxgjrMSxK5pYMlOWV5slfhwXc1T5CmY2XP3lOrjcGb93drSwI+iodBNBXfUTNczRhz7dyVxVHdXEdjIfhKU9dbmbu6rk8GUAHWhmOMlP9kcWsByRsuKkmTBr0Fn++PkvjLAF9XObzMLc8HSRYJKJ2Arp60YwcBnwGIkj/4K1zOFGUksUTgoNq4MjdQ6ORwzR17Qn6kNoKzF/iUh4krsU4EJNjum1Ohce36Ux9/Xldk1JPggLdHeFAIOgIFbo67AfUAdsXFD2f7Sfula/e/NWYEE5ZQSajVdBPdVTcFjAjN8ywCxlXIJEC6dRSE4Zlyc/hdg==
Received: from FR4P281CA0184.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:ca::19)
 by MA9PR10MB922269.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:250:119::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.5; Fri, 6 Nov 2026
 16:34:39 +0000
Received: from MI3PEPF0000847F.eurprd02.prod.outlook.com
 (2603:10a6:d10:ca:cafe::43) by FR4P281CA0184.outlook.office365.com
 (2603:10a6:d10:ca::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.5 via Frontend Transport; Fri, 6
 Nov 2026 16:34:39 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 MI3PEPF0000847F.mail.protection.outlook.com (10.167.240.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 6 Nov 2026 16:34:38 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 6 Nov
 2026 17:35:24 +0100
Received: from localhost (10.48.87.124) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 6 Nov
 2026 17:34:38 +0100
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Russell King <linux@armlinux.org.uk>, Wim Van Sebroeck
	<wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>,
	<devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: Antonio Borneo <antonio.borneo@foss.st.com>,
	<linux-watchdog@vger.kernel.org>, =?UTF-8?q?Cl=C3=A9ment=20Le=20Goffic?=
	<clement.legoffic@foss.st.com>, Amelie Delaunay <amelie.delaunay@foss.st.com>
Subject: [PATCH v3 08/13] ARM: dts: stm32: enable arm smc watchdog on stm32mp15x scmi boards
Date: Fri, 6 Nov 2026 17:34:24 +0100
Message-ID: <20261106163429.618392-9-antonio.borneo@foss.st.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261106163429.618392-1-antonio.borneo@foss.st.com>
References: <20261106163429.618392-1-antonio.borneo@foss.st.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PEPF0000847F:EE_|MA9PR10MB922269:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a6b41f8-54f0-4556-8c06-08df3c23da0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700016|376014|23010399003|7416014|1800799024|22082099003|10067099003|18002099003|921020|56012099006|11063799006|261026121527099003|261102123227099003|261021121427099003|261021123027099003|261021135927099003|261009223027099003;
X-Microsoft-Antispam-Message-Info: zfsHvwoPgqy8hZqk5Xe1NYuqJsHK4oDi59IhIodM7Q/J0UU0dkQrtNaiCvVXyXpBPYKj/jbLPUhufpp1h3i29533RMaF8D+SvUFtWuOtQn2ZjLMChKdtvaOXh1ztwcWUBy6CMvMJyh9GEKEs2oWzGeZz6C3+30LsVpW2Erxjzi2mTGp+pbv9yTjmIY/98+sOfUq9hchHcIljKfKn38VKfMuuFi7DiZDg4Bkiqo23Dv/iYsSmK6OduXb8nGhZAKVgqLrVQqPX4FQ4br/C99TcpD3WaFYh8faAgr4hw+glh2QCd/iH6x8iuHfk+ABNkTqGEHB67qV3XDtatTq+g2urHP1sqb1GW3vGTRnMC3heU7InVJlOeSOweHwWVjbH/iBg1DzU53RK8g7Feo/Z8uhJuLKimzJMaZdX8u8Djz9bXHdCt+9MhtVim2qC6Il2jj/bNrVJOaMf1ZTsvVPBrRgx+PKMoricEwSRKA4S/2n958eG8koH4zHaDeggXkTjYcaH4UCNlud9b40gKSEeytxLsmJYFv1LM5Gw18Z+VgEdUXtvnKR94h++MQndHB0FMkiC7WGGpPn+78Dn+V4Lke13gK0eflbQvUjMQVPT+UWQO7yAnYq2r1djXeiX1q/bJXOoSafafTFeisqp9NU6gsTb0VMrU9CSc0hWWCmNQfbbOzBVfxw0RBtJk6UyFNg9OGbA9obCwj/gsvQYBCVwIj4jXhT0D5HpOyE6U5cc/2khZPOvHOMsRhY6koGaxHIz6H/a
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(23010399003)(7416014)(1800799024)(22082099003)(10067099003)(18002099003)(921020)(56012099006)(11063799006)(261026121527099003)(261102123227099003)(261021121427099003)(261021123027099003)(261021135927099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: MFMK6xmcSrGFp/4nVA5LKwZzWmiPPyzFpS9NGWSJLSwQy+oqEnyS27u3+zhRPwlxMHHFKEYZcyHKQ8O5ABWIUHldUlcE8BCVS3lQOCgDZX3BHB5sCsKN/SbXWbcgdOopyRxMFQ4emkBgApxlo0wddoRBKgMOvNAilPHBepp2y8DAOkqyfT0kvz+aOcpJWYgPwKAkBXoyr1IrBuDV6OvglQdYxWwGCKKKwVb4wXnH9tdVDEgHuxn6DreGK0LsOTTuZTFbIgU6ltzXz+r/H1FbEBWlbVE6Z93/bA1yuuSKoKCLYjshM3uwHwqkCYcQKducqVeYZEB+SstFctxPi6U5BxmntapTlJ323ODEOxP0bSTBrfgq2/jfgbAEwAfHlMV0IUz75zB5sN38zLcgrDT5zfEwTnrU1XRgYNW1c/p8UvvvOqIqJ8+WtAfIIZ2GJMYf
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 16:34:38.9344
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a6b41f8-54f0-4556-8c06-08df3c23da0d
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: MI3PEPF0000847F.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA9PR10MB922269
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_083446_470999_926D9A2C 
X-CRM114-Status: GOOD (  10.46  )
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

From: Amelie Delaunay <amelie.delaunay@foss.st.com>

On STM32MP15x SCMI boards, IWDG1 is secure and monitored by OP-TEE.

Enable the arm,smc-wdt node on ST SCMI board variants so that
Linux can control the secure watchdog through SMC calls.

With two watchdogs now enabled on ST STM32MP2xx boards, assign the
watchdog0 alias to the ARM SMC watchdog that may have been started
by an earlier boot stage. This allows userspace to identify and
ping the appropriate watchdog.

Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp157a-dk1-scmi.dts | 9 +++++++++
 arch/arm/boot/dts/st/stm32mp157c-dk2-scmi.dts | 9 +++++++++
 arch/arm/boot/dts/st/stm32mp157c-ed1-scmi.dts | 9 +++++++++
 arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dts | 9 +++++++++
 4 files changed, 36 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp157a-dk1-scmi.dts b/arch/arm/boot/dts/st/stm32mp157a-dk1-scmi.dts
index 53e40e2f776b7..2f4d212de3e9c 100644
--- a/arch/arm/boot/dts/st/stm32mp157a-dk1-scmi.dts
+++ b/arch/arm/boot/dts/st/stm32mp157a-dk1-scmi.dts
@@ -13,6 +13,10 @@ / {
 	model = "STMicroelectronics STM32MP157A-DK1 SCMI Discovery Board";
 	compatible = "st,stm32mp157a-dk1-scmi", "st,stm32mp157";
 
+	aliases {
+		watchdog0 = &arm_wdt;
+	};
+
 	reserved-memory {
 		optee@de000000 {
 			reg = <0xde000000 0x2000000>;
@@ -21,6 +25,11 @@ optee@de000000 {
 	};
 };
 
+&arm_wdt {
+	timeout-sec = <32>;
+	status = "okay";
+};
+
 &cpu0 {
 	clocks = <&scmi_clk CK_SCMI_MPU>;
 };
diff --git a/arch/arm/boot/dts/st/stm32mp157c-dk2-scmi.dts b/arch/arm/boot/dts/st/stm32mp157c-dk2-scmi.dts
index 0790ed426ebc0..41ba8a5b756b1 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-dk2-scmi.dts
+++ b/arch/arm/boot/dts/st/stm32mp157c-dk2-scmi.dts
@@ -13,6 +13,10 @@ / {
 	model = "STMicroelectronics STM32MP157C-DK2 SCMI Discovery Board";
 	compatible = "st,stm32mp157c-dk2-scmi", "st,stm32mp157";
 
+	aliases {
+		watchdog0 = &arm_wdt;
+	};
+
 	reserved-memory {
 		optee@de000000 {
 			reg = <0xde000000 0x2000000>;
@@ -21,6 +25,11 @@ optee@de000000 {
 	};
 };
 
+&arm_wdt {
+	timeout-sec = <32>;
+	status = "okay";
+};
+
 &cpu0 {
 	clocks = <&scmi_clk CK_SCMI_MPU>;
 };
diff --git a/arch/arm/boot/dts/st/stm32mp157c-ed1-scmi.dts b/arch/arm/boot/dts/st/stm32mp157c-ed1-scmi.dts
index 0a3894aff4aea..2fad04ed60161 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-ed1-scmi.dts
+++ b/arch/arm/boot/dts/st/stm32mp157c-ed1-scmi.dts
@@ -13,6 +13,10 @@ / {
 	model = "STMicroelectronics STM32MP157C-ED1 SCMI eval daughter";
 	compatible = "st,stm32mp157c-ed1-scmi", "st,stm32mp157";
 
+	aliases {
+		watchdog0 = &arm_wdt;
+	};
+
 	reserved-memory {
 		optee@fe000000 {
 			reg = <0xfe000000 0x2000000>;
@@ -21,6 +25,11 @@ optee@fe000000 {
 	};
 };
 
+&arm_wdt {
+	timeout-sec = <32>;
+	status = "okay";
+};
+
 &cpu0 {
 	clocks = <&scmi_clk CK_SCMI_MPU>;
 };
diff --git a/arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dts b/arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dts
index c2b6efb1cbb74..d14506e9b6f0e 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dts
+++ b/arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dts
@@ -13,6 +13,10 @@ / {
 	model = "STMicroelectronics STM32MP157C-EV1 SCMI eval daughter on eval mother";
 	compatible = "st,stm32mp157c-ev1-scmi", "st,stm32mp157c-ed1", "st,stm32mp157";
 
+	aliases {
+		watchdog0 = &arm_wdt;
+	};
+
 	reserved-memory {
 		optee@fe000000 {
 			reg = <0xfe000000 0x2000000>;
@@ -21,6 +25,11 @@ optee@fe000000 {
 	};
 };
 
+&arm_wdt {
+	timeout-sec = <32>;
+	status = "okay";
+};
+
 &cpu0 {
 	clocks = <&scmi_clk CK_SCMI_MPU>;
 };
-- 
2.34.1


