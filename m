Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AA91606A323
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 13:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=V2pNtXc6;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=a37HBoBl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=q+/gec9r2ZJmpyyMFZq83DwOKyMMmYRBpAoxQ80Zi0s=; b=V2pNtXc6HgpOmSvnUH6+dTexPw
	NFO6+Pv9VOUs1wB2UDDlrZesyDykN4HhUizh8+hqchLCrcXHwsqYmZZ69+I+YtUp+IimYhS0itemm
	pV9C4nItFkUWRBc3PZVNJIDXHp+DKmYWdu12G/Q9hDlHOTgqA+PUdFGjRHDHz1phL3bsA6ympUCcC
	NZlClA4wgqKmYryWFEDDK6qPaJZ+N1bJhk5iHcHPO1mc6iwAdFSVjgAfmgpwbv3IS+8WWN9UFLSaY
	uFB3L9OcDl035s6Xtne/B724ommavUCP8CIr/HFqBRUIE3QS4/1YzO8JD0S/UgLp6O8ZVRH8GhpWM
	+Bi6Tl0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSwiX-00000002cT4-23ui;
	Mon, 16 Nov 2026 13:25:53 +0000
Received: from mail-northeuropeazon11012013.outbound.protection.outlook.com ([52.101.66.13] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSwiI-00000002cJ5-0Rl7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 13:25:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e5a4Xx5sFjAf09tJLPe/bYgJANgN/G0CJV7lZYDme0Y1VsPZP1KbISDqkmaROCR/r8ryKsgxLmpk+g1S3QKZ7tdn59LWcOcWjBahfTViuNYxsc30zcJhPofkSUGv+5YMqPmJAybN12vc99bZmEZNA7NsqOjKiiodTH4ewBY+JxlMCWH2a8ST1f4vhwyLlFX8pmT8XJVTlXC3qBOI6iNknDhZZsPfsCbBUJqVEkf8utfnR0OH13+sKOKrmJie/z4JeDxDJrrZmbc4QuTWDYiY6OF5r+KqYT/yCTMT5GyqfUwP+9JPfL5lTP2ME5g8KchPsjMsYzVgysO62To27CsCcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q+/gec9r2ZJmpyyMFZq83DwOKyMMmYRBpAoxQ80Zi0s=;
 b=hffANxZyvoT0G1ge5eMhOBdjw8yQ5SAMTSFoJ06ZAwo9ExIjqWjcDbsZI4AfLTK5gavpYjppkV6+UT0Bt6SQvPJ9PZP2wm8xvlD4zmhmoUMfX2YSkiQ2FZG2jNhdUjGYhypoawSvg6hLkFfosXCIHDCUWwjnS0hWe7eEAbpfX8DovMeM6UdPt+KZuB+Fd19Vs733mrOLfIHPXQ6nueQCxR5HMp8H/z9mSUZzG6WZ+6vqeg6OQi0OYVkO89VxYWZn4OAT7q9bual1/1aEbpBpeSCTOaw67IUhN+i2Jk838uBc5Q+y0ij6IJJgapwcnWVq/bV3CKziXkTzUW92GbClGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q+/gec9r2ZJmpyyMFZq83DwOKyMMmYRBpAoxQ80Zi0s=;
 b=a37HBoBlMnx3fw8SzRd1MVXWrnWgVFKJVLacQ8a4FZhDg/ayFkAttKXhu75aBCzY+f89vipoBtdiTPpTYsR3Uuc5A+18v2BYNFwe7iNgVqkG7m02X9ZLMakh03vpCliAjW5YovkIc8id/jNmKR6EHUtOr3392U9J27M7e3xUU5drCwLH4F/uRiYg/QqDPdiE89WUU4zbN9yrknDfpKfMHyqzN0ISEetdBjr/wHR20UyoDVlxZqZU+caB4ncJgX5aeffjiTvJ2UBDQA8aoK0STTB//ADI4ORkylRNNbKdNw4SwYjcpRyHHMLXuh9Sr6BgMuEhsvy0wzb5F+loTE7Q2g==
Received: from PAZP264CA0106.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1fb::15)
 by PR3PR10MB3962.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:4f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.7; Mon, 16 Nov
 2026 13:25:29 +0000
Received: from MI3PEPF00008558.eurprd05.prod.outlook.com
 (2603:10a6:102:1fb:cafe::86) by PAZP264CA0106.outlook.office365.com
 (2603:10a6:102:1fb::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Mon,
 16 Nov 2026 13:25:29 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 MI3PEPF00008558.mail.protection.outlook.com (10.167.240.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 16 Nov 2026 13:25:26 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Mon, 16 Nov
 2026 14:25:26 +0100
Received: from localhost (10.48.87.124) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 16 Nov
 2026 14:24:25 +0100
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Russell King <linux@armlinux.org.uk>, Wim Van Sebroeck
	<wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, Yannick Fertre
	<yannick.fertre@foss.st.com>, Christophe Roullier
	<christophe.roullier@foss.st.com>, <devicetree@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: Antonio Borneo <antonio.borneo@foss.st.com>,
	<linux-watchdog@vger.kernel.org>, =?UTF-8?q?Cl=C3=A9ment=20Le=20Goffic?=
	<clement.legoffic@foss.st.com>, Amelie Delaunay
	<amelie.delaunay@foss.st.com>, Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v4 11/15] ARM: dts: stm32: enable arm smc watchdog on stm32mp15x scmi boards
Date: Mon, 16 Nov 2026 14:24:12 +0100
Message-ID: <20261116132416.1184447-12-antonio.borneo@foss.st.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261116132416.1184447-1-antonio.borneo@foss.st.com>
References: <20261116132416.1184447-1-antonio.borneo@foss.st.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PEPF00008558:EE_|PR3PR10MB3962:EE_
X-MS-Office365-Filtering-Correlation-Id: 02a56087-42e6-4e43-9479-08df43e5137a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|23010399003|82310400026|36860700016|921020|10067099003|11063799006|56012099006|261021135927099003|261021123027099003|261021121427099003|261009223027099003|261026121527099003|261102123227099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: qwkOXsU9q9s3lhDgNurQRPeBvuXzft/5Vgz7KmN1oc3AIPm2Lx8VRy1Dlk5YkW9HEtEElopjtX5/AzQPr/kutZKlMpEN8hXNXF1UD9Uz9zmFhEL4efu6UQ1Z1ULvKyt48vSeS3JGLluhezgTvN86JmBVch0As3059nAcuEGn3faTvz410k94F2uVVb9oLhXvOwDuX6kxToQVxP6rMupBVZGPDmLdbzY1HUIK88toYV70ni0x/OOFyUREPMP5wgxcMFEA1BwrYPLr6V4JQ3x9DgEwqro6QZO8pHndNOjyQ7D5O+VH1j2aSb2cUDFOU1BvQRnF+6xW+6lsRaPMPI8rZ1jGdBp1qZeUOPPIFODiKssQhkpmVmNd8TpJbyBabRDigrJ1tUwHResQSaw/ekoDgVxp/g+G1Sz8wMFnmy3RtQuv1Otke95Zv6vKdVgDxhlHFHEbQoOQreOw26wiSL8Zw7vGO8Rzin+S2IqVmjAD7wAKJYz1F2TGft/MXldXRHKh0mhsO3Y13l/sTLTC+ucIHvO3JLR5SFpoFGnJIJ27cyEuG3KouZzh+AxwsEL4lkYNhDx7nyhDHio5Xx6D3ZI6ifj0zy7OsXbCtzedbK6uyFQ+rk/0yEdh79GEd1YV9zH1KtUv5O8DjuPoFeVypqR5GRjlF6dhS377bctPDXH6hmHJUGoDJCNtnANQAkftYC9v3Kgbo8XnwaFEL8gxNnBc7blINoRcSJDVBPdzBy1jVhjg0+fFicj8XZTJYEXxSbre
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(23010399003)(82310400026)(36860700016)(921020)(10067099003)(11063799006)(56012099006)(261021135927099003)(261021123027099003)(261021121427099003)(261009223027099003)(261026121527099003)(261102123227099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: uG/uIvZ2gpXc65CDflFKbO2cComXwhT9SeNrQq/rb2LMnWuUth1Fv/7B1B3DfcsOoFwmiVyMZWp7QGtmiYZjfaTaawl8f/U26K1F8HCKSgR8VI+FMOK4088KQtOLBx6lpVucnhpvz1ezPYv9Gn6oc0ihHoY2+OwZQMsz262ixqSiTPTryIxd67h3hMgCII6lPPSXEfZ/UyoRPdvdUsPu8zJtEvpyLlfmgvaE//vNjNrZTQKLB46CrbF62mvyEkit0zR88v8WISjuqyhevAJx4KKgymBaLgfV3cY0cMLsUHo5LwHvBlJ3CQDtNh7fL2mM11SO0r6WC5eS/Mk2jvvLm3U8fRsrvuARWxhmwYzPLlyy7fqoUmAR+tFieIA/pqtfoQd0okgy7tkf1ULNZhWlA8p4i6bc20pVlajOKfOZsrnNH0TY5Unk+OqEE7SmKTk3
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 13:25:26.2874
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 02a56087-42e6-4e43-9479-08df43e5137a
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: MI3PEPF00008558.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR10MB3962
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_052538_389907_4F244410 
X-CRM114-Status: UNSURE (   9.75  )
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

From: Amelie Delaunay <amelie.delaunay@foss.st.com>

On STM32MP15x SCMI boards, IWDG1 is secure and monitored by OP-TEE.

Enable the arm,smc-wdt node on ST SCMI board variants so that
Linux can control the secure watchdog through SMC calls.

With two watchdogs now enabled on ST STM32MP1xx boards, assign the
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


