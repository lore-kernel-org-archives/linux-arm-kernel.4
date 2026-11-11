Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8F80606A8B9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 13:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oe/Ib+J5;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=pdhA8e1V
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=m8ym+UYmvT8FDZT03gE/yrhsKKedLQtj9TsIenPnNdM=; b=oe/Ib+J51tnpaNTjNnB2dazsGu
	+B2x9/wjs90R5rlltkiMhyRu0JH+Qhs6uqYSUe1IhJOYZTa3cDvfQg72Q7uYBkAERnWBFAmXXs+Do
	nf7h/2W1SiohAqg4myynKJYtgCgUQq49Jj8Zh7EMFVwrpFFnoQP+d6oukEoTJHzipwgJzWtmLWre4
	Qe1M8ExApxtn09NsyoW52dBs2m356+DWvj6OUB6qLGHpdVN1lCeb6GSGkhvtoj+rFAG3AL9xy8/77
	pS8lh+YxImiQxruzZOZd26YuNL6cqtLmHCeiGknP+gMUnckUzXF4QnSqBBuz5h2PS6GrQEBF1gd6F
	4d2X6H0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR8bX-00000006r0h-2rn4;
	Wed, 11 Nov 2026 13:43:11 +0000
Received: from mail-francecentralazon11013043.outbound.protection.outlook.com ([40.107.162.43] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR8bV-00000006qwr-1atU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 13:43:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lyl5au4DsKKwDZ1k99TwkTdOOeQE6e1Bf0fIymQUTjDruC71bIi5hJ/ysOkf1XLUu1rf9a+GtcnBOtN4S9FkM9knSCl+PVtMLnOD1Ur4w3giI++NRD6nyqgVhPLTU/NKU0YTTBJjA1Zx/fSZhOvu6tzI4LkXyRlQbqVSu7pmcwcpfJu417Ch65xrRXNJGnbXN4rVTGrx+yaBHHEiHFEKsJkkVRmiRX2UY4EwpMlkZZ4a4jzJD4MeVFqDCZx5UdI4hNlJRtm/MtcrQhAJF7XlFqDEwR4hF99gfn7GABqpDjbSipSgeafyeTSxogLTRydnTTMN0VTWvPWnPfrjppx27Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m8ym+UYmvT8FDZT03gE/yrhsKKedLQtj9TsIenPnNdM=;
 b=kwxpCn80sNZ4CcC9YZiX5ff5WmX8CEv/0ePH4RAupzlO6IldWROUqxX4tLZEd5deDe3FBpNWvgYQPPtzHaQjw3kHcc9g11NYZTlr1WtEwB95pIZXlKsp3/g+DnF72e4i6lrYH0tnF3qZVJihJJlxjReX7/9a7eidTttHyWtvHfmli/Y5/CipcZo43YIKK+clZNYjMCAksTji+cw1le+D+g5q+vAyHPZf7qoKiCniYff23G0spi5Wa28VtpcvylIMYvRxvlas/muNHzwIct1wVldo4z2gGjVtHgafI2Otr1cCT3He2CJkjZO/xXkv0wN8q09yiYtVD2CNeWyLpE4X9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m8ym+UYmvT8FDZT03gE/yrhsKKedLQtj9TsIenPnNdM=;
 b=pdhA8e1VCvgNAIUN5RoArxm5jSR5J2kUaYiLfWjLAppQrAQWcVyHMNOk1vSOhdBnwImff/gI7BCgOWfBKahTaAjwKa+XldyE9ysjFhesm7DQPvqA/mXNeP1EWgeIrZi/6sAgW0sX9uJ6avxusvzj65I/ZBjl40f3oLkPu6oSIu1ljl7kjwA7D/dvd+j8Iqhuu8InkJW43T7mQJONtJyF+Pw6bisZPupH+w4yUMO4mAbjEUCpM4uvDH+1FtCIBXFDdQw4eXCzHpGLXlek3EPIVwcaJs2lnmg6w/J7RLFa050iYDxjoh7GMOIAqVMnlSj1Z6a2NLbG94E5R2087R/cSQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by CPHPR04MB721690.eurprd04.prod.outlook.com (2603:10a6:380:104::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Wed, 11 Nov
 2026 13:43:05 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%5]) with mapi id 15.21.0615.007; Wed, 11 Nov 2026
 13:43:05 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 11 Nov 2026 21:47:33 +0800
Subject: [PATCH v5 5/7] dt-bindings: dma: fsl,edma: add per-channel child
 node support
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261111-edma-iommu-v3-v5-5-2537cebe6ca2@nxp.com>
References: <20261111-edma-iommu-v3-v5-0-2537cebe6ca2@nxp.com>
In-Reply-To: <20261111-edma-iommu-v3-v5-0-2537cebe6ca2@nxp.com>
To: Frank Li <Frank.Li@nxp.com>, Vinod Koul <vkoul@kernel.org>, 
 "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Laxman Dewangan <ldewangan@nvidia.com>, 
 Jon Hunter <jonathanh@nvidia.com>, 
 Thierry Reding <thierry.reding@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Frank Li <Frank.Li@kernel.org>, 
 Larisa IIeana Grigore <larisa.grigore@nxp.com>, imx@lists.linux.dev, 
 dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 iommu@lists.linux.dev, linux-tegra@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.16-dev-7bc12
X-ClientProxiedBy: SI2PR06CA0012.apcprd06.prod.outlook.com
 (2603:1096:4:186::13) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|CPHPR04MB721690:EE_
X-MS-Office365-Filtering-Correlation-Id: aa7de42d-7896-4ee2-a8ac-08df3ff9b6b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|23010399003|19092799006|921020|10067099003|11063799006|261009223027099003|261022105027099003|261021123027099003|261021121427099003|261102123227099003|56012099006|261026140227099003|261026121527099003|261028144727099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: gR3sePMhVt9f7JSoXSxOepltYbTMvlhCW7t/bQFaRHOeH54f+9r330XFsZFwOnzl4ojUM0w/tvvgI4b+DwGe1d6s1ggfp5mqowqJKqaey8vEUPIy1A7kdEzRjEuTq2ZyqntKab4tTOLJoo/oiS5SIwp/UUZd3JvNIpLNkqqLNy1rDQEe3SxHwGGV7dYDhZeliTBIflRmYHVhGnMk2m6Ml/qWJuTeZ33mNoW1MQqrBrNMN/xMwkJvzdsvSItzYZyPcHqPBPqrjuqoofg7Ev4iPsbysxoayTDdLX/I2HJL4ed0FZo+nSooBELVHvEzFiPN7z2Dva9lwaNT4VSpLrDPF6q7o8k5ZJH5mwESOb3BVEumfBokmAMZqKa5sS5N4GseFTAuMvPpmvQZSeYCFcKhHq6n8u2JaT0bFwGJ7v041oauafxSHalfup8OHKBw8GC4PHsbqbxyyJiNv3ulB5szmDc86A0T/uzwNqQY6SEUqalw7V7zU5FFeaMFoSGN0dFYkcMuTa80A9fkUPaYlmmiGDBaNhipdaIx7HgtRn5LwIRhaoxdwO/GkbZCXtR7kTHJGyF3bpIuXsy1QWpy9M+AhmMu5QFoigeLI36UPbA+0+z8BH/gJne8pFzXYnquMUx47GIuc89rU2DWsLdnCPYOraP+aWulzfs1TaCQBgTFPRjXrwLdHsMGiQfYN3kJvtQN0RU7VIpu/ZhginfLWObk/Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(23010399003)(19092799006)(921020)(10067099003)(11063799006)(261009223027099003)(261022105027099003)(261021123027099003)(261021121427099003)(261102123227099003)(56012099006)(261026140227099003)(261026121527099003)(261028144727099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N0xjUE4xZHo0NkxWemRYRHl6bzgvU21sNWlha1NmUFJaeVhPS0FSNUMxVlVp?=
 =?utf-8?B?NWhPM045WnhyN1NTY3FkNUpTNFFMU3p0WlJsdlI2b21QZ2ZoVnovYkY2UVcv?=
 =?utf-8?B?cmZIQUlUdkk0aHRNVmZQMlAxdlRHenY5dnJXd1hnRm9YVDJSRzZ0QjNTU3Rj?=
 =?utf-8?B?SnFVbEhaNjdGeERIRk1zQ1Z2ejc0ODBNUGNRejNQL09Eci9wNG81dVFURlNR?=
 =?utf-8?B?OHRkOVdUNWsyR3A4Ulp3c1N1V0VvUWpQaGtlK0tXcXhlU3NuVk51V2llbUpV?=
 =?utf-8?B?YTN3QmNqQllCUTIyQ1FlNjVyUXBiem96bTlPdjdvbW9rZlppUnNMWEVsa05Y?=
 =?utf-8?B?RjcrcjduUk0yL2FiMm5jWWxhMWRFUzhJYlZheGYyOU9aY2NiNTB3UitTNVRH?=
 =?utf-8?B?YUkrZ1ZlaEFOTFdJQUdkWUszVUZ1SlFSaW5raXhMeEFDWXhmcHNCZW9ndDls?=
 =?utf-8?B?bFhCSEZvUHkveU1RRGVYeWhiV2s2c0JwRU9yT0Ezak85ZGZJRzVpSmtlMGZz?=
 =?utf-8?B?WmZuU3BWRWF1cVJZVkJCUGZGNnFkaEx0R0FDTlhWNlFlNGpyQk1HT253TFlT?=
 =?utf-8?B?VDU3bThmR00xMnp3KzJNaklLNjFmN0xSYXAxMGJsSEYyQVFsT2tnTVdudEc4?=
 =?utf-8?B?cjFQR2xwd0E4MjIvY1pNSmpiSFVMK1duSFViSCtWdjZ2dmF1OHNEcko4UFdk?=
 =?utf-8?B?Y1VnYXQxOVJzYnlEMXgzVjM3Uk03aHNieTNCZ0JDMW9HTDJPbHVBYmh4aUgx?=
 =?utf-8?B?NnFKZ0RiT3RxQkRWRGlaMUdZOVJHakxKQ0NsUnpORlpDU3UxZGtCU1hmVWtx?=
 =?utf-8?B?NzBMMUhrb29BWWQ0aHJ6aVoyaU5NV1JnU3JDYnFkdUtFQWxyRkdlSGZYTUJI?=
 =?utf-8?B?NGxGRE9LK3B6R0hCR1BQVHVpc1AxOUxpK3h4dCtlQVRmcEUxNkN3UDJrUUZW?=
 =?utf-8?B?eXZyMEpsM05uTnBMOVU3ZnlrNDJ1RzlKd3pzakpPSGdoN211TXltUE5zZlBY?=
 =?utf-8?B?SzkxVHJZVXZwWlNvZzVaODFSQXVnOXQ1R201M0tlWWNVRjZwbXBKWTl0b3ZK?=
 =?utf-8?B?NkJXeUo1QWpvUTM1R0d6OWtPWnRDcDVYdm1qQTVLVnVYNWZDRDlIczRRNGFi?=
 =?utf-8?B?Rmppa2owSHpBcUF2RG9WeFRCT1dOUkR1VkRvYTFlOHNwNlRCSzZ0b0hpTWJU?=
 =?utf-8?B?M0NuanZ0ZDFWb1o0YlBpa0RxQkJPV2txZ3hTbnAwNTh6RzMzTThtTzNvVmNX?=
 =?utf-8?B?V09rQ3dGYUFIdVNWS2NQNXh1NjJBMU9Ya2htWVNMMzFMNk4xTHAyV3V2S3dI?=
 =?utf-8?B?Z29MdHZPSTVwdU9XRWZJWnE0cWVla0tCWG1QUjdLd2wrZHFnVk5zdzJacXF4?=
 =?utf-8?B?VmJCMlJzNmJpREtGNlYvekw5VVY3dmgxUmgwNG9QTnNRMUlpVFFxZ3grcFVX?=
 =?utf-8?B?MnJDZ2xNai82NmhlTlozY1lzWXg1S2Uzd3NTdFpsaUNlaENKd1NWVUYvcDJS?=
 =?utf-8?B?b0VTN0dlNVNoMVFaM3V3bWJvRkp3N2YrWmxzV1Vzbk5NTzZJZDlLbDh4aFpQ?=
 =?utf-8?B?SEJUSkZDbFY0a3k4aHpwdjN2YmdpZVpYVkErY2ViL29YdVA3UGJSdldtQ3hu?=
 =?utf-8?B?bC8vV0JsNjdlSU5HcFNTNWRUWGFXTHB1QmdYcVNkRExYQUs0ZDZ2cGNjOHIy?=
 =?utf-8?B?TjBHNUV3Vy9wcDBSa0g3NE9sSVBJSHppTG4zSFNud3Y5VkZHTEtWQ1E0Mmdu?=
 =?utf-8?B?TGZPUkJHNEVWMmN2SW90M0puWDJSK1ZQMmhKdXhzZjlWenZySnc0cU91NWhO?=
 =?utf-8?B?ZnlsV3paY1VybUhiZmtKdGlBdjZON1pKU1VaMjN4MnIrVkFCSkIrM24xNUxX?=
 =?utf-8?B?eTcrVlNqcDlHZzVTbisyU2wrTDVvVXFDUmdaS0ZRUnFZc0hXdUlGZnVBbTNo?=
 =?utf-8?B?Q21YNTlZVkRSODNqeUsyRy9SQm9lMGVqY1Q4cWN0N0t4RTZTeXZpZUhLRUE3?=
 =?utf-8?B?TkNZUnB2cmRzQmY2NEJmUVIxbStyZXdJZllISjVWQmlNWFRhQ2Z4VkpJSGhY?=
 =?utf-8?B?TEh6cTZCUGFkcUhWanRiRFFoc2tFWHdJVVZvbGI3Y25mVWZDQ1RIbmRiUm1F?=
 =?utf-8?B?YVhuTytiZU1ieno1a0JqcXVQMWtpRGRkeHV2N2k0THVubm44QjZnU3Mrd3VN?=
 =?utf-8?B?NXZkbUVCK1ZLNFBLbDRrSTh5RlluaERZNXg1YiswTW41Y25mYytzbjdCTG4v?=
 =?utf-8?B?L3ZBVW9JSnRtRmxpU28xK0NqOE42aS9Ia2VDdVJyM3pnSHZhQmRXdkJUM0ZS?=
 =?utf-8?B?YmNXRjVDU2hVTFB2LzFQOTI1akNoZ1JvNUlKREQ3bTVjOUN0bGVXUlZSQ0lW?=
 =?utf-8?Q?O9C3l3EksQ6FKCeu8oOBLoXEVz1hkns29uzXL?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa7de42d-7896-4ee2-a8ac-08df3ff9b6b2
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 13:43:05.6017
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VgSuU6gmqJI6swpT9SGgCbvcpiXb4DUa4Y4x1v9MkZRjy6O8OTqukjAe9pB8fY8UOsVnsTtSfOXy3pYkYPgrCTeq4lhnh8TJFX7M6i0BcziHmxP/LeB/6+3Lus/oyXo2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CPHPR04MB721690
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_054309_433614_C806AF4E 
X-CRM114-Status: GOOD (  10.53  )
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

From: Peng Fan <peng.fan@nxp.com>

Add support for optional per-channel child nodes (dma-channel@<addr>)
to the fsl,edma binding. Each child node can carry its own reg,
interrupts, iommus, and power-domains properties, describing a real
per-channel MMIO region.

Enables per-channel IOMMU stream ID assignment via the standard
iommus property on each child.

The interrupts property is removed from the required list since
channels with child nodes carry their own interrupts. Existing DTS
without child nodes remains valid.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 .../devicetree/bindings/dma/fsl,edma.yaml          | 70 +++++++++++++++++++++-
 1 file changed, 69 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/dma/fsl,edma.yaml b/Documentation/devicetree/bindings/dma/fsl,edma.yaml
index 0260d177c7d0..65877e78330a 100644
--- a/Documentation/devicetree/bindings/dma/fsl,edma.yaml
+++ b/Documentation/devicetree/bindings/dma/fsl,edma.yaml
@@ -104,11 +104,40 @@ properties:
       Bit semantics: 0 means channel available, 1 means channel unavailable
     default: 0
 
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+  ranges: true
+
+patternProperties:
+  "^dma-channel@[0-9a-f]+$":
+    type: object
+    additionalProperties: false
+
+    properties:
+      reg:
+        maxItems: 1
+        description: Per-channel register region within the eDMA block.
+
+      interrupts:
+        maxItems: 1
+
+      iommus:
+        maxItems: 1
+
+      power-domains:
+        maxItems: 1
+
+    required:
+      - reg
+
 required:
   - "#dma-cells"
   - compatible
   - reg
-  - interrupts
   - dma-channels
 
 allOf:
@@ -351,3 +380,42 @@ examples:
                       <&pd IMX_SC_R_DMA_3_CH6>,
                       <&pd IMX_SC_R_DMA_3_CH7>;
     };
+
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    dma-controller@42000000 {
+      compatible = "fsl,imx95-edma5";
+      reg = <0x42000000 0x210000>;
+      #dma-cells = <3>;
+      #address-cells = <1>;
+      #size-cells = <1>;
+      ranges;
+      dma-channels = <64>;
+      clocks = <&clk 0>;
+      clock-names = "dma";
+
+      dma-channel@42020000 {
+        reg = <0x42020000 0x8000>;
+        interrupts = <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>;
+        iommus = <&smmu 0x30>;
+      };
+
+      dma-channel@42028000 {
+        reg = <0x42028000 0x8000>;
+        interrupts = <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>;
+        iommus = <&smmu 0x30>;
+      };
+
+      dma-channel@42030000 {
+        reg = <0x42030000 0x8000>;
+        interrupts = <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>;
+        iommus = <&smmu 0x31>;
+      };
+
+      dma-channel@42038000 {
+        reg = <0x42038000 0x8000>;
+        interrupts = <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>;
+        iommus = <&smmu 0x31>;
+      };
+    };

-- 
2.34.1


