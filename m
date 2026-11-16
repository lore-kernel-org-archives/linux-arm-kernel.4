Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EC52606A329
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 13:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tLaijtid;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=TGxh/Dx3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=7CnUqZ52mOEx99vqu+8UQApPDaHOzGQMk70n9OD6tWo=; b=tLaijtidHizbnbW/cBqPII2W2c
	huMQqp/bA1a0mMnUPxD1u497JZMQejfCP1LDZ04VX28tzwGcJheyEMdcboajPU6mMVE5Xq+ZkiQJE
	tlqhPZlDHjOt6BqDcl3YgGfzhkvgyKhn47AOp+IPai/N5TrNu1ym0l9aD/2hUzVlPesOpVr0Kzppt
	UIwF8uWMcwRzTdxD4UtEOWQACq/tkW9lyyUYF6KBQgFH3nx1L4n/RhSDVW+6orsm5UaeedDJuYLPa
	i4mWW3azHV9p2EaTGIZuXt9E3St15DtY79X0sCeWnsNkELQWKV5PZoETipO8LToPi+jytpczwSVpY
	bdENAsLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSwiX-00000002cSq-1WmU;
	Mon, 16 Nov 2026 13:25:53 +0000
Received: from mail-francecentralazon11013016.outbound.protection.outlook.com ([40.107.162.16] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSwiA-00000002cB2-464m
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 13:25:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mRnfgk8oXIG2gFapfKIbIsp2e/DMrlYIY6whAvk1Db/xbm0sBJRM7oSSytcyk93xsevzJlc30us81+oDXGqcibEjrzzhDtrpqP/01OyoGUPXtRqovAejxKU5ji3XJvWSwJb7tBJ45B5xl15mJ1LiDAFul2eeTTT7TckLkhrhANp0fMhon8iMleUpDofQqXTkvgoAgEERQNcVkJ/9QOn+62PGljmKb704PMb88kOLBIBjla/Aefq152zsfNs5q9Dney+7wiFaiHsGScDtZwzVTTsJgX8vFWw+wfLahIQN9THJDPFyFTRpvPvLxscFXRkOatLrobB3C7NnyxLRyMt38Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7CnUqZ52mOEx99vqu+8UQApPDaHOzGQMk70n9OD6tWo=;
 b=sqpQLJYE36Pk0vquti+WgYMtP+xqUFcsZXCo92z3dswKhvWHhkETwdEJscQ0IrYp9LK8yxaBRLsO4w2GC9ARNb1oDw4Na7yUN2Tec2pRJd/2wPnx1ce75d9QVwxkN+6UuizPkhkzXmBLVprDikhC82031CjbuyvV+2CKIFc8assqqgF6QSB/746NBnxhWgLa7CacHY8fe+XNS47cjGCFzoUQwD2DwW119GYVZf1nAY9Ujsr2B4t9P40M1Iv+AYrtTpC0f5Njhpg+9SHY9AhZj4zHgDKf3mzOgch3WEiHt48YBrF9GJZhLudx/8UuwbJhuN2fZqY38b8pIH822uIQMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7CnUqZ52mOEx99vqu+8UQApPDaHOzGQMk70n9OD6tWo=;
 b=TGxh/Dx3JH8zMsf8QXDlbtrqLVjwftI7rOY5Go74EOguwm5A63D+8bNYwx9KAtueguau9wSjjr4oLeNQKvaToXI6oz7BmkfNLrq8BaACnQyccKNXrXw3t4yLgaLl/wDNopB/cC3o1eZZjVWqhH72vFKf8HjpuMWs9EO8O/vaOYBpV34WSUT4t+g4g6Pig7lypASFVLD82Im4wJI2SyzIgnaUskm8k6Gqq7dEqCYstfUG29vABfAcJawfmcn3l2QK6PxNedOf5oZ/rZ8UpOi2RTUHZ8J0eisoz2ZRzFJ6vdB7ZZ+VqhxCrGJv1OpZu7C8r3uEPEBkpPgFe/IxH1WpXg==
Received: from PAZP264CA0106.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1fb::15)
 by BESPR10MB992299.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:b10:10e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.7; Mon, 16 Nov
 2026 13:25:24 +0000
Received: from MI3PEPF00008558.eurprd05.prod.outlook.com
 (2603:10a6:102:1fb:cafe::5e) by PAZP264CA0106.outlook.office365.com
 (2603:10a6:102:1fb::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Mon,
 16 Nov 2026 13:25:21 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 MI3PEPF00008558.mail.protection.outlook.com (10.167.240.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 16 Nov 2026 13:25:19 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Mon, 16 Nov
 2026 14:25:25 +0100
Received: from localhost (10.48.87.124) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 16 Nov
 2026 14:24:24 +0100
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
Subject: [PATCH v4 09/15] ARM: dts: stm32: enable iwdg1 on stm32mp15x ST boards
Date: Mon, 16 Nov 2026 14:24:10 +0100
Message-ID: <20261116132416.1184447-10-antonio.borneo@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: MI3PEPF00008558:EE_|BESPR10MB992299:EE_
X-MS-Office365-Filtering-Correlation-Id: 8704b53e-0d6f-4690-9612-08df43e50f2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|376014|7416014|1800799024|23010399003|82310400026|921020|10067099003|11063799006|56012099006|261026121527099003|261021123027099003|261021121427099003|261022075727099003|261102123227099003|261009223027099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: L7l0hfZZsZldjS6NFf4Yt41DmbPsBNaS60qob3ffMvBS5uJBqutKHFygH2LwLLBf7ozIuQqOBcb9IffU1G0NLMBgikLtLfkd90ZuYmWT5TElt1Yl6TBKYgKHf12ziT/FxCIg048jt7L6ko1dE0IaJiKd8to1erPFh3X0y+Lzo2lNNbBW7XO9WoP4knhHwcNUTAgW/tJt2zXvznye0sAielgEsMRGunfXsdXKqE8+Jrmt9fNmMgOcdtzP/8Yz9gjUrfgNKuGeqOc/gZqu/Zgv1PK/6rV5EGqLgREocT66IXI7QZu/eBMAnJpYUusGW1ln5m6010O5y12YZylreDLaIRh/ajl4WxtWvRkAbtw8cYVoLWPNm3242VdI6b4CgVAdzdxDyreF5/NoWz1s6WPhMBWZkO87rQHrBvmNLJwYLV8JGFJLQofmtTGHWkB4mA4h04DwbvLeg4dcMqROCGqrhs3TynB3FuTvxaqYMpguO/8RMySw3eT7Fc1NQ++mIWi9IlqeK+NCBWZCOoL5K+4xTqJe5/FvAq2D6vaIjxTJoZslIgRS/O+VVLiwgtZWrmrUlNYXFMhAPgCypb1vldvDRtYAh2UaxST/RuPoSuCvWNti/L8dHWTy6vDJ9HchCgx/FqM+1AtJqQzHo+xVR4mz6RXkuLqllGG13m2Cmy+wySgf1o8Zx8aMMoir/7z5V0UEVIAblQwib79DZoD5UJiSPVLFzqdRTH+/IMphLhIAaVNopzBTtljN8YBDnwiC2Eb9
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(7416014)(1800799024)(23010399003)(82310400026)(921020)(10067099003)(11063799006)(56012099006)(261026121527099003)(261021123027099003)(261021121427099003)(261022075727099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: SGehscGDlu36yYoYKoLrNkb2ByTD6MuXiNPkc2z+fgOzKUmq7Bsv4bf/r0I0Srtv202NhUkBR+uM73kwzFAkvGFEhJi7gxPffI5qyO+iipsnzzphrsq0u4nR7E+8M4pgPqFmF070DtSIrQjj4/cl8R6tun1nA9pG8JuDXYcFA5KjtE3tfyDKk7/IfsoY4Dr9O1pSUUT1wPr+AJWy80oskdL1Jm3iyht9Pvf+lzPbq93iVpkavlFGk4IDgbckVWi+m118B0n7a52fupTXL4Zw09d/QnP1yEt7DgcaHlMEDNFvTAAEPUn5j+FdLrh7B48VFf89wOlsMit7X2AOJAaIx8I5J64iW9aajlD8CqLlvfgu3NBkmFv/AnZlXh9toISkVvhyMmC4FhVhKUmxbBvr2l1RjTwL6kijmUgW8yz27Ayu+6xzR3vjYjv/TI78uZR2
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 13:25:19.0026
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8704b53e-0d6f-4690-9612-08df43e50f2d
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: MI3PEPF00008558.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BESPR10MB992299
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_052531_041819_CCE9E22F 
X-CRM114-Status: GOOD (  10.42  )
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

On STM32MP15x ST boards where IWDG1 is exposed as a non-secure
watchdog, Linux must register and periodically ping it if it was
started by an earlier boot stage.

Enable the IWDG1 node on ST non-SCMI boards that use this
non-secure watchdog configuration.

With two watchdogs now enabled on ST STM32MP1xx boards, assign the
watchdog0 alias to the IWDG1 watchdog that may have been started
by an earlier boot stage. This allows userspace to identify and
ping the appropriate watchdog.

Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp15-scmi.dtsi  | 4 ++++
 arch/arm/boot/dts/st/stm32mp157c-ed1.dts  | 6 ++++++
 arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi | 6 ++++++
 3 files changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp15-scmi.dtsi b/arch/arm/boot/dts/st/stm32mp15-scmi.dtsi
index 98552fe45d4e0..cc9521b105262 100644
--- a/arch/arm/boot/dts/st/stm32mp15-scmi.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15-scmi.dtsi
@@ -64,6 +64,10 @@ scmi_usb33: regulator@2 {
 	};
 };
 
+&iwdg1 {
+	status = "disabled";
+};
+
 &reg11 {
 	status = "disabled";
 };
diff --git a/arch/arm/boot/dts/st/stm32mp157c-ed1.dts b/arch/arm/boot/dts/st/stm32mp157c-ed1.dts
index 49dd555cc228c..6c7dfbee29528 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-ed1.dts
+++ b/arch/arm/boot/dts/st/stm32mp157c-ed1.dts
@@ -19,6 +19,7 @@ / {
 
 	aliases {
 		serial0 = &uart4;
+		watchdog0 = &iwdg1;
 	};
 
 	chosen {
@@ -331,6 +332,11 @@ &ipcc {
 	status = "okay";
 };
 
+&iwdg1 {
+	timeout-sec = <32>;
+	status = "okay";
+};
+
 &iwdg2 {
 	timeout-sec = <32>;
 	status = "okay";
diff --git a/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi b/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi
index 1a07ae09afb2a..9722e2ab07794 100644
--- a/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi
@@ -13,6 +13,7 @@ aliases {
 		serial0 = &uart4;
 		serial1 = &usart3;
 		serial2 = &uart7;
+		watchdog0 = &iwdg1;
 	};
 
 	memory@c0000000 {
@@ -511,6 +512,11 @@ &ipcc {
 	status = "okay";
 };
 
+&iwdg1 {
+	timeout-sec = <32>;
+	status = "okay";
+};
+
 &iwdg2 {
 	timeout-sec = <32>;
 	status = "okay";
-- 
2.34.1


