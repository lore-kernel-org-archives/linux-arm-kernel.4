Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AA59606A338
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 20:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=auZWtbpX;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HjMw8nLW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=IcBL3a80r84RA3Ro027wMRJVkdShjlT42KuGCQbF6jo=; b=auZWtbpXc9268BuxexZ2ofSJC4
	3rGYNHF/qiZ26g4HHQ0xoo5voybnuj3WuQLp8oYdvV+Eeo/j78Uh3pN72GhjQx1/eGRZjWluMWFL9
	FtKDGRqLXseJQZz3d/6M+/BPwNnvY9jx3tv6NEy84MiVDXjQbD0q7ilfvZjJW2+xi7dmFVlr+u2ED
	EdPgXe/bvzgUr7CT/Aoi/F1bcqHNY1LDUw7MSfWskUymiRfPYXV+ZzKUcy/jE6a8erZVpLe08JstE
	M9zd2amijD1Oa5RiwBqG3WJVCA7qaflXx1sZ4zluCKmoD7z1Zn2oSodZ+s7H26TPSYOmXay9D5eX4
	jaWnW75A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQVqa-00000001dVm-0uxC;
	Mon, 09 Nov 2026 20:20:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQVqY-00000001dVE-42st
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 20:20:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6528C43249;
	Mon,  9 Nov 2026 20:20:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19EDB1F0089F;
	Mon,  9 Nov 2026 20:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794255606;
	bh=IcBL3a80r84RA3Ro027wMRJVkdShjlT42KuGCQbF6jo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HjMw8nLWjwc11PenB3/UnNBdeoGofUyEt89ZWH7hSnJqYtJzhDuOFrD/q+apcceBz
	 Q9tR3Hey2bMYOlvmAQk6LpbuBOtm/4cZlOjJtmwwX/Xox/4Zp7RaQGME+UhxTOWjpD
	 e6RN6m1ApDYmolSL6diC4RuCAHs9UDvNrm66KoiDVfdUZcC3q1pe2aDnhUdWElD16w
	 U5ifvLJyb90nArCqI8OqLj+OTGNu73t73V80RSrPJbyKXzaPPtf7TaHGJvQGKTu22F
	 VoeGztmXiSY7Lbo2p1NbfY9tnr2ot1OyP1zC0vT/GK/a+J/IU8BNQddEsbo/YSnuTw
	 oFkwUz9vCKJLg==
Date: Mon, 9 Nov 2026 12:20:04 -0800
From: Oliver Upton <oupton@kernel.org>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Fuad Tabba <tabba@google.com>, kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/16] KVM: arm64: Support debug, SVE, MOPS, PIE/POE,
 FPMR and more in protected VMs
Message-ID: <avIq9AIE-9igDzsV@kernel.org>
References: <20261109083205.806619-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261109083205.806619-1-fuad.tabba@linux.dev>
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

Hi Fuad,

On Mon, Nov 09, 2026 at 08:31:49AM +0000, Fuad Tabba wrote:
> Hi folks,
> 
> With most of the groundwork now merged, bringing protected VMs up to
> the features we support for them in Android turns out not to be a big
> series. So this folds self-hosted debug [1] and SVE [2], which I posted
> separately last week, into one series with the rest. Both are small,
> and keeping them apart would only leave a few conflicts where they add
> neighbouring lines to the pVM ID-register code. The debug and SVE
> patches are unchanged from those postings.
> 
>   01:     Self-hosted debug.
>   02-05:  SVE, with EL2 owning a protected vCPU's SVE state.
>   06-07:  Compute a protected vCPU's fine-grained traps at EL2.
>   08-16:  Advertise TCR2, SCTLR2, S1PIE, S1POE, MOPS, FPMR and the
>           features EL2 already handles for non-protected guests.
> 
> Tested on QEMU, in hVHE and nVHE, and on FVP for S1POE and the fields
> QEMU doesn't model (CLRBHB, RPRFM, ECBHB, LSFE, LSUI, HAFT, ETS3 and
> F16MM). v2 of the pKVM selftests series [3] will cover debug, SVE,
> MOPS, PIE, POE and FPMR.
> 
> Based on Linux 7.4-rc1 (6628e7d4c6b25); it also applies to 7.4-rc2
> (7475ea8b58616).
> 
> Cheers,
> /fuad
> 
> [1] https://lore.kernel.org/all/20261102093950.2922035-1-fuad.tabba@linux.dev/
> [2] https://lore.kernel.org/all/20261105130456.1617185-1-fuad.tabba@linux.dev/
> [3] https://lore.kernel.org/all/20261104084842.132944-1-fuad.tabba@linux.dev/

Ok, we really need to slow down the rate of patches here. I had already
applied the SVE series locally and now we've got a grab-bag of CPU
features in addition to what I was ready to apply.

The whole point of respinning a series is so we can converge on the
shape of the feature and get it merged. Adding a whole pile of things
that wasn't asked for just muddies the context for us dumb humans and
slows down the rate at which you're going to land things upstream.

Going forward, can you please:

 - Keep an individual series focused on the original intent. Don't
   unnecessarily expand scope.

 - Only iterate on a couple of series on the list at a time. Sashiko
   findings are interesting, but you're gonna have to draw a cutline in
   terms of how many additional patches are going to ride the coattails
   of any particular series.

   You're obviously a very active contributor and reviewer, so I don't
   anticipate such a rate limit to actually impede your patch velocity.

Sorry, I really do appreciate the amount of work that you're doing to
get pKVM in good shape upstream. I just get the sense that Marc and I
are going to quickly encounter bandwidth limitations.

Thanks,
Oliver

