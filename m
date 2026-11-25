Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F249606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 06:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qU30S1rt;
	dkim=pass (2048-bit key, unprotected) header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=OKLuc+bZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=9OHYD3OjJ2t2NV2JF+VATQCJzoPyGqYPYwBQm27yo8M=; b=qU30S1rtKKFSZqks78UOz3Qw7B
	qML+4fsmzGOiYIzYu1olY/k4tagnaForEAS6kxXJbNy8duXMzyBYKg/oJw+EKNdin4cnONb+8Yr0f
	h2PKNKgxycC2AU+MmDcErJLWXGKhNy00CQPJU+ZYiKI7/4QHLDsZwvG5KyMCPVA3/xIvSKHMVID9H
	xz8tqfVfv7BP4kkslF+IWE3bYdxY6IvtXHcP24hGaIWJH1iKqi4fb8TdOX/CeJprDvttgBQwbFZdc
	yW94WgyDmOUCnhZETsBZ1eh8ydfjMjqZkZ58/0Qwhm2uDtgXrtfVMLYz5X/Su7qwDYBIdJvNyoi/p
	11Ojf2/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW6eG-00000008j05-1AiU;
	Wed, 25 Nov 2026 06:38:32 +0000
Received: from mail-eastusazon11022132.outbound.protection.outlook.com ([52.101.53.132] helo=BL0PR03CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW6eD-00000008izQ-1NzR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 06:38:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OWnBe6datjqhcLqxR5uSp6gnLE05CRsZwRqo3dZQvFgXMYVfHZ1I/E8VSFXoVP6AylR4K3/iAjHh39NlQrV/MafVUWn/qIY/GmJIb0V50dVpY6dvw6iX7QL1WdznhaIjwADM4RFoGuyWRDVB6QfgywUb97bOgh8mGOcf+EX03S9494zgeQ0rAiK2CSDqq0xYs+1AydFfnD+/cQMK8y/xci8c6frHeUUxq2Na/iiJAIaEWfVFOuPGFWy+YjG7ssulHblGFJQB+By+bkZWKw4wmRLo1W0acmP4SderhbWanLwpg0TNxJ1rkVpgVzKGcCvqMzs7S/HM80A+c8tXytHhPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9OHYD3OjJ2t2NV2JF+VATQCJzoPyGqYPYwBQm27yo8M=;
 b=TgXrA1vnnwf+55N1HOrQN7YAVypBdMoILqyZK2/QeCn+vJDqtDotgOMYuIAKfhwqq4Bu8lidCfbP/HV9dkV/DAh3xo3/KxWDTr7O0ht/66PkYCVOl++SOdiemcDHfoX8oWx3xpLWZqd/Wu6Dq14ITeo9Kb9YKx9N8hntMqjdwZpKR8av/cNMfzQOVAVCpDieAWRXNv2LdGUUPsEKrJtC96vbUWZ1OT40dfxmqltwpOQ2LWZ7DoF3+mK7cGJkoftg+Js1bPGaBxUdSoXPNmpeVvykQ2YVlyKONamzH5GfapA0gdQcZcAiC+6tQEenCxGq7owIUmrQ93O5g0VbrL4U9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axiado.com; dmarc=pass action=none header.from=axiado.com;
 dkim=pass header.d=axiado.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9OHYD3OjJ2t2NV2JF+VATQCJzoPyGqYPYwBQm27yo8M=;
 b=OKLuc+bZSffVAXPOg5DlTawNX9rWAuYyR5Qa82G7DdP4LLKZZY0/RrRCJciJ+QYEkCSHfQxB/zj3Sy2rNhEkKWhWySFF34xcZxqZKepBNgLMkg3snpRegZjhGYSdWiZ0GZLJjewyp1RsbuNH93uoYnAxWRzi4pBRwkBEZnKKyQCLfMfXGm209q+HpsWEL3YtaFyhu0WKtOjEbAYjbLN4wdzoPNHJfB0F01MAUB4kfyZD9cEw2cdAAgOBFs0dWMPMCOgtC37bF77XVHEtN9nRdSRfPThp1JKmeobA5N+aWeTQS3sXrgvPaPgV6b+2S67U98VKphDBdJslqNR1sQeI9Q==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received: from DS2PR18MB474501.namprd18.prod.outlook.com (2603:10b6:8:408::15)
 by SA1PR18MB4616.namprd18.prod.outlook.com (2603:10b6:806:1d3::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Wed, 25 Nov
 2026 06:38:25 +0000
Received: from DS2PR18MB474501.namprd18.prod.outlook.com
 ([fe80::a782:2e12:c00:3b1d]) by DS2PR18MB474501.namprd18.prod.outlook.com
 ([fe80::a782:2e12:c00:3b1d%4]) with mapi id 15.21.0662.001; Wed, 25 Nov 2026
 06:38:25 +0000
Message-ID: <ea2a5268-ca34-45c0-9548-52996dbbe16f@axiado.com>
Date: Tue, 24 Nov 2026 22:38:23 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] Axiado DT updates for v7.4
To: Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, soc@kernel.org
References: <20261028193648.73841-1-twei@axiado.com>
 <2b550966-0185-47bd-80bb-ebab6f717e2c@axiado.com>
 <3b494499-c8e4-4670-8d61-b770d2298331@app.fastmail.com>
Content-Language: en-US
From: Tzu-Hao Wei <twei@axiado.com>
In-Reply-To: <3b494499-c8e4-4670-8d61-b770d2298331@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR20CA0024.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::29) To DS2PR18MB474501.namprd18.prod.outlook.com
 (2603:10b6:8:408::15)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR18MB474501:EE_|SA1PR18MB4616:EE_
X-MS-Office365-Filtering-Correlation-Id: de487f23-c21b-4983-ba91-08df4abeb52d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|42112799006|366016|1800799024|23010399003|376014|261022105027099003|261026121527099003|10067099003|261026140227099003|261028144727099003|261021123027099003|261102123227099003|261021121427099003|261009223027099003|18002099003|22082099003|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info: f1/tCzT+HgTOkf5ooqiBrjaeMk62dt1HGouOEcE3A6Ird1c+AipO7hq+AUNjrph9jtmpU4+JQm/8EDoaU24ngXu5/AN3syDd6txDQwtwNwm3UkHRrzq4osQDdTsA9sYrsERkWvH19VlINrQ1qWfcT4sfQXwFXAtncGYUWZ2q09RzHaAwhnSTM9Rc7EdvHEX1UZSwKprcsqk4l5qa9ubojn5EdPHwVa2HR4imJcROAs31WclJfDdSqsHYiE4SIEAXvbOyVElfPboGMe+RsYIYS1nm6HB4aB7ldECmcxlSGEY39vELs8LMlNS+7XDgaBgFUuRVybdqJ4c1jjeodnKoLKr3neNF3eObRyNt1Hruv3WlWyPZ+vbOjGcDjasP1YHZgJveGzBcuINLAVG2TwOMWcGN2bYwa2urq4B3MdScNqCGjOmE9tmNS6RuEImcRWzFtFBiQNBuc2FFr+ySq1Szfnd6JTPvA6hiyAu1K5DyCU3Vk9N92d0THfgwftkI53KoqUtwy0rxeDPUqOHx/MYnSUcRbrpH9ekqnoOvKSSa5Fr3l/Z+BYSJmRtp6BM5Zc5H1d21Cahoz9v1HQnrWJtKsMELr5OHw2gLVHl5oIZEtMYxCy+4Oyb1TEQSpBU+DqeW
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR18MB474501.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(42112799006)(366016)(1800799024)(23010399003)(376014)(261022105027099003)(261026121527099003)(10067099003)(261026140227099003)(261028144727099003)(261021123027099003)(261102123227099003)(261021121427099003)(261009223027099003)(18002099003)(22082099003)(56012099006)(4143699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MWpYWGtob2pCWVRNRW9mckZOSW5nc285T2F6bGNVZ0xSdVJGcVZ6ck1OOGF4?=
 =?utf-8?B?NUhDV3czUDVEV0w4bDJxKzVENW9ucm9HUHdWWm1nWW1WNWovbUUxcXpiaS9X?=
 =?utf-8?B?S2JtbHp3dFdwMnZZeld5SE5WdXdaTE9ZZXhVOFdNRERMS1JyTWdFVVYxNkhN?=
 =?utf-8?B?NHdDV2ZNZVUzWWFPYnMraVgvZVpFWldiZUN6dVQrYVlDZFp2cHp3eTNySjRW?=
 =?utf-8?B?Vzl0dEFJZSswdXdXOFBQdUxGSWJER3VTTTlsY2NkUUxQd3dmM3oreWZFQ1ZT?=
 =?utf-8?B?SVRQVXFmNjd6WGw3N0VyeE9GNU4vcXg4SFpWNllIZ2pMUDlXa3JoeWVCSnpG?=
 =?utf-8?B?bTJkdVhrWDlIUjdqL2pqWEttMFAvT0dZK2lFODNlcmxUT0xRRktOUXhKdHRr?=
 =?utf-8?B?YTRRaXBYOEFSVkRMd21KNDg4MjJFM2RsdG9YSzBCNzcyL3VJOHR5SW5Ka0N5?=
 =?utf-8?B?OEZEamtnWWZJMm5DRDRraUlWOUlhS2RHOXhiMTJLL0RCLy9xaGVSeXFYU0pR?=
 =?utf-8?B?YzJIS2JSNUQ0ZTdrNmlrNEZVdzAxdkt6M2hSR0pLVWlDd0kyaCt4QWNsQUlR?=
 =?utf-8?B?aFVPdUFBcUlhWHQxc2pYYmVpL3g5R2hvTDZTMkV4Z0k0RzJUbWw1QmgyZ1Fa?=
 =?utf-8?B?RW9rZzFVc1FlV0ZZb2xWN21hSFI2VVN3SG5RaEdZb1g2K3NKTWF0d3NGTE5J?=
 =?utf-8?B?T2tNQ3NBODU4UW1wVEtiVVVTdzJTZUFtcUcxUlpRZldXMEFlbWcydlNSQloz?=
 =?utf-8?B?MHErM1pCV3kvNjFyelpLSGwvRkM5VzRQekJ4em9uTis0bEx0ZUx0ckwvYXlC?=
 =?utf-8?B?S3pQd3lWU1FUM0FSVmJXYWVCaitiS3hGR0lmUkxUb0dkS3o5UGw5SW5zTlhK?=
 =?utf-8?B?c3dPUWFoSG01T2VHczZBcG5XWlF3NkFrYjY1NlNVdmNnRlVoVkRUQlpEUmdi?=
 =?utf-8?B?d1JGRnJORGZVL0V4ZklMeFgyemQ3NjJoV3V6eWhOZVhWVG90NHpwUWtSdnU3?=
 =?utf-8?B?NnYyZVh3a2YxaUljVHJyN0x1MXU4OThXL0p6RzMvckdYNEExcCs0ZkRtSytP?=
 =?utf-8?B?azh3MlF3QnpIY01FVHhWeDQrd1NOUUFwbzJxQlFpVHkvd25pallCUDh6czIr?=
 =?utf-8?B?MW5iUXQrYW0wb1QwckUweGFCdzBTSlcvRzZxOGRORU9xS29GSURzQWk2cUVB?=
 =?utf-8?B?WDIwTnRaYnBWWEZNU1JqMGdzN3Zseml6c2hCK3QxaE1oTXowaVp5L2xiajRO?=
 =?utf-8?B?ZjlIcjhCWXpWMmxuZTRkQktqcndYdkM4QkNMV3BXbG9HYVd5VE9mdnZ0dUNl?=
 =?utf-8?B?WmNKN0dweUNpNmo4WW4xeCtGTG9kODNGOVZuUWJsMGU2OERyZFNvSEtYa2lp?=
 =?utf-8?B?NTQrdWNycDZUMmhTMytua1diN0wvN1JzcHpNUjRLbldXY3RzM0ZGclBVS2s5?=
 =?utf-8?B?Y01jSytEVThJN2pUbWM1VlZjOFNJbUJ6Y3Q5RFdmMnRMVTg4U2FJQzdXK280?=
 =?utf-8?B?N3NkcW96eGZHeWM0VWxvc3d4aVBXMDcwODJiNTBIaitLSFVuS1NBUUJPS2l6?=
 =?utf-8?B?bVlISlE1MVZsa2t1Y3BJYzFpWHZNakkxc1JiTFlGRXo5aFdib3pyOHJrc1Ns?=
 =?utf-8?B?MkhWRHYrQ3Rmcy9kVnVZdlpxcm1FbFFDdDdTVGdaZ1VKa1NEekNDSCtrajV1?=
 =?utf-8?B?ck1pRHNCOTFFaGE4YTVKWERJSW5LNjg5RkJpMkRzOGt4ZkgxVkZTY0NkdzZk?=
 =?utf-8?B?YVBBWFV5MkdGYUJmTmpxdXM0d2d2M0lDZFd3ak1IejdhcllzVUM5UWZJZ21C?=
 =?utf-8?B?TUpueEZ4MUtiYk9NWFNGVmhPeU8rcG80Ykt4R2pkWm1ibFp1a0I4elAvaGxX?=
 =?utf-8?B?ampkcEVOcFNvbUI4TzZzaVV6V0Z0ZjIvbUhOR3ZWOVpVT1JTVGgvMlRHV3lK?=
 =?utf-8?B?NzAwckFtM0RXSjZkSU9IK0o5d1NuRG9jOUdpc1BzdlpadXZqUHpSQmlYN2JX?=
 =?utf-8?B?MlpoUER4ckJpSlJYYktTaTRBQUpKSys4M0Ywbmw1bkQzRFRQSkZWM3J2ZjNW?=
 =?utf-8?B?T0RVQlFRUFozUE1JZGhHckdZS2F5S080MGEwQkRORVFNY01zczdCd3N0Y0tE?=
 =?utf-8?B?cStlNjh1R3UvSWJBUUtrSGxreklYN1E3c2VRc016NHJuZ0tjSERrQU5nMUMx?=
 =?utf-8?B?ODlzdUNHZEk2cG5uQ2VaWHFRdEZlbytmZTduQ3h0aGxOZFFISFN3elNhL0FF?=
 =?utf-8?B?MkZjenNudU84eWRsVVI0ZkhSSlpxdjZFRDEva01XSnBGZGhXdU5DNVcvOFI3?=
 =?utf-8?Q?uF2Bie3XfWo8xqJR42?=
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de487f23-c21b-4983-ba91-08df4abeb52d
X-MS-Exchange-CrossTenant-AuthSource: DS2PR18MB474501.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 06:38:25.4732
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zoIkhBvuvH3eolhCUcQ13JFPPYupaX+u8FYAa99lRN4/NvrAs5RQTreDM5gBSPB3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR18MB4616
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_223829_388064_C1525D19 
X-CRM114-Status: GOOD (  28.31  )
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

On 2026/11/19 12:57 AM, Arnd Bergmann wrote:
> CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you recognize the sender and know the content is safe.
> 
> 
> On Tue, Nov 10, 2026, at 19:24, Tzu-Hao Wei wrote:
>> On 10/29/2026 3:36 AM, Tzu-Hao Wei wrote:
>>>
>>> Hi SoC maintainers,
>>>
>>> Please pull the following Axiado Devicetree updates for v7.4.
>>>
>>> This pull request includes:
>>>    Initial Devicetree support for the AX3005 SoC and evaluation board.
>>>    AX3005 EVK compatible string in the Axiado board binding.
>>>    Minor hexadecimal formatting cleanup in the AX3000 Devicetree.
>>
>> Just following up on the Axiado DT pull request.
>>
>> Could you please let me know if there are any concerns with the pull
>> request, or if these changes should be deferred to the next merge window?
> 
> Sorry for the delay in replying, I just got back to merging content
> for the next release.
> 
> Your pull request came in at the wrong time for 7.4, we really
> need to have everything queued up well in advance of the merge window
> to ensure it's properly tested, please see
> Documentation/process/maintainer-soc.rst for the usual rules.
> 
> As the contents of your pull request look fine, we could either
> pull it in for 7.5 now, or you can rebase it on top of v7.4-rc1
> and send an updated pull request.
> 
> A few more things I noticed:
> 
>  - you have signed the pull request, but I can't find your
>    signing key on the usual gpg servers. Please upload the
>    key you used and let us know about it.
> 
>  - The contents you send should be in Linux-next for a while
>    before you send a PR. Please email Mark Brown (on Cc here)
>    with the details of which branch you want him to include
>    in future linux-next builds.
> 
>  - As a maintainer, you can apply for a kernel.org account
>    and host your trees on git.kernel.org, which we generally
>    prefer over github, see
>    https://korg.docs.kernel.org/accounts.html for how to
>    apply.
> 
>       Arnd


Hi Arnd and Mark,

Thanks, Arnd, for your feedback and guidance.

I'm fine with deferring the Axiado DT updates to v7.5.

I've uploaded my PGP public key to keyserver.ubuntu.com and
keys.openpgp.org.
PGP fingerprint:
99C9 620D 3A8C 2D16 60EF 7581 7810 305D C45A F1D7

Regarding the kernel.org account, I understand that the application
requires PGP key signatures from two existing kernel.org account
holders. Since I don't have these signatures yet, I'll continue
hosting the tree on GitHub for now.

Mark, following Arnd's suggestion, could you please include the
following branch in linux-next?

Repository: https://github.com/axiado/linux-axiado-dev.git
Branch: axiado-soc-next
Tag: tags/axiado-soc-for-7.4

Once the changes have been tested in linux-next, I'll prepare a new
signed tag and send an updated pull request for v7.5.

Thanks for your help.

Best regards,
TH

