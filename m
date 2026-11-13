Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5513F606A330
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 20:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JKcouhBr;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=d+cdfXfS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=i+27OMhkekJ4x3HweJlHBK+ybJFd/US9qI8SkM8nXRw=; b=JKcouhBr4nbc+DdPGelMBH448i
	QwtgjON9C9ItVV+MSW1lFtDaklHBj92BiaLWIwnJb+zeV9mUnyyUfti7rR0lr9EzJVwGV0VsbPQ/W
	W1N8IZUy5MPYrhKgOLCrQ57O6GulUzCl8iGfdBn1Tdfy5PQOaFJS/4McVHWANLrlwRdFw7ad4BMkk
	+lGs77lcVmgddc/5glpLZgO2bmeB1rwOaEec0ll9wPFrgk5SXGBAGlP9qE82CT/aht2LUKXzD/ed9
	fm5uQ9G8yygd8kyClZHm4D4b2Ydee3Eja/pyPfpI7gSELyA7aEW6Bf01GiSMDIC4Z1LPci+dExAzU
	b+Ez/3pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRxnm-0000000EOET-0Xv5;
	Fri, 13 Nov 2026 20:23:14 +0000
Received: from mail-westusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c001::5] helo=BYAPR05CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRxnj-0000000EOCa-2AIg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 20:23:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=umsZHgIGiv3VMgnBFtSpipxf31KJL9kPKGnr9NipV41cvFuiUJZa1o36Xz+yHurr/uZZdzbawAaexNafmIZoIGRjpEMTUOkjrHe+HPWvG7kIKQzF/S0Y91d4ayfDuNw4ZhhlmNtvAzXy1fri6koTCN7dqa+B27yTMYtO8lGTnOWB69q0lvANx3Goa28hlq4MX9jMEKjoeu4vyNqLlC2cVqYtDeRQdJRNIoWlpbhjldLo7s4rZKUMQGGRMw453/tcxiVuVrKBR1BaVnZQR4iTOyoJ/ZcZQ1AfLLRrrwt/gWvjXuJIdpQmTHxYaoMzLoEhadtPQjqnCK0noRtsY2D8ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i+27OMhkekJ4x3HweJlHBK+ybJFd/US9qI8SkM8nXRw=;
 b=CpOqb8417VIB4X6dvs1zG+s1bt62ofBLIRr6LDDDvDkzWlNqxvjqHfI9KXfdq6T7UXSqkIOwurAtPjl5mgTrnlQUrHge+g/aMEJag/CehmQLe8mVtrfNMHa7X6j8zQBms4ZLxkD0FyvqIbVzUTO225TQoKLeVGZj78FVvCUmuv9JX/uN4uqFXkIlA6nyy9QmPnA86M/X85JMJFRwNXm69HdVqukj9EO0o19NnAcjVHSf1sWYvaLRWrcYkUUK/JmdFsx3mrf4xAPDPiV4piM7mB1vzhAxfQcXAX/sjOjT0V22q4Jo8awVo812dbyTRAvysOlFrZNmJFfFtbHqaRDEjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=oss.nxp.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i+27OMhkekJ4x3HweJlHBK+ybJFd/US9qI8SkM8nXRw=;
 b=d+cdfXfSCy0RqipaZLnuH/GwuOpEvhK+v2eu73KP9tmSoMsnWFW0mMfl9RSEOHrMxGsp+XzBjsR1mkr3xuDuzThNt0rknHhvl5kfi28vwS0k4QUcIt7ggetAo2NBUzV3JP9vob6EunERpPRQr7Wf1DeFekQue7v5XPEvE3TVV3rh3CX+UEK0p7f2zwMswur/FifrbeQSeQagiKdM03KT5b7NdSwcauHCeNUV7vB4IfKKVBmJzzPFTnFD5068o/X78RvLZG4bwoDvH3bclHlWjRIq3BvtwHD8vWS2/zIPEJxTStsSSVExeHUWyGh1ghd/AEg+L/LKzaEBGdyBhnDPJw==
Received: from DS3P221CA0009.NAMP221.PROD.OUTLOOK.COM (2603:10b6:8:45e::14) by
 CYYPR12MB8989.namprd12.prod.outlook.com (2603:10b6:930:c2::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.8; Fri, 13 Nov 2026 20:22:56 +0000
Received: from DS4PEPF000001C2.namprd21.prod.outlook.com
 (2603:10b6:8:45e:cafe::42) by DS3P221CA0009.outlook.office365.com
 (2603:10b6:8:45e::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.22 via Frontend Transport; Fri,
 13 Nov 2026 20:22:55 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.118.233) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 DS4PEPF000001C2.mail.protection.outlook.com (10.167.23.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.0 via Frontend Transport; Fri, 13 Nov 2026 20:22:55 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Fri, 13 Nov
 2026 11:01:08 -0800
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 13 Nov 2026 11:01:07 -0800
Received: from nvidia.com (10.127.8.14) by mail.nvidia.com (10.126.190.182)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56 via Frontend
 Transport; Fri, 13 Nov 2026 11:01:06 -0800
Date: Fri, 13 Nov 2026 11:01:04 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Robin Murphy
	<robin.murphy@arm.com>
CC: Will Deacon <will@kernel.org>, "Joerg Roedel (AMD)" <joro@8bytes.org>,
	Jean-Philippe Brucker <jpb@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>,
	Thierry Reding <thierry.reding@kernel.org>, Krishna Reddy
	<vdumpa@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Peng Fan
	<peng.fan@nxp.com>
Subject: Re: [PATCH RFC v8 4/9] iommu/arm-smmu-v3: Use a per-domain CD table
 for non-PASID streams
Message-ID: <avdecPsIeaABLGkN@nvidia.com>
References: <20261113-b4-smmu-shared-sid-ver8-v8-0-587307a77f3a@nxp.com>
 <20261113-b4-smmu-shared-sid-ver8-v8-4-587307a77f3a@nxp.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261113-b4-smmu-shared-sid-ver8-v8-4-587307a77f3a@nxp.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PEPF000001C2:EE_|CYYPR12MB8989:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e8e376b-ed0f-47f8-c729-08df41c3e68b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|23010399003|1800799024|82310400026|36860700016|10067099003|4143699003|11063799006|56012099006|261026121527099003|261022105027099003|261026140227099003|261028144727099003|261021135927099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 0JB86hD2sBA/BFhOB2jGaGlFl7/z/8W+rw0hDBtS2x5sObDtqrK9B0EXVuyVdAqMjmL5o1t9YUsRcthsHFnUynxCDgs7awJ6mj2FzkIlIRD7ezD50rXj+dj11nb1ricVYJ7IkmOsJ7l8A3VxXHa9lBwjjV2diG2zjCLcyzjVRiJL1p6bktDEMCchciGdBfO3r90CVB4mEHg1PB/Kn5qIbtJpCl4kzONA1ihW9AZ+F5m9eSvRaxmDe+no0MkBWSN0C7rTolurBLmbeIBgHABhVeNq58dXnK2H3S3fzKS+asQjHVhjTA+y/FyylVRpYMPIrJp8+WQEmDelEpv8ZIqI6Aro0IonRzczePXbh1mupk8ufX/SXYFpyPoCeJ8eFE/S+LCw3Ym9jSNPLYIcckAJQxxh8c1uBqa7p95DjH0agSDgDXq1vbg8Njbgk5W+aFO0k4nkmyPHQ4ZKh71TH0S8bNzgbdUzQkvy2YtzEauyapwR/zdIa3EXiZXvMQJkIc2DWDZKnAHnwTMXw2eE4mo8Z1JmAZw9NJ4IrwhgirA/0uNI805htoWkmGo+LpHCHnYUPX6EAC0NTwIPu+h+xsWD4X5zI37jDHG5IgI5PH2mjhFxI6aaLycA5Zu0wBi7X3sj6qIw1vyjstZQgi/aZDr1L9e4mL72eXLj8rKHqU+F8DY/qBoAL8gTm7/CQZyuOqF/xs/2mY/JOMhId1LJo66RIA==
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(1800799024)(82310400026)(36860700016)(10067099003)(4143699003)(11063799006)(56012099006)(261026121527099003)(261022105027099003)(261026140227099003)(261028144727099003)(261021135927099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: fYBD6h5y8Ilp8qaOB/RFKma+mGYXn7deM0nC4WQBlqeeaPswSbIneKPj8hV1NK/X8nPCI9lQRhxPQPVspUhXE/ry9Udianh34uCyQ0B6y0cBMt5xSniWsJicZDJBQ+ftYJkfwJPc8YDfkw4jeviF13bMl2yLsRuUBedBFbugcna7U4x82qnq21tRLUl0hzsSjzyouNrQbJXuUodJMZH1i1UOR7WJhAhOYM/D/KeYjG7hcgT4a1uXW12OTQBeh3JT0letDEwsg324zi9u6g0/P5fsYUmGY3ZHSJpsYuuRywIqk+oXLHIt5Nmpb9EkI5AE5cErlA6DAz0rFPwz9IFYxjMjRv2J3Gd29W6abh0W9C1Qzf6Q7ny4B4rFcbiy+s63sX8fAoiTaKxKL8zIWAnyTz1+FffxPwuPD55Usz5JZgfMl1d+rmiloaXF91+AhGUa
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2026 20:22:55.1070
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e8e376b-ed0f-47f8-c729-08df41c3e68b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS4PEPF000001C2.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8989
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_122311_577757_6C4F8651 
X-CRM114-Status: GOOD (  26.63  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 13, 2026 at 09:27:16PM +0800, Peng Fan (OSS) wrote:
> +static int arm_smmu_alloc_cd_ptr_l2(struct arm_smmu_master *master, u32 ssid)
> +{
> +	struct arm_smmu_ctx_desc_cfg *cd_table = &master->cd_table;
> +	unsigned int idx = arm_smmu_cdtab_l1_idx(ssid);
> +	struct arm_smmu_cdtab_l2 **l2ptr = &cd_table->l2.l2ptrs[idx];
> +	dma_addr_t l2ptr_dma;
> +
> +	if (*l2ptr)
> +		return 0;
> +
> +	*l2ptr = dma_alloc_coherent(master->smmu->dev, sizeof(**l2ptr),
> +				    &l2ptr_dma, GFP_KERNEL);
> +	if (!*l2ptr)
> +		return -ENOMEM;
> +
> +	arm_smmu_write_cd_l1_desc(&cd_table->l2.l1tab[idx], l2ptr_dma);
> +	/* An invalid L1CD can be cached */
> +	arm_smmu_sync_cd(master, ssid, false);
> +	return 0;
> +}

This patch is a bit too big. Move this into a prep patch please.

> @@ -1793,9 +1801,22 @@ static int arm_smmu_alloc_cd_tables(struct arm_smmu_device *smmu,
>  
>  static int arm_smmu_master_alloc_cd_tables(struct arm_smmu_master *master)
>  {
> -	return arm_smmu_alloc_cd_tables(master->smmu, &master->cd_table,
> -					master->ssid_bits,
> -					master->ats_always_on);
> +	int ret;
> +
> +	ret = arm_smmu_alloc_cd_tables(master->smmu, &master->cd_table,
> +				       master->ssid_bits,
> +				       master->ats_always_on);
> +	if (ret)
> +		return ret;
> +
> +	if (master->cd_table.s1fmt == STRTAB_STE_0_S1FMT_64K_L2) {
> +		ret = arm_smmu_alloc_cd_ptr_l2(master, IOMMU_NO_PASID);
> +		if (ret) {
> +			arm_smmu_free_cd_tables(master->smmu, &master->cd_table);
> +			memset(&master->cd_table, 0, sizeof(master->cd_table));
> +		}

It'd be helpful to have a line of inline comments stating why this
is needed here.

> @@ -1830,6 +1851,12 @@ static void arm_smmu_free_cd_tables(struct arm_smmu_device *smmu,
>  	}
>  }
>  
> +static int arm_smmu_domain_alloc_cd_tables(struct arm_smmu_domain *smmu_domain)
> +{
> +	return arm_smmu_alloc_cd_tables(smmu_domain->smmu,

Hmm, that's not good. We are trying to decouple smmu_domain from an
SMMU instance so that one smmu_domain can be shared across multiple
SMMU instances.

Tying one instance to a domain is apparently going against it..

Instead, we would need an {smmu, cd_table, refcount} list. And it'd
make thing more complicated than letting master own CD table as-is.

Not sure if it's still worth doing so. Robin?

> @@ -3971,15 +4058,23 @@ int arm_smmu_set_pasid(struct arm_smmu_master *master,
>  	if (smmu_domain->smmu != master->smmu)
>  		return -EINVAL;
>  
> -	if (!master->cd_table.in_ste &&
> +	if (!((sid_domain->type & __IOMMU_DOMAIN_PAGING) &&
> +	      to_smmu_domain(sid_domain)->stage == ARM_SMMU_DOMAIN_S1) &&
>  	    sid_domain->type != IOMMU_DOMAIN_IDENTITY &&
>  	    sid_domain->type != IOMMU_DOMAIN_BLOCKED)
>  		return -EINVAL;
>  
> +	first = !arm_smmu_ssids_in_use(&master->cd_table);
>  	cdptr = arm_smmu_alloc_cd_ptr(master, pasid);
>  	if (!cdptr)
>  		return -ENOMEM;
>  
> +	if (first) {
> +		cd0ptr = arm_smmu_master_get_cd_ptr(master, IOMMU_NO_PASID);
> +		if (WARN_ON(!cd0ptr))
> +			return -ENXIO;

You don't need "first" at all, given ...

>  	mutex_lock(&arm_smmu_asid_lock);
>  	ret = arm_smmu_attach_prepare(&state, &smmu_domain->domain);
>  	if (ret) {
> @@ -3995,7 +4090,30 @@ int arm_smmu_set_pasid(struct arm_smmu_master *master,
>  	cd->data[0] |= cpu_to_le64(
>  		FIELD_PREP(CTXDESC_CD_0_ASID, smmu_domain->cd.asid));
>  
> +	/*
> +	 * The private CD table is taking over the STE now. Make sure its
> +	 * default substream matches the RID domain before the STE points at
> +	 * it, since non-PASID traffic follows CD[0].
> +	 */
> +	if (first) {
> +		if ((sid_domain->type & __IOMMU_DOMAIN_PAGING) &&
> +		    to_smmu_domain(sid_domain)->stage == ARM_SMMU_DOMAIN_S1) {
> +			struct arm_smmu_cd cd0;
> +
> +			arm_smmu_make_s1_cd(&cd0, master,
> +					    to_smmu_domain(sid_domain));
> +			arm_smmu_write_cd_entry(master, IOMMU_NO_PASID,
> +						cd0ptr, &cd0);

... there is only one place using the cd0ptr.

> @@ -4015,35 +4133,61 @@ static int arm_smmu_blocking_set_dev_pasid(struct iommu_domain *new_domain,
[...] 
>  	/*
> -	 * When the last user of the CD table goes away downgrade the STE back
> -	 * to a non-cd_table one, by re-attaching its sid_domain.
> +	 * When the last user of the CD table goes away, switch the STE back to
> +	 * the RID domain's CD table (S1) or to the native bypass/abort STE
> +	 * (identity/blocked). Do not call attach_dev() for an S1 paging domain:
> +	 * this is a teardown path where allocation failures cannot be
> +	 * propagated. The private CD table is kept allocated for reuse and
> +	 * freed when the device goes away.
>  	 */
>  	if (!arm_smmu_ssids_in_use(&master->cd_table)) {
>  		struct iommu_domain *sid_domain =
>  			iommu_driver_get_domain_for_dev(master->dev);
> -		bool ats_always_on = master->ats_always_on &&
> -				     sid_domain->type != IOMMU_DOMAIN_BLOCKED;
> -		bool downgrade = sid_domain->type == IOMMU_DOMAIN_IDENTITY ||
> -				 sid_domain->type == IOMMU_DOMAIN_BLOCKED;
>  
> -		if (!ats_always_on && downgrade)
> -			sid_domain->ops->attach_dev(sid_domain, dev,
> -						    sid_domain);
> +		if (!master->ats_always_on ||
> +		    sid_domain->type == IOMMU_DOMAIN_BLOCKED) {
> +			if ((sid_domain->type & __IOMMU_DOMAIN_PAGING) &&
> +			    to_smmu_domain(sid_domain)->stage ==
> +				    ARM_SMMU_DOMAIN_S1) {
> +				struct arm_smmu_ste ste;
> +				struct arm_smmu_domain *sid_smmu_domain =
> +					to_smmu_domain(sid_domain);
> +
> +				mutex_lock(&arm_smmu_asid_lock);
> +				arm_smmu_make_cdtable_ste(
> +					&ste, master, &sid_smmu_domain->cd_table,
> +					master->ats_enabled,
> +					STRTAB_STE_1_S1DSS_SSID0);
> +				arm_smmu_install_ste_for_dev(master, &ste);
> +				mutex_unlock(&arm_smmu_asid_lock);
> +			} else if (sid_domain->type == IOMMU_DOMAIN_IDENTITY ||
> +				   sid_domain->type == IOMMU_DOMAIN_BLOCKED) {
> +				ret = sid_domain->ops->attach_dev(sid_domain, dev,
> +								  sid_domain);

I commented in v7 that attach_dev shouldn't propagate the ret..

Although your patch-9 clean it back to the right form, I think
there should be a way to prepare things cleanly so that you can
make a change here in one shot.

Nicolin

