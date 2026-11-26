Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 559E6606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 15:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PrFMDfmw;
	dkim=pass (2048-bit key, unprotected) header.d=phytec.de header.i=@phytec.de header.a=rsa-sha256 header.s=selector2 header.b=ggQcpuqO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=cRQ/lEJZmpQB34jCt9MglWXycU37EKjiM2mCmv8RwJ8=; b=PrFMDfmwX8Yljm
	dEgIzKPadElK53cwoU3P9oZIF4naD+Bkr5hOGK+45YB+YPLjGWC5wQturv9jW96Rj8ww68QIxrg2P
	wPwRQo2DGQ/gC5y0eb278RucftMwlC80VHqEem14p0AR42o834uTlYoijhbHelTb62Fcml31daDAO
	ClqNfCXxAgqzruxyJjnpmxPEKQoixsLV3ga697CZjmZo+J/qTwZp2b7mk5u/Ou6+GCiqEIzDr6q3J
	q9YOpHF31W2vdKBL5g9DSVltrUbJ1AdIK1LaWqLykZFSdnjhkskEA+AsD92ZNy6AlVBcYpPOFHiJY
	skD1RTVRxd/v/tk/JI/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWb2N-0000000Dexe-3Nrl;
	Thu, 26 Nov 2026 15:05:27 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWb25-0000000Depe-12T2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 15:05:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=psoNb8MVORTy8cHxeKetrYKby4yTeY0fh2GVagXWKJgTyWpCYjYYbKlOyOq1mozuilWNEqywkdi6+qnYqV/llNNHWHRpHcgNdbwslhxMAiBKdX+fyOCVZLnLRX31TOsMSaApc8vzrM84wixtuP06TBwX8nPJMOPA++yU8N9zzERMKUBSCxrP2rq+FD3iSyUxnOiWJEJB54uYxQefDsd5pyOIdMRYCQfh4TlvcIERDKYKPZNJQJ6MAI0qdSCAWoe6tY+nmDXZkv/0Xo/UyzWccHPXWqC/48P3Gv9URVRwEfcWbMCykdPLBRGuohpR6awu8DleiPQ/fOE+1WnlcDFW7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cRQ/lEJZmpQB34jCt9MglWXycU37EKjiM2mCmv8RwJ8=;
 b=IqYcGTVIe6HnV7G1/pALnuzQrYPHl4AmKU4NQYEWyQ51xbaYGGG+oF8vRzJHhyqJj6Bp4QPdvhUvX0StXlMUntKlURXrpJYMAAceQRQUH7cdLJ2YGquNwtCuEu7cnUAA07xD05GCrfH+CUoUNnRC6rMkAlmAAji9GOxLc8E6+3opIfBW/JkIMotx3vJrfvdBmP83W3D5rEa6/FQ9ChWasQ2p78snBx23fjDtUMcUkCqPPj4GOetdDO6RJlCRF2EjDmWBi0FkkSPc131MQwsQsOMFQbuel5kD2TiYmFeNhsraQnJieRx19E95nv421K6R3UHlTto2SMIbL+WhsAyNLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 91.26.50.189) smtp.rcpttodomain=nxp.com smtp.mailfrom=phytec.de; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine header.from=phytec.de;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cRQ/lEJZmpQB34jCt9MglWXycU37EKjiM2mCmv8RwJ8=;
 b=ggQcpuqOdi3J2bHE8hX2O2qwsKjxQnGbxxpQ6fSjM/yiICq59EI0Ip+gKFa/1SVbFnXwsSZGYVi2SwxVoBdEwaoH8/mBwLnm3H75wthEo7+kSd+1TirSpZkUHCVoW+SVJfYVKHsSZ5pe/oQs+NsEOuMWmOUIF/S3Od6P7DbWc51UxJn8dI1eN2vrKZ1GDEKsi1Y3tMX8SRXbrlmmOJpvkVJz5AC9PJ08+usd2w3ZT2lAUdKcGXKsDcUdF/6OeBXGhh9WpoNd3/pxPZV6Hn8rcXozM9mzsGjohfd/itixEtmWJBPkPbyQ3zPxW/49UWgofDx8tQ9wOgKO04eywzjiIg==
Received: from DU2P250CA0002.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:231::7) by
 DB9P195MB1195.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:269::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.13; Thu, 26 Nov 2026 15:05:01 +0000
Received: from MAD0EPF000008AE.eurprd04.prod.outlook.com
 (2603:10a6:10:231:cafe::8c) by DU2P250CA0002.outlook.office365.com
 (2603:10a6:10:231::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.7 via Frontend Transport; Thu, 26
 Nov 2026 15:05:01 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 91.26.50.189) smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: Fail (protection.outlook.com: domain of phytec.de does not
 designate 91.26.50.189 as permitted sender) receiver=protection.outlook.com;
 client-ip=91.26.50.189; helo=Postix.phytec.de;
Received: from Postix.phytec.de (91.26.50.189) by
 MAD0EPF000008AE.mail.protection.outlook.com (10.167.241.187) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Thu, 26 Nov 2026 15:05:01 +0000
Received: from [172.25.51.48] (172.25.51.48) by Postix.phytec.de (172.25.0.11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 26 Nov
 2026 16:04:56 +0100
From: Benjamin Hahn <B.Hahn@phytec.de>
Date: Thu, 26 Nov 2026 16:04:57 +0100
Subject: [PATCH v3 6/6] dt-bindings: arm: fsl: remove outdated PHYTEC
 i.MX95 FPSC
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261126-wip-bhahn-imx95_upstreaming-v3-6-a2bda009bac8@phytec.de>
References: <20261126-wip-bhahn-imx95_upstreaming-v3-0-a2bda009bac8@phytec.de>
In-Reply-To: <20261126-wip-bhahn-imx95_upstreaming-v3-0-a2bda009bac8@phytec.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Frank Li
	<Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
	Yannic Moog <y.moog@phytec.de>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<upstream@lists.phytec.de>, Benjamin Hahn <B.Hahn@phytec.de>, Conor Dooley
	<conor.dooley@microchip.com>
X-Mailer: b4 0.16.1-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795705493; l=1627;
 i=B.Hahn@phytec.de; s=20240126; h=from:subject:message-id;
 bh=8TWNyiXfrxwS1pB/BK3dA5FEbHisFPtNI9fn6Rhufxs=;
 b=Zq3ehCXdsS4SLpsTCqwrKOHvPl4xd71YUTDYqFVAOvSuNusy7qjlS6FrzFCY4kKB4Gmx0OjEn
 Cc4Uo9/sWkdAw3HAP2HNG/b6pd9536e/wkQvHzPe+OkGhOuwQIhF1CW
X-Developer-Key: i=B.Hahn@phytec.de; a=ed25519;
 pk=r04clMulHz6S6js6elPBA+U+zVdDAqJyEyoNd8I3pSw=
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAD0EPF000008AE:EE_|DB9P195MB1195:EE_
X-MS-Office365-Filtering-Correlation-Id: 0634cba0-9b95-45c9-4e5d-08df4bcea515
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|7416014|1800799024|376014|36860700016|82310400026|10067099003|261026121527099003|11063799006|56012099006|261021123027099003|261102123227099003|261021121427099003|261009223027099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: M41NHLI8hewt9vGZSFX4mpu89OnJIyQLswI16gIOnRS36ATo+icm1ahlkgiel7fvXJ3Imlv6rcN6BCFFttPOcViF1TEk1xsWswnaOrdAGoDonUyb0M6qlwRolYb+aUBZdr2ZcHvV+Jg1eS2H5mDnhnTlICquKj/ldOXgYKL7HzU6mzNFCeTqQZYq96L1LfkpNSxqs3mDeRyCokf0b5YFL40pDaIskmccjmqWkEENGN86kPv1ngNGsMDIXYqRYbuU8Xzt9szhke06FSDwJKUIWHvCm2B+q8iaeljX9UJ+Go8B/k3CzEZy1rSKYTVUgaiVw7tw8Dh5MhETv0LCyAq4ov6ieojsBaoMFsKsugiczVgyFixtTijE6Zr8XfAelxhpwiRDsP9B6bXFHXtd5ZUvDOPR/ml5GQ+smQKl5L6ykPxwMjgLHYsb2AUC+6cgbdsjdC8lROAH8ez1/Sjv5BhdzEjYFDqu0o071FdVYS7JOF10bboE4TS5pJSQDJV7D5oeMMxVg8BN55lz21rjTRm4+im2oGFFzL1dcGKX2LLsOAzNGPFqbziQZgEcTKcNp7PXdAZfc94PUjZEBm+AzfsBMf74wl2eBZVMvenZMyU5tzqVHuiJ8qTeHhLzDHMuR1MPE4K0IWhXZCefzC0r9II0/yYfp+qqARStMPsujENWv+ZNhXOWdGLyNR/1tcSKCmDwFqEAUEKele8cOVmGrQU7QA==
X-Forefront-Antispam-Report: CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(1800799024)(376014)(36860700016)(82310400026)(10067099003)(261026121527099003)(11063799006)(56012099006)(261021123027099003)(261102123227099003)(261021121427099003)(261009223027099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ziaA7bNlnJr/0T5GXFD8KDhiV9yVVTZ0DL99BB45ilT8v+Nox+aK0mB+3nN0iv0ClSZIPIwPwiRcK2pECPOofq6KU9z75Yf7neyTYdAilYSTMjjhMUAKebrq3z0d4wudkh5vO0/TuGBJwqRe/35yI+yFLbzPLI2lP87OOCQOjNZeCKSwlOF1NsV4qsS5DgtGkstXBdP9wBfeZumd64UU8STCgbSGIjWmfM8Eco2UAYl/mdfNsxCfhGuhVlv2TcNhmKbVUe+xptJF/sud7U2bslb99S3Pn2NCLNTRZDGpsdpbmstBDsPX+Dy8bZccJ7+jdOEWM7atRRO1UMXQbnleZPtd5B539z+p2+BSKrODHRYlejxAtnm3ABu+pUYH56XwDYSDDJDLPnAoTD51hqpviildP4dOV1RS05XnYjv+AKHFyK/VgrQnP8XbsBELUFIz
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 15:05:01.2252
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0634cba0-9b95-45c9-4e5d-08df4bcea515
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: MAD0EPF000008AE.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P195MB1195
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_070509_332171_2C2196F6 
X-CRM114-Status: UNSURE (   7.82  )
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

Remove the "phytec,imx95-libra-rdk-fpsc" and "phytec,imx95-phycore-fpsc"
compatibles from the fsl.yaml schema. They were used only by the Alpha
hardware version of the Libra RDK (1618.0) and phyCORE-i.MX 95 FPSC SoM
(1620.1) built on i.MX95 silicon revision A1. That hardware is EOL and
it is superseded by the phyFLEX-i.MX 95 Libra RDK (1618.2) and the
phyFLEX-i.MX 95 FPSC-Gamma SoM (1620.3), which use the
"phytec,imx95-phyflex-libra-rdk" and "phytec,imx95-phyflex-fpsc-g"
compatibles.

The corresponding devicetree sources are removed in the preceding
"dts: imx95-libra-rdk-fpsc: remove devicetree for old Libra" commit.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Benjamin Hahn <B.Hahn@phytec.de>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 43b1ff8d25cb..f387cf42b906 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1544,13 +1544,6 @@ properties:
               - fsl,imx952-evk            # i.MX952 EVK Board
           - const: fsl,imx952
 
-      - description: PHYTEC i.MX 95 FPSC based Boards
-        items:
-          - enum:
-              - phytec,imx95-libra-rdk-fpsc   # Libra-i.MX 95 FPSC
-          - const: phytec,imx95-phycore-fpsc  # phyCORE-i.MX 95 FPSC
-          - const: fsl,imx95
-
       - description: PHYTEC phyFLEX-i.MX95 FPSC-Gamma SoM based boards
         items:
           - enum:

-- 
2.53.0


