Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9935606A321
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 17:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nwvcY7VN;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=X7i4vWnS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=LRHO5lmdhVp8ikZ9+SxeuhVOjOelared/N/6wvFgJ7Q=; b=nwvcY7VNB4tcwlv72fEyiei9L7
	O8Xk2qrnaJJID2sfbX8CXrhjnGf2wXw7R5eIbW6/wxOAUp0gR4ECxm9fr4ragqNyW6aEApHlgwKIo
	p3zy+NqGp1jRsL74R36soQ+ZY/bwmCZ4SZPLED5m+KI6MO7aUOGWjnbks+kTIj0eNxlVEIG6vVrcO
	SYAcD4ayOzqF0rkvvU4iioJw4ckBXo0tTddiQSOIxh6yBwcR63/zYCxmix/RrDGYGCnegjPKFvO8K
	miY8HgRt2JLrv0yZXpNAqtD5FvqJAQMDlTxPjSgYv0o/8bIWdDO7iiQ/zC541ZXXep+pJXhMIXogA
	6b5adyMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRYK3-0000000AimR-1wfY;
	Thu, 12 Nov 2026 17:10:51 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRYK1-0000000AilM-09PP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 17:10:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 18BC11516;
	Thu, 12 Nov 2026 09:10:43 -0800 (PST)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9C4113F632;
	Thu, 12 Nov 2026 09:10:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794503446; bh=GXl24yWWtZO9v/KHQgClTSYkqQLlBzrjLfrp8Pe0W0s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X7i4vWnSoc312bqGeIF8SzhZ2FHjBr8SOrqg8v+VNd8eNeMjmJjOoUDoWUBobe/P2
	 YOCSxGgV0fpPgUQoreaKJP0wE1RbBGGniEKgB8lr0iXGpR3CW9m5RU7Qek0XslN4Yb
	 nLAPwI/58VBTo+bZ6+IBbNjHK8BR0zV9KSlwVXfc=
Date: Thu, 12 Nov 2026 17:10:43 +0000
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>, Suyash Mahar <smahar@meta.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Qi Liu <liuqi115@huawei.com>, Junhao He <hejunhao3@huawei.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v4 01/10] coresight: configfs: Don't assume active until
 cscfg_mgr is set
Message-ID: <20261112171043.GK9176@e132581.arm.com>
References: <20261016-james-cs-multiple-per-threads-v4-0-dedf961aca0e@linaro.org>
 <20261016-james-cs-multiple-per-threads-v4-1-dedf961aca0e@linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261016-james-cs-multiple-per-threads-v4-1-dedf961aca0e@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_091049_139436_C940C6C5 
X-CRM114-Status: UNSURE (   8.01  )
X-CRM114-Notice: Please train this message.
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

On Fri, Oct 16, 2026 at 11:46:11AM +0100, James Clark wrote:

> +static enum cscfg_load_ops cscfg_get_state(void)
> +{
> +	return cscfg_mgr ? cscfg_mgr->load_state : CSCFG_UNLOAD;
> +}

Could we check !cscfg_mgr explicitly in the three functions instead?

Using CSCFG_UNLOAD to represent both "not initialized" and
"cfg unloading" is a bit confusing.

Thanks,
Leo

