Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BDD6606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 16:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1H5bYXUm;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=co2D1OUk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=909fGxJj8pcbDn0gjsDKGhAGHncEpAXdhzKPe6Jd3lw=; b=1H5bYXUm6tI/Th84IR7E3OyKdl
	VtYrGedEeORUEj/4uL6oj+X8EcBqopr7MdD+vMbW5+HPtg7GNfGiMQ377wcm0Q7ZUAOJDtAg7PD5e
	bOGLvCnmyWRphH3hUPBqVxbKQqA+cSUXmepIMV+Yq7SlURz5RX8ZNgQfZsYYNsneOmCFg8KaOWHsd
	tt7PxC3iIjPZcZLhHDWp12Nyqf/ENgtUCmRxWG5Z4PefnyIb1VjqZjUwhJZ0ZDLItzXNkvZFpkuBq
	3UlO9ZEU6E2O+w9HpfeFyH4gR8HZBejbq9hkRtMHBCeeIkP5Nu9ePIfDoriZy6ufuLxvgdshodWrZ
	SHnHapfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSzD3-000000039iV-1ZAC;
	Mon, 16 Nov 2026 16:05:33 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSzD0-000000039hu-290g
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 16:05:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h3bko/I+kKp+6Vn2fs+vB4jNgaOYyDPZMSY7cPlBqICykD13EHx/uwWVAysX7Fc4Nzlhfq4eilGENMt3Ll6R/DhOuIf3DSV7UEy33IvAOLDDNK/cjW2XxpEQM6B++fiORFtKN58vrS/WcwKBjyPHiim4yFxTo/Z64aRmIFeVWpXnZfeMmHmeHH8peXTOMobl/xfac8SR8xv+2KhF/EM0mF//CVefCGHY7ejidx7U81SsAWy8LMk4PEzHNjAspBMTqLKzKiRRdu/lURS5wNMbKV2VreeO+zuHFGEel1F9i8kRgGJdu6ibw7IjwjjDUYFtFAqDnpL3avYOmirEcKiEwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=909fGxJj8pcbDn0gjsDKGhAGHncEpAXdhzKPe6Jd3lw=;
 b=EKNIyWd3YO/C9A4xrYBB9teXAbYLkC295sEq3ChJ32Gne9jrISeDVWKPEtlbI5Gvyd7g/zcgqxksYG+hlemyqvwCwwycFgQEhF3XDKPrE1ew1JF/p6ssGh9/YtFw+lG8iixRQCm9852FAXSCqyb+ISMP18zcbQu6SWxErOA5tyQ4Hk8k45RYk44hvDCuRRW2TA1ctuHKpaU3PXleJcG9EHUqT/zcDh3HuAIJ4gJ/v+tlUmhoeccE0YYhq7jB7tpQb0aQXi/XzMexaVK0RNpBI1M4w9l1jAfavxwRI/qwcidNoIz1FP+5DZey7l43bTUKiM3Rd4R+jCm4KUkOD9/MUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=909fGxJj8pcbDn0gjsDKGhAGHncEpAXdhzKPe6Jd3lw=;
 b=co2D1OUkQbzM/nbdF1JrX8RdYkzwdAMhXqJkJnuAeuuQ/hr3q42tX1tSLkVkYcc4dz5/KhBdnNGtgDFJLE3KLyxFjr00DvRxyQ1jegARtVAxma+vxC0aRH9tHpagNQKoz2l3CZNtMqeD4LvyRh5DXf5lSnGhgTUoqK0ysrfd7okMGpZunqCoVez25R02ttsv3RINQ1f9+orXTBbZSEhnNmJt7rtiymqOjXpbwefeb85+YkDCT9HHHx+jiSSrgazEMmcVSagGgNGndheok1Ufd4D68o4tqhcsuGlUcSAxbDj/OrLOKCjeXPzYEXpgT1FvVo6D4h/kju5QQAakh7ESSg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AS1PR04MB9405.eurprd04.prod.outlook.com (2603:10a6:20b:4db::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 16:05:26 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 16:05:26 +0000
Date: Mon, 16 Nov 2026 10:05:15 -0600
From: Frank Li <Frank.li@oss.nxp.com>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-bsp@toradex.com,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 01/11] arm64: dts: freescale: imx8mm-verdin: Add SPI
 alias
Message-ID: <avspu5VpQ6OtbJF2@SMW015318>
References: <20261112150236.164850-1-francesco@dolcini.it>
 <20261112150236.164850-2-francesco@dolcini.it>
 <avXeK-IRXbKqI-pc@SMW015318>
 <20261113073135.GA8515@francesco-nb>
 <avc2nzql-JV7a-JH@SMW015318>
 <20261113171927.GA762258@francesco-nb>
 <aveChu8WqYM2JZcN@SMW015318>
 <20261116114509.GA101185@francesco-nb>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261116114509.GA101185@francesco-nb>
X-ClientProxiedBy: PH8P221CA0020.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:2d8::33) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AS1PR04MB9405:EE_
X-MS-Office365-Filtering-Correlation-Id: cf72f224-9e22-48ce-bf63-08df43fb6d65
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|23010399003|19092799006|10067099003|11063799006|4143699003|56012099006|261021123027099003|261022105027099003|261026140227099003|261026121527099003|261021121427099003|261022075727099003|261102123227099003|261028144727099003|261009223027099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: T085JXDYDORSzZc25Y3tSVX4PSmNdNajwIpXnO5IhteJ3d9ybGbN8ca425+HlNyRWAuvQOUaNW/YFdeNgoyeUXWrr4RBUpaD+VjBkppZZiAAmsstHqSYyx1iQDhDze4jKrxHSmHjXC+D/oWdQLyHxgPfgVR+Qz5MWRrO2wG7X4GbakPvKpKefKfCXsv6Empbm9IXe97qo80vFuPfGhA9MPx3yYhvYPQXwSHYtWZso51bb3E65WOdAxpJDl7aqDT2vRXNV6S1EdDVM430U4ugmMJ70nJK0H5wHVbiHi2qdVu9iEtDq0YiJamTOoFlXQk5ZjkSNv+nRnvexJgtcevHK1rMqN33Leb848n+8esvHbGd4NQc04gwMXgahHqMb5+sntv/Z7KSI17Ibp8czCYKDiVyhMBQz5UdmZMemgLUWn3yPaO5OHVoU4sCvXtNEcsnkeDzyFbuFejIYxLtt0+YLTegJvnHv52y6l2foA6kOoEtyF7eoG4KsuDYMiqJAJ6rYXw82hSbkoQq9B0tzaCXQk35jaL7uwZvZEd3MLvBxSnp8RSiYIfiOEx0f87Q7m0m6ekIK2gasbRHoJwBm6xzTpsR4vLFneLiJYwcTMrQcpa5BG0DaBYFMhPZkW+c74C0
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(23010399003)(19092799006)(10067099003)(11063799006)(4143699003)(56012099006)(261021123027099003)(261022105027099003)(261026140227099003)(261026121527099003)(261021121427099003)(261022075727099003)(261102123227099003)(261028144727099003)(261009223027099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Y5ZHA+iop8kvjRVm9oR8b/a4GGR14oTp7ptUlJhZU+8qNDEgQPgs2r+i9Qa1?=
 =?us-ascii?Q?I+Ok1uUwbc5znpl4xO6rLLu5kQfJbclxwmPVXJEj3zIV1dXZVVcUOTgzSS0d?=
 =?us-ascii?Q?GTDiXuvDccP2gq3JBvCNZHP3sagOsqNu61YECJlX5oBJ1bJo1dXI6SatgeuP?=
 =?us-ascii?Q?GuHCB2X5XVHf6zT/QdrgTHZK37N6kYqnmplMr0E4LMZeNV2L7MbMXkN7/Acy?=
 =?us-ascii?Q?1NovLTx8fvt4U99KOZjTrr40c/kjgWW0EwnUotdX6ZXMEAthbMeYOnnArgiR?=
 =?us-ascii?Q?+dgcsw51Z9AsjeRH9i5E4vFXlKNxYyW7PLHni/HDQU4eD6jENteXsGaenn6X?=
 =?us-ascii?Q?gd9jgF9tJesM5nG7v98mnGm7++QwHFalSP/JQ+196FrztLiXt3qDewwQL5Nf?=
 =?us-ascii?Q?NvrwR0g1b5RYy8g7f5rhUbmkDiHroVcQOSKNmSoAUp79lwI3MzmCbdMFPOOW?=
 =?us-ascii?Q?T5K9Ek9WyXEGmdzpd50Xj2UWBa0BSyl4TS47vD/wTyKQOyzVjBYR9BdwVPUZ?=
 =?us-ascii?Q?xJKb/bsPeUmDIco9XivtODYgAWvVsbYt7nbv9LluRNwGmhtlEwEy15/9UsO2?=
 =?us-ascii?Q?uk0wATRyBiW57d74EdJcW8PkCN6T+raxKnpsUbFyo0Z0aRmkqvRR2wz9LEvx?=
 =?us-ascii?Q?VFChOgBSmoqJfhbUOe8mhQyOZCgJEes3H2GhgdCp8L+UB3U+81LeAole4Z53?=
 =?us-ascii?Q?5SIWB5Kjt1yHOChG7mEflK2R12Gs9ON1UW60ZP3mDHbOQEH/AwsnPKX/9d7O?=
 =?us-ascii?Q?MYTajFtm9+WDwDz8SdJuuTIbNevPojCz0sRvav4u2BSetYKOgM0dWdPhYF5B?=
 =?us-ascii?Q?Sp2NqE+r8uKaPx3rDVJH3WDabC4gnrA99TL/oYpP41jgGOHL7losJ0kQ6ks0?=
 =?us-ascii?Q?8wVxEWkwvjIbzYb+5FMEHz0piisFndpbLck+Hm1+NJO4QVsvhLlXz9J8iAVx?=
 =?us-ascii?Q?8cEK1QntA6OoPQOz+7wIDLzSlIIOBw80STSg/j3+ggh7uh8Uf8+5Kaqr2wQw?=
 =?us-ascii?Q?Udu9Hf7KOZeWZTY7WboPsiEiyjR802sz05hcsO02kKZp6ANHHAteojOXJ4nx?=
 =?us-ascii?Q?qbecMrObNy3aTFP2s5sq6RWUvxGAn5I5qjBsxN1BFUq0ZCi8lYmFua8YTC0F?=
 =?us-ascii?Q?ClBSK1o6yL8+/5Zx+zGfULt9LPjm9SKj4j5+FdhpgsLquNITYjjZDvYS+sNA?=
 =?us-ascii?Q?1GqACWrFevtn4NG2+lODl2V9rzJ6rR7iwHRcrAnlgyxdjDAmzMkHE49/AVWW?=
 =?us-ascii?Q?yKkGV8qAshEXJ2mtUBi/N6tNBM30nNxAlDoBjEBuDs2CPMfIfAXMQOyQHGke?=
 =?us-ascii?Q?bmr3K3BMC51tYt33Hc7VTt3dtARC278vlM3nhlY/EkZhLT4qtd/xE19nkdwv?=
 =?us-ascii?Q?nBnVOXZQfOIzMi7ofV7BJt+vuKzwC6NPZwO3pAlN67icP1CronSmkR+qeAwl?=
 =?us-ascii?Q?TaBHjdcVMMm2RhDgkM8LvR9IGY9y2jwuPanCUUX1haYVk6pdX28mvDu5Nnsl?=
 =?us-ascii?Q?0Pvj2WmwIaN+A0p+3WfOieh7ehxciZ/0yaTLnTIe6Tb6m6UpNUXSHfAT3F/l?=
 =?us-ascii?Q?V6YKULmOcg6KVIseCaWxxIePNgD2auL6EMQMdHgj+xrpGfJ1p9CtwLtLI2t0?=
 =?us-ascii?Q?kT6nwU0Pw0UHh0HakbzKfETB3y1ATDjrjjfJlJIjlAV9FQK3oybMyXi8LItY?=
 =?us-ascii?Q?Kb4SZWCqkH/lVM2xMqToeWHDaNrwu0YjByjslRREFYHsZOLcJH3+20qgPLrs?=
 =?us-ascii?Q?BTmsZLqqHavHi45bFLy9gK2VeJRHQVFzcYh2nBi1AsJIw69UAW8H?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf72f224-9e22-48ce-bf63-08df43fb6d65
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 16:05:26.3309
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V8l//ku9NoDfpKfskDQ122EbL+84sK/vi684jsOqxT7IaFxTmFbcQiMnPPVD9H9Sd2/f7dAZjmFbAqslkNyeFeH+5yfnoYbBTgO1MOPv877fDE5Q39SteSfQrEdId585
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9405
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_080530_554307_0D6A6008 
X-CRM114-Status: GOOD (  39.89  )
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

On Mon, Nov 16, 2026 at 12:45:09PM +0100, Francesco Dolcini wrote:
> Hello Frank,
>
>
> On Fri, Nov 13, 2026 at 03:35:02PM -0600, Frank Li wrote:
> > On Fri, Nov 13, 2026 at 06:19:27PM +0100, Francesco Dolcini wrote:
> > > On Fri, Nov 13, 2026 at 10:11:11AM -0600, Frank Li wrote:
> > > > On Fri, Nov 13, 2026 at 08:31:35AM +0100, Francesco Dolcini wrote:
> > > > > Hello Frank,
> > > > >
> > > > > On Thu, Nov 12, 2026 at 09:41:31AM -0600, Frank Li wrote:
> > > > > > On Thu, Nov 12, 2026 at 04:02:23PM +0100, Francesco Dolcini wrote:
> > > > > > > From: Francesco Dolcini <francesco.dolcini@toradex.com>
> > > > > > >
> > > > > > > The Verdin family pinout defines the SoM interfaces and their
> > > > > > > numbering, SPI_1 being the SPI bus available to the carrier board,
> > > > > > > implemented by ecspi2 on Verdin iMX8MM.
> > > > > > >
> > > > > > > imx8mm.dtsi numbers ecspi2 as spi1, so the Linux bus number in sysfs
> > > > > > > and the spidev name do not match the Verdin interface. Add a spi0
> > > > > > > alias in the SoM dtsi and delete the inherited spi1, so ecspi2 is
> > > > > > > bus 0, zero-based with SPI_1 being spi0, and carries a single alias.
> > > > > > > ecspi3, internal to the SoM with the CAN controller and the TPM, keeps
> > > > > > > the spi2 alias inherited from the SoC.
> > > > > > >
> > > > > > > Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> > > > > > > ---
> > > > > > >  arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi | 2 ++
> > > > > > >  1 file changed, 2 insertions(+)
> > > > > > >
> > > > > > > diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
> > > > > > > index 1ac9d000d415..0369803a4d46 100644
> > > > > > > --- a/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
> > > > > > > +++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
> > > > > > > @@ -16,6 +16,8 @@ chosen {
> > > > > > >  	aliases {
> > > > > > >  		rtc0 = &rtc_i2c;
> > > > > > >  		rtc1 = &snvs_rtc;
> > > > > > > +		spi0 = &ecspi2;
> > > > > > > +		/delete-property/ spi1;
> > > > > >
> > > > > > Can you avoid delete property for new platform?
> > > > >
> > > > > Unfortunately this is needed.
> > > > >
> > > > > The included imx8mm.dtsi has
> > > > >
> > > > >   spi1 = &ecspi2;
> > > >
> > > > Create patch move aliase to each boards' dts from imx8mm.dtsi, which is
> > > > board feature, not soc features.
> > >
> > > Please see the linked thread [0][1]. It's not a viable option.
> >
> > where [0] and [1]
>
> Please see my previous email,
>
> https://lore.kernel.org/all/20261113073135.GA8515@francesco-nb/
>
> in which I tried to explain the issue.
>
>
> > > In addition, I can do this for my boards (Toradex), how do I know what I
> > > have to move for boards I do not know? I can't do that. The only way
> > > would be to duplicate the whole aliases on *every* board.
> >
> > at imx9, already move aliase to each boards, dupicate it and just make
> > sure build finial results the same.
> >
> > i.mx8 is still not too old yet.
>
> Do you want me to duplicate the whole aliases block on every board? I
> cannot do anything better then just duplicating everything, given I do
> not know what aliases make sense for each board. I can do better for my
> boards (Toradex), but for the others I can't.
>
> And this will likely break out-of-tree users (and to be clear, I think
> that out-of-tree users of Linux DT files is a fact, see U-Boot, barebox,
> ... and more), as I discussed in the previously linked discussion.

This is validate reason. We can try move one platform firstly later.

Frank

>
> To me this is not the correct thing to do, it will work for my boards,
> but I do not think this is the right decision for the whole i.MX
> ecosystem.
>
> And it's not about being old or not, it's about not introducing
> regressions and caring about the users.
>
> Francesco
>

