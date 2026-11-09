Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3427606D833
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 07:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DYUfPHNa;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=mlCzcOE6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=B3l+GDk6MeFYrAnRhVsWA6EIzPGUlkU1a9CHDfuLeDU=; b=DYUfPHNaK26IdVTf+OmbjFW9Ny
	N7NhJF3U7UN7MOE9iuJefifoglv3BV3saY3u+ONN1iqZMaCEowOlpYmpZTwzyohXQe03OC/4/sEEd
	V3qUTmVwd9Sj6muTbJlwUpTagHoctPieNJgFJ0G7ub+h4pF8EKbswa8T+Z9RA7+Y3UkHSmWcPJ9KC
	+34CS40/yK55C8PnKxgJM9N/OQ3fkkEXZhzB/B8JLpbSyfPlhDXNhMEIRhpeQYUAtyf1ZjMd+e2B1
	ZHRRxAB+yy4sqQxNoXlt3OqLJkBXULuWdJr6NH/CpBtdyuejyvtqhLatA1xcXfqUX7b3qT46gdr4l
	zCX1qNtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQJtI-0000000HZvg-3SQp;
	Mon, 09 Nov 2026 07:34:08 +0000
Received: from mail-eastusazlp170120007.outbound.protection.outlook.com ([2a01:111:f403:c101::7] helo=BL0PR03CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQJtG-0000000HZv9-02wP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 07:34:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oXUuh5i1Sl7hF1KoyWFlfUjBLN95CRKbxa6MrFrCL7+PUzMbH/d2iSoid6Z2rQQJsIRFlpRsEjlL5JfUTOvtmj4fjQmrN95DH5bkc/8wY7ytVT8FZyhj1sK+nNIxY60WfUZQ61p+8q46xbIW7L8nSJgRDwmg6OXYmEchE3aWn06oNr+PRX9fReSbhUn2rXAwvabkEMEeeRouDRikZD1gftfpie+hNU6cPaJfYyV0r8vxV7LZDNL7WveJeO+ZUzo21Lby5pKlPVajktPrHlSKOzHFk3ugWJxbsLHEmM38J9pP/L3xo7zlDSWf9Ux+5URRBKKP7ZAHfjtFs2qQeEtOlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B3l+GDk6MeFYrAnRhVsWA6EIzPGUlkU1a9CHDfuLeDU=;
 b=KNBgsi+FQrEJ40mnx4XsEtVSzjG92CTmC2syG/xGLOKSf4wQ1c5Wd7NMFFg0IAPylvgCNvbb7myFv7LrAGVg4L0INQGrMzOykFtuTfjgec4hsj2pIRhxUDbUI/LTjhE89E8xfnmUZOs+gW0NYkdL0DA4iE6P5+qxtDa5pzvR3zpVRLh6oyhN/o4F2DDzPrvBZfw5XgbYUEXXSl86LInzRKAzINpAYZ/GlBf7xCCbC0i5W/myVeG27S++GxlyfMQzChK4Voa8P9s9bDq0Q5UlS5TCDW/Cx1n7dyVH0hiSGBl6estHiVMJ3zdgNVaQJo+UK36uWgqccCOtc+ze2xSXRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B3l+GDk6MeFYrAnRhVsWA6EIzPGUlkU1a9CHDfuLeDU=;
 b=mlCzcOE6DJdLlTH0UMRdx8repgg57hSs0KfP2B89RK2AdaQmoR0okAcnkyuuyvHCULEQzus+USe0nJ0BfDsqYWANtYgt1JkV/YAEhMFuBuG6IkkdJIUwd6i9D/z+Ifbfw+a0ef7wRhcxUgfJPfhEDpgjIrP72qm7/DYkvZ2Rd2k=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA1PR12MB6798.namprd12.prod.outlook.com (2603:10b6:806:25a::22)
 by SJ2PR12MB9086.namprd12.prod.outlook.com (2603:10b6:a03:55f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.12; Mon, 9 Nov
 2026 07:33:58 +0000
Received: from SA1PR12MB6798.namprd12.prod.outlook.com
 ([fe80::e317:e4a3:6ae9:8c54]) by SA1PR12MB6798.namprd12.prod.outlook.com
 ([fe80::e317:e4a3:6ae9:8c54%5]) with mapi id 15.21.0592.010; Mon, 9 Nov 2026
 07:33:58 +0000
Message-ID: <057778fb-e2da-4edf-aace-5ff96ae386ba@amd.com>
Date: Mon, 9 Nov 2026 13:03:29 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] net: xilinx: axienet: use
 dmaengine_prep_slave_sg_context()
To: Frank.Li@oss.nxp.com, Matt Porter <mporter@kernel.crashing.org>,
 Alexandre Bounine <alex.bou9@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Frank Li <Frank.Li@kernel.org>,
 Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Michal Simek <michal.simek@amd.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>
Cc: linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sound@vger.kernel.org, imx@lists.linux.dev, Frank Li <Frank.Li@nxp.com>
References: <20261106-rio_sg-v1-0-bc54b4bd8c95@nxp.com>
 <20261106-rio_sg-v1-2-bc54b4bd8c95@nxp.com>
Content-Language: en-US
From: "Gupta, Suraj" <suraj.gupta2@amd.com>
In-Reply-To: <20261106-rio_sg-v1-2-bc54b4bd8c95@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PNYPR01CA0055.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:2b5::11) To SA1PR12MB6798.namprd12.prod.outlook.com
 (2603:10b6:806:25a::22)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR12MB6798:EE_|SJ2PR12MB9086:EE_
X-MS-Office365-Filtering-Correlation-Id: c7edd7a2-27fd-4ea1-6ada-08df3e33d13c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|23010399003|921020|10067099003|11063799006|4143699003|56012099006|261021123027099003|261021121427099003|261022105027099003|261009223027099003|261026140227099003|261028144727099003|261102123227099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: U1wsMF1FhUWprpAGuo/Ix4YWsEEo9dXoh9HIzhluqr7tD06kjM2ryV6ArFFU/t0p2+bx8UIYjoNjs81hARVlw2MSF8+dkKVWY9rKaa6C0VEocT8HVDN5ohQuXtckB0IIZW3ykc1lOI+3C8iDiV4r5e0L0cwPFapIG03xc3uN6eNTgnWXMG/qe26dJyihkckLEnFHYf2/ujoITEvjeEnubJMNHKcTy3ltTBQINjMY5A2vlUrtOW28LddyDsXwwW/2vAJijrmGyi7Eai8edep0Z3KmYj+xSBX6RwA1B31m6Y1ed6iK1wykEVkbAl8l6WvRmq6Wv2nFU4w1Ojrk10S6covXh4Q0qqa0g77Lv6MGgdR+u3vAUqqepJUwhA668q9wKPaWv1GGKDsOt2t77AuqbzH3wherWNYf+9MnlLR31uNpIv/29Vw/Iucj+q/3uDrE0RvjJxSJgxHgY/XmGDWlpHdXwcOeYY7bN2Cqw5FsgODwio5bPdqzgVqj3/QuhmivtgH3H4+BWBWgawqtozKao+7xuXVy8bj9MeXG6qlolZ0+dPQmSMXGlXhSWYgDbVhkq/K6jlbkCwxCM4ykjBEqPtGNuqXyulsobruGp4dp55TAGGZRpfxbSrs7m7Zx1gqKP0VhQXgERST6UasHfNTcbqK3MmJjurPBk6yOZwKWEiNLi0adpFCVJBLR3E9G4pF72jBhg8Y1V3vrsV9WqoV4JA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR12MB6798.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(23010399003)(921020)(10067099003)(11063799006)(4143699003)(56012099006)(261021123027099003)(261021121427099003)(261022105027099003)(261009223027099003)(261026140227099003)(261028144727099003)(261102123227099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NnVqb3c0WDdwUW9wdWs4dUxETnovYWNHYWkwdzV3eFYyYnRTK0dOdDVuWHVk?=
 =?utf-8?B?dFR1S25NYnN2V0ZmdFpIMWluRTd0RkUxdk9mdHNLTUM5K0NVRzNsYTBHZ2JY?=
 =?utf-8?B?WGorbWNDblZpaWtQcGVDQWNLNS83WXNXeGpNNDlrandRbGV4TmxnMjBrTm43?=
 =?utf-8?B?Z2ROcnNqa2luZmJzRUtZRWd2K1g5eE12QUJqQ2hueURXK0RMTENHR1loamdD?=
 =?utf-8?B?VElFQS9aWk5nUzNXeVJTQ20wZzZvVi81MVBhS2hCS21USkx6cHdUd1orM0ht?=
 =?utf-8?B?NkM3R05PaFN4ZVdTTDRKc1FRd0s4dkN3dDR5QW4wdHd1Z2R6SExWdHVrbU9u?=
 =?utf-8?B?QVRObHFhT3I4eEt0THVxUEdzSGdYOU5McERUY1lWVlFkMGRrb3RMeGpUYUVK?=
 =?utf-8?B?N3VlMHh0NkRDTWlKN05ZWDVvQU5jdW9DNXVyT1AxYk1RajNBNzNTWmZoK09X?=
 =?utf-8?B?TXU5SVppeld4OHRwcGV3cnQrcnVKOE5tZGJqNUtoL05EYS9FdjNXVUV5V0pH?=
 =?utf-8?B?MWhlUXlWeUtjdUJCT3Q2c0UrOEt2ci8yb3REL0dPTnRjUjFUTjFRbHRqeGtF?=
 =?utf-8?B?TENpSVNqbVQvNGpnWVVpZ0JGQnZ1ajVlaGFwRVluMHh0MWtVQ2k5QnlRbFho?=
 =?utf-8?B?WmdKT05tQllRY0VydGpFcjlHMmhLb1NQSnc5bXh3RFlPTkpHMnA5cm55dE52?=
 =?utf-8?B?Q1ZTZklBSHZYSC9kL1dMdGZVZitmVUtFamZ1cjJLN2xSYWZqa1daT3NDNVpV?=
 =?utf-8?B?L3h2Qi82K0ZPck5tQjFaMFR1MnZvSGNYZHZwaXdBN0xmNEFMYjRrOUdWMTJB?=
 =?utf-8?B?dHJ0TWhHcm92VkZYRW5wMEJTVnc5RFhXOTIwS2wyZXdLZWQvRlhIbWlnZDc5?=
 =?utf-8?B?QStOcWF2RkZVSzZyMEh4TkZ6YXBwSm9qZ25MTzBzZEZRMXU4cmhjcDEzU0Uv?=
 =?utf-8?B?eVoyOElhNkZtUVNsVCsrTHBsNDhVbmVrYkdNWGljVW1rZitEVkkxdlNnR3pC?=
 =?utf-8?B?ZXR5c0orMy81dnFHR1hNQkVpVko5TWdDZGdhVVhubWpka1JIMHF0emh0b21D?=
 =?utf-8?B?THZqbUl3NzdRSlpBOGxWWTdXeEdGNWsrZXZzZFF3RklEdzhIMTM1Y1phdzBC?=
 =?utf-8?B?cW9OTGRId1gzQlNCdnFBTy9xQ29NTG5wNjBoR1pXTVQvM25nQ1hYTkV6NU9L?=
 =?utf-8?B?UEp0RmluZU81Vkp5NzRmZFJobUFibE9ONDN1d3FUKzZxQ1kzeGlicEdtM1o4?=
 =?utf-8?B?cHRjV1VTamEzYnZ0YTczNGRaZWxVTlo4Tit0cDBCTUFpenVNaEQrMDF5UGJr?=
 =?utf-8?B?bzdGUHBGbXI3VlUwTkRTTWRCK3FSQXdTSm5ieXhCaVQwQzhPUnF6bWdNL0Vk?=
 =?utf-8?B?VC9jWmFVTmQ4bGRVbFl3alZuQ0V6bFUxZVpnd0I1a1M4NGVLOThRTVJrSUVa?=
 =?utf-8?B?dEdzbUZuYlB1cnI4TkdtaE1nYnFUQmRWcFBMYUFwTzFTcDVoejdLQkVhWjc1?=
 =?utf-8?B?MFZQK3AzTGFTVEFDOVBPbmJTVGxMdytZOG9zSmFzeHFINVFleTJPRHRweUV6?=
 =?utf-8?B?VytlV1pKR3Zyd0svQmF6MlBpUXIxdnM0T3ZCKzJuM0RuekFkM1dnRE1VK29x?=
 =?utf-8?B?OGFKMm1DZWZ6ekZ0R2RMcmhUWHZ3WGJGcHdqcWFFUzNLWHdkSlNvTTBUM1I1?=
 =?utf-8?B?a2RsZlNlNWFqYmF6aXdTRE55VEp2aFRpcGZNVUY1NHZmbGFqcnVvY2xmdUtz?=
 =?utf-8?B?SGRrd1QzR0d1bTIyK2JNRzYydHNWeUVMZWlNZ2xHSlBIOFpweEZqQTFqTmpZ?=
 =?utf-8?B?WHVJaVdxL0k4aXpWTlg0N05sK0RrMVFQY2NYM25NRS9wSFFVVTZaY0tqOVV6?=
 =?utf-8?B?dDB3YTJNVU5GOUF4ZEIycnhtTkMzU0dwMklZRks4ck1TYVl2MnZBZXBPdGlN?=
 =?utf-8?B?MndxazVRbTM2bCttQ2hXdkxUckJGY1dnNzNNc0FxbnZBekJidHlhN1d0TG5S?=
 =?utf-8?B?eHgzZkE2b29kR0pjbzZoS29SdUhNd1RZTjU1RGxtbGhrSGhkSTZIRkY4UlBN?=
 =?utf-8?B?SlVOdkN3czQvZ2w5ZGE0YmRsalBMMWI3U1lORlo0b1I4ZXNDSEkrajJHTkZa?=
 =?utf-8?B?MVI5VW9zeVFrUmdtM2tSNXJ5Y3I1azc4R0VwZEpxUnl2R1FDQmp0azA2MU56?=
 =?utf-8?B?L1gxVUhrQlQvY1AxOXFpRlRFZHVRWS81emVYMFNRNnVHblpKR2lZZ0ljcitP?=
 =?utf-8?B?LzQ4MldNcUJ1STg4SndvZHJpeGhTb0YvbTJaL0JHN2RWY1Q3ZHUwaEdpSXVN?=
 =?utf-8?B?QWpKRXJyWk53b1ZiaFV0M09mTStwSkFzMlFqSk9FQUJ6a2dtNlM2dz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7edd7a2-27fd-4ea1-6ada-08df3e33d13c
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB6798.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 07:33:58.6863
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fxK3nEjJ4iU5PZsQD0vkW2epSwcAgAjkXRRfo8EzWFASeV7Kj/7tdtN0iMREUpSlHOxSGu9g6wPIi+wmSNxyIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9086
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_233406_063465_23884461 
X-CRM114-Status: GOOD (  15.67  )
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



On 11/7/2026 4:13 AM, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> Replace the direct call to dma_dev->device_prep_slave_sg() with the
> dmaengine_prep_slave_sg_context() helper, which handles NULL checks and
> passes the context pointer cleanly.
> 
> No functional change. Prepare to make struct dma_device private to the DMA
> engine.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Suggest go through DMA engine tree. this is only one of 3 user, which
> use context at prep sg.
> ---
>   drivers/net/ethernet/xilinx/xilinx_axienet_main.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> index 7e83c4b5f1931..55d1b39caf7ed 100644
> --- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> +++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> @@ -1006,9 +1006,10 @@ axienet_start_xmit_dmaengine(struct sk_buff *skb, struct net_device *ndev)
>   		app_metadata[0] |= 2; /* Tx Full Checksum Offload Enabled */
>   	}
>   
> -	dma_tx_desc = dma_dev->device_prep_slave_sg(lp->tx_chan, skbuf_dma->sgl,
> -			sg_len, DMA_MEM_TO_DEV,
> -			DMA_PREP_INTERRUPT, (void *)app_metadata);
> +	dma_tx_desc = dmaengine_prep_slave_sg_context(lp->tx_chan, skbuf_dma->sgl,
> +						      sg_len, DMA_MEM_TO_DEV,
> +						      DMA_PREP_INTERRUPT,
> +						      (void *)app_metadata);

After this change, dma_dev looks unused & can be removed. Shashiko bot 
also pointed same.

Thanks,
Suraj


>   	if (!dma_tx_desc)
>   		goto xmit_error_unmap_sg;
>   
> 


