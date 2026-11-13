Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4527606A33B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 19:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pw9bmpzZ;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=UTrSEmBV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=+L/5HeJeWapWYDKgwoTIQ0VYIEapofXO6xDP+YhZoIc=; b=pw9bmpzZaPjs8lYGIX3lf5FTzC
	Z5f8znNPRYQe2YYGDK9EltWCQx7Hl5Xrh+zI2Tifn3mFY1ltqhmaeYIyTOi3xh5O5bPIlErYppSLd
	Dw9CoY5kPY9NmMFI8AAKZ6rNumEVrXDcjQB6/fHWrT6oO9pyvX15u585GN7D3yDP6pJMQ2j8b3AWY
	7XHZfkstDt/ByiF4YnHrKl8oHvQKfzbI/PS+GfVdFUByP4uOgUzIAmVC7CIqAWoh0cPX4as2tbXNc
	SqCd1K5UAuFcM5z0IJGyOYE8Zfb7FqWiQnkwUv2AlPNa9O6qA5Zux/h0SwjQV9NMTWr6RM3BKbRYG
	Ng1P3TAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRx9U-0000000EGWw-2A0R;
	Fri, 13 Nov 2026 19:41:36 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRx9R-0000000EGTb-0jRb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 19:41:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qv4myWtvnFNhYmWYY/EW72Nl87CcduCcZ5ycMNyxli9S/pzmNZvXup4m21AV/dStgPOVoRluUt8mfgGDICLeSdquH0QIf1VcEfND28yF16eAgxYl2t1u1wUJq0nFrxwxxYY2sKgzdgfPDmBXRyxSkJ7NwW1EqeTzv1yXn02JV7RKINNmjVL1bd16VFEr3cbCsoqh48dL2abD/X8hFrtY7x+csNk3MCmVOyt2tTA5LyVq8JpYpAAHtFdVv2cqPOiVDb93GNiPgOwaHT5CL/besxJpNbZefupYs0llPqaSnsQKbraduJIwK9HzkhVwaJJepQ7Yq4nXplHzWNexsRa+Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+L/5HeJeWapWYDKgwoTIQ0VYIEapofXO6xDP+YhZoIc=;
 b=bqp4+2iARygQKlFZ7mr8cjayqiYn7/iJRJHunFhH6mvgXUjzRz2S2W40VzYZh5QdC93cewTehL9qOpBI7Ez7H97tqT1UCx6v5FwAGuRwFTd+eSkMe49As/MxPkjwdluMylmW29pzePX+C2VqDCRXOV5bpKYxmJz3y6vFDEDnh9r8giSJpugXUgP1cHF1fFK140YpYFICVohjvxhChkY0TgmW9zrb6AKiWKVpM1dKROnfiE0GA2SJofpx2mBkoZ76VGxWdloebL+sJOpn712VWADWhacFA1lHXvmTXN0/BYstiYr+7RiUZK7AHE/6q3x8Bw+sc6DQdEKFjmNJWwVPjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+L/5HeJeWapWYDKgwoTIQ0VYIEapofXO6xDP+YhZoIc=;
 b=UTrSEmBVHlwzLFeqApiKQFy+RCfNNmstDUyRGs4mvHnfWhLYWuFBeRG8dWr7fuSysvL7yRUES9Ya1lNmdLZbDzQdSWRztd0MNtHR7AZl6kIOQknQs12HcheI7Hl5w5gBqJodEuWnhzEiQ+pT7AkfbcEBzJViG1K7WgHmIxW2dQ3iW4930LwIVtCIZJI2fqpcl0azyv46/4j/JBZtucAP+Rh6imBrTlFBG42Of6qjdlSPpF2nGlIVmj4Ic08XaHpq6JGNJIpuV0KMGYuajuQXIPbq1/jrL0R1H4fbaiooQ4V72JuaY8csQJjDAzdI+8VYwDeM5SX3L/YbuGcHCWdsZg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by DB9PR04MB9281.eurprd04.prod.outlook.com (2603:10a6:10:36f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Fri, 13 Nov
 2026 19:41:28 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0615.009; Fri, 13 Nov 2026
 19:41:28 +0000
Date: Fri, 13 Nov 2026 14:41:22 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
Cc: =?iso-8859-1?Q?Am=E9lie?= Delaunay <amelie.delaunay@foss.st.com>,
	Vinod Koul <vkoul@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Frank Li <Frank.Li@kernel.org>, dmaengine@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dmaengine: stm32-dma: Fix runtime PM reference leak in
 pm_suspend
Message-ID: <avdn4prElVn-v_m9@lizhi-Precision-Tower-5810>
References: <20261102104108.794-1-laixiangwu@cmss.chinamobile.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261102104108.794-1-laixiangwu@cmss.chinamobile.com>
X-ClientProxiedBy: DS7PR03CA0320.namprd03.prod.outlook.com
 (2603:10b6:8:2b::15) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|DB9PR04MB9281:EE_
X-MS-Office365-Filtering-Correlation-Id: cfdc26d7-618f-4df1-f53f-08df41be1c02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7416014|19092799006|23010399003|11063799006|261022105027099003|261028144727099003|261102123227099003|261021121427099003|56012099006|261026140227099003|261009223027099003|22082099003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info: uyaJrHPQtXKqbd4rZQW6FQO6VBF+wkfz+4W97SXh7mfrXPziLmZOteAS5OjNUEdxZSPlmxdlVxthL41bWbeqDh74wEAC2HpPkj2fPQUZ/Ro9cDK1boj8ERzKCzOO/34W4nHJ1WHIt0wGYYNdv+qXeGePcqr2IQjYe36aKPSUmZbooPqWlggXVu65VdstxP6fBEIStFi5YbZfelnbsz0AXTz6j55ZSMCDFQ5sddCoLECkteQcy/X9UaPDwS8yfWMo3mW6lrLoklxUjOh8sGeA4gly8P63cSCfIXTvdqbsOmqlq4AM73NOT4H7J8OTQ6pJyG9duw+hKffB2Qwspb4QxIgdx4oRqAQEz2tCVUkX10xBfHtlJJrFWcudkca30PXJ69Hw55M2ID0r2pkp06PyE0zvBsg/5lWjQSyCDW/OLfBmOTWv1Pxjg6tjxafWm3uUUQyTUv41lx/STdDNB6kqFVoUXTZ3p0TSp0zU2GEZnssL2O/TjJXhpK4UBrcmRCCNIayaYBjex53PFI01sSBoegqLeBpFmys/VWQSDTP86dHnSUGbYUwKdMijY3W3Y1FkStYVkiIbuAF7cR4GCawpeamHQ9uIa5pw/Y0ydC/rnEmIRzC1y+l5dr7sZerquREUB8hyJ71jou/MwTK3NB4EyK8PxNWrfdHg419pk1x5X10=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(19092799006)(23010399003)(11063799006)(261022105027099003)(261028144727099003)(261102123227099003)(261021121427099003)(56012099006)(261026140227099003)(261009223027099003)(22082099003)(18002099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?D295y1YqA4X5gCiI/e4KvHMvQme8m9V+BrOX9sgzBYH03EXn8rDtB3d7y2Lv?=
 =?us-ascii?Q?Dhe5rPiY5INydaEKbUhL6QumxTtZ0JaMMxRRCSdhwk9mNPnYIaOTNJuf8N6h?=
 =?us-ascii?Q?U4WnPpPS3VF2kdaypRr5+u5frNRGbVM8loMXBsDO2upFTrjOJuMXbwnxNz23?=
 =?us-ascii?Q?bBAB3Lsgs8pnO3UT47OqAMqyqu7CAhYZg06/uLRAy4HnhL5bm+r4oNFrVjda?=
 =?us-ascii?Q?J17Z4mcOJGAQfw3iNxSGxg4P3T3liuPNQqlmahkm0k8BxzJRGv3k5/r+RAFy?=
 =?us-ascii?Q?UwtK5uiLk+Dm+M6VzN408QLBr6bffLPi60EkKYM8MSvbkFMRk6qGeTK9yONB?=
 =?us-ascii?Q?SSQROLspc90jnlM+08yeu4HkKGgbxaSEyCaJgBOTZ4AsUH37V6zJPdlyltg0?=
 =?us-ascii?Q?LbAuTVdOf9D+2xN4FBoUFfD9ckQ9VTI/yW31p5PazplliBkx3IMQHvAA64M0?=
 =?us-ascii?Q?zhYO0oEFoN3YKj5UJPfzSIyxkJll0cLACanRlSf8Du30hSId6tWAHz4x2tIA?=
 =?us-ascii?Q?YVpkXZvpkOsF1BjW8cvLaYoCmo/l8AwXJdjMM/O4JSbNvsRtJVgweTccoPoP?=
 =?us-ascii?Q?XjBCGPeP7ta4FBNtfO52QPhdP001HkjZYMWso722ToDQ0jLQ2/k/Ilukh3YQ?=
 =?us-ascii?Q?yVm4Kx5USEJlN9RCsnQ2BIvQ7ZVil6pyxTVcdKNs6PEak0G2NynH0WUhNQtS?=
 =?us-ascii?Q?6a4fLALW8olVOjEL8tKL4Po4xKpzglbp21319nWUqN4CFlSqRIESWuha6Wtl?=
 =?us-ascii?Q?D8FTm4j3jFtj1MwcY2WipPBXOBwnzfazdvnWQ+ko8Wnh9SZAzm1IJvr2VLZG?=
 =?us-ascii?Q?VOZwI/boM/PGBQXUQHvxWvqfkDXvwKsJH5C8yfKuCqe7DX3sYkStYW4ILsFL?=
 =?us-ascii?Q?X0dm4FGzXxEikOZRrOdvF5+s9QfJxVNB736FxmBvzekOdakjpR+AWoq+BHxY?=
 =?us-ascii?Q?IkR+/sYUqsyTHZuDJgrEaFm3v4HDHUcywQFwP5C1pcTT6m+YUXL/Idy7MWK9?=
 =?us-ascii?Q?GmPxp4pUWfMFmn9KK/2zJwnAr12kvoSKz0J0QOO/u2xe8OA5D+/njNFg8rwp?=
 =?us-ascii?Q?f7GJEtVG5W5NHGCE5xAmEFrv39JDGKJxaB423RJfHtfi9MTFV8NWsbSdnaLP?=
 =?us-ascii?Q?lCxL/Xx1K9ETEOTPbpyOse1wKDewl+ETCpE2DgFjf7u2M+Umj9Ya32O3QJuC?=
 =?us-ascii?Q?Z2A2UTM3g4o3lYTu1ya+UFTQe/hVL7QCz1BP454psmrZUJxvSjGKJw9EUHyf?=
 =?us-ascii?Q?m8X0GiCIgHjp8MTh4nOKEM83BnkGE1bG5yQyFtDOuXxuJJWpVdd/iMLM0ZWa?=
 =?us-ascii?Q?QprTrsRx0vJSucESld88Nr6xcMhWOQ+MHBe6KTjRPAmNEvUc+ZPVzRrTK4KW?=
 =?us-ascii?Q?jxkNZIX9UYLaYM14nz659LbUY9vmDNKuAXHJ2kaNziPkHq99/dU0/y7YoYW+?=
 =?us-ascii?Q?iNYgAngDrmFBtlY4bRBcJERLPAXAvo0aIbMjy0vFt9ojfkoQ8Nw9kq5hkOu4?=
 =?us-ascii?Q?/66+XhVnVHEQ9PNcWVIH8AaVrNrQrAbOSdFSuvO63LevXferOV+s2g+/jD0u?=
 =?us-ascii?Q?EfzuFZPRwuoVMeKHrDXetSGUhW6U/DpdTrdAzjtdqZR+Ljmnwqj1DaiwLlLB?=
 =?us-ascii?Q?4QMcfKjrxS0UFBcoL1L6Fj8FXmhAhWIoIe7AgAM7FTkQVgmPswILoYUNk6U8?=
 =?us-ascii?Q?Y9vTZ97zm9smBApVLu+rk+bLpSDXdk9+YMrp9tTW6zx9R3TCnFqn8+Y5vZf2?=
 =?us-ascii?Q?z0bF+2Coqc70RQXQlIk4nrT8HoDS52SEXIV0/NsHVEb2LTBKWh9F?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfdc26d7-618f-4df1-f53f-08df41be1c02
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2026 19:41:28.1141
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Aqh1ZmZD4HjunQHkPaUn6g6qYVBZstdKT7lRCajYPBX4TumXtK5x6qq9m3u5KeDK9JcZlCtnoV8p5yKEA9ci8sndc0EFtcZs2FYKXetGDAM37oKGsoDZaISIuS+6gFLl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9281
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_114133_225513_0F08D471 
X-CRM114-Status: GOOD (  15.98  )
X-Spam-Score: -1.0 (-)
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

On Mon, Nov 02, 2026 at 06:41:07PM +0800, Xiangwu Lai wrote:
> stm32_dma_pm_suspend() increments the runtime PM usage counter with
> pm_runtime_resume_and_get(), but when a channel is still enabled it
> returns -EBUSY directly without dropping the reference.  The matching
> pm_runtime_put_sync() only runs on the success path.
>
> Each failed suspend attempt therefore leaks one runtime PM reference,
> so the device can never runtime suspend afterwards.  Drop the
> reference before returning -EBUSY.
>
> Fixes: 05f8740a0e6f ("dmaengine: stm32-dma: add suspend/resume power management support")
> Signed-off-by: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/stm32/stm32-dma.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/dma/stm32/stm32-dma.c b/drivers/dma/stm32/stm32-dma.c
> index d3ad78562..2abe846a9 100644
> --- a/drivers/dma/stm32/stm32-dma.c
> +++ b/drivers/dma/stm32/stm32-dma.c
> @@ -1743,6 +1743,7 @@ static int stm32_dma_pm_suspend(struct device *dev)
>  		scr = stm32_dma_read(dmadev, STM32_DMA_SCR(id));
>  		if (scr & STM32_DMA_SCR_EN) {
>  			dev_warn(dev, "Suspend is prevented by Chan %i\n", id);
> +			pm_runtime_put_sync(dev);
>  			return -EBUSY;
>  		}
>  	}
>
>

