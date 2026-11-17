Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BD0C606A883
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 08:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3Q65BN49;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Q2dziBYT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=IYwn2ZYmmn6LaXH6cfv4SjC6a/aDBYyfby/Cf0nrE0E=; b=3Q65BN492DIbZ3sxKGlwnTR1+3
	PopneLhzxZVrDEE4p0Mnvmi9cecT+fhFg10sobfdQ/t3f5wLPYrjSCAZNh2MFFxQKHTzLHHoFaQPN
	t/CGMznwZsI6m+NMvoRIhAr0uTbndEaEagjFrDQ5LTgb4BQCCy7yfWH5vAfIvYYNqisw5UQuga4nO
	uq4vEo1yXMsj2kZRT1X3X9XlOpYi8xmnnx0AiiNDimTWyeBWZP0bPtuoOh6dS2ZivVReOAozY5A9+
	81kGYeImXZ3nc6yzGbbLBor3RFMcAR8QCJNxLGjjDCWQydP6yx5cNxO7YzmAVooJVKvCdTot7sNL6
	XCvzzPGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTEER-00000004qha-2gFM;
	Tue, 17 Nov 2026 08:07:59 +0000
Received: from mail-northcentralusazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c105::5] helo=CH5PR02CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTEEO-00000004qgT-3PEf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 08:07:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eoPjGSlmIU0U/gifA1sxnKVMbjagymaJKtMLQmVF32xCL/TGnsZey2ZNBrPT+Ou4fbrPBdtr3pwI94hTGnfrKunQVvKmh6YQPUeIEhBS+QUCDFTDmSqK8R/G/raa+oLnuILPlFlK+TfwFvmOB3uyP9HIhlh1sCA++tJ5sRGmKKBG9VxGxpiE9rkxo2YAbobDdragxXaZx+2zTgou8Vm/Ew9B6aQmMigIe/YilSO3VvMvSwxkBvi3tPhoewBpkW5EqNedN/wjItbg7w8UeCp8JuhiC9U4t3WZrztItNSZ4WyWcX/G3hf9aiVw1aPcvCw0alVVDYHaD1+Vo6Baz4o6xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IYwn2ZYmmn6LaXH6cfv4SjC6a/aDBYyfby/Cf0nrE0E=;
 b=BTNMbliqod22SVEucTGgobzhCf+kyH7EPZn1BncdGaSGHDyTLEKNGQw52RRoJtR1JiSod/IjSOAYk76A4T/YVTaQwnGYNExAhaDrh7C23RE6xFUyRy4aeXyRxx+T9B6f47V3C9jWox/9VVTxDKISluyd1hjX5s+JHgJ+g3WqeR/YIX9gWlAYwEVdhO0lRP3XqwmWAezco7brSDxNskeTo8dfEHxZJVATNocIexG8MG1GbNmXEHXbukuHFUnAIx/Da05oN0i8usueBlba8boG6b7Cn4B0T7wJDgmaMzj6Q7UPIApFOcymzd0B3HiaAxdi5Q+2m/G47RhThPZnuE+sog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IYwn2ZYmmn6LaXH6cfv4SjC6a/aDBYyfby/Cf0nrE0E=;
 b=Q2dziBYTdVayf/AnKL6nvi4DxvJ4GHpP0iI6Wn0M6dO5CGYXEdmrP2er8WsBVDpWy2FD5HYzNy0vLq3AEyyem8pfnVsrYnv9miBqrRYu6dZ0c9bph4zAahlHJpFmxw86ro69/8ODTG10sBoQtlGnJ3axpzJa5SHx2CkwWMLGJCU=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY1PR12MB9559.namprd12.prod.outlook.com (2603:10b6:930:fd::14)
 by SJ1PR12MB6147.namprd12.prod.outlook.com (2603:10b6:a03:45a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 08:07:48 +0000
Received: from CY1PR12MB9559.namprd12.prod.outlook.com
 ([fe80::1761:23a3:6ab5:fbb8]) by CY1PR12MB9559.namprd12.prod.outlook.com
 ([fe80::1761:23a3:6ab5:fbb8%7]) with mapi id 15.21.0615.009; Tue, 17 Nov 2026
 08:07:48 +0000
Message-ID: <6b94c488-fce4-4244-8cb7-6e10ced6a20e@amd.com>
Date: Tue, 17 Nov 2026 13:37:40 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 13/16] iio: adc: xilinx-xadc: Add helper functions for
 the device setup
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Michal Simek <michal.simek@amd.com>,
 Conall O'Griofa <conall.ogriofa@amd.com>, linux-iio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 git@amd.com, Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
References: <20261110050201.1850399-1-dileepkumar.nagavarapu@amd.com>
 <20261110050201.1850399-14-dileepkumar.nagavarapu@amd.com>
 <avNFaNki0m47M80d@ashevche-desk.local>
Content-Language: en-US
From: "Nagavarapu, Dileep Kumar" <dnagavar@amd.com>
In-Reply-To: <avNFaNki0m47M80d@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0232.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b1::16) To CY1PR12MB9559.namprd12.prod.outlook.com
 (2603:10b6:930:fd::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY1PR12MB9559:EE_|SJ1PR12MB6147:EE_
X-MS-Office365-Filtering-Correlation-Id: 1dbeddc7-2d35-4274-df9b-08df4481de86
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|261026121527099003|261026140227099003|261028144727099003|261022075727099003|261021121427099003|261022105027099003|261102123227099003|4143699003|56012099006|11063799006|10067099003|22082099003|18002099003|261009223027099003|6133799003;
X-Microsoft-Antispam-Message-Info: HyLOI4DBwLkj/LmulSSDFnqVeiqFI9MrAjf/wlg/kXC2rhWrK7zKIkD7SCHO/bcrd93aatz3pbNe3H2JwfTLn+dH+PktcqZ2QzLokRJ1ltLD/gz++cFdQB+gN6Sy81VTWRyV50UXb6G+HdL32gR2k7CZ9pPiDKKR8W4GkoPleHuaOH/cFjLzvhaXv+TTEBjdKZI6a1x/CmFGEwyrjHxCnb9PL/m0fErIaXML0ZhSdEvmLhEKmFslyS8v8TyKbWq7jUWrBhJDofgN0LpZnQyKxRRBnG65uwZ56K/dLKiTy0i6EDLx6R3NCsP6xm3tgUOhjrVN7DAw6wpYi0YR/v/2Kc/9ihZeVd0aPBzy+Px52nDfPHID/21tIrl0HwiKSQBC3VldXpjCEpjJfLlh5RGlWo7nNG53NoMUQm/qS1IDyu3cTegHB29WnXWbx9Vatm42/y4XSpnMRC6IrE2QiCSF5cXaenjfulAZnczhjw9HNYIFaUgVwXuVFT1mJtZPNknkRddzBPkKyPxu9ZARzwmgcPSgUWXchtNl9rSAN8iQpgFVHuCktBKTB0CBi/IsMkG87YIP0KQbvrpII6a7LK2Gb9RpX0Hxmw7WZtlbHszilYg8iRkIgHW52wXSHl8i1fsh9VL18hpBvCA8ufCAi6LZJ+Cdfpf7O0JMy5H6hE/ath4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY1PR12MB9559.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(261026121527099003)(261026140227099003)(261028144727099003)(261022075727099003)(261021121427099003)(261022105027099003)(261102123227099003)(4143699003)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003)(261009223027099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NENud3lSZkZWQVorN0lTaUw3YVVsL1lIczViTG8zT3B4KzhQYzV5aURlMVEy?=
 =?utf-8?B?NXJUYndwdlJUdEpVZFBsY2NJTTBaSGswRXUvK3hYb2UxYVgzVEZKM3BrbzVN?=
 =?utf-8?B?VXhWM3VsU25JYzZhWXg2L0x1SjZ3a3h3VXYzSGdUOFFOZnBmcXU1MGE4NWpN?=
 =?utf-8?B?T0VxR2lKOUFzZVE5ZDJRcG41SEtmZHF6bUs2QTNiMWF4MjdINVViUmV4QTJr?=
 =?utf-8?B?NHIrK3ZUWitwWEJmRTRmL3lQWkl5S2k4dktpTHRSQ1FkcHZqWTlPOEx0Q3Vw?=
 =?utf-8?B?Q3FoMDRHckdOeXRQNTdqT0FyTS93WTVNUDB5cThlUDhsYnF5eVd2QlhSSWJa?=
 =?utf-8?B?TjRwazZ3YmVjVHpTUE44cU1Jby9pL1ZnS3lpN0lZTTYyZlp1ZmNZWHRYTmtU?=
 =?utf-8?B?UHBBVUNSNGtZM1pVOFpIMmxSbGRFWTFISXhPUjI2emhrejAwaG9tQm5tQ0R4?=
 =?utf-8?B?UFdWUGVUbDJoNnpsZ09hSTFVcjZnMExPV2NoL3Q3OE9lck5IOUwvU3ljR2NW?=
 =?utf-8?B?YlNyWDJFS0FwblhTcVArSmZOZnFMSTdnNVJSeUs5S2wvTitReFoxVGRraW5p?=
 =?utf-8?B?SmJ2R3MyR3JRUmFReld1TEdRRTMrSUFmdFpZSnVPVUdkbHZGT2s4NW5jUWhv?=
 =?utf-8?B?dWlINnZ2QklqSFgxZTNFZWtnNVhIYTV4c2RMR2ZtdUFXbW5IUWMxWGw1Wlor?=
 =?utf-8?B?WTduanVPRFVuZ1dvRXIxcUM0UkpKZXEwOGVCc2wvc09Vdm93ZnBNOFMvNmN4?=
 =?utf-8?B?a05MZ0ZnK2ViZlMvYzVha2hHbmdGZVM2T3g4TWM3TUhUQlJpdHJNWFF3a08w?=
 =?utf-8?B?cUl3dGxUcEg3MmdGVlRWdHpvdGZjS05jT3BUc0lkV2llY0dpblVHZEY3RG9W?=
 =?utf-8?B?SlM5WHF1TXRmbWQvQ1BVVUluTkNWWU5udy9ZVDBpUnhmdFJCSWFqVGVvOGdW?=
 =?utf-8?B?QzcyNkFvaU4vQUwydHFlRWtOV3pocmxYM3N0TTI4QURCTERFdkxrK2pIbHp4?=
 =?utf-8?B?cUJ1cmszQS9xZ0YvK0lzUmx6aXd1VGJYYjdjY0VpTC9DU1lETlBVSkNMZ242?=
 =?utf-8?B?RzJLeExFSXZDMDdzTmdjR0lJRXV2S2RvR2t2QmtYWGd0V1FLS1ZvTGJ0eXFi?=
 =?utf-8?B?bHErMnVCK2J3RXcrOGM4NkcvU24xY3ZFVWdrVGw4NnBidVNZWEh3MklDelR3?=
 =?utf-8?B?M1UzUzB3M1Rqbk0wUzFydU12cE9OMDQvbVgvais0VzNVYTBUU2tIWE45MXNI?=
 =?utf-8?B?c2tqTnBCOGxBaWtYWi9lUml3TUExQm9nK0tuM3czZ1Q1NFB2MDZ1UUJ3MzJn?=
 =?utf-8?B?WU9wS2FpUUZ2MW1wNjNSaDMzZUlDZG1QZW1oUnhJK2M0ZVRWcE1FWFV3aEpN?=
 =?utf-8?B?SkVEdXdScGtXSHdrSmtkOEV1bWJvTlZSNDNzU2tEUFk2K3BKcmlNMm9DbDQ4?=
 =?utf-8?B?ZDB0L09kbEE3ZVQ3NTEwQk4vNzJhSXNkYmJKMTZWWWl2U0sxTkMvaXA1bFNW?=
 =?utf-8?B?STQxcXN0c3RTbVlzK1FaZ0MxQitlcktkYWxFdjg2NGpEcUxIRHVHWmUxTXd0?=
 =?utf-8?B?b1Zqd3hRdGwxdko2d05KZWo4RGtrTmtvanZRcjJRMGRLYjg2KzFTRmVOTmdw?=
 =?utf-8?B?c0l2OTlTWlIzUkorMERXekVFK1pMYWVkZE5zd2JJb3BqK2hWRnhMZmJpcURy?=
 =?utf-8?B?ZGduMU40OXFhZisrVEp3QVFzV09ONWw4MUFVS1BOc3VDU2JxaThzaVFYamcz?=
 =?utf-8?B?a2NMaGN4VStDVW9RS0hHQkZTdUVFelFoSW9BZTVySHBLamJHTmJQTXZFUnYw?=
 =?utf-8?B?T3ZKMk5KWjl2b2ZNeW5CRnQxSUpJNkxnNURaaDAxTmRXOC84dHZ0Rlcyb1Vh?=
 =?utf-8?B?M011Ujg5c2ZGVnFaSkxGRXIydGlMZ21kSHl2N3JWUTNMQVVGZ0pFUmFDM0hR?=
 =?utf-8?B?WUFYWW9pdnM1ZHFEckdEVWZiazRUVUJCTDk1Rjh2N1NNdE5jb285L2VIYkEw?=
 =?utf-8?B?VlVmSGl4Y0tWbE5MZjI4TnpNS1B4SUpUTVpYK2VHcE5CM1RQYUFOeGFlZ2NK?=
 =?utf-8?B?NUlrTjVaWEFPOVRXK3NTVTZYZFY5QVdBbStoNWVmN283M0Q0dE9lR25SMGVP?=
 =?utf-8?B?cSszbjF5NERzWWtqKytwR25hTlZEUUNlN3haSm44dGFtNmNKNXJ0S2ZtRnZJ?=
 =?utf-8?B?TzMycFVuV29Lb0JPUnB4LzFrMkhORUZLcDBkTnV1aEZQbW4wSlpRWDE0Z3Bj?=
 =?utf-8?B?ZHpNNm5kYTJpaWQrR09XakhYcktoanZiemkzYWl2TWZOZ09IdXVWR0h6MDVa?=
 =?utf-8?B?NkdRTVY1bDRPay9LZDR2bXRxSEJ4ZmxkWmVGR1ZnbGJnMkRwblhzUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dbeddc7-2d35-4274-df9b-08df4481de86
X-MS-Exchange-CrossTenant-AuthSource: CY1PR12MB9559.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 08:07:48.5702
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6dHZTp40/ZkTtEWXuuWWA1vO6zL38g1j3jsjUhTEum6FIm1PXP6kdr+/YcD+4x6w8C8TJK4FjGPRmk4B+3sBGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6147
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_000756_855087_19F38C0A 
X-CRM114-Status: GOOD (  22.49  )
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


Hi Andy,

On 11/10/2026 9:55 PM, Andy Shevchenko wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> 
> 
> On Tue, Nov 10, 2026 at 10:31:58AM +0530, Dileep Kumar Nagavarapu wrote:
>> Refactor the platform driver probe function by extracting device
>> setup and configuration logic into reusable helper functions:
>> xadc_device_setup(): handles IIO device allocation and basic setup
>> xadc_device_configure(): handles device tree parsing and bipolar mask
>> configuration
>>
>> Move the bipolar channel mask calculation immediately after
>> xadc_parse_dt(), as the channel information used to build
>> the mask is populated there and remains unchanged before it is consumed.
>>
>> This refactoring reduces code duplication and prepares for sharing the
>> common setup logic between platform and I2C drivers.
> 
> ...
> 
>> +     if (irq <= 0)
>> +             return 0;
> 
> When == 0 is true?
> 

irq == 0 is not expected to be a valid successful return in this path. 
I’ll update the code to use the suggested early-return structure

> ...
> 
>> +static int xadc_device_configure(struct iio_dev *indio_dev, int irq,
>> +                              unsigned int *conf0, unsigned int *bipolar_mask)
>> +{
>> +     int ret;
>> +
>> +     ret = xadc_parse_dt(indio_dev, conf0, irq);
>> +     if (ret)
>> +             return ret;
>> +
>> +     *bipolar_mask = 0;
>> +     for (unsigned int i = 0; i < indio_dev->num_channels; i++) {
>> +             if (indio_dev->channels[i].scan_type.sign == 's')
> 
> Wasn't that changed to format?
> 

I'll switch to scan_type.format == IIO_SCAN_FORMAT_SIGNED_INT, is it ok?

>> +                     *bipolar_mask |= BIT(indio_dev->channels[i].scan_index);
>> +     }
>> +
>> +     return 0;
> 
> Don't we have a specific for_each type of macro to iterate over all channels?
> 

I couldn't find a for_each helper for iterating over all channels, so I 
kept the plain loop

>> +}
> 
> ...
> 
>>        irq = platform_get_irq_optional(pdev, 0);
>>        if (irq < 0 && (irq != -ENXIO || !(ops->flags & XADC_FLAGS_IRQ_OPTIONAL)))
> 
> Side note, this conditional is wrong. It doesn't handle properly deferred probe.
> 
>>                return irq;
> 
> --
> With Best Regards,
> Andy Shevchenko

Thanks,
Dileep


