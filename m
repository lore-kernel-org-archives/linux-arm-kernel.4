Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E12B5606A339
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 16:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eddfykNl;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=MdINvNsj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=3lKSc+Bc+1wSufdoeF5bFWTjYJCqmuJF4q+Yk/oXdGQ=; b=eddfykNlicqsBO/wQia6C7VeFW
	0OuUghqm3m3kgLo9eb4eAzgzoJ8+ildbluOlLd5Zpe/NnHt6u1whWsLw5GNLyPYVfo6NiEqBXgsG0
	juSkj4YYhG40giU1AKJZjFICE+N4/DlA3yV+/QbhVbM2B7NrS6/k7zdN+kUKXsfBsyCk7k0U2cS1Z
	u6hiGQns4onFVQ4XFNr/tsHRSmpzjk8TqGONKuIpWDGvU716VAPIKD8VyNvBn+k2VAeYSbsZ0kvzU
	LOkVitkuVqioQ6wzqDnYzQ3IkUdJT3o7NYgyuxtMGhXMKDcUJy0fKmQBSo+ZS0EszW6yV/S8SZwf4
	XATUhuxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWc7n-0000000DsPl-00fg;
	Thu, 26 Nov 2026 16:15:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWc7k-0000000DsOg-2eo8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 16:15:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3DB481BA8;
	Thu, 26 Nov 2026 08:15:00 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 58DE03F86F;
	Thu, 26 Nov 2026 08:15:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795709703; bh=YbnSTX7ECabj5Kpk98lfgm3U879E7bHUwxxQyn3DVZo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MdINvNsjaxy3RRyoti23H/RAjpnn5we+doDDB2J4iLXsEWNA4PciuUHkY4S9rmvW9
	 KGBKC3hmabiW3RgyXHJ+kF0KVxTZx1HIbM/Kf+mDXlGBJrUJDZQIc5HQ1GjxrkSQen
	 aYhBSkVOVHuPL0zuXw6RauaOcWG9cJ9jyDD7qSb0=
Date: Thu, 26 Nov 2026 16:14:59 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Thorsten Blum <blum@kernel.org>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: cacheinfo: Simplify init_cache_level()
Message-ID: <awhbA7pxop_WyMTK@arm.com>
References: <20261104083632.65715-2-blum@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261104083632.65715-2-blum@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_081504_720367_D1DA44DF 
X-CRM114-Status: GOOD (  21.01  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 04, 2026 at 09:36:31AM +0100, Thorsten Blum wrote:
> acpi_get_cache_info() already sets fw_level to 0 on failure, so drop the
> redundant check and the manual assignment.
> 
> Use unsigned int for fw_level to match the expected type, and remove the
> now-unused local ret variable.
> 
> Signed-off-by: Thorsten Blum <blum@kernel.org>
> ---
>  arch/arm64/kernel/cacheinfo.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arm64/kernel/cacheinfo.c b/arch/arm64/kernel/cacheinfo.c
> index 309942b06c5b..881131fb4934 100644
> --- a/arch/arm64/kernel/cacheinfo.c
> +++ b/arch/arm64/kernel/cacheinfo.c
> @@ -67,19 +67,15 @@ int early_cache_level(unsigned int cpu)
>  
>  int init_cache_level(unsigned int cpu)
>  {
> -	unsigned int level, leaves;
> -	int fw_level, ret;
> +	unsigned int level, leaves, fw_level;
>  	struct cpu_cacheinfo *this_cpu_ci = get_cpu_cacheinfo(cpu);
>  
>  	detect_cache_level(&level, &leaves);
>  
> -	if (acpi_disabled) {
> +	if (acpi_disabled)
>  		fw_level = of_find_last_cache_level(cpu);
> -	} else {
> -		ret = acpi_get_cache_info(cpu, &fw_level, NULL);
> -		if (ret < 0)
> -			fw_level = 0;
> -	}
> +	else
> +		acpi_get_cache_info(cpu, &fw_level, NULL);

I wouldn't assume the caller always sets *levels to 0. It may do this
now but the kernel-doc is not entirely clear. It claims that it sets it
only on success with some muddled text about returning 0 on failure,
which I guess may have been intended as setting *levels to 0.

This also relies on ACPI_PPTT being selected which is true for arm64 but
we can't simplify the checks here just because of Kconfig options. It
doesn't cost us anything to check the return value, the patch doesn't
make the code easier to read. So, NAK.

-- 
Catalin

