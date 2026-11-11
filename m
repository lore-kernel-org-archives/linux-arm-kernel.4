Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C9F5606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 18:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Jb7tvg04;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OWv8X5WR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=J67GvsEUK2usQYpQFaXZ80BgfloLkF+a5A/gm77kPz0=; b=Jb7tvg04Rgf0XCEXOxjMW95+K0
	DMUS/TtTeOMlCo7OtIJ9UjTNhsIksrDoeAugP/FK2gBuYTCf+MqV6rMN5Hx4qIs6gsgR3JnS4Iixv
	WR/mQGvR+h6OCnxsZvwh7gH7+CPzozyEHARWiiovk0barn2u0p0Zh/v0Z71ew5sgga0P52zRfN6JK
	u0y777rHRhVZ8NmBiqG65oOZtu+Kv44FmUzI7phd5RqXTvkgQI/UPcW40WARFPuzLlt2SpMvpFqb6
	FHsZiuStZBhV9//8SsO1UUnA/c+WEbrIKwYkqAKtrPVjfR6BrnbwdLQxzlbYS3s0OuGccWx7SnvDL
	0FROoIpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRD9g-00000007QaB-1CzL;
	Wed, 11 Nov 2026 18:34:44 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRD9e-00000007QZg-2Xuo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 18:34:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794422083; x=1825958083;
  h=message-id:date:subject:to:references:from:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=aAh23KRZOcjU3rxPa34qRcsPuyEAevXr/f05RWC6NzI=;
  b=OWv8X5WRU0SP9dFKwmRq28JU+pKNfpI5rJUL83TjHtAYfuojKU+AAmdH
   p3mSYEUtUtkVVwQDuJwyMPFFheYqPbpi4ir5b55JpSh7RnI0HOBeGLGXJ
   txoU20Ne3zfXHJhEIPOVRZvcuqJ8pcf8mhEVbf9b8CmV7h+bgIufgRq9q
   VMIceBQHatp8pGjSEWtEtw8/3TMrcTYZYMiFEVyfza5DD9skigIwxEued
   iBntzikDkVSLDFAiSC9Ouy5WwVBk2vbIBiTlt23vnJgE++x1zjyqkIPb6
   UZZmBndXHBh5mBcIySc2CsoV+QaClgGC89UpPMF8tUGGirIBBs9+xPdfu
   g==;
X-CSE-ConnectionGUID: WRxyn1iKROe66s6SIFESoA==
X-CSE-MsgGUID: 4uJ1aqJkRv2mtLs1gEPOSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3099208"
X-IronPort-AV: E=Sophos;i="6.27,208,1787036400"; 
   d="scan'208";a="3099208"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 10:34:42 -0800
X-CSE-ConnectionGUID: H4dRAnTFTOCImFWrhXNz1g==
X-CSE-MsgGUID: eMzdopL9TpOQZO1rJVQjDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,208,1787036400"; 
   d="scan'208";a="8361561"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 10:34:42 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 11 Nov 2026 10:34:40 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 11 Nov 2026 10:34:40 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.33) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 11 Nov 2026 10:34:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BWdRPt4z/ZJwbXFVo7NnE1HbmnItryfrkiKKf55h+yerTIafjI2WF8ESr86dp8aTSYsLscvfgzWpDabb0fMn+sgqfdxNyQ5TGRx4HRg0V8e3aJB6O1Z8rJ7vqV+BPsN7ekAy5CyNQefC8p6vDeUkkM0loJPwMFFABAi7+uhgR0t+sqL/Oo4EbYdpV3b1DLkQtKFVWyZHq7ln835EJ4EwahoLwFGbX23Lv2mksh31jLB013Iczubp1F+r0Ki/uJuDtcW4I68Bh1+GgiqwEkENaK13r5ndKwrom3B4bgISdYzykfUvSu3sfuWfAI3s+gRTLuYO00Q7lnDRObkknGU23Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J67GvsEUK2usQYpQFaXZ80BgfloLkF+a5A/gm77kPz0=;
 b=cplGccQV3rgstAyGl+1+I250mjDRO1IVwY1Eb5Fz9m6fEWPdPxdOSkhkw0/l+4fnmwtwertSdwE0I0w5ZXXZgUYR9H2YaKCKs54HXYnN29XwUQZKDKTtbYjtl2SpyAExlDzm04y5Sj3g76JuZR15znnuqW64TTC/n9oAFof/ynF6bhCE4NCtt+Ti4PoZWURU5/Hx1gZ/FpzAWlVF9EpT4VL1uE7EsGy9+m9BXFB6T5WAgE6i0dIMH0pO4yFD8/xLQ63teQEymNB12cTrAM/YcyM4abblDtmHT9hvRr1bk9R53VlY1KLIXJcpIzlanUct5ofMTd9LohD37/P+BFZ0fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB8379.namprd11.prod.outlook.com (2603:10b6:208:488::20)
 by EA3PR11MB771531.namprd11.prod.outlook.com (2603:10b6:303:2eb::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 18:34:38 +0000
Received: from IA0PR11MB8379.namprd11.prod.outlook.com
 ([fe80::549f:e4b3:e10d:aaa6]) by IA0PR11MB8379.namprd11.prod.outlook.com
 ([fe80::549f:e4b3:e10d:aaa6%6]) with mapi id 15.21.0615.007; Wed, 11 Nov 2026
 18:34:38 +0000
Message-ID: <efd9c3d5-a732-47bf-bca1-50a8650fd0ef@intel.com>
Date: Wed, 11 Nov 2026 10:34:34 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 RESEND 7/7] fs/resctrl: Add info/moveable_mon_group
To: Jinjie Ruan <ruanjinjie@huawei.com>, <tony.luck@intel.com>,
	<Dave.Martin@arm.com>, <james.morse@arm.com>, <babu.moger@amd.com>,
	<corbet@lwn.net>, <skhan@linuxfoundation.org>, <rdunlap@infradead.org>,
	<tglx@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <ben.horgan@arm.com>,
	<fenghuay@nvidia.com>, <tan.shaopeng@fujitsu.com>, <will@kernel.org>,
	<gshan@redhat.com>, <zengheng4@huawei.com>, <jic23@kernel.org>,
	<x86@kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
References: <20261110133938.3768632-1-ruanjinjie@huawei.com>
 <20261110133938.3768632-8-ruanjinjie@huawei.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <20261110133938.3768632-8-ruanjinjie@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0126.namprd04.prod.outlook.com
 (2603:10b6:303:84::11) To IA0PR11MB8379.namprd11.prod.outlook.com
 (2603:10b6:208:488::20)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB8379:EE_|EA3PR11MB771531:EE_
X-MS-Office365-Filtering-Correlation-Id: 8767a9cc-ce60-4c71-a2c3-08df40227137
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|376014|7416014|366016|10067099003|261028144727099003|261026121527099003|261026140227099003|261022075727099003|261022105027099003|56012099006|4143699003|11063799006|22082099003|18002099003|921020;
X-Microsoft-Antispam-Message-Info: XjeEncv9ywwdcz93KQENVhezkb72jGG+sdXIC9Mc8PImmtKjx0hIbiVms5bQjcBgdI1n8Phu82ItkZL3XxzLVKL4/wqMwzX0qj9Tua0jIt3wik4gDfDamwDQ146WO0ofOAVTj5df7dCuNfgvOaMT8wUEFpFFQvTHQ4+opyFhGroR+XT7EkOAB3ORAgPN6GPJWoZg09vk9cNNd47PF+aV4uJqy6IbIj0DxBIzHGHbKiTtJYFSxkTiR0zatmJGNWvHliLG6XQBP+qG7SmhOkPg96qNTctDKuwqjwArArybzegmoB+24GDF6rPWL1jZ8/N8ZKA/mNAVM1lqo7TG7/1WYz3Db4hJ5arOAaq7bBKyhwlYlgjc8bMLMHZqDGRbOHlgzVZ1D9C26H8nviMRvib4E6TYnc72XMfW9StgHtVwHJIMU8WnmD8OkQ4tJWHHhc3BhsoV5ZBBexsFyGjO2hga028WqABLSLaSB1mXqqC9UxJ61xNTPnzeTmwsZ0JN762b4jr4GoFmx1SCmGhV6NWJcCPsOGDUaMHMqsajEBCzjgvSatNJQzHmpyi2XP+jEPockYUcVmIdGnKnTvmdivrt+MU/ZgCHX1iD6/fQ1J12SP9qoStV5VznuiTM2kLa28h9qkAszzhWBtGobQuJAG+5S5y9/7gTJbk/OtWQbloT1w+DXW2uPjNbPfARtwQPppS46S3bcFNuaCMhTRLpAnWoYg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB8379.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(7416014)(366016)(10067099003)(261028144727099003)(261026121527099003)(261026140227099003)(261022075727099003)(261022105027099003)(56012099006)(4143699003)(11063799006)(22082099003)(18002099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OUdBQ0hHbUk4QlBtRDV5bUZ5MFZ2SHNwQXkxbkpSVHZQM21LZFRlN2x2R0ZY?=
 =?utf-8?B?c3l6TCtuaDFDNGM0WEx2cit6M1lZRzZPUE91cldTVElHbUsxdUVGQTI4SGNE?=
 =?utf-8?B?VFkvK3g3d0I2R0pZcHg5Qm5qZW1FS2VEK2p1cFN1ejFzZ2lTT0JBTVM2c1Q2?=
 =?utf-8?B?V2k5OXMrWXhPV2FBdGRoRGplZ0FGUHBoZUZaMHZYaE9UYjl6dGZXd2ZmaVRx?=
 =?utf-8?B?TS9rTkFNdDhvb1RXUGkyTGhNSGFlNXdRb1kyZnV3VUtZeTFjZk1MVE1vNHBR?=
 =?utf-8?B?dUJISjhyVXVLYXM3a0ozcXJmd2lSOWdXc285ZEoxQ2ZoU1lWR3g4ZGw3L21a?=
 =?utf-8?B?UHVxVTZXaDIwNjNwUWRFL2ExeSt0ZGpXdVVWWnFodU1IVnVLYnppbkRHTG8y?=
 =?utf-8?B?VjQ3Y1p1VjVRbzlGVXlsVUoyakJJMi8xd2lseERaazRsRWY4R1pGSjdBcnRB?=
 =?utf-8?B?djdGb1FMS2s0Q1lkSTgzTkFLRU5iTm45bjB3eTkwbE55TXVNK0lOQit1NkE3?=
 =?utf-8?B?ajVneWRiWVN2VlR1OTBBNmdqY2RGdDVqUExJelY1M0pGMnlXY0xuYmxJb1Y3?=
 =?utf-8?B?c2tFZ3NmTit6aG41NHlVR2V1U2J1RUtWektkM1JJd2xqYWY2b051czZ2VUZM?=
 =?utf-8?B?WWU0WUJmVjdvMkwwT1JBZ3ZEbU5XR043bFl4WGQ0cVB0TjMza3FURERIM1RL?=
 =?utf-8?B?OVJuSVdaTnRPenhnSjdCTEVuenFpbTkzTmxiNnh3MmpNcW81TVhSbFFQVk9N?=
 =?utf-8?B?cmYxRzBQVk9FMThWT1hiTE0xbCtoR3MrU1owY0QwVkNkQitPT2FudnBkUW53?=
 =?utf-8?B?SjBIUnhXWmF1aHYwZ050S0p1RjY2dHBUU0l6aG9EQjl2Sm5kVlc2L3l3M09t?=
 =?utf-8?B?VHdlTlg5Ulh0STRTYVJYZEdaRzFZRHV2eVF4Mi9LT3ZMd054MklSaG1PdTA0?=
 =?utf-8?B?TUlaSDU5cDBFWkIrS0NVeEJLMlNuYzJwRENGVzdLdkd0NzdUTkdIZmZhSUM4?=
 =?utf-8?B?Zmx0NFF2aFdqTWdaNjJqZE1iVWd4UFpzTnhjQTl2ZTBBMzZXYzI3L0RFQ3Bq?=
 =?utf-8?B?eEJSNWdIeFQxL1d0b1N5ODN5VGNLZFJ4WE51SXhURUovU1JIbWtEckxwV1dm?=
 =?utf-8?B?S1k3ckRHblZucnhrSTlGZGE3QUhTbDdFNElGUjZ3RDdqQmFOenllN01mVXBL?=
 =?utf-8?B?WjF4ZjE5U2xwdC9mZjlqWnpDR3hjeFlGZGtwV2hYZjE5enJRSnhVRW5zMG9W?=
 =?utf-8?B?RW5Xb3dwTjcxdnNNYWpBTkpyU3dZbFFtTWQ3Q2g0TVc1SnpqVzNubTdkNTFj?=
 =?utf-8?B?MmwybndUenFyMTV3NTlkNXpMQTVNSGlUaElWcFBnZFp6MENrM01jSVk0T3Jm?=
 =?utf-8?B?T3dWQVN4L054d3VhdjJCMGZjM1FYUTlhWmh2MHFFbUYvaGVDa2pWcTlyS04r?=
 =?utf-8?B?bTlLVm4xN0NpeDFRZEp5Tk1TOGkxajhIcDVoYjlETDVpQ0d3bnAyZzB1RkNm?=
 =?utf-8?B?VGNWRjYycUV1UEc3VHNyZXJmcWJWc0YzbW5TaCtyU2J5TjcyVkh4NFNkcHpK?=
 =?utf-8?B?RkVrYmVCUmRaQjJKTFkrWEZVWmVOYkh3RURQMWRhZlpzUEtybG5Ic1BDRndh?=
 =?utf-8?B?MURCYUk1YXNTNG41MVhKejI0blIwOU10bzdUNitUTGZtK3BXUnZROGxma29C?=
 =?utf-8?B?bFYvR3M0VmQySGRFQ3pwc0FNYXk0d0Y3bkZENGNXV05hOEFRbXh1V2J4L3pw?=
 =?utf-8?B?eW42dWlSd0ZOcVU1NlZVYUpPWGtpZmUwSTE0c0R0cGRHb3hQUnZ0ZkMzZ3JM?=
 =?utf-8?B?N21kR0xZSDJONXJWSmRFd20vZEg2TjdnWmcrSWxtSllJckI5QjVEUld0cGFU?=
 =?utf-8?B?R2J0Z21oRyswUnhPV3hZby9lU0paeWppMXlSeEVEbXBIaVdWZ01STEhVaHZO?=
 =?utf-8?B?bk5BNWxPRVZZWjVlTHpzclZkM29zOUM1Y3NuSjEwMVVWcjVScTQyRlJISUpn?=
 =?utf-8?B?aCs2N2FZbHM3MzlrcFpYK1dXZ0NOTVJDSTRzOWs2NEVhTkR2b09vMHUxQ21X?=
 =?utf-8?B?ZXEyaUtDaW92UTJYZ2JDUTJkMVpXb2djaFZrdkpSNFFiRW8zL0U5a2k2U250?=
 =?utf-8?B?NmE4bmpZYy9Td20rU1BqWVowZ3JxRUJ5b3FaaFVPMkhGZHJVRDZvaVdnRjVk?=
 =?utf-8?B?a05OOW1tMzZCUmFtSjcwaFNJZEJvS1FISmNxU3hySWRGT2NaZzRRQjVhNE95?=
 =?utf-8?B?SWt0amxadXRlNWdKa3ZSM3FoOUsvNXUrcWRwMnZTdFEvRVQxUWFSbDhocUg0?=
 =?utf-8?B?cHdwTUVYbXBJck9zZUtOVDJhYlVrc0NYbEhlc0NBTmhpVWxRWi9YNDBrWmx4?=
 =?utf-8?Q?Ye9SvBYc7WC8AG50=3D?=
X-Exchange-RoutingPolicyChecked: o+ShFfG4Kb4W+YGxYIJsUarIQyZooz1qGQ64F1E829RmYii2vMQPyE+SRRDb7KC0yBO59VL03vtQLmxBl7yF64HJLugxDNpmX4/ATyRU9IdEjAaCPGz1PYhPCRV1Vw8nAqr8AvzeaigACb0le9YNzcTtveIIJtvdF/GwDV9znPFiW2qWVJa+1S62lsySMzDY2OwVlDO01P2qsI5TpneUgWoXAx0M0bZvZiAxt8CQkyCG/vUh8uRCGyiyauZ5Im0b5cdbkbRgd16XW28FrXsAUqYiyFnXtulbYbhYYvYYloO8vr8Ggs4dP5rzSt2yd0zBWtXBPIJ970qyljjGmU7axw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8767a9cc-ce60-4c71-a2c3-08df40227137
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB8379.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 18:34:38.4070
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EWOdj5lsOX3BsaJS6mNjOPZpYqzCn5g94iqYJmlXYzG/42C4EbyBqvmP9HwGTpu0GgpoIPU0/oOD1bATnP7Vx18X0S4WKfI1prYrKrwoNMg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EA3PR11MB771531
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_103442_799788_D1607A54 
X-CRM114-Status: GOOD (  16.24  )
X-Spam-Score: -4.4 (----)
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

Hi Jinjie and Ben,

On 11/10/26 5:39 AM, Jinjie Ruan wrote:
> Moving a MON group into the mon_groups directory of another CTRL_MON
> group changes the CLOSID of the group while its RMID stays the same.
> Where the RMID is only meaningful together with the CLOSID, as on arm64
> MPAM, the move changes the RMID index of the group and is rejected with
> -EOPNOTSUPP.
> 
> Userspace cannot tell whether the move is supported without trying it.
> Add "info/moveable_mon_group", which reads 1 when a MON group can be
> moved to another CTRL_MON group and 0 when the move is rejected, and
> refer to it where resctrl.rst describes the move.
> 
> Suggested-by: Ben Horgan <ben.horgan@arm.com>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>

Do you find that this binary "supported/unsupported" accurately captures
everything that MPAM may ever want to do in this area? Could it be that, for
example, one day MPAM may be asked to support the move of a monitor group to
support scenarios where the reset of monitor counts is acceptable to the customer
and availability of PMG will be managed as part of the scenario needing support?

When adding a new interface it helps to consider future possible changes and
aim to create an interface that solves the immediate problem while leaving room
for future enhancements. If we do not do that the interface becomes a maze due
to new files just being added to address the problem of the day.

I would like to propose that this patch be submitted separately with the goal
to obtain more feedback on the new interface. 

Reinette

