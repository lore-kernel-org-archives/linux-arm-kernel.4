Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25BB9606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 16:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=z2Zw4//S;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=BQLJH4YF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:References:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=9b+aT5k10Fa6+5WzaEu0mHfQ5VV5ou5FA8sfHHRovUE=; b=z2Zw4//SUBnSnH
	rIUDabdTJxiepaeE4S1d4vIGoT7YMc3JcEKNwxSDhREIrnphZjnkWsYAthotztbIyLKUuZNPQq/MY
	PRmAxSVkMt3UYQzXZubzKx2OtR6Y6PiA0ldSbnhWwF9caRmxM60z5XJ3hP6kGZ9QUHNYzJRgGA4xy
	pfMHNCFtbPNYGue21JyyWQD2TLMvSr8FLv7xSnqUR+R9iiGFyUDU0jFM1mb/OgI5BRAOpwL246W7o
	NOMU+pGQXsqWRL8ScozMGBeaAUV5FdvkGyl4S2zouIArS0fLXp4JjfHXpTs9RSf2RCQy0FUdXuAKs
	qCSM+eqDsw0i+y8B4fqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVWca-000000049BR-0Leo;
	Mon, 23 Nov 2026 16:10:24 +0000
Received: from mail-francecentralazon11013011.outbound.protection.outlook.com ([40.107.162.11] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVWcV-000000049A0-1tMh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 16:10:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ClRC3NK33xMkf/ViHjzl4rCMlFiqTG6lriLrrKZtmcxnouRsj0QExGb306z2MtsAbeh2jPJAzuVaWjbTEBLFvONUg+Fg4al0ch/eAFaxviYpLCzDabbjdEjhJNHzIu2P5izANEaEzjavxz8p4Nt7L2qMoP8eF7qY6DjtfSNMfF4Z76VbBz1NwKrj8KEtBHX9R+vTG1cu29IIqyrLsAAGuB401RWO0U3HXt/c6rJjSqzEUYbiM1Tu6/Oi6gBUTuqjyK5tJY6JpRSx8KiMsm2UF2BaaIFhzHNuquYkoCHnxV1ZvbLF96ZXCdjlLVdpuL3/khBRoO0tNxk5BJ0qU2tTTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9b+aT5k10Fa6+5WzaEu0mHfQ5VV5ou5FA8sfHHRovUE=;
 b=p+mBMYO2wZ6SfA+lfreVM+qiCxEdAsYPWHcMl6ILe6NzGMciak5TZq1LPEN98NncXwK6ct+i9AT2BClGyk/j6Ir46YIhZXcUtDwh0ZhO7bRv8YK85uOLZnoAO/biQhIfSIZcRiSuf8yGC9CPFPcF3ZZv4CdVt2cs0/RjJo0vS+mRhbCclLDMd9QYMpfZ7HKlwVaSe1CD+l7t08UkE1zg9g4BLcs14ECwJezgtUrspVolBLpGs5ocJ4e2OLBGUoTNKcP+om3EUhsvc1BtQWTluduBUsXwqRH6IdJZt5EEY4Emd7ZLintC4kx36DdaRl8Rx+upsD/7/KmU0p4MD1Rh3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9b+aT5k10Fa6+5WzaEu0mHfQ5VV5ou5FA8sfHHRovUE=;
 b=BQLJH4YFN7qxEH0ljGonk6qbJvgqMbFU7upyeAmfrP9EARkxpr/fg706mmpwYCasDPODwknpDC1ps93go1uSc4Z0m8nVYNAiYBwbHY5+hbVNk4DkceBfuNnTlGZOzASPfdbRIYbAR46o75tkN9IskTXxrK9NeYHFMY5wVcvbxKfA4Jq79/Rl3YGcQzMET8JxiwpFnyM5VuGKr3POn/y3+1GTjKRTQAUpcxd8z3bAUl0K79nGjS/6yVcnwLk6ImNr5xiz/dm0Le0jbEMpS7HaNmcxPrr2GjYGWIq/kxW2TksLpMu4ckCzPodXTYePHM5iEf/FDci2p5rUASI+aMVkxQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AM6PPFBCA68DFB8.eurprd04.prod.outlook.com (2603:10a6:20f:fff1::a92) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Mon, 23 Nov
 2026 16:10:15 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 16:10:15 +0000
Date: Mon, 23 Nov 2026 10:10:06 -0600
From: Frank Li <Frank.li@oss.nxp.com>
To: tumic@gpxsee.org
Cc: Lizhi Hou <lizhi.hou@amd.com>, Brian Xu <brian.xu@amd.com>,
	Raj Kumar Rampelli <raj.kumar.rampelli@amd.com>,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Michal Simek <michal.simek@amd.com>, dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Martin =?utf-8?B?VMWvbWE=?= <martin.tuma@digiteqautomotive.com>
Subject: Re: [PATCH v4 1/1] dmaengine: xilinx: xdma: Fix broken PM
 suspend/resume
Message-ID: <awRlXmBFmE8R82qv@SMW015318>
References: <20261123122236.5460-1-tumic@gpxsee.org>
 <20261123122236.5460-2-tumic@gpxsee.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261123122236.5460-2-tumic@gpxsee.org>
X-ClientProxiedBy: PH8P221CA0048.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:346::29) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AM6PPFBCA68DFB8:EE_
X-MS-Office365-Filtering-Correlation-Id: 373a4c99-3de2-4ab3-4cc6-08df497c42a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|23010399003|19092799006|6133799003|261009223027099003|18002099003|22082099003|261026121527099003|261028144727099003|261102124227099003|261102123227099003|261022075727099003|261022105027099003|261021123027099003|261021121427099003|56012099006|4143699003|261026140227099003|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info: 6Amzticmx/ez7SravaRbW1D5WBUBvVnjRM7bPwXEsAC+T9cHOlmd8Ffd37O4Iifb635b5Wet4fg0t82+kfW7Pg9eDHoEwWa14iWNbhpKgM2tvvnf7xF6/n4bYbTin5G507WCz8GrD/6F2TPNAyrCTyNugCcAkqFZ5JDaT57eq78BlzVfv28AfjyIP3D4OuLjQiB6Ja4ZiLiUQy6ou7YrMhXptAkn6PQO+R32Ls66YKRMZlU7UeB787dQFJAz3LuYKDXGff2mkVQEt+gxUqvMWutT1zkH3l/OQZsOU6rB81Wd5iqasUhneShEnb7GHg/BDEVWstkRqSdgfYXCMnE7yw5Hhq4ITz2YNcaOW2pDCeXsBFTjHX0hTvA2VNGc3X9jPNQifqEYjKHBaRvZuvRXRtReE0KZEAcm7xdZK7JnNwyZUhdv89OgoqhAeO08BASlIe2tzTmE4nHlR5IiPUMnZxgR3BfoY6a2HgZCFlMDVDxFvgmUvYxWHXANpqvO2fI9mTsUUYgUDgSJs+6fRul4Z3EpIMwsuzaYR4Rk+da0zdAfXFz4CkBjH/DJCARVyRHBrZr1V3F9LgmbtAP86up/j5/olUD2od4oRUfKREoZtt8TyEyMCzX3pLjh9x/AkegS3TFiM67StSl+OBO5I50XhjxmRpsOinDo7zmFzx1m8yE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(23010399003)(19092799006)(6133799003)(261009223027099003)(18002099003)(22082099003)(261026121527099003)(261028144727099003)(261102124227099003)(261102123227099003)(261022075727099003)(261022105027099003)(261021123027099003)(261021121427099003)(56012099006)(4143699003)(261026140227099003)(10067099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b0RwMTVJUm1MTm02M05xejc5dHMreU5LZklRV2VWaUVKRkk0Y1R4c0tQT0xv?=
 =?utf-8?B?WWdUcnNRSEM2ZEdQT0x5OUpPblVmRTNScWlSUlFibEdSaThPN0hkTlQyUDYz?=
 =?utf-8?B?UkthRm16WnF5OTd2b1dqSmVMT0syK2JIOTVmN1k1bktrdlBwRGk5YzYwUHdJ?=
 =?utf-8?B?SlZTR3FSdi91dEFFYjMvL01GZDRYTmgwVUNQZDlHeDJLbjJPcEwvcU1QaDkz?=
 =?utf-8?B?c2lLd0hTa0JnVDZZNDhmLzEwQURhRThQOHdvVGZIWm1VTFN6ZnhxdXJzajNk?=
 =?utf-8?B?NFE3ajBJUlY2RWZnWlAzM09ZU05ScUwwN0l6R25menRPVklyN3lJR1B4YkJO?=
 =?utf-8?B?OXNPNUNkUHkvZG1EVVJpeGgxTGRGYUlMUHI3VCsvUWVlUVdXYkxwK3hKaFU2?=
 =?utf-8?B?UkNZRTZxS2M0TmtLbUd5SWdaclRYRjVGWWtPOW4yYVhNWUZPNjRTT1pRalBk?=
 =?utf-8?B?OGhIVzV5dmhQQ0JtRVRXUHJtRmV3TGNLTFIvdnRqQUtneEZRL3QyaGpnd1ZM?=
 =?utf-8?B?ZU5vVTkyeFhSVUF2a3RDcHVQL3dDUFhHNitxaGlabm5vNDlZMFdpUDRianQr?=
 =?utf-8?B?bXkwdlFDaG9kMVVFVWQ0Q0M0SlMvWWFpc2hPNVRoTGFJQlU3NW1yNzZrQkhL?=
 =?utf-8?B?ZWVyRjdUVGlNRDRWc3IvRzNmRkFmbnNLVGk0bFpFK3d1OEUwRkY0V0VZWmdR?=
 =?utf-8?B?czlld0RlZEN6dEVMVTZvMDl3ZEdRa0tMcW1Lb0hDY1hKSmU3OGJGalF4TVRz?=
 =?utf-8?B?cmxxdnVyaWd0MUNmNFpVM3RLYVFzMTZmMGhUcFQ0NzZwZzVlbDNaUWV6aHRI?=
 =?utf-8?B?Q2JzVVdsc0tNRU1reHhZZGJEb29nbHNZUTg5elhpeGQzRk5TOE05aDlsUjBS?=
 =?utf-8?B?V0NxOUNlajJHdGMzeURIUWRTTVJJYUNsMG4zUUp5TDQ3Y1JMTmIzNGczcjRW?=
 =?utf-8?B?OHU2UzViZkV2VUVZdjhLcmZLc0tWemlKOUR6Yy9INnZ2TXh1dGlzenhLYVFZ?=
 =?utf-8?B?bmZSM1k5aGpoSk1YbE43V2daWWVxMVlXMkxacDdySWsraXNtOXFlUXdSRU4x?=
 =?utf-8?B?MEsrc2pUM1E5eHNQdkQvRXdYcUtRcElwdEdFQkp0SUtYUkxzVGJtb3d5OFVD?=
 =?utf-8?B?b0MvN0ZTUHNWTXFLc1ZwaWRvanJucndDL1FncTBEODAvSnlGbkhJWFBtU09y?=
 =?utf-8?B?WVYvNHV0dlpMQ3J0N2tRbERGVzBuTm02ZXRJT0RkZ3RLRGVFeGtsTk4zODlS?=
 =?utf-8?B?ZEdSMnhYVnVHL0p5aVluOXRDZmFPUnhHVmVnKzgrb0Q3c0tESzczRlNUYXE5?=
 =?utf-8?B?eUpwU2dLdGRSS2Y3bEpjK3U2MVdWQ0hUNU5yWWVESkFOS2pCQVNoWTVkWDBR?=
 =?utf-8?B?MURwN05sdFJCcnZQbEdCZm42KzJJZUpScWltZzRrb3hxQjNrNUM2VzRPdnRR?=
 =?utf-8?B?VzEwYXk2aWZQU0tYeUxkNnFRTGhwbWJpMldta1VaSTZkdXpMOHg4Y3VrVW1T?=
 =?utf-8?B?NFNkMWV2UjVlUEYzMDJ4V0Rybis3a0svS1c2SWlrWXhrSzB6aHVSWFc2TkIx?=
 =?utf-8?B?U3NoZ3lqREhRaEcwMko0S3RNbnVKdUdmZmpJYnlLdkJXcGdkU1ZDampiTnFn?=
 =?utf-8?B?LzlwMzIrckZ6cUFWdy9YZkhJa3NpSkZPUlovZFR1cTZGZUZwNExDOVpNNGgr?=
 =?utf-8?B?NTJPcGNPVVY2aldpcUtjcjcvTTFBZytvUjlYU0MyMSs5bHFtTm8wY1p0Vzk2?=
 =?utf-8?B?MG00K3ZDemFqYmc1ek9Db1ZUbHBjRldvT0d3dzBQcS9SdFdnaitoQjF6b1pz?=
 =?utf-8?B?RFJKQUpncjlZalowREkzbzBxOXZUMTQxTUJNNThsbjZlZG9Eak5CbDNzUmli?=
 =?utf-8?B?M0ZicGxRNGw4NEpuWGpqbnk1aEdLQWtQSjU1bDFDTFl5SGtnenRoYlZZNisy?=
 =?utf-8?B?c085QWprdmF5WFM1RGF6b29MZ21UTXdJdXRZVXZvS1pKeEt0ZVQ1ZjNRK21I?=
 =?utf-8?B?cFI3YUN6NzU0Ukk3Q00vajhXQkRGdHpUV2JkcWk3andGbnNTYmUxMGZCWVow?=
 =?utf-8?B?SlJ3UDZjSHlxb004YjNIWHQ2b1ExWnpwYVlNL2NiUVhJNnE0OGhJbEFUVk10?=
 =?utf-8?B?M3k1dml0aWRDZ0ZSNGc0ajgzc2REQ3M4SkNVQnY4dkQ2Y1lIMTNjWVVDeUFG?=
 =?utf-8?B?Ky9LR2FjNFZSQUszaC9IUno3a2lIcUdrdmZpYndaTTZRQXpCMnBRSEZDT1hS?=
 =?utf-8?B?b3lOM3R5dHJxTGZmajdjMjg0SU9OZXh0TXIzZDU3WGRqcDlBZzdrK0l6QVBi?=
 =?utf-8?B?SDUzQy9jTVBDV2JUd2pPaEhmTEp5YTBGYmRJa2YzWHFIZUd0QnVsSXVOR2h6?=
 =?utf-8?Q?3Pgyhqt2BgsQPynHMvA/LukXtyk0+n06oXhsV?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 373a4c99-3de2-4ab3-4cc6-08df497c42a7
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 16:10:15.5542
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nKah/f1ofB4x335QW7ug0lxNZrtCpQZklZR2Bk60Gfk4sc0mcIesvKXIn0j9uTW/a4XAfrEdtfRx85+cw0SdNOMch6EU0C5BXwJSkerVDSMoeO4tHMlkahcq0YBdEkMn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PPFBCA68DFB8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_081019_647023_13130564 
X-CRM114-Status: GOOD (  29.59  )
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

On Mon, Nov 23, 2026 at 01:22:36PM +0100, tumic@gpxsee.org wrote:
> From: Martin Tůma <martin.tuma@digiteqautomotive.com>
>
> Add the missing PM suspend/resume callbacks that properly reconfigure
> the XDMA HW on PCIe suspend/resume.


Can you talk about more about why need reconfigure the XDMA HW? Does it
power lost?

Frank

>
> Signed-off-by: Martin Tůma <martin.tuma@digiteqautomotive.com>
> ---
>  drivers/dma/xilinx/xdma.c | 146 ++++++++++++++++++++++++++++++++------
>  1 file changed, 123 insertions(+), 23 deletions(-)
>
> diff --git a/drivers/dma/xilinx/xdma.c b/drivers/dma/xilinx/xdma.c
> index 9d827c9a1267..fade49eaf1a8 100644
> --- a/drivers/dma/xilinx/xdma.c
> +++ b/drivers/dma/xilinx/xdma.c
> @@ -123,6 +123,7 @@ struct xdma_desc {
>   * @irq_start: Start IRQ assigned to device
>   * @irq_num: Number of IRQ assigned to device
>   * @status: Initialization status
> + * @usr_irq_mask: User IRQ mask for PM suspend/resume
>   */
>  struct xdma_device {
>  	struct platform_device	*pdev;
> @@ -135,6 +136,7 @@ struct xdma_device {
>  	u32			irq_start;
>  	u32			irq_num;
>  	u32			status;
> +	u32			usr_irq_mask;
>  };
>
>  #define xdma_err(xdev, fmt, args...)					\
> @@ -398,6 +400,26 @@ static int xdma_xfer_stop(struct xdma_chan *xchan)
>  			    CHAN_CTRL_RUN_STOP);
>  }
>
> +/**
> + * xdma_reconfig_channels - Reconfigure DMA channels
> + * @chans: channels configuration
> + * @chan_num: number of channels
> + */
> +static int xdma_reconfig_channels(struct xdma_chan *chans,
> +				  u32 chan_num)
> +{
> +	int i, ret;
> +
> +	for (i = 0; i < chan_num; i++) {
> +		/* init channel hardware */
> +		ret = xdma_channel_init(&chans[i]);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
>  /**
>   * xdma_alloc_channels - Detect and allocate DMA channels
>   * @xdev: DMA device pointer
> @@ -1018,6 +1040,55 @@ static int xdma_set_vector_reg(struct xdma_device *xdev, u32 vec_tbl_start,
>  	return 0;
>  }
>
> +/**
> + * xdma_irq_config - Configure IRQs
> + * @xdev: DMA device pointer
> + */
> +static int xdma_irq_config(struct xdma_device *xdev)
> +{
> +	u32 user_irq_start;
> +	int ret;
> +
> +	/* configure hardware IRQ registers */
> +	ret = xdma_set_vector_reg(xdev, XDMA_IRQ_CHAN_VEC_NUM, 0,
> +				  XDMA_CHAN_NUM(xdev));
> +	if (ret) {
> +		xdma_err(xdev, "failed to set channel vectors: %d", ret);
> +		return ret;
> +	}
> +
> +	/* configure user IRQ registers if needed */
> +	user_irq_start = XDMA_CHAN_NUM(xdev);
> +	if (xdev->irq_num > user_irq_start) {
> +		ret = xdma_set_vector_reg(xdev, XDMA_IRQ_USER_VEC_NUM,
> +					  user_irq_start,
> +					  xdev->irq_num - user_irq_start);
> +		if (ret) {
> +			xdma_err(xdev, "failed to set user vectors: %d", ret);
> +			return ret;
> +		}
> +	}
> +
> +	/* enable channels interrupts */
> +	ret = regmap_write(xdev->rmap, XDMA_IRQ_CHAN_INT_EN_W1S, ~0);
> +	if (ret) {
> +		xdma_err(xdev, "failed to enable channel IRQs: %d", ret);
> +		return ret;
> +	}
> +
> +	/* enable user interrupts if needed */
> +	if (xdev->irq_num > user_irq_start) {
> +		ret = regmap_write(xdev->rmap, XDMA_IRQ_USER_INT_EN_W1S,
> +				   xdev->usr_irq_mask);
> +		if (ret) {
> +			xdma_err(xdev, "failed to enable user IRQs: %d", ret);
> +			return ret;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
>  /**
>   * xdma_irq_init - initialize IRQs
>   * @xdev: DMA device pointer
> @@ -1025,7 +1096,6 @@ static int xdma_set_vector_reg(struct xdma_device *xdev, u32 vec_tbl_start,
>  static int xdma_irq_init(struct xdma_device *xdev)
>  {
>  	u32 irq = xdev->irq_start;
> -	u32 user_irq_start;
>  	int i, j, ret;
>
>  	/* return failure if there are not enough IRQs */
> @@ -1060,28 +1130,8 @@ static int xdma_irq_init(struct xdma_device *xdev)
>  		irq++;
>  	}
>
> -	/* config hardware IRQ registers */
> -	ret = xdma_set_vector_reg(xdev, XDMA_IRQ_CHAN_VEC_NUM, 0,
> -				  XDMA_CHAN_NUM(xdev));
> -	if (ret) {
> -		xdma_err(xdev, "failed to set channel vectors: %d", ret);
> -		goto failed_init_c2h;
> -	}
> -
> -	/* config user IRQ registers if needed */
> -	user_irq_start = XDMA_CHAN_NUM(xdev);
> -	if (xdev->irq_num > user_irq_start) {
> -		ret = xdma_set_vector_reg(xdev, XDMA_IRQ_USER_VEC_NUM,
> -					  user_irq_start,
> -					  xdev->irq_num - user_irq_start);
> -		if (ret) {
> -			xdma_err(xdev, "failed to set user vectors: %d", ret);
> -			goto failed_init_c2h;
> -		}
> -	}
> -
> -	/* enable interrupt */
> -	ret = regmap_write(xdev->rmap, XDMA_IRQ_CHAN_INT_EN_W1S, ~0);
> +	/* configure all HW IRQ registers */
> +	ret = xdma_irq_config(xdev);
>  	if (ret)
>  		goto failed_init_c2h;
>
> @@ -1297,15 +1347,65 @@ static int xdma_probe(struct platform_device *pdev)
>  	return ret;
>  }
>
> +/**
> + * xdma_suspend - PM suspend callback
> + * @dev: XDMA device pointer
> + */
> +static int xdma_suspend(struct device *dev)
> +{
> +	struct xdma_device *xdev = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = regmap_read(xdev->rmap, XDMA_IRQ_USER_INT_EN,
> +			  &xdev->usr_irq_mask);
> +	if (ret) {
> +		xdma_err(xdev, "User IRQ vector backup failed: %d", ret);
> +		return ret;
> +	}
> +
> +	ret = regmap_write(xdev->rmap, XDMA_IRQ_CHAN_INT_EN_W1C, ~0);
> +	if (ret)
> +		xdma_err(xdev, "DMA channels IRQ disable failed: %d", ret);
> +
> +	return ret;
> +}
> +
> +/**
> + * xdma_resume - PM resume callback
> + * @dev: XDMA device pointer
> + */
> +static int xdma_resume(struct device *dev)
> +{
> +	struct xdma_device *xdev = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = xdma_reconfig_channels(xdev->h2c_chans, xdev->h2c_chan_num);
> +	if (ret) {
> +		xdma_err(xdev, "H2C channels reconfiguration failed: %d", ret);
> +		return ret;
> +	}
> +
> +	ret = xdma_reconfig_channels(xdev->c2h_chans, xdev->c2h_chan_num);
> +	if (ret) {
> +		xdma_err(xdev, "C2H channels reconfiguration failed: %d", ret);
> +		return ret;
> +	}
> +
> +	return xdma_irq_config(xdev);
> +}
> +
>  static const struct platform_device_id xdma_id_table[] = {
>  	{ "xdma", 0},
>  	{ },
>  };
>  MODULE_DEVICE_TABLE(platform, xdma_id_table);
>
> +static DEFINE_NOIRQ_DEV_PM_OPS(xdma_dev_pm_ops, xdma_suspend, xdma_resume);
> +
>  static struct platform_driver xdma_driver = {
>  	.driver		= {
>  		.name = "xdma",
> +		.pm = pm_sleep_ptr(&xdma_dev_pm_ops),
>  	},
>  	.id_table	= xdma_id_table,
>  	.probe		= xdma_probe,
> --
> 2.56.1
>

