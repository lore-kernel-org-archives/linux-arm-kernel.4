Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E717E606A330
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 12:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qkSsIkYD;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=ozZiqTVw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=lZpkgS0w8S3Dqy9/UyX6Eo53ys+omCBbc5hHfKa4PYU=; b=qkSsIkYDqfOF6ltLT5hN7qLYBE
	/+Zu80Z0/MvYxw8BSHvYqzWf5o6UnLQLXFWFFVW1WagaiJt+/y1kiK1DYkES+fLEwE8Z7at31UFzC
	GAxViEyRnqsYzeZqxiEv7suT9v96gPZi8FcHgoUDZ0xJ7n3C41WKPMlnYv4g10IJBh/39z4tv8tjN
	0HAokH4Nu4itiMup/gywTFkG/DNE0x7q8j0L0lGLA3Eq7Z3GW1A9gWpU6mm70QAZmDhfd8L2JiQcm
	zkcItcDoqs87ET1H1L7fRlgd/nv3tIOdM56hO4oyv2o4IDfs+T77zK7qUVWTd9JQ1Hu+fct/E6Est
	ZceBXUyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTeKh-00000008mXN-0mpf;
	Wed, 18 Nov 2026 12:00:11 +0000
Received: from mail-westcentralusazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c112::7] helo=CY3PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTeKW-00000008mRO-2ter
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 12:00:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FLZnNAmFtXIR7XlusvCI/dKHg2kL2Sh/MPsP0vfiRzXh9Sh/bxUkHvRPGnkVSjMRN6PKR7GwH4wZeg3o5B1+eiZO2Xq0nfL4TXrZczLeFdnCePiIRSmSnEHXgOyAS/M7LWHwBwCKSJ+ctyFET/ybqBTT3YvNy3+3xsxwtaxdYlX+/9WWH+MT5uVNsO6OFS/MbUX4UVB9u+6oDaGjvOvlroe7O8ZJFCoYV4QTfdrbYuVwNcP0n7jB/5D6LcBKiPPExsS1n5PYR2AYzv3EGoAW6pbfD7U3q1tzcpHNx6EeDPgIIfk4P5EmGEqNwA9F4TcOvJ7SRhD4kX9AiLJGgWB6GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lZpkgS0w8S3Dqy9/UyX6Eo53ys+omCBbc5hHfKa4PYU=;
 b=F2FieokZZY1sA+csuNxheG2DDTar+/ft/NG+w6hKFU765XFEk+Gi1gGR8tkWSr6lGSMI/9L4ORM6a6jxHG0eJd3IKcUhA4YqJbBFX6UFIop49OBiZcNWbkRTxzdxeKbcHYJ5hZqP8I1KrlRxAzZeFP32Vbl+b7dUb6RPCEfETTcMdZUiSsLwYnq4UucCbXIiD7GqCBKgQvdi6m7o30r8BDbyQN8TLhcYB/pBcxW/Inq8CrzoNZzhbSZR8eVzgszT02qVYZXYPDSQ97WOLGhHwkIdEgk+aENVnWz3vise/Llt6DXwEmNsY5nzIqTToJuAzAjQbqqZgLIW5foF7aWH0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lZpkgS0w8S3Dqy9/UyX6Eo53ys+omCBbc5hHfKa4PYU=;
 b=ozZiqTVw6iHUW9xWTEZpuLQPLYjmuWk4EuwXz4eXJtixL5vdZHXjwXyVC+lmafAup4nXfNqzi+qWlORcohbcacV2qoma1nA53n42Fo0yAGNeJwFGG0x3UX3agdd52AjL4djHHTn6vaX5HLX3CTEza1vEM3NAtOQRD2NZ4IoK5S4=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14)
 by IA4PR12MB897148.namprd12.prod.outlook.com (2603:10b6:207:141::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 11:57:54 +0000
Received: from LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287]) by LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287%5]) with mapi id 15.21.0615.012; Wed, 18 Nov 2026
 11:57:54 +0000
Message-ID: <25015d03-981f-4b40-afdf-2c20d3c716c9@amd.com>
Date: Wed, 18 Nov 2026 12:57:45 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: xilinx: vip: Make use of the
 devm_clk_get_enabled()
To: Mehdi Djait <mehdi.djait@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, monstr@monstr.eu, git@amd.com,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 "moderated list:ARM/ZYNQ ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:XILINX VIDEO IP CORES" <linux-media@vger.kernel.org>
References: <8c5500e70fcd2b4da35e985b9f8a976afa1991b0.1794999782.git.michal.simek@amd.com>
 <av2MP0VlOKC5RUXk@mdjait-mobl>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <av2MP0VlOKC5RUXk@mdjait-mobl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P189CA0027.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:802:2a::40) To LV5PR12MB9779.namprd12.prod.outlook.com
 (2603:10b6:408:301::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV5PR12MB9779:EE_|IA4PR12MB897148:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f35da91-f571-4952-d1b5-08df456b2de6
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|22082099003|18002099003|4143699003|56012099006|11063799006|261028144727099003|261026140227099003|261022105027099003|10067099003;
X-Microsoft-Antispam-Message-Info: MGRD/NA3VBCTcNPke/xlzuwQIIy/0LlxrxMcukLI8Dm84n6e0v1+77c+1aXoCRDTyhzSlIZh0T5F6B1L8mperN6NrQoA3vAdiS9/XvDAiidoMmwwkwxdArKJ+7AgQIQm6OSSLCaWkdqiw44VLlwFkccn4GmxMuz9IjX/7vfJDu4a2YI/chh1fe3juQkkRcRbJ8cUJ9LjkQHBkRYf1SbKSLu+L7aCvf770WKm7XxwbhwtyIgBQySDxHQJpqzS8eoK7pJfIBxErvz5gN9IoST8j4q86tvoAToRD+3FMfB+3Qzz78rbs7jOY/BicDm6HV0ZVs3IRgPJw4jWOa6bhcl3N/fEfe+AiuZZwASwYSuEQQOe/IVFEvSvC4AR8jbN5/n7GSQYUEH9lnPszqKKVMFk6fSWCdqKXGg8RrPswu5KslFdNAeZhL5aMkViS+eYijN+SfuS/uI7gcCHrl0B1sJZdeIruimUNaIiQr5uyxhSKwA4fpAIxJGP9I4cVnqVCG8ds1cxvNy9rlEmOhZPQtd5CYz4pFOEtFbht6lXlIJfEpnLb3HTgEQuRoYOk8Eb6o7N51Q4Me6Y4PoK3jtCoyGp8EqE5bylPTM0z/44F8XvTaZq0aD6eEwLNpGe3nG0uHVNYLuQyNA1gGnaEd+45uVpaCOTPWYKJqRdD0vGar1JjpA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9779.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(22082099003)(18002099003)(4143699003)(56012099006)(11063799006)(261028144727099003)(261026140227099003)(261022105027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UHRteFBFWjdoZUFUY0tyWDFNVUorQ25qTTMwZTY0aWdoMWhZZVZCQlVPTHlV?=
 =?utf-8?B?MmJBZi9FOWp5RzNGb3EvRm1RUCtIWWQ4RWRTWThjWXhGZE9vc1dmRVNWL2lu?=
 =?utf-8?B?WDRWNE1DQW5RUWFXSVlRbmt6T095Q2xWQW9VVDZ3ZnpFaklFamNpbFBIb0p6?=
 =?utf-8?B?QjlXYlllZ0RrNDRLTERpYTh1ZFJxbGx5b2hlWUJTNTJpRUxmckp2WFY1VHIz?=
 =?utf-8?B?VlJVTXRQSnUzQXJNS29WOUpQaDVIOUtUUnpTVWR2bVlQNU8yWXcrZjh1YzlC?=
 =?utf-8?B?UnBjR1kxVE5yZ01ERm1Kbk1yKzNSc2tGa1RJM0dXcGt5enNHblZKZ3BVUjdO?=
 =?utf-8?B?SWEzYWpCQ21nMWRLVzgwNjllbGpmUjZXZUlDaUJVT0hvY1JZTFBXbHN2bEIy?=
 =?utf-8?B?RnZCcVVoN2xSYmFMYjZUSHFydGw5ZEwrRWR6VFRQaytkYlJKUDBjOVh1bUtp?=
 =?utf-8?B?MmUwSTF5cGpkRm9JU1JDbElwR1NZV3I2UFVZN0Z2WVJoZG5FS0g1d1BvY2tM?=
 =?utf-8?B?UTN2TXE5enhmRCttRUNvc1BWWEUvRDlvRnJUaWhhUFdRMzdENjRxWkY0bXRM?=
 =?utf-8?B?d3pEODh6N1dtUkZnUDV3VWVQRTNvRU41SlRtN2thSnJnZldXSkszdDRYZloy?=
 =?utf-8?B?djZZVmgvcVd3dkp1ZVBTbGJTNVNZNVZHd2pZZkdoaE5ab1B6SUpJS3RWd1Fw?=
 =?utf-8?B?bjhkVUE5cmFXRVM5eitGbTlvZkV2Q1ZEa0tDRGRGVEhYb0o4bWtaNm1GNWRD?=
 =?utf-8?B?NmdreWFDa053akVJdENJS0d4OU1ndE1QdHowY1kxUi9UdGxqK2xuTXZCNEE2?=
 =?utf-8?B?UVRoLy8wMmZIVEdzd1d3OTF0empwTmFOV1M5SXU0NDk0djNxQi91enBGdUNp?=
 =?utf-8?B?T0RLQ2o4bXgyQW1VdHQwTmZZNjlqV29VTC9UN0hOUllXcTV0SG1kK3grZERv?=
 =?utf-8?B?aG51a1JDeTh4dWJWRllVbnRWVGlxWFg2SFNSbWY1d1piR1hBd2c4S1JOYll3?=
 =?utf-8?B?RFZWQkRTRVJQZ0xwKzF2VStvaUFJZ0ZMUUV5VkcvbTdJWlRtMGpyYnJTTlhy?=
 =?utf-8?B?dWpQcll1SDlWcDhIYVZWQUthdmRacWhNbmVvaE5qcEJrdE1yUC9aSDNaQUw2?=
 =?utf-8?B?WDRoSzNOU2Q5SDIyVk0zMU13cVhuRUMyeXJyV3F4Mk1tRXZOaWM4ZitQNFVs?=
 =?utf-8?B?RTRnWndRWTlGTXZOK3hUYm5TMDlTR1hudHZ2aWExN3J3TTczVHhqTGtsQVI4?=
 =?utf-8?B?dHV3OFpKNlZPME5xVGszUW5oaXJNbGZ6QmtsdklHU2F3cnp5YWdUTjFDMUV6?=
 =?utf-8?B?U3ArM2l4YWp2c3hiTm80ZFErYUZYUEF6dVFPbGRkZDFrakpDNTR0NlRGak01?=
 =?utf-8?B?ZkZuNDJ5QmpoTGt2anhZaWFldVZtVXdwaEkybWZ3ak00dDBJT1ByTkoxcklX?=
 =?utf-8?B?YzNtM1NCdWNjMU14SFZyRjJMOHY0KzVmYlRpbDN4Tmw2NHM5MDhBb0dxV2pC?=
 =?utf-8?B?NWY2N1R2dlNWT0Y5RTJiNzJSS1FsZlE4R2F4cnhIRFhpeTdBY0VuVDA2ZEhN?=
 =?utf-8?B?d3UyQWNOR1VwcEZwenBMNzJhL0ZBVnUwaWdjcmJhV3d0WmgzQUtJdDNRdE1J?=
 =?utf-8?B?QkdmTmVJcmh3TWZjL3FJaUhEeHZBN0lZZjFYYjQ3RXFpSVdlQWJSN0YxZzNs?=
 =?utf-8?B?dGVEUGZBNGIvZnhpdzlWamc3RU1salVRbFQzS3I4NGdlU2p5UTBhRUh3WllP?=
 =?utf-8?B?WUp3bE84WW5mNlp4OXp3ZFhZbTkzaHB6a2pPaGdpMWZBNTJzc0R6eG1xY2xs?=
 =?utf-8?B?cTMwVUVOOUl0Zk1oSjdEMkp1WDZNQ3hTeUowVmIrMjlLT3pmZGIrQzVFV1Zx?=
 =?utf-8?B?UTZNYnRpTXJMMk5YT3JSeTlFOEZpa0dnRnhHYXBZWXp3cEFoNVgwWnNFY1Zt?=
 =?utf-8?B?Y2d6N0lJQUtSS2RueFljbHdLZDN2VEZIQ1B3NlUwTU90WVVsSUxnTmJJSVZO?=
 =?utf-8?B?dk5rcDJrd01nVmVnbGV5bDBtTFE1Vyt3L3dEcTQ4RWhyVXROUSsyZ2tMdjRs?=
 =?utf-8?B?cFlMRThpN0VGcmlIR0Rad1dXVTNDL1EyckFGWnZXU3dBSlNNOURzRStjQTFS?=
 =?utf-8?B?YUtCSWhOa1Y2RFVHT2w2RStrcHU0elJZMmNmQ1laVzZnWHhPOERKM1JHWlNI?=
 =?utf-8?B?aXJScStYZkVra2Y3S1RPNlhUQ0p5aTJYYXV5SSs2L3Rpc2tuRXkzOFhJUFU2?=
 =?utf-8?B?WU1Pc2FKbkp3NGFOK01JL1l2ZlFaT2wvVG5lYnRzNUNQOTFaQUR4Y2k5VkFT?=
 =?utf-8?B?YUpCRGRkbkh1UnZIVXk1N0Q1eG9YUHJ2R21rZUI3dERjS2xyNUdJdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f35da91-f571-4952-d1b5-08df456b2de6
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9779.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 11:57:54.5143
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dOfjLCEnIQ3XTBNv46MKdAxv2RlXcRgtlseyD1Ryje6Ck8OwZOLGN5J79rt1SI8e
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR12MB897148
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_040001_041356_BBAC4B4C 
X-CRM114-Status: GOOD (  14.07  )
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/18/26 12:32, Mehdi Djait wrote:
> Hi Michal,
> 
> On Wed, Nov 18, 2026 at 12:03:04PM +0100, Michal Simek wrote:
>> There is missing return value check from clk_prepare_enable(). Fix it by
>> using devm_clk_get_enabled() macro.
>>
>> Signed-off-by: Michal Simek <michal.simek@amd.com>
>> ---
> 
> [..]
> 
>>   void xvip_cleanup_resources(struct xvip_device *xvip)
>>   {
>> -	clk_disable_unprepare(xvip->clk);
> 
> so the xvip_cleanup_resources() is empty after removing the
> clk_disable_unprepare() call.
> 
> It is also called in xilinx-tpg.c and xilinx-vtc.c
Yes I know that it is empty.
But I would prefer to remove it in a separate patch.

Thanks,
Michal

