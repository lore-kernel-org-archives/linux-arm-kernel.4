Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99010606A327
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 20:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PdSVKcZs;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=dhNLyvNv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=2F6PvEKYGHQJADODQVdR1ExJ/NL5IYL43p0jd3w1HoQ=; b=PdSVKcZsrEfEvKvwB/Yr/WZBMy
	XdC3JLHYy6wtlJU8/v8yEQuzK025T3PuiqowHYAwkCgsnO3z0mjFvbyDb3X4/1n0VjIY5fexKa2fd
	ED6Z14TbcISxmbfgX1rW3dVNqQamY/BuuJ1kxVVPiolGa78ru85MrgczGyPJ/y6tFtXjLXJBLXqPN
	s5Lc/ioT6SWyXQJaDZ4nTy/zbYyu1hZksVmeb6iTcc4KdsSslPcUr5qwT1r7cdMsO5Jhy6Jizpj16
	PsGgoy6G48BVJnFGinUXmrFDZcQUv3papOVWB5I06U5+Yz9qOs/uXM6WRUEN9ut+lRJ+80oopxXKY
	t49l7Jsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRyLe-0000000EVL3-1zr5;
	Fri, 13 Nov 2026 20:58:14 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRyLc-0000000EVKa-1Bkn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 20:58:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h0iMlkbo4rI2Lz1QfObfbUZ6Qe0qN+Eqd4HxstgJyhW3LoPGgLXPpxWbmm+jAW547th++mQIa9Bx2z6XSiqmuh+XjEEP0o8cKFXQSk1skIZ/YLZzdiKbvZj+FDyxlMIbgDXzFd5OzR1da1GPRXxzuNXSKLbL/YmnKb6p098XQH3m0Uu+CrxnVrWs527jI/+bk6aBJw/d36z6ILPk3QkDHWMRrLymcQbYJvpbL3ZvmscQ2IwI5B0ujdeqAzsP2qaWq/XXWQ/mVSYJXzI188tWIxC4HcaspbTiQvQcNC9mndw3MMFoAtXYCcBm+zKk9UEdOJD+FhR8r+UyWfjsxqbmIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2F6PvEKYGHQJADODQVdR1ExJ/NL5IYL43p0jd3w1HoQ=;
 b=uUxcYj1b3FmwwUMdCVhZRjFmt8phwotmGZ1Ndj4SruP1PXgBccXLp6hRpDQLZpVeXLLij+yZLFccqzc0sMA0Lz1vKgU8jUbJbeFyFbkG6nkvhlw6BzAZUkrkqa6va0L7sCELtUa6qJRbm08fLM7/57oOo5PvScje9dFgKA4y8uBpOk/Ye4/NxsbFOuADooMmcZ8o9Pac0UPz88OYB2UYAW14PT/xbER3evQonQsd0YMjA338aki7yqDIFUKuqFa2cQFMM10w/8h0vWvDwqcnZ0cqDQ5gxKffLLwebEtQQ0q0Ft5qOfQFkZ5kRtcyQYyqTA+g0YOUPOrwAERMpryNtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2F6PvEKYGHQJADODQVdR1ExJ/NL5IYL43p0jd3w1HoQ=;
 b=dhNLyvNvFYD/60pzfJ/ojuFmKczCBEdGR6hG7LnQwjHgalWv+PhPcuosZu4aPN+cV5UutMIOxwdMHA0BxH40Yp2I1VVfLFf8TBctB2Jn7pdlFeEJlZpwUbZO/GzDcVLvl0DZaGEw/f65KZbrwb16eazRmCEDodPCok5PoBtM5KUdQM1IPndIrporLgjFWtgU2jlmswowBCQtes+Z0kie/GkrJ9q3HXj2VpJ+GzzSv6+1ouAm5Fi1bv0xFGpDx+/yWI1w18IDnr3ugLNYPqK7ARbp+rP5HjzpsYEMwj+f0cbFQKftnE7ke+Uhadh3Kx5yYgss4lSJojp3EJ0jFIe4eA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by BESPR04MB388775.eurprd04.prod.outlook.com (2603:10a6:b10:12c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Fri, 13 Nov
 2026 20:58:06 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0615.009; Fri, 13 Nov 2026
 20:58:06 +0000
Date: Fri, 13 Nov 2026 15:57:59 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Jelly Jia <Jelly.Jia@cixtech.com>
Cc: vkoul@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, robin.murphy@arm.com, sboyd@kernel.org,
	bmasney+clk@redhat.com, jbrunet+clk@baylibre.com,
	devicetree@vger.kernel.org, Frank.Li@kernel.org,
	cix-kernel-upstream@cixtech.com, dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, joakim.zhang@cixtech.com
Subject: Re: [PATCH v3 4/5] dmaengine: arm-dma350: Honour dma-channel-mask
Message-ID: <avd51_V5aLh3YQrn@lizhi-Precision-Tower-5810>
References: <20261106013520.1134450-1-Jelly.Jia@cixtech.com>
 <20261106013520.1134450-5-Jelly.Jia@cixtech.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261106013520.1134450-5-Jelly.Jia@cixtech.com>
X-ClientProxiedBy: DS1PR03CA0009.namprd03.prod.outlook.com
 (2603:10b6:8:450::15) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|BESPR04MB388775:EE_
X-MS-Office365-Filtering-Correlation-Id: e8da7c88-a9af-4ac3-38fa-08df41c8d127
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|366016|376014|7416014|23010399003|1800799024|18002099003|22082099003|6133799003|56012099006|261021121427099003|11063799006|4143699003|261028144727099003|261022105027099003|261021123027099003|261102123227099003|261009223027099003|10067099003|261026140227099003;
X-Microsoft-Antispam-Message-Info: UaOlL5ubWw+jb1LBabYOughU1W9+C+6IXNlGBK7xvl0GbKAB9oXMF5Ny42Z+6fXJFwmurD6gsA8wvL4Nft724TPVU2or9pmDOwxONbOZ0DSm7DxnWc8GWncbtre5O/R2etnqmV4J4EL+vX+gZ01Y8QWDAH5hWv/ZM7COI/YgbscSBwSqTpCIyL2aOqQZ0H1Q3O4/jsNXtQkM90dbzR8GU/EoHHu+dPM41NsMWHPXvrEqrULcjOUH8GzJbe0J23FebJU3BOc4e6ZWErrD30eJrVYi9DzF1AUZepx6cE1NKjpJTVss8kpVbgG6bebSm3LyD/ZSjAt5SPOTnWFumefT+kv7xZYre8V9zzPmTtGLVU7C6QOBftWZopUHfHmWDXmjb3pmFN00evilF74sUuf4uj3yK31k+sQgEcqBLaDJgHrraQKJNZhGG1ubm7IuV4/ihFJPDQJM/xm+g0mb8P2ZP3kM7yo4oHyM9TEjXd1wYEUv9uAF1WHu2zjesSuNZskCgpF/zDYqJTdnrvjvISdqQSJkAuE+xdfBusfNLfEU3EZzj9yNa8qgpMJy7zlz2qH4nmerFezHTEwGzVxAI34W6WDHb/uwOCCO4LEn/zPDn8Kiv4C1LA39MnEf8aITibcV6Lj5gOnuN2VJ18+Ar/a1Mf/VxreafDtu+7fcV+X8f6Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(376014)(7416014)(23010399003)(1800799024)(18002099003)(22082099003)(6133799003)(56012099006)(261021121427099003)(11063799006)(4143699003)(261028144727099003)(261022105027099003)(261021123027099003)(261102123227099003)(261009223027099003)(10067099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nq9PHAgDPCJGCjnA4N0aF8dNqgr1XJ0YPIRhMMOr++DI8OsEbjXeN+kX9pvR?=
 =?us-ascii?Q?mHGJuKZ/oG+ggKUsrGijZtg+U5Yf4fHWSpLjrnAyppEW9eK6IiLiy8pWtoxf?=
 =?us-ascii?Q?jwvOjd6Wbl/dd+9dji37fCW2EKUAfpRYCGKqeZQTsgCOnGSv6E/yHO2k65zW?=
 =?us-ascii?Q?JEn1G6JmKbk26Yhv6LgffGIQ0rhHXV1Y1YUJXiTel9lWDKFyvoTLANMPyuD8?=
 =?us-ascii?Q?0GhcUf++oOUEC8/O78mmwDXznD4R42c0JFV2+1v93dNI8G8rpfu02Ni9e/4G?=
 =?us-ascii?Q?1wZEBXwUKtp5g5V55DUtzrU9r7TJ05piYhTY4AK8mjufwMYuTE5Vcr7b6Ur+?=
 =?us-ascii?Q?w/Qt2n/C2Ln3qlamEQdireDocxnhWyZxawNPO8XqKkOWeec8XXHi4jy42rYw?=
 =?us-ascii?Q?m4TPe59qL7n6mUsV4DofGopCl35uLyqG7UsYXsjYpHup7tTI7/nHe9JAdokN?=
 =?us-ascii?Q?15xOboUq3aQ6TIZrbrxHMVnl91dr8wr4gD4zvzyFBrvZ2l4fY63CF5EDEBHd?=
 =?us-ascii?Q?PahKL9TSg8fLrglBCTWvWdHnW9pY74ktGfWPdFGFMMMwuzvtoDmbegnHeE1u?=
 =?us-ascii?Q?cBLzuGW0Z+91NM8x6M/0qq4NXInSbUdfHrxGd9QdBylg9UWqqEDmIQYtnK0e?=
 =?us-ascii?Q?2fNj2MfUkSqNE74z9p2azqP1Ac7+8Ll1O62AgViYX2I1PT8XeVjsf9109+vB?=
 =?us-ascii?Q?ucBq0hwxq9TMFTOpWLmeyjXX5wiakj8jGhfiJwtV2+BLHkJU8c/XO/QTOg9G?=
 =?us-ascii?Q?dZfz/y2TEsRF/7PXhdEfqMY3qE1yEsJhu7b8UJNzSxPtP5QcTdWHfPo69Yhh?=
 =?us-ascii?Q?O7fvoT09pJ/qL/TPjJc6rY48hRSTXOOI/6iQLrovF4wD+QCKS6e3A5doX3oo?=
 =?us-ascii?Q?ywi5BCh5MGZ5VWjTrMbBbLy6DnBczN1WoafYWN2C1+TDfql8j1z8nhmLdR75?=
 =?us-ascii?Q?BuVKIEd106ZaoPEqsrf/NYCPRiaE9vCgcotfODIdJLnMS9C3crp2rEdTjIjF?=
 =?us-ascii?Q?9bXRmIVQG+s66Scem12ii7S2NKM709jSuUu3yfaxkUXxyPoQVUH+RCUwOCSx?=
 =?us-ascii?Q?u2gpXjjJAxK9IVZQhmC7F2WdcqRMBZUwBNLAuNppf2YXgxM9HYsLsN9p5QGN?=
 =?us-ascii?Q?z1dXR9CehKn16DvcO6QN/+7k0v33zvYIv9t8lsmACf/eVYqlmSU5YLJKb2Vp?=
 =?us-ascii?Q?PQWfJlB1OhttvwzUO8sljsC/r2vqfbqDRjqb5kOwxIxV99bqCFgTpVgGK1Sl?=
 =?us-ascii?Q?clduO+x6if4OeFoU+RrpKwMGJ2XP1qjop0zpXByHbRWCjwjaj5zEAIOQGeek?=
 =?us-ascii?Q?xKQqB4yS8s+rAfK8tOdY1m3+QGFOtHxCWHvnYAVcjurZE8EnDIQsCns7gKqW?=
 =?us-ascii?Q?iEY8U3qmQtFFT9rIPl1YdNeV3mQ226GVo7WHLtOb7SNqwW1E1o81KQRh0vl8?=
 =?us-ascii?Q?Hie4gYL8GZAxl8WfkulmJznn0CsYDzP2cOf7QBZ6Jbsev2ESTONyk1ACZHvm?=
 =?us-ascii?Q?kgcckdlxhcoyUZ/dbRmrQr3ofu6DFNoQir3qcDSo92mmXow9fakcJv6WDndk?=
 =?us-ascii?Q?xL2GmBhUwp80bSFXVH9XG/onARBIVIW8CxozCd2m3mMIh7SuJi++Hq3wwDYc?=
 =?us-ascii?Q?nmfbtLyhFnI/a49WATj3XU/5fvlNrBjLIqVWhep/d5UqQerWNbcb+fk1NXI5?=
 =?us-ascii?Q?HKWK9ynO4OhPo7U2c5MbFy69uTkIezLQYVultQ7mHqfOOwJ33iVaS7JHQPzy?=
 =?us-ascii?Q?Ec8S7mN4Gzt9Lj8e1+U7jE1C+VV3ZPFX53gESLUpB4aNo2YkggS5?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8da7c88-a9af-4ac3-38fa-08df41c8d127
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2026 20:58:06.8762
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5/X0l1PISxitZY/RX7WZxgGL6BQKph+8PuADXrQvIK8UgTuh9ExGkvRIhCABDElCMAJhFdKPiXiSRlDQgbT3sO+himRS6WwjX6GOGUvvnF+4aSu79ZscPvleU7UsNtUg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BESPR04MB388775
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_125812_328472_895DECE7 
X-CRM114-Status: GOOD (  21.13  )
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

On Fri, Nov 06, 2026 at 09:35:19AM +0800, Jelly Jia wrote:
> DMA-350 channels may be reserved for firmware or another processor.
> Read the optional dma-channel-mask property and register only the channels
> whose bits are set. If the property is absent, preserve the existing
> behaviour and expose every hardware channel.
>
> Skip masked channels before accessing their channel registers or
> initializing their interrupts and virt-dma state. This avoids clearing
> or configuring channels reserved for firmware or another processor.
>
> DMA-350 supports at most eight channels, so a single u32 covers every
> hardware channel without an additional 32-channel guard.
>
> Signed-off-by: Jelly Jia <Jelly.Jia@cixtech.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/arm-dma350.c | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/dma/arm-dma350.c b/drivers/dma/arm-dma350.c
> index c0ed7e86a269..6f26d74295a1 100644
> --- a/drivers/dma/arm-dma350.c
> +++ b/drivers/dma/arm-dma350.c
> @@ -1265,9 +1265,10 @@ static int d350_probe(struct platform_device *pdev)
>  	struct clk *clk;
>  	struct d350 *dmac;
>  	void __iomem *base;
> +	u32 chan_mask = U32_MAX;
>  	u32 reg;
>  	int ret, nchan, dw, aw, r, p;
> -	bool coherent, memset;
> +	bool coherent, has_chan_mask, memset;
>
>  	clk = devm_clk_get_optional_enabled(dev, NULL);
>  	if (IS_ERR(clk))
> @@ -1340,6 +1341,19 @@ static int d350_probe(struct platform_device *pdev)
>  	dmac->dma.device_caps = d350_caps;
>  	INIT_LIST_HEAD(&dmac->dma.channels);
>
> +	/*
> +	 * dma-channel-mask is optional. Firmware-reserved channels stay
> +	 * clear; if the property is absent, Linux may use every channel.
> +	 */
> +	has_chan_mask = device_property_present(dev, "dma-channel-mask");
> +	if (has_chan_mask) {
> +		ret = device_property_read_u32(dev, "dma-channel-mask",
> +					       &chan_mask);
> +		if (ret)
> +			return dev_err_probe(dev, ret,
> +					     "failed to read dma-channel-mask\n");
> +	}
> +
>  	reg = readl_relaxed(base + DMANSECCTRL + NSEC_CTRL);
>  	writel_relaxed(reg | INTREN_ANYCHINTR_EN,
>  		       base + DMANSECCTRL + NSEC_CTRL);
> @@ -1349,6 +1363,9 @@ static int d350_probe(struct platform_device *pdev)
>  	for (int i = 0; i < nchan; i++) {
>  		struct d350_chan *dch = &dmac->channels[i];
>
> +		if (has_chan_mask && !(chan_mask & BIT(i)))
> +			continue;
> +
>  		dch->base = base + DMACH(i);
>  		writel_relaxed(CH_CMD_CLEAR, dch->base + CH_CMD);
>
> --
> 2.54.0
>

