Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4899B606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 10:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1N+8RYG6;
	dkim=pass (2048-bit key, unprotected) header.d=phytec.de header.i=@phytec.de header.a=rsa-sha256 header.s=selector2 header.b=HSAEVzul
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=OzKVLmEvgIcBM/Bt7sxO9jcLu98duWb+sAu9xIVOo0A=; b=1N+8RYG6w1cPeE
	LunmQ7HDPYhwonbBGFuFppfPfWEuMhJrSCOOUcYU3wjFPO2qr/xCG0H40ZxL1scm9TBkujYlphROu
	+TnfU1CFcT+dizCy/nQHC+kHw/9R5Mn8tZUNbs+vX3XIA+1zdbnoscZztfIasF5NozFok74ricp8C
	nUBO/nOJ/LuPfI4RiIXBAlKwT5BFQ6QIIoYRu4H6TRMj5W+txsvPGifgIrCVdPnu21KCkMD2GYdhl
	gsMmdukD6ds+vJOp2WBA+QTb5ciCS5cYClUffXlPIBXBIwp5/YTCi0uvxqH6f8+qu1FSjgNBjKLhC
	dYnqE1gPU+g/Dt40bhfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSuNN-0000000227Q-0l5i;
	Mon, 16 Nov 2026 10:55:53 +0000
Received: from mail-northeuropeazon11022083.outbound.protection.outlook.com ([52.101.66.83] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSuN9-00000002200-2VTq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 10:55:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nu1d/m2ACeoVDEsp/bCph9acf28TJIfn5FH+Tuv8wXk5S34zOOPAcWQegQndhGrnDpNXtWfLHeJGPtKH1fqSCoMawG3OFMRSXlQxTM4THxRFKfr3UQQjOeCtcCbUfSnL28Y0DHA2ERqy89yEytK+PUTXvgeZY7J1NLBkAZubXHpIBSJhtGNfpy24kBI1NbpydTqnmT6AEggAYUqiwMIXpmg8PP8sH2fEx4ifn07THa+z6lR0ptK4x0MXn0gZKv/rYpuArOTt++lspwxLk8G9pUyePsmpBujw3lADRTrziM4GLwwizxvljtKn33pBJgwIjjPjrymzy/7iJrzn/wubsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OzKVLmEvgIcBM/Bt7sxO9jcLu98duWb+sAu9xIVOo0A=;
 b=v9XPwmz89eCDAQBBuCUU3tQIxIY+rkpN65rZhVHsPM6U9Ky6nCb/ClKN6uDReN1UH35rB4wKQZL2gG7sSzj8iALcsdzIqwze+O+ErRB+/gyF1O8DuLO2ncTWHzZFNjzNk12EgESI0+gwO0828hlaxoVRnZxCz6wde8pCyHejra+3rbZ044qgsNKIH1NtUMcGKQ9aD8LisrSreKZrN88MWF8CjPMVrO/LL6TKRBNAjUaGaOY3Z1YE+MeKPTHBbcAs26JfucW8qRvpjNkz9hg5eBzEbzQy8+WrTip4koVGgFRfAVcA0L3MW23ok3jBSnnkn21fE+Av7X13SKfiI0Y56w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 91.26.50.189) smtp.rcpttodomain=pengutronix.de smtp.mailfrom=phytec.de;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OzKVLmEvgIcBM/Bt7sxO9jcLu98duWb+sAu9xIVOo0A=;
 b=HSAEVzulwau6HJ7h99Y0y9UDeZRIm5EaQCFB5xXCPj2PoG6w29Ijwhbi7Sut32UgPZlMSQklVKIkATmHHJJYyA0fZvhlNiEk6X93/bhTqubol2f/I5pihbYNbGAf7RE1o7VI8xjgxczGmkWGlPDbnTHsMWeQy+ZEXldcI/neGxmcFS/rz8MKLY0e06q2XIt5Jd+i8xVvvJrvdhvqeRaVBWbPbmONxC/7gpJw4kaQOql9S+0C7npiO6x/4VR+3rqhS82ZRRSvdl6mLiqX4ZmwRrPei+ALoai8d7KD5hoQ6mSXuRdydP/fNDIkht0LpSNMcwOMG6yVVfY3+QEOOXGzYQ==
Received: from DUZPR01CA0235.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b5::19) by DB9P195MB2759.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:10:5eb::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 10:55:32 +0000
Received: from DB1PEPF000509F0.eurprd03.prod.outlook.com
 (2603:10a6:10:4b5:cafe::5f) by DUZPR01CA0235.outlook.office365.com
 (2603:10a6:10:4b5::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Mon,
 16 Nov 2026 10:55:32 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 91.26.50.189) smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: Fail (protection.outlook.com: domain of phytec.de does not
 designate 91.26.50.189 as permitted sender) receiver=protection.outlook.com;
 client-ip=91.26.50.189; helo=Postix.phytec.de;
Received: from Postix.phytec.de (91.26.50.189) by
 DB1PEPF000509F0.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 16 Nov 2026 10:55:31 +0000
Received: from [192.168.2.225] (172.25.39.168) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 16 Nov
 2026 11:55:29 +0100
From: Yannic Moog <y.moog@phytec.de>
Date: Mon, 16 Nov 2026 11:54:44 +0100
Subject: [PATCH 5/5] dt-bindings: fsl: remove phyCORE-i.MX 8M Plus FPSC
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261116-imx8mp-phyflex-v1-5-4adcf8b4d373@phytec.de>
References: <20261116-imx8mp-phyflex-v1-0-4adcf8b4d373@phytec.de>
In-Reply-To: <20261116-imx8mp-phyflex-v1-0-4adcf8b4d373@phytec.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Frank Li
	<Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
CC: Benjamin Hahn <b.hahn@phytec.de>, Christian Hemp <C.Hemp@phytec.de>, "Jan
 Remmet" <j.remmet@phytec.de>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <upstream@lists.phytec.de>, "Yannic
 Moog" <y.moog@phytec.de>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794826527; l=1008;
 i=y.moog@phytec.de; s=20250509; h=from:subject:message-id;
 bh=MB/iG4qEO1Hl1ywoLse6cXIfwi7oaZwo4EAn3kHYEgs=;
 b=YyaRqBpqI3NyduIGX6owkirXTWeagPsLcCc85TevH+ifrrs+vIVSUX9sJ7kkQ62OvXO2SCtd3
 Hc1sSHDo9Q/CghkUXmsXE3dgkbT0C2zJvD59HZr0fGgVkLI/FBWKzE1
X-Developer-Key: i=y.moog@phytec.de; a=ed25519;
 pk=rpKoEJ4E7nD9qsrU/rfKVwMTWNWYaTBylZuJUXUiFr8=
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F0:EE_|DB9P195MB2759:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d26663d-0b8c-45cd-7e06-08df43d02279
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|36860700016|1800799024|23010399003|82310400026|10067099003|11063799006|56012099006|261021135927099003|261021123027099003|261009223027099003|261026121527099003|261022075727099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: MBFk5nvVxaeXiMsBEqpTB1zbxvoy9FiPH8YO7hARhztniBF6kNyQrKbbD2qgv0gNP7xJZDKUsl+0TcgHKCBfeHEMrZO1I4QHFFD/r4TEh9UJqwXForunwWoJFAJPYqR+9xEXtyNWA4LaCPFzd2GHBQyixrxWC+t2atqJE94/qogoOqMd1VbEM8EDtVys3/SGjeqR05K6TznWH/NleUyijPFgW0GFV7DCwf0zW70+o60IlCwcMI6bpp1jao5PLQsJY9M5jruvUzE4dn92bmUcr+PzGCEY1Ib8vm8z3FQJOeDqRQ+Mw/UZnFHTcAI659uDdF8yQTNb5mqB027YuTp6HBAVtog9YcAj+O2cMgpSijwxm4rBs5J1OXUvbAPqulKgN4ZtMeamXrHFWKqOQ/3pBroI+H0UaII5wZ2Tj6xgRfBIhwDhMorzjWw8ZxeqWmiWNNvHl0z3iVyI1ByH2PeqIVLsMSFVnty7uaxQjUL5Yy42tSeZBWZ8359jHOZeBNHJaWdDm245cHJSgzDgaZZndErHwjGPJn4wW4mp5E9w2yAV01kEMC5/AUYZvhiMg08rBpEMqiCCcyY0IGI+LqxFHmBvl9GjT4e/aewluugLrY0I7fWhC54tVMDGCb1xqgkN+f3Oc133m5XE6FsUS7JCtvXabH9Lz9zrZjvPk16SMA7hzdn5DAAMSeCCk/eEHOQ/5YSIkMK2IrRPyBWg6lXmTQ==
X-Forefront-Antispam-Report: CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700016)(1800799024)(23010399003)(82310400026)(10067099003)(11063799006)(56012099006)(261021135927099003)(261021123027099003)(261009223027099003)(261026121527099003)(261022075727099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: YL/h4LZKxenra0vip75MCTIt1jhQCZ+RJb/JFja2Y2itA1R33ZyX7T6EebCj7TaD925FzFicGPwlv3Mrf8ULxZA4wKsybaSQndMKu0mp9ywXpkIG2RCHV3KLIW4O5fNRAwGe6wkGLK64/HA/N/j1whTEee7HmS6+++OoA/KELjKtSjwHFHA1sWdICRnkTVHnux6xJZWCqSVrKFqdVSRVcTzlIaWk+9V9KC9Mm3lFHBusIU/PEA7ZYJlf29sDJtTpXN+3gTN3AHLIzQWIRwvJwzOf9bx2O6pRy7Jz9cOSWid5fk9guhf4Yew6pL6PT23XkL7mj5ZOlIpc8IGO4JlL1/VTFihBnPK/LB3rClNpTe2CzM6iYjm2G+nes+Hmdk265CX66xPInhmtT6rKf9/A8k/ILXfLAYgMitGKW5xljdInGq2ntAjIjlebAeYxsqZj
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 10:55:31.9885
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d26663d-0b8c-45cd-7e06-08df43d02279
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509F0.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P195MB2759
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_025539_642934_41707C83 
X-CRM114-Status: UNSURE (   6.75  )
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

binding has no consumer anymore. It describes prototype product only due
to renaming of the product. Remove it.

Signed-off-by: Yannic Moog <y.moog@phytec.de>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 2d21a1949d949..ae823a7670b02 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1227,11 +1227,6 @@ properties:
 
       - description: PHYTEC i.MX8MP FPSC based boards
         oneOf:
-          - items:
-            - enum:
-                - phytec,imx8mp-libra-rdk-fpsc  # i.MX 8M Plus Libra RDK
-            - const: phytec,imx8mp-phycore-fpsc # phyCORE-i.MX 8M Plus FPSC
-            - const: fsl,imx8mp
           - items:
             - enum:
                 - phytec,imx8mp-phyflex-libra-rdk # phyFLEX-Libra i.MX 8M Plus RDK

-- 
2.43.0


