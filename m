Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C741C606A334
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 18:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ASkWmsoK;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=Jg0TQdza
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=FXgw2G+S2fmJOkPREvemOf4G8tedWWybD/6ooh6T3Fw=; b=ASkWmsoKFA/U7RXFCWx7Kn5sai
	qStuY8v8YmeDw+9rG5hcbJMrD0+IsOWl6d4Ru1fSxoOeI+EuNVEPLlYmHk9rU0AoqbsvvNjbX2gGe
	cVrKldKEn9gfazKSHEdGyVu/w01bwyeXG0Occ4Tkg6owHRWYQ3Y8OKPu5yShr6A38dpS2nnwmq5mG
	r17+VEqZrN+qU4N4GjpXzD0XvfDbD6F8SAskxZOEKgjxaV9Yx1GTE+1Wb1nVOIHBSS+6M9cOA0LVN
	ojrtew4O0KQjxZAxHPscpPpgmT3KZgcpn0y0MtGiQTMoAXY9gXjG6qh3E3oXmxa3v/urKjJJTqwz0
	6W1J+nLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTNkL-00000006k7A-38hE;
	Tue, 17 Nov 2026 18:17:33 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTNkJ-00000006k6G-1nLz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 18:17:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k0h04LEbf+9S7jw5t1JkJCkcFrmICsw397egvMOUgX+xNaPpXXWbVNyiwUykenIbzitLobUo14ZDMh7rbFpnd63PbQlbiSwJChpf17xGmq61/xBfhsIQH4W8Omch4klYmxsX7T38owPf5NCJnZpFO4SYtJjcE3u4YswU19Ub5m4IppiMAJyOHiWk7lT4PL8h2FRZuqPZVaMsfWwGHw69VvP5KcmiM4F5YQKuZ34NP3rmRosyn3DI1BPfPFWchON9RL1CTHFbr3mroK0MBtrBqbnruglow94w+W6qdgZWDR5SxMj3P0CJZvlpPewlZbLrx+l2w5wUwnEjzfN1p+v8KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FXgw2G+S2fmJOkPREvemOf4G8tedWWybD/6ooh6T3Fw=;
 b=mtayM+W9CqPvtAGR5RWfUmSwt/MPneOneqXOBh+JRebfOD5KDbtX0j5DeeVKBCgoL2G57cn+wtMPHOhHiApjcJu6zsiDtnyMoU1NpXm+Vatyn93pExG4RFJTjFXdvsSgyOWn8Q7kLjpk9yLc1D86+hYj6wNRuCQAWg6BzsD0uNRw52HtgHrz39x1qShe4YNUtx8N5L5jOLrpWbS0jBj/Y42rFan98Otfa+4Xp2j3oQiwxalZSeco1uAwjJ5i+td6yR1Z4SWiKNcRSrkSbVRVTK2D9ga28Y77FQVVXbqYojeuLxxs94DGnrMF47OoAJRRV6kAg5g7GG2ZhuWJzVdEmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FXgw2G+S2fmJOkPREvemOf4G8tedWWybD/6ooh6T3Fw=;
 b=Jg0TQdzaL/KnLotC1tXBeAzyC7pXPuHtrTtTTfudaytFpW6dyR3ssCguuW8NbrdfmgqqvHBeLnQmxI9/kowr0HrcOUf4CG2waYosbLs6NeLGw7b9OpZUypV8FKm0JZj/JWFlAXf2q6EzlTPkQnYFaTFsU+XKP2TKOFmiCVXLTLYb8q3KBL1LLGyLfGJ47JAL0nXSFbHg9WYNeIA3A6FAbbE+YEddghW98fSpsSzfe21jULoNXHxTxwVZBoPOdsGuspse+6cadS+L3yhrpZL7q6R8i+UGcpCYkVnW0OS6kZggwbL/AOkybRxKxMw1u/4Yh3mx8Zz6d5+I4RtnsF0iLg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 18:17:26 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0615.013; Tue, 17 Nov 2026
 18:17:26 +0000
Date: Tue, 17 Nov 2026 13:17:18 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Ziheng Wei <zihengw03@163.com>
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] dmaengine: at_xdmac: handle empty transfer list in
 tx_status
Message-ID: <avyaLhOo8fdAIvUi@lizhi-Precision-Tower-5810>
References: <20261115080245.910534-1-zihengw03@163.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261115080245.910534-1-zihengw03@163.com>
X-ClientProxiedBy: PH0PR07CA0082.namprd07.prod.outlook.com
 (2603:10b6:510:f::27) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AM0PR04MB7044:EE_
X-MS-Office365-Filtering-Correlation-Id: d199b59c-6235-4dda-c65c-08df44d708b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|19092799006|261022105027099003|11063799006|5023799004|56012099006|261021123027099003|261021121427099003|10067099003|261102123227099003|261026140227099003|261009223027099003|261026121527099003|261022075727099003|261028144727099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: 2CIbsh2kKx2vMWUgD7DxyW6xNoed2l4oK+pbgrk6oSrV/EteZDxnYYwAB/FSZ0Xj9djhKrfo3bR6PZj33l471j0sGfYwjqyG/rg829lq7Z+gDoHX4B4uTxDRWEyEgRoCjDBTcxI3G8zgnMZZqGaNOcXMNqp2kVFnIN25KElCMQUE7yvB+Yfm2e19xzuFKo9XGqcjfII/+Ye09cYvNJu3JucmVVtuLJnaeqOrxSwi+kE0BjnCKgKQbHjp+5TAdBfVeqBnclY823RvCuK1azcj5Uj2JMVCHTktPeYwZhUsPKZrTqRe4YNhLzucNTGm0632y2GCtfKHqmi37YaA8xnkpuZlNI2ThqtjzU/JVAASQJQ021W8gR5nh6+1g0q5TxYb6pqw1kAFzerdpgAfWoqWpfnJ1DbBor03c0GblU37MaXto23U/yZ+jYEbIPNs9arLOk+09rN/ZBLet+47KG0ljmUh0QQDYKGJXY9O+u+VaCRw1ckckCDaJcmWKE6fPWdAtThjt6zO+n+bjl3uwCZUWwkJJhl3xcs9F6Sqg6whik7/3x6HfZWOan0/sO1+3rGhinNY48pdY9ufmT6gKUuEewu+dPG5cjjPNQXdSQw5wcTFa9VjJPCc/L8ekYXG4eKi
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(19092799006)(261022105027099003)(11063799006)(5023799004)(56012099006)(261021123027099003)(261021121427099003)(10067099003)(261102123227099003)(261026140227099003)(261009223027099003)(261026121527099003)(261022075727099003)(261028144727099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/PVBszet12GH1R4HbFkmuEkDusRk3mNaET0uAFJVXHAs7Lo22zh4017cj6II?=
 =?us-ascii?Q?o9Kbgy0git7tMUeD77KK7n6PHMw4ojRsNSsuA4sXsr4K21xnXmdcAtVRyOOZ?=
 =?us-ascii?Q?qEPzXoFg0U/Q35kegN/cVjwaQxeOizo6MpEwSfRtFAzma49l0ZN+/nWfBtij?=
 =?us-ascii?Q?uxMrCME2+W++2tl4aEw24dWD56PCVaxvVmO8ffJ78BbclwZLnLFu2MmbqDzp?=
 =?us-ascii?Q?xFUi1oS1eMmrSEPzRCSZx0Y2RuVmLZJVUaq+LQ1ztbekqwYvOXYVhRD/LPeY?=
 =?us-ascii?Q?3JwDTeGX7k0usSvVKoaMJRjy0IXNXUv+3xKbq6VDppoyuv9TsaD0IVY9pz40?=
 =?us-ascii?Q?lkg0USVdWswbL2Gi5j1hK2owQ5ye1V/FHwkPFjjrORgR9fmFrWM/SH1b9X+X?=
 =?us-ascii?Q?9GwYL+OPGwPmfyMPP+qyOsSOdVSlFaJVikh1s9pNW6w3Yu0kET+FVOkuJpBw?=
 =?us-ascii?Q?fOdT1cIeywKqTQ5CGo34GVCMtziYjp7irxl6w1KnsMqlwaFZCj0eXKeqsF6Z?=
 =?us-ascii?Q?AJAV7wHGIDNB2v1vhY0neVl+IQx38PXhHJG3vwVf7XYBFqI9YX42Utt07F/g?=
 =?us-ascii?Q?I134rex3oPRLYhrE1CwSBxETlOyoGnLiKr5mZ5qe0NXd4t2pVLsmQ8/BJecZ?=
 =?us-ascii?Q?eRO+SXex119UVr2FhkTmNuITau2NT6ooaE0fSXWgKcbVx5+1dmZbl8ctVIH9?=
 =?us-ascii?Q?LQXKV9dAvk3kD3pN/0h6rsV6NDfjD02zwU0pTlAY7ocEOAY1sB70r/J8OQrW?=
 =?us-ascii?Q?uT5NhQEERhtRSaZfkpP1a3M6YCCxtmYwnaNntWrKHO4VQ2TEFA0lzZOz8aBW?=
 =?us-ascii?Q?2VpaO2ateSM6wmLskQ4MkvAMI9mQ/yl20Tdp57LjVkBzW19Q9c56xFGxS+28?=
 =?us-ascii?Q?w8Mx713aA6Hhom1a3BXB9cedRlKJFnFe3D61C1/iRhvS6d7lMh5Qa3vjikY2?=
 =?us-ascii?Q?polJhUYmhPw2az7K6mkFD9eXJdM2cJIZ/hXiBx6UrTWIOak5qhVzAkhAEdgu?=
 =?us-ascii?Q?hudCkskJ5Nm2mkLX6m6nLkzr52yelUhOrfOmbIYpV5VjFfv0NzqOO+DrSx41?=
 =?us-ascii?Q?g4DVa9CcyCTqhvG3yaOCKHd9YvzXkUR0lx+61n7GuE1xt34C922TRJg6KXQr?=
 =?us-ascii?Q?s8GOqbLzld2PbXISD9pnMieWwSS7n3dSaJqE4mKDmv1keXT5y2VDYOrn0UNQ?=
 =?us-ascii?Q?9tPcB0+UrHTelB3dEyl8+uJ9uGIH4CWtRp6a3wUknq01Y6JSYSElQuBuURhJ?=
 =?us-ascii?Q?eScNlD0dln9nJEJYJfkUP2RXaXhIz7DxaEsDbJBPE2N1+NIZoT5ICdjaMDAH?=
 =?us-ascii?Q?pu2cHXH/BDWuEH4JWISFeT+T+AENAFO1MeH+U85qn8vX5u6+kb6btar5wr41?=
 =?us-ascii?Q?jQ9KnjnPyEy4wAkuu1XTzDn69kIF/l/3G2zFBCrFBiPplqxGkJEGVNbRGPhD?=
 =?us-ascii?Q?bi7AqiFZYdo3bOGE34Lz+VIk6Hd3QI2i1w3h/r5f3QJOGcg4Mf+FZ675/ULY?=
 =?us-ascii?Q?CoxxBexYQnF0pErJFLseeBmSj2HN39Rsunl2PviSjEoZ5Op/zfa+dRQUpIKN?=
 =?us-ascii?Q?c/aN823TjpgI2tzwKF4eatZ2B3HzDt40YnTEg3KruFErkxN7c7BjWpYPVTxH?=
 =?us-ascii?Q?5j55xwc5jMma9WV0zbnT7w0WDRF8OHGue32qyCww+xeTUZLCDHs9lRK+v5p3?=
 =?us-ascii?Q?vVJ1Scx74XN4mvtnJhRast8n2NwZgvrUkHxipB/RCT4EFM2gCHIyO+0hveSZ?=
 =?us-ascii?Q?TSU652qyqDRDJkU3KUpUaVDDErpvAjj1BbIrnf5TIfV65arU3X+W?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d199b59c-6235-4dda-c65c-08df44d708b0
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 18:17:26.4952
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 904CttC2rRHQtxJKLxI6RiWkeRluzCOdxtNuGuhAuzJrMtTUYFwMGeSC4TmH6xnYBTKBBWRPOZqJyhnYNyADccAOMGTMtOJJFi8mNzGEdH1QmRFkfoNL0L7uyL9G+edj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7044
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_101731_471797_67F8DE18 
X-CRM114-Status: GOOD (  29.58  )
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

On Sun, Nov 15, 2026 at 04:02:45PM +0800, Ziheng Wei wrote:
> at_xdmac_device_terminate_all() removes every descriptor from
> atchan->xfers_list without completing their cookies, so
> dma_cookie_status() keeps reporting a terminated cookie as
> DMA_IN_PROGRESS. at_xdmac_tx_status() then calls list_first_entry()
> on the empty list and uses the list head, which lives inside struct
> at_xdmac_chan, as a descriptor: active_xfer and xfer_size are read
> from neighbouring channel fields, and if active_xfer happens to be
> non-zero the residue loop walks a descs_list made of those fields.
>
> For audio this is a routine path. The generic dmaengine PCM calls
> dmaengine_terminate_async() on TRIGGER_STOP and later
> dmaengine_tx_status() on the same cookie from
> snd_dmaengine_pcm_sync_stop() and on close. What happens depends on
> the struct layout. On a 32-bit build active_xfer overlays
> sconfig.device_fc, which is normally false, so only a bogus residue
> is reported. With CONFIG_DEBUG_SPINLOCK the larger spinlock_t puts
> active_xfer on the held lock word and descs_list on the owner_cpu and
> owner fields, so the loop follows a pointer that is not a descriptor.
>
> Report a residue of 0 when no descriptor is queued.
>
> Found by LLM-assisted source review. Not tested on hardware; the
> layout analysis above is from reading the code only.
>
> Fixes: e1f7c9eee707 ("dmaengine: at_xdmac: creation of the atmel eXtended DMA Controller driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Ziheng Wei <zihengw03@163.com>
> ---

suppose below patch can fix this problem
https://lore.kernel.org/dmaengine/avdni52GEjf_B3vE@lizhi-Precision-Tower-5810/

Frank
>
> Notes:
>     The changelog was drafted with an AI assistant from my analysis;
>     I have reviewed the code, the fix and the text.
>
>  drivers/dma/at_xdmac.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/dma/at_xdmac.c b/drivers/dma/at_xdmac.c
> index ef0dfe9d3..bcfbb41ea 100644
> --- a/drivers/dma/at_xdmac.c
> +++ b/drivers/dma/at_xdmac.c
> @@ -1553,7 +1553,16 @@ at_xdmac_tx_status(struct dma_chan *chan, dma_cookie_t cookie,
>
>  	spin_lock_irqsave(&atchan->lock, flags);
>
> -	desc = list_first_entry(&atchan->xfers_list, struct at_xdmac_desc, xfer_node);
> +	desc = list_first_entry_or_null(&atchan->xfers_list, struct at_xdmac_desc,
> +					xfer_node);
> +	/*
> +	 * The list is empty once the channel has been terminated, while the
> +	 * cookie of the terminated transfer is still reported as in progress.
> +	 */
> +	if (!desc) {
> +		dma_set_residue(txstate, 0);
> +		goto spin_unlock;
> +	}
>
>  	/*
>  	 * If the transfer has not been started yet, don't need to compute the
>
> base-commit: 97d73c8251226cf27cc6656b4c542869bb8c69fa
> --
> 2.43.0
>

