Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1888B60A380E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 07:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Aru9fB1A;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=fXBRorJ2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=HEKeLwUiKtpUmctKwhHsgfh3m2eDCG6S3opIYdSvmuQ=; b=Aru9fB1AthC1ptjLrpGGbrGEB3
	pHE/ZZS5mdeCa2umoipA0MQjMY1N/1DBQYgVhD+jXYQuLyfrqo3dMAR5qnIGfHZrFkJTsBg106cqX
	lf1rJ2TIsmQe7MPyL6hSepN/oDLYWFbowKazV+LnZVMW7J8CVna/6FmuPJ6+tUXlzv7IsBra31AcV
	qz6MOkK8YfmUeqEKbAyy6ls7ENkrsa3hVW/X0YjFQwj4E8stXAitzC6j/Sh64dsyLQBXu7Gr1mWaP
	3xxVONbONB3gBwQQonYNR7X5yFjor89jpfNdN9MucZp5slqQIdq3u00Tf/2jht2Nqmp9p106HnUJb
	HV6Jgh8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR2pm-00000005vII-3Mze;
	Wed, 11 Nov 2026 07:33:30 +0000
Received: from mail-westus3azlp170100009.outbound.protection.outlook.com ([2a01:111:f403:c107::9] helo=PH7PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR2pj-00000005vHU-2Ypa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 07:33:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=weKcZaNlErnf8pY2wREDEWQLKQpP4+2HbPY47qwnJCXMNhKWd1dGQIuyyQv58+nOo+99u9sceTX/dLBFazhQC8FwhAKyTVVu03iwKzOvk6LBEpby2So9Qi3nZDJMt+NEcEuoguu0K9cZLoojrmSGu4Cn1kaxuY/ZE8qZ+t4zo0FRjceEkvk/HqruFT1wNc9affEuxAOT7DFqoszJ2G01fXbxdJvPNwZfYWoSThDWp4KeQy1bUGhNPSInkuZ+sQ1h2dHs4hu66CW+sTi4L0AWRlQ3QPD9drZGR+bGKEWHgpEzpDkPNzzACoWUW7oT+ro/HaLtM87El4JToa3bfW9PEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HEKeLwUiKtpUmctKwhHsgfh3m2eDCG6S3opIYdSvmuQ=;
 b=hyPgGnkg37BVh9JmZbrp+0F5otKuzhDg1JCgZkaftYQNp5Oz3yXyu6SJgJDuquwrfXd5xzM+dWl9R14DgK0hjwuJHWtJehgUocCrJ9jZKxFNNqPfxDnHOQ2wrPLKNx3DzrwKeaBCqzU2PloomspJMg404mKk0fqHVuWVbXyX5eRaMAQLnMInB8pS4qb3Lz2tJCSMNIlvgZ22VgxqEXGY+uDcuHYfmb1Wls9me21s61IHNyJJu2mKzVi56lkqxzB3zfj2jn2H7q/LSCUq0NOhlbMbmK7Twe+c5qFks9+Y0/Fjg6pXTwZzpWSpMsKSmxm4RqRLmzVVcOxgAglBuhsGUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HEKeLwUiKtpUmctKwhHsgfh3m2eDCG6S3opIYdSvmuQ=;
 b=fXBRorJ2S2Lblmm42WVekYNzU1vuDqrCjcOApuvuPQC/yoGWmwAMD5g7BvrqfUDZs3wQBw4ppDval6zf1Eu66lJqDl5G9pTj17laN0xntX7nrQ4zC5G2RcAGdN3WMEiMr84jsS5mCYtUwrtIsuUnscW1d0ZFtbRj+C4fQiaEQLs=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN7PR12MB8147.namprd12.prod.outlook.com (2603:10b6:806:32e::5)
 by CH1PR12MB9621.namprd12.prod.outlook.com (2603:10b6:610:2b2::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Wed, 11 Nov
 2026 07:33:20 +0000
Received: from SN7PR12MB8147.namprd12.prod.outlook.com
 ([fe80::3923:c1a4:778b:56f2]) by SN7PR12MB8147.namprd12.prod.outlook.com
 ([fe80::3923:c1a4:778b:56f2%3]) with mapi id 15.21.0615.008; Wed, 11 Nov 2026
 07:33:20 +0000
Message-ID: <fdf30c76-f78d-430b-9ca0-8377990a6b22@amd.com>
Date: Wed, 11 Nov 2026 13:03:09 +0530
User-Agent: Mozilla Thunderbird
From: "Neeli, Srinivas" <srneeli@amd.com>
Subject: Re: [PATCH net-next v3 8/8] net: xilinx: tsn: deliver endpoint RX
 frames to DSA user ports
To: netdev-bot+sashiko@kernel.org, srinivas.neeli@amd.com
Cc: nagadheeraj.rottela@amd.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, richardcochran@gmail.com, michal.simek@amd.com,
 bigeasy@linutronix.de, clrkwllms@kernel.org, rostedt@goodmis.org,
 edumazet@kernel.org, netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rt-devel@lists.linux.dev, neelisrinivas18@gmail.com, git@amd.com
References: <20261016-patches_v2_external-v3-8-e33d3960ca1e@amd.com>
 <179249750444.3135.1692275587478159303@kernel.org>
Content-Language: en-US
In-Reply-To: <179249750444.3135.1692275587478159303@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0206.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ab::7) To SN7PR12MB8147.namprd12.prod.outlook.com
 (2603:10b6:806:32e::5)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8147:EE_|CH1PR12MB9621:EE_
X-MS-Office365-Filtering-Correlation-Id: 76523de0-0460-4a06-1a81-08df3fc60f04
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|1800799024|23010399003|376014|261021123027099003|11063799006|4143699003|261022105027099003|261022075727099003|56012099006|261026140227099003|261021121427099003|261028144727099003|261009223027099003|5023799004|18002099003|22082099003|261102123227099003|10067099003|3023799007;
X-Microsoft-Antispam-Message-Info: fcxUj4bQqF+JqH/n206NbBvjjTMFOA+a1rRKouzrrrBVHATtafd3bmzmr9hXw///lpck5RzKyktVDoR84Di81Kq+gTxnOphzwIloWQ7R054sr7ZQhZWbwZR2brn8ByZr3C5iMelw4xFnmW5cfAHfc8Xy2kdrUCNXs0SVK1V5tjT8bzdDzRmDxiBAxfz/0TeRVbuihAzg2eQ57vr0VdUedX411Q4dWFAswl408SaPhfYaufFj6/JoAIFhqzCV9KJbg3s2WSExzHm28KWxbKTpRcGv8ox2ieuuter8D1ZzN2rwA9+x4hApgBkatsBgzmckCBdbqHJzvMZuYA8HPUZmPGX+q2l4rSxN0qkUTsc4j1yzCgLNKeaDxdp6NtFvtbVmrgj74KdkTr/QO7ugUn+DXdC5q1jBBSToMQO4c1R1J/h0rUL8FJGDhEuU+kRqKN2BhtOki9q05yRCzb+sPVmfmVI6a6tcTunquRxJktx5ntwYRNjtAVpOwUQsd7WVlVN0p2ZzIdzEO6zyZF2S3cmfEMz6QyhGw4Y00/7OgfDe6VWTM3MKC+J3x95+K73S0P6hqt3RAuz7gBn/JHmLO+il6bGc7IBsYU5hOjpKO58k21TjelSy4vH73zTVxgcG8YOaIgTrG8NAzz4Sjvh8MMZIMjDUTzBHYJcsPZv69kTfnLs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB8147.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(1800799024)(23010399003)(376014)(261021123027099003)(11063799006)(4143699003)(261022105027099003)(261022075727099003)(56012099006)(261026140227099003)(261021121427099003)(261028144727099003)(261009223027099003)(5023799004)(18002099003)(22082099003)(261102123227099003)(10067099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NDVWT3pRaFZQZXI5ZGtOaERoNzZReXRRMWZybVdLeUYzb09JeTJRWUc4bFls?=
 =?utf-8?B?S01CR291ZTVlUERyZmZpU2c3SHc5dUhneUlKV1FrZklkZjJxUEpwS2ZaVFdH?=
 =?utf-8?B?TVpreVJPcGJtbDNzRXlWV1cvclFJQ1VtU0tPeVhDeUZWenp5WEl2L3llOVNV?=
 =?utf-8?B?cldOcHZDU1kxL3U1bG8ybmtmVCtHYnlpRUNscDlyVWorZU1MSFR0NUNma3Yv?=
 =?utf-8?B?WTdxT3ZYRG96S1RhNUZZNGJwS1MxeFpNbnFmaDJaemludE1DTFJWU1Ryc1lX?=
 =?utf-8?B?QVFLRmtWZXkvUWRKdW96WVI4d2xieVZlakRXQkMvNnR3YWlzV1laVW9YWjBk?=
 =?utf-8?B?M2tocGxHNGp0ZFdRRGt2eFZFUm8vOHVYSnVOUlFVQ1ErU09SWUtZc3lkYU1j?=
 =?utf-8?B?OC85RExYVlU0dUJUb05XZ3ZYYXNuekFZUDZycHM0YUxCQU1ER2JrN3lkQ3lC?=
 =?utf-8?B?cHhoY05qMFl3eWVWOVdRYjkyOUowTFRka2J3YU5uY25KK3dFM1Qvd3QxZm5H?=
 =?utf-8?B?cWN0QUJQYXMyNnBSdFNHZW5QWDN1Y0Z2ek5IKzQwa0llQ2NIcFhRS0Y4UDg3?=
 =?utf-8?B?MVMwSE9OSkV4b0JyaVJJSmFacUpFV3RQdnA0RFJJQW5tY0k2MTlxNnMrQ2hE?=
 =?utf-8?B?N3J6WXE2SFNIOWVkczNqaWMrV2hMbmlFMkFpMGxWQzJBdWFoa0xlQUdZMzIr?=
 =?utf-8?B?aXg1d0pieDlNYWtqLy9lWjh5QjdENndwclNyZzlGVDVhNTY3dVpCdWw3Nzln?=
 =?utf-8?B?aUpQQVQ5VlN6dHZNTUFkaGlnbGpYY0NRdUVKd3Q3aitzUk12K3p5ZmRMc0My?=
 =?utf-8?B?RnpNeE5aZ0UxODF2SDhGZHZIS1pJZmhXZVpkMkJxa3FwU1ZmQXR1MmsxUzhV?=
 =?utf-8?B?Q2JkaU5DTW1NYmxiYVF1ZjNjWjdyS2kzQjB4SEpTYWZCVXZEOEZuSUZDNjkr?=
 =?utf-8?B?ZDJkc0J4MHZIT2ovdDZSck52R2ZURzY3SVo2RXVaNlUxM0xWR1RCLzhQa2dL?=
 =?utf-8?B?QkY1OTUyYXJ0cXNRSnFkejUzZGZQYjhmT0gzdjBMeGxBdnNzZGQxdU1nUFVi?=
 =?utf-8?B?VlFRZjdNOWxjSDBnbFk5bUZQWTdkMGJ6N3BCZGwvUFA4Wng3bjg4UjEyYXRX?=
 =?utf-8?B?WGpKQUI1dXZhQmNLTDVISGcxd21PZld0Q2hjY3VJTDJ0alQ4Yi81Q0E5Z0Uy?=
 =?utf-8?B?VkxJVzVrRUUvR1ZJT1QzVVNkZEswQ08xblp5djR4OUR6VTBqMTV1YVdIZ1Zh?=
 =?utf-8?B?Y0t1b3BHbWc2OTh4SFhray9XRUpBQWVudVMvOG9JSGFkV1N1Q2lhUER0Zm1u?=
 =?utf-8?B?Zy80VmRna1NSYWIvK1NsK0Z3dzljWVdwMThwc2k0T0sxalVqOTQ4M3czNVFW?=
 =?utf-8?B?a3JJSWV0dTJ3bGlSZkJqV0NHK2NOL2tJbkVVWGtsUnBrYjZlQkNiWTVGaEFu?=
 =?utf-8?B?ZXVoSnNHUnFQZmxzWmZ2VVFJYVNOVkUvRmV1V3ByNWhpVE55Z01OMUJCbjRy?=
 =?utf-8?B?Ylc3L2V6QW1aTXBVWDJkSW44dGYwdnVBRDI4QXd2RWY2L2pLZ3N5eW83bEw0?=
 =?utf-8?B?OFBYZ2YrdGR4emhXcXdJMUhpaXRaWmlTUEpiTkQ2Zld1REU5dVFFSTBZN0tq?=
 =?utf-8?B?R0Z0TmhqYnM1Rkh0S0IxZ1JyMUVNcnlPNk5oa1MvZDlYN1p4cGZaYUZ6S0to?=
 =?utf-8?B?NmdQbFhDaDJocHhvZ3lHMlg4OEtJalZpRFBRMkl0UW1FZ1N2R3pFaWU4dWRm?=
 =?utf-8?B?Zk8rQ0hzUWRMS3c3cHhSMUJ2RUV3TW1oSmZ1cVpkU29GUVhqdGpLeWl1MjFM?=
 =?utf-8?B?QkFDYUs4ajR5ODNVaStHQlJzRFpzZkVDS2VGOVdLM25PbjhZaXJuSDB1MWFG?=
 =?utf-8?B?SUt1S2MxWWp5cGZzQVAwQ2ptcEVVWmMyMkFnUXFDblhyeC9FYTVJVlZKVmcx?=
 =?utf-8?B?TUNZWGlMd21UOStqaWVaSjNFd25saTlXSERlZ2NwWWlGeEhLd0JldDZFaUFG?=
 =?utf-8?B?ZnhoemhOZVFoOUZVZlBWTDliTWkweEV4d2tRR3hoejZ0dnRocklpRWtsRmVy?=
 =?utf-8?B?MW5lL2FDUDVuMGVYRWt3NFpXbjd5RGh3UFA3dTE1d2FBUzdGb2JacEZ4dnkv?=
 =?utf-8?B?YVltNWQydHNyTXdoZDg1YXg3bEtqMzBscUZGRkR5TVkyUit5WjkrdnhpWDNw?=
 =?utf-8?B?NUdlei8vWTRlV2hVeW1OTXEvMXYvL1AxMjI3a2I5L3pTdSt1emRQQlUyK3Ba?=
 =?utf-8?B?cWZYOXltYjluWE5VOXJ6V1NyZlZJVmdXM2JaZE5BWmh0bnJwSm15ZkRybEJ0?=
 =?utf-8?Q?o06rCxnEMVqhNBbHOM?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76523de0-0460-4a06-1a81-08df3fc60f04
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8147.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 07:33:19.9173
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8TVSFCJKoewjVWFSBlilIGuLeHI7ubeyHU/kAE5nL8lt1VexUGV5rkMWjrHvvKfO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9621
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_233327_658665_10B955D7 
X-CRM114-Status: GOOD (  30.46  )
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

On 10/20/2026 5:28 PM, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found more severe
> issue(s) in other patches of this series. This mail is only an FYI, in case
> you want to address the nit picks below when you respin.
>
> Low priority / nit picks for your consideration:
>
> - [Low] The new RX demux in ep_dma_rx_cb()
>    (drivers/net/ethernet/xilinx/tsn/xilinx_tsn_ep.c) relies on a DSA…
>
> --
>
> net: xilinx: tsn: deliver endpoint RX frames to DSA user ports
>
> At probe time this commit allocates one METADATA_HW_PORT_MUX metadata dst
> for each of the two MAC ports. In ep_dma_rx_cb() it then attaches the
> matching dst to each RX frame based on its TUSER port_id, gated on
> netdev_uses_dsa(), so DSA can deliver the frame to its swpN user port.
>
>> diff --git a/drivers/net/ethernet/xilinx/tsn/xilinx_tsn_ep.c b/drivers/net/ethernet/xilinx/tsn/xilinx_tsn_ep.c
>> index bd8cd504cefb4..5103a3b4b018a 100644
>> --- a/drivers/net/ethernet/xilinx/tsn/xilinx_tsn_ep.c
>> +++ b/drivers/net/ethernet/xilinx/tsn/xilinx_tsn_ep.c
> [ ... ]
>
>> @@ -302,6 +311,10 @@ static void ep_dma_rx_cb(void *data, const struct dmaengine_result *result)
>>   	}
>>   
>>   	skb_put(skb, rx_len);
>> +	if (netdev_uses_dsa(ndev)) {
>> +		dst_hold(&ep->port_md[port_id]->dst);
>> +		skb_dst_set(skb, &ep->port_md[port_id]->dst);
>> +	}
> [Severity: Low]
> Can this branch be reached at all with the tree as submitted?
>
> As far as I can tell, nothing under drivers/net/dsa/ binds
> "xlnx,tsn-switch", and net/dsa/ has no TSN tagger. The only references
> are the binding in xlnx,tsn-endpoint-ethernet-mac.yaml and this Kconfig
> help text:
>
>      The three-port switch is supported by the companion DSA driver.
>
> Without that driver, nothing sets dsa_ptr on this netdev, so
> netdev_uses_dsa() is always false here. That leaves three pieces of dead
> code for now: this branch, the port_md[] allocation in
> xlnx_tsn_ep_probe(), and ep_free_port_md(). It also means RX delivery to
> swp1/swp2 can't be tested from this tree.
>
> Will the companion DSA driver be posted along with this series?
>
> The commit message also says:
>
>      guarded by netdev_uses_dsa() so it runs only while a switch is bound
>      as the conduit.
>
> netdev_uses_dsa() checks a bit more than that:
>
> include/net/dsa.h:netdev_uses_dsa() {
>      ...
> 	return dev->dsa_ptr && dev->dsa_ptr->rcv;
>      ...
> }
>
> dsa_port_set_tag_protocol() copies cpu_dp->rcv directly from the
> tagger's ops.
>
> Every frame accepted here carries a METADATA_HW_PORT_MUX dst, so
> dsa_switch_rcv() always takes the md_dst branch and never calls
> cpu_dp->rcv. The tagger still has to provide a non-NULL .rcv, though,
> or this code never runs.
>
> With a tagger that has no .rcv, such as none_ops in net/dsa/tag_none.c,
> every frame would quietly stay on the conduit eth%d. tag_none.c warns
> against using it for new switches, so this mainly applies to whatever
> tagger the companion driver adds.
>
> Could the commit message, or a comment here, say that the tagger must
> provide an .rcv callback, even though it won't be called for these
> frames?
>

The v1 posting carried both the endpoint and the DSA switch driver.
Following the v1 review, we split them into two independent series.
This series adds only the endpoint, as the conduit driver, and the DSA
switch driver and its tag protocol will follow as a separate series,
as noted in the cover letter.

Thanks,
Srinivas Neeli


