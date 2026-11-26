Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79126606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 18:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=beST/IAk;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=qUxq/6lr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=UrM6jbITV8g6tXbOWteSa2AyYiNh1PYY8NVAj1l/sho=; b=beST/IAkcjRuvBLPmKbsKZ4ymS
	fy7T812idWldQGeRhfxSSf1Gy1A1tFwgBB998/ysvkTBjprwjWzwmkUaLQ9zZzWxZw2VCdqd3doF+
	zA/Ahjm9syoPPz00qgQQhivUG/aCqz/DAg/vIu8sRQGKcMc0hGV4Fy91IWTvpC2RKFx5NDflnwU54
	IIhZN8/eZnPTTYDDvMznEP2/Ura/wRxfBTstz7woI/kWclmAXBzjM+WRXI/1YAL4HCifKBTo0G4Jn
	PVaody4bw5/f+cJsZrDAwJi1vbV1CXLkxSWp9AuRqzFbwHpArRKgAyRn0sW/aZFwUMByvi+AxQuWp
	p4q3/rGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWdud-0000000E8Vx-0G9A;
	Thu, 26 Nov 2026 18:09:39 +0000
Received: from mail-southcentralusazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c10d::3] helo=SN4PR0501CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWduL-0000000E8Sq-3olS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 18:09:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xo85KGA4AMz8wrvGTaM7oT7SmdcS7ixvuzCKpV2OVhTJ799hC25wvBUa/MRYvmxnd5r/ap9CAr8fas94EK1/kPA/d/iGk7Jwt+EShRJyMIJbwtP6FOyCpu5GdoVQxK7iAqqqfgiL5e1+2KNGVq5TuFcy8TAl5b7bbuA3rXJoohTyH04ZS7ilT1Wnpnah+pEllYju9DpjNUevgSWR/s3Q8O53XfK2wgiKvYz736YoUpHgxvs00lWFk8ZwN2NoDV/jpsJVluwqWwmD8lu1RFZTN8TJKz+LljKRy74pLB6glAIWFc2pEE7652QQ1LJDNF31lgXHnNr/tDW37QaOy7JW+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UrM6jbITV8g6tXbOWteSa2AyYiNh1PYY8NVAj1l/sho=;
 b=SZV5ZssNQKycpwhgq4qvupgsc8hlgtQqJKiVXWyrt7BudUr0vIR8otGK/TOcM8GcAaH/Myo5D8oPiT+oUKhZFSQGK2oiqxzCuGNrI5kL6hg4Ct3Q1A+p/nnaDnxs7YoDvL2bfpKtbBQeTjicl8LNTEVgaC++ovet1/ZAIQi+kx0HKb988qyBDf4O0MXE3pP/zgXrwkiCvUhoP81yY7KXz8/haaB0pmjbTL/PxKNHJvkD9KeKoNIyBvjBIepNgAszAIflxXM5qojPhisA7X3Mn5UexUI+RdRMZqgmNxdnbNDsuR8qeEJM+tp5hdQo7rOsHuwcM7XORqoRmzCRsHRpWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UrM6jbITV8g6tXbOWteSa2AyYiNh1PYY8NVAj1l/sho=;
 b=qUxq/6lr13y9qvPSqaL+cbCapONB5ShZFKw3ZUTE8FiAHKfcX5yXV+xoielF79qTeWNCT0Z4UtIJvnTzX3sd8s2iXCWAeDOT+LsCfy9ptDmshQxtdjE12YmAYT8v/+0RqZ1FQs4FZYihqfU5AAHjhBjgHm32InlOntOV4Q//9E0=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from FT1PR12MB863618.namprd12.prod.outlook.com (2603:10b6:170:e::18)
 by DM6PR12MB4356.namprd12.prod.outlook.com (2603:10b6:5:2aa::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.4; Thu, 26 Nov
 2026 18:09:13 +0000
Received: from FT1PR12MB863618.namprd12.prod.outlook.com
 ([fe80::9c1:e17d:1a5d:e5fe]) by FT1PR12MB863618.namprd12.prod.outlook.com
 ([fe80::9c1:e17d:1a5d:e5fe%3]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 18:09:13 +0000
Message-ID: <bab490b8-ebdd-4aca-b344-a9182838ae32@amd.com>
Date: Thu, 26 Nov 2026 23:39:07 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: Add AMD Versal2 UFS firmware files
To: "Buddhabhatti, Jay" <jay.buddhabhatti@amd.com>,
 "Simek, Michal" <michal.simek@amd.com>, "Neeli, Ajay" <Ajay.Neeli@amd.com>,
 "Potthuri, Sai Krishna" <sai.krishna.potthuri@amd.com>,
 "git (AMD-Xilinx)" <git@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>
References: <20261126112754.907756-1-jay.buddhabhatti@amd.com>
Content-Language: en-US
From: Ajay Neeli <ajaneeli@amd.com>
In-Reply-To: <20261126112754.907756-1-jay.buddhabhatti@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0209.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ab::6) To FT1PR12MB863618.namprd12.prod.outlook.com
 (2603:10b6:170:e::18)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: FT1PR12MB863618:EE_|DM6PR12MB4356:EE_
X-MS-Office365-Filtering-Correlation-Id: 53f332d2-39a9-4ebf-24f0-08df4be86045
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|18002099003|22082099003|261009223027099003|921020|56012099006|11063799006|261028144727099003|261102123227099003|261026121527099003|261026140227099003|261021121427099003|261022105027099003|10067099003;
X-Microsoft-Antispam-Message-Info: gB2Z2MsoE9HHio8on+0XAzUoaktLLmahNycPSdx5T+BHd6jM4GUsctf+h9SQAQzMlQSkn0YO4P6CaZRuv03ZTLrzGyq36VbL+tmt2AbHNOlerz8zVTkUSmeOVsj07VohFHIIFdACLvEJ7RvwlCDVN5U624nsKHKwCa+JORyNOCWYbdHh3N5nkGx9Wo7t6GaqRHJhTCr74ni9A7261RnCA0AbaMJrM3YwdZgLGynMtHD0MmnrOdhHekPyZ16NpjxzxAGrlwJH/q1DxIMm6Ieg05dpM2cpf/q5J8D8XimfhfvvwDNRISAl+yPXgruNP2TovSShsgYkXNa03pYE8VL9mIdQY1m16Skg8Nr59wc/yOnEO3IpSLIVEH9z/2tp4qzq4oWX0SuZ+pLZ8lNrzzc4vRkhrDjIry7UxQand8QHnfV9fNhMCMN12vfuwGl90DcecxEM7hScDWTbybJEO8/SDR/6H7CS6ejOSOdZXd3/1fYGGCQYqQxPUxoab1ARcyIZwfqSDchW2RJnbzKwM58lSBGZ3S12fSFtMtP1T8iu7v5Xud7BZK1a8I0oCQrm7fp5+V3ZiLK31Q+rVlLxVNGd1Q0ywtOZHL/Nm4zdjx8BeTjk8x8/jTibncFFPXBu5HfMQxE9c0LSv5Qc7LiRxOlrWFk54TTO0pbBbew9hYPH7CCwbNJ24SMe9gTq9HPKRcN/RXNTtyxPMNIzqgAFG0uhTg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FT1PR12MB863618.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(18002099003)(22082099003)(261009223027099003)(921020)(56012099006)(11063799006)(261028144727099003)(261102123227099003)(261026121527099003)(261026140227099003)(261021121427099003)(261022105027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bThteldCTDdzemduUmNueVY0SklzSERId0JjWktQV2ZEbUkwbUZMNUVUWjhv?=
 =?utf-8?B?bkkyMGo2aXhZWm1RR3BiTXlJekdXK3ZldVlCQ0Q3Sk9VYmF1Z3FOVFVpZStD?=
 =?utf-8?B?d3BwTmZYTVdlYUxpY3lOZGVMTHlZUk1VZXhBQkp1RE5hSms1RHVJOGd1ZFEz?=
 =?utf-8?B?VlRadmNpTndub2Z1UkU2OFJtbldJNkNnZUNpdm1JN2MyN1JHUjlGRVpPK2Vq?=
 =?utf-8?B?cVNYa2RrdGlyQmxoTzZmWEx2RWtRZkNHTlZjZFVORjNyTFAxdllJdmQ1QUJx?=
 =?utf-8?B?YzBCdFVWV3luMitFd2U2Qml3SUhjYzlZbXI4bEJKd081Mk1jblNteGc0T0Za?=
 =?utf-8?B?Sis4aElxMmR5K2w2eWxhUHdkY0lxZmVjR25tRHVHNnhicVlJeWxyZDNPQWtP?=
 =?utf-8?B?RzZ1T3VObTBOQ2FBeUFHZkhqMEcrRG1EUmF4Qm9KV0dXVXEyRkdvZ0E5MFlu?=
 =?utf-8?B?OUNqWXQ0YUFvemdSZHhnZklhVXovMXVNYmt6M3Zzekd1SVhkWWhTQUt0TXc4?=
 =?utf-8?B?cjlNMHViaFZtdUJZdSt6VlkzUEhKbjJ4SGVwMVdKZERsSDF5VEhLcGQzRVIr?=
 =?utf-8?B?MzFXZnJHOTVhQWNjR1hQWjdSR1dMMFBCNWw2bG4weUZiL3dwUWRUR25wVTRT?=
 =?utf-8?B?VFM4ZjBVSFFBV2d6QjdOdlNNTVhWZlZ0Z0MrTXc1b3RTY3dGWXB1blVOYlhw?=
 =?utf-8?B?MlJZZEVuTlZVbVR4VzJLRWhrdE56RmN2a1N0c1BxYkMvLzZIRjRXeVFzcVZU?=
 =?utf-8?B?Z3pyYzRMNWI5VGFlRko0cDVrc1hFNGYvb21pK25tRmJ2dHlCMUFYSThSb0wy?=
 =?utf-8?B?MjVhRi9QajJJQVBPUVA4Q0ZNTlZqM1A3MUE4cGtPR1c3TmJRMlZRNTVOajUx?=
 =?utf-8?B?cGJ3VXZubHk4d09ITEdScExXOUhVK3c1TU5JRkk0VXFmK1AxbWlTUVk2bG9J?=
 =?utf-8?B?cGhIa1dnbjVrUjdhZS9BL2VyK29CQzlIV3RSN2dQWVFqdnFFdnV0ekY5RlZr?=
 =?utf-8?B?RXBTNndOUURkSnRLK1J5cFRKR3VpZDRDR281R3ZEVFRZYzZOYXhQb1NHN0J4?=
 =?utf-8?B?UU9IZDk2QjFzVFZ6S2NwbEN0T1JFZ0JpNkU0RFJVWjdGUXpDMGYvYjZJUFlo?=
 =?utf-8?B?ZEZYeHZRTmdNaFRQY2t1RXlZNm5FdFFQTlpZN3A1ZFIzZXowTE9FRk5Oc1ox?=
 =?utf-8?B?K0VtMHRGVFQ3Znloa0F4bUtMTjVacjFTOGp2UDFOUzF0QWl4c3BMOC82NG96?=
 =?utf-8?B?d0Ezek53WVhlM0xUZ2ZpZ0V5Y0dhSUVBMmVuaTNBU0UzZnlZRFZ1d2hIUy85?=
 =?utf-8?B?Z09Ua0RUVm9TQ0FJQjl6aDV4djVLUVdLK3BnSkc0bVg2SUVKcTdnd3lCTnRs?=
 =?utf-8?B?NThnMkR6d2ZFZ0FheDNXNzNFalVCdHgzbnVIR2dTVHlzZkxCYVQ1b1RMT3k4?=
 =?utf-8?B?bmlya1lUOWQvc0dJR0haZXJlUDREbFByemwwa0hLZE4zMlpaK0l2czlIc0pQ?=
 =?utf-8?B?WHV5d1o4Nk0rYys4OVR5ZTlnRmRoU01WMzIvZ0h5SmVUM0c5SVREOHZDSFJQ?=
 =?utf-8?B?Z045a1dnYktlbzR2R2lQVTh5ZmJtbzNUNTlqS0FDN0lMQ1o2alpseVNkNWc0?=
 =?utf-8?B?endtRDdPUkp0NGRoM0k4ajBnS1hQTWJ4VUlxNG5VRnZkR1hnd3huQkR0RVNW?=
 =?utf-8?B?ekg4YWRJUVgwUlBEOCtSYTJ0YzhyNzNaL1FRWWQ5MkJuMnFNVUdvQjMxdEww?=
 =?utf-8?B?Y041MGtDSk5jNWZSMG4wWlo5MWsxYmZrYS81YTNFS3NDd3d2cEcwYXozQ2ZJ?=
 =?utf-8?B?SUFsWCtvNkNrMlJBK1JQenNIVEhjTFdWMjJKRHg1SXVFbW9zWjFNSDh2Mmpm?=
 =?utf-8?B?UmRLaFdnbkxTcUcyYm4vQUxrZi9pVThKS3hCbjA2U2k1Z3BQQkl3WXM3MHEw?=
 =?utf-8?B?TDFQN0xwbzNhOFp6Rlo0SnpXVjh3dHlQT05EbEU2d0NkdnVDYURwdHZyazRz?=
 =?utf-8?B?ajhuS25MTU5qTVpFZ0JsY1pCVk9ielRTazFDWHJ5REd6UzhrTnZqT3dIYmJT?=
 =?utf-8?B?ZjdqeXd5MDM4M3pRZXI0eWlEUW14eitQZlpGQlZiNTNRdmh0RmxyQnA0b01P?=
 =?utf-8?B?YjNZT2tJTHI2TE9CbUJSeklQUEhKMzRUU3Z0STlWNnZhV0RiZkt4bC8vZHJ4?=
 =?utf-8?B?d2hSTnR3RGdpRXNHVHlDL205U0RqeW9SY2lqakNsNGZCNU1yckFlRGNSVXl4?=
 =?utf-8?B?U3JRMTJLVjNoOC9qSDBTNy9vZlhRT1hOSlVDaTFnMVNLQ3VHV1dkakJUWm5v?=
 =?utf-8?Q?iEn8VW87qhILaX2rh/?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53f332d2-39a9-4ebf-24f0-08df4be86045
X-MS-Exchange-CrossTenant-AuthSource: FT1PR12MB863618.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 18:09:13.2919
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q6ENv3QsljtSyeKc6kDGhU7rHZ7S7aocsk2NsM5onmDwswPgk6ZeA00wEjJRlBrHBJeqEKNPhiVBQZNS4gTAbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4356
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_100922_035390_5D5288CD 
X-CRM114-Status: GOOD (  11.62  )
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


Acked-by: Ajay Neeli <ajay.neeli@amd.com>

Regards,
Ajay

On 11/26/2026 4:57 PM, Buddhabhatti, Jay wrote:
> Add the AMD Versal2 UFS firmware files to the existing AMD Versal2 UFS
> host controller entry.
> 
> Signed-off-by: Jay Buddhabhatti <jay.buddhabhatti@amd.com>
> ---
>   MAINTAINERS | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 742c4e6b291f..3c0dcd9feb94 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -28818,7 +28818,9 @@ M:	Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
>   M:	Ajay Neeli <ajay.neeli@amd.com>
>   S:	Maintained
>   F:	Documentation/devicetree/bindings/ufs/amd,versal2-ufs.yaml
> +F:	drivers/firmware/xilinx/zynqmp-ufs.c
>   F:	drivers/ufs/host/ufs-amd-versal2.c
> +F:	include/linux/firmware/xlnx-zynqmp-ufs.h
>   
>   UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER DWC HOOKS
>   M:	Pedro Sousa <pedrom.sousa@synopsys.com>


