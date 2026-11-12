Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8BB5606A889
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 19:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Nid+95y/;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=dMalAwg4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=MlVYwKClSr6axkVUrsf5Q0/gbt/MU2NgZlbXv3TdhJo=; b=Nid+95y/rtjPpT
	dedIG4FL/7xiYj+DByqi9LpXckKFdw3pETuWFAoMYsSLu4bokOmo2yjavVqcohE/pVYa8asrbQqPu
	OamCcJODRcVkYi0GorUd+RNT4Dr6TORelBFCBpYKqnLzNnhhGXL1QPKkst2t3G7Z5MDUVGN0sjW9Z
	SbRh/8bBN+9veI9vA/q0701CqroYec9zHge+eLVJ4/m8gDFmZlhpdbcrJ+/CMunaEK+Bjb655sN7L
	qkJLhbJ9SJONj78QkHEbtfkzIyn7aitZoiJJlkFTzsCB95el8M9RyR6vPqEJBT0AMfA8DfXYfVWBI
	tTzUuYgz1JqClMwYWEkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRaqj-0000000AyH9-32hm;
	Thu, 12 Nov 2026 19:52:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRaq9-0000000AyE3-21ls
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 19:52:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DEA9E143D;
	Thu, 12 Nov 2026 11:52:05 -0800 (PST)
Received: from gaia.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 314893F632;
	Thu, 12 Nov 2026 11:52:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794513128; bh=Qn1sSaGxO+vJ/OI4LVM3KSf/PAWaWZcvH2r7l0WtDFE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dMalAwg4D4V11GtglDiciAsH1CIOvW0wiKBRJMTJRqkwqvppyFadYrD9i9e1KOQ6d
	 XaZJTrTpq7zdX01yAvHL7Q/+H7ypEJCScq9umkQj/XaFrI1xDhKuikjesnO25SEGOq
	 SkVbBI3G8Ex2o+VhAnoyh30a19eFbGVFB2cTCik0=
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>,
	Chris Down <chris@chrisdown.name>
Cc: linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	Mark Rutland <mark.rutland@arm.com>,
	Huang Ying <ying.huang@linux.alibaba.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	David Hildenbrand <david@kernel.org>,
	Mike Kravetz <mike.kravetz@oracle.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org
Subject: Re: [PATCH] arm64: hugetlb: Prevent write fault livelocks on stale TLB entries
Date: Thu, 12 Nov 2026 19:52:00 +0000
Message-ID: <179451296802.3304937.10304187215137449416.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <avPxZjjdBIlM_8_g@chrisdown.name>
References: <avPxZjjdBIlM_8_g@chrisdown.name>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_115210_201439_0D510ED0 
X-CRM114-Status: UNSURE (   9.16  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 10 Nov 2026 20:39:02 -0800, Chris Down wrote:
> In Meta production, we have had tasks get stuck in a fault loop while
> using hugetlb on arm64. During my investigations I found that affected
> tasks share a private hugetlb page.
> 
> Looking at the stuck task states, I found the following ordering:
> 
>   CPU0                                 CPU1
>   ----                                 ----
>   read page
>   [read only entry cached in TLB]
>                                        write page
>                                        hugetlb_fault()
>                                          hugetlb_wp()
>                                          [reuse folio]
>                                          set_huge_ptep_maybe_writable()
>                                            set_huge_ptep_writable()
>                                          [flush local TLB only]
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/1] arm64: hugetlb: Prevent write fault livelocks on stale TLB entries
      https://git.kernel.org/arm64/c/3c47ec82540c

