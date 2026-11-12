Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74F9A606A89E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 16:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0RWa6w16;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=IN9Evj3z
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=/jNLFJr6NX3nDZAMNKTQOMDY+y/6iaJlnbuKVlA1g/8=; b=0RWa6w16ZEyPvIPOjfm6EjMOLg
	ZpHsJr3ie0/kkXLWmRYas8ROWf+WcKYe/KkO0I3sUsutl1BAxKbNkIU13A7fCtQmB98TWFqvHe7NN
	hpjJ2AGooOtVyfoYkN/tzqJxdAkClAlqSaRw4Mk6z4KMce94ar1RqL6x8ViMhEMk+V/YqImBrKZnb
	9ufU93fQfuLq9X5OTY0bi91dHhZe3o41P3UBdF7EIslVaE3wJGJHiB9rT6KiTzgUgvphrCkPuhJsd
	KmveC7yswekHxVawo8V7V3xKdxv0ZgA1Tre20SGEIYuo2M48JkTI32As+/Le3C7BFFfgsR7l9yu2H
	I4qMokUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRXJO-0000000AXau-2yZr;
	Thu, 12 Nov 2026 16:06:07 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRXJL-0000000AXa6-1JRt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 16:06:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ONNAQRECuVbXZ+u703UkPY207EPO+FNqmsZdtHUQe6414ef53BSskZ0ryoOn8C7i6EvYmU3BqILV96/vwTmmHdUz3Erd8vAaqj0inqmGShPom6ZIePUX8EWNd3rXicgRgtb56ZAP3eYZX0vPq89D4oqZQt9edld6JcLbTchUVyNT1nmIGrf9RLJ2phv3AMQVovy9jvIBcdbn55NrMBq4I8P64Iu4qmqqDf1ns5JPI2q5v53wsZFCziyjBG9QiuF7WEn7AuZWIBOwZky26f2yokpEeYE7M6/Eo4rj/WWWxawnGJcPFIY+Q0j1VVmszoneXwCmSBOcn/6rOTStbGj9dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/jNLFJr6NX3nDZAMNKTQOMDY+y/6iaJlnbuKVlA1g/8=;
 b=gVgOIOalkvOuqI3WQtFB10sLeF9RNZVPos5yQJJVEKRqvyKjSj6fRkbzwoOXluioo7QX1yqtFsbliBKfkbFnv57hOL5VTQ5xINhtYtpHleopiftUZ0KRykcNumlbvqjhe6+707bwWoHDfDsAZWITvmjmZBxbY9Bb5PO5kbhlbMup0StNwX8M1eQ9hpsywkhL/gn87dSUHDJCpa8kt4ynjHKRtNkEsD4b81qoXe6xSzP8OKCtUkZ9WZc8wwT/b+hVe/Q9OV74hn6+Bh4KOlJ5lIyTmQ2veC4HU5X/2mbpqkGxJfaAsH0/3gkXy/ZwCyM6UlAGOVs+XjQyE81yguW+rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/jNLFJr6NX3nDZAMNKTQOMDY+y/6iaJlnbuKVlA1g/8=;
 b=IN9Evj3zIH8GG0AMgaEmS87rATE3GxEtJCLbn+ETTqy/wttmGmGG6JmoYsbsTIHUv3S4K/UKb4nYDxYX4y+WPoYEwFXbZ5O7Vv4JN8z9Ul85R6MypjTNSdJnlE+xJUhTRojmJds3slR7VVz8UyT+07+7D4B2kNgHpgDXap46z1e6AbfS+Ff+Qj1cBFYIOnHLLHz2Ex01cIeyrntRR6r4zhASCOkbj/e8INT2qcHBPphouX4SYZX5BFSpDzyUST2FXZRPmVEyGKimviPzBaV5nLo1RGwO/wM44+aQj4X3tdOtwfbc0s26T4SXkHp0vNliPvso2qF9CRGKL4uZvKusFQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by DBAPR04MB7336.eurprd04.prod.outlook.com (2603:10a6:10:1a9::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Thu, 12 Nov
 2026 16:05:55 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0615.009; Thu, 12 Nov 2026
 16:05:55 +0000
Date: Thu, 12 Nov 2026 10:05:41 -0600
From: Frank Li <Frank.li@oss.nxp.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>, Vinod Koul <vkoul@kernel.org>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@kernel.org>,
	Larisa IIeana Grigore <larisa.grigore@nxp.com>, imx@lists.linux.dev,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, linux-tegra@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v6 6/9] dmaengine: fsl-edma: use BIT_ULL for 64-bit
 channel mask
Message-ID: <avXj1dfeFOWCo5nZ@SMW015318>
References: <20261112-edma-iommu-v3-v6-0-b038edb8ce6f@nxp.com>
 <20261112-edma-iommu-v3-v6-6-b038edb8ce6f@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261112-edma-iommu-v3-v6-6-b038edb8ce6f@nxp.com>
X-ClientProxiedBy: DM6PR05CA0051.namprd05.prod.outlook.com
 (2603:10b6:5:335::20) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|DBAPR04MB7336:EE_
X-MS-Office365-Filtering-Correlation-Id: edbb2fc9-c449-4cc1-fb8f-08df40d6d550
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|366016|23010399003|376014|7416014|1800799024|22082099003|18002099003|10067099003|4143699003|261009223027099003|261028144727099003|11063799006|261022105027099003|56012099006|261021121427099003|261021123027099003|261026140227099003|261102123227099003;
X-Microsoft-Antispam-Message-Info: tOBvdHuskvXk7eYogfE+sQZ5GwowL0dFM7T6HF8OIu56mwPsWar1l/ov+srcrUGlkyVC+Ds1s6aixBq0t7B6VgJ7/mpEu6TvtoLGY5uWOekhvVDTmKeJpM5mj543QaApL0o/RgecNdjZWTrXyRDG+epRdtlegxML5XE5UprUMb1mWRJlCg4IvSJtW6/YmuykhLPdys6KYQmX+6zsJevTwj1PHVLLsf02dQ98To2/VzYl4jILMKcgx/AF37VNqhHGhGjgupcnzi18MAhywBxWRIN+gSwWdt7nowHU9Bd8hAhMAVI5mIgMQPeRW9DrTLK7MlvbT56+oEQL3K0/lXyYmmvFJh4Lmmr2H7iD4NV0rjtL3H6qygb1SVpNQILSzc7MqnVQpZIQqsi5Eqorw1kbEpIEQmoOubK72B5xySR4AVRdlMhVlFrUF6RDp5szYNFcijioYIk3e42Tmt/i1XBydWncsRx0lcgaT1UbIG/xTAl+wKZNpeLK9DJd8TDc953/UxuDAEG1CfSD8FFO/rSkLoalP2c2EhF80//X1FSZAI2AWaUjLDEwIDwdN5lvDkxpUrpBjcM/VoAkbS4WlubzEFbAJ4u/uCG9ZwbjRg0Dfc+vbthzMhKPFtU+hoozY2HXqZr1oViIw/aG3UKJ2xze+GDsBz3NZlmd2lBmyu3ak7U=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(23010399003)(376014)(7416014)(1800799024)(22082099003)(18002099003)(10067099003)(4143699003)(261009223027099003)(261028144727099003)(11063799006)(261022105027099003)(56012099006)(261021121427099003)(261021123027099003)(261026140227099003)(261102123227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RX5lg9Ta6oXqKFb+Q83UKf7V0gzXlWXCi6tLmmDUSx5GXfh15zuYkJl1iTXU?=
 =?us-ascii?Q?1l3TkA5B5HlR9xK/j/l9gHgpYuxbhIHu6pVZXkQiqaR6B2dcBQJdvqgRuPgZ?=
 =?us-ascii?Q?0WdQc6HUNzfhMu//czIX6RrN9bj0CU3F1kisOXe3eRsxXzVGQHmn5O8BS+NG?=
 =?us-ascii?Q?MKTOvs+X0mVxmydbVSJjAeqeMxluPr9CFXnnariUc8k1LOEBb8118zJjwUMG?=
 =?us-ascii?Q?fMEuuDU79VqJ2VVUhUPabOwBNHnQoyeDg3sa8Kh4kE6+TTjLd5QfOurOpGmF?=
 =?us-ascii?Q?qGlWef0BfrRrdA69YJKMlu3Mnob9cLp9gOM9rlFV13nV7VHFhINIwyPsxSdm?=
 =?us-ascii?Q?7tkoSYMOcSADFcAvgQ9I6ReCTNJEr/XW1zCDMVaWoH5dsBp6n/n0KbzcMUB7?=
 =?us-ascii?Q?zcBw+oW7jVc6tkSZsLedWWmCtin5M/J6Ec5YAo/Nh5+MOaqv2ov53UnYY7Tw?=
 =?us-ascii?Q?T8Rv5d0KRvd94Iwy/gDCz0oDb2SL6rs08ud1PWPSxEmDWlDugtUr7//kRi4i?=
 =?us-ascii?Q?W2/FEUt6M3saUR8Hv+0OqY5uIcHfR+OWxDJLO6tBq4QG7QjUMEBGHz1FT99g?=
 =?us-ascii?Q?Qeu3fbIQ2WNMjKq1zgqoWQkAfaM50a1Hnx0cNmRnXT1YCN6D6FgaMRIEASGM?=
 =?us-ascii?Q?w9E29v6y1ieKtUnE8LOTHX02evug9s/UCbh7OLKj/zE8Ksan1zrJ1keWuHNb?=
 =?us-ascii?Q?XRLUtKJiSLo+iMXuY3tqsTRUaN+u7jK8jEklhAYPVUM1pyhO6qICl9D1i67m?=
 =?us-ascii?Q?J4jZ7UptrC8TpKBX29G5b5sGL7nigTicD6rDXxH+Rx59wPc3luD0grJOaBlN?=
 =?us-ascii?Q?S578HheqaJutdIyPWj0Aqpb7P9mw+fMH17dCPA8Pv/qt+K52Flq3sGlSm3tt?=
 =?us-ascii?Q?AXWAGnHkeIQMt6mg2Q6slDVzJOsAvFCNY2bT9EmEI4xs1I7jOAg/KDiKvLNe?=
 =?us-ascii?Q?23VKdSe/RIp2ayMy+33TaDDrpwCW88Vnp0f1TZf6+UXGmjmxKbpLniMQfHML?=
 =?us-ascii?Q?EO7xhEk1IxPzrowPQfcOP6xrv4444qhb2g/GOgakD75IhUZJtSJ+6Cn5IYy9?=
 =?us-ascii?Q?WfPKu8SM6XKCESjZHPGcVgEv31P+qkn9aO4u2xTOrPZt5hvXd7EtiX2Y8pix?=
 =?us-ascii?Q?d27ngR2N54qpfTU/TvfyBcJGfQoN3eNXAjKpAhWN0YLSpS3K5o8FengY0NuS?=
 =?us-ascii?Q?MuMA6kvkrX07jn+ZFMm3rskmLUdtcIovfpD0cBa7xCrw9hULmKyc6kIzACVj?=
 =?us-ascii?Q?OvzOowT8k0tFguMJMcv2JHiNrbC6sFmcJX+Guqd7rsUB4pc61HoLHqUuoKKf?=
 =?us-ascii?Q?6rpqoW5hdHIKtMQ+CK6QUtI9OlVK/LSbX9lYMXxQTR/RqapPdPadfvRKv5tW?=
 =?us-ascii?Q?jfDKnq7RFsIThB0XC2q5A/ahEdXsx+E7RnPwcKi68mJn6VAG2eY3LT24VtH8?=
 =?us-ascii?Q?jE/A3V+6odR2hEdzJ7uJ7i1uma2xuXb82mJJ9bGGHUzhWtSC+6xDCo0dUDEb?=
 =?us-ascii?Q?l9Esf7AX/Ahbbxv1ttsycZTJ7tto8fzRChd4kfbwBE0PFJVwbLr+VMYBZG3W?=
 =?us-ascii?Q?UMVY2K76eNyxi/I/gHoyxO+tgiUqfeIJaT1qVnHQ6gaUT/Hv4iqJTX0dEukZ?=
 =?us-ascii?Q?9ukFhCrryCbUkugXbSzHOqhEIfyw4dNDeBBp+hQcCZI3k6HjkUWvxOYlFIEG?=
 =?us-ascii?Q?4rG1JQtv6i/JOyp0tHMXNxszZI7azl5QHX/QHBULQR4oykrSvKJVyGTGTtpR?=
 =?us-ascii?Q?UISaDAVhW3PA2rR77GUnyPMPKvKYu+7souMS1vxSVjGclkM6cLhg?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: edbb2fc9-c449-4cc1-fb8f-08df40d6d550
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 16:05:55.8011
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: THqQMhdATibVHcD8HLThRLFAt5A3fYdP91lnxsPANqBOz4KmGEjLpQn/hvtqb0gMKlc/NmSd4FaB/pA6EHUdOAkOHxduSUt95Kma8GsdlIiQUp2SRY2135uA5uDb+LP+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7336
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_080604_085594_1DEF19DE 
X-CRM114-Status: GOOD (  20.55  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 12, 2026 at 03:53:09PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
>
> chan_masked is a u64 bitmap, but several checks use BIT(), which uses
> unsigned long and overflows on 32-bit architectures for channels >= 32.
> Use BIT_ULL() so the upper channels are tested correctly.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/fsl-edma-main.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/dma/fsl-edma-main.c b/drivers/dma/fsl-edma-main.c
> index 7f82dcb7831d..818b9b986f13 100644
> --- a/drivers/dma/fsl-edma-main.c
> +++ b/drivers/dma/fsl-edma-main.c
> @@ -123,7 +123,7 @@ static irqreturn_t fsl_edma3_err_handler_shared(int irq, void *dev_id)
>  	unsigned int ch;
>
>  	for (ch = 0; ch < fsl_edma->n_chans; ch++) {
> -		if (fsl_edma->chan_masked & BIT(ch))
> +		if (fsl_edma->chan_masked & BIT_ULL(ch))
>  			continue;
>
>  		fsl_edma3_err_check(&fsl_edma->chans[ch]);
> @@ -397,7 +397,7 @@ static int fsl_edma3_irq_init(struct platform_device *pdev, struct fsl_edma_engi
>
>  		struct fsl_edma_chan *fsl_chan = &fsl_edma->chans[i];
>
> -		if (fsl_edma->chan_masked & BIT(i))
> +		if (fsl_edma->chan_masked & BIT_ULL(i))
>  			continue;
>
>  		/* request channel irq */
> @@ -641,7 +641,7 @@ static void fsl_edma3_detach_pd(struct fsl_edma_engine *fsl_edma)
>  	int i;
>
>  	for (i = 0; i < fsl_edma->n_chans; i++) {
> -		if (fsl_edma->chan_masked & BIT(i))
> +		if (fsl_edma->chan_masked & BIT_ULL(i))
>  			continue;
>  		fsl_chan = &fsl_edma->chans[i];
>  		if (fsl_chan->pd_dev_link)
> @@ -669,7 +669,7 @@ static int fsl_edma3_attach_pd(struct platform_device *pdev, struct fsl_edma_eng
>  	dev = &pdev->dev;
>
>  	for (i = 0; i < fsl_edma->n_chans; i++) {
> -		if (fsl_edma->chan_masked & BIT(i))
> +		if (fsl_edma->chan_masked & BIT_ULL(i))
>  			continue;
>
>  		fsl_chan = &fsl_edma->chans[i];
> @@ -797,7 +797,7 @@ static int fsl_edma_probe(struct platform_device *pdev)
>  		struct fsl_edma_chan *fsl_chan = &fsl_edma->chans[i];
>  		int len;
>
> -		if (fsl_edma->chan_masked & BIT(i))
> +		if (fsl_edma->chan_masked & BIT_ULL(i))
>  			continue;
>
>  		snprintf(fsl_chan->chan_name, sizeof(fsl_chan->chan_name), "%s-CH%02d",
> @@ -927,7 +927,7 @@ static int fsl_edma_suspend_late(struct device *dev)
>
>  	for (i = 0; i < fsl_edma->n_chans; i++) {
>  		fsl_chan = &fsl_edma->chans[i];
> -		if (fsl_edma->chan_masked & BIT(i))
> +		if (fsl_edma->chan_masked & BIT_ULL(i))
>  			continue;
>  		spin_lock_irqsave(&fsl_chan->vchan.lock, flags);
>  		/* Make sure chan is idle or will force disable. */
> @@ -953,7 +953,7 @@ static int fsl_edma_resume_early(struct device *dev)
>
>  	for (i = 0; i < fsl_edma->n_chans; i++) {
>  		fsl_chan = &fsl_edma->chans[i];
> -		if (fsl_edma->chan_masked & BIT(i))
> +		if (fsl_edma->chan_masked & BIT_ULL(i))
>  			continue;
>  		fsl_chan->pm_state = RUNNING;
>  		edma_write_tcdreg(fsl_chan, 0, csr);
>
> --
> 2.34.1
>

