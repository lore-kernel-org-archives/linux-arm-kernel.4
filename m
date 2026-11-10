Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55162606A20D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 16:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CwEeja+T;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=sYozmqnT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=/2IklnXQ8VDOasmnc4s8LlsX94sJzF0TyhpWpFGrd40=; b=CwEeja+TBIVKghdFMqhJimU8ck
	5YZ8sLJeQo0bU+XnYEHYS8bLHVJHi7jxUy4cpCVDQnEG3ALHkommum3TEWJ1nULR9m9KvP6qjjGNO
	PrVmKBM9VPM8XwVFMx1d9uRmZ0FIIJfRugQwHlOmlgJf4arWM3j4ojOzaoCXNIUx/lf4imDGfIoNd
	57bSwyYfZYh16dOSc4UX4RBFP+Upex9/uPZe0gxdWWPst0v5vgfOQuf7fI7LN6vVFoK7kkS/K45H5
	iWMtV4MfPU/zro6zIyvy7sDrHBHXWIyNblAjLS+lW9hywsX29P48DETowyeMRiUqPkBsHwhamx0bs
	sKLyPxWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQope-00000004ZMH-3z7e;
	Tue, 10 Nov 2026 16:36:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQopa-00000004ZK8-3qqh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 16:36:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3924B1477;
	Tue, 10 Nov 2026 08:36:16 -0800 (PST)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 234893F85F;
	Tue, 10 Nov 2026 08:36:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794328579; bh=W93zuHvv0B3GjuQYbnfR2B0hYUYTD/1HhAutAvOyHc8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sYozmqnTmmj1HDyt+LmelivUTXfURzy4ZuotqpQSAnyER6/dyDFtKIFkVkn0SmpO+
	 O+RU5XZyaIzhycu65Pmw23utreNYCUqv9PnuZP1DrGLbr5D7k6uP7oHKi7dXqKJdYN
	 CbmlR/v3UEIQ3c8AHIpFUW0pKrLveLcUhkh7pNdA=
Date: Tue, 10 Nov 2026 16:36:12 +0000
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Kevin Brodsky <kevin.brodsky@arm.com>, linux-hardening@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Ard Biesheuvel <ardb+git@google.com>,
	Andy Lutomirski <luto@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"David Hildenbrand (Arm)" <david@kernel.org>,
	Jann Horn <jannh@google.com>, Jeff Xu <jeffxu@chromium.org>,
	Joey Gouly <joey.gouly@arm.com>, Kees Cook <kees@kernel.org>,
	Linu Cherian <linu.cherian@arm.com>,
	Linus Walleij <linusw@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Maxwell Bland <mbland@motorola.com>,
	"Mike Rapoport (IBM)" <rppt@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Pierre Langlois <pierre.langlois@arm.com>,
	=?iso-8859-1?Q?Pierre-Cl=E9ment?= Tosi <ptosi@google.com>,
	Quentin Perret <qperret@google.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Vlastimil Babka <vbabka@kernel.org>, Will Deacon <will@kernel.org>,
	Yang Shi <yang@os.amperecomputing.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	x86@kernel.org, Ira Weiny <iweiny@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>, Thomas Gleixner <tglx@kernel.org>
Subject: Re: [PATCH RFC v10 07/22] arm64: Initialize POR_EL1 register on
 cpu_resume()
Message-ID: <avNH_AdvK9AqvfF7@e129823.arm.com>
References: <20261109-kpkeys-v10-0-aa6c4d9603bc@arm.com>
 <20261109-kpkeys-v10-7-aa6c4d9603bc@arm.com>
 <be361be8-c5ad-4ff7-a6db-7b0815bfe1d0@sirena.org.uk>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <be361be8-c5ad-4ff7-a6db-7b0815bfe1d0@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_083623_076936_83239B51 
X-CRM114-Status: GOOD (  13.10  )
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

On Tue, Nov 10, 2026 at 03:53:30PM +0000, Mark Brown wrote:
> On Mon, Nov 09, 2026 at 03:58:32PM +0000, Kevin Brodsky wrote:
> > From: Yeoreum Yun <yeoreum.yun@arm.com>
> > 
> > The POR_EL1 register is reset to an unknown value after cpu_suspend().
> > Since POR_EL1 always holds POR_EL1_INIT when entering cpu_suspend(),
> > initialize POR_EL1 with POR_EL1_INIT before cpu_do_resume().
> > > +#ifdef CONFIG_ARM64_POE
> > +alternative_if_not ARM64_HAS_S1POE
> > +	b	.Lskip_por_set
> > +alternative_else_nop_endif
> > +	mov_q	x2, POR_EL1_INIT
> > +	msr_s	SYS_POR_EL1, x2
> > +	/* isb can be skipped since cpu_do_resume() will do it. */
> > +.Lskip_por_set:
> > +#endif /* CONFIG_ARM64_POE */
> 
> cpu_do_resume() will update TCR2_EL1 to enable POE again, a sufficiently
> unhelpful implementation could potentially decide to do that before this
> POR_EL1 value takes effect AFAICT given that there's no barriers.

Thanks. seems required to isb() after initialising SYS_POR_EL1.

-- 
Sincerely,
Yeoreum Yun

