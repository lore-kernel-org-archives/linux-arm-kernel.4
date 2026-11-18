Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F23B2606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 19:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Js3EnN5h;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=DaQ3XKHS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=q6oyyu1oZDi64YoKgAU1qsRQlmou5+yKpB5sTY1yF7M=; b=Js3EnN5hroHFK88RX3ZNhjJMIp
	Lth8+vMRzStL1xKDZL/4Xej515PXrEq0B51gGHBigzDYkAircSTNaZJSMXTlopMfUu1l6YzJX8jx7
	VGG56kpL4R2G/oAakwyXRb4VGc2FUNHPPyLHf066r9QXo6k0aHNes7NudK5c3+E9Kvu9xhEnzQWed
	tywin/L180/b+EC6HBYlTzY3DqA8XiDGIirBAvyC5vK7KMDwJNn2cLOWE/7CnvEStny+sRaZnY2KF
	AZKJqNKDgm0rWGZEzff2iBUm1p5nVQBrzjQnkYa8MOYZES9+zyz3Yuy7JA4w8RS4cNGClhAPBiRXx
	+rEXz19w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTlYx-0000000A83R-24nP;
	Wed, 18 Nov 2026 19:43:23 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTlYt-0000000A82Y-2SbZ;
	Wed, 18 Nov 2026 19:43:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WeEv0DUYeuQ5fJ6yvC5MR0enVZx50X2Yy+1JlJ4BvLlasfVVEn0GjMEHZpCXf9DVLA5q8g2oDmQRbKup1ZpJ9dGqb/xw7E4qffDgkBhipjENHMCY8AeOq0GPEFrnJfT4hRaSOhXI2rIfJ+JZIntr0DQMtA/QlHyh1PXyJYN2OQ3P6g+WTrcnNSdgTea/lPUM8qWpSGyCOTngfiflqeHADWMWrEO5d11cd+S2nHyX+o3OI+CuEkPXxY+3t1OfQ5sSb1dVAl3R6GI8WHmQhEaMdHAdBbqcB4eipwJxWQhJkCXDIN9Av/3uzxiIfVFHnSydiAGGIl7CcqOkxFLUf+ULaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q6oyyu1oZDi64YoKgAU1qsRQlmou5+yKpB5sTY1yF7M=;
 b=yYVFa6oCp8/fnkpc+vKbVTumMSmoIr7plIyVJnAKkdN73Qo0x6UU3y8/P1uWetwU87iDWwO+wavYQL8z+QLYCUfIFJZH37ayjWUpICjDh0mvRW/PImk7VfL6cxizjZheWqUN45baw+pDSW9Xadm1b7CB173ZrRAeHPB7FWCxCI8idxLmYBr5JmKSCLnWvEYyGnLs28TpA+NVYB/hAZpD4uidUfAmy+DhQZzXQv6ELWpzaqzgq+pAQtduSZ8CFyLfZygKnqHVgCxdGCkOpenDhCjxrzrWQLnXjA9AiNAChZa/p3xfo5/if8B1PpyutHowb0nrBNzhzWUuX+JVCYeGiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q6oyyu1oZDi64YoKgAU1qsRQlmou5+yKpB5sTY1yF7M=;
 b=DaQ3XKHSJs/ZZgcpKhEGb+1ujZGR2vWyuyxSNVSwKc4/87Bbk1/pvnX94XBi+DkAFgujYGMvANtZsMqVUhX4kNLBthMlmr7aE1A5VwSDwZWB3bga4+oYlRI7lwJfAymsNZb7wUG6KUe8p62ZktJtNDurTQ3ejs4FkIVqB3sPibRjwK0kxxc31OzkCGJb8LGJWEKprFNUxwIfRT+5u4PgSqwtSJ7bmBHgnHTN2+8q489VC90fMVcUbLYzx5c7xYBQDj2yWh4YmpM4Qi+J+gsLGxXtyuAWFU+Ss3SIL2QZVaQeTbGH2BDyb1iGBlKtJQyX7D+ailX6njFHbMM4UmKdpg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by DBBPR04MB8060.eurprd04.prod.outlook.com (2603:10a6:10:1e6::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 19:43:14 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 19:43:14 +0000
Date: Wed, 18 Nov 2026 13:43:05 -0600
From: Frank Li <Frank.li@oss.nxp.com>
To: Tomasz Unger <tomasz.unger@yahoo.pl>
Cc: Vinod Koul <vkoul@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Frank Li <Frank.Li@kernel.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	dmaengine@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] dmaengine: bcm2835-dma: Add missing
 of_dma_controller_free()
Message-ID: <av3_yVSq9CKqix6o@SMW015318>
References: <20261115-bcm2835-dma-of-dma-free-v1-1-d539234bfec5.ref@yahoo.pl>
 <20261115-bcm2835-dma-of-dma-free-v1-1-d539234bfec5@yahoo.pl>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261115-bcm2835-dma-of-dma-free-v1-1-d539234bfec5@yahoo.pl>
X-ClientProxiedBy: PH0P220CA0003.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:d3::12) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|DBBPR04MB8060:EE_
X-MS-Office365-Filtering-Correlation-Id: 229f069d-b690-4c46-ebec-08df45ac2f82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|7416014|366016|19092799006|1800799024|261102123227099003|10067099003|4143699003|261026121527099003|5023799004|11063799006|56012099006|261026140227099003|261021123027099003|261022105027099003|261021121427099003|261028144727099003|261009223027099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 1x9oGiqpvHllOVMXUMYeVSx6yk8+zqctq/rED/go6PGPNYb2AA46gPp9EXcKWNL4ismsvh80AGmbali7eqxgBX2M7tRSqcpchZI98qDziMTo7OLmV+MU1PEoMS/m7jZgsl+wAx4dcU9xrudty4ugesY9acjlt5ocWWZ/B2yf58Ch0MHUonaqNXnt4oLJIfSyLN9r1ibAD5CScCDXtvUsRTddCwKgO3nT71zTI20CHSyWIc/CejH9Y3H+rpNRdH9/cKI4KIWYf8GZ5ZIKLRSy8ooY6NAQ686x/H+Cyxlm4nluKJJDRS2IuTJJ/3EucHzs/ivwwj+FqkTpCphagFObmwHvik07iZlSmTrwdbNeXrt4KhP0CffjNLI+8KG9T3DSsj5v8JoTKFxBQ9GO3MQmdszQJ9RkckroWgtg6Fqi1gcQJwzYAtN9xQaUWuy2HjO1o7CMI3MHuCdSfgWyRaD4OBgq4W80TqLeT0rM9fjOv3aklWoEWSadYJIiIQBap2h70mqZAlqojf9wQzahzAWIxgbaNmB+igsE8Gwkwg1RMqCrWufEBIfSpOTXGlRgSGOFUpTzVUIl+VJfKYTuU7IksGOrE+YlHn0OxkfD0w5pYbuX/CPRGK4MYNAq0d2Fh6qf3LvlnPljiZeeJp1enPCv7UTGoXakCDA5KxQCFBnuKXo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(366016)(19092799006)(1800799024)(261102123227099003)(10067099003)(4143699003)(261026121527099003)(5023799004)(11063799006)(56012099006)(261026140227099003)(261021123027099003)(261022105027099003)(261021121427099003)(261028144727099003)(261009223027099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0l05wQ6+nBv38fZ0BVyFCIiyEuG4Fqn6j4q4Pn7Gwjeaaiunri6pDMffpzS1?=
 =?us-ascii?Q?EbEzi4xx1GwoAIbrTiCcSdAcBltvf3M8z4yrtYSR2gT9CWYV4/vPmVgMWaZR?=
 =?us-ascii?Q?EKKEnuO5+mapCBzN3NgN9Zqi9f/eclRW6Xa1JdD1ZdGl3mAsz+YJKqEaYvX2?=
 =?us-ascii?Q?C/jBqD4VepKGbv1Ad70RcicFtk8j1re1D7mhK3xsIPR5kyb/F50lUPAsi98K?=
 =?us-ascii?Q?kXZlK5Q6bApiwOwYGGEXGeGIfxGnyaMJ9QRTT35nh6tAcvaNOQajG0z2A4P7?=
 =?us-ascii?Q?cOBsmtNE1w5+3CX8Ul2pVpgYeXhUBlBJh3tY6uqPBTFBKLJgj2xSw2ppGaxM?=
 =?us-ascii?Q?/Ab05dCXz7lcVLC57hevOgHBmEayC6RIrZgLuhvJeJg+3dTrGHrXj/Hrgaim?=
 =?us-ascii?Q?I7hN0tgtp3JxnhUxwOd6E5q6mT80I6KXE+dEDcySZ4DJe+9DoLoY6bTu3DEF?=
 =?us-ascii?Q?jcT22Ab9oVfIOHxr1lt5lcRrj/2VtT8bHTUDBsv5aVNHIrpDTCH5MSK/OEmW?=
 =?us-ascii?Q?+XLxFVpGWGtAP3iAWJO+8Pn3kqPZlE/P4BFj5Cs4LnpM/uAansxsw6PVRuQA?=
 =?us-ascii?Q?o/Rm4KPoqIkws7dO3/5ZRmLu6zZcmOPHXBYLeU4Q0hh4tw1xnBBKtf836b6b?=
 =?us-ascii?Q?4Q4zqWZhPsfZ339vpD4wIYzPmolMTkr+u9ZbAKlCcdX1Yk7ZMzXD+F8GKIDH?=
 =?us-ascii?Q?n7UALriOiYcj2pftz+NhV9wjnKpSgpEGz2zf8osldATgZ00vjRLqShmFDkzt?=
 =?us-ascii?Q?ipEIy0t+SWJ8jrplluKXVeRZVLkdo6c8OjjoVKwqDSRnJWurVUCx0n2bGWDw?=
 =?us-ascii?Q?kf1ALUPYEqsVKk3t7/lTu05MIE8SSITOywAyEIq22rEbsD1IqYo72j8peNSj?=
 =?us-ascii?Q?V32tkugkI0MXpbyO15Cq6VEsocJ5L/4cqPEcy7B5j9oBklEa4Plb2xra5hQx?=
 =?us-ascii?Q?y6/dB7sbuRzga85EAZvrexy5OXrGLOImPSY+Ucaf/MQ8Pj8ShPso/PofJl5d?=
 =?us-ascii?Q?OQgr0tRVJr+BGVIeMDDxGPUnteGeNVAjHyQXgcyG/+9JTuAV3PW4g64xzSjl?=
 =?us-ascii?Q?/ro9cIM5EKjtx1LYEkgex2+9KqPxj6SZXulgQ93fY1SrQ3UmWjcU26XpsQlK?=
 =?us-ascii?Q?MOpu9v1NlJEcvtMgLwQSIzsvdu/EuoAbrgzKvHGsguNx85AVSQcXttgpWGtW?=
 =?us-ascii?Q?5+xEFpEW3HPkTDGoGm0FFfyQT5589U+Tb/+PvzGhRYl495nOaA4U33SdKvsc?=
 =?us-ascii?Q?1RhGu7je/fsBkC4y++awRvfE9UrN7UknNO+UOeSPHzn7PJ4PMBKNNuLxG4EP?=
 =?us-ascii?Q?IDDEwyuJ+qNNHmh6zBNMboAY/kMuIqCbCQbmjAJW5QusHnEpfJz00QAueuVi?=
 =?us-ascii?Q?Mywt3rrkHn/VfK4YqSda37YGPjtdIYw3e/EYht0+j/X4Fn4zR/Bp2wByjNZG?=
 =?us-ascii?Q?d3qAGDclyI9ouLQgJgoL6pWz2eOcLCzHpnfz4msx8TlZKtVo3lAyynhSf6x0?=
 =?us-ascii?Q?0ryZ4l88M+Kis0KmuwuxsUoYK5Gs5DAGU8k5INMeP+85Eub44O5YGoZH5lSA?=
 =?us-ascii?Q?kKV827Bef9w7QRV0gWpA6myjLLBFzNPBsG1AGvXpoekTcvJNeXQsFTneImp9?=
 =?us-ascii?Q?jc9O4+SN+i967byhYQZgpH197Iuaxs5UaV0zGk25XeYF/zPiYDp15fH5Fpvf?=
 =?us-ascii?Q?XBiqm8FhWR/Fl+RMHfARmlpSrONt5oNM7+bzbaXcnmzhr7asknmKsq2UZNUz?=
 =?us-ascii?Q?XsI6Rsf1u5BZ52ONmB+Olbv5a/PknnLKgGVyIrbmVtFBsz7bHbwk?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 229f069d-b690-4c46-ebec-08df45ac2f82
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 19:43:14.6137
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FvNolBxjruRTF/sNRFmlEX4naFq4eE5hJznNRnL1O1bqwDROJt/1CJ5Jgc/KXDqdKGkJH80fXQKmVOZuZp0lTkExmMdbSIj5XevF5SXD6JAPRb/vjlRrYWD6rs1cQrR0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB8060
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_114319_637854_F6C9A288 
X-CRM114-Status: GOOD (  33.87  )
X-Spam-Score: -1.0 (-)
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

On Sun, Nov 15, 2026 at 11:15:15PM +0100, Tomasz Unger wrote:
> [You don't often get email from tomasz.unger@yahoo.pl. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> bcm2835_dma_probe() registers the controller with
> of_dma_controller_register(), but of_dma_controller_free() is never
> called, neither when dma_async_device_register() fails nor in
> bcm2835_dma_remove().
>
> The entry stays on the global of_dma_list and keeps a pointer to the
> driver data, which is devm-allocated and freed when the device is
> unbound. The next DMA channel request for this node is passed to
> bcm2835_dma_xlate() with the freed structure and, depending on what
> that memory holds by then, either fails or crashes. As the stale entry
> is found first, this still happens after the controller has been bound
> again.
>
> On a Raspberry Pi 4 Model B, unbinding vc4 and the DMA controller and
> then binding vc4 again results in:
>
>   Unable to handle kernel NULL pointer dereference at virtual address
>   0000000000000018
>   Call trace:
>    find_candidate+0x64/0x210 (P)
>    dma_get_any_slave_channel+0x64/0xd0
>    bcm2835_dma_xlate+0x24/0x48
>    of_dma_request_slave_channel+0x178/0x2a8
>    dma_request_chan+0x20c/0x380
>    snd_dmaengine_pcm_register+0xa4/0x2a0 [snd_soc_core]
>    devm_snd_dmaengine_pcm_register+0x60/0xc0 [snd_soc_core]
>    vc4_hdmi_bind+0x4d4/0x8e8 [vc4]
>
> Free the controller on the probe error path and in remove. In remove,
> do it before unregistering the DMA device, so that no channel can be
> requested through the node while the device is going away.
>
> The bug was found and the fix drafted with the help of an AI coding
> assistant (Claude).
>
> Fixes: 96286b576690 ("dmaengine: Add support for BCM2835")
> Cc: stable@vger.kernel.org
> Assisted-by: Claude:claude-fable-5-2
> Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
> ---
> Verified on a Raspberry Pi 4 Model B: without the patch the sequence
> described in the commit message oopses; with it, binding vc4 while the
> controller is unbound is deferred and HDMI audio gets its DMA channels
> back once the controller is bound again. Both paths (remove and a forced
> dma_async_device_register() failure) were also run under KASAN in QEMU
> raspi4b: slab-use-after-free in find_candidate() without the patch, no
> report with it.
> ---
>  drivers/dma/bcm2835-dma.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
> index 06d830d36882..cf29d897450e 100644
> --- a/drivers/dma/bcm2835-dma.c
> +++ b/drivers/dma/bcm2835-dma.c
> @@ -1011,13 +1011,15 @@ static int bcm2835_dma_probe(struct platform_device *pdev)
>         if (rc) {
>                 dev_err(&pdev->dev,
>                         "Failed to register slave DMA engine device: %d\n", rc);
> -               goto err_no_dma;
> +               goto err_of_dma;
>         }
>
>         dev_dbg(&pdev->dev, "Load BCM2835 DMA engine driver\n");
>
>         return 0;
>
> +err_of_dma:
> +       of_dma_controller_free(pdev->dev.of_node);
>  err_no_dma:
>         bcm2835_dma_free(od);
>         return rc;
> @@ -1027,6 +1029,7 @@ static void bcm2835_dma_remove(struct platform_device *pdev)
>  {
>         struct bcm2835_dmadev *od = platform_get_drvdata(pdev);
>
> +       of_dma_controller_free(pdev->dev.of_node);

use devm_of_dma_controller_register() to fix this problem

Frank

>         dma_async_device_unregister(&od->ddev);
>         bcm2835_dma_free(od);
>  }
>
> ---
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> change-id: 20261115-bcm2835-dma-of-dma-free-ef85776c0914
>
> Best regards,
> --
> Tomasz Unger <tomasz.unger@yahoo.pl>
>

