Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C096B606A33D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 21:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=I0k57BKJ;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=KTeGA/Ms
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=tqbenaJBLexQ34JxbkENCu7nq1W+2e4OJKqhDGZzuKk=; b=I0k57BKJhp4nA88f+5VLHS+NbT
	jFawh8I1BjDwufPrhKF1AkukjGCAntgz2IdRpqOww3KQI8FA3xkDsdoCK89X6wzzTQkHs8rQSbQyF
	Elvpdy+vo3huXx/QQC2YYbsL6hcZ5xfQ2LZ1Nr8IjT5DwCj0mAWYRj/kU8osXfQB3KQw/vPgpfk5C
	WoDrL6C7p+dr63IzeI+nY3/10MyfGBcSdQAbvI8ojj99A18TZm8WJn6UqM1DTWNwnyzYa5Fma3OMH
	zWkk8excGOjw8KgbC/XZmRMjsE4HIx3jRlv2M02ZshedNxFWSzV+XPtHPVng8gF07xn39mLYj5o+3
	PuMV1AUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRylX-0000000EZxx-3ATy;
	Fri, 13 Nov 2026 21:24:59 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRylV-0000000EZww-2Mc3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 21:24:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o4zYcvpiA2l8u/4k5C7ibekDA+uIhaqilK+Z6yj773t04RZUpq/iMjFdxF5RmCJ8sEJ9KUntW8bDDsQKLNgj/6Jt++cSPvWbx27ijwNR2bHhJsn1TgXgWcAGGyvBVdV+pxee7tRV6Ctdn1f0m/dl29knJ0nBuSTGfGjg0tNpbGJZ3gF7d9Xm+On+kF1FudThSnDff0Qwmi6ZurywPbFzC5b45BT+vVOr0qCRXRXXrXkJtB4qZjdAG88lC/siOyG0J0Qqt2/u6e3bqZE5LHwVog6IlrhnZMWAskOpYjxxhXfQC0yB9sVRkuoR3Ce1eS4VozmQnRlzYeujzFyVE/D14A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tqbenaJBLexQ34JxbkENCu7nq1W+2e4OJKqhDGZzuKk=;
 b=yTn0jDA1OPNJGh7aOqm0Zi9iZmLmpOkzR7OoVPMo+SGvDYUY3o769T5APeyTiVur3Xj/G1wzSHJ7sguaS5eEmtM9HBqmV4U7gQqvGhgzzOONKSXi/QRlC30dbIcWZbufTcZFzp3iFvU/ONrlRdiNyNi3/AqgTUAJnb+LxRAvP3pBNgRDtht6Yjk5jQm6mNE7++Nh4JpEwvRLrjApyHmvID3FonDuUZf6eU8FVk3erw72kVD7SKhoc0DBqPyYvZGwoi4+7f5OE39XFM8rowBQwRI309heHX8EL7BL5NH7CaU0n/9pw3KlnRrf/sc+QthRt72zMLvlU65KT9z8MRMYNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tqbenaJBLexQ34JxbkENCu7nq1W+2e4OJKqhDGZzuKk=;
 b=KTeGA/MsBCwLkXE4nxACV6ZvJlA4oKxrgRGcKA2+d9YdKmUWXp5bv2EysBcw4P6SBuym2t39kLuQX7Hzi/M9RpIdTLWTlMw9q+QnsuzLIVh/TSVGiQCRohy5Lj8fBFUJQ3tvyTOJRqVRYe1TADaYi5jFyLUfYBSnNCRYrteaiveRjQuVKCXedGeGwDLbQBD9/ibOTB056iOguzB/ipQUsqzLe3FtZxa/Kz6j9plK87EKsy1u/PtO4LFccl4tf5BTCMmNjWVFznv8wx9RdQqk0RlzFdWNPFh1MWNX6WwG1VEw8xfmIfVCN3MJz5T7WEM0PG3UGT8t+qgKQ8pH1/U/6g==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by PAXPR04MB8655.eurprd04.prod.outlook.com (2603:10a6:102:21e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Fri, 13 Nov
 2026 21:24:52 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0615.009; Fri, 13 Nov 2026
 21:24:52 +0000
Date: Fri, 13 Nov 2026 15:24:42 -0600
From: Frank Li <Frank.li@oss.nxp.com>
To: vjardin@free.fr
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>, Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	NXP S32 Linux Team <s32@nxp.com>, Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, Vladimir Oltean <vladimir.oltean@nxp.com>
Subject: Re: [PATCH v3 3/5] soc: fsl: guts: add the RCW override of any RCWSR
Message-ID: <aveAGsPO3rBqccLj@SMW015318>
References: <20261108-for-upstream-lx2160a-rcw-pinmux-v1-v3-0-5a0063f1da9e@free.fr>
 <20261108-for-upstream-lx2160a-rcw-pinmux-v1-v3-3-5a0063f1da9e@free.fr>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261108-for-upstream-lx2160a-rcw-pinmux-v1-v3-3-5a0063f1da9e@free.fr>
X-ClientProxiedBy: DS1P220CA0013.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:455::8)
 To MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|PAXPR04MB8655:EE_
X-MS-Office365-Filtering-Correlation-Id: 07353583-612b-4eaf-da6c-08df41cc8e0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|19092799006|366016|7416014|23010399003|376014|6133799003|22082099003|10067099003|18002099003|3023799007|11063799006|261028144727099003|56012099006|4143699003|261021121427099003|261026140227099003|261026121527099003|261009223027099003|261022105027099003|261102123227099003|261022075727099003|261102130727099003|41080700001|15866825006;
X-Microsoft-Antispam-Message-Info: VHe74ec1s1zrhZI93dUjk18ZMw3MJ4QNJB78fkgfyztYe3AiPunyj1BJgUY9BH2GantBQzc3jOdI31WPlTyabOP0MQe3jSlttx203mP3xezX0Iasl5OYTqHkFrSihE425ZTSGkQbERXBIoiyZqMEUBKNBMNwhup1oIFstJvHf2D4O2fEKWiyxl/UNFiv2anHAM31iH5ZDL+VUOotj7xJc8rxoYvEhgUkhulCqNhjKeraanlxHX/9XdRPntYMXOHIU8+sZVcTB+TnAonyGop9XDSiIoCnwcWD0ZoX3T3FnUEqczqk/9PK4RocmUFJYySXoG5VGAALZ/WT/3n62ILUw9wc2JFeoitGngOy90XVJAYwc/oD4sBQLwjzTA0E1/+j/t52qs3zd1jokiXMqs+GDwDiE6/rAgxLFPPLxzGyNAyuo5KZLdWhO06w/I1MBW/PZqnhW7vKEmHh/pvs4SryEWh3+wPAVl8T8UjahtM4O48siEu35KM65Ym3qkZT7k4JA7VFwuiFCWi9qA+2NSEpRzVMM2BvPYyeyjoD2EpqdWeVFHoJ4yCslYmpTtLLAeJE0cZ+mRN18xXmrbLHWiUIY/AiAHp4TnUViKjFA9xwpvBqSA8MGBGYVCM8R9k3qGluP2Qs1w/mVUC8ZQBLcP4a/r7109TRDxiQgbRozkA6etot2fl849BbtxuD9LhKYeRnt0BcjJIjsnGxPHYM6rMJN/wh3slHQL7EmQLxOww6Fw/Pa1KnRn/sIEauBWH2mz5B
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(7416014)(23010399003)(376014)(6133799003)(22082099003)(10067099003)(18002099003)(3023799007)(11063799006)(261028144727099003)(56012099006)(4143699003)(261021121427099003)(261026140227099003)(261026121527099003)(261009223027099003)(261022105027099003)(261102123227099003)(261022075727099003)(261102130727099003)(41080700001)(15866825006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GuNQBJFkreTYsngsXmx7y8GYkb8bqSeEd3krjz1sW8MDN2m1AUpUOIIyJYEo?=
 =?us-ascii?Q?JamnLPa29wo24Yi/DUtnH0QYqitr/YhNAJVlDfp8sYGBSpBcIyQcRReiVvmd?=
 =?us-ascii?Q?d02S20BtfFmVTxvCLyKoRUjtYvfuiS8/2BfvWx733j7/ZrdVzXKedRN7Jokw?=
 =?us-ascii?Q?CSID+505rHfwcMjFbwShLAC3v5tYzX9jub5gb06lP8B6qkb4KZpfrJZtRx5H?=
 =?us-ascii?Q?kRHpEKAVueHvpEoYuqOn6rld5ryG9CD7D/l6FqmPyztqyPrU0ubUM+el4CDt?=
 =?us-ascii?Q?Fnhvd8mUSN6y/0JfIjLWrBMRYrEWx3qJsDXkoSfNy8UIp/39EF7Kurr02HnN?=
 =?us-ascii?Q?RSaWKMZ6dSEOGSSG5NFhNNu5YeTNotoPoxM/xnGkcGRXla49ZBgB3gUxN+E9?=
 =?us-ascii?Q?RIVHOBb/5dj7kf1BR2VTvXlASxtIFEMnjNZd8tVZ0nvbIpCIUCTkFhk0kjob?=
 =?us-ascii?Q?OvulTn9wsiDG4QlLCWIZblwkOCghPofsuZGbcMKndFZo6+QSIxAMEDlUexu/?=
 =?us-ascii?Q?XosiP5grjy6JdYMKvZXvweI8U3BHBua0d3WOCqEObK/mAZLw/RLiguAv1ksh?=
 =?us-ascii?Q?7zgWr33ETgL8SjT7FyvY9Wf5kSB5bYdT/10PAIOmOSPk9OJ6mM4b2U0hOrxn?=
 =?us-ascii?Q?psi1xm2gd6NwLjGVoaq0H9dDaoDsCLT9wIywO/ZuWsnaBtO9FhlFBGPpZVg+?=
 =?us-ascii?Q?rr8V6Tjnhde2mgAlbkqpgwzyGiDgXVqEwrOFTFAAjN8BjqC8lv20ntTx/OpP?=
 =?us-ascii?Q?jelnlAdGszwdjjNaSnCYIl5x7UXpMBQtHvrGG/q3JxuFi9d+HsmZjmsEpPvz?=
 =?us-ascii?Q?ZlJyJPjWcXhqaXBaVau67B0g+dFqPmvBW8pC4eVJDad8cFPtvH1IZRbWrRAk?=
 =?us-ascii?Q?z6mou8sfMWm7ewR1OKpHNUK+ZTIZMw7o4Gl0lpMogGJdwanbC/WKeWj5auio?=
 =?us-ascii?Q?wTfDOBl8UOatAefs0w9DxA8+2LTn51J2IzcIffYU+atsVrDxjnaunnsmEZ71?=
 =?us-ascii?Q?3gMbww7YuVwAEeuGFtOVSRLYxcgfREByMtEO5v8Ci1AAGqIutYWQf86/Xjzs?=
 =?us-ascii?Q?V00faFtAoOOLsLsLvB8h66z4b2vJrB5iUYcWkpA4AoYT9mbEdz7h7xGo3NNL?=
 =?us-ascii?Q?dRDsrVIJOA8CalH7hP9Kc0qno14Sajtd9Bap4PbXmpPju6nGwIVkdQVEovBu?=
 =?us-ascii?Q?TNBLtV+L0k2UO+bSoGHfY3AWO5WZxECmt2a28RBj/mk100+BOjOpm4pgoOpW?=
 =?us-ascii?Q?p23HoHrAV9kOSd/G+OdNwwUnVVF6sda9uept9P3LL5UrmV06SIw1qbcWDbUJ?=
 =?us-ascii?Q?Wds6enP1rywS7HhX6uPHzF3i61rrQsFX/da7EaAf94F7uiyf6DMMhFe/SfYs?=
 =?us-ascii?Q?JP1UymkelvG6brZJUFBCLifWHToOvAwrcKT8Xx8UTQuCwPy8Bm3cPyNHhzHJ?=
 =?us-ascii?Q?H981vd07rOXT1hROs/G8Ux5Qd8FtIhAUDvvAIztyCtnFWgxkZ5coUh3X7QIm?=
 =?us-ascii?Q?LBwKINMo3Kfnah1tfOkrNF5r5BpfB/MjWDFVjrUlgLZ5a10ipih1wrCt/DC8?=
 =?us-ascii?Q?9tcgmuE5c67oKscuizKDGupHGiaI6ZHJxYlW8Eh9ZtEexE5kHMsMaIyLlnHw?=
 =?us-ascii?Q?ReyiVh4xxnUPMq4RZzsHuoUquPEjVJtKoogWjydP7dFMOITvXEYqigjOxKfl?=
 =?us-ascii?Q?3rTsewBFwParUhaQvtFZDEE8iBoUyHs5uBf3AuNea2n4ghpUQObGYh3xqLtV?=
 =?us-ascii?Q?Iqm40trIXTJRUPtbRMMaC9DvxunT2aukqEgTCM2t0YZ9Bz6SRe+B?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07353583-612b-4eaf-da6c-08df41cc8e0e
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2026 21:24:52.4331
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q9deMreC95ePZE2ipxwGrSe9mI/FUtKZC9g1Yt4Hrbh2YATVWvOgVKZRiRGmet/XKR9O5nkKEqSC1m3BmdSoZqxMuYDzr8zrjBvXfHhG79/jHGKDlKW3/neWrop51dhg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8655
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_132457_609387_AFEDAC01 
X-CRM114-Status: GOOD (  24.77  )
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

On Sun, Nov 08, 2026 at 11:06:51AM +0100, Vincent Jardin via B4 Relay wrote:
> From: Vincent Jardin <vjardin@free.fr>
>
> fsl_guts_rcw_rmw() only serves the SerDes lane modes. Export it for
> other fields of the RCW:
>  - fsl_guts_rcw_read() reads a status register
>  - fsl_guts_rcw_override() changes fields of one under rcwcr_lock and
>    waits for the status register to follow
>  - fsl_guts_rcw_override_supported() tells whether the DCSR view of DCFG,
>    which holds the override registers, is mapped
>
> Signed-off-by: Vincent Jardin <vjardin@free.fr>
> ---

Supposed go through pinctrl tree

Acked-by: Frank Li <Frank.li@nxp.com>


>  drivers/soc/fsl/guts.c   | 73 ++++++++++++++++++++++++++++++++++++++++++++++++
>  include/linux/fsl/guts.h |  3 ++
>  2 files changed, 76 insertions(+)
>
> diff --git a/drivers/soc/fsl/guts.c b/drivers/soc/fsl/guts.c
> index 28361c63e26c..d2e3f66d0da4 100644
> --- a/drivers/soc/fsl/guts.c
> +++ b/drivers/soc/fsl/guts.c
> @@ -369,6 +369,79 @@ int fsl_guts_lane_set_mode(int serdes_idx, int lane, enum lynx_lane_mode lane_mo
>  }
>  EXPORT_SYMBOL_NS_GPL(fsl_guts_lane_set_mode, "FSL_GUTS");
>
> +/**
> + * fsl_guts_rcw_read() - read a RCW status register
> + * @index: one-based index, RCWSR1 to RCWSR32
> + * @val: the value read
> + *
> + * Return: 0 on success, -ENODEV before the DCFG block is mapped,
> + * -EINVAL when @index is not 1 to 32
> + */
> +int fsl_guts_rcw_read(unsigned int index, u32 *val)
> +{
> +	if (!soc.dcfg_ccsr)
> +		return -ENODEV;
> +	if (index < 1 || index > ARRAY_SIZE(soc.dcfg_ccsr->rcwsr))
> +		return -EINVAL;
> +
> +	*val = fsl_guts_read(&soc.dcfg_ccsr->rcwsr[index - 1]);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_NS_GPL(fsl_guts_rcw_read, "FSL_GUTS");
> +
> +/**
> + * fsl_guts_rcw_override() - override fields of a RCW
> + * @index: one-based index of the RCWSR and RCWCR pair
> + * @val: the new value of the fields, in place
> + * @mask: the fields to change
> + *
> + * The fields outside @mask keep the value the status register shows. The
> + * override register is written and the status register polled until it
> + * shows the result, as fsl_guts_lane_set_mode() does for a SerDes lane.
> + *
> + * Context: takes rcwcr_lock, shared with fsl_guts_lane_set_mode(), and
> + * busy-polls the status register for up to RCW_TIMEOUT_US. Does not
> + * sleep; must not be called from interrupt context.
> + *
> + * Return: 0 on success, -EOPNOTSUPP without a DCSR mapping of DCFG,
> + * negative error otherwise
> + */
> +int fsl_guts_rcw_override(unsigned int index, u32 val, u32 mask)
> +{
> +	int err;
> +
> +	if (!soc.dcfg_ccsr)
> +		return -ENODEV;
> +	if (!soc.dcfg_dcsr)
> +		return -EOPNOTSUPP;
> +	if (index < 1 || index > ARRAY_SIZE(soc.dcfg_ccsr->rcwsr))
> +		return -EINVAL;
> +
> +	spin_lock(&soc.rcwcr_lock);
> +	err = fsl_guts_rcw_rmw(index - 1, val & mask, mask);
> +	spin_unlock(&soc.rcwcr_lock);
> +	if (err)
> +		pr_err("RCW override of RCWSR%u failed: %pe\n", index,
> +		       ERR_PTR(err));
> +
> +	return err;
> +}
> +EXPORT_SYMBOL_NS_GPL(fsl_guts_rcw_override, "FSL_GUTS");
> +
> +/**
> + * fsl_guts_rcw_override_supported() - can a Reset Configuration Word be
> + *				       overridden?
> + *
> + * Return: true when the DCFG block is mapped with its DCSR view, the
> + * second reg of the dcfg node, which holds the override registers
> + */
> +bool fsl_guts_rcw_override_supported(void)
> +{
> +	return soc.dcfg_ccsr && soc.dcfg_dcsr;
> +}
> +EXPORT_SYMBOL_NS_GPL(fsl_guts_rcw_override_supported, "FSL_GUTS");
> +
>  static u64 fsl_guts_get_soc_uid(const char *compat, unsigned int offset)
>  {
>  	struct device_node *np;
> diff --git a/include/linux/fsl/guts.h b/include/linux/fsl/guts.h
> index 8d5ffb985fee..7127de897c23 100644
> --- a/include/linux/fsl/guts.h
> +++ b/include/linux/fsl/guts.h
> @@ -142,6 +142,9 @@ int fsl_guts_lane_validate(int serdes_idx, int lane,
>  			   enum lynx_lane_mode lane_mode);
>  int fsl_guts_lane_set_mode(int serdes_idx, int lane,
>  			   enum lynx_lane_mode lane_mode);
> +int fsl_guts_rcw_read(unsigned int index, u32 *val);
> +int fsl_guts_rcw_override(unsigned int index, u32 val, u32 mask);
> +bool fsl_guts_rcw_override_supported(void);
>
>  /* Alternate function signal multiplex control */
>  #define MPC85xx_PMUXCR_QE(x) (0x8000 >> (x))
>
> --
> 2.43.0
>
>
>

