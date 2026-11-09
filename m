Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70463606A321
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 17:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rc0csY9r;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ErX/FssJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=qLl/PXvaSQ0W1AcaAdyopr9F3M61PHUlMh85ZFanJ74=; b=rc0csY9r6Eq0TqDFizGyIwr9MW
	i2FcUQx6ewTrlDMWQcqOSJiQa3iZ4h9qoaZdY6wCjaRKfB5HOcOoN9YP/JE6ZyLh/1CZPMiN7ARYC
	Brsmj0c0jNCu5unmH/iDnX4jfzG5Y9SsUfRUGlJdfNEejFhcxBfgY5vlye/IxpQc0YCmkJYiGiTLD
	liIhxUmAvLQlFHcrAmEYr1L9UBglacyjWLN4Qc+9/oZgTvnYB5M1cHS2zB8ef03JXISx5CDbJ6kVI
	GjuO2OQR56QFM0gizj8yr9g2wPfuWgf+cV3sBZpBdARZFReocosv1WnCDzWTI+3PmsQIQKUUE7Pzr
	0tyNvhbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQTJR-00000001MYu-48xF;
	Mon, 09 Nov 2026 17:37:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQTJQ-00000001MY5-2bjp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 17:37:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DE8BD41536;
	Mon,  9 Nov 2026 17:37:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9715A1F0089F;
	Mon,  9 Nov 2026 17:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794245863;
	bh=qLl/PXvaSQ0W1AcaAdyopr9F3M61PHUlMh85ZFanJ74=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ErX/FssJnBXS5wQeLGGYXYl6DPfC3sxjFDR2F0jQLIiYpak3bhdvTYjOPn2ayGsc1
	 ugn9cwH9MNl4RzdtDcih21h8h+8ZTUV/quK4rSo4Wr+U+gjknIvzKSF6GNvHeWPfvi
	 h39Ahy27jF/wrqY/IHQF1kFAEVDe35RD/7MsE8xKaYW9AXwwDrd3J/WoVz3iQaR2EI
	 KEOLT2cSUTuIVTZTLJZKz0IhNbdQ1sH459C6DPvJMltWoHkTBsDeNIe7/+kd2ae+IK
	 +YPPmdWyCVczbVD+oXik8T7lbIqbha2J9aF6neZs56rtjpU42ugToIcbaMmrjpDD2/
	 3Y98nCdLQTgyA==
Date: Mon, 9 Nov 2026 09:37:42 -0800
From: Oliver Upton <oupton@kernel.org>
To: Haseeb Ashraf <haseebashraf091@gmail.com>
Cc: maz@kernel.org, Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>, fahad.arslan@siemens.com,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 0/2] KVM: arm64: nv: Skip empty spans when unmapping
 a shadow S2
Message-ID: <avIE5g2fUEqmmknA@kernel.org>
References: <20261109133431.185154-1-haseebashraf091@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261109133431.185154-1-haseebashraf091@gmail.com>
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

Hi,

On Mon, Nov 09, 2026 at 06:34:29PM +0500, Haseeb Ashraf wrote:
> Emulating TLBI VMALLS12E1IS, emulating TLBI ALLE1IS and recycling a
> shadow stage-2 all unmap the whole nested IPA space in chunks of the
> largest block size, even when the table is empty. With a 48-bit PARange
> and 4kB pages that is 262144 unmap calls per shadow MMU, each ending in a
> range TLBI when FEAT_TLBIRANGE and FWB are available.
> 
> Measured cost: one full-range unmap of a shadow MMU takes 0.87-1.06 s on
> AmpereOne (Xen on KVM, 4kB pages, function_graph). On Graviton4
> (Xen-on-KVM, 48-bit IPA) a single VMALLS12E1IS trap took 1.46-9.50 s over
> twelve samples (median 3.09 s), all of it in stage2_apply_range().
> 
> Patch 1 adds kvm_stage2_unmap_all(), which skips spans covered by a zero
> descriptor at least as large as an unmap chunk, keeps the tracked unmap
> for everything else, removes the guest stage-2 records of skipped spans,
> and ends with the VMID-wide TLBI that VMALLS12E1IS requires. It converts
> the VMALLS12E1IS handler. Patch 2 converts kvm_nested_s2_unmap() (ALLE1IS,
> whole-VM unmap) and the pending unmap of a recycled shadow MMU.
> 
> The series is based on master, which already has the guest stage-2
> tracking. It overlaps with the unmerged kvm-arm64/unmap-vmall work, which
> defines a kvm_stage2_unmap_all() with the same name and signature; if that
> lands first, patch 1 becomes "skip empty spans in kvm_stage2_unmap_all()".
> As far as I can tell, that WIP helper does not touch the guest stage-2
> tracking records, which this series does.

Basing your series on a random, out-of-date version of a patch series is
never OK.

The direction we're taking with that series is to have the inner walk
report the next IPA to visit to the outer loop, this should do the same.

https://lore.kernel.org/kvmarm/20261106133000.453240-2-fuad.tabba@linux.dev/

Thanks,
Oliver

