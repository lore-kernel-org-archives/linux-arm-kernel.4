Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 338D760A2601
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 17:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4jIiRdfq;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=i93PQRwg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=dhmaqYBa0dj38D2ZxeOKv3KceHUa77eLadj9s4m7mq0=; b=4jIiRdfqrlKO0tQaMODcxY09KF
	GoxacpE/apXYkAC3lUOzoN1k2mnTTS/1UNBeNeXDZQgjSC8+NOLhbU6/zJkuRN8fewOzaB215j3oy
	0alaSLVgTcbRUOybOhQa0cTRDhFVQLdNb9drWC06Sd8EIBanNIOqqstZ2AsqQgv0z8FgztV9np+Uq
	Dg0nlW/Z6nrIxKywRhEfdVPk7SqNR2UT4xGYL9Gic1oCB6iRY0Ky9p7BbdT1rshtHgvFeIZeSbw15
	e8KWEznCSJkCdqPDwB97w4NNFjO7YyTgmJdOeUFBGbGEULZCfWNW1cnIjBWKy3bnJuY1bNe9rmGvF
	Ai/i5U6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUSlw-0000000FmoH-0dp9;
	Fri, 20 Nov 2026 17:51:48 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUSln-0000000Fmkn-0snk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 17:51:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X1I3olDMlzxhJnTBJ6m6HlSCW7NA3zpoz+AdvDZtNYmrrbtTVlcLwKVo5mNjfG1VTTNy50WQt4N3vyZuxivwLXLjxRsl/800Lz4+s4Eir2cqmhW2N1nAj1cfFiQzFgN7vy7jbB8k2Nt8o0pPBH2h0QkyiIAYovckG9Ka4UXvJiOku0838CZyyjk+5fDjbZxHG78vV0U+YDNsmRkiKj1zRh3iGm06L4FOGhCuCiTCbuVzv1CBUwRmEpyPObWiueT+wOHmknFWsMj5QfdbSdkVjTp9SaqTy+JSSwxsmaqBlOvZW+r+NaeeSuIb9lFnUUn+5wryP/PECO7rHkkyY5CTEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dhmaqYBa0dj38D2ZxeOKv3KceHUa77eLadj9s4m7mq0=;
 b=sMjchkHjz+TKQYNfvBggrls98NVTw1YZ8nZZVmEOyeFHFTZ2koQY4aGwKpYGWAD6zQy8Yv5Fc+7xr0qSngnHwVJqiyQstoHBbQyRDWAwkX7XpbwpReQlXOcWODenLYjhgraBJIPj8MCQav67YZYp3wJvqSRqyN+tES4jh10/2gYM9ZICyMNSXqWMZJpzxI9KCO9Et4mZemu91bPmYGjRDG+vwk0lIBj6+BDXkVNh1eSg2yCsg/xqqIrSXUNrjTHB+Io33ureRvn/MIuf7mxDoygQ9wD98EAkNIoBRWUAWP1xUHCpVqURBUl/JdegcWxAXGUDzxmiHF7V080/WOiTUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dhmaqYBa0dj38D2ZxeOKv3KceHUa77eLadj9s4m7mq0=;
 b=i93PQRwg9FcWOERdKXKQUakSkIlzXhSVMUbN99TPIYd8RpJYMyfP45oRsZTYNikM7sIGHUzdeGZrEkTzailVIVRHW69UxY1EHzkkhgAeTweSDCI2UeX/23zYxYDSePXyMVSFStRSxwZpsxl/X4glP6hI+DFovXks1O18gua9tV1DWtpHqxTfUK/u/Vdj6mIDzyaGiJuNXK9Btrhx7cAo0IuUWUEcZ2URxdlZ2Ddn/OIRETFjZQpCToxC7kWwMmZ4wB9qKLSlRAsxXJ+lKYsqFKjpd37x/0JkDy5I9clWWKKoYZjL0Q2TBEeOftHyCcREysdKtXYXCEgdJry720q3RA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by DB9PR04MB8409.eurprd04.prod.outlook.com (2603:10a6:10:244::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 17:51:24 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0639.010; Fri, 20 Nov 2026
 17:51:23 +0000
Date: Fri, 20 Nov 2026 11:51:14 -0600
From: Frank Li <Frank.li@oss.nxp.com>
To: Amelie Delaunay <amelie.delaunay@foss.st.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	dmaengine@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 2/4] dmaengine: stm32-dma3: set LL base address when
 transfer starts
Message-ID: <awCIko2GXV_rzIRc@SMW015318>
References: <20261120-dma3-fixes-v1-0-f29c1f437399@foss.st.com>
 <20261120-dma3-fixes-v1-2-f29c1f437399@foss.st.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261120-dma3-fixes-v1-2-f29c1f437399@foss.st.com>
X-ClientProxiedBy: PH7PR10CA0021.namprd10.prod.outlook.com
 (2603:10b6:510:23d::20) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|DB9PR04MB8409:EE_
X-MS-Office365-Filtering-Correlation-Id: a5c999eb-b104-4892-26a2-08df472ee47c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|23010399003|1800799024|376014|7416014|366016|261026140227099003|261028144727099003|261022075727099003|261022105027099003|261021123027099003|261021121427099003|261102123227099003|5023799004|11063799006|4143699003|56012099006|10067099003|261009223027099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: rnW9vqzfm02wFiOc8rNlaCLkEC8ndvhAyCHKcPNl5z0e2PeiIGwn46J7Dq9hl0r1l9d+BDuqUG3HXzoF783BpzQNtNqnFVGYyD61RjOu0JB0S69UwlZLhU8zZf2AvquGvA3ajrlRwYDh/zSa7N20dHLfa5chQd+JDuPG1ReHcFO1WgXSOFfyWtiNCrN1RFsQWDcAT3YBmGsRFS175rJ8mSDxFU96iQontkhI38B6jCh8pMrLcFeqgbCAe/SsfMN6SmGj4aSd0/88bMoHhljOkF42KxsadKWzePHs9UgJB+DPLWLT5bko5YhAp83SqjcGIDzhoU8UU6CwVpifzFsqDXUYhbuYbx0Z8ZB78xbup/8HC+wKW7fhPqae5Ffhda6jO2NwqosGA3u/C+4i6sSYaqhpsK+ichKsOUAyv681uXRpo1xetxU4nPac/pjlNgYWEk+r554SWWbXNuqb6h/tGgAmMwzWQy5MviBvfRbcalsKXKBkazYlGZGQJhdhwz5dDBSxTaagkBusangjgWZFXjCMHO7lzSKKoEbEJoQ0a+YP8lPfM6mMTzPt4h55VuT2ipsy9b08oPve7LdPkX1RDfrb8/tgKtE5Wk9l7RX6f/HS9Uvqt2toeF8Dktu8FH/CZPUG1yfFCd9RxY67rYLtw4zDWSVKPLz77IijSlOUGK0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(1800799024)(376014)(7416014)(366016)(261026140227099003)(261028144727099003)(261022075727099003)(261022105027099003)(261021123027099003)(261021121427099003)(261102123227099003)(5023799004)(11063799006)(4143699003)(56012099006)(10067099003)(261009223027099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6d3Bk6jULWKMEHDb0r+8Q5NlrdP28EKh9isR9i5SfwuNP74f/IZ4vdJ4wng4?=
 =?us-ascii?Q?2v//9UgZG803jOBQbpuY5tY4cD0Jm/e8TVZfUcdBz8cU/pacAk+zG6mpYbLK?=
 =?us-ascii?Q?hT0VI4rJiwDNAbnFxsD34ImGwHX4vrPxaAkroHTfdra9l9NgVhj6V55MuYiI?=
 =?us-ascii?Q?IfzsSsZIrHTdClozHWp764GfFx3W4CyrhK3c0B9dKvPQHrOC2mEBng+IIgda?=
 =?us-ascii?Q?lpCUMgf97ifvKa8+mR5a7EJFGpIBaxz3V1SR9EdbX43l9fDXViIacxejllpk?=
 =?us-ascii?Q?cW4tOJIyIlfgYhbXRVqUE9iLVtU+nNXRrhW3ecvoRSnetAzVlP0S390LwAtk?=
 =?us-ascii?Q?Gaf9tk4Rt2m9ub/4tDRwdrSFTowwxRztQL0clZlHNeWIAtNkI2gjYijb/RNE?=
 =?us-ascii?Q?rro2Ll388K6+MZzhOxZ33ZwAYKRvKaqocY+qaXzPRrNT173mgoXh6lz40Zyu?=
 =?us-ascii?Q?R89CVdJJyOOQHA84JFqQGi8UGayk4yf0xbb9DP/4DyHGm2laguyi9qOczsm9?=
 =?us-ascii?Q?ajspEkcWmzRMfSneYpH2/NMnqJSpWr3HhBoxGrZreR2QEi/VS0tiEFAFwOqS?=
 =?us-ascii?Q?oSIPLhZGF6+uOu1DxnDfiA3NWtryy5eQN1wWmIHPx3vuGI9Jm86O86Ben5nN?=
 =?us-ascii?Q?Ljr/6Qhs58EPanmgTuVQMB+9iiT50mXF0+S+O7BlDD9a1C2CA1xUPJ4YORwW?=
 =?us-ascii?Q?qr9yxz8h2cAyVqI/4Bi3uI/Ss9K0JU8ObTxZ6cvMjSOejOslmm95ugYddibQ?=
 =?us-ascii?Q?50zsPvkYYJoHORmafM+QVRrFDV2RPSgSrEt8BhvN3P8of/bjqJPFpqNbIflY?=
 =?us-ascii?Q?95ic74AmFKgVxb3AM8DKcjlp57wAf/89S6P9MmXFcDwMTgFcMmX3cAun6nqK?=
 =?us-ascii?Q?Syl3bIaQJw3FXJUaSqGyJaF0a617x1PBvugAgUZ2SNMXwgutY6SgOeXNQm7V?=
 =?us-ascii?Q?gv7qhs9gpUjZ8I4yFHzZpe1fU9quQQ4xRz/hHDt6xsyrje13WAT8A1KX+noZ?=
 =?us-ascii?Q?UVEQt6aqVm75PZvbjw/4xqKT4+KWN4DZAUJ1ZKACLkbbxSzQZRJVOq+wHdHI?=
 =?us-ascii?Q?tjdrKyXIs1nnEyX8UjDfGbGcyrY7otfhC0vRO2zwZFbnYBUle78eeH+pBac8?=
 =?us-ascii?Q?y8AO545jACKbuGzdPq9qs18nQ8GU3jN+2rMpq4xjVEIlTlPR1VpBksUrz7cA?=
 =?us-ascii?Q?5louQMefgeSvHDyIukCU4T6Yr7BDLDkA894jvccoLcgJbzLSGtS91WGMqwEt?=
 =?us-ascii?Q?Ce96x6TMg1UnTBfdNcSRaptoxFfmrl69kqI3AViIufdQB00gIVOEUxD5ayLM?=
 =?us-ascii?Q?OP2pishYV2eK1eT2bkPTy4nuB0NnG1DMbXX3Sxej8MJB8hC2BWBA+tIf6+h5?=
 =?us-ascii?Q?ytXFFfMAqEy8nj1MUqc6oB+/ciUNg+sdHFilZLRy2Plq7pp+DDiJ3KuZU/5D?=
 =?us-ascii?Q?KnosPXEGy/TZNmFAqDHiWs8eGP3WlXO9KcYit5JIroF0/JxdN5OOKx2dt2A6?=
 =?us-ascii?Q?JLQ+JZdWyxk8hkkppo+uZksVsGwgXAKZHepotr1bUmFSxJqB+uaKwjVlLvxk?=
 =?us-ascii?Q?OqIULavRhsx3RuMT9Y0mF/P05Nuf33scU3DEqyMQPzUhH1pI4P36HeRPUAht?=
 =?us-ascii?Q?CpKbW8d1aawa1gM6H21REyCkUxHaOEdq6TPZ5RInqFXhHM6yFDxME5giWEjx?=
 =?us-ascii?Q?b58vK9FSpI27TV527vvehuTaDXllVxuYr+eL+4cYcHiiyACGJoeXIkCHQsPi?=
 =?us-ascii?Q?ZmHdodU8TzLahT5NSGRekJ4gV/DIt165dnUlkDePGkNrCFCOV5YG?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5c999eb-b104-4892-26a2-08df472ee47c
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 17:51:23.9464
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fFoJCw3wjd+bYJ02YI+3IYPjosXKnQoppJeUc2AxAPsFoQL45mwEKjYdDb4LtVGn95QVCODpPMuQ2iBkfGzm+30LKno9SDw5VxmIl8wnZDeT6ifWtVE4m1MoCMhZdqDY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8409
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_095135_061043_E942DA83 
X-CRM114-Status: GOOD (  19.81  )
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

On Fri, Nov 20, 2026 at 10:18:02AM +0100, Amelie Delaunay wrote:
> Linked-list (LL) is allocated in stm32_dma3_chan_desc_alloc(). The LL is
> then used when starting the transfer in stm32_dma3_chan_start(). Nothing
> prevents a user from preparing another transfer before starting the
> previous one. If, for the same channel, another kind of transfer is
> prepared (using dmaengine_prep_xxx API), the LL base address may change.
> This address could be overwritten in the CxLBAR register if the channel is
> disabled, or the CxLBAR might not be updated if the channel is enabled,
> leading to a mismatch between the transfer being started and the LL pointed
> to by CxLBAR register.

Nit: Add emtpy line between parapragh

> To avoid this, write the LL base address in CxLBAR when starting the
> transfer instead of when the linked-list is allocated.
>
> Fixes: f561ec8b2b33 ("dmaengine: Add STM32 DMA3 support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/stm32/stm32-dma3.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/dma/stm32/stm32-dma3.c b/drivers/dma/stm32/stm32-dma3.c
> index a464e0cefd64..a056f73fbe02 100644
> --- a/drivers/dma/stm32/stm32-dma3.c
> +++ b/drivers/dma/stm32/stm32-dma3.c
> @@ -396,7 +396,6 @@ static void stm32_dma3_chan_dump_hwdesc(struct stm32_dma3_chan *chan,
>
>  static struct stm32_dma3_swdesc *stm32_dma3_chan_desc_alloc(struct stm32_dma3_chan *chan, u32 count)
>  {
> -	struct stm32_dma3_ddata *ddata = to_stm32_dma3_ddata(chan);
>  	struct stm32_dma3_swdesc *swdesc;
>  	int i;
>
> @@ -423,10 +422,6 @@ static struct stm32_dma3_swdesc *stm32_dma3_chan_desc_alloc(struct stm32_dma3_ch
>  	}
>  	swdesc->ccr = 0;
>
> -	/* Set LL base address */
> -	writel_relaxed(swdesc->lli[0].hwdesc_addr & CLBAR_LBA,
> -		       ddata->base + STM32_DMA3_CLBAR(chan->id));
> -
>  	/* Set LL allocated port */
>  	swdesc->ccr &= ~CCR_LAP;
>
> @@ -790,6 +785,10 @@ static void stm32_dma3_chan_start(struct stm32_dma3_chan *chan)
>  	writel_relaxed(hwdesc->cdar, ddata->base + STM32_DMA3_CDAR(id));
>  	writel_relaxed(hwdesc->cllr, ddata->base + STM32_DMA3_CLLR(id));
>
> +	/* Set LL base address */
> +	writel_relaxed(chan->swdesc->lli[0].hwdesc_addr & CLBAR_LBA,
> +		       ddata->base + STM32_DMA3_CLBAR(chan->id));
> +
>  	/* Clear any pending interrupts */
>  	csr = readl_relaxed(ddata->base + STM32_DMA3_CSR(id));
>  	if (csr & CSR_ALL_F)
>
> --
> 2.43.0
>

