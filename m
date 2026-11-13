Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9A556072325
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 16:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YvhulCsh;
	dkim=pass (2048-bit key, unprotected) header.d=phytec.de header.i=@phytec.de header.a=rsa-sha256 header.s=selector2 header.b=aZ1NvBG4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ziuqjPX1x/R2vrfKxWF7QiqFNfnBahKV6sX7A4rzJF4=; b=YvhulCshrh26PP
	JafhvPkjf2XBu/Ab6jvF/ZDybQ6UknNwIfzkTPHMq+jo5JrVFhD1UlKE0IcXHTDnU3icT7W7IkK7S
	ueIljo9Qe2cp/K5XclKWrzuNq9s8PRrbmxky1XnfDxCJZ1UHJPuDUNzwkI75dgCj+gd100D/AT7QT
	6KQpFxBpZzytJXqd4FFKlUnaOY65WeyIOiqqRU0h/6MUFlLcHmNBJrNUjOYslecVWONbD8z7h5Wu/
	BcHV+H7pDlecySDN00UprKg5iBkjQbb8Cy4OX17Def3h4sgQS/MezwI9httV+aLzRwjZtn/ZLvzUF
	xHWIQi4OLRhISVltk+8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRthY-0000000DUBm-2AIw;
	Fri, 13 Nov 2026 16:00:32 +0000
Received: from mail-westeuropeazon11020110.outbound.protection.outlook.com ([52.101.69.110] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRthU-0000000DU60-0Lys
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 16:00:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hsDyoeteuzNW7s6pmGbjJTXaFwueQy9UhkwG9QtewE/X0uDWGWNyimJan1it6Hqq+GHiPSUqaGuWE6skY16GEsGIjcXFFzxhLoBkmNiHONVys7vzvK7ruZlN2C4w4dK0ubm8//67w48T+dql+kOlkFd7P3IS0kvvoflTLAkT50OExQa/nxUtHHz9YRjtaeYvBe0rZMAt8fvVitJ2kFokUrn3LUTQ24z9mV+LGyqVzpTqqMfO+2q1VPIQ41kdRQS1uo8XHhKImtqij7crNXiYy/Ns/0q1fjBoLOjspF7tYjrI98njMjXv+6ImTlAsRVjkbA/slEPJkNoFjE4JISRsxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ziuqjPX1x/R2vrfKxWF7QiqFNfnBahKV6sX7A4rzJF4=;
 b=bWxJ549A5zEReEhJyVlg8vjZ7/ZZ6nWaU80VybB94Mb6TnXLJ4SD/Fl55RI1vCB5PZ9CkDDlSAUSSp3xlsqm4v5d19rcNBGmxf+6APhLEHNN+ggB9MeF43wMfjEq1bmzI7I6x+w3oMXFWLbyX+XddX/syfWPqRZY+ylUn97QBq8BwGWgI+NCKsmlPe2W8/8lfFN5gnPPKDoFEPf3gKX6vE3YoYWFa8kvbqWEcB3NkT37XiPSSim4c2hTUKKkQjaYbM5Fims4uo/xkt/P/H8KcGozuBV48kmhiFnq2PQBmqC7kHdaVBYDsessLqV4UWQAebE9mZEbqEoKie6accnZrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 91.26.50.189) smtp.rcpttodomain=kernel.org smtp.mailfrom=phytec.de;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ziuqjPX1x/R2vrfKxWF7QiqFNfnBahKV6sX7A4rzJF4=;
 b=aZ1NvBG4qR9aXgb/M9jZlIZZ8U2pkyxaxifTgfzaKbrrJFUD9wqiomoJ3GN1pZmKu3yzDnV/hPuJlZh9NTf5xtZ9u+dVmjBjfhMT0cJi/TK2ySPu67XY9tWTjtWSMkFm9OCADsACpbZBK2sbDxc/OssJfC20sz5NI3WmSqDW+7A2Kn9tiuY+JINNWU9yz2aLEtes9KnZJtixSodHj/dr4x9NDXpM2xg8l7offBrP94es24zA4akMkbJe7T4s+uYn3AQ5HKpSBtrM58eP4tb1IC4Uh6Txt8k+HGfkJTXPz6t1QPcOH+DY+Z3+oXIjHrq0tFEYvosSe8Gmr6y22pTeWQ==
Received: from ZR1PEPF000077E8.CHEP278.PROD.OUTLOOK.COM (2603:10a6:918::459)
 by PA1PPFF46D9DF1B.EURP195.PROD.OUTLOOK.COM (2603:10a6:108:1::1e9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Fri, 13 Nov
 2026 16:00:19 +0000
Received: from ZR1PEPF0000E6AD.eurprd05.prod.outlook.com (2603:10a6:918::154)
 by ZR1PEPF000077E8.outlook.office365.com (2603:10a6:918::459) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.10
 via Frontend Transport; Fri, 13 Nov 2026 16:00:18 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 91.26.50.189) smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: Fail (protection.outlook.com: domain of phytec.de does not
 designate 91.26.50.189 as permitted sender) receiver=protection.outlook.com;
 client-ip=91.26.50.189; helo=Postix.phytec.de;
Received: from Postix.phytec.de (91.26.50.189) by
 ZR1PEPF0000E6AD.mail.protection.outlook.com (10.167.241.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 13 Nov 2026 16:00:17 +0000
Received: from llp-hahn.hahn.test (172.25.39.126) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Fri, 13 Nov
 2026 17:00:11 +0100
From: Benjamin Hahn <B.Hahn@phytec.de>
Date: Fri, 13 Nov 2026 17:00:03 +0100
Subject: [PATCH v2 1/5] dt-bindings: arm: fsl: Add phyFLEX-i.MX 95 Libra
 RDK
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261113-wip-bhahn-imx95_upstreaming-v2-1-3ef58af5e689@phytec.de>
References: <20261113-wip-bhahn-imx95_upstreaming-v2-0-3ef58af5e689@phytec.de>
In-Reply-To: <20261113-wip-bhahn-imx95_upstreaming-v2-0-3ef58af5e689@phytec.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Frank Li
	<Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
	Yannic Moog <y.moog@phytec.de>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<upstream@lists.phytec.de>, Benjamin Hahn <B.Hahn@phytec.de>
X-Mailer: b4 0.16.1-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794585609; l=1068;
 i=B.Hahn@phytec.de; s=20240126; h=from:subject:message-id;
 bh=6/g+v1v7p00UnXyApsJiJOo3nALZipWK8vQuzknn9sI=;
 b=9eX7S3SJKRjCrVGObyZTGoN6ScHSG4OpcUlBpPUwwfquoWfVZQkZZSf9yCGkH7wo3Vuqpcr3i
 /pZERKbKQt0ATzGmhoxCD72hkJENMxOV67eEG0vq2Sm1Ik2iO412NtZ
X-Developer-Key: i=B.Hahn@phytec.de; a=ed25519;
 pk=r04clMulHz6S6js6elPBA+U+zVdDAqJyEyoNd8I3pSw=
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZR1PEPF0000E6AD:EE_|PA1PPFF46D9DF1B:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b6f6bda-2543-4e6a-a6da-08df419f35f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|36860700016|7416014|376014|23010399003|18002099003|22082099003|261009223027099003|56012099006|11063799006|261102123227099003|261022075727099003|261021121427099003|261026121527099003|10067099003;
X-Microsoft-Antispam-Message-Info: /Law4B5sXE5gvfbpJ71wFYsOcKVONfLuYtEiFbEKhImtwA2y5mpFCy+/ZY484WkWCgDRAt+x58KvEj1elFH/cini6/0ez4sCSEFhuQuyqY+Ew5CpyddJNICxpcg5nmQZkWyFLfl1yMMKqjVQZPCo+YHyjehS6U2dEbYkjXwn69r4FpozYT2PRZ8OuutmnfFGLyji2e756L5U1qmjRJuEFH+ec8r6WH40HHm04epYdd/KdhOpACEu8w4Ltfec1hs3CeX6aZNLv++DxuibLIZATDX7mQqrWAgVLm0nhrOUGxUhLb79sCBl38IMV9vf0MwVT27YtMaEwlKYUWW/YAP7mr/kxrcUy4L5h6Ewuu3kuJ131lWtTxDjzaUn/D13R9M/sXD3t0c+AJtf2j/frpzyP0TK+ATQawy3fY4udieNiKk4oSD8FMvSNh4rJK6454bkuRFj1tDfpyQeIg5bFRMB8215MINAAVaYXjUGgy7eXzFuz4LNHPuHky0oWooDGAXi1sOAmrrnSOj/8wROl68G1CT2u76Imj5oH3jJBJg9MQazl44ocX4poVILpm0CRSfd4HLv4nuCAtP2rqHPDqT4D3v3FmSpfvufzuI2FQMbn5B1nTdIhkIUc5aCp2g8ZPjDtpgzRgaiVvIn47zTbZePsN0ERtxhNcH1jMVeV7+MsZXhEcKrjGfl0W0WSI9rHdTs6B+G4/inDs6H62BBt0h6Fg==
X-Forefront-Antispam-Report: CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(7416014)(376014)(23010399003)(18002099003)(22082099003)(261009223027099003)(56012099006)(11063799006)(261102123227099003)(261022075727099003)(261021121427099003)(261026121527099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: t61WsNTplVD9agMS98nLYSZ0agBTJARgIbGaaqMxiIPHRve21AWwrxFfcjGKATn8Hbymp0wMiNQnPA2siNi0SCt04Cey0CW83DZavFV2Yi8jPJR2btNJIXiSiaUaCcPyXUlxloXYVLOkgfPxAavTtOceb57FFRF4I9zucjPyjCaIz2/wsSoS3YFqcIneYgIkpQhOiyXll9ScDWkL+D4l7immWuQ1tgD6HdCM7uJCoxxP2BdCA1igwjuXLiH2PNzFnDA/xFBYeeJFYdyxJspSUPMYLBL+Nl6zlh1bYb/MDT0Se0tEfsgcsQ43ivKKDWmFs3QcWq3o/ML35D7ZBvm5vr8JOiP7aTgFkmRgLhQRKEJlgY9gdGc8GdWIuWCr9tFjZkq8/AivrvIJn6vQO3EFRp9hxwT/7sLEsGUci+nEf+W0Q185YpCHqvMPuJYvF1gy
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2026 16:00:17.0352
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b6f6bda-2543-4e6a-a6da-08df419f35f5
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: ZR1PEPF0000E6AD.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PPFF46D9DF1B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_080028_305580_446C6BB5 
X-CRM114-Status: UNSURE (   7.64  )
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

Add devicetree bindings for new phyFLEX-i.MX 95 Libra RDK and
phyFLEX-i.MX 95 FPSC Gamma SoM.

Signed-off-by: Benjamin Hahn <B.Hahn@phytec.de>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 656f2596e1d5..43b1ff8d25cb 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1551,6 +1551,13 @@ properties:
           - const: phytec,imx95-phycore-fpsc  # phyCORE-i.MX 95 FPSC
           - const: fsl,imx95
 
+      - description: PHYTEC phyFLEX-i.MX95 FPSC-Gamma SoM based boards
+        items:
+          - enum:
+              - phytec,imx95-phyflex-libra-rdk    # i.MX 95 phyFLEX Libra RDK
+          - const: phytec,imx95-phyflex-fpsc-g  # phyFLEX-i.MX 95 FPSC-Gamma
+          - const: fsl,imx95
+
       - description: Toradex Boards with Aquila iMX95 Modules
         items:
           - enum:

-- 
2.53.0


