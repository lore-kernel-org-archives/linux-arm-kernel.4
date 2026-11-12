Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BED7606A321
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 11:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Uoa+3LZ4;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=hLaIA1zg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ObbK7DcFrrnAFnco2vakl0ICKmRsOJ2xnMm3XbyFtu8=; b=Uoa+3LZ4TKWodt4L87JY+lLyDb
	BMM2MJVqYPx8RvuHyCHUkdFyINFiz9hjgU9lI7299+CKc18slm2H0HxJBEtXFdg9dE3lHXtq4EJVA
	P6QDZyl8zkRyiH9+UG8ORf9ARZTpi1AZtBIqNj9Q/qtRlGw9EED01q4TPV7CN1sx6bAlCVeGURkWq
	BmSDUe6aDbJTzsAfJiKT+UTuLAjD2vETSLNEVaSsNhQJZG7QDOnfiJN2upZvsBp7Du1uL67no9FJN
	GoRFQm4kBzQA4/nVXxOVDuxAtwjnU5MMucfbMdXP0zfJDgrApQ3lvRcNOBWjK73v1hxTvnWZETbUL
	KWjw60Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRTC7-00000009lG7-1P6B;
	Thu, 12 Nov 2026 11:42:19 +0000
Received: from mail-westusazon11010015.outbound.protection.outlook.com ([52.101.85.15] helo=BYAPR05CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRTC3-00000009lFH-2Bsi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 11:42:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ccY6wZv//LbvkfQdr8urKe2Z02sBiqKKxrczeMtmuGrdWCTH+e7EDh5wNQIJz8ibUtnsmvPxM+iEhV+AwzEndfzfKft88ZCtvaLryHigeRKRoBIBbeTq/JVKsPpQ3yU2/X6RoOFtdc9SCrTPOjW+8wnk56nHpdKu2aisWh4CwtvGgaqnDdFk1wC1OuOIE1e8yAiPdw249dGtDpzPYvlicRBzJqwtXWo6p4b8jQlo/emnI2xDzBO5Yncj/lrjs+7+/guvPFrCPoSs/UrSxKzdrXBhk4HO1wMYm13oTu5kl00sOIiA8rB/2CHkzDPFVGeD+ibdOLMPz4qJplzG0XydTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ObbK7DcFrrnAFnco2vakl0ICKmRsOJ2xnMm3XbyFtu8=;
 b=xuEog6Hy4hPRORKYTXfLxw83/Szrhtmo3IrmJjzLTNIeSIj5rPgTvNQ0fpGDrg9xf4zipGgp8RsW2FrfxTndnbaw7cBgXsf6iJetP4jnxgzKBJnGcchv+2BD3L+dOW1mauFNl6CX7JZM46I8uy1lJls+MGUSYrk16ZyzCPD/zJ9vrLmdS0iUs6oMSyhQaKL0/ulrwh1D1eNureN5oJLhKJVQZ43MTeorFNZ1KjqAlS2H1o0gQZt1B2+7vj9kinrO/LC8T999S7p+QMDDWWZWq0QBukwCA4aqM6DHePmPeSgAO9FvEt3cR8ZwlVrx16aajMMyjvn7WlRG/1zrCdkonw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ObbK7DcFrrnAFnco2vakl0ICKmRsOJ2xnMm3XbyFtu8=;
 b=hLaIA1zgSV8hhq45Oiid3aTRLmOq6iwkwoW5DssktSLy2ig6XSHgIeD5xpiRE0R0GyPJ9aR4UhaYCzxpFLjWOCKn+aaUx0b/RxcI4LspJZYvnrvAy8BTxtYGW5QyxhGobd//rgQEnp8i39D/g+8yNQFk436sVT656Fuzp4qhAdc=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA1PR12MB999228.namprd12.prod.outlook.com
 (2603:10b6:806:4db::10) by PH7PR12MB7354.namprd12.prod.outlook.com
 (2603:10b6:510:20d::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Thu, 12 Nov
 2026 11:42:08 +0000
Received: from SA1PR12MB999228.namprd12.prod.outlook.com
 ([fe80::4dba:119e:8e7c:37b3]) by SA1PR12MB999228.namprd12.prod.outlook.com
 ([fe80::4dba:119e:8e7c:37b3%6]) with mapi id 15.21.0615.007; Thu, 12 Nov 2026
 11:42:08 +0000
Message-ID: <9773f2fa-f80a-449c-9e9e-722d1c71f989@amd.com>
Date: Thu, 12 Nov 2026 22:41:53 +1100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 03/15] virt: coco: tsm: Complete PCI registration
 before publishing the device
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>, iommu@lists.linux.dev
Cc: Alex Williamson <alex@shazbot.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Jacob Pan <jacob.pan@linux.microsoft.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Joerg Roedel <joro@8bytes.org>, Jonathan Cameron <jic23@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Kevin Tian <kevin.tian@intel.com>,
 Krishna Reddy <vdumpa@nvidia.com>, Lukas Wunner <lukas@wunner.de>,
 Nicolin Chen <nicolinc@nvidia.com>, Robin Murphy <robin.murphy@arm.com>,
 Samuel Ortiz <sameo@rivosinc.com>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 Steven Price <steven.price@arm.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Thierry Reding <thierry.reding@kernel.org>,
 Vasant Hegde <vasant.hegde@amd.com>, Will Deacon <will@kernel.org>,
 Xu Yilun <yilun.xu@linux.intel.com>, kvm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-tegra@vger.kernel.org
References: <20261104161632.3547423-1-aneesh.kumar@kernel.org>
 <20261104161632.3547423-4-aneesh.kumar@kernel.org>
From: Alexey Kardashevskiy <aik@amd.com>
Content-Language: en-US
In-Reply-To: <20261104161632.3547423-4-aneesh.kumar@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SY5P300CA0040.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:10:1fd::7) To SA1PR12MB999228.namprd12.prod.outlook.com
 (2603:10b6:806:4db::10)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR12MB999228:EE_|PH7PR12MB7354:EE_
X-MS-Office365-Filtering-Correlation-Id: 26426111-8848-43a7-5764-08df40b1fb7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|23010399003|366016|1800799024|261102130727099003|56012099006|261026140227099003|11063799006|261022105027099003|4143699003|261021123027099003|261022075727099003|261026121527099003|261021121427099003|261028144727099003|261102123227099003|261009223027099003|10067099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: Tbkl2SSsl7WbbVJ4IkVDO4TqTHv9INGV7lpnanfIkrhKu0MRgg6+xQqcshmeR4KwJDeSuB6bpf4AVdnP9vB9ahdPidyTu/YvkeondRioIRRHvPmQfZTOYKAgtoq+BIsVO2NO6mMooiSwu1kczmdTCM7E5INSt9GzdTwB22/AEPyicj1hvcCy/GfyKXKc99oemJ3S/fRE6F9lnqjGdXM6AERdrwJdK3JzPk8mjB9oa4c3w6jwkhEiMVNn+jQPLfWiUV0f5pGdBwZU6iMuR8CnJqOFb+Bzz/BL8exXmejxYFpQDOcMXxjhwV4fg9IFxAGynpS8B8SQS1nDJiCMC51WpXg1FA9F8FprQWTs/2blzGIz/fn1u7EIpUXAUM5D2AXy6CpWGW3a7Ovmx24uuixJgGursGQoxKOqRAw4NsLZtKCVZuwDojvzLoUkgceKOjyAcPhxQ/jwRXxplJeeK93kdxQ97pjBMwSuthPJvLIY5B94DPaaRpMcnBaGek4fcFiweHoZ74YWWbpl9G8QS+C12Dgd5uwwCEvfpyez/HKUKrCEeEAzPjqms7VB45awvG7cC04TPrbmkH+TH09SK/aegblh6FLLRD3C+oI9VOrOdSwbjiI7uVuzgwpbLc/pZMWIzjsSuEgdzgcgy/X9CiqMpS8OX5yoRP3HeHPrI3ETiGc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR12MB999228.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(366016)(1800799024)(261102130727099003)(56012099006)(261026140227099003)(11063799006)(261022105027099003)(4143699003)(261021123027099003)(261022075727099003)(261026121527099003)(261021121427099003)(261028144727099003)(261102123227099003)(261009223027099003)(10067099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MWVBZG04M0JLWmxKaWE2a0JLOEEzbDE0eEduLzBYZUdXRmc2RTBuRGdpZlMz?=
 =?utf-8?B?Y2JZNFlCWmZ6aU5hUUhXVVcrUitSRUllejNxMkZDZzVXSkRVT3ZwRE12NXdr?=
 =?utf-8?B?b3lUb3kxOWdnMS9KVERpRzdZdnl5Q09FUkF6S1VnNjZjM1FKbEZyYzBBdE9L?=
 =?utf-8?B?N1g2YTNSQVJzWGZ6Q1lVTGNGUEpCS2tqTUFzWDc5RFErNUdML3o1dGtUVWpM?=
 =?utf-8?B?cnNTODBmcDcxb3hqL29jeWhSNzJuZUN5YkhEK1V0Y2tPT21LQUMzbm9PRzVP?=
 =?utf-8?B?Q013T01HVUZ0eGg4VS9xcmc4cXpxbWdnbUNwZ1o5cnlUQ0s5TTBIWTFTWVBI?=
 =?utf-8?B?cG1QRi91Nzg1ZVQwSFhJdTJ1MTB3TFFBSFZUb3J0R0lnVGdneFRueUJyR3hJ?=
 =?utf-8?B?bVlMOEthSWpuTmY3Y2dlMTVYMXBuY1dycjFmRytSMEcyRXJyL1ZYVVZKMHlU?=
 =?utf-8?B?VzMrNHBsWWxWMHlQeW9NZ1U4N0hQSGNxTk8vTTZLR0xHYnNQcEtkaG04MVZU?=
 =?utf-8?B?NUVkQXQxcnVwb0xZOVFWMkdyODVzVHFzMzhMdFVKTEVWR1h5VmZwVmpaVjFC?=
 =?utf-8?B?d0ZCZmhJRVo4ck9mTlc4bU9uMVYyc21EMXRRdWxQMGZ0cjQrZFJwaVhodkdj?=
 =?utf-8?B?Wis2TXQvVVZHdzZBNEU0TzNNZ3IzOTFQNis0T1Z6WE1Ob2QvazhCWW5TWkxN?=
 =?utf-8?B?NTZ4bjIrenNyanFXejF0ZHVQSmJDdkZmNDkvQmVUWmdrV3dLTEI0aUlBd2R6?=
 =?utf-8?B?Q1ZEOFFDbjBZU01FdUY5dVBMZTFsRVF4Q25EYmNrN0ZYemFINk1saEJSSzU3?=
 =?utf-8?B?NGFGcTBVbVNYUHEvUFZSV2dKbWtwU2M4TGRPcjV1TDViQlU5VzBrTTF4WlB5?=
 =?utf-8?B?eWZJMjNTdHp0dFJoMUp5MUdXbEdETEpHbmIrK3BWSmtXYkd0allpZnJWeG5Z?=
 =?utf-8?B?WnVvR1BZNGp6dmhQNktBa1poR3VlRy9xbWozRGpBTXMrMXpLcEcvdTMxWUtF?=
 =?utf-8?B?bzhBVXFsWjFibEZXNXhYMHJtUWV5cjlPNlJ5Q0hEWnRQeWR1MVcyMmV0V3Z5?=
 =?utf-8?B?Z3VSaEtRMzRvV0R4c0Z4VC93SVVBM04zZldYRk1ZR0w5eWJDYkIvWm8xWVlS?=
 =?utf-8?B?UDJMYkU5UGNML2NUcVpPMDdPYm5rU2lwNmZCZGtzd0N6S1kzUU10UUJWK0lz?=
 =?utf-8?B?K2E1Wm1sWkpxL0JtRmpXQTFXeW5mS042MVAycVZSRFF6Wk10cGhjMDFPVWVO?=
 =?utf-8?B?dXpFUlBhZmJFbWF0NEVhQm1jRTdnekppWk4yLzBEUlZlbFp3ZFNqUUZHMVV1?=
 =?utf-8?B?bktmSVBzK3BZRDl1QjV5SDJjSUhNRGJ5T1p2bVRFOUtldDVDWFhKakFxeG1V?=
 =?utf-8?B?V2huQWxkSklUQVJnc2lXOWphOHNCVzAvbW95UXNHWG9GQXE0TDJKSDRPTWVN?=
 =?utf-8?B?cmQ5TWdqUVJmcGQ3SHJtWDY3bUFuTll2TG5zUW9PeGtpbHg3dldUdStGVTh0?=
 =?utf-8?B?NGZZYkNEdU45c200U28vWnFCWk1RbFF6MHNiajMyWHVvY1J2VXEzenRZcEhq?=
 =?utf-8?B?aFk3VUxxSDhaelprbFVaTlVwZkNYd0F1UmZJYWwrakFXOXpyeXpFRWhCcEsy?=
 =?utf-8?B?bXY1Zm0rZk0zVWhicTBJUGFNYmtsdjBzM3NlMFkzQmNXbE40cDh1TCtvaFJE?=
 =?utf-8?B?VUU3bUlud2IzekRiLzJhYzdBeVU2NGE1Qk9iQVc3UjVEY1RIK1FVZmhNbm9u?=
 =?utf-8?B?ZGpJcFBucWxrd3JuZlF0S1FBeDBvYWNuUkJyRHlsUjRYcnFpdXBrMktUSmF1?=
 =?utf-8?B?YUhPemwxK1lkOHRLSHMrMm0yelVpdldtK253N3lHcW0vdVlIOVVCaWxqRmRP?=
 =?utf-8?B?aVRzUFdCVkllZDNsTmhGUlRlYXMzbGs3SHo4UE1ZeG9pK0JvRGxpYkc1b0h1?=
 =?utf-8?B?ZWhhN1pSb01ML1huOFhFeXZBdm45RnRsNFZvU0tkQ2d5MWhjbjFINXRGMDlS?=
 =?utf-8?B?N1pyNXdCSkMwNFoyWGlzNURnQjNkcmRDdUpoelR5NkpOMzFyaFVGOVo3aEF0?=
 =?utf-8?B?elY4bFU2WjQydzFPQ2FrZit6OSthbmRCeUFjRmkxOUIxZjFiTzRRbzdRTzZt?=
 =?utf-8?B?WjNjaGFEWGJTWFR2NkhHQmZwNzVmS0FGNHNMdWZybFlEalovT2o2MEZFNEJx?=
 =?utf-8?B?Y29wdkV2c1F2aUhnVnRTUTR1aXJBa3A1MDlGcmNOZ1EvSGkrdjRVaS9SRVNI?=
 =?utf-8?B?OUZ5eFU0TVU1ZXdmSTZWbUMrcTFvYUFHbFpTZzlnWDIzNmEvcmNETWk2ckx5?=
 =?utf-8?Q?wVFew2E8XEki2E+87Z?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26426111-8848-43a7-5764-08df40b1fb7e
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB999228.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 11:42:08.3515
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m+WB17RtA/cDYQJgs2QMApQ5fOcYRVGmE5VFC027kBT8ldtEUcJ8qf0iIIc58Bl2tLDzgzPcmvuVFdoGQF2bRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_034215_578833_59BA4ECA 
X-CRM114-Status: GOOD (  24.28  )
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

On 5/11/26 03:16, Aneesh Kumar K.V (Arm) wrote:
> tsm_register() calls device_add() before initializing and validating the
> PCI operations. This makes the new TSM discoverable through the class
> lookup while PCI registration can still fail. This ordering was introduced
> by commit 3225f52cde56 ("PCI/TSM: Establish Secure Sessions and Link
> Encryption").
> 
> An existing link TSM can keep the PCI connect attribute visible during
> registration of another TSM. A concurrent write naming the new TSM can
> therefore reach it through:
> 
>    connect_store()
>      find_tsm_dev()
>        class_find_device()
>      is_link_tsm()
>      pci_tsm_connect()
> 
> If the new backend supplies both link and device security operations,
> pci_tsm_register() rejects it before taking pci_tsm_rwsem. The registration
> thread then follows:
> 
>    tsm_register()
>      tsm_register_pci()
>        pci_tsm_register() -> -EINVAL
>        tsm_dev->pci_ops = NULL
>      device_del()
>      put_tsm_dev() [cleanup guard]
> 
> If connect has already attached a PCI context, its temporary device
> reference does not protect the stored tsm_dev pointer after the call
> returns. Registration cleanup can then free a TSM still referenced by
> that context. The original tsm_register_pci_or_reset() error path also
> had this problem: device_unregister() removed the class device and dropped
> its reference without tearing down an attached PCI context.
> 
> Commit 37a73b0448ad ("tsm: Remove the device from lookup before PCI
> teardown") subsequently added the unlocked pci_ops reset shown above.
> That reset can also race with the connect path's accesses to pci_ops.
> 
> Complete PCI registration before device_add() publishes the class device.
> On PCI registration failure, the TSM remains undiscoverable. If
> device_add() fails instead, unregister the PCI operations to roll back
> the counters and PCI sysfs visibility before releasing the device.
> 
> With pci_ops initialized before device_add(), the class PCI attributes
> are created with the correct visibility, so remove the subsequent sysfs
> group update. Keep the PCI change notification after successful device
> publication.
> 
> Fixes: 3225f52cde56 ("PCI/TSM: Establish Secure Sessions and Link Encryption")
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
> ---
>   drivers/virt/coco/tsm-core.c | 16 ++++++++++------
>   1 file changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/virt/coco/tsm-core.c b/drivers/virt/coco/tsm-core.c
> index f79135986102..e370806d8436 100644
> --- a/drivers/virt/coco/tsm-core.c
> +++ b/drivers/virt/coco/tsm-core.c
> @@ -71,9 +71,6 @@ static int tsm_register_pci(struct tsm_dev *tsm_dev, struct pci_tsm_ops *pci_ops
>   			"PCI/TSM registration failure: %d\n", rc);
>   		return rc;
>   	}
> -
> -	/* Notify TSM userspace that PCI/TSM operations are now possible */
> -	kobject_uevent(&tsm_dev->dev.kobj, KOBJ_CHANGE);
>   	return 0;
>   }
>   
> @@ -91,15 +88,22 @@ struct tsm_dev *tsm_register(struct device *parent, struct pci_tsm_ops *pci_ops)
>   	if (rc)
>   		return ERR_PTR(rc);
>   
> -	rc = device_add(dev);
> +	/* Complete PCI registration before exposing the TSM to class lookup. */
> +	rc = tsm_register_pci(tsm_dev, pci_ops);

I'd move the !pci_ops check from tsm_register_pci() here, to match the pci_tsm_unregister() below. Or just open code it.

>   	if (rc)
>   		return ERR_PTR(rc);
>   
> -	rc = tsm_register_pci(tsm_dev, pci_ops);

ah that's why a pointer became an int...


> +	rc = device_add(dev);
>   	if (rc) {
> -		device_del(dev);
> +		if (pci_ops)
> +			pci_tsm_unregister(tsm_dev);
>   		return ERR_PTR(rc);
>   	}
> +
> +	/* Notify TSM userspace that PCI/TSM operations are now possible. */
> +	if (pci_ops)
> +		kobject_uevent(&dev->kobj, KOBJ_CHANGE);

Why do we do this only when pci_ops!=NULL? Also, why do we even allow pci_ops==NULL?
[a minute later] ah 04/15 does just that. Make it first in the series so following patches get simpler?

01..04 can go first really.

Thanks,


> +
>   	return no_free_ptr(tsm_dev);
>   }
>   EXPORT_SYMBOL_GPL(tsm_register);

-- 
Alexey


