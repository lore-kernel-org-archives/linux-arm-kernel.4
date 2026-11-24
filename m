Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61FA3606A336
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 15:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PxdKvhv1;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=YvymbGkZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=//Ui4esF1Voj9IyBK6IL/pQOihG6TXNtfV1kLTKEK3I=; b=PxdKvhv1TSffsKzFjfz4ecg+t8
	mYUO32LobG1ucc8XyVibmyitKoyVgry7ATbczpeat405XD3qincQVimqyT+lUwf4puv67ZNKbhqIZ
	flyxjWfcdPs8ZKlpBFqyWLAP3zrPYN3gFGtWtZFBWNeQboJceY8yTZFEfOTuIo526XW8scVMzkVZR
	QmeX3DUePe8l50DTklhF8cpO7o09w4EnTg5QqnvqyZUqjuHSSlLGA07YGrXjQKQEo1eK14ix6STG4
	542vxHlgnm4Fysq5YjT6CgGHWhp0Bp2MCWga0NPo2njE3D0SI32ULpq7q7Em2pBsi2hjB0z3KU8J/
	HEKtJ89A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVs8h-00000006qi9-2X2O;
	Tue, 24 Nov 2026 15:08:59 +0000
Received: from mail-westusazlp170120002.outbound.protection.outlook.com ([2a01:111:f403:c001::2] helo=SJ2PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVs8e-00000006qhQ-1Wfl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 15:08:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZXtNq+Bhimer0mfkysmjs5Bsz2bLAc1EP+28773a7o5jucEyoEvPGsoEm8JHB2N3ZNgq05i7SGAYKxsWPV/K3mRifDqjR/v8c/x17+UTr4DiQ+kC4HK7QhIkrKHHbD/iFB0q0juSrEaxYFOkBLVzuzA7OOHidtzVDgEp6OXltfMgk6mdT8mAGHnHkPsx07XjodEBV36id2blkvvp91ZNeRjVvxYdoQ2mTm5EWFV07J3EJ3wALFi0FWq+v8Wh7uGFizJ1B63v17qaheCy2EVKfdIesliSuEXbRjlp5xjMVdVboseY5n/AWwcwMP8Mo4yRvLhJGm2AbbxFrhpY2iSSSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=//Ui4esF1Voj9IyBK6IL/pQOihG6TXNtfV1kLTKEK3I=;
 b=gsQXeynOZTsu3NWAm0+lunTxgdmNeqCseSAFgUxmZeafufwfeaaDdShaqzu0X2Hk8/9wVPcIgZdLk6JiLPRdyKdnl3NqyBK1JO/kXwvN7/3D1GSbChUzS5f8PbocHeGWhNlJu6xMcRmYDPIBSBDIQ4v8iSBeRO1tpjMnUaZV2IyeQsTZC9C/qWI5nv2gLQdfoPmOGNJlVeNkreKLjsVcdRIl+k+H5KuNlOrIRb9X5cnv8oiiiMKdua+C4ovnzDKs63UpGBcu/y3elclrdLWTNq/r+YnIK/cvtMWO5KRYcAknvixBtH50QzPJfIROr/STSfjtqzeKt68TC3AsRkUEXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=//Ui4esF1Voj9IyBK6IL/pQOihG6TXNtfV1kLTKEK3I=;
 b=YvymbGkZ2Mh/WvZ27BZNPLjE9DfCi+D4UHa+FG6godD+zvkHIO0+hUgKGRDtkakXOQpWOE360JvXOPwTIsRuc8jhtCRyBtVlyGalqmHuWoBcyogAdTyVxy6hDI/EggwOlK2oCm73MJ7SyKrBL1cds3+PEVZvrkYc7bP2YVuqtWgy2GdNjfCys6XEwFqA7oVlxHnFQ55eCD24zdZAf+M1/DcjGo24tUH/FRbQniHfbGQskqEleKW++MFqG1y4kBUASDd+2xS+Gf7uxfqkHJHMSHO7uf3nAZM3eH6oIhjAltXUIPdo83dqdu9tJ8trC9ohGeZBtxrD04dvnMAJ30p9OA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 (2603:10b6:610:33d::12) by PH7PR12MB5711.namprd12.prod.outlook.com
 (2603:10b6:510:1e2::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Tue, 24 Nov
 2026 15:08:45 +0000
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d]) by CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d%6]) with mapi id 15.21.0639.012; Tue, 24 Nov 2026
 15:08:44 +0000
Date: Tue, 24 Nov 2026 11:08:43 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: iommu@lists.linux.dev, "Joerg Roedel (AMD)" <joro@8bytes.org>,
	Jean-Philippe Brucker <jpb@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>,
	David Matlack <dmatlack@google.com>,
	John Garry <john.garry@arm.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>, patches@lists.linux.dev,
	Pranjal Shrivastava <praan@google.com>,
	Samiullah Khawaja <skhawaja@google.com>,
	Mostafa Saleh <smostafa@google.com>
Subject: Re: [PATCH v3 05/13] iommupt/kunit: Skip test configs without
 supported features
Message-ID: <20261124150843.GC8680@nvidia.com>
References: <0-v3-97feb2edfbab+748d0a-iommupt_armv8_jgg@nvidia.com>
 <5-v3-97feb2edfbab+748d0a-iommupt_armv8_jgg@nvidia.com>
 <awUg0O0WQUBcuUvC@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <awUg0O0WQUBcuUvC@nvidia.com>
X-ClientProxiedBy: YT4PR01CA0195.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:ad::17) To CHBPR12MB731189.namprd12.prod.outlook.com
 (2603:10b6:610:33d::12)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CHBPR12MB731189:EE_|PH7PR12MB5711:EE_
X-MS-Office365-Filtering-Correlation-Id: c3d23114-96c9-4089-6269-08df4a3cd4e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|366016|261021135927099003|10067099003|5023799004|4143699003|11063799006|56012099006|261021123027099003|261102123227099003|261021121427099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: imE1cL6nhehvZoDE9WHLuNzt4eXbCO5cU3GlVzB+xmcfGrv/AQaxgZHFkGNZk3hjvgBC5LYhefe2/IXNzpBQ2j3gu9snI40H4gs+4ZmApxnzy2s/0OoqiLPUYbnc4hab9Mtqu/UV87IQg3b+5unWXhniArpkZZr15vFxuoCHlwxHZGzpZMBSoX9W7gnPJTknhKcBlO0ULcrhD2vw3Hei77pHrMzHHgo5SM/VC9EECjWTvIHiaevwz6l4IEaBLsUwGcbt3PW0Ok+bbJApnCRdX0hKNLFzmq3d95hKkhkOxFRSZEmdbx/Eh97pjwfsIRqULG+QnxMOCESKiK7IuVxUTFI8WnJhaLu8MrU0gvfSUlg41ADoZDdDMx+6Lr8zmanghK62rJ5E00+Fsv+mOAQLyzraF1GvSjU9p1dXdeu7LLwf0dRV4fJowSLtqaK0ZUBwBpzB78xW5T2WF4D7pEo8vtqTgUBJ08Azvzb7RLNfWuTvmI0VF2YApcMTzma8wQXoBw/Fx5rKSAQPmVFYFSNKgPzY7B5IgCpJiPG5VmvYQrzak/K2CvE3HubkYDJMW940QIsVdgizO9uldgNKx8HWIfLwNrsybEWIRBG6ipIkoptbDGxX6zMRsb88QDY0gatun4ZSq57pqeLfeQWwTHTF9Cv1MRT3KskpDc2V2t4avpc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CHBPR12MB731189.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(366016)(261021135927099003)(10067099003)(5023799004)(4143699003)(11063799006)(56012099006)(261021123027099003)(261102123227099003)(261021121427099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PpvzhZ1tPrab6AqCVc9D+WH66EmGbh50wGaZs8JhCU8lYSWX9wamwjZlPjnt?=
 =?us-ascii?Q?uIe1piJW+VPjZdcIXNbqAXNWFvsucx4XxZWZpTKpYadTY1/gB+qoX9p7yeKP?=
 =?us-ascii?Q?Y9ihhUg1kjvp8Tqawbo0JJnvIFAgJdJ7AxFLuq8xgNRTvhc9IanYyIrme+P+?=
 =?us-ascii?Q?idMM/p50MqIibdMtqDCvssA3zR870xCIiqk5/nV0ocP6DUd522+BJR9hNNb7?=
 =?us-ascii?Q?dMESos4Flzy8/P8JSGExpr7u++ftpdAKwv0H1rSG3mMyqXVVoKwmK1zbjGdm?=
 =?us-ascii?Q?M5vE8n8jt1gVK8mbmKAmuTMJsP0AR56iouxnMkRyhy3f73o21vQbR7FjB2hI?=
 =?us-ascii?Q?CcZPUA1kHSR/gYr5PdEi5bbARtHDgZ9mNCgsRmrXx9zRNU04/xtOIlensTJd?=
 =?us-ascii?Q?VExWkrt/FdHAPNAMiXcXPY4GPPsKsliPNp3ZzSkBnnD320K/w6bsCG8KJXbv?=
 =?us-ascii?Q?RdBzcnoanRxvcen4ZD7nWaiu4n1t+eRDF3qa0aJtl3Y41i5GMhtHoZKf4F26?=
 =?us-ascii?Q?vqRRk33T0ArBA+pgwSiE0ZRMMZoFNqbUqaSyvrVq1Oydvw4+7iGBW33ATIny?=
 =?us-ascii?Q?FoTTcf/TnbVJlqRn9iRx2du5HLFYGnr4SMVTSRAjAeavwSOh19f00bcIs59K?=
 =?us-ascii?Q?vuGz+fcSy6v8Cq3ggtYMKIhgln3ZYgTu6QDmYbBA1EpnPzaZ0TLBMuuFSOKy?=
 =?us-ascii?Q?7k8aIyS2N+5Cku8PMQIwImckP+iThCDnDpz2879onkT4ZFa+4DWgJaLU6f1/?=
 =?us-ascii?Q?O8mcJ5SYjvpQ4TheILgRC/sMnni8s9asG3+HWRW8nCmadhuw7zrk/+fJr1R7?=
 =?us-ascii?Q?bkVIga4idKUi+Ez5hgZOUlz6G2HBjSQFmdTug1Z7WCbbFsSLHhln6b+5zfrD?=
 =?us-ascii?Q?IkEuyOL+fpBBZQ+v9sEX0+ZgzKiAg8HSIj4J6BHBQahPAPgRVvGcWamNYpjF?=
 =?us-ascii?Q?zXija+kNmf6JlkrsVDaUJKvjuCEE4cNd0OmnUlPXPRrWEdRTH21QlZR0ONr/?=
 =?us-ascii?Q?H4bWg2URNzMFFGb4zCp6wbVaINCLQC0bDMKtWhyCWy1CBljYkT+0AtkGptZb?=
 =?us-ascii?Q?yKbzpFewKJlTau+SJ49w4LWVDZm8d7S/0341Pm92sCOHqmuISFQ7iFHXN01x?=
 =?us-ascii?Q?IZY1ZNT9rI6yKsDysxw4UF7l/fnYIz6aOxkXe03c1UQmnFRiysl/lZx9dV+f?=
 =?us-ascii?Q?f9xY8J+1850d9Fcie3cJ/zDIRIK6qY7wH05iCOzvvMM2HzIQ14pmcy6kioAG?=
 =?us-ascii?Q?ZPYBAO/mYlqPEkVWfK+Z1x7+rMmK1AjU3oCuOLAXVW6f+yHsuOS/4egT7OXw?=
 =?us-ascii?Q?Gxqugb8VvHIgFtrLXNVeL/jV+2Y8agULu+/MpWclsC28Ac02y8dAPJWHtOp9?=
 =?us-ascii?Q?B2cONLJAmz175DGAU8RnSA2TimZb/KRAQPeFO3RDnVjt38gHFuucIhXQ/iro?=
 =?us-ascii?Q?JCL87N4y6jV+tvCoItK5kzVNbmVqgxuaUlN0QAH6ffb6iHtfgUAqo6tmqMrN?=
 =?us-ascii?Q?W74FB6JWBeoRdSCRfKrGD3p2kM/kyVDNWosEyU68OO2y/xsSBs2xw7eZNER7?=
 =?us-ascii?Q?FvpqGkJn9x0nSuPuR9RFWD4cGU3AE+6IcgmcyfVXmteR5qC7d//4yFm6Ig3X?=
 =?us-ascii?Q?neCmL3+luQaaUEOL/gtwzZhhnIo8/7ArPKEC5eRXkW3l3vubazG5LcW0xRzg?=
 =?us-ascii?Q?Vfs9Hof8KYL0kNuL1ZEBiEat7bu/gBcvTuvKaSDrvZ0ezCIk?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3d23114-96c9-4089-6269-08df4a3cd4e3
X-MS-Exchange-CrossTenant-AuthSource: CHBPR12MB731189.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 15:08:44.1101
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8OHujypUyTuiEd7SFgzpX3k7T6nZ2Cs41iV4onAJmrgnMcpduk4qfQZJyzkgXuTf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5711
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_070856_402542_1B944CF0 
X-CRM114-Status: UNSURE (   8.09  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 23, 2026 at 09:29:52PM -0800, Nicolin Chen wrote:

> The leak check reads NR_SECONDARY_PAGETABLE with global_node_page_state().
> That only returns the global counter. Each CPU also keeps a small delta of
> page updates that is folded into the global counter only after it exceeds
> a threshold. So the value can be off by a few pages without any leak.

There is a patch already in my tree to deal with this, this test only
works when you use the kunit runner

Thanks,
Jason

