Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53F5E606A335
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 17:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=odTZMsxB;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=ARy3uNF+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Td11aykAIkoWJbDK6XSnW52piQ1ol/wYq6OssZb+k6w=; b=odTZMsxBYR3IASnoHp+bLIuuQg
	+IwXEWsDQSxhEIP9Acv4BNu0GccrpeQxHsXfIq8xFXB0k41c1QEv2AX7FqTYQUaUU8ElnGPhRWnYm
	UkkWO1arwUDJEf945UGBpAbSykaD/oLmN0bsKE2eCqaZzxbWk+y/+zxjiRf56R4XTpJPTrdX52BC6
	WKMscfVApOseJO9BUFkkeu49d8CzlPw8Fyj1knlEooGgX6OTgbCrKT11NNVrnh4T1pZfIqmZfsY1e
	I6t4XXjv4xNs/af3UJ77r15GekpqZA05IrkmFBrgN2wiBYa5XqdL4I1GFcU+kUWxMc3m0yrQtYK5U
	U4puYOtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRYjT-0000000AmCn-0NEr;
	Thu, 12 Nov 2026 17:37:07 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRYjP-0000000AmCN-1Y1Z
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 17:37:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w8WoHKh6mSN7XwAz6ylSV0awECWreGRCclQ+iLqMACpX/mWbMRDDLZfY8uTitbC6di931zxSwmC02dJO8zOKioWnAapEU3LJlI0LGrZYKLRvImK6DdgZU2fnDpW6IR7nq99Pd08sosQf9NSGq08CEVYcdgDd0M5ChVlBYVsxP6FhgsPvj7pbsMQt7zj5OZif5K/VXJSBmVUs3XdIpHIe0NdE29EnrqCVhDYypK6lRP5P46i9i7pKR9V4OsdXHKjjyrcqCJxz0wPUQcFlNnKNlqtFDW6gDUYTLWvr3lSgjbjTOnmvxmq8Ldi2f/U6o8qVoq6TotLh3DiQ2gW2zh8o+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Td11aykAIkoWJbDK6XSnW52piQ1ol/wYq6OssZb+k6w=;
 b=TlOQVjyBSTCacAu+d1ucDQe1slts8do/9INrWCJfP/dXuoRCIrEWnRjh+ePgVA5J+hrfeyqLfGcRU0Kf7USCnctM4RATdfiCzXOIx9xDEnE0mbMjuQDg57bITQTeZAYu9sNwy3A7NV2L5+AFd9CF+tbX9u7J4YnE8SU8HyDEHv5slow6VLJzsI2ELtRuXGtOpPyyRIhgw7g13tqNWa0gKIdxlKJpTEru7U/vZgmU2oDf7LMeKNCKI5xbqswQ//iRECZrxGIkmglWzhZ1Hu1/X47KZWw5Bedca5HjQYADo08Qkj6TdargScYdiOKa+gio9zWiW02scMCQEm0GMHIu2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Td11aykAIkoWJbDK6XSnW52piQ1ol/wYq6OssZb+k6w=;
 b=ARy3uNF+SWW+DRSkmWmNlmG7oNm8Zb9/d9SV3m1w3HJDpjFCF11DnL+MsiFtjwCV6IChhohpLRm6+b4MP3lXDSMLRKsnMFulNBQpZYrJNiGSXYqaY8CuoFMYfjJQ4np3npp3HsXF1bi/7MdhAo0uNIhUMkCzwcTUwKJMxLQQewTt3A/ukPGHkvrIGBp0Kbq8rQrW8k/hRZv9440pskrnikzxhgV21iWDxm65qOiPvqx+ddNXuKmxvV/o3HPAPRIrd4z+qkUI1kZ43hFYxbUuGBUCXn42/wvydQKKjKbzc5c/x0cbCVUwwy0TA+uASBmAvvLk+GxRuhaWFZ/tzBxD/w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by MIWPR04MB558776.eurprd04.prod.outlook.com (2603:10a6:290:e8::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Thu, 12 Nov
 2026 17:36:58 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0615.009; Thu, 12 Nov 2026
 17:36:58 +0000
Date: Thu, 12 Nov 2026 11:36:49 -0600
From: Frank Li <Frank.li@oss.nxp.com>
To: Lukasz Majewski <lukma@nabladev.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: freescale: Add device tree definition
 for Cloos CBASE with i.MX8MM
Message-ID: <avX5MUUBTFN2RkNz@SMW015318>
References: <20261112163703.3358164-1-lukma@nabladev.com>
 <20261112163703.3358164-3-lukma@nabladev.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261112163703.3358164-3-lukma@nabladev.com>
X-ClientProxiedBy: DU2PR04CA0188.eurprd04.prod.outlook.com
 (2603:10a6:10:28d::13) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|MIWPR04MB558776:EE_
X-MS-Office365-Filtering-Correlation-Id: c7ad410e-1f4a-44f7-f559-08df40e38d71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|19092799006|23010399003|376014|7416014|18002099003|22082099003|4143699003|10067099003|11063799006|261026121527099003|56012099006|261022113327099003|261022075727099003;
X-Microsoft-Antispam-Message-Info: oabJ7LVLTRFaNeW1bUsEsaMhAvT2QVv/63Mq/OMS8+lM18cK7Ng2Hg6B3Ey0JFGISPUdWFkaa1S7WJJRirY0Dq7Iu3ubysNu7XObnO0nH4jvY5yIoLmyazAya6j1OAbt+BXlq+oHeKvnQJPY6yCQfC3m2z8guQtu1zCXTH5agtjlB5Tv6APLqA56kqDYZR5HQNheUyeGG9c6hOTbkOJy7JU8D/KEoYpDdZ3SSdA4aVCo8ScDSh2lbVd0xvrvqU9bHUMlP6QFnLfYWtSpcOD4N+c/X38L+fBS4Ax2uhRLHhx45JD48jc2qt2bC2c9dAqGHlHsZ958dXGZlIAa7L3j+oz4W6wVCB8Ws3PkDluItb+NzwdsmheNV7Ny9YRDcJBzB7MjGCPcnVEPCqmP+31q/8OvEDMd+Escs1JkirNnshkSPYikEIRtLQ8gcrqMd+mx7iku972xwmtm1PmioZdtAF38oNX4aM4qdjIEyEoGhzVX8oUMnDkdjIpG+xQVW6agnljrfzjSnvrdEVY8nLIKeVFwtAISu89bHkEyztHwUtw8yDE0x0tRDElOCW5g1KQlVWBtBGkLDVa19Tf1y8nqgbLnwYVyf8IxFDrzqjCvFrowAwUdZU4h2xz4uNAXT8GAvrrLY1su0E5cKmEx+fLnzzdOuf6k2Hj4SpY2bku1Bso=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(23010399003)(376014)(7416014)(18002099003)(22082099003)(4143699003)(10067099003)(11063799006)(261026121527099003)(56012099006)(261022113327099003)(261022075727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?f7jaP8mGoI21pTUe7J45vqwaBYLVTKVra6J3JnHzU/bYuieYJf5onINo8K5F?=
 =?us-ascii?Q?ujrLCIjKe+Yli/EDKxbNUIwR3sE1PrhURkI4JO8BDOtz1AET+sJz5kwzIXMF?=
 =?us-ascii?Q?1WW2QIZatvdjPxlah3u1QTUitxmNoUKEoD85t5t2Lt9FpGmK1hTV2tSfB95j?=
 =?us-ascii?Q?HPrzgRX82FJymC1a/2sOhI/EwrqnHgwBcw2LmL+AeK+xVVwBzYNURjRZX591?=
 =?us-ascii?Q?Mqb3URC02Tj+Q5MO5ElYa54RvYFU1BhR/9nLirI01+HHv8QWiob8NEj1U495?=
 =?us-ascii?Q?FXDcLDyKaDyhfZqlGPLS/98+ZZtjEi4prwZQDELCFNyT4vH5V/HztqiaQYnh?=
 =?us-ascii?Q?pSLi+ihMXoLpTr/kGp8i7NQ8/z8BN1TuLYGLDi8X209mTdJtWPNuRa4T/eIW?=
 =?us-ascii?Q?NQX+ZllvdngZvINzBPwy4v2b8OHh4YwIuJm70UgpA3Wf5SZyiLd6VJNKS0I/?=
 =?us-ascii?Q?8i4au8lKAKIKRlrtYOTFDTIsu6mPS5MTaZiQUOWWuRLZVOxipc78vlFGX3Jg?=
 =?us-ascii?Q?tV/3VFpwvlMMDq0W9pXtpL66efldqnJpmNvDKxTHM5sVgZyo/sIWxbNY2iuh?=
 =?us-ascii?Q?MxAl8unik3E2Xm0Nff35TKGTBxx4781TnAj/aNsi/gdBPNd9c/w6YZ2dlZP6?=
 =?us-ascii?Q?cTBtzckuK4tbQb+bcVaR9zKVk4qMrb6uvcRi9+PolpHgUiXrNR94kRmcNaNC?=
 =?us-ascii?Q?ttxTJZiqSF2p0QxaW5nO2oSo9ABLK/Xi2dzdNQ2hGSj1Ti+SlFDb34aReP3I?=
 =?us-ascii?Q?/Rc/0nB3OVvcEL3KHdzVn0rh9Z6R5WQUn/G7qBGD4ohrhUep1DA6h9LYace7?=
 =?us-ascii?Q?7LOau2F3hUpRpDWRKETsZoi9Polw/2l74RodspJRaPkeI+O79tm/eKaSannb?=
 =?us-ascii?Q?Bgfg6UylLu36ukg8bLD5bkm+wp2zcmklHILnQ6aAkVx6M2e2QA0d5JLECivF?=
 =?us-ascii?Q?pjmdStsSJFJxGfL6XO7fMd5g5GFmuZzE4ZovBg4NgNEuf2IlZatkCdDy/Wjd?=
 =?us-ascii?Q?NEMT1+k6u9WfTG6s7HvvHctaCV4V5g/h/Lj9gn+Gmo71WdVstkwefMpxjhus?=
 =?us-ascii?Q?tgadWqdaitIJxUBtRTF4jRiYqjFdoiOGZ35pibQJ06Nno1KS7P38fWegv4x2?=
 =?us-ascii?Q?F+1MUKZ8sAiACH+y1EFR9fK09/B3/QycPJ1iWTozZIaYGbojDseXxv/bXbCx?=
 =?us-ascii?Q?CT0Z8LpzgsDg6xiJOjgeJNuSG/yMCo4ew6eu0yclavEEreHEVzJiLoZPVzy7?=
 =?us-ascii?Q?MHEImXjTToK7bWJQY4jCPZKPFpYs4DNLNea28LiClPoXlTBp+1X7QFdDuAl/?=
 =?us-ascii?Q?gto8lS3z0RRgTUD/HoAuJaekVshvJCnTMf+Q3KZ0xwaBx+WGCwFhTWUb7PI8?=
 =?us-ascii?Q?FyUqRnd991nRq4/SNOt/Qa1RfrjpjLleMgdaTEdqG1TJf6qWjstIOhjoL7fj?=
 =?us-ascii?Q?9OX8t9lDbTl4ZpuMxivAPh70LPSmayBxlY1vDFkwGR6/wJ44o3d8c96lpasA?=
 =?us-ascii?Q?rof2OwtXVHCCOmsey1DrjpuSegJJnmqQ0TY/3iU7cBqRthEum1XA5h0Px+i8?=
 =?us-ascii?Q?KEAzO/cjBGPj0UIHYCQc+oaAfUHnHyr3kUBGzAaVefmX+UJKTO+ykmrvFXtT?=
 =?us-ascii?Q?feaP6z8B2KLo8Wy+WWq+DAOlDAbLE0c3DLPsowwkPeeCRCG0ub7JAJfbph4l?=
 =?us-ascii?Q?KwdkYfJzo68b7+fF2M7No+hUtbsgPHjEN8vGpiqa7GHNQm3st42WkHG7rDN6?=
 =?us-ascii?Q?HJN212D8k3sS0c/dLHHeJIcJFZ9LeS0fNwbNvDDCMoMpSt+/LzcH?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7ad410e-1f4a-44f7-f559-08df40e38d71
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 17:36:58.6800
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AsaXWp0FB/u2O+QxmRRO8OJ4etTBXOsid9rXks9GMiNQFvJLTd5pefbE1bCcsXYQYYXr1L5WbRvf5Y4Idq5/5fac58Uv4Eu4MlnCXcdX3anjK4dLI7N4JCSlTuGvppug
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MIWPR04MB558776
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_093703_451861_C1319F1E 
X-CRM114-Status: GOOD (  12.12  )
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 12, 2026 at 05:37:03PM +0100, Lukasz Majewski wrote:

subject:
	arm64: dts: imx8mm: Add Cloos CBASE support
>
> This commit adds support for CBASE board, which incorporates the TQMa8MQML
> module.

Don't use word "this commit",

just

Add support for CBASE board ...

>
> Signed-off-by: Lukasz Majewski <lukma@nabladev.com>
> ---

...

> +
> +                               port@9 {
> +                                       reg = <9>;
> +                                       label = "lan-sfp1";
> +                                       phy-mode = "sgmii";
> +                                       sfp = <&sfp_top>;
> +                                       managed = "in-band-status";
> +                               };
> +
> +                               port@a {
> +                                       reg = <10>;

use hex value to match port@a

Frank

