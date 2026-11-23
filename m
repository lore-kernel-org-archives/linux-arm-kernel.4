Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1B3E606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 10:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OKKofGJG;
	dkim=pass (1024-bit key, unprotected) header.d=cherry.de header.i=@cherry.de header.a=rsa-sha256 header.s=selector1 header.b=HNomG4je
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=jhPmTJ+Iod9uvqIldisHA11u575qM9EvUkkjT3xBSVM=; b=OKKofGJGZl84Guf/0TDt8DO0nl
	6j20MV9D26Gn7fd/Wj2qaaSvL23ObNoMfMKxNwFr4KP6UStv7TYlkIsW1qopRLiKU+zNMxX3rq8K+
	T1x3wp8+XnePtyrll3LUFzn3egiUQ1jNmWy77Y/f4yTtlXR2ebGXcO/gxLkFCkhJFoA+4eECiEbDx
	lg4RB1LU5DHx+4u1kfU8XX97E/PRyle7YYs5t83/olnxNajEQWb1b5wsI2jLlfFKKlE/aq/+qnns4
	DYRmu+mTB4qyexOXTxiHq4ougipSl9zGdh+VBEgQzLo429o4P/SKOGrOlkZdaB/kP0vhp4uIfFLNB
	ijZAiAgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQuw-00000002tDH-2aT3;
	Mon, 23 Nov 2026 10:04:59 +0000
Received: from mail-northeuropeazon11010059.outbound.protection.outlook.com ([52.101.84.59] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQuk-00000002t7s-3YEi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 10:04:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o+osDGM6gJ800odm42xSsq9/tigt2Eog7bbaLLznR1VMFBTdHrO9y/po2gaOckkXXBtbaLsF7WrOMzbLHZYd0iAk7VWznjJ13vxJYGCmEoJcLLO75CdJHrn71ZXYbAmtGZraLj+/+7yxCuQzspwU05Ht6OxGc7Hpw0EDWid+cWTtKM7AmDsX2O+2qweRDKdyh8O4qrm3gvoIlnCQPM/1d+T8P0HiiahbQeuJzBRRc9G9AKmpslmPzBTldqsje8Yei8zEx4hFoiLm/PRYpOQ+MDHehYiaFG8TwiF1knwHRIAPXwqttJwkj+putesKUGDkOgghdqOA3kTLh2eUNdkkbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jhPmTJ+Iod9uvqIldisHA11u575qM9EvUkkjT3xBSVM=;
 b=gJQphfRI2rJfKEWvjBpOI3kk55murrfXTkT8holi6vPoVYhbFN/ghCpZShVUejF5KkZmUHySP0oj1Cbzy01ZBRowHfIhxFuJX0/8tCnBaMyg1SgSEtrCSYqmJl01YdI0xwm12n9vPobc08YxMmVhiTMcUDfGi0Arua1hpaxsDOESwvJI6b6J8BfzYbSVybb1ZLKswRoOY6fK4+naaqfImcXSY5FvoHPcjf4oHH8MY6KmTfuco0WvRal3uSfWzMxYrGavNJbBor/y5V0wCc/UhfhZfJeiv6gCAi5yb7UAoGiDi0BvOrdPBTCgTZI3n/DxA+cl9ZTkjBtDpowVwhSb+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jhPmTJ+Iod9uvqIldisHA11u575qM9EvUkkjT3xBSVM=;
 b=HNomG4jeglGmKxXQsj6pm3JymGQ1wwmCrZvrYUAcxPLpEKtFFUYbapDufr/rdzPJT7F59lQh7y1ppNlR3/9SemCahJGG6387jSefkmrYx+SmVGN6Zy4/ZtDI5CC3o2miYSu8psqOgHcBK67MOk6+5P+ZJJ98buDA5wJfEcLhkG4=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12016.eurprd04.prod.outlook.com (2603:10a6:150:335::6)
 by AS1PR04MB769151.eurprd04.prod.outlook.com (2603:10a6:20b:6e0::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Mon, 23 Nov
 2026 10:04:40 +0000
Received: from GVXPR04MB12016.eurprd04.prod.outlook.com
 ([fe80::f2d4:9db8:9a4e:b0bd]) by GVXPR04MB12016.eurprd04.prod.outlook.com
 ([fe80::f2d4:9db8:9a4e:b0bd%4]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 10:04:39 +0000
Message-ID: <8cf6fadc-7987-41c6-ae64-05c4d4bde33f@cherry.de>
Date: Mon, 23 Nov 2026 11:04:37 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net: stmmac: reset the DMA on a fatal bus error
To: Nicolai Buchwitz <nb@tipi-net.de>,
 Jakob Unterwurzacher <jakobunt@gmail.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261120-stmmac_dma_fatal_error-v1-1-acd57921af57@cherry.de>
 <b3f78ebb57866c32046ccc60c92928cb@tipi-net.de>
Content-Language: en-US
From: Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>
Autocrypt: addr=jakob.unterwurzacher@cherry.de; keydata=
 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
 ldPHIqbIwpfecQ==
In-Reply-To: <b3f78ebb57866c32046ccc60c92928cb@tipi-net.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VIUP296CA0068.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:337::12) To GVXPR04MB12016.eurprd04.prod.outlook.com
 (2603:10a6:150:335::6)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12016:EE_|AS1PR04MB769151:EE_
X-MS-Office365-Filtering-Correlation-Id: 07aa916f-802f-4099-2358-08df49492f91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|23010399003|1800799024|10067099003|4143699003|11063799006|56012099006|261022105027099003|261021135927099003|261026140227099003|261028144727099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: XCeizu/HISrJ2oeIiNieYtIhGPxrHKLXrOL2A97ZmITKfB/LolhjbEu+7Vp+8bRdeWKwrk8+L8gKz0lnMdQsXu5Tib+Raxg+9twySM0FAFpQDXSC0gG3TvvBllsyH6MihJDdhEshZl9V7bZas+lv8ZQe/IWj9rlhYEIaYr2Dde826xvkOoJJSPh29Y0ej9rWwPzM3wAWdDu7h46mQHpphCwnacHjSI8cOU/EmI08/3qoEs1z/+pSLliCan/i5Lj5xzMcno7noexOax4/3m9pFfXd5F+Rc2G6oEQ9hzHA2tKWvbuTK+26eG/hdmq6mKmpJSbQZ1czAFFY11G/nuFNAvDDJ4O4OUpWBkTum2eIw488BSubiNlxe1aZ8M746mHo4sRXuXoB01MbnfXcxxwN+036HdceiZcr27IGYkTP//lO9NyORaZzSqcW+67ll08Bm/mgwuka5Nbtt/zZTIY7iuA8R3NzvM0oEBskDtl1lZ7Y/ZEVmvf+2HG1hjrd0PGlEGVaxZaKxhkuwHTcBpK4s7C1JmDERo48sejEQbqDaR/yrGy6DqVLO7wwW/TXwj4RJodMjdiHYCzfq4rBrNBur5lPxVCgbSqlkqBqZ34mwwCRZpiDN/fUUlz+C7zUCXUf6iRBqfQ4LwhEoJ6vxNCBBQXRcgjcpro1DKRUOU7P+FI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12016.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(23010399003)(1800799024)(10067099003)(4143699003)(11063799006)(56012099006)(261022105027099003)(261021135927099003)(261026140227099003)(261028144727099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ly84UDgzaExwSjhzWnFiU0VaTERWa0FXdzU0Ty9BYmlOaTRmY3FJa0NGbDYv?=
 =?utf-8?B?bTFaQlpua3lBMERDaUtNOGR6ekZyc3RqemVsUUg5Ukh4SVVYcjM5d2VmYlNw?=
 =?utf-8?B?SjZ2RlpKTk43b0ZFUW5VTHZPWno3YUtERVBrYlByZTVOdm4yOW5CQnVQaG02?=
 =?utf-8?B?VWJyZDNhamhLRHZnU1VvdmlyMmcrZVhweHZhaHlDMm9ibWVNZGI3ZlUyTnZ4?=
 =?utf-8?B?YWcwN0ZlL2RVZG5pUTdUOFl1MXdvbkZxOTlMdlNhU2dudWcvMm8rc0srTkpx?=
 =?utf-8?B?Zm5SRVRjMndtOHJxWEdxNFMwZXhXTjFPbEpWcDFWY0E2aitWb3lkM21OaDBu?=
 =?utf-8?B?Vlo2NEtURE9TV0s1dXg4ZEk5UHFQOGVTR3JaREVkdzk3enJxMW55QWlJMVdy?=
 =?utf-8?B?dVhPLzFBd3NheFJMeHpXYzdnKzhDMytqQXZRTWtHVW9GL3cvYVdIcCtJZ0xl?=
 =?utf-8?B?L004cXFyQThTVG9WU0J4SStvTjhQVDU0OHRGZVRkS3pmV2FQZkhxWWcwNUVS?=
 =?utf-8?B?Y0V1OTlwc2svMWZYdUJLK2xHUm05OXBWWG1qcTdpVWVqQXR5QmEzdG1CRWNk?=
 =?utf-8?B?TTVsU1J6TG1nUlVXa08zUTdkSmlpdkFjY1ZaTGVTVnVLVm5sVWZsMEozWjhS?=
 =?utf-8?B?SVJqdCtONTQ0VVEwdlQ0OGRYcFpVZ0JYSURvSzN6ZFllRHhjSSsyeW9pTFJD?=
 =?utf-8?B?b2NodUp1b0J4NDFCcHZ4WUJBWmVRMWJKUTZJSmpIeWFyYldOSkZVNStZRDNG?=
 =?utf-8?B?TnF3Z2pWWlJxUDY2d3NEbEdkWnNKeWcyUVpvbTBiemV1M3dOK0xkeVg2ZDJs?=
 =?utf-8?B?WndpYzRnYVlsTmc3emc0dStYblZGclIwT1NXaXdPSVFGQU5aem9rOS9mRlhu?=
 =?utf-8?B?R25VZmcxYUlNTW83RExZMXNyQ2dJdEtwSW1FYStHbW1oeDBmMFp2R0FEb241?=
 =?utf-8?B?OEZXRUtaa25HOFFhTVZ2Q1lqZjdyUlNSTU9Cb3Z6MzJydytKc21IWVNqelpq?=
 =?utf-8?B?T3lUS0pvYmJ3Y3djSmo0QW40NWdjZFB5LzQzV3RrQkdTRGk0YWI5Q3JjOS9o?=
 =?utf-8?B?ZlgzbHFLekRiL2VxOStNR0ErR0E0TzNUWkxJZERwbUZZUVdFY1RTaG1CQUJi?=
 =?utf-8?B?Ly9LSkV1d2JVM1RMTnRtZlJMTUJnak9FNnlmcEtIcmFmeVdCYytKa2dtNDQv?=
 =?utf-8?B?akhFa2NQYmhPdWxrOWhlM3RlSVZFMWQ2SXpFRXFVMEllOEZCaXJ5bUcrdlFy?=
 =?utf-8?B?b0hiVFlGeG4vZHVjY0ZWYlQvSDM5ZDFKT0VFQlptTGNqTllQOWJidWhYT2h0?=
 =?utf-8?B?VnlUTHozOGtFSmorb0E0dkxXbTNwcDYrWTJWNlg1TFVBT1dwS3dRa0oxNEJJ?=
 =?utf-8?B?NTBhUWVVWW44L3pob3NkM0locnF5T2E3QnZmbFIvU0psajdtZWFRUDllUkdE?=
 =?utf-8?B?cTViSW11cUthaUtuZ0pLQld0bEhXU2xWNXNiN0ErQ0hOSnRPNGE1bGZHQ21L?=
 =?utf-8?B?aTl6N0x1cjVoUEh3bVErMDdLTnV5NHdIQ1BRdWNrZWx6UDNWS0h3b0diYTV0?=
 =?utf-8?B?Vmh6R0pYZnlqbnN0NUF2TW5kZGQ2SHZ3azd1TTY4Y25yNjNpNTdxdEhqcDVR?=
 =?utf-8?B?Z0JSRnpldVoyNnQ3TDdIRG51N29hR1Axa0RzZlRBclpQVHhOb3hWbGY2MEY2?=
 =?utf-8?B?Z2hXQlhJYW91YmVjY1IxN1o3UlFmWW5TbGljenhEMWhEaC96c25YNVIvOFlO?=
 =?utf-8?B?cFNlbHJzaENhSHNreS8xRUlyTFd6NGQvdEU5cm92bzRLclEyT2ttYzdCWXpp?=
 =?utf-8?B?eXdrNy94RytpbzNRbUJqQ1B0aVJiaGNwYUVZZ1JYUUt0V2IvQVhnOEVCMzgr?=
 =?utf-8?B?V3MyekFBamFoYmgwc3JpVFFQeGpuVmsyTUQ5MUpKMk8vWERlUUlBMDlqWU93?=
 =?utf-8?B?MVBHMk8rUEJYdzdZUE9Xd1dwd1VkOFlVaEg3b01hSWZja2dGY0VNUm40Uyt4?=
 =?utf-8?B?V0EzUmJqcVFjanZrNVIwajlKSFd2V1dkSWFsVnhCZm9vek1lRnQvcFZGZ0FF?=
 =?utf-8?B?emxucWM2Ry9PbC9Ld3ZuSDhYZ3ByMzNia0lpU01BU1Jub1I3c0JTdGpndCtU?=
 =?utf-8?B?b2RiZnlicnlQUEMveVMva3lxdlM4ZEkzZEdJalY1V2NmaElGQWtwN0pyakty?=
 =?utf-8?B?TkxsYU9oak05NkdEZjNkd2hnMFo3RXJXZGZORFozNis5d2twZE1kdkRBWm14?=
 =?utf-8?B?ajk4bjhEN2JsSWxBRGNjUWQvZ1JtblMwZWxzZjJPSG9SL1VYNitxWkxpc3dx?=
 =?utf-8?B?eTRWbWZYUnRCc2tkQzlGMnlsdm96RHk1d1FTWC82ZGd3RHdSSzR6K3lMc0ZD?=
 =?utf-8?Q?RYxc50piIG3joAPE=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 07aa916f-802f-4099-2358-08df49492f91
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12016.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 10:04:39.1652
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ltaqWmjj6KF8CXFyTuSaw1tJ19wPWr+rPJEWLNRFcrOEF7NqoGuqSoeAVW+RLpkUHgaaXKQ6UrObTRrMmVphVoZTp8996LHOym+l1mbMpek=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB769151
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_020446_915017_F58D8FEF 
X-CRM114-Status: UNSURE (   6.41  )
X-CRM114-Notice: Please train this message.
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

Hi Nicolai, thank you for the review, I shall reply in detail later.

Over the weekend I had two RK3588-Tiger suspend/resume cycling (totaling 
58560 cycles). This uncovered problems when the reset overlaps with the 
next suspend. I will try to fix these problems, too.

Thanks,
Jakob

