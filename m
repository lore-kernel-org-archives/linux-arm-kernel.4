Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE50F606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 11:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=O4daOTJ/;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=bodOeYwW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=rViwgYDlHgYhLKkzcADq+8LE9YpHQVZSRoxAKEmWP3c=; b=O4daOTJ/XGYHwn
	4dxmZZK1jIUh5s7Rw2/TWPGbh1ktOGWSvEwZ5LVd+HpSBmzvJfzBc8XnUXhm0daVmhD26NPim5kF8
	Ibg3Jt3Vf+/QK5WKUklzjPzetJMz9CBSnytK/4Lz+QysvWc7MXpyWerdJc4LO/u+8cO8ahE+jXRNC
	37/tXTdKQZYhs44l0AKFVBMCjqzCRJB1DyzAML0lVHBrJrnY8RuN2S17IDTBlcWCJkLdxrZyStAcd
	ESUOuV50Iydh8RaBwWacG1H9JEAb7QGESikDSMHd4ngfAcpl9Y1HLA4eEoYcQzzYF5mzdUd62ptU7
	bMpOunt7eLpI2BnOvS7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSv1A-00000002Cln-2gt4;
	Mon, 16 Nov 2026 11:37:00 +0000
Received: from mail-westeuropeazon11010052.outbound.protection.outlook.com ([52.101.69.52] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSv0z-00000002Cfu-21rr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 11:36:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GksNxqckQHHect6+tiP+VToKcp+ALEkKKhUZ/JZY422mGATJfHroRVvKH5yAXvOUUPCIIMmAIbSdhNFbZr8RoerKUyrIg3p/4BVdhjoRgFiStnWUstFmYI/CVAL4Ap4Yt3RY/FvpdpiueKwMaZVsjtLI7vl98Y43X/syaupcjq+PYJDuYbMLEh3l9ZD9K5ZB4NQIsUCblACYXpbf8mVk1M9b88HgDySZ2QrHqpbtM0+/pSC40ZmS9t+Qy1YQVmVZMct19MmmRHcJ2JyCrbckCwtESBkxv5ElIleRZBSHGmF46Hd1NJEnfsfgIlQAb7Bih3uXIBS8r//18CfwK32jsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rViwgYDlHgYhLKkzcADq+8LE9YpHQVZSRoxAKEmWP3c=;
 b=iIcyNqp7shhdmLbBTa8PWtBCJnzH+LSwxdO9CjWwNszoZV2+GZJbz0gksJzkL31iqVOb8t9HDpsJRmhIdIMHlpqsTCKKRZ77nj1R1hbJMAzCG5FkqHUgjya6w0Pk0/GyhzlpA3uIR06RJlZajddVvgwpVFnJFElW7wBE8i4b6l7ePF3ptiOyLsaqbo4y2Zz1HEnGDRwm2BKRge5lQk9n4qCySjHWltUXJnlYg2V8H6vtZMYWYinof1lThSgscVDJSjVnQl/pb2oZBbuXkSsuqKCcriImxNvHI25/g5UV/6UnoyGlnd/afYuzSg6isfnE82GgAPxmWJJJaBdcZljUAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rViwgYDlHgYhLKkzcADq+8LE9YpHQVZSRoxAKEmWP3c=;
 b=bodOeYwWQ2Xw/vF2wzz8vrbLb4F75yIQizQMaN0EbbxeKsToEX/H5m9zK4+Nh4b0FTkEXtFIrYZ/p5R4drwYW/dxG0pVzPDJKj5/nEm4pVt74/CnK6szyqOVCxuEc4LWcaoK0Vrbk9uuL1FkxFqYamnlnVgaqsVwXOqV8fjHZpCg0W2pgHSgqQHEulRVRtN5PuVQc3nji8MyxenZQpSRIKQ1IvsMJgRkwfeq5GY3zJnlKwQxZz54E1OhGC0KTt5uHnzmhMwZ64SjPLZ6Wb/NS3+3lgNF/C+kQJL0g1/+EGc/Bkl71yrKGYgFSs8c1R5ChMsC8dLLgXY++etDh97WRw==
Received: from DUZP191CA0015.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f9::14)
 by DU0PR10MB7556.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:427::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.7; Mon, 16 Nov
 2026 11:36:45 +0000
Received: from MA3PEPF00000405.eurprd04.prod.outlook.com
 (2603:10a6:10:4f9:cafe::af) by DUZP191CA0015.outlook.office365.com
 (2603:10a6:10:4f9::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Mon,
 16 Nov 2026 11:36:45 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 MA3PEPF00000405.mail.protection.outlook.com (10.167.241.150) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 16 Nov 2026 11:36:42 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Mon, 16 Nov
 2026 12:37:39 +0100
Received: from localhost (10.130.77.105) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 16 Nov
 2026 12:36:38 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Mon, 16 Nov 2026 12:36:01 +0100
Subject: [PATCH v2 1/3] arm64: dts: st: add delay on imx335 reset gpio on
 stm32mp257f-dk
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261116-stm32mp-imx335-fix-v2-1-5f2f8ce7e4eb@foss.st.com>
References: <20261116-stm32mp-imx335-fix-v2-0-5f2f8ce7e4eb@foss.st.com>
In-Reply-To: <20261116-stm32mp-imx335-fix-v2-0-5f2f8ce7e4eb@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	"Alain Volmat" <alain.volmat@foss.st.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA3PEPF00000405:EE_|DU0PR10MB7556:EE_
X-MS-Office365-Filtering-Correlation-Id: 69a3bd39-a1ae-41f7-41fd-08df43d5e308
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|82310400026|23010399003|376014|1800799024|18002099003|22082099003|261009223027099003|11063799006|56012099006|10067099003|261102123227099003|261028144727099003|261026140227099003|261021121427099003|261021123027099003|261022105027099003|261022075727099003;
X-Microsoft-Antispam-Message-Info: 8mdK8t8/vlKoTjH7It9AOvdJYG/go8usc32t9ChzzVHxVO1BJ5ICGhi95FOl7hVeTOoJtDNrJgggNBs0Owz40Y60sRefRlJoN69ij9sRJrNb+KSx5DEsorbnMiNN/zuF+Ghn5bEAzOmV7PAUW/7b6INfBGmGMhhoGDPWDQ19aD32ykjSN8LRnQY7z5flMs9f/my3Ka2J0Lqz4CWK11HUHcuWYpuIa1m2oIkOIpcDniuvTj/g9jxIIL0lYWi/dZAPrG9K8pr+1ONQFkPj+jlUvVHUB3ms1dP2PwYs5P8rj37j23yu1DgMpzFonxhYXLn6cRryLbbTQgpzhNYyyiukgMpcsAGNG0BwjuygTO14/XhWaWgJyjuVfCg3yMCrDnPdwaijv5XLBui70sfhGOq3SpupQaDmTPRNmiIFVrJhOaa9/VIFt6zKH+Itp+LP4uzWSu2jgtg0X+clXSECdVPhffWbdDVvT5I012ImiSQZ8qJzpTg2BuSGqm6VseSsv4mPZDEvHUuCkDf254pfLxmiiaRzV+R0G2KskczquI3FTdH4gRM2Rg4olywo79p2aRGwROOJ/yW027co6MOkG1f4NmkrsWCNoUS+caeYeBdyZU4b8nTrAjOVOt+9ROUkblVDxUSaRgIrcapk3DTQvkkCOPU1BluETLGHobAK2LNtzo4bbP93RDluTcRUThNOtIk8tJripaE2YmpHrh8HvenxDg==
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(376014)(1800799024)(18002099003)(22082099003)(261009223027099003)(11063799006)(56012099006)(10067099003)(261102123227099003)(261028144727099003)(261026140227099003)(261021121427099003)(261021123027099003)(261022105027099003)(261022075727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: dfPw4xeU0owZ/s3KpygB70SfEuUrnn7j3bjZs1Y3F7ozFLiH7ww/u5KxpHbZKAtjhbjotmnT2dgihGlYpLPh6ZoSlPFwT/vVkKV6frHGjowOOAueHc6DNtL6zNIfetKuy7JcegrW5Rs7OPNqSrQFA3kenHml5qAhjqZscqNt3hmqSJfdPDhNwtTE+9HcdiiNvMlAV7Q5fwOe+I/iBdTWX89oKa5tcBmhXGpGHaY0lack7e9VdrIvkkA53CK16sWcdpC3vXUJbeZ6Iv55i8F3+B3aXC6Nr1+GSVsTRs4OfnSsHl5eb150QWHjrsWYG1LoOm5ePr7sS0kEbabixy94J0OiJ8jBq1I60+kVgLooxamu4ERttBIEyffXgg0eO+0ft/qYUSYj57ba+KnesvFPKATCQWWGLOra1Vn/M7ijGQjN4JZSchf0UM+HP9gVt1fK
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 11:36:42.3445
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 69a3bd39-a1ae-41f7-41fd-08df43d5e308
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: MA3PEPF00000405.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB7556
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_033649_529780_084FE966 
X-CRM114-Status: GOOD (  12.25  )
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

Fixes: 95ae2aa3caf0 ("arm64: dts: st: add imx335/csi/dcmipp nodes on stm32mp257f-dk")

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp257f-dk.dts | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/st/stm32mp257f-dk.dts b/arch/arm64/boot/dts/st/stm32mp257f-dk.dts
index a8f18508db3e..ce7bb4a4d9a7 100644
--- a/arch/arm64/boot/dts/st/stm32mp257f-dk.dts
+++ b/arch/arm64/boot/dts/st/stm32mp257f-dk.dts
@@ -76,6 +76,13 @@ led-orange {
 		};
 	};
 
+	imx335_reset_delay: imx335-reset-delay {
+		compatible = "gpio-delay";
+		#gpio-cells = <3>;
+		gpio-controller;
+		gpios = <&gpiob 1 (GPIO_ACTIVE_LOW | GPIO_PUSH_PULL)>;
+	};
+
 	lpddr_channel: sdram-channel-0 {
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -236,7 +243,7 @@ imx335: camera@1a {
 		avdd-supply = <&scmi_v3v3>;
 		ovdd-supply = <&scmi_v3v3>;
 		dvdd-supply = <&scmi_v3v3>;
-		reset-gpios = <&gpiob 1 (GPIO_ACTIVE_LOW | GPIO_PUSH_PULL)>;
+		reset-gpios = <&imx335_reset_delay 0 1000 1000>;
 
 		port {
 			imx335_ep: endpoint {

-- 
2.34.1


