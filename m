Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CEF6606A323
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 18:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tY/Eiadm;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LRVKjS51
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=uTqOBQx0vgXwv13YeoLejNYHejF6xrAHQ5+KN1ozPjA=; b=tY/Eiadm209kf7pOVbsSJiNz7S
	r6hI31Wqz+H1kLhTfFR1mz9Sgek3v9mF57uocuzWSkR6CesePhGlnhEYYaXeLm8Ugs3t1iEFFQ7TW
	3FkU3IaENzw3kfBhX7SM1ODYXU60XKFpLdV5EMNBh+cpJdQcq8IAyF5zVAzMkUEtz1gkmqmYCbxV2
	hJJGxmzT5xu2Ed+NTCtqBsYuPF59eDUILDv/wvnp9qFu973ZCyCEEwk2msPIv4h5G2MGSro7B0SsK
	nIQ5B3nuRgTN9AmB5pJACIiY6wP26xE1zEQy5XJ1NwqLnptNEPTbgz/FjJVruwom93DmPD7IqxIqJ
	lC5m8eiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX0uI-0000000HSPg-2EbC;
	Fri, 27 Nov 2026 18:42:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX0u9-0000000HSNL-3rSe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 18:42:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id ABDB8459B5;
	Fri, 27 Nov 2026 18:42:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 329241F0092B;
	Fri, 27 Nov 2026 18:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795804961;
	bh=uTqOBQx0vgXwv13YeoLejNYHejF6xrAHQ5+KN1ozPjA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LRVKjS51t9MIhg2Gdqh8Xm/yZ71TJqurLZdEHmLcUEEKJuvdnR57wwUZJZSipiFXQ
	 EVqAwGDzGvilud6FHXhzB5NPktTp72SbeUpb9hzctFan2HEY3nTd4OnNZP/T2i4tVS
	 OBxLiX9v1O0/SyTVErbbEb9PZsgF9yTc743l3zzCT+poL59q1we+sb1+qrmLanvzWn
	 AkwUGU1gHTnbGOC7T6e6S4g8EbKadStJSlntrWU6HG6z+aeovdYWmTZr2aL8lupFbb
	 2yUWqaiFWDmFS7tUXtK49QAKeaf8kWnOMO6boUMpL9l3np5rn8fM+JXOoLGBo4d5w7
	 YIAjV9R/tBDcA==
Date: Fri, 27 Nov 2026 18:42:35 +0000
From: Will Deacon <will@kernel.org>
To: Leo Yan <leo.yan@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	coresight@lists.linaro.org
Subject: Re: [PATCH 1/2] perf: arm_spe: Order padding before publishing AUX
 head
Message-ID: <awnPG6QADpRAgEzx@willie-the-truck>
References: <20261015-add_barriers_for_perf_aux_output_skip-v1-0-5847d0578859@arm.com>
 <20261015-add_barriers_for_perf_aux_output_skip-v1-1-5847d0578859@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261015-add_barriers_for_perf_aux_output_skip-v1-1-5847d0578859@arm.com>
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 15, 2026 at 04:51:58PM +0100, Leo Yan wrote:
> The driver fills alignment gaps and calls perf_aux_output_skip(), which
> publishes the new aux_head without a memory barrier. A userspace
> consumer on another CPU can therefore observe the new head before the
> padding stores become visible.
> 
> Add smp_wmb() between the padding stores and perf_aux_output_skip().
> 
> Fixes: d5d9696b0380 ("drivers/perf: Add support for ARMv8.2 Statistical Profiling Extension")
> Assisted-by: LLM
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  drivers/perf/arm_spe_pmu.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/perf/arm_spe_pmu.c b/drivers/perf/arm_spe_pmu.c
> index b70f3fedf0282baba1395ce1116272ec5f961ea8..e105462ec5f38eab4776b0a654ba7c8a84f70f71 100644
> --- a/drivers/perf/arm_spe_pmu.c
> +++ b/drivers/perf/arm_spe_pmu.c
> @@ -487,8 +487,11 @@ static void arm_spe_pmu_pad_buf(struct perf_output_handle *handle, int len)
>  	u64 head = PERF_IDX2OFF(handle->head, buf);
>  
>  	memset(buf->base + head, ARM_SPE_BUF_PAD_BYTE, len);
> -	if (!buf->snapshot)
> +	if (!buf->snapshot) {
> +		/* Order the padding stores before publishing the new aux_head. */
> +		smp_wmb();
>  		perf_aux_output_skip(handle, len);
> +	}

This looks correct to me, but I wonder if it should be handled by
perf_aux_output_skip() instead? arm_spe_pmu_pad_buf() is called from a
bunch of places in the driver, including in conjunction with
perf_aux_output_end(), which looks like it already has the necessary
memory barrier. So doing it here seems weird inconsistent to me.

Will

