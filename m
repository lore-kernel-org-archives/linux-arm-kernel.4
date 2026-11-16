Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28704606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 05:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=h5I85sga
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=qnnYjSElROxlLYRKcwdsAyizSYiPkxc0w3EtC8UVORU=; b=h5I85sgaakyvz1zzcYjGvkAhNu
	p6vCRi7TcpMBNx+/smWQG5n/x2og5fXizHX9rM8evjlPSETDvz4EpVCToJVCImdMEwMIxN5JKzmzZ
	ca0SQ0yAKpgEOHKt6TmSsVNgMQqzS5HpBVzYCMLWhO8G2UWmIxepgpbyLkRvnmX6JaHzVwagXVbTq
	ovA28evlS2DbWa9hWxGmunhRqUQG0EXrmjGGv7/mPexQUbw2bvoc8G9fkQZsFcP/oKtfkPdfi4r1w
	1gzdJnknnvPs+zhnSB79QAg7I/txl7uah4R1IJxmq49g9v8k5f/y3yr3soHGKd5js7JOYX8JnKeHh
	OJ7Z04EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSpjw-00000001C4T-2pNm;
	Mon, 16 Nov 2026 05:58:52 +0000
Received: from mail-japaneastazon11023130.outbound.protection.outlook.com ([52.101.127.130] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSpjs-00000001C3W-0wMQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 05:58:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ho6lKtos4lBY2LweR+Gi5xaqlz4O2O54HfXRCsCFLNMWZxGgdMsQbB4+ld3iZgqGo7uga1zCC8mrvBEqBd+M7StI6jmAH9Lte6K7sD+FNgJlmI2JTrWI0EVjm5S1Qi0NV4ugiQlPZAw+J3hGvmjK7PllXcok6RYyVbc2m/yP1KnSqWfIqdTeY6B4l/rdLkxjc70bnOPlRbcA0iiYuw/8dLPvds0y1nH13kfTEU3Z87uVdJLqYxHfDbVwy+uxobk786JzR2TPrzd62JeecrALmxcbAdnTmlmhSEF60oypjxZCvmXDdC73fyoz+kH+lm59QjB4l1ThFGcKKtm7gurgkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qnnYjSElROxlLYRKcwdsAyizSYiPkxc0w3EtC8UVORU=;
 b=WHlECzlgEToJvdHbHQQaRm3vQ6ZUrwt4AhmIyLhrfy0XJ3JHxYdi5yJH8RTBBj6scRcoweuRPILxrmM0bDO5U/GVD+51cGyY4ySPrEeeBXp7KOGL7l3WIgRXKt7cRrOzN9ex1pxgHEd5U1rifgxfKL4x57c4tKq9xo9gdio5iOs6t4nUO4KveJFb0VBlweYMnt5PYL3oWJafQ3Q6o2AnG3DtleIpACTvWS7oweY1n0mAbM5si0xmYUXWvELSTvf1PZszEQ9pKe6FpcdLuCDrDst3HbR/suRla2WN/BYlQaAyDiEWhkxooOl08wkJuxHgNgylqpsEUyqXlpiFVpahLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from TY6PR01CA0018.jpnprd01.prod.outlook.com (2603:1096:405:3bb::16)
 by SEYPR06MB8193.apcprd06.prod.outlook.com (2603:1096:101:2f4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.7; Mon, 16 Nov
 2026 05:58:41 +0000
Received: from TY2PEPF0000AB86.apcprd03.prod.outlook.com
 (2603:1096:405:3bb:cafe::a6) by TY6PR01CA0018.outlook.office365.com
 (2603:1096:405:3bb::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Mon,
 16 Nov 2026 05:58:41 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB86.mail.protection.outlook.com (10.167.253.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Mon, 16 Nov 2026 05:58:40 +0000
Received: from cix (unknown [172.16.64.42])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 71C2E427EFC7;
	Mon, 16 Nov 2026 13:58:39 +0800 (CST)
Date: Mon, 16 Nov 2026 13:58:38 +0800
From: Cunyuan Liu <cunyuan.liu@cixtech.com>
To: Daniel Stone <daniel@fooishbar.org>
Cc: Liviu Dudau <liviu.dudau@arm.com>, boris.brezillon@collabora.com,
	steven.price@arm.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, gary.yang@cixtech.com, fugang.duan@cixtech.com,
	daniel.almeida@collabora.com, aliceryhl@google.com,
	p.zabel@pengutronix.de, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	cix-kernel-upstream@cixtech.com, robin.wang@cixtech.com
Subject: Re: [PATCH v2 2/3] drm/panthor: Add initial support for CIX Sky1
Message-ID: <avqbjnqaU1kdxDzK@cix>
References: <20261109120902.125242-1-cunyuan.liu@cixtech.com>
 <20261109120902.125242-3-cunyuan.liu@cixtech.com>
 <avLsAlL048MtIX4x@e142607>
 <avRm82TLBe6I6LAD@cix>
 <CAPj87rOi0+T7E7Kge4z-8L9FuCSTt6dCqT+9+YtF3wDkd4vRVg@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPj87rOi0+T7E7Kge4z-8L9FuCSTt6dCqT+9+YtF3wDkd4vRVg@mail.gmail.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB86:EE_|SEYPR06MB8193:EE_
X-MS-Office365-Filtering-Correlation-Id: 0080510e-87e7-4a5d-27be-08df43a6aa25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|23010399003|82310400026|36860700016|10067099003|4143699003|56012099006|261026121527099003|261026140227099003|261028144727099003|261022105027099003|261022075727099003|261021121427099003|261102123227099003|22082099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: YpDBwB5DlkefatVpzQ+qadK4hnJdlc6j6Rg2IQx42cIbALXr5raredX+zXysn0y65GWLBwHfWgRg9g2/TakKvFjIt2PAwGLtmTeulq9YCXsS7N1NDAPijcGl7J7GZRN6qM/gzSFg60fBD1goW5eBu+SRxKdDwb/v44X8XXXWlqiywxZaOfNP2TFNdMoNmHAhnjTC6hHGqQujO1FpWPGeFTcLa0aQxtZGFbXjujAB2XIhU9gdfHH0QUvyYDLc64+FyGbgNRjddGpUznpyAMS3U/Yz5v/CKlNK7DiqIffQhEubBTOV30CEGHEGx1n1SFmy3tczC/73awd8VhMbyqrkBsB8yLP40PknX/JFzSLl8VgYfCImLK/EXg2MX7pxxUIwcLrLCo326+nHZcqpu6zvnXHMJTQItyY39SS3Fxo35GarnJzKTdsd9xdTQOfbF+k3mOUC5UE7CFq5uaUAWM5YNIyXCLdpDXKFX3sdurxIgkbegML/66KvPy2YH06edMKqiQ4ODWyYsRkxzeCWZokGeeML4iB+49Uk+vwpO1ND5XjpQkZ+BUy6nsSkyenZOA2Y9tzxxB0Bz6bBlV+pX/UzXyM99Rd+BU9Q2R0ekjeOqkCk09x5Q+lJqmGRh0HJAuY9WKCzf7NYgizIGlfLPBjYYpIv2DKQFbwbeUgxL/r7RSGUh5sHd5kx/Vo3PzHrV2HU1uHEz4Sev9T0ZaashOSwEQ==
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(23010399003)(82310400026)(36860700016)(10067099003)(4143699003)(56012099006)(261026121527099003)(261026140227099003)(261028144727099003)(261022105027099003)(261022075727099003)(261021121427099003)(261102123227099003)(22082099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: SStTx4UDK6IeYH/rKABHvNJ1whRkL6bbFvSADNCGeXcQpVsucT9eaj/aOEwLGLgTVo4q4N0KGRPFwD8uyA6J0sa03iyi/LY+MHoaefKhbIc5dzSMxQEOGuAf5+Ki6JDzmYRe0bpS/eU9WPQueVHm6JgKeWMEljnes+cUJTpaClffZd4ZJPZ0FJZ1qg+Jch9GnSP+mkRe4di2aH1mb57rIkhgvrhepJTMopbtBfztzCvGB18FkXza0S2F4qePpyzSTrpABGrLvmjXbXg/DQBXe8OcuIfb7sjDYKxJmAKkG8HoLJa4fGZREGJrEVDwN/rMTJgwbaJkr6HioK/kvS+EY6YiMnFX0jrWJ6HKqj19Dru2y1v7lMhKlWihplgKf6EqUgkLtTPg3FP1wtdXxIHpiGbp6jKTH91cWBAu53v4pRfaZuuonhulxBFiFXmhMECP
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 05:58:40.2741
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0080510e-87e7-4a5d-27be-08df43a6aa25
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: TY2PEPF0000AB86.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB8193
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_215848_294802_8F22AD57 
X-CRM114-Status: GOOD (  23.53  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Daniel,

Thanks, this is a good suggestion. Separate read and write policies
make the configuration much easier to understand.

On 2026-11-13 12:24:18 +0000, Daniel Stone wrote:
> > > > +static const struct panthor_sysc_config sysc_config_cix_sky1 = {
> > > > +     /* Sky1 needs these SYSC_ALLOC policies for correct display of GPU output. */
> > > > +     .alloc = {
> > > > +             0x00230000, 0x00000023, 0x00000000, 0x00000000,
> > > > +             0x00523222, 0x00523200, 0x00000022, 0x00000032,
> > > > +     },
> > > > +};
> > >
> > > These should not be in the driver but in the device tree bindings. If you extract
> > > the system cache code into a separate patch we can have a proper discussion there.
> >
> > I will move the eight SYSC_ALLOC values into a DT property, such as
> > arm,sysc-alloc, and submit the system-cache support as a separate patch.
> 
> Whilst doing this, please break the properties out. At the moment,
> it's written as 32-bit groups of 4 source+RW pairs. I would much
> prefer to have groups of [<sourceR, sourceW>, <sourceR, sourceW>, ...]
> than just the raw register values to be dumped into SYSC_ALLOC*.
> 
> FWIW, I agree with everything else Liviu said. I don't have a strong
> opinion on skipping out devfreq if OPPs are not present vs. exposing a
> single fixed OPP from the clock provider, but the former does seem
> better for me.
>

I will change the DT property to use <source-id read-policy write-policy>
entries. I will add an explicit source ID so that the DT only needs to list
sources with nonzero policies. The Sky1 configuration would look like this:

  arm,sysc-alloc = <2 3 2>, <4 3 0>, <16 2 2>,
       <17 2 3>, <18 2 5>, <21 2 3>,
       <22 0 5>, <24 2 0>, <28 2 3>;

When this property is present, the driver will start with all source
policies set to 0 (L2 allocation), then apply the entries from DT. Sources
not listed will keep policy 0. If the property is absent, the driver will
leave the SYSC_ALLOC registers unchanged.

I will also add checks for the GPU architecture and supported read/write
directions. Unsupported directions will have to use 0. Duplicate source
IDs, out-of-range IDs and invalid policies will be rejected.

Would this format, with an explicit source ID added to the read/write
pair, be suitable? I will submit the system-cache support as a separate
patch, as Liviu suggested.

Thanks also for your feedback on devfreq. I plan to use the generic
no-OPP approach based on Panfrost, unless there are further concerns.

Best regards,
Cunyuan

