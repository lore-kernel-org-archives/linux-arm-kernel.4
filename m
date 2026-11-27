Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC781606A323
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 15:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=N+6IuOzb;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=P7tHOrYw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=HBRT3zkU0ttbv6d2npqsva1SaQY29yWvR9h9dd3Y3Lg=; b=N+6IuOzbknmvqaCm+BKRnljuT4
	d0DGZONRc6PGz80nMh3Gu1RLIukJzovh+aQojCV4MaS2LMJTRXXqvhYYuuKCCzepCmexbXRHcysYk
	hGRnMCxVWzA40122qJd9+rnNjqH9VDbLcFTCP/fNMx0BzUCI8JxGz/MDNfzuXLbj1MhObbfCvMmVY
	ianof2N5GF5PSoDiDvDtFZnKd/FD1iHUG7Jnkg1tc165QSQ/LwfNLTwD3OttT7wBPnM9QivEV/dut
	UChi5gO6wt6jibXa3q/jZL5JRLVEbJXM7mpt5hsvClyvbJl/61sED80coXYF48R8ibePmWQwcsAkO
	yjhj1oVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxn4-0000000GkoN-1kB1;
	Fri, 27 Nov 2026 15:23:10 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxmQ-0000000GkTA-01bX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 15:22:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a2x8J578e6FXd1cTNVSqKIzGL7slB2RiQwBMY4wx045yLNy6bCmULzluQVTbt33I45NcI/FDaSVOW9rCDm293XA2jM/TiZB3jT4H6kVwLNQgU9ODIv/ICb+r8+iZE/eRAJT7N/gnjxIaBqCMSWr9WRJsA3CtyKhhuFT+bjXBp+Q9R68kZzU8O3exYpjT5uX38PH1CWzMR93/sEfLC87ayUhu/aS2DmQ8qRJ56J60kG8WSSgdWIA/qrvLU490Ch+yhVMdKFndf/mZ/VqwudluzGwAvtiVy7CWTrBwFgUKkKC0CiTcxE+aslRRZyMmzdAVxpLt64quX2qH9bQ/vhncjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HBRT3zkU0ttbv6d2npqsva1SaQY29yWvR9h9dd3Y3Lg=;
 b=EKpytyX26gtcsJL6szfsUWCx67/RYmMhm7J8bM3oCZS7OL+FX26FwRItUpVbeHQa1cqyrjs8oPTDzTyqgnz6S8PhCT/aA8MaS5Zd4PNp+JwByZVOZ8GMfYuNcPCma5HddYYqEUxgMHji5y9/4D5p5uL/WZv6oUh62U4Fzbutwrr8KpBcq47tjCc9ADg0m35doS8qcXjO1gOKMikkPe22nLMJ+v9Q01oWg4g0D7nQtRNkHJucSAiqR7jOI1pUYhLksO7rfyZ00/edP40QXsE3+udpZwnbGVqjxO8BUtj7xEG495fkCchA/FY6ZnmNQ/bTvDO5UT8qOyQZlOjpd0/r0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HBRT3zkU0ttbv6d2npqsva1SaQY29yWvR9h9dd3Y3Lg=;
 b=P7tHOrYwmMdPYUrY32CgrJl8XwQCiqFp8RdAse5zrGyav/TA6mcToibb1qBH9/0+1Qkt5MkbXu+EzNFPXwBeWx9Mf/Z+JxM2VWnSQ99E8TdPK0vavQTrt7P9GquJ3mwzRx5ObuJUrd852V95gEjH8VO2+7GCg6jqIyrYatz4dWNr+eyBXbUiyKv4c5AhbgCprvNRsUhwJQJ/CUKJK3GQi2CayU5lYnN6NH7XNWfYhYNDSZB9rSRi182ptvUK/6Zj21nkqXIXTtuBdTTFTiB+y+Ece3jicUp22Zww3MSSvt0UAGnx/+225YozoVrr6jP5oYVBfUz8pa9NC7u7R/GvVA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AM8PR04MB7730.eurprd04.prod.outlook.com (2603:10a6:20b:242::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.9; Fri, 27 Nov
 2026 15:22:25 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0662.004; Fri, 27 Nov 2026
 15:22:25 +0000
Date: Fri, 27 Nov 2026 09:22:13 -0600
From: Frank Li <Frank.li@oss.nxp.com>
To: Tian Xuechen <202300460064@mail.sdu.edu.cn>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org, vz@mleia.com,
	piotr.wojtaszczyk@timesys.com, manabian@gmail.com, robh@kernel.org,
	saravanak@kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/3] dmaengine: lpc18xx-dmamux: Use managed DMA router
 registration
Message-ID: <awmgJVW30FgD4RX0@SMW015318>
References: <20261127110400.379397-1-202300460064@mail.sdu.edu.cn>
 <20261127110400.379397-3-202300460064@mail.sdu.edu.cn>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261127110400.379397-3-202300460064@mail.sdu.edu.cn>
X-ClientProxiedBy: PH7P220CA0035.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32b::30) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AM8PR04MB7730:EE_
X-MS-Office365-Filtering-Correlation-Id: a6aa2fe7-2d77-4be5-1864-08df4c9a3ddf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|23010399003|1800799024|19092799006|10067099003|56012099006|11063799006|261021121427099003|261022075727099003|261021123027099003|261022105027099003|261026140227099003|261102123227099003|261028144727099003|261009223027099003|22082099003|18002099003|4143699003;
X-Microsoft-Antispam-Message-Info: ZStHokOeVmXhudDsOZGne9X96xuemKZUWOnnypHmWR96hNfuGM3S8Jw6VN3fqAhOkkaEH590t7E7wWPwOMWr+Hvx/QVAqL9ShDtGL55KtAvruJSlrj0+XkovoUwIPJ0u0sabBAkI5fK+tXnPl3WHqHOxX0dUFXC42j8e4DBIN1DGyjC1Oraj7es9YvrGTyWvszHQtxabgGqA9dEnyQKlteD3lWGEJTyx2UXGG99e7PlvLyXfiYTxritdWlz+sQ01m5lKFWMAlPaEATVU+XM++UjufAv9pkr2YSgxHix3WHxd4vNxjqPC/pq/9Az28r77De0GW72S7v7Q//KeRLLS7geXh+OgEJ6eVJazzsBajp3iaoWbxr8UL+2xXysSXbmV0oMZGmUBY/g537/AdzTbbFGKep+DitryC+jVICvflotJyLkvWbd3xLlWwFD3FPLpg1gpCanbCDe0CTfmLLyRei0wzpYhG+EedFl/QOCApLJtoU5MYxUIPWYwCQT363RwFksBx+eEjq5c2Tj5Q4HxeJZtW7hc/JahQMTu2R2sY0tniKuqKJARbT0FHup2N6ewJgkOQVYsS2yZwdKxi00kFwHny95KPX72yBefUt6FfnGHp+AQ53ogZXf3hAP21KGKUrnAoraWhElzEYgJm1YXPw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(23010399003)(1800799024)(19092799006)(10067099003)(56012099006)(11063799006)(261021121427099003)(261022075727099003)(261021123027099003)(261022105027099003)(261026140227099003)(261102123227099003)(261028144727099003)(261009223027099003)(22082099003)(18002099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bEENflFVydwZa3qXXCuN4oI7Zha6tGhXt46FXV2tYCsc8RZdaMYBF8arACIC?=
 =?us-ascii?Q?JjGp3OyWbpdCGEjeoxwenAUkEJftTmiCdQiHUWKcgrWJTsARM5P60QnTMvWP?=
 =?us-ascii?Q?+URIyIiLLYH2QQdUkB7cvGL3rI8F65YuJc8ecAog1WZOl8OsHioWkVhN93CP?=
 =?us-ascii?Q?ZnccARvDmjV4ZKuwUwzJVKJ3alni2++3PI+cpNT4NKyr2STjF/BWMNbUJsNN?=
 =?us-ascii?Q?AlYE54eIFW39OxmAKZmsgMdrItRFYKUiZBSMfwpPjbYOwN7e9DNfs/amIEnE?=
 =?us-ascii?Q?6dV0jwqQxcwfovtC1FWFT2yZVxDapPWaCxaUTox6ZYYLg7c0cXdlvSwSzxdO?=
 =?us-ascii?Q?IDAywWPLj3z5ovCu9Up1nLpX6bXVqlKNPTnwMyvShaOS0BRsLcQLsR8qK2v6?=
 =?us-ascii?Q?o2niDCqdnIE+mewfOuHMd5FHs8g6UQQUOjj9QTLhNwHaOSQQM3FcGtZMVbT/?=
 =?us-ascii?Q?vshReLuXZl0E82pXdTauPXqpnt8F8Osmj4W9+e5ToI7S3I0buLAJ2MmIfkSw?=
 =?us-ascii?Q?1Db80rYFF/64rjl6tD6LXyhoHVNuDBVUjaVOaVqh21euM7Bpl1cZZfotEPL/?=
 =?us-ascii?Q?gtUV6FteGw5GMUSaXxcuY8fQp/0R3rR9SiIakAYio35/3L05Y0IG94Q/0NoT?=
 =?us-ascii?Q?wMfKOqhUxH2qW3zmVo56Yk+4c/kll01uroHSZrPdVZFkwxI6iUy8JMGQDxBR?=
 =?us-ascii?Q?TIRy1dTS3gLuOCI/3GCC5sSAL2xO2fxaw07iSDJv5ldj3FUU75RJ3O2+djvG?=
 =?us-ascii?Q?YRYC22iYzL0PmEJyuwq73hBC2F3zUjZd/C9ntASBJZ9/McHUxl+0bNWAmCmO?=
 =?us-ascii?Q?Jh7fyTaz9kLVD4ekVCcz+I3jNHpf2pRiJcPyNXafQMpu7v1TgiZSO8tdC86Y?=
 =?us-ascii?Q?X51/k2oGaqUrr3c3jNhUddMP4cWoivOKK0MUlJjvEOkGguUiiiit/rn2kN6U?=
 =?us-ascii?Q?+K3hEFDyi9NYvBxYbYKpc4C22o6jHqHkGrgIRahEp4NSVm0ij47G0c4ZMfzg?=
 =?us-ascii?Q?1J6SR6KL7clKL5mqwcEs3M6XvlVDlVKuhe+Njhps4AoVNC3ES94RmHbTMpjS?=
 =?us-ascii?Q?i8PR/R8lusK4fAhGf4nTwqU4G4XikeZ9b8wZnNgVDtPef42qJfSM0YoXkHJ7?=
 =?us-ascii?Q?OY06vS5JyQi098mgGTE8uj9oFhBwB3zNiLj+hLQiwPO7JINjrSuhuDC9ITJJ?=
 =?us-ascii?Q?HiIRvp8GeNZNY/uZPsZa7C94xQ0GD4lvaLTF1VY1FXC+s7VqHqKC39ao2+Vx?=
 =?us-ascii?Q?kzFTvp0XrrASf20+a3jampDEBRsTb8Rsnfy+TdelZPuNVi5tK06J6Tdj31Fm?=
 =?us-ascii?Q?Wp/Kaz3QL5rAxdPStqDgMeUh3sE1TIxwSE0t94dNpydnRfJQl+YeTlB6JL+l?=
 =?us-ascii?Q?tI27EqgoPK2Bt4fSvX+sCwEpo0cJ5237ZYY+gLN/UOd/c48o385iDvu4A/hf?=
 =?us-ascii?Q?piXutkEwdOJKEah/ZZNRX8sUwVrZTRYEQffrCAhzquA0a1+crsVOwSqkVq5m?=
 =?us-ascii?Q?uEVI+a0autOCropWMgqMsMzXMpMtnC3Hg7tkSyzs4Q/BrIuN9zvPCASWUoHT?=
 =?us-ascii?Q?zszubz0Z8HZw8VbF2UKBzXeZIJCIp0sVAFANJA5v8OwVyA0xln6DUOqLWrlP?=
 =?us-ascii?Q?tfZ/rkE7PHmf/IiLi9dDdJlGaDmvHpqEUeaWUhCfVP3CNTOmEfgNSGNdXSoW?=
 =?us-ascii?Q?AZoE/wmUZPTeca7m0+7YclfSAtOP+UJRIIFe/fztieimI7XuxTml4QGB7z2O?=
 =?us-ascii?Q?tMNW1MPGGVpve4+8HGucwXsm8pYMdzDnjrjuivFrz9rHZThIG3ev?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6aa2fe7-2d77-4be5-1864-08df4c9a3ddf
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 15:22:25.8676
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tI70Vofe0kDiMW7f5EsPcJTAg2RtV0B1ATtjmVkMlpiAIbcahbKjzOgofeFPcL15eKjdM3ZR+tfcH67mk0wS3gakPzRJNaaVGITvqPNImkCPjgeh61iPblAD20H2PIh1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7730
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_072230_046659_1617D101 
X-CRM114-Status: GOOD (  19.16  )
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

On Fri, Nov 27, 2026 at 07:03:59PM +0800, Tian Xuechen wrote:
> The DMA router remains in the OF registry after its device-managed
> data is released. Use managed registration to remove the routing
> entry before the router data is freed.
>
> This issue was found by our static analysis tool under development.
>
> Fixes: e5f4ae84be74 ("dmaengine: add driver for lpc18xx dmamux")
>
> Signed-off-by: Tian Xuechen <202300460064@mail.sdu.edu.cn>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> Changes in v2:
>   - Use devm_of_dma_router_register() instead of a remove callback.
>
>  drivers/dma/lpc18xx-dmamux.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/dma/lpc18xx-dmamux.c b/drivers/dma/lpc18xx-dmamux.c
> index d3ff521951b8..0c6758c53a72 100644
> --- a/drivers/dma/lpc18xx-dmamux.c
> +++ b/drivers/dma/lpc18xx-dmamux.c
> @@ -166,8 +166,9 @@ static int lpc18xx_dmamux_probe(struct platform_device *pdev)
>  	dmamux->dmarouter.dev = &pdev->dev;
>  	dmamux->dmarouter.route_free = lpc18xx_dmamux_free;
>
> -	return of_dma_router_register(np, lpc18xx_dmamux_reserve,
> -				      &dmamux->dmarouter);
> +	return devm_of_dma_router_register(&pdev->dev, np,
> +					   lpc18xx_dmamux_reserve,
> +					   &dmamux->dmarouter);
>  }
>
>  static const struct of_device_id lpc18xx_dmamux_match[] = {
> --
> 2.43.0
>

