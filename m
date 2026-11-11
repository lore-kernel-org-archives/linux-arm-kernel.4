Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63199606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 21:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gzs5n4p1;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=TS1CtKLg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=tCDVNX4tdv0k3F/WfaC6BfK36reFRnc3oPYbI0WElLg=; b=gzs5n4p116jXQTDLd7KwJRHsog
	z1w/oeSXWrSd53+yZSuNv/Fwy1VRfJ+JsW4DOBiAXe4WxuRb8Pp3j1eAKvpA4g97LcFz4U0MRcdI6
	20+Cn1MnjZu28AatGzHLQ+Q0gRp7GCc86cIIqMuW1uc6JREDKnbXRclB1UvVUayiTbBWYCbPsmFi9
	ohF2NCo2SgWwjiNMmVVrCmpvs//lFi6JoVugXu5+M9ZCL7wHN4f0wteEZzu0ILgmb31pNrPvuYQQv
	xPOumh9oEe3yOJ4CqH1NUnsoxWBTFi0sezuQCfih352vDfA331SiouMZbLYwVd65qz390JiL2iTFP
	miQu01MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRGI9-00000007sOA-0jcb;
	Wed, 11 Nov 2026 21:55:41 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRGI7-00000007sMt-1flz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 21:55:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kLlcjScOloMH1m35KStVB+IYLx+jNXjfFBLOkw2f27LvB6tK8mAypsKY1O3PH1ZOdwaEA8mjZvdAcvrSxHmoZvmjNjE0I+BwY7sPb009d+kqWL1xcJiru6eiJDHTZwdzy/xUoP8PZeWpYRibk0qG3VL9+3FiL7+Ej72zc3YcR4A1p+F3XGfh4rfEzYfI9P7i1ITmpP2QdcinmQf4J4DbaX8072Zl9cyBrdGMxZcfgHi8Q713IPtf/BxsL9UBc5p49qp8E1dGcU8DoZ9WMGAx+PpBYaaTe1K9l8zzrSsOh6BGZEkb8jG42AhWltkNka4Zwg4ROR0/F6J1x5H0aUzXkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tCDVNX4tdv0k3F/WfaC6BfK36reFRnc3oPYbI0WElLg=;
 b=E5rjhslpmufTTvVwwZwuHvAWh+1TXeS+Q9JH9FQgkmmcsjyhXlV15MSM9gdH9bfII9GLCW2+UjsNA84jKyI1/yNvOMJYdhXqvetnWTfj4o7O6nIeQc9FjBEAWJnmv6ghJ4Spe9j3GXC+s7+SbtctsFGCxljUz3EFPcKCtAipmfnOnUmDOnyCwdT6Db8b+x3tssUidMQquB4tTFX1FsTNqE5giaL9WBKJ/1GiN8klfFK89MkVXHHDap0R45zkigCQGMM7ijt6CVfy24JG6RGqpUZVNJgdRSvWkw9D25PlR5zqGRzNaxyOYO8yCq6Zos72w84N3ZIPVoXjnLDVWvqi3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tCDVNX4tdv0k3F/WfaC6BfK36reFRnc3oPYbI0WElLg=;
 b=TS1CtKLggJ0a0GizYe6beF7UQBYAmww0OyCzPc9Ri+gs40WOeSIb23zATERjKya4/rPfz4RHniBm0NqxTUJ/nD9JRlagZlMTjHBw2AnHHOX0axAS7CFm/tnUl+vAm67o+O7V7AT/zyoBBAiMh7MKsjVTPKKG7ihjRczCPQFwhiDfvZZXBh8u5Q3zIZ0mQlQirpGzUo/Ml5ulHsBpYRANJ1jmnvNAgRHdlSw6OfINTvvZsWUpgHgI6Yshug0uP2M/p/7p7k6O/+ES167RZz1HDpX/PuMTvzCQEXIgoFrm5DeXDIJf5wnlhFa76VCjpTwWITnLHrHBBcmo4wHsX0fguQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by VI1PR04MB7200.eurprd04.prod.outlook.com (2603:10a6:800:12d::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 21:55:34 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0615.007; Wed, 11 Nov 2026
 21:55:33 +0000
Date: Wed, 11 Nov 2026 15:55:24 -0600
From: Frank Li <Frank.li@oss.nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Martin Kepplinger-Novakovic <martink@posteo.de>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Purism Kernel Team <kernel@puri.sm>,
	Bryan O'Donoghue <bod@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, guoniu.zhou@oss.nxp.com,
	Frank Li <Frank.Li@nxp.com>, imx@lists.linux.dev,
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Alice Yuan <alice.yuan@nxp.com>
Subject: Re: [PATCH] media: imx-mipi-csis: add support for
 MEDIA_BUS_FMT_YUYV8_1X16
Message-ID: <avTkTKerXE1RoLuO@SMW015318>
References: <20261009-csis_sam-v1-1-81f2b0fb76ef@oss.nxp.com>
 <179443170878.3989516.10436477074407728108.b4-ty@b4>
 <20261111213721.GA449775@killaraus.ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261111213721.GA449775@killaraus.ideasonboard.com>
X-ClientProxiedBy: DS1PR05CA0004.namprd05.prod.outlook.com
 (2603:10b6:8:457::7) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|VI1PR04MB7200:EE_
X-MS-Office365-Filtering-Correlation-Id: 26b70254-2989-4d34-42cd-08df403e82c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|19092799006|23010399003|376014|366016|7416014|22082099003|18002099003|3023799007|10067099003|261009223027099003|261102123227099003|261028144727099003|261021123027099003|261022105027099003|56012099006|261026140227099003|261021121427099003|261026121527099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: zbrRxh8xYfbrXz4GSfSTv7xG/nEmG74XtrTiY/M5+qfIXbwl8wLINubhavPp1RgDidY9eEnI3GwW+3uEfREd8KYMGtYEC57apty4G5E+ZMW1BdfcvpRAMZAwRUIBXQM+A/7HN2WhjqSVjG69Zuhy0sOFMYkdMBsNkw7vjoDu4awXtZ3kJtrRE+jtZewf3jsrx56Ij96OXmRgrGxD85afjd2deTqdappBYpOZiTMYdHoW81bp1EdSDAUvCiJcDB7jzQnkWuX1eD8xhUE4tBSRc0rJXGnpPlWlsoGYF6CXms7XIF/vR/ebd5s4iSHQ6yYDC1C+mwU2aP72uHYd5zsGOTxOFEOJrpdRcDtyGC0Lxw8wt1HD+jD3aZHcGnI+KNicpXOptsugKGtdzjX9N/BJsjUyCzVHDXFBytOVqJG/qxOLTlU1Cyyw+iiLzQVPRcih/S7+pIfqdih2jmJOfJ4ThYYY06zGY0iyHgAffZMBzKhkvvFOfhT4nxqnH2AvyXW/YjrZhqyn+YFffcrM5PV/8hVTOVzh63p6RqSXbPXW1JDyEH6YHb+jkuyWt9mq2ZOqp81aMiGZ5JFox3mPD3MzgZJdqr46wimosJODZDchKheuAfAtcAj2PSAVupBTLIvw
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(23010399003)(376014)(366016)(7416014)(22082099003)(18002099003)(3023799007)(10067099003)(261009223027099003)(261102123227099003)(261028144727099003)(261021123027099003)(261022105027099003)(56012099006)(261026140227099003)(261021121427099003)(261026121527099003)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KUhNxjaxpW89QJXhQ3NtJbsmD+kBH9UkC+rGZpH5OUTbb1sNnTHgpB6qly39?=
 =?us-ascii?Q?cZkPBFTKegZla/pwrLI7SNSfXVGizwnlYxkpB4yuEXDciDcXIGf6rPYOMSzg?=
 =?us-ascii?Q?CUuVI7QCjksdGzQdotPqjpmU/NCRDAwanEExOWhIA3qwLZnSG86IzWR9Yenj?=
 =?us-ascii?Q?e2NUzmht0JdGLe2ASo4fmimb/6qnNshSgj3pmLRDH0tgSo1PyhCsY9bkRjCh?=
 =?us-ascii?Q?oOkUeQh4uoOsvzu1ioQ31kyCcGCII+p+pqQhUvk4/gW8KUrIctr7Q4sqBd7s?=
 =?us-ascii?Q?VhTDieCehkGlZRFPNaSY2LX34vSV21fxqNVPwJiousmw6S44ndgRNw80f3yl?=
 =?us-ascii?Q?7MAnImtLttSZmRWZ156jEGC3RKMMb65B4FHFK9UIQ0SganT1kBY7GjO4z93e?=
 =?us-ascii?Q?3xYjOAtbUiGGg/HlRj1r0QivTN1eRDZvXt4JUstgvLv+0gCZOOV6GdKy+DGB?=
 =?us-ascii?Q?y3AzqsiNNI+8x1dvz48Q45SnWUNWcKr1AEk8cjayr7G58Bw1p4HrCj19YABu?=
 =?us-ascii?Q?vmYX2p7DBRx6G7s+wnvFp0g1/e26r3PSeHJonZyWWpOTqO0HMwZ2mqx0glGT?=
 =?us-ascii?Q?QMmvCp32dZlJ30ROGr5dok0B969mTiDRjKAewRWihxn5ONlsOFhdSynpRrSk?=
 =?us-ascii?Q?vfbCEIl8kHOS21b1G45L3unkIyh9dx3nv66xELmWadkgdvp6hmG/p1/ryMVG?=
 =?us-ascii?Q?xJ00bthNP8aiPrHGocoYqVOASaD1Bk0NYsuGvP0NaQ8Fu4LLJGNdbTTDqBAZ?=
 =?us-ascii?Q?mMS6OrG2qWGZtQMC33RnLqL+z07fJ03QXyx/wpKW9ldSPskAWsTVTaVUUmQM?=
 =?us-ascii?Q?R4wkOPsuL2b1wp9STg8sgWyy8CA9wiLB892ut8tVkUu8YWNGLIJAg5iOP6V1?=
 =?us-ascii?Q?vXHVt2FvNsDw8+QudnNHxnosQEMORxaJlctxMqw1AUMN6AncmNBumItuBOoB?=
 =?us-ascii?Q?t7A5TCfMMhlB/OFu8AS2vyw8Jr0fp77oZ6eI3vBKVOjVhAEzGiqPkVYgS+s3?=
 =?us-ascii?Q?VNgqc+MIJIM2nzLlp/f2+qBdNf7D9sHW5LVL5pufRMHZkRztYgHRb32kvfPq?=
 =?us-ascii?Q?QEJBxezl7itv7CuC2MveTpogV6ktGjxj81ghDvib95pURt6NdowzHLFZs5/1?=
 =?us-ascii?Q?CJegcn2iEoT1HsoraGSSHLQHMr5lB6v0o8WSnxQM/RCVbGcDY2EaCPbvD2ns?=
 =?us-ascii?Q?IXi4RAgwdsjU0vRaff04ZPKUZmwzQ2+3zwyYmnI52qIBJhJ7Wmc/8iiRvtlu?=
 =?us-ascii?Q?CXs4EUPEBhHanaQulM/X397pV/WYhaUqk1D3zuo9eGvprnyUJtvoatcpA1z3?=
 =?us-ascii?Q?LR8t0F8KfTMhRjb/FBiL8btrDL/TbzyEIP6/H5Ti1DabTbXrVJ/GxRww5tdq?=
 =?us-ascii?Q?7Fnh6/4ga3vbijFaGkyaasroUDr060080XctSc9Zpj29fJ99Hu0uDEapt0wA?=
 =?us-ascii?Q?XMByLeHztSkWK5c+0Uyr5MPWsb1RrBv9PdEhXrAvNMms+74b0EQoHVNUtqTK?=
 =?us-ascii?Q?3vc37AvAflFg0JO8VdmWKTSswAJMt48eMfGDf/t1PJ4P06OR329DaK36cB38?=
 =?us-ascii?Q?4gDGvoDe+Jv3W3hynT1V9BM+odp2Vf5mY3oETx8+ZGLMu4rMNDJ6mDvIMHgF?=
 =?us-ascii?Q?zMTfL1pK1K5SltsPU7iYf2duZnIMNGI/52BHBdkEqYmdY3t9JoG0Dm5pOKaQ?=
 =?us-ascii?Q?YL1KiTXXdoVj3S2zkAHWDu1W0JNTyUi0Y0HRJHm4qJzNokS7xOj55OXuZ/2z?=
 =?us-ascii?Q?Uuz47WDJrg2VVCL/M9mtsI8GRasQb8cjEksvFtUJKpIeroFu3ukY?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26b70254-2989-4d34-42cd-08df403e82c6
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 21:55:33.7971
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2wy58IYRet7pzo6R1h/bQxPNnZlWbd9XpZZHCfNTGsp1sinS+dXP1ls+X60zGHx/B/lVaE3nKMdCbiTJXfxEr2gv4QyJlRkMnnFGTe/fFmeLWm1NSTfb+ACNKuQu6fr1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7200
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_135539_485828_4B3AD965 
X-CRM114-Status: GOOD (  16.20  )
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 11, 2026 at 11:37:21PM +0200, Laurent Pinchart wrote:
> Hi Frank,
>
> On Wed, Nov 11, 2026 at 04:15:09PM -0500, Frank.Li@oss.nxp.com wrote:
> > From: Frank Li <Frank.Li@nxp.com>
> >
> > On Fri, 09 Oct 2026 18:58:41 +0800, guoniu.zhou@oss.nxp.com wrote:
> > > Add MEDIA_BUS_FMT_YUYV8_1X16 to the list of supported bus formats.
> > >
> > > The format uses the same CSI-2 YUV422 8-bit data type and 16-bit
> > > parallel bus width as MEDIA_BUS_FMT_UYVY8_1X16, but with a different
> > > component ordering. Supporting YUYV allows sensors and bridge devices
> > > that output YUYV formatted YUV422 data to be used with the i.MX MIPI
> > > CSIS driver without requiring format conversion.
> > >
> > > [...]
> >
> > Applied, thanks!
> >
> > [1/1] media: imx-mipi-csis: add support for MEDIA_BUS_FMT_YUYV8_1X16
> >       commit: 3fccdc8f246af658716b8b64393253b28838f355
>
> I have applied this to my tree already. Please don't handle
> imx-mipi-csis yourself.

It is okay, but

I have not seen you sent out "applied" email and at patchwork, have not
marked delegate under your names
https://patchwork.linuxtv.org/project/linux-media/patch/20261009-csis_sam-v1-1-81f2b0fb76ef@oss.nxp.com/

If you plan take care it, can you mark it patchwork or send out applied
email to avoid confuse?

Frank

>
> --
> Regards,
>
> Laurent Pinchart

