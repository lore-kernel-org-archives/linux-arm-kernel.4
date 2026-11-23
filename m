Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B60D606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 09:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4DKgBNJq;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=gZakmTQ7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=GDcrYVJnE/3hlpSFAuu6SO1jid6zoDQ9uRlcaOqVfUg=; b=4DKgBNJqV70EQ0
	rt1lcvWWzOc29LIunQgpwkNk02DeavxVQnhX6CIDD6Z2odto/rW7UtPCdUoD0naWXJlNyKcbnRRo8
	wWdolrZs2O/xkCxvG07fByFg5Aw/W0w0taUmQ257cNOkVNSJhSAGmhi7uSofVJrOcxD9MXprE0qtB
	SzwfERDECYi7tvgW8Q1W/s6Y91K5L0Jzk79sB8uceJ6UNj2lQxSckK6SqgBnCabK+F+NRw6JZEbAc
	HFxEBTgzl8A60F7ZKbwFLpDyVdEAq2ar+wzKD9DWuptoh7RFwdNB8n8bq7R9LVvdaBZlHJdcZj31v
	GXFL27uBsyCxcfq9ZOUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVPu8-00000002dLh-1EFs;
	Mon, 23 Nov 2026 09:00:04 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVPsS-00000002cnl-112N
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 08:58:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iYrJ/h79nUtAUBGCncHwLgfbX7a1v7aC/lP9vt1c1I4I6yYF5MX3VEasUUHKHJeQX7sc8wpHtwrn5ow2I+3T0y781Xuegd+OfPkrjNYnMtzhVGQXc7rL/7bLvg6x7uf2VTIT+PNBJhgdjbxqQOQGlHHQmkJcEvFvQjuSu/B1DHuKFVp+uYjClv8cInQvJyILYmNf72tsjEdm+QdLn+rV1XfuD9+7X91BDTCq453xBCpwxkOYoGJTSN3AFi38NtX5zp6923WMFCOMbsmEAoy0IeCKx1ks5LhMBCvbP4BFTQr0cKP326UcU/NR/qba5kO4HdwIHI34q+49e7B9mns4aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GDcrYVJnE/3hlpSFAuu6SO1jid6zoDQ9uRlcaOqVfUg=;
 b=QXHDC3E2XF3jV15FsxhjfU7CL5wAmy3zgTKT3G7VrQuXImV3Eq9mN2NU7kdmlHs+S5iV07Km2k4EhoxrF1N02ufRadGkpKYL7hXcduljh4OyojPSNX0unbR/XQM7iAHyp7xxoW+qd8SKCQaq+dPUpab2xJBwL99jOzMJb0ZbTqD/Cj0Px7PTgrUWu1oKMSTnCo4e0jtz6GmSlY5Wl+O7syCLQwE0PA2WMUHCmM7t0SsW1fIms8YO6W9t7oL1zeoCR2QCGveIW5bGuO75v5gmHboaFwcEu2dEmS7howp2fEv8ocAqCQt0Zya6p0zg8QEfYw9Rr/f480xzLh+T3Va/bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=oss.nxp.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GDcrYVJnE/3hlpSFAuu6SO1jid6zoDQ9uRlcaOqVfUg=;
 b=gZakmTQ7GG2aI0tlym3iff2+uIn2EG+XYqKBvTQb32FAKPmJSPfQa+evXZDJYia9FPoEvIDDP/OtH/gh8Elnj5iWot5vFaCEQazq9WtyytKVSgFZm1XhbH1zpidbnnimDvNCq6H3lL09w/vvi2S3JntiEqIf5LXwHqzHS+I4DHbq+S+x9ZSbkVRMtEIZUO4cat+SE/V7z0AXRWQl4tQbq+7ZfgK9NlzhHhtxd+SO7wqaDzbpcu0t4keAr9HFsTzmgAVAl3HgAADh7IPYameAPzqPMhcpSIewS4k7qc1T5xba7vCtpMMD9LvTNQ+CXTXMqnXrH+XoFo6RQA2lD3vMFQ==
Received: from VI1PR06CA0100.eurprd06.prod.outlook.com (2603:10a6:803:8c::29)
 by VI0PR10MB8384.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:21a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.3; Mon, 23 Nov
 2026 08:58:15 +0000
Received: from MI3PEPF00008483.eurprd02.prod.outlook.com
 (2603:10a6:803:8c:cafe::54) by VI1PR06CA0100.outlook.office365.com
 (2603:10a6:803:8c::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.14 via Frontend Transport; Mon,
 23 Nov 2026 08:58:15 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 MI3PEPF00008483.mail.protection.outlook.com (10.167.240.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Mon, 23 Nov 2026 08:58:15 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Mon, 23 Nov
 2026 09:59:02 +0100
Received: from [10.48.87.222] (10.48.87.222) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 23 Nov
 2026 09:58:14 +0100
Message-ID: <ae764ee9-cef8-415d-ad3f-64572ed5f4f0@foss.st.com>
Date: Mon, 23 Nov 2026 09:58:14 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] dmaengine: stm32-dma3: validate LLI pool allocations
 and fix cleanup
To: Frank Li <Frank.li@oss.nxp.com>
CC: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>, <dmaengine@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<stable@vger.kernel.org>
References: <20261120-dma3-fixes-v1-0-f29c1f437399@foss.st.com>
 <20261120-dma3-fixes-v1-3-f29c1f437399@foss.st.com>
 <awCLUSCKqsBDF5g3@SMW015318>
Content-Language: en-US
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
In-Reply-To: <awCLUSCKqsBDF5g3@SMW015318>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PEPF00008483:EE_|VI0PR10MB8384:EE_
X-MS-Office365-Filtering-Correlation-Id: 92e6da75-15ba-4e7c-ef1c-08df493fe930
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|36860700016|376014|82310400026|1800799024|261026121527099003|261026140227099003|10067099003|4143699003|11063799006|261022105027099003|261022075727099003|261028144727099003|261021121427099003|261021123027099003|261102123227099003|56012099006|261102124527099003|261009223027099003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: /3BvQbJJhBi3EssTyXTITfjbXZ+vnf9adCumt7NiVIp53DZtE/kCfRnXdYNKnun40qVABOyD6ciSE9Si2L5El3CRhCMHRLH3qy6xPuiTrIVy6sayL2DudkulK8SxLHSPOXS1vJ5XfksjH6X0kyzcBMiw6eGtrx/0H87BAzLnMMWPngWBKTHsUI1I33u3a0+MNEb4Rj77QJgD3rV6d6qQ5MIIh2D0RK9Kw9yfD2FzyCX8tfgL6aFEtRy62t2LaRtAtPlNVX9qlWsHFkVHRFVz2Ft1Lp8XML9EoSJM5PK2U3JK1Oa+Oh0zDRdyHvT0C3cL4ClM0YC4soX4cZwy1esNzkiqWb6Pwh6hYfpiZGXWoQe5Yavk7iG+GBXVn8KxkoB+qiGx2/BjcMDGfIpEHX83MFS99Eo6hl4H3EdjdkojcJPx8HIt8dcvcKNq6NiTww482gEstc1R4WOKwFw5WM+Xu1MXyOmgvuKUa0Dl7y9WVsbq+64qeODWon34Hx9v8KiW6zTCTsuMLDU6+jNgsizMwSctEzc+pUh2VgmML/hS0M8JNtkS555Rih+6M8y50mO1nCH8jRUBnqK+u6i6VHfaoOIBf7ot2yKs8SQ+zI7/F5DeKZx1qOU5REa8JNBP4i+iEsvyIiZDsbDMlzbAeH8u3OaJ7LtTm+dnu0775EF8hibxsnY/Qf4nTtuKVn4optqPvwpE6rScHljFH2QPCh1lvw==
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(376014)(82310400026)(1800799024)(261026121527099003)(261026140227099003)(10067099003)(4143699003)(11063799006)(261022105027099003)(261022075727099003)(261028144727099003)(261021121427099003)(261021123027099003)(261102123227099003)(56012099006)(261102124527099003)(261009223027099003)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: vOZCbcfKvcVd3Z7XWQBzEEvzgTSXiE59ByObWD7ZeekVKokChZu+R4MX9dPVOQ1nhMRG8eB5YlIgXv/VVME/8GFJ07stLhWADTTdeKl3LbYiJRrL8GTHl58wXYYWhJV19sepizCOEekVCoCfn8QoXB+79HNnPEiNreQpzxG23MlpVvnNE5LWUhWNCXd9tc4ZwpNI7tXPXcGbJZrUNdAvK4yjLC85jBeX0ipha1HgH4+gF7VOOyr3CJBFgaDAGcwv5GIHuu62cpuj+htwPE8SiD6IOP3cIKlzcpbt58DbZAIPd/tSLWhUMgzuibgPZ9L3nH2ENPs5EyxFZ1xxkKiAXiHk5z0yfiCuHnQ6yQlnsEh68p64KqkuTILWTVhz/aViH0mSAFom8sE8K+/C9gtfCFeUnwaXVX0R0gmUlZhhY+XQgFI+CcOinyd7Z/wr70mm
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 08:58:15.3095
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 92e6da75-15ba-4e7c-ef1c-08df493fe930
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: MI3PEPF00008483.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR10MB8384
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_005838_951285_89461F31 
X-CRM114-Status: GOOD (  24.56  )
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

On 11/20/26 19:02, Frank Li wrote:
> On Fri, Nov 20, 2026 at 10:18:03AM +0100, Amelie Delaunay wrote:
>> All descriptors in a linked list must share the same 64 KiB address
>> window because CLBAR provides the common upper address bits. The DMA pool
>> boundary only constrains individual allocations, not the whole list, so
>> descriptors in a single list may be allocated from different pool pages in
>> different windows.
> 
> /**
>   * dmam_pool_create - Managed dma_pool_create()
>   * @name: name of pool, for diagnostics
>   * @dev: device that will be doing the DMA
>   * @size: size of the blocks in this pool.
>   * @align: alignment requirement for blocks; must be a power of two
>   * @allocation: returned blocks won't cross this boundary (or zero)
> 
> suppose you can set allocation to 64K to avoid cross 64K boundary.
> 
>   *
>   * Managed dma_pool_create().  DMA pool created with this function is
>   * automatically destroyed on driver detach.
>   *
>   * Return: a managed dma allocation pool with the requested
>   * characteristics, or %NULL if one can't be created.
>   */
> struct dma_pool *dmam_pool_create(const char *name, struct device *dev,
> 				  size_t size, size_t align, size_t allocation)
> 
> 
> Frank
> 

The driver already passes SZ_64K as the last argument to
dmam_pool_create(). That argument constrains *individual* pool blocks,
not the linked list *as a whole*.

Each allocation here is one descriptor. When the pool grows, descriptors 
from different backing allocations can end up in different 64 KiB 
windows, even though every descriptor individually satisfies the 
boundary constraint.

DMA3 requires all descriptors in a list to share the same window because 
CLBAR provides the common upper address bits.

This check therefore prevents an invalid list from reaching the 
hardware. Guaranteeing that such lists can always be allocated would 
require a window-aware allocation strategy.

Amelie

>>
>> Check each descriptor's base address and reject lists that span multiple
>> windows, instead of letting the hardware fetch descriptors from wrong
>> addresses. Track the last allocated entry so that the error path frees
>> exactly the descriptors that were allocated, including the one that
>> failed the window check.
>>
>> While at it, simplify the ccr initialisation, which is functionnaly
>> equivalent to the previous code.
>>
>> Fixes: f561ec8b2b33 ("dmaengine: Add STM32 DMA3 support")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
>> ---
>>   drivers/dma/stm32/stm32-dma3.c | 31 ++++++++++++++++++++++++++-----
>>   1 file changed, 26 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/dma/stm32/stm32-dma3.c b/drivers/dma/stm32/stm32-dma3.c
>> index a056f73fbe02..7c509a69f5e5 100644
>> --- a/drivers/dma/stm32/stm32-dma3.c
>> +++ b/drivers/dma/stm32/stm32-dma3.c
>> @@ -397,7 +397,8 @@ static void stm32_dma3_chan_dump_hwdesc(struct stm32_dma3_chan *chan,
>>   static struct stm32_dma3_swdesc *stm32_dma3_chan_desc_alloc(struct stm32_dma3_chan *chan, u32 count)
>>   {
>>   	struct stm32_dma3_swdesc *swdesc;
>> -	int i;
>> +	int i, last_alloc_idx = -1;
>> +	dma_addr_t base_addr = 0;
>>
>>   	/*
>>   	 * If the memory to be allocated for the number of hwdesc (6 u32 members but 32-bytes
>> @@ -419,18 +420,38 @@ static struct stm32_dma3_swdesc *stm32_dma3_chan_desc_alloc(struct stm32_dma3_ch
>>   							&swdesc->lli[i].hwdesc_addr);
>>   		if (!swdesc->lli[i].hwdesc)
>>   			goto err_pool_free;
>> +
>> +		last_alloc_idx = i;
>> +
>> +		if (i == 0) {
>> +			base_addr = swdesc->lli[0].hwdesc_addr & CLBAR_LBA;
>> +			continue;
>> +		}
>> +
>> +		/*
>> +		 * dma_pool boundary=SZ_64K only guarantees that one allocation does not span a 64KB
>> +		 * boundary. It does not guarantee that all allocations of a given linked-list land
>> +		 * in the same 64KB address window required by CLBAR/CLLR addressing.
>> +		 */
>> +		if (base_addr != (swdesc->lli[i].hwdesc_addr & CLBAR_LBA)) {
>> +			dev_err(vchan_chan_dev(&chan->vchan), "LLI crosses a 64KB window (%pad)\n",
>> +				&swdesc->lli[i].hwdesc_addr);
>> +			goto err_pool_free;
>> +		}
>>   	}
>> -	swdesc->ccr = 0;
>>
>>   	/* Set LL allocated port */
>> -	swdesc->ccr &= ~CCR_LAP;
>> +	swdesc->ccr = FIELD_PREP(CCR_LAP, 0);
>>
>>   	return swdesc;
>>
>>   err_pool_free:
>>   	dev_err(vchan_chan_dev(&chan->vchan), "Failed to alloc descriptors\n");
>> -	while (--i >= 0)
>> -		dma_pool_free(chan->lli_pool, swdesc->lli[i].hwdesc, swdesc->lli[i].hwdesc_addr);
>> +	while (last_alloc_idx >= 0) {
>> +		dma_pool_free(chan->lli_pool, swdesc->lli[last_alloc_idx].hwdesc,
>> +			      swdesc->lli[last_alloc_idx].hwdesc_addr);
>> +		last_alloc_idx--;
>> +	}
>>   	kfree(swdesc);
>>
>>   	return NULL;
>>
>> --
>> 2.43.0
>>


