Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 070FA606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 08:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qJgzaqW0;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WRgNkBuA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ijyetjFveDyx8d2oHXD3zLUbbfnSn8RYdMkJF4ohCQ0=; b=qJgzaqW0/N/0l6ZfFwBjR22C8e
	3FlFauQiaaSwiy+OxG6SLVZXTaNcjc+yR5/5YoheV2fARkveDYr26hxsYu9KVQFZ69Yg7c3gIj0Jj
	dPnRcUtlKcP07LunZiN4weWpcGHLWFTogTKAtlClmVfPLBwnOnQapFglMBwMr7DZbDIEjwYvCDt4D
	KEP6U0rdBqKYR7YzQO3cZn/U8ZIoA71kGHfrraEUhvC+sNDhB/JYX2RnOXaDxTNGylgXA39Js0C/F
	FnJzPiLW3pFIHWcKeJOgA9W7O2yI0XZNXd2srd3vdSidX3AiSKdPxYl8YMzcbbUmf3+lNC89u/btC
	nL8R8pPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVPPn-00000002ZCz-06E2;
	Mon, 23 Nov 2026 08:28:43 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVPPB-00000002Z9g-0Onw;
	Mon, 23 Nov 2026 08:28:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7E774605C9;
	Mon, 23 Nov 2026 08:28:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72EB41F000CF;
	Mon, 23 Nov 2026 08:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795422484;
	bh=ijyetjFveDyx8d2oHXD3zLUbbfnSn8RYdMkJF4ohCQ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WRgNkBuATBZUt2Ophjkqvi6ZrUouc+KYnC048Q5TibJouB+gHeINVZ/p7qu1XI6a9
	 2txgSp+ZKHXQfE0vmhNscwVpGA140KfyagginBxbivt4s6C/pAOeFMbXwaXqZZ7QSP
	 OWMzC9jLT0fI4Py0ILZryqSbTU8GIktJTETeKRTVaVPo8jzsG/yXvEpLVdFbFKFT+z
	 SJD3Ybhf1izLyCZY03EYBDRFg6pZbaLMj+Sruz/uY8xzOOvoiu8/fyuw6qveKVPixg
	 hOvj69mcV+vW3jfmhBXn294OvOb8ZBkxX1dSmOOO6MXbqISEgZ6tEnxjCSFR/YvKVy
	 AO2wss5/0hnrg==
Date: Mon, 23 Nov 2026 09:28:00 +0100
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
Subject: Re: [PATCH 1/9] dt-bindings: net: rockchip-dwmac: Allow iommus
Message-ID: <20261123-quirky-scallop-of-beauty-c662b7@quoll>
References: <20261113-mmu600-php-v1-0-231196049a3b@gmail.com>
 <20261113-mmu600-php-v1-1-231196049a3b@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261113-mmu600-php-v1-1-231196049a3b@gmail.com>
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

On Fri, Nov 13, 2026 at 04:38:47PM +0000, Arun Iyengar wrote:
> The RK3588 GMACs are behind the PHP SMMU. Allow iommus.
> 
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
> ---
>  Documentation/devicetree/bindings/net/rockchip-dwmac.yaml | 3 +++
>  1 file changed, 3 insertions(+)
>

No response to the report, so dropping from DT patchwork.

Best regards,
Krzysztof


