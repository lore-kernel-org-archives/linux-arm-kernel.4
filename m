Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68919606A323
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 18:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dxv/diK3;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=kIgW7C7W
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=sAIJKsddtsG4PZLTb3AFGJ2ogaGi60GX16MSJGzvEmk=; b=dxv/diK35JCosGWGt5uQOptvIx
	bX4RFiv/Zedf3+EYyzPuH7d8T61edafT65sc1laNF+fE4iDnobIz675iGoHZ5+bIwZk1lLViuWM3+
	6a8Wu6gVIn7eB9cqngGT8d0K2cOidE8OfSWp0C7Ohizw4IGJtb+PhGOdDlCN8H3w9O5TpwlZFcknQ
	TyVFkdK1ohqpgk4nHT0yJLWtXfWTY9aw+jodPvKBBzXupHL2lOXOqErnvZhrqKD4UrB4Cn0IEbA6f
	ctagI1cBs2U1HowemrDaKVT8jROvLuLDWKh7Ho8DMl6YtyqMtuQSN1QAFzg1FbHo1LcKmbQyY+5Iq
	ziF0lcNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRZEl-0000000AqYi-0jI5;
	Thu, 12 Nov 2026 18:09:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRZEi-0000000AqXx-1D5K
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 18:09:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 50BC51516;
	Thu, 12 Nov 2026 10:09:19 -0800 (PST)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EF4593F673;
	Thu, 12 Nov 2026 10:09:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794506962; bh=sAIJKsddtsG4PZLTb3AFGJ2ogaGi60GX16MSJGzvEmk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kIgW7C7WqLM8XV7zDA8TE14RvzYRHPZw6v+7dkHVt5NZC6TLa/mSCzX7qh/kBk2k1
	 3bf5QgekVvGaXdymPQyVSfnfDPWZNSy1cN/xUFiAOZL/Uo7AjnNJ3gP3m0k1d9mpvL
	 wqBdLmpUnYcnR8X6rtmVP/onxfLdqpmGEz4xN6iQ=
Date: Thu, 12 Nov 2026 18:09:20 +0000
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>, Suyash Mahar <smahar@meta.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Qi Liu <liuqi115@huawei.com>, Junhao He <hejunhao3@huawei.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v4 03/10] coresight: etm-perf: Serialize AUX topology
 access
Message-ID: <20261112180920.GM9176@e132581.arm.com>
References: <20261016-james-cs-multiple-per-threads-v4-0-dedf961aca0e@linaro.org>
 <20261016-james-cs-multiple-per-threads-v4-3-dedf961aca0e@linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261016-james-cs-multiple-per-threads-v4-3-dedf961aca0e@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_100924_441550_D9067915 
X-CRM114-Status: GOOD (  12.14  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 16, 2026 at 11:46:13AM +0100, James Clark wrote:
> Perf AUX setup walks the CoreSight connections to select a sink, build
> paths and acquire references to the devices and their helpers. Unlike
> sysfs tracing, it does not hold coresight_mutex. Driver registration and
> removal can therefore change or free connections while setup walks them.
> Adding a CTI helper can also reallocate an existing device's output
> connection array even when the device is already referenced by a path.

I agree that bus traversal and devices acquisition need protection.

> Hold coresight_mutex from sink selection through buffer allocation.
> The allocation must also be protected because ETR buffers can look up a
> connected CATU. Release the mutex before calling etm_free_aux() on error.

However, my concern is about the locking semantics. We should clearly
identify the races that coresight_mutex is intended to protect and
limit its usage accordingly. My understanding is that coresight_mutex
primarily protects CoreSight bus operations.

Holding it across the entire perf AUX setup might silence AI review
warnings, but it may abuse the lock and hide synchronization issues in
the CoreSight core APIs. OTOH, I'd say SysFS mode should not acquire
such a big lock as well.

BTW, I think this change is a distraction from the per-thread fixes.
My understanding is that this series aims to fix multithreading with
a shared sink, so we can address device lifetime issues separately.

