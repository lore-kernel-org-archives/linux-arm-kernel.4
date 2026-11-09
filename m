Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1144606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 07:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sGeZezDB;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=f4BZZ0I6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=6aHls3ONXXhGbawdy6vAVW6u72+xgYwmkhnvZE4/404=; b=sGeZezDBCUHo3Q8SfTZp5sXyAL
	XqXOtZOVMX+I4UqxNetY6VSqXun4zCAByXwALvfUF48VzPiVisb9bfyisoZPm3fu5yneFT0FbnYHd
	VN94kb+O3AY4ybIVz6AtClJIqUw9DocKb6iD0hcOWoZvtcOZ8FHclt6ulEzdB0i955zC/idd9oNXK
	qgfVNgP2yNTODBJy5H1BifvBXfFdUlTyBK5vNEbbO4lOQdsHpGIVZzOYuCRDldjDHGmpH0Yg9Bz9c
	0t1lYg/eYwKq1aOQyxhxrrc2lLlRV4bR+Fx6Y9xgqX7EEUd7ibA+Y7OY5W8ZT/bTBx6Yfpu+UHGEz
	6sjE+42g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQJpx-0000000HZWi-1Ikk;
	Mon, 09 Nov 2026 07:30:41 +0000
Received: from mail-westus3azlp170100009.outbound.protection.outlook.com ([2a01:111:f403:c107::9] helo=PH7PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQJpu-0000000HZVO-0jh4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 07:30:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hbJihVxtNS4q1BuyipTfSNl2XHwQE2kVzNZwKb2BgYcn/Ri0Q7Te/1DRyhIWeiPcZ0zAgvH+/DkDlKtCQIMFmt5y/5WJAOvfqG1QwLI116qJv70RTcWw6kER8YsyFMEHT2aINQ9cyCWcGtPK3UoFc7OT8rfL0rAxGjrE9oSXsB8Pjsg06hQE/BNmOs6kLc6YHHRqA8u+1Lgjc58Kkop6Rzwj7reJeXS4nEDOxsC/H1EovlpHx5TDbEsvIemOuuBn2FPB/SxwFYGi5VwA7W6TPJ3wuUrgXfJ47PFp4evAMctDiF9i1Bd2VY7a5Kv0+OlwhKxmFX+UHe4JKpBXJO13Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6aHls3ONXXhGbawdy6vAVW6u72+xgYwmkhnvZE4/404=;
 b=h39OPygeeNv1CT/I4vT4OGtRlJMoZ7sKFAwxe4U8+DunL6iFiwNcMvky5A1EddTlN8kaXBaFiL8WCRNKbJJLicHus9J4cx8kByUe3fNiWo7l6g5GyvVUAP9cosNAgUywRgtPMC3t0Aq54YZT0VPj/2vnGAs2d03roIUgFizz9r/n5xBtr766KuU1N3NNFbfrH3iA8rc5ysEUNDNvNwlZTDbUbk6L9tVzcWQnLDfYMgz7c6emgq4ZqbPMmbVr5pLAvOVsUzGXY29a04Ija58/XqNuv2IiZ5QL+JwQdJF8TE9oAbElD1QcsbQ2jfgCWw0xSrFHYqJtferdLagYIUv6+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6aHls3ONXXhGbawdy6vAVW6u72+xgYwmkhnvZE4/404=;
 b=f4BZZ0I6R1UL0+YbIwkFJOI1Lw+9Z1ghsLM0UGO6WXHLQJzv7sYt02z5LUSc6NnOIrWm5w1UMG+mLnZ6JIbvqR46ah/0zue9IZatDGWLIHTLcXciLozqbZVUJhoM/T0magQ77hTXIIZuRafZ2ABvwETc40imSnXG0wZK0Zkc6t0=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14)
 by CYXPR12MB9319.namprd12.prod.outlook.com (2603:10b6:930:e8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Mon, 9 Nov
 2026 07:30:30 +0000
Received: from LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287]) by LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287%5]) with mapi id 15.21.0592.010; Mon, 9 Nov 2026
 07:30:30 +0000
Message-ID: <c220d5bd-2ff1-47c6-9fdf-45fa3d4ff2d8@amd.com>
Date: Mon, 9 Nov 2026 08:30:26 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] firmware: arm_scmi: Drop the ARM architecture dependency
To: gaohan@iscas.ac.cn, Sudeep Holla <sudeep.holla@kernel.org>,
 Cristian Marussi <cristian.marussi@arm.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Han Gao <rabenda.cn@gmail.com>
References: <20261107-arm-scmi-arch-dep-v1-1-514872e8ede4@iscas.ac.cn>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <20261107-arm-scmi-arch-dep-v1-1-514872e8ede4@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0378.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::23) To LV5PR12MB9779.namprd12.prod.outlook.com
 (2603:10b6:408:301::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV5PR12MB9779:EE_|CYXPR12MB9319:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d8c5d5e-30c1-446d-f2ed-08df3e335568
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|11063799006|56012099006|261021123027099003|261021121427099003|261022105027099003|261009223027099003|261026140227099003|261028144727099003|261102123227099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: 6j+HMomAwxDDVcFuMTxJUZ2zaMTcoV3F3PlmMneajGcIgKEBCF0k7n7rdpZk2TKTCUUa500BWTlA+kQzZ426deZNPoBP7Sj70pzvyzMkyFqLtEQIvWwCmvtmaf1f1zE6RseXzbvZSENo27HLrgadNLHOwZF5LqC/P7Fsz+vh0xm01plS2ifQwPg1Dh3CmVib6IR+taGx/snej4Ir8mdorRIiQ95s2JJWfJ1HJf5Vbb6RAudLetOX2Q19MN4NrilmpcclTnYym28620q8eAc6Hy0IXDpmU/HQ4pCr9dWC1Lr+3i/U5Mtek/AISuo+P7NytvYCkzI/0DuAO0YtaieIfT0Sx6p9LRAoTaLdFxPKaB4Si/z37slgCdA/0+3x99V9H0pv9TGT1CJiAbgivJ5KTep2eHUB2lWd+NZeNK5FJt3lyiUnxeTOqMwDYH3v8udCcDLV5PGGbd5a0i2IwR7v86uNn5aaKuIxUYqNVoyYEjNQDchgLZbmq2zPTEVQ34OMkHTG0LJOJFMOeiQq2Q/8om8uhyjddvCX/MSalJqM2GFfizdpw3dRIGs2kDZd+YvN8CCygSNqZkjhmwwuaJs3JdqjrHaqSPwH1yMeevN8hOU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9779.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(11063799006)(56012099006)(261021123027099003)(261021121427099003)(261022105027099003)(261009223027099003)(261026140227099003)(261028144727099003)(261102123227099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UllZbnRsMlFtSUdUSmp4ckZMUXh5RnduSVN3a05RaDJoMzh1K3U4Q0FzMmV4?=
 =?utf-8?B?enlYY2FzcVBpMUdSTCt1c0IyZnhJbnFHMzYrUmxkZ3M5aS9FSjdaWEZmWmUv?=
 =?utf-8?B?R2NBdGlGUy94WUdNZkhIL0lPbTJxVGZOc3A2NXVkanVSZ1ljU3FFN2tmc05n?=
 =?utf-8?B?WDRSMDY1b3lkZGZZN3dCclBtRysyeldvVzRKYkRhRGQ4VEJBUWxZWDdtRFQx?=
 =?utf-8?B?U0lHekJrRGt6eVdXeXJTVG8zOXVNWVF4RXVoRDJ6ZUlYTndCemJ6aVNtWFdH?=
 =?utf-8?B?NlcvMVBGd1pNL3RCdm9nUTVpRVFNUkYrNkRydHAwaVVRSjlzdlBITzBGSDA0?=
 =?utf-8?B?TkNaVmxVYS8zRzRVNzFvZjNZZldISzhqSzlwU3JieDIyMVlSNlJoWlJoWWNY?=
 =?utf-8?B?WjZtSm42QzhWeElGYXBBRDNoWG5VUlhMUk9nZ0wrUWl3UTVVbE11NWNBVDZ2?=
 =?utf-8?B?VmM1eFlvRVdBbTU3enBxMmpGUldJbEc0MVlaVlFkbHMzcXZiUlduWXMyYlo0?=
 =?utf-8?B?QzR4c3FIUW9JMWRSWXVmUGJKcDZ5ODJhV0J4dzh5bnZYVXJOcXJkVXdSaU9v?=
 =?utf-8?B?OGdjdC9DaHV5VlVUK1l3dXE5TzJKTDBXTVN4azh6eU1QNU5ob2ZteFozbzY2?=
 =?utf-8?B?ZjNzOGxQdzIwVmxXRDFiMWplTEFNWDZhTUtLQk5IaFpxZWdPeTd3bUdVdXdM?=
 =?utf-8?B?OUhOb0dZdVZYT0F6SWJxaDFQT2h5MmJpVG1oU0QyNGN4WEJxWExUUXl2cm5k?=
 =?utf-8?B?YzdRbmZzdURLMERxN2Y3bmg0SFlRSEFiZnNGSFpINXdTblFpdUR6clZmVy84?=
 =?utf-8?B?L0tsazNkdkVPeXIwYlhwM25Sc3pQVVlEL3lzdWdUaU1ob1RsYUt1VE5ha08w?=
 =?utf-8?B?V0lzMlEyMnRBU1dkcWQvUmlLcXFQUGtuK3VRQ3BaSlVJdTlNYXVFY3lFZFlW?=
 =?utf-8?B?OVpMQ1VMNWhJcE51NHZyWVRNRjFmZ3Fua2NTajZSLzN6RStIeTNKbElyWU5B?=
 =?utf-8?B?YkdxcERzY1ovS212QmtjZE1Sd1dlemFuODNTbGx1bTUvdUk5MXlZeXVaUFYw?=
 =?utf-8?B?UXNCbm5SWnVzMFJCbXRFL2MwclhzS1ZHdWpiVzBnSHZOcEFNc0QwYWhMclZp?=
 =?utf-8?B?Z0JUazI0Sk5TTVBzMW81c3BLS1FaYlJ2WGtNSjFLZ1FSaWs2eGMzNEpFTzQ0?=
 =?utf-8?B?MFBqUWJ1MEdLcncwM2p2Y2oxM3FOanF4UVJXSW5EU2o4SmVFYVdPRStwR2pR?=
 =?utf-8?B?WkxxOXdvaFVqcnBWTG1oMW1RL1J4RkR3VzJ2S0RBNndENG5TTS95Yjk1dEpm?=
 =?utf-8?B?QmxkZHhiWTF2dWl2akxpUUhpOGZDZ2NXcjFOeXpNZEkzdlpocEZnYlMxWHpo?=
 =?utf-8?B?TjEwSzIydTRNdWY0NkFBRThTVnRhNXdsRkNISjNTT3VOTmY3MFlhbDZveVM5?=
 =?utf-8?B?UWRMY0RMSDZxbkRzZjgxTUdhUUVwZXdZc0c3Y011Vnlxd2l3TWNJby9GTzNW?=
 =?utf-8?B?Y2tZbkN5NjVpeGl1cXh3bDBXd0pkN2pLUjJmbkM3U3JWcGtmL3hoRmZBR1NF?=
 =?utf-8?B?R3RMbGNGUUpYZVgxQVlQeDFOQ3RIWDB3alhOVlNKMlRwalNQZHROcWhUeHhG?=
 =?utf-8?B?ajc2MGpIWE9Fc01WbCtyUzRRbXBETWRaMDJhNDZYM3lhZkhIa1NOT0M1YVQ0?=
 =?utf-8?B?RWEySlNWdE1BOHJYN2pxajk1Q2lud29LV0NKL1hybHJnNEliTWlkNGN5b2l6?=
 =?utf-8?B?ZHcwTGs2NVdPUmhOSGd5QXRsR3VQOUNldlJoOFhVa0plUG1JenMwVmtMUUZl?=
 =?utf-8?B?SEc2cnRTb2hSYTdKNGVvMTlHYzFQb3Q5T1JqUjlYME1kVTZzQmtNUUt5ZHBL?=
 =?utf-8?B?cm4xdjY3OUxDL05CVldWeXlQR2pGcjlEOGUrUkF5aXZpTG9GQnZmTlBtRGg1?=
 =?utf-8?B?UlM1d3VnVVpXSFNUVGpWYks2UC9tdHF3anpGTmZsOFZpMERrZlpBMHUvNkJJ?=
 =?utf-8?B?LzJOOVJzL0VRYlpoZ3ZPV1Y4K21CR2ZBYTZ2RVBCcU0vendNNlgwa0FVelkx?=
 =?utf-8?B?WHlTQW9kVnV1NFhKam5vVHdBa1N0TmhYNkNxRzV0dTRDV3FxNVZVbXRiWXpr?=
 =?utf-8?B?MXIvdGpRN2MzdDUwMmxPQ2ltN3BHQkJ5MEF0WjZJN1IxYXMxWFhPMWlPTkgw?=
 =?utf-8?B?dWNsVHdsVkQ0cjRMWVFQSjVldWVQUVVsbXVZUFIremZyaGNjdnRKRFd1V1E3?=
 =?utf-8?B?U0FReUdrL2FYYUMwQUpkTlRLLy9OUTRUdVdSM1d4YmdaOFVWTVI2aTZwbksz?=
 =?utf-8?Q?9T8QlP0MGieYFsBael?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d8c5d5e-30c1-446d-f2ed-08df3e335568
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9779.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 07:30:30.8267
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: myyK2JMxxz+My+RNF03N+1Pce1kNxPdzv0zqAIzdL9IHylU4wKInKcnCK3HSKNtw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9319
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_233038_228085_858A47AD 
X-CRM114-Status: GOOD (  13.89  )
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/6/26 20:40, Han Gao via B4 Relay wrote:
> From: Han Gao <gaohan@iscas.ac.cn>
> 
> The SCMI core and the mailbox and shared memory transports only use
> generic kernel interfaces. Transports that need architecture support,
> such as SMC, already carry their own dependencies.
> 
> Drop the ARM and ARM64 dependency so that other architectures can use
> SCMI. Depend on HAS_IOMEM instead, for devm_ioremap().
> 
> Suggested-by: Michal Simek <michal.simek@amd.com>
> Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> ---
> This was patch 1 of the Zhihe A210 SoC series [1]. As Michal asked, it
> now goes on its own through the SCMI tree.
> 
> Since [1], it depends on HAS_IOMEM: Sashiko found that UML, which has
> no HAS_IOMEM, failed to link devm_ioremap().
> 
> Build tested on x86_64 without OF, i386, loongarch64, ppc64le, riscv64
> and arm64. On UML, SCMI can no longer be selected.
> 
> [1] https://patch.msgid.link/20261103-a210-scmi-v3-0-ee6b31580808@iscas.ac.cn
> ---
>   drivers/firmware/arm_scmi/Kconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
Acked-by: Michal Simek <michal.simek@amd.com>

Thanks,
Michal

