Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 247F3606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 18:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=M2I3WCYT;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EyBJnCoS;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=B7PC0Cki
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=iO6Z79c9Gzw4fCA2z3yZJe2K/gFb53pvBiFNuCsMtvs=; b=M2I3WCYTVP64CKz1KXNaO08mq2
	m1ezy4aVwyhGVgMds3GuIh4o7ZEX/Zlpl0MtZMfRdSq8YgNgillrBF43ttJIOgSPBx7W4GWijtiW/
	sLZOjP9kwW+LzvL4yV5A1gSYdYOC8mQrKLBt0tByVwKvRcYGqwfbzfci9122pi/LRw4RU5DBxjaax
	DPCK7ACyDZKfK0YmYKFpXpZ9Z5Yl3UzCrxspdHL/skzYIqL/MAQDi2x99iTlbvvFQEsTvB4LS9fHe
	4m3pZSWhtNCcEBit0mTub34ImrSq9HSz+8pfrzYQcJmzTpYfxXcOWHTkxwznXqyu2xzSZa1ChXVn+
	5AyyJ7dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVvIp-00000007V6h-350m;
	Tue, 24 Nov 2026 18:31:39 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVvIl-00000007V5b-1K24
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 18:31:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795545095; x=1827081095;
  h=message-id:date:subject:to:references:from:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=Ai1cLxgr/rTpWNHfBqbnhmn/g/+oyyX7sMNXiEKWmqE=;
  b=EyBJnCoS5tIdjnO97s8sLKz9JSR0ecUta7E/kcWQTboyoMd68NhFKKXD
   NsFF7iy95Dwl+nv4+ib7hbl/g22vrCxohjKAVhWc/LORBDs3b04c1ty6T
   wBM0psCaAJ1H2yH2qqGM7bwjahPUU6hcxm3cyGJFhO0LYE2CdxILGf+9l
   PGXX0xjzfiSe64clk9GdYfo2UExEXWqNzIBnL2rb+uYx7d7Y6kf5+i57L
   uTGWNI4rjOJ3zLLpyFIF3nIxIznTSPWDIAjEptDfKRxqytTXC9d4HHX3n
   kJWmWfKnNbBpB35q0XsHLJL2+54/GT3OvMFgmIp77Zvo2l0Li61qKPYc7
   w==;
X-CSE-ConnectionGUID: B8DXNrVfRhi6otBi9b2x7g==
X-CSE-MsgGUID: SYDC7esTS3OjkxklmdSLAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4297569"
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="4297569"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2026 10:29:23 -0800
X-CSE-ConnectionGUID: fItF/kKeRWWzv+nFQkKZdQ==
X-CSE-MsgGUID: F9A7a/YqQWuRQ+1ICBaBbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="11762077"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2026 10:29:23 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Tue, 24 Nov 2026 10:29:22 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Tue, 24 Nov 2026 10:29:22 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.45) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Tue, 24 Nov 2026 10:29:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LsD+RZpGuMYPgZeXdPNxe5zihtTKMFSwE8jF/zuhj93yAIj3chvyfuYaao8vS8kNEXRgvIkJQthbU/U7ZME9r1VmBy6sedU6MTqhkRaQJDNFnWxSHIvO0clMnEXc9rFOQfCUpzzJ1toJYkV6BqqvsOWZxiK+DVKYq4Ajdlc6ToA8tEV/A9hvTAPXKxQg5t2VHzcJX24OeDBH/T49LX7iTbCgmqq436pF4YMYgTPOPRRVYDvrL6iyTxksmLNPbwtIhooYS+vbRmARJEmtuLiels7DpBgQF+fweYKW7LU5FcqwJCXH+yn/2HwKtccTcTGXOCpNvh47zZ98TOy23t68Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iO6Z79c9Gzw4fCA2z3yZJe2K/gFb53pvBiFNuCsMtvs=;
 b=HWoJu4hMg40ANSgA76C3EfhCPwaNk2ekuvaY1iCBNRNwaDryl19+6ORnxJRUWp3grvyi7Rhqosi2mmBri4Vq9rA961Uys/lCUVlE+9vJNMButBThp41Q5lJ32cr44SXatqrKnl5YJaIf990S5ejxInw/2HpvcyhG0QJxncs+W9A0xOigecJGuF0LwIv2alwxBLUl1kZ8Qgn2FhPUMerI+Wu+8ATZnZONq5SHj5qflk6ITXdS02tN8Cvk1mb1fKeWmDCh8yuH1Wh5PY7blxuo27GVDjWVirBPM57f45gSDtFMklWWmtJwRK4NJgZ2XIZ9d+8opaFF+AmMg+n9tqCtdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iO6Z79c9Gzw4fCA2z3yZJe2K/gFb53pvBiFNuCsMtvs=;
 b=B7PC0Ckiccnxh6Gus344CCh3i4/VmJh/jxy1+A380wMc3Yag1QjScuu/UCdSz7pz88DfNyNRoApzFqmqGOkd4o6RhgCURx+z9cVXofLMuNBC5oO8m/Yxv9UkVp69j8SdcYuzvpwD7nL/HHiD9BPqMoVpR/DiWnwhijmPvf1qfi4=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by DS4PPFEDAA4523C.namprd11.prod.outlook.com (2603:10b6:f:fc02::5f) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.4; Tue, 24 Nov
 2026 18:29:15 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0615.009; Tue, 24 Nov 2026
 18:29:11 +0000
Message-ID: <1a4776e4-2551-451f-9241-8251f663081a@intel.com>
Date: Tue, 24 Nov 2026 10:29:09 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 RESEND 7/7] fs/resctrl: Add info/moveable_mon_group
To: Ben Horgan <ben.horgan@arm.com>, Jinjie Ruan <ruanjinjie@huawei.com>,
	<tony.luck@intel.com>, <Dave.Martin@arm.com>, <james.morse@arm.com>,
	<babu.moger@amd.com>, <corbet@lwn.net>, <skhan@linuxfoundation.org>,
	<rdunlap@infradead.org>, <tglx@kernel.org>, <mingo@redhat.com>,
	<bp@alien8.de>, <dave.hansen@linux.intel.com>, <hpa@zytor.com>,
	<fenghuay@nvidia.com>, <tan.shaopeng@fujitsu.com>, <will@kernel.org>,
	<gshan@redhat.com>, <zengheng4@huawei.com>, <jic23@kernel.org>,
	<x86@kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
References: <20261110133938.3768632-1-ruanjinjie@huawei.com>
 <20261110133938.3768632-8-ruanjinjie@huawei.com>
 <efd9c3d5-a732-47bf-bca1-50a8650fd0ef@intel.com>
 <7d27b172-d186-4b7a-87af-d0d25554b964@huawei.com>
 <7ce15dbf-d4d7-4fb3-ad50-f47f782a7440@arm.com>
 <0e51dda0-8be0-439c-91f0-ce292fb0c13b@intel.com>
 <6fee2695-3edc-4beb-8877-76c7e1b056af@arm.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <6fee2695-3edc-4beb-8877-76c7e1b056af@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4P223CA0004.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::9) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|DS4PPFEDAA4523C:EE_
X-MS-Office365-Filtering-Correlation-Id: 5593821b-f08c-4eae-9356-08df4a58d5e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|23010399003|366016|18002099003|22082099003|921020|56012099006|4143699003|11063799006|261022105027099003|261028144727099003|261026140227099003|261026121527099003|10067099003;
X-Microsoft-Antispam-Message-Info: DCCe86azqA0A3n5cxY/BumR+p5Ha5ubbn44cEE2ENB0/ahkyjpLNRnT7MTrCLA461w++ToqXrHoEJDCvg9vl/HlYt2HIRMWywMcIfSA8D44HBFC2CgZx+rTnV84cxMnuRGTcjsZ1/f/X+W5JHSIsNakV6L+3o/ApsRe/H3bi86ZgKllLfgwkNsunYMP3AtUNVD+xsIeGR88gxsrE3AztPdb1LFRlpXsBfxp5u7S/A6ic7taZK6M+aDVZwGDhvR7R1yLCAa/7Q6/R6fbAs6RvaQlEc3wXNUNeEJ4NIyUH/u9YKkqdQrozLxIuNQQogX3eCF49yhS7VeSBeROdmAD+1DGErWbpXjcQfY1Wax4kqXi1oKPf7VLGfUmn3cliRh6aWGUDUo49J2dPXyXsDtUWBNSGFjKPY93RvPO5ZE6Y4RYz54faWM/FbxUVXqaS9mBhZ4PCthQW3Le9Raa34+2QpUITV9GHXgGmn811ax/kldiCPu4OW/BDdJOU6S+lWpq4LXueTiO2V8wKJGkCFPELOFduchtCtsWp7H+J/F/YG76yemWnXYC/VGZbm3TnC9GUPl2NfkKvs2IRC0ii58qQ5TcMvF7q7SuItI6FTzfV39x4/hvG4vrf1Y3jL6E2jR6+HGmNhC0pgU4lUPZ9jBsJliNiE4ZQJLsPrFgtIox2xpVaqcr9a6k6c2+N0cfHnHBw9J/KuPLWKCmqc3T6JX9Gnw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(23010399003)(366016)(18002099003)(22082099003)(921020)(56012099006)(4143699003)(11063799006)(261022105027099003)(261028144727099003)(261026140227099003)(261026121527099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cnEwaUdCZmhHR1VTTXVQZkdyNGtDOUd1bXdaU0JXWjBPMkplakNEKzlOc28w?=
 =?utf-8?B?SVBFSWgzQ0xxUmVuYmx6Q0VyQ29WVGIwYmRQbGxVM0VMTHdNdjNTOTgyNkh6?=
 =?utf-8?B?bE8xWEhNTTVQOW1QRWRCNkczSkJFTnh6Wm9ydU9VOXFCTWlxSS9qanpWV04v?=
 =?utf-8?B?L2NHYU9LRUxZb3FjWTduSFRJM3Z6NzRaOFlwRk52WitDOVVDbmtmbktVV2t6?=
 =?utf-8?B?cmN1ZHJHNUtzL3c0elJVUU9FMUxid2RCZE5GYnFuY0RjMjFyNE8rdi8xMTdN?=
 =?utf-8?B?SlgyTjJnL2ZMR1g0SUNvcmJwd2N5VEVsODFVbUhmeG81ZUp6Y2pUYmp3RWNl?=
 =?utf-8?B?OTFsVGtzdytvOWZhWDB1MTZmR0JrTFg3SzcwclZoYmJXWVJYU2x1SHFSSWZv?=
 =?utf-8?B?bk11ZTY3KzBtbTZVaWFtaWRnRldZRU93R3lsTmo4OHBZK3NDS1VlcS9xV1cy?=
 =?utf-8?B?cnFhV2l3SjdvUXBwdkhtY3M1MU8zSVV2VUVpeG5NcDZJOENrZVFaL3Q5bkJz?=
 =?utf-8?B?YVczVnZReHRsQW0wWkd1VDF6ZEFHdlJlaENrT1lDWEg2eVJjQm9idlNKczdQ?=
 =?utf-8?B?a2ZjSEhidXh0MXRoeVFHdTBwWFNkSjFkV2g2TDM1R2VUYVd6Qjd5QUFERE5I?=
 =?utf-8?B?elhLY3F2WkFWbThWNEQ5UmFsS1VOUG5wY3NsdUEyQlJTa1RqNjNDK0pNcXdY?=
 =?utf-8?B?VFZZNFU3UEQrSWZreWQrRTBYalV5YkRIZC91a3BTeTJDa3RFbWtBbTVoaUFv?=
 =?utf-8?B?bEx4dW40ZUJ6MFUwZ08yRkNMM2RxcVVmSGRRNFBaclMxRm9nOXVaWmxIRHp2?=
 =?utf-8?B?dG9uZ2YwMElZYlVCQk5maUg1cktSYzY1cmZJcTNvb3hjM0MzTWllOGNMeURk?=
 =?utf-8?B?cnZGZUMvb21lZkhpTEdmU0oxN21ENEZJQVh4WTNkSkpZTDlCTHppU1hTeGpK?=
 =?utf-8?B?dVU5Q012azhEUFhiam83RmhHbjZIWHVtMHJVSGVab1dKUFAzbmV6VkFocjIy?=
 =?utf-8?B?b0FqeHh3UncxYWorYVk3Smkrb2xmUzNRSHd5UytQTlpVM25zMG12bTVoeUlX?=
 =?utf-8?B?Mys0V0VXUkdoU1FnamRmTDZHcHFIK3RzSU53YmZpT2Z5RmpiM2hodTRTL3Ro?=
 =?utf-8?B?L2dIQmZvUURQMTh3Y3ptT2tETzNsZHdwWU13MHpSTklaT0FmOERiMWpGcWh1?=
 =?utf-8?B?UldJalk3d0JNcmpEenpvbmsrUmgyNEd6aDV5QVZqSHIyQ3U2K0J5Ty85cGcx?=
 =?utf-8?B?QmNTTFlnNWl5UnZjeHdGb2RDOUpWTUpGZ0Nvc3FlUDZkMzBpWWh4bXJ6SWZZ?=
 =?utf-8?B?OER6V1JXZUFOMEQrNDZWR0p6eDZWTmNyRTRUdmlvUEJydXZwdU5LeE5Yd0ZY?=
 =?utf-8?B?U3lkTHduY01PR1JpZW8yeFVPUjlDQ25IdlV4aTdlUGdXWFZKYWxqWnZzeTZ4?=
 =?utf-8?B?V3ZmUDRuZEdYVWQ2SlhGUFQ0SUVVVjhkVG0xQWFoZFVMS2l1Yy9Jd05hck1M?=
 =?utf-8?B?VDFTOGNwZ09vdWpTYnpuZWl5NnhCMmU5K0IvbW9XZzJRZ0hHOGQxU3gxWW9o?=
 =?utf-8?B?ay9MV0ZFOVJGeURheXplbzFic0pvSGliejViVjUxbEVCSmlsbnpqRXNtbjZr?=
 =?utf-8?B?Y3lTaThWOWw1SzNVTENaWm9aNEEramloeXBxK1hVVjlwZWZPY1U4ZEFFV2ZH?=
 =?utf-8?B?SEt3M0ZkTTZySEZjZXVrcUwrZFlXV1IwVDdtOWJJRHd1aGJ4MFpMdCtEdkUy?=
 =?utf-8?B?dnRNa3YzWDBjTU92QmxDMldLUmgyeERUSjdtbkJCZnJIQWJGUGxCYlFZbUp5?=
 =?utf-8?B?bUltYWFpeWRKK2IxKzExdENIYVM4Rm9zaEs5QWdPWXR1UnI4c2s4MTcrQ0ly?=
 =?utf-8?B?S3llS3ZKTm9xdDB5ekprZTBKMVZkUFNtTVAyU0lSWkR1RGJ5M2JrNUwxejdO?=
 =?utf-8?B?YUlMWXdWckt1L3d0YWVENVBaQVFaY2NnMU45dHJ4VTk1U2lqWnlwTDhSa1JN?=
 =?utf-8?B?TFhaWXNxMHVzclBlM1AyeUFLdkN4ZVJocmVKaHkzRGdCeGFlMG4wNWlvS0Za?=
 =?utf-8?B?Q1dZOG93YmpZQnE2VEs4S2x2dWFhRE1hU0pQK0pNSHNKTks5MnpQQXN3cEpN?=
 =?utf-8?B?d25pS1NUaFpHeERxSEF6NnQ5cVpyZkVUeExURExoS2kveFpNZ3grN3VHV2g3?=
 =?utf-8?B?UlAvQVBWWmVpOFp4M09oemIrY0I3ZlorVTUvdkMvb0FqMmFLOEpSWmt3TWhW?=
 =?utf-8?B?STBhRjdqUE1Pd01LY21HeHJhQ0w0dVMwMzhoMUFGaklWMEtpc2dac2o0a1cy?=
 =?utf-8?B?dnZSTUIyYm1wZ2RCUmNuL2dTdGFsd3RoMG4zNDVYOThTNTE2RWhzcExkYWhh?=
 =?utf-8?Q?/ijiRwRrkuHZH24o=3D?=
X-Exchange-RoutingPolicyChecked: JP2gXgHmy0Dl6uQHab6JF4BE6APVtv1tGoEMdJyB3LZvE3+VLeDcLnqXKsHbKAnw9uFBUcFaMitVprm1LIibLbaEs2tpVOPsrse62AMevctnDYTohBK7hCQ5H8JdSS7Y88XpIp8XOFvMUW0ryqdXD96XCBMkMxcnDeTWslW3oZ9Q3X07rguIsCCL0jw9vUPTVr+JZXw3F4hLu53SqYW5mCFCudzQ7D2sLhm2Uy+DiOQSxBFGUJqagu3KAa9b1skADtP6q0U7R5q+vWX8Pzscqe99mvexPKkJTUuWFCy2yyoZvRiyOgxLx+KJpA6NlkFE7vCL5pgmuyv0MVReZbsjRQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5593821b-f08c-4eae-9356-08df4a58d5e3
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 18:29:11.7052
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O3oRtxqPCAetFmtDUn2WwqmimiHnMgwsbchYRtr5VPYD3mZTNQn+W4MoLBzA7kY7lWeWi16lR2sAnkc0BU+FoKcv8X2LDIdQbE12PAZVl9A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFEDAA4523C
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_103136_693781_DBB67E69 
X-CRM114-Status: GOOD (  14.66  )
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Ben,

On 11/24/26 3:19 AM, Ben Horgan wrote:
 
> 
> As hypothetically support for moving MON groups that monitor CPUs could be added I think we also
> need to take this into account when designing for extensibility. The two current behaviours for MON
> group moving across control groups are, not allowed and allowed only if no CPUs are being monitored.
> Perhaps, info/moveable_mon_group could show "no" when when moving is not allowed and "tasks" or
> "tasks_only" if it is allowed. The "tasks"/"tasks_only" does seem but a bit awkward but I can't
> think of anything better at the moment. Using a word means that if we want to support destructive
> moves later on then we could later use "destructive" for that.

Thank you very much.

This sounds like something that could, potentially, describe "movable_mon_group" as (very rough idea):
"Shows the supported and currently active mechanisms of relocating a monitor group to a new control
group. User may be able to activate a mechanism by writing the name of a supported mechanism to
moveable_mon_group."

The naming is always tricky. This can be hashed out later. The main idea of establishing this
style interface sounds good to me since it provides flexibility for future changes.

Reinette


