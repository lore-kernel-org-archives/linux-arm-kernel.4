Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0B1F606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 15:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=b6IHWMWl;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=UQlwqKkn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=B7rOVIpCXucw6+7L0u9MzrFuJ+ClBimtbhN9ax+boqQ=; b=b6IHWMWlZYCpdI8ZS9PXqomKG/
	rPguI3NKDXn735m977SGCQY17jr+YoOKdPmMhG8EXaypOn3pVRYg3YzsJTE3T6+FKLi4YogTvwPCF
	ZfupgGEOAv1czN4o0Pf8yRH1WPN2+sc4oB27krx/sseu+J+zqSVSb2EhqwoYHidIAW/uSWUoWyQXD
	t91KNURniM0+2eBH1you9TCaG+1uzUCnvrO+ai7oaEi1RkFLcU3zQq9IZp1SZEXy1Ogyh2URNRCnK
	coS7vdHEjX1L4MCsamiSDZ8tbi8K98DYCuF1GHJOTSVs4R8fXmx07yNsTVRILbxmAVDceRSB7dy9y
	uUzUU8DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWapV-0000000Dc5Y-1pRc;
	Thu, 26 Nov 2026 14:52:09 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWapT-0000000Dc4u-2aQx;
	Thu, 26 Nov 2026 14:52:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KkcEiZyyP1b2+1Ilp0N/hCgjqKEsrvemfdnCgjiYMm8MDjSuLt4FgXglDlLtkWItCrb2jh9wlksw9DjmF3EbdWD61NBv9dt5zP/y1MCMpmNLQc1vcLI/eqAOjW/YO3sM1939Yf6ESlENo5NRzuU/ZgVYI/BfBbkomktPZbO3nhxo+ukIw91yaoSyMGX8LoGq2CeDhg/eS8qjUQjgTtc+uiULKjfwqXbdqxWBSle5KaHQmiAWTCWzrHdQll0QdDpr4xIb0RKQ7SFRrrbeFLJBtuGlXO34CN7qUqqzomCnO5Vz+YrjwR0ymF/aER6CKB9g5CTHAqOc0g+47ExjzryEJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B7rOVIpCXucw6+7L0u9MzrFuJ+ClBimtbhN9ax+boqQ=;
 b=SV7bjbVSkP2Wr1eDKwWbNNLvHNwkY0Mv/flnomK0561fUZJ3/L7qWfpe8RpfRMvUCk6MqLZKUFvfCFtyKl+nSBnLkRoPedkW3D5JzYY89p8ACdnrAl+T4tXMTCWT7w6RzeX4r0cHjqr2Fm7NAr6imPoJ6FY4F3SdkNHeGBjdo67lSDa7zhRGpKvp3lw0nGInKah+ZjtIdZ0iV0OQnvZd9Hm3K6w0MGtTzJh4f4wVjQqu8z7XhDV6+qm+T0DUT+O+T6UjfzU/y0cvw6y+K8IO/pSA91NCCXTvKmJEL4rD9vc0MYZoXY78JvbYlWGIT0G/p1TsqdeLSVqR6GChJNXeCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B7rOVIpCXucw6+7L0u9MzrFuJ+ClBimtbhN9ax+boqQ=;
 b=UQlwqKknK/vPDhUoIUdc8XnFwb368NRQP3u3lHuj+OfQPX6hmzLzI2UqGDbQfVciVrNdsEUCu/6BIWb+ap+OVNnYOJKQLXpEpj2fYpp/eqE5k60Fm1UN4CruyDPrWA+PsCIbRTRMD8vtquJcfadR3QufvR+kM7zLqHn396PgX4Hva4iUurlfx/UhhOWYnN4VEMCzz491lAmbKWnloKos4U59+N2U2tv5Nf5m5IOHo3Nqloxo1SEvAFP5B/Z21n4e9ZOa584DAfIhsAIvS6gABXxIkpM6FRYGalayWwzzwXjO0yHdipLx5uPM/of3OIP4l5HRvKpY+WfZ4Aa/1wuMTg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com (2603:10a6:150:2c6::8)
 by VI3PR04MB276878.eurprd04.prod.outlook.com (2603:10a6:800:379::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Thu, 26 Nov
 2026 14:52:01 +0000
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4]) by GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4%5]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 14:52:01 +0000
Message-ID: <b4c626dd-0af9-4b57-8f50-2671a8e2313e@oss.nxp.com>
Date: Thu, 26 Nov 2026 16:55:43 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 4/6] ARM: dts: imx28: add alternative pinmux for CAN1
To: Stefan Wahren <wahrenst@gmx.net>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Vinod Koul <vkoul@kernel.org>, Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Vincent Mailhol <mailhol@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 kernel@pengutronix.de, Fabio Estevam <festevam@gmail.com>,
 Andrew Lunn <andrew@lunn.ch>, Manivannan Sadhasivam <mani@kernel.org>,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-can@vger.kernel.org, linux-phy@lists.infradead.org
References: <20261112130506.12823-1-wahrenst@gmx.net>
 <20261112130506.12823-5-wahrenst@gmx.net>
Content-Language: en-US
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
In-Reply-To: <20261112130506.12823-5-wahrenst@gmx.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM9P250CA0012.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:21c::17) To GVXPR04MB12316.eurprd04.prod.outlook.com
 (2603:10a6:150:2c6::8)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12316:EE_|VI3PR04MB276878:EE_
X-MS-Office365-Filtering-Correlation-Id: ac021e27-412d-49e5-4047-08df4bccd418
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|1800799024|7416014|376014|366016|23010399003|18002099003|22082099003|4143699003|56012099006|11063799006|261021121427099003|261102123227099003|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info: dcRvdB2YWpfvAb3aU53fKzTCWvYYmjQCyyqS3+fgrPlWRcID6K5J12EHl6vGhCSMLwPIDV0vDIkRIKLurKb7YtYeisPXkSInNa7WKYY86ygA+3wqFA1k5+7F7lsHNaKmTwcPJhFa0FgMt9vrsh9WhDQuWGONZRB5B50q7jcHY5YeeH6W13c2EJB7C6wmBKykj346xaQYj2g0ZGBvW5Ci8y6IigUAopU6usYUKZgTl8SFcwP5jJLRYrG6EP0JQ8EDs7FHQEW+YOGaDk/BVEo9VgtHElgaoil18pd1s3BlmbRwrOJGX0FZnvAZXVHJfKig4mC7pzqNOkNDqcz58Y29kITFtZ612MBkhlZV9tTvAwumCwV8CNG2zhsEwjBhFHnWjdh88erqULnXHDsrrydYVUarKEBSvWuYS4yewyjKEFP7PcFx2LO1amQE++aJx51NVVX9W8WFCdUOS25Eo7YUU82lqyqBsJ1IUQt7SZMt873UvQrcGzbhbybMNwkIhCWApa7uk3jewKSmhgJ0co4OBKlbjXUmw45sYAU5sz4zXJIWh/tzkTtHiqCEDWHy/YxOgM33C7v6ZxuHBFKvXlIo+g5B06RYHZ/hnZLyurU5lsNkXoLNuc4VdMls+xSmqlIV9OgdWo0CgKCnlSsYroWv3EnWag4WYCmk78iJfNNZrqA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12316.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(7416014)(376014)(366016)(23010399003)(18002099003)(22082099003)(4143699003)(56012099006)(11063799006)(261021121427099003)(261102123227099003)(261009223027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZTFKdTc3U0VpUHM5TDR2RThSd1hZNGVEd3FlcUdhTnk1OVRDdWxCaDlxYnZt?=
 =?utf-8?B?MTJCd0NFQVZjMHBNQ2dDUVlCQko2aDFxdW54YzlvNVFLc2d4dDB1QVk0NVRm?=
 =?utf-8?B?b2s0QTF1dm44RVpRMlZZbnZUOUlmR0dJdk94OTBIdHZVaFp2VjFLNHZIc3B4?=
 =?utf-8?B?blVQYUV3RUwzSGxaQXdueW51THpXb2hRWll2Y0N0dHFSMG1tU0tmekEwK3pJ?=
 =?utf-8?B?NHdkcFZ6azFrVEgzUUJnQ25DcUFUSWZMaHdGOUpENUxHZE02WG0vYlNPSUVz?=
 =?utf-8?B?TzF1SkxsL3VpZFZXVXNPQkU1Q1gwYzljUXBKaEF0S3NEMTdrSWJtTHhjcUJB?=
 =?utf-8?B?ME1YK3dyYVpMeVhZcVFwL2RNU1prY2ovZUVXMmxZNkNWR1R1S2I1REcwbTJK?=
 =?utf-8?B?a01zbjBqcWlYeGljd0loNytLTEFJNDlEMHJNbVNLVi9rOEhPNkl3cFlTUWw4?=
 =?utf-8?B?UUlPZHQ2QzdSTlVyVUNOM2xQMXRVanFieGM0Tk9FTnhnNXFORXZEemh5c2RH?=
 =?utf-8?B?a0Q5aE9vZlI4bWdaRDlwTFByakdlcnhaL1Q5YXFLVGEvOUN5a09wa2thNHNN?=
 =?utf-8?B?Ykx0YnlWS29tcUtSVEZsdm1KaHJLSFBDVWFtcjNGRWZybTN2eEs5c3p6WUY1?=
 =?utf-8?B?YnJTeThRUW5uSUEzcjcxUWVrZlo3Z3ZPbjJ2amh3WUUzcGNySnBHR2FKZTEr?=
 =?utf-8?B?TTRmeGhJaWs0R1Fibllsdi9uMHZpVStScFJjcjVVWU42a21oQmZNcHU0SEpX?=
 =?utf-8?B?NHRXdE1OVm41WElXZVBDV1hUTndkaFQ0blBWZUNXWUdIMkRuOHVMVWxTcHBy?=
 =?utf-8?B?UnkrbmdESndNUVNLVGcxVWFjcWIzL1FRei9DSEU1emdoWXQzM0NVYno2Wnhv?=
 =?utf-8?B?S0FzUVVjNWpzSXZyQXk1aXFJUEE3dngzRHkrT2dhc1RZRDh3THJZUXNJWjhm?=
 =?utf-8?B?Q3MxV2RiQUNzeFcwMHdYd1FsNityWGRKaEJQU0NzVnlLcGpLMVplb2grSDRT?=
 =?utf-8?B?dVJ2VmZ5QjE1R3R5Qzczait4M1pvR1p1Y2o4OWh6SmZtZUd2ei90bnZnczBz?=
 =?utf-8?B?bWxLMkgyRHZFSDhsWm1rSlJRSDBhQXVJZHp0aDVic242UDc3K1o0TW95TExJ?=
 =?utf-8?B?WXQwZUVIZzBzdFRmMGFGYklHeWU2U2hzWVA2OUNYWFN1VUVBTVd2ZEtBdjhV?=
 =?utf-8?B?cXVFWnpHcmNOMzY0M3MxOWNkRHZENUtHTGpSemRGUkZGY1JJOVNNSHEyQlhh?=
 =?utf-8?B?UjQxWHljRUhTcHpVS2wyaGlIZVpWM3ZoQStjZnVTdDRDMlhtalFha0ZXTHpz?=
 =?utf-8?B?NU9mOFVmNmhqR05PYllzeXZ3YThLdDloMjA5TVVFaEJYWDlpZnZJSStpeTRZ?=
 =?utf-8?B?NGZxWm5TRDNJUU5hbVg4V3I0Z2lQanpRMENyQS9kL1N1RmNxV2hmY3E1c25s?=
 =?utf-8?B?eml6dDVPdXUreEFFbDJwajVDSFFVNWZpWTdCTDdKUUZ6Wk5kV2xaZUxsZ3pu?=
 =?utf-8?B?MVVUYkNkbmxWZy9IcDNnbWhrTDdWbVBaa1lTTURqYUNZdDZtZThoV242VGt1?=
 =?utf-8?B?RkdzRlNVK0ZydmxPZm1xWEF6V2R0U2wvSkJyZXk0N0VQSlAvWmhvMDJrWWdv?=
 =?utf-8?B?YzFNYjJTMWljbEVGSGNxUjhKSCt3aEFoUjNBSDNxUTlESXBLS1l2MmoyTFlV?=
 =?utf-8?B?eDd5dFdBM3VBVWtTbU8rOGJNOEVFQ1c0MDhaRzd2VExlSWF6ODB1RVlwTVU5?=
 =?utf-8?B?cElRWVMwTjB6cHdzMjd5U0FkTVAzWWkvMVJhU3FZMHFtUzZ0SnZ5LzZOWVRE?=
 =?utf-8?B?N1YxVmpoN00vcGp6OGJQMVBSUUlyMlUvYlZoK1d2UXVRNDJCMkJGWmpqZndV?=
 =?utf-8?B?RlJqWEZkczhWdUdZTjhOTnZHSlg4MFdTWHJucC9GTFlkQml5dnVVcklhaThp?=
 =?utf-8?B?b3p4VFBkNFcvVlduZUgxVlRpb0gxOEgrdFBuS0xxclljUzVQL2xabDEwcXhj?=
 =?utf-8?B?V2pwWjBTeHk2ZG5XSkV4akFuUXM1c0kva3NkS2VGRjhNTW0vTmg1d2xsNTN0?=
 =?utf-8?B?TmFnYWFFU1BSalpreEljVU9HaGRBVXRxQXFwd3FCTXRzUHNCcjYvNzJwL216?=
 =?utf-8?B?MFhYaFhFdE4vWVB4Mm1WUjZWUXlFQ0ZoMnJjS2x5S1FSVnJlS0tTYzB1elB0?=
 =?utf-8?B?bDBDSXhVbjVWemxOdlNsRlJMQXhKSGN1MFFGTC9aS3h3c2h0Si9QQ3B1TUsz?=
 =?utf-8?B?WU9rN2lMU0l3UTNqcWtoaElPcUNLWHgrS1dXdU9HMk1ucHpLY2pXU3VYaHBt?=
 =?utf-8?B?VzlDM2E1aXUyT1FMSzFNNG1yZEh5TWNtOUZ1d3doazZ0dmljT1hWdz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac021e27-412d-49e5-4047-08df4bccd418
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12316.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 14:52:01.4937
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gtq4/JIk2htM6qMoMg/cGBWMasfLhfh4A75pO1fKPnenziDSpAdjrx/pdPfnVGykrAL4z7gfSdJIB0dlbvQLwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI3PR04MB276878
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_065207_664904_73498158 
X-CRM114-Status: GOOD (  11.73  )
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
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/12/26 15:05, Stefan Wahren wrote:
> Add alternative pinmux setting for CAN1.
> 
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>

LGTM, although this could have been squashed into the next patch.

 
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>


> ---
>  arch/arm/boot/dts/nxp/mxs/imx28.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/nxp/mxs/imx28.dtsi b/arch/arm/boot/dts/nxp/mxs/imx28.dtsi
> index ece46d0e7c7f..ee567aa6f561 100644
> --- a/arch/arm/boot/dts/nxp/mxs/imx28.dtsi
> +++ b/arch/arm/boot/dts/nxp/mxs/imx28.dtsi
> @@ -885,6 +885,17 @@ MX28_PAD_GPMI_CE3N__CAN1_RX
>  					fsl,pull-up = <MXS_PULL_DISABLE>;
>  				};
>  
> +				can1_pins_b: can1@1 {
> +					reg = <1>;
> +					fsl,pinmux-ids = <
> +						MX28_PAD_AUART3_CTS__CAN1_TX
> +						MX28_PAD_AUART3_RTS__CAN1_RX
> +					>;
> +					fsl,drive-strength = <MXS_DRIVE_4mA>;
> +					fsl,voltage = <MXS_VOLTAGE_HIGH>;
> +					fsl,pull-up = <MXS_PULL_DISABLE>;
> +				};
> +
>  				spi2_pins_a: spi2@0 {
>  					reg = <0>;
>  					fsl,pinmux-ids = <


