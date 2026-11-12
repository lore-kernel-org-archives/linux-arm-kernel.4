Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B05060A3835
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 13:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Y1meQSZC;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Ir+GhsOF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=yRd8+Huvlp5plhQTndzEeeQ6oPa/Jct92yGvLHnpzEw=; b=Y1meQSZCeBIsE9n3t3m0BvyuNa
	RHtM4DOSQUY6EigoXFc3V+Hdv/NjvaZQwryTwz8BZHYokAgNKlv3gDThrI1A08kmfhxfS92DdSy3C
	8qkofaew5yPNuK6BKGfwh1j8lXAiaoaPq3PDkx3IDOFEqm89d2uDduyZd1OEGibOXta1D3diTr7Qp
	uTGxW7Cpijti9hSvLC4Pk3Javyd/AHxKEUfySlo9nBEnn3HB8+61LATc5pLjp0tE2q65c2RoMnP/Y
	wWSqMsueQOjwZklft5mGkbgBrWGbbBi+qC3Fak+Qn16zOZr5b5HJ42jgqL9iz/osm+4KuuqfthAO+
	84gKFVJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRUdJ-00000009zGL-025D;
	Thu, 12 Nov 2026 13:14:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRUd1-00000009z1J-0fI3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 13:14:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5389C1576;
	Thu, 12 Nov 2026 05:14:05 -0800 (PST)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 215A13F632;
	Thu, 12 Nov 2026 05:14:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794489248; bh=w1bnY+Ps4zITYTRUimdbVrN0cNHgFPf1y5ifSbYb950=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ir+GhsOFl4eXFwGT7DY570KXtbzdF31B+5y++WKx8y5Mt8D9PCavJtunWAPhq11FQ
	 3y9F+FQeN7oJYgE6McH1/9bBfmGxPdH3wzJzX2m8BupRfTjtvOMcJ34FftvP/WD6se
	 sCtXi4bJ4nt0qiwC4fHQYnZSriQiUhYjZrdlfgEs=
Date: Thu, 12 Nov 2026 13:14:01 +0000
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Kevin Brodsky <kevin.brodsky@arm.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>, linux-hardening@vger.kernel.org,
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
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org, x86@kernel.org, Ira Weiny <iweiny@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>, Thomas Gleixner <tglx@kernel.org>
Subject: Re: [PATCH RFC v10 07/22] arm64: Initialize POR_EL1 register on
 cpu_resume()
Message-ID: <avW7mVh-s90SdUYN@e129823.arm.com>
References: <20261109-kpkeys-v10-0-aa6c4d9603bc@arm.com>
 <20261109-kpkeys-v10-7-aa6c4d9603bc@arm.com>
 <be361be8-c5ad-4ff7-a6db-7b0815bfe1d0@sirena.org.uk>
 <avNH_AdvK9AqvfF7@e129823.arm.com>
 <7b92f7c8-1543-447e-8ef3-aba608141699@arm.com>
 <6808f3a6-1c12-4cb2-a109-30704d812490@sirena.org.uk>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6808f3a6-1c12-4cb2-a109-30704d812490@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_051411_661316_2CD5778F 
X-CRM114-Status: GOOD (  11.49  )
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

On Thu, Nov 12, 2026 at 01:02:16PM +0000, Mark Brown wrote:
> On Thu, Nov 12, 2026 at 01:38:13PM +0100, Kevin Brodsky wrote:
> > On 10/11/2026 17:36, Yeoreum Yun wrote:
> 
> > > Thanks. seems required to isb() after initialising SYS_POR_EL1.
> 
> > Agreed (as Sashiko reported as well). Presumably that means we also need
> > an ISB after writing to POR_EL1 in cpu_enable_poe(), as that's basically
> > the same situation.
> 
> Possibly just have one before writing TCR2_EL1 rather than for each of
> the indvididual features, that's harder to mess up?

I'm not sure that's necessarily better, as we'd end up executing an isb()
even when POE or other features aren't enabled.
Wouldn't it be better to execute an isb() only when needed?

-- 
Sincerely,
Yeoreum Yun

