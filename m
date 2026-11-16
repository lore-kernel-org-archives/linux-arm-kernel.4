Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36883606A332
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 03:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2YbS1E31;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=oQ0xqdaJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=05SdX2yemUpmFMaQSOVYU9CJm/q/t0Yej115Jhq37gc=; b=2YbS1E31bCYk9uaPrWE/J+p5+5
	t4ylTSts/vNyg6LUWguOObLNcAsT1Dy6rLmwwMf97srYL5+sjhJXH6iaPSrifIugDI1VcS+tQfBD+
	1+NZlGSUYcDugOzxuYa4gvvcR/v83KKOWdHinGqH3KNzOlqYIomorag1L9lt9ujwNBLHS3YS3qER5
	CoUJGqerAlcHtQ8Wz0C1DqNBkmL2K/vk7K+wlXNewwxp4WJxqTII1YFJrLQDB161lmqMWf/ZpHXLD
	w2QzVX9WEL/I+Qjtn0JIemNViGb7xalKsm23ul6DMGNRiXsqbg0eepjPl5E2WQbrclOzLlEgrn3cV
	RAKy/m1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSnJi-000000011Ka-3kU4;
	Mon, 16 Nov 2026 03:23:38 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSnJc-000000011Hz-0pZp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 03:23:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=stpLlCf0UMc2Ci0UEXNC0U30eZFcfnW8hIxgM67g56eL97HPJq0+TQcs64ADxZ3XAdWltZPKjLVBDAHkaSYLtvIk1X23VPq5GJEq6OUIXr8pY4hCEk1XnxORAhR8AoVZZS4eZsjOxQUGH3e+5aAQVQh0zr2jSqxswwfztqd/3wQIBKO+TvoH/VXXQB7EfGvGb6KJqK60zO4+aGiUyWgX7SKT2+IXZjFLNx7+xGjNt6yt/SevcXmf6n5wtA2TYcdleQeR3CPMPgfRIGb9azO2vg/1trY7y1LrYkN84+wKceLUReblkxQi7TvVfDJPfBuEygHfoeCzuk+cNEzjmbmodg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=05SdX2yemUpmFMaQSOVYU9CJm/q/t0Yej115Jhq37gc=;
 b=jN353fWBSQc32xjZs+uk522WIKYHqyjl6b8L+cmeiD9uPD5mfAlZcwZJ+qGHwNJ/7Uz8uUvQFGhz20ttvUV4XIYj0ey/AEcppWNWdwRR6yyxXMFvIG3Olo/nL1nJCOywpyOSJeX0y3sMDki2kgHLcwETLTWea1wdAir5NrIGXlXCbP5jcRGPnBrZrvX+CuxA4N41Sh9amqiQk1dhQ1wQIs3zT6IjSXlBBTdINaG0pZtJyoWUuuym//Fi0axCfWMq3UqDvJnZtyF1MgtKMhWXflPnlacTtTtFUs9WRZw+KSd+FNUWKLVE0wWNtPawfftL14qM0TTaDKd8yjPOwEZ3pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=05SdX2yemUpmFMaQSOVYU9CJm/q/t0Yej115Jhq37gc=;
 b=oQ0xqdaJybUspH/NVaEAyRin4gJCHyH4JjzmlxglabPOyv1O4e1S7V11LWAQBx3UPCfX/jiqMCxWJv+Sp4qZ26kMWd1stEpaMmSlwIuyyS3v4UY6MJwGFc0fP27+Mmn9eUeZIV5dB2vVR01C60qerSet+0XNyeAGW8ibf7cVeiA/uaHgAIkDAG1QMy12egrlGMvzca5w5f2otPSE+3DrTF3ZCiKIHHh+FcAB2Pqgl3ggnDvTV5xvI+F8OAW8oXh4QBDVN+seM98xnj6PQnz4GQpzeJ9n8ZaH85US2/mNoPFg+6sWnKDafM9FaX02XzHyk96r61dFsk5y3wBZYmrPvQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB8PR04MB6667.eurprd04.prod.outlook.com (2603:10a6:10:10e::22)
 by BESPR04MB035703.eurprd04.prod.outlook.com (2603:10a6:b10:118::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 03:23:28 +0000
Received: from DB8PR04MB6667.eurprd04.prod.outlook.com
 ([fe80::e1b:d361:7aba:6960]) by DB8PR04MB6667.eurprd04.prod.outlook.com
 ([fe80::e1b:d361:7aba:6960%4]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 03:23:28 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Mon, 16 Nov 2026 11:28:19 +0800
Subject: [PATCH v5 01/11] media: imx8-isi: Reorder mxc_imx95_data to follow
 mxc_imx93_data
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-isi_imx952-v5-1-46de1d24efd4@oss.nxp.com>
References: <20261116-isi_imx952-v5-0-46de1d24efd4@oss.nxp.com>
In-Reply-To: <20261116-isi_imx952-v5-0-46de1d24efd4@oss.nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Frank Li <Frank.Li@nxp.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Guoniu Zhou <guoniu.zhou@oss.nxp.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794799700; l=1898;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=09zZuqgXe2OIdPfWk8ai6X1WFFxNQ1Ab29TGRIivYYU=;
 b=SLCRWYzTnrI16eL2t+xGjatupHLQjVEgqZRgzYXmKoUB8ffTKxHymeJ/XU8zvETkKXbi30PVr
 FPVUOfUwldrARbz2LC53uLxSIyzMPpCtf1o4vUiqTMEzxuDc1ZSCnMX
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI2PR01CA0014.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::17) To DB8PR04MB6667.eurprd04.prod.outlook.com
 (2603:10a6:10:10e::22)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB8PR04MB6667:EE_|BESPR04MB035703:EE_
X-MS-Office365-Filtering-Correlation-Id: a2f900b2-25c4-46ed-3d1d-08df4390fb72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|23010399003|19092799006|921020|10067099003|11063799006|56012099006|261021123027099003|261021121427099003|261102123227099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: hdQ9B3IYp7BvcpFZ0se/V92J5LJ7Q+1QIeU40igDwlKcVuYkbsmkrFD1TONkpK2YjZB/qHf77EG8Oq8rSQTNzBiay0jRaH71SI9hhIFr2cRj5ny99ra1Ra2rCTdSW3zY8k2MsD2PvS/lCkGh4L5dJmKs++VA/4+mDoXXqJS3mXbkcJF5gDa0IGqn72b49M8LX4DLg+yTnQyZ8tnsiWlzKlyjD28ig3Egfq+7YuMS3sCHOKMJMMPp+3QhACeiuCMrHjytJrBtBmQ4cHLQ+joj75pplqjsUUhfkBN4//ZTg9q+Csl9K1ri4kmi1OrkBSzdOZOYAY0LsCA+BZVy/hUtkc5ZNfSMkYZDAQk1riobJ1NrSpv01MRAuBx+VKmndx0r3ishXdCAAz97KJocGdHDtpAvUfuhxUZpWvKs001wCa+NP+TJb4B5uVoqPLI5zD/A0vA/7wvPGDs3naHUaYOhbSyXnX/TkEl0MvX+E8qaFGk123+7UVkoQ8xKOcPdHGvugmx/tcadIeusR5YuLjfFJDQIyUqaQPAtGOejpLVGYGYbD6WSm6DHnzIZ1Cr3ZL5eInRaQiJyN1CbESipmbXnkxwYNtKftw7aDjX3663T753EYzJLPx2lW5s5gY1DzeGxB4ZkixHRlDD9drKcjDkc6jGWciqhrSh3w87+O2m+Wd+Ud2mpsfRr83DErux9EyxDnxJ4jYQ+4J/dHj1IHkVtTQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6667.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(23010399003)(19092799006)(921020)(10067099003)(11063799006)(56012099006)(261021123027099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OWdJM0V1My9OQitQTjNCR0N3WVVpRkhlaFlWQmcyTU02alorN0V1LzArOW5C?=
 =?utf-8?B?VlQ1MVFmYy92b2xyWGtEY1NwMTB4bk9GMlZ6QlYycmFYbmY2UnNHcnRKdnBw?=
 =?utf-8?B?Y2h0QkJHM0FZOSt5RmhxQ0hONGc1b003d0J5MEdwdlFzcVZJVHFCU3hWZ25r?=
 =?utf-8?B?WU83OEtiV0MyQ21GSFVJMGsxR2FNQ2VLV0d0U3RoVFVQTGc0Q1hIZCs4eVJq?=
 =?utf-8?B?R3NMbmxPRE11VTVIODJ0Q29na2JjTnJyMUk2MFc3Ullyd2MwZ3N6c3BGbEly?=
 =?utf-8?B?QVJZMHVXMUo0em8rOFAwcFAzTmxrT3pLbG1VTmhsK09kTTJtYzZhaHVjQ2s4?=
 =?utf-8?B?d0VoUDRlbXhJOTBTbjRrOTlZWjJuZFZwcGpZd251NkdwdTN6WWJYUU9PUEhC?=
 =?utf-8?B?aXVOb2diVFYySmVVcnhWcGFkb2ZFcmNMLytCOEhnejk0d2dqK0dMR3o2QXBn?=
 =?utf-8?B?SjNoTjFCYnhncXMxVWZtNE9Udk1VeGdNNEtSZkpTek5FSC9XN2xOajNVOS9o?=
 =?utf-8?B?RG1KOG5VYnQ3WUwvcmsrUEVtYVFpazRxbFdQV2lkTUpLNlpsd2U3azJ1UnZE?=
 =?utf-8?B?S2tqeDBERGQwQXJXS0o4QzI1ZnZuaXJwN0ZZaklwOWlDUlRJVE9TVzBFVE5C?=
 =?utf-8?B?YVN1a0phOFAyNjZ3eXA4RnNkY3doanlwaThodk1zNVpteGhWbWNZb0xZZzFM?=
 =?utf-8?B?akRsalpQb1YvOWZkNzRqZ2tMTnVWdHdEejlvSGtlOWFWZnVnakRjRERsSFVZ?=
 =?utf-8?B?UUpFZHY4eTFhSStKZ1g2bm1LMlZXRjk2TzFLZ1hFU093VTVXMWVaUzZXU094?=
 =?utf-8?B?b0NuUDYzWW9MdnoveWI0UFRpSSt0YkpjdCtubnE1QmREYTF5N3o3Yk1nZHd2?=
 =?utf-8?B?UFhQZmo3VnptaFRpclVZNDA5NDlabTV6bDh5VWRKNEt0S3pRQXNrRStUOGFm?=
 =?utf-8?B?U0FtTXdsdC9relBGbnlTbWRiOEhKMU5vcVlCY3RrcE1xZmluZnplTVNybWdo?=
 =?utf-8?B?MlZPanlQTlArbFNGT3R1QjhsNEIrZmVHUVFTVnJyUFZxaHgzeWRrUWJybmxo?=
 =?utf-8?B?YkpkbmRnSnV5TUtUR2h3cllsVk1FWExrYjcxVjBVVlYwc0FqNVAvZmp2S3JL?=
 =?utf-8?B?K3ZMSFVaNE9vMGViUE15aE9tV1R2TnFLd3grOEVXVmZWbjk4dmdqRW5GOEFo?=
 =?utf-8?B?bFRqeG5Fb1p1WFNaRnpTam1JU2lXSENnbFFzVEdmUWsyK25rTzZRejJiQmYv?=
 =?utf-8?B?T3BYUkZ1cEF4WW1MN1FCWXNhNVUxbjhRR2RkTnBDdVBvU2drcDlZQmVUV2Za?=
 =?utf-8?B?bGFia0JuNml6NTBoMkU4dWhVMis4Q3B3K0VMRGwyZ2o0VTV0Z2EvamZ3Ulgw?=
 =?utf-8?B?VW1qaStmRzZkRDRORHc5REZsTVMxNzZmcTFwTjEyM0VUVXU1MVFKWURrYXBQ?=
 =?utf-8?B?VTZ2emdUcEE4Z1JjS2tnL1JMa3N6Q1B4QjdUbElLMVVJUlgxUGYrNmlNV2lI?=
 =?utf-8?B?NmNBQWdWT29ka0RGdEhhSElWekZFd21XdVJKSVRVMW95OHoyaFRjNUZnQ2pK?=
 =?utf-8?B?MlpDZFB2alpMclJYcEZyYy92SGRjL1pyVGw5TGhZTnRVS2tMVExPUzFKS01o?=
 =?utf-8?B?S3hQeEdPTm1TaEVoUTNVMTdhc055K1pZekY4am1XOFVFcXpwR1ZEK0JhczI0?=
 =?utf-8?B?SXRXZERtcmtPRWZuTEpXRHYxTUpnUHd5MnVLQ3piVEpXb2hrQ3BsaU13OERO?=
 =?utf-8?B?bVY4bUpvTDBzMDNZOGFDK1Z4Mzk5L1d0Q0tEaXN0czZHci9oS2FsUmplWUpB?=
 =?utf-8?B?T1NqWGJKV2VRYXVKeFJ0YTMrcC9zUFlWZlFaZS9Ld0NLSG85NmcrQ3dGOHIz?=
 =?utf-8?B?M3gzU1hLeEJYenpVM1ZVeUh6SEZRQm5VZnlGeDQxcHg1UnNrc1lQM1p2dFNv?=
 =?utf-8?B?dCtSb1VkWEYrOFB4UzlEUzhHN21VNmpUTkZYdXhTRm9aWndWRWovN2tzOExn?=
 =?utf-8?B?aFB2cFFzOXg0Mmt4QTR2OGJpMFBtSnB2Z2pqY1ZXTHRvYTVLbFRqU1A0MlRt?=
 =?utf-8?B?aVNvaVk3QmlEOW1iUUw1UEdjYkdqTXNVRWt0Q1ZnbnplTk9SVE9sd2tqdGp6?=
 =?utf-8?B?N2dEMHd3dnZTSGlKVDhiSmJWU0szWWZNK25tcklEWm80bEJXbEZQS2RSSGFz?=
 =?utf-8?B?MmV6RGZ4YTc0UEMyOGN6WFNWbjlRNGdIZzFEMEZjeVRXMDRFZlh3dXJPemFr?=
 =?utf-8?B?S1RJY2Z1alEwRWZ4dExzYTJJby9IeDJINlFhamJoVUFYZVZFUXcwVENDWk9E?=
 =?utf-8?B?WGZJRm1JS1lqWlBUOG51RCtDTFlZQmwxTHFLMFVQZ2kxTDNSNktKV2haQjYy?=
 =?utf-8?Q?+PSA9gsZgXc2QnGO7K27URJzYroSMMmaTXXac?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2f900b2-25c4-46ed-3d1d-08df4390fb72
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6667.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 03:23:28.5918
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dS1BcgfKCghO6DczfTvJ0+yRvJFxpvcoueB9g+316Ub+msdQm18gIgtExsjKz+cQNScKqh8+7J8+ix2VyfgFO1kX41tpxM+xmfCueQ4t/u3AasHtav3ki3ktvD9d3tRC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BESPR04MB035703
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_192332_246289_763E4638 
X-CRM114-Status: GOOD (  12.06  )
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

Move mxc_imx95_data definition after mxc_imx93_data to match the
order defined in the of_match array.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
---
Changes in v3:
- Add Reviewed-by tag from Laurent

Changes in v2:
- Add Reviewed-by tag from Frank Li
---
 .../media/platform/nxp/imx8-isi/imx8-isi-core.c    | 24 +++++++++++-----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
index 0ae5f35e017c..f2a8eb82fbfd 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
@@ -314,18 +314,6 @@ static const struct mxc_isi_plat_data mxc_imx8mp_data = {
 	.has_36bit_dma		= true,
 };
 
-static const struct mxc_isi_plat_data mxc_imx95_data = {
-	.model			= MXC_ISI_IMX95,
-	.num_ports		= 4,
-	.num_channels		= 8,
-	.num_vc			= 8,
-	.reg_offset		= 0x10000,
-	.ier_reg		= &mxc_imx8_isi_ier_v2,
-	.set_thd		= &mxc_imx8_isi_thd_v1,
-	.buf_active_reverse	= true,
-	.has_36bit_dma		= true,
-};
-
 static const struct mxc_isi_plat_data mxc_imx8qm_data = {
 	.model			= MXC_ISI_IMX8QM,
 	.num_ports		= 5,
@@ -384,6 +372,18 @@ static const struct mxc_isi_plat_data mxc_imx93_data = {
 	.has_36bit_dma		= false,
 };
 
+static const struct mxc_isi_plat_data mxc_imx95_data = {
+	.model			= MXC_ISI_IMX95,
+	.num_ports		= 4,
+	.num_channels		= 8,
+	.num_vc			= 8,
+	.reg_offset		= 0x10000,
+	.ier_reg		= &mxc_imx8_isi_ier_v2,
+	.set_thd		= &mxc_imx8_isi_thd_v1,
+	.buf_active_reverse	= true,
+	.has_36bit_dma		= true,
+};
+
 /* -----------------------------------------------------------------------------
  * Power management
  */

-- 
2.34.1


