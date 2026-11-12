Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38240606A89A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 20:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iXIU6z95;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=SNib4G4r
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=XM00FhYB58k9jworWW7yMqGybIMLmmnPtQHFLzAUGDA=; b=iXIU6z95E0ABlRqGTIGqq7jpB0
	FgRP+lkMI86XhsJiXrVd0a8PUt+3f3GJKJ+a1v2dJJ2B1U6Z2I8yQD/qCqotdX8PsK3qcRoDshi5k
	1Xvy4Ye2D2UH8qTbsFfgrAf+uLbR+jqqNgsZYGlfAKyDGKFVd2yqoxv4laLl2a5X/V23KxnLvqKIB
	CRWvPJVThnP6mYq60Rdhl1JeRcHs7VrFmOo4cHLPNs2hBlHL+JfCjaysnn5UOoq6JYKWWmgSEkFIR
	ETn9qW5vEiphT+Kq9pI+reuMwyMpGflD+rm2MH9IMHx7S52ykjVEZL1ngU5zfWwqUwX31X+VXPb/5
	RnCx4Djw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRbbC-0000000B1hx-2d6u;
	Thu, 12 Nov 2026 20:40:46 +0000
Received: from mail-westeuropeazon11010061.outbound.protection.outlook.com ([52.101.69.61] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRbbA-0000000B1h7-01xU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 20:40:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LaDYEBQid/ownE98zsyo826cZfLSNy/s5yvgsvVV/PHH/uNUHGSD3QG6rVoWLU4GKxc61o6KKDrQS7VFLyzgppRW7nPBjntjrCJEwNIKO1V0ybXSnQ3StKdE/FSB7d1moPXOQ8rsmroN/6e9UHFRB2suuznFzn4fH+z0WR0lc023NMthJ5N6fNozPot389P+zi17T3xTzltNe6f52QKbbiS3D2leasIOagr8wHbz94opMEdpYH/EiNXQocWVa9nGqS51D3YoPqQK/CHoU0ILNdP7E4DYEEQ3BIlAw+aVPGoIoia+TjkLSZeTukk+pEaRKVPtdFGDFvzMnoAa+wBmGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XM00FhYB58k9jworWW7yMqGybIMLmmnPtQHFLzAUGDA=;
 b=unSF1reAsCAPUV9jmrvs52AIgcetJaotk2heHmDxIdXYPZ1zhz5nh8Fynv8jlyr3h3t4JjhvDL6maC0DCC1ppVCjToSPqvBo6DZ4+4CRC9YhgesEDV+vNAg7jPr06zy9JerEXINYU1grj18AJqrZWETOwh7UUq+av7QcJSE2NCYDQjr7yp1qt63qXs0hfE8PGhA5RYnoDc7CmiGDyFq5jX+acY5VfcigUITRD6alScXsFJvFhEX8wpXYb4nYCsrymfHbD0yHr4YO402TXnbmPc/xjqeTxACOvmCj/6CcXPyslxhda9/V3KfSFQWx5ErmvYg5ak3jM6LdrdZvEIlliQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XM00FhYB58k9jworWW7yMqGybIMLmmnPtQHFLzAUGDA=;
 b=SNib4G4rHRyZKiIQ2UYKSIrAh4c5srqUd4+cgOHQokvBGXXSbYUDBkn7LsoNTMjCnp/BuQVOBIx/8Kxfe6gd1sJJSTw1d36RzmaxIAzw6q/y/NqUDkXCFJ5tSusKx9MXE+hwAEIndG5EMFRbPtZf5p7SP3Jgeo6bVfJb3rIFowEZmOuTlLJuXblkT6kgBB3HCukokCBtjSnAiyRYo/0f6zS8dTZZFIteHc0PCC5aTAqkOtpqJ0vYvikbaM6/EkKEtI7lCddHHH6D6vJ0FTogSX1LV+qECEZ34Sosi3BagzY58BRi/fUSR0YGUNZgJ7PM973PquQDfI8zjLpob4TKGw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by GV2PR04MB211885.eurprd04.prod.outlook.com (2603:10a6:150:38a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Thu, 12 Nov
 2026 20:35:40 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0615.009; Thu, 12 Nov 2026
 20:35:39 +0000
Date: Thu, 12 Nov 2026 15:35:32 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Jelly Jia <Jelly.Jia@cixtech.com>
Cc: vkoul@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, robin.murphy@arm.com,
	devicetree@vger.kernel.org, Frank.Li@kernel.org,
	cix-kernel-upstream@cixtech.com, dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v6 4/5] dmaengine: arm-dma350: Support integration clocks
 and resets
Message-ID: <avYi_uctWPVo4mjn@lizhi-Precision-Tower-5810>
References: <20261106013453.1134239-1-Jelly.Jia@cixtech.com>
 <20261106013453.1134239-5-Jelly.Jia@cixtech.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261106013453.1134239-5-Jelly.Jia@cixtech.com>
X-ClientProxiedBy: GV2PEPF00023948.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::345) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|GV2PR04MB211885:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d539c9c-32af-4a1d-ae30-08df40fc83c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|7416014|376014|366016|19092799006|1800799024|4143699003|10067099003|11063799006|56012099006|261022075727099003|261026140227099003|261022105027099003|261028144727099003|261102123227099003|261021121427099003|261009223027099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: u8Y01POuOhhqLJvCIf+GOKE2zcTiTFJsoQzDtXcVpNcL8ZRJ2ocTx8M5viSr6GYnSZrxEfBEXOWqjJGvFh+yeqoTi7NAzO2ForvIqOVymMqXzxixPnRSfCk15Y7ZAOy31ni/+wdPqEtZqs5z1Sohk2827AyzRu6o77HNLbSLC3WgD5fn9MunnqqOidqvrDlJQ0oCYH9L9zma/q16nLYBHf+eIs0VFqmd5M8vC0+8oKMrExE/9sqKwE2wuQ7ixRaQT28K201K3vsYTgJ+C9liDCC69Zda7GJtWHUo6Ge6JejrbiY1DvubApZIXp10v1romWOYEEIlG5bWe1esFrvM0706oJcqx5+XLTFrd/kKNBL2C3G9l9W5R3HSgNAfBvhBHRpLKXdpwfbCxZvirYiMdIuu8t0gouKh69F4pk28NkFDfzDW2jGilIjrv7qCfmzuOtnjEkgX2sbyH4V/UoOj+cfmFjeYasxh9FEes/DCQ8CXmctsfcjhBDWhPQ4+YK9J9Ebcm1jrSW673TyZA39Fv0op5CtOKk7wATg8ys2gLbuySABI8OntD5nevzvzC0JBUb3d6pLRcHJ7P+kfpIx3DTKMjoOrtQM2Nw6LW9FEDK1EwbkmAARgNgmVB6TYkw1fSM2njMuZZ2gMG9VAwNJFlEmGeDHqPYt1fcdRrhtjDQU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(366016)(19092799006)(1800799024)(4143699003)(10067099003)(11063799006)(56012099006)(261022075727099003)(261026140227099003)(261022105027099003)(261028144727099003)(261102123227099003)(261021121427099003)(261009223027099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?U44J/izMoFwqhD+NEzHt2UbI8P1sUkIUV5kEZgXKZE38q8b78LG54QVYVTsM?=
 =?us-ascii?Q?R1HBWdIP+kDSK9UYHrE22/9PW8d5lihabwVXgOOhvvpAckA61v27aSYO1Ce0?=
 =?us-ascii?Q?nFgyxzW8dgMIkNn1RO2VXLfeEBTtz0F5Jl4apwF7v3OFqR26sd+eAz5s7hgD?=
 =?us-ascii?Q?B38PJEQUhWS46ZNWUIouvk6Cg6cKWbz04emP0/686geRGgSbQR7j369nPEAA?=
 =?us-ascii?Q?24KugXHaDdgAgv/4tl7Ey/XcA2Nn9zLSrIxP2hoZfwIes/Oplp6Dff65wOdV?=
 =?us-ascii?Q?Ynsq+Kx9uT/2brMi3fM1l45KyueImWDTR6LeAQ+vPEim1U7ijf2AXBkulUWR?=
 =?us-ascii?Q?yg8eWelPE2ucdl4LMht1EaTsgyohu9MPs/RQBkS4kx0NSlJjD71Mxlu6JoIQ?=
 =?us-ascii?Q?hslaxqR7oITyxkyPsMvelH4knfe+l0UYl4Um0zqCPpKsRbf+PwpdeqDhsaE/?=
 =?us-ascii?Q?ULHY2MC0jq1JbwYKozmtNNXCHe48Bu9BTVXTWvxmjsEpZRewcRYMiyEaJCN5?=
 =?us-ascii?Q?Vn7s3QOXBL0xqIr8CzqDGYKDrWntqv6jaB9NjHDOXho32pe4ofgyETt/TTw5?=
 =?us-ascii?Q?rBXwl592YhOICrGfJnfqfsFXnh5TxA81H1oQCp+OEH4BElEoBpPXS/Ibkj9Y?=
 =?us-ascii?Q?ksA+s97DSgxYYW9bVEjYIdiFhR8j/BNcp7wU54H7P//0Z58Tva0g3yAuFV+F?=
 =?us-ascii?Q?Bn3E26udW5n0yJ1l2JKgOfepL3IXJ8V+33+bCASC+tQscvYYHAhJRhr7EWqa?=
 =?us-ascii?Q?2cYQHi4GmWDYxIXrmQLmafyE8rSTBq6rUFb/zkyRpTdgsnUrsBZUjkj2h3Ga?=
 =?us-ascii?Q?L17rz5hmSqAggjn1ohQCpVPQiYsXwaaijp5xabCPq44nqNgOkdAin/mwhOuK?=
 =?us-ascii?Q?YG1fY5HXlIntKzD848Oq40PQYP0P5irWaEn52XtPkQe3VpaKHjC/ByioSF1w?=
 =?us-ascii?Q?+FECVurcq5Gr7670eFv3wwmvBoECjBvfs4SXexQRXMHt5dBSjUQlFXHGeQaj?=
 =?us-ascii?Q?lxKyQ8Gz5UZ3n9JB+Re18ZGHq/gjv5Hv4D1EvNmnRiEn5hQzsI3b6ocVXB+a?=
 =?us-ascii?Q?d8XTJLI+6J9NBR2IxQaBLpJnJGZqihMdKO7JooHAo4HlQzlPapLr/c1innYl?=
 =?us-ascii?Q?vWZ0cEKqFHFf3B4F8jiv5Mgd3+XeSunSyA903oYL1Skpx9WTaITKY5gD+b6+?=
 =?us-ascii?Q?5ckjtTaOulEYdEC/PhE9RWyFwdLC70a05lIQ7aj5kwllfLFGJQk6grGa+H5Y?=
 =?us-ascii?Q?BlA/ytZn83ZQpwf/QOPZgx1Gr9bDhO2wczhsD687fPvjydTSSKyZho8XboJT?=
 =?us-ascii?Q?s8F9oJcahu8hu8Nrl6zAo/Em8S/ovEWXva3HX8jQ9SLN6xWEqgD5wsej8H5h?=
 =?us-ascii?Q?+W2qOqImGLXd7FLq8bUIgHEXBlkXaqk4KSYwfJVto8aFDSVZr1LXpx6KZTd4?=
 =?us-ascii?Q?Fk+Jmkl0GWw8b97Uy8E3/GlgrtLniTmqoZDpSaRT7hYvuSmOtwjB1AqF4MfR?=
 =?us-ascii?Q?i67NQqlEjjM56EWtfI3CNBFHKCaczuu1M4+JboUx9axJk984ka9HOUWTyJsV?=
 =?us-ascii?Q?+D9xMBpmRG0Lf9BLErBpWzhvCmMhJxJ2o0HyC0QgyjlG6IYP3SaV7QjikqjZ?=
 =?us-ascii?Q?pYBEr4rMxe74/MZ5KZN7PuJO0ZdXTalEAnVWoNu7xdw+Dr8VFBclq7g+20Mn?=
 =?us-ascii?Q?hD2pa4TgCMvPkvH3CN1JURmxUsn0Qomp/TTgKxtK5wVpxWmydr1TOaqbGJcP?=
 =?us-ascii?Q?6sDkSmIK6x0c+R67TeuowAehgC4MCmZ0Xx1ciz5WZkxtvE3RQl24?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d539c9c-32af-4a1d-ae30-08df40fc83c3
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 20:35:39.7070
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: naHmP1Or227iIzz4YprYyS/p4fKBRdrpBA6EDEdL2PRiYPH82m6K52xHPv6K69D9eI06CzA3YLHIbcTcMMgDWdBeYprDns4zC6ta7OzqNqwImzemm3+sASziS2zHoiGe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB211885
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_124044_054014_772F06DB 
X-CRM114-Status: GOOD (  20.94  )
X-Spam-Score: -1.9 (-)
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

On Fri, Nov 06, 2026 at 09:34:52AM +0800, Jelly Jia wrote:
> DMA-350 integrations may gate the controller with a clock or hold it in
> reset. Enable an optional clock and deassert an optional reset before
> accessing the controller registers.
>
> Use the deasserted reset helper rather than requesting a reset pulse.
> This also supports reset controllers that only implement assert and
> deassert operations.
>
> Both resources remain optional, so existing integrations without them
> are unchanged.
>
> Signed-off-by: Jelly Jia <Jelly.Jia@cixtech.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>

follow b4 order, your s-o-b is last one

Frank
> ---
>  drivers/dma/arm-dma350.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/drivers/dma/arm-dma350.c b/drivers/dma/arm-dma350.c
> index 608541a04bc0..c0ed7e86a269 100644
> --- a/drivers/dma/arm-dma350.c
> +++ b/drivers/dma/arm-dma350.c
> @@ -4,6 +4,7 @@
>
>  #include <linux/bitfield.h>
>  #include <linux/bitops.h>
> +#include <linux/clk.h>
>  #include <linux/dmaengine.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/dmapool.h>
> @@ -15,6 +16,7 @@
>  #include <linux/module.h>
>  #include <linux/overflow.h>
>  #include <linux/platform_device.h>
> +#include <linux/reset.h>
>  #include <linux/scatterlist.h>
>  #include <linux/slab.h>
>  #include <linux/string.h>
> @@ -1259,12 +1261,24 @@ static void d350_free_chan_resources(struct dma_chan *chan)
>  static int d350_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> +	struct reset_control *reset;
> +	struct clk *clk;
>  	struct d350 *dmac;
>  	void __iomem *base;
>  	u32 reg;
>  	int ret, nchan, dw, aw, r, p;
>  	bool coherent, memset;
>
> +	clk = devm_clk_get_optional_enabled(dev, NULL);
> +	if (IS_ERR(clk))
> +		return dev_err_probe(dev, PTR_ERR(clk),
> +				     "failed to enable clock\n");
> +
> +	reset = devm_reset_control_get_optional_exclusive_deasserted(dev, NULL);
> +	if (IS_ERR(reset))
> +		return dev_err_probe(dev, PTR_ERR(reset),
> +				     "failed to deassert reset\n");
> +
>  	base = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(base))
>  		return PTR_ERR(base);
> --
> 2.54.0
>

