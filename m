Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C70C606A336
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 11:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=njeFoUxJ;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xee1wWKf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=1MudG6EhnjWN3b8vEqsH4RydXk8BVX8M1isKdnTFXec=; b=njeFoUxJ65fneLC4we2kNVXc0q
	xf7oVLGQEUs4fwHkxX225GdrbqrRCcsAsSWkZSsBloBQESSfmF3wR/97/4hCF3DZGRnt0NAfkggTa
	TDQLejLWT/ePlH6W14bycwwkc4FE3osmkbtbs3/r/abIJzqEqkZp8TyylxqPgwV2K86WV6MdV9dE3
	lvh9MmbeVbtB30YtDHhMwISuc7qySrX0kq0uPPPcWcNvo3Zbe6Gq8ouUEzdy8G97w2D3bRiJc5HQF
	4cWaYxWnWhG/REI0EwNxPw5fDyctOBFiRIddaFuvvZqv/sJ0lKw3gY59LadCOPsjtlwSqJKfdAbQI
	cBvo9g1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRpCc-0000000CUfH-1r4s;
	Fri, 13 Nov 2026 11:12:18 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRpCa-0000000CUet-3e4G
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 11:12:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1DF3F626B2;
	Fri, 13 Nov 2026 11:12:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCD711F000C5;
	Fri, 13 Nov 2026 11:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794568335;
	bh=1MudG6EhnjWN3b8vEqsH4RydXk8BVX8M1isKdnTFXec=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Xee1wWKf4RHIdGt0yenAsYu1dbGb7mgUKdgRVsgcHpG99pxKF9wrxw0d1F0s4ULCP
	 6nV4jqcv4VFBppasIYnsSrBIjEL12e+0Hsma/ri1UE8yDQnCL5ulxOZhcLAk3Q8gZC
	 p4SbnuNgNuLyFOUo6+hxOu3og1IDBkKG1bq+NUcnzMcuuAJE7WoM+mhpx15eEx9god
	 2vUFaeJnhCSt9XiXkf+LKz2Fj0tYFtXSYKZcO2sIdI20ffht3yKGbm5zkFr05E31fG
	 BeYsW5Tc/C3uFp0HbfR5lwjgaS17kGM/bk/XKzIQ5F39GO0S7kwCZk3dievyt50/mq
	 KuPOytF14WIhQ==
Date: Fri, 13 Nov 2026 12:12:12 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>, 
	Enzo Adriano <enzo.adriano.code@gmail.com>, Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: arm: sunxi: document Radxa Cubie A7Z
Message-ID: <20261113-tacky-unbeatable-pronghorn-74ed4e@quoll>
References: <20261111134919.90264-1-vinicius.eduardo.pedrosa@gmail.com>
 <20261111134919.90264-2-vinicius.eduardo.pedrosa@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261111134919.90264-2-vinicius.eduardo.pedrosa@gmail.com>
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 11, 2026 at 10:49:15AM -0300, Vinicius Pedrosa wrote:
> Document the Radxa Cubie A7Z, an Allwinner A733-based board.
> 
> Signed-off-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
>  1 file changed, 5 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


