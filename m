Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09BDF606A33E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 15:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YgK4tgcN;
	dkim=pass (2048-bit key, unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=dcsfGFnp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=M7sJGjF9vcMBC1KsVpmVBFZ+kgdeMX9OuHPNL1YNvf0=; b=YgK4tgcNwHtov2
	fCUtnw4svEYec7CrKli6sLkUwqR7W/oXHtgBOBpC3lSp3+QLZu8tcEC8w8hiHvKh+1ii3ZS/bsK4B
	wyWwjG5YTNnMsfVMVFWyrv8f+wvbi3x1ubA3CIzW9W8UBdVHPF3XKYPY6rYE+jPuBwBze4I2KlDjt
	MRmxzpvvH8hrPxWqiW0HrnEIAintkqcq1JINrTOFrdl+CORrt9G08un+OAlVsGLy1xVVS3VoiIE6Y
	XbxQsKVme+340XCxL2OdgTJSFmZJ1yn+V21TxjFCrzg2KI4EUooTd3FbMLHDuZv3smw5bilRDRjRw
	hkGUTY1MgG8UpHhF1muw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWb4v-0000000DftK-29TS;
	Thu, 26 Nov 2026 15:08:05 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWb4W-0000000Dfkw-1900
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 15:07:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HZRLbShybXSrj7aV+eNxPZV8tb1Yr9HHDLsL47wCVNh03GnmBI21yix0ZurMEcJ9C/+H81p+jxDt8cNwPvo3i6lLiAKibWKResX37DBAGcVSlZyMNqDSP6AWpXQmDPlixM96sQVb03pMn6dKVEZxoc5arqCbFE/YrF5U5eHhkCuD7UiovdfdeavQf4RPMMjNMQEEOb+B6s9bDx/zxt+YzXWfBpc3YYT54W3mLQbxp7hf0XKfeQPdx9Kh0Zn+/+pAGJ6XJSoAHqmPeKET5ROdJRkLxmFSv22nLR2YzUdHJiR7+h/bQeOwPTCrQ2sOVlJtZ8t9VawYWUo4084KeHbKqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M7sJGjF9vcMBC1KsVpmVBFZ+kgdeMX9OuHPNL1YNvf0=;
 b=tQgZ9tmdxbHb33qdzffaVf3gIO5otiv+JdR2XXef6FaCuPRmTOC6ipCWwvlM5j+VSlprmQOnnQTInDl9MkYmj25/ys3i7365JVKHQKi+lf4TtY/23S+EFy4NVR4XO/4tllLo8jeqjVLNCr2NETEgIqe3Mj5aF3oFAkUyswRXOkZNOv7Q81MXfK9P/oA+7ugcFQePaGVr1Rvtvv15Z0gxENoiWqQ3VF3oSSWByJoEl32Yth5txNZTQ4ZukewyUbMipWR+xo1C2rXJjQQAnsm/P/y4/+ZaBFoSzYxn7oDsdA46ffzsFBjd1e2LlBStj0rm2lPYDTESdc/64zqBxguhBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M7sJGjF9vcMBC1KsVpmVBFZ+kgdeMX9OuHPNL1YNvf0=;
 b=dcsfGFnpm9vnmBhvCe76uwNNoZE04axUR2WKnX8iFxbUObDcm3UKGkzdSjjHiEVwfdFtZvehDh3fv2UHxtYocA9Pypkgi6YuQlSiKMBqC+1jWIWnPTfDOah03jGLEvU84v0/uD/yHzBSp7IdAwFHN5bSFU2L5g6GAkejiBQpMl9zogiNQov/9y+/+OHYXnpPpRE2b5Ky8TeN/msFyA/mACaCzaKLAbOsZu5TGdm8eGf2nlfg7icYt8qPSXaWpDw6vVTYzL25miQSi0kGXTfZ9pxxdpXer+6be0PNrDWVjZ5M6wHSgrNbr2BuZPM3MYuWuGhDEBxyB3cx23O4VhIu8g==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from MI9PR04MB019273.eurprd04.prod.outlook.com
 (2603:10a6:290:d3::17) by MRWPR04MB11286.eurprd04.prod.outlook.com
 (2603:10a6:501:79::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Thu, 26 Nov
 2026 15:07:36 +0000
Received: from MI9PR04MB019273.eurprd04.prod.outlook.com
 ([fe80::263c:943a:dcb0:29d8]) by MI9PR04MB019273.eurprd04.prod.outlook.com
 ([fe80::263c:943a:dcb0:29d8%5]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 15:07:36 +0000
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	imx@lists.linux.dev
Cc: kernel@pengutronix.de,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Vladimir Oltean <vladimir.oltean@nxp.com>
Subject: [PATCH 5/5] ARM: dts: ls1021a: describe the DCFG_DCSR space in the guts DT node
Date: Thu, 26 Nov 2026 17:06:32 +0200
Message-Id: <20261126150632.1560355-6-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261126150632.1560355-1-ioana.ciornei@nxp.com>
References: <20261126150632.1560355-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P190CA0011.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5de::13) To MI9PR04MB019273.eurprd04.prod.outlook.com
 (2603:10a6:290:d3::17)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI9PR04MB019273:EE_|MRWPR04MB11286:EE_
X-MS-Office365-Filtering-Correlation-Id: c4bef21c-e6cf-400e-3de4-08df4bcf012f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7416014|23010399003|19092799006|11063799006|10067099003|261021121427099003|261102123227099003|56012099006|261021123027099003|261009223027099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: zNYjciTNN7usx9T2OqiKzr/xnuEgRQ/ZcFa1kCJCLXRiibJjyAPEM7P83JInUjZNhqzSBLZlBHPK+ybugmhY59ZV4mV3T3Wk/f8C6AbAfMN7/v4Nj2qSr3y+ZtwR3l12xOGuD6DUaUzsjr4fH6t9ZjELWJPZAlxUNG6DmG4xp4DrrvB4Epv4/Q5oJVRJGoNaw5dA1/bE5yPfNMZYktuCu/mT4EqGoeqgBmj04ykelsxwaOwIlgLumV6h7nVTPJS0T5leO0N445YS5QYk9P7Mgth4SZcHoxz6r6HjZCWNVDKL0iiV0LPxSs/UGAU6HjO1mq9bOxE2bABGRx6wSMMvwlTCR3FYiSqBsQYq98XyJupu+vuiynzzVJ29tGr4+xf/9y3dmCF2imVqszFS4SMKK6mDbbK0yBeHiE13hSOsimKaVOY7/o4dDAsEEYvGcZr1ZsMl0S8zzLAkKkigsaMIYRkPEV+9zQnoLxlzkYJO7s40HwnRdJQZ5194+ScXiGPia9uAsTnSm/xskh4RgO7tq+VNrtoo/0EJEn5zBPb4kFwHxstvfdyH6S3HzKVEZtAaqoP936WspiMRVAE8NwlQp6qEzDdnD4GWyaBTDmQtMDEzcbOzVfw//Btck2Kx6OFfQvVUXXTxKGv1uziMI3JDLMLlJFrBFh8E4ug4Sqs6ezU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI9PR04MB019273.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(23010399003)(19092799006)(11063799006)(10067099003)(261021121427099003)(261102123227099003)(56012099006)(261021123027099003)(261009223027099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JpaAx0cJOm2eFubfS0mjNcjOmJa3/dGi1kCs5Cgs+M+gBSFG3tJtL/wnpILC?=
 =?us-ascii?Q?adfzQvbN+Vv8P6KImQiPQ8+eGB6PJAq74YxEt0jtebPguyG6TUrlHSDMaVso?=
 =?us-ascii?Q?6/Qy61yUly4bUsM5qvHeqTJCHwCZ9/2dw58jWNREWIIALnK6cojwei5wgP56?=
 =?us-ascii?Q?m8A7qq7TTigzqyDYn9HFQ1PlT19Rk1jdNgL2Iu1njdAmZiW8dEl0VT277s4c?=
 =?us-ascii?Q?iVHhRFldk5LfunWomN7NLrCKghNhkaZIkBd3I+gJOGn3ytiEr9+ztHia2V6V?=
 =?us-ascii?Q?BNHfkuEKOu5yJnam/oX+pDNMFViJ7/9j1r+YB+uT8TUGOovMZaGGQ45FaNYU?=
 =?us-ascii?Q?prrKFJcepYboHmIhZX79f7NVj7ny24k7q6muprmslL61i7gMEiWyLk2Zl9hO?=
 =?us-ascii?Q?6fNcYuaZzlWZpxmdObJH5ffW28Z8x5pTiGobgHqNIVW6dVsvWagyy5cihvbg?=
 =?us-ascii?Q?zmftiNY62ALryFZI/6WKh2/YILYja54/qYdO3+MIWB8bBSIdkzTLJN4OalgI?=
 =?us-ascii?Q?YBPtSM2UthQSJkfJKcslaDKVL7lOOcENooQj3m/zACjTjlKFPdC+wCu5siKI?=
 =?us-ascii?Q?HE4xYT7ukAqwMoM2yFkzzA14oXTEKeqFtTxjf2MF1QiPpwRW4QwTT8xrecaC?=
 =?us-ascii?Q?NARXAzmZIV6lsbn3JTwm52eUPL7fqjVirDLZmQlonBQ4zUoQRAICwTip6JZj?=
 =?us-ascii?Q?1kUpnVKu5tZB9uaSEDg0VmgNtgMZlOTFD9LdYefyOF9tgdOyU0Aqh8p/HUuO?=
 =?us-ascii?Q?dOWUOo1xaSBcja2xlCxQYMk/vWVjMGtnAX9rvaYcCM4SauORF3C0nbEHwY+y?=
 =?us-ascii?Q?3zemt41ZUwDGCUG4L0ol6M3v1AGpBinxqFjUcaa6dEOnO+jR9uQeXMx8XK3q?=
 =?us-ascii?Q?VwxbkocH/K0GoXAGiyr2X7jmIi0YCTGxhaYB3V+mgjUqUHqkB1F0AX0gbXB0?=
 =?us-ascii?Q?kiueRncDXUq8O6M4/yxKnzVE4a5eP2Rv56ORXYr23DWCETYrndE0eXfg/ved?=
 =?us-ascii?Q?gN/dko9Kf60ri/fc0O/5+zL837OpGt8RNbnKAfBb96ya1v64FdxQr9E3a7sR?=
 =?us-ascii?Q?w35tgTObQ9tpkXBXbVvJ/0oNq231jrHTCJMsG7Q/08I9rBZcveBgRwaHTJXe?=
 =?us-ascii?Q?GMfeF7mWUPm3yh7KyTAiCbpfWkUgJQsVpYIEsvmGVVx5KV6EbclFDodUmXva?=
 =?us-ascii?Q?vCmP2Y4mD8YwvcSv8ujcoZtgrY2yW9Hvr/Q/idbv1YoQzbc2YQWf7hVLJtTL?=
 =?us-ascii?Q?tHiE96f6o1dussOFDdiN1lV8NFSYtZsfsOLslklP3LI/bEhvClwsl5usi7kM?=
 =?us-ascii?Q?8aWECoEwLSoxNYEPvEUiQ4ciJcq+JHvvX4wHQV2seJ//Z7wqrrW/9MVM+xq1?=
 =?us-ascii?Q?IcG6X0KMEhw7FDky2JfemeHjRgpZV4LLe4N5RipV6xvItfpjqlDAe8liuc41?=
 =?us-ascii?Q?g8ZNdoF+LecibzoACNBOIfJ5IqoEl4NRfm4WgKNpPccfhOU0r7jAlAd1Engc?=
 =?us-ascii?Q?MTw966Cele+psM+ObRMM51cCOv8meZ75eaiz59BZHDlWUeKrvUG5xRWlM8q9?=
 =?us-ascii?Q?SGtq3WHOKf7EPmfj718u3BHPXgvyM0+L0HXXF47xLEcBWGVpS9BAj/GB3VJS?=
 =?us-ascii?Q?1K3RS9NlR9KGsla07c9UbdCA5BAB/0rmxtzulT+HBKWwMWEpcRgOn+xBnNdA?=
 =?us-ascii?Q?VptjQrkcSvJ/pTTjOwcWRz8khD4LQW2j3lQkUYgMVrYtmSqj8YxWgnwvZLLO?=
 =?us-ascii?Q?3jrnKglYiQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4bef21c-e6cf-400e-3de4-08df4bcf012f
X-MS-Exchange-CrossTenant-AuthSource: MI9PR04MB019273.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 15:07:36.0685
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d37yl3P78aQOCm3z4lHic1FI3P50S274NU7xzy7Hif3apRa0VVByyysJjhHl/9f/5D0LSgYgTlOw7fIbz6xPug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR04MB11286
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_070740_862772_97B005A2 
X-CRM114-Status: GOOD (  11.21  )
X-Spam-Score: -1.1 (-)
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

From: Vladimir Oltean <vladimir.oltean@nxp.com>

Describe the DCFG_DCSR region in the DCFG node of the LS1021A SoC as
well, so that the guts driver can make use of it once RCW override
support is added for this SoC.

Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
---
 arch/arm/boot/dts/nxp/ls/ls1021a.dtsi | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/ls/ls1021a.dtsi b/arch/arm/boot/dts/nxp/ls/ls1021a.dtsi
index af518fc08809..d393e9c801da 100644
--- a/arch/arm/boot/dts/nxp/ls/ls1021a.dtsi
+++ b/arch/arm/boot/dts/nxp/ls/ls1021a.dtsi
@@ -137,7 +137,9 @@ sfp: efuse@1e80000 {
 
 		dcfg: dcfg@1ee0000 {
 			compatible = "fsl,ls1021a-dcfg", "syscon";
-			reg = <0x0 0x1ee0000 0x0 0x1000>;
+			reg = <0x0 0x1ee0000 0x0 0x1000>,
+			      <0x0 0x20220000 0x0 0x1000>;
+			reg-names = "dcfg_ccsr", "dcfg_dcsr";
 			big-endian;
 		};
 
-- 
2.25.1


