Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BEEE606A334
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 20:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Xegh+n9E;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=kzZz2fyN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=0ml8fD4i5kajgU+mSBq24GOIFp/N7Nbk1jsTCHYRj3A=; b=Xegh+n9EFmDSGMX2jULWCOX3Wb
	iM9Q0b7SaJUlddYyGZ71zY6BfXtXUULA/1e2XvVth7Z/o90CmGJBLLWG4vzyJI3159DCWrZdPADDu
	6HIipM8cfURAMlRJvp5Im4R112SUuXHKVFjlQuKYuqOeCRkGCRhAvN2vzpk3s+5FaUYM0ybZUWJyO
	D2IzTgH+xC6Ocw2yUOt48g3WcZNOeC65zFsXufA7KDons/8lq6NQ9YTJi7gtYWg2GByIfxA98PQpe
	OgGOqaG+MKggrOEhHBjnoqSiG/jFZgF3ZVrmCzPjcNpO+8AXp72ohtmAxk4S63MMQ5IltcWLtD/D1
	15sglRkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT3Dy-00000003rGX-1GK1;
	Mon, 16 Nov 2026 20:22:46 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT3Dv-00000003rFb-0yop
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 20:22:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VL/tWcL/Vlj715hnv8YCnOWTpc6unuuttbS3FGGj/i57Z/7w/4Csqu/GetTpVIP26ISL6Es+XIvWp9vxHnn/Wsrs8jK0FvmvmXXzj+7CsrzorYHtoCxcy2uGvHQr9Ngy2zqHi6tJBmbFQuvbmg4C3bR40sTjxAaoFmpwVUaVgJk3nfXCk1BcKecmDqViMD/Iv7D7j/l2CX4kEBOxSVQagEtV90k9vJbhBnMInKASs+6kKbXyfxKoG9JV2zJrnNxebouiTg89jH5usGGpEoInTszXy18XPRhgklIpHD3M9mjnmgYHgYIkplI/rOkpHEQ4kzJKf64RwnxgsNkJtyW6IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0ml8fD4i5kajgU+mSBq24GOIFp/N7Nbk1jsTCHYRj3A=;
 b=Yyz8P1MAReMR6vvLYLsgp4gNVBM0C3SaUC9VDnciyAZ+GZkskSsMqu8VUUUIlnJilOUw6quFNDLlfugOb4fFSgodeIAXN6E+psfLl/U9wmc8cqYoTDR2bDpMn+YMsVX7sJ+wgUnXzVgZifEr/lvtyOEbjGzyk8Nsd6BrkH3FciiQ/tz0r/0wtkQbQvqc1F8soAqjiV9aEUyXFUnjf2TrVgKgga1KazjoxKGsiJ6lyIfFsD6T7Dvy9tzyD9Z0XBRFDQUNF0nTIVnQgs9gCPvnEjLFwnF9fmJFpf4/8no21Wf9Aa9LceW4wvvH/XQPuVMRt/g1bm1yh1gK0ORYG+W3vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ml8fD4i5kajgU+mSBq24GOIFp/N7Nbk1jsTCHYRj3A=;
 b=kzZz2fyNqsdUBcADX0wBywf6kFShWxMF6U+4bRL7n7N3K0kYxfeswgBWNTW8v2w0g5H4vXzjsyrDFJO166HLRE3OPXjrUsEVmk8bAMJvZDrlsJ4IQcfe4EfEJncO1+1eWhJlBDf4SVjuk+iM6Ry6U/FjFmlii/e3EPlLA3GNs0+iQxRdALo0cM2OOcUJMCsJHT4uJXv+W++SmWZU8/5bGtOofuVHnkrAg1bMcEqAKQIXRmbHkV4A6gossXGOFybb0FlpGfyYACfogMH2sf+5dcEUghRYzt73hoor3Z1Uq3Fqfer0UK3KsgSOkt2bmMPjK4bFTS72Z4U5JpeC4WLcrA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by GVXPR04MB10492.eurprd04.prod.outlook.com (2603:10a6:150:1e0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 20:22:34 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 20:22:34 +0000
Date: Mon, 16 Nov 2026 14:22:24 -0600
From: Frank Li <Frank.li@oss.nxp.com>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: Sinan Kaya <okaya@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] dmaengine: qcom_hidma: Fix runtime PM leak in
 hidma_issue_task()
Message-ID: <avtmAPQq787m0IUp@SMW015318>
References: <179395457228.2120679.13809646473624751961@iscas.ac.cn>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179395457228.2120679.13809646473624751961@iscas.ac.cn>
X-ClientProxiedBy: PH8P221CA0056.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:349::11) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|GVXPR04MB10492:EE_
X-MS-Office365-Filtering-Correlation-Id: c975b697-e713-47e1-52af-08df441f596a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|19092799006|376014|7416014|10067099003|11063799006|56012099006|5023799004|261026121527099003|261026140227099003|261028144727099003|261022105027099003|261021121427099003|261021123027099003|261102123227099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 5XtqosCKyMnpaVlNRNzBEHRQexV+l22LhSC1SvnRPXOKrkerIbxux9YK8SHYgAUjsPLZxPpgR7bd6oJaHIMsnSQTSKsfKEuQHlfwc5+OBCYWzBbQuD08IYxhUKMLW++ixmCoYvpKCx/e/M+IHVvJ0qDNR+AFYaoHjarH1xt8rTLfBkFu4X1PzfTb2xCjVVNttwwjGPpPnV7+kaNjZkzIou8/9UpF1ASvr+eQWPudYMzkHxdzsEYV0ks73KM3ym/99ZGcwVLZxK3+uAymuCFLzyMESGxLNSMT4/XgxS/BN9NVRajECSbA2s/7jNzRkF3ZHq1VIFlvqFYPkdasFocnWKXHK/dTP9XMjug9FeSB0HGjVeIUEcwn6lGS1KPlB5+ASARHS6fY227gg9o4llS+QG3TVI78BQttBENaFe2RlAXfiH+LMflHrou+sliXTm8g1PAaExXL7vYT5+oKbTBlJwiBlZzUm+4VY/0Rtz/NN6oGx0T8bTkft9YXB7SqAN3jy3nlEKtBTUjKX+qSr1+uHoq5Q74FxmIXqBBR/ojteW2hjjcx2FeU+FxBmCKzkursCaQMxtzUAKsH2RoTQEBxdeEF0yMHl0COaSiS4hNDb+0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(19092799006)(376014)(7416014)(10067099003)(11063799006)(56012099006)(5023799004)(261026121527099003)(261026140227099003)(261028144727099003)(261022105027099003)(261021121427099003)(261021123027099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ljai3/vmggLsSD9WrxMrphYmrr80YAbJwlG6j3N1B1ErMHTzBtMWOfSyseUJ?=
 =?us-ascii?Q?x6+7SxZEVdCHAanIRJZdQ4MmmdbVYT45fT0EBEc+IAXPFn7s5sJqOs91hyV/?=
 =?us-ascii?Q?SeVmTOqfYAXGD2fzvcVX2ARYEEW0vk0kLiNVa+C2bjBXgAWSLgs937QtpKw4?=
 =?us-ascii?Q?vQ3i8JACgh+NUhVcBc4d0a4v7VnVKsTJ39BSeawA26v8NNdadBt0wz/1YRq2?=
 =?us-ascii?Q?sWoWLttRW+AO+R8yvxo+nSwUArtMIy3DOpx3qz9xKz+OFfUCYKTdp7Du6uxH?=
 =?us-ascii?Q?7Uq8kmN3jRD6AiEXQVAXRU4uwiV8CRMn4UOZ2XckSr0lMgsXXVEfrkqKnnKC?=
 =?us-ascii?Q?chZPqKdoelKY8yBO1TPCXZnbt1lVetCIWhZMcjf4vA1Hk7I28Fb3/6ar00iD?=
 =?us-ascii?Q?qEUIVy5biUbnTaUh9lh9Yr39793s6V3NScTaGGe+YSxZuTrYxYlyTDRpiba7?=
 =?us-ascii?Q?qRvriZInfHddfKVi9/bcVqF+TkOjFKA6i3mzjvT2U5RGXS9EXYU8EPhTnxdM?=
 =?us-ascii?Q?UagZVbLvha3l5xVGEhTQRZVWE7x2KymQ6YwSDQDzQdLhdkwjYMAjxZ6Jtwwe?=
 =?us-ascii?Q?/byPFunL5BU5j9wHCgyMX9sEfVMXHAqfEq/Qj3hDSmUCSnY0+f+Z+ifNYg92?=
 =?us-ascii?Q?oeGEGhU1SQtVfIpZ0X4rbJg+vwS7RiqfzDKLA+4Zk+qGkBAasA1NAMMNfYaH?=
 =?us-ascii?Q?8XUBRHYFKJiTXTPB9Otsr7ADf5QV4WkArnrVYkKROGvhc+unmyFTPjIDZubX?=
 =?us-ascii?Q?HXiGlFcMlvYujSX4GdeOdpTiJp08sFQHWXDgOJvBOdfCQLMZLlu1hOo3DnQ6?=
 =?us-ascii?Q?yA5bXBcEZXJjSdPJ9CG33pSP4ZXyAFYzbb6E/WWX3Tcgk57PKp5qADFutStG?=
 =?us-ascii?Q?cUP3ZTabtlp6wU4HxJQyD5ML18CsmG/1wz0hL+SuPozTNpIug8NWcJiWj1SN?=
 =?us-ascii?Q?FOw44pa0c0dOyO8Dpu34n4LMWOchIxTjr2ur0U+cktFeNxRApI/4aEmVa490?=
 =?us-ascii?Q?2xDt678bTaWCtMVIt6xHjYC2JAhhCrBGQKmz/USvo6VK+6jnhNemIGQmbuue?=
 =?us-ascii?Q?3ikAq07eqUEiSecK2TYCFeeX4OgL5z9DdoStMEbkRbflsp512bStu79cB2U4?=
 =?us-ascii?Q?JgcMFULqoZ08ufeprG0DJo79iWQ2lQB5ckpnhPajo6yLUlv/s5oT7gIcp8XW?=
 =?us-ascii?Q?sixdf1ZioMUjoTyl7KG1e13HjsHx5JyFJmLPM2pebCCeuOVrIxk6N/FAKmrz?=
 =?us-ascii?Q?hOcHyoZIwYJa6/mvAswME5w9Tt0Fcf8IqOKqOuGzqvXjt9wRB9DqQRHLaEyq?=
 =?us-ascii?Q?ezE2/KaMGoCQcSfP5s2b1xsclB1cMDD5PTtDXL0oAQj13by3lDvP5TPmrGG2?=
 =?us-ascii?Q?PPlUSe5FyoIVNnEO8ZNBslpOJvz5WdF9lhyRN8fspTc4XAeDE8y3nalSKam1?=
 =?us-ascii?Q?mzkI7oJ39qudB9aBy4Fh19hPs6VNdDlwdk15BAXfNZnkGa1asRTdnAeoddzx?=
 =?us-ascii?Q?r0HQb6q9/JXUF3ZG4G2LRLixY3rI09ZHpcoQK7qItREIJxawmC4ZCBf14PZv?=
 =?us-ascii?Q?YQT4+/W9BZQKWPL2cfEw/38v1e+0NE8iJwZoec5bBGUVCQ6rMT6sgIJQxrro?=
 =?us-ascii?Q?pjKdEBnrF9PDyVlDUOYvhuUeT+he/z44w+dKFz6rkTOWDQPxPyMKDp5uN2he?=
 =?us-ascii?Q?wS0uDCjxA3VrCT9QpP8VQhXNtVQkpNuNnK+himnOW2NbgdpmRG3MyYn1jAmA?=
 =?us-ascii?Q?tXVWbtiRijBdo16dorgd1nVCKPKpLWogyZ1xEs3eB6me7TWN2yXV?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c975b697-e713-47e1-52af-08df441f596a
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 20:22:34.6834
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7DM/bgxc+YIKlD0Cno9UGT8Pb8frsfg4dn8z/YRb5Lp7hHYBKADLm3BN092XbrJsn+ncGjd21DdDsNW8UKWiQkWfhAKuvI5YYKxVsHnkb9soPixW1+ZQE8FFaOTlyT1h
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10492
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_122243_278585_2666CE37 
X-CRM114-Status: GOOD (  22.63  )
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

On Fri, Nov 06, 2026 at 08:42:52AM -0000, Wentao Liang wrote:
> hidma_issue_task() bumps the device usage counter with
> pm_runtime_get_sync() without checking the return value. The counter is
> incremented even when the resume fails, e.g. when runtime PM has been
> disabled or the device is suspending, and nothing drops it in that case,
> so each failure leaves the device with an elevated usage count and it can
> no longer runtime suspend.
>
> Use pm_runtime_resume_and_get(), which drops the reference it took when
> the resume fails, and do not start the transfer in that case. The counter
> taken by a successful resume is still dropped by hidma_callback() as
> before.
>
> Fixes: 67a2003e0607 ("dmaengine: add Qualcomm Technologies HIDMA channel driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> Changes in v2:
> - Use pm_runtime_resume_and_get() instead of pm_runtime_get_sync()
>   followed by pm_runtime_put_noidle(), as Frank Li suggested.
> - Link to v1: https://lore.kernel.org/all/20260916093032.2003397-1-vulab@iscas.ac.cn/
> - Sorry for the very late reply to this review.
>
>  drivers/dma/qcom/hidma.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/dma/qcom/hidma.c b/drivers/dma/qcom/hidma.c
> index 1349066b1544..c49cf622e5fb 100644
> --- a/drivers/dma/qcom/hidma.c
> +++ b/drivers/dma/qcom/hidma.c
> @@ -219,7 +219,8 @@ static void hidma_issue_task(struct tasklet_struct *t)
>  {
>  	struct hidma_dev *dmadev = from_tasklet(dmadev, t, task);
>
> -	pm_runtime_get_sync(dmadev->ddev.dev);
> +	if (pm_runtime_resume_and_get(dmadev->ddev.dev) < 0)
> +		return;
>  	hidma_ll_start(dmadev->lldev);
>  }
>
> --
> 2.34.1
>

