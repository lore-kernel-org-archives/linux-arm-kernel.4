Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FB15606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 17:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0uFqeD2n;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=IWiuHonL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=qOV3w4jvPezNVABy03YhNZ61Eprlsp3xfnKtb5y+di8=; b=0uFqeD2nX8EAXEE1Tdut0HJ4Zg
	kLU1gJdwawo5nlgGxxu0+eJUq/VvLXsRqH4RSVMnNXZIeMhxJrAT6YzE6BlUkpYRWpNjq/KT/I5at
	NUGEyJsZP7h5fDmnyMGeSI1CiK5gAw9YMZhcvrac4KXNeGbN3DqFAZ4pQr5niI4vwaAxmWPJhhguN
	85959M2qnwmbogzPsfMqX53VEoShahVKj1ryqY5wHoF9VdPs4BjnMUdVSh8R3oG6e7osN8ufE55w+
	+HcxnQgMmQ2Yt0aUTvOZaYhwuniGHIZNHjfeKyRFbxqo0BruDG9nYDT1t2W1+VvHW5D7acslmjx29
	DE40xn0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT0LG-00000003O0T-3RXb;
	Mon, 16 Nov 2026 17:18:06 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT0LD-00000003NzQ-0rFq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 17:18:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=chxhicwnesgAYzrNLIEGwpabVbwWiovQO36uP5BKrtvI6EcOWdqC8Wr94T9eoJYyIXulYr4pZFKoKVoMhbkuZ6JxNQ1LWSD5ueLeSbyJKZHdVIatZ6xKvM6u8RzfvafNRwMjwUseIjb7UYFqUlDygwHckzcRE1paOVNrH4/o//Z6iduWoNE8xC2RsGNefsyqUkwn7pA8abYa7zPmRgZjT6G2gAc43yH2YcvLIS+pHcB6bvo0F/HHM5+SDojGQwjA9jKla0anPS0abzYCzo6H5fQVnrEyOFt0H9t5EN4AFM1s7nMNnMh94TBlzJcqLa8sEN3pMsURdmXxOPR+WwCbqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qOV3w4jvPezNVABy03YhNZ61Eprlsp3xfnKtb5y+di8=;
 b=N5XnWKf4pfu5PSNBc6Hy3GlYsMDa5Qe/LCZ/xqZXzZSKr1axnbuZyRkC1vwj/DKXzwA1OmV/+g2hgY0fTtV8E9Z+h2vZNbUdkUQYt1MYeO0VTpI5Ni72bVjX1bgVp5QG3YfPPVLzK/2htVX2NukIwxqLeRZoLia6xDK2Kqj0qoV1VtFyKoizJ3xrmyjIVGidnCkZuLd3QjPpkuzXC8DLymVq5lkBPlr3iMswToY585bVDVoDsQMqlXgQmZzOU5v7B+4nkfgniFx5Os57yRF+N1z9AZQxA5IWcOw179x7LpXc1iJ6rX1WcvqtLJCEpGRD03VW8F0m2vJMlKvj+Fx3OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qOV3w4jvPezNVABy03YhNZ61Eprlsp3xfnKtb5y+di8=;
 b=IWiuHonLIR7WxtZmg2Yo0NWOOTWLdbG3e88UrIYmHgpYPS1wX/RuTqeRYXGiQqrtKwPPP2GOPTDWsJrjoGIQRZO1qJRXuHYKIygw+1q8phEO1bkoqvLLTz2UvWy+Q2lqNqTRBJXLZUejr0X2xmksi+vJvtmtrjPJN2tDqCnR8/qrH3wWN0h0fbsku8UxZEZzHgdfgjczQlE3C9LKH2/Sz+vXPQqesfFTWdlGalFmdMGcA79g86qLj+XuvsU8Qkru0ubWKas1pEMwHDCC11bO+s8FcmtQwp6QIfe/03hMKfzezm/M+pP1R/R0KcptrU4nuV+yCrA+L68ISTGIPr/+3w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AS8PR04MB8834.eurprd04.prod.outlook.com (2603:10a6:20b:42d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.13; Mon, 16 Nov
 2026 17:17:56 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 17:17:56 +0000
Date: Mon, 16 Nov 2026 11:17:45 -0600
From: Frank Li <Frank.li@oss.nxp.com>
To: Peng Fan <peng.fan@linux.dev>
Cc: Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shivamurthy Shastri <shivamurthy.shastri@linutronix.de>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 2/2] irqchip/imx-mu-msi: Fix PM domain teardown on probe
 errors
Message-ID: <avs6uc7nwiZAlV-v@SMW015318>
References: <20261115-imx-mu-msi-v1-0-8beb58854ca4@nxp.com>
 <20261115-imx-mu-msi-v1-2-8beb58854ca4@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261115-imx-mu-msi-v1-2-8beb58854ca4@nxp.com>
X-ClientProxiedBy: PH7PR17CA0010.namprd17.prod.outlook.com
 (2603:10b6:510:324::10) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AS8PR04MB8834:EE_
X-MS-Office365-Filtering-Correlation-Id: f56e23dc-85dd-4be2-3189-08df44058e6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|7416014|376014|23010399003|366016|1800799024|18002099003|22082099003|4143699003|11063799006|56012099006|10067099003|261026140227099003|261026121527099003|261022105027099003|261028144727099003|261021123027099003|261021121427099003|261009223027099003|261102123227099003;
X-Microsoft-Antispam-Message-Info: pzPCwcdo128O9pywP9p3jNP2ratBzYcGopR+CZGG3nSec6kDFM+4edv+MwTg5BP3bxALeCwWqKuUWLVtT4a8y2Z+vbaAkLht8UhSSV9L2JIPJEcAtlLPxOJ179gmsztGV4qz29LpieeDs8vah0koA+Td/2q6W/8oQkKIdLRFYpsjMqhJbwwfARen9AXtKpsaidScv9uU+z4esOQI9HXPoZ/JSxIUkTplDgYfd3+hrT34aPYBjPkJoMTQWBxCSJM/Stg/kKVMKxEieQZN+rg4fjbiMGNdPPREbRkQkVNvJksUjDJ902S3JOvu5AvS5R+136Y9B09qH4yodAQjKQHT3nei6eJ0ErfQN6QQuBT9Vegd0+8X2asTtAxePolGms15Pg953W6QsGCKYaYGiLLsAKUR9W6kGs6EzU9WqDqaK/kynCkmqDqV5wCXeN6hTaLIsXgjMA8YOZ4lNA62U2tVTW3kBcPwnXCL1E71xlwlReohDtGfdKwvEsw50UG7C/lenaIsF+/lrcq8ZXUrgfA2h5AogHmVaGGrG5Ylj7MhT2hbtbaHOd1sBSQu7TE5v1IgsA2CEuTKoMO2pxrIZ1AHZsKMnlThws0r30PGcPfHhALrj1eOBoI0WI06HtDG89h2+g1tF0HZu8NHvWvvuEXRiuFslNEdTFgrV2TNX8evOYY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(376014)(23010399003)(366016)(1800799024)(18002099003)(22082099003)(4143699003)(11063799006)(56012099006)(10067099003)(261026140227099003)(261026121527099003)(261022105027099003)(261028144727099003)(261021123027099003)(261021121427099003)(261009223027099003)(261102123227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6lTs1G9Vp+NxU1mUpAfXa0D6IqvuTYqLhHFt/7PwVbqbCnOcOftSS4vYfnMV?=
 =?us-ascii?Q?/RA8spxIHxgp/zWUlARcyuzpOslIZt2mUrgRL6mFpufhuS7Ht/Orki16hU9z?=
 =?us-ascii?Q?6YYhPX1Al5lmGIe2tmfz9DtHRkT44mNCHxiY3YpFCHuVW9cveoLBPNYxhcie?=
 =?us-ascii?Q?2zHIuJXiYR6fwhiQXuIxEY0woRK4zB7gVv7DLOPkGk5Fe0yqU/Hz/qoOilM6?=
 =?us-ascii?Q?KYRLPWxkjZuP6yIQGNsADpOvDuwO7EzRzMbzVx0BYwFZ77qCMWCZSuZ29as9?=
 =?us-ascii?Q?xawwSY0RMgBNaOn6BIoG9Pfz1kn1XrZKCsd7vcIii/frcQzKElrA+kc4/7lQ?=
 =?us-ascii?Q?Ei0MFSpP6kN450x8nCjgykENYBvopQU1FrXoBYmm6iq7rHUUiO1XVwqSYLPD?=
 =?us-ascii?Q?7MKuGeavqgeb1kXddHNOA7wCcRTX19Yyzn4hpSfxIelGPAB/zezh0Zg/UA7q?=
 =?us-ascii?Q?EbF+howvoeB3miT1qLFjqaH40VROhFI2lq49Y9E0q9MdOWa2VqZHE4Z73AyD?=
 =?us-ascii?Q?hYryeaERamDC1tZA7pQG+6uQZmG71zxgQ7EiJXIxOX+uGmhqya58/3p0tgeF?=
 =?us-ascii?Q?zraRmnhw0gx4Kv7LtgIjo4XTQOouOee8i9c0RTOLhT/pTyBgsFMGD6295fZB?=
 =?us-ascii?Q?N0ruJDCHuBBocJBcScNMqWo3Z6DU6NWU5QllABRYe9LLTB/sZZf8+qGuAbbc?=
 =?us-ascii?Q?HHVNgb8wToF1Vfd9QvtHSX+BvqLP1BK3CaEyX3DvzkukmcMkTnepnDBdWFDB?=
 =?us-ascii?Q?5vxlR+HkV8xb/hLjSv3qGwldz1a/PWqAk8FxydtXC+cqkfOoL0qzcV7CoGu5?=
 =?us-ascii?Q?hM7hnytLQbWP9hWdBiVvhCetefFuaVC0Vt8Xf9tYQzMEwpjogJb0+eVzoVbN?=
 =?us-ascii?Q?ZsCqFP9RHmye+PrS7yztl9hPPFzHoEftvsO/JJIi+0Wrw+2gNuNkr6aeGUcD?=
 =?us-ascii?Q?mjSlddEDldttbQPQMRthOCk3ro6G8XN0lvAhmaz5D423e4QSqwNswZbcncvC?=
 =?us-ascii?Q?LjNWhAyQ1UWjeD/18A8jETINUrrMJHWOZaN4xMqz2A7lqbCFIQ54XkBE8b3B?=
 =?us-ascii?Q?znZb1VaiofLjeX2U7/XbcvorrcbmkfOQZbugsPwXpOemp7YzveBMZkudOlcJ?=
 =?us-ascii?Q?/UHhf91g61jGG78JlNolDXZSYSNN4Nt+dPCIeOugaOWAcyOmcf/3utJtu1qv?=
 =?us-ascii?Q?ci7i790fDWi+1pblSSy7+HFh/KeYVZPQLb9UPNlSZoRgkPzSP0ewKr3ohx7L?=
 =?us-ascii?Q?zrX0KKD0hPDeFVFoYExy6xxo44qXkZFYDCuF8v7HIrv+tLNw2Cps9lTu5e7M?=
 =?us-ascii?Q?LXfPw7WlDR7E8NHIoxNiDnsZ5fjdi6Qf2RyTrrYTqsQXKNTv2WCzXgrtu9UU?=
 =?us-ascii?Q?6Gw11HOWCGMay7Cgo7Y7ZQKICn7QxHYa1mTS0RnHCbFApxOghszExrErEzVK?=
 =?us-ascii?Q?3887PMCF4JscRz/CfyYOCoIWrN2ZqZTPBBE5O/74ruMMSrrjb0wTuxZIdHbr?=
 =?us-ascii?Q?ajTVor0SfRH9KlZxRaNq9KvOtq72aSZPPePnJ8Xaa8krCxI0b6eGKfnq30B0?=
 =?us-ascii?Q?kWiAAX7K5D5zYQzfA52gSY50JSWpf+K6261Y0QjsC+hiYNVNNFaeqMTWD/Hc?=
 =?us-ascii?Q?JSGgJz8VFCM+e78MoriKAN/qGUu5jLU2O8HZMzEbKVLoqAG76S/4SGTr2XIz?=
 =?us-ascii?Q?sbcBoTh5UKK1hQfFzolk+DYgq7+I4EEE5yrc28kZoK3HyMpUph1bhUpHZNqq?=
 =?us-ascii?Q?1nfLjRnPJX4ds6kjhkYp4YTZE8Pk5WPT5miW/dsTCVlBJgFKHtWe?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f56e23dc-85dd-4be2-3189-08df44058e6a
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 17:17:56.6800
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +14HjdIgJp8/POtGwNPbQLqAKEJBd+27KhmHGOD1xPcdcIoZvySTlYEftdMtRH0WQQhpDvJ0xBA2igF//3bnb7tCPHd1Py8P1wxcamlwhhaxmFIYcE5ehNgnYRu4xkFY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8834
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_091803_252902_9DB89826 
X-CRM114-Status: GOOD (  24.63  )
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

On Sun, Nov 15, 2026 at 10:11:26PM +0800, Peng Fan wrote:
> From: Peng Fan <peng.fan@nxp.com>
>
> dev_pm_domain_attach_by_name() creates a virtual device for each
> attached PM domain, which must be released with dev_pm_domain_detach().
> The probe error paths only remove the device links, leaking both
> virtual devices. They also return -EINVAL instead of the actual error
> from imx_mu_msi_domains_init() and log the wrong domain name when the
> link for the second domain cannot be created.
>
> Detach the PM domains on every failure path and propagate the real
> error code. Since the power-domains property is optional in the
> fsl,mu-msi binding, treat a NULL domain as "not present" and skip the
> corresponding device link rather than failing the probe.
>
> Fixes: 70afdab904d2 ("irqchip: Add IMX MU MSI controller driver")
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/irqchip/irq-imx-mu-msi.c | 69 ++++++++++++++++++++++++----------------
>  1 file changed, 41 insertions(+), 28 deletions(-)
>
> diff --git a/drivers/irqchip/irq-imx-mu-msi.c b/drivers/irqchip/irq-imx-mu-msi.c
> index c42ea0797624..42e930caed8d 100644
> --- a/drivers/irqchip/irq-imx-mu-msi.c
> +++ b/drivers/irqchip/irq-imx-mu-msi.c
> @@ -300,8 +300,8 @@ static const struct imx_mu_dcfg imx_mu_cfg_imx8ulp = {
>  static int imx_mu_probe(struct platform_device *pdev, struct device_node *parent,
>  			const struct imx_mu_dcfg *cfg)
>  {
> -	struct device_link *pd_link_a;
> -	struct device_link *pd_link_b;
> +	struct device_link *pd_link_a = NULL;
> +	struct device_link *pd_link_b = NULL;
>  	struct imx_mu_msi *msi_data;
>  	struct resource *res;
>  	struct device *pd_a;
> @@ -345,33 +345,38 @@ static int imx_mu_probe(struct platform_device *pdev, struct device_node *parent
>  		return PTR_ERR(pd_a);
>
>  	pd_b = dev_pm_domain_attach_by_name(dev, "processor-b-side");
> -	if (IS_ERR(pd_b))
> -		return PTR_ERR(pd_b);
> -
> -	pd_link_a = device_link_add(dev, pd_a,
> -			DL_FLAG_STATELESS |
> -			DL_FLAG_PM_RUNTIME |
> -			DL_FLAG_RPM_ACTIVE);
> -
> -	if (!pd_link_a) {
> -		dev_err(dev, "Failed to add device_link to mu a.\n");
> -		goto err_pd_a;
> +	if (IS_ERR(pd_b)) {
> +		ret = PTR_ERR(pd_b);
> +		goto err_detach_a;
>  	}
>
> -	pd_link_b = device_link_add(dev, pd_b,
> -			DL_FLAG_STATELESS |
> -			DL_FLAG_PM_RUNTIME |
> -			DL_FLAG_RPM_ACTIVE);
> -
> +	if (pd_a) {
> +		pd_link_a = device_link_add(dev, pd_a,
> +					    DL_FLAG_STATELESS |
> +					    DL_FLAG_PM_RUNTIME |
> +					    DL_FLAG_RPM_ACTIVE);
> +		if (!pd_link_a) {
> +			dev_err(dev, "Failed to add device_link to mu a.\n");
> +			ret = -ENODEV;
> +			goto err_detach;
> +		}
> +	}
>
> -	if (!pd_link_b) {
> -		dev_err(dev, "Failed to add device_link to mu a.\n");
> -		goto err_pd_b;
> +	if (pd_b) {
> +		pd_link_b = device_link_add(dev, pd_b,
> +					    DL_FLAG_STATELESS |
> +					    DL_FLAG_PM_RUNTIME |
> +					    DL_FLAG_RPM_ACTIVE);
> +		if (!pd_link_b) {
> +			dev_err(dev, "Failed to add device_link to mu b.\n");
> +			ret = -ENODEV;
> +			goto err_remove_link_a;
> +		}
>  	}
>
>  	ret = imx_mu_msi_domains_init(msi_data, dev);
>  	if (ret)
> -		goto err_dm_init;
> +		goto err_remove_links;
>
>  	pm_runtime_enable(dev);
>
> @@ -381,12 +386,20 @@ static int imx_mu_probe(struct platform_device *pdev, struct device_node *parent
>
>  	return 0;
>
> -err_dm_init:
> -	device_link_remove(dev,	pd_b);
> -err_pd_b:
> -	device_link_remove(dev, pd_a);
> -err_pd_a:
> -	return -EINVAL;
> +err_remove_links:
> +	if (pd_link_b)
> +		device_link_remove(dev, pd_b);
> +err_remove_link_a:
> +	if (pd_link_a)
> +		device_link_remove(dev, pd_a);
> +err_detach:
> +	if (pd_b)
> +		dev_pm_domain_detach(pd_b, true);
> +err_detach_a:
> +	if (pd_a)
> +		dev_pm_domain_detach(pd_a, true);
> +
> +	return ret;
>  }
>
>  static int __maybe_unused imx_mu_runtime_suspend(struct device *dev)
>
> --
> 2.56.0
>
>

