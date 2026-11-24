Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3199606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 17:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cv2mBjcW;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=NoHufx7k;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=JcinFEPs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=2nBOcYDVlBCq3k3GnRFRQzics4lAz6ltQQZsOzvjPgI=; b=cv2mBjcWamG9Aflcypc0+9ABIO
	KZJRSpxYkvwo9QKXilaAxu8i7gkqz4ctqOfXspS9gOZY4Rp0baYgAvsgvBsyz2aigfbFqga4RTrUY
	C66TiMZIgVmJaMVav8CRPS+QhxbpZUs6R4oAsYQGYTF2xgJWFIzpadj9481WVmQdXPQIIYygSXhyv
	v+HPJKRjr82PVt+VUcrWXbJK6sDFz8Dlswwe7RBED5VF9cjfSnHlbYDbLpbNqpaZMaKKzkfQEeTDA
	rGERXiK0ZaXURaJtaA9WPBZ3a/gnOpFjprqcY9x8EwsgW6XlXtZgk+4/pd5oN+sYx419RPnUibwI3
	ytdhQQnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVuOs-00000007NTZ-1bIk;
	Tue, 24 Nov 2026 17:33:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVuOq-00000007NSq-0jrt
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 24 Nov 2026 17:33:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=2nBOcYDVlBCq3k3GnRFRQzics4lAz6ltQQZsOzvjPgI=; b=NoHufx7kkFQs2gDP73cEevOOf2
	amYRCiXmVd2ZHRvc+Yv2almuSxgr+HpbwcfK13MuZbiwQOu072gxPIrKDRKctTebgcxVKPdquEcRD
	oCtm9g13NMADJ/28C7nnTv+iLlrXVALdtWFgSK5M7k+OqTFj0uq9bSyRpXJJNsfzAKjkfOsB2ldsp
	LipL8EJ2aAsvuT4sk2lEUX7DOFwxawRPWCHsyOKB7RgFgytjey3WbiOqtZx/hsHScR1LLNpD+aAav
	rASeL0q555yBsDLYqILkc6gEUrfB/NW0YtAGuR7K9RoZWHJr2Zl6ETeTx2Rid5gGtChiilp/sr/qc
	5DSnNiDQ==;
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVuOn-00000004Pqm-1OGl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 17:33:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rguT2zLA2TnWN3bTwxnR3ge4Olm9VmhN2ov/iTS4DDLC0x0EDlaIaynQfFPTx8f6h1CuDZ+TRRRrjJ0Xx3LadGtanbsFKyTVIvG/2/A+fDN3A4ocWtFjgYDo3KT8XP5dbJzg85psA3xg9yF9FOEQj4EfL4w4Py67utlAOP0GbBVt9NV8EXtS4sMrk8yO9a8bcqo8WxWF7LD2wcxDqf/Kc3DstDrNNQrIYRg0k3um4xQztE5wIirdQhC9YLIcKF38nou/FfGxr2Ba5fVhq20Rrr3DYaY8e+LFChD1zAsyMtZnjJ2PbXUuS+MW/PaK4Mv32ZWvGZMun2qR165XJads3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2nBOcYDVlBCq3k3GnRFRQzics4lAz6ltQQZsOzvjPgI=;
 b=gd6b/RG6g0yo/f3+Ag3mTBVCXlwb3N5nA8lQcpXzl4V0zuY0y/ifEM5T86rcVcA1OV8OoeR8ksYdutxcXr9yWQ8qCT0Iey3X18aEuRB8Ltthi0q7+h64a1s9ByenSzN30L+vCBTMoMIrxuM62q3drv82JC4sir9TQRElZgdvTwY5ddKRbVhxwrfsAs/qL8qVeeJu1GX7cPkUPSyVds26515d4RWKQwciRPGxKYoApqmOENdJoDpo2gSqgEM5tlLykD60W0ObtVWIRFqAFjHLkZ6nvAr7I4gKw62EUsZXI7ezneCzvje8m/EDWkB9EUGmSjuxUNBOdM2Emmk0ViCHZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2nBOcYDVlBCq3k3GnRFRQzics4lAz6ltQQZsOzvjPgI=;
 b=JcinFEPsNZ6BWZ+cayqii1M4xpxzLvW6wXGuV/C8KJOIV5tCyxRnu7HtBG7F1bmAA+GYYoHcIBaOa4SvTjZ9wuJc4MMp1sKaXvqJgWc18ChByIwTtyUyeS322r14IBGs3L6IVeTMYah+uz/8HAqn6xb8vX9g6qQ3F56LtOH+tHco1gh9aeQUk8b9/B/2OLE3BGCR+p2DM6NzkG3wZWPJQJ2V/DBvWRrBCe//MGjRzEXj3HT3oWbxK8yWHFwEIY21R6mFkAJjztJL5FXbyQPJ5Jd+/yc63PEbANbZ4BiwOgwfmSJsGBQ6kL3O3MxtcaPkUiY6YYK2bt/vdfLqYnP4ig==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AMBPR04MB12445.eurprd04.prod.outlook.com
 (2603:10a6:20b:75e::21) by AM8PR04MB7732.eurprd04.prod.outlook.com
 (2603:10a6:20b:237::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Tue, 24 Nov
 2026 17:33:39 +0000
Received: from AMBPR04MB12445.eurprd04.prod.outlook.com
 ([fe80::ba23:1fa4:ce58:ff06]) by AMBPR04MB12445.eurprd04.prod.outlook.com
 ([fe80::ba23:1fa4:ce58:ff06%3]) with mapi id 15.21.0639.012; Tue, 24 Nov 2026
 17:33:39 +0000
From: Frank.Li@oss.nxp.com
To: Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Leonardo Costa <leoreis.costa@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Leonardo Costa <leonardo.costa@toradex.com>
Subject: Re: [PATCH v2 0/6] arm64: dts: freescale: imx8mp-verdin: Add Toradex Capacitive Touch Display 10.1" LVDS V1 and V2
Date: Tue, 24 Nov 2026 12:33:32 -0500
Message-ID: <179554160079.743679.2171491534837812558.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261113-v2-arm-dts-freescale-imx8mp-verdin-add-lvds-displays-overlays-v2-0-59c45f0a0d8e@toradex.com>
References: <20261113-v2-arm-dts-freescale-imx8mp-verdin-add-lvds-displays-overlays-v2-0-59c45f0a0d8e@toradex.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CPBP307CA0019.DNKP307.PROD.OUTLOOK.COM (2603:10a6:380:2::7)
 To AMBPR04MB12445.eurprd04.prod.outlook.com (2603:10a6:20b:75e::21)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBPR04MB12445:EE_|AM8PR04MB7732:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a8d4c78-76dc-4c77-a0d7-08df4a511388
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|7416014|376014|1800799024|19092799006|10067099003|11063799006|260925022911599003|56012099006|260925021911599003|260925021311599003|261026121527099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: JcbiEYqh06Szi+5AZbp0pEY4MpIL06nfGacrXr2qHMNoHWtSXcvWJQAEC33nZSsq7EmrDP31724aLEP27gMWtZb4inY5H6sw2SRg6NC8Aj7Wjq3jdSoVoFIXaDcJEXkKlI2QjbDBgkRWO6Daurx51OKvJpPs77v553yya+KIy6SkHbIZ3WpGZzgPILI7VSKdyckFpoaLcvR6MuiTsGkJCUrOeUX2WKe98b5HgGSPxzyJuqFr3cfq1EvAYJFw3teXMd7tAb1QVi2qAgQBLj+gQvy9WiC5htyPZT2t1pSrc+IPSA3FyMouJS7fID8lCZKpLN2/RqGABH9dP6MrLmTN+YzkVUNnBSaylxLVMDVPQIE1j+bvMLfhKtLt0ai13Qvlz3/IUmGvBz4kJlJT/MdvbRawuOyAIsOMm2M0YoryY5mRHarH4h5h1QPywaddkurB7FrfDltuweGFY1NUBVirsRQAj40RdNBGCH1ypCamJdHlD76wAP8olWl2pou+0SaydCAZuPSmDuA7ihaW9C4EeZqxz4ts9skJngU6G8tWZZvNXnPYI6MXbfUqKUEoqGkxkzeBfdVdBHgLYrru2cf6sebNPhI5z8tMAXlz2BaPs1w/7pR6n1X4n9HHah2WsFjTNldpQoh8sGjqZMAsKkaHSmWFJ7a5b+1ZRXmcj9FYKeM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBPR04MB12445.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(7416014)(376014)(1800799024)(19092799006)(10067099003)(11063799006)(260925022911599003)(56012099006)(260925021911599003)(260925021311599003)(261026121527099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R2V3b2pyUWdTbVROb0FtS3JOUFlNVjZ0UWdkNVN1ZWVFZlBsVVVaN2NoMUVz?=
 =?utf-8?B?RnYyWjJSL3dpL0pDYzdOdlNsY0dOb012WjMvR24wRlBaRVpMekhjQ0xXUFpS?=
 =?utf-8?B?c0dDMUFJVUVrR3JHZEFyL3ViMnFKUGRUajRwdTZ1VHFybGRCaVRGbmgvQ0ZY?=
 =?utf-8?B?S2RJVmdyb3FZN0w3eGdEMWFKOXJzeDIrZlVRRW11bEh0WXBFcnBwcTllaHlU?=
 =?utf-8?B?RXVEVVA1V3gwdk4rVGtUV1lUc1ozc2xnbk5BcmpuRFp6SW9Ed051SWsrcGM4?=
 =?utf-8?B?b2NheDY3WnFsV3d4ZUpSYW8zZkEzOHJiQ0REOHVxWXc4bitRUkgzZ1NvN0ZD?=
 =?utf-8?B?M0hxRGZUNTlqNW5iZnBJVDAvTVBWdTdMQ21VWUhMOTV4VlZzdGpiUGYzTVZJ?=
 =?utf-8?B?TDhLZkF4bURPc3hsNjVvc1FkeXpWQ25MMXhqSHkraCt3YlJJaDlCcS9GNm41?=
 =?utf-8?B?ZUpkcWZKOTlIY2JTcUlidVk4Z1E1bldmbjJ4cm5DZnZ3bW9sZmdjbzlXMkg5?=
 =?utf-8?B?ZHBrNXVDR0xpL280Zk1SK0hndFFHWWRuQ3BvNEl6OTlpSzhiZDJ3MnV2cGJa?=
 =?utf-8?B?dUEvUVJvYWg3amhSbU1Wb3F1UGM5WEQydmt0WlhsakxqU1dtRk5abXBhNG5p?=
 =?utf-8?B?TjZZNzAzUmdHbE5iV0U3OVRFbHlsdExZeTNxdVVtUmU2TWFjS2FuNWJ5YzNo?=
 =?utf-8?B?eDRXK1dZQTMzSmJXeDdEN3BQdlhsS29zT2tQYVZtWitNM2w4dGJDMFhwNm1p?=
 =?utf-8?B?RG9EMzZkQlhXbmp2VDdqZFQ3NFBnR3ZPWDVJZWQxV3AveW5vZ1hZWnIxYUE4?=
 =?utf-8?B?RnhzTFFtQVEwMisvV3JscWpXWW83WHk2RFUyR0EzeFFDc1NTaDBsU0ZnQ0da?=
 =?utf-8?B?TVg5d2JiNGJhOSt2c0lsRFVXQ090alA2WFBqSmlTWG1QQ2dGT05iWFhNRU1F?=
 =?utf-8?B?VHdnUVNTa1l0U25rUEZhVGhlU2lnYVB0WEtSRHhZd3RoVjl2VmdpdzI1a3Jt?=
 =?utf-8?B?ckZycjFFMUh0R1d1TSt3MlVVL1RCckZPd1gzVis5ZGcrT2lSTnNMQURIN3c0?=
 =?utf-8?B?a1hNUnVLcDRBa0Y3dEU3MGFCVFJLb1hBc2l1VFRaOGM3dzlhVFdlS3h0NmJn?=
 =?utf-8?B?SThmMU1YMGtOMDNnTVVKUklYR2JnbzlGR1ZHZnJxejA0N1JKdTRJZFlmSjky?=
 =?utf-8?B?Tzlyc1psL2dhSURiZ09GQXNzTlArcTgwUGU1SEZmYmFnNk4xaklicFplQ1hI?=
 =?utf-8?B?dFp2a3RKclVYK053c29LbVFCbkZnSW5mQnJNSGw0djArWXVrQ2tDaktyc3Nm?=
 =?utf-8?B?TlRjTXZMSGhVanFocWFkWW12d1BhV2U1VFNQZ1RYUlhtK3c1eW9hRWpmem1r?=
 =?utf-8?B?bWxXN2kzOWtUU004dFd5NlVDUVRpMkFMakhzTUx0RGZtRDhLZWFsKzYvYmZ6?=
 =?utf-8?B?cERZaUU2UExpVDZXME1kWU9McDhhLysvOXptMndnNy9CZXRMMGJmNXRWU3Fa?=
 =?utf-8?B?b2lOZk0vY0d4QTFLMWlQeDFhM1BGdmt6Q3NEOEJoRDNLRys3YVBMMi9VaDBT?=
 =?utf-8?B?STVGLzNHM2x0bzFNc0l0ZWNIT09WUlZqQzhVQ1NxTmFnLzhHRktVUDc5R3VB?=
 =?utf-8?B?UmpzTm9vbDlWbGZpZG52dktzd1FtWm5PUkZTVVdMQU9jQkc1ODJYTEJNSHha?=
 =?utf-8?B?KzNWK0ZGbVlGdTltSnhUMXZ1MHVGdDc5ZE9uRlNQRkk5Rm13L0V4ZHJlblo4?=
 =?utf-8?B?Vk1lUVcvZjJybHFVeStjdkxpQTVqOTdlTm0rWmwzZC9zck1MSEtnTnpudk8r?=
 =?utf-8?B?TlhCOHlWN1NuR0FXS2NLOTZ0VmU5bG1vL1h1MHlaalJnZThtbHY3dkhNQnZi?=
 =?utf-8?B?SGxJWm9SNVZNNGpSN2xhYkNOZjVUME15UHV2djkvM0pCaWVvZ0dVbitBalh3?=
 =?utf-8?B?anVOMWhxaENMTGQ1VTRodkh1d0NqRm5jWFVOUFZwVmpLTUt3N0d5VHhSYkJa?=
 =?utf-8?B?eFdjY0VwczVuVTQ1djJBUGNrdDgvM1pOL0JwcmZ5VFRWaTM2d0s0UVZNYlAx?=
 =?utf-8?B?Zm1GZEdpSVkwZFpmTGJXNXprT2FYczU0Z3FNM1Y4azlnY2JPaWlra1d2ZmRF?=
 =?utf-8?B?aE9hQzhNUnh2ZUJ2SklQa0RCeXNLWDBZMUNvaXFoQ3FMZWpQRWlBeEpldXJj?=
 =?utf-8?B?N28wa1BRdDFWZ3MxL3NQZFlHTVd2VFlJa25xYkNBM1FpT1VkZlAzM2s0KytF?=
 =?utf-8?B?aXo1NjExK2ptNEUyOGFwdk9GWUovK1Q5VWRMYkNLVjB4ZmlseFZXT29lNjhO?=
 =?utf-8?B?V2kvWGZld1hZbFA2azYvQWplVlZaMGozOVR5MUhBWGY4ZEhsL1h6Q1pyZU4v?=
 =?utf-8?Q?M2BfaHSvHr72DGE4YiT3K37FxIow0SjaY/mTZ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a8d4c78-76dc-4c77-a0d7-08df4a511388
X-MS-Exchange-CrossTenant-AuthSource: AMBPR04MB12445.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 17:33:39.1320
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sY/b06YbMrVoGLYjmnB0rcY4keXz6ucZrx/hGZ3+C6LIAn8cgNfe+i1OPgSyRXk9ykr2TRDOUJd6/78V6IXkNZqeUHLkM4utP97vcvjyZGvcEAj7s/177HNfdD755KR2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7732
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_173345_297333_78A0845A 
X-CRM114-Status: UNSURE (   9.05  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 1.9 (+)
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


On Fri, 13 Nov 2026 12:44:06 -0300, Leonardo Costa wrote:
> This series adds device tree overlays for the Toradex Capacitive Touch
> Display 10.1" LVDS V1 and V2 with the Verdin iMX8M Plus SoM.
> 
> The display addition covers two interface types:
> 
> - Native LCDIF (LVDS)
> - DSI-to-LVDS adapter based on the SN65DSI84
> 
> [...]

Applied, thanks!

[1/6] arm64: dts: freescale: imx8mp-verdin: Add Toradex Capacitive Touch Display 10.1" LVDS
      commit: 381ce41405bd45a524f2ee5019370559cac5b9f5
[2/6] arm64: dts: freescale: imx8mp-verdin: Add Toradex DSI to LVDS adapter with 10.1" display
      commit: c6e3b5a4b2c80d05b784f36b93a59014aba337f9
[3/6] arm64: dts: freescale: imx8mp-verdin: Add Mezzanine with Toradex Display 10.1" LVDS
      commit: 6c75303841894535383bee9f4e86bb1c9435cd7b
[4/6] arm64: dts: freescale: imx8mp-verdin: Add Toradex Capacitive Touch Display 10.1" LVDS V2
      commit: 6065336d0a71d3e57480cdf66ccbf44a4825e720
[5/6] arm64: dts: freescale: imx8mp-verdin: Add Toradex DSI to LVDS adapter with the 10.1" V2 display
      commit: d35038cd6ec29a429a972f73e93492772589190f
[6/6] arm64: dts: freescale: imx8mp-verdin: Add Mezzanine with Toradex Display 10.1" LVDS V2
      commit: d24c92e1c1bdfbe2d3a998659c2a4bf544a7f69b

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>

