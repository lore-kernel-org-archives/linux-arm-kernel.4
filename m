Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5DCE60A3808
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 14:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dO+218I6;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=slG+UbJD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=CAQuqKguyeinbg5856TB1/eMAX0D2CZXP6etwfqWzq8=; b=dO+218I6NXTjwx5d/hZ9zBbnFA
	UkUQPuyss0gu1vLcsoE7M+2HiG1Uq3VaEq9SIh8mUEC8ZMHN4UEYAKfvepyksQIax4rSNFy2TATNk
	962vDAuuvMbdo3Z4OdgORLNeYSC/r2bt2iOj0w4GhrIw71S+aPFWHD5Ike3mWt0UqZBmkuDqEZz4Q
	yB5EKMXeFk4y92wj0/sjqQxV3Qbe4GNK2XGcUHj8NjmyYmG46gh61j/rcjpG0siSj4zUCGgW2tlzy
	DHpywtKdqYuNha2HsjAPu75pze6GIqEKJaAm4f3SE4+djObAvxV5xw5mcOsphVrFvFJ/dVA2PAs8h
	gW25ty3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQnEo-00000004HdD-3pLx;
	Tue, 10 Nov 2026 14:54:18 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQnEm-00000004Hcc-1pFM;
	Tue, 10 Nov 2026 14:54:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wwRgl9pxKS0Yzg/IeWxuQyqf9E75+0234MExdHrMYk6d9Zw/j3Vx1lfUegG+t8aFE23pgjfvttmEUe3Ik0S3lgeaFLLTrYhmK0hnLnmK4NnGPTb2c9n22AW/6AX7YuvveGRuT/8NgeEhnKfIB/QJaXzweipIjXlifS/M84cVVWsDaD9NGt+wypD05YaiGTQuWobuAeEv8Fob1RIGBzhNJRUZ9xQOHtw/aFz3KVvFSLuX48SpuTvAi41QPOjknS6t3uAHELyWV414RQXBw4gQ3FFzQRPFBMdq2eCLqEGhrMAw4qDPWM08L/1kcJc6M3Y40HCiqKEbr20ewBpgU14JEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CAQuqKguyeinbg5856TB1/eMAX0D2CZXP6etwfqWzq8=;
 b=IT4C+H+w01/pVXbm7lKXyH4VFNSGJBBkxxkrK7EK5k2UPpuIYFJWRsVQO5AVKHK9OFb4ReDJxiIe5OzqJgGbjB/vV4yfHGz9cdU7GzNstG6UpNHtYZ7hL0W8DavYmkVULizIhLBT7bdoBdiixQFo2t1wC1YuFGgEyg8lNOoEtNAdu5pZSQkdwj651MOKSH+CPVlXQ4iz1URGXjNYHdlPj3XzBhHlCVg3zaW+P1X4cSjxooN1aVqfWd7Pl8KeEuqW38azpWO213XgJD1FAXVsmX7Z1PF/fztx2Gb596z4pzEgHx/hz42OVHflwlYXMi6tCNFR9YhBgeWD6cf4wSueYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CAQuqKguyeinbg5856TB1/eMAX0D2CZXP6etwfqWzq8=;
 b=slG+UbJDHplmjNCnaWYPR/6J299UPJV02FEFm9+PlSMBfZhR4/rStAvU6iwyf5CEq9rCxVoQPaIuILSP8tLzQvI21XUudH6i+P/1qRqR/PBOpGAlAqV+8Zq873EpFRDP/fLK3GdRCsk3pUtjtttwGz9W1UDxTuceNWwjZeQR1ZgWPF14E2QYkNuGhT8wTZzaK4EEgEBG74+ot6aYCnRcA9jFnf/G5XnnR7raYwNB/H+pewRK05Hu0s8m3gRJnGnR99vqPlBsLSDw54db1eos+lSaU9z+jOM8iMuvCHS+NjQQUSlrxfhbz7B9mWVBlhwZ9DB0Jz2tdY9NhxIfnFV+NQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB12318.eurprd04.prod.outlook.com
 (2603:10a6:150:32b::19) by VI0PR04MB11937.eurprd04.prod.outlook.com
 (2603:10a6:800:307::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.12; Tue, 10 Nov
 2026 14:54:11 +0000
Received: from GV2PR04MB12318.eurprd04.prod.outlook.com
 ([fe80::a498:2b5a:cbdb:d6fa]) by GV2PR04MB12318.eurprd04.prod.outlook.com
 ([fe80::a498:2b5a:cbdb:d6fa%3]) with mapi id 15.21.0592.012; Tue, 10 Nov 2026
 14:54:08 +0000
Date: Tue, 10 Nov 2026 16:54:04 +0200
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Stefan Ghetu <stefan.ghetu@nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, daniel.baluta@nxp.com, linux-phy@lists.infradead.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, "Oliver F. Brown" <oliver.brown@oss.nxp.com>, 
	stable@vger.kernel.org
Subject: Re: [PATCH] phy: freescale: phy-fsl-imx8-mipi-dphy: Fix hs_zero
 underflow
Message-ID: <avMvxPmEftnmthB8@vm>
References: <20261110120546.6247-1-stefan.ghetu@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261110120546.6247-1-stefan.ghetu@nxp.com>
X-ClientProxiedBy: FR4P281CA0102.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cb::9) To GV2PR04MB12318.eurprd04.prod.outlook.com
 (2603:10a6:150:32b::19)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB12318:EE_|VI0PR04MB11937:EE_
X-MS-Office365-Filtering-Correlation-Id: 521ecf40-d37f-4ebd-cf40-08df3f3a791a
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|23010399003|19092799006|11063799006|56012099006|10067099003|261026121527099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: HIqxf35yqt8XQ8KQu2lsU7RMKw2JwL21+IHDjgRW0vdGhE/paRHXZ/fUX+YsOIP42/9aotwQI5BIoVGVTqB3d37RpHOf0Oi7gCk6w6R7a52B8dXkAFABPyhqyAHJn3nbRpVCMwVmYiaLN+KBswRhiarQxrH1kaO7QsEqMgWAcZfJBMlMi4lcTiyKiQOcQR9/p0OtyNscAOErKoPnMMS/ODecEV/s7oxJVk21pos0ZdPsEU9t2rpw7htmVxxqjq8sMeaA2IncMgXV7AKdu2gpos+/pCzAnwDaaP8ps7Mb40z2WpoFg/wRgrDsK2EmEnGIDI/WqUW665lwKAnXv+tZEtf8UFQTBYOSrNqt/SVF6ZtYZwhDKl2Z1bUUnWj/e95VQvZZ4zh/Sd8vu6tMWCd7jUM9aaQFW9uoTYPBqGCMUlciKkX1Ms4M/SRDt7YjiFbLieZOZpDcsw4DycD7r6yy4DhR6fA2cvNVTYA9+lHevJ7l/qIb/6nZTHEDvaSJLigil7zu6wrTZRSBxd4Qd9xF2Nr3FqB95FU37z++O98lFO7Wrmwb06qgYhEI+yQsw85DXEba/LUtBvhPEL+niTbQVRTKo/NSS7JopnZbheHfF56BzaxzaOBstBhorSlS4U7AfiYKeeOEwrtY4k/lmD7u+9Aj0bdGuVKotHtjXOXLf5Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB12318.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(23010399003)(19092799006)(11063799006)(56012099006)(10067099003)(261026121527099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ySC2BQOjpz+9ZZFU8bB9oqutrMOjqt8eXIm245LXWADq1DY7gyvfYylPA+i+?=
 =?us-ascii?Q?WFjLt2NSifn647CVTcu4O3Q4uBASxIvO0gyb4qnLEldWWs/4tjRkKEWj/O2/?=
 =?us-ascii?Q?mG4JTdsXJBe66EzqewzcmuYtOU1H8bmyeBqAm9Cv7kllDb4MLpZLqeJR7g/+?=
 =?us-ascii?Q?Fu3lJ5bi6RoBOS0jzlRrk3otoblVsUdNjFiVi7gyJJJW2gsp3Tk7PGwh3GiQ?=
 =?us-ascii?Q?WM16/lgiXbqsluAvWyZqnUAJ+HSRNMnKS4Myew8/HIe3Fi/hfyDICWBPvRzE?=
 =?us-ascii?Q?zX/XoNtJHPH3gULf4K/sUXuLnnTPRyDgptpqQnOeDX6sAQfMTjwBpYUN+dYF?=
 =?us-ascii?Q?tOCSg2GimNZeKqody9PKyYxcwGsNS8YrXeQrNbp6IaMsFRNWjAgLLxkbtoBa?=
 =?us-ascii?Q?ztxjTCoAVsDwszcUzb2+EiTr9sHcvxfW5mP4ZsG6+sjWDQsxSqG5DpVYXQmz?=
 =?us-ascii?Q?qN2V1oTQIxvzHenMKaUvj+d1+g6C1WzFoxK+2XCkKKGlnN51kq5FMotLzN2R?=
 =?us-ascii?Q?S6UNj8BbAjgqHqKAImI+sCWUpQzyeGtPCijYwMqcmkpvNPpn5QMv42YyQXJH?=
 =?us-ascii?Q?Stw4t6sLk2+lk3V1XDlfGj/o6CMz5RGi5TaknoFWzzt5sjwNlfw4eFFW8uv4?=
 =?us-ascii?Q?lmSfGpN70W6mX1JUcRcz35Ihnu9DDkCxqcR4e6xA0dDTa5295xxZocdSZmIL?=
 =?us-ascii?Q?LUvhkeiAQF2MO24cjD4xta83PIaJJJQYBYavzrqkVtHmGBeHT6yu0hHRmiyN?=
 =?us-ascii?Q?dC6Q/z60fVMKqHqm9Xhglga15sSaULYh6qWcAhlS6krAqGeDMTDd0edUWLYR?=
 =?us-ascii?Q?6XEhmyrI9K5fFuVbuRMBc1TuRb99ZQqz9dE+PxVjwjYeH3pEoZvNmB7qyja1?=
 =?us-ascii?Q?zsXZGtwRXAmlf6mCJj8pCraOF+2lRzZwQVzW2gK/71CumTKfI/pNmZOvIdWY?=
 =?us-ascii?Q?hNeBhGC0SdVcGwhO9npNxYqLoStqZdxaTyKOISD0D2z3Hm6JxbofQvyzU4yW?=
 =?us-ascii?Q?7N4hEtbH3krRG13fo6bVtDmhCwkijzxGrC0McUYXBGOyPFKgsjTKDOYj/IAD?=
 =?us-ascii?Q?LCNejSSxCSRGM2jidvNkGSUUDgzpF2iV5B9ii6RIhCJVuSgEwtQS2u50LeWN?=
 =?us-ascii?Q?Gtf1e7/l7XxFrS+yqJ432iGt5x0qNr3Td4Y5ibmbbWAEJ/jhdQXW3AhYkqUK?=
 =?us-ascii?Q?VI26rvUg5JS9gpKvGz6+axynGXqHAWI9cnOPL/eCo/WZBkXfgJCRB3bo00n6?=
 =?us-ascii?Q?tJIConQJxKVifDuhz2Gwv1H8QRerjhyTDdyghn6VG9ZcPSlhbv/aq5eHiwts?=
 =?us-ascii?Q?PRIOlDnP4wq+xHneZxISBauYED8G5CVMJzAg+22uXDaRPkgfiyGNDXSq5u3M?=
 =?us-ascii?Q?Rrg1VeAGxN6pK4xnjFyiHRJ7K2ycmx5zq8Fbo8Ml37R0JIGq8sqjzJSkL3N7?=
 =?us-ascii?Q?8c+fsd7SrFxR0izt3pFh4YWytGzOAFS+mStR1LUYnAo2Cv9wvmlkyoe5dsxZ?=
 =?us-ascii?Q?rr8THjF2xktWt3ct4wx+uMUu6F9E2q1COrfk1dcgoPFdj66bnfcPQmoLhbv8?=
 =?us-ascii?Q?86IUhfhPzFsNMAMeUbCTVw/r7eguMu7t64xYF6yf9y36rr+xAgEG74+yBM7P?=
 =?us-ascii?Q?8Bov23Jp+radrPoJBOTNXdlU987i8568gc8kGeVO0GMTnQZDvqlgLkmHRpr5?=
 =?us-ascii?Q?QD97924JM30LNMJHn+MHfIC50Jr6DDZcBfajams+ttWaQ7eYPSrQQk/BWXwa?=
 =?us-ascii?Q?UMpVxfTi4afLYu0Ar3fXXQP+Z28pfAA=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 521ecf40-d37f-4ebd-cf40-08df3f3a791a
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB12318.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 14:54:08.4452
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aCnVMs8h3TbHsy7QZbkfQOFb6ocMUOTqq7diNpIgtZVBS+8a9pILoFTKcX4aNJrHgD3/IxAcZjoCocseYetO3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11937
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_065416_481858_A0B5C3AC 
X-CRM114-Status: GOOD (  12.56  )
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 10, 2026 at 02:05:46PM +0200, Stefan Ghetu wrote:
> From: "Oliver F. Brown" <oliver.brown@oss.nxp.com>
> 
> The hs_zero timing is computed as
> 
> 	n = (144 * (hs_clk_rate / 1000000) - 47500) / 10000;
> 	cfg->m_prg_hs_zero = n < 1 ? 1 : n;
> 
> hs_clk_rate is an unsigned long, so the subtraction is done unsigned and
> wraps for any rate below about 330 MHz, where 144 * MHz < 47500. Because
> n is a u32, the wrapped value is never seen as negative and the "n < 1"
> clamp does not take effect. The garbage value is then truncated into the
> 8-bit m_prg_hs_zero register field. At the minimum supported rate of
> 80 MHz this programs 199 on 64-bit and 181 on 32-bit, instead of the
> intended minimum of 1.
> 
> Make n signed and do the arithmetic in int so the clamp works on both
> 32-bit and 64-bit. The divided rate is at most 1500, so 144 * 1500 fits
> easily in an int.
> 
> Fixes: f4c8116e294b ("phy: Add driver for mixel mipi dphy found on NXP's i.MX8 SoCs")
> Cc: stable@vger.kernel.org
> Signed-off-by: Oliver F. Brown <oliver.brown@oss.nxp.com>
> Signed-off-by: Stefan Ghetu <stefan.ghetu@nxp.com>

Reviewed-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>

-- 
Thanks,
Laurentiu

