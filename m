Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3CFC606A33F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 03:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nIq6iWCm;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=qSuNzVpc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=oSY8GSvlJYaykHjr4DJ5gfmb+NG3iOzY+1esV2MbYGM=; b=nIq6iWCmbB7b74
	I0T4TbMdVC9aWxiYonpE/VMpPNjw9vvP+fWhZqSjZ05foRv1wnFcR/M+sRnSEBE1d2DSxjWgSg1L0
	O2NcFI4uI9HAYF7QtU7PhV7WgQBcVTivf0En7fd/3G72z7eY5b1Iq3OxRpSJcCZawIUCSRW5aA3AA
	/tIHtB7FXubDDxSFxl8JfZVMPrkRSWKzIKyJ7yNf0RYS1xee6lqTyGO9X8ZlTo8m3ZYbuyCiQEX2a
	SirE2hXskouQOhImQ4m9K0RpqBjNDrB1uZKQHUgK+fwi1H0hZKrxN/Xt7iYSkcRtacpGvOKunw+C+
	lh2BvO1dacUSglfsrEvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUF7Q-0000000DwJI-10xP;
	Fri, 20 Nov 2026 03:16:56 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUF7I-0000000DwEQ-1Tke
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 03:16:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EZ2Uh7s96nv1SBS1QByRUa/fEky9Egb0mVkrIZY0+5sQ8XROuNXSRo79CJ/yx72Nx44HYf+3TOtWMXky9jnw45Vc042C0MSARQE3urzLOfAAHVYKUauDUMdZIbVQdgah1WIL76wcW9NnNQ+/nMm8bqEoS0rmHreD5hsn2hfJB2hrvjSmoJuo+UsK6w2WRsujWClnBkOnqJOo3mS1vPFOW9pXTkOZqg4+Iym/qXZ778zAQQRVkIfr47Z72LCAi6luklP+juO1nEj8Nxe909Gzs+UGOZNrEsE15eQJTxJjSGHnDR8QxMsx+G3l6m2OO3EuZUkCiGn+1sEpClHPb99oLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oSY8GSvlJYaykHjr4DJ5gfmb+NG3iOzY+1esV2MbYGM=;
 b=Im1xRQzjZFEMNvKfYXcT6pVcULNdGDgkNZHSN/ROkUYiSofB3fTk8YKtWkIvoW/IJ6whjkBNsGxa28nYOAGVhQMK7TV/ltezRNyKriuq0bL84ACyfYekxC+2g4HQBgZOA/rixb7yrxEBFFYidy2qwXnI6WPx9lmgOqag9Vz3EvMcyKFkLwYLe4yTDR8O6GKXxFdps3WnUStJ5ubFptevSi5BOYFDHlqtbny+H99yxdRplRhuyXvL1x0az6vEH2AMsxeaOQrn0nrunRfI74Azf1Lqqu+lqNGn4Nb5UdbCAWm8SlWEg2v7nPfyJl0t4geZ+34lQ0SH6yKF5ixokN3QHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oSY8GSvlJYaykHjr4DJ5gfmb+NG3iOzY+1esV2MbYGM=;
 b=qSuNzVpcqanqr2tGFO922H6GVbmqtqUW5UVF015TIYhK2rWNRYWgLS0fuJXk7xP3ehgTuTmIrOFNHXwbSFWCNErANPQi6+Z8e5wZiaFZqBbLT+niajNa9sWk3qh1iJjlJnS6NfJQS/+9VnJYKNxIkMa6w+4wQXG6FeNtSTk+UIsVh4dG2AwpO1cr+jz8pMQsy4vGq9lv6n/dtgWCGNAWPqID/iAtu8wlSiKLyEvwBn2THg+LcECNiogO1Ft5cDcdzm+ARVYZzSQIEYPL7B4Ku0rvvAV93AzwmYp4m8x0tDGrUWM5jUiyL5UPyiQTKlMHQzW6NiPdtd0wSuN2NGuEmg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9351.eurprd04.prod.outlook.com (2603:10a6:102:2b6::17)
 by GV1PR04MB10522.eurprd04.prod.outlook.com (2603:10a6:150:1ce::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 03:16:45 +0000
Received: from PAXPR04MB9351.eurprd04.prod.outlook.com
 ([fe80::1058:a430:52c1:5aa]) by PAXPR04MB9351.eurprd04.prod.outlook.com
 ([fe80::1058:a430:52c1:5aa%5]) with mapi id 15.21.0639.010; Fri, 20 Nov 2026
 03:16:45 +0000
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
Subject: [PATCH 5/7] arm64: dts: imx95-15x15-evk: Add DMIC codec to replace dummy codec for micfil
Date: Fri, 20 Nov 2026 11:18:51 +0800
Message-Id: <20261120031853.1175454-6-shengjiu.wang@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261120031853.1175454-1-shengjiu.wang@oss.nxp.com>
References: <20261120031853.1175454-1-shengjiu.wang@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0036.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::20) To PAXPR04MB9351.eurprd04.prod.outlook.com
 (2603:10a6:102:2b6::17)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9351:EE_|GV1PR04MB10522:EE_
X-MS-Office365-Filtering-Correlation-Id: c521f91e-f93e-42bf-48a6-08df46b4b49d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|1800799024|7416014|376014|23010399003|366016|18002099003|22082099003|261009223027099003|921020|11063799006|56012099006|261102123227099003|261021121427099003|261026140227099003|261026121527099003|261022075727099003|261022105027099003|261028144727099003|10067099003;
X-Microsoft-Antispam-Message-Info: x9lX8qoSQMn0QGT7ro6vGUYZwKlz2BD27yHzvQXlO34IKha0wYwomookE0oGLXzOLjSRgA2QuuzmJHqJt3oA6O6nlwci+P+nes6pirlSMw1zNZP0cO9CLLuh+WLO3mOILWRe/Qz23Rcm5BafpGB/awNiAHIC6cB3Z2EJmlas7cNvyiPCJeiKudi9ZWohwp8bkdvSGH1VFxlQj5THktB2BGltLmj120BtEbO6pE/BTCe/X7zKIvFWoPiFWwwSKqXC4C7z+CQfJou6gF2OLgUsWGBgC3pKZt5YFblun9H7pbF3kz4L22MR31LifcSoReC4X+xF9ZMUz/dIvI7b2fFEV5NE4G28LYm+SQWrKcdM/iIv3lqrTEVwbsh41M+rFFK03sEnCsX9cHnyocjQu8uquA4fgc2NSTtRDFzgUd2PQL1JA8n693gQsXtaNu7h9XMi+RVhl1j7dyjaHg2kIXrljtEvrwrO480Cayw6wl5HgQpAJQIgUWqr6LT04puVY+sKp0rZcnVaI14NkEUkJwrdv1o7fBBwDCGQg97eP8C6HzysVCJNHVccmp1tVGrEN8v1nnvyIVSLCtU6ZhMd7gWQ6uXzo49Xlz1FULD1ZSMF6hWgXwZff9PKSoDU+pXS+OJLcNLMWPtLZU0HsSPOYxI6cAh04u0dcmyxT+bQHWrDT2tROiniY91bTv03dPh6SanTKcgBtpcvAmvtnUpULyUeGA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9351.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(7416014)(376014)(23010399003)(366016)(18002099003)(22082099003)(261009223027099003)(921020)(11063799006)(56012099006)(261102123227099003)(261021121427099003)(261026140227099003)(261026121527099003)(261022075727099003)(261022105027099003)(261028144727099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qNnT+s84O/p/2g55Eaoi+CDoUZTECr9mOny882ZcBLLQMPjfH1tcXEUmxihS?=
 =?us-ascii?Q?drMpB5p1ZZ/IlusQA/qy0ih7YCy4RcPlLj6sbgnC8fzipqkn/Ox8IkWgDrmE?=
 =?us-ascii?Q?8bDHxH8B7sOGqV3XMV0kvCBAid4kUEDYkFLG6zC8QzU4WlWS1Bd4m1p4lgz4?=
 =?us-ascii?Q?APGn9inJQ0nqMaJyqjW135TMpKhL5D2w2QbKcOLTPLC+rNdIy1P2XYwLCHzo?=
 =?us-ascii?Q?dYgBl/jnZsRNpvSWKHf1bDMQCmPXmeKwK4SRYVlvPL5OovX/nrgplGsl4s93?=
 =?us-ascii?Q?s1w96qKuu5SvrELA+Nio3EBXWtg5nrNEZtpLi4386/xGvLdfPUlcr3ko4DYa?=
 =?us-ascii?Q?UXSrSqJHNnGyZSZj5TfdiEmNILR7JSc5q9thOArrQSz4+XqLcot+VEFY2PW9?=
 =?us-ascii?Q?HSJzTMH5NzJtmceKhEjDsC7ajHBeK/RExkAPFlgMrsgEGMOrqlXVOeOwY0bg?=
 =?us-ascii?Q?g6hOYShEC1c4oWTbPpMHjk7jyqEXCxNaUrfCAqIumtS9azkm4oeOrXzPivil?=
 =?us-ascii?Q?PzwpEeUqQotKpe67NnNdo5ZZJ14cjmOe8ANP6R8WoX65q2t5wN50PlbOeFe9?=
 =?us-ascii?Q?KnUpYDJcG2oMs48VKGrwJRLwlJRnSKy3+AufovvpsBy3ZQKT72tVVJe5DNHZ?=
 =?us-ascii?Q?I1OYl8te2KWz9NwLdwlhhMEDLa+tzS9Ac4Cs030v+lG4noW2UMF1rbc5V1k7?=
 =?us-ascii?Q?EFmikz8sfy5nkY+3/I3huloI8cH4f7OY7dYTvzD/d6WSMNPYRyBpmWDnEJxi?=
 =?us-ascii?Q?/D5yZgevUQEIGq0dagJP42UAHfBu1FxZCuPRu0E8K2Bu0jdxn7N6D8fTDADV?=
 =?us-ascii?Q?VYjpYyNfXNTwy1tpXwU/Bie+rsYA521PIDczcm3omtR9NBuwtOb+JQAq2Ajz?=
 =?us-ascii?Q?ZcjRxSdQEbT3rGiX5hHVg851+3plWYTKaKxOGKh868cs/wYH0Nz5gbPRfH3f?=
 =?us-ascii?Q?uYVMzkM8oAOq30wgCzxXlShUNbyLuThHtkToxuBS9VaAqXPEAT2U+2Lg+s6U?=
 =?us-ascii?Q?M3DpUZdyG37vstiWVDfNylV73Kq8YixyIAB3Gw//RkCqkW+Hxe7HJ3/WZyjW?=
 =?us-ascii?Q?N1VAgRIP8pvhi1g7ldbXmi7ev5dOg9gxkBTKWidxy0tkL/2AzL+vaj3Q2bg9?=
 =?us-ascii?Q?ccqvpi2tbVNHH962Y/ycyy8PCgbVjot8g8ia9sCCBpEhVhEOtOFse1Nd6mH1?=
 =?us-ascii?Q?XWofe89UmUaa8rr5ItifBsXYkwYVttmEOOXHrYNxLVp5ERZTdsXxgRPNeA3I?=
 =?us-ascii?Q?5JlZMQUF6vcZmxIzPx3TRPoF7hpE5JplCaTPOei7dkqqpCZ/CdjIGZEDrE6K?=
 =?us-ascii?Q?UNJc/8sxR5/nC1re5ujjV6AzlUb2nrWvCggOrZrBe1inetK4JA1mS+hO7x7J?=
 =?us-ascii?Q?rxZuc+4/naLZ4FA7+hpax3Efzra8F4/HS9JPIbD6kH72PI9JQLfKYBJkyPjP?=
 =?us-ascii?Q?/Edocw2YkKBBtNtf/YzqR26wFFagfbQ+cIb/u2sl+jpSr91jLRdwDh6jHVRI?=
 =?us-ascii?Q?40Z/+RDNiitruAHGQQpHFQq3O3GLngO6mwSmj9s+n5HdM/DzNH6TTtp4af8d?=
 =?us-ascii?Q?XDLgiUifAK0Scx2bv6BG3vgAAixEeZah0sY5W0h8jOmEf/WBinpzOrmgKvCE?=
 =?us-ascii?Q?GVCjopayHHKSSOXbi0uMR24JaZPFMuyeSrNqlmP4B1ydvwhWF84otvJkGNTU?=
 =?us-ascii?Q?ktMiSghaRtdqr+qbdgh8jGuP0J9KT8L3ci+0uIh7ysLPH2Pg56GwktW1rETg?=
 =?us-ascii?Q?+Yyj11Y8x6B6SPMpoB24g+BoxysMeqEtlFW/EaG7Y9zHA2R3ksQ1?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c521f91e-f93e-42bf-48a6-08df46b4b49d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9351.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 03:16:45.0820
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7aHYb0+1synih8ZLmWAVKIEdH8mx+If6Cwd7qQbPpOzU36IyIDCVyqUWMAoOfS13/y1iUB7wkeZwcqvRT+IAcOwy9gi/Ica8mKFGIE0S5Bx/qeu51DZMk24iNnB7jSwn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10522
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_191648_405734_B7D53419 
X-CRM114-Status: UNSURE (   9.77  )
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
for 2 channels to match the DMIC hardware layout on the i.MX95 15x15
EVK board.

Fixes: e3e8b199aff8 ("arm64: dts: imx95: Add imx95-15x15-evk support")
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts b/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
index 1ca6850a7365..e115cfa2de05 100644
--- a/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
@@ -65,6 +65,12 @@ chosen {
 		stdout-path = &lpuart1;
 	};
 
+	dmic: dmic {
+		compatible = "dmic-codec";
+		#sound-dai-cells = <0>;
+		num-channels = <2>;
+	};
+
 	fan0: pwm-fan {
 		compatible = "pwm-fan";
 		fan-supply = <&reg_vcc_12v>;
@@ -272,6 +278,10 @@ pri-dai-link {
 			format = "i2s";
 			link-name = "micfil hifi";
 
+			codec {
+				sound-dai = <&dmic>;
+			};
+
 			cpu {
 				sound-dai = <&micfil>;
 			};
-- 
2.34.1


