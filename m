Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3AC1606A329
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 13:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tY+49pAw;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Tn81L3WM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=y5R7blodr4KyIr57H0lgE0jfeLfnu8xOhBhiMifpgVk=; b=tY+49pAw0d70Is/tw9UC5dxk+F
	DChxaBM1DfHTBM9ZE3LdpjQhpHjVUDC4tSFH/DvrSwbxLHJiPL7gbFQnW3a83aJbO3bqerputlaCB
	I3pXr0HxC87SwKrt7makxiaeetF0wXYMpuIcQxxnvJSZ8cWdHUAclGlVTkcPtzAYW9XZwe4VnuRMB
	hDj/efhYKFmFX2x4vMm7FmGNfsqJxhTOo7E9FALypaptPYtjLGhFGdrbKqMHo0ieSkGuf2dfjEKjS
	4DQNOBNmx23TLJ4alxJAWnGLbQhfwDbF4wxBs7BKHt9FyXNeTQizThE1qNIhlXK1QNIAhlDEtyb1M
	epHfDTkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSwLG-00000002XQY-3S0j;
	Mon, 16 Nov 2026 13:01:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSwJv-00000002WaO-337W
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 13:00:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EB592625A7;
	Mon, 16 Nov 2026 13:00:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 373501F000C4;
	Mon, 16 Nov 2026 13:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794834026;
	bh=y5R7blodr4KyIr57H0lgE0jfeLfnu8xOhBhiMifpgVk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Tn81L3WMTmVSVrFkStoUKS1eJlHCrwqf92DxGJzeE2QnNqJMBbbVy0Xjxt/pr1NlT
	 CC8inPJD0LToR+NrQVsp4zf7dInOG6i2QM2boXgjJrRapJHocK3+y96JvGlfrph2/w
	 VXKZJNkxdWHXEYeGBcIoe7vawFNBAvw9sSR3HQWmuqHqve768kdXbPrsGZA0puqQ/U
	 yuS8sDgebbsOqC3RdflJEQf0pctSVBEO2uDerS+IZULL8JNTLEPvROidufB+eCHmzL
	 yMXMkEn0k8odvkMvxrOrO/2iUiNR4AFj1hQ8PmnBp98gNt5wQCNSqKvRpPec6xzXUA
	 Lqp/ok8GxpgoA==
Date: Mon, 16 Nov 2026 15:00:14 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-mm@kvack.org, Arnd Bergmann <arnd@arndb.de>,
	Andreas Larsson <andreas@gaisler.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"David Hildenbrand (Arm)" <david@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
	Jason Gunthorpe <jgg@nvidia.com>, Linus Walleij <linusw@kernel.org>,
	"Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
	Lucas Stach <l.stach@pengutronix.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Malin Jonsson <malin.jonsson@est.tech>,
	Matthew Wilcox <willy@infradead.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Simek <monstr@monstr.eu>,
	Nicholas Piggin <npiggin@gmail.com>, Nishanth Menon <nm@ti.com>,
	Richard Weinberger <richard@nod.at>,
	Russell King <linux@armlinux.org.uk>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-arm-kernel@lists.infradead.org, linux-fsdevel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, x86@kernel.org
Subject: Re: [PATCH v3 10/10] mm: print pte in __print_bad_page_map_pgtable()
Message-ID: <avr-Xjdqrb8Ja1E1@kernel.org>
References: <20261116124832.662455-1-arnd@kernel.org>
 <20261116124832.662455-11-arnd@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261116124832.662455-11-arnd@kernel.org>
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 16, 2026 at 01:48:32PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> HIGHPTE support is gone now, so it's easy enough to print the
> PTE here along with the upper level entries.
> 
> Acked-by: "David Hildenbrand (Arm)" <david@kernel.org>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

> ---
>  mm/memory.c | 21 ++++++++++++++-------
>  1 file changed, 14 insertions(+), 7 deletions(-)

-- 
Sincerely yours,
Mike.

