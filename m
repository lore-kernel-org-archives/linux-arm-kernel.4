Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1BF1606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 01:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QhnkoVbY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ozacI6w9b+9oPYAP1o8WF1OBV3+9w+asASKPg0by3T8=; b=QhnkoVbY0gPeTzmWcRyRrZDx8Q
	0OOZ3etNatZSj2Hfbtvw1EutQHnlDCRDeXMJb4zXE2QI7UI7pzjfebgpWNqLjQw7IgUW8xBpFehLZ
	y3SNF9SJIclgEVXYatTYA0ssADkS26mcaF5PkD7pr6Ic43NUOxK631lj6gBQebJuBxlJaS0xxTGI7
	ChLezzcsvCazdt9XZNDqHjXghkJTSVLc09e7UZw+jFrurAl7oFBHMIiA4yaV2RYqAkoOv6Lg3C+8N
	h4RB7l9DlyPcH2OiJgqEv/f7EZTXiSWTIUm2wwJ3VZyWUGpD9ciMdpDb+kS35nBP8750n2ZpD4/9s
	Y8SJtMJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPUxT-0000000DyvR-3IUy;
	Sat, 07 Nov 2026 01:11:03 +0000
Received: from mail-koreacentralazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c40f::6] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPUws-0000000DyqJ-2Y2V
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 01:10:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=taHRQtYBIrLUDYscUR8uF2lf3KdouhkgC4IFUjMgf55HROWC2HNdqGL7jEa9JWAjmxdWFqdZmjPiIWdg1ouWSyMeeJJ8mC5jMAv8f/AbTgGV7IhzGujDo2nazRGsJSNJziJ7vBQxON6u/wTdkmoqF7ZrkIAQXSh3gf1VzVHdAFADWONw8pN4DlzzKGPEWDo6Bs2lwMV6Sd9b0RU3/k0XVORbu5ErBTdeI3MyY1wix0JZ6LsOqOUSuNjQL2v5xzfVEuHcMMouS2FDoeIzQH0D9mm9kuluTKOR3oAv0aCaNlztdpEH5Zz6KSG3sIhiNjcwVfGLIoK3TesijsRTVqLr5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ozacI6w9b+9oPYAP1o8WF1OBV3+9w+asASKPg0by3T8=;
 b=syd3a8Td6EZS5HLGdHUUanc4TmMiKahpIzH46NEecNeY4kij7Kkh7i1GUEe76P1W19eP4JlQWIww65P+vHxcdjKwPqdJ0go/kvGK+AiqnfF9DKYhHtv1R3MXewnRs6UoNH3LRJguYuK+xgvksfkPieMNvK4sa4FEIunTbaFFYe3JCAPM2YEQI/VtE/xprPCvcwyOGFqt0JHaEr49P33wYsaWwyavaY/JRPwyGGku8d/XHQRDvi50Xr01+30flrKFURYFOcUw3vBX9xJAKOfFR5N4Rfm8ZoPPscFWkqf9BL7qW8yERd2OMhMfrV5qWgitz5HxLiOmk5S2eb6txZuowg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from TYCP286CA0261.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:455::12)
 by SEYPR06MB5400.apcprd06.prod.outlook.com (2603:1096:101:8d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Sat, 7 Nov 2026
 01:10:15 +0000
Received: from TY2PEPF0000AB87.apcprd03.prod.outlook.com
 (2603:1096:400:455:cafe::28) by TYCP286CA0261.outlook.office365.com
 (2603:1096:400:455::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Sat, 7
 Nov 2026 01:10:14 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB87.mail.protection.outlook.com (10.167.253.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Sat, 7 Nov 2026 01:10:14 +0000
Received: from gary-System-Product-Name (unknown [172.16.64.55])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 1FBA24102E6B;
	Sat,  7 Nov 2026 09:10:13 +0800 (CST)
From: Gary Yang <gary.yang@cixtech.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fugang Duan <fugang.duan@cixtech.com>
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	cix-kernel-upstream@cixtech.com,
	gary.yang@cixtech.com
Subject: [PATCH 4/4] arm64: dts: cix: add RTS5453 PD controllers to Orion O6
Date: Sat,  7 Nov 2026 09:10:12 +0800
Message-ID: <20261107011012.3655873-5-gary.yang@cixtech.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261107011012.3655873-1-gary.yang@cixtech.com>
References: <20261107011012.3655873-1-gary.yang@cixtech.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB87:EE_|SEYPR06MB5400:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 482731da-ad29-4842-a3ef-08df3c6be101
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|1800799024|82310400026|36860700016|261021121427099003|261102123227099003|56012099006|261009223027099003|261026140227099003|261022105027099003|261028144727099003|261026121527099003|18002099003|22082099003|261022075727099003|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info: fvzy5I6xbBOOqWjMFpuPR7JcxkYEZmXc5R3PoYmNwg6Q3zvqwy7AzG1m8JLviecHZoFPhboiOKV0fa2QBi8ZJbAk3HeJ80RyfbdjvBl6kpaIRBiSJPrxsgUMYTl3VH6w6cpSXnA/iGLMKDNp4V812ql9Ydgll2jERR5pxeKC5nqrfIUhG823mLoNEUTIF3j3+6hiL5pnL54sBSwEbPf8z4kCRk/tEyP/YHnNLolGx9PI0lGYhKkp3PIRczFa3h6lI1uX4LDLXUgXlrnpDbz7VvrtUVtXxfwP7YPpbQN50VZUDdojgxZeW4J02TzGZmjU1OyJB8vkQvHHxJkDiTzbO6CAWpz0b/7dUKD+vwLeEbYKHrF/5TN2q7CYEeAaclvWy8fu1XOrgYKSq/wpYC0WmMd5jLpbNXqAeToNiiYwFgwFxM6mo3160DUKQvqXEkDd5k6lm+4dVzyk8mPOk4vRMjoK4ixoTtZ3Dj7ncqEdk1HsDvcw2C8vlSQjYUJ2fOe4Rvaw+98JD/v2vEwB0g2FUBI4owUGWCoOpXEvJnjt54qdiVS2YX4khdIg9VWUydp1vC/qq1hd9devShVG+xhGH1TUUIeUmzXjLvvT4tFi5rvi3zcRVbHV2/z5DMYd0QSlokBpSe9RJSUqtoed2Surgx80V4WFZ2m3IzforJKUDWLGfQVYLKKuaq2gxXvHJh3B95mHD0EcNHmZ6gIKBflm1g==
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(82310400026)(36860700016)(261021121427099003)(261102123227099003)(56012099006)(261009223027099003)(261026140227099003)(261022105027099003)(261028144727099003)(261026121527099003)(18002099003)(22082099003)(261022075727099003)(6133799003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: s+wMPUc+g7Mhws9bUxKnEn1hUOxDZw/B/ha/sBfSQFpOWhomIkwXPDjDpj+rnjSaYtuAJhcKJo92FnWuObUMVPwTaL9MeQl/cwqWX0KEEbSY4wM6QuqhVJgPpv3+FOfzPL4yxCRtSpeuq0zJnjItBwOOHmL9La9TEqvX5MjKpIjVys2odsStfuzGsYv1pF0S0BnqeGJUwgYa0tt7ggBkLizt5vefZYT7rdUOvzolQni7SIMtbcaWHCOOBIVxTPkCy8y88jiuxNIL7ZnH5oYmb6dNRURvCHU+ATKtRPYV+aGZhreqm/WtLGzIdVqMhwrZ316kQKHcFjYNehawt3iPSeSIkdecCUVO1PKkutdIKAvwaAXzHmipq1rWIkpIQQ9dbM8rlDy8K6BPIpqEgS7e+iKSrQjuYxA6RPS+YgaGEb9r46uPHzVR5sQ9I8Xa2oTo
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2026 01:10:14.1988
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 482731da-ad29-4842-a3ef-08df3c6be101
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: TY2PEPF0000AB87.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5400
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_171026_646807_4D7D16D4 
X-CRM114-Status: GOOD (  10.76  )
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

Describe the two Realtek RTS5453H port controllers on the Orion O6
I2C1 bus and add the I2C1 pin configuration.

The controllers route orientation and DisplayPort mode changes
through the USB/DP combo PHY lane switches, but that PHY support is
not upstream yet, so the connector graph endpoints are left out for
now. The Type-C ports are still registered and reported, only the
lane switching is deferred until the PHY nodes are available.

Both controllers report through the same level-triggered interrupt
line, which the driver handles with a shared interrupt. The I2C bus
runs at 100 kHz because the RTS5453H I2C interface does not support
higher rates.

Signed-off-by: Gary Yang <gary.yang@cixtech.com>
---
 arch/arm64/boot/dts/cix/sky1-orion-o6.dts | 51 +++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/arch/arm64/boot/dts/cix/sky1-orion-o6.dts b/arch/arm64/boot/dts/cix/sky1-orion-o6.dts
index e39c87774c12..53c66ab30679 100644
--- a/arch/arm64/boot/dts/cix/sky1-orion-o6.dts
+++ b/arch/arm64/boot/dts/cix/sky1-orion-o6.dts
@@ -52,6 +52,48 @@ &fch_gpio3 {
 	status = "okay";
 };
 
+&i2c1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_fch_i2c1>;
+	clock-frequency = <100000>;
+
+	status = "okay";
+
+	typec@30 {
+		compatible = "realtek,rts5453h";
+		reg = <0x30>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		interrupt-parent = <&s5_gpio0>;
+		interrupts = <8 IRQ_TYPE_LEVEL_LOW>;
+
+		connector@0 {
+			compatible = "usb-c-connector";
+			reg = <0>;
+			data-role = "host";
+			power-role = "source";
+			try-power-role = "source";
+		};
+	};
+
+	typec@31 {
+		compatible = "realtek,rts5453h";
+		reg = <0x31>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		interrupt-parent = <&s5_gpio0>;
+		interrupts = <8 IRQ_TYPE_LEVEL_LOW>;
+
+		connector@2 {
+			compatible = "usb-c-connector";
+			reg = <2>;
+			data-role = "host";
+			power-role = "source";
+			try-power-role = "source";
+		};
+	};
+};
+
 &iomuxc {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_hog>;
@@ -66,6 +108,15 @@ pins {
 			drive-strength = <8>;
 		};
 	};
+
+	pinctrl_fch_i2c1: i2c1-cfg {
+		pins {
+			pinmux = <CIX_PAD_I2C1_CLK_FUNC_I2C1_CLK>,
+				<CIX_PAD_I2C1_SDA_FUNC_I2C1_SDA>;
+			bias-pull-up;
+			drive-strength = <12>;
+		};
+	};
 };
 
 &iomuxc_s5 {
-- 
2.50.1


