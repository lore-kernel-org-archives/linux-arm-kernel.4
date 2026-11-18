Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2136B606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 15:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xJbWfqM0;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=D/p3z+/w
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=TnJdDy+00BKDpm0eCyPFTEXihHtsc8V4Uj+Bp9ffKVo=; b=xJbWfqM0tCaJjABHBnevIl2d7k
	04FH3+v3U7B7ozD+2TAnkkvZUH32bJ6+sLAzmsM2r7lJhMWvSGUvYg5HWCAT0vnVCeww5wmQhUN1H
	HuLy3LvXZpR8sCrWy3M9HGA9GQbDOhouAougezuO33SqJQnVdWXqLc7afxW6Y68TIv/1U/RIbDMsT
	DV2TArVapacghnzbsdJFeIZ8v3J8f3isIOQTy8nyzG9N0pfv9MZ0ODHPr3723+yJP+b8xGXhcNuJI
	3gJb5k1RO0injxg+XQL4B9ESMbYywSGSaUoJSSqKVCqHPLyUXn2B1MxUZZVupN+H6W9KiINIfghXi
	Dy0rm88w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTi39-00000009Nk2-1SvY;
	Wed, 18 Nov 2026 15:58:19 +0000
Received: from mail-westus3azon11011070.outbound.protection.outlook.com ([40.107.208.70] helo=PH0PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTi35-00000009Nho-1PIh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 15:58:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KrDM5Gu4qI10c9OxgQ0XhAagnfrfNm7UjdQ2aKFxe2oXuVBx1l5ijryZRTnBfViIQPuFTzgxht1u/UhbSfyopg9WclVsmdBNWQwmdpqFs9XXgCco4R730TO8dtgKyAY3etYzPIy5DIUYOEpX+IJgv24xsx3H/77he/UuxSfq1BZyxP9UOA5uP1W7++vJ9lA0JMN7JG9o6ph/27kcFJ3NYdfGq/6dmKkn4OWgt/UQrsmUc3WBRp+1vSIcoNkeSYAbrprozoqECiibP+YuPs2uvBVK1XX+8cbj7R8EwVdOXvkGnnPQoOgO+5LO5PBwaFvlfdiYz3vgct2A9SKavwAkRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TnJdDy+00BKDpm0eCyPFTEXihHtsc8V4Uj+Bp9ffKVo=;
 b=eZ4zWEPotZUcZAU/FEMkWikv64yQAxql+jRhYNu4iVmh5Jup0MJJROcAE7mxPhkS95z02AqF/BTUflR7cOIo9WhBkwd6NU+uvGPpPGe1GaXvQJq9QNNwahQVu/tqyrtCbiVoSdpmLw8UXuA7r4WxJnjJBM4Vu/prJl58JK//PUma2Yde9mT2KSb5aUcVKmnvdyuchJB3XRimqHkM9OJ5oP8Pch+bffvJOq/ns02gZ6zjUue7BIWSrOsRu5LjGHy6OuRn0PyUYO00wxuIKY78T9prKF7ObYiZ14KP/DG17YIG3vdFyaxpA8sqQfY+45UTTSKJ4UwxN8kRRWtS1rEoHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TnJdDy+00BKDpm0eCyPFTEXihHtsc8V4Uj+Bp9ffKVo=;
 b=D/p3z+/wvEzwekyh6aPacMOlKFITtY8o/l41E9MGc3zdxwuOMIZpu/JXGfyg7o2XR33ht3Z2//bZKM9PNqluHl1tH8KCS3f46bAZzq0Rjmg6yH6goJ5IpZ7iE+OvCzToXDODnqVfyGS3Z4oPbwHUghOUx1MCGFFaGcDOo2jaWYw=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5320.namprd12.prod.outlook.com (2603:10b6:208:314::17)
 by CH4PR12MB635819.namprd12.prod.outlook.com (2603:10b6:610:509::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 15:57:52 +0000
Received: from BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1]) by BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1%5]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 15:57:52 +0000
Message-ID: <0e3716c3-c537-4f5c-a6a9-3272908b8e86@amd.com>
Date: Wed, 18 Nov 2026 09:57:49 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] fs/resctrl: Give a monitor domain the counters the
 groups already use
To: Jinjie Ruan <ruanjinjie@huawei.com>, Ben Horgan <ben.horgan@arm.com>,
 james.morse@arm.com, reinette.chatre@intel.com, fenghuay@nvidia.com,
 tony.luck@intel.com, Dave.Martin@arm.com, will@kernel.org, jic23@kernel.org,
 gshan@redhat.com, bp@alien8.de, x86@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261113083506.4129060-1-ruanjinjie@huawei.com>
 <20261113083506.4129060-3-ruanjinjie@huawei.com>
 <10f43d19-2994-4ad2-8a49-2891582e32e7@arm.com>
 <bba48893-f71f-4168-8948-1d37cf59b3d5@huawei.com>
Content-Language: en-US
From: Babu Moger <babu.moger@amd.com>
In-Reply-To: <bba48893-f71f-4168-8948-1d37cf59b3d5@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH2PR15CA0022.namprd15.prod.outlook.com
 (2603:10b6:610:51::32) To BL1PR12MB5320.namprd12.prod.outlook.com
 (2603:10b6:208:314::17)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5320:EE_|CH4PR12MB635819:EE_
X-MS-Office365-Filtering-Correlation-Id: 95fe7cc6-01d8-4f78-bc33-08df458cb3bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|7416014|261022105027099003|261102123227099003|261021121427099003|261026121527099003|261022075727099003|921020|261028144727099003|5023799004|11063799006|261026140227099003|4143699003|56012099006|10067099003|18002099003|22082099003|261009223027099003;
X-Microsoft-Antispam-Message-Info: 69qOpg0YSyuG8B+q6dHEym15wpOg7ptuS6EFf7jdaSZXXOzG7QpmXFRJuDmJ4uWb+CxBqh2WJ2UtGd6TQ7v7AX761VchZ+Gqz0JSTyo9uPEPifUcyJtaaQTcDVD6ya/33fSy2e7+MEnqmTjnFvdl60Omgvt5+lFXVkJjhEEY+QYMolxN1npt+j5i+ZsD+/a/ZG0YDknAAk6CNIBtDn/KZ9zKNflfiTZWZgHecc5sPAl63KWPHPbsnzvQ+J1m16u7Jf2a+owTW9ADkTGI6UnrkucnSCoDHQVxsuaK26K9/0d6KZPaDFkl10rZlD3bL/UcEKyOzgdVXcCyZbeMTCrGxc3R/fWLaEFT9gCNgEGkuZoAxUxvfP3cwRQq7fcCgo0tYf6EGZDttOIVF5Jqf8Va+9mBPjCpMRAVVYtfhvxp4bjf0Sydh4VZOHjgeLqoNlOrqvEJlxWkMwcPx2/PzsVHBqX3GmHpzgxUe4pf+BDV/V5u8GyThpAry652mNO7/Q/LnKhEY8tskxX53x9NnNhDxpS3b5urr/Mr5f+gNxQH0ZKKgMLYzGqTK/kD+N/AkNhEZGQIhHRf3bNInAS5jCWIyIVoJJBPannQcd0tdKGVdHCtplaLfN60MiaWN9CbUkmsLUd3i0dCQr6jIdp5G4hOyw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5320.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(7416014)(261022105027099003)(261102123227099003)(261021121427099003)(261026121527099003)(261022075727099003)(921020)(261028144727099003)(5023799004)(11063799006)(261026140227099003)(4143699003)(56012099006)(10067099003)(18002099003)(22082099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dE56dm00T0g3bURJZW5JdVNRVzZuNkhiNXFaeDl1Y21rZmRYY2dDRy9JemxE?=
 =?utf-8?B?bFBQSHFQTTV2amNOWkhUeVV2RVZoZ2tCT2lFVmtHS0NxQWlnbWRkOUxsRWFr?=
 =?utf-8?B?Kzg1dE50cWNmaEN4aTNZeklGai83NzZrZFJtUDFZeUI4cno4RDk1d2JoQkJ4?=
 =?utf-8?B?cHorMjh0Z0ZRU0lWS3J3eHpBVXJBKytoVVlmK29LWFJTTldZaUpacjNOZ1R4?=
 =?utf-8?B?eTVZUFNIRUJNeDJSMkpPazZoUEUxT2lOZHJQaWNua1YxY2k1Q1ZwZDZrakFU?=
 =?utf-8?B?NkRUelhzVm1zZk92UCtUZHVOMVV2TTJBaXdXYnZJMExBSjllTVYrM0ZUeVg4?=
 =?utf-8?B?SDJ4N25DWHBWMnlxMUVETVRWblV6c1RiZGJVaDZ5N3BuM0xOZHFQaTBTdXpQ?=
 =?utf-8?B?UmVQeXVBbVBpV1UzSktsSHhyOHBjMXpaVitBYVBkY3lMTnNPL0lPOUJ3THJh?=
 =?utf-8?B?YzlNREVSRTJJRVZ4TDFZN0l6Y1dtMklISitJVDdkZFNSWkZ3VXJmT3hQMC9Y?=
 =?utf-8?B?QzBwdU40ZlZzTFRqY2c5SmtWTGlkRmVLTVNLaXhxYnVkZTNuVHJNTHpId2d2?=
 =?utf-8?B?ODJ0NDBMVGFXcGpPbmRQU052OEJJdVo4UFRPNUZDaERlTVJhWHVud2VyYWx6?=
 =?utf-8?B?ckM5Q2wxQS9CTE1IREU1Q3RQZzEvcTgwRjArMUxobUc2cVBSempXa1A4QStN?=
 =?utf-8?B?QlU2b2tPdVByWFdNcHh2WG42bkJ2RFBmYnNldm5ETC9rRjJYVjE0MFZrYlJW?=
 =?utf-8?B?WEI1aFVBVDBZOEMxYmwzQS9IdVN6RmFYOFBKUWMyZklqTVFrSzhEbkovZkY0?=
 =?utf-8?B?MTNXc2ZXSDlVcUVscjFmRUQrckhhNFlLSmdwa2VpazdGWEdEaWNxTk5FZnJ2?=
 =?utf-8?B?RkoyeEZ4clFxVWwrblFqT0dXN0lBS2hpbFhuRHJ1NGl4d1lxMDhjTWtrN1Q5?=
 =?utf-8?B?UEFpbnRSN0p3SDFNVzE1U2tLVGtTaDhjd2lKaURSREpLUGxkVmNEM1NFSHZ5?=
 =?utf-8?B?dnh3c3hHVGI5ZEZxNGxvMEl3VWgraE9OTXBHSGRBVVJTME42MXJmMURDKzVL?=
 =?utf-8?B?ZThuZ3h1YURJd2V3L3NlWEl5Y01RTWpPdXl3WEQ5ZlZQYmJJOEZWZE9hRkFt?=
 =?utf-8?B?SnIvUExIR1djbURScm1Pb2tJN1RBSDNsUW5IZUJmc0h0ZldNLzhjYnZyQzZo?=
 =?utf-8?B?cHA3OHNidEpEbnRncjVtbkorZGhSME5IM0J4OUlxS0g5TmdkaWZXYkJ5MGNW?=
 =?utf-8?B?RThhQjZ4N29tM0pZUHFvUjdnbVlzZzM3SVlOdVhScXc5NWhqdEZOUFB1NTU3?=
 =?utf-8?B?Vkk0MFFYS0pvWjlrc3lvdmN6RUliVXUzb2VHK1ZpZ0ZpcXUzRHBqSFYwK0hV?=
 =?utf-8?B?WUNCOWZtU1d2cXBYSlh5RFRuWEZKa250SjJZUU1jbE42SXI4ZnJ5NUNxckoz?=
 =?utf-8?B?ditHQk5zWFBUSWw5NnQ3RU42aVlwbHN4OVJHdzdZMG1NOVVOQy9acXBsTlZx?=
 =?utf-8?B?QnpKdys3QWhLVnFnZ0pxOGRUK2FaQ2YrSmdwZ2FWN00wUk9IblRJTDdMd3M3?=
 =?utf-8?B?SkFHbXEwSkhod1hzL09UK25rRTZ4T0FkY1VjZG9ERzU0bmUvZXNKQjE3QURD?=
 =?utf-8?B?Zm9zNGZiVytpNUdpVlRpVVNmNEo3RXBKNjlWcFozaVBuTDNjR05xbm9UalZj?=
 =?utf-8?B?cHNPY1E5enhSbjlmLzdYb1ZLTklMTWY4UytTbFEvT3FLV2dCbmgzSWtyM3J6?=
 =?utf-8?B?djcrL2hXcWJFUVJWVTZPeGd6SG96MDRlMk1PT1Z5UHQraTFudnhJU3phbGwv?=
 =?utf-8?B?djJCOXd6N0VhWitrS2VtcXlyUTZLNHdJZWsyTTNYUDdJbERSdEovaHN4T2Y5?=
 =?utf-8?B?MVRBcDB6eWdLTnRGWWZLMmpDK0J6RG83bDRmK3FLMDMzVFkrSkRhMjhLc2Nr?=
 =?utf-8?B?Y3I4Uk5hY0JPR04wTGRKR1U4aG5qZUhVWWR3RDE3cHR2TEw4QXFLY0RIN0h2?=
 =?utf-8?B?c1U4MkJISms3dDB1bWE3Yy8rMkZVR1VLaUJ0Mk15UGFIcWM5NG9OMFltUGNs?=
 =?utf-8?B?S005MG52ODBnY2c0SkRYckdTSE4vc1h5eVA0dTNpYnMzd25rSTY2aFZBaEdF?=
 =?utf-8?B?akZFWTNuMXpCUCtHM2xsMWhSdFo5R0F3UGV4MExWNG16Kzl1QXQrbCtUUysz?=
 =?utf-8?B?a3BVL2NJMC9HMys1cHI1OHB4ak1Gd1V0WnIxSEM4MFIvaTFseU4zMkpqdTdq?=
 =?utf-8?B?TS9xSHg2ZzMyV08rYjl5bTAzMStqb0l1aGRvQXVMTWtZdTJweG43R3I0YmJm?=
 =?utf-8?Q?syHl9RuZGZEUNVwGlA?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95fe7cc6-01d8-4f78-bc33-08df458cb3bf
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5320.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 15:57:52.4642
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8rWBSjVABOWhMdhlYsftAJ3vhi10uk5K1u295wkksZJJ7a5iElrxIbG0Gd409IHt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR12MB635819
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_075815_451084_4C2A1921 
X-CRM114-Status: GOOD (  22.71  )
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

Hi Jinjie,

On 11/15/26 22:02, Jinjie Ruan wrote:
> 
> 
> 在 2026/11/14 0:14, Ben Horgan 写道:
>> Hi Jinjie,
> 
> Hi Ben,
> 
>>
>> On 13/11/2026 08:35, tizi4590 wrote:
>>> From: Jinjie Ruan <ruanjinjie@huawei.com>
>>>
>>> With assignable MBM counters, resctrl can be mounted while all CPUs of
>>> a monitor domain go offline and one of them comes back, either through
>>> CPU hotplug or because hibernation takes the non-boot CPUs offline. The
>>> domain is destroyed and re-created, and the new domain starts with no
>>> counters assigned. Counters are otherwise only assigned when a group is
>>> created, when rdtgroup_assign_cntrs() takes a free counter in each
>>> monitor domain for each MBM event, so no code revisits the groups that
>>> already exist.
>>>
>>> Those groups read "Unassigned" on the new domain, on any system with
>>> assignable MBM counters. A counter assigned to them later through
>>> mbm_L3_assignments is the lowest free one in that domain, so the same
>>> group can end up with a different counter ID on different domains. For
>>> example, with the counter ID each group uses for mbm_total_bytes and
>>> "_" for none:
>>>
>>>                                 domain 0         domain 1
>>>    mount, mkdir g1              default=0 g1=1   default=0 g1=1
>>>    all CPUs of domain 1 offline default=0 g1=1   (destroyed)
>>>    one CPU of domain 1 online   default=0 g1=1   default=_ g1=_
>>>    assign g1 on domain 1        default=0 g1=1   default=_ g1=0
>>>
>>> Each domain has its own counters, so g1 can use counter 0 on domain 1
>>> and counter 1 on domain 0 without affecting the other domain, but until
>>> it is assigned on domain 1 it reads Unassigned there.
>>
>> I brought this up before and it was assessed that no change was required:
>> https://lore.kernel.org/lkml/171f92a3-fa2e-44fb-b0d1-1250c72e31d1@amd.com/
>>
>> Do you have any particular reason for wanting this behaviour?
> 
> I discovered this issue during the testing process and feel it is not
> very reasonable.
> 
> This patch doesn't assign anything new - it only restores the counter ID
> the group already uses on a domain that stayed online.
> 
> So with the patch, Babu's two cases (`2=e;3=e` and `2=_;3=e`) both come
> back exactly as they were. The only case it can't know is a group that
> used a different ID on the domain that went away, and there it leaves
> the event unassigned rather than guessing.

I see this patch is trying to address two separate issues:

1. Automatically assigning counters when a domain comes online

I understand the motivation here. It is reasonable to expect counters to 
be assigned when a monitor domain comes online and counters are 
available. However, monitor domain online/offline events are typically 
driven by CPU hotplug, hibernation, or other user-initiated actions. In 
these cases, the user is generally aware of the state transition and can 
explicitly assign counters after the domain is online if monitoring is 
required.

2. Retaining the same counter ID across domains

I do not see why this is necessary. The design of assignable MBM 
counters intentionally treats counters as domain-local resources and 
provides flexibility to maximize counter availability across groups. 
Counter IDs are an implementation detail and are not visible to users. A 
group using a different counter ID in another domain does not affect 
functionality or monitoring results. Therefore, I do not see a strong 
justification for preserving the same counter ID when a domain is 
recreated. Given the above, I am not convinced the added complexity is 
justified.

Thanks,

Babu


