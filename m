Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1D4B606A333
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 17:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=inIDVDyE;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=dK5iWi4N
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=EaC/pPVou/u/38tKjSvAHFuQs6S2I9gJNc22xC1aO5A=; b=inIDVDyEhetJ8cp338LpPejYKm
	26ae/srszrpx6RUKK3V8duhiRkNrnlciceUU/YuCbc3cupIvF3fJhLuEOmfzb+uqm9m+9Kz1j8B/8
	VUddrbzwSEhaUwafKw6aUtpoycuVg8H05/xMd8TUAsGeikTqZkX4BNEXHDgM7U+eq/923FK7B7x3H
	d+s2nHqUNI853DoTNPLdyRcHR5cKxxHj2F8uXlUSKBdzgrD7X4OpaYzbTCuW5blZUaP7zcjZfvYH6
	JJPur4mVkxzso+ddUXRJ13CI7SBFiJ24nCkC74AwAUYWjwBI1pJk3S8R41QlQtIJ2nLW/jUg74DEt
	PdJiJCTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT0IG-00000003NP0-3fsL;
	Mon, 16 Nov 2026 17:15:00 +0000
Received: from mail-westeuropeazon11010045.outbound.protection.outlook.com ([52.101.69.45] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT0IE-00000003NNQ-0Gpw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 17:14:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q+fU/ImkHhs+nd1LEWMmirh5Dh9THvBJNToFdd4phNQhvxFKfcoZuUcSCOWBsxghovyHmm/B8A4TLWrnmgi9pTATby7+vuGEMRly3jaF77HTOqjd0PBzqiJznieVqqmE+HWHH15OAhPa7+IbUxorN8vH/nxSLDcs8lj/FXlFgZk+iq6624pZEe9H238EFgRF5kzi0gtbTndT1+1p0zjLBPPfujmMB0S8gPYr8qYRCwbpkyA9i8TfQcYUB9QzUrB78BKNS8eMW/0Snd5kk4J2rGvo1PyZz5rW4exe86dqta0Z8PQ7AQXrk1AFeC/ymYoLrN6bH1pHf2962hKtaSYYrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EaC/pPVou/u/38tKjSvAHFuQs6S2I9gJNc22xC1aO5A=;
 b=DkmsduFKosm89LVDInFYkrRHccG/XYQQgbmfqBO7Zv/tfNvXRqQkNkEAfh0ef5gRqNMNU88AANEMPbVWuRDBevkp8wtyyDwoTJH6dqLyhO/iW0Ds1PveTpfv7SEaU7NhyD7SR0T9TOWzaGM4iEos3UXfzvAUcNBoWcnLc3QfxQ6h5FDcw1Z0+Ku4Re5qRa5SZs/d91poAe0yQc+2+/W5pprfQbTpiT3+8E2PIoR2+5NBxxqeVntMbyj1mOu77ad+xvJP6o8POAU36UtiS6pM96WRqDiucrpb8QNicqsp7G6/580LnZL8crBIiRE37zvwG13My7zcZJYS+ZEC+zFYrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EaC/pPVou/u/38tKjSvAHFuQs6S2I9gJNc22xC1aO5A=;
 b=dK5iWi4NdgIHA5+hRWjpBqfMudusLBHXnXIZAbnnSfLivlfwLzHdGSTtBcRrHMZP2nlzIycJyFXwjHmypAWffxyiPBmQWdjIU0Gw9WfCYk0pVfn48puDgjFsfzZ7mlB6C4Tns3aFjz8wWgRIgM1bY+oWF+OiD4HZcjhSaamEa/7slfPZIgAJDDFCPNiMMM9YwA62wU8dqIn2aRgOeEwMopgjKivalZqb+GjzBxZdut5FaFzCotG4QSxp2w+9ClHz4w1hNof3eP1XSQzWxLgqEEHJT1HKNdizlPrtXl20JCcW2dLgutsZMJPTBJU9i8lFs4GKgEAyaZiFXDBijVri8g==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AS8PR04MB8834.eurprd04.prod.outlook.com (2603:10a6:20b:42d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.13; Mon, 16 Nov
 2026 17:14:53 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 17:14:53 +0000
Date: Mon, 16 Nov 2026 11:14:42 -0600
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
Subject: Re: [PATCH 1/2] irqchip/imx-mu-msi: Fix MSI dispatch through the
 parent domain
Message-ID: <avs6Avu4PQrcysPl@SMW015318>
References: <20261115-imx-mu-msi-v1-0-8beb58854ca4@nxp.com>
 <20261115-imx-mu-msi-v1-1-8beb58854ca4@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261115-imx-mu-msi-v1-1-8beb58854ca4@nxp.com>
X-ClientProxiedBy: PH7PR03CA0017.namprd03.prod.outlook.com
 (2603:10b6:510:339::32) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AS8PR04MB8834:EE_
X-MS-Office365-Filtering-Correlation-Id: 3dfe0ec1-0c44-4952-16f0-08df44052156
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|7416014|376014|23010399003|366016|1800799024|18002099003|22082099003|4143699003|11063799006|56012099006|10067099003|261026140227099003|261026121527099003|261022105027099003|261028144727099003|261021121427099003|261009223027099003|261102123227099003;
X-Microsoft-Antispam-Message-Info: DWD9oQtKYwuMJFFiBBkTsQagmOYZIDdJjNSXo/Gw2XKE6a3m1OouNPECJY8X2zrLKvYzPYCVFWDbTNOP61FQv8hrF82y++mleVnzD1LNtrxIeuWPFg1Ls3S1OjZ6aaaaTNbzHLZuDfQbgGoTRnQ18RBB4A6cS94QDvvh/qG3qnuwcEugV9b1/gWIygwJhmxdKWgaPnpIphTlulBftndPvFryO7OTxgfbR79As1zMY1LOQ6yg7Iw22LgnfMpcfgBdYP+6UqNXVrgzHOYQ1Q+6rIx+3UaH6y9yh2bHTohAJey1he3uH5+bitQxqeoEiv+yymxJz51pd8G7ZI8qHa5UCzMXEIFLTAt83JGlH/Hu9fTQBiDHIdrXWrFwYoibcuz1By/BWRHHyLwTo8k889FDUU8XjWVx0p0O7HmCX/6TEGP3p7Fa1u2NNWOXTB3QcGYxQ7NWo/IOCTB+P+itTPZ2TePugpwjTOS2sWqfdbl9JyUBioDPlushamCXWkDkPxhW4ev8hnbHVof9n99n2RZJkWDZI4keg51f+UTQU+MLRgv2e+Dd2mhGsdqwCQCCmfapX1i/ajjC1S1Co13ymHMrGtjkcOt7jo8c96ZkD8Rs1h1wiHlMK3xNWDL27wxpivSe+UPfUvBI1MkUemhlXdBq/cMZmb9lkYG2jUxTzt3Z5uA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(376014)(23010399003)(366016)(1800799024)(18002099003)(22082099003)(4143699003)(11063799006)(56012099006)(10067099003)(261026140227099003)(261026121527099003)(261022105027099003)(261028144727099003)(261021121427099003)(261009223027099003)(261102123227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1munswHk2QjsL+Psk+YnrryYquGa2LHxDr8m08+bFr5zoD+rOjPP0pF3mT7z?=
 =?us-ascii?Q?Kzz0umXtdrAG/dySBIx2+YBHr9bjzxFqG3sNsfIP6y9rS+7+7yfFDNN5ejFc?=
 =?us-ascii?Q?KRnyMBp7TPVgv79YFrWYIVydZc8n6AbDrSBLvPTn5Qydk7irXR+SD+Nt1tj1?=
 =?us-ascii?Q?tWIi28YLSuwdMoa4jb8NeWyjx/hYeA/i1z8ZrSGpkRqW4CfVokLa2fbwatCH?=
 =?us-ascii?Q?pR7SKhZcDxNuoypS1RTGpexf6ZmACynmXmAlWeA76Tj+bNYje0cLput2SFRn?=
 =?us-ascii?Q?OnaoNy9+gNID4rF97kmKfF/DmPD9gGMeekI7wtQvCaFWwUZTdvfof6+g+K+n?=
 =?us-ascii?Q?OtEt4JfuqV63hfoNUq0Xxahbbt0Oz4rbv8S2sRbIoXqROBFUMm6kKxeNR7nR?=
 =?us-ascii?Q?Fvy1Ib5K1yhz1phNRPCtRs4A/zb1hRNtQxW3NAfdxwNaxufuFEg6NeiURYDx?=
 =?us-ascii?Q?xwoqeniSFFK6P8FDtGfaNidrGnsHIMeLlGPaBVgSYIm1bR45nQ/Gb51WHlbj?=
 =?us-ascii?Q?d1L+oNVSkMicF3dm8yqHQ9sRZyTKw1qdylXm1b3IfwcGLRds/RBaHE+0HkKa?=
 =?us-ascii?Q?uwA3ZWSHT6MqOh/GL00UBV3YfGZLDWfx5ud86Ie+jlFMmln+mq4Mw59kioFu?=
 =?us-ascii?Q?dOfNyPekXGUJ2MoSSzYa9vvHOLM1fmozyKO0AvAjtC1cB6wfqz395Vj+Tk99?=
 =?us-ascii?Q?T4ct+3fg92pl3MWh8zZiE/MLdLaSRvTpUNngdFwJnf85JItLNLD2uQSOAIqY?=
 =?us-ascii?Q?0uoDmZyG3uKwNBDxWywctpVmpr4k4T99ZhYsItNb5kPc2YHmXj44b20wr+Fw?=
 =?us-ascii?Q?gae9ghaqj33mtldPBuj2C0LaRoo35g0VwquVlJGncACSzpxtV0DgafIBGSwp?=
 =?us-ascii?Q?kRNZFe9UMpLfKYGsLaFBWNrY+XStPjyLhgPgTiMhEFovP7Xt5mblVU6G4jFr?=
 =?us-ascii?Q?JfZUbH3FYJFQtPZ8lnFNyTlsO37MUuZ/8yyljVAjk4TCkAsnkw/6KyggjUN/?=
 =?us-ascii?Q?g1jUqBAg4ab/pC4j2meKVqurHI05jFUr10pa4bSQ89s6/Iq429sxfiduA3tk?=
 =?us-ascii?Q?A7OQqNhqdaKyafDEu/mxul12y022wP7Fhf8mftZbnaGON400PziCwmnFmfrS?=
 =?us-ascii?Q?+mCtHa4ZedL4Yqr52i9SrXU3Zk+MjymvGuml2dete+ma+mY+DNSBo7Xqgutx?=
 =?us-ascii?Q?XZw0tY7lfB8M8U6tJAuoaf4R/F4ovdB0z6WA+tEpbpKNZer5n0YUaNML/r8m?=
 =?us-ascii?Q?rZB4kMoyFHFUpcFrrjE26exQ52I04F3nEVfDmDiJYwdbOIedlkNqJC7MhaU2?=
 =?us-ascii?Q?7wxCJspQvjsbHU6/qih6j0Wc3NyjoVyqlgjS8ScI6kB6eTC3SNOSlxkJAL69?=
 =?us-ascii?Q?96We3lsPgZ8x2fsR4dhChOk2AUuYSCheVKwuuwTDf162ThlEXlfj953Nmekp?=
 =?us-ascii?Q?GuPn62saLp8dWfS0HdHOSnbpLLcDB86ExA8wrthQSDuM+oLpxRXB4snQumI9?=
 =?us-ascii?Q?bZJ6yMSAbJHQuaw3Kj2vTxEobKIdW+eDfUkoOduweonJFyOdyouvNP6N4WU9?=
 =?us-ascii?Q?vFjDH9EuJGMhQxGyiRS61YpOyDEP0xoWZqUHgXIfrKcNdLaEPd9iSAvYpCpG?=
 =?us-ascii?Q?VbQXCzrsViwrp02qEZGcA0+LEeu2dYXcigKty4rSC1WKbxBABucgylka/eEI?=
 =?us-ascii?Q?RCoxYQO8ptI0+HNl3dxRFkFbVH7D/3RLr0pg9fAENCOqpFdC2m7ujrjXvH2s?=
 =?us-ascii?Q?bXb36NkT9mDeaMYo6uVJ3DhQD9xS9rIqSheV7vzgT54xGX/UXUnN?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dfe0ec1-0c44-4952-16f0-08df44052156
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 17:14:53.6968
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wgyWZs7NVripzLXFebNSSw29ExFaT8WhF7FwtiGKva5O/yKjRuLyPZfhuxJrHp/8sNwdBBtfgGRAeCpD/iVHdggO+HRlyyE8Kak0z3FD8IpGS+sjn3/nO6umtlqmHeU1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8834
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_091458_108104_41DA49C6 
X-CRM114-Status: GOOD (  17.35  )
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

On Sun, Nov 15, 2026 at 10:11:25PM +0800, Peng Fan wrote:
> From: Peng Fan <peng.fan@nxp.com>
>
> Since commit 7b2f8aa005bc ("irqchip/imx-mu-msi: Switch to MSI parent")
> the driver creates the MSI parent (nexus) domain in
> imx_mu_msi_domains_init(), but never stores it in msi_data->msi_domain.
> The chained interrupt handler therefore calls generic_handle_domain_irq()
> with a NULL domain, which resolves the hardware interrupt against
> irq_default_domain instead of the MU domain. Depending on the platform
> this dispatches an unrelated interrupt or drops the MSI completely.
>
> Save the nexus domain so that the handler resolves MU channel numbers
> through the domain whose reverse map was populated when the MSI was
> allocated.
>
> Fixes: 7b2f8aa005bc ("irqchip/imx-mu-msi: Switch to MSI parent")
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/irqchip/irq-imx-mu-msi.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/irqchip/irq-imx-mu-msi.c b/drivers/irqchip/irq-imx-mu-msi.c
> index 6d7baeeb2bc8..c42ea0797624 100644
> --- a/drivers/irqchip/irq-imx-mu-msi.c
> +++ b/drivers/irqchip/irq-imx-mu-msi.c
> @@ -238,6 +238,7 @@ static int imx_mu_msi_domains_init(struct imx_mu_msi *msi_data, struct device *d
>  		return -ENOMEM;
>  	}
>  	parent->dev = parent->pm_dev = dev;
> +	msi_data->msi_domain = parent;
>  	return 0;
>  }
>
>
> --
> 2.56.0
>
>

