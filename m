Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 499C8606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 03:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JfABzLZZ;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=k5G8k/3M
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=choWQspR+ceK3XYcj8KYmwzhiabu2Ugnz+L5e4fpsQY=; b=JfABzLZZzLSzlA4f2c3vULc+hI
	cke1wcz2ddkH1wjLOIqDqvjkKDt9jcOtnqc134aTjJuEQA47Fn+z0vPChg4jjrOYe91OiaUPzIOH2
	nROJ520BOyc9y+Xfkf1mHoNmHijZqUmQL9KhQEdUUs0lhgEswmLQ6ZHtIahIWebXXRHHwlQ8Q70eP
	Ibf4WAf/dKmMsvX1p2ZIwGMvZpA3pIdsRMWXBS6P3xsoOf9/E2iHFaC3FawR9pOHX7h1g3gr0mwEr
	LQpkNMIzAPLy/p/cr+TVyEMIu8TvNWnxxAwiYQIn8bj+566JQMzvYz6z7nYkUV+1VqbSw/vtVkTwi
	o26krgzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRLZ4-00000008cym-1eq0;
	Thu, 12 Nov 2026 03:33:30 +0000
Received: from mail-northeuropeazon11011013.outbound.protection.outlook.com ([52.101.65.13] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRLYz-00000008cxu-2DCa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 03:33:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sBnHe2Bb/kffVKXDr37dnNSQ6GvxexieZOf7U4UKfqjyN14uSZ+Kcu92mCb+nYBoQ+0w9DIhZYNULPwcpB/9I7e3SA4sRFTgzOvxdXOwgu9UHBdfh1l5B5LiJOKwj0fdNhKpOFUmVDWXY12F1OqK688pWUb5nCZ+MJM/tD928gop5e5TWck0HLIzx5HOQh44nB/XwLPoCBBrRZNV1HvGVOhXLomi9ZEBAP6fvsSyRr138muZKxQnBTlMPSVQHd+Xde51kzo72RpG0wWXYmifgr1F/8FlCR/96SmLjIo/6XZN0B51ZDrv7ThZLcunWXcVEJrIBPpRFDWzLQXH/48veg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=choWQspR+ceK3XYcj8KYmwzhiabu2Ugnz+L5e4fpsQY=;
 b=KzP+OEwkGORvFTfJ4oYiP6rvRnx2l0z6s1T+zbTlrgqvDRW0hHoywHE3YGnfPoB4mfUS9+OoR1q5QQbRKuYCJWbvwmsDQwH1IQSmN83IvqH33psczZNqpZqFDrx3yaKIXa/Hlp4y0TPWdtM/OJtb0trHxZ5PMA6fxlroymVF1dqg9tJ9MT6icTvvFYh5IiQozikcIMVKn70cV/QoHkgMzD7sesNyNZK+7xjuafvTW+AsNlHp2sBUsYWFtDzmhqBl+i/QZTvvIhKkzzGj+9D20i9oZMSfSOdg2kSSSveeq/JJ31g0HKpXl9xAbCmUhjYlEIKOcdsiCdOZxAAGPW9o8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=choWQspR+ceK3XYcj8KYmwzhiabu2Ugnz+L5e4fpsQY=;
 b=k5G8k/3M9AsYdRnqXKFljI0+3OAY3zAiI5Q2WVUNxQUWIsQNA8TlVfg9SxxhInhUzwUDSSqyP/M7+zXcbwr8M/fUd86WlLJs6auOmS8loK3HrP/vopHOqoRtN2VKOouxLcDwrQwBTbOlMrMgtLMYFZX/zr79te2YgGtnp8rWqXBiuloPxt9Q480sD9316gkxxC2fBsa+CJNWXfW5T1EuxLWWNjuzuPbFWdzMde2BhuayTPL0mWNQSf+6Xhlv9ausD3jXBHErpIfiuahpHtIcqKDwn/f3YFgj4VQdzTGOw2F8FKQBKkEeYjZ6FctgffqGVTdIdB2r01XJOKWh/QL6Cw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AMBPR04MB12445.eurprd04.prod.outlook.com
 (2603:10a6:20b:75e::21) by AMVPR04MB12674.eurprd04.prod.outlook.com
 (2603:10a6:20b:775::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Thu, 12 Nov
 2026 03:33:19 +0000
Received: from AMBPR04MB12445.eurprd04.prod.outlook.com
 ([fe80::ba23:1fa4:ce58:ff06]) by AMBPR04MB12445.eurprd04.prod.outlook.com
 ([fe80::ba23:1fa4:ce58:ff06%3]) with mapi id 15.21.0615.008; Thu, 12 Nov 2026
 03:33:19 +0000
Date: Wed, 11 Nov 2026 21:33:01 -0600
From: Frank Li <Frank.li@oss.nxp.com>
To: Joshua Crofts <crofts@kernel.org>
Cc: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Chris Brandt <chris.brandt@renesas.com>,
	Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 3/6] i2c: imx: remove redundant
 pm_runtime_dont_use_autosuspend() calls
Message-ID: <avUzbZi8CdjfKhCK@SMW015318>
References: <20261109-i2c-remove-dont-use-autosuspend-v1-0-49a08b8daf36@kernel.org>
 <20261109-i2c-remove-dont-use-autosuspend-v1-3-49a08b8daf36@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261109-i2c-remove-dont-use-autosuspend-v1-3-49a08b8daf36@kernel.org>
X-ClientProxiedBy: PH8PR05CA0005.namprd05.prod.outlook.com
 (2603:10b6:510:2cc::14) To AMBPR04MB12445.eurprd04.prod.outlook.com
 (2603:10a6:20b:75e::21)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBPR04MB12445:EE_|AMVPR04MB12674:EE_
X-MS-Office365-Filtering-Correlation-Id: 2398a880-7004-40e5-02aa-08df406db1e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|376014|23010399003|7416014|1800799024|366016|18002099003|22082099003|4143699003|11063799006|261026121527099003|261022075727099003|261009223027099003|56012099006|261021123027099003|261009223327099003|261009220027099003|261009221727099003|261009221227099003|10067099003;
X-Microsoft-Antispam-Message-Info: TsT+xMbOGrG7oqiHkKcQni6CrKMU6cYqBQZMvkbWkdKyqm4gOJbhFn70jVGbedI4jlzYFWIahDqIdeOXkhgnPkEUjqVElTAb23w+OGZUjNPOsibbxSgqhC/jkdUwvrN3gUhfsB11tMV9iWOtRmaBXZAm/iEJPN1OrZ7LDmkJY6m+XRMpvy2OcBVbeqb7HYMDsfCh3jJUeikOliA6RgCr+ZiNsHl4AnBXm0kM3qQxgDWtn1k5Sd94Y3yr8vFo9WCTcucD1TYXVM85CynTG8RvzQkssWVEtSkOmKgyg3JLxSaySKigU48jOWzpuxAxLuL4u0/UQFuy2tkAiGrl/AFnFd9HnhlGpfkcYN0yjeUmNwH+GadYUZcrjZCQOEoaeyQAFkTrd5N9ovZKN13SbCNOARLU+7o//e1gm5PXx+c7Nj4ZVSi2dh/tfGvGcfqCjhf5fm0PusNwIuU3OCFFUQNAM8VKm7l7R7gU4qTARRLKxdaaFNqZuV7opHJU4ubM8u2kqfzypu9s8dujXt8ppxPzRR4sy95nwEQU87l4Xn3bWHsHOWBouy14yZt0rY5elDT3v8NMf/HuPzepQTSC2UfVIvid7JY5cfuN0TbfjkdX8EH75C3gvQeuYVY7G3FvVGWZIjas7WvBxhobTMAd5AQC8x782RxIsSNpTEXaWKd1Hts=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBPR04MB12445.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(23010399003)(7416014)(1800799024)(366016)(18002099003)(22082099003)(4143699003)(11063799006)(261026121527099003)(261022075727099003)(261009223027099003)(56012099006)(261021123027099003)(261009223327099003)(261009220027099003)(261009221727099003)(261009221227099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OHEUJOkkoqa1VJGewuLzSWDAaa1nfLoOlcHNBl19CRlQaVfiqJCI6GMpPtYb?=
 =?us-ascii?Q?zQcYFiAEW0ESaoFitJExy0ikk/3L2L9GFKuI0b4iWywX1UMNlTs/Tzm/tk4e?=
 =?us-ascii?Q?LF2kV6Yf7br3FBX8O5lafp7UjpDYRMwiSPGWUKc5RVqU1/sq46WjVkLC/Mmr?=
 =?us-ascii?Q?8GrHRnWtJpKYy5Zp9y7w9XWt6zL2T63mYejWZB6StvLV90TrlgP39qAnIsfS?=
 =?us-ascii?Q?qRz+LJucTd+5DyTn3aiMVNiOzE5W7bheU4YAzwVHoNgD6YuYIiQ3ODuEMqwV?=
 =?us-ascii?Q?EROcQFwplVwh3kYa9nyDbeaDg03OC3s3VyG/PmbZTq9B2TU3vjGACeAwlYum?=
 =?us-ascii?Q?CgnYjTHUac9wf/WT4ePD3PSbJ2MqyUg1AVsGnbYpq/L1yz47LUjgurPL0uum?=
 =?us-ascii?Q?PiHi43y6QOcmEM2pzYJS3v0rNqIjowuhgI0tuY8G+M4pd5LbjLCekRnsY7Ky?=
 =?us-ascii?Q?G21yNn2vw/vxj9AyDRQB4Z9o/CC9syd2OtPFTWZMQmiW+qQbSliC9MIf8KtD?=
 =?us-ascii?Q?JIFAoTvq4isB/y9GiJy1HEZMiwgdWb/5QTBpI7sR97XW395OrHmdwAr5P2v3?=
 =?us-ascii?Q?OWCD5XqUCtZ9Iw/C1mCEKjzHNxk8SWnC8AJzFUxvCnhz3NX9nFdprvbQJ7hr?=
 =?us-ascii?Q?r9MjWioSmnMTCgUdRzHWkmiSxBVT2M06zzpVQhSToD/Cv4w8GcymvN4R3QYz?=
 =?us-ascii?Q?MrqJ0NAMFJpYRv9dnRDo7CQKARjO8d+Uijfmq/BVf7sz1VX2NSz5sO3XNsXs?=
 =?us-ascii?Q?KNZTFQB1BV8DsaRojdsQiVzDIHjNtAtaBgmHcfX/zux8lvGQ5FCnCu8J2V0H?=
 =?us-ascii?Q?qvIcITtH/vX4mcQmZuOUW4Runq4RgF1t4qeJhl+QK06rs37LShW2IhuAY/HE?=
 =?us-ascii?Q?Di3IE89u2aEvr4W5//Qh9aU8I9EtoLjfX399eMkOaIErHhnIA1u3vlBN1CZh?=
 =?us-ascii?Q?hOcR/+ep3Ob2dMQg5SAaMKfecXHujGNFnHctpSGs8GFzo5vPgzrbUKFKhH2C?=
 =?us-ascii?Q?m0kvDiLdOm84vON++zo2Swr/W9Yb6ExSVMl8AOydT0UYdEDNmHj945yIN/od?=
 =?us-ascii?Q?TUE82PQ/Se5qkc4DKMvKVNCsYmSZOe5wKrsrENstCMH7C+Oi8IYF7fGNyy0O?=
 =?us-ascii?Q?hcPfXTWBYdhSHtz7qVXsR9A+TnLNmXm25XgubZVN53B9X/5PvxSt75r+OqMI?=
 =?us-ascii?Q?pKhsao77PzQPBcFmmhBcbAOExdJz7jaSBkW3PBnNeXxz3wrs6JBM+PeKiChb?=
 =?us-ascii?Q?U68sLmpEZbrVll31Zlhpg/N7UVg8aMjNbn9iIszdStT3bjTIefcfApGJxYuL?=
 =?us-ascii?Q?oixJaLPGu+9pyjfTCnGA9nYLycLMcegqXv6LWvrpW7SG9iEPt7tS8oBG+aQs?=
 =?us-ascii?Q?eyfIbCkIVafGUhfSDTJcN1C/M55emrjiW5RadivZ0Gp+OLiTkaXGFh0Cx6D2?=
 =?us-ascii?Q?aGfZXv3B0NE+4mrpeq4Kv9JtJ8mHnmoYp/69t3D5CHF1v0xqnCgwPskY9QNB?=
 =?us-ascii?Q?I2Vmt3uhPQ7Et8GfSkgdX1pcUYyggTPR9zUk+BbBiDA+STcQ1qcwiqlIpolF?=
 =?us-ascii?Q?zfG839JDp+9UjsD3oyw5O40iNwq7Ye6eVYO0qTyIFzMoCSkGFJfW6pzGjoK0?=
 =?us-ascii?Q?4Et7WRZ50Zq0kQ5THwz6Z0vz5vUvY9Dlb7ZaXPd98uAr7BqAoRlFg6vUxxpg?=
 =?us-ascii?Q?5JLat9QZR/GzI1x3w2kHoGRWoW9ZJX7jhMdi12Faw2IOBHFskcQDwtVmEknZ?=
 =?us-ascii?Q?f5MCM63OCGnAxZ+uM7xhtq1GqtVX3WsmL6doqDHI4vue3a2UgbKI?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2398a880-7004-40e5-02aa-08df406db1e3
X-MS-Exchange-CrossTenant-AuthSource: AMBPR04MB12445.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 03:33:19.1977
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GRlxQIoqY4zDR4m2ko/0a17rc3VvikpPT3ivhXUsXYwIx1bbhe0jGncr91NfLZYqnEpLr5dXx8YsPugM3uONJ5TY9g8Q4OSAM2WfOliIGXPNJuy7A1yShb/hF7uNAD+m
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMVPR04MB12674
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_193327_456793_1F8D0DE8 
X-CRM114-Status: GOOD (  15.30  )
X-Spam-Score: -1.9 (-)
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

On Mon, Nov 09, 2026 at 09:50:04PM +0100, Joshua Crofts wrote:
> Since commit d1706f9da9f4 ("PM: runtime: call pm_runtime_dont_use_autosuspend() on reinit()"),
> driver core is now responsible for undoing any
> pm_runtime_use_autosuspend() calls on driver exit.
>
> Remove the redundant function calls.
>
> Signed-off-by: Joshua Crofts <crofts@kernel.org>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/i2c/busses/i2c-imx.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> index 89f2b764bbc4..05906ddafbfa 100644
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -1964,7 +1964,6 @@ static int i2c_imx_probe(struct platform_device *pdev)
>  	pm_runtime_put_noidle(&pdev->dev);
>  	pm_runtime_disable(&pdev->dev);
>  	pm_runtime_set_suspended(&pdev->dev);
> -	pm_runtime_dont_use_autosuspend(&pdev->dev);
>  	return ret;
>  }
>
> @@ -1999,7 +1998,6 @@ static void i2c_imx_remove(struct platform_device *pdev)
>
>  	pm_runtime_put_noidle(&pdev->dev);
>  	pm_runtime_disable(&pdev->dev);
> -	pm_runtime_dont_use_autosuspend(&pdev->dev);
>  }
>
>  static int i2c_imx_runtime_suspend(struct device *dev)
>
> --
> 2.56.0
>
>

