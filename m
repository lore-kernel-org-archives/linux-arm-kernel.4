Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99D93606A6A2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 21:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=p0jlEHkj;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=iUezxuYQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=pG7yZnWarQPpXBjukJzeEWlVAY8d3OWzkFv46ByFi/g=; b=p0jlEHkjvRrYLW
	pCNgh42/yjnvfQ1CPgRoZG4rCJp9ws5Svj6tu/gsU7Wgz3YI/RXWfyw3GXj0pXIEEJhmutehOPYUu
	UfzP9n3JRH3B1ayO04xE6YTDXulbS02S/l0rTvTbt1xATa1K/PCjaCXbIA5BhdPjDSEGqygvv6thp
	zDrNYye3Q3SIYQxXDXKdEtIMrTdxlw9qCyU/QYQgGKVbywhpkTYhKYvA5KsZjyRqw+CQPOilxiIba
	qwspD+fy0RI3BbDFQfrikaXiHbPECbRT269ZI2HI+20qFG+r+OfS1VyCO6Jmjz4yB2oqedcLkDYTp
	E1DOe/PZzILT8McqEzuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUWLQ-0000000GJi4-0RAS;
	Fri, 20 Nov 2026 21:40:32 +0000
Received: from mail-northcentralusazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c105::1] helo=CH1PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUWLJ-0000000GJhf-1Er6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 21:40:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pA1sss/splZoGeThXExcqehQp/DZ+5GDPr3aLDSfzyNox76DIub/BcZgnnCKovQMLsRHNiAqy5jNWhJNjkwLi7fV0IWRU1lCCKUdnTpVA1I9edfM3hnbMKUNTFnO44sTRjVqURa3baWtYaWN8iNinyH8WsBqncqVwQHDSNah96zgeGm3/OHEK9BqSLjylTdfMIZjvtSMA6cLaUERylcJEdutyMdWI7x4XD9ZubJ7uyKy90mfYg9POwv9RVZJkn6bUgyoweGGdyNVLkOgEnoqsA/PNKij86QKNlWdxYa3ERSwmH0dLhcQ0RhVXxvloBLQIyhoJg4ilPkBHMgmtEzGQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pG7yZnWarQPpXBjukJzeEWlVAY8d3OWzkFv46ByFi/g=;
 b=TuXBNQdbrPnF7RPFF27dFgbspxEawhs2A5p30hFjFM9f/VK9Hktd3TB/f3QFXN4ge8rMInbxeeh1mcu7WxcyXxIAAKPYkeBsWrhmMhGogrSrYVfk0ShgsL6aaakn4tek8hjd8vI/eP3eCDQgObqRB2pY3C9OvkoUizl6qRAtmfSXYbHvilWnJ3UQ7GuR1/C8DmCnSHrAHRttGo38GL/9yE1aQpI2ABbTQ55aRSA6ESHhcVZQwmkhUs5cykL/xw85cC5FQ2le074mK8MPe8P9LwlPV53KRxNSqDNCuNdElW0CTG1hY63ETyMvv/WtgWnpcjBqdCL4ASTYoadYOF8lWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gpxsee.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pG7yZnWarQPpXBjukJzeEWlVAY8d3OWzkFv46ByFi/g=;
 b=iUezxuYQ8mN/CqcyULLDiN3GN8RDdL3c/RP6yLo5CsAz+SALjKoI8JlBU7Rjrxc4Rs5Y3OwPwo0zYbt4BpvhN2rvkjumxURLea2C5VxB5JCaNiJ+gDFrPoEJvsR+6w9jjmTJUfAgHt4VqUvGkUlSReGTb63Pff0m2yrHW6//f9w=
Received: from SJ0PR05CA0202.namprd05.prod.outlook.com (2603:10b6:a03:330::27)
 by MN0PR12MB5810.namprd12.prod.outlook.com (2603:10b6:208:376::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Fri, 20 Nov
 2026 21:40:16 +0000
Received: from CO1PEPF0001885B.namprd02.prod.outlook.com
 (2603:10b6:a03:330:cafe::2) by SJ0PR05CA0202.outlook.office365.com
 (2603:10b6:a03:330::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Fri, 20
 Nov 2026 21:40:15 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CO1PEPF0001885B.mail.protection.outlook.com (10.167.249.244) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Fri, 20 Nov 2026 21:40:14 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Fri, 20 Nov
 2026 15:40:14 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Fri, 20 Nov
 2026 15:40:14 -0600
Received: from [172.19.71.207] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Fri, 20 Nov 2026 15:40:13 -0600
Message-ID: <754c498c-7252-3f2b-54e6-3ebfdf0181ff@amd.com>
Date: Fri, 20 Nov 2026 13:40:08 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 1/1] dmaengine: xilinx: xdma: Fix broken PM
 suspend/resume
Content-Language: en-US
To: <tumic@gpxsee.org>, Brian Xu <brian.xu@amd.com>, Raj Kumar Rampelli
	<raj.kumar.rampelli@amd.com>, Vinod Koul <vkoul@kernel.org>, Frank Li
	<Frank.Li@kernel.org>, Michal Simek <michal.simek@amd.com>
CC: <dmaengine@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	=?UTF-8?Q?Martin_T=c5=afma?= <martin.tuma@digiteqautomotive.com>
References: <20261120172356.5858-1-tumic@gpxsee.org>
 <20261120172356.5858-2-tumic@gpxsee.org>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <20261120172356.5858-2-tumic@gpxsee.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF0001885B:EE_|MN0PR12MB5810:EE_
X-MS-Office365-Filtering-Correlation-Id: a27f15d4-bdf1-47cc-6cb8-08df474edcf0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|82310400026|23010399003|36860700016|261022075727099003|261102123227099003|261102124227099003|4143699003|261022105027099003|56012099006|11063799006|261026140227099003|10067099003|261021121427099003|261021123027099003|261028144727099003|22082099003|18002099003|6133799003|261009223027099003;
X-Microsoft-Antispam-Message-Info: OcHdkLoSSZTIHOlmaXEHqZ3yxag7YdQaYjlEe6ppP9ezF7PF/wSUZq5alYpxzS81a3999oz1I5gHkBREEyzFJ6XJDeGxaPHEGnqKqQmDKkjHnz0BcD3XNHLKEhj1qSMhS9gSW05hUB9fieNBndWMmrJNjGkVtlT7W8mSCEblBvQNvw6e/aDzLvwyDWp59CC1ISipr1o30B1tKKYRa3KcOR5UR3DmV9pq66QcO1lGYRY1XaqWtrE4kTzpPmhdUwKTRngOAESZNBLXlVf2iudkHZNjsGzyN4hlh0ZyL0EVD9kfNPKYaOBSvOpnTdPQ/+cVEYRZE+mmuwmm4enWBQ5BDeAZ18T0TuPFafGnh0tVzMj2iHNO1i+naAv8p3s8iHBfslik6q7gBPWJHw5+ZHld3Dzn++TH98pNs+4QQVJjZPyhdEjemRn53a4p0IfvVVY6HfoekDkODfuXIPtLJgLWbqFvXKE420zQVW2VE7Bwr3RtpNmGPl/kh7l+BYfbPPb+yqdpqdgIJsYjShAf/NojvGQCTLn2z69EjkdKyY/D1GvNuRTo9wa+/bTZCcs8Eyb+GXHIXmbSIZgtA/o6tNtXxzf185YYZ0ujRQ9dcaKWBSwzh1Dh6nmTX12u/UOVracH90tLeWIdSisEIL7y35hZDh5UwhbPVZhMGKTBqCoZu9LkVuRowKjvV9vhC85KAX1ZWVVqlQOsqUu4enz7zcHCbA==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(23010399003)(36860700016)(261022075727099003)(261102123227099003)(261102124227099003)(4143699003)(261022105027099003)(56012099006)(11063799006)(261026140227099003)(10067099003)(261021121427099003)(261021123027099003)(261028144727099003)(22082099003)(18002099003)(6133799003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: aGGkJUWsZPfmO01JFV0LEUHRF6ZjLtVCAFL2LzgQJK/K6l7u10kBLHtbjsc6EFTS33jcJ2K5OPty7GSimSTh7b9e0Qg1Qa8O3wMJO1Y0CnRMl96xSTFeD8si7LOrtAEabHLwPbnCcMHID4YIR9GEQ4fgv+DuQHdpqQZut21aLj381pdx5xBT+59mcQSvottM2iaCnb+hzvzi7bJgy1qjjuV3t67k+13IhLJ86dROu+GoRv0I8o/FrSwHno6lA57HICZ5jVWK40GSWY4uEcKhKTw0WUkcaqhrN75hIqNCf5S/k/nJgHYjWNTPbkojWXaQ0cmEeUUuCZACgokRjpkAk3ZmqORH2c3xybniSW1NEaaz7sGcZmsjKk++/G2rZsWFItF4htss7UhGYwvEu/KS9eQHzOQUuEZDBbfc34bj+CeR4Ob8za9AQTH5L3Vw4Num
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 21:40:14.8581
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a27f15d4-bdf1-47cc-6cb8-08df474edcf0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF0001885B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5810
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_134025_366310_1A383BC6 
X-CRM114-Status: GOOD (  29.28  )
X-Spam-Score: -3.8 (---)
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
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 11/20/26 09:23, tumic@gpxsee.org wrote:
> From: Martin Tůma <martin.tuma@digiteqautomotive.com>
>
> Add the missing PM suspend/resume callbacks that properly reconfigure
> the XDMA HW on PCIe suspend/resume.

Just wondering if we could destroy xdma platform device in your PCIe 
suspend routine and re-create xdna device in PCIe resume?

Lizhi

>
> Signed-off-by: Martin Tůma <martin.tuma@digiteqautomotive.com>
> ---
>   drivers/dma/xilinx/xdma.c | 147 ++++++++++++++++++++++++++++++++------
>   1 file changed, 124 insertions(+), 23 deletions(-)
>
> diff --git a/drivers/dma/xilinx/xdma.c b/drivers/dma/xilinx/xdma.c
> index 9d827c9a1267..d6772b38d8f7 100644
> --- a/drivers/dma/xilinx/xdma.c
> +++ b/drivers/dma/xilinx/xdma.c
> @@ -123,6 +123,7 @@ struct xdma_desc {
>    * @irq_start: Start IRQ assigned to device
>    * @irq_num: Number of IRQ assigned to device
>    * @status: Initialization status
> + * @usr_irq_mask: User IRQ mask for PM suspend/resume
>    */
>   struct xdma_device {
>   	struct platform_device	*pdev;
> @@ -135,6 +136,7 @@ struct xdma_device {
>   	u32			irq_start;
>   	u32			irq_num;
>   	u32			status;
> +	u32			usr_irq_mask;
>   };
>   
>   #define xdma_err(xdev, fmt, args...)					\
> @@ -398,6 +400,27 @@ static int xdma_xfer_stop(struct xdma_chan *xchan)
>   			    CHAN_CTRL_RUN_STOP);
>   }
>   
> +/**
> + * xdma_reconfig_channels - Reconfigure DMA channels
> + * @xdev: DMA device pointer
> + * @chans: channels configuration
> + * @chan_num: number of channels
> + */
> +static int xdma_reconfig_channels(struct xdma_chan *chans,
> +				  u32 chan_num)
> +{
> +	int i, ret;
> +
> +	for (i = 0; i < chan_num; i++) {
> +		/* init channel hardware */
> +		ret = xdma_channel_init(&(chans[i]));
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
>   /**
>    * xdma_alloc_channels - Detect and allocate DMA channels
>    * @xdev: DMA device pointer
> @@ -1018,6 +1041,55 @@ static int xdma_set_vector_reg(struct xdma_device *xdev, u32 vec_tbl_start,
>   	return 0;
>   }
>   
> +/**
> + * xdma_irq_config - Configure IRQs
> + * @xdev: DMA device pointer
> + */
> +static int xdma_irq_config(struct xdma_device *xdev)
> +{
> +	u32 user_irq_start;
> +	int ret;
> +
> +	/* configure hardware IRQ registers */
> +	ret = xdma_set_vector_reg(xdev, XDMA_IRQ_CHAN_VEC_NUM, 0,
> +				  XDMA_CHAN_NUM(xdev));
> +	if (ret) {
> +		xdma_err(xdev, "failed to set channel vectors: %d", ret);
> +		return ret;
> +	}
> +
> +	/* configure user IRQ registers if needed */
> +	user_irq_start = XDMA_CHAN_NUM(xdev);
> +	if (xdev->irq_num > user_irq_start) {
> +		ret = xdma_set_vector_reg(xdev, XDMA_IRQ_USER_VEC_NUM,
> +					  user_irq_start,
> +					  xdev->irq_num - user_irq_start);
> +		if (ret) {
> +			xdma_err(xdev, "failed to set user vectors: %d", ret);
> +			return ret;
> +		}
> +	}
> +
> +	/* enable channels interrupts */
> +	ret = regmap_write(xdev->rmap, XDMA_IRQ_CHAN_INT_EN_W1S, ~0);
> +	if (ret) {
> +		xdma_err(xdev, "failed to enable channel IRQs: %d", ret);
> +		return ret;
> +	}
> +
> +	/* enable user interrupts if needed */
> +	if (xdev->irq_num > user_irq_start) {
> +		ret = regmap_write(xdev->rmap, XDMA_IRQ_USER_INT_EN_W1S,
> +				   xdev->usr_irq_mask);
> +		if (ret) {
> +			xdma_err(xdev, "failed to enable user IRQs: %d", ret);
> +			return ret;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
>   /**
>    * xdma_irq_init - initialize IRQs
>    * @xdev: DMA device pointer
> @@ -1025,7 +1097,6 @@ static int xdma_set_vector_reg(struct xdma_device *xdev, u32 vec_tbl_start,
>   static int xdma_irq_init(struct xdma_device *xdev)
>   {
>   	u32 irq = xdev->irq_start;
> -	u32 user_irq_start;
>   	int i, j, ret;
>   
>   	/* return failure if there are not enough IRQs */
> @@ -1060,28 +1131,8 @@ static int xdma_irq_init(struct xdma_device *xdev)
>   		irq++;
>   	}
>   
> -	/* config hardware IRQ registers */
> -	ret = xdma_set_vector_reg(xdev, XDMA_IRQ_CHAN_VEC_NUM, 0,
> -				  XDMA_CHAN_NUM(xdev));
> -	if (ret) {
> -		xdma_err(xdev, "failed to set channel vectors: %d", ret);
> -		goto failed_init_c2h;
> -	}
> -
> -	/* config user IRQ registers if needed */
> -	user_irq_start = XDMA_CHAN_NUM(xdev);
> -	if (xdev->irq_num > user_irq_start) {
> -		ret = xdma_set_vector_reg(xdev, XDMA_IRQ_USER_VEC_NUM,
> -					  user_irq_start,
> -					  xdev->irq_num - user_irq_start);
> -		if (ret) {
> -			xdma_err(xdev, "failed to set user vectors: %d", ret);
> -			goto failed_init_c2h;
> -		}
> -	}
> -
> -	/* enable interrupt */
> -	ret = regmap_write(xdev->rmap, XDMA_IRQ_CHAN_INT_EN_W1S, ~0);
> +	/* configure all HW IRQ registers */
> +	ret = xdma_irq_config(xdev);
>   	if (ret)
>   		goto failed_init_c2h;
>   
> @@ -1297,15 +1348,65 @@ static int xdma_probe(struct platform_device *pdev)
>   	return ret;
>   }
>   
> +/**
> + * xdma_suspend - PM suspend callback
> + * @dev: XDMA device pointer
> + */
> +static int xdma_suspend(struct device *dev)
> +{
> +	struct xdma_device *xdev = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = regmap_read(xdev->rmap, XDMA_IRQ_USER_INT_EN,
> +			  &xdev->usr_irq_mask);
> +	if (ret) {
> +		xdma_err(xdev, "User IRQ vector backup failed: %d", ret);
> +		return ret;
> +	}
> +
> +	ret = regmap_write(xdev->rmap, XDMA_IRQ_CHAN_INT_EN_W1C, ~0);
> +	if (ret)
> +		xdma_err(xdev, "DMA channels IRQ disable failed: %d", ret);
> +
> +	return ret;
> +}
> +
> +/**
> + * xdma_resume - PM resume callback
> + * @dev: XDMA device pointer
> + */
> +static int xdma_resume(struct device *dev)
> +{
> +	struct xdma_device *xdev = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = xdma_reconfig_channels(xdev->h2c_chans, xdev->h2c_chan_num);
> +	if (ret) {
> +		xdma_err(xdev, "H2C channels reconfiguration failed: %d", ret);
> +		return ret;
> +	}
> +
> +	ret = xdma_reconfig_channels(xdev->c2h_chans, xdev->c2h_chan_num);
> +	if (ret) {
> +		xdma_err(xdev, "C2H channels reconfiguration failed: %d", ret);
> +		return ret;
> +	}
> +
> +	return xdma_irq_config(xdev);
> +}
> +
>   static const struct platform_device_id xdma_id_table[] = {
>   	{ "xdma", 0},
>   	{ },
>   };
>   MODULE_DEVICE_TABLE(platform, xdma_id_table);
>   
> +static DEFINE_NOIRQ_DEV_PM_OPS(xdma_dev_pm_ops, xdma_suspend, xdma_resume);
> +
>   static struct platform_driver xdma_driver = {
>   	.driver		= {
>   		.name = "xdma",
> +		.pm = pm_sleep_ptr(&xdma_dev_pm_ops),
>   	},
>   	.id_table	= xdma_id_table,
>   	.probe		= xdma_probe,

