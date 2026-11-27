Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C279606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 12:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LpPyjD/I;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=Xnwia06/;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=KNGq0ZK/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=a9fm/uk5JQ3HNfgBODpdCWOALyft9Wz+Y8nV7YiTAZ4=; b=LpPyjD/IZZ8XJs
	3IHio/vnsJDdXyiQLdNeTYERlHBUXCitA/5wtNuang3ijtgMAWfpCWudROlx+61yZgtLjfUULhIN5
	GI0GBvznF6vswDJdhtDE9pmHRVlePZZgYTayvAFkGmkxxpblYnuUtKWrJH8NhJ3N9nVHFOdsrIgsa
	sa/8fiS8xD4EVSrrV4SmAWd6QgxJ3BmEMq8gWzEjQpwgwmdeK4cUObuyuHJ4IkZwdLcXCZtQ3rmSI
	PLv3lPa/96N9LBFTc3xVCtxCSJJ1lqlSPvMWzmdkbAVSuaWdaRxBfhA61kIeYmamxrgT2xx6gkiEY
	PRi9o8tx5j5ddYJDpwtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuiE-0000000FzxE-1AjO;
	Fri, 27 Nov 2026 12:05:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWui7-0000000Fzs3-0uIU
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 27 Nov 2026 12:05:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=a9fm/uk5JQ3HNfgBODpdCWOALyft9Wz+Y8nV7YiTAZ4=; b=Xnwia06/GGonKC4E7IpbcZ7wiM
	xxqwIvMcucgYwDVefIRrU/WbFeD+d3sBvB+YGoCM9LjpPG6D5jDnhm+qSXk0OdHEGxNIoq+hXvsxz
	3ydMM3DKpIuW8SMkbZkiQZWcu4d8htyRE5RsY7+HbBhekcRQ4QsKKWlzL48XhqBtkYhSX6Xs6pCMu
	ImoCsat1h2LzVoeJhengxliuqmegaHgfj3mhRgQVR2nO3AuSlDoALUwxy7tw9R/nSHpgLI6RSbAQS
	KYiEO+l9fvNmniHg8cY+PjrsBvTeVssVX1kNlKsBha4EKbhtNrRBftvioa6ctr/pb3sqk/TAtK2RT
	akQBkzgw==;
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWui3-00000007g9E-41ZU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 12:05:49 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20261127120540euoutp01861630c3c9cf58642906d2ac9c14b769~r5W65pXYj0459204592euoutp01i
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 12:05:40 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20261127120540euoutp01861630c3c9cf58642906d2ac9c14b769~r5W65pXYj0459204592euoutp01i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1795781140;
	bh=a9fm/uk5JQ3HNfgBODpdCWOALyft9Wz+Y8nV7YiTAZ4=;
	h=Date:Subject:From:To:Cc:In-Reply-To:References:From;
	b=KNGq0ZK/A1D5c2Ml3AhUtZiXqmbgvORs6wpuuj660jbSCbmTazbj4gDyBZi+xLwiI
	 jtaDAZpE0HohUhdFj0gD50kJaET1JfCEre56TVD/k5h5NcXWHcg/VQdC+xwKgQDRQI
	 TeRudICmUo1K+W5W9nkh2uKF3tVqVniMXYWMtP4M=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20261127120539eucas1p10b2e005bf38fd3ff3ca53b48bf531777~r5W6fzJTf0959809598eucas1p11;
	Fri, 27 Nov 2026 12:05:39 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261127120538eusmtip27bba0cf597c14302cb8417c82729e000~r5W5u8fKU2205822058eusmtip2X;
	Fri, 27 Nov 2026 12:05:38 +0000 (GMT)
Message-ID: <d1660922-e3a1-4d13-8824-f0525f88f723@samsung.com>
Date: Fri, 27 Nov 2026 13:05:38 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH] Revert
 "iommu/dma: simplify dma_iova_destroy() and drop the free_iova helper"
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: Leon Romanovsky <leon@kernel.org>
Cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, will@kernel.org,
	robin.murphy@arm.com, honghuan@amd.com, Jason Gunthorpe <jgg@ziepe.ca>,
	joro@8bytes.org, prakash.gupta@oss.qualcomm.com, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, stable@vger.kernel.org
Content-Language: en-US
In-Reply-To: <c5e4fc4e-0e63-47cf-8b88-93ecfb3646de@samsung.com>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20261127120539eucas1p10b2e005bf38fd3ff3ca53b48bf531777
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261125135138eucas1p141ba6b5e09623562e2033e290fba811c
X-EPHeader: CA
X-CMS-RootMailID: 20261125135138eucas1p141ba6b5e09623562e2033e290fba811c
References: <CGME20261125135138eucas1p141ba6b5e09623562e2033e290fba811c@eucas1p1.samsung.com>
	<20261125135120.1126571-1-sibi.sankar@oss.qualcomm.com>
	<a3722347-4b88-41ad-926b-455530020c6b@samsung.com>
	<20261125183419.GB774860@unreal>
	<c5e4fc4e-0e63-47cf-8b88-93ecfb3646de@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_120547_951431_43AD2F26 
X-CRM114-Status: GOOD (  19.64  )
X-Spam-Score: -2.5 (--)
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 27.11.2026 12:28, Marek Szyprowski wrote:
> On 25.11.2026 19:34, Leon Romanovsky wrote:
>> On Wed, Nov 25, 2026 at 06:21:06PM +0100, Marek Szyprowski wrote:
>>> On 25.11.2026 14:51, Sibi Sankar wrote:
>>>> This reverts commit 1acce29926d93f3eba427696fe3da6451504dae2.
>>>>
>>>> Before this commit, dma_iova_destroy() unmapped through
>>>> __iommu_dma_iova_unlink(..., free_iova=true), which set
>>>> iotlb_gather.queued from cookie->fq_domain, skipped iommu_iotlb_sync()
>>>> and freed the IOVA with the queued gather, exactly like
>>>> __iommu_dma_unmap(). After it, dma_iova_destroy() calls
>>>> dma_iova_unlink() and then dma_iova_free():
>>>>
>>>>   - dma_iova_unlink() never marks its gather as queued and always calls
>>>>     iommu_iotlb_sync() after iommu_unmap_fast().
>>>>   - dma_iova_free() passes a NULL gather to iommu_dma_free_iova(), so
>>>>     the IOVA goes straight back to the allocator through
>>>>     free_iova_fast() and never through queue_iova().
>>>>
>>>> DMA-FQ domains therefore get strict invalidation on this path. That
>>>> includes the block layer's blk_rq_dma_map() path, which NVMe uses for
>>>> all data transfers, so iommu.strict=0 has no effect on NVMe I/O.
>>>>
>>>> hw/sw details: Qualcomm Glymur CRD: SMMUv3 with no RANGE_INV,
>>>> 	       4K pages; NVMe SSD on PCIe Gen5 x4
>>>>
>>>> Fio sequential read/write numbers:
>>>>   Domain                          seq write    seq read
>>>>   DMA (strict)                    2694 MiB/s   2693 MiB/s
>>>>   DMA-FQ (lazy), flush queue      2707 MiB/s   2803 MiB/s
>>>>     bypassed (this regression)
>>>>   DMA-FQ (lazy), flush queue      10.6 GiB/s   11.9 GiB/s
>>>>     used by dma_iova_destroy()
>>>>
>>>> Fixes: 1acce29926d9 ("iommu/dma: simplify dma_iova_destroy() and drop the free_iova helper")
>>>> Cc: stable@vger.kernel.org # v7.3+
>>>> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>>> The performance data clearly shows that the flush queue was there for
>>> the reason. Together with this revert it would probably make sense to
>>> apply the v1 of the reverted patch:
>>>
>>> https://lore.kernel.org/all/20260701092033.422867-1-honghuan@amd.com/
>>>
>>> Leon, do You see any other option?
>> These numbers shows clearly that we had iotlb_gather.queued != 0
>> and never performed iommu_iotlb_sync(domain, &iotlb_gather); while
>> destroying mapped IOVA.
>>
>> I agree with you, v1 is the easiest solution, however my preferred one
>> is to cache gather when it is created and keep it in dma_iova_state 
>> structure for whole life cycle of that struct.
> I've played with the code (using LLM ;) and there are some issues with this
> approach:
>
> 1. tso_dma_map_completion_save() copies the struct dma_iova_state by value,
> what breaks internals of the struct iommu_iotlb_gather.
> 2. adding iommu_iotlb_gather to dma_iova_state increase the struct size
> from 16 to 64 bytes, what lands in every NVMe request, RDMA rw contexts,
> TSO maps and HMM.
>
> I've decided to put only the 'use_fq' bit in the __size entry and baked the
> fix. It looks quite nice. This approach solves both above issues, although
> it requires to also fix some drivers which already pokes __size directly
> instead of calling dma_iova_size().
>
> I will post this in a few minutes.

For the reference:

https://lore.kernel.org/all/20261127115849.2780625-1-m.szyprowski@samsung.com/

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


