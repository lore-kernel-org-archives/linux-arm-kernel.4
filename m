Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AA2A606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 15:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NsnYe8LL;
	dkim=pass (2048-bit key, unprotected) header.d=phytec.de header.i=@phytec.de header.a=rsa-sha256 header.s=selector2 header.b=UiOHr3ii
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=uLZnYGL4VRxRv9A16dd7c2EGzwCgFOCuOvu32IGKyGs=; b=NsnYe8LL+xKZUl
	phLrPwgsAN/iIlcR5bJeFPPbeCsBevUXggPISCEqRgHGbqKn+g/83RL6JxSmMh+YGEsjYt1oDgU8o
	wFp/W7LTyvrcOdOZeEEgDt0PlGT/S2avKS2tU1nzd/WlgtCdCtvGDCN0Od9XJDsK2GLCSH3sy22JG
	m6FsRi0Pm73hKLKIdV29v+knmhP7FwaI0Bbaaj9yUZ4LOy1aJpkrdQFvAgNMtxLZXoQLsb/wTBrCi
	ufHG3KE075x8F6V9l3/62wm4Y3WeMhLJ4tl8GG5+FWoW64QI4OG1pJq5QrBpP2bAP8feWD5tv1OyE
	AEYe42/Du2djTjgCmy7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWb23-0000000Deom-0Fu2;
	Thu, 26 Nov 2026 15:05:07 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWb1z-0000000Demd-47Z6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 15:05:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c9v5IGainzqlJ7kOSIrVgglOwxvqK2JcDqmwfAh1rYL0cIhVhuH2P0RAPpO1Xz68drSm0xV5MiGsPxAtWxjpVA2+cppaInFE6r51glidECp0+98ZHtXH3C24HEEytkz+T6S9KmNJeFyYkYYaU06Jx+1TBFnNfHIqnPybmwfjZc4weGxf22bKmXhmWNca9jiSL2MX6B4nuEcKSOP4KWdnjGXgiwu6bT6I4SZZ/cKudaHtnJk8Eky6eqlYVP+qLZZA0Befjm9/uh21Rd6sU8xncf8xzcRyteQZMTNEpyELXiRz84pbp1akEqEC69IYtszOyc+vDZjjae+Mpwu6dBtx4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uLZnYGL4VRxRv9A16dd7c2EGzwCgFOCuOvu32IGKyGs=;
 b=I6odNnWkURwihkMg5B5rl83M5KK1TGL2K+D8rKZEUxxhTx5Ptr94JIvfjHEoZ7IahRaHj1qxwFo/7P5lL4hqZR0QZ0/qQM8lrRJPh4FdesEZ+Hw9P9U6CciPhdFtVqWGJXjPsYSzyqluY9P8ZxpmAD0s9SvmvqDO8BkMAJQzz0pN4V4KB+76z0Opi4pkSCzzQqwJfgQIwvbFf1NMalhyGyLEQhb8XPkWfbV2tvBfpTuVFR9NlcVc0gyBqWWGlY1/NLXw0xr0PLa0q5z6zovQ23zu9Pkd89jufekJ1XutYdxqyTiUrkzTs8YMOtCx6xjBLp/KUmzFhAE9Y7nzIl7A8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 91.26.50.189) smtp.rcpttodomain=nxp.com smtp.mailfrom=phytec.de; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine header.from=phytec.de;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uLZnYGL4VRxRv9A16dd7c2EGzwCgFOCuOvu32IGKyGs=;
 b=UiOHr3iiDsMq6unjZwNHpRuyB4Y4UQImZa8vIPQcTbQ+8YYMS9GLgeggKsakutOlSzaV+t5VvNA0lOKGZf1DAu7jRy7asdcGCqpt7DEv+eAJRzGE/w4wqnRUcrJV4Esa4Hmr3wYR6LhfQ4C9QeVBcDZzQIlfNQwpWJq+G4PEf3I0feCO/MrojsINICpinMm3nXfuWXVEl82Bf5W00bgWK7cEhd/anQ921nF/l9evkIcHbUaCPXVEeDOcLRFFZrfsD0GZuIpPp1QndpsTVmXF30a3/AdqKoTHegTfmG2IOLbQJQGP0NKRYU6r0u1z1xMRKoGaFOMpL76TaPAnJT0Mow==
Received: from DU2P250CA0019.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:231::24)
 by AMBP195MB532405.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:7b2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Thu, 26 Nov
 2026 15:04:57 +0000
Received: from MAD0EPF000008AE.eurprd04.prod.outlook.com
 (2603:10a6:10:231:cafe::56) by DU2P250CA0019.outlook.office365.com
 (2603:10a6:10:231::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.7 via Frontend Transport; Thu, 26
 Nov 2026 15:04:57 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 91.26.50.189) smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: Fail (protection.outlook.com: domain of phytec.de does not
 designate 91.26.50.189 as permitted sender) receiver=protection.outlook.com;
 client-ip=91.26.50.189; helo=Postix.phytec.de;
Received: from Postix.phytec.de (91.26.50.189) by
 MAD0EPF000008AE.mail.protection.outlook.com (10.167.241.187) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Thu, 26 Nov 2026 15:04:56 +0000
Received: from [172.25.51.48] (172.25.51.48) by Postix.phytec.de (172.25.0.11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 26 Nov
 2026 16:04:55 +0100
From: Benjamin Hahn <B.Hahn@phytec.de>
Date: Thu, 26 Nov 2026 16:04:52 +0100
Subject: [PATCH v3 1/6] dt-bindings: arm: fsl: Add phyFLEX-i.MX 95 Libra
 RDK
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261126-wip-bhahn-imx95_upstreaming-v3-1-a2bda009bac8@phytec.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795705493; l=1121;
 i=B.Hahn@phytec.de; s=20240126; h=from:subject:message-id;
 bh=Q38FYiJhuLQTH0X7DO++nMMSoqBnE9MrEdJELzp6J68=;
 b=lZsMnGJs+3gtyxlI2EentNKUwf2F233lzedQ2gs5mjnv9dkFo2YbEJGnxgIZbCT4T5Q6KbnzT
 aPDY0iDiIyhAJOIiahQR5MnLh7mevs/RsUJIr/kyMmJjW7eMtJf/jTc
X-Developer-Key: i=B.Hahn@phytec.de; a=ed25519;
 pk=r04clMulHz6S6js6elPBA+U+zVdDAqJyEyoNd8I3pSw=
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAD0EPF000008AE:EE_|AMBP195MB532405:EE_
X-MS-Office365-Filtering-Correlation-Id: a3ed4f51-ff5d-4f21-9226-08df4bcea279
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|23010399003|7416014|376014|36860700016|22082099003|261009223027099003|18002099003|11063799006|10067099003|56012099006|261022075727099003|261026121527099003|261021121427099003|261102123227099003;
X-Microsoft-Antispam-Message-Info: 7QTMWbzmjixUDb6oxrBI3x5CpxrRRJhDnVgg1IeY7iwEXwWoFqZ3ClGwFirNv+buJQs1rpcSjqQhKc2yWXzhRmBhCvK3WS9bzZdRIPBxCT0pVDNbvprHfjy8oAvRcSUe/e1Xk+kfS10HvhlOxFWDx59Wnmi3OtgLR2RLVTNVF4Mt+/U6Q8Ln7OrsjvYnqrY+Jy3lAOqAcXrjxb9E10u2HOuYQzKGf7YohuPnY+tR+bkvdWUhzwEFwWWRo4HEtVqnxWAkOKKX5J1igBs75u1gcXcIQ3bWA7L08NjrKHkTmw8EYxPGmMg+cPHSC4ft3y9n2UEWVOtLE6w10qGbVwEwf6MNBnzime9b0Gn5rJGXAHcgsCzHRwmyy3+6B3kLlfU3TrwBSIgbA3iqHEVvFbkfQOOvkYrXfO/lBiMBezIja1EmvuACcd3JSGHoAKPuAoAYmrMMR8yO/7OpFhqFK69Csnd/slAdfvH6QQyT8h1R1x6Mt4DeIpcTr+zqVFZcQkImnI7WJNI0X0ioQAoGAATSOiE4O+IrhWOF1BKEmuVqhM39dvhDcsY7lw67IPUon7cSpbGSJaghDp2waIZIXntGplQVC3mwVhZGpyQrFZgbM3ydeLBdtGH9wgqBuKMVSJ5EDldTx6VsfJar5mMhHjMrWBPdCV8z1CoYFDzH2CJJCAeKLvaby53rIcxVywM5LrLcv13bdMW1MWyPzGh26krpow==
X-Forefront-Antispam-Report: CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(23010399003)(7416014)(376014)(36860700016)(22082099003)(261009223027099003)(18002099003)(11063799006)(10067099003)(56012099006)(261022075727099003)(261026121527099003)(261021121427099003)(261102123227099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: TFIgPbP/lWzsf6AH7HQ231pJfL/VoA+9NpQAW/cPfcnfA8mXSJHtUBCATvXSDPiEN7756ke2dlhK3Z1bf5oiaYHNMbyRal1EFkpyJqdvqEM0SIWBtJ195gLIhHMrY1xkj+JxAfob76BUrX4r8Egc0iZsjsGIFUmvtLPD4LMPIla4AvtzVuIVMgpLVURsC+Vl5PiGvGmpgKBM7aHh6H72+BogSQ2pVcTk1qtExFamYsjapae6af1lkQ9pLy5Q3XCDuGAvlqZbPCMvPGlM3mQR+22gIEuumtsC/ToHcCgwUqwmHqS9PZPbzo8iRVJJBda1cTUCAFdudfFngBWSCKQ4DOYruh5RDgeN6Ji6+cGBU0Oan1Ff43PpzwuB+WWkEJMNQnnBBwwXHzoamyZAt1Y0slCZYJ0Dq/SoZtAGwUu7/X2YDnWIpqUmlCJp/aJ2IVMP
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 15:04:56.9961
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a3ed4f51-ff5d-4f21-9226-08df4bcea279
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: MAD0EPF000008AE.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBP195MB532405
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_070504_030315_3F326A02 
X-CRM114-Status: UNSURE (   7.48  )
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

Acked-by: Conor Dooley <conor.dooley@microchip.com>
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


