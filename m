Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D8C5606A336
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 12:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=i+P43gVz;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Y9jNnm1c
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Gi+L3OLKdxrqGAcuefADwRs4WDSM0xL9K3+7rfnsGp0=; b=i+P43gVzh2p9RKXRDX/6iO0bja
	qd4b+b1n2WTvzyVV3Seuy6rWdR7Uka7XjlmBjfPIevBGsiXjH8zU33vcBtUb5lJOFeQ3/juRzhUz+
	AIFi7MgBAWQgQ6Awy5oUrrtiWzRD5mgKv9o+SZAk1YVvLN95d8TNBZsVPRWV5qN24EfbmihCq81Hg
	ZwRX7gwv4L45tG3MSQlQYXypcLxQaa0eJGJC6FY5PWkGHR2SCVHnr0PcNUBK2zTSIOP7i4AYQIv0+
	Sjafjj3PUs7c6TfaxoV8pTQuLiDWiWNBDm89Ck2LzQB7+p/hPjanlb35YU4rVyWrFdlCIOVAHihTI
	wnLUK4RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWXnf-0000000D2A8-2rMD;
	Thu, 26 Nov 2026 11:38:04 +0000
Received: from mail-southcentralusazlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c10d::1] helo=SN4PR2101CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWXnT-0000000D27T-3LYL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 11:37:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xxrN5titx3Nrbr4DVSf/WugQyhZOo2cIxHhW6iDrDyAluZNMJTAQrD01O0/y9Gl1k0zAbw+wITEd8y8VBWTYnhZVBrBcSlwwjSR4oK5E53CUwx2INWCH5m2aDlA6Xym5rObJWsQpJUSYtPlacx2OAl87JS0awQTgALo5KZvlT7M11NRW4h5UZzkjFlU4+IlTT9kb0j3/b4iLnqu7IPXITxf8hocmC5I1nVM9OdEjNKGUP1M6gS0rReJl6ZYHTS+DQkyp0xo0lYzB8J7F/E8FN8ZlrX+KuSsukEo3TFejvNjJrWNDvHCqJCAQt6fNmSBvbrCZTaPROsaRE1+HdoOQ9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gi+L3OLKdxrqGAcuefADwRs4WDSM0xL9K3+7rfnsGp0=;
 b=FLpLfIr6lH+3VGx3p3XHlXhQ40Ukv34I8iGNrHPXCzvdagNEvUSbK4xZK801lEHcwR6T9jAEapMV0wEaGP0U+INOOSGGOAZrxmYH+k4R6FbgO+Rn7hVb60XqeL8Y8hqTLU1gV1D5eRQHs4ZiQ4KexI6CWyd93ILkbctsBGqDYQAnkjXVoYTnzQ9ct/64bnQNi2WlenWy/Z0Mli6DDvS8p6oI3huoQk+KVJtkWG7+7d1GS34qiR/4ULAJAl8yuSX0i3SM5UQOuI9tET29klzh6DPfi7jPd4hEIBDbXuUNsPBAxPx6I/k6EEuMVBjzonCBFIVWksQJM3N0j3lUFX/BOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gi+L3OLKdxrqGAcuefADwRs4WDSM0xL9K3+7rfnsGp0=;
 b=Y9jNnm1cfma4472YOEyqJ2L3qawj/xISpprCRxUd6F5BHe1qYjT9M9AHj6NyPt1+XYVtsmbOxiv9D/OUA2UmKORrrN+hfl9VJmef1wHMDl6qXpccr4F5t3F7nKNoW0u6cTEEX9GWg2n1+5pOBF2eVepFR3wkfqm+aGgKIxxFJn4=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS5PR12MB052986.namprd12.prod.outlook.com (2603:10b6:8:47e::11)
 by LV0PR12MB259608.namprd12.prod.outlook.com (2603:10b6:408:3ef::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Thu, 26 Nov
 2026 11:37:44 +0000
Received: from DS5PR12MB052986.namprd12.prod.outlook.com
 ([fe80::4e51:5777:a687:af48]) by DS5PR12MB052986.namprd12.prod.outlook.com
 ([fe80::4e51:5777:a687:af48%3]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 11:37:44 +0000
Message-ID: <5189edd9-e1e8-41d1-bf00-2ed4302485d5@amd.com>
Date: Thu, 26 Nov 2026 12:37:40 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] firmware: xilinx: cleanups and debugfs fixes
To: linux-kernel@vger.kernel.org, monstr@monstr.eu, git@amd.com
Cc: Jolly Shah <jollys@xilinx.com>, Rajan Vaja <rajanv@xilinx.com>,
 Ulf Hansson <ulfh@kernel.org>,
 "moderated list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
References: <cover.1795094242.git.michal.simek@amd.com>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <cover.1795094242.git.michal.simek@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR05CA0009.namprd05.prod.outlook.com
 (2603:10b6:a03:254::14) To DS5PR12MB052986.namprd12.prod.outlook.com
 (2603:10b6:8:47e::11)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS5PR12MB052986:EE_|LV0PR12MB259608:EE_
X-MS-Office365-Filtering-Correlation-Id: 6780edfa-dc6d-4306-9a39-08df4bb1b02f
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|261009223027099003|22082099003|18002099003|11063799006|10067099003|56012099006|261102123227099003|261026140227099003|261028144727099003|261022105027099003|261022075727099003|261021123027099003|261021121427099003;
X-Microsoft-Antispam-Message-Info: zip8RLWVseUCqX8OQG71Mm8Ry4r8WJcTe3YL3hXyuNHVDu3zdK7RLaYgPJwsC/7eCfCxQVYk1VP5D0P44VMSZaMRvx8IgS7uog+McAsQ91mZLNWJZ8t4G005B7vE0p94YyC2jaI0yRvcHT54K4cMkhVWSHk5TDbwXbe2bjIOFdOehD+qbRM4jaN2+0uVMdqImYp4FwbLuYDlotP8OoM6JZusX7/HoCzWLIuXlv+9ju4lTTmQAOeQPAqVUip9hKjJlwfep4Qqz/Gew/UIJZAkqL/vmq4W+1FqOAztIDbhXdf9Nt0WQkyCsO+m9mFjTS/a4rzCjVw4Ov52WJZztqH+PsLc8EXZsTek4zBuLuvUk9fhpEh0pK4PdnEVbk7nODfgMhF7MFVVb/EdT+SxGFUGi6nw8XIwAHrjj5Br4p60O6duN2NRrxQh2c4YU8xwTyREDn7+dgOhsC7WBzCKsuDA5od/DU1zOt1tSxsKAograb8yPcJyGFjidqp+71PhkLdEHbxxS7GawvNR3B9kCANygZv9/cl5MeHDFCqRmY5uykk2aJA4qzlLw1T9mU/v3sE2JqNCfp9U2QjUuatO4HjGRqlIl0Lqs9snPE/T/g4zdNq2GSS/2JeCAORuzLJtS5Iqh4KeM24pAmmlGV2QXRunXckXlrsXDjRhqXt3vcqnar0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS5PR12MB052986.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(261009223027099003)(22082099003)(18002099003)(11063799006)(10067099003)(56012099006)(261102123227099003)(261026140227099003)(261028144727099003)(261022105027099003)(261022075727099003)(261021123027099003)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eG9yRTZWS1ZRYktsTkpscE15ZUNHcUJpblBEeFBKU0RtZUYzQ0ZudmZKR1RL?=
 =?utf-8?B?Mlh4K2gyYThmVEFGWFBzN3pJYWlCeERWOWJlN01xOUJQWTRoM1R4aldJVHlP?=
 =?utf-8?B?d1NObHZneUgycERBdHd6RWU2TUpoV0FvK2RvOEQwNkVXbXpMVU9oelBYRkM2?=
 =?utf-8?B?a0pjUHBhdTB1V01XY3FpajB3a1JMTW9wUW1WUEQwSTFpVkVEWVVJMTRML3E3?=
 =?utf-8?B?VFFqbHdocUE0QWpqeHprdGVIbTJ0RDZ5ZzQ2emNVSVNjYllFc3lqS0hiR0Z4?=
 =?utf-8?B?ZzIvVDYrM2VwZEZkZEs5NktOM2tXM3hxbEVOdlZMczJGSVdneVFTSFVseWk5?=
 =?utf-8?B?cHRLYndRaFBqK000QjBrbG1tV3BKd3Z3WlNsU0l0U255a0QyMmVKV2ZOQVlC?=
 =?utf-8?B?dEM2YjZ5d1hNZ3Y1L21oRWlxWEEvYmZwK1FPNXNyU241MkdVUE9RaVBVelZ6?=
 =?utf-8?B?TEkxUUxSZ3llZWVaU2Q1b1hxclo2cy9iNjdvWmFTOExCTWsrWmFreW9WeGdK?=
 =?utf-8?B?TjVVNVpwdjVkZWovWEtBbVdYM1hPYmg5NXBJRzVWMkNFeTNMSTBwOUVHOXBn?=
 =?utf-8?B?Rkk4V0lvSDBLSS9McW9WbCtTRWF5VG9wSXJzYWpJa2VXMFFoTElTWUI2VTBl?=
 =?utf-8?B?SVFBWVluOW5DUVFhVDZyenVsU2N2VVBtOTFWa2VncU9wNWp4YXVtaFZubTBr?=
 =?utf-8?B?Q1J6N0IrZTVkN3B5K2owVCtnek91S2FkZTFLUHlrSVNEYmFjS0poV1p1RzJ2?=
 =?utf-8?B?TnMrZTNwTUk4WDBUcTBiWlAzanRHQ0oraVdXcjYwbEJBc1p2UG5CQUx1czVw?=
 =?utf-8?B?VWtPbG1zcW9vRDN1SUhnaExYTjZrSlovVkNqb0p1MXlVVlpVKzBRTjRuL0hk?=
 =?utf-8?B?QWw2b1ZIY1R2Qy9ESjkvYzN6RlJtRkg3eXV6UW9qeHdIZkNkVmRmVjlTOCtP?=
 =?utf-8?B?SkhyZGY4R00yRnZTQ3FqbWZlVkpYZW43MC9TNVdwNmlZWHNNRXBTM3VjdmM5?=
 =?utf-8?B?MVNXR0V5ZlVjQmlyQUt0cHlwd0VvbDMwWThFalJ0V2h4NGU4RzhRUzdZRUFX?=
 =?utf-8?B?UjI1T01TRUtnQmlNUE9nYUpkUE9qWUE0MCtsM2swdytHODU3Vi9RUmNFeVhJ?=
 =?utf-8?B?M1prRWxRc0FmbEhBeVlPZkdmZURNTWlESzQ1RDFjc0NkVEJJc3lHZnBBaWVI?=
 =?utf-8?B?aWhGTHdFWUgvTGZWd2FmZXp0Rmp2bWF3cE9NdUMySERhSEphNXg3NXFwNnlV?=
 =?utf-8?B?a25hb3pLSElWdzRCSUlmbG8zbENFZW03UmlKTzVHVkRDK3hPbmZYaVhqUWY2?=
 =?utf-8?B?RkUyanhkZ0xpS3dHMlNNT2pMSjd4bFZ2dkF5T3FIU2oxUisrcnVEMkpkdUlv?=
 =?utf-8?B?em9HZWZJOGpCOW1iOXpUTGdIdm5wRnlNeXM2ZFZSRnRqYmFlaUp4VzBUNnE5?=
 =?utf-8?B?WUcyMlFvOGM1R0M2dDMxQVd6Nmx2R09LRWxyUUdscERRNUxsMGQ3TlMrREw1?=
 =?utf-8?B?ckVvejlHTFRRVlVNcTYwZks1MkZsNVl3WWxvNThtYmNuZHZSc05TdHZWMVZn?=
 =?utf-8?B?bTYvY09ONjdSODI0VzFidkptenRNd0FqNURPUEVIZTBCMlZXdTY5RjJKQmhV?=
 =?utf-8?B?cTdlNitoOFIrdmx4NU5kTkV4K0NqUU9Sd2VJUXBIeFpFRzN2U0xia2VUdEYy?=
 =?utf-8?B?OU5mQkh5TE84RGhDdFZCRmV1UjQzc0xvc0ZzVzJ1cGJBdUpvNVd5bCtWZkFn?=
 =?utf-8?B?aE9XKzFOUzRjbURYU2lNVlF0RzU5cEwyVVd5cGt4NFdHVm1OKzkwRTJSWkox?=
 =?utf-8?B?bXE0RXIyVnFMT0ZYZWxWa29peXo5OEdPc2J3WU5UcG1QRFBKQ0g5SUlGUzNO?=
 =?utf-8?B?alRNYlZLUEpqUmJqdW1MbFllTXE0Q0RxQWZ6WU5tZ1BOV1B3TkYweFNMTWda?=
 =?utf-8?B?Q25Vd1JiUnVHQXNScjdMZlFHRUpwOUN0aGlPMzd5b1o0N05OU2E4OFB3TVhR?=
 =?utf-8?B?OUgxM1RKV0JaeUF3dDB6eUtKeFRTeVVxa3Q2SmFFU1luSThzZ1IwSk5yMWNh?=
 =?utf-8?B?Z3NzMkRWR1hsWkNGUUhUaHZXSE1BQjMrZ1JEbG1zUlZTV01YMUhvOUdGenI1?=
 =?utf-8?B?YllydUhVSS81WXhZQkI5UmlnT1VBL0xDL28rRnFSZUR4VzFTRUMvbHpHbkNI?=
 =?utf-8?B?bmF3NVh3b3M0cUdXZE1IYnhKQ2FqZEw2Vnp6TTA1aHBTTXV1WGcwWFBmeWxs?=
 =?utf-8?B?eU5PK1E4NHlQK21kK2tSemhHM3VreXhoTDRLdkgySDFFMW9mb1VPb0ZZSllj?=
 =?utf-8?B?N09ZZ0tPZ1M1QS9SOWFwbVNxM0l1eWJVcFQ0Qk0wNlhzZTNOcTc1UT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6780edfa-dc6d-4306-9a39-08df4bb1b02f
X-MS-Exchange-CrossTenant-AuthSource: DS5PR12MB052986.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 11:37:44.8365
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s2WMTS8/USwEAA4K6eqOgAo6n7hLru5Z9w/kCuNW0FNrVQrHr4L3h26JOrer51BJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR12MB259608
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_033751_847623_75421505 
X-CRM114-Status: GOOD (  11.83  )
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/19/26 14:17, Michal Simek wrote:
> 
> Patches 1-3 are preparatory cleanups of the EEMI call path and of the
> sysfs registration.  Patch 4 fixes pm_init_finalize() never running
> when a firmware consumer never probes.  Patches 5 and 6 fix two
> debugfs issues: an undersized ret_payload array and an unbounded clock
> name copy.
> 
> Each patch builds individually for arm64 with ZYNQMP_FIRMWARE_DEBUG=y
> and checkpatch --strict is clean.
> 
> Thanks,
> Michal
> 
> 
> Jay Buddhabhatti (2):
>    firmware: xilinx: Change debugfs pm_api_ret size to PAYLOAD_ARG_CNT
>    firmware: xilinx: Bound debugfs clock name formatting
> 
> Michal Simek (4):
>    firmware: xilinx: Use late_initcall for pm_init_finalize
>    firmware: xilinx: Call va_start after pm feature check
>    firmware: xilinx: Add comments about number of arguments
>    firmware: xilinx: Call pm sysfs out of dev_groups
> 
>   drivers/firmware/xilinx/zynqmp-debug.c | 13 ++--
>   drivers/firmware/xilinx/zynqmp.c       | 90 +++++++++++++++++++-------
>   include/linux/firmware/xlnx-zynqmp.h   |  3 +
>   3 files changed, 78 insertions(+), 28 deletions(-)
> 
> ---
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> branch: xnext/firmware
> 

Applied.
M

