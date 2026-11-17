Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 898F1606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 18:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YbX5VrZC;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f+I10RnW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=2XP3FgoploZd9nlTihMff6VvVBJh4qnJoF9vqsKxgPk=; b=YbX5VrZCzHGxbtSzOpi2rhkUT1
	Uq3IiZoCTEnmV2aXxtFFLswq1Abykg733WFwgHeI9dVb9smyO6lHWXCuEdYifAK/6vwlo+LcZLqWy
	zr6KwlwbdWQpPtlxetDu9lgr9w/2xlTcCMSZRqivelkcn4zCjSACsNYor4FaHeLIuKuobWapvFM8j
	lcYZab2tTy5rjZmRP3p4A7UeNd9ef2nZgMLdyuTR55TXf196OSWZV+II4UzhD0Y9DgYoIDIraqZj4
	Tc9cZTdJEoE0ssIHK+sT6kzpJtboctrrfB6X7Lj+3Xv94Cj9epzh4/9kMAbWVNK7gWwUBpffE4evc
	F8tcMF3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTNfm-00000006jST-21Vb;
	Tue, 17 Nov 2026 18:12:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTNfl-00000006jSM-2vLH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 18:12:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 30FB944E97;
	Tue, 17 Nov 2026 18:12:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1F3F1F000C6;
	Tue, 17 Nov 2026 18:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794939169;
	bh=2XP3FgoploZd9nlTihMff6VvVBJh4qnJoF9vqsKxgPk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=f+I10RnWUJYUU5t/Iy8JJX2St9sZma2QKZPcxfhYHOuyhVlltpHCIR04rqQdUCnhC
	 n3hTzpkXH4lB9Fj0d1j8a3cvqcWt0RdrTDShxQpo6GsCXpKPQpCafcEzTpXwnu9RZe
	 Hpa4d8WUQuhfGmGefy+okvaxKhay+WoKROC3uID49wBaofpBaogbW39/HYHXh0boGv
	 PZBwmfo7G4fAUQ8ErJXaPiFl9yf16EaP0lUy8ULfQedThl+SZMASovx0DmFg9kBGPv
	 3HykHzT7+e88h+3zZ4j/7FDI1kq6hiy3lx7FN5jLxq6wGsrvAdgFlBCoA3AR4peJyW
	 m74tcQvOeytKg==
Date: Tue, 17 Nov 2026 10:12:47 -0800
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
Subject: Re: [PATCH 07/16] KVM: arm64: Compute a protected vCPU's
 fine-grained traps at EL2
Message-ID: <avyZH2g3rrIVm-Fl@kernel.org>
References: <20261109083205.806619-1-fuad.tabba@linux.dev>
 <20261109083205.806619-8-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261109083205.806619-8-fuad.tabba@linux.dev>
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Fuad,

On Mon, Nov 09, 2026 at 08:31:56AM +0000, Fuad Tabba wrote:
> +#ifndef __KVM_NVHE_HYPERVISOR__
>  static void __init check_feat_map(const struct reg_bits_to_feat_map *map,
>  				  int map_size, u64 resx, const char *str)
>  {
> @@ -1414,11 +1420,6 @@ static void __init check_feat_map(const struct reg_bits_to_feat_map *map,
>  			str, mask ^ ~resx);
>  }
>  
> -static u64 reg_feat_map_bits(const struct reg_bits_to_feat_map *map)
> -{
> -	return map->flags & MASKS_POINTER ? (map->masks->mask | map->masks->nmask) : map->bits;
> -}
> -
>  static void __init check_reg_desc(const struct reg_feat_map_desc *r)
>  {
>  	check_feat_map(r->bit_feat_map, r->bit_feat_map_sz,
> @@ -1451,6 +1452,7 @@ void __init check_feature_map(void)
>  	check_reg_desc(&ich_hfgwtr_desc);
>  	check_reg_desc(&ich_hfgitr_desc);
>  }
> +#endif

We already have too much ifdeffery... It isn't mentioned in the
changelog but I take it you're doing this to avoid the printk() in
check_feat_map()?

If yes then just upgrade that thing to a WARN() and carry on, it only
ever runs at init. 

Thanks,
Oliver

