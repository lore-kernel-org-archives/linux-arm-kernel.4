Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D45F4606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 20:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0YNQbL+B;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=Iw8k4ezL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=QTTuvjoKIUBlj0dyJPoMJnd6NfvNM/GnKS5JYpHZ9b0=; b=0YNQbL+Ba23JT9YpFOa6xop+qX
	eLrLmBjb+Ufoa1edieSc0LHj/vXPCuev+UR78TbSSdnJTlp57pN6TNrEUztQxE6UWYuEGHS7QLGRc
	5nGfISVUL4CJndzV3r8Igf3LEG72NgKzt+PoJMFOTy5IO4vtpaqt96xyT2nDoW+Jr7LN88DE1F01c
	dxNnPzKEziwmCPv+Q6uaEEkyzGIDIiEufqsYmQ63kC5MC+CN5WamNVaUcDHLfb+Ei3q++McUI+eXh
	z6CbQsDgtBFb14sabmDPNmYMIta5mFI0gasau/CGK7xDK4KLL0dk7kb3ULwIZlOQqz0+4Jo6MKggJ
	CB88veDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRFMD-00000007h7M-1BSs;
	Wed, 11 Nov 2026 20:55:49 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRFMB-00000007h72-0kI4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 20:55:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sDk6C7UGOmJuVIkyvERS61MdHa3T19toG4MBtBPnC2rAeiqwC8bFcBUyDABNqMvH8wzYD55tQ1flAGU+nLrKQb9wrRubv9wxEIzaGY22P4mdNwi5bySg7SgSF1+vKJcf5GmVPn2H9MXI9J+8xu1zGSLzeqHFrO/5TYMLCqOopIwVEA/NgfsXA9f5L5BV8aivUZZGmfaSIvlJaJGoIt6hIjAE55o5q5R5daAvlJ19H2YqXUHzDJAEoWddEGQl2fBEEH00sblT5j3ZHHuBZBzNGG9W6QFXIWbw6w7WyJL6FoEk+QO+MQ+x1CwikGiWclE4G0ABRnfR9cDAGb8GyQvxZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QTTuvjoKIUBlj0dyJPoMJnd6NfvNM/GnKS5JYpHZ9b0=;
 b=KwXQGw8frpYcj9nCdVTIxDnbuq9ke+qXSD/nYJVxOvdt+0NodFwk0Vv5KFF16c7gATSITSKFScDPuNW9PMlYlLFCGKFzk25lh4sMqC8v2KUGc2Vms6XhJPDOAga77Nlbu0xE4IrU8a5CQg7fSexQIuvcXYnOEvWJAYNyTaemg8xc2JkPM40f7Rk50A87Xuz1uTCMEMWD/7ted6vxctFL8HZLy9IRklycvG3V6JIHZVIzuaioqR2TXZ+ILf0PEz+HteH1jx7GS32TI9TpfSH2zive04Cd/KSJASd9sTYJpPAngySeZwO89L4LxsZk/oprbcGzXGVqtprE/7H4+mFAcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QTTuvjoKIUBlj0dyJPoMJnd6NfvNM/GnKS5JYpHZ9b0=;
 b=Iw8k4ezLq4PLJBbO5WYSMSXY3361LU9agKk0NEJsO6HtP+S1dHXr6qPRnt5h9MHAK4JDSL7XgSOJveeSR/3wmNGodxHE53mj12ojblgOitHvnVmV6ZWTDRbbVAtCJeA4DGfb+TOdqjTd3hx6TqQGGx5nOgnYDTy7uMzzphnHTcUbsP2mh3vZ1bW7r9tz3x2wHE3vQph5K3xMP/e9eqvEn4QzfcfAv9ZjMVYqKe7FxMQukd9mJl2CUWeyvqGLghNhp0R7JE1ERudm+qEvCi/kIz4KaYAOss8lpbAumBwrkyKnGl3b4Sx2n/C0WH87c6Hg5+sR3LijNmBL1npIlJFcyg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by PAWPR04MB11609.eurprd04.prod.outlook.com (2603:10a6:102:50d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Wed, 11 Nov
 2026 20:55:42 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0615.007; Wed, 11 Nov 2026
 20:55:42 +0000
From: Frank.Li@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Jan Remmet <j.remmet@phytec.de>
Cc: Frank Li <Frank.Li@nxp.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yannic Moog <y.moog@phytec.de>,
	Benjamin Hahn <B.Hahn@phytec.de>
Subject: Re: [PATCH 0/2] arm64: dts: imx8mp-phyboard-pollux: updates
Date: Wed, 11 Nov 2026 15:55:31 -0500
Message-ID: <179443050317.3956215.8234926322095404907.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106-wip-j-remmet-phytec-de-bspimx8m-4200_pollux_upstreaming-v1-0-aea3a86f3f57@phytec.de>
References: <20261106-wip-j-remmet-phytec-de-bspimx8m-4200_pollux_upstreaming-v1-0-aea3a86f3f57@phytec.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH8P222CA0029.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:2d7::7) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|PAWPR04MB11609:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fe36110-ab42-4d2b-09eb-08df4036263a
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|19092799006|7416014|376014|23010399003|18002099003|22082099003|261009223027099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: dFrY/fkqtbWonD+JyAaMlIxW8SSMoxn16iNELklhwgf+B95k24YbmPeKzxI9ZPvTu0AXtKC+9lfhIaVpvk+3AIT8CBJccUlmCDAmOXk7qLdLwpylQPpH67J1YSTEjhmYf7ZtKmHQvUAGpORjtArVjyeTx8Huq3UFv+ZlSJqKdb9LkqV7almDHuOPf7uFjHs/8KwKHeZRWplmQCssDcnbMFb1SH9vJ1w0zxDFLHdwUIWhT3F5AAf/PshAolWcIM2ifSxWcrN07KlZVeteLdmYftiXNaX48PnDqu2oHQ4QlW5i1zcRi6LQSBwg9QBBbYmpYgBg+3hVEW5Lb27xY8oZ7GUryWTfbjFtGmYIBBF/QhahQisTwkSSnTHJoq2jfQ3OkYPMfWJblDVl8OcK8qmkRDhq0ABN0i8L3F2AZjfzQEH2Jb/irvJ1o5pAh5GfSxfAWZw1SNu2stTggX6gVtB+f6Eqm4hq731kqfrIrTK1ERw6gzn02rAJi/0uljObZAb38Ka7pEchkL8RdRYDapcsD0qWXfOUTARqtuUPyGUeKe2Mag5PJb8F3eF/UCaZVEgIDQoxNdhgQ62Mt6HKalhgKgNcYFBw61bPMc7sweZiUF7E8TX20bIFzfRSfYVpYHmCMsXS6xypAdgCFOeIAOEl0NoPk8lZFLUGIRARmgNwCvw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(7416014)(376014)(23010399003)(18002099003)(22082099003)(261009223027099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RFp1VHNWUkMvM0ZFc25yL0FiVHQwWTZkZ2lhV0QvbHpNdVpMN0UweHBTbWxx?=
 =?utf-8?B?QnRwZmhJOHVneDl0ZWtvZ0VicmhGQjdhRGFWSHNTU0hWSGc5UnpDZnpqVTlB?=
 =?utf-8?B?QXlVMmMvWWhrcW94RFNMYnFtODFla1JUVnlRS0ZUUkF1SlNCOHZJdDRsa2V1?=
 =?utf-8?B?VjJlWEhJcWNkdnZ2M1FqaFNsbkJZTE1FZzVwbTM5SHVlSG9CTThBU25nZUMw?=
 =?utf-8?B?Y1lEQ1krT0w5NGVhYmRhTmVnWGZuSmlyclZ3amRFRUJ3c0JSUHBGMkl3RUFH?=
 =?utf-8?B?NG9xa3lmdG9NdkcrZWNzMU00N2U2K2hBdzIxZzRSd1FUNFBiNDU3RkRFZy8r?=
 =?utf-8?B?R3dhWktUblVQVlBmWTRBMEtydVkzVy9xcmVqNHh4R3VGRGcxNzZoQlNpOXRR?=
 =?utf-8?B?U1YwdUw2c3UrVWdPeFExOG93d0tpeGMzbzdYTHNvMHlXUEdWcjVOVWtWVGs1?=
 =?utf-8?B?cndPYlZhSTh6SlJYU0RoOUQ0WWlwcUY0NWh1S1I2eUxBTGdCb2phZGc2OWUy?=
 =?utf-8?B?RlAyaDB2UklHNDBzanZpZ01ZUzk4d3RUclRXVTNwQmFWR2U4aCsySVBueUZF?=
 =?utf-8?B?Z20wZVVQUHhiTHBBcHpuQzkyZWc2bE1RaGxLVTFOOUtZbXVEMjV2RmIyUXB6?=
 =?utf-8?B?U0QvSm9jaksxeGU4QlhRNGF0UWRtNkRkTTdqU0dBVDBHeXp0L2RXRmZoZGVs?=
 =?utf-8?B?VEFPSjVydG5SaEY0UUM1T3FFbWFWakMvVzVWNkZJWEh6RUdvcUErU05id2tR?=
 =?utf-8?B?QkNSczNoTko1U3RqcWVBVzhUSFJGemdCV2R4VW9mVEVQdzZ5Rno2RVdSVWRz?=
 =?utf-8?B?bU1aTjdkZU10R2VEdzVxcDhNM2VQWis2Q0x3d0hzRXdCUEdHYmNETGk2RVVE?=
 =?utf-8?B?V1poWVhnVlRkRmdUelpHbzFHTGgvY01OREhMTDhOczNtUzZqY3BmSDUyd0Ns?=
 =?utf-8?B?ZTh3dUpZM3RZdm1KVVVnVDBvRzNrNDBwVldHUHVIQkgyWmd5dExGUzR5ZlBj?=
 =?utf-8?B?M0NFSnAvZ29Za2pscStyN1hVMmJmaHZqTUJxYkdUM2E1L2NYd1VTYTQzY0hy?=
 =?utf-8?B?c2NHMHZENkhWaXJ4eXpONjNWWTI1RUErWFdiTlBXMGJxYnVvbEZnbzVMcjIx?=
 =?utf-8?B?cDFSSDltSk40cFFicDRMdmVyRkNSU0l6Y0pCTlRseXc2OFZnNmJLMjdLcjBG?=
 =?utf-8?B?TFVybk94QStQQ3luNmVBZ1JlUEdURi92b2dOZkZDeHorNGowNGhjVEVXaWQ4?=
 =?utf-8?B?OHpKbjRYb2VBRmNmd0w5cm5OeW5wTyttYlpqbGpwWG5SdnpWTEk1SXJRL011?=
 =?utf-8?B?S3MvSUlQMWxFcXNMTUx0b0lBd01ZLzRzRHZjcEZRbkVyZVQ1VWk1Z21BY1lv?=
 =?utf-8?B?YlRqUnF5S2pqdzh3SWJKcStkU1FySTRsRDRCVmdzNCs5UHlKNjlvN1kzSmlH?=
 =?utf-8?B?TVJVbXFiMlZTZGxnSWpZN24vVkk2R05Kc0xReUtQY2xvWmRNeDRiNEtMSlgw?=
 =?utf-8?B?RlVQRVVsbmJCbG5kQmJ2dTZUQnpRQzMyQkF4Q3VaSUYrd1Q1azVXSTVUaFJT?=
 =?utf-8?B?Q3prc2E2UUNMMjhjMTZ5QURWb0U0Z2l0OG9SNmVYL0ZiaGs0aCthcUE2ajQr?=
 =?utf-8?B?blFKOTJUak9XOW8yZ3R4KzJIZE9XOEZZWmowWXVkU0VpUXRzU0NTSUxBSWpi?=
 =?utf-8?B?NEowNmZZYlJiNVZudUpxZ0RrRTBUZXlWRG9jbzdETHF0ZTNPMUF3NkQrZjB4?=
 =?utf-8?B?WEt5NFgvM1VkSDljRG5UWENpUi91UkFaRjRjekN4VmFINmtvZFRrVjMrcFFn?=
 =?utf-8?B?eDJTeG9hSlQvMThOc2RUalppcEw1Qzdadmcrb0VwdStyY243eXJlaU5oMnVv?=
 =?utf-8?B?MFlhcTQwMkxHZmxwcEE1SGhBNVdUakhYb3BWMThPRXdjb3BKVEQ0NHB3cGc2?=
 =?utf-8?B?VnJxK1g5djJlVXhXZG05bkFGQ3dXSmdiODFkaytiWkV5bzkrRk5DU2ZVSVZI?=
 =?utf-8?B?dVZveTVHVStobkc3MWtPM1Y4UEc5c0psNmhOQ2V1Unh0NUVFRHBKTHNaM015?=
 =?utf-8?B?Q2JyZWpDY2pNaVJaWVM0UmR1RnFock0zR08vL3QySzZZcEpsUjc2TytON2x2?=
 =?utf-8?B?REM0M1labmRDZU9KZkgwNitqVFo2S2Q2QlIxYXFCS3l4UG02VEpCUmJ5TTBD?=
 =?utf-8?B?MkZ0cEx1NVowV3M4YTczMzI5TTVQQmxxSmtTd2sxVlh5Vnp5T2dteitmbVgr?=
 =?utf-8?B?WmwwTGZlUDBJSzVFQk1EbGNrY1VXMXRhdDRGNlR1T29MMEZCdmlNcUxiRUdN?=
 =?utf-8?B?K0tZZHpUQkpjKzY1U1JhMEw3RVBKdngvUG9xeGlLS1ptSW5JRS85aFRVeG1I?=
 =?utf-8?Q?esh8NF78c2SUijdivrnG0/rKtsDZZuYfB3ucQ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fe36110-ab42-4d2b-09eb-08df4036263a
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 20:55:42.4232
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nnym0XHDdt3MgfnQIUKdLs2BrF+cjPaXQchcY/51NoR9Bj5LXSBGPupNzwJW5O+2cPkQ0OYdLO7h7qogVbWWHHxTnfsBjHAHIpx838uDPH9jdpc7AwrPxwwgb2xERLLx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB11609
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_125547_248280_F4E4F1E9 
X-CRM114-Status: UNSURE (   7.00  )
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
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Frank Li <Frank.Li@nxp.com>


On Fri, 06 Nov 2026 15:08:02 +0100, Jan Remmet wrote:
> This serices collects some device tree fixes for
> PHYTEC phyCORE-i.MX8MP SoM based board

Applied, thanks!

[1/2] arm64: dts: imx8mp-phyboard-pollux: fix i2c3 gpios
      commit: 6364fbc937ed49fc92c46d9b38b7aefbbd597a89
[2/2] arm64: dts: imx8mp-phyboard-pollux: update gpio-line-names
      commit: 9f0ccfd5a8b32dab5c02b744dab96c220a2f9aa8

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>

