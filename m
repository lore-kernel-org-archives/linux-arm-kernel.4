Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85212606A8A4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 13:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CjwzmXCn;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=FX7//Z9V
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=TOhd2DGyfbzEcyPfJLv2ArPaIC0IT0GOTKhX6G6NIJk=; b=CjwzmXCnQ5tp2NlezZijJ8s25D
	gKtj64uG3yl464nQ8lMrUWIT40dV10jL1I0Z9ZLBW2k9DER3zPPGJQKaKRmTH9xZt7uVh4LZk2ZGC
	t/Fx2R8KzKsPDCGc28ZTzHEdn+A1LHcfG40T0GjUJBzAVYcPxwckZ31CeOuCIjz+lloS3pF7+ya6c
	M08LRv1JOs5mdg1vLW859cEag30WvMo5Xebv4M9gIeRRf4h4og5u2geVvadlN8H4DN11boc5QVG/S
	Xt2zfZC9IT1JolaoOqQy5RfoLXUX9hLIDSHRsQccIQT5hNpdK87UFp5BbKAUFgVUXCn9PMx+MbT5P
	35vL+bKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR8bB-00000006qkO-31mo;
	Wed, 11 Nov 2026 13:42:49 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR8b8-00000006qie-0YCO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 13:42:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mlZpPLMfZwhMoFCM2Isiv5d/4TKk5DqYycA99vqA3cRfeXZWc2dlBpEGCwhjl6LHlwnvhfpbYB1zRegJltylFsF/zgLFms2Y3dqGYBRmMYwrAe1LXcfJjDBwRihJGId8I5/YNAJccmEC8xChbZAUu3ncwRZCOEKlFMQzrBrj9fZgih6Y7YceeNUQemYI3PirIFjUtA42DFYcIlE41g71TDx0RiVC2KqgBbSTu8DNBpXuu878jHztMO6V5NNfad0rl49/l+UXDSM9G2K67XRF7pKEH//BmXYsFLoM8igTH9r2LYX4l3PoxG/g+jUBHuThrF0xXusaJR/wN2zUd4CjHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TOhd2DGyfbzEcyPfJLv2ArPaIC0IT0GOTKhX6G6NIJk=;
 b=Ybq0OirDxz02f5scp1KkscNCAJC2+iQ9JJJBScFF8JbKYqPPY0/yiTl0s/jeOCiLhRzhsWTlASMnkVsJUhPSLMLKVNYMARJ8hSEi1gx0IZcnYWanyTyAq3y2j8LkCyAUdafU1tmC9664Mk6jcKtDOE5MnpFNeFu79w2LlCPEMH+l9zVBqt+zXYRXHTGaH+TppZe/FT16zwLFhtFBY0PMoSU/l8EDXJWpVD1fi80jdmavi6ZaKnufZh9gxOkrSCpgGH7J92uJHvQH7Jb06Q7q/wC8quhtBZChvf2jwtoumgd3XNVlRO6iAy88z4ZQBTSzoyGlHehIpg6ARIt+nBfUVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TOhd2DGyfbzEcyPfJLv2ArPaIC0IT0GOTKhX6G6NIJk=;
 b=FX7//Z9VOvoF5zI47H0ZVBDPRi2QIFMBNl5vob+m0HI2wB5GuDRBmVxLbbK9K1gjzr09yjmQ9xp7SxCx4Qbrp7tT8aQbGmUAbynBLzODK8KHdf2FZbfeb9YycMTjzlsdPdubNB1s/LKotD5BMjjnAeAgPMioNy1k1GQHUXbR6muUoWOAzdNWwRa5Y8YH8UJFUb1oN99v4houq/4o6IqI0V4CUtHYvQiHhtRimJuz3lU9xt5XjTHctg1vJrFB8J2YQn46AFbh2+o4r+hjwjou5vrYInpanHR/KCI7UCaBlHmlxEzrguDpWbjgKe5bC6AovRAU2+slSakuAMsFZYHQnQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by CPHPR04MB721690.eurprd04.prod.outlook.com (2603:10a6:380:104::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Wed, 11 Nov
 2026 13:42:42 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%5]) with mapi id 15.21.0615.007; Wed, 11 Nov 2026
 13:42:42 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 11 Nov 2026 21:47:29 +0800
Subject: [PATCH v5 1/7] dmaengine: fsl-edma: unregister channels before
 vchan cleanup
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261111-edma-iommu-v3-v5-1-2537cebe6ca2@nxp.com>
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
X-ClientProxiedBy: SI2P153CA0006.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::22) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|CPHPR04MB721690:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d9abd33-323e-49ba-9f03-08df3ff9a90a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|23010399003|19092799006|921020|260925021911599003|260925021311599003|260925022911599003|10067099003|11063799006|261009223027099003|261022105027099003|261021123027099003|261021121427099003|261102123227099003|56012099006|261026140227099003|261028144727099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: IpMNDQIUGe6jWoVqUrDI9dK1p2aCecKogadIl7xoMzwJy6zjxdlJIOvYGEFcbbW+PjeA7qO6Qmum0clDm6UIDlnWzwqsAsnVIfYDGnx+Vot3ZSHiZT8/J5PsGILo1sXf1B0CDi7I3pzG6ODed3UpuE6DnaedF1YMl5C/OnoxhnyUwPnbjkpPPJ17PPVnDfdMJV+WSgRgPBo8rjH1ntE1qUgqV7B41G8a3nzaaU1UWCUC6SLsaVbAohNGFBqWLUPvgqu+IbssxCBFagD3WzpSZTw4A1UiyHR+h62KvRRlM2lBixGB1UQB3coB46s24XTkDQ7vEmDxX2xwAVEwQSdha/0J7+jc8SUtO5/taJ857adJa19WcICMtAM8eVFfpOzKmVRMNQTpoDCTNETgihu6HRpcqHHPoirmuvjlssyKDGDb8f4oyTjD8qFwWwiRY6HYsGsEScF79oaWlqM3pI4xzMzmm9a8lSBMxoAmPeUEBv+Hg5VLMxEryJohTzBni5NMs70WOyQMHqpQj60mqOA6jvKzjDY37xy3J4CaLQtojzTZ+/vgJLGWZ4IlpNsxzIlEr/OLk1EVJ5uch5qwrcvKq7MmIQpdZviGk7R5kpvNjzPXKDaiO/YisV/Io/ytlb/LLNuYuPL2/S6N3xo2ornehlBnGLfdwId/XWdet4XIPerJUNHTR2hpgyVbNTAi5adDa5bl55JizVx4tsp+tK5R5w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(23010399003)(19092799006)(921020)(260925021911599003)(260925021311599003)(260925022911599003)(10067099003)(11063799006)(261009223027099003)(261022105027099003)(261021123027099003)(261021121427099003)(261102123227099003)(56012099006)(261026140227099003)(261028144727099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z2JOTndaYjg3Y0FKMjFKVXFkcmpjcTNtdHJlSnNNSUVHLy9kTHozSWZyd2p1?=
 =?utf-8?B?L1RXODhPTnFrTGJvalJXZHNNUjdlOHJnaS9QMFZhMG5NQVFmV0ZaaVN2RHVk?=
 =?utf-8?B?dlI3Ylp0aldPb0hxN0wvYnRyTXJIdzNIS1IrcmZoV3JCMDF1VUloWG0ySjh4?=
 =?utf-8?B?UGpDemdlSGM2cFAxaXV0YUNkMjhQZEwranJUUFFGcjBleVg2blVuZHR0QWN1?=
 =?utf-8?B?WEtqU1czTGFEQ0k2ZzArM0Z6MWwycG9KWEZ5QXdNeXlJRE9sT2IvN2VDREpq?=
 =?utf-8?B?MHVuR21NTnJFTGJvQk5Ib3ZVZ1BLRzVEbGhYeFZZZHVrdEVHNU5VdTlLODVq?=
 =?utf-8?B?RGF0RjNpdmpONU1qVUFOdGlYTy9UNUVWRTdDYkxEbjV3VEJYMngwMmtxRGgy?=
 =?utf-8?B?NUNWMTR2UEJyeGgvTnU2QldLbVhXRDlmWUVwdE9udG9SNHNIZUk0Mk5HNW5Z?=
 =?utf-8?B?SnZGWWd0ZFkvY1lRTmw1S2NFQnd2OCtDOUpIUlM3T1BNTE9HNklpK2hGSnRW?=
 =?utf-8?B?VFVQYTFtT01Ua0tPNEdkeFAvUGNtdGc2Yi9nazJqYi94WlAvTzhQTGFsWnQz?=
 =?utf-8?B?YlFqN3hLQ3AxVEgxR2FFSVFOWStVRStDeVlhbGRSZjJDT3RTZFVabkViZFN6?=
 =?utf-8?B?OWZxb2RmeEhiZHl0NUUwRHNVZDNxWFZtSlpNQkdxamhwelVzeWw4Q0NxUTI2?=
 =?utf-8?B?eXQybG5aaHFQVlBhaE1QWkZZQUlMTzdSZDJsdHlWT3VlN2dOT1Mzbi9pbVpJ?=
 =?utf-8?B?RUVFU09BVWtoSm00TEZ5K1g4MHFZaVBJc0RuQ0lycXFkN3U5QkN6TW5JM0w0?=
 =?utf-8?B?bC9Jb2Y0aEE5Ty80YVdaZkZJUlc0SjA3UEJhcWtCZStWOUJTcjFXOUU4T1E2?=
 =?utf-8?B?T2oxMDY5WXJRZHpuVEtsMDMvZThoYkZBU3FTRjBBME95RlgwTW1tUVFUMVl6?=
 =?utf-8?B?dlJaSnd4dXhTSmpwYjFDeWZWdDRQM3lvcjJackJVbjhMMitjUzNnSzZsQjZG?=
 =?utf-8?B?TTBIT2owRVl1VmF2dTFlR2FwMmlwNSs3WHBIcGFEUThYZWRrdW83Mi93Z3Mz?=
 =?utf-8?B?VFdNc2dzS2wzbDhBdFF1SndwQjBuNlM4UWsrQkJ3U2UraHN2RVFFVW13cDA2?=
 =?utf-8?B?N0FxejBrMEcwYmhZNW5hVTVJb0lUTW1EZ0EwT0xpTmdFbVprRlllTmU0Ukh4?=
 =?utf-8?B?QWJGRjlhY1JpTy9QTTNBSWNPYW83dDhWNTV5Y05wSEp6cWtHK3NIUlczNG5J?=
 =?utf-8?B?NHB6MWdubjNMSGljTnN5cG9VeE9Gc29xTnJiQjNZT0JrMFpWTVZQb2xwRllN?=
 =?utf-8?B?YlplNFErY0VldWVEMG9aSTJZUm9jK01uWTlPMVdyUVZldkJkaTYrR0piS09W?=
 =?utf-8?B?ajlhL3dIV3I4OHNnbWQ0Tm9ZWjhRbW9zSTkwVzFPWGxQejVlYjBmWVo3cE4z?=
 =?utf-8?B?YnJPeU9udzc1VkNWMTRWVDZaNjkxbFJwSlR0dzQ4UkFuQ1hvVUFUK2Q3TFdj?=
 =?utf-8?B?bGx0bWdjUUwzZ3BBdHJsWTVjN2I3N25zYVNMQkJMTUNBRWlNdHQ2MTZtQlNZ?=
 =?utf-8?B?SEJUMzArLytERGFkb3hoOWlKcHdhNDJuQWFQYjVwcHpleGhqYzZYMnIzYmVI?=
 =?utf-8?B?eWpacTQrdUl5Q3E5dDdDQWhKSi9pWmVuT0g4RzBKTnNHeitWZXZ6eFExelB1?=
 =?utf-8?B?dVNNWDU4bUx5STlreTRSOW5vYUZmNFhQSXdxU096QTBCL1NsU2hha0JCVmlX?=
 =?utf-8?B?Q3NHZmYwKzRKbUpFZU9ud0xxOGFPSmRvU0JUWDE4TzluZXE0VXk1aU1rcUlr?=
 =?utf-8?B?dXVMMGp2ZmNJOStIbVNBS2tMajcvcDZtMzNxMlBhR0txWVA5b1ZtemczNnpz?=
 =?utf-8?B?eGEvTGhiakc2Z0ZITURhQ25ON25raXNWLy9lb04zZ2VOV3htMzNLUGZJZkgw?=
 =?utf-8?B?YmRvOG9nMCtjYngzd1VhT1BsUnF5eGhWTXRSN3JhRXV3L3NMR25DT0pEbk9r?=
 =?utf-8?B?bDFJTVcvQmd6QStmVkdvTEpjd0FvbjMvU1Z0WmtUcVg2UEJlb1VDYjBtOEZ4?=
 =?utf-8?B?ampRS0huNVZoTlZLWnZ4Njg2d2ZSRHBlRnhGVzkrazdxMVQ2R2F3MGU4WFFN?=
 =?utf-8?B?dk85ay9vaDZNRkVtR1lHL0ppN1JKdm0wYWxmWW9mRjl5NFpZcEdhM1hSMVdn?=
 =?utf-8?B?UEVuZ0ZWMVYyVkN4SVR6N1U1Vm03L3B3RWd3RHZmemMwWVc5OFYvZWJWcnBm?=
 =?utf-8?B?ZkRKZXFlNS8zeTl4NEc4c1RzdXRvWkRTYlp5cldPZkI3NkVrQWpMSENzQ3hW?=
 =?utf-8?B?VUpkT25yZnlQbzNNbElUenNtWm9WdEZMVmJrUjdJYU9SUXRPN2M4K05VLy9E?=
 =?utf-8?Q?2L+2Gk2lcaReK/P57SSdT30HFbv/iL08YV5ex?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d9abd33-323e-49ba-9f03-08df3ff9a90a
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 13:42:42.6393
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: brvqJEwOBVlZnHQTkyraPCYbgwK/Q24Z8bwCM5EybsQR0o+Wd4i6ck88BacQ839FGcEvDIp1Zz3TYLHFCa10WWmMzrGpmI+ThZ7mBIvq85AlPUgQDzA+dlBwOY9AZObV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CPHPR04MB721690
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_054246_206948_CB5F0B36 
X-CRM114-Status: GOOD (  14.32  )
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

From: Peng Fan <peng.fan@nxp.com>

Since commit 4035726a6b72 ("dmaengine: fsl-edma: Use managed API
dmaenginem_async_device_register()"), dma_async_device_unregister() runs
as a devres action after fsl_edma_remove(). However, fsl_edma_remove()
still calls fsl_edma_cleanup_vchan() first, which removes every channel
from dma_dev.channels.  When the devres action later runs,
dma_async_device_unregister() sees an empty channel list and never
unregisters the channel devices. They remain visible in /sys/class/dma.

Keep the vchan cleanup, but register it as a devres action before
dmaenginem_async_device_register(). Devres actions run in reverse
order, so the DMA channels are unregistered first and the vchan list is
cleaned up afterwards. Remove the premature cleanup call from
fsl_edma_remove().

Fixes: 4035726a6b72 ("dmaengine: fsl-edma: Use managed API dmaenginem_async_device_register()")
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/dma/fsl-edma-main.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/fsl-edma-main.c b/drivers/dma/fsl-edma-main.c
index da5139911488..7f82dcb7831d 100644
--- a/drivers/dma/fsl-edma-main.c
+++ b/drivers/dma/fsl-edma-main.c
@@ -31,6 +31,11 @@ static void fsl_edma_synchronize(struct dma_chan *chan)
 	vchan_synchronize(&fsl_chan->vchan);
 }
 
+static void fsl_edma_cleanup_vchan_action(void *data)
+{
+	fsl_edma_cleanup_vchan(data);
+}
+
 static irqreturn_t fsl_edma_tx_handler(int irq, void *dev_id)
 {
 	struct fsl_edma_engine *fsl_edma = dev_id;
@@ -881,6 +886,12 @@ static int fsl_edma_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, fsl_edma);
 
+	ret = devm_add_action_or_reset(&pdev->dev,
+				       fsl_edma_cleanup_vchan_action,
+				       &fsl_edma->dma_dev);
+	if (ret)
+		return ret;
+
 	ret = dmaenginem_async_device_register(&fsl_edma->dma_dev);
 	if (ret)
 		return dev_err_probe(&pdev->dev, ret,
@@ -905,7 +916,6 @@ static void fsl_edma_remove(struct platform_device *pdev)
 	struct fsl_edma_engine *fsl_edma = platform_get_drvdata(pdev);
 
 	fsl_edma_irq_exit(pdev, fsl_edma);
-	fsl_edma_cleanup_vchan(&fsl_edma->dma_dev);
 }
 
 static int fsl_edma_suspend_late(struct device *dev)

-- 
2.34.1


