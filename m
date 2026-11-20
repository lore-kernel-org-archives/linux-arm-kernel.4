Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7971606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 19:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YnB2KnG3;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=F1RQGCTY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=X2bBvR1QxOsCaUt0RYJzY4W8RFF0dAdEhClCcOQk3Dk=; b=YnB2KnG3QnkQ6C5wATn8+1+o4m
	HIg3tzKeEIRwnoj6tB5qyWgI6gNVrjN0LbfOTnh8fjsEC2ttDtRmzblKvYm78fld1DD/SO/Xh6gl+
	Wq7z7YTcgAebDzWOjEfyl2ZWktmG8Aemxa5gQT7z8Ri72fHD5xPYyGBGT5TSSeOzb+tzmqJRCrcTe
	KPoE5K/eMPhu2GdBY2NHy8mRT+jxezkdZ4GmG8/FrCnDEv2rgdiyO1jhqD4Nvu6s2iif2/JO+9Kur
	GkoaXYyFB4Uz6/M+ewGZzqaeRcp0oe1W4xH4S7FSWLwBSn/GDuRhHCJsgxVUnyB9VOIe0esGOAyBE
	SySuQbVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUTvo-0000000G11O-342x;
	Fri, 20 Nov 2026 19:05:56 +0000
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUTvM-0000000G0ua-11uz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 19:05:29 +0000
Received: by mail-qv1-xf29.google.com with SMTP id 6a1803df08f44-92130d3ee15so13610876d6.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 11:05:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795201527; x=1795806327; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X2bBvR1QxOsCaUt0RYJzY4W8RFF0dAdEhClCcOQk3Dk=;
        b=F1RQGCTYqnvn380BfXbvSc2AS1V0vdJbf4j1Wwg+j6QJVcPwYxmYC/viSn0Dj+JX94
         jzn6Gh/YxbudBs5SYXoGCvX2KDyK5Yf+5MWcSS15kji28EZUDlBYSV5ZYtpdWe++XyIN
         9HDGOUeKKEgupsnyWV0KT4NwmLpSyPWdTJJLCvX6Sde3GauCq2sq9s7KMbpz+NP4f+Jr
         AbnQS/VBE5S7R7SEqeLp3uxasAtydHsakzwesPv5mzT7c/LBP6VQuwQAACr6E1BAvS3c
         0dsB1HnaZ/pwGoJc8Rxg123X4qLTke+GCbI7s0veVTxZ3KZ313KjzjodXMG/2bkCuC19
         P+bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795201527; x=1795806327;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X2bBvR1QxOsCaUt0RYJzY4W8RFF0dAdEhClCcOQk3Dk=;
        b=d4crohM3szfDtLiei1P4PuLR6hjUEsxfkTMNcCmi25aKR/e3qRppkS9FiXoyeQR8tR
         1wTwAbXUtiqqcW2uGmVB71hzWKSWYVByTMKg6k14hDEDaNhP7/S4Xn3I25zl7S1DOR31
         9bWPixJ2A1xWgKt9VNsBMem/TL4H6xEr7rHbUPK3QXE1JEfivPVpbtFS9cFn3VYp3Foq
         DiczHO3sC3Wgh0zGA/gKWrDq3ENqsG3qgrt9OVUBNWRgZVSsVxu7vXU5W3RYAVUuKfAN
         eZ/U8zXYiQftHrem2Xx2O4ZXPeSBIbPryE8GhmPU5nqYt1Tpj7CB4ubD3V/hBSaqwhj/
         8hTg==
X-Gm-Message-State: APuU4Z+g4DP4r3+eY2ehjtMIyzWBG7kZMOxhcM/DyFAnbJk99p64L0Sw
	j+fSsW1Twwxd6vHa4SMsoSJW+27dizpR7nrqu0i5yaz8MEkUiJfU1SXaD9TXvdBS1QM=
X-Gm-Gg: AZFdTZc9PpcGbPpVN9rTVH/2oZge6VgJFhs0CHy6BxmptvmnPlYCY34quyBlVqYKbAQ
	nJ5w5oQqKIQ509Le47pJJra71LpiIJJHu3SfECcxjFOzZJ/dYkGaa3S6xa+IpVgRUTF/JXv4b+Y
	7u8YOY8NsxzHpEI06XzQrwxTZsKcnIb3RL38NlOAovtBp74sJbBmuSKOox9RwSHiCmB6dk2fNzO
	UD5d9j6fdIoBqCUvcNtXttKy8Pd96aTlATH4426CKHr3F2ZXCTaQA5arX7LP3oz2WRzjdtNQD2f
	qZ9+QEBBAlEFj7CM8uQnhgSkzob0+V8hjXppuT+TsneBAlX6j1ZZ+jtMBM3Y4MdDJR4NX/tvapA
	arBadW9r/X03tSPL0zhyzsqEOqw0NlaerlCFF0rC8yE/03Ul2wgwjEqQcjkQ7Tl+jVl2DPCUgzg
	r0dYvXn0jsf+FHrW8Zd8Baz7TaMMvRSAaXu4/cizDRpJuT/4CYOsndc3v2DG70UzwPTRjDpKUeF
	xI6kEKEUv932bgNNZTdxtXuqW1bsdKcj75EKoYHGm/a45c0Au2M1LY9j2Xc63ZS/OnG/6gbGsZL
	+0RTbev47QiE13SM0mEWMa+lpVet
X-Received: by 2002:a05:6214:acf:b0:921:231f:b614 with SMTP id 6a1803df08f44-92134b5bac0mr71317106d6.39.1795201526852;
        Fri, 20 Nov 2026 11:05:26 -0800 (PST)
Received: from ziepe.ca ([142.166.156.71])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92134bf848dsm32999036d6.44.2026.11.20.11.05.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 11:05:26 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xUTvJ-00000004nGK-2Csw;
	Fri, 20 Nov 2026 15:05:25 -0400
Date: Fri, 20 Nov 2026 15:05:25 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com,
	will@kernel.org, Ryan Roberts <ryan.roberts@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Mike Rapoport <rppt@kernel.org>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH V3 00/14] arm64/mm: Enable 128 bit page table entries
Message-ID: <20261120190525.GC1133597@ziepe.ca>
References: <20261117070613.1183243-1-anshuman.khandual@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261117070613.1183243-1-anshuman.khandual@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_110528_347225_949C3EF8 
X-CRM114-Status: UNSURE (   9.99  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
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

On Tue, Nov 17, 2026 at 12:35:59PM +0530, Anshuman Khandual wrote:
> FEAT_D128 is a new arm architecture feature adding support for VMSAv9-128
> translation system. FEAT_D128 is an optional feature from ARMV9.3 onwards.
> arm64 platforms with FEAT_D128 enabled will now have two different memory
> translation systems i.e VMSAv8-64 and VMSAv9-128.

Please don't forget to update arm_smmu_sva_supported()

Jason

