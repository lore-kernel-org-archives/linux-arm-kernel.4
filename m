Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2290606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 00:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eNCy/BWu;
	dkim=pass (2048-bit key, unprotected) header.d=phytec.de header.i=@phytec.de header.a=rsa-sha256 header.s=selector2 header.b=iCOgIzel
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=3jGP3kpyU8qYNNLPxHIoPWDJhUz3M+x3GcD17xSIFgc=; b=eNCy/BWu7d5+9udnS504pFA5nv
	2SiDxcdogb93uAoI2JtUZ2wvzAX0Pf0S5TctOPnSjPRoPkw9DWqH7eAo74FEHiourXFW1gnasqriv
	NjODP7mKR4wfzUuDNuN/lEqCIF5Dla3KspHgss108ZIjCihqtJqlmXJCpVYZojggWogFxlMMHrr2N
	3JOSVrFdZ5KGWyvJIwBo7FiVOZaCdQ8MEgVnZT0kWEcbsdWt3oIJGcEiTHql2v30KvrJNJIQRgEs+
	Ym4t30np+abDxT1fxyCojvYCbJRvoVSjlZTuCIdnvFy0A9kzCBb/HZYz9wJM711MFh+IcLDsoYnWC
	71NN7zkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWjnw-0000000Eh8K-2rEW;
	Fri, 27 Nov 2026 00:27:08 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWjnt-0000000Eh7w-23GO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 00:27:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bwIzFa5DcD8XYlPg4odIpS3+8ihbiUoZRKOaqKA0Fr7QHyR/3r+Yvv0RcOLYs7/1DNTwPa6PjleVf+xEtrBfnOmdS39uSLtQvUUD0K+zapNm0sc8UtphxZIYypN5Magx2u7NSuU1QyUiqlClpuZ9kKR4U7JxCTkNnDEgYbr9+1FIvExTL9C711eI1gny5LNTpRNVaQLdhEThA1g1HbURwQNActB+fPYh1h6iy5jv23GsNQWPY0FI1JmCymoA6/BDeAac3fsh/GldJWkcqST0eTEkq+87ecAtnfYy0v+aQPWzj7fKNOEqd8fqjvzj4ci/eC2emcXKBijIr04Z2zy15w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3jGP3kpyU8qYNNLPxHIoPWDJhUz3M+x3GcD17xSIFgc=;
 b=uJPfgzl7q0D8ZyimhQ5HAerPlUXe/N2reG3u28dgt4stRNWkkX1NHrYu8i8jpWLut6NBhyY8C2e1o46QhRV9rg01qPaJKDT4NlAXiMRmZ86oo3Jgm7x2F5r3aZFm6G8RwfnZ8EI8vOq23/o4gTfUErjyXyOBWDW5d2aVZypm8DOGu6TAeL7gcGInwCneuV18/pwX+NWwcaeivBXW1C3aRoggHK2yoPZxX4VwmKTsIZVMGAR0L3n2ejOe71zBm4bd7GHEQzZ5gp+iQdHbTrtmK6mK0hfDXalhpuAk3jpyDwQZzKaqoW+/5e77zpX0rhNf+wXEPej63kmi7ed7wV1KfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phytec.de; dmarc=pass action=none header.from=phytec.de;
 dkim=pass header.d=phytec.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3jGP3kpyU8qYNNLPxHIoPWDJhUz3M+x3GcD17xSIFgc=;
 b=iCOgIzel1w7k43qFV9vrWA/Wj0UzRwDGuo3fDJeq9R/UL6SwibvH+VHOntHq55OYLOmpLUn82gAP0WjWlZdYti1Pp1Rzcc1P5Qj2OK03E+cm6/xCUj5vpy8lRo46XBb3XFGfeDlQPNdoicEMBu0IZC720/K9DLB9zTSrUD3a5XP8PwQQrpo4UpoPbXe1csoqdXJVH7/On5AnW+S/DVoKF39aepAaIZR3UqIicz1QqMLp8OywsfOMsR5q9pBjb/wEGoDftxp4qj8nur0eBwuAWdMblZNlQHS2uUis5xJ59NYMVZXgf4Vx+WM4pwEVQCWqJ9v1ghjgWj9MNMOJ/+rx2Q==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phytec.de;
Received: from AS4P195MB1456.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:4b3::21)
 by PR3P195MB0745.EURP195.PROD.OUTLOOK.COM (2603:10a6:102:3d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.9; Fri, 27 Nov
 2026 00:26:59 +0000
Received: from AS4P195MB1456.EURP195.PROD.OUTLOOK.COM
 ([fe80::295f:9a59:b66a:621a]) by AS4P195MB1456.EURP195.PROD.OUTLOOK.COM
 ([fe80::295f:9a59:b66a:621a%5]) with mapi id 15.21.0662.004; Fri, 27 Nov 2026
 00:26:58 +0000
Message-ID: <b8d6e03a-90a5-48bf-a8c2-4493c52a45d0@phytec.de>
Date: Fri, 27 Nov 2026 08:26:49 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: configs: defconfig: Convert TISCI to modules
To: Nishanth Menon <nm@ti.com>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Siddharth Vadapalli <s-vadapalli@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Bjorn Andersson <andersson@kernel.org>, alexander.sverdlin@siemens.com,
 jan.kiszka@siemens.com, ayush@beagleboard.org, robertcnelson@gmail.com,
 upstream@lists.phytec.de, francesco.dolcini@toradex.com,
 leonardo.costa@toradex.com, matthias.schiffer@ew.tq-group.com,
 stefano.r@variscite.com, eblanc@baylibre.com, msp@baylibre.com,
 thomas.richard@bootlin.com, miquel.raynal@bootlin.com, mwalle@kernel.org
References: <20260910134409.1713610-1-nm@ti.com>
 <53d50a7c-4318-4705-ae21-780b04628742@phytec.de>
 <59b8e9df-0f78-49eb-a23a-2b352a4a2333@kernel.org>
 <20261123125515.55ozls7bvral2ukz@residue>
From: Wadim Egorov <w.egorov@phytec.de>
Content-Language: en-US
In-Reply-To: <20261123125515.55ozls7bvral2ukz@residue>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0431.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18b::22) To AS4P195MB1456.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:4b3::21)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4P195MB1456:EE_|PR3P195MB0745:EE_
X-MS-Office365-Filtering-Correlation-Id: a0226002-ef92-48c8-4bff-08df4c1d25e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024|23010399003|10067099003|56012099006|11063799006|261026140227099003|261021121427099003|261009223027099003|261022115727099003|261022075727099003|261022105027099003|261026121527099003|261028144727099003|261102123227099003|18002099003|22082099003|4143699003|6133799003;
X-Microsoft-Antispam-Message-Info: 05kdDvyqQIctCWTa8M0iV5Ldj24cdHmFJP35iRXwOtCzpbGYGDu4kb5YB9i7nCyAIVYLXhfSJJxoBHqE8IifYJGxK0Co7WKysKYYjyiFldvbQVjx/pxcrY0T4HKU4BhF+dIhl5eEFUUKgXM6dniGemQjoC2pqW2yxqdnCG8toM5id9FE3H4OCPpXFAvLO3t9dat1iRgfEKVJondQwahoW5YWDD9u6ja1oiGv4BGwmGiaUzruQkkr18UjyTOL+4/PE6iapEhALWNsOJGut1GoJAfKGzntutKX21nNH3CtT2yPZfGZAe7r3VL1VF1ckrbXInleL1EjHscZRYfhMKGFPPI+GoDK49BB0/9SL5DXaJz1SXasX1ygkJnmdQyTXeVfVhoUE0nFGl5+F0Kctx5iELR7pm0OI2aPAbUGTb6/AHla//eJPbJ4WuI76oOzi6tbAlufONKdAuyy4LTSBCeUoHBrBnubmERlpv/UiiSLWQ+hazsoV3WvgPJBKc3wnR1oyiPGdYypkWHe5zSteV9TCCwvWePUm0L5VOEHZzl+oaSko7f7bqHsb/01HT73zBAeUAhTjoawWMMPoXN9c+6SnpYbMMmIY5bdx2jRelGym58=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4P195MB1456.EURP195.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(23010399003)(10067099003)(56012099006)(11063799006)(261026140227099003)(261021121427099003)(261009223027099003)(261022115727099003)(261022075727099003)(261022105027099003)(261026121527099003)(261028144727099003)(261102123227099003)(18002099003)(22082099003)(4143699003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eFIrM1hlYzRlLzRzbC9WeU9GTkhPWlI0M2FkTXFIZTFKQVZ4L0p0Q05IeFpY?=
 =?utf-8?B?b3lFaVFTUjFNRmRxbFNwRmJKWXdteCtWZXBBVWN5dGE0cHZHU2QzWXl0eEl5?=
 =?utf-8?B?eGd0aEJTWmFEbng2cVdCTkY0MmZQcmo5UlpmMXhTZHhxMkJIdnJOMU5nRWpy?=
 =?utf-8?B?eXJWOUtoYXlnUFBqZk1LV0ZjNDZxL1owTVhWVmJ4VzhUWHRjaFEzTUFXTTlk?=
 =?utf-8?B?ZlIxVDZkQkFqYk9iWDZhbFgrQzVUbXlBZytXT2pETnUyV2RqRnh6L2JnTk1x?=
 =?utf-8?B?eUxDQlppZVR3RnRPeVZob1hsY3VWNGRGVG5sUEFNRkUzTElXRDFZTXNia2Vt?=
 =?utf-8?B?aHNibktPUzlqZVl2UVZhTnpYZTBuNFdGdUtzTUNwMVNpQXlFd3lqNHdmemk1?=
 =?utf-8?B?c0wxVEJ2R1Z6VHN5VVJHN3RkY2dNUStnU21RNy9WRGtGb1Rma2lxL0lMcHo4?=
 =?utf-8?B?QTFqV1AwdVdHN1Q1V09rZGpFQ3BQZ1IrVFl1Wm5xdytyWkVnMFB0azdIZDV0?=
 =?utf-8?B?NDNYUDNZNm9GbVFObExvVWhLVmU3MUYwWFJwSDYyNUNVS2F5aHlab3NYOHBx?=
 =?utf-8?B?ZUNIM1NCaGhrWlg4WnQxQWovRWkyRDFIN1pwQy9mSUQ1K3B4NVdMV1lOdzhF?=
 =?utf-8?B?WGJlQTlzQXJYb2NTanNOUTZXQ0VJcFRsREpFUE9udUs4Ry9xUUlOMXBNc0Zh?=
 =?utf-8?B?RXVnaU94SG5YOHdKL0hCbXQrRThJMHpUS2poUkFpQ2UwYmt3b0pzQ3dkQVBN?=
 =?utf-8?B?LzZZblI3UjNpQjZXY0Fod2IxUC9vanY5dE1lZUdnMW1sL3RTWm9xWVpXVFJ2?=
 =?utf-8?B?bHc0VVV4V0NlbHpCZU14NEZxU1N6MkZ2NTJLNnhzeERKSmwyRmxLWnlNakox?=
 =?utf-8?B?NEc3NHFFanY0QlNjdDhpSUoxdVpRR2hXaXVsVUc5d1hUTjBRK1IyV2VRR0Ri?=
 =?utf-8?B?TzZCU3FVYjBWaHdLUzZJd3A2QXprb3JkekRRb1kzalRtanVzcmIwN013RTNk?=
 =?utf-8?B?Vy95OFdkMVJ4OTdWelZBQ29XYmdOYmhFRllpQ2NScVhEdmRmUTBIZkFONzVB?=
 =?utf-8?B?SEgwUWkxdTQ4N3VjY3AwV3hwbkJLMWZlaDdOTmFEWlNyVFRobmw5MFBvSnVr?=
 =?utf-8?B?VXVlSHhjeW42UGRWaHRsUWlNLzQ5aVRkRVJ3Yi9rQW8rOVAxdXBSZE1XY2Vz?=
 =?utf-8?B?dFVNUUx2N1YzZ1ppVFltWVoreGdhZXpLTlZxRE9jUXZpUENZYXFoZTkvaWVB?=
 =?utf-8?B?eldlOFdtWDNJd3FKdzZXeFRqdTRxT3hiOWEyWDdwcFJ6SnMrODVaVnBRNFRr?=
 =?utf-8?B?QkZPNzZYS0djek5nTWJjYytpRERpbmtYeWpyU0lYTUd4K1hVN1VyQ2Z4SUJh?=
 =?utf-8?B?b0dlNXg1QUFXNFZLRU5tZDBXVGliRUtHNU1XUHBIQlJtOXMyS3VpOXRhaFBW?=
 =?utf-8?B?MmxaOWZCR3B2cGt2dW0xN1ZhdVppVCs1eFJJRkQ0emUyVXBMMkpMMHVyNlcw?=
 =?utf-8?B?NjA1UktadHY0WUsxSko1Yzl5RTRVL3hmZGlVYjF6N01QY1J6Z1RHaFd5QUNl?=
 =?utf-8?B?bE9aSmRKZDhvZmlJUzBmSHNCWlBZYmZ0R296cmhpV2NQTXZCdk9VNStUZWQ3?=
 =?utf-8?B?SDFrd052QWFVK0xiaThhNUFuRFArZ2w3L20zRGkwKzJmL1pVKzc5RU5pSnlE?=
 =?utf-8?B?LzJ5bWs4NCszZW92WmRvTVB3bHJ1WkpWcVdvZENReHk0eEhLaVhrZ0tvTXhs?=
 =?utf-8?B?K3FiQW85TDRKRGRrdDRlWloxaGIzTGpGOUxqOHZwUWFUYTRkQkpkUVQ3ZHRO?=
 =?utf-8?B?dXM3L3YyL0pWRVJuREpRcjhTbWVOSmt4VGdIRzZNaE1BRm8wRjlQYXZyOVJ6?=
 =?utf-8?B?elJVdW9MYXU5ZXBCeExjeXBKd1FYM1dKMXpaU1N4aFZIV1FHeVFpSHJCcXJx?=
 =?utf-8?B?a2FDaDYyUUU3VlFWYmQ4STVtVTNhSWY1S28yS2IrN2o5akZDa1VCazhqUVk5?=
 =?utf-8?B?d2lDWEhpMytINjZxSmYrMVFGK0lKcnpkSmVNeGJQbjFNbkgycUMyZE1GNlgy?=
 =?utf-8?B?L3EvcGJyWnV2empZTHAxYmk5MVlFVWQwQVV3R2tYUHlWbmNwMUo0WThRQXhM?=
 =?utf-8?B?WjNEb2hqc2YxaWtMMFRxclY1MEF1alVSWTdkdmVHL1lxeUN2UUpoay9CenE3?=
 =?utf-8?B?UEw1LzlvNDBOTEY2RFExbmptaFpEeEdSZ0dNaEd0b3grV05xVzV2WGFQcmZq?=
 =?utf-8?B?dGtFa1IyUEI0Yjh2c0R5RE5TeEJjbG1naVp6MVZGQ3BwRXNJTDNFSDUxSW5o?=
 =?utf-8?B?dmtpbFpiS0JKelBkMVE5dStvUE9nWmNxQ05HWmN2TC95TzBEYjN2UT09?=
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-Network-Message-Id: a0226002-ef92-48c8-4bff-08df4c1d25e9
X-MS-Exchange-CrossTenant-AuthSource: AS4P195MB1456.EURP195.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 00:26:58.7745
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JqO1Y+46dQRf8QwgW3AKx3qvyOsf+fQr+KORSHZ/i8DSaP+vs+HvEtRH/jBEGyqa9c8XVhmt+qRc2xlId/gp+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P195MB0745
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_162705_560291_A8E52E66 
X-CRM114-Status: GOOD (  19.63  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/23/26 8:55 PM, Nishanth Menon wrote:
> On 16:28-20261120, Krzysztof Kozlowski wrote:
>> On 20/11/2026 15:42, Wadim Egorov wrote:
>>>
>>>
>>> On 9/10/26 4:44 PM, Nishanth Menon wrote:
>>>> Now that all relevant drivers have are ready, convert the
>>>> TISCI drivers to modules. This impacts all K3 platforms for
>>>> boot, recommendation (based on empirical evidence) is to use
>>>> deferred_probe_timeout=60 in kernel command line to allow for driver
>>>> probes to complete successfully based on the initrd used.
>>>>
>>>> NET Savings: (Ubuntu Clang 23.0.0)
>>>> ./scripts/bloat-o-meter vmlinux_previous vmlinux
>>>> add/remove: 4/380 grow/shrink: 0/5 up/down: 32/-143248 (-143216)
>>>>
>>>> Signed-off-by: Nishanth Menon <nm@ti.com>
>>>> ---
>>>>
>>>> NOTE:
>>>> a) This patch is based off v7.3-rc1 and will create a merge conflict
>>>>   in linux-next (next-20260909), but the resolution is trivial (vs
>>>>   bd94bea7165be450903c6d64bbcb4862e36798f9).
>>>> b) Emperical experiments that Siddharth Vadapalli did,
>>>>   it seems like some driver probes might be taking much
>>>>   longer than the default deferred_probe_timeout of 10
>>>>   seconds that is used when CONFIG_MODULES=y. Testing log[1]
>>>>   a deferred_probe_timeout=60 seems to have worked fine.
>>>> c) Full bloatometer report is available in [1] as well.
>>>> d) related lore discussions[2]
>>>>
>>>> [1] https://gist.github.com/nmenon/5f1587b373e6ca27170593010188d968
>>>> [2] https://lore.kernel.org/all/20260429-defconfig-v2-5-e4ed4186028b@oss.qualcomm.com/
>>>>     See headsup I gave on #linux-ti irc channel https://libera.catirclogs.org/linux-ti/2026-05-20
>>>>     https://lore.kernel.org/linux-arm-kernel/20240821110054.35u5ubgaogzjv6c4@rover/
>>>>     (original thread that triggered various changes)
>>>
>>> I can't boot our boards anymore using the default defconfig. Is this forcing us to switch to an initramfs?
>>
>> arm64 targets long time ago were supposed to use initramfs. It's pretty
>> easy to switch, honestly, yocto can give you a very small initramfs
>> which will you can also extend to copy the modules to rootfs, if needed.
> 
> As mentioned, we are struggling to keep the Image size in control to be
> able to add new SoCs and architectures. But yes, initramfs is the way to
> go.

Thanks, I understand the Image size argument and I know most of the options. My point is more the workflow: testing a mainline defconfig kernel on K3 used to be just Image + dtb. Now we need extra userspace in an initramfs to load the modules, and the modules have to be repacked for every kernel build.

I will probably go via 'make image.fit' + ramdisk. Simons make_fit series had patches to put the built modules into the FIT ramdisk. Something like that would bring back most of the old simplicity.

> 
> 
> If you are looking for something that might help pick the modules
> needed, i found [1] (basic busybox) useful and I use this for daily
> testing for all TI K3 EVMs. kernelci goes the other direction (vs
> picking just the modules needed for a specific boot mode on a board)
> of having all the modules in initramfs. Both directions have been
> working for a few months now.
> 
> 
> [1] https://github.com/nmenon/boardrd


