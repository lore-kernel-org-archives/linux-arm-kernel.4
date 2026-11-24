Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5CD6606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 03:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MWVu+lgg;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=hZRf/p/X
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=9u58MWnUPBv+wpIoHoqA+g4jSEnmA4T+QSzu9v1QMbk=; b=MWVu+lggbrJ1iQ
	xvLnCRDvyiHaAVgN8mPrfyK1hTI1DjGwaYMlVOZ821lsB4+BC5VB7DI/mzPiw1KOczekIUhZRZ+QL
	sVKUM5HnAGe+PhSMD5LZtv7pSEpTkyedydipD+OtmM2vdHDjuarLofAKCu/W8ELW/JLaApJHV9df5
	MZKnUTDpXrxqAb3sPa9WZiJHEGtTXhy6vTHXYppum14wSCRZIqdp5hD8npice61o8Bw4VX64yu5R0
	nOwdbYkDi00FVf3cFDbF3oQa66pTOA0eFD1wgzBlkmfQgo4m5KWmxl/KIUMHEAaw5k3qvQrznp6fx
	8pTqe2ZR38OdnAFGaDPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVhE0-00000005Qvz-1WRn;
	Tue, 24 Nov 2026 03:29:44 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVhDu-00000005Qv8-2zv0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 03:29:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EZQwMZZxb3pR6mqN1dRiIqUcpmhTPPJcHyziSxP6Mfh4c0LRmdftinG7FeDwsxHROjcR+T3s0vyvHS00WhZm3nd5hSxPLJkhos9aBRV0ZcVYFH5pQVaTNJJ0DEHUdSJM2k+Ro2QVIQmISs5Y63w3Hz4I1OwlU725XVT6cFmFESpZ1Mrr49+UW8FgBWDr/3W2myofC13bHCkbs+9gjW1EbGVNZtsD2lFcgEyMBqzcj2dHp+dVQJzmR7ZW7VUDRXSVtyPFH6aNCUN2om1wjRyXiAzeqdjfBFj5eW2qmz1U7aOdzdEXcLlMVO/Vx08VopyI7JJ683SqQYqXxXkxVOTrww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9u58MWnUPBv+wpIoHoqA+g4jSEnmA4T+QSzu9v1QMbk=;
 b=MZmbMCqvRZTUcscY4DaNHuQ1phI8HAJNVonjmO7kBx4XMypZbztHEOs3slaBf5pC5LWNBQrpCRmHyYMckJFT1iGRYELwBmyjPMPnq8zgsyX3JEcDZVkdHkVlIsoSPuKxucDGUhb51uswL8eq548aqTbm3NM1oZMZeMtifVDz7Liz/wk6UsQ21YvwjzEkCBXSKgv54yuD2//gVW2x1ULA4BzGpGZO2p3zYnn5Li9A7c8F2CXe7Yxjy9el6a6EhFqMfCrJ6uRbA6ugiRRat4Cp0TPEtbTXcyhlZkI7h+q040FNhg1a1fCtnEFihy6JvEHSXnMeE/byfMSQ+9YpyTMmnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9u58MWnUPBv+wpIoHoqA+g4jSEnmA4T+QSzu9v1QMbk=;
 b=hZRf/p/X2FvcxyHiuwVf4aOF9F9gWXSKoBc5xqi7tyUkyfYRLg+DXaugUaQG1k0YaUq0nj4INLGfA3ZBsWwgKZmXCrQHVihgNqg9F9yuqDa3r8+Y3di08OXkyyLAR8xI5qOwuNJK5euqmyjWbbM5OJUwLa5OERLRC6MKvstCIYRl/JHDOyrcCAS3602rM4EqqW3exgfKgkIBnyfbPJzwS0LGsO1kPdBChrVLGTFBWBohyrBP3l2J3W0xhNIGEQU6kvJxkXvRVd1Y/Hwc4AeWadR6Ov0isFHJIHrZ3nPSQ7mtwRhUCucL55NgNrbZt4NNLu8lifOkIsQJsIoGaThJrA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by DB9PR04MB8393.eurprd04.prod.outlook.com (2603:10a6:10:25f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Tue, 24 Nov
 2026 03:29:32 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%5]) with mapi id 15.21.0639.012; Tue, 24 Nov 2026
 03:29:32 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To: Lee Jones <lee@kernel.org>
Cc: Peng Fan <peng.fan@oss.nxp.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 10/10] remoteproc: imx_dsp_rproc: Fix off-by-one bitmask for trailing bytes
Date: Tue, 24 Nov 2026 11:26:34 +0800
Message-ID: <20261124032636.5382-1-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261123172140.3547896-11-lee@kernel.org>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI6PR03CA0005.apcprd03.prod.outlook.com
 (2603:1096:4:285::21) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|DB9PR04MB8393:EE_
X-MS-Office365-Filtering-Correlation-Id: b111646f-c19d-41f5-558c-08df49db27c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|19092799006|1800799024|376014|7416014|366016|261026135527099003|261022115727099003|261102123227099003|261026121527099003|261022113327099003|261022075727099003|261022105027099003|261026130827099003|261026140227099003|261028144727099003|261021121427099003|261021123027099003|261021130227099003|261021133027099003|261021135927099003|10067099003|11063799006|56012099006|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: BRBXsAu5QPjhmYmu6Lvt3fuxJQTSACJf3C+vmnjXA+yuozGAi8Szd8SQmDIBzWMmlDBjsEnGDXw/ZaXWp+mIF4zcgZisijBi41IPJyWP6rXnUfRQhq9tiJTx31ST4IYmZndPEDiaPgUzcZNsDIcQynD3c6xguREH7BCcomwxPBDMTi14ddHpYUBylvbtuY0BmMSwHm5AOjlxe6R0XIo4JIoLexjett02GdnrMEycj5wfUZLiON8qvFaHFop+Hmi9gS13E0Zn8lUnj/Os8pt/ZSFtp8BIG4d3AvPbfIBfYTNVdStK48YdnGe+uaBfRiOCaOmVpSUAA8UVLqd+QnmgwQi4M/6N4lIXwCRroR1psWyQ3G8+tsRMbBU6nM+eO76uLBN8YMRyXRRGUUZtMerB5+4f4EH8cc30Is1GAbsQsHc8AusYbwDxZRfFL1E3PuD2UxPvlVzzcmU5LRjNkAuzHgvrdBufUv2UwWAzBI6S3SM/2jzxB52WyUzbgrZSP6FNF9OF04SDQe21HI20xs/DCd6DBCssaGhsMyjgGJldSbHQiNQ0rou6JgKvBFRZWegW/TWqazNou3jgriFsyFaKLpPWtc6ABmTU8qyY/lpKj78=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(1800799024)(376014)(7416014)(366016)(261026135527099003)(261022115727099003)(261102123227099003)(261026121527099003)(261022113327099003)(261022075727099003)(261022105027099003)(261026130827099003)(261026140227099003)(261028144727099003)(261021121427099003)(261021123027099003)(261021130227099003)(261021133027099003)(261021135927099003)(10067099003)(11063799006)(56012099006)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SFTqWOkvjHdhboCUqPGtVgzjcJxAaW8UA4fjt3RsO2wIZCBSLd1cR5i3MLoo?=
 =?us-ascii?Q?WpcfnwIi1XzW4gvChyT3cccCJHdeUU6fYg8J8szZDk/By2riIGSu/1jg+pVY?=
 =?us-ascii?Q?M8cttzFIYEEbIIxYje2lUwYcWVJDE72IiaxOkxH3NJcHZ2hSDx7EqME/8Tb8?=
 =?us-ascii?Q?Pnbl3mkR3uhWPNR6G923XJ8UB53kqJoX3jhgbTiHb53LMMvMpTPzVe5ZnP2Q?=
 =?us-ascii?Q?K95euG6z/tzCbBQpD6u/BP42CS7Fq9fDQxHG+cI/DDW6O/ZDkmShkbJRumxA?=
 =?us-ascii?Q?u1fLLSWBXOn1ohyIoTzUHAhIW8cOI/Lh0ZjLJBN0+ZEgKwwqxZaSGPW/IJUS?=
 =?us-ascii?Q?kEQXpROPp9KqzxfszOmmxOhLJpZgMC0JnYmoghwKYTN8rrCJn8v67qv7GC9a?=
 =?us-ascii?Q?RDc8iK60kJjXfpQueqpDgNhcKOlmZaFsd1erT4cdj1t5aRjW3rOrnbDJZwYl?=
 =?us-ascii?Q?0e9haTSh3Qie3RgZUrM9nNftiVwuNF+hEGTww+TP4A4vrcm2Ewdx8qai3gT+?=
 =?us-ascii?Q?Z73JRtj2lxK5ApLJdOMqgo1pbKCj8RiB2QWAD81BL/Mi+Fv0Eg4NaI3hFUr8?=
 =?us-ascii?Q?eIXFjLUgPhou9f8EoOZE+DGZXdPpZRE1tU9fpYir//RGM3ZSluMDouv5loQO?=
 =?us-ascii?Q?yFReXqQX7Qwdv9tVBx50eEAILWxxeNtYklHBDF+NQvbUqfj5dX+FS4K834mL?=
 =?us-ascii?Q?jJqcbOPjH5nfareJZU1w2rACt5ciuy6OzfRvpQnv9mwbFiOp3BHoFkAvvr3z?=
 =?us-ascii?Q?uxaY+FoHWUQ2G88yWbefSNzjPcQSvt5kosx/nWFDggrMUGni6Oy+XYPp6sR+?=
 =?us-ascii?Q?xJWSksneoF5MDyQBczqIj/tzoaXUWq7JHniAmXNnEmDHBmAy0PeDDpnM1Wy2?=
 =?us-ascii?Q?sMx/LBATsdIcbZkirOFAetJooXSRZSwmDoiRi69NHwgsGULCuc105YYWezKN?=
 =?us-ascii?Q?ilHDEcpM/4jDAFvicQ0WfYhG1Dp8SSrDGyHXENbZe6IXVUFO7WGVxVqr4g2M?=
 =?us-ascii?Q?RrHuuNAyOiCc/iRn8AUZeNmRUoaluBlKU7scAxprqXG3L7P4JsEx6Xc7r1q/?=
 =?us-ascii?Q?SS4UvIe2LRftc3saaqKNRKatap6BxVpgCsbOoxxWGEytkIZwcz+fODjXL0LH?=
 =?us-ascii?Q?SUBVB3T5roTwetT+R2F4vxyyiFUjBe5sYnTlFLMfv1CwiB4QhluS3KKrPWRJ?=
 =?us-ascii?Q?1C9BxRCSaWGYm1xMeEcJ1nUpy5SIB0WbhBBdINNHf2rgOVi6HJHdtWC2z2b2?=
 =?us-ascii?Q?uD9ck8E9TRcoilsUgRMyvi+Tb3psGKK/jTHt6l+iLMW9GYc+xTfOJj7fvxTz?=
 =?us-ascii?Q?v5kevKiUWCpzhC3XdMZqNJsvrjlfqi5sx8spw6Y11jcylSm9v1NtfVKUC6RD?=
 =?us-ascii?Q?G+KNekjUcs4Szh2VUjCGfVsctcLuBknpL6Mq2npfiCT79AR88Un5RhAn+GED?=
 =?us-ascii?Q?hbU8fAE/PkmmqKdNZ4EIyKAh+Op8MRhv1qV/iAwyhRS6xAx4PsWMA4J29XLw?=
 =?us-ascii?Q?YvLlXsdxaKpr3tAMBgm/ghWDmPOnp2wRs1bPrdvWdMW4h4MxHUjvirejUZRo?=
 =?us-ascii?Q?bg70zYUpjYjLkcNoMGpU3nkkoAdVgyKSoB/fDMC7cT1VzKADNLfXmZCsy69N?=
 =?us-ascii?Q?unRceADVsqbME1jVbqs9MRzcmdq9FaPMG+L457mUN7VlVaIsUrmSOtJmeGP4?=
 =?us-ascii?Q?FmvVh1Ij1nlhz8z7nlTNcKnmRzpA4MvrktgM1EEkgmi7xqZMQoQWzRW7lf91?=
 =?us-ascii?Q?+hyS6OABFTGBWe5w/VO6g1/H7OoMY4nghNZylyckAenhURf/ZznB?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b111646f-c19d-41f5-558c-08df49db27c3
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 03:29:32.4990
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UhhHm3opsYnSehmAoOvYkWHVENShG/0Fta6OaZt72nP0GwTaYw7Zpt559bdeyx9XXL8GGl6J7ePhjhHjcKEFHun23i8Z6dRTvLPY2ZAevXGGQODdCP0NEpZZe1RUSYGw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8393
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_192939_705169_B92BA1D1 
X-CRM114-Status: UNSURE (   9.33  )
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
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 23 Nov 2026 17:20:54 +0000 Lee Jones <lee@kernel.org> wrote:

> When size is not a multiple of 4, both imx_dsp_rproc_memcpy() and
> imx_dsp_rproc_memset() compute affected_mask as GENMASK(8 * r, 0) for
> the remaining r bytes (1 <= r <= 3).  Because GENMASK(h, l) is inclusive
> of bit h, GENMASK(8 * r, 0) sets 8 * r + 1 bits and clears or overwrites
> the least-significant bit of the first byte past the end of the target
> region during the 32-bit read-modify-write.
> 
> Use GENMASK(8 * r - 1, 0) to mask exclusively the r trailing bytes.
> 
> Fixes: 408ec1ff0caa ("remoteproc: imx_dsp_rproc: Add custom memory copy implementation for i.MX DSP Cores")
> Closes: https://sashiko.dev/#/bug/linux-2e407b68-a7e9-42ff-a613-e61b47a4461b
> Cc: stable@vger.kernel.org
> Signed-off-by: Lee Jones <lee@kernel.org>

Reviewed-by: Peng Fan <peng.fan@nxp.com>

