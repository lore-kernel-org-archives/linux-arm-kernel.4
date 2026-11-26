Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 024BB606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 09:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=I+jLstgd;
	dkim=pass (2048-bit key, unprotected) header.d=amlogic.com header.i=@amlogic.com header.a=rsa-sha256 header.s=selector1 header.b=c6KXsEpk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=bRE7HJ03TkCbSqMmpr6s+Xs9mLtult8bqiv2FFZWUTo=; b=I+jLstgdVVrwJfiSuFwQkhJqKB
	R4mXHAHRE3k8vMzAtQSVA3hGn7RQsj8lLpRNdW//O8NLeNWrm3tWLvk3PE1V44tcyNpDSNVA1imAw
	vo9bNNULjYAKJ8wFjgDO8gqOqrNXJgIW67mvHbP8oWSuvGuKsBZEDQ3ARDEm+ekJu2h4X18dKx5tu
	1mB3rueZHVjUigmOBeC1fsZPxS/uaaU0kX+1oebX03CrbVzM+aIU4hqlAf/PNxY3LygYjMQzdEU01
	6FoXJNocezTmmoYaX3o77fBigATIQcv/3NAewIo6eOaxBsTjVHvYcbbMykocBo4uUpSM0mfGb/dzt
	W6lrO7Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWW6v-0000000CcF8-1jA6;
	Thu, 26 Nov 2026 09:49:49 +0000
Received: from mail-koreacentralazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c40f::6] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWW6s-0000000CcEG-1AGt;
	Thu, 26 Nov 2026 09:49:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=htPWmI+MGO/ciL+dYSzh1Sy0aJft7fz2xOMFNosYaVs9Ab2Auzl/kr/mUwS1FV1A/z4wYZI7E8Y5kzmZVAJ32URlJdO+CupgJZ+XdJJO/ic9EzWMZjHGZJCnwQLU0QtPYm8o1RcHPNRjod/tbfAjd4lH22dXKhHtXI4ptGwm44qI+VwcRBzqvCnL+50Tzam4iTVjwyS0K13Eh6Sgb2j4T8Re/F7mmtrZnhAs0q9J+bi85gQPpAXIHZN7dJAB1M2BUrfnBbjzBM1wI5eWo3SJQbGlmBFwaFYU8dtBPV1a7nagi3PyrSjzsrjyc8DTG6LuQy+BK6ExKgHwSXp8kyefdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bRE7HJ03TkCbSqMmpr6s+Xs9mLtult8bqiv2FFZWUTo=;
 b=Qc6IN8dX/cYipzwIj2/cUt+viFTv4YSTecuyv+dXkAIR6c7CCQJacPzFT9JfcvFRr2wke+ZRcL7M7LcrXGzyZ5UKBkDMLC82VkA38eJeS05MnXPAQbI531ObJ1W0z2s0IPDfYAkblo9B1ye9iex49NtIr0eA2XdS9XXkqpIWROo0JZoLRZ2nelGNEr+n/8YP2O3bBoksnGHJI7zAUY1Pb4YiNHKk0r8tGYv0wd7JWH9O3vZEhW1qVwnTObuLDIVqhMB6wuE6F2Ie4pUikNI4/ihKQPIqqNtnGMOZXY1BBd+z+nM5o7OgYMx4/bg0g+e1g3hVHk0s2zpb4NsBfbParQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bRE7HJ03TkCbSqMmpr6s+Xs9mLtult8bqiv2FFZWUTo=;
 b=c6KXsEpkJliNqGUNkvtayWJAm0wj6tgnbr9Vpu+ujcbwlnJqmE4mBT30QqT6YoqN9M23Ees4mnpHcc+kwllBTnmOPKy0G2b+H/oc3Juj8tGNguMmWJR2UwKcvo6WHwOVr0Of5j+7eaTB+xGAsj78UI8BEyfvc3RbqVr/K3VSGGw4HLhjRPiCc69OpmUqfHdzBjWnWrTBwvRkoj1DuWh4c2J/X6/OMCAjp3pMsWkrCOi02Co74i+ZaU5HdvNyxolPYvfaLccgzwAc9yXldUKLE8M6NQcKk0o/UFKuTw8Abxu93z/fjrfYVBC9nK+dvtLN+OAn7mNQaCE/i0gOtuggIw==
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com (2603:1096:820:6d::13)
 by KUZPR03MB9560.apcprd03.prod.outlook.com with HTTP via P2P; Thu, 26 Nov
 2026 09:49:33 +0000
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::e1e:5c95:a889:828e]) by KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::e1e:5c95:a889:828e%4]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 09:49:33 +0000
Message-ID: <1dbf65eb-fd04-41a3-876b-e2941cc10172@amlogic.com>
Date: Thu, 26 Nov 2026 17:49:26 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] cpufreq: add an Amlogic speed-bin driver
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Christian Hewitt <christianshewitt@gmail.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 christian.koever-draxl@student.uibk.ac.at, neil.armstrong@linaro.org,
 sboyd@kernel.org, bmasney+clk@redhat.com, khilman@baylibre.com,
 rafael@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 =?UTF-8?Q?Christian_Stefan_K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
References: <at7lXEqds7ukoR2V@vireshk-B250M-D3H>
 <1jbj8gkff1.fsf@starbuckisacylon.baylibre.com>
 <at8WfX_G0tfTlFrm@vireshk-B250M-D3H>
 <9556e959-daf3-4c85-8794-9613e7e7a9ae@gmail.com>
 <A45EC676-5B14-4932-A4CF-87ED3B71108D@gmail.com>
 <4a51e879-708c-49dc-a08a-3f64eeec8bbf@amlogic.com>
 <CAFBinCBkJJeRPKLFBA9KYjwXMxFjow_NOtvFoKRQdxD=rOPW3w@mail.gmail.com>
 <48b333a3-ef88-4739-a087-3ed9d8ec60a4@amlogic.com>
 <CAFBinCCgmRmk--W53wqdJhF-SzJbai--s7wyzDNt3LpfN00spw@mail.gmail.com>
 <b606819a-661e-4488-b5fb-9e786de463c6@amlogic.com>
 <awe_Wur5fVbeqV2d@vireshk-B250M-D3H>
From: Chuan Liu <chuan.liu@amlogic.com>
In-Reply-To: <awe_Wur5fVbeqV2d@vireshk-B250M-D3H>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TPYP295CA0060.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:8::19) To KL1PR03MB5778.apcprd03.prod.outlook.com
 (2603:1096:820:6d::13)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: KL1PR03MB5778:EE_|KUZPR03MB9560:EE_
X-MS-PublicTrafficType: Email
client-request-id: a01b6799-185a-41d8-b3fe-3dbb2e9b6dff
request-id: d6117d0a-ca6d-49f2-0d83-08df4ba2932b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|18002099003|22082099003|56012099006|4143699003|11063799006|261009223027099003|261022113327099003|10067099003|261026140227099003|261022105027099003|261022075727099003|261026121527099003|261028144727099003;
X-Microsoft-Antispam-Message-Info: 4SOSiIHa5e1SO+CXVv1fAeeHI0s9i2HNWm24A62XlXAAS2lnOMigWqJ+LrNrWuO8AD4ln3KmFry/i0ZM0hVrg6dQE5sZlil/bz+K4Zur/xfzWqH3jJONJd9YIjh27R4lPmlHRAHqN7Zgi2LHs6vgmZqfHiQgU0UlVbVwGNP2ruoDIEBIQDr+2ZKjobAqzWb2d6xGpJ9upiUUngRVBYY2+pO48ZJ0Vp2VEB/4PVPZDVBXC2c2Ma5ep+s9Ka5nttPOMBoyst8uuz/XoSW9/Riam8qsr/ioIRHaaiqz+agguluT74AFnVcxmM9jWpZVWvV4yvbc7n9X1KZ9EXUP8O38olvUcQiO+cLx8Nab+dnLWPpTlnGlS56aMy4+VZqonZA6vfkkazS6rmIp+QY9EEIrWHJzdKhn8vShvjxTDvEJr9yzc/adfMfwTXC3PTrjyESGYtm8saw+JVNXcS4HU6tGVO0APPRwd444oficEjood0LnAL/NqOEEmkAj0A0XR9aHN72VkiSWmEIEh6aBtunUcSc9h6uDN9QrHJZapua59GN+nmtdW9HtKRS3ISUOiNlDmjKTHYxUSCGSNHEBeG/Ei18dsWvqjyOL/uewNYJ2hxL+oVpFiwm4z04pxZLqAwexsbQNT3QK0YrIjM6HCw82Mq6FI7MzQFrYQ7UFSabj1r0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006)(261009223027099003)(261022113327099003)(10067099003)(261026140227099003)(261022105027099003)(261022075727099003)(261026121527099003)(261028144727099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NDlOU3JWaUo5OS9xWk95L2tGNkVGWGVPUHdIOTM1d3FxS2dmeElhSnVMakZ3?=
 =?utf-8?B?SG8vazBCV2J1M0J2eENiN1RqRWxFZi9YRmVKK2dpbXZYdmt4ZGExS3hlcG5p?=
 =?utf-8?B?SWpUUk9GV0wrTXVqOFNUUXRaL3pEb3JwSkluTGUyTjVYTk5zR2gvb01TcmJ3?=
 =?utf-8?B?KytaZnFBVTBMTmNocVh4bkwyVmw3dlZtcHZlUGlKMml5WDVsWDRWWStwbngr?=
 =?utf-8?B?dUd1MEduK1VGSlBJaHNIdHNvZjRSb0ozcFNwdEpxYWVYWXZUT0xRaHMwN1pX?=
 =?utf-8?B?QkFDUnVSa1FERXFsK1o1bEtncStuQkZ4OVRRdW13L3lvT3paNlYyTnFXK1lp?=
 =?utf-8?B?cXNTOGZoU2NCV2VXTWdudnFOQlBNbnViTmVlc2pIZWJTVWdwR2U5aVhaVGQr?=
 =?utf-8?B?cVlaMHUrMkNyNDJmTkVJUm9vRkxudUdKSWJzelRrOS9uUjRoVHBBMmtScnZI?=
 =?utf-8?B?MU9WakN5akluZU13YUIwamdDTEw1cGJ2ZTNoQ21KSTAvVEtRYUdmS1NEa01V?=
 =?utf-8?B?UXpYQnhIM3VlNXFDK1pHRUpBalkrZ2ZWTzZIbnpXWW5xRE9meVc0TkFvTEhy?=
 =?utf-8?B?RlpuL2ZLWHJHak43bm9UVlo0UHNEZFIyWEQ2cVBPRUJxcWhieDZJWCsvRitC?=
 =?utf-8?B?Mmd1T2pxNDZ4NXdLV3NveHlZeUZwRzBhNXY1YmVpaWVlUmw4cjJlc3ZZeE5I?=
 =?utf-8?B?aUNzWjlBUWVKczR3UElBckdHbUhURFp0M002V1NOaHRkdzFMZ3FBRHN0M3pJ?=
 =?utf-8?B?WEVsMTdmdTZPd09XczN5b3BTeHd2ZTVwUVJ1dkU3a1d5YjUrSmx6VitUNHNr?=
 =?utf-8?B?WTQxajZ1S2IzbzE2VUVTSlYrRlpnMDljc3RubVd2ZTRlUmRjMVJqYnVQTVAr?=
 =?utf-8?B?UmFTTlBhcWdycDBWaERwQjY1MW1YODFsTnI4Y3ZHcEpXRzZVbjBZNVYxa01x?=
 =?utf-8?B?RldWVTRoTFZrRlRtWW5mVnJPd2s2eFBYNFllYnpwVXpwQmFaR1RxMy9vT2NH?=
 =?utf-8?B?bGs1U0xCYndOMHJHcTJ6aWNpNjkzM3Y2ZlpQM1A3VGg0TUtJaUw5V1FqRUN5?=
 =?utf-8?B?NlV5OEhZVklERG1CR1dEaWwremNHc2ZRN242a2dQZXZ5MXZPb1ZZUFBCVjJm?=
 =?utf-8?B?L09UMXNnWFFmNWtsOFRFcVBWZnJ4NU5hVStVcVBVSDV3QUxuRHRBU2FKUjdD?=
 =?utf-8?B?VTY5MFJ1bjFla1ErS0E0d1I1d3lXNG9qMmFIWTdlTTUxSWNHUEFIWlZkRFdO?=
 =?utf-8?B?YkM5SmVsM2gvTlFodmlUUVpsTFNuMHZldWVSSERWSnhyOVBObUp1RHdZODB2?=
 =?utf-8?B?cDhyV2k4SWRUZEtYM2ZsM2pvNUpLb0l5V0R3OWt3Z0hqTW1hQm55VERyS2hP?=
 =?utf-8?B?UW9CWWxJSVpRMlIwSzZkSUVJMTFmcjcvM3haU1Q3Q283NG1nK2NQZmJ4a0pv?=
 =?utf-8?B?RVc3WEo4UlVLOGpCM0NzcTZHTTFLUEthODZUaHIrUUdpSjBWK256dzlTQVJ1?=
 =?utf-8?B?WnR0YkRra29zTUNsWlhVMGprTEF4Z1FuMGpwbmdvSC9hS2FJMXd5b2x4Umpx?=
 =?utf-8?B?blNrYmU3UW1kQjlCL1J5QnQ0eUNCU2FmbVRnc1VmMERVQ2tKemFCL2JqVkZk?=
 =?utf-8?B?V0Z0ZXhlVXRybjdSY3AyVHBtRmNZSStGc3drNnVXNTltUWlHN0Y5KzBya2wz?=
 =?utf-8?B?b1NBRTBRMU5aSmV3czcvQWhEQkRtcmZXaFl4enpncXR2dm1UME15R0cvUHp0?=
 =?utf-8?B?QkFvZVArYjJLUWVicWgyWVlTZlM1OFNCYUQ3TVdOeWY5UFpWWFljNk9yOHp4?=
 =?utf-8?B?aTd6VmNqZ243Z0NOdk5WNDZuNGRaRW52TU1abmFvcHZxK3RXK1pYR09vQnBO?=
 =?utf-8?B?T3d6N0RmQmNvL2NZR01tOGs5bkZVVlRnYk8xczJKcHhreGhUdFIwZ25JbU8y?=
 =?utf-8?B?djk3Y2VwTzYyWGhGbTJpT0xORStBTDVRSVF4ZkFSOXpNQVBZdlJuNjhWOGp1?=
 =?utf-8?B?bTNweVVLT0svZVY4cGVyK1M3MGJnNFB4eWM1SEs4OEZCb1hobnQ3Z0Q2cTVI?=
 =?utf-8?B?WVNucUpPSUJmQVJWa21FbElsVjUyUkhiSUlKOEhwVjcwTVRjNlM2cldUdWxM?=
 =?utf-8?B?eUN3ZVdCVndURDBWcmFYWW81MmM5dG5YdTFwVWR2UU1naXU0OUwxM1V4eGVm?=
 =?utf-8?B?WEhZL3lIUHJYMWt6ZGJ3OExyaHIrTVdWUmtjVDZMd0wwcnpFdkZNdVBJcEJh?=
 =?utf-8?B?RjRxSExpOGRRTXYwTGxTdnBVU1ZnanVzMWJ2SWdZbVFCRTB3Z2o0WlJFbzhi?=
 =?utf-8?B?YTF3WkZlMW5yOWZQbGdYaXJtaysrVEhCWnJReVdJblpSTjM0RzFzQT09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6117d0a-ca6d-49f2-0d83-08df4ba2932b
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5778.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 09:49:33.7465
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0s26DbggwMhzzehm1oZbr5HuJHiZlUE6yZuihu4XrDhMCqqvvTnWm7+LH0RKKnkdvtt4i0QRxCebLY2pUfvj0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUZPR03MB9560
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_014946_324269_39971A4D 
X-CRM114-Status: GOOD (  14.52  )
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Viresh,

Thanks for your reply.

On 11/26/2026 1:10 PM, Viresh Kumar wrote:
> [ EXTERNAL EMAIL ]
> 
> On 23-11-26, 20:23, Chuan Liu wrote:
>> I have already completed the support on A9, but cpufreq-dt currently only
>> supports the single-clock case, for example:
>> dt_cpufreq_early_init()
>>    ->dev_pm_opp_init_cpufreq_table()
>>      ->dev_pm_opp_find_freq_ceil()
>>        ->_find_key_ceil()
>>          ->assert_single_clk()
>>
>> set_target()
>>    ->dev_pm_opp_set_rate()
>>      ->_find_freq_ceil()
>>        ->assert_single_clk()
>>
>> Both of the interfaces above are limited to "single_clk", so SoCs that need
>> to adjust the DSU clock in coordination with the CPU clock (such as SM1, S7,
>> A9, etc. mentioned above) cannot directly work on top of cpufreq-dt.
> 
> Have you tried something like this ?

Yes, as shown in this patch [1], I forced the above two 
"assert_single_clk()" to "assert_clk_index()" and it worked.

> 
> drivers/ufs/core/ufshcd.c:int ufshcd_opp_config_clks(struct device *dev, struct opp_table *opp_table,
> 
> Finding the right OPP should be done based on the primary clock only (right ?),

Yes, I took a look at the ufshcd.c:int ufshcd_opp_config_clks(), which 
is similar to ours, where the Amlogic A9 cpufreq needs to manage 2 clocks:
   - CPU clock
   - DSU clock

The Amlogic A9 need to match and set the frequency of DSU clock based on 
the frequency of CPU clock (primary clock). The opp-table is defined 
like this [2].

> but configuring multiple clocks is possible via the OPP core.

Yes, currently OPP core supports managing multiple clocks, but it seems 
that cpufreq-dt does not support.

For your opinion on this situation, you would prefer cpufreq-dt to add 
support for multiple clocks, or add a new Amlogic cpufreq_driver 
(directly base on OPP core) independent of cpufreq-dt?


[1] 
https://github.com/chuan-aml/linux/commit/aab760f8f2de732aa997aa0d1d752b6b5f284880#diff-61bacca23d8a12c4b91049198f76c77a145795446fb9c18d0c64cf18491f5d35
[2] 
https://github.com/chuan-aml/linux/commit/aab760f8f2de732aa997aa0d1d752b6b5f284880#diff-333a52bc56bdbaa937ff052164a781fdb456178ad6f313c5bee322e790b6baea

> 
> --
> viresh

-- 
Best regards,
Chuan


