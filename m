Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F479606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 16:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KdtcAKTX;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=GgA9aues
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=BJ2HqAGTJu9w4v2O5g6PU8J8xFhc3iruXNYooPtJp6c=; b=KdtcAKTXod/eHBMGVwljeocGEo
	1G2wPrPRSAW4tT5G2WB7F2GIloMGBFm45AEVtWnPQHRiiwb/XfDLIlO5DtOQMrF/ILxDN/MiNmuZG
	MQrDah156L/F4X028E83Sg7RoxCuXsyb1wQHSdvBgjUM8spGaj79ZfPP2BSw1Bxxk4Gqu/oZz5wSP
	ZvSFZglUnvTRTK7J0MiXNM+yMUenH/eCUHK1UoVMgq2yvkADYXhMArv2JOmvKGjgeQMyPiz+fuxr+
	0S7CQpgq2aU9qV4hmEl0JBaPblGWw7SjkXpeAZML2CKjUZ5KpHPAqfNZoI6wLmAuA4Ejl5zI7TcRo
	T+Xyngfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTLvu-00000006PZx-466P;
	Tue, 17 Nov 2026 16:21:22 +0000
Received: from mail-southcentralusazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c10d::3] helo=SN4PR0501CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTLvs-00000006PYe-1d7O
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 16:21:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UkLjEe1AFNo3e9B/JlgsfMwKnW8JnuSzVSfp2odvvsdGcA5uCTm6SbapElyRSWgRDGgOSGEfFhKkfLZ9SHK0pA5H6sL7sgu+PU5Ti4hDC0mtBmpfenhnufNhqixKsFUNSVm1EVXhxQ7++48bbH7dyfOSBx4B5TQ4Ne102U97DLGGFPShxjomQoaIwvtTAIOcu3L7babFIUe7OMJEO+UryZ+F4acyhmM9e/p2wSrm2Auoz2CODVwwUT+k6Z2berJzrf65/2FyZHcmUHJM/ZC9EWPuo71Dpoe6DNA2ntMV+I2mtgygB10D25Jr4+fv0ejUt/esqX5tQpS58RoApHkV/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BJ2HqAGTJu9w4v2O5g6PU8J8xFhc3iruXNYooPtJp6c=;
 b=n1+fivEG3pOPrwVTeJlQk2i7rADJEnUs2mDdin1XccukKVu3hdMOSjHt04cnr6TFjTQa8bdIAE1PQjoqZCmZXkrx7AtmDQli4X6QhZFGpBIoXYMaHZf16oEJaSe2oIz8XtNodcbZf+nfzLPqjAX2lpitHAL9RxC9C7H2SqBztArddRthgeMn9VQdlkvnbItK2lub0tt1OM9cE9mtdJKXIwMN/AqRTDNymK0mfojWkOn+Fc6rCZSoXHcnwWg/6N5QWoIhqYWJaA1ESZjCsCrmlTdaymmkePfNUThdVTICEbfwDj8Q7boiPDLBV25LZ10ZHNnfXJAdJDPk9Z68ntn3LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=arm.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BJ2HqAGTJu9w4v2O5g6PU8J8xFhc3iruXNYooPtJp6c=;
 b=GgA9auesPnU0VhtW3rDjrQ7EGlgSWalJOww1/b3iQ/WWFdztzLl1e6/MGjnmtHHCB6Ucue0aqaX6EpahGNkAd9KzHlMJNJoEdLbMfTK9HmDGsfMQAw1npc/Tj5IdSXrXIEOUSLNBZcqFIujAzCxepwsgcSZKtXbvvve1ALvrCKPvuXCb4Zr20FAx/jO/qvyoHybm6utshn0GSHl5nmYqsuNlTFjElYugDL7uqeh1bqEgZ4YzEnI47fFgE2J8rOnJiaKfWPx8r6ypa0SaCddwhdRi2EDpy4z12vZGzsl8sDKXB5wJelB22NTLUnC33B5R9m57vZYqJ5gMpAMY5ZybSQ==
Received: from CH5P223CA0020.NAMP223.PROD.OUTLOOK.COM (2603:10b6:610:1f3::9)
 by DS0PR12MB7582.namprd12.prod.outlook.com (2603:10b6:8:13c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 16:21:09 +0000
Received: from CH2PEPF000166C5.namprd04.prod.outlook.com
 (2603:10b6:610:1f3:cafe::1b) by CH5P223CA0020.outlook.office365.com
 (2603:10b6:610:1f3::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Tue, 17
 Nov 2026 16:21:09 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.160) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH2PEPF000166C5.mail.protection.outlook.com (10.167.244.235) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 17 Nov 2026 16:21:09 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 17 Nov
 2026 08:20:44 -0800
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Tue, 17 Nov
 2026 08:20:43 -0800
Received: from nvidia.com (10.127.8.14) by mail.nvidia.com (10.129.68.10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56 via Frontend
 Transport; Tue, 17 Nov 2026 08:20:41 -0800
Date: Tue, 17 Nov 2026 08:20:39 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: John Garry <john.garry@arm.com>
CC: <will@kernel.org>, <jgg@nvidia.com>, <robin.murphy@arm.com>,
	<joro@8bytes.org>, <praan@google.com>, <kevin.tian@intel.com>,
	<smostafa@google.com>, <linux-arm-kernel@lists.infradead.org>,
	<iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>, <jamien@nvidia.com>,
	<kas@kernel.org>, Cristian Prundeanu <cpru@amazon.com>, Breno Leitao
	<leitao@kernel.org>, <xueshuai@linux.alibaba.com>
Subject: Re: [PATCH v12 11/12] iommu/arm-smmu-v3: Skip RMR bypass for kdump
 adoption
Message-ID: <avx+14DDGycsF+LX@nvidia.com>
References: <cover.1793593923.git.nicolinc@nvidia.com>
 <22a06965287dd478ee92f8028ae8ac27e054555d.1793593923.git.nicolinc@nvidia.com>
 <4cf391ff-804a-46a1-8d3e-d0ff8442841f@arm.com>
 <avtYhjyAarKdi33b@nvidia.com>
 <4154cfd8-e877-45a7-bf1a-45e2ae560e93@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <4154cfd8-e877-45a7-bf1a-45e2ae560e93@arm.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF000166C5:EE_|DS0PR12MB7582:EE_
X-MS-Office365-Filtering-Correlation-Id: 33728704-d37c-46a5-1853-08df44c6ca09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|82310400026|36860700016|7416014|376014|1800799024|22082099003|18002099003|6133799003|11063799006|4143699003|56012099006|261022075727099003|261026121527099003|261028144727099003|261021121427099003|10067099003|261026140227099003|261009223027099003|261102123227099003|261021135927099003|261022105027099003;
X-Microsoft-Antispam-Message-Info: wdG/gFlareFoDjtk/O4SsKje50oPJXIYCKoXaFv06dr79K9HLmCRzu87TDOha4X5WqP8Oo8pj+ORud43t4yHKBDogtftx3FFHz01+gHG4oUW2n2BdGnz0qqp2xnSCdOr0vAvP9G7H6KFMl8HEbFPMaPwO05kx6uExpAnwmI/hn7GqZqe7RUX85yGfGaGv3igSeO+Xn6ZNuqkGujkWN+qyC9EaJIf/kRG/C2tXwH3ZqiuDzpcH5K4VyQhVDT4PCt3N5Da25H12wuRI/QQ4TJnlOUaBPffCo9Tgg/KnygBgUyFMUXNy2/kT8ZL6rF6cOvxjGBtvWJv0JcUMF1ylCUwE5e/YqQ+VzQtX1CJYRD9BTL2ouLY04nxPt7RJQUvzcOr/COCPVzO1XrdiBDTE5+cyahi46MeBLc1FQoPg1ros6IJbLTTqt7pl7gx9dU3p+M4luuKfXHqXNwNZjhIHlF7YVu9/XNhc+Tm0ePxUfn9RR6QOXq3PHwfQUVhfROCaw917t+7kww/wL2REiAGHySxiKf+zAwWajbGvZn4cZpog7Fv8G72RFenDktzh0jqFYM/WEWcj+WGzPRKokYJsocT4CAYhxU6djSg0tHTRDSzskiGrrezqw/XIt+cGcqdV61n3HoTysV39De1IMjgKIXrn3Hzs8N4EI/d/tlucPt10g2HfuhoQAqxkRuCoRfeQWiFdr8/LV70XUlwqhv8+gPMaA==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(7416014)(376014)(1800799024)(22082099003)(18002099003)(6133799003)(11063799006)(4143699003)(56012099006)(261022075727099003)(261026121527099003)(261028144727099003)(261021121427099003)(10067099003)(261026140227099003)(261009223027099003)(261102123227099003)(261021135927099003)(261022105027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: eZfCUSrop1PXZ1/2WpmJhbVinj6iQOYr6gYf4rEigXH53Rez5CKMq7HSPJp/kd/hUmiiSqVFJra8jaFKkwW0WT2RuKzKPlpHU50n68412IHVb2tcXPe6uks1vmZzM3h6j3zDdkgoWu9eq2qaXGqZR4bY4SDCyGGoWMdcj6Q5F8bp0zYdfq64LTIwZssIh5AxBG2/GpOQ2cOd2xuk1D9QwQGD1kX9xQ05Y8oLFrkhPq8m+OQs6DtYo6DUpkEsr53RW2Shmej495LiJR/gdkPqGJ1egLUlH0LTXE0i6seQanvkofE4aWO4iYN+5pvU0Y8gNb3yB4z2VnikC7nBqBvx4z/5hu7wrJJ5C0sDSpir9kuYZB9jOgxQXGKFXwWpxzGDXOAmD8jpbvqrxQ2JbBZg1Vpa6C3qpGi+p5a1ahuFtK3XsFDbtufJPXAPNH6o51C8
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 16:21:09.2345
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 33728704-d37c-46a5-1853-08df44c6ca09
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF000166C5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7582
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_082120_431760_21D2BB42 
X-CRM114-Status: GOOD (  16.86  )
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

On Tue, Nov 17, 2026 at 02:34:05PM +0000, John Garry wrote:
> On 11/16/26 19:24, Nicolin Chen wrote:
> > > > adoption keeps the crashed kernel's table live. Rewriting the
> > > > +	 * adopted STE here could expose an in-flight fetch to a transient V=0
> > > > +	 * entry, or change Cfg=translate to Cfg=bypass. Must skip here.
> > > > +	 */
> > > > +	if (smmu->options & ARM_SMMU_OPT_KDUMP_ADOPT)
> > > > +		return;
> > > > +
> > > >    	INIT_LIST_HEAD(&rmr_list);
> > > >    	iort_get_rmr_sids(dev_fwnode(smmu->dev), &rmr_list);
> > > Did you consider if we should sanitise the adopted ste against what
> > > iort_get_rmr_sids() returns? I suppose that would add even more complexity.
> > It's not necessary: both crashed and kdump kernels installed them
> > from the same IORT. If STE is translated, they are mapped as 1:1.
> > It's certainly not worth the complexity.
> 
> BTW, are those regions described in a file(s) in sysfs? I thought that they
> were, but I can't find it, so I guess that they don't (exist).

They would, so long as your system has an RMR in IORT.

Typically, a QEMU guest enabling the nested SMMU should have one
at least.

Nicolin

