Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8C04606A88C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 19:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XSWRxGV/;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=sJ6IJ1gu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=hYKrXo3r1holufW7AcHtZgDm/1s3GasnuMhptxVhdNA=; b=XSWRxGV/SLMC9M
	9tX0PWiaOR6c/Oy85ps+3fpynCGyqOEyFvHzdmzHSyPEXikLym1tDjy3g8mlQXcVmJ0eZWVN6HqQc
	j+876EIFLyR8f+I5oTZhiwiFn1XaosBYxYW4MvOLUAHDxSA33Xo7Pxcnkp4IvGawaL75DZu1uNQdP
	TV0tAD8g7s7zyUV/7hLvz35CMoMO6dB2SGZD9uEp1B3rYSKq/TXPVz9sxTP0hgvxA9tu4sdA9fhDb
	D+JVl3rlJYCO8eTpfKODF5H9VTbUXZrZ12JPn6oXPmdF5MulI1AfxnsmsjRpDIGI2h83MrLgpPA4D
	VqH+WVjmNWbECwafnHew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRaqj-0000000AyHW-3Xaa;
	Thu, 12 Nov 2026 19:52:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRaqG-0000000AyEi-48e3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 19:52:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5624D165C;
	Thu, 12 Nov 2026 11:52:13 -0800 (PST)
Received: from gaia.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 751393F632;
	Thu, 12 Nov 2026 11:52:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794513136; bh=nzXj1rL608SvCKmeouEdQMlkLBeYWbBshMWDCnenC7k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sJ6IJ1gu1+aTPx9IErkAHP9oAy80fnJm+AzVzxBbOHeKmVUf/WNZCVckq4ot5jGY0
	 ICY5yoD/UEP0Lyl5KGImaaBCXgLtKuMjYkxDTkeoJHtHW9hiVggOnC1y69nK7skRJH
	 5LmecvElJd8fsswmmAk2M9BYt5pCXE2yEi7B2tbM=
From: Catalin Marinas <catalin.marinas@arm.com>
To: akpm@linux-foundation.org,
	baoquan.he@linux.dev,
	graf@amazon.com,
	leitao@debian.org,
	mark.rutland@arm.com,
	mpilaniy@redhat.com,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	will@kernel.org,
	yeoreum.yun@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jinjie Ruan <ruanjinjie01@gmail.com>
Cc: ruanjinjie@huawei.com
Subject: Re: [PATCH v9] arm64: kexec_file: Do not use CMA for images with a non-zero text_offset
Date: Thu, 12 Nov 2026 19:52:09 +0000
Message-ID: <179451296806.3304937.7524260457442565579.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261109041324.3642034-1-ruanjinjie01@gmail.com>
References: <20261109041324.3642034-1-ruanjinjie01@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_115219_625545_7486133D 
X-CRM114-Status: UNSURE (   9.04  )
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
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 09 Nov 2026 12:13:24 +0800, Jinjie Ruan wrote:
> image_load() adds text_offset to kernel_segment->mem and subtracts it
> from kernel_segment->memsz.  For CMA backed segments this breaks the
> load path: the payload is copied to page_address(cma), which is the CMA
> base, while image->start is set to the adjusted address, so kexec jumps
> into the middle of the kernel.  kimage_map_segment() has the same
> mismatch when a segment has been moved.
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/1] arm64: kexec_file: Do not use CMA for images with a non-zero text_offset
      https://git.kernel.org/arm64/c/18f2d01bfce9

