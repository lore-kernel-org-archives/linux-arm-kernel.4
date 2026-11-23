Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD7B606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 08:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=j93QYHqb;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i7M+DngD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=b0SFDURPDtHYhsTYGEf5G56Lkm17f5tRBqoimhyc//E=; b=j93QYHqbRtaFFIas+SUWQkoZab
	y6Lnlz3IPyeI7iq7+lTSDl17XYG8PPW3o4515gbqJDscWw/TDnf49DNRpIcNTtAIgITRrTF5/fqux
	fY7idjs5rz9YCgFj5QKFU8IFoG7pNReTCCK0eozG8dPd0txHQY1nn+7Um4DUKDMrKtY0VhlVnxHZk
	7fpBvM0z5Vc+N2uNTlLVOE94crHr3SSbQKxWSOq/TQZBi/Qs8bkD8ZyRe2zGnd5+vH2UvcT9apvnt
	3l3h0PeQfEwTKfj7ISyC3D8riSV7h0/nFHSbImo8xuMYWJVGsL0Ndp1abXVviTg5VtS7hUwdkQFdW
	P8x5r7wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVPPi-00000002ZCY-1JNP;
	Mon, 23 Nov 2026 08:28:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVPPU-00000002ZA4-1cMe;
	Mon, 23 Nov 2026 08:28:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BA7BC44279;
	Mon, 23 Nov 2026 08:28:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E50D21F000C4;
	Mon, 23 Nov 2026 08:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795422503;
	bh=b0SFDURPDtHYhsTYGEf5G56Lkm17f5tRBqoimhyc//E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=i7M+DngD1SDR874UCBpw2SklVQofyZcfxMeTHvjGIKZa+v+g+DxJyHumXMA1YEUKH
	 Kg4aSv1qTf1LMH7sul6cKuzOmamn8Lq2Ke8Ay3HHNLePNP1G4+kRR4O5F5XrqOya5F
	 pw9qL+95yGDFAIFBJdDeFnYDD5C0qIxCNiEDIGrw1QFJmqdeVX9DwhHHxRBHy+zVfd
	 /Jo9oR9rFS2karUpqaX4Tfo5GhSowux+fD98NCfnZHO3CDgvpyUSb0lV33zGrVuvu8
	 jLZxcIGCaJQHKkyVIBsU4FLOVOtxerC2MF454BPc0eIU4yaS6WZIIrKGYsKYKczbHf
	 4FjEffIC2WAQA==
Date: Mon, 23 Nov 2026 09:28:20 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Arun Iyengar <aiyengar1990@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	David Wu <david.wu@rock-chips.com>, Damien Le Moal <dlemoal@kernel.org>, 
	Niklas Cassel <cassel@kernel.org>, Serge Semin <fancer.lancer@gmail.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org, 
	Pranjal Shrivastava <praan@google.com>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev, Shawn Lin <shawn.lin@rock-chips.com>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCH 2/9] dt-bindings: ata: rockchip,dwc-ahci: Allow iommus
Message-ID: <20261123-first-dark-griffin-a7d2a1@quoll>
References: <20261113-mmu600-php-v1-0-231196049a3b@gmail.com>
 <20261113-mmu600-php-v1-2-231196049a3b@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261113-mmu600-php-v1-2-231196049a3b@gmail.com>
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

On Fri, Nov 13, 2026 at 04:38:48PM +0000, Arun Iyengar wrote:
> The RK3588 SATA controllers are behind the PHP SMMU. Allow iommus, as
> snps,dwc-ahci does.
> 
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
> ---
>  Documentation/devicetree/bindings/ata/rockchip,dwc-ahci.yaml | 3 +++
>  1 file changed, 3 insertions(+)
>

Same here

Best regards,
Krzysztof


