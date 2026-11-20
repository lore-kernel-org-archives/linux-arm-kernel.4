Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A09BC606A336
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 18:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ntXMZb1X;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=lUj7Bvyg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=2QUHAUTqiEJnVLLExqNqkOGQtn1QYiLKUtRRbVfzgY0=; b=ntXMZb1XB0zshy3y2BG/h0Bb5T
	r2VEsVjW1e9usV+P2Ec6SEW6cVtS392CJaZVD4f2mxAX3D018qLNGay4bnLY8gtICdpfxUBQXscm6
	06oN4F2t1+IA7d700Smcvd6wQ4Rpg0iTHKf3BfBk7fprFV1U61A+EOLeiGNvi4KXnpxgyEKGDI4WH
	LgK903YM4PmCFCxeoXwGEZkiVN7rLMjo6FsyfkGrQi5GQjDTZu6Aer4ClYJRbd5YfFoykTtlbMwvO
	IhEF/pK+yzZY12kRUKEowIdtzJot8jZenbRqfonYHD6LbuzRMeB/LyJbgE3QfDytLYqgPXc/ovES9
	F8y0cAqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUT2N-0000000Frdg-1JBK;
	Fri, 20 Nov 2026 18:08:39 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUT2H-0000000FrbT-2mIU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 18:08:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wFiPINxvgudfimdP30y9Xwlo5IdUAhnV0ig/jGARj016fxVC5Fo694UxGZWpRjFC9wnhbm0gARhuxa+iSkeBhgtYNmvQuxXqEg7N2qzkrDItplVAKjM/GbG8U3jUavDmdHStWj2Id3wMQwMt7gocRmjuvhrVto/0JmS1tHw9HnW7Xuk30/mm/2YUZfvrd+iv/O0Lf6QrqDByKxTy8Q2G//A1C0ioWW5WUdpSvrty3f0Dx6/mxgVn6bCkIW86p7ymJd+FZ8ZDzQ+K1h+fpZACeGHlJUe7lgXSmqMW7pFgXBpQ/e0j91DoTCNGaOzKNYNYsDX+RglN3wmvg1u7uqVDVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2QUHAUTqiEJnVLLExqNqkOGQtn1QYiLKUtRRbVfzgY0=;
 b=HhulH481Sn06mIwaj5udDmhJinLLKuSUOMahYIJIPN40RYS8OzWTxpPU5NG3i6ksz2+LE5CCk5v1jWxyotAid9nVu0DbLwWe5YhvFUPrh0kDineixD7ZTWMnHF8zJpnYjuyJOjlXF5wrL+K2OfeoYw6fE8CGPZgDsQfLF/PWYxPkHpy4nw8rXA+zvDSosqCfcDyenoRMNuteXNCaPAXzGOwPzNF4OLlnl5lKZWztXS2CDVXyibvgl3DlaIZzdNiJ0OA+1M8hh/slO/Ov0LhIa6IVcUVymE2GC6GEogxOFZRw2yVixK/YPjBV/nWuF50t1wwlGvsM3vs1RLwJOUDs2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2QUHAUTqiEJnVLLExqNqkOGQtn1QYiLKUtRRbVfzgY0=;
 b=lUj7Bvygb5E0wkGMK/gisz+VvhK70okYAo57Xxy3P7xI/mkQFqezY043a0JP3mf6ggibdCk5ptkOMeFU38dSCDdUUt0EdoqIRvsW0UmZpsbImDt5P/rofFUXFgLKKPm5aJ5SctAZVZfxH0dilKh8Lr/NshAnUPtzxCHEn+/P3oLDl9QFjbOqWzdvRxi6Uf33GBPOlgIGJ2xGbF9avV34lV+OsYRh0zOwhlPJY969bgUnE25kFBndmaNF/1pYQAYKVanDSNgcYAMvk17wkLbhoHKI8W7fQeuAPZQBh5ST1u+Psc65fxGi8cF/PAyHDRg1TD0vCeqkcthXLo4LEKrkOA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AMBPR04MB522251.eurprd04.prod.outlook.com (2603:10a6:20b:7da::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 18:08:30 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0639.010; Fri, 20 Nov 2026
 18:08:30 +0000
Date: Fri, 20 Nov 2026 12:08:20 -0600
From: Frank Li <Frank.li@oss.nxp.com>
To: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, dmaengine@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] dmaengine: imx-sdma: Fix potential memory leak on
 channel zero failure
Message-ID: <awCMlD0Ngktbf5yk@SMW015318>
References: <20261120173507.3923720-1-liguangshuo@mail.sdu.edu.cn>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261120173507.3923720-1-liguangshuo@mail.sdu.edu.cn>
X-ClientProxiedBy: PH8PR07CA0028.namprd07.prod.outlook.com
 (2603:10b6:510:2cf::23) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AMBPR04MB522251:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b91514c-74cc-4b9c-144d-08df47314877
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|366016|23010399003|7416014|376014|1800799024|18002099003|22082099003|11063799006|56012099006|261028144727099003|261026140227099003|261022105027099003|261022075727099003|261021123027099003|261102123227099003|261009223027099003|261021121427099003|10067099003;
X-Microsoft-Antispam-Message-Info: VPKkFl/B1Qs9l3/rkj9ChsHUaCaKxZ0TCBr4nUdoy3tPAEiO7GSeQ3kd55J+/vBbNgWd0G+9b8SJeE1ChZNKUTCI+OhDEZkaQQoNWrdECBcUAJksg7PRkSg2FGYy+1gZg7PXjFPMUpv12cdKId5XKj53C/G1agofxJAUqTcLvyi+eEaW5SGKFeHegIAisZh7pGl6V3ObRCjwFTDCdtT+x+NcJBMwCStW0kpGYdIk3ZEEjsM7GLzZIEihtPxb1+ONTGEtOq2b+sBqJsXbUm4PRgh6t+eYmuMxIyMDCWXsVKpt0OnONR+rabRg7m1PkYSjtBM9PDoBhywkxOAPP9CyEB/qyn3cOLG8vIhGl3+6gg6ivu+RrB6Xq3Lh3Omv9QyUrX8C15kMyb4OMAP0bIcEBbNcbjw0ylIzo6dt54VzYHEsx5K0Nfl06CV+EbxGykfDRcTHMlMHAQGjzOxQQDMlHQC8hZsov7DUChQxXhDeK9zsrH2qQD9NgbmnjCv4SC0JIGh4huTrKrdsxLsqxRHK9jxmCcMW4tczC4x9tJskdNPyRALYdcBP0n7OKzWsX6T1BZhJDX8LV5oo8CjBZZdiK7NrYq2mVfnq9XKMgq2vqYIr6in3+90R8P2DgJupcWLGnhihF1ZHcww9orB8srBuZTBIPnqDAVZbcom3cmB/Iw8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(23010399003)(7416014)(376014)(1800799024)(18002099003)(22082099003)(11063799006)(56012099006)(261028144727099003)(261026140227099003)(261022105027099003)(261022075727099003)(261021123027099003)(261102123227099003)(261009223027099003)(261021121427099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JJnzAuI65a+c9sWD3ovR+WxU1MDNKOyYUH77e6GMNyHfplO+bIRUxl14nezj?=
 =?us-ascii?Q?Lkx+Zv+CElC7MWMPD5ujrqdQ4Y5KbrpDwZGjkZr31HhA+fisylRX/Kl3MrOy?=
 =?us-ascii?Q?IxQjK9eUF9eU+UTGnT9SUErsdhtuFJLg3cOnAxkL8HcsLcCh7yQ+jQD0g/1d?=
 =?us-ascii?Q?5rqP9x+q5XqyviKxj8K2FeahE8jN0jkAWscUm/zop12lovoEfYrl7/ptieL2?=
 =?us-ascii?Q?BlNrGe4DP9DXBpbkG2SEm3a/VCPRxZixJcA37tkOeZGABdKcnWcYZB3slvIQ?=
 =?us-ascii?Q?iXfDSNpnnVnI96k8jkL+topy7Z19GjY6MyGC97MUljI61axV981sXUXoLOp6?=
 =?us-ascii?Q?HthXtu6d9+BCknMqjelGkNfJm/em3IACai86Myt5BnbW7vkcka6S1lu4q/g6?=
 =?us-ascii?Q?XM25THVFZ0+Vs9k8ooZ+hKwJYI4py8JGP4AUxJbETPgAOqT1vZPEQkX54aQt?=
 =?us-ascii?Q?9H6/IvQ1qPj2bKUAqFVqeZA7pnSoJMfzo6rH084pNN6Q30LJPuLSoShSGOcN?=
 =?us-ascii?Q?3WJWBwN6c76ZZoGrpbArfpopMJB6699g2Tj9a+3u+xTNA8BKsnnnrjys/474?=
 =?us-ascii?Q?F1ha1YfC/3Eycp6yRN+YyG5FQWlqUGt6XfkeLjGyb9sRIHxpiOW40KazDm/k?=
 =?us-ascii?Q?nuXi6RDzsK95odbt3pUSgp2rWMXstoFITEYq/RT/0uifmXYqJeUDdEyCWBvN?=
 =?us-ascii?Q?pkXJktOSfk+E4cnzPYj2++Sw0Ik3xQBTsvk6Hn/f0JT1pVpHNLqGlHyeD0Rq?=
 =?us-ascii?Q?rXV+O2b8Sw2p8QJvIyfvhBEBSQ5xFKWTgfVINXPTbFcufK1TCuUX8KhuYRsu?=
 =?us-ascii?Q?zB1ohjIDURT2Ja1pUudhbJ7CmKWVqTUNbWKUGE1Jp56mHqCLMo4N8H46t5nT?=
 =?us-ascii?Q?dLYPbZuANMHTDpG+je122OlKJM2HlQZZF4phuKI7INDWVv9GCu0yVf3zWwuK?=
 =?us-ascii?Q?nG1O/T3Mz/FvvWey39fp5cTkgcWfCuY2tRyGsuMjRcKnVQQE6NkI1Jbzk4u7?=
 =?us-ascii?Q?V8zyUB07C2mG2Im+a+kAzP0Hlw3W6TjE0dadHj/GuPVdwKBQux09ZcbOGYb4?=
 =?us-ascii?Q?nKW58XRdAVfe2u19WQNmo+p2A/h0E67XKKzMMOJlmMWTNgRQsw7A58Cjp8IG?=
 =?us-ascii?Q?Z6LpdVLpJrQckjl2kv4wA5rlKuZA99HSikKADH+segVCmWuh8brc0q+zB2R3?=
 =?us-ascii?Q?pdHhIWujyUqCDTRJo5YJl2y8bTTbUUi7BFyGR4JkS5XHnBOuREOuQmMMSk+A?=
 =?us-ascii?Q?wXeHbZ7FW4j7Qya13E2UjCPL05ZORxVnjjPcnnnhOLvJmTAWLuQQ3B5j1o93?=
 =?us-ascii?Q?s62vtPHO4LuvbzRS7I2mDSiBeXwj7r2K6G1bCiunkoI55GUgwim5I0pi4vDM?=
 =?us-ascii?Q?yIzD+plq0nBuc2mvHDDFA3ePtvTyCkfj9UbRGe5t8IUKSw62AGspN/yGtGX7?=
 =?us-ascii?Q?OaetFTUA5V+RWpr8JfvRgCD6aTljUUZgw8IxVkc3wVe6ASczghrQBan2TA6u?=
 =?us-ascii?Q?1nVx9B+EZyKnC5t2bqDtFv4VdJIQdG1VGm4URQFZSAAqizndYBTZHleNkqQE?=
 =?us-ascii?Q?Zucw8LHMGM78Hdk+Cr+PJYRV3jVrEu/Ey71Ul07IkHRXFkks4uKbMx2ZuKht?=
 =?us-ascii?Q?rthOhWKv4kbgHOe3+AL81dmR0kFNiG76A5ADTRiFYI+Fya8arUlxF7irIVHj?=
 =?us-ascii?Q?gO+t930ucOKKkJ5AF2NBGO3TqbBwk0Qr+R3IzbU4voTR4CeifPUcShqYdVUB?=
 =?us-ascii?Q?wlLeOz5Rihw3Cft/onWEGNH+2TKWgqg2m34N/2tA547Pn0cbWaaK?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b91514c-74cc-4b9c-144d-08df47314877
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 18:08:30.6653
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MLyWEivGE13TyH6BRI6VWxJlwTIy0fedrmcDU8KkssABIAYP5rPacBXHbbo/S6SMor28/CJff6WOrcMnbYWei7MatLabuVMcQzE/xBNFI/FF6YUtNRZDoK3Vmc5Dmd3P
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB522251
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_100834_725589_DB4D35BE 
X-CRM114-Status: GOOD (  17.00  )
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

On Sat, Nov 21, 2026 at 01:35:05AM +0800, Guangshuo Li wrote:
> If allocating the channel zero descriptor fails, sdma_init() disables
> the clocks without releasing the already allocated channel control and
> context storage. Free that storage with the matching allocator before
> returning the error.
>
> This issue was found by our static analysis tool under development.
>
> Fixes: 1ec1e82f2510 ("dmaengine: Add Freescale i.MX SDMA support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/imx-sdma.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/dma/imx-sdma.c b/drivers/dma/imx-sdma.c
> index 36368835a845..9c0087b3b805 100644
> --- a/drivers/dma/imx-sdma.c
> +++ b/drivers/dma/imx-sdma.c
> @@ -2161,7 +2161,7 @@ static int sdma_init(struct sdma_engine *sdma)
>
>  	ret = sdma_request_channel0(sdma);
>  	if (ret)
> -		goto err_dma_alloc;
> +		goto free_channel_control;
>
>  	sdma_config_ownership(&sdma->channel[0], false, true, false);
>
> @@ -2184,6 +2184,13 @@ static int sdma_init(struct sdma_engine *sdma)
>
>  	return 0;
>
> +free_channel_control:
> +	if (sdma->iram_pool)
> +		gen_pool_free(sdma->iram_pool,
> +			      (unsigned long)sdma->channel_control, ccbsize);
> +	else
> +		dma_free_coherent(sdma->dev, ccbsize, sdma->channel_control,
> +				  ccb_phys);
>  err_dma_alloc:
>  	clk_disable(sdma->clk_ahb);
>  disable_clk_ipg:
>
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> --
> 2.43.0
>

