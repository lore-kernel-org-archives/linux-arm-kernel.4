Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16332606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 19:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gSIfomgT;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=Gp9oW07w
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=DsOITSqXSaWxHI1MQaXYRQqFjZ+WLHeLS3WqaQ+u1bc=; b=gSIfomgTa0FRDFhoDDJV3j6FVN
	9xZCC1y8xH7ucalovtmG2t/1ZiIG9eEdYUOzKjYmQPLvi3U9AzIaKGKzXN1yNx0+ND/77mdXZdQwU
	sW+/X6MH+vW5npqPOomtPP2++jGT4GiXcKhBCP7040jbUsXSs0XISM8PNquhgg4/xXui66iyn9AC2
	N13foVjgAqTIWVGrpAxnnRyWjVIVCgNK1nCDj5PH6aJvdgesI0zfgGNrAwpmE9WmX9MMoV0a0jsQH
	i/oXuN7hXkDDEwhzQLtyzr5AEem9MeSt9XCpmaLEUG+L6ke1dTiQbFD3l8SRH1OKR19y4Md1otCM7
	MG2M01XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTP6Z-00000006wYy-2b3F;
	Tue, 17 Nov 2026 19:44:35 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTP6W-00000006wXi-2pkt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 19:44:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D3hXkMB27l7B9iYyersfTaU2YNFnpPnNC48rhZyxCMrn0p5GYPW1XmLLb5MVDxeE5XW9UmsbvCAzznpoWsPeMrTGqI6qN3KxCobjlQ6S4HjOaaV7MNc9qnkLJQjYId/JYUtbve+nLrfdtEm7/IReA5u2B72rKCpAAG5pWb4e9unWL1nrcDkIeK5qaylMmDvZqSe0ZA7RPsa+ho9u8GPR5UFn+DmZdMoce1TpnfYKaVQ27C4QktnyS8bKV02skOjFBIUfhK4s5ZxYlArm6xEc831Kb/ZD52CaVHVjNHnm0xck3KL1FAMdVAwitWhaCzNaSW3MjK+WJUpJKGDjl8D9mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DsOITSqXSaWxHI1MQaXYRQqFjZ+WLHeLS3WqaQ+u1bc=;
 b=Ud1TraGsVZRBkVK8jZMXtKOjJa7Qp25XkqO7MaXA9X99r6TZCjdj7Hzkqy6F4YMqdRfktof4kRKARSmH5kYn5+o26K77L6kLJyIjfEelDvQWBsh4EhHJgb+uphzsE9BH+rt1AYdW1QTPwVo23BbTu8+hXJYwNtuyXbM3/uZdoGEI35r+2GHLOCCMSVtnEvJDiTk54GviHQovhDuvaMDLcE+TCP7KLUlH9jRGb6y0u+L1jh6F4ysFem5EZ2OsQVYxqJpAixE7aXzvc4I+41w1z/FcjFmTM9w4BKAf+Aqsz+hVMRJPQjjYgS2+7g4MqPh4dp+ZJoEZygSyDpQocLUbWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DsOITSqXSaWxHI1MQaXYRQqFjZ+WLHeLS3WqaQ+u1bc=;
 b=Gp9oW07wr3lNb6hPbjImGJVlItdQNTmDUjr9mgAO4/KHKRkkP7glXPI8tjLlkxP5KAe91cuqk6qbqNgBgn+CH3q0QhbkxB0VHLZ7k+Tsu1tOwx+fo1E/Zd3RY8biZMrTQvhRhTc3z5WpsSlq/Soeq87cr5HZc6eFnH2b4MPIA+JJ2+vG2iyUNXb30+eMgXbWLLUM15zpq3u8rLxedJ/qZJtB3Oi0DgJ3gosxFuKBxxpzHD6nb0h/wY5cU4/ZnukjTM6HVRACA2pD8K5e+R7cwSUcTIlxu3/EB27e4OivzYrJAwQw+RRGJoVsv61R4vWlyyv5RWOZ2pTKs9AjGeqkHQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by GV2PR04MB12191.eurprd04.prod.outlook.com (2603:10a6:150:33a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 19:44:27 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0615.013; Tue, 17 Nov 2026
 19:44:27 +0000
Date: Tue, 17 Nov 2026 14:44:19 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Lee Jones <lee@kernel.org>
Cc: Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2 07/11] dmaengine: arm-dma350: Query
 dma_cookie_status() under vc.lock in d350_tx_status()
Message-ID: <avyukzFVegUHvgtL@lizhi-Precision-Tower-5810>
References: <20261117163809.622249-1-lee@kernel.org>
 <20261117163809.622249-8-lee@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261117163809.622249-8-lee@kernel.org>
X-ClientProxiedBy: PH0PR07CA0084.namprd07.prod.outlook.com
 (2603:10b6:510:f::29) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|GV2PR04MB12191:EE_
X-MS-Office365-Filtering-Correlation-Id: 81376a2c-c1d1-4c68-1026-08df44e330a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|19092799006|7416014|376014|1800799024|22082099003|18002099003|261009223027099003|56012099006|11063799006|10067099003|4143699003|261102123227099003|261021123027099003|261022075727099003|261021121427099003;
X-Microsoft-Antispam-Message-Info: eaRHDukYltKkezxOGabq5PRDybsAifhAHxhCZAcDpqWtKOyYPDui1HM4Ck2XMfIaX9CVvrhzDErq6huZxlO/sVlSdpAvBk1wRxgdkM08jTizwakRMPDrfzY1lLmdBgoMbI/WqrXvzbB92AmuIO4W3rp8GjQEwRaOiJef82drrkuI+yLuAWQLVnK49+OTWXmrDQRJLaApCPdfHUzTMVtV1hAtRzeMG8ljYldE+H5O9zTsoi4nRbzk5w+QAnVo4vb6mq75de6pGuZ9fXqMjUrambL/F6fy/tiQPPbGizsaveY+lfud6wIVw7vRLlgdup7BLLU7SHQeY4ik7pUs93m20Egdat9qyGplXlDmfxW5hp+ZP5XEv+9jqi0MgjAXqsXSxYdtJH5/IMD2vOjmAl2xHE7Ce05E+ZVAIqiKtZASCQgekoEeyPirt0i9v2ul1dFSuXhJ74VYEqVQzOSKk7lI/uYlVqMOiSu/g92VhfFIBjGx8jQ0PelTzak7VsHi9k3Y0cxmg2/2H2zM67RgF/4GMWtoWY6p3WVPBn8E7x1pbyW1fM9pmS4FeXGdJP3QfNLw8nFIYlJq0mnenfzu3SDTiMMhrmj+mNx2X3p6I2zB70k=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(19092799006)(7416014)(376014)(1800799024)(22082099003)(18002099003)(261009223027099003)(56012099006)(11063799006)(10067099003)(4143699003)(261102123227099003)(261021123027099003)(261022075727099003)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?m6/1ZR5zdHgA5so0b1APtk80gU0E2rov1E1lfFZ//MyEDCj9EeG0pMQ7L6GQ?=
 =?us-ascii?Q?ZXoUwSdokIsHA0okUPRpMsW1OdE9Swj44DLx1EESFPrM3OLxEiW0IIraTgAZ?=
 =?us-ascii?Q?HcX4XZwAwhc4bH+HzmuQjTDwIUutz/egpP+TFrrAnU1BDVsgoclcpij3wDqh?=
 =?us-ascii?Q?8NyxAU0C7InHv/ElkcRUMZFyt/rxfziQUuvPgnxnA6pMkcLvvvvJmjBRLhVQ?=
 =?us-ascii?Q?JPH3fDdrPg5Ls30+/6uR3RrtIhOOQHfWTd2Gp3+BsSm0VSPHlS0PupopOPSk?=
 =?us-ascii?Q?eL3AZBZXa2MLVXEFK7uXyrJkwyF3pcAvMcnvW8XU0cxD2WJqrS2KobfGW25N?=
 =?us-ascii?Q?rkOYvX0O+d05cbjtd5hM5ACjD9uVF+MqqexbIVNMRAf4VfRWpxMaRNWuMpSN?=
 =?us-ascii?Q?qBByaRS6QszMpI0Xt4bFGf2JRFMChHmOJPDwbhOBGPfANQNxkmPigIH740NV?=
 =?us-ascii?Q?Bb/tXHj/CGQq61071goBSueHXIlStvxc39okwArKSS6yQZGijwCzonVEiwl2?=
 =?us-ascii?Q?ElEHEOJnBgtHm9cy/+OQ6L89sYSfFMTbvcg+Xv7NLj2lMbiplEWka8APDjK/?=
 =?us-ascii?Q?AAWHIkPELxnOASbE5EJknaBFwQGcddNdGI7SBvIO9zvejBy2KXcEljXQRiRs?=
 =?us-ascii?Q?XGak4Rs+KY5Ko3+wEKmIC9qwsEgxCr/p8wbkxsKJ8/MnVJO78f0PRUK8h38F?=
 =?us-ascii?Q?8Oo7gDHMKiwZWR7qOaBRxYjhXIUN+RQ1b0AzU5478GgUqjSWb6AtVvG0l6ic?=
 =?us-ascii?Q?BcE2dxrQCksjJXpb9N7UVySV6Re8WJaZxgwBTTmq40bOuixAjJ88Pi9YCL/p?=
 =?us-ascii?Q?3IbvCOpbbHNEYX3amoT7UeEYhSwTcGDkPe57e1gMVx2l66HcAtdDnsf2fyKe?=
 =?us-ascii?Q?3JM/4EWvcPfUkEjirBKubAyVE8+rxfHmdw2Udz4bYmO2O+RNjK5xuOYyRgV+?=
 =?us-ascii?Q?B4Vw/zJayKIEKvKYhKRG/5aNz9ZMM3Ryrnp1K2QP1lDPk1ARMJ11pFzT4zz6?=
 =?us-ascii?Q?lLZQvonfu2ajdmOq4lcYCHmDF/iSl5hURgnMOVWQio3HwtrQKOrQHIAt6fSI?=
 =?us-ascii?Q?ThpYPncXMaVaKvX465bA5JxSV4b+APbMRbLjGoLKoFoAMtK3Qny5bIi8hNNn?=
 =?us-ascii?Q?HDi4OOgrlvuN7LJ5wrOBzVAIoXKR9LSGlFm3z8t9JmGctC0vY1qtlEi+z089?=
 =?us-ascii?Q?oFWOOZDKYR/F45CxX/aCxgXBCMZTd1YL+7/tElDAdYKEXl5ZkmR8jyT24k4P?=
 =?us-ascii?Q?P432K9M3EEpnHebnOMgB2D1OCoHnQeC1zmukcPKKqUYdoAB8obRIaiftxdw1?=
 =?us-ascii?Q?3He+3KSjjdIdcNr+lU7aHtrkB/qaA4wH0xEeGHTnhgctjzkuprPMX04gOZ50?=
 =?us-ascii?Q?/IVD1JwgnIDGcahuPULso8NTfm0GiFO3rcU1rl8NwJnehK3+z7F1EQhxp12N?=
 =?us-ascii?Q?pn4VsIQUuSqK17QII4BOUYybz8InXcz8P7tXMRbTp14FHVi9qJeQJVQ8niJq?=
 =?us-ascii?Q?QcjNvmX7bfy2nD5T1o9edoXwpJpw3FG0o5ehnmXGTC3MIMeHabXRXoRlviZr?=
 =?us-ascii?Q?V6FU4yDFHM5Ku9fRbYU2poR72Z8++r9JTlSFh0r9fpOuUCmqnyeKn+YoSOR9?=
 =?us-ascii?Q?Mkk3/hizcVwU5fi23BHOSVAILY+roHvlQZrFWI9ooNcgrQBtG8OZFhe37UCQ?=
 =?us-ascii?Q?xEPDOkGxMbG6F1ySW6GUGkIGftuUTofU5CMsAVVwR48RfS5abF7EogVyJd2e?=
 =?us-ascii?Q?j2bmjY+uci5+i6FkzhWP4BGPW8N5K/kFha/D2uA4YngVBuFXTEJ4?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81376a2c-c1d1-4c68-1026-08df44e330a0
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 19:44:27.4594
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NyVxeH4IVL5yD6WwFAPwdhHy1jNvcXd7JiiFlyW2vxIaMOIVHxkCKhV5USEGYZom32eOjYIDJZFOolfl932q4lnWtt+wV7ch74aOzX29NzTviNmTP9dScYzcyMGfv/4c
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB12191
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_114432_722716_87C52C9F 
X-CRM114-Status: GOOD (  16.22  )
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

On Tue, Nov 17, 2026 at 04:37:08PM +0000, Lee Jones wrote:
> Calling dma_cookie_status() before acquiring dch->vc.lock in
> d350_tx_status() races with d350_irq() completing the active descriptor
> and starting the next queued transfer, causing d350_tx_status() to
> observe a stale DMA_IN_PROGRESS status and falsely return DMA_ERROR.
>
> Move the dma_cookie_status() call inside the dch->vc.lock critical
> section.
>
> Fixes: 5d099706449d ("dmaengine: Add Arm DMA-350 driver")
> Closes: https://sashiko.dev/#/bug/linux-524816d7-ed1c-4f2b-b4c3-65a7e8bb45a3
> Cc: stable@vger.kernel.org
> Signed-off-by: Lee Jones <lee@kernel.org>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
> v1 => v2: No changes
>
>  drivers/dma/arm-dma350.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/dma/arm-dma350.c b/drivers/dma/arm-dma350.c
> index 52f5242ea332..8c1725588f1d 100644
> --- a/drivers/dma/arm-dma350.c
> +++ b/drivers/dma/arm-dma350.c
> @@ -381,9 +381,8 @@ static enum dma_status d350_tx_status(struct dma_chan *chan, dma_cookie_t cookie
>  	unsigned long flags;
>  	u32 residue = 0;
>
> +	spin_lock_irqsave(&dch->vc.lock, flags);
>  	status = dma_cookie_status(chan, cookie, state);
> -
> -	spin_lock_irqsave(&dch->vc.lock, flags);
>  	if (cookie == dch->cookie) {
>  		status = dch->status;
>  		if (status == DMA_IN_PROGRESS || status == DMA_PAUSED)
> --
> 2.56.0.679.gc527c65306-goog
>

