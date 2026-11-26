Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D07606A321
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 09:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=awC6IVrH;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hbij7y/c;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=gn1SWq01
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=xbTZMawJCTs4Zt69ExNhTqwIyVDOSc9kvMFmMaonwPY=; b=awC6IVrHGLe64ErVDtcmbvWKtT
	lHD6nr2TP2/5uYEwpRa5+5QDnH4ZAgzA2hE9vOuFlnETtacQcT6cWahutSvte9lSVRZxffnXw9BHa
	m2Y95gcuM7zCIMdqf1RGMPK6z7Dp4qCZIRueQtk8czI2dzzrJTcIgTAHZiD8fA/kPhomHyk7J9iy9
	ByWVvQYv6o8B3QxmQVY6hR9+0ouGCiwpfIjCCXxnLEbc+FX1xnbDwK4psw6eocRflbjRLGjWsYY3s
	nVUWQ7A45HLIVQSpxbEpXnX+/5O6IMiuDyhufEtCm201zsNSAdNO2H7KMKZHw2ijRgM2pkigJ1U6G
	tCnaFoRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWVZZ-0000000CVYy-1MAK;
	Thu, 26 Nov 2026 09:15:21 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWVZX-0000000CVTp-0Yqn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 09:15:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795684519; x=1827220519;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=xX7F5UUbLZRi84bj1JdlX006kL/u+Bsq8kredGo06h8=;
  b=hbij7y/cHMT4SUGoEvo7PQ9tM+RoXeln8yqlFwiF7sCxC2lbhThKTbRP
   pYO2Zp3rg+e0qYxN7MMbsosnKqX3M7PN03Zh58VWvKwkCF6bBp3Em8o63
   p7Q0K8RY+IU86qao51O6gN+1q7IlsLW1/+/LYVQS7sS5up5KnaRiKOHO3
   EXDUItSiwSGEpl9bpQ8yg6OXiZEKu5aIKbjD1rhIWrV8BL420YssW+O+o
   Xs3K+Y7UPdVzPf3cNccBZ+LwyM3xidAw0am4isYbM12B99zX1FPwkoqkD
   fsEZXnhbtR8vesWY/bPwOK5ImaXBiV57EPt3mTJSt8FhZ8xtdzMCgcNxp
   A==;
X-CSE-ConnectionGUID: D9o6BtJBSeC56oh8waKWdg==
X-CSE-MsgGUID: WVW97jhQQnq8DbjN9DPLYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4635287"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4635287"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2026 01:13:15 -0800
X-CSE-ConnectionGUID: QQXdU2asTvW9EnUB4UzdBA==
X-CSE-MsgGUID: XfRUAjORRHOqXMOXZ6hoOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="12167369"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2026 01:13:16 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 01:13:14 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Thu, 26 Nov 2026 01:13:14 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.30)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 01:13:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DrNlBxb/b7XgvBbA1jYwFXM6Gv4hdny7B7f68PBwMneXJPzdI8rkfIzlw9BmgYqC9BxYTBAeI8zfo6VMiN+uWge3wKMOXt2X75jx5bx6+WOxOo6agpWA6XDxr8zy0wvQQ9ahKXNu+xITmm4KBsR6m6HOOFB9P/Oc27iOv6tmU+wsOwGPU2wOwt/pLOtoc0WM1UWl+iY7akqqpHuKjxF00Vl3Ks0jI4cTtopagGq6cg6EK4sLn4GSoa0dBxiguVVtYX5JvOxj3AAZHLUGpZUxpRc/DNBABFpW35PqZblRVKoEx6ERkhCfpkSgMtpJ0fPFJav5lRcyaWUUbDe5HdiCfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xbTZMawJCTs4Zt69ExNhTqwIyVDOSc9kvMFmMaonwPY=;
 b=CoZU3Ta8q7scBGUTLfze0rJB34oFkJrp6Y97+JLTchwbRkedNoKDqzldxqO7Snh4bb/JUhtf/bS6OBKSfL99ym1PZyQ0UkUq8RiWPT+qTiWTZhvbpVV7GBv98SvVdgsQdPOzXaDIOonBxz51vp/Qz2p5T8+7BSskDy8VGS0SGXUFGeXgtHKRW9k9blpY1PB5fff7oY3qIWsknEFnllMmqA7uywF0j+hNIlW/ds5tRbq9uA3hxfD59OU5CEcrr2EzilBC9pImtSMJFIjERwnpf7M9tf2n+QZj34d52IQ3XDylU5SSOs/Deq2rJjTLOtufG13DjQpi11R1ODKkrOh0UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xbTZMawJCTs4Zt69ExNhTqwIyVDOSc9kvMFmMaonwPY=;
 b=gn1SWq01Je3kriit1My2B0plmZsToRX/TicVpvBij2bnBaeURllBVOyyyBEIAFCxMz8EQWdpp3jfEHKoU8F1Q0W7oPtw+emSOCLxHCUk87+48RP6dQSmyAZ+AGgS0jfTV9h6rI+uNKu/EvgOP9PBa5H8LVnu1xgAO+a5ECSCWXU=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by CO1PR11MB4786.namprd11.prod.outlook.com (2603:10b6:303:94::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Thu, 26 Nov
 2026 09:13:03 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%3]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 09:13:02 +0000
Message-ID: <8701b079-9195-43fb-95f6-a7604b290cd2@intel.com>
Date: Thu, 26 Nov 2026 11:12:56 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mmc: sdhci-of-at91: disable selectively clocks on pm
 runtime
To: Aubin Constans <aubin.constans@microchip.com>, Ulf Hansson
	<ulfh@kernel.org>, Eugen Hristev <ehristev@kernel.org>, Claudiu Beznea
	<claudiu.beznea@tuxon.dev>, Romain Sioen <romain.sioen@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>, Ludovic Desroches
	<ludovic.desroches@microchip.com>, Robert Marko <robert.marko@sartura.hr>
CC: Alexandre Belloni <alexandre.belloni@bootlin.com>, Ryan Wanner
	<ryan.wanner@microchip.com>, <linux-mmc@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20261014202619.715573-1-aubin.constans@microchip.com>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606-4,
 Domiciled in Helsinki
In-Reply-To: <20261014202619.715573-1-aubin.constans@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DU7P191CA0012.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:54e::23) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|CO1PR11MB4786:EE_
X-MS-Office365-Filtering-Correlation-Id: c0779f6a-d4b1-490a-5fac-08df4b9d7932
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|376014|1800799024|23010399003|10067099003|56012099006|11063799006|261022105027099003|261022075727099003|261028144727099003|261026121527099003|261026140227099003|261021123027099003|261021121427099003|261102123227099003|261009223027099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: 574XQXlQL0Vms28IHmOW3ICLwMf/TKLhlOtPn4SVIzhBwW4x3ldmdeM5M1U0A0LWJvGfiektHBE+IGLE4gxbtz4CguDs7jqfg5GkKHRRa/j4G3qs1PKAZo3d6P0sUvhkL5SEyW9o2ju8acC8xsWJwJV+qDKKwCk+VlpjmR1hCYV3L8CDH/ToYfxjaNTpKufAb7N7hBWD2DQfBz7ZGR1VU/U6cSlwO2VqwPfgDWsNpqd0dJn9PK8m7dKDFgn+89a8RZJkHVixcuFWTdKYhnkWXPDV/7IQFCVwD0TQDRHJXuEVabK9M9m8/x8jfY9UkSBVzBLMkxAbfjmMEJGT8why1NppHdusTxwMoolG0K5GcK0XzD2xt04ELBHt8Ind2ZTc3dzRMhKw+3uH76tnDh+MAP7KzI0kA7PZXFEmX4DxcXPe/w3hmaIUQUkbqj1qWjFmr8oiQiWUl9E5aCjFmwie5cbzJ8LaPFIVSoPsd2U7tMJfq97YZVrx1MWpJLVFm0VPb31uzlafHDOptOFaJkSz9RxI0dykEokHxAmIzBOPpwJ+u+lTEbOBl1UcQvRtoZwft0WujD9oi5jkXvTknOa/jnT7G+GL9faLInCQDA+nWy/XDfkuNJh2qhlUWTUlZoH7
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024)(23010399003)(10067099003)(56012099006)(11063799006)(261022105027099003)(261022075727099003)(261028144727099003)(261026121527099003)(261026140227099003)(261021123027099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?akZ1R2ltYlRjNkNBalpuQTBSRVpSTHZqT2RVZEJ4Y1NBY2M2Y2JlNjVIMU5n?=
 =?utf-8?B?TGsvTlVEYnBBK0tnOE1VUFYwR25oRkVXaC8rQjVmQllSSlJoMkkvYk43Ni9Y?=
 =?utf-8?B?UjBrd2NhRm02UWdneXdPcVJLK1Rkb2U5WXFlSHc0V053a0gvYlgyY291YzNO?=
 =?utf-8?B?bUY5ZXB2OFJEMG8rdEVrcC9WZ2l1Q1pJYjNLdVE4cFYzdHFkc0FBVGpGZGs0?=
 =?utf-8?B?emZrYnZjNGtUejVldlFwTEFLUERpYVFRdGc1Ni9kQ3VkaDBHektYVkNQOTE4?=
 =?utf-8?B?RklkMWx1SjF4ZnRtZTdXRklBaXBaOGhhNXE5MDlZNU5tQXFTenpvRlJyemZE?=
 =?utf-8?B?M2F0TTlqeW5zVi9VRHVTOWc1MU5RYlNINlJSOURmT0sxaVFYdjgzYThpNlpE?=
 =?utf-8?B?WmpZbnRRdGNGdGRZVXNrNDJNUERQMVZUa29OM0tUT0VQNTRhUmZVTnRJb2tj?=
 =?utf-8?B?ZkNvQjUvcURKeGY4RHpUWjZZQUwzTEt3TEdlUXY0QjVQejBHWnlLQjlrbTAv?=
 =?utf-8?B?djdjTk5kVklZbGo5YmhHcjVZU0NPWTBnL2c0RjRpZ003c2pQY2JDYnpUdjZy?=
 =?utf-8?B?ckVDd1FDNVZjSFdnMUtsRGlHNVlkdUhZZWhnQkJjdURKQXUzU21KQ0FxQkVY?=
 =?utf-8?B?dk1tSkF5M3ZIZFF2OHZrVkNzTDNQOFU2YWpiRE54QUh2VkNPdEpZd21vd3Fo?=
 =?utf-8?B?VEVIak5XclE0VlUrT3VyOWQ4UWdGbDhPUXE1YnNFQy9WdSt5ZXBCSUlrSmZ3?=
 =?utf-8?B?NzRoUEp5MkNmRnNRS1I2UmZSYTZxV0FSRlJjdjJkT25acG1aNnJMbnNaQjQ0?=
 =?utf-8?B?ZWRZRVRYakdxSDA4STkyUFh4YWdwem04U3hRNFp2aGkzdnU1K0RhVHdZSXlm?=
 =?utf-8?B?ZktBQy9UWE5GZ05nK3dObDRYYnllS1UwamNBalgzcC9qZkFoTDZCbWFrQ1ps?=
 =?utf-8?B?VzV6ZmFQN29zdGZnd29WcmowUGU1M0pzVEd6MnRRMDhRbVNDK3FRUnhjNzNp?=
 =?utf-8?B?dWtwMSs4UFAvSk9pdXJLYS9sV0haT014MkVMU2hoaWtJRUtZNTJxbkhtNmNT?=
 =?utf-8?B?U0NJaHZ1Z2xyaUcwMWhzU21NZmUrKzZsQkdhcURTaWpES0xYb3M4eDduVWZJ?=
 =?utf-8?B?MDRuMEZobWp3ZlhwTnBRRHRYQTkveEZZQzNib0lDVitPSDdDWlR5a1o3M2Yv?=
 =?utf-8?B?VGdyR3RBemI5MmNRU0NLZXJKUFNEOHJNYWpNWjFNYVV5Nm9yekFMcnlicWRE?=
 =?utf-8?B?QUtWamsxbUpha1dDVmhxT09SNm5OTittVFlBVkJZZEpDRkxKZjNkWnM2VTZl?=
 =?utf-8?B?RlI5SDR2WXArY2kvanQ4VGFIMk94V0VudnF4NkltRDRFbE9xT1BEb2tKREJl?=
 =?utf-8?B?Q3B6R0dPL3RIZUhSOVROanV0c0RtcHJtV0U2ejAwQjZ4ZjEwUFZJaFkySWsy?=
 =?utf-8?B?NnFYdDB0NjhnY3BVc0lsdWtHL3BVbWdkNExWNkVGRTh3NUkvQTQxTFBwTVBl?=
 =?utf-8?B?OWhIU0pjQ21wQXpHNVV6RkpyanArZkY5dGVEa2F0UzVVSEtBRWM2UzFFalBy?=
 =?utf-8?B?S1ZJOHdhbFdIRHM2TC9zUFhWYmpyWkVnZHVzYURhNGNtNURPbTlHSkJWL2tW?=
 =?utf-8?B?SlpDN3ZacW4wakN5WjllbXFPUER2OHQ0ZFZhWWlqMFJtbUdtSS9iejRNMWtz?=
 =?utf-8?B?c2s3T3JwLzVvT1oyOGUzY1hTYnFCQ0E4VHc0amJJK0FGVXRPOEJERzNtZzdv?=
 =?utf-8?B?cWpEN3hrZVUrVDNLWDVyYkFLNjYrVUd3R21XU0dtWndIT1lpakhVVmtsSUlK?=
 =?utf-8?B?cEFDcnNEL1drcS96NU5vc01vWkcrc1hoWHNHU0JKM3NNRjUzRS8yS0Vadkg0?=
 =?utf-8?B?ZDBXbmViM3dISStJMEZDdlZEUWVQR3N2aUpJV04raGNVTExVQzB5MDZKQ3hN?=
 =?utf-8?B?dHlhZWdEeHg3b1Vtb3lpbmdVQU1ncXZyazM4YTdiUWx3aTdPNjRDY3lNcE5y?=
 =?utf-8?B?eEMxaE1OalhHSmZRK2tENjdRSzlQTWx4UVRtY2NEaUlzSDVMMG9OdEVHejcr?=
 =?utf-8?B?S2VQK2NJM0Jkc3JWTDBpOTRzUDc0Q1hvRFBBTGNDenJIeldhRTRXNVQrKzQv?=
 =?utf-8?B?Z1lqVlFLMjcxaTZMWG1zak9QNUQvNjZhbjhtbUVuMkFPNTM4aGthZjlPeVRz?=
 =?utf-8?B?eVRkNDlqazdhMGljbC9saTkzUWZyd0NDckZRQXFBQktWdWZQMUdnSVFoWlU5?=
 =?utf-8?B?TUtQdXkrRUl4UmJxUitmYlo2UDJKcTFlZXl3R3IzaWUyd05JTnlCVGZHb3k3?=
 =?utf-8?B?QVZYVnZDU05NVTJndGU2eGU0emJCb01HcFJpR0RNRXhCY3Q0NWhnbWtuSTBw?=
 =?utf-8?Q?FWCAR1/91qULUM84=3D?=
X-Exchange-RoutingPolicyChecked: HqtYox1HIoF6voKiNzEwrRYpcx+CuMTk2AS95Odo2I5LHqbPhn4hWIeGAk8Qr4xdq+TaCROqUdi30uoASGiLtUfQ3H2eJSJwsGiho3LL22mCluWbnGs7JLla4A5wZSZELj5/j52qg2iURsn4q/MK2lh2anDB25svaKX4/Xje0HNmRXHy0QfosT7QWpPzhw1bh7N2m5liflISE+6m4hDQd5hbhXqOzlzeH0qZUlA+DqaQ1sO2lKJ25edELEsc0qwePa2Xeh5An2a6tlCuo34gYVravz4tkx900GHtnyv8Zyku+zycTOQ1vQQKBLmsL0cux2eKPKkk0QRpon2IgnggdA==
X-MS-Exchange-CrossTenant-Network-Message-Id: c0779f6a-d4b1-490a-5fac-08df4b9d7932
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 09:13:02.7900
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eeZAN4DT5BJYprRBlTTY9ODHDEH/S1m8Sq7jp++rFRUN8+PATU5AZHcZ1TtKRFXqJyzusYm0V6D6ARCs6B74zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4786
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_011519_251633_24A7A2CB 
X-CRM114-Status: GOOD (  24.37  )
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 14/10/2026 23:26, Aubin Constans wrote:
> From: Claudiu Beznea <claudiu.beznea@microchip.com>
> 
> SDMMC run-time clock disabling is not supported in newer SoCs, including
> SAMA7G54, SAMA7D65 and LAN969x.
> 
> Make the clock disabling scenario conditional:
> - still enabled for the sama5d2 and sam9x60 compatibles (which are all
>   those implemented at present),
> - otherwise avoided by default, for subsequent SoC families.

Sorry for the slow reply.

It is confusing to have this patch separate from the series:

	https://lore.kernel.org/all/20260907132617.1198548-1-robert.marko@sartura.hr/

I would suggest putting it back together.

Also "run-time clock disabling is not supported" does not explain
why the clocks do not act at all normally.  Please try to give
more information in the commit message, even it is just that
the clocks don't work properly and you don't know why.

> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
> [Romain: Fix unbalanced clock activation/deactivation]
> Co-developed-by: Romain Sioen <romain.sioen@microchip.com>
> Signed-off-by: Romain Sioen <romain.sioen@microchip.com>
> [Aubin: Rebase before sama7g5 support and edit the commit msg]
> Signed-off-by: Aubin Constans <aubin.constans@microchip.com>
> Tested-by: Robert Marko <robert.marko@sartura.hr>
> ---
> Changes in v2:
> - Edit the commit msg to say the patch prepares SAMA7G54/SAMA7D65/LAN969x
>   SoC support w/o immediate change.
>   Also, move and summarize Romain's own commit msg close to its sign-off.
> - Restore Claudiu's author and sign-off email to the microchip.com address
>   he had upon writing the patch.
> - Link to v1: https://lore.kernel.org/r/20260918153414.909333-1-aubin.constans@microchip.com
> 
>  drivers/mmc/host/sdhci-of-at91.c | 36 ++++++++++++++++++++++++--------
>  1 file changed, 27 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/mmc/host/sdhci-of-at91.c b/drivers/mmc/host/sdhci-of-at91.c
> index 7c4ac65f247d..399856643e57 100644
> --- a/drivers/mmc/host/sdhci-of-at91.c
> +++ b/drivers/mmc/host/sdhci-of-at91.c
> @@ -39,6 +39,7 @@ struct sdhci_at91_soc_data {
>  	const struct sdhci_pltfm_data *pdata;
>  	bool baseclk_is_generated_internally;
>  	unsigned int divider_for_baseclk;
> +	bool pm_runtime_disable_clks;
>  };
>  
>  struct sdhci_at91_priv {
> @@ -149,12 +150,14 @@ static const struct sdhci_pltfm_data sdhci_sama5d2_pdata = {
>  static const struct sdhci_at91_soc_data soc_data_sama5d2 = {
>  	.pdata = &sdhci_sama5d2_pdata,
>  	.baseclk_is_generated_internally = false,
> +	.pm_runtime_disable_clks = true,
>  };
>  
>  static const struct sdhci_at91_soc_data soc_data_sam9x60 = {
>  	.pdata = &sdhci_sama5d2_pdata,
>  	.baseclk_is_generated_internally = true,
>  	.divider_for_baseclk = 2,
> +	.pm_runtime_disable_clks = true,
>  };
>  
>  static const struct of_device_id sdhci_at91_dt_match[] = {
> @@ -164,7 +167,7 @@ static const struct of_device_id sdhci_at91_dt_match[] = {
>  };
>  MODULE_DEVICE_TABLE(of, sdhci_at91_dt_match);
>  
> -static int sdhci_at91_set_clks_presets(struct device *dev)
> +static int sdhci_at91_set_clks_presets(struct device *dev, bool start_clks)
>  {
>  	struct sdhci_host *host = dev_get_drvdata(dev);
>  	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
> @@ -174,7 +177,14 @@ static int sdhci_at91_set_clks_presets(struct device *dev)
>  	unsigned int			gck_rate, clk_base_rate;
>  	unsigned int			preset_div;
>  
> -	clk_prepare_enable(priv->hclock);
> +	/*
> +	 * Manage clock prepare/enable procedure depending on if the board
> +	 * support runtime clock disabling and if we come from the probing
> +	 * or restoring procedure (for backup+self refresh).
> +	 */
> +	if (start_clks)
> +		clk_prepare_enable(priv->hclock);
> +
>  	caps0 = readl(host->ioaddr + SDHCI_CAPABILITIES);
>  	caps1 = readl(host->ioaddr + SDHCI_CAPABILITIES_1);
>  
> @@ -223,8 +233,11 @@ static int sdhci_at91_set_clks_presets(struct device *dev)
>  	writew(SDHCI_AT91_PRESET_COMMON_CONF | preset_div,
>  	       host->ioaddr + SDHCI_PRESET_FOR_DDR50);
>  
> -	clk_prepare_enable(priv->mainck);
> -	clk_prepare_enable(priv->gck);
> +	/* Same clock management as for hclock */
> +	if (start_clks) {
> +		clk_prepare_enable(priv->mainck);
> +		clk_prepare_enable(priv->gck);
> +	}
>  
>  	return 0;
>  }
> @@ -254,9 +267,11 @@ static int sdhci_at91_runtime_suspend(struct device *dev)
>  	if (host->tuning_mode != SDHCI_TUNING_MODE_3)
>  		mmc_retune_needed(host->mmc);
>  
> -	clk_disable_unprepare(priv->gck);
> -	clk_disable_unprepare(priv->hclock);
> -	clk_disable_unprepare(priv->mainck);
> +	if (priv->soc_data->pm_runtime_disable_clks) {
> +		clk_disable_unprepare(priv->gck);
> +		clk_disable_unprepare(priv->hclock);
> +		clk_disable_unprepare(priv->mainck);
> +	}
>  
>  	return 0;
>  }
> @@ -269,7 +284,7 @@ static int sdhci_at91_runtime_resume(struct device *dev)
>  	int ret;
>  
>  	if (priv->restore_needed) {
> -		ret = sdhci_at91_set_clks_presets(dev);
> +		ret = sdhci_at91_set_clks_presets(dev, priv->soc_data->pm_runtime_disable_clks);
>  		if (ret)
>  			return ret;
>  
> @@ -277,6 +292,9 @@ static int sdhci_at91_runtime_resume(struct device *dev)
>  		goto out;
>  	}
>  
> +	if (!priv->soc_data->pm_runtime_disable_clks)
> +		goto out;
> +
>  	ret = clk_prepare_enable(priv->mainck);
>  	if (ret) {
>  		dev_err(dev, "can't enable mainck\n");
> @@ -344,7 +362,7 @@ static int sdhci_at91_probe(struct platform_device *pdev)
>  		return dev_err_probe(&pdev->dev, PTR_ERR(priv->gck),
>  				     "failed to get multclk\n");
>  
> -	ret = sdhci_at91_set_clks_presets(&pdev->dev);
> +	ret = sdhci_at91_set_clks_presets(&pdev->dev, true);
>  	if (ret)
>  		return ret;
>  


