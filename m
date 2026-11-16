Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60BB8606A8A9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 03:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KYZfYT1I;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=RFObK2Bo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=k7Yr/NLdrhAQ9i2jMA15NTdUQCTGO7Ku1hWMY3lAsS4=; b=KYZfYT1I1knEHhwAkndaunQ0Xp
	7Y62laHQhccFsx7F7ZYMrmoEYGFE43uG4lIGtevVRDXFOzfoIMUWIUj1oHNG9BNg6EqnU8buqOYAG
	C97SrwDzg6pl3hlZqGOUPfC0u3Xh9dHjpSWKl5BA8Szt1Hukp/OVNmq9rJ/CjacbgO9qbOezlgOME
	RFNdRdG0iKu8+lEKg9tGPX1Qm+mIj32BVu2zVAfbZQO5E73iYjVk2ZopiMzfMQzriuc5umt5EryTY
	OGq6uTQgMOYex9Dso4QfeTDeUnjwRoxEYp4KiqoqEUqzyvy//5VNXpPdEOSR7gT4I7bgDTaZrjCTM
	SnBEBE9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSmy7-00000000zHQ-0S9T;
	Mon, 16 Nov 2026 03:01:19 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSmy5-00000000zFJ-1OW0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 03:01:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wO/3YMhycfbMPUlTy6ILPX0nwtUzYvMv1vRRKOgVf8DigJS+AgSesysiphGkjampVPG+Iz0p9oxCsFBNDvLiw3FVoKvGxjNQzqIhzl7fiQb+WKjzXQwE54s2mEfhTXnhiONQuMUF9rEwp5YjREEmKeP+Ud9QFiWo61+ak7a5fi9bcyT1g4dwUCKGD1wYR7QVNQ+zkQcNYrQ1u7CwWxrZDys/HCnewaTSYsAwKQAWqYmT2/+eq39h/vTXHjGuG3BgsvWgpR9jmagcCXyGTAZUQYbstiiI/odiGstYi2K0W2VtAdBa3GD6jF3mhCu8z4YXBkriErkUrJGVY6lfbZXaXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k7Yr/NLdrhAQ9i2jMA15NTdUQCTGO7Ku1hWMY3lAsS4=;
 b=iRbtbOG++1zF6cuiJuUYbojs2Xz9kb+eqAG4yKwnfpeKEg4quiDuTFIi8G/oHryvaEyRL/fJuG4ZBXf/GNpnRcE3FQ45P0unJ4HPugOhPzWU6d/eYGHDHNFA2yKW+mBu+j4WwYLpv6CVaF+t+9+2bBNLnDP+BFGZRhZDY1y2LIzP3TxRP5Gwez3dJHZAeS16poC2Vf0Ym7ZU6F/NvsOQfWjJsS3QjnMYtM2TBRUjQ79Y7XsLP+wPUpqUI21d7Q+9YqMC0a3obrMOGwoxQosIm10LaAuLhtsoITz53qBJBRtVuubTt6RVTIYVP81Hje3+zN3uFQXhknxT1Qy6HQVSMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k7Yr/NLdrhAQ9i2jMA15NTdUQCTGO7Ku1hWMY3lAsS4=;
 b=RFObK2BoCv8aHol92gtoItGZ5ONq1STCMMp2FbysdZjAJ0tKBeoVpqgG+m9LebZYtYMZAKyZ0nqsJPH6hH9+oSI4KdRa5M3r6X0qq/hn9MLTIlpY/jl8vvylP607GZJa+TAgb1LYpQVQNgV9cWcBkpgbaQwfdZlefC8HBYAeBrmwda3t5x3V7gz/o/b/xWetzY+SN/3gECGsBWslk9xpnrQZKsjmwuy45EyBndhBm0LdkFDanFd8dVzYy/OWFYHP7aYkgfqdLmqbv5FhNG74Sfii3irrArGBV3YoMlZhn8L+E1Da4cntPn9IdCwzXosJ0gdcrYCw1BI8/ZP/Z8pohQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by PA6PR04MB11778.eurprd04.prod.outlook.com (2603:10a6:102:525::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 03:01:13 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%5]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 03:01:13 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Mon, 16 Nov 2026 11:05:28 +0800
Subject: [PATCH v7 7/9] dmaengine: fsl-edma: use dmaengine_get_dma_device()
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-edma-iommu-v3-v7-7-32794ba8efbf@nxp.com>
References: <20261116-edma-iommu-v3-v7-0-32794ba8efbf@nxp.com>
In-Reply-To: <20261116-edma-iommu-v3-v7-0-32794ba8efbf@nxp.com>
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
X-ClientProxiedBy: SI2PR04CA0006.apcprd04.prod.outlook.com
 (2603:1096:4:197::13) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|PA6PR04MB11778:EE_
X-MS-Office365-Filtering-Correlation-Id: 482a5cd9-969b-4a4b-26a0-08df438ddfe5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|23010399003|19092799006|921020|10067099003|11063799006|56012099006|261021123027099003|261021121427099003|261102123227099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: vwQJeNr1RD2LNCglgm/7egMzeYBzGL9yw66dI5Dfr5EIrlLkC9Vt64aKr/SThbvOk9h0OmOMxiPmJKZFOpCsXzctQU3VR/zsc9QzDDqrV9Wdl11qngkNzuQXXN+d/zspc5xVwFaCWK93e7AL3eNy7USJCinsL/OvLwApcg9Cclk0XdZU5fA4vNqP092pfX2LJtKW6ZRqx5sQO6k3HuWaD997LXGcwSiggzlByU99QTuYEi2BCki60sFbJprm8J68vFbiXry/3ZFR/z7oC9WLK3jwJBUfAHY1TwmJujaj69pCtQRKC4pUG60wtZeTJOepIRjOYzkyIwBcJLreRgPLZLdX9HfvZ91GUQiLJ76E9IuZr0QNy5nJYdPkNJM2ucAJU4rM67FKThIlHOvsGwlUe85lxNy2l+Ic6+BW8ZOP4yRKXnRdpEhxKxQ4kHbQi83m94kLCET1rPym4GtVvg+wNPiGAAcYt81k7CRsBtK+XdpztKfKsug6xBfW+GqJJzqKi6ID3e42B5oYECtex37g+tdbefCB9A320HdAS4nA+8yRiW3SRa2ESac0+fEmLmOdelDn3qoLIOd+7ImFROvF0mapFYJ+fQiqSJrjpoQ6gH05vU8ku0c/op9lOMnhAXtyzOxutVTVtmPbkPzKxhfL0x0ncEavsni5axbBt9fIrSgZrA3HJkNlTT7Q6SEFOsskMd1Ih0oMGhKntisGgsEXgg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(23010399003)(19092799006)(921020)(10067099003)(11063799006)(56012099006)(261021123027099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?alpxTW0wSXRSUTNFeFpHSlRBRDMzeVRORDVzWm5DNzNGVUtLWG1lc1JSUWdH?=
 =?utf-8?B?NW5LRWs1YXFlU1MxNTFzK1YxRTRjOE9SUnpWU1MzeFl3bkJGT3ZjKzNzWW9y?=
 =?utf-8?B?c3FxdUhWcTc2N2tuU3hqT1UrS1A3UmUyc2h2MC9NeWF3bjRmUS9iM3ZTUVFZ?=
 =?utf-8?B?TTFjdlF5TXNDQ1VYVk4xZWFiSWZlck1wbjhRUUZyREp2aFkzOWdjV2VWaDhl?=
 =?utf-8?B?aHdnTXZoTzZBYjdEdnJTTXlkQTBCaXBYc1d2bnhJcWUzNkRvVGl1WFRMYU9u?=
 =?utf-8?B?cmo0MG1JSkl5Q1FlUkNuM2FJelV6akp2SUtxRVBDbFRJTHZMRjlRMW01T2tR?=
 =?utf-8?B?alU5Uk9FU0crOVgxZVJscVR2bjZkdEM0eHMzMkNac0VnTGkwZ0Q5U2lHMWY3?=
 =?utf-8?B?aVFQeFl4aEdlMHUxN3ZyaTFpRmNWNzJoTGNZc0xjN2NFVHRyUEk3eVc2dko0?=
 =?utf-8?B?RzRYdlB6ZkRLdWFuSUl0dklPanBZSkk2ODZEL2x5QXBOUmYyb2xaeC9DTFJ2?=
 =?utf-8?B?a3ZrNW9EbkpCWTY0cHptVGtzeHh0QUhoOXlESkNBaEdJMFN6UkVCM080QThr?=
 =?utf-8?B?Wm14akFQeU1sTGQzMTRnQkJOLzdram1aVlNjanQvV0lNK0xoZWxXbTNQaHVY?=
 =?utf-8?B?UzhuV1ZRbXg2eW82cmFUMWsvMUJQM3Axdk1pdWFxbS9ReXI4amFmakNHS0ND?=
 =?utf-8?B?Z3pMTmVac252bHRyRHZOaXV2WFB3a05tT3hLUGpucFVRSHRneFRjL0NKNHNO?=
 =?utf-8?B?R3lyVnFtdnc0Q3lubERMb1RQc3RBaHFMTk40dml1VGF2QTNLdnFyUjhWcUVZ?=
 =?utf-8?B?ZWpIY3ZmQks0OVFIb29hdzRlb0U5clVkSUtoVVdGWDNualNYOHo5Z2hQMFdm?=
 =?utf-8?B?c3BCTWp6eDBEWlp0U0pIekZNT2l1SzRrVFhQR3N5UTIvNEdtNk9FRDR3SDJO?=
 =?utf-8?B?SStjdW5yNEhBRnBYMU1KTnA4eFpWR2k3YWw2MVdCMGJvTkprOFdDeU5EYUNi?=
 =?utf-8?B?MkxsOFVQZk8rOUhoc0tEVkQvdDQvblh3WGJUTFZ5ejhxL0V4VCtORFo1dVBn?=
 =?utf-8?B?b3NXRWhQR1IyZ2VGd0YzVFVHTlA4M3E1eW9BSEF1ei9MODVDN1c3bjJtMWNM?=
 =?utf-8?B?d25Bak9YRmMveFNSc292YUpMV3FsK1RjRU9Vb1Z4V3F0TW1wWUNZNTJYS1Vq?=
 =?utf-8?B?RmR5MWZpcXB2cUpFNjJEMkV0djAzSm4yTlBSVDZpNHRPRWNaWlprQzBxaEhG?=
 =?utf-8?B?LzZ5Z20ydGs2Qm5vaXQ3a2paUzdoNWVhSHlwZXdKaEZUWWZIL3hEa2Z3Nndt?=
 =?utf-8?B?azFhbDA4UnhSbDYxOGV3cHdBUmNER1FQVXJCa05FNklpd1UzbC82TVRhUDFO?=
 =?utf-8?B?KytNTUxFUXRoQlM4MkJJY241czkrNjd6L2FIRW52YVZmY1luT1JvQWRvNVRI?=
 =?utf-8?B?bGRjVXJDV2ZpajJNQlE1bWVyWjdjVG5yUWdhYmtJUUFsbjVuOUZiUDlaakFC?=
 =?utf-8?B?d3BaR2E0T0M3Q3YzTDVhZ1lOam9FNDZ1anRtaWJ6b3gxbnEwbk9kYlMwVnov?=
 =?utf-8?B?WFFzd2E4a2VJZnQyVTZhTWx1YzlJWitJbmlsTnE4TzhBM3NsaWhBNjdFZTlK?=
 =?utf-8?B?bTBJbGoxMjg1VDdlbVNLdE1aa21RdkU2WVZlRkpRaUJSWDBhbXhhODRuUm1X?=
 =?utf-8?B?ZlRMTjB6WkN2a3duV2NtZ284RUErUGlRK2F6ZzN5UXR5WmVmTTZOUUpzbU0y?=
 =?utf-8?B?c0FERlpFNFh1N3V1eWEvUzZYWVpRNjJQeEU3bVdqSm45OExKMUVvSEthaWFh?=
 =?utf-8?B?TEJOemVPNDhBSHpmVnNHZ3dSa3F0dGN2Tzd1Q25UbVZIOUZOV1laN093S1Jn?=
 =?utf-8?B?cnFlUmZVd1NoNkJVeHhoOEE0VWp1WFBmaDhwZDRCRXV6aXBZNTVFU2wyZGxj?=
 =?utf-8?B?NmpGU2NQWGRGNjRsbEovVHFmSDhDL3NaN0ZYZ08vRmExOUV0Zlc2Z0phN0xZ?=
 =?utf-8?B?cEptTXpoVi9KeTBBd3ZSbWE0N0RpV1JERkJzd2t1Y1RmdEVxcHVYR0RRZ042?=
 =?utf-8?B?RURGM3VGK3F5ZVdNbFQ4NWxLL0NHQXZKOUZod2ZNLzl0ZUZIWVljRzk5QnpF?=
 =?utf-8?B?bVllUkZadWo2YWN4VkQ5UUFIZHd4cldDYVIyTnRUbDVHdTNwZm5qeklkOXZQ?=
 =?utf-8?B?NUxJSjVGQzFscUFRanE0K0tEdU1jOFkwT1Jmc0QrUXQ1QmtzUlZkSlVmVTJi?=
 =?utf-8?B?SG5oeXVtK0h3T25KNFBiVHB0a3paWVd6bXMzVDg3RkQ2TFJsYzdIdjl2UFBh?=
 =?utf-8?B?TEFWb0NNSklQN00rWmlJOTQvSUxiU3dDZ2pGVUloeFhtNDRzZnl6QTFsMGxw?=
 =?utf-8?Q?fMoPHb6ySBIit92I9KOHbGQBrfeAvkWNsm9hc?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 482a5cd9-969b-4a4b-26a0-08df438ddfe5
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 03:01:13.7062
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fzf7oKaMjrgltcaQSthnvBRg/IhNY06w7sDbDb7DV1C/HLRFyjb/zVMevv2kEdKCHU6Nt0wVjEB46lHGTVutAZ5O2i9ev2pnYQnCr3+Ea/I+Kqr2rrMs94nN5jexOANa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR04MB11778
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_190117_402989_89E5C371 
X-CRM114-Status: GOOD (  11.92  )
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

Use dmaengine_get_dma_device() instead of chan->device->dev when creating
the TCD pool and when mapping the slave resource. This lets the driver use
the per-channel device once per-channel IOMMU support enables it, without
changing behaviour for existing users.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/dma/fsl-edma-common.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/dma/fsl-edma-common.c b/drivers/dma/fsl-edma-common.c
index 513b0f4e5be2..62cd60179bc6 100644
--- a/drivers/dma/fsl-edma-common.c
+++ b/drivers/dma/fsl-edma-common.c
@@ -310,10 +310,10 @@ int fsl_edma_resume(struct dma_chan *chan)
 
 static void fsl_edma_unprep_slave_dma(struct fsl_edma_chan *fsl_chan)
 {
+	struct device *dev = dmaengine_get_dma_device(&fsl_chan->vchan.chan);
+
 	if (fsl_chan->dma_dir != DMA_NONE)
-		dma_unmap_resource(fsl_chan->vchan.chan.device->dev,
-				   fsl_chan->dma_dev_addr,
-				   fsl_chan->dma_dev_size,
+		dma_unmap_resource(dev, fsl_chan->dma_dev_addr, fsl_chan->dma_dev_size,
 				   fsl_chan->dma_dir, 0);
 	fsl_chan->dma_dir = DMA_NONE;
 }
@@ -321,7 +321,7 @@ static void fsl_edma_unprep_slave_dma(struct fsl_edma_chan *fsl_chan)
 static bool fsl_edma_prep_slave_dma(struct fsl_edma_chan *fsl_chan,
 				    enum dma_transfer_direction dir)
 {
-	struct device *dev = fsl_chan->vchan.chan.device->dev;
+	struct device *dev = dmaengine_get_dma_device(&fsl_chan->vchan.chan);
 	enum dma_data_direction dma_dir;
 	phys_addr_t addr = 0;
 	u32 size = 0;
@@ -1090,7 +1090,7 @@ int fsl_edma_alloc_chan_resources(struct dma_chan *chan)
 	if (fsl_edma_drvflags(fsl_chan) & FSL_EDMA_DRV_HAS_CHCLK)
 		clk_prepare_enable(fsl_chan->clk);
 
-	fsl_chan->tcd_pool = dma_pool_create("tcd_pool", chan->device->dev,
+	fsl_chan->tcd_pool = dma_pool_create("tcd_pool", dmaengine_get_dma_device(chan),
 				fsl_edma_drvflags(fsl_chan) & FSL_EDMA_DRV_TCD64 ?
 				sizeof(struct fsl_edma_hw_tcd64) : sizeof(struct fsl_edma_hw_tcd),
 				32, 0);

-- 
2.34.1


