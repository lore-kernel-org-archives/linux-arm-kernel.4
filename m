Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C053B606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 15:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GUBzmZeB;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=mmUVLVlW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=AJ/SMs5/tA3Aw//lrGhfle7qO8ScqhS2hToiALSXWA4=; b=GUBzmZeBajv7nkQTX0o6tQxwXE
	8VWwCYWLekKcc7d06MJxGlXfXYNNU5zFfXQLDLQe0mW8MDC+qFopdjN4MIWbr0XP6iRSl/O0oNR3F
	AV3uRBqYbDlIiePYosF0mAK3K1E9IGvr28k/r3xBx5aUo0AWZH9zvtnSUQZxvT89y+GnDF9uK5a6N
	t58QDKRqTo7DLk8zH4I0iLb3nsuGf49QU93y8oL0c3hbYM0lkuza7r82hf2a7tx9WnyhH63PpCgBe
	r22AbjNxQWO0dyVfl3OSVezrXBa0eqWBgNkWzOPu9pZDl+91muxvZhO6cLxPSS8/KJ0Nbh9KqYO1T
	VbtcqIcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxgY-0000000Gj97-1xGT;
	Fri, 27 Nov 2026 15:16:26 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxg0-0000000Gj2l-2fUx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 15:15:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=La6LRR6QUVJkthMn3KPcLMo31TCV3upyszPZJEmlZ5mQsuYwvNhuMBD/DZcjducwt5FEbCBNQChwtduyF6EKB8aTJj+ckTm6rYu2UskJFv0WZ6gXXfCwFelN5hkUmg500Ov/VT42fwQeFM0XLwhSL2HC+5ZMk8nfai/l4PbiLH7AH3cVPOFBgQxfr9mmc864OzpziTXBckWrPu5NwZnpqU2zbfSy/3G4/7jbi1jtvKdPuCfGhJ7XIQkZcueZjsAmx1t2w/eUNy1s9N/nPSo6DstL6qqHJz0LFouvQ7Ths7ECNPzan4PgDH62FpDqjgJNudiJ5mzLfuOD+DHPa2bwTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AJ/SMs5/tA3Aw//lrGhfle7qO8ScqhS2hToiALSXWA4=;
 b=MkKnBdDSnI4o29I5jPfhGJWjC3VVF7FhziEJUs5LHqYKg4wnPn3aDVIY3fy+VTulk4RF4sH30ti2/K+L5Uc0WroNZUtipD7BlRrEKcVvUv8mLPD3I9isnXwVK/B5OsHmPqZkmgtxzCaCXObd+9dXvptPXmX3jX/xEAqWx7WxB1nRsyYg5tTeB8GNIqLzDED7Q2JtqPNGR3oyPMNtFX6V3BLLW4fVSc6j65gk0fxWfeqcA58xoICq52Amvwp5hkAgN/jgkQZmgQtPyLmQqWJm/91x2Vvy22gnFTS4VV5XIPdD+ZFQ827TurmBw2A5HTdBMJgaf8hKYXJirglTJf0qZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AJ/SMs5/tA3Aw//lrGhfle7qO8ScqhS2hToiALSXWA4=;
 b=mmUVLVlWIkFJAIO035u7BNMn/KYC4tCyGJU7fl4yhnmXD/t7Q75I5yy20nVmjo5X38MkqJF2qkHYC5SRgTwlFerK+lAMA8DSHx0oV1IHUAzTketXrmdrm1+6u8NPYSedAlGyqOTTcyKzsdyrOZdmVnhPh5QxiulxzilfSYUZiKVErA/Zlai7m5jnkqYXYPskz9SdgkMpvLQAthQ5jwamPPr1FiH29QliXCN0jmLS0UWtJpIzGCMc2YcwMncwDaWQG8biEWpX2wnE9EZSaia6V1xoZCM8Nwx+vJtdpgub2KYjAMP8maNE7+dTndvLbc4wIdakdMA8CkP68z4RNE86PQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by MMZPR04MB619844.eurprd04.prod.outlook.com (2603:10a6:190:54::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Fri, 27 Nov
 2026 15:15:48 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0662.004; Fri, 27 Nov 2026
 15:15:48 +0000
Date: Fri, 27 Nov 2026 09:15:39 -0600
From: Frank Li <Frank.li@oss.nxp.com>
To: Tian Xuechen <202300460064@mail.sdu.edu.cn>
Cc: amelie.delaunay@foss.st.com, vkoul@kernel.org,
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
	cedric.madianga@gmail.com, pierre-yves.mordret@st.com,
	Frank.Li@kernel.org, dmaengine@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/3] dmaengine: stm32-dmamux: Unregister the DMA router
 on removal
Message-ID: <awmem4rf9yPfggMa@SMW015318>
References: <20261127113332.390552-1-202300460064@mail.sdu.edu.cn>
 <20261127113332.390552-2-202300460064@mail.sdu.edu.cn>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261127113332.390552-2-202300460064@mail.sdu.edu.cn>
X-ClientProxiedBy: CPAP307CA0005.DNKP307.PROD.OUTLOOK.COM
 (2603:10a6:380:3::13) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|MMZPR04MB619844:EE_
X-MS-Office365-Filtering-Correlation-Id: ee2f7292-ab72-434e-fcce-08df4c9950f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|376014|7416014|366016|19092799006|10067099003|11063799006|4143699003|56012099006|261021121427099003|261102123227099003|261009223027099003|261026140227099003|261022075727099003|261022105027099003|261028144727099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: dCVYujlLsY7dHnia4HNtcuMIotDPQZ/jyI1qLQ61TFIXswLxqMG54sbgsVguu7nvOu2dcqcs08oe/OeNNnPeT5P0zwao/kozZ6yo8SSShRkbBtd/eLAM/GcOcON2V5R+j3Y7ljxzSLhRzAEsIcS2dbwVD6DyqOwfe7D9kLLjz302AwugEmpbGgEcUnKeMBG+1irPxBIYI29j4TReokEJG7NdSUbiIc6xmGJu8CyNCvx2+zX4fDbgRJZy/ARkDWAMBpCFre2g3w6l2ae9hy+Z2yCkauVPL8mZdBrPUI+idwGEYj+kWYZGM1wmhg0aQ1+VXRPLmqf3779GwEu35g2gmQrdUzl8WIJEPOziEiJNORy3Fdhh3wzff9uPOgn4Cx5WWAgaQlVQmxNlIaKaRTZN3QcEHqafRrgG+cZTT3jDyMKzyxtCEXOINkDVJo9wNkH/Zk7x4IhmP49kLZ09mOiVMFKyCFnMh4OVPqbghe9lI0pFzIOGoKY2DKsKHPfWN2XTmZR8irIo4epSa9h6nXSGOK4M7BqTIP3FCrOmuAd39yMUxE46xOfpVMh9T6NIND+4F3Kncna33ToF/2Llvussuf0gdiJ8cOkd36FoHz5n0pZKZm+Uog4i43JD4DVjjxDxsTUCGAj3BHsgVYSy/roDMb84pRas7TR8Hw/spgvZ7qM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(7416014)(366016)(19092799006)(10067099003)(11063799006)(4143699003)(56012099006)(261021121427099003)(261102123227099003)(261009223027099003)(261026140227099003)(261022075727099003)(261022105027099003)(261028144727099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0VqeX7yKK978/Z/2JEjfKdhscVPFx/TqIEz0LJ4lW0lNFrxgXW5wHJ8X+rzM?=
 =?us-ascii?Q?7ClmFORudzXHL0ty7siCvsYKCMF0n/gGH8MgUiQS99KBjmEcSW8whveS5o2p?=
 =?us-ascii?Q?G7mFIhJ7ZUglKJUpbVrVQxil8UYOle8kWkRKupJwqFA5d950rueQ9m09v7yR?=
 =?us-ascii?Q?aOBvQqBOV2NMfSgjPFXrRGeklaxWu94/vHGXUJ1kETKE1Iduz5+s2jHfg2QW?=
 =?us-ascii?Q?+oCgSD73ntFK6nMqD4L3i9PBScvxpUeDavwcdZWrUO84IX1TI74qOrRY7zQC?=
 =?us-ascii?Q?JZrTRUhL//8dKFVcFQX2aVDQTekIMyG7yBFe1ZUe7G15hANZKPnbUwQ3K74l?=
 =?us-ascii?Q?BbDKGyRvws/L9AgBu0EahCQHN1eKpiBCMVMmMOlzpqId/u77d4H36Eb6wicm?=
 =?us-ascii?Q?QEOXCYoa8273eREf7ykWcjybFEuPaxZWHCSqsogMeZEHP1chLVpALfpXCbEf?=
 =?us-ascii?Q?+skiCGFIo221/FO6VwydA4aLBWlX4e3AarKx7FA8ptdlRR0iBgwXj9j2GRWd?=
 =?us-ascii?Q?e7I04Cw+sTwtDCwzqzQy1wvVCPw5+mqe8Fx8l0WfuUnUAo3slpsP9h8pavuS?=
 =?us-ascii?Q?mBN5nCzR9bJb63g1upBtPaDBj6nPfuwJsL/menvKV7Er+ju1/ZhiydvNwTI6?=
 =?us-ascii?Q?RMbmZCsKwCdtlbWGIv7+hV31vNmS/kI5zpQa/GGtY/2EBgQLd2vjwppGaFSG?=
 =?us-ascii?Q?36K3slKnHrfvfclkCwEPrbkI2iwKe4SxQTmfYMPbVYtDEfxG9vmwZRe2+Vgj?=
 =?us-ascii?Q?oXGp/zB6TbHgIrISekqrbcYisRJLEN4DlWjvnCupnhstRz8pPDUochbGTAEf?=
 =?us-ascii?Q?gSWzlKlZMHxDoFysYzjv5HzhS0bGaYegXXnAFgsEmF8IzZv9cweexJALNorO?=
 =?us-ascii?Q?BjuWv5qqC5JQLJm9DCKkT1IoMSuY+/BMgNMd4O27uqFd8JD8Y9hl/a28zblu?=
 =?us-ascii?Q?EWJnPFKbRiUlcBC62aVIG/jHGwKCmPPiWZ4fdc09fox2fA5QNGUvjOq7tOPY?=
 =?us-ascii?Q?ow7Cf4J2I85sRaiXh6dLAkFJzpmQChMQnxm+W+luGKyGWTZ+cQ1ezKUuKTga?=
 =?us-ascii?Q?nnS+9769GFtjE/gQz+Thm61vZPi6fOf8HvsPS9ukq70EtOCduEkt2OibPHO1?=
 =?us-ascii?Q?D7GrvHnktmfpbyJOoWMTimHq0N3h8l4I4Ds3h7T0B6IGa8GepHQCrmYtURcN?=
 =?us-ascii?Q?zRSyU9cF+E5LnCeVB/Qdceehhyz4SCSk3NetaEQ3F3VBXEsMfkeRIURwX5Iq?=
 =?us-ascii?Q?umjjTrxBmYYaFhSY9vI1FIoMRSszfvrJyFZuDKPSb55pV0xTiD8pSw10ofaF?=
 =?us-ascii?Q?5CDRBcOrYQFuVAXBSPSZy2BEQTDaGZgKeD12T4o5Qd7p/DlwQ03D0lz9O1bg?=
 =?us-ascii?Q?9chPfY7Rh7GasGPEos46B0dKFWP1RequhVjEshu636U5NwmVRm+DF7UgJizu?=
 =?us-ascii?Q?MT80xjOjRNM5ZkpolqgT9e5zGf80wmm1PbBSwklwTva6tXZ51I3lZT2T9h9p?=
 =?us-ascii?Q?uOMqn+oLtPU4N4ULtj/evH0vaxhRNJmqEVA7SPSv3hewVokq1ggk8HbsvckY?=
 =?us-ascii?Q?lYpM6gabzlpOO7IklMMd0lEITVPrGuoZcR1vm4E5Aw5dN7CEeRmQ90hhQ78+?=
 =?us-ascii?Q?VU96rFTkn0cbcMzjbPsd1K4wsozQZRFKNCpUW3HrYxWPsUzFBeRWHUAQQmpK?=
 =?us-ascii?Q?ZjtNFa7vF+S305EdH7+W5XuS7BCvVVlINfrSC56vPwsGeVeCez/ASFP/RMMj?=
 =?us-ascii?Q?OO2WJ6L6Sv1nv0nYyzBZwYuQ1pCQuXW45hbi5nO9b4pNHdZzTI5g?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee2f7292-ab72-434e-fcce-08df4c9950f6
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 15:15:48.4282
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5R6OncxCzyRkS3aPcp5O6lSIszKtM0Nwn+IZW/Qye7bxbuSIRdNhX4uTUMi3XNJzPq0icLelKk/z1CgEA8IyNY9BHMaKSobTB2ufadjQKO0iE4rOsrKUSNtFaYaq1IzP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MMZPR04MB619844
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_071552_683031_D76EC063 
X-CRM114-Status: GOOD (  20.20  )
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

On Fri, Nov 27, 2026 at 07:33:30PM +0800, Tian Xuechen wrote:
> From: Tian Xuechen <202300460064@mail.sdu.edu.cn>
>
> The DMA router remains in the OF registry after its device-managed
> data is released. Remove the routing entry when the device is
> unbound.
>
> This issue was found by our static analysis tool under development.
>
> Fixes: df7e762db5f6 ("dmaengine: Add STM32 DMAMUX driver")
> Signed-off-by: Tian Xuechen <202300460064@mail.sdu.edu.cn>
> ---
>  drivers/dma/stm32/stm32-dmamux.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/dma/stm32/stm32-dmamux.c b/drivers/dma/stm32/stm32-dmamux.c
> index 57318715d9f3..6f49d78bfe3d 100644
> --- a/drivers/dma/stm32/stm32-dmamux.c
> +++ b/drivers/dma/stm32/stm32-dmamux.c
> @@ -389,8 +389,14 @@ static const struct of_device_id stm32_dmamux_match[] = {
>  	{},
>  };
>
> +static void stm32_dmamux_remove(struct platform_device *pdev)
> +{
> +	of_dma_router_free(pdev->dev.of_node);
> +}
> +

Add dev manage API for router_register()

Frank

>  static struct platform_driver stm32_dmamux_driver = {
>  	.probe	= stm32_dmamux_probe,
> +	.remove	= stm32_dmamux_remove,
>  	.driver = {
>  		.name = "stm32-dmamux",
>  		.of_match_table = stm32_dmamux_match,
>
> --
> 2.43.0
>

