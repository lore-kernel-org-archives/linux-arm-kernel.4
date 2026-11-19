Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 909FD606A326
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 21:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lSlJifu9;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=VC8rqK5N
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=2vOw6pF/TOptoWHp7RkxJ7Gy34k1skiJUcizHtL/1iU=; b=lSlJifu9yf+7F0RXq/Jw421vN/
	kAC9Qzj8itUDVc91YLiEUr4VznkKv88kbkQpEGSPJhFh3wOUBkUAHiHgdCw1aITtjX3R9wGw6Kt9C
	/nLcV9IqEklVz22EjlTVgyCbSYeyJScGSpv5ZvzkhWvFvEeHd9tcrxTziDJ2xGf5uLiono8jBjzMX
	obkyZ6UWlQoFyc6Va9aWB5WW3FvYvd/pwBJxH+G8Rm9mSVOeBp4Op/a6A2FhY2xj/3DAlex/UiZMF
	aFVDw0fGa3dE8B6Q54FK4dwMhvx78zpLN3nAXql0GuRjsmbJYGgcDzfPGm6tpZU0RDR/5CnRiaDj/
	ar1qx4qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUA0H-0000000DVin-0wVJ;
	Thu, 19 Nov 2026 21:49:13 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUA0E-0000000DVi9-49l1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 21:49:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=raKUU8udugoBt+wiuVtvlnRSKxI//WOnbwLcga8P/NADIfCmdJo4ZUfqm0m2xdsXhNJSvNk5wvvWwNceRth4urCmf8PS6/HYqxrE2hKW6ek/MCyfn9U8OTB5tARDUsVGyS3Pq7lyrPsvaU8uUOQ2+p0gBxspdiNrosCGYpTssZ0Wr5Ff+BDfcr5BGAyamFAQKnjXpi+9/803DoyteRPWP1i6Vy5z3n2amVtNa+r60tjqA+wOiUwia8LH027yPCD9ub5cpso/jE5WTcrkV0ubmWxuzVOk6bZ4BJGjcnbAVTpOFhK3VOB5+2Zn5yhXdgEgc14suiCPvBuYruVjUmhCMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2vOw6pF/TOptoWHp7RkxJ7Gy34k1skiJUcizHtL/1iU=;
 b=j+Twq1O3X+fRqMBfoxWKRR6803tnHWA7nez2UZSU4azi8nLcBuA28ufWAolXdWA91N6PljNtn9TO7n1XhgAhAviqld+V00Lr5hRB1n4FTIB2QCeStTPPeK76ADSbXGEAT8d51pAuhXmEREeHtf4cXc5Ku+CL7udf4GvLxufcO8uO9onrcUjrlYWQfu0C8Hk/DKRj4SZATSZUrqv9u3RccD+9DBYUqVg62C34ugQv8GQecn5MWRnKY912WOQTqno5XdSXyYgOzwWKCxczuIwTGdiPJ8gc977ij6VdET+1g3JseXISEek60ADXcuLaIRtvKWyQRNU/twmJHULNq0uAnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2vOw6pF/TOptoWHp7RkxJ7Gy34k1skiJUcizHtL/1iU=;
 b=VC8rqK5NS2lx4r2YY+dFhLDKyIx0hWsOkRhrIway3X9zglWZH5aLODY5RG8Q5zAgzlt2okg/WjCOe7Fa9rg9P0xFCGhvpuw8joSyclhF/gomdOyABUrQ9uAdubI9mLZPb5wNR1zhFNOZB5J7WkhNXdLtpt5X4n77UmCLMc2Q13rtRP7GLjfVd/zJFuJLmHTSQkhgf6G4FDVnLIHG8TbT5wBxGe61reO+kQBryObTY6ljtsgD1wE2agA167DAGVj7Jol6korCHnYWMAixxqhsuknRdksQ07trC5uXiPmtbnDEMo1C2ZhJPF8ShQYg2KCp/GG/HSdHddbdiK/VPNXXPg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by GVXPR04MB10588.eurprd04.prod.outlook.com (2603:10a6:150:21a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Thu, 19 Nov
 2026 21:49:04 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0639.010; Thu, 19 Nov 2026
 21:49:04 +0000
From: Frank.Li@oss.nxp.com
To: linux-arm-kernel@lists.infradead.org,
	Marek Vasut <marex@nabladev.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Aswath Govindraju <a-govindraju@ti.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-can@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 1/2] dt-bindings: arm: fsl: Document Data Modul i.MX95 eDM SBC
Date: Thu, 19 Nov 2026 16:48:55 -0500
Message-ID: <179512483160.1917481.11561106751476748634.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261114001844.30606-1-marex@nabladev.com>
References: <20261114001844.30606-1-marex@nabladev.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH8P222CA0006.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:2d7::22) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|GVXPR04MB10588:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d94dff8-0a9d-4c4c-772a-08df4686edb1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|19092799006|366016|376014|23010399003|18002099003|22082099003|261009223027099003|56012099006|11063799006|261026121527099003|261022075727099003|10067099003;
X-Microsoft-Antispam-Message-Info: NdfSfsJ/Cn5hc7L0g1ZjjJi1hA2Osf/QPYbEaz5+ypWlvmGUpD/4GvhE1cbGB75JsiMmACCT9H6vDXY5DKTGbj+0rrr7///c0HeKYH3GynEYjhAU0oPTAO5scsiGQC7nF8MvaMatEL+CrFuNSheAzLO4h4tIVsFeW4TJqtFdFv9ZFTbdacZNPR3Xk4IZ4E7br/eVa6iet4DkNMdSjgGP4rtRttasd62cgBJOURr8+RsHKPE5sN4n5ysiDc4LjoL/varAYdQziDLbbmb+dVbifpm1sYlmRZnTMbsigQz50FYTX5frTlIljKdSXDat0F2rlnhODG9XO+y0OScGJshB8gCAZdSwJMRehfr/5f6sX6KOLE9lXOO5N3mI8IjePsgLF5MisiYlA9hGRPeuKxfz0oqO8K8OdtYfZKc8nhN/tJHj34Kokj0CKsVb5K6smqTSFBRhiWUgI57ub6N7Bc8s2DGE8Q/KVX2eMZB7gyOMD7Zbk5dc8vAUq1H1U2lBFLOkh4Ut7idsg/er89zd9Nb7SVRM1AD8t2r3eMR7bB77Mh/M9yT/08iEPDm5P0Wc6CbbIp+GkUpOFmf3SOzO9Fsicr/+WggUE/pD0NS1YnfLQQJuVirnJI6mevEnZprW2NYwNC6NAoFQSuIhKnWB1oet1cQOHf8m/bQPd5H4hdruGik=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(19092799006)(366016)(376014)(23010399003)(18002099003)(22082099003)(261009223027099003)(56012099006)(11063799006)(261026121527099003)(261022075727099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UGltekpUODl5ZmZESXV4S2FDaFZ0U001NEx6dFIvM2V6dG9hSzZrdFhWakVH?=
 =?utf-8?B?NWx5ZEN1R0dxZUk2YnM0OFdmUEl3czhBMTkvdHVNU0xVNzBlYkNicFBCd2pw?=
 =?utf-8?B?R2pNd0lobEVXWDRJME4xcjVLV0VQWkl2T245anZycnNON0RWM2lrb2RKY0tq?=
 =?utf-8?B?NUlvbzBUV3pzYmpXeXpBSEhROWwwM1RKa2hVT0hIQlJOQzFxWGZ1Rngrbkh6?=
 =?utf-8?B?Vkt4WXBWaTFwWHV3VHhlcHFVYWNxUVpjQitkWVUwb3dzTGpkU1hrS2JaYzJO?=
 =?utf-8?B?VDBSU3ZQY2FBTnVGLyttZTVIcXBLZmlDV20zeFUyQUNjVVdiKyt2dUdBeHY3?=
 =?utf-8?B?aWxEeXh1TUhwaEQxQlBxUFBBTGVIamFDYjRUOU5iYjR4NVpxNlQwT1haaVEx?=
 =?utf-8?B?VnE2VXdMVFh5cGF0anB3R0IzTTIvL0lLdUZpWC83Y1hYMEpiSUhMMWlkUWdI?=
 =?utf-8?B?Zkx2K0VsdzgxL29sOG0rUWxJRGdsdTk0OXlyOTUxbFBNR1RYV1krZERXVmlx?=
 =?utf-8?B?cG9OeCt1VDJXM3k4TlplQVFUTVJRYUtFS29UOXhvTCsrY0ozM2pic3lUbEl3?=
 =?utf-8?B?M2kxQlA1eU5nc0kxcnBITEkvOVE1SUVybHl2OW1NaFQ4em1kdHROYXNJWFdG?=
 =?utf-8?B?V0RianZqd2s5K0Y5dkZ5SXR6NDUyRFVLUllJOTZ1Z0MzbVB4bVdzRVhjUXcv?=
 =?utf-8?B?VDdQKzdtYWVmM2FLS0VsU0h4N2lWMFY2U3FhMm1hMjNSdnJaMlFVbk8yL2tx?=
 =?utf-8?B?ZmliUnZjU01oRXFVeW5KMmxHQ2pVY1dGN2szN3Rjd1pVNmthTFRaV3FCSWVG?=
 =?utf-8?B?cEhlRytKb0xrY1NDcUFtVU9MT1krbFZybTFGSUdMc252OVBEaFhtQ1pHR212?=
 =?utf-8?B?bjJraUhiTEFYaHhKRUg3cm1DYk85NFc2OGhEMXdqN3FKSk9SU3BpRHYxMFEy?=
 =?utf-8?B?QTlNb0hiSXNENDN0VWJqVHA2eHFrYmFDdVF3YkJ1d0tmSmJwR1BPbmoxaEdo?=
 =?utf-8?B?akFSbGlXb1R2aXBtTEkyd1U4c0xvcWRMbElxVDBXWVl2VG5RQ1U2Mzc0c1Nk?=
 =?utf-8?B?OUlNdnJINDZFZlVzY1RsbFZDbFB2KzlHaDhrWExVVE5oMTVmempDV3dtTVdr?=
 =?utf-8?B?K2F0ZWYzdDJwL0JsZ251bU9RNXNVYldKbVlqTkY1QTlwQURIQ3dPYWVyRWRJ?=
 =?utf-8?B?KzRiYW5rQTE4dU96TTV1clhROVMvRStVcklDMkJ6TUdVdzZnTG1oVFljNmtr?=
 =?utf-8?B?K1d5Nkt0QlluTnB4YVpKVUdKV05IdDlOK2ZRb05IMFRlcnlHcDA1bmlNZVRj?=
 =?utf-8?B?dXk1dHB1ZVY2VkE0RjMrdHllYUJrUHVuOXBUMEhteU5KQzFuS0Fwd3NsaWNQ?=
 =?utf-8?B?L3dabzNRdmZsVFhzT3pHSXdBYzZrbnhTRFJPc3c3R0pIdEQ1MGNoNzk0ZVBU?=
 =?utf-8?B?aWkwdVMrWUVvdTBEZ0thNCt1anRoWHFldEhMYjY2U1NvZUNRNUdubVQwWXZJ?=
 =?utf-8?B?RFc1dUNHeUd5VExXVXlYdlFVM0RFYjJ2YU8vTWY0aTdvSExzNzVYVlBiV1g2?=
 =?utf-8?B?YzNhMjZ6eVRsRWtuODUyOVBvaG5MMXkyZzNOaXdER2FHRHZjTVd3MzZNc0hK?=
 =?utf-8?B?dHAxdGJJdytTZXpUUFliSXJ1UWF2N0FpMXM2YS9HVFc5Y2RNM1k2S1U4S0Z1?=
 =?utf-8?B?TzBjSHhNYjJCZEUyNm83L0lkN1NZN3JOTUFPYXhZUWNlR3Z1cER0OEhHUXNt?=
 =?utf-8?B?bjFES3dsTE5vMlQ5Y1lqUjVxRUd5T1NUalFrNEFSemtqK1RrN0wxZk9ZN2Rm?=
 =?utf-8?B?QWlSS1JBb29hMHNrUy9KeUw4VDNERGNYQWppNWFjZENsV2xQZUd3TU4rQndz?=
 =?utf-8?B?bVRjT09KaHViOVE1VVlVOHhXNlUrZUVObndqaGlEY1VOTElYSVJ3NkY2VTNQ?=
 =?utf-8?B?b1RReW4reDZIa1pHMGFzWVRLZVZWYloxL2RkNkdrZCtDNFlFNHlYZWNuNCtl?=
 =?utf-8?B?UmxUTEFSYWFtUy80VCtJdXE4cVRLTFNzOHQwMGZSYTdoZVRobHh0ZnZIYWtD?=
 =?utf-8?B?eng0ZUpSL2pYdkExQS82Ri9SQytmRkN5aU9COGMwTjJvRU5yc0ZBRHV4eWxD?=
 =?utf-8?B?NjZPdUVkbWxHeUsrMlBMQmRPOVFHSVhjSTBTSGdVRkxBeUV5WGZjbk1IMktw?=
 =?utf-8?B?TXBqcndvWGdCaUlVaExUQmJFaEVMQ2tsNUZoampxaGVqWDkzMnZpR3Q3OW1G?=
 =?utf-8?B?a25UdVFYNy9scDNVNHZHTjJpeEhoK2xhMUNMME1rL3ZzdjNha3dzRmNoVlZL?=
 =?utf-8?B?SnZCUUI2RzAwZCtWMVRTSGVrY2RyRnpOZTdmVitvZUpybTZ3KzdvN0dESEMr?=
 =?utf-8?Q?l8YyQY6kTHwlMHSBeLLU6x515iyfJL7zG1+Op?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d94dff8-0a9d-4c4c-772a-08df4686edb1
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 21:49:03.8335
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hbcVgYeta/onx1dSHt7L/vz0tYb/sAsimnrrVmnHh6wcKe7JredVCN10wZ7U1OhU2Vlcq0asMohf6oaeDrJJ9cXhiSAqo8lLLHWsxh4G1ouWk7xlaevkSrm2QgXsPRhZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10588
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_134911_063688_E0A9F627 
X-CRM114-Status: UNSURE (   7.19  )
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


On Sat, 14 Nov 2026 01:18:25 +0100, Marek Vasut wrote:
> Document Data Modul i.MX95 eDM SBC board. This is an evaluation
> board for various custom display units. Currently supported are
> serial console, ethernet, eMMC, SD, SPI NOR, USB host and PCIe.

Applied, thanks!

[1/2] dt-bindings: arm: fsl: Document Data Modul i.MX95 eDM SBC
      commit: cf999fbdafefe98a1959f60e6dd5b047c1fe9714

[2/2] arm64: dts: imx95: Add support for Data Modul i.MX95 eDM SBC
      (no commit info)

Fix typo Modul

Best regards,
--
Frank Li <Frank.Li@nxp.com>

