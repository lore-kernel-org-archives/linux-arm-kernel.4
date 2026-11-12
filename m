Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7007E606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 17:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=U6NM4tBE;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=oYYD8G7d
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=lNd975OAog8I2j1v0LJVXqM6wE50rydPow/biRsPkN8=; b=U6NM4tBEVelxf5WR8LkDy/LRYU
	3vRz+3hgflWQouWEL88j6iKodOkJf5nHRwUcG0mBsRVQcOXfRFafyytxPU56IvGomLSHGoQUXaBbw
	SROp+FcYa92OODs7wEYtW7+k1VOcyq/mKbO8q3cjMzV8NfdCbZJKoVxjTPTuuvM7Jj0PjfgsNIvId
	TudL0QmAnPpVMnm9RkZgT/cUFWlFvZr+duqjKmuMF0wmpzvV1hQrOc19V9gR0DNlbfQruPMX6LRat
	sc7V/Weq6UmtuBuXPDEjEA/vpEl1BR0TqoJCmguBcDfXiLgmgZDfsNDsB9LdOAjQ9RY1dvggu8d7R
	SITFUCfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRYMx-0000000Aj4X-3RjZ;
	Thu, 12 Nov 2026 17:13:51 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRYMv-0000000Aj3y-3rC9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 17:13:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E1CFC1516;
	Thu, 12 Nov 2026 09:13:45 -0800 (PST)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6A93A3F632;
	Thu, 12 Nov 2026 09:13:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794503628; bh=rxrmCbZesyDZnjdX+PR1bLWDoY8nXPM2YzvhyRmcc2M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oYYD8G7d8eEOCS8yge37KP2L8iXFTmLr4JZN7JW2wFN8x9tL6pnuSrSIiAiFjL6Wl
	 vB4Q7z0uZB7FobGRNYH5vRk8vKKE2eozKCiHerNgIQlLdL6DLUOtoO07quMk7j/yUO
	 zuQI8EhxySQpOF1eoVvJ9+vYO9uHqS0sSNIEO99I=
Date: Thu, 12 Nov 2026 17:13:46 +0000
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>, Suyash Mahar <smahar@meta.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Qi Liu <liuqi115@huawei.com>, Junhao He <hejunhao3@huawei.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v4 02/10] coresight: etm-perf: Remove workqueue for
 freeing AUX data
Message-ID: <20261112171346.GL9176@e132581.arm.com>
References: <20261016-james-cs-multiple-per-threads-v4-0-dedf961aca0e@linaro.org>
 <20261016-james-cs-multiple-per-threads-v4-2-dedf961aca0e@linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261016-james-cs-multiple-per-threads-v4-2-dedf961aca0e@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_091350_077496_ABECCDD6 
X-CRM114-Status: GOOD (  10.71  )
X-Spam-Score: -4.4 (----)
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

On Fri, Oct 16, 2026 at 11:46:12AM +0100, James Clark wrote:
> AUX cleanup is deferred to a workqueue which is never flushed on module
> unload. Pending work items can therefore run after coresight-config is
> cleaned up or the module text is unloaded.
> 
> Since commit 95ff4ca26c49 ("perf/core: Free AUX pages in unmap path"), Perf
> core stops AUX transactions and frees the PMU AUX data from the unmap
> path in non-atomic context. Release the resources directly from the
> free_aux() callback and remove the workqueue.
> 
> Fixes: 0bcbf2e30ff2 ("coresight: etm-perf: new PMU driver for ETM tracers")
> Signed-off-by: James Clark <james.clark@linaro.org>

Reviewed-by: Leo Yan <leo.yan@arm.com>

