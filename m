Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8592E606A886
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 10:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KQPBtqRo;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=gs7DSZ1c
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=mJ9CAZF4pvCa3i3Bk4YdzHrnSRWqOdwYi39SFp9d5lI=; b=KQPBtqRohuwHwQ
	Zu++LAapa0HyhZomOwHxKno3Od1CLLm30QVzadpEIMrKCZeWJm8yMSOAmYutOnzkOpDzCH8E7u53Z
	DGr4YtqysytbYowG9xL7sL+jDEi4q1+C9GpOOPo1ZAZcRuCXDBOAmAqbtF6SMFj6Dk1/t76uunI5e
	Vww1Q9UleVvoE07MKFCz1fgQakX2dP1wgLcNTObkVtmlLWgZ7sDPsgQG76u7zGx+XoVM8rFacOiEg
	Vrf4dCk3KXkVhm/xvfyvxcMGivDUl5nJFdG6Uffwbe0rsXIVAlmRMbi/72zH8N4oSuiY0KPFCzM0J
	ub74LLe36wAHoGnKwVGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSu06-00000001yBa-0UpT;
	Mon, 16 Nov 2026 10:31:50 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xStzw-00000001y5g-3xl6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 10:31:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lWDsLuortzgkqMKhxR2ohJG3mGqnPiEvfmC/kPNQT9lyl7vGSbnWxPaNAPs+3S3TZo90uMJkZQqbCiKPnOwLCqdfKi9QiN+ni6uGtw8bXC9br05/wr3eGtuxhkmyeURhrdD3H4pqUuq4/KyYPXcM2UYx5pNpsgDn8H8Z8kdBIVY13Yj9hg2H3ktTSy6Ak6fVOwcGwRg78f/NlwPu47PNR/0c0xf/Vt9kZvZ+Nw1bVXucjw1+QYPZMc5D33saVfa4oBJ4BDwEpkCZckPbO1WijwEENcDxINuwGXgn0RNnLx5aK+K/lCZDrjt4LEVmNtiE0IVVgeyJu+rqLJ+mCOD2Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mJ9CAZF4pvCa3i3Bk4YdzHrnSRWqOdwYi39SFp9d5lI=;
 b=UZyrKMa8sS4dIRInMpxcK7GQ5UNpo8GA7Nuysx+YEPy3j/gVDtdhI+c4DK+KwL4hEGowC5bc7PCKXZ5T7pIKPGLS+DcALLXexxJeUwV7eSCMy0skGBP+cNr/yIFPXAX+a5O3kRLwrJNjO2ALUOZgzartxbNejco6SgAqdx5MjV/ikMjkdvIgNmCyU3qNZF2RK90PUrdKqRiGNlb/Pj/xuQkU5BwDGL2J3Jp0r7lYa5VYR9SIvDLnViBRZolJ9PG6kPQca/EfxXqrzFp8CdbC+2pMaDEns7wKG3a/WxThBwX3ok9A+nJs6mp7LIJKRbCGVrEw8VdjBDfS907gqu0Z4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mJ9CAZF4pvCa3i3Bk4YdzHrnSRWqOdwYi39SFp9d5lI=;
 b=gs7DSZ1cepvUpJyi7mATtoCZObp86SOLZUMc5tbw3LTIL7bytOQkd1+7R3weZAqvwzgPj1fIW0kXbG6OYYHXIosDdD5AR9h7ApVPgSZiFWGqsedDeYs4zzA7IUDqVsFH1P/aBXwqbH7yiIXlb+Y5anqa7SCOnk45PLi0lvek3c7HyLWv5ndTQAu+G/dFDdRFLcihyYwyc5Qk5mdHAEhelf7rMmNECZijR33clUCE4UJXpK+JVYMgXq/F0Gdf/RDtSNE8RSeca3boHXr2J+WBOshHlrVZF1SaQHg3CnkG57sCSVAIAA+Ap5K/FKd0kaq2DA+2C3DPmPhYpVUhxeH6Yg==
Received: from AS4PR09CA0030.eurprd09.prod.outlook.com (2603:10a6:20b:5d4::20)
 by AS8PR10MB6336.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:522::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.7; Mon, 16 Nov
 2026 10:31:35 +0000
Received: from CPH1EPF0000051D.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d4:cafe::81) by AS4PR09CA0030.outlook.office365.com
 (2603:10a6:20b:5d4::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Mon,
 16 Nov 2026 10:31:35 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 CPH1EPF0000051D.mail.protection.outlook.com (10.167.241.232) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 16 Nov 2026 10:31:35 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Mon, 16 Nov
 2026 11:32:35 +0100
Received: from localhost (10.130.77.105) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 16 Nov
 2026 11:31:34 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Mon, 16 Nov 2026 11:31:14 +0100
Subject: [PATCH 3/3] arm64: dts: st: add delay on imx335 reset gpio on
 stm32mp235f-dk
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261116-stm32mp-imx335-fix-v1-3-01f538260f00@foss.st.com>
References: <20261116-stm32mp-imx335-fix-v1-0-01f538260f00@foss.st.com>
In-Reply-To: <20261116-stm32mp-imx335-fix-v1-0-01f538260f00@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	"Alain Volmat" <alain.volmat@foss.st.com>
X-Mailer: b4 0.16.0
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CPH1EPF0000051D:EE_|AS8PR10MB6336:EE_
X-MS-Office365-Filtering-Correlation-Id: 823cbc63-c066-4f9d-a439-08df43ccca18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|376014|1800799024|23010399003|82310400026|11063799006|56012099006|261022075727099003|261022105027099003|261028144727099003|261026140227099003|10067099003|261021123027099003|261021121427099003|261102123227099003|261009223027099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: EMoPWdUResjdgsWEPuBKWi8HI262FsF65n+p6YTWzHXANdwmWJ2Jd9762HhiK1APNJkvqEU0sFm1/F46xbgwGXh2o6tgigDdjrZkv6wBjoDgjC8pdh18pmlU4lldL/I+ktKoyFYuW8k/JYjvYePG8VHAmv0UgYhITO9Yp3ReMvB3GRPARB3OD1w0Z9wFxaPXA41CMUSKPULWwsblGq05P/hOqKeC2OZzRyqMmDn67fmpkhOyKGBlXlPJ+gOsuYe/jud1WOEJVimx0x2bCTR8jqbDSiCf5OJEA0Y0ILKjcly2yH5KSY/EQML12KCyu1moKqEf0qhau4mtQZnqTtqHrLX5+v2vVQBHMW7lbo9EvuFXHLcKdOEZb1tz2eNjf4yilabiWci4HXRzWRC33gye6yBX5eUMx0LbAeYydsjhSthxmmkIdlhjUUpslNWx1Jt+uFIH/kR/575YiBPkpFym0N09TJ8TSYwCBhS/F9WK3V6VQXhb7yNXDI3ufWXFvAMVLXq9ciCLHkfJgHB7uUeDeR56iX3B8JDyjMS0EXlwsz+SCCNqve8xiSlTQlfoFcHo3ii4fSUNHGwGPLw22nJ6UjCHEuc4FUTqbW11Pz66kcao/ts9dgb4ZwnXBm9weeRCmdYEgNPqvob8mj4T4CHZA+EWvNC9wYH7hK2SDYsZK6z/8EMhigzeuWUMqoGaAWxOBPg5PPWvBzVyxVL0ZNBxJg==
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(23010399003)(82310400026)(11063799006)(56012099006)(261022075727099003)(261022105027099003)(261028144727099003)(261026140227099003)(10067099003)(261021123027099003)(261021121427099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: aEXDryZu+rpn/4bke+H/CtAYRW0de5NXGgAjVOtBA9wtHwvSX9sgwZpH/WsygrXVPbJidZcUF1IVop/zi5LTtjhUP8Cc8HCkYDePLhwrGL8blB0MkwT8OAfD0RBmv7Pjrv/DTwXsLRGet3zBQvvQVDs8qpBMWKAOY8dhZ8yP/VYhLi+qGdG2eUFwKRktdrAGuYyBa3ZQV+4pB8AWGZeMP13EdxGYm5esld9eJCQ1DA+GCKOU7ZFwA7FPVXR/DNHVhIAlZp17plFtCOJKcwpdBZOE0XBRoO492UwkkBrhsGDCv+RQSpLabBg72EfiPCCzauyFsIUlAfXZF43ZkHUi3zaVry/1B9t63sxM+m28TskgWqsbO+jUZDQegs3fCBrlCS2Wmw5eg0ofnlziUC/mUhDR7t7X2K3A9WJOskmn24QnZdtrBxOsIQ8q47Dxb5dJ
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 10:31:35.1944
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 823cbc63-c066-4f9d-a439-08df43ccca18
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: CPH1EPF0000051D.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB6336
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_023140_991933_AD1211F3 
X-CRM114-Status: GOOD (  12.20  )
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


