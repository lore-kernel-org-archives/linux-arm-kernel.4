Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6A08606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 17:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fjPx8wKN;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=YeKuVTc5;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=WpHky++2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ZhgvvGhr19GJBCcJ3nyYAHYL8qsS8Qu8flUoaHfsv+4=; b=fjPx8wKNHGH9e1ZFPdvb8vPROw
	sMM1D0Q4BuQPhTomkHZydm4fZxxcsNeO5sSuKIuIuGFre2lXNJiWiV91p2y6DIR3HwjT4P5IP3hOV
	QwIQ8ZK0tyhstX2I21HIFwEuOIrWKFefrxRTGay5KVxnsxVIrpU145ltSEG/FPGxvvpP7pEjqATfL
	62T3aaCeJXRFeHyOysJCTY+Th0lxbSRfi+cBu/j+fMmHwPShLSl/DSdxHPHoBTuxvWmItLbKPqAT6
	muCiR8PEWiPs3+xJkyppzlk0EoWcghCf8dnGBOIEKSAeVAXiZG7YUoZL2MPji9YN/Vi8B5Gyrt7G2
	UoX3Aymw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHDr-0000000Ash6-33gr;
	Wed, 25 Nov 2026 17:55:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHDq-0000000Asdq-3ENC
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 25 Nov 2026 17:55:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ZhgvvGhr19GJBCcJ3nyYAHYL8qsS8Qu8flUoaHfsv+4=; b=YeKuVTc5RTvohBcJLI6zuACzCj
	Ar6mpGmTudcBqH2aCnW+UX7ojhrcfNpqzYfiZ4bRT7EX3fns965Dju8tFPCpGAXYchZgGVy+Z0Qtg
	3oj/HgSF7OSIMCepBkumzRrUqxyegg8yrm4agif6+zGbeJQl/wFNEeni0ETvrnIxAC4TOzCAHYzXb
	toHdDDrTlyCKMSJZ8A52ZsY1miMuDgCWl2NCA5GLWQdQSGXUETbuhDxKw6y8FHYb4kpWJe1eSjY8M
	LiAKjN1gjAKoMJeVUE0ymAVtMnPo7HGqfPeS7tRQKKX5BeVo2AmEwzxD5dVVpHsjMAcFNJvqKC4Ye
	imdxMcmw==;
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHDk-00000005cbM-2haD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 17:55:57 +0000
Received: by mail-qt1-x829.google.com with SMTP id d75a77b69052e-5430f70c827so72195851cf.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 09:55:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795629349; x=1796234149; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZhgvvGhr19GJBCcJ3nyYAHYL8qsS8Qu8flUoaHfsv+4=;
        b=WpHky++2HAnbJYXSQdMPiSmo/Ghs825oUcB9ahHGoQO2gZ6tjyPhVs0ZuDeNRrBR2F
         mXWxGStGSNdY0Bj+ixGhPHhSWn6+0lF/szCveDQJ0qtke1pzxt37ckFXi7Mox4TeYMJ7
         w6CSlGlRmRIK+mKtLLthv4h6YHeLnAA9Ey0iRNAeAvobYhDEceQx5bje1LG6jtv0hD1g
         RkAucXRsmM+/PSpEb9vQvTqbD6MC3N3Dl5i3E5v9veyHnYObdGKnew6pNeBN1kf2wNRI
         73VRCXeaz2pNOXVLXG2NCxha2MglUwT0iJONN8KjFLqsHEuFfRs8G0iNfSqRCCtDc9zU
         s3gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795629349; x=1796234149;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZhgvvGhr19GJBCcJ3nyYAHYL8qsS8Qu8flUoaHfsv+4=;
        b=m9fMV5vEgIeT1LfWQ3t7rv4TEHy2Tb6RkZyLqQusvcKKuzLgqIjIRl/UcCle0kZf2V
         /3BVJHdmNlK/v6eq2nIorHdMkEUzw8Z+u3GPvlLVe+PJghl1DY3YpO6X7HrctMe49sZM
         1HnkLy6dytg272j435vToVU1jV8qSwOCZMyqhvcaZHjgLxDcRsR1e07R0fEiZlXjh/X8
         6c/AspEF/Ifhh8iBp8no+gfV9f2QwTUhV3NDnYQC0yjFcCJYJ/vk1UWlP/dCklwD5WwZ
         rQbyEavxhCBPCmH24ncDYKRsj+ZPm5JvlU6WDuiTEQIta9Oa65HRvLcaZOYV/hYeIEgm
         9IKg==
X-Forwarded-Encrypted: i=1; AL+hErH3etXc0wdmuX5ctXDtbO9o+tsVkOXS+mdWc/7CRz7C4aMHpsLCat0r+BbxOxa4bPYoXsYFktm7ZAIkDPe53Lzw@lists.infradead.org
X-Gm-Message-State: APuU4Z+LekUC/ubQHjLQcStDI/GPWg7PjOm8bhaG64XI7MQzLLFbjxrf
	6Kcl8u0r4Nptt1tqkH+WPXPqXgcHAb1m55NeRyyYhJ50Yr4k27vYWB5pJWk00b2M658=
X-Gm-Gg: AZFdTZeHfdt4qvN/5/v+Xyuw/nqWUHweLWbypfEmNb8rdvw2CFJTJE76HSYV+Pt+XIE
	F+HvexIWIIs0zgxdqvo8+SuQHFlmKX/4U571c8xGVp6VKVVfvWl616fHaEVkAC3pafUvwrSaPY9
	5udgFIzfTBgVG6s0DxIwjgz4Rk3HjSIS+fjrxY7Togg0P2jrX/HdKtgE7SQKehuGI4EGN0zS5Fx
	Xjg86WmRT6gLb6FJ9aTj4pNNdQM7e+54/jNqfOJzi6N1APtaBrKWvIVxTgvBqwEJKTz9CTc6kSc
	O+tMh9iVYgbYQNDfZJpQ7XNxweVdJPKqJONEWZsmiISp4gPIgZehNd39ddqKFJwGxJb+TEjA4zB
	10r0gA6ohX1s5MBoreQDf93p65KnH/ka3D7VqJUcH19ZY5maq5Tsfmp7y3LtjABanBqbebbc6Dk
	3tusgPT8o0jDkTFPUwg3LY/gPmb88Z9KXOsIScZKpCqMaQzcT6RhByAn7KO8KROJPsar5DgIP7y
	qhSw3YyuqWFiK0TpSsJy7RSX2kwakgSalwnkOgPRiyXHLf8hhJ7YqSRxj5iXorGcTUwURjwEl4R
	h1qJqg==
X-Received: by 2002:ac8:5706:0:b0:536:3760:e6cb with SMTP id d75a77b69052e-55d769e9387mr335085841cf.14.1795629348805;
        Wed, 25 Nov 2026 09:55:48 -0800 (PST)
Received: from ziepe.ca ([142.177.118.84])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55dbb8546ecsm18274511cf.4.2026.11.25.09.55.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 09:55:47 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xWHDf-0000000298s-0hJB;
	Wed, 25 Nov 2026 13:55:47 -0400
Date: Wed, 25 Nov 2026 13:55:47 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, will@kernel.org,
	robin.murphy@arm.com, honghuan@amd.com,
	Leon Romanovsky <leonro@nvidia.com>, joro@8bytes.org,
	prakash.gupta@oss.qualcomm.com, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] Revert "iommu/dma: simplify dma_iova_destroy() and drop
 the free_iova helper"
Message-ID: <20261125175547.GM246011@ziepe.ca>
References: <CGME20261125135138eucas1p141ba6b5e09623562e2033e290fba811c@eucas1p1.samsung.com>
 <20261125135120.1126571-1-sibi.sankar@oss.qualcomm.com>
 <a3722347-4b88-41ad-926b-455530020c6b@samsung.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a3722347-4b88-41ad-926b-455530020c6b@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_175553_105011_247AFB2A 
X-CRM114-Status: GOOD (  22.01  )
X-Spam-Score: -0.2 (/)
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

On Wed, Nov 25, 2026 at 06:21:06PM +0100, Marek Szyprowski wrote:
> On 25.11.2026 14:51, Sibi Sankar wrote:
> > This reverts commit 1acce29926d93f3eba427696fe3da6451504dae2.
> >
> > Before this commit, dma_iova_destroy() unmapped through
> > __iommu_dma_iova_unlink(..., free_iova=true), which set
> > iotlb_gather.queued from cookie->fq_domain, skipped iommu_iotlb_sync()
> > and freed the IOVA with the queued gather, exactly like
> > __iommu_dma_unmap(). After it, dma_iova_destroy() calls
> > dma_iova_unlink() and then dma_iova_free():
> >
> >   - dma_iova_unlink() never marks its gather as queued and always calls
> >     iommu_iotlb_sync() after iommu_unmap_fast().
> >   - dma_iova_free() passes a NULL gather to iommu_dma_free_iova(), so
> >     the IOVA goes straight back to the allocator through
> >     free_iova_fast() and never through queue_iova().
> >
> > DMA-FQ domains therefore get strict invalidation on this path. That
> > includes the block layer's blk_rq_dma_map() path, which NVMe uses for
> > all data transfers, so iommu.strict=0 has no effect on NVMe I/O.
> >
> > hw/sw details: Qualcomm Glymur CRD: SMMUv3 with no RANGE_INV,
> > 	       4K pages; NVMe SSD on PCIe Gen5 x4
> >
> > Fio sequential read/write numbers:
> >   Domain                          seq write    seq read
> >   DMA (strict)                    2694 MiB/s   2693 MiB/s
> >   DMA-FQ (lazy), flush queue      2707 MiB/s   2803 MiB/s
> >     bypassed (this regression)
> >   DMA-FQ (lazy), flush queue      10.6 GiB/s   11.9 GiB/s
> >     used by dma_iova_destroy()
> >
> > Fixes: 1acce29926d9 ("iommu/dma: simplify dma_iova_destroy() and drop the free_iova helper")
> > Cc: stable@vger.kernel.org # v7.3+
> > Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> 
> 
> The performance data clearly shows that the flush queue was there for
> the reason. Together with this revert it would probably make sense to
> apply the v1 of the reverted patch:
> 
> https://lore.kernel.org/all/20260701092033.422867-1-honghuan@amd.com/
> 
> Leon, do You see any other option?

Oh, there are a couple of issues here too, and reverting isn't fixing
the main problem with this..

The issue is the assumption we can separate the sync from the free:

       if (!iotlb_gather.queued)
               iommu_iotlb_sync(domain, &iotlb_gather);
       if (free_iova)
                iommu_dma_free_iova(domain, addr, size, &iotlb_gather);

We cannot. The gather must always be retired, either be calling
iommu_iotlb_sync() or by calling iommu_dma_free_iova(). It can never
just be left dangling.

Further you can't call iommu_dma_free_iova() with a NULL gather once
unlink has been called. That risks things out of order where the
rbtree can show the freed iova before the associated queued flush has
happened. That is a correctness issue.

I suppose the resolution here is to feed the gather up the call chain
and allow it to be retired correctly instead of trying to short
circuit it inside the API.

Jason

