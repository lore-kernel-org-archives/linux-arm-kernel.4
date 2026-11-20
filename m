Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A31E9606A33F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 03:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2XqQUhbt;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=CxxXb3PT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=uwduE3BcafESCSkvGEBC2OZamEzT9bPFfSVPpKtjn3Q=; b=2XqQUhbtdX49Qz
	jhY6lm3hi4OxMhIppwyWymQvYvwpXYydRw0tq8387gVsVKGruxJh80f2M/ebz0wAJCCoIsEOfrVOC
	3BCV0ExcHGqB4F3ZK5+x4ToHbVsx/YirVpmIhipoBiAeXGTQ3tQrMYwRMFVtTUCRwneA9voqp2+b6
	vPsWHwb0A7neg0CNMpI3CDAN/jWjd5DIMH83xSvGulYDs4KL15p4AloZ0ukhCwFL+7owOxy7MQt17
	Qg3T6usczokPQzBNKIDtEUFOrtrhP1ZfgqWCyOMCUqmS5PN7QZz8BZh8MbhuSmiRAyKUsPieg73k5
	WlJN74suzvmYkCsAQFNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUF76-0000000Dw9z-1DkM;
	Fri, 20 Nov 2026 03:16:36 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUF6z-0000000Dw7j-0gIy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 03:16:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=khWUvRmljiPFdoDok2589Jo+5rTeyZMHCWZRMh7+KaQJ3i+HqHzriIpyk3ki2wGxMd4WslkG9gryJUlCugwZLfSsoRNjYADa4iZ3afrKZOODr1E4m+z1gwyDBnqmYYdodXrFsugsAZ35beh48FIzvwW1biji0L9vF8/eIKPcILHImQSP4Mt3QaXUHfJuik52J1Y/mKnGR5cA//56nXx9S2D8CI1UJ1OUqeObz0g128vr+NmpyVTP8M7JCrkLtWvSFpLoCUAGV70c0B4qeYLL6jT9tm3tEIg17+719P9uGsCUR4uv9QbL7SnEn3uW06Z9+2pnb1DKIRAhiuCPXFadbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uwduE3BcafESCSkvGEBC2OZamEzT9bPFfSVPpKtjn3Q=;
 b=uuCUdmova6kHx4rJCnpMCTboBB8lDAxMuUjyiRd+VhyxT84b1dADPhCaNY5tCqH8pglgq4N4n63o5r+lOSVDL7zQC+I+U+7Thbv09kk371xONX86IVVMns8QqzH6EZoc3uro7IakDp2yuIQEuzq06xtHI8fYNseTpZsIOlSwZifH+5Ccy2EM2MoENVmkQoC4eclC0LJ0pDgQK68i1CVReUZMiQIeWfgiVhB2VxFDoEE75mOrKS30LIf5HVJBpzvPw3Orwm9RRl5aTZAOpiUcxXbo9tECp/Nn+SZDL741jDYmROY8cNlzQDX4lG12y9qzvVHU4iIzWyzgvunLIUiNvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uwduE3BcafESCSkvGEBC2OZamEzT9bPFfSVPpKtjn3Q=;
 b=CxxXb3PTXQGc3cLgFm9lxrOLk7rq41I67SDbt4dKeE/YYJVygWJEo9LWvTMdH421DU9Q0cSVc9ga/CNuriWoagNwgkC8sSjIqIP7/kiMvh2fi4WzhQpTtvid2cAfs/cRZ7umdbnRQu1Cqun7kWkf+NYbE2yf4T5qVaBdjKDDbQFF479QelYfacSTZG5BnAVgTSEr/+4Q7BYmQa4wSWl+WMeIY/rnk3kV9d5nM3jM2K+9AI6Uq/hAiA7npxLdC4cfJ+QShZIffw68e/PbelBScE5bEdQqfX3Xl2kdw9OjN1P2VgFWe428x91jlLXlcLsAMdFHC5jXAjMwvFLPEYDRiQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9351.eurprd04.prod.outlook.com (2603:10a6:102:2b6::17)
 by GV1PR04MB10522.eurprd04.prod.outlook.com (2603:10a6:150:1ce::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 03:16:22 +0000
Received: from PAXPR04MB9351.eurprd04.prod.outlook.com
 ([fe80::1058:a430:52c1:5aa]) by PAXPR04MB9351.eurprd04.prod.outlook.com
 ([fe80::1058:a430:52c1:5aa%5]) with mapi id 15.21.0639.010; Fri, 20 Nov 2026
 03:16:22 +0000
From: shengjiu.wang@oss.nxp.com
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	shawnguo@kernel.org,
	daniel.baluta@nxp.com,
	chancel.liu@nxp.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/7] arm64: dts: imx93-11x11-evk: Add DMIC codec to replace dummy codec for micfil
Date: Fri, 20 Nov 2026 11:18:48 +0800
Message-Id: <20261120031853.1175454-3-shengjiu.wang@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261120031853.1175454-1-shengjiu.wang@oss.nxp.com>
References: <20261120031853.1175454-1-shengjiu.wang@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0016.APCP153.PROD.OUTLOOK.COM (2603:1096::26) To
 PAXPR04MB9351.eurprd04.prod.outlook.com (2603:10a6:102:2b6::17)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9351:EE_|GV1PR04MB10522:EE_
X-MS-Office365-Filtering-Correlation-Id: 7cb2a546-7c48-4b18-144b-08df46b4a73f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|1800799024|7416014|376014|23010399003|366016|18002099003|22082099003|261009223027099003|921020|11063799006|56012099006|261102123227099003|261021121427099003|261026140227099003|261026121527099003|261022075727099003|261022105027099003|261028144727099003|10067099003;
X-Microsoft-Antispam-Message-Info: xK7wgBCMLhC8xiazYM5r3S5S9l1HTxyX8oG49jwYozUgmqSMWlxmdTrOPO0y+oG28pB8dz1tpFGs6mDoRvobP+WKw2x4mwK9GjR4USMSmdfX8TQVu6piw3GlQuuRLI6NZkSxvHbUS4oGnEkckZxKn5tu9T6lNEdb2hPptRc1IrTYY5x8zNcrh17VzarJifQJltFmMgzrb6LBCl69e4fPaOE6pWsxlIsBPs0SlJgIzKEAGi/mlOX79wK6YMN9toBZBFbTaBGnV8Ba0tW65DHLq8hzPMz21JfMF1yAuiBBAwYwF02Bc+8sj9mafWKdCsiyysmAkGqsbGTbUAjA2nRohWBsZs48518M8uy7kX8azit6U5s7O41qkj1YD0MfVoWlu2qMb4HLubST2TDWn3CzYY7bMowTkZe9OZ/L30DKbvZZqi2QQ/GA83rjwOXVNZbxfMCgs9YPe62eQvRuV1YD+KwecOxNm2Q2a/swz140C20pGH+jcq3rpi5ZEsvLhNDEY3yQBehExcTmXcorFfm4fCLTngg+DLGiQaHFCrTtcXJZ6w3KWy+t7O+zs/qXd7QXNtjJioHf1nZIRbzWqj7TBCB5h7knohb/djnNI4UMwEGtwiAoNC3zsdeEjbioc5GXsRlmgiXFBg11hEHCypF239GMzZf1qkHmS6sulBmrm4Q29qamd2bfvliu8JCt/CoRjwuENrsGyfbBnZOMN4nr4Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9351.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(7416014)(376014)(23010399003)(366016)(18002099003)(22082099003)(261009223027099003)(921020)(11063799006)(56012099006)(261102123227099003)(261021121427099003)(261026140227099003)(261026121527099003)(261022075727099003)(261022105027099003)(261028144727099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?g891KUOuOsSgG+2rU2JuXS+U3UU02dDRgJu6DnE8ZaPfEemaBiV3a7bgwkU6?=
 =?us-ascii?Q?flxFJEeuCgCFVm4zbd79QyHyqE8qEcbvVIb9hb3PVn0Emhb83pxft6pYv15m?=
 =?us-ascii?Q?NG23uONnu+z1joy17JOFcI1P07n6O+JKmls3a4GsrjnOb73XYalkeEuBTUEJ?=
 =?us-ascii?Q?/R6dD/rA8vf5kxkf0LAF1ykOXv2j6ftxCidMos3pTCY7wMzXbmGHK0jQBNoV?=
 =?us-ascii?Q?N8TIdHI7ENdYjSNUHyV7qhZ+rIOIskFC6dBts8PiADO1RIyuQJWBsAFuuIkj?=
 =?us-ascii?Q?6t9bPKiMYs35H2+hXDYd1XuxNj6gQlXJJS0GOfDVovBpY6KJMkIsyKG8Slwi?=
 =?us-ascii?Q?x/357BtcX2IbOW80G4rw5xzcYSrNmR+8ixN760PLJwCNzQvaacEKiLeVhrJC?=
 =?us-ascii?Q?1dsknlb2ejOzmQM4cgFk7gcgkX68Rpy2jCD3snKxCP0iakzkT9r5u/dmNI3M?=
 =?us-ascii?Q?YyncPk1l98USetaqFLl+8OQu+i2KXvT0lUOduIecZge2GAc+xjbHzuPk8VQC?=
 =?us-ascii?Q?c8B0X+pxa9jJrYpGOYdQRVz2FPonnsFGZni+6t2DMt0mg938frTc16aCoOf7?=
 =?us-ascii?Q?3yAU8zH3vM78e6LdG9YdIQ8LL65RBVzQ2+HN6EoPfGhT5EeCrP64n6CP0f8o?=
 =?us-ascii?Q?pJvCtNmjneeXHSglddNZDWaCtxf7J37zgYDAOMBdK2Lj6xp1poN+iQ24788x?=
 =?us-ascii?Q?cpLmfiijX+DLQ+Z9YOwBSqMMFLQVII21DFtprVOyi+rqd/RhnkS15l6Diz0w?=
 =?us-ascii?Q?+SnaoorjPtMlOKLx4toC8Nt6Lkvsk9RYBEjncFLz9iCH7x0UPuoSuuN1u881?=
 =?us-ascii?Q?q4GCmiZ72kRULZE1rOV1pPijuOd7Y7QQVtLcUKWuZv6IlLQKNvzxi6/y7/en?=
 =?us-ascii?Q?wRdrrt7hhfWd8L3TpwXcaY1b2dkJHM7QzM+3dN4Vjspa4hBA9S6GRo5ET0HF?=
 =?us-ascii?Q?Zpzv386f4qWKYqslIl9fZGgBQ+vAEoo2bDD7aorulDoZbO3ne2G7IKX7e3QI?=
 =?us-ascii?Q?Chj+k/KzkTMERzqY12w8e0Nwj2Q051fdd8Vl6qbel3Zg2ONkIpzU4bgDgTZy?=
 =?us-ascii?Q?bQBT8NXlqWstCrblCSpCDa3wvP1ozbpTagnqF5fRoqeJHg1VBSD+IKQmXFbc?=
 =?us-ascii?Q?Xw9/W3XpRRC+ITO980vyFgXllY8EZ+k08bUn4i/bH+uO7N+IBru/HGiyWyPk?=
 =?us-ascii?Q?/dej3DcGRmO80bPODjNGETUCAD5haHsPhSO4BZt8xtMulOVsrG2XX1ATvKO9?=
 =?us-ascii?Q?zw8vRgptqgyk5b9/Jc6gCsPVgmL1gOb5zPcdSC8wYYKzWtyw41Jzas9HmlHM?=
 =?us-ascii?Q?MW6pQ7arXYDtN6H9cKNYl1UQuxaGmnsdbOXy4xXyAKKkTtNHs+hu06EY57El?=
 =?us-ascii?Q?+7KjzCthw1pELkKenFhibaA2j5LmKfpAMXqHaZFhRB/WDoU5hO+nWTDeyPZE?=
 =?us-ascii?Q?WN09mkY6fmn6117Pxv/sowuWQI75nLGv8vXs5AIRaym4VePRyzHARKL/M9Nu?=
 =?us-ascii?Q?FDLvh8ZtwmHMfFPGbk6GAKUwIYcpyEJknmOURWK0hrMnE6+ImbjXX4Oc7/E8?=
 =?us-ascii?Q?wj98KW/B8dFCjWhQ1G3DYKEQfKuol4h1sXlnvNEwO7TRIyJNG1V86o09KmdG?=
 =?us-ascii?Q?N48oTYgOHGuPE4r2NNWQTh3DRq3ZBvonX7XnMSB15ZOwAxXBqh3WaUJ/4Sbg?=
 =?us-ascii?Q?vWmL82FhwXID3CehcmXgpabY6mpM8uDi0kpcIiHPxU+Cs3IDzQkCm8/OVFw+?=
 =?us-ascii?Q?KT7YjcF+6siwbUlMpmv48PlQFUFrRms4HpXKqMa6Txi0mEXhSA0j?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cb2a546-7c48-4b18-144b-08df46b4a73f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9351.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 03:16:22.5333
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dDp5Xg8dB2oZLXjTS9b06CwXBV89GKyPi4vt8RNSlFTWecJdrBfFvqhBYc2Z/LcKzjU3Nlb6MTF7nn/2Altq9XJPVjtXt+WpZYPHYEqI5TNuuf4L2F1ZfwZGKwrGUIYD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10522
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_191629_609917_76756D69 
X-CRM114-Status: UNSURE (   9.65  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 0.0 (/)
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Shengjiu Wang <shengjiu.wang@nxp.com>

The "fsl,imx-audio-card" machine driver uses a dummy codec by default
which does not allow configuring the channel number according to the
board design. Replace it with a proper "dmic-codec" node configured
for 4 channels to match the DMIC hardware layout on the i.MX93 11x11
EVK board.

Fixes: fcfa86b3e02c ("arm64: dts: imx93-11x11-evk: Add PDM microphone sound card support")
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts b/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
index d3312093f996..b6cf5fd77c04 100644
--- a/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
@@ -22,6 +22,12 @@ amp_mqs1: audio-amplifier {
 		VCC-supply = <&reg_3p3v>;
 	};
 
+	dmic: dmic {
+		compatible = "dmic-codec";
+		#sound-dai-cells = <0>;
+		num-channels = <4>;
+	};
+
 	pdm_mqs1_mux: mux-controller-0 {
 		compatible = "gpio-mux";
 		#mux-control-cells = <0>;
@@ -111,6 +117,10 @@ pri-dai-link {
 			link-name = "micfil hifi";
 			format = "i2s";
 
+			codec {
+				sound-dai = <&dmic>;
+			};
+
 			cpu {
 				sound-dai = <&micfil>;
 			};
-- 
2.34.1


