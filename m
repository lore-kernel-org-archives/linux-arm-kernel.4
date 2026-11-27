Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F10DB606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 18:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ztgm1VFz;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WPREk5If
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=qrI+q31BIpWtMoEbziu548DpuRgk3fdVsj3KMauVdqQ=; b=Ztgm1VFzuM6k8gAZ4frdf9krMx
	guEU9X7NAR8KdHqKmx7g0+YiETNanX2E1FbmF27isp5OG7/IWrNE+KOMO72AgDAqt40f6EnCDq2Cg
	aGG2hdXMnNHzCnAqRAdSyx9wi+L9XH0VGUUtT6YOfsIIw5RK+J4fM5cHHtxXnk6LuxseSJVXjf6Qo
	TvP/IQTsocDmnywll1cxvq2IMNzkgHDiHO5JQdwOgGIGl2A9Bl8yrQA1PUL9QcDLs9s/O/PMs6MQ/
	veUaiuQdRUzbYAS2K8IPxiAyOQfBAmOLOOFVGoGEhFuUjtxTmAdzuH5OIZR4aVQwySugqCEVPQ3+q
	0UloUjOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX0vR-0000000HSql-2Zk8;
	Fri, 27 Nov 2026 18:44:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX0uY-0000000HST0-17Qj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 18:43:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0C56D401F3;
	Fri, 27 Nov 2026 18:43:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB8E31F0089A;
	Fri, 27 Nov 2026 18:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795804985;
	bh=qrI+q31BIpWtMoEbziu548DpuRgk3fdVsj3KMauVdqQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WPREk5If5fx4c3eNJOCqTPQJnLKG1UkUOw+ME9wh9lL70Eb4bii/CkcUosaOQHVZm
	 xYT28Bmw07Sjk1H4ANb2WECnCkli+gmX2p6T0A6docMsBUL+/UKF+NhGC+uxa8NCVn
	 YveYex0mi5DzkGsxF9o+l+l61Hn+jRx3K3BqL8YFT1uitTWyWU7vnurDBzBTHxe6pA
	 Rbmdjc6/rhgN65WynmuEGWqxbCrl8G5NlriduOU0rTIdn3ifZPFuwep1raWAEz3ESH
	 LzE1NhO8zTEjjIYr1YwJw5cBbIAuABjN0kuvhB5biMiMZ+jgjqiqUGsXrLqtOxOXKD
	 9K1VAI+S1nwyA==
Date: Fri, 27 Nov 2026 18:43:00 +0000
From: Will Deacon <will@kernel.org>
To: Breno Leitao <leitao@debian.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kas@kernel.org, kernel-team@meta.com
Subject: Re: [PATCH] arm64: Kconfig: Don't select CPUMASK_OFFSTACK with 64K
 pages
Message-ID: <awnPNMn6AIH17d_K@willie-the-truck>
References: <20261007-arm_stack-v1-1-b48dad5fa8b2@debian.org>
 <auCSG2OmNMQKp3dq@gmail.com>
 <auRxNDAe_tv-mCvk@willie-the-truck>
 <auR0kSCYyo31Inxf@gmail.com>
 <auSFVKVuGryqTgjG@willie-the-truck>
 <auSem6kzc2d52n-H@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <auSem6kzc2d52n-H@gmail.com>
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

On Fri, Oct 30, 2026 at 06:50:18AM -0700, Breno Leitao wrote:
> On Fri, Oct 30, 2026 at 11:53:56AM +0000, Will Deacon wrote:
> > Because you might have thousands of CPUs?
> 
> I checked that case. I built defconfig with 64K pages and NR_CPUS=4096,
> with and without this patch, and compared clang's -fstack-usage output.
> 
> With the patch, 62 functions grow by 512 bytes or more. The worst are in
> cpuset: update_prstate(), cpuset_write_resmask() and
> cpuset_handle_hotplug() grow by ~1.5K, to 1648 bytes. Nothing crosses
> FRAME_WARN, and the largest frame in the build goes from 1312 to 1648
> bytes, out of a 64K stack.
> 
> I believe this higher frame usage is still way better than the kmalloc
> at function invocation (the reason for this patch), but honestly I don't
> have real numbers, and I am happy to take them, if it is worth.
> 
> > Because copying these things by value could be expensive?
> 
> Hmm, I _think_ having the cpumask on the stack or not doesn't change how
> it is passed. cpumask_var_t is either a pointer or a one-element array,
> which decays to a pointer, so callees get a struct cpumask * in both
> cases.
> 
> Which copies do you have in mind?

Fair enough, I hadn't looked too closely into that. But the fundamental
observation remains that the page size and the number of CPUs are
unrelated.

Will

