Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF4C7606A686
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 16:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=H5XsIIQE;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=nu5Qh/Q/;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=oidyI12y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=SbS6GgrhmNVmniZxZeJ3pduyGX3P1iyIUi800IMDo9E=; b=H5XsIIQEMrOmHgPbKGzEOogV4v
	BQeZAzMn7VLKBthrFFPoGFdgZAfm5R1V1kz9SlzL1dXcqWL3JoxnIzE3KilOnSTnKfb7dkTu66puH
	YD/k0WN1qZFzJraiRVLbTTdf+8aFwRKF6qg+QI2GKZKXdI5e5l4OFSKaEkAlbosX8bZV+8+tic8V+
	uaFXUb7mxtBpYV1Kwd94IFGmGHW3baRaxdHj9PrvFb5Rgdpfm1o/UVlpYJce125PtKq4kw8jbm4IF
	k3KXSddOcx+EfU0cnbkJTjAwf1EUgn9i/OTXvpl1c5UMOTfOuJ21B7sjhayyDMVa2bwEVQgyWRX8G
	oaSZQOeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWcmI-0000000Dyw7-0S0i;
	Thu, 26 Nov 2026 16:56:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWcmF-0000000Dyvx-3uH7
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 26 Nov 2026 16:56:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:In-Reply-To:Content-Type:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=SbS6GgrhmNVmniZxZeJ3pduyGX3P1iyIUi800IMDo9E=; b=nu5Qh/Q/hUv4TyXtDOma2R/tM/
	8lUHc3rEOZPqcmP5paL14FfFpCUqTispYwmQ3KZM3ZQ/3ely5q2Pnt9RSpqRSbHCiU3VgqD0GQTt2
	uTjzDOG9u6wzpJ8Stg57XiKA2qpAHCsSXIj3N3ghaxq+26amm/1bbNCjWKZpaTzoE2MK33/LPae7i
	cnFNKpZr34JTvKP0XIxoCAZWDU1PBbuxQWOpKWyh7p8J47KTwgtubzzSqvh5H6lxsZA0AYRBDPO6b
	WX2e2D9gm8WhwWwR9kE5NkN2yIsu8h4dEJ/1ZU5VdoVZ4BBH0lbK6ajSWgTJHohSu/K8jA5aIpQou
	yu6GLUNw==;
Received: from mail-swedencentralazon11013069.outbound.protection.outlook.com ([52.101.83.69] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWcmC-00000006sNu-41Le
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 16:56:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nf0tMfAPHTgbDpDg8Pu5XHDNAhtIXkulKaTXrWNZNcSuvjvGzDV7wtLYq348c5pplXO1luKr7I7ckFRjivMCOSKKeb3fkm4UIKFcpx90ZYv6DQTGvagY8YAG+H6ibKA8ItSPdQbCW/XxL/EA8J46ji2X7+XBJTIwIATrRCG9D6HYu1+lc7tc6Op0wPYbLj0U5ZpDe9PN3+Oqq0wXRZhc39RT2l6xlXTPfSfnvFtoFamqcIdLXexuwfV03L96uSHRfJsiEzpeif4YV/cKXp91bhPc+7PxCrH3ybledpd7mYh1C9sjz0/gR1/ZCJ7+h7VdmatzqNoKgKEMghk3TX9eRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SbS6GgrhmNVmniZxZeJ3pduyGX3P1iyIUi800IMDo9E=;
 b=MCmB9lp1addmOEgo3O8esVBX+1e5xBqxmwP/fFTe90UkWk/MGxmSfvSAi0bSrw3ycvkzzevmWRSO1LXrwM+WX7sK7m3kNu8+Xu4oMW36n1RrhOfbq7S/byZln1qRfzPd7IYvWR6Me9wZFtFWYdI0BnTkKkFs7O29iyrr7DTCYtCcqMv7gPXp/29rWz8m6xtrZay+wvnqNDQ9mC8s7H2wllXxSiFZ3lcaP5a3L1+AR3KqaPH/lTaBw+Fpx9j0VbVm7slZa+gYyutyVgEx8ATIWf5AWdFIyMXkESR/aSeyyGX0CJv8PxNak6/vDj98okgb5tR12JEtXPLgWlih/CamTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SbS6GgrhmNVmniZxZeJ3pduyGX3P1iyIUi800IMDo9E=;
 b=oidyI12y9yDsgu5+XemkTWMdea4DDTDEgH0aafyGjg37hRIAWGHc3wDl3Bypybwzgpt9ofYirz9Njg/Zp7ZNeo/Gkr5AXorKsbFTQGtWcc+S7b+lG7POyk4GPnIG9MtxbTjkRfOSa1Jh1asBO7O+VX3hYbqjQJzEl4iobF3CZKwaF8dJIfnWtV3/FZP7sGitbk636AITqmxQbnn1ElGZT8AE8XiPbvZG5FkTc2wIRjnlM+thuvQRP4FFbH875DXvrx6GILdK2m+FsvxEy4En1Fw9ptDgYcDikbTOJQ+jEjcvXqlq6DPtl34Hz0bFYv4icg8YV210QqZWJiIRyCr9Uw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AMVPR04MB12650.eurprd04.prod.outlook.com (2603:10a6:20b:775::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Thu, 26 Nov
 2026 16:56:47 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 16:56:47 +0000
Date: Thu, 26 Nov 2026 10:56:35 -0600
From: Frank Li <Frank.li@oss.nxp.com>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: Russell King <linux@armlinux.org.uk>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux@yoavmoshe.com
Subject: Re: [PATCH v2 2/3] timer-imx-gpt: Allow 32K clock to be used as a
 clock source
Message-ID: <awhkwx0O9MPwJxdt@SMW015318>
References: <20261126-imx6-idlestop-v2-0-c6987e7a392f@kemnade.info>
 <20261126-imx6-idlestop-v2-2-c6987e7a392f@kemnade.info>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261126-imx6-idlestop-v2-2-c6987e7a392f@kemnade.info>
X-ClientProxiedBy: CPBP307CA0006.DNKP307.PROD.OUTLOOK.COM
 (2603:10a6:380:1::16) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AMVPR04MB12650:EE_
X-MS-Office365-Filtering-Correlation-Id: 13180dcd-ed45-4170-48bc-08df4bde41d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|376014|1800799024|19092799006|23010399003|10067099003|261022105027099003|56012099006|4143699003|11063799006|261028144727099003|261021123027099003|261021121427099003|261026140227099003|261102123227099003|261009223027099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: T8vkMvvQOFU3X3wjo3nw8QWkPmknVnH0mN1En4n4YpxnkUZbhXRebx+SmNgl0vblU7yz4s7SNgaW+N+Dt/W6A3wFQvkFeW/9SyoR3WIwva0CbjXu2FHHKW9ohLRIMDhFKf5wB3qpK8Db7UeuiUwdxKZyIjIwL17oWbRvUTk1kTkP4JRl2UJe/9yyLX2SnW61nI+ENUF29wWln3cMPwKFDHwe+9ZZIPF2tko3LrhXJYAMgTcTeHVHDWD6k6TzjSNYLBCDlq2LsbjSNfltLinPmUwBH/m8t6eojdJ5q0VpFjmuCRGX30kW67L+MxfUgSojhFp2EfPyNdGq2bFoJP7V5ynhYJEV4T4n723oLQs79gqG1hNeOmCBa3pcYC29YPRZUY5kXreHXUrMBDzZRBZqsh8OXrCUvWa/zBbRL1XihjaVXFRaFRyvV3bjOF3W0oOwegGX1toTZBjKTrlxVyE2dWXRs5X+BH4WCAkwwe3Oxtea4seq5EJQhQxiyjLWoFyLAo4G7UEksQW/LGX3IxzuXs+/pYFSzaaDN0fkBjazClmRRX0AUHOeOlDq098qkMHaG8DFT6w2OJDrN+HWSPUZF9jSf1LAOEY7LmTDjPzcwOB0g+t/nlfCXe7LCe09cYVqqSmwoIQmokjFdWbyQwaDOXbwOH1s62QgLTjz4QyufIU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024)(19092799006)(23010399003)(10067099003)(261022105027099003)(56012099006)(4143699003)(11063799006)(261028144727099003)(261021123027099003)(261021121427099003)(261026140227099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?delTJo3mZY2OalRuTMxtegRLOFGOsWdY3Yc14iZiT4E59TwxINYBdlJwTDGD?=
 =?us-ascii?Q?kOQ1TbKT0rwOB2DIFxFa2gy1EqlMNFbAIlB5FNIrU3WCE77znJrQ96rsmBf5?=
 =?us-ascii?Q?6RsfT0qTLIwuDDHT9uXdfpxlFBj/ZbNpJvxUoF0tj1LnyhWhSearWOqp6aBU?=
 =?us-ascii?Q?H1RVYtTsemvB9mV7f54c7vX4IZ6X25kvKf0pVbVZlejQMheSAlJLRpwV4JN+?=
 =?us-ascii?Q?xEpMjcECn4FUfcHHtBzLyKS+66K/zFjKQLrGyOpPkKCW/N5Dyh1vyr7NH7ux?=
 =?us-ascii?Q?v8Mb03H2HoKC5THhOMsaITVpEZ8v2nbANKwDEr0zQ5opjdhUxR6KHOjszjlj?=
 =?us-ascii?Q?UC4jWLg+VCgPRLx44csIPz8jkyCuDsuqf2MG6G9ESOjzrja9Yh/Y8k5AaKF4?=
 =?us-ascii?Q?xQx2UPr/W2TE1ARD9UBhryYFVYNs6whmBCkJYH5n3pGfJkw24W8KsKo9lFyC?=
 =?us-ascii?Q?NNrjCFve+c1a465ctQG6Fd79m/zz2XEwR5XahPH6UEX/DontSx5wyvoqbqeZ?=
 =?us-ascii?Q?MKNC0DUK47bdNZ9E27h5uY7/C22IAGmViwvSKbNG9xHnJlpmqlUmY+QTLeqa?=
 =?us-ascii?Q?9ke2vjH+cpI7nLhyA8rzRqgpJXdTedL6OOVkN/dIIJk89PTvnnSYBk9gq8c3?=
 =?us-ascii?Q?K4FFTwP1YcwQ3IcKeOQDuGV9qrASf3yo25uA1/sW+5MxM69bBjO+LlITy/RC?=
 =?us-ascii?Q?0nghZUhSBdpGRU9+n9T//M4vuqVoELBH2+3sPLnFW9GuAndpGdHHIAHYIxsD?=
 =?us-ascii?Q?3lEFNYeNHU2KIzyCUifscJvNCaUoN+BAn6v7PYgDQNDNXu4RWkmSyHj+GdVm?=
 =?us-ascii?Q?SHzob0smJchgDG+X2Jvrht0Yx0pHVz+qb/x149zbghG9wfjdarnmy/T8c48Z?=
 =?us-ascii?Q?aYXW4Hh6HyEpfTDyDFZ9jg7in9w00ErfAa7DT0oGogdzBHXhKXCTYb3+G/w+?=
 =?us-ascii?Q?maUZpCudYmhPdPRYu50NT64niAwGTGIdWOAazm0WQvRdCXTohF9h7TgGvJyt?=
 =?us-ascii?Q?m9Z1Uni2Y3PLqGuJX6d/EEW7+1gUZsxcmJwBpJbyBW9DO+b9KAGhhl+fN4Sf?=
 =?us-ascii?Q?6sNaKebhO5xqZPvT+/snmSWhLu+gncxkLtxxjqxx4+Cgp7SiNFhxAue/AgXS?=
 =?us-ascii?Q?+xl/iQpkEY+q/aKL47SzdkFGaUS3AjGlGyXKg/R/KPVVx+cXrlVzkcpHakTs?=
 =?us-ascii?Q?Xyyg8MfgVCOODFJRAZAxZxoZDScGTS51+GRyh/drrvQ2/HxfB1XpZCr+kAoB?=
 =?us-ascii?Q?lMacjW3ipQc5n/4siQ/yZ4Z6akTex+As7/pN7NcehtbxI8vjqD/z43qED53m?=
 =?us-ascii?Q?cCG+bRscIROfpN/3LMpCStAO9b4T+vbgIR4FdkAjGv6Fgv97Ca6xXaL2cf7m?=
 =?us-ascii?Q?sRdL6nDamcXDEbmJmfC8+eiyok6YkRTGnRCNB+8x2GJdZS8spfXKWDyMFOlm?=
 =?us-ascii?Q?dK+b4pZ8YjT7easiL9MfBQhpuBWSCdOIwnw9yy3df+OFxuEvYybJ7s87ee90?=
 =?us-ascii?Q?p5rtrNdwU4TDoV/JCR+0sNnwRi+neMqeLrs/R0zzokImZgA8bfizIjJOInZS?=
 =?us-ascii?Q?K1DttkvBdB8arueC19HYNpnPD6IkCvB/qCagGVb9QgrXFm2HqGuk7X7swtIX?=
 =?us-ascii?Q?cNAeftcQ/iIqI1Sb+zIFIneWSJyZUPrR1DOqYj/8XM4Ci6yATKeyM1G1Z2EG?=
 =?us-ascii?Q?Rz5Q4pD8onarE5WJ264NPiBGbTaqcLOM0iiNUDElkKn1Iqvt1+XasHmAzxRJ?=
 =?us-ascii?Q?EzNlIxPVfHEqm9nMOA0EVinSSKFnXiL5+hq9tkUhlPkj8G7KsGGX?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13180dcd-ed45-4170-48bc-08df4bde41d4
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 16:56:47.2190
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WfCUtoc8d6SaGbEyijrZkKIyw++en3NNQNwCuglP/YQo9wKw1E5f+BlfrT+slT40xX1+6lae1olsj9kJda8Qm1ja/E2+FhwLZPIkp4uel5IRWDXG3wIAJN3oIsys7+OT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMVPR04MB12650
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_165652_930245_4F7AD032 
X-CRM114-Status: GOOD (  23.80  )
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

On Thu, Nov 26, 2026 at 12:00:55PM +0100, Andreas Kemnade wrote:
> To avoid depending on PLL infrastructure for timekeeping, prepare for
> using the 32K clock by configuring the clock source accordingly.
>
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> ---
>  drivers/clocksource/timer-imx-gpt.c | 17 ++++++++++++-----
>  1 file changed, 12 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/clocksource/timer-imx-gpt.c b/drivers/clocksource/timer-imx-gpt.c
> index 8335bd7f8c6ce..85fd36fe1c760 100644
> --- a/drivers/clocksource/timer-imx-gpt.c
> +++ b/drivers/clocksource/timer-imx-gpt.c
> @@ -50,8 +50,10 @@ enum imx_gpt_type {
>
>  /* MX31, MX35, MX25, MX5, MX6 */
>  #define V2_TCTL_WAITEN		(1 << 3) /* Wait enable mode */
> +#define V2_TCTL_STOPEN		(1 << 5) /* Stop enable mode */
>  #define V2_TCTL_CLK_IPG		(1 << 6)
>  #define V2_TCTL_CLK_PER		(2 << 6)
> +#define V2_TCTL_CLK_32K		(4 << 6)
>  #define V2_TCTL_CLK_OSC_DIV8	(5 << 6)
>  #define V2_TCTL_FRR		(1 << 9)
>  #define V2_TCTL_24MEN		(1 << 10)
> @@ -271,6 +273,7 @@ static irqreturn_t mxc_timer_interrupt(int irq, void *dev_id)
>  static int __init mxc_clockevent_init(struct imx_timer *imxtm)
>  {
>  	struct clock_event_device *ced = &imxtm->ced;
> +	unsigned long rate = clk_get_rate(imxtm->clk_per);
>
>  	ced->name = "mxc_timer1";
>  	ced->features = CLOCK_EVT_FEAT_ONESHOT | CLOCK_EVT_FEAT_DYNIRQ;
> @@ -281,8 +284,7 @@ static int __init mxc_clockevent_init(struct imx_timer *imxtm)
>  	ced->rating = 200;
>  	ced->cpumask = cpumask_of(0);
>  	ced->irq = imxtm->irq;
> -	clockevents_config_and_register(ced, clk_get_rate(imxtm->clk_per),
> -					0xff, 0xfffffffe);
> +	clockevents_config_and_register(ced, rate, rate == 32768 ? 3 : 0xff, 0xfffffffe);

Check 32768 is not good enough, in case board use 32000 osc. Add optional
clock osc? Or check clk_per is NULL?  OSC clk should always existing.

Frank

>
>  	return request_irq(imxtm->irq, mxc_timer_interrupt,
>  			   IRQF_TIMER | IRQF_IRQPOLL, "i.MX Timer Tick", ced);
> @@ -314,14 +316,19 @@ static void imx6dl_gpt_setup_tctl(struct imx_timer *imxtm)
>  	u32 tctl_val;
>
>  	tctl_val = V2_TCTL_FRR | V2_TCTL_WAITEN | MXC_TCTL_TEN;
> -	if (clk_get_rate(imxtm->clk_per) == V2_TIMER_RATE_OSC_DIV8) {
> +	if (clk_get_rate(imxtm->clk_per) == V2_TIMER_RATE_OSC_DIV8)  {
>  		tctl_val |= V2_TCTL_CLK_OSC_DIV8;
>  		/* 24 / 8 = 3 MHz */
>  		writel_relaxed(7 << V2_TPRER_PRE24M, imxtm->base + MXC_TPRER);
>  		tctl_val |= V2_TCTL_24MEN;
> -	} else {
> +	} else if (clk_get_rate(imxtm->clk_per) == 32768)
> +		/*
> +		 * if powered by that always on clock, it is feasible to let
> +		 * it run in stop mode, too, allowing lower idle states
> +		 */
> +		tctl_val |= V2_TCTL_CLK_32K | V2_TCTL_STOPEN;
> +	else
>  		tctl_val |= V2_TCTL_CLK_PER;
> -	}
>
>  	writel_relaxed(tctl_val, imxtm->base + MXC_TCTL);
>  }
>
> --
> 2.47.3
>
>

