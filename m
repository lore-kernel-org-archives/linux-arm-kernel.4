Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64269606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 21:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DlaAFENi;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NvT6kx1R
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=G7fFQmfgHuogWXnk7uusOnYOFKT4PPiSKrHtauxGcgU=; b=DlaAFENixBSvWp
	HIA0Yal5lWu6jJ6CdOLlj1YQYSnMC8qxwezCftSzBicKfUlU2x0aC3K5IfEiF5215ByRNP6+es/aY
	4g9Z+xEydjybgGM6TFrUV2XXoSx+IVca0zSnXtGDR00g7ARTwN2wYmdmcB4+PWscxN/SnaWq9MkYv
	txWp1v9ZinjbOIGU0B4SU1h4nEG/x2YbtVeTSLDEKrGQgXk6Pd+zKcRDwqypSgGR4oph8MmD906rJ
	8T8ul+KpXvinwICf/0xP4AOn+adRX1eo5eNax8i6fOCcX9WbD/MYMdv6YUhhynUhrac2fZxt70fgJ
	EhxgPiCqgcjIa/hBDLGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTRBD-00000007B7h-2J0F;
	Tue, 17 Nov 2026 21:57:31 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTRBC-00000007B6u-2rNb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 21:57:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 24F4961B6F;
	Tue, 17 Nov 2026 21:57:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A09E31F000CA;
	Tue, 17 Nov 2026 21:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794952649;
	bh=G7fFQmfgHuogWXnk7uusOnYOFKT4PPiSKrHtauxGcgU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=NvT6kx1R4/h5ELnoUZUl8+FEI4Jxg2pLq0917OQ8veuts2f04xapDsdcb2qp/UAfI
	 LSR71X7xulWsRvaGEOkL/gq2c93Wjw3DtkBvKE/DQ//K24kWs3uG2vv/3zztCsXJ9X
	 0yKkkdy0yRD5SPrGFkjwB3lFIJn0V+d7nypQF6eN+/MH/iBUzc6pk7yTjnRbUK3XCh
	 j/Bs7C3+KiVlnmuaGqbp5j7sNw3/hy5y91cbsgxORug7D0/DxNG2YEvCDNbX+7HZhD
	 UMRExhDtVFEVmRQ62ax3c3/ZcO9MpD6xpUpSlNWjSVYvgRpoY2VMBau5c1mD8qZhPC
	 2NHYrzWud4Umw==
From: Oliver Upton <oupton@kernel.org>
To: maz@kernel.org,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Vincent Donnefort <vdonnefort@google.com>
Cc: Oliver Upton <oupton@kernel.org>,
	joey.gouly@arm.com,
	seiden@linux.ibm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	kernel-team@android.com,
	fuad.tabba@linux.dev
Subject: Re: [PATCH v2] KVM: arm64: Fast fail transparent_hugepage_adjust() for non-PMD folios
Date: Tue, 17 Nov 2026 13:57:25 -0800
Message-ID: <179495264132.1456871.3041044552825325460.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261112113729.2858513-1-vdonnefort@google.com>
References: <20261112113729.2858513-1-vdonnefort@google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Thu, 12 Nov 2026 11:37:29 +0000, Vincent Donnefort wrote:
> transparent_hugepage_adjust() must walk the userspace stage-1 to detect
> if a PMD-level mapping is installed and whether a stage-2 block mapping
> can be used. Even though this stage-1 walk is most likely cache hot
> (in most cases, the mapping has just been installed), walking a
> page-table is still costly.
> 
> While we can't be sure by solely looking at the folio if the stage-1 is
> a block mapping as userspace has multiple ways to split it, we can infer
> from its size if the stage-1 mapping is smaller than PMD_SIZE. Anonymous
> memory or memfd faults allocate a big enough folio, as do khugepaged or
> MADV_COLLAPSE.
> 
> [...]

Applied to next, thanks!

[1/1] KVM: arm64: Fast fail transparent_hugepage_adjust() for non-PMD folios
      https://git.kernel.org/kvmarm/kvmarm/c/9da9b26ce1ac

--
Best,
Oliver

