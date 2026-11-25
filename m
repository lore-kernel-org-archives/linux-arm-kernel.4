Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1A20606A339
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 17:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zNcURpP5;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=OEi1ZWWc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=7b7m/DkpgEDQ+oJfz1rrmLJybl8GZzhKw2nRd5M9D9I=; b=zNcURpP5WLLokB
	lThD5hvsH2a/p2gaCgBjv/q6v7Evj64UnaWNMieecRvkc/DdX69Ukl6+w6nLofaxyMtFxCRG/qSVy
	XfaI2sIeodVUhylcSOlDYt1xiyUsui7bJtmlX2sk5n+VkBPg+VKBKpP6GB23fF2Ipe6PiZQC+IoTK
	16Susx1eBLINkMdM0Q/tbDjODAzfkrK3eQs/6WMxEnJ/n3t7At2pdpnee08NR1f5B1jZUdiU8sIyC
	Egm3bSaNyFUVIGZrlv61vsPnjRVqY2MRrb9cUY6xCvpB30nqwKusIqX95w9svOP2E5n7OVvqcR6ky
	HZ77i3b+KyrwaQE8n8yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWGgK-0000000AiSg-0vSs;
	Wed, 25 Nov 2026 17:21:20 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWGgF-0000000AiQH-2me6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 17:21:18 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20261125172109euoutp02ee4fa3d9c5deb01a51c59fe98105c231~rWXzWKoZk2998829988euoutp02U
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 17:21:09 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20261125172109euoutp02ee4fa3d9c5deb01a51c59fe98105c231~rWXzWKoZk2998829988euoutp02U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1795627269;
	bh=7b7m/DkpgEDQ+oJfz1rrmLJybl8GZzhKw2nRd5M9D9I=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=OEi1ZWWcaRDpTvP7CQulCBO/V49BJJgF86ryhAJXC5TgpZw4nuounp1poXWbcq9gM
	 RaBAjfHKNacLXwS77OQipOMC8F/QJSM8DUNTWI0l0tXv3OEOR9J4XC8uYtAEdCb6OM
	 69YhLX8W6BEeRRwkbZKlthpnlLDrPbsFipJRiToE=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20261125172108eucas1p124b2bc0d3a1d4e2073e0f604d173d1df~rWXzGb1fk2718127181eucas1p1h;
	Wed, 25 Nov 2026 17:21:08 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261125172107eusmtip29e62e06ad679156e3763d3a649334c3f~rWXxmyPNQ0516905169eusmtip2u;
	Wed, 25 Nov 2026 17:21:07 +0000 (GMT)
Message-ID: <a3722347-4b88-41ad-926b-455530020c6b@samsung.com>
Date: Wed, 25 Nov 2026 18:21:06 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH] Revert
 "iommu/dma: simplify dma_iova_destroy() and drop the free_iova helper"
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, will@kernel.org,
	robin.murphy@arm.com, honghuan@amd.com, Leon Romanovsky <leonro@nvidia.com>,
	Jason Gunthorpe <jgg@ziepe.ca>
Cc: joro@8bytes.org, prakash.gupta@oss.qualcomm.com, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, stable@vger.kernel.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20261125135120.1126571-1-sibi.sankar@oss.qualcomm.com>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20261125172108eucas1p124b2bc0d3a1d4e2073e0f604d173d1df
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261125135138eucas1p141ba6b5e09623562e2033e290fba811c
X-EPHeader: CA
X-CMS-RootMailID: 20261125135138eucas1p141ba6b5e09623562e2033e290fba811c
References: <CGME20261125135138eucas1p141ba6b5e09623562e2033e290fba811c@eucas1p1.samsung.com>
	<20261125135120.1126571-1-sibi.sankar@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_092116_299243_71675561 
X-CRM114-Status: GOOD (  11.34  )
X-Spam-Score: -2.8 (--)
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

On 25.11.2026 14:51, Sibi Sankar wrote:
> This reverts commit 1acce29926d93f3eba427696fe3da6451504dae2.
>
> Before this commit, dma_iova_destroy() unmapped through
> __iommu_dma_iova_unlink(..., free_iova=true), which set
> iotlb_gather.queued from cookie->fq_domain, skipped iommu_iotlb_sync()
> and freed the IOVA with the queued gather, exactly like
> __iommu_dma_unmap(). After it, dma_iova_destroy() calls
> dma_iova_unlink() and then dma_iova_free():
>
>   - dma_iova_unlink() never marks its gather as queued and always calls
>     iommu_iotlb_sync() after iommu_unmap_fast().
>   - dma_iova_free() passes a NULL gather to iommu_dma_free_iova(), so
>     the IOVA goes straight back to the allocator through
>     free_iova_fast() and never through queue_iova().
>
> DMA-FQ domains therefore get strict invalidation on this path. That
> includes the block layer's blk_rq_dma_map() path, which NVMe uses for
> all data transfers, so iommu.strict=0 has no effect on NVMe I/O.
>
> hw/sw details: Qualcomm Glymur CRD: SMMUv3 with no RANGE_INV,
> 	       4K pages; NVMe SSD on PCIe Gen5 x4
>
> Fio sequential read/write numbers:
>   Domain                          seq write    seq read
>   DMA (strict)                    2694 MiB/s   2693 MiB/s
>   DMA-FQ (lazy), flush queue      2707 MiB/s   2803 MiB/s
>     bypassed (this regression)
>   DMA-FQ (lazy), flush queue      10.6 GiB/s   11.9 GiB/s
>     used by dma_iova_destroy()
>
> Fixes: 1acce29926d9 ("iommu/dma: simplify dma_iova_destroy() and drop the free_iova helper")
> Cc: stable@vger.kernel.org # v7.3+
> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>


The performance data clearly shows that the flush queue was there for
the reason. Together with this revert it would probably make sense to
apply the v1 of the reverted patch:

https://lore.kernel.org/all/20260701092033.422867-1-honghuan@amd.com/

Leon, do You see any other option?

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


