Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 510A1606A6D6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 19:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GrwoghUp;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QCd2taxh;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=JOpPj+nw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=JDxQZXv7VtPQgZv6AEhSjCqJo7Hw9FjMj4XukwzSdic=; b=GrwoghUpfRpdXlL7ttUF3IAS/a
	2ju1u3jLzCUVKj98kTyl642tK+KQCXrbzqE69aaRu6BP+B9o6V6Dq/Wz+gLBz4LMoH6ky6UoY/A8T
	/JQer26t/8hppfmxmfU9PMkFOv9DemocjDs9cEZTTKfq9fjQv8OI6+D+otaOC9pym08a+k554BoWo
	/O1I3NoYoNcUvpX1ORzZ841uZm8LxsOAr9D1lGAbkzMYwMauCivLUOFv8xjD0COqi8C05HbJM/OM3
	dAK/nmqmUi9xvRMraoiJDhovvpAbZbuda01pJ/xU3EYjnlnpbK86q/TsLj9hrdAjrzHydnGVEzb7H
	g7yfD2Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUUKj-0000000G638-27KF;
	Fri, 20 Nov 2026 19:31:41 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUUKd-0000000G621-2bMB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 19:31:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795203096; x=1826739096;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=YCbpyyYA5HVx7M/gob5l9sBN3tcfZwVcyhPteNhdXMs=;
  b=QCd2taxhKLgX98CG6j+JIf7OcFuGINIqLdTU6vwRHeBcypg3LAYtPyAG
   YsyZzuz2yPO0UZbi7s+4cVR6Dbl5pBzgj3GiNzTzs6QsNTfoYBEEXFDTT
   d2D8ll2VmEOnestmzQHgg1Ju3yr5y7BuEBfE9twb1GQfnKGCIg4MEbwiB
   mTLu95Ro6Geuiy/qgiDt+Ddj0jnl9x0h27t8XlxOXsvNMZ408pH1RpnVy
   MGJmJJwAsq0+T+H2Lo8vqKJjeUPX5iqRnmT0abr0AJWdxCCuWEFCnc+A8
   5u4pOwskmqSShVaZEUPaLYlfIa25rdlqDz81Nzpgq2MYo5+ICXg2n+kev
   g==;
X-CSE-ConnectionGUID: 4kUC2SLbTHSZVtcYHZwHmA==
X-CSE-MsgGUID: AznvmSzzQ6SP7Qo4NybEXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4004643"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="4004643"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 11:31:31 -0800
X-CSE-ConnectionGUID: BBy5Rb+2T0W45IlVFlBuMA==
X-CSE-MsgGUID: VIKzEmzGQWWcJVnDN3CTiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="11117162"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 11:31:30 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 20 Nov 2026 11:31:29 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Fri, 20 Nov 2026 11:31:29 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.65) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 20 Nov 2026 11:31:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sH4bAqHiUdayz0amlVnYeQjhYFnN9asScFOvzjXGq8eZxpWjThbtwKCqRzHWvvmvPet1rsu900dS+374NYr8rxMUOHY494TO0c6uJmLYNdWAqPuYFHMyeUytxxP/yQljC+OC5HhDvlU5Dd3sA/DO5uU4kOCPzsEfLHXa5fwdi1narKm5YaX2EoYRXj/dXqT8GRiCTFAIH85PGJfKMhpu4Gagz3482qK2P3dljLWLg8Dsy3qoWYA8droR0bHSX6q2GxPqpTR9BvOl5uGFn+RUuZGr1m/NUSqGS4lzDoUhCCGQQk846H9dYPCtF1AA7xvump7RZ49d3aXh4WWdSBA2yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JDxQZXv7VtPQgZv6AEhSjCqJo7Hw9FjMj4XukwzSdic=;
 b=uupfYMxxVUiGPw6hPgNrNkjbL5aSEIgQ+VbObX1EPwpjpu4K7XUydXkspfu8q45ordl0Wr8Avnp4dgbnUodrQDswNMjM7OPokOlaSHTGuUDBOOLxWqYVplvMQTaePl0IUW6Pu+XMUwje9MvDkiDJBQnIGjKhAxbV0nk70mn5coKg4LBk9Nutb2kiqB3tW429ICdClBFWGjMgS3LLD3S5oiC/2XJ/zbxtWUaLJDdfapY0+WCQtgnglp0yBi+IaHuRMKHGd9W9vI5V0VzQAcxzkPh2V7t1nTl9pkOViJmM4pLd/cnf5UJmGf0S7xzl1bRhTtUPEVKVI3YJVUhWHnALsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JDxQZXv7VtPQgZv6AEhSjCqJo7Hw9FjMj4XukwzSdic=;
 b=JOpPj+nw6u+1TCPRSYZJSHnH1uvBWBWPELivO8eSmQcK7N61SLXgM3oMMxkXl2RNMt1/10EilIfTL30MPseoksL/R9x0x/vdNlXw8PSS1LMr4gjvbgjteK1XpkJfnPa5DE0GKHU35c2fXpU4oPOw5qYlx6Ui6f7pI1mFfcGUZK4=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by PH7PR11MB8478.namprd11.prod.outlook.com (2603:10b6:510:308::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Fri, 20 Nov
 2026 19:31:27 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0615.009; Fri, 20 Nov 2026
 19:31:26 +0000
Message-ID: <9d1730f5-d9df-4f25-ae94-c3a7dcb6cb2d@intel.com>
Date: Fri, 20 Nov 2026 11:31:23 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/8] arm_mpam: resctrl: Add a helper to find the
 component counting an event
To: Ben Horgan <ben.horgan@arm.com>, <james.morse@arm.com>,
	<Dave.Martin@arm.com>, <fenghuay@nvidia.com>, <ruanjinjie@huawei.com>
CC: <tony.luck@intel.com>, <yu.c.chen@intel.com>, <babu.moger@amd.com>,
	<fustini@kernel.org>, <tan.shaopeng@fujitsu.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<patches@lists.linux.dev>
References: <cover.1794283825.git.reinette.chatre@intel.com>
 <8635f50f938afbe3f58dcd69966c2dd45e2394cd.1794283825.git.reinette.chatre@intel.com>
 <691a76a5-7b22-4c2a-8861-3581791a01c0@arm.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <691a76a5-7b22-4c2a-8861-3581791a01c0@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0015.namprd03.prod.outlook.com
 (2603:10b6:303:8f::20) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|PH7PR11MB8478:EE_
X-MS-Office365-Filtering-Correlation-Id: 93df219f-cfc2-4a92-a9f9-08df473cddaf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|7416014|1800799024|376014|261026121527099003|18002099003|22082099003|261022105027099003|4143699003|56012099006|261028144727099003|11063799006|261022113327099003|10067099003|261026140227099003;
X-Microsoft-Antispam-Message-Info: T/WqSjTTGRfSf/SSEXbVxrsQZqjxgGhEhGg65v28DygpPRBkryBzU8rjUU7Of2Lmv5fZi2m2aknoYoLn/7LuIrjMCbRmVjCWm6hgV92g3uZ7vUGN+JBSLKDiLCeie5A5qafAoR6DOBl9WRuvkleYq2MQM3QNVpCuWQv7NAjZLd9mGn1gkYTijbCkJ6LnxivhwuNbe2p2F4C7wMwU2eArbxrAyU8rc+lrsVHiYu7Fwo3z8UjL90wVt6yMdsx0RsKezn7ssYrGy0ObVzV4RwUN0n2YIzMM+O6Fno9FrCn6EbjVBcyZmiqWx4SfAEUAyjRBz8uH8VMsuOAGG/l0JRk+LJ7PI5kQ0xIjC1W3IbZAcSfO63z+9YNMzPAnR0NvNGycgK/BUrqEidhcsKzc4Vfnky2dxmIn+iLZfR7F/ksiW7CT1s8yuvGq9Yr+yQNqnzbK1S2MoZYAkTwwgdZ0j2ZJKjc8q0N/TGQ50pY0QL0FiRItK7JDh5T0z6BrpWxHxdPQSkUvS7KHQ2gKH0LFexoiyEcH5zD/JhJN3SKXhxhy71a7yk8+uM/2pWXxk7AjIAu6e+WEKfBpN9BItFfH856FEwxXiUKc1Zcm9cH0tqt4+hDmC8ncJh181rrIsmqbIOzRhCpMeoYqct9xUYKizxM/uw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(7416014)(1800799024)(376014)(261026121527099003)(18002099003)(22082099003)(261022105027099003)(4143699003)(56012099006)(261028144727099003)(11063799006)(261022113327099003)(10067099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UklLemF3YTNzM1QxRHpLVWdrZGkxdHhML2pGemR6WEtEVTZkSGN3VWdLYXNM?=
 =?utf-8?B?UndTV0U2TTFpM0c1Y0NDZlB0M2dEODJmWDFwU3p1bm9tTzhXZE5lQ3A2VTFD?=
 =?utf-8?B?QnJkQkRGN3A5S3R3d2NNbUlsRmJpdFVTVytrWi9TOWhQVjRWbUthc2RZdjRn?=
 =?utf-8?B?UThLTGlpbEd6T3ZCcUhwVWVGTGxIQjR3UEIwTWtOV2R0NXp1YmsxY3RZUEY2?=
 =?utf-8?B?TVRoekpwcWZYSG5mMzlWVXBmQ3RqcTA0RCt4MkRhZE00b1JTV3AzTGpqd3VM?=
 =?utf-8?B?STFDSTZGM3hRRlAwR2l1MGZQdjdXUU13NE5MUXZtSWt4MHB4cXIxM3Y2TFVK?=
 =?utf-8?B?cHhwOWtNOEpiYzdvbTkzQ3F2M0hKeFZvcXdkOFk2TngzQmJEL0VKM2pHUmxi?=
 =?utf-8?B?a1YzdTZQNE1scDNTU1J4NGM0SXA5ZzVNR00weVlVcG1kUjFzMUsveFh1cTBP?=
 =?utf-8?B?dldaMHZyeGpPVVlGRFZWQVlzRHdta2VkUldhOHRpeUM2OGhiTDJIL0tQOFNV?=
 =?utf-8?B?dFRabEozdXAra0RwZkp5UGNkWXBVUzlYUmQrWnBwL0VQSzN2WWF1MDRsUGcx?=
 =?utf-8?B?aXk3TTBlQi8yTkV6TDdydWsrK0tERVR1YkJqbjhDcG1UOTA5WGVmWDhYeW9x?=
 =?utf-8?B?aTJqNE8zcVZBNThZVUhsZkIzT0RZWXIzZE52UG1iYllYMnl0eHp4UGNPTGlx?=
 =?utf-8?B?Q3dYV1Foc1JuRU4zU2ZQRVltcUFHV2ZtbFFudU5FVVV1Vkx4YWdqemRBZCtX?=
 =?utf-8?B?MmJrZWdIRHpJVDBiaS9LZnoxU0xaUEtqWkIrVnpNZmpnMnVLYzBZUmRWYUs3?=
 =?utf-8?B?L0EwVDF6ODl4amwwbk9wNjNXSUN5S0RFNEMwL1NJNTdlVFNXdURVUm1BbHRu?=
 =?utf-8?B?T2t5MllvMGQveUlpSW9iUVFWM0JKRW9mMTdjaDdKUzQ5eXp0c2p3TllDaUVR?=
 =?utf-8?B?VWlrWEF0ZGNHMTRGd010bjhlRWZtbkl1cTA3Z29QRmFtM1RYUW5OMDJKVEY1?=
 =?utf-8?B?dTdacXdFVDE1K2tVYUpXYUVSaVlhSUZjTWZGT0lrVEpGcUlzVitJSlowYWFL?=
 =?utf-8?B?bG1ZV1FDYXFpTXpLWlo2NXVETTMxS2srM2NqN0R3S3NTbWlyNjViMHFBZXM2?=
 =?utf-8?B?dk1uTU1BcUwrVk1iMFhPcDlFamwxVGNkZnBMcGFnZlFNbC85bFpmL0FZak5i?=
 =?utf-8?B?VGExd0pqbVZPS2g2M0VFV3kya25RbmlqNXRLUTdhYktvRzlKakRRK0RTOEhO?=
 =?utf-8?B?M1N4N3o4Si9IajE1MC9ydjU5Y2dXUmhjS1JiZkw5ZzlQOFQ5ODRxZTk5RjFs?=
 =?utf-8?B?RGlYVDM1aXdMRDFMK2RqNXZFdHRKcVRtb1dvZkYrNE9wUTJYeVMzZmtXRTlZ?=
 =?utf-8?B?MVBGTkZGWkJ6SGl3Yjg1SWZwOG0zRDB4NFE5ZUlwS01EZFJlTktCRnZNelV6?=
 =?utf-8?B?TmtPRzNOV20weHMyenpJVnlQV09mV1JqVDVMNmthNk43MXEvVUtTbHpIL08z?=
 =?utf-8?B?TkFUWUhLSlZVRG9WM1M0NkJSZ0liaUh2akJNUU5uYnhDTFRlTHRwTGdlQXZO?=
 =?utf-8?B?ZGpLVUw3d1ZVNnVmZHkyazJ3NmtPQk1xQWxtUTZNUVRuTzVaeFJrVTJFa0ZE?=
 =?utf-8?B?aVpqQ1pWZE92eW53ZmNMZXV4ZlAyeGJyM1ZsWjVLQVROUm1IODdBaGxIeVFC?=
 =?utf-8?B?SWF1NkpBLythZEZXV0lYczd6QzlrbS9HaWk1QjZxSHVaYmQzNnNsWGRFSWI3?=
 =?utf-8?B?aFJmNFJiZXJJZVltc29jZTBXUlBvSXdhWGwwMDFselJLZGFveW0rUiswMFJq?=
 =?utf-8?B?OEs3Yk5SVmRRMWVMd09HVGJiWFEzRmxUOU9HV3A1T3o2S3hUNVBHRUl1bTYx?=
 =?utf-8?B?N2toWWZqSzNxTm8xaXlJaVgvT2cyZS9wZjNUdDRrWGJVdS85QVkzVElPWFlq?=
 =?utf-8?B?SWxMSmMrU09vV0lKTGh6OVRmRkltY1Y0RVdwQ0V5ZG5QSGpMcUpiaWk0UTd5?=
 =?utf-8?B?cnV3bkdhYkRQNmRtVC9KcmNrTWFxOC8xS01sM01CSTJQTk1zMWpRWWNsbmlK?=
 =?utf-8?B?YTB5dmVkeEh4cDRhVEhpbmtFV1pPS2k4cUlVOHpPMVdQUHE2RWxMb05XYjFo?=
 =?utf-8?B?cGJ3emxkeHpEUkdYUU1GR3RiVHYvTytpUzJZYnozV0IzTXhZbDNzRzMwTEhx?=
 =?utf-8?B?M1doUXQxbGFKMG5RaDYxR29YK3JYSkhNcy9DNUNES29xYjdNbmpMSWliMHpq?=
 =?utf-8?B?L0N0Y28vd01yb201Zkt5a0lIMDZET2tudHZkMTBEVHpNenMrMDVJTUttb21t?=
 =?utf-8?B?d1RUWG8xTFQyY1AxYXNzMU5NVk1weS92MzlQMlRmSlN0dHNMWk5FTC9hVmZx?=
 =?utf-8?Q?XZtkqt+SFtu2fMSk=3D?=
X-Exchange-RoutingPolicyChecked: YL5bLm9vGwAgVgo7yGq2rHxOdiZ1VV8b8FZCD6VlhWc94lWWeN+VU4gWsGgLwlO4sKSuKQ4DXoWnQe70qIsNEPx4Gvd0MZ9g3ddRh00a+YCLwDs2a0FCmys3r+jIuLitxXAQNU0dxnfSFXAJQUVbuMVwLIqJ+lyFPhyJjLGVMCof7SNolYip8SYkPcVC7n5l6ovapD+scGwSiRytEJ5I1Lr55ZXJWisLdiIP9uQ+OOvhrWz1Ji62q4M7NWPw9/bW7VBf2Av7MGvy7eTDRkQqILADD6Z94tOiAUVvIxmJkNZQCCnidmh1jbAtTn1RXnTfP/p9UDmzMLneAvZEMjp2Qg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 93df219f-cfc2-4a92-a9f9-08df473cddaf
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 19:31:25.5009
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NL5Tyasz9MD4OZ1AEAnd1Icf+QUKXeYkVt8KTDrlVM+Y8Cb3qvtuyWYzvAquNM5Ui0yg+k9FOdnS/4tPT2KBJdyBS9O+d9kBkaa7n9rdMmw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8478
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_113136_369389_D1E522A7 
X-CRM114-Status: GOOD (  18.55  )
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

On 11/18/26 8:28 AM, Ben Horgan wrote:
> On 10/11/2026 04:19, Reinette Chatre wrote:

...

>> +/*
>> + * find_mbwu_mon_comp() - Find the component counting @eventid in a domain
>> + * @d:		The monitoring domain to search.
>> + * @eventid:	The event to find the counting component for.
>> + *
>> + * The counters reached through this component are the monitors MPAM
>> + * pre-allocated for bandwidth counting. Cache occupancy is not counted by> + * those monitors, it is read on demand via resctrl_arch_rmid_read().
>> + *
>> + * Return: the component counting @eventid in @d, or an error pointer when
>> + * MPAM is disabled, when @eventid is cache occupancy, or when no class was
>> + * picked to count @eventid.
>> + */
>> +static struct mpam_component *find_mbwu_mon_comp(struct rdt_l3_mon_domain *d,
>> +						 enum resctrl_event_id eventid)
> 
> I find this a somewhat strange helper. It's operation is not mbwu specific except for its rejection
> of CSU events and it doesn't support the similar code in resctrl_arch_rmid_read(). Something a bit
> more general that just finds the monitoring component is easier to understand for me.
> 
> What do you think of something like the change below? (The baseline is unhelpful, as it's your
> series with the first patch removed and the build fixed but hopefully it illustrates the idea well
> enough.)
> 

Thank you very much for the snippet. This looks good to me. I'll incorporate it
in the next version.

Also, thank you very much for the reviews of the other patches in this
series.

Reinette

