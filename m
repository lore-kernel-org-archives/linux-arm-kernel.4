Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE7960A260A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 17:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oAASasdV;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=qIjlDkhl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=xkxYiItbZ86vgJA1OvkWNQ5hPRrqzZPLxGON1VjSx2o=; b=oAASasdVrjRBQdEeAXSkN5t6kj
	Y5Aghk07MMNuhzTIy1+Dk7XBeD/a2pxXroyvU+4uvKCpi0wPUp3qJPRpU148hP/bOoOctGCt8qEye
	mCgjZ91HEkNfKHQmKssOC6Kk1II7wcs3MCZCywCYM4BxR/3cvWi/rZTu6IkysfRRwurqyLdTW2K8A
	G9n7GdBrJF67Gbq3FWBel+l7JEQDIPL92l77jfqTrva55xyEQFlYZvMVN6mNvj6Rm/ImfvAb7BwZ+
	oljcORyT6YvcOomb0cmTMLlO8NoyEkUa93fl61Ts41H+BM3vHtqVDym6TYAj3xwx0nmo31RtLDuaA
	z1CjY9+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUSj0-0000000FmBs-1AGo;
	Fri, 20 Nov 2026 17:48:40 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUSiw-0000000FmBK-0hdN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 17:48:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KeygLr8t6WqgvfvdpRMjDKLK/Eue4Jzdn7Np6y8+ISjzjFwpAktqCUVLHSevivXsHg+K9e8wALSL7HpT59whyZj+71Vq5OUCzk5/HZ8RKmz/bwggD6E3NKAxYNvpukPDtCz/BLfilk702VOZkOtbpSweDicLsdXg3KbWdXabGQgQr7pTE+iPi7csa/9FcUI8pfo4MnMRT52TFFaIGgHxweAHPSeHFDQ5iKLU4WAVWxmi79Z/zb3UpHyQ4uG8Esn6EEZ9wN0EpZ/LJbNqa3WxHS4lr8gJJFwWFLBPPxJd5pAK9HH1tnKNofoVYfxecJ3J4J3E4nHZLe2W32f9qL/KSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xkxYiItbZ86vgJA1OvkWNQ5hPRrqzZPLxGON1VjSx2o=;
 b=Z2TxYXah1jSt1IWiFAo5RsXgCZRI0gRRdO79T0I2+CFKAcRyWQMv356URZRe6hAmAg5D+ybdxzhM7ha56/r7SO4UXAZ7zRd73R+Epv55lapT4j82Wv59QdASQppxpLfZy6cjAs4cdHdDPo0hlvl0uyh25ZErw8DBDLhEntRIbZgzXc3guyHmhzCH29sR4zOvkTbscEjZes4qB3/UWQ3L5w4PF3MTZ1kU/SdjjX4P/cGuGBY/v00GbApW6VIbm8tromNaAKRnw8t9m24tki9QF69F7S7AUOEJgNSjT/KtECxAPNhYGZBVKIfS5nPlySRmxEC7CGCB0obNc1uwi7O2iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xkxYiItbZ86vgJA1OvkWNQ5hPRrqzZPLxGON1VjSx2o=;
 b=qIjlDkhlV/mMARttRccWhtMT5K85icYOIyGRtR0iw0Caq7g2NJ1dd31kdGI/CNK+aItLrMNZO2q9WHh3DRMjaxKA4suLsfiBQoDYnwXGV83STctCyvrVQwa1kxF8YmBbdzu0yvUlZlS6bZJFjpP+0FJTSCPaB/odB5hUHUC4qsDiu361e+StWoang2F97NqXuvZwxe5kEJvss7PIiZos8n+sbIRbKWIYr24UBy5UUz2vz3SbgpUCouKQycaraM51jNjTwkyEgGGOlWWAd16RU2jMtlEN6IQSypSLaFXVA6F5VSh1v8lDT0UH8ukzkLv+PTDh7g7z7yDZuKPDgzTK6w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by DB9PR04MB8409.eurprd04.prod.outlook.com (2603:10a6:10:244::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 17:48:25 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0639.010; Fri, 20 Nov 2026
 17:48:25 +0000
Date: Fri, 20 Nov 2026 11:48:15 -0600
From: Frank Li <Frank.li@oss.nxp.com>
To: Amelie Delaunay <amelie.delaunay@foss.st.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	dmaengine@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Jerome Audu <jerome.audu@st.com>, stable@vger.kernel.org
Subject: Re: [PATCH 1/4] dmaengine: stm32-dma3: clear flags before signaling
 transfer completion
Message-ID: <awCH31i9i5mCRw9W@SMW015318>
References: <20261120-dma3-fixes-v1-0-f29c1f437399@foss.st.com>
 <20261120-dma3-fixes-v1-1-f29c1f437399@foss.st.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261120-dma3-fixes-v1-1-f29c1f437399@foss.st.com>
X-ClientProxiedBy: PH7PR02CA0016.namprd02.prod.outlook.com
 (2603:10b6:510:33d::15) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|DB9PR04MB8409:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c0530a7-3483-479b-dd6c-08df472e7a06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|23010399003|1800799024|376014|7416014|366016|261026121527099003|261022075727099003|261021123027099003|261021121427099003|261102123227099003|11063799006|4143699003|56012099006|10067099003|261009223027099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: tgO/SDmwgpI2oj6xrhy/PZePvw7l1PTxEtDVJI06zEGI3ARbd3rtADWNSMsj3w/ovr5a6m6DWlDHii/1ETC7r/qo8io1x94Hj4f48fTCXMX/3pLxDPHvtxsRYXuWLX+HL7P0vZuPxgZtyjJWfvU7vwKiRQOWEaa6dqGyQtraDtV+Ks1qVRNzo3sSPxD5Rzn/MWlEAf81Pi7+I0mA/LXIdrXJSceHcvo3tbFPyQCDMC3sJCrMo1sN0SKThjjx3BUTfvzqrkhNTpqodEO0ORMLmlFFUN4HR3zrYtczzAcuGn08EKg9poiI38xdgTQntonMyS9G7QxDO8kE/hBOxGWB0rom6rV7a/bUaXE51fYilyY5+w9Lq+K0yG6AwooOlln9306IxGEdQ+PrT++ZuIyAyFjJaUmN99tmJgAygFhRUCwArJsBPecyiKUR3RPFI6HpAd8Qm4Wac3mXSbvA1uUYzR/jJ9WSzJH+kh/JKZYyUPrG34mMcyNTK7d9dqD6j68iRd30JYFODtzYMZql/ni15jfCyCmrOom8D1j5HPAodY9cW+8k2g5mWdg1pMyIqCEhN9/POuHaQVgVAaNNIU3PXqamvuqPr/N93amF3LqnG3736pwgxiSTe/0zw0HehrNdxyLp7gN4+oDaofF0YDbORrWnF/RRNErbiI+qVhdM/f8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(1800799024)(376014)(7416014)(366016)(261026121527099003)(261022075727099003)(261021123027099003)(261021121427099003)(261102123227099003)(11063799006)(4143699003)(56012099006)(10067099003)(261009223027099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?63eG07+5jER/3chhKKpInLyAXqRoEUkjHXiU/HVS2qE3SNldZ0Pa81CCEAJI?=
 =?us-ascii?Q?7OhvCEAD2aUxXKiKfnu2sfyDVyBUvNpVsn3ZKg6GZEUCpuouWZVMNEAwjm1Z?=
 =?us-ascii?Q?QiHB7A+PL6AcKwBf86ArWs+dh4LogqOsRHqL7vlGK86+zzZPkTA1zkuEN0Cj?=
 =?us-ascii?Q?NVkmpqEl5IBQ1+Fs7iAMwiRT/X9xBlN562x54TrkGNJWKTCxlGIPFUtCqwWo?=
 =?us-ascii?Q?wBM0zdwmyVoWRi74V9W/DwTCmdIOIrgpjzBXh8DVdNDQM5F+pUeUq/njsFph?=
 =?us-ascii?Q?bHrMgkMo1KnVSrdbVyz/cILjsvlbuSGEccbregDK+KbfJkVJRtYHnDXBT6yo?=
 =?us-ascii?Q?5m2gXavkANY924OS0G3vCo6NxC+5db+b1RcM2plooWuL8Ouq8UG7f5Sj4oND?=
 =?us-ascii?Q?DSdb98Eq43xEK6MO5lOfwl7Oji9M7uGjOyy82mvbB10DXOU4k6fhiX1BjSte?=
 =?us-ascii?Q?Qn5aIdqw/IS6F/5u7ZveBVmlpjxg8uiCPnxDIajF2l9plnkQkXW+SeBpilPG?=
 =?us-ascii?Q?5roZ7EmJFndw1AHPdI71G+v5VukeL1it+vvjiW9Q/9gaOHfhtPPJAKr11ELO?=
 =?us-ascii?Q?lAW9ySsKlg/YtbSESstwNBmWDPnqpraOwnR8bjrzvf7Nq0J1l5EJnxAN0ZlV?=
 =?us-ascii?Q?LV2IBIqn0sB5ssAXKCYha38P97bITJtRjh6m7fNMpxJJPp6n5HmrLVxZy4Zw?=
 =?us-ascii?Q?3HWolkprPWzexhWgJ5TsluDmG7FZRKyt3Cov1yVJAy6unTu6DX/dbPNcrx0S?=
 =?us-ascii?Q?FcjkcZVgvboKMoxTV674gjD5zhzavnEqObtEbVTJdvY5XiEpmzjv06AOiRPn?=
 =?us-ascii?Q?5Fasr/CaAg7xEnHd+y8w0zmWyaPvnUPc1bUYJgX2ROSwjjOqDUNgbKi1i0gL?=
 =?us-ascii?Q?jJtSwxIIxsnSiSqRUruei4WPWxwyAbATrV2q88DiHvzF33glZyNzEJ0g12dZ?=
 =?us-ascii?Q?N684M7e5DHuEZVJ8x6MfQyQY37/jYs6rL6ghYM4rNtFobM6cqmMDSAGTlFvO?=
 =?us-ascii?Q?5M05vMNlID/cgABrIpE9h0KSyB596uJ/4gJoMpp4xp5U2FIpJnl7KoSJgRKM?=
 =?us-ascii?Q?vFfHpH5xXJpECz67mRy4XPHIxsdy1kRhvOCbjrYWEHHAnM/LN0XCKhBzM+PF?=
 =?us-ascii?Q?PvZzNFtisNRRC5uUgGkekGd0Ri/rvF9jZDHl3wSaEk2N7ZRSYkOinCcPN6hv?=
 =?us-ascii?Q?uVc5VT5v3sjj38MpCvu/lSD4O9Pfb2bcvDgtAku3ZpWlqFFE6hnPAju3oZQG?=
 =?us-ascii?Q?/Bho7VZerK1g2bPRmRnPxEdy+KDikG9y7cGA6A8fTXW/ZyhwXOMJ/FdE8zoj?=
 =?us-ascii?Q?IP0KBrtmXDwTIH6cnJLqodFzDazqg4ybIA2D1hUPHfBnaZmPQUfGA4z9bbrs?=
 =?us-ascii?Q?TUfgbLLAPK8m+gKt3/r8UpCVqYM1Qe4GDzoGrXNssH6u9UF6jkWflJ9KLLjS?=
 =?us-ascii?Q?eXMG5Sacb/IQIWYPzoidjcwAp3gTCwDXM11W0atXXhHojTpv9Fp0IwhO3RL6?=
 =?us-ascii?Q?ZxZFI1AUckPm63a0dJwPdSVRWmgbbBhRJUipOEq48jEGVhm1hFSK6rnGWEGj?=
 =?us-ascii?Q?igfItNqVxk+ZnH5JgPfVl/AeaK3LdSBomhw0nAXTFJFkcDsjtwmL7Ci8xImx?=
 =?us-ascii?Q?yp4eBZ/l1sQZlq2uyp6bgNYQlb8bvJjIv59nP3SailzJB/4eON5SLfb9ZbCI?=
 =?us-ascii?Q?qy1uWPSLcvZ8bs7Qj1Pi/roCVltz9w2zfp1MaY7rnQOoPvyjTWUhVkrfngfu?=
 =?us-ascii?Q?BeYAQCW5dOV8UXqsP25XaLJ5UFvuDGbf/FHronYqv6VcQ4tv6cqm?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c0530a7-3483-479b-dd6c-08df472e7a06
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 17:48:25.2643
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TLzgVM/rECeqVwv7YcSdxjZGcPHxKpojnbzwVM2D7nLOuzlhkjEqR9U9E7RI/L/bj67KsT+D5hUOnaYqjGSpDB5IhN5/EE22HRXRoHsR0hTEG3uYJMS9toUfgxmIZa0U
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8409
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_094835_666110_9C29BED0 
X-CRM114-Status: GOOD (  23.53  )
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

On Fri, Nov 20, 2026 at 10:18:01AM +0100, Amelie Delaunay wrote:
> From: Jerome Audu <jerome.audu@st.com>
>
> On a Transfer Complete event, a new transfer can be started from
> stm32_dma3_chan_complete(). The new transfer may finish while the end of
> stm32_dma3_chan_irq() is still executing, in which case the flag clearing
> done at the end of the handler also clears the new transfer's Transfer
> Complete flag without the end of that transfer being handled, which may
> lead to a timeout.
>
> Clear the flags before handling completion to make sure that if
> stm32_dma3_chan_complete() starts an ultra-fast transfer, its TCF flag is
> not accidentally cleared. This reordering is also safe for the other
> handled interrupt conditions, since csr holds the channel status and is
> used to select the handling path.

Can you rephrase commit message. clean irq flags should just after
get status before do actually handle. Actual handle may cause new irqs.

It is quite common pattern for irq handler.  Some thing like

Move clear irq state just after fetch state to avoid lost irq because
actual handle work (i.e stm32_dma3_chan_complete()) may issue new irq.

Frank

>
> Fixes: f561ec8b2b33 ("dmaengine: Add STM32 DMA3 support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Jerome Audu <jerome.audu@st.com>
> Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
> ---
>  drivers/dma/stm32/stm32-dma3.c | 19 +++++++++----------
>  1 file changed, 9 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/dma/stm32/stm32-dma3.c b/drivers/dma/stm32/stm32-dma3.c
> index 4fe226541efa..a464e0cefd64 100644
> --- a/drivers/dma/stm32/stm32-dma3.c
> +++ b/drivers/dma/stm32/stm32-dma3.c
> @@ -1008,7 +1008,7 @@ static irqreturn_t stm32_dma3_chan_irq(int irq, void *devid)
>  {
>  	struct stm32_dma3_chan *chan = devid;
>  	struct stm32_dma3_ddata *ddata = to_stm32_dma3_ddata(chan);
> -	u32 misr, csr, ccr;
> +	u32 misr, csr, ccr, cfcr;
>
>  	spin_lock(&chan->vchan.lock);
>
> @@ -1021,6 +1021,14 @@ static irqreturn_t stm32_dma3_chan_irq(int irq, void *devid)
>  	csr = readl_relaxed(ddata->base + STM32_DMA3_CSR(chan->id));
>  	ccr = readl_relaxed(ddata->base + STM32_DMA3_CCR(chan->id)) & CCR_ALLIE;
>
> +	/*
> +	 * Half Transfer Interrupt may be disabled but Half Transfer Flag can be set,
> +	 * ensure HTF flag to be cleared, with other flags.
> +	 */
> +	cfcr = csr & (ccr | CCR_HTIE);
> +	if (cfcr)
> +		writel_relaxed(cfcr, ddata->base + STM32_DMA3_CFCR(chan->id));
> +
>  	if (csr & CSR_TCF && ccr & CCR_TCIE) {
>  		if (chan->swdesc->cyclic)
>  			vchan_cyclic_callback(&chan->swdesc->vdesc);
> @@ -1050,15 +1058,6 @@ static irqreturn_t stm32_dma3_chan_irq(int irq, void *devid)
>  		stm32_dma3_chan_reset(chan);
>  	}
>
> -	/*
> -	 * Half Transfer Interrupt may be disabled but Half Transfer Flag can be set,
> -	 * ensure HTF flag to be cleared, with other flags.
> -	 */
> -	csr &= (ccr | CCR_HTIE);
> -
> -	if (csr)
> -		writel_relaxed(csr, ddata->base + STM32_DMA3_CFCR(chan->id));
> -
>  	spin_unlock(&chan->vchan.lock);
>
>  	return IRQ_HANDLED;
>
> --
> 2.43.0
>

