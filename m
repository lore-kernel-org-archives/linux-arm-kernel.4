Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BDB9606A323
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 18:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sfXW9+hB;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=ibgjXQfZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=cFQo402s/Fz6nnj+eeiUW50ni9vNMRzPOqJuqB/lQEo=; b=sfXW9+hBJwFWJFFpFz6Jru6ceZ
	HUwXpSOKVrsolrYzRYcl6IW1QYO8DYeZ09XkDswaNsUfBNxmJS9ZJnPMwI9m17MaIEgHpoOk5XyL+
	MugzL9c1K9Gxna+43UXULplcAeM8BM0Uk+Y4UUULOHmsQetZLtm5DA4BLMUJ1iZ/Q0xUxDRQMwoge
	1tCgM+39RkuzAIUwdkGngR2SImW5iWsuu+/cSHd4YCTp28ALF1YAyk9NKerlhd8qgBQzCFAnlwFPo
	LVz3xq1pZarv8t1lh7dF38jyTK0n+86E9W4GA4GkdLX1OwjCNstBeaXJW82rxPHjUB+lbo/0Si5ug
	/MUtPdIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWe0E-0000000E9y5-1OyE;
	Thu, 26 Nov 2026 18:15:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWe0C-0000000E9xe-0OaP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 18:15:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 206EF1BCB;
	Thu, 26 Nov 2026 10:15:20 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 34E3E3F86F;
	Thu, 26 Nov 2026 10:15:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795716923; bh=fFLmeqXRVi+pIZg64SKPcWKpICPRmHJIpCmWyIyl1CE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ibgjXQfZuWDo6i5tet1FFpwyi0Q9bZeCLyXXso0ez5znuAjoDvnB0rPJgkTB0SF0D
	 TDV5g54Vs6Kgc5EMutlaN4aMfG6jdlkfnzMjUtz40sa1sqCCDo5TgmPOm2LE4Z1keJ
	 EeJPSrq37ZpN0w7J2fOZZBJep4GYln/jZxchKhME=
Date: Thu, 26 Nov 2026 18:15:19 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Tal Zussman <tz2294@columbia.edu>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: mte: use a folio in __access_remote_tags()
Message-ID: <awh3Nxe_NMHIDl54@arm.com>
References: <20261031-arm64-mte-folio-v1-0-a8bc2960d11e@columbia.edu>
 <20261031-arm64-mte-folio-v1-1-a8bc2960d11e@columbia.edu>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261031-arm64-mte-folio-v1-1-a8bc2960d11e@columbia.edu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_101524_173716_FE4DF603 
X-CRM114-Status: UNSURE (   9.49  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, Oct 31, 2026 at 04:44:53PM -0400, Tal Zussman wrote:
> __access_remote_tags() looks up the folio for the hugetlb check but
> still uses the page everywhere else it can use the folio. Use the folio
> for the rest, which removes the hidden compound_head() calls.
> 
> This removes the last use of set_page_dirty_lock() in arm64.
> 
> Signed-off-by: Tal Zussman <tz2294@columbia.edu>

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

