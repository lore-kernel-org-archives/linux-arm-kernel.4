Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C7D606A33F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 20:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XwUiyzol;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=AghJH5J0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=DAJ2m9wRvb0+1hb7/1SydL9qyN+cMUlmIXmuORmESEg=; b=XwUiyzol63eJK6DIC3iueqi2t+
	3RG9Xp2eBq0O93WwVen8YhwOlOci7pAcXM7uQ8o//UlpdVOqXyAshGHItDUBRJLtHIw2Q8V+LxMDk
	NrTK7H1ROybjtD9Fv/ZFGEnJ7FTjG72gSqZNMujMfFttMYsY+cBzfCH/UhNf7J3M2G/iXy2AK0JkP
	sYbZPo7MKLcd9uJTGU5wfwnxt7is2TNPBk9ZGFTJtI9TcWHJisVBtD8XGMc5Tqk+qxc+LYzu7cunU
	TZBT4kA8Vqu4n2VEHYqFpP475sXerPt0ayXqVw3AFifAD1f2m+25LDO359G5tLimPWefvKsdLN16R
	AlvXq+Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT308-00000003pz5-1JhK;
	Mon, 16 Nov 2026 20:08:28 +0000
Received: from mail-eastus2azon11011020.outbound.protection.outlook.com ([52.101.57.20] helo=BN8PR05CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT305-00000003py3-1KZl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 20:08:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MonLv8Oz4QWtnyI0m+NacWeWNfCy62ZTjXeYy71I3A81nW8R2jznIfJFOIAOVhQmzFvOe/dG5hZyjqi8fSohK9Qn5lu+oFW6oYAKlplEz5eQ3wD6fYFOTwgHe4azFCq8Ex1+cpz2NNTq3dCB/Ebd70+tL5grI2wGk8hgLOWFwrAI0D14Y/Bwqoi4AkaAlkR02y1wvqpGyjhCGqEuhzjfhAbZCMTUcl+wZSrt/MemEVTcNRmi/f6jd8J3ySZbalBLVimvNX/isXOqVEyKqPFABi7/tDE6jIx1ap9G6QfuCBDijnFCiz27vKyCXeQdH9VAXn+Wg+lRnHvOW3c7Ws9Zjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DAJ2m9wRvb0+1hb7/1SydL9qyN+cMUlmIXmuORmESEg=;
 b=roBOwC4IWsfoIlFlmtu0oy8q4q/kzGpkd2JyMhGGDeJqs1EWSEG76660I3jDT4uJc5M0Tb/7B4W5gW5C/EHIXmB6ddshhmHl63DPkuhfgu2NR9tJmpHQnXNLqjzs/SSHKVSa5E7fiO76kWNsV2nvTOp+M56/KFlVabGj2Nk/Kuv8pESAz2NJvsRj+jwe5FmsPe4SEnhbNnamooL+6+f+5eS1TCp6DOHKqJl2cwkUhTXxBEPTDeUb30xX1ves8Z1c3JzFEOA832RHQ+OIvO5zLc4rxm0y4WBVglnVImwJ95hYkQR6k86MKAymUUBoj2ijrRDXO+zby/vSrYtlVfIYww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DAJ2m9wRvb0+1hb7/1SydL9qyN+cMUlmIXmuORmESEg=;
 b=AghJH5J0CRoLEbK4HrVT5Fbeb0GRstzkZKqXqxKzoHzFHk+6t73tDmbuyFOFJBzormVGpHvv+6cStuA6syIA3a1L9sOpJyfQ1hJN4QURpdqZQg99meSaz0s7SrqugGD1aA6TDaCwOi/TJV5ozMlP85EODLisKa0n1h5Aej9ZLcI=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5320.namprd12.prod.outlook.com (2603:10b6:208:314::17)
 by IA0PR12MB8648.namprd12.prod.outlook.com (2603:10b6:208:486::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Mon, 16 Nov
 2026 20:08:06 +0000
Received: from BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1]) by BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1%5]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 20:08:06 +0000
Message-ID: <79684ccf-9b77-4c2c-8f86-0fee306a8745@amd.com>
Date: Mon, 16 Nov 2026 14:08:01 -0600
User-Agent: Mozilla Thunderbird
From: Babu Moger <babu.moger@amd.com>
Subject: Re: [PATCH v7 13/19] x86,fs/resctrl: Add CPU hotplug support for
 kernel mode
To: tony.luck@intel.com, reinette.chatre@intel.com, ben.horgan@arm.com,
 Dave.Martin@arm.com, james.morse@arm.com, bp@alien8.de
Cc: corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org,
 x86@kernel.org, fustini@kernel.org, tglx@kernel.org, mingo@redhat.com,
 dave.hansen@linux.intel.com, hpa@zytor.com, fenghuay@nvidia.com,
 rppt@kernel.org, arnd@arndb.de, kmehltretter@gmail.com,
 dapeng1.mi@linux.intel.com, elver@google.com, enelsonmoore@gmail.com,
 jlayton@kernel.org, seanjc@google.com, ewanhai-oc@zhaoxin.com,
 binbin.wu@linux.intel.com, nikunj@amd.com, ashish.kalra@amd.com,
 peterz@infradead.org, superm1@kernel.org, thomas.lendacky@amd.com,
 prathyushi.nangia@amd.com, kim.phillips@amd.com,
 ricardo.neri-calderon@linux.intel.com, darwi@linutronix.de,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <cover.1794437052.git.babu.moger@amd.com>
 <a46c34d2cb1cf11daaece5ef49f7e7936082d026.1794437052.git.babu.moger@amd.com>
Content-Language: en-US
In-Reply-To: <a46c34d2cb1cf11daaece5ef49f7e7936082d026.1794437052.git.babu.moger@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0P221CA0033.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:610:11d::16) To BL1PR12MB5320.namprd12.prod.outlook.com
 (2603:10b6:208:314::17)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5320:EE_|IA0PR12MB8648:EE_
X-MS-Office365-Filtering-Correlation-Id: 121c283c-42ea-4979-1eea-08df441d5394
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024|23010399003|261102123227099003|10067099003|4143699003|260925022911599003|260925021311599003|11063799006|5023799004|260925021911599003|56012099006|261026121527099003|261026140227099003|261028144727099003|261022075727099003|261022105027099003|261021121427099003|261009223027099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: tR/irdM22EXBh6a0fCP/FD/ytd3BeLHWH3pYPw96j9DoK/NTAWzqIbPjg5fpMZaxWCtnQBgPq1Zkd0sNx2vWSruvGIufEVnvLOA93tPOlS58QetLq2Q7suV57VISscxISeNHbuL05tCRzIAk2F+6okbbieV/Ox3mmMbzYTfYhrDgPrdoux5CLf4G3V+OmogtL53NZZ7vXBsEQ09wwZF4rWWouzdIVn584AN5aEC9zC+ngDSHYJN0ymJu5Mnp35Ej+obwouB8c3TNKkdsdeR6bi43ht1WoMlhxtAoCEjvzattM7tZQ1XV6AJAXQHCoZh5diaF4VNhLYkXvg6Qdh8Efamhvn/hwFODPE30QiWbBnGKtkkR9Nz5bFnYKlTFpMaqAozDqzX5UBlFFo0f4pe+g7G4RUkZWICBaSAPk5vCVEJ8INCSXY2bi8f5zEMnPe544BDMuGs3ozBs6+lDJnomnPFjuYE5/L60ExUCgaipENusmZddHll+V7psuOmTSI7Y/DbwWkVKRlcEktmfk6BM6EOWOMVPp+UUusyghNRDFhi2tVKSV2KAN06jHeJS2Lz3KAsM55QIGOxk0B0lU/LFf98nXAa4vAAclBVghbWINRI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5320.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(23010399003)(261102123227099003)(10067099003)(4143699003)(260925022911599003)(260925021311599003)(11063799006)(5023799004)(260925021911599003)(56012099006)(261026121527099003)(261026140227099003)(261028144727099003)(261022075727099003)(261022105027099003)(261021121427099003)(261009223027099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Qy9XQURvcGpjYjU4S2dHSmh2VXV1Rm8zcUJXQW5IZmpnajk3UkZHRXVEL05H?=
 =?utf-8?B?ZkJJR1hPT05Wd0pqNldqWVZFS2NLMFBBRlBpK3g4YWZTbWYrRU0xS0pKZG5u?=
 =?utf-8?B?NVZNOXB1S2ljRk90QWErRlFmMXVDdzhIZ1VkWVV3Y1I3dEFuV0ZDTUI4VDll?=
 =?utf-8?B?TTFJeTU4ckhUK2cyUlNBWHJJMXNiQmpvai9qK1hxK0Q4MEtTMzkxWlV6VDN6?=
 =?utf-8?B?K0J3ZHh0M2M4aGJvZitzc3FoOXhCSW9MSi81T3g0VnQzWkN4WUZwSnJNZURO?=
 =?utf-8?B?UmhUUmdOYUxGNGZNS003L1FmSUhUN0dWb3lLSCtNSWkrOWIxRzNaQ21yUFBF?=
 =?utf-8?B?ZEN6d1JPTUczazRTUHQ2NVNTU0RDSHJpM24xdHRTMm4zSk0ydFFrc1ZzdWRl?=
 =?utf-8?B?TUlmS1NJOG80TDVEVVRBTExZYXZkem1naFM2SVNxMzJrdkt2enR3ejJpR1Ni?=
 =?utf-8?B?d1NYV01rNXdWeU1uc096TVFodlhWeUdlT2xsNmo2d3lqcVI0S2VFZTl3VVk4?=
 =?utf-8?B?UUJnRWJqd0tmN2xpR0Z2MnFmbU5GellxQ0VPQ0pQblpsb2g2VGZDSmEwRy9V?=
 =?utf-8?B?THFHRk1Id0NZVHRvRGE4d1ZJaGRCcDczVFlxWUszZXZ6bm8rWTFTcUN2MHlM?=
 =?utf-8?B?ZGRsc1BMRGxGbUZSWTJ0ZEEwQUNJQTIrRUI5em5MQVB3dmtnTm1PbDU4WFpP?=
 =?utf-8?B?TkNrN3hNb1VmaHA5VTBGTUtISnhGWVI5VjRiL0dSeisrMlg4bW5sTUV2Ylcw?=
 =?utf-8?B?UnU2T1d3NkxKQ1RqemFtdThSalNHZW9Ka0g3UUNwb3U5MHFyZGxVb2M4bFBu?=
 =?utf-8?B?Y2U0OXpwNDZDd2d6Q3VnanBRTHlsWFBBcTBWeGlIWGxOM3BLUnp6N1RrWHJ2?=
 =?utf-8?B?KzZ4WDUzOGFkS1NhV21hUUZPQ3N0dWppOS9TZlBhUzYvN25iblhGbXhoeVh6?=
 =?utf-8?B?bDZCUXJKcm5IV2VkRUh6MkRLQi9peFF3a1FqNUg4YjNNc0FVWVhWOHFOY2dN?=
 =?utf-8?B?K1BwclVVdmphM2tDL25CcVRNaW5HdGRUVUptaUFpQzVEYW9scWh4UFZSRmhG?=
 =?utf-8?B?OGkyVmpkdnJCdE95YW1pVFVaVWVPMnNqMlNyM0xLYXZ1TDdIQkx6ZTFOTEYx?=
 =?utf-8?B?WGdtTWpScGhHQjY2dWJIL2hXVU81RWdGcm5qTnhHbXRDNHpXa1dEWk0yM21x?=
 =?utf-8?B?SHVnODhtMzRMd2tIZUNyMCtoWXhYdU5zeUg2QUlib2hremVmNEVIalJQOWNH?=
 =?utf-8?B?RTgwUFIzaUo4RiszZ0ZpVUp0YmVYWjlUNldJRHJDVFBXbmFmUEl4QXJMRzdx?=
 =?utf-8?B?TWxaNGdZeVV3TTdHWU52RFRlYldvRStNcVdLK0pzVkk2MU16SW44VG02ZGRq?=
 =?utf-8?B?a3JrSEZBNWs1RDVNc2FIY0M4dHZ1Rmo2Rk4yZGNoWHRmdzB1UlhNS3E4RmZr?=
 =?utf-8?B?NkpyMVFNekhpZ0FaNTZqdCsvYmFzeENMQUZrbXhjcVN5K29nSmZROFhKZkpw?=
 =?utf-8?B?RExSSG1MS0poUHpWQ1hIOU5xOWFpTWxLUzZwTkc1ZHp6ZmNxM2F1M1RHYmEr?=
 =?utf-8?B?K1RXaHdpa3JGcVNyUll6R3VFblFJUGJtZm9TZDJURGlTWmswZXJEZ0crellt?=
 =?utf-8?B?ZmVjcXBoSk52NkZKcDJKem5SYkhOTk9zcUhOTXNCaU1lSDFMa1cwWEx3UFRK?=
 =?utf-8?B?b3BtRHhiSTdrZHlhclU5UEV1Vk55Q2huUlpMQjlxZEwyR1FWemQvZ3ZZME9Z?=
 =?utf-8?B?d0hKdS81czI1TEw4dU5GUUpFY2pibmh6RExSKzBkU09DWW5NeDEwVzZ5YUxt?=
 =?utf-8?B?NklGZVdmWGpCQ0FxNjZjK3UrYmtoU0Q4QldhN0huVWN0VFU2MnRlTTEwTTc3?=
 =?utf-8?B?RHphYTRobE0xVFR5cjh6M0ZrVk9BUDFWV0JVR0Z3a1EzQzBNd2xJR1h2T3hy?=
 =?utf-8?B?TmxrY1RHZ1VKTUl3WEtzUFhrTmhHbW9Nblc1eGNjZzFYOWJIRUdKcENvcStS?=
 =?utf-8?B?Q3NORkFZR1oxM1ZUcFVRd2ZDanFZQW9GVW8vclRXMjJlN05GUFA4a3cxbWxt?=
 =?utf-8?B?WnAyTVlVVWlUMEdXblgreGJDN0xDZWZLM3JyWDFlck0xa2pRandnakMwbUpq?=
 =?utf-8?B?YkhNbUphV2p2RFlaenRmMkN4UEdXSlpPdzJucDVPd1hUSDVwMXZwOEFSYSs2?=
 =?utf-8?B?ZVhQOXhRRDRmQWdnQVBLLzJUYzZLK04wZ0V2ZmFUWWhaOWpDTnhXS05oY09w?=
 =?utf-8?B?QzVnZG9yVStsb0xrTDBsSnR5R2dTMGhGb0pOUHNEL1NxdDZNa3A3VHdkTHpI?=
 =?utf-8?Q?dj0K2Xw6kQ2sL1mzhU?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 121c283c-42ea-4979-1eea-08df441d5394
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5320.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 20:08:05.8976
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c1zc7g4VMErWrZOlH5ftB4mzc3AxmReFwsMH2OLG6nMOSjUbpBhbVBEL1U70REVt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8648
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_120825_388033_4BBB1B6C 
X-CRM114-Status: GOOD (  25.88  )
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



On 11/11/26 16:44, Babu Moger wrote:
> The RESCTRL_GLOBAL_ENABLE_PER_CPU kernel mode allows the CPU's CLOSID
> and/or RMID association to change when transitioning from user mode to
> kernel mode. The mode is enabled or disabled on a per-CPU basis through a
> backing resource group. CPUs that come online are brought into a state
> consistent with the active kernel mode, while CPUs that go offline are
> removed from its CPU mask.
> 
> Integrate RESCTRL_GLOBAL_ENABLE_PER_CPU mode with CPU hotplug handling so
> that CPUs automatically join the active kernel mode when they come online
> and are removed from it when they go offline. Also, ensure the register
> state remains in a consistent reset state across kexec boot transitions.
> This ensures that kernel mode behavior remains consistent across CPU
> hotplug events and kexec transitions.
> 
> Introduce resctrl_kmode_global_online_cpu() and
> resctrl_kmode_global_offline_cpu(), and hook them into the existing
> resctrl_online_cpu() and resctrl_offline_cpu() paths. Also update
> clear_closid_rmid() to reset MSR_IA32_PQR_PLZA_ASSOC register across kexec
> transitions.
> 
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> ---
> v7: Changelog update.
>      Code comment update.
>      Added changes to reset the PLZA register during the bootup.
> 
> v6: Update the changelog in non-bugfix form.
>      Update the code to remove rdtgroup->kmode.
>      Introduce new wrapper resctrl_configure_kmode_global() to consolidate
>      architecture calls.
> 
> v5: Added resctrl_kmode_offline_cpu() to disable the kernel mode
>      association and update kmode_cpu_mask when an associated CPU goes
>      offline.
>      This addresses sashiko comments:
>      https://sashiko.dev/#/patchset/cover.1783461016.git.babu.moger%40amd.com?part=11
>      https://sashiko.dev/#/patchset/cover.1783461016.git.babu.moger%40amd.com?part=10
>      Also moved the patch earlier than patch 10.
>      [RESEND PATCH v4 10/15] fs/resctrl: Reset the kernel mode binding when an rdtgroup is removed
>      That seemed much more clear.
> 
> v4: New patch in the series. Patch taken from:
>      https://lore.kernel.org/lkml/20260611111706.1981788-5-qinyuntan@linux.alibaba.com/
>      Updated the code to enable kernel mode by default whenever a CPU comes
>      online when one of global-assign mode is enabled.
> ---
>   arch/x86/kernel/cpu/resctrl/core.c |  3 ++
>   fs/resctrl/rdtgroup.c              | 56 ++++++++++++++++++++++++++++++
>   2 files changed, 59 insertions(+)
> 
> diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
> index 14530c11bbd7..d7faf30c2885 100644
> --- a/arch/x86/kernel/cpu/resctrl/core.c
> +++ b/arch/x86/kernel/cpu/resctrl/core.c
> @@ -704,6 +704,9 @@ static void clear_closid_rmid(int cpu)
>   	state->cur_closid = RESCTRL_RESERVED_CLOSID;
>   	state->cur_rmid = RESCTRL_RESERVED_RMID;
>   	wrmsrq(MSR_IA32_PQR_ASSOC, val.q);
> +
> +	if (boot_cpu_has(X86_FEATURE_PLZA))
> +		wrmsrq(MSR_IA32_PQR_PLZA_ASSOC, 0);
>   }
>   

Sashiko reported:

https://sashiko.dev/#/patchset/cover.1794437052.git.babu.moger%40amd.com?part=13

=============================================================
commit 87e9e9cf13d544344f9797647860bcba9ffab37d
Author: Babu Moger <babu.moger@amd.com>

x86,fs/resctrl: Add CPU hotplug support for kernel mode

This commit integrates RESCTRL_GLOBAL_ENABLE_PER_CPU kernel mode with CPU
hotplug handling and resets MSR_IA32_PQR_PLZA_ASSOC in clear_closid_rmid().

> diff --git a/arch/x86/kernel/cpu/resctrl/core.c 
b/arch/x86/kernel/cpu/resctrl/core.c
> index fc59d66f77de1..33965b760aed0 100644
> --- a/arch/x86/kernel/cpu/resctrl/core.c
> +++ b/arch/x86/kernel/cpu/resctrl/core.c
> @@ -735,6 +735,9 @@ static void clear_closid_rmid(int cpu)
>  	state->cur_closid = RESCTRL_RESERVED_CLOSID;
>  	state->cur_rmid = RESCTRL_RESERVED_RMID;
>  	wrmsrq(MSR_IA32_PQR_ASSOC, val.q);
> +
> +	if (boot_cpu_has(X86_FEATURE_PLZA))
> +		wrmsrq(MSR_IA32_PQR_PLZA_ASSOC, 0);
>  }

Does zeroing MSR_IA32_PQR_PLZA_ASSOC in clear_closid_rmid() clobber the
domain's active PLZA configuration during CPU hotplug?

When a CPU goes offline while RESCTRL_GLOBAL_ENABLE_PER_CPU is active,
resctrl_arch_offline_cpu() first runs resctrl_offline_cpu() ->
resctrl_kmode_global_offline_cpu(), which clears plza_en while 
preserving rmid, rmid_en, closid, and closid_en in 
MSR_IA32_PQR_PLZA_ASSOC (or leaves the MSR untouched if the CPU was not 
in kmode_cpu_mask). Immediately afterward, resctrl_arch_offline_cpu() 
calls clear_closid_rmid() and writes 0 to MSR_IA32_PQR_PLZA_ASSOC:

arch/x86/kernel/cpu/resctrl/core.c:resctrl_arch_offline_cpu() {
	...
	resctrl_offline_cpu(cpu);

	mutex_lock(&domain_list_lock);
	for_each_capable_rdt_resource(r)
		domain_remove_cpu(cpu, r);
	mutex_unlock(&domain_list_lock);

	clear_closid_rmid(cpu);
	...
}

That overwrites the MSR value just programmed by
resctrl_kmode_global_offline_cpu() and zeroes rmid, rmid_en, closid, and
closid_en on the offlined CPU while other CPUs in the same QoS domain
still have the active kernel mode configuration programmed, violating 
the hardware requirement documented for union msr_pqr_plza_assoc that 
all fields except plza_en must be programmed identically across every 
CPU in a QoS domain. During CPU online, resctrl_arch_online_cpu() 
likewise calls clear_closid_rmid() after domain_add_cpu() and before 
resctrl_online_cpu() takes rdtgroup_mutex to program the active 
configuration.
=======================================================================

Yes. This is an issue. We cannot write 0 to MSR_IA32_PQR_PLZA_ASSOC in 
hotplug handler.

Couple of options:

1. Introduce the reboot notifier for resctrl and clear 
MSR_IA32_PQR_PLZA_ASSOC. Reboot notifier is called during kexec reboot.

or

2. Just clear the PLZA_EN bit in clear_closid_rmid().
    if (boot_cpu_has(X86_FEATURE_PLZA))
        msr_clear_bit(MSR_IA32_PQR_PLZA_ASSOC, PLZA_EN);

Thoughts?

Thanks
Babu

