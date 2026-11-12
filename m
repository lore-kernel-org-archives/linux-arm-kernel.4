Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB78606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 14:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tXxCe+to;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=JX1cQ+Td
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=BFy9u/Lz/j1zu1UciRBWtjJF5+BPg31bTX7GjReY5Wc=; b=tXxCe+torABXYN/51+Ba+jV+2I
	9SHhcbyfuF2cGFpqml7jZBFvCusIE3L0LwdjEneAdkl0SWgswvpP+y7J2zePyO2u5MSg8eTFEigK5
	nZNpoLh/KRbG7yACp3iGsFwHb9StMtwdWxMIzLxZobXaKfSFFs+mwcjcJXtbRYeOGwu/07t0/bIe2
	SlQftHoE6WcJ68/8J5OtnuNiR+QQhwq2yxACgwlVXPkt/7WCZvsF89SMe9edeuhBSUvM68ITeLbrN
	t4vMKvvah6AXPYJWV6glwvtUWJjVhRSjgGrKnFOYbWqjo+F2GeriozTdvHERuvHmfFZ+1WDHaykdN
	DJwl70Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRW46-0000000AJKq-2mGs;
	Thu, 12 Nov 2026 14:46:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRW43-0000000AJJd-0zey
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 14:46:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4824A1516;
	Thu, 12 Nov 2026 06:46:07 -0800 (PST)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E720C3F673;
	Thu, 12 Nov 2026 06:46:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794494770; bh=5IqOtTt0AmJdnXGpyO4sEh+N/5oyMsw1pG8wT949+5g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JX1cQ+TdoX2Xj0hHNr0KAuI9aYqWK68oXoyp16N+OQH5mHE5wrsQLYlIhrjDYBlBj
	 8L0bJPCsw9B7H4CNUiF2CnK9WZYFXGBLG8BYHLNmWOXuRJnb1hBmoy613khDIPIyUB
	 6xhR0R3dBbm3x9Yus8KnOCFXPPHxylHg4VHoqZxU=
Date: Thu, 12 Nov 2026 14:46:07 +0000
From: Leo Yan <leo.yan@arm.com>
To: Shuai Xue <xueshuai@linux.alibaba.com>
Cc: stable@vger.kernel.org, sashal@kernel.org, gregkh@linuxfoundation.org,
	yeoreum.yun@arm.com, suzuki.poulose@arm.com,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] coresight/etm4: fix missing disable active config
Message-ID: <20261112144607.GJ9176@e132581.arm.com>
References: <20261112135406.71749-1-xueshuai@linux.alibaba.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261112135406.71749-1-xueshuai@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_064611_335287_999D3DC0 
X-CRM114-Status: GOOD (  12.47  )
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

On Thu, Nov 12, 2026 at 09:54:06PM +0800, Shuai Xue wrote:
> From: Yeoreum Yun <yeoreum.yun@arm.com>
> 
> commit 895b12b7d7b8c651f73f57a1ea040d35aa7048cb upstream.
> 
> When etm4 device is disabled via sysfs, it should disable its active
> count.
> 
> Fixes: 7ebd0ec6cf94 ("coresight: configfs: Allow configfs to activate configuration")
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> Reviewed-by: Leo Yan <leo.yan@arm.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> [ shuai: kept spin_lock()/spin_unlock() in etm4_disable_sysfs(); 6.6.y does not have the raw spinlock conversion ]
> Signed-off-by: Shuai Xue <xueshuai@linux.alibaba.com>

> ---
> Note for stable maintainers: this is patch 1/3 of LKML series
> 20250514161951.3427590. Its siblings are already in 6.6.y: 2/3
> (53b9e2659719) as 1cd09aaf47a5 and 3/3 (408c97c4a5e0) as
> b3b4efa2e623, but this one was only ever picked into 6.15.y
> (c7f2b00d5e17e) because it does not apply cleanly to 6.6.y without the
> raw spinlock conversion. Without it, each sysfs enable/disable cycle
> leaks one config_desc->active_cnt reference and the module reference
> taken on the config load owner, so the configuration module can never
> be unloaded.

Makes sense for me. This backport should be applied on both 6.6.y
and 6.12.y.

