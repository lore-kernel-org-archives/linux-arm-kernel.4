Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80946606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 16:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PFVcQL6h;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=lvXeNjwm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=B6cne2mBhSQppELH3q2y2KnzWeouhbWTl3rMu1OeJuE=; b=PFVcQL6hMt8QyIXBBUTj5Hzn5p
	ddCP86kTQQPjnkcsw7bCTBCIAdlFYBiT1RX4eHUo3rh2uOytXQND4QatAAile4z40RodqLTB1JS6L
	P4OMs2pJ7uzvFQ7oXJ0K3uBUlqyhDhQb7C3BAkMaj95Yo6rvcp6A6WaZk9lgO4UzLC+81P0lEXAip
	VLXKoY4ygHWFcQehIvM/+z2x48iG3WQEVKsv3zGhh2FkG9HJFLm/m8KIqwUWopM0KlWsgNHlcD7Ix
	FneU8jiSyik2PRm/YKHOSs4ZHQR6+SV/hZTdJEaAp9WpHXZMsJInTGcPEzPir0x6m3K597t0t1N7n
	bj3r0NrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWcby-0000000DxTY-0t3t;
	Thu, 26 Nov 2026 16:46:18 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWcbv-0000000DxST-0cva
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 16:46:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=igiU04Vsr6paM7J/gVhGJxJBiw9HFw+8q5YazU24zr9Q4ovSEcqo8/duEN2JhhBtn/mV/x4LhXVrD7MEQgAGrhcI+0XzdVU9uPFPXdQwOLJ6E+J2S9VydKKGb87XkaKwN+Viz+tpl67Vb35zQfl72g8A4YQyIlqsrijql45vNuty4oci0BlsVrwc25un/DveoiFr3yN2rzSWXVAm3VKH6ncaFR2mbE++1X9rzgpf28qoxMOdgi5pQ9ucw33yVuyiiO5Pi3qw0fydS4vEMK3uisgMeA/E27hMzVKWtxqtKejKi4SECK8bWoHz4SvXHaugF2o9wg5iHGhf1tcX53i55w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B6cne2mBhSQppELH3q2y2KnzWeouhbWTl3rMu1OeJuE=;
 b=Ce8OrS1fC1yqAqOQgo227eLdFGjgkVf5Je+hlRZqCCfF/6nrwn9ZvJydjLtVD0V9jbI95V8z6sPhaZUIBRqriFpggSZGuRdi8ZB1L+rTYRJSX8sPtH0pTiz3R/j5j2UHhe2bxBVD7LwhntGmBrLxRn7YrnLZ/WYQwK9j3VQUm7vkh/5XuKgmrBdrnDadpgaSvX0wFB8BNBSR6m0BcLwSQ3SpA0R/bS5Jx8/HtGWDaWfHgHeiJQgBFT8WQ9ppwPo2DFbnMnPRjGdf4lquQeL97oMg1mvJkvk66S5BYwfZxMBUp5d74446xwQUgkW9wOYKatL0TMdfM2Q5gfy0PhMXOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B6cne2mBhSQppELH3q2y2KnzWeouhbWTl3rMu1OeJuE=;
 b=lvXeNjwm2C4Mw8Rxx8/pMwrAbD6qYB1KWxfLDdIf91pWhxEdmiRF/qeS/tt6QUeMNI91lE21RAk+jO9ikXP/xnrMJ83RDPJOiAWr8mDa/lxhZHcxCt3kkgPRIWCdI7RFqoQvlEd7F7s2HjsdtN8YuvbWdNkPENQlUwf9mP8gRXmC2m1y4KYGEFp+sDzvQ2XhFriJlP7kOPiHimSOL69yMKMZbP5I/nOwfBHF37ldZ8TxTC72qYypSDkRbNV9tuVYPT/Q8q3iXjsr2/GvnCLqUWWHi7stSKi1m4Xltx/U5G1RQMzmw//9V6F1lypOabJVsrjxGQM8kMIs/rqfV5oIGg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by PAWPR04MB11609.eurprd04.prod.outlook.com (2603:10a6:102:50d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Thu, 26 Nov
 2026 16:46:09 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 16:46:09 +0000
Date: Thu, 26 Nov 2026 10:45:58 -0600
From: Frank Li <Frank.li@oss.nxp.com>
To: Daniel Baluta <daniel.baluta@nxp.com>
Cc: Frank.Li@nxp.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, lei.xu@nxp.com, haidong.zheng@nxp.com,
	francesco@valla.it, devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org,
	Steven Yang <steven.yang@nxp.com>
Subject: Re: [PATCH] arm64: dts: imx93-11x11-frdm: fix ethernet PHY reset
 GPIOs
Message-ID: <awhiRigXGZ50RoDo@SMW015318>
References: <20261126160835.1811145-1-daniel.baluta@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261126160835.1811145-1-daniel.baluta@nxp.com>
X-ClientProxiedBy: CPAP307CA0012.DNKP307.PROD.OUTLOOK.COM
 (2603:10a6:380:3::11) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|PAWPR04MB11609:EE_
X-MS-Office365-Filtering-Correlation-Id: 58948e8d-aceb-4a58-06a9-08df4bdcc586
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|19092799006|7416014|376014|366016|261009223027099003|18002099003|22082099003|3023799007|10067099003|56012099006|11063799006|261021123027099003|261021121427099003|261102123227099003;
X-Microsoft-Antispam-Message-Info: 3aGdHRKsZhiW0heV7XwTOEfdQsOX+BvYzXN0Sdr9r9HvcMcuejW4WTz3EIlEmaPMudoBMnJX6wPkLggcviHBNBl7eNjYYAwzRVPGAA9wI2o4cuttkyP5uQ53nkMwKDyeixwp4ss5w/0Gfpr1kI3cdvLQ+IvKtGDhRTKZsCXBSU14XUzGwV4tQRVI4CBFgg1cO4JlOvQmAb3VNiuppdspOi/MrxvMAGGvp9j/IfkqjMS50/sXdfWinUtIkRI0g2mBg2FMLJsnooZkENKSCcH4Q4oond4FJrHIIWQPxmHmnT+DlquamfMTWmE38QHamcPZ4rBtW6ncCmGudT5AqAi1jITLgg9LQgaKi5u8vCzTn7IPgrKwDxa/vjwvIYBkUiFj8knC2WK3HZoGUE7fyo+XJOOPhmUNZN6nYIt51U8SOZyOc4Zm8rjtploIqXmvat2dzcLYKAEMRyX1mPRTY7XFLKGjAX3VBUaVugQZ6vnqXoq7ovm/T/q75XB4SMNt1J1aflDzFLQn8dzw0JYwmY7uLJsHLaugVNIebL1TrinDvn+8y1cLm6aq5pSf5RlmUdf2y96ghCK/tmuuZ+ipMGf8H8sgGQ04LodUiwpKe93gIIdorNZ/bJgAPPRyU3i2U9fJDNYTlso1GVwWLxXWz1CzaNFwQ+umA2cEiFNJgmb0kPE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(19092799006)(7416014)(376014)(366016)(261009223027099003)(18002099003)(22082099003)(3023799007)(10067099003)(56012099006)(11063799006)(261021123027099003)(261021121427099003)(261102123227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3knTxTbOwhCzGrmI//t3aqNPisiT61mfvsVx42azc0yLCo+9SE6qezCO2S4v?=
 =?us-ascii?Q?sfubfZOIV1v6XvQ7MJA1/BK30ecYhF/9yek2BObWBAdq57Sq5cVLLILeE1bV?=
 =?us-ascii?Q?N0vujVqKOIA0M+WyDloQn6GE9xrZZq6xajrWPwGAzgW5qkJKWq1u+YUSgOSl?=
 =?us-ascii?Q?iRaiL2MsyOpuWH90X7kYF4T8/g8I1QTmjiD1QNv4W0BbtpKGEVzgHjWNrGPR?=
 =?us-ascii?Q?HE1uBTRkyttaLgqCOubvW9ehlgSr33LEovZN7SDz6Bt7ZFszydn7ExEuYNLJ?=
 =?us-ascii?Q?jvfbT4sH6H/q4EEKssdlJRSQpAAeWJH2h8pnWKNsdxEGIfIpogz2jyMIz/Ej?=
 =?us-ascii?Q?IErutP7k3MqQ01DnEPk0I8rUm+PptKHuH1Y4Hv7j8VCL06N93t0F1/gU5cnf?=
 =?us-ascii?Q?uo/jQdhapy+GTj2zsMxfkAG9MSVncN+pLE4kDs3akOCM1eeytKIzDNFbtu87?=
 =?us-ascii?Q?v10R5TEuZBJzWaB7Yx6s4ve2VNxoeMoSnBqPGNZ6GFe1N7oUV0X8Bvgm+2vp?=
 =?us-ascii?Q?in4Ma5Kb7U4rliMUVjNnLAcJb/LiIv8t3hHtBCSs8FwVW3QarBbLr9f0PJFW?=
 =?us-ascii?Q?BvPjk/z3tBvygzVIBo0Ld3jC8AOYdEtiC9N6GObHk8V7a8qDbrzQ9Zs6mQYb?=
 =?us-ascii?Q?Co0yJqHrgPlm5GsXsqKjqTK4SQteZ9QV1Kkq/chocIzsg6UI3hW/8aVcZ6KR?=
 =?us-ascii?Q?lyhgIHKxb0ktMoe6DG4m98MBTxIJM2eeFhRCYLQtb926N6mhVgbVWXA05PSh?=
 =?us-ascii?Q?/eJw3KQitODcEgES7170J63wAn1TiFP0uGAvXUnYf7XhxJDFogdbacrDdf7p?=
 =?us-ascii?Q?/LRX31DZeq/1JwVKsZTkoouyzZIwMrNCZJVtQqmLQJFd21Ku5fFNmD4QGOto?=
 =?us-ascii?Q?Lg86HLk2CnQ0HyBBlG+nok+SOmYEuDwBKdsFlK3fMpwKoIcODw+XrcvtGmG6?=
 =?us-ascii?Q?xokvvmoNC3+yDaKtN14h+F3km3RK3M94wQetz3mdopU755YUhtnpU5bCV5VM?=
 =?us-ascii?Q?zMXqUffSKoj2kywiprwk4JTrJIx3XyDrEqrQXj/jT4rzwmCHWfvAesX2NMlE?=
 =?us-ascii?Q?zvWL1G5r9TuFr6Cq1pyP0pk/TAnWm4QGDtEYonrwRLo8vDrO5+mvYkFEUyET?=
 =?us-ascii?Q?wqDLbeYTmEnDLQleOGaZBMdEq8JtxW+XqkPU020lkuRuB5KtDDFJybm3eMGH?=
 =?us-ascii?Q?PsbFY8/mkTQio5TnBSEbqdfEf3VbwubhtPi5xR00FFXpNcZzEWWXhUcOrJ0Z?=
 =?us-ascii?Q?mj5fSrfZLMsntAgmF0xWRgF051TBMFEdCZemJafUVo6EhVdOaC343w55NZjM?=
 =?us-ascii?Q?tvSd5P59mVdVgRWt+u3SL11oX/2HbnOFhVYVXy03DlWu0zT0nR5nBF0yQn4L?=
 =?us-ascii?Q?K2Airib3o2s7nbv9ZV3DTmobMuYvFFqlkuLgdwKf93yoMljtqd//fqxw5pyW?=
 =?us-ascii?Q?hgyP64VgXgpXAlINZJB0kRO1k5/tk4R5peSOfReKlprIozTQ63SiCzxGY73N?=
 =?us-ascii?Q?ObMU5ji6sSnwORCyV93/4AqEo7NtVZ8j3CyzgBMK6cnpd/ZdQydezlwCSQtq?=
 =?us-ascii?Q?kRx8uOGNwKvtoiHU6W9dKwfC0tY7x9uRdUBbWXSgO8Iw0ChVKElzPsOqGwvd?=
 =?us-ascii?Q?3FHJ8O9X9EW4rKCXYvX+6EE0SWurlBv2VqNUBtS7B1OPjHD5vIZ3B/iERy/+?=
 =?us-ascii?Q?v+I54DEMs5/umhSyobhzaGXiXetBs/VTwjHqX0wzvIJw9UPBFhxD5k/TFtRV?=
 =?us-ascii?Q?IaNnET/84TA3oDOQ2pe0U0G//YmOk3rDLOOvxFO06R8+ooEqv+RF?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58948e8d-aceb-4a58-06a9-08df4bdcc586
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 16:46:09.1642
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ESZ2SaeJhx/wDdgSrqQXPRDs7FAgGG41m3JJz5605d2RezVo7jUeCJKncpg0uK73L3lO++fplWK04djjy5plp+Lvh85qHHzXGEPCRvZC2HW3thhvrX5rp+2BybvfLH5E
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB11609
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_084615_189264_FFC36F32 
X-CRM114-Status: GOOD (  20.34  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 26, 2026 at 06:08:34PM +0200, Daniel Baluta wrote:
> From: Steven Yang <steven.yang@nxp.com>
>
> The reset-gpios of both ethernet PHYs point to the PHY interrupt lines
> instead of the PHY reset lines.
>
> On the FRDM-IMX93 board (schematic SPF-94611 rev B2), the PCAL6524 GPIO
> expander lines going to each PHY are labelled:
>
>   P0_4 (line 4)  ENET1_nINT
>   P1_1 (line 9)  ENET2_nINT
>   P1_7 (line 15) ENET1_nRST
>   P2_0 (line 16) ENET2_nRST

schematic error? Should fix schematic also?

Frank

>
> However, on the PHY side the nRST and nINT nets are swapped, so:
>
>   ENET1_nINT (line 4)  -> ENET1 PHY RESET_N
>   ENET1_nRST (line 15) -> ENET1 PHY INT_N
>   ENET2_nINT (line 9)  -> ENET2 PHY RESET_N
>   ENET2_nRST (line 16) -> ENET2 PHY INT_N
>
> The device tree followed the expander-side net names and uses lines 15
> and 16 as reset-gpios. As a result, the PHY reset sequence toggles the
> INT_N pins, while the real RESET_N pins stay deasserted by their
> pull-ups and the PHYs are never reset by software.
>
> Use lines 4 and 9, which are connected to the PHY RESET_N pins.
>
> Fixes: eb2f28413e23 ("arm64: dts: freescale: add support for NXP i.MX93 FRDM")
> Signed-off-by: Steven Yang <steven.yang@nxp.com>
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx93-11x11-frdm-common.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-common.dtsi b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-common.dtsi
> index 33ed26aafde88..8c7b08894bc0d 100644
> --- a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-common.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-common.dtsi
> @@ -145,7 +145,7 @@ ethphy1: ethernet-phy@1 {
>  			reg = <1>;
>  			reset-assert-us = <10000>;
>  			reset-deassert-us = <80000>;
> -			reset-gpios = <&pcal6524 15 GPIO_ACTIVE_LOW>;
> +			reset-gpios = <&pcal6524 4 GPIO_ACTIVE_LOW>;
>  			realtek,clkout-disable;
>  		};
>  	};
> @@ -169,7 +169,7 @@ ethphy2: ethernet-phy@2 {
>  			reg = <2>;
>  			reset-assert-us = <10000>;
>  			reset-deassert-us = <80000>;
> -			reset-gpios = <&pcal6524 16 GPIO_ACTIVE_LOW>;
> +			reset-gpios = <&pcal6524 9 GPIO_ACTIVE_LOW>;
>  			realtek,clkout-disable;
>  		};
>  	};
> --
> 2.45.2
>
>

