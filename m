Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF43606A33D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 11:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HTN9jOtm;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=tjvJgrH1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=MH+jJx0S/TlXyHNMANVlg0yGdt5RL68DHqTU6/gp5RE=; b=HTN9jOtmtuhD9v31dJYVdG7udH
	oOh4C/lgUpc0wI+A1NN9/401bsnG8ZAgzdBcx5f0e8MKj7c1jNzDNDrePbR2bcoN4bVvnGXacIqNR
	z2r55W8VZI1ET08hkpw2MN4f909W/tNaOkILbt4ZDbkCgQbd3gr8nlVh1622O1R1rjBlRYP6gWAKi
	z7LPKoZsjXQCtb9XrkfU+M0Z0VmZDjrpN9chr5pKVtZ4+q3/mazMmO95AtM8CiM9sNF9eqtuAhrqo
	CrQgYr64JNJXK5BzVSG4z0RiOvHPKBvLCV4Mcf2t3shUr4xB324KC5mqMcnUY+sT0TGhIqQElzvSB
	WHiindhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUMR2-0000000EhRD-0gWS;
	Fri, 20 Nov 2026 11:05:40 +0000
Received: from mail-northeuropeazon11010055.outbound.protection.outlook.com ([52.101.84.55] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUMQp-0000000EhNM-49fq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 11:05:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=myS0xGsisCtkqd2jJqrDeKlGAyAl2NXujON8CGTQGAobVKkhJJIpsPZX7CmQjCA1rjBDN9kk51u5oAgKnMRSuENnqTX4ISZ2zKfRYz6CCgFtxhYklwgVQMIda2viQgXVH/qJCRnVDWwU2DXFkwdY5S6KjFCzb2yWiibG/mtcWZbSB3/1f1wUfW/3kv2aplTdk9O5elyfFb0WsVQLHlONesf5K2wPWpUCmcZOXRYsQGmnKK1pdYaGw8al2vUqN5BUAaowwSGWpkr6Y+A/XeAxm1VBUnRoMqbxHzqeeXkznKxtqzU0gDbOyU5rpRwBE7W9fEtzwyd8r34kHdhMw5Y6Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MH+jJx0S/TlXyHNMANVlg0yGdt5RL68DHqTU6/gp5RE=;
 b=HhMo5sTy9guuPBtZhxKGDJD/LrtIy+B9g3EVZT0BRxfs6AnwxNR48l+VW3pWK2yxYG3HmfafNiLkl91eCezpyq+MkQb9DY8A4s7kW5zBJDmssLaFus5qWI/6n2jlPsxKUi+L2Gd4/q79LWKkHc3OZDIiOE7GU2V0cWoaGkDPiIEbZ6gKmicGK4ahdp/cY2Ug9j5wa2M5n/ZAAO4aqsO6KIxhbFkTh5AfCqnCTsKAmy1GMaQERsD/xJx4B7WXc2ZgHamI5xNhvvBIJXYWcOdhdBSyrd/52Zz8BRXAJrYfE9VDBEAzKEfxww/8NmMuDRRgIroNQlmX0ZAW0awLmo7zww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MH+jJx0S/TlXyHNMANVlg0yGdt5RL68DHqTU6/gp5RE=;
 b=tjvJgrH1UEnXnXTFndVAw+P9CeoCNbVqbfkRo0+aozupP0MRQMvd/Lys7t+3VB+80SLhTQw4CdAx2kaJ4Tb+H0pXUpEHXEsyltK5fv8lvykGXSk/SLRr6LaPV6LT+Z5CjospFvEGQD/tDhADJqoQJPH3I7Fzx2K5bcDGk4dBtzbb/Rd0hfmkjqzpKoreRHQ2uqvr0puQS60EHdfBLj+l99zSwLrXtJh1r6bt8f85plSZ4uSJnmxODBSTlHshjRcFNyF/vNsxAVsI/S4NSLEGeW+tIS4UJHp0FfR2OdiYydFTxbiU87dvCQQqaKDsBRppOc2RA6dBaYK1gzGw/NMBIA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5807.eurprd04.prod.outlook.com (2603:10a6:803:ec::21)
 by MI9PR04MB482355.eurprd04.prod.outlook.com (2603:10a6:290:c0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Fri, 20 Nov
 2026 11:05:24 +0000
Received: from VI1PR04MB5807.eurprd04.prod.outlook.com
 ([fe80::3da4:2827:d637:37de]) by VI1PR04MB5807.eurprd04.prod.outlook.com
 ([fe80::3da4:2827:d637:37de%7]) with mapi id 15.21.0639.011; Fri, 20 Nov 2026
 11:05:24 +0000
From: Joy Zou <joy.zou@oss.nxp.com>
Date: Fri, 20 Nov 2026 19:09:48 +0800
Subject: [PATCH v2 1/3] dt-bindings: arm: fsl: add i.MX937 FRDM board
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-b4-imx937-frdm-v2-1-5e27ceec02df@oss.nxp.com>
References: <20261120-b4-imx937-frdm-v2-0-5e27ceec02df@oss.nxp.com>
In-Reply-To: <20261120-b4-imx937-frdm-v2-0-5e27ceec02df@oss.nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Ye Li <ye.li@nxp.com>, 
 Peng Fan <peng.fan@nxp.com>, Jacky Bai <ping.bai@nxp.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Joy Zou <joy.zou@oss.nxp.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: SI1PR02CA0018.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::7) To VI1PR04MB5807.eurprd04.prod.outlook.com
 (2603:10a6:803:ec::21)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5807:EE_|MI9PR04MB482355:EE_
X-MS-Office365-Filtering-Correlation-Id: c74d0608-cf42-449a-5d3a-08df46f62d47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|23010399003|7416014|376014|366016|1800799024|18002099003|22082099003|921020|11063799006|56012099006|261022105027099003|261026140227099003|261026121527099003|261022075727099003|261028144727099003|261102123227099003|261021121427099003|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info: VX1lZ69u+bAq1rX7fRnrIJWFREtF6FuhgiMPDSzYlsHa6GdDAgu7NusVKCAVOlgH/XIxSQ+8jxCxBYlPrR7xWHq/4Ddx7zFwLJ1mAIu6MOBNU+GisVHwpiUrQBKymQIo4yomdj3kbxlSOjUlpmEQIkhn+L0fsjPo+p4qJKSlkjYgdMgd4NS1WnJTFOhYfYC2IrsWLD9k0daBFqeaZFjY0D3dQsIprDFqzU1tQZIFFeDUgsCvf/Y8XoVmqpcWGRXlAX0qjcykZZ9xAW4T78XzLQ1/qEhvd7hxl7xAa3lOXmOSAhB5rsIw4TmWNFa6BYiXbexS7B5h0G/EUaOweExDGKu5QCNRF1JRqpktsxAmMXhCIb7IRWlnzTi2GmICVSUre5bEUC0wY7HcqZd3dpgR6SH8eMDBaWgNBiiMb+zfKD4npKNUh6k6wIu36zRpRO6nSkYKTHl3u+sGuntJVk08WDZumOIfRlmzTravH/O+mXZDyUG5lJeSFmA5hF4SaaL8rKGHcfWGg44vwPD2RDfC6/cwmPqaas6fw5CUPbgAWhPw2RzeNcvDsb1f1sTe9phW4CCiddpbwHneX7qIrIZUbif7a5StNV0ye6j4MVN7Zco8XEaHdBHbYeog5kH4WvbJX7H2asvZ/nHH+r6KXJ9nCDzSJE7te7WgC6yfRek7HeksNeRG8tyMZoq7/+Jv5hV6bb8ieyjl9Y7Hwu5oR9R3zA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5807.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(7416014)(376014)(366016)(1800799024)(18002099003)(22082099003)(921020)(11063799006)(56012099006)(261022105027099003)(261026140227099003)(261026121527099003)(261022075727099003)(261028144727099003)(261102123227099003)(261021121427099003)(261009223027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NHNZNEdKOXdhb3QxN2Rxejhpem9GeEhla3p5dFFFc1J0Ukg4OXZ2ZHg5amI2?=
 =?utf-8?B?cXppUnBqcEZYTHRRQWhreHIzOGZMakFyLzFmYjMyYkR2bVcrclhCbEk4YSs1?=
 =?utf-8?B?b295QXNmWVVONjN5U0s1dEJHVVFLdzFSY011eXZpZTlmWTcyWlF2UnNQRFNF?=
 =?utf-8?B?L1UyZnc1SUk5cXlVeWM3VDNqY0cwYWZoeDh1ZTNUQkpMSjJRMlJiZ2E3QkZn?=
 =?utf-8?B?YVN4aXVwOXVnVmhleEZReE1paWdYSXFaNFFNdkY3V3V0WWhPNUlmNkxhN2tx?=
 =?utf-8?B?ZFBsS0dQSG1oUU9YZFFPMG9nZ0UzM1p5ZlJRWFlLL2VjbzFDMzBYS3lDMXA2?=
 =?utf-8?B?dytqMVEzcnFVUlpFa0ZlNjN4NTRGMktDeHdoVmNrK2Y1V2ZJRmpMKzMrS1pE?=
 =?utf-8?B?SDdDcGw1RzU3clJkeXpQMVI5aTd4cmVXR3Rwb2l4Y0t3ZmNDZEVQcTFiUW1J?=
 =?utf-8?B?QUdqZmFGY3Vnck1mSXMrbVdqQnlmL2hRTGxldmlXem12TmVEK0h6SHJYS1Jl?=
 =?utf-8?B?c3VScWVHcGR6N0NWZi9FYzVPV3BVKzNzeGhnZ1I3Vm9CKzIxMWRjb2NBbEhj?=
 =?utf-8?B?Vy93cXM2N0Z4N1A5Q0VTUENqUkZrb051Y0czTUtBK3NjNkVoR2tqWkRmVDh5?=
 =?utf-8?B?TUc0WUpBVjE5ZjhHQTcxSUZtckFVSEtGb2syRmRsNFZYdWQ0aDNBYzZHclU1?=
 =?utf-8?B?RGxyRGJZaXd5YzdvdzJqSzNiNHFCZ3FQd1pqcitXOHpLU28valNiNEc2dThl?=
 =?utf-8?B?ZU1SUjVJajF5TUFMKy9wdXlYdE9XR25WZS8xcGNSTXVnQk1hWFNpRUI0L3ht?=
 =?utf-8?B?MnRsMXhRckxWWHBvT2NYZTUrd0g3Q0tKWGJlY0FtZXU2NlhmUVpYeURVMmxR?=
 =?utf-8?B?K012TFlPWkRVc0IvcjFBZ2NKa2t5blpJdm1VUTlXV0tQTVFSL0tNeHJ0U1VC?=
 =?utf-8?B?QXdQSVc2MUtaZUFQQjR2dlhWNkI5Z2pSS0pCeW5wUXVxNHJnT3lTTW1kS2R2?=
 =?utf-8?B?MjJmbXA1NFdtMCtzd1gxV3pYY0p2bXJ6N0NMbkx4NHBJS3BnUXRjMHRqZEZ6?=
 =?utf-8?B?cWRSQ0VpZEptbytBVzN3d2kwaVd2K1gzY2JvckpBcVViekJEOHR2cHlZVzBz?=
 =?utf-8?B?Mlh4cGJSRzhYRWtXV00zTW93UHVta1c0UnkxNDFhT2t6Y2EzZVlrLzBWQkhR?=
 =?utf-8?B?NTh0VnpCWEtTaUkyNGNyYXBXZm04ZW1PTTdHY3ViY1BObkhHM1JscGFHbjdO?=
 =?utf-8?B?WDJlMDBGcXlQV0tVVW14ODJaSlhWbjlJV212aHZxVDVzQUl0bWlWNGQ5V1dk?=
 =?utf-8?B?K0dDYklOZzNsK1U3ZktBWWduSlg4cUVZQ1krWGw3QjRodHQ3KyszVmFMQ1ly?=
 =?utf-8?B?YjJCZ1JiUjVJWlpROGxmRDQ2NGNIbzd5N3E0R01qSy94Mm5UWTZCNllIRWNz?=
 =?utf-8?B?K1R0eWdudUVEcVpjTlJOQ3E2OHk4ZjhaRytweUc0TmRFZlJvRkZGR3hJNFZN?=
 =?utf-8?B?K2RuTXhhZ0trTVVGa0NNTC9sY2JBRE5NWDlLSDBMZ1dpRkJ6RHNxRjJpbk9x?=
 =?utf-8?B?ekMyNkovR2F4VC9rYnZncTIzTDZOSkY3OFNFRklYWHkxR3V0b3p1R2h3dGRw?=
 =?utf-8?B?Vnl1VEVUdGNoRHhnSzNQYzZ5OHBhT1NkVzY5N3VvWkhNYnNWLytDUUhUVzJY?=
 =?utf-8?B?SEtKYTFYYXhLRUlCNkEvSWJiV2g3UDk0cVQvSUhUZVRVYXJSb056aXNNR0lJ?=
 =?utf-8?B?OW1NVXhOdWNsY0cwd1hqNUJ6cWp3S3dqWDhMVXU0K3pnbk8vQWl1ei9zN1dS?=
 =?utf-8?B?dHYzWUFPZEdlT0R4U0xHS1licE81UElFU3ZndWZxWTM5MUdTQWovbHhRSXZQ?=
 =?utf-8?B?YTd0ZnI1QlRydk4vOVErTWhqczZLYmVnNVFleWFMM1BYVi9hZS91N3dFOCt5?=
 =?utf-8?B?Y21nM09NLzE5VGIya3NQT1FqbDZhRmtDVzhxRzEwcHhpNnlNYUxRM3RsRnNn?=
 =?utf-8?B?NUZWYklzcUgvRGt3TndQK1B4K3hqRnRscmMrMG9XdC9zd1VuTGtTaVJOcFZD?=
 =?utf-8?B?K09zeU9BOXQrREZHWmhEd2d6RzlOV2t3ckpueEdrVSt2YWpIN093MXMwZ2pX?=
 =?utf-8?B?SHQ5QW9ZbUtrVG5Qck9ZWXNnd0tpRE5Nc2t4ZHhHWXhHODZHSmxMclNmd3ln?=
 =?utf-8?B?ZG5KNUh4OWM3NjAyYU1HNWd3M1VSeFNIb1hGZXpTL1U3MW9OdHZNRGQrc2kz?=
 =?utf-8?B?cFFHV3dobUQ4RlVPcHBKQTA0R21VMDhGV21pN1BZSWFKNFpzQ2UyclNESGRj?=
 =?utf-8?B?TUttTmpMby81UDJCNHFhWDYvM2ZROXY4d295eUZhN2hjTTN5bGdpQks4djll?=
 =?utf-8?Q?xHy6LlLvrQrZne9T0/QdMSUlV4muqUHXWXqGK?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c74d0608-cf42-449a-5d3a-08df46f62d47
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5807.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 11:05:24.6859
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rDIcGAukzCFr4ISxEHRrj5fLtEzXoj1HAnW/nWzLr1wc+eCrJFQToUlhUPyh7Q/G3Cpi9nmAiABimu0RADNQkjHuFiUHA//KWdQAiuHof8dqN449O+TBntIYRHQtnhxr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MI9PR04MB482355
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_030532_926334_2E657F9B 
X-CRM114-Status: UNSURE (   8.82  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
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

Add DT compatible string for NXP i.MX937 FRDM board.

Most software on the i.MX937 is compatible with the i.MX952
including SCMI and pinctrl.

Add the fsl,imx952-frdm compatible string to reuse the existing
support and avoid code duplication.

Signed-off-by: Joy Zou <joy.zou@oss.nxp.com>
---
Changes in v2:
1. add description explaining why the i.MX952 compatible string is included.
2. remove document for imx952-frdm compatible string.
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 00930fb49b63..b67d4504c34e 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1572,6 +1572,13 @@ properties:
           - const: toradex,osm-imx93
           - const: fsl,imx93
 
+      - description: i.MX937 based Boards
+        items:
+          - enum:
+              - fsl,imx937-frdm           # i.MX937 FRDM Board
+          - const: fsl,imx937
+          - const: fsl,imx952
+
       - description: i.MX94 based Boards
         items:
           - enum:

-- 
2.34.1


