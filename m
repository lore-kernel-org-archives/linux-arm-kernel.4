Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B2CF606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 17:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Exnq3eK/;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=VDf5EadM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=vDLfZxSdXCr6flrtP/3iaj5X2AZ3hh4f7i+TfaYzE5E=; b=Exnq3eK/Kke2dG4ln2/4rye9fB
	UNky1cIjnjUClWVtscB4XQ8C7NYc5AHcPQOXWl5j9/vpchIWz/1REDQs3yRslw1GaCnE01DuEUq6w
	D06mW6XeqwLOsXKYtH9PODdVL7UPHAxLw84mdBnWQWim9RbYA+rJA6W8H9qstwBe/nZyRLcjJP3hr
	mG8tshDS4Y0DIGcgqp4PcTlbE5oXwUFwpG71NSRs97rJuQ+lIlTrTj48fbUVmgVxwqNn8tUa/MPOf
	yhH8ADF7Q8lzE9C2n1N0lKDz+8q0TDvmu3sYSuhOMJ9elVEOfCEgzZJe30gtVVA90w/puklWjONpg
	y6zBGz1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWGsn-0000000AkjH-041m;
	Wed, 25 Nov 2026 17:34:13 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWGsk-0000000AkiZ-0OMJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 17:34:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xnoPv4CJlfeUQJ06LOMUW3ZhGH3G37mmYPwbhXSphY700WUQ09FpG9ONu8MRtv6yVUj+eRdOO1inqvaFbxfoC1ZJQaPLLgfo8vzfIVfCPKxDgcNoI0/ygORJkpp1CSNrNfrGWRIhJeJK7+c+7Xoy3E+xhTxvW4flmOP9F7PRQTNUPtbXZ2Y5i0gbiqyJ/GIDpDB5RwFm9VeJ8y20jRi095g+rdpuhG/aJGu8J3foDm6V2KrGYlyNel+jJ3HzyRdyIYjw1sMMhkxOxuqGtu4VutxWb41xIWL8a6QzaIHs3jFGFrPVjO8Kkc43XYcB4ahfW85aHJkegc2Vk19MWdCISg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vDLfZxSdXCr6flrtP/3iaj5X2AZ3hh4f7i+TfaYzE5E=;
 b=zHCp9VuulUz7tp4/DyFKm4YzYLDjTExaACzjQPJ2HSL2ZFgoz4cI51L4Os5rHmFpKDNh6R3xj1W/NLN4Z8FzU+y62FNgXvK617Bd5+bJbqEFKyJ8cGg4e2wVQRYkjFCltiswPRbTB5fjmavSI11rwls4Gi2gGWTiKlvr9kOCt57lOEeRORr7x4h4v6Imj9QjP/97B+1Fm2wbqwe7HNiPjzt4IpjfXy5gkopNyaBqCOMiyX36ZzxcYi2iQM1T+ZNp8PkcKXI0oUvFlSQ5F9nTiAap7J+BFDGpobIvScBJ7W5wiyfUG+sH8V3p8qObDFz5xCzBHKCyOt1zf2LgjxdTfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vDLfZxSdXCr6flrtP/3iaj5X2AZ3hh4f7i+TfaYzE5E=;
 b=VDf5EadMBXRv6VWXt0LBxr4PQZx2KQ3Z3PyYYLywCxAo4rnZuJE5oyCjitrjQ8TXHtCS5uY+8mh2WQiyyVOhs6PTqH2BYDGygsLYSWQv5HDfAu86FegoVG5K8thng9JQ2ItoEl53fyJ0SRbd3yW2Rfz9GWbMn1faCeRUQw33tslfECdACqQJ58kUBOb9mCLHvmATQJHgD8L+aEkwOiO3zWhd7PCAT1pFf+dwD1nFwoiKxkJj2vJUxeIwNaeExIA1KxK9jGdRxG2ut2mKb9Ynl87kyQiCm0KxSfr44ObkMVQg5KOYtjx6wBjQMSbY74rDHzMW+jCguaxfzpXnib9mpw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by MMZPR04MB960486.eurprd04.prod.outlook.com (2603:10a6:190:54::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Wed, 25 Nov
 2026 17:34:05 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 17:34:05 +0000
Date: Wed, 25 Nov 2026 12:33:55 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: Frank Li <Frank.Li@nxp.com>, linux-amarula@amarulasolutions.com,
	michael@amarulasolutions.com, Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Max Krummenacher <max.krummenacher@toradex.com>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: dts: imx6ulz-bsh-smm-m2: add boot phase properties
Message-ID: <awccA-lfHvefaqdN@lizhi-Precision-Tower-5810>
References: <20261120152146.1774885-1-dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261120152146.1774885-1-dario.binacchi@amarulasolutions.com>
X-ClientProxiedBy: PH8P221CA0058.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:349::7) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|MMZPR04MB960486:EE_
X-MS-Office365-Filtering-Correlation-Id: 40d8a9d8-3e59-4498-9317-08df4b1a4d68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7416014|19092799006|23010399003|10067099003|56012099006|11063799006|261021121427099003|261022075727099003|261009223027099003|261102123227099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: mY9mKkVlGXxMwEO6aDz5G/5+l2DqXg3YgKJQVL2kJ0rHVE5qz6VTNSjK6KVtal5IyZh2ScRQYNn7FaPYj/VI0Du/7/2GkA1vvgRXbF7VXN84cqB6ETdYA8F8Avof/bbqH/MJS9aSht1Hgx5fojX1GjB5tEpzQrtiLkM4+nC5aN2rvN0LW59o86ayTKbg/Z+IadEkkRhL2B1qJi6JnpKwoW8M+RKFboURtDn7KojuMKrOurcT2a7zsa/wqMSmQkNNqwm/VpgYiiaryxTpUEvQr3GJ37NMFY7O4VXE1SMvPZGM+RgH+tbNQgs/uW0vHrUi2JkXq8vV0253v7zSgDTmc1TCPM5iMh4XNPBon0va619DCGwRex7aeDDZ5845fQDkFHhAMfoXYOwRYK8Bl+fnKAdwlKCE3HSysNdJQmMGFIxrrXi0yW/kA5iKcnV1MLBZaz9ZS72ucljJMZAtmTh3E1YJ7SXHuEnZw4Uko3sL1DDX7QhZaarN/0xBCz+FuIOm8BjWfBlyCIosduq1L7JtTYWJU2So+zqh3WFmK0nP2sDdnxmqCEe6C4jKkbw5areCCoqJAE95wzce4UqWZ0PKeNyuA8cmAyjxP9UN8rqmOhekk7wxWeFKX3eiI1K/knMb
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(19092799006)(23010399003)(10067099003)(56012099006)(11063799006)(261021121427099003)(261022075727099003)(261009223027099003)(261102123227099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2i4YT7vNibqgy4lsr1kByN9wrax6EieQQ7Lg3tRRUZTMGZPczz7R0u8MKGIZ?=
 =?us-ascii?Q?9qTQDClgWr8pQvvxRYn0wl6Gif+hqezGlAceFtRSgMZ4dajWVuNQ64zWpK9g?=
 =?us-ascii?Q?/k9FMkcKgVivI6WEr/1wTmycedukGn1WOfxVNeQjUNd4N+BtVBlhlrwjbJse?=
 =?us-ascii?Q?4pNoF8/IKv/fLQjTkwK4doaQuy2+560i+qpYXJiWtqwkbncAr9A2qJE4hhso?=
 =?us-ascii?Q?jcEniJJ+lkMh0HGBxpugrBpvr+JpuXBupczghtrQR2dAnwIMXEn0DZHcCSTk?=
 =?us-ascii?Q?34EX99Aodq+36Ip/VMA4x26fbmm7fmabtSZRrAtbdXp7XhwL4V3GYQHsz/ci?=
 =?us-ascii?Q?QGyVBNLLFg0FJxtIHf27Drf1m3WVkqnSZr1GG5l2hPtpeUwdoAGVpF0/qKjO?=
 =?us-ascii?Q?Hh0QnFdPG3Cs1VE2Tls3jfS63LKLa2rIL4pMWQUv2Nh2wxi5d0LfmjGk9xGA?=
 =?us-ascii?Q?yrWOpfGGbTMgo5Kn6dmtfRQm8PljVkYizuVztZTF/pa2mZsba+KTEfLNHdb1?=
 =?us-ascii?Q?gRfvGwMBs3hpRgxnX6wveSWT4frU4H6O8BKZbo/Gml6WSutOUTsboVJCahns?=
 =?us-ascii?Q?t+W2D2SaTUx6E/cmeIxjALcUuDLua0wo1qJJM3/Y7wiN3LILP7x/mT5qIf1x?=
 =?us-ascii?Q?OhMDuWOOnUTsTy/TPscxPoieyWj7yswwyGEtAizdfD6a+sZek07mFGWlUIxj?=
 =?us-ascii?Q?ejdMuAqcLZNqNFujZu18uDLTBgWQwM9ur8WuLqHhZhz47Qvql/ytoqCXIh1S?=
 =?us-ascii?Q?SflVxUslTPr2T0z9rQyeVHOD3cMSLLirtG/WmPxi6OeiHYGoPCYakNBAnJQT?=
 =?us-ascii?Q?RhBpjwNv2l8hYTvqMchd75ceePyQzcpbpfsSo8dkxLrPEzLlgw41idibgDAJ?=
 =?us-ascii?Q?PgHKM6hkjtJtjO2PKDQj/OYz05UPLxluDw29Co/3d95yHeenAhzqnIzIRaxa?=
 =?us-ascii?Q?Dd5FNv12lUfR9pzuU+B1jjj3FKaGjaAt4sd5wsNVBkvNXG0A76Yi2ecv6+qA?=
 =?us-ascii?Q?be2xBx2g1xHnBjNvWVGStMmcp546tK0qUPXJgki7uQkmSI4N8rPh0/oS2UAr?=
 =?us-ascii?Q?dWLgSWU3UyqABdbFzSl8DwO3WC/H9ZuEBaucBcg2tmGiTC6V2Ml4N8hMHrHa?=
 =?us-ascii?Q?s7RMrb5898eZaLCuaaPf1IGTpuoUHzEiw/2l9h1LiTzR733GoYoC0gw6LD1h?=
 =?us-ascii?Q?Q+a1ZhzaskrWtk2yHcmbqMLOMenED19kDXYQlJOtQyOLgj037ar6rm9i6jVT?=
 =?us-ascii?Q?rHPOT5E4NxU9j2jOZskkqO2Wb+blZ4AVVLvH23LWdVuNw+ah5tIwuHC0+2Lt?=
 =?us-ascii?Q?SiFXAsglmdxLUiwKb0EqESQ+lrZbCOk2cW/dDkeCylvTME4pIrlx9opISsde?=
 =?us-ascii?Q?MjcGYF+BgFXlQCyABZPfNCP7o+h2NEa4DlcVAoIAUQtkCwpr1n4j2H3PKARE?=
 =?us-ascii?Q?ckK0YT1vzAX57xA3L3gkFv8od6JQcmB+bcP9x9uqmYtuG52DgD5lQw1ooj3T?=
 =?us-ascii?Q?U7mq3k3nlkxBVXYAo8kQ8TuDxUz7V7O2Sn2oAzyCGMeofMktaN48OHtjZunw?=
 =?us-ascii?Q?bTCWEodbn9DrjlcRm9nvKkDaKihzWZhbBXYrzxc/e3rSTBegJQFxybkXKh6q?=
 =?us-ascii?Q?ATIs4yB59EOhEsntzyb/3DRC2bCX4ARkbhYcCigRZmpN9j4RIjPv6CuHAh08?=
 =?us-ascii?Q?qNQkyVw1sfnzhOTRQKiMq/VglqY5BfLicmRdqNmMUfTAremwq67Gtj6Sh1dy?=
 =?us-ascii?Q?9q9oaxh8G7gh51f0I3wsVrUCc5yAjbZZ5ComvmNBh5n8quZLd7zW?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40d8a9d8-3e59-4498-9317-08df4b1a4d68
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 17:34:05.0853
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y6/uQtw8gkgcbdaKBFUISebEho+vBQoKP8LqLVPoIeGyQg0KHCiCwKJ5uCXzjvl4iht7yjS9sz6BjvtKnQ6T+OnmtM8bYWOghmXAZXlCQQleflN8+2Yg9cSQd/KNtx2H
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MMZPR04MB960486
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_093410_671561_21D20A96 
X-CRM114-Status: GOOD (  15.91  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 20, 2026 at 04:21:36PM +0100, Dario Binacchi wrote:
> Add boot phase properties to the resources needed during the boot
> process.
>
> The BSH SMM M2 needs UART and NAND access.
>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
>
> ---

Please rebase imx/dt branch.
https://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux.git/

Frank

>
>  arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
> index 2d9f495660c9..c74003ee9efc 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
> +++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
> @@ -26,6 +26,7 @@ &gpmi {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pinctrl_gpmi_nand>;
>  	nand-on-flash-bbt;
> +	bootph-all;
>  	status = "okay";
>  };
>
> @@ -55,6 +56,7 @@ bluetooth {
>  &uart4 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pinctrl_uart4>;
> +	bootph-all;
>  	status = "okay";
>  };
>
> @@ -135,6 +137,7 @@ pinctrl_uart4: uart4grp {
>  			MX6UL_PAD_UART4_TX_DATA__UART4_DCE_TX	0x1b0b1
>  			MX6UL_PAD_UART4_RX_DATA__UART4_DCE_RX	0x1b0b1
>  		>;
> +		bootph-all;
>  	};
>
>  	pinctrl_wlan: wlangrp {
> ---
> base-commit: 65e4fd942f72a9dba0e4e257290c4fa1aa756854
> branch: imx6ulz-bsh-smm-m2-bootph
>
> --
> 2.43.0
>

