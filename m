Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03F62606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 20:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=E9VmYpuv;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=co4G/yjb;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=T0axgwNx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Uz9Pd7EOL/4+aT4BALFe89FVLH9mNx7FK5jEuD+/Udc=; b=E9VmYpuvZ2Gapfo/X7HFCad+lC
	k4rBPp/DRUd40R7fYT9+9Jq5h6dexYFeMFDyDIczIBTMZJL5Xys5BGGc+Tm63QetT27qJuhKIioYe
	cgcvtlvNctF0bj12prKyenxnIT+eOV7j4ixtNikETP9BBWPgtFvHo6RbPs4h6i4CxTTn3xbD9rqFK
	i85/83ftCB5RQDZZ0MoJT7mEZuGuAX36Ga8TnILXz6FJmCU2j/Jk1btRY8qyfHtJVpBswpcI0y2p4
	KfjDN5mPFt06oCXvyAHzZkQ5jHEFn2SGNkeV1hVgDs56yiER2w+vrAXccydMYeBQYHsmCdWgFCt4T
	cG8S6NXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVxI8-00000007jnT-2TeW;
	Tue, 24 Nov 2026 20:39:05 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVxI5-00000007jn3-41xp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 20:39:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795552742; x=1827088742;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=3sxtIco6Phm0xYJ1zq4FSejh/1dggdUzQG3p3uVTrSU=;
  b=co4G/yjbEWu1LfpXp+5wpt2Q1rOGXKemAyuKVpyJAv+QdndjFaWMwV/C
   Qzs21pUEISKrchR8IVRJAFWW3WFFkzJF8FdyGX6eM8hInpSZCRvZriwdP
   YVafOBkAPHVxlwHkQWep6Raful942qocL7oTYVR9JjGCXJAZ/NgCqFlD1
   v61iT7inzJyLESAF0PJRIHZJPq6Zct4ZU+7jQOheawYlQlkYhWIWY/Y7/
   DtmKhWDOzbIUGrIhd7Aw5OXpofQTkrbIvLVJza36Tm3U2W53o/qxjNrDL
   GAmubla63JDxVw5SjpavF+bkqw1ZQbF9+A27EncQHPqovPRan8R4CN6OS
   Q==;
X-CSE-ConnectionGUID: J7a+uvHaRGKJCiJBBzuRHQ==
X-CSE-MsgGUID: iV4Rn153Rt6GOd8MJ1ZfTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4338824"
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="4338824"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2026 12:39:00 -0800
X-CSE-ConnectionGUID: xueIRXcCTRi1QTVylEOx3w==
X-CSE-MsgGUID: KcdwUI4pR460l+n/ULeXyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="11794809"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2026 12:39:00 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Tue, 24 Nov 2026 12:38:58 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Tue, 24 Nov 2026 12:38:58 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.20) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Tue, 24 Nov 2026 12:38:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xpiijBozwVQ7DXMyvXOSlS8L9daSANyVd1NdpNJMDftTpf2uVJ6q3VcBpvprQ6fUrfnqCjgk0rpEE9bpqD2GuqAxTWVAapzxpkwxu3MsQ6j9fgaIqQiKWVgX5lYdU8CjBbRIZh+gOznkU6K0ltS7PHAY9mEm1rfS9yVFUQIM+bjTKe9qcm4IuvqtJ8vr3Qvobi0F3HWYGzxStMcLo428i4/V2ugIsZv8slYHUZR6u31zoJyYk7+KX0o1yWGcZwfqZRcP4asZ6OJuf2TxtBrR9Eyrbfv43w/i6VpiyV6MGoTED5485mVohyWxY7zddRnVAPbTiYdkHbpMYVsfeEKQPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uz9Pd7EOL/4+aT4BALFe89FVLH9mNx7FK5jEuD+/Udc=;
 b=S6rjueVQXsdULw/phcyemQFT8HAUOZagezWb91pes97ugUfYd36WsJ3UMlIZAn0WlmzXcbfnhqNAeKoc+SH47vRF3FO8Q8Pf/KLxNXi7XALnp4OEUVPTKcTi8+y0HhQWJASLnR5TP7dvkN/38yr/HUTUASt8+BEf3/hrJol4qwdEuh3rtz3MZXlnaJTZ/o3bw6qMJME32G4e9pFgtJjO08l5+rJLnrR46KuSx2V73pGQkU4H6DrHWYZ1d2tQrbhXM14/rjnZBwJURBbmmlxfHBqfHbQELv4ouAgWY53WTm3l4UIfGbsgSlv8/IY3/9fNT8odbAGZlAvFSnUsArOFnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uz9Pd7EOL/4+aT4BALFe89FVLH9mNx7FK5jEuD+/Udc=;
 b=T0axgwNxQTHllZ1UH1CNHJM6Bjtu6W3a1Te+Ni5yq16s5N3RjR1obRDeEtdO9iHXUG2cfcowdDLIH88LHwtk1RgdsI3yL0JdXdYNQDU57ssZ0b4CK68wrxp5enMhBhLmmCCVlICPEZGt49EPEWFBhh8ltV27kcyL6baoFvO4mkE=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by PH0PR11MB4888.namprd11.prod.outlook.com (2603:10b6:510:32::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Tue, 24 Nov
 2026 20:38:55 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%3]) with mapi id 15.21.0639.012; Tue, 24 Nov 2026
 20:38:55 +0000
Message-ID: <94665b79-b6d7-44fa-a1df-dafac3616f11@intel.com>
Date: Tue, 24 Nov 2026 22:38:46 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 12/19] perf auxtrace: intel-pt: Use common snapshot
 pointer fixup
To: James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@linux.dev>
CC: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
	<mike.leach@arm.com>, Leo Yan <leo.yan@arm.com>, Will Deacon
	<will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar
	<mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim
	<namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "Alexander
 Shishkin" <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan
	<skhan@linuxfoundation.org>, Suyash Mahar <smahar@meta.com>, Amir Ayupov
	<aaupov@fb.com>, <linux-arm-kernel@lists.infradead.org>,
	<coresight@lists.linaro.org>, <linux-perf-users@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Arnaldo Carvalho de Melo <acme@redhat.com>,
	<linux-doc@vger.kernel.org>, John Garry <john.garry@linux.dev>
References: <20261105-james-cs-unformatted-per-thread-fix-v4-0-7759e0ce2449@linaro.org>
 <20261105-james-cs-unformatted-per-thread-fix-v4-12-7759e0ce2449@linaro.org>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606-4,
 Domiciled in Helsinki
In-Reply-To: <20261105-james-cs-unformatted-per-thread-fix-v4-12-7759e0ce2449@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DU2PR04CA0235.eurprd04.prod.outlook.com
 (2603:10a6:10:2b1::30) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|PH0PR11MB4888:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fbfd4ae-94ae-44c2-45bf-08df4a6af526
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|23010399003|18002099003|22082099003|56012099006|11063799006|4143699003|261009223027099003|261022075727099003|10067099003;
X-Microsoft-Antispam-Message-Info: MAkp3n22qgr0f8HSFkTY1HREmQqR2C+s4ycCmk9X0w2DHdix1MaOh9hm2hTKSI0fFMVEIaB2fLcPfcgup8c+2BBunjY3RnFdhOQwa5cfZJepu8TFMzvxcoqvtdAoUrp3/qQFbH47I02gbL6yx+dlHVRpkqudOuVtO6P+mUnWjMeAbqdl4ERpd/047RK3JcqZz4n9ogqpWLlkvuY/gfWk0GMhc07cSI4JVIJRYy8zzU2gL6W4vPQkQm4nPH5k9sceuh9N4hVF2dpvEWGS1cKzs+d0agGzDP1Vpus9CaKlJzR0wl1jNb1kmcHKfpa8QGPCQ8L6LVIsnt+sZSokBC0K82vEbSslN8S04qqnlI249d/4eUSmMqHuGCy3Q7u161YK4AyjpruAR+/CDyfwsiqD9ZhlGOwT8CcGJWQjKZwS95NAiyobm+fgzieBqOtY9Bd+w61xhsGpMam3LVS40viKi9uZkoIDkne67Cjq+ISuC41OkOMwlWkyJKeLHfdH+Xz1+ZV6+jFI2U1fAG0nMYIoBL0GbQSBMmHNFnl09wxQNhwxdvD7LEBUgHKQIPBxpYSW8LLnwWEZrklUurMshM3d8PmLZV0woQV4OiPUedE6SBA5QBGtJlgI66ulxVWEDMllVh/fFoXUU6/q57rVHWrIlA3oR0qWO6Ue8FSW1YV1YU0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(23010399003)(18002099003)(22082099003)(56012099006)(11063799006)(4143699003)(261009223027099003)(261022075727099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V244c2xHd29qNGw0VElRY2ZJSCtBb0hNZGdTL2F2VVpBbTVLdko4T0p3czg3?=
 =?utf-8?B?WnY4d3ZlVkZ3OTFxeVcyS09GREFLdThQV28xWkpuMEYwOER1RHlqNnRMc29R?=
 =?utf-8?B?ZmJUbHdrRWNyN2xWZTkrbmY3NEZqOXRWUzVHVzNzLzVERTBUK055NlBmWGUx?=
 =?utf-8?B?NHExWTBjSmlMbGJrMHlWOE5yQjFsSDJiTGdaa1JJUkdKRVZuQStJdCs1NTcr?=
 =?utf-8?B?c1BHanh2S1RzaHVGTno4NVhCalhNUHl5VmVKZkFYVFgxdXc2SHZlaFhYZEtZ?=
 =?utf-8?B?aHdMRTE5MUZoYTlSUWdWSyswdnNqY1p3bUZYLzV1bCtqenJMSWtWblpmVlVD?=
 =?utf-8?B?MElPSlBZaUJIb2VHRzVxbCtkVStxT1NJVjJId3JPbVhwQkZBVFBzZmJyTzV4?=
 =?utf-8?B?b3VVaWhGWEE1QXVSamt4blg4MVoyeU02dnhHK29BRGd2eDM5VEtlcXcrZUpu?=
 =?utf-8?B?bHNhU2M5NlBqbFA3U2RzaGhLenlhSlhKYlBzMnRpM284UVJjbDBZSytuMTI4?=
 =?utf-8?B?MW5xQ3BPb0Z4b3owN0JnQ253aHRNbTc1VzhRSjdqWFp4cUs2MEJpQWhHako1?=
 =?utf-8?B?cFFYTUpnc0ZOOTBrTmFDWWdzYjdnZ0lwZG5CRDExQVl1dThTZ2tpM3EvTERj?=
 =?utf-8?B?SmRsVjI1MWordk1MUEpQMjdJY3B1TWpFKzV4NldvdnBrOGNOcVFDa0JRWUZ6?=
 =?utf-8?B?cSt2UVBDR2ZramNhb3l5OVBBS0c1SnVFR1lQeHRXa3FpNUxkWFZJSVhCUXpm?=
 =?utf-8?B?MjVFZ1VsNW0xR1cyZFF1OUFmYVdDaWxTUzJWV2M0b2lsVmozSjc3UlROR2U0?=
 =?utf-8?B?S1VIYUM3K2EvVU5UZzZhdW0wbnBQOEg4WnpEN0dwdG1QNzlkNDliWm5vcFR5?=
 =?utf-8?B?bHFIWFd4VzlaeDZRZ1gveU1rNkpadFlqaVlFMWFucDNWVm4vMEo4NTd6RXM1?=
 =?utf-8?B?aVBvSE9YOUxBdnRpQXIySU0yWFpNNmJyMjRydUpKT1A5TXgxVzVNeVcxVVdH?=
 =?utf-8?B?NThDQmUyUHY0VHpicmczeWFsTVAxKzQ4V1A1SVpIdEVRZUJLQnJoSjAzaUxs?=
 =?utf-8?B?T2JtaVphZnBiN09GNlU5aGlvTDFIZUx2bWkzUmZtZzZUck5MSTdPL0pYQnlj?=
 =?utf-8?B?Y1BtYTFteGQvR2p3eU5RamFGc2p6UTdGeEpaUnoycllQajBrZVdHYTJqc2dh?=
 =?utf-8?B?RW5ORlE2U3doeFhHMTJuL2ZTMnlJL1NLd3JPcWdOSUhXMTVFL2x3RGNWVHpq?=
 =?utf-8?B?QUwyZ254VHVMck8rSSt1RHNuY1JxbDd4V0tXSlhsSFB0bDZyVGx0ZkhEM1JE?=
 =?utf-8?B?cHNkaStudEhlZTNQUURBQnJUYXFLU04yd0x3bnRwWVVydzBiZWs0bDZqNGtX?=
 =?utf-8?B?SEVRV0hqVUVmWmtFR0FiWHJxbEU0SnJ4akF6UDlPUVhFYTNDbkFMZGt2ektn?=
 =?utf-8?B?VmlvRWNsSlFsaW4yS05mZEtlTTV0YkdOQis5bUh3TWw1ZTBMbEF4UGs1Qnhr?=
 =?utf-8?B?b2VOOHBvU285NHFBeC9mRnFEWERwOTdTY2RqSUg3YXlIQW9WM1BkZ2lnMmdi?=
 =?utf-8?B?TXVEM2FuN1JjdE9BMGJlZ0hUZkROL2JINTBYcDZzMllaZnVGeUY2S1JmSFcv?=
 =?utf-8?B?OStsbEhjUmJYSUgxQ3RHanBiNEJaNXVKNjAybWI0UExtT2FZODVrTjlOdnhy?=
 =?utf-8?B?K21XTHlrZWRsMytIcGVDYmhSWi9tQXJOZUFDai9Eby9xTVA5L2owczd0L2Fa?=
 =?utf-8?B?WSsvZDVmYkxSc0FoWmFzd3FJZlJ3bGREa1RkbjM2M0p5azVseHFZUVA2TGls?=
 =?utf-8?B?WmdacnRkZWsvaHFIUWdCdjFoOVN0OFowcFliVmN6VGxvb0NFVlZCR1d5ZC8z?=
 =?utf-8?B?eTJTNUlablAvL24rT1QrdW43WWFHWkZEZ2d2Z05aUjlmVnc1TkhBdjBCWERh?=
 =?utf-8?B?NkFYRE1Zc1JJSmphM25abDhQTVUzVFAzc1pkYkUrZTNZaW8vcE9WZFpvemJ3?=
 =?utf-8?B?dTI1dVRVc3U0YmxzN0FsZEw5YUtGUUtZNS9PUjRQQkpmNzlra1EwMkhkaFNp?=
 =?utf-8?B?UVREQTNBMzIyMDBnRGFGWnRSc21wblJxVm9ubzRrNk9uenBqTU9KMU5TTTAy?=
 =?utf-8?B?YmN6b3YvRVliWUt1RXJFanpFcjF6N1pac2g3L3pnRzRUZ1RqNVA1WVFMcVhh?=
 =?utf-8?B?eUpIZThWQzJNTkZzV1owRGx1Tjc2SmVOOTg4K3Z3dEQ5Q0V2eWVvWnhybkpr?=
 =?utf-8?B?dEQzRm1zN0xnNGpYNlk1Q3poamRkWVV0SmkwQmRRSWRwaTFoMjErdUM3L1JC?=
 =?utf-8?B?RE1oS0ZGc014SVo3cFdYQllpSHp4UjI3YTAwUXZpUUIrUFZxcVNxN3dWd3V2?=
 =?utf-8?Q?lTP0HoQeSAabaR8Q=3D?=
X-Exchange-RoutingPolicyChecked: I9fyRnBuoUyz0boOavRhDJOmPaxtl+S0ZVR7rxvkh1UTMfYSBuruQOqUblxVKCllpCKLYHguk13K+wzqunhtP3eXc+/121QSWDbaSCFkBz7+oRR/HWfghZSfLREohkB1OGAS7UhOuhZumhdHupklDoZcFzBEYiTV+v12CNvM3YoTJ9yt2d5+3PpQos7yuhL/2NerpdKFeQA9INOkJmjUquEY30wzdSbKjKimZf7UmfIQa5fFdClfreN+pGhP09J5enQsT9LCSpbF3duMl9LFMiK34qTFaX2vI70zsSbgqu7phQp0GNd9z/IN/yJrqRCtX/OUcTwfdNTAos39XYy+vA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fbfd4ae-94ae-44c2-45bf-08df4a6af526
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 20:38:55.2464
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YPV3Qiun73glsiqfNTdeFfxyiHefIWkCyOG+VisY5aJsTs3TjZZdVDXVSPdoRqO1OEGmD3umakafifetgvIRnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4888
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_123902_075623_C902DF46 
X-CRM114-Status: UNSURE (   9.46  )
X-CRM114-Notice: Please train this message.
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

On 05/11/2026 13:45, James Clark wrote:
> Intel PT has its own wrap search but the same pointer fixup logic as the
> generic auxtrace_record__default_find_snapshot(). Replace the duplicate
> code with auxtrace_record__snapshot_fixup().
> 
> No functional changes intended.
> 
> Tested-by: Leo Yan <leo.yan@arm.com>
> Signed-off-by: James Clark <james.clark@linaro.org>

Reviewed-by: Adrian Hunter <adrian.hunter@intel.com>


