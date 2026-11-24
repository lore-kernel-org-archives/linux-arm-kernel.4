Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A259606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 03:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Z6rU1JJx;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=KBV+fsOT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=YIORp6q/P1qKgPQYUZWgE3F4lhaiOBn++PmMuecLoNA=; b=Z6rU1JJx766Vbz
	l18db0sX1cl5ZtrO/qF7H7W40z2UGcbwUCP+EgSlrgnYmSvCls8xzN9FnS91CaKr7Uj8jgTrkE1Fg
	qHB1yyPl2HbAhRhPXwRSA3fo2hffDyz0s3efVuymzX/c9bb8FDqXaIByUPKxYQmCYXNRzMCezPk9J
	dUAUWrwutBGeTWP7I0ou5xoNrm+lg/uFaY64Zdv0oKt6yBcYsUo+XcJOi92KbLZrGaygeXrtZMydO
	AYsWVtTPivtc+xkg+s5yUaskq7Gj1bElrZXQCyL1waAAiGXEiP/6SWC9wwKGOjcwwaxCPhHw5BOQh
	3ZTr2wUxw4pMJnBq3Eeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVhBI-00000005QaY-0y2s;
	Tue, 24 Nov 2026 03:26:56 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVhBF-00000005Qa7-1W6H
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 03:26:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TVIWsmF7B5kHRrR1lMsZhkIkxGgF1/mJoIjkUQ/8EMgFqXEYkbETw7vtPocg7Z+EUGCC1j0TFnMWNlADcQT8hi+hts/Xrp/vTJyl1uc/K3IjizY+AaPcdQlu9Dlmc849om6RqLYrNpJ0aidG6r4T2jKidbC6y/61zSbaig5NTy0wD7N9vwn82eM3reBNssGvV8elYsRn+0ctkpclXRTNtGzXr0aLLsC9l5+3kG/U8jQRoT5G6tSzUHh8HnO+n0G+XHSqJssTpMFEBg0VYCC3+yHa3h1Myw+vHQpPXFUxiNu2Xxb03QKiQUhAXjQJ7GQVqYAspibpy4ueZ1BC+r+HmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YIORp6q/P1qKgPQYUZWgE3F4lhaiOBn++PmMuecLoNA=;
 b=VPzV0xZzFPQmod2Bmud/SjRzCnidjrhM5mTsvKWH4E52TBQGYZoYX9NVUKxvXzExDhgJzCJgaoCUepL3xZ7z+BZUtgOPIOblZBGYql1nBsIzb248FbfY9EHkn+iCx5ij+OS7xs4oHcdw9CbIQeoNymjInANjl86JIhHwIH4YBsoTJMQEx2Osqg9Zi66iWr2tW4mSOtMA8liafqm3A6nJ/lOhnZN+xgDfiG9Wgl1MyHKG0+Y2VBW9/EqyViR62xncJ+rdfu/JpKxoG7fVTM0I6xhRtVNKeNLMYAJkM7Rc1903pOhd/v5cuT0E9sO0AhHk3TOm7w0xAGIoyGCAvzTZUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YIORp6q/P1qKgPQYUZWgE3F4lhaiOBn++PmMuecLoNA=;
 b=KBV+fsOT7jmSMYrjgP0EgyqkuOdXZLN7/ZDpNqpxwOs8SlrxAtQlDu03bu49n2NIEN1HaOQehJSZqfRGmfnZYKZkc32EVokjbEjEU9pmymilUQnqIokvmMcN03Ag364CLjV//j96rbn+p8tTMI/B0AROjuy0wTUMZQYkmYmidZHp3cp8mFWOUaavBb1gZcOKCwi0FF4fvizymtJitCaFjsOiiOtbqxiuhcDYnlgibSUQ/rESxDotIdOh7Rh3Utf+L+FZFEyO0s7ZWWUN96qZ0Yu5/L2JbziMIZ6B58Q0kQtB3bV/yMwmNniAen1vTHBo7/vXmcTBQcM3PFq4EmACyg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by DB9PR04MB8393.eurprd04.prod.outlook.com (2603:10a6:10:25f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Tue, 24 Nov
 2026 03:26:41 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%5]) with mapi id 15.21.0639.012; Tue, 24 Nov 2026
 03:26:41 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To: Lee Jones <lee@kernel.org>,
	Richard Leitner <richard.leitner@linux.dev>
Cc: Peng Fan <peng.fan@oss.nxp.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Peng Fan <peng.fan@nxp.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 05/10] remoteproc: imx_rproc: Avoid stale mailbox pointers on request failure
Date: Tue, 24 Nov 2026 11:23:41 +0800
Message-ID: <20261124032344.5314-1-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261123172140.3547896-6-lee@kernel.org>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0052.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::11) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|DB9PR04MB8393:EE_
X-MS-Office365-Filtering-Correlation-Id: 11ffd282-7307-4c41-fb21-08df49dac136
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|19092799006|1800799024|376014|7416014|366016|261102123227099003|261026121527099003|261022075727099003|261022105027099003|261026140227099003|261028144727099003|261021121427099003|261021123027099003|10067099003|261102124527099003|11063799006|56012099006|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 6ETOvD0Q+kdlKZ8fbw37N2D06nI8mZdLLNcICF4zKmctPZfc4CGZogqoiZA/PCT/SYuIkhmeA9ClqipRsalTM+KCSXSOKDAfAfoQsiJPTuB37m+CmEDZLow8Tf6uYRHUwZ9NfgFszf33lFrzpNl7f22cRUCUh+YurL/9yLHukG8sR+pEx15MmVad/ZuEuekUBPEo4MmIWpogMndY6FAz8VStMEnfPdnCWmZZtzPIKfy99mBQ9TcUcHHzw+Qym5l6zi7icLP42MqekMxztoE3wpUtH3/OQ4By1rhXGpRpkhaQg+skuJctabXfVjKDygG0xXySfFT4QrBvvuBAF/U1HQDd9wre5e9OaeJpJFjJ/vEqK5V1Dnm1dCLvbZYU6Wi1rT+Sipv4L9tdTNG+8lo9Kzu9YcQmtDzm9ArMSU9mDp0S7xYhH/YVlZnPUu8FwHm1JRr6ucp4BnZwcS3lhgr/PCDriqP/ui5H3EDpikRMVsQxZHUsWN4nHyKaW7glYJMl9ZIVOYXz1Uez+6S7zC2STEuj7dMhVLNcsn0lZKHp/wFqBNFRM+DozXRm3FjGmhf/csfs0EBCsl9AU3WWYS1+slqxr0EIeO63qOut7e8CLfY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(1800799024)(376014)(7416014)(366016)(261102123227099003)(261026121527099003)(261022075727099003)(261022105027099003)(261026140227099003)(261028144727099003)(261021121427099003)(261021123027099003)(10067099003)(261102124527099003)(11063799006)(56012099006)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?34BLfn2KY3sBOT2BzwsAo3Vsk0y+zsMpUTU02VU00dBoWKRIK6XzHNEBQLVr?=
 =?us-ascii?Q?A3c541K0Htmg9vAP9WAe4bUD1EAGWCqDV3OQ8A3mBMIQ7L84MNRwF1HV2aHn?=
 =?us-ascii?Q?5VjQFqbi7zBN7zlrlibhsNoshznLx+iIwrK1UnnQlWN8tSLuPNhYrlnwge3Q?=
 =?us-ascii?Q?JBSH1qopGlhHJD9NFflGsj5KP1lstq9445kd+ebegWghLXzCf/+bPC0l0HUH?=
 =?us-ascii?Q?41OrfgZcLaiti2BefvEWxNqwAcDvJNRuCrmUP+yorut8GSpJp7lfoHQn0vSg?=
 =?us-ascii?Q?YaF6vGIxdSxQxXxesrfRtjXobQr5pvAltWAApz8iVnOgyXXFd0FDZQmoPveQ?=
 =?us-ascii?Q?0KUc99AQj3D1N5bPb+FTQO+4bnv7ggrkG4Skrk0yaMmzjZLmNJj/PYXxV6+6?=
 =?us-ascii?Q?saEgWNHQwHiFvgTz7B6jWwYc6kWWp+fi0fr9C0no7luOGoGwtUZAAVXWBgXu?=
 =?us-ascii?Q?9o7czT87gLEn1ES9BiQSyunfJIDw7Ox7/A7Rs5uyFXWFsPBYdqWujwNgZRtz?=
 =?us-ascii?Q?bNoM71n2ZMDwuEwCZwQD/+uZloyjPz+BcpPxIUlqMBbg7IFq9c1yJu8Bzji9?=
 =?us-ascii?Q?vP6HQ5TaSlOaHeY3ab/1fIwIMi/YxX3GxkdoLAB0ueuuvXX3XkdAUFzX3slS?=
 =?us-ascii?Q?9CPxhQB23wErNDQ9kkaGbH5X7imNhp4pOymeO1/+Z2wFrYjJVG2JmB/vIi0G?=
 =?us-ascii?Q?+uWbysR+E7ho4Hn88OeQZbk0nRbP7Dj7A1QBZNBb+xe7lviZiECQAN+8qYAA?=
 =?us-ascii?Q?iKvEmC4bAa9lX8d5h8qW21RqYr64/P35I+kukSD5q24xiJ6GmMfZ/dat5zJY?=
 =?us-ascii?Q?nFdrKwsBts/++USYmN8tttuVdHq3vWVMsG1Etmq10AENC9Snn0a1Tmhldrqp?=
 =?us-ascii?Q?pqjGP3uR02mjycIMlcSJzSlPySyGhEPiYtEZBjl74n1+e70Z2i3mNPjWjfes?=
 =?us-ascii?Q?k4Vwin7QbnT5tW4s6kJnwUmVq09DB2FN6t35Jv3bLJpMytexOom2igSjsrY2?=
 =?us-ascii?Q?99jMnwJL947IDPvCNUQtd59MiCEs2Qq7iTsV91omNpzU3QP2K1ygguBv+iWv?=
 =?us-ascii?Q?n2loMwDTzhwtm7dtc/LC5HBo/cepGnE1fS8ephyVGICirGeWY9HlLYC4pKjA?=
 =?us-ascii?Q?nTxG3BhAcqjlDPBxZdcL6gAe1Il4n7ZMhJVVMlr5b9BuEFCstzP9PVtveAtM?=
 =?us-ascii?Q?ulhaV0bRRxM1Ndxhe1nKivmvNH+h/PyyicOkiIM/yvXL0vhEbJ0HSslAd0Ue?=
 =?us-ascii?Q?sWbp/JdyTgFUNNasR9FzDNrIPIQ8aOfQR2k8sVD/TB7EuIGPPCSKVf12hb6I?=
 =?us-ascii?Q?bMpEL6eh+M9fF0zfVaXh0gumk9mQz++c/1NTfZs1tl25CMkBAiC2gLS0zW+b?=
 =?us-ascii?Q?i6yMuKNtoS+xyEthG6xVCa4+HKBX7k7Ch08GN4NNes1amtz4YNRWr4dxGGRM?=
 =?us-ascii?Q?nL+dLozYPgg36MxpLPusSrZmHtRt1LsNguwr9XxlVchLHm0L4f+/h03WXdii?=
 =?us-ascii?Q?PagWXOabfyAk24qPmInj/VO9sVUEoemlp0Le7vUFKip9DqdZ0powYrnCCtq4?=
 =?us-ascii?Q?qu7ik2EGtytjznjE2EmKkLnOgLSIcmixSHoiqRC1baM8xIa7HOOUitcBiRNp?=
 =?us-ascii?Q?Qc+jUj9S4Kja1Bh8LlSTtWAklGDdEiysOR+eDtqkxdz3i+bE9ky2gzLYiwtx?=
 =?us-ascii?Q?a8MJBp+HlqLEHVlsTNsxBXmEpVLftEja9cWg8BIW52eeIy0MB9AZXZf+yqFR?=
 =?us-ascii?Q?uixwiai5Z+SknLs2EiKCnmZZJfAfuj5AbHgLH9ta0BgFjFTcErjK?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11ffd282-7307-4c41-fb21-08df49dac136
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 03:26:41.1168
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iT8XvBFBshZywSCO/Gi7qjSGp90JoNp4AIEL+J+c47UMJ880G+5vkrjjZ54vWn293MI2frBisrQbxYvLpIEsITtt67Cf2S+zBxdCzpN+vDVLm2fD/H8gKsc8w0p3JFHu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8393
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_192653_605337_E0699C62 
X-CRM114-Status: GOOD (  20.18  )
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
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Lee,
On Mon, 23 Nov 2026 17:20:49 +0000 Lee Jones <lee@kernel.org> wrote:

> imx_rproc_xtr_mbox_init() stores the result of
> mbox_request_channel_byname() directly into priv->tx_ch and priv->rx_ch.
> Because mailbox channels are freed on stop() and detach() and
> re-requested on start(), attach(), and system shutdown, a failure while
> requesting "tx" leaves an ERR_PTR in priv->tx_ch, which is later
> dereferenced by imx_rproc_kick() and imx_rproc_free_mbox().  If "rx"
> fails after "tx" succeeds, priv->tx_ch is freed without being cleared
> while priv->rx_ch retains an ERR_PTR, causing subsequent calls to see
> both pointers as non-NULL and skip initialisation, leading to a
> use-after-free on priv->tx_ch and an ERR_PTR dereference on priv->rx_ch.
> 
> Request both channels into local variables and assign priv->tx_ch and
> priv->rx_ch only after both requests succeed.

I think Richard Leitner <richard.leitner@linux.dev> is working on this.

https://lore.kernel.org/linux-remoteproc/CANLsYkx=M_TXN10qAcQC0be065TYnzfOae6E8ss-9DTj9MzogA@mail.gmail.com/T/#ma2f8e4c332d47e5bdd1787f82f4dd2feeafc67d6

Regards
Peng

> 
> Fixes: 99b142cf7191 ("remoteproc: imx_rproc: Request mbox channel later")
> Closes: https://sashiko.dev/#/bug/linux-ac0f248a-bdfd-41da-95f8-44b8f1f7091d
> Cc: stable@vger.kernel.org
> Signed-off-by: Lee Jones <lee@kernel.org>
> ---
>  drivers/remoteproc/imx_rproc.c | 18 +++++++++++-------
>  1 file changed, 11 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 581bb07f5893..a77a3342e1ed 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -875,6 +875,7 @@ static void imx_rproc_rx_callback(struct mbox_client *cl, void *msg)
>  static int imx_rproc_xtr_mbox_init(struct rproc *rproc, bool tx_block)
>  {
>  	struct imx_rproc *priv = rproc->priv;
> +	struct mbox_chan *tx_ch, *rx_ch;
>  	struct device *dev = priv->dev;
>  	struct mbox_client *cl;
>  
> @@ -900,18 +901,21 @@ static int imx_rproc_xtr_mbox_init(struct rproc *rproc, bool tx_block)
>  	cl->knows_txdone = false;
>  	cl->rx_callback = imx_rproc_rx_callback;
>  
> -	priv->tx_ch = mbox_request_channel_byname(cl, "tx");
> -	if (IS_ERR(priv->tx_ch))
> -		return dev_err_probe(cl->dev, PTR_ERR(priv->tx_ch),
> +	tx_ch = mbox_request_channel_byname(cl, "tx");
> +	if (IS_ERR(tx_ch))
> +		return dev_err_probe(cl->dev, PTR_ERR(tx_ch),
>  				     "failed to request tx mailbox channel\n");
>  
> -	priv->rx_ch = mbox_request_channel_byname(cl, "rx");
> -	if (IS_ERR(priv->rx_ch)) {
> -		mbox_free_channel(priv->tx_ch);
> -		return dev_err_probe(cl->dev, PTR_ERR(priv->rx_ch),
> +	rx_ch = mbox_request_channel_byname(cl, "rx");
> +	if (IS_ERR(rx_ch)) {
> +		mbox_free_channel(tx_ch);
> +		return dev_err_probe(cl->dev, PTR_ERR(rx_ch),
>  				     "failed to request rx mailbox channel\n");
>  	}
>  
> +	priv->tx_ch = tx_ch;
> +	priv->rx_ch = rx_ch;
> +
>  	return 0;
>  }
>  
> -- 
> 2.56.1.750.gf70dc682cf-goog

Sent using hkml (https://github.com/sjp38/hackermail)

