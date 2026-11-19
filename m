Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF43606A330
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 02:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NeSnz5MG;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=BaA89z+l
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=tAc1TEw8vdXkBFdCzuB5VBM446mg4KC9+A6Zmn/SpOs=; b=NeSnz5MGbD9y7yh2bho/4Vaann
	nDbAFWXHQTdQ7Gy6wYEZ8ADIsK2yCFlH5hz7XSmxd5nUO/VADTENskYxJ2dTo0RRCF9Nk3yKRgit0
	DDzZCBeTmxp0kemOiiU0vj+zqzYb3XzNI8+xDjmgSfTR82fWLaZwI+3OgCmVBAFXM7kc+8IX60EqU
	sHodMMEgir0cVwvZPJIZo75wJIVQ0xkH8IC2rVKcJsEbRYmB9Gt1rF9Fn6Fl60DhDkeAkkntEXYnG
	jGJzJguYAzPMxueXNwkO5/mN1v1SoqUli17SzmAJAlPxj5JzmBLc1+U0FtNr2MXFN+bCaI3kZwBmx
	VVyJfEbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTsCw-0000000AiDg-24Yn;
	Thu, 19 Nov 2026 02:49:06 +0000
Received: from mail-westeuropeazon11013041.outbound.protection.outlook.com ([52.101.72.41] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTsCt-0000000AiDD-0WWt;
	Thu, 19 Nov 2026 02:49:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mz+9hm4a4dalsyLgysrCWgd5lxPNNOeHRvSS0baB/sSbRkctKS3mcL5sEcebQ+wDGAcatJvYWBWSvOEz9dafyIl9mYQ1aetE8zE71jp6HUXlb0aZBwgn7TQgKWpBaic+zeBv1+4FtT3JmWrLOmcnEZAOfmUmxlp3oX/k/Eo+5xBdfEcoYhtMzWQ4oz+qECAMELhVPREWDgmUFwTHNngjcZg9oktnfhwBsiJ4y9CwF8p6VcA2F20Y9POLQ7jmAY6UcDf8FkjGtAOxZacBgjEgnX122C/4AUkIPC1MFnLWJcFkh1P6DDZ3bKgy6IhEPYTDyoTxEYQfEdvR1Qsghr0aHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tAc1TEw8vdXkBFdCzuB5VBM446mg4KC9+A6Zmn/SpOs=;
 b=VMCPb4DRA4T2DsmSsAx1c0mJsIzJDQ9ajmuRUJbtgfvTVB28zpq+BXTxZmrSBleKuvfEUaicAnc+7T77uJq/EoGb+/FiaRWVumgJ8I81m1leWk+DORqdsnMwFm0de361U4DuX6PGOPF0zbyl71XPGCEYGZGcyJx3oJBAh4uoZooTGwZhCPyJLT1wriTT9E0a+MpQkEkVGf+YY3FAOiOVfpbDHJow/3jaSnlJBaSnyAmHXviICj6edmiMFAc5MZKRg9cTVLyWRvy2bL98mZrbRmzd4eB93vb/TAC1gWmkXjq/W/WK19SM8Pod2H83loMwK1WL0DNt8lNMG/Pn9wgVkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tAc1TEw8vdXkBFdCzuB5VBM446mg4KC9+A6Zmn/SpOs=;
 b=BaA89z+lIy19tXmJLmaUE3d27oc68JsPMfiNuaBYxoO2H6BfBn9YTeOl4AtLAhDN3OUzVtbIx9DuLkKrt5MT0I/2hc3G8Sv8odnO6IfLySerdls6f7eKoXIjIPlwPKeuV8DGNsAPALfMLcUFYCXy36xOOjVfA+z0PVO6MxjlItDP7cxmCz+G+ALtj6BErpAi4F9A2y5tJL0+5tZL98VKHi+jlzeq3EQ1h6ir5hsMD5DoVli3KMqw0MLE1JJTGb78B/qRMW4AVnAIkghBxu0GPtwlFvcrkp1bGR549nxswQydl2J6HEQhLxRYDJAvJAUVf38ABtJBp5x80rJSlPz0TA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by PA3PR04MB11204.eurprd04.prod.outlook.com (2603:10a6:102:4aa::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.13; Thu, 19 Nov
 2026 02:48:56 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0639.010; Thu, 19 Nov 2026
 02:48:56 +0000
Date: Wed, 18 Nov 2026 20:48:46 -0600
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
Message-ID: <av5gYARSM54QKjxm@SMW015318>
References: <av3_yVSq9CKqix6o@SMW015318>
 <20261118222230.123431-1-tomasz.unger@yahoo.pl>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261118222230.123431-1-tomasz.unger@yahoo.pl>
X-ClientProxiedBy: PH8P220CA0063.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:2d9::27) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|PA3PR04MB11204:EE_
X-MS-Office365-Filtering-Correlation-Id: f930e8e8-cb44-4faa-02fb-08df45e7a7c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|19092799006|1800799024|7416014|376014|22082099003|18002099003|261021123027099003|4143699003|11063799006|56012099006|261028144727099003|261102123227099003|261021121427099003|261009223027099003|10067099003|261026121527099003|261026140227099003|261022105027099003;
X-Microsoft-Antispam-Message-Info: TcwRhkABc2IUXBDGcgyfAONUUHHSRbKKPEYWTb9ng723WiM7dMzc2Ru6CKKbAqQop1ufdFJQ7M3R/QurtgWUDUEbS7K+iS1Hv5JlWuFHdZ1jETo8PlCVS426YVrHstTYUijrZnqVEG2d2smF0kbSy3zKOwKTYlTameinjCgJbXAWaTkvxpSdpCNn+EA3+a2iDl8gKx++jrlRqxN6RcprD0rSIJXKIIqkD0kqCBUlMxrr/xLwDvkf1KzhcS+jj3Ua6ovEl3bxfJ7OK84yv4PwmAU7P6TVkc55RQFPKg3KsReejDJlcRIyW8O62hE3q+zqvFfNU0kyP/ML4o/ciNFGxT65aIpxxC2bboih+TuuamaE0wIe0nZnHB0M4h2G7+2dmKKhEXER5iKxRNb2cocFo8Ak2uD7iqutAzi5CP5HTBNOOYVWHwIM+WBJnP+39t+oborx23rm/dxPIl/HJjNv9nAPGw6aMJMZP49TL50ZE6wwRBDyOJmbAafKVL4zlskPfOll9samm2QxwXg87odxflaXWB886Wo9e5cYv69z/mq3X9YAIMJDRVb3ux0MMISQXiM/tOgbJ0jCE9ZYJWyAodQHxXil0BCMvZMSqa4M82DY3KGJVFgZYVG6ciYtKMy75TTWc6bTRjAsA9V3cc2ObxjWfteVucKZutVwkkwDtqU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(19092799006)(1800799024)(7416014)(376014)(22082099003)(18002099003)(261021123027099003)(4143699003)(11063799006)(56012099006)(261028144727099003)(261102123227099003)(261021121427099003)(261009223027099003)(10067099003)(261026121527099003)(261026140227099003)(261022105027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TGah3uQ5Xbm4RLpozJtmzqUhJRnZ3HFjeQCodip4+ezNYdqZVPJqgHP5XvHz?=
 =?us-ascii?Q?gmhZPCDneEfZ21epnOTraXW/2+b0LAM599lICYDfhHKqqqW0rAtO3gUPakSg?=
 =?us-ascii?Q?EPwZbHTsOscJYXA/CXqCKyEmGtBiUPXkMb7oEX5zwcndIA2K+axbI9sHsQTZ?=
 =?us-ascii?Q?aC43Lxw+ydKKy8Ek6J1s1LANSZSWPAnxV2CEcnDgzEkG25f9SOs13RsgbWYg?=
 =?us-ascii?Q?SvCSyzqXTpeboMQDEj6eiragb02kuJHQ9YYjRHw6LNsemT9SPHs1VdgpIdQ2?=
 =?us-ascii?Q?CWG9uXz3hMTEhxUh/hVbw7KuGUjaHNtVe1Yl+oTOkbL6452PYWfsbf7dp36W?=
 =?us-ascii?Q?cS2pxcVmvQKiBgTvCD4D2btTrFsjiY+WJM/+eWgzEKciEcxYG7J6dGrFzYTT?=
 =?us-ascii?Q?0LLvHkhqgpoQEbvXzxapKG/2O6pEWwKGudCpsNINOQwvrOWWGTWp9brJmv05?=
 =?us-ascii?Q?9bIHHiex6fOmxY7K9l8tkjxEeStb8toKF7cZ0L1EbOUeTqlp0GHnDEKIObe4?=
 =?us-ascii?Q?LB53wR+p9J8PiLgAFalufU17YlcrQUiZBdLVrVVCS7KHomx8suvxqwhQjilj?=
 =?us-ascii?Q?yc3Ur3qwl63tRaINUl0Yf5j6EeW0howMhgjmIR+ZmNk4xwWku0lbu3IZ0WZE?=
 =?us-ascii?Q?if5CfQzHTl0uMR5FsAGNeZCK+NqbwghSZ7Rvrlgl0sT+C6d2OQREW7r3LZ16?=
 =?us-ascii?Q?dHviBatthPNj4B56kynKbt+5GlmZNXhJUL65eJZEJj1+VLsffsrpP47pKs1Y?=
 =?us-ascii?Q?jAs2b2j9NTc28XSH65M2tEaI9/wIdAfjHDyEBKTuDPGXWyyy4RiS0tIDOi98?=
 =?us-ascii?Q?MQLnpoKXyOWX51fZpxOjyAdXIpuUMrz+gNWbtyzjaXckp95MGfCxBiHZAK5h?=
 =?us-ascii?Q?8X27ZcGMm2Y0ln7EqJz7AYoryI1ur2oNabGJh+eFda/gX/VLn4AtegFDg2kA?=
 =?us-ascii?Q?m5e0vsFmHuQkglERXYf2zaN+IZuzELJci+7+cW6heKq8WJjJNY7dROCgTJlZ?=
 =?us-ascii?Q?Nni0yYsUV7+qyM+hJtQ2KVLtZ39RxUsFObCoU9KLM2iqGJ0YuW7IjAcE6kTl?=
 =?us-ascii?Q?yQkcLyqIIh0HSOqqOygDwVI0YDGOO0a0ckT3gdigm2BYLVKlqmUGHLnFwc+q?=
 =?us-ascii?Q?Iua0PKzpWJdB/Ne9vZj1MrNQgjSrAD/Qe15Qu7sNeZ2slcolS5jUGY1I6PVW?=
 =?us-ascii?Q?IUEC0DJW1pQbuyLTxNNdD10Zeg8106o/zzfTCIROLoQnuVe8cXRVxPVrrWhX?=
 =?us-ascii?Q?M53DRHXObLoAZWJl4hR8dp6V061nmsbQHtiMGr9/fQsRLJupavU0pR3JJG/d?=
 =?us-ascii?Q?Xa21vTSycZRAotkUf+ejPrJ75QUOSPUbNh3iNnCYA/vL2HID7kAr0g+FfPCe?=
 =?us-ascii?Q?8oOsounqYba9yEXxAs8bFkt+Za0KAARYcLdCLUD8FRbtu/mKMUKtA4WBWIQS?=
 =?us-ascii?Q?x++EGRXkVB9POnpkK0aGRGf2NmhQffBx2AKEnvRhRIF7eQuze3JNmkqMUPdC?=
 =?us-ascii?Q?STLbAzL4vvsXH7WdWn44XtRtlWPb8oEty9Yg/GeAmtLMphd39G9sIBfrYrJc?=
 =?us-ascii?Q?6kTyGIZGtjGHEvY9c+vR+NHTmQF06lwL9aFyXV0hA6pxwhmBMLY7QikUs9GY?=
 =?us-ascii?Q?BPqGx5RYwnog1H0SJM3dG8KGGqEfLRWG1T9zQWS5wEKI+1B+P9+n18pTxi4h?=
 =?us-ascii?Q?D5PcXjf17Hqu4O/5T/krmfuAHZQEa9eCT5HK6FusVPpFYgV2ul34Pj5f8bA4?=
 =?us-ascii?Q?XAi2RpoQ8reiPkDscY2JSjTngSqxJathXezF62el00q7HTKrVgvw?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f930e8e8-cb44-4faa-02fb-08df45e7a7c3
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 02:48:56.6536
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MR7aqS7sBW6KqvLQZaUDmiRsoYiOhBgc93VDbMzkXhrILbLu5OnDyUm8CW/Wn8TKdr1csv6T12/+8o+WJoLf3Sz5/skYxTua6uYZf2x8YG4EhshuCVg6zQzbpycbwGSN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA3PR04MB11204
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_184903_181087_D5ABA620 
X-CRM114-Status: GOOD (  26.35  )
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 18, 2026 at 11:22:30PM +0100, Tomasz Unger wrote:
> [You don't often get email from tomasz.unger@yahoo.pl. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> On Wed, Nov 18, 2026 at 01:43:05PM -0600, Frank Li wrote:
> > On Sun, Nov 15, 2026 at 11:15:15PM +0100, Tomasz Unger wrote:
> >> @@ -1027,6 +1029,7 @@ static void bcm2835_dma_remove(struct platform_device *pdev)
> >>  {
> >>        struct bcm2835_dmadev *od = platform_get_drvdata(pdev);
> >>
> >> +      of_dma_controller_free(pdev->dev.of_node);
> >
> > use devm_of_dma_controller_register() to fix this problem
>
> Hi Frank,
>
> Thanks for the review. I tried that, but with only the OF registration
> moved to devres, the controller entry is removed after
> bcm2835_dma_remove() has returned, i.e. after
> dma_async_device_unregister() and bcm2835_dma_free().
>
> In that window bcm2835_dma_xlate() can still be reached through the
> node. dma_async_device_unregister() has already freed chan->local and
> dropped the last device reference (dma_device_release() does
> list_del_rcu(&device->global_node)), while the channels stay on
> od->ddev.channels until bcm2835_dma_free(). A client requesting a
> channel at that point goes through find_candidate(), dma_chan_get()
> fails with -ENODEV and global_node is deleted a second time. The same
> applies to the dma_async_device_register() error path in probe.
>
> Doing it right with devres would mean converting the whole teardown:
> a devm action for bcm2835_dma_free(), dmaenginem_async_device_register(),
> and devm_of_dma_controller_register() last, so that the OF entry is
> removed first. That is a larger change, and
> devm_of_dma_controller_register() only exists since v7.1, while this
> fixes a bug from the original driver and is tagged for stable.
>
> So I would prefer to keep this patch as a minimal fix that backports
> cleanly, and send the devres conversion as a separate follow-up.
> Would that work for you?

Please send out follow up patch also because this is not urgent. DMA engine
driver was seldom removed.

Frank

>
> Thanks,
> Tomasz

