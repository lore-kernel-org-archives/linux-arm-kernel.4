Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A6E606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 19:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2HDBtjnP;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=DpgSesyK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=0d+0nbN7CSiyO7Qa/vyvuNKO9Cq3K2ZGFErHSZUY/iI=; b=2HDBtjnPAFUYJMvsFcHKlfxzRZ
	jXH/C0p3z4fyfu4BBkLififFzbRhY+YdXOMw/sR87Uz65Lp7duyjKV6HzhngXwDPe5AtJZFGOZqWw
	mtUgyOwwIMpKuLHylRPEBq/ujtv4G6Xb2OOg8qyocRhUHcEQwJQrNAJFQmnazYPVa6dxnGXldwC98
	JX1NHSaWeC8bbUyYK3XRcYxTVns1EWtL7mj4tqmHgLfW0uIbnvwRMzhr6wyua+I3R65qLlEdEg0n2
	I1ZWqR/yQ0MLBYeVr6xbV4xsNmK2GENpLGAY9r8YfFvf6FCJMKtNjDPJVs27ZvlFsUzyw6nOgcs7w
	9jC8Du7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPPsr-0000000DYDI-17Sh;
	Fri, 06 Nov 2026 19:45:57 +0000
Received: from mail-westusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c001::5] helo=BYAPR05CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPPsn-0000000DYCs-2n2d
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 19:45:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=auIsjh8I0mS/AQ4dsIi+og3vn0nIdUO2j3j6yQkbhQXkc9AqS2WtuSY0/Xly5uCPUNuNw+DJRUtWvJKWLA5Ea5cnIdo5gB9WYu8ID3wwdLLk/+SkBh+ULS3POH1hook2PGtQYWZw62gWP0xI0fbmZCGR74jzGBn5eofzCct0MuE6SZndVCDW9R66FdqUOQTa6/tMc9q+QAZiA0seAmYZmTz+ZEPHIQSD1547pBOlkKhwuIQ3747tKgFIAvxYFcIwxe7YxZBZLbQhoqNk8Ct3ey17L/gP6QZ9pw3TzRSn3MWyHP/sHexT8fK0HTxqz3fND0q4Ug8kILDsqfZWEh4G8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0d+0nbN7CSiyO7Qa/vyvuNKO9Cq3K2ZGFErHSZUY/iI=;
 b=GUK7vJFGty6yWksUvKJTjQTOwCjZEjKHy+a2AfaNlhRhUXpG73E+D/Hd6yJCPkfDy0SIPm9QuxGtlf1S9pk03yfbj6E2at6euq2rUgRBR5kGLqMcssFFGztltgGCox9KNb07kWrKdNQA6zlXwLrkcByTd6knBGYE6McEONgFtd8nlMkSEQL1esmRuX/Wjp0J6K4npcrvpYJOMn6ZP1TRDAPgXRBwu39Nam571vV7N9Mqzhpn6K1yC6GfT437wL/ps6313w6uNEdQ9af1IOhOTVl2FLdyPDJJKLnYxDXCEnHlH28wZ5UQ+1fGKsZc27ByHctZWbE5dPLOUTxerOLsxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=google.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0d+0nbN7CSiyO7Qa/vyvuNKO9Cq3K2ZGFErHSZUY/iI=;
 b=DpgSesyKDzpjmyOz1oKAuNpFAiSOrwIu7LSryBqqQvCi5U5aFKvY+A6qj+B2Pu/zGOtkcTUrESuNzv1isTW4wEg84zWUCyt1LOkXOsd0QzbCCIWPoGcFW92I6VO9em8CmZkfjNkbvYksOFtJEkDUxIV9RyY7NRJg/d8qc97MDZQf5kdGTl//ciFZp75KnBGACyf7x4Os1KLpJyXUJSK5lMhNUam7xuiT48IGKOifKt0y8lRrDM9nGg37E7XY/SkxmKpDEBZqRMr3A0OSc9BKmBidu5MFSbSYLtH/xMXfJbNUoSEqTHfuVE8DsZXQDTdawCOCDc6oxAQBE3iKOGsGPg==
Received: from BN0PR07CA0007.namprd07.prod.outlook.com (2603:10b6:408:141::24)
 by BN5PR12MB9461.namprd12.prod.outlook.com (2603:10b6:408:2a8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Fri, 6 Nov
 2026 19:45:46 +0000
Received: from BN3PEPF00022BC2.namprd05.prod.outlook.com
 (2603:10b6:408:141:cafe::36) by BN0PR07CA0007.outlook.office365.com
 (2603:10b6:408:141::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Fri, 6
 Nov 2026 19:45:46 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.118.232) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 BN3PEPF00022BC2.mail.protection.outlook.com (10.167.248.213) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 6 Nov 2026 19:45:46 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Fri, 6 Nov
 2026 11:45:26 -0800
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 6 Nov 2026 11:45:25 -0800
Received: from nvidia.com (10.127.8.13) by mail.nvidia.com (10.126.190.181)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56 via Frontend
 Transport; Fri, 6 Nov 2026 11:45:22 -0800
Date: Fri, 6 Nov 2026 11:45:19 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: Mostafa Saleh <smostafa@google.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<kvmarm@lists.linux.dev>, <iommu@lists.linux.dev>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <maz@kernel.org>, <oliver.upton@linux.dev>,
	<joey.gouly@arm.com>, <suzuki.poulose@arm.com>, <yuzenghui@huawei.com>,
	<joro@8bytes.org>, <jgg@ziepe.ca>, <mark.rutland@arm.com>,
	<qperret@google.com>, <tabba@google.com>, <vdonnefort@google.com>
Subject: Re: [PATCH v9 17/25] iommu/arm-smmu-v3-kvm: Shadow stream table
Message-ID: <au4uTxliZFv12Bqn@nvidia.com>
References: <20261015200903.2735565-1-smostafa@google.com>
 <20261015200903.2735565-18-smostafa@google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261015200903.2735565-18-smostafa@google.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BC2:EE_|BN5PR12MB9461:EE_
X-MS-Office365-Filtering-Correlation-Id: 089db5eb-21d5-4e5c-1ec4-08df3c3e8d36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|7416014|1800799024|82310400026|36860700016|11063799006|4143699003|56012099006|261021135927099003|261009223027099003|261026121527099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: GgFWkDZ9eiCTOvAfdDW8CEWmXIPm52inRCj8gcgtMroSjQv72Q5j1SXHafEu06ovKUl7KeiPWktEJGZr4Z09kPHz49Hc30mO2LvU8qp+XEzn0nMWm0v0jTE+ttVsrYIvXrQYickky3M63uTPQlfEakaaZxQUwpgqut/uS10NBkUpFcn7NhDBAgo5x79Rj/9sK8DToD3PMuOdI9sPlx9Hm9cJ2BcH4jb6ZSwj9hbuXebJKF85OHl+GS4brC3NhuzvqjLgjQ/DxUkz+UuLUj3ejw+npX5+JwIhCOxHX53o3EPYUGYPo94ZpHZgWSh53UjG2NKSp50/FvXAmh3MU5xNrVd4TBsnigaBnqJsUv94RrQPEPRjho9zXnK5YR0hRTYir38OgL0M9gz1qP1ywGNIODN2yR1zQ3a/X4pjPBWHreoqTMnfazn1WJMzCvgPlGXwBueCBzTH5Se+MK49/0HT9ToefSZsYJuLyIF7b2w8rnhcijguiiGugRIU2q98AUQkNHje/aL7pRAYz9Koi/z9ekcpT5XM/y/pBI45n6zMxVac7LoUcDoXCf11nET/91pRsIjc3/W/1FPBwPbXZ+IE/rgawdHbmufVg3Ahlo4419iphh44w4tcSk2souWUfw6mWxHt1y8PGCarCVO+EtqfX+12dFttVi0wJLH38MK+SlLHV4WJdhKrQ0EwOcmwnQg2KRXEr1YPGVg6FJXUjT8+qQ==
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(1800799024)(82310400026)(36860700016)(11063799006)(4143699003)(56012099006)(261021135927099003)(261009223027099003)(261026121527099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: WspYspq/lkfNwDQ0BCr6C/KXhr7yVMyBklVoUb8kMSKIWM+MM9AGJh4go+9GZD0l2tfOyHnHTE4y0rhyn+VePd16Tmme83YqJ50kDYpM0RrFzFv+JNm8gjr5Aaq8n8MzCkEklZ1bG49jH7wOsTm4Yyp3y36NyIzgjUW/kCMcsH3pw6jGiGal/FFn/+wFOQoTZ7x8UI9TfgWKheNbYZmfQCwm/FF2LrEsl+z/1LZGpCdauWCdWup+WXRf4M7XJV0ugsfP4rGz5mhjUoJ0m5ZZALnwf+l8bWyrslfIlhT3EU8h/X+c2kQ+hQX8uSTuFC8RJUcX0OZyYhokgmlrDbplHATS5m9fFod5WXfX+tEGcOKQfc8rwwIXm3AG3Z5on/kbML65Q9NI4tmTElPj+WqaQnA6rX09fwdZKBttD4GYUWEpkXV6rpwLz50Te9D0rW3I
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 19:45:46.2772
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 089db5eb-21d5-4e5c-1ec4-08df3c3e8d36
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF00022BC2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN5PR12MB9461
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_114553_731043_4DE0E721 
X-CRM114-Status: GOOD (  15.35  )
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

On Thu, Oct 15, 2026 at 08:08:48PM +0000, Mostafa Saleh wrote:
> @@ -538,6 +655,7 @@ static bool smmu_dabt_device(struct hyp_arm_smmu_v3_device *smmu,
>  
>  		if (is_write) {
>  			bool last_cmdq_en = is_cmdq_enabled(smmu);
> +			bool last_smmu_en = is_smmu_enabled(smmu);

It'd read better with smmu_was_enabled and smmu_is_enabled.

> diff --git a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.h b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.h
> index 3903ae358555..31ab7a0335a8 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.h
> +++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.h
> @@ -27,6 +27,12 @@
>   * @cmdq_host:		Host view of the CMDQ, only q_base, base_dma and llq used
>   * @cmdq_max_shift:	Max shift for the CMDQ probed from HW
>   * @cr0:		Last value of CR0
> + * @host_ste_cfg:	Host stream table config
> + * @host_ste_base:	Host stream table base
> + * @strtab_cfg:		Stream table config as seen by HW
> + * @strtab_dma:		Physical address of the shadow stream table
> + * @strtab_size:	Size of the shadow stream table
> + *
>   * @mmio_addr, @mmio_size and ARM_SMMU_FEAT_COHERENCY are filled by the host
>   * before de-privilege, the rest by the hypervisor driver.
>   */
> @@ -50,6 +56,11 @@ struct hyp_arm_smmu_v3_device {
>  	struct arm_smmu_queue	cmdq_host;
>  	u32			cmdq_max_shift;
>  	u32			cr0;
> +	dma_addr_t		strtab_dma;
> +	size_t			strtab_size;
> +	u64			host_ste_cfg;
> +	u64			host_ste_base;
> +	struct arm_smmu_strtab_cfg strtab_cfg;

The order is different here than the kdocs.

Also, it might be cleaner to group host/shadow/hw stuff separately:

struct hyp_arm_smmu_v3_device {
	...
	struct hyp_arm_smmu_v3_device_host host;
	struct hyp_arm_smmu_v3_device_shadow shadow;
	struct hyp_arm_smmu_v3_device_hw hw;
	// Or
	struct {
		...
	} shadow;
	struct {
		...
	} host;
	struct {
		...
	} hw;
	...
};

Nicolin

