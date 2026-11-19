Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35856606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 21:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=waZ6A73a;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ec1yZDgI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=sfsFb1aGEKDdDgduNvVaqLPO/+tVEkI1Hc7WtTzriM4=; b=waZ6A73aokgXm0S/Rphep0k3Tp
	MXCIW4ncPawY2HSBcEkLlyqZlEeY3UVeDp9Z7gjh6K3DLmrgCNhjtSYA5NORIv5nChN48FwgWoDoq
	VRxoYzu/YYeOYKgFFYuEfzm92l1Z0QxjX4WUhewBn8tGkmfKpXAP+psUuNr205mOAMR8GyRAouoAX
	Ak3aQ1K+XX3i+kw7Ard3HE9MHwkbVnbwH+O4e0qhkUuqyzQc0tqdg2EIIKSm3143tuGzXNK5XnWJl
	dWaqtsC2cJkIIy+dPPNIAn/oF2w4oKyZPyBGJ1hz2+z/FSj/MiTfAqnzd3m40YiWbDcuUggN7WVoD
	uDYlY7Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU9IB-0000000DRng-0Tux;
	Thu, 19 Nov 2026 21:03:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU9I9-0000000DRnX-29sJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 21:03:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9986460202;
	Thu, 19 Nov 2026 21:03:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 224001F000C0;
	Thu, 19 Nov 2026 21:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795122216;
	bh=sfsFb1aGEKDdDgduNvVaqLPO/+tVEkI1Hc7WtTzriM4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ec1yZDgIKaPP2Gg+BMqEMC7B1k7AJQf+XKLHQru6ochjFwVtKC3fb5DUSCBqJrLoz
	 0v740ceRJMbVFPLVI/cYo+OEFNwQRcYRBU9R1q0EPPenf0xwB+thk7kFbcVB9cDnNs
	 GeHiRRc/bmoqNKWrgF9g/XgPwuUbkhTwJY6Ccbbt1t6DKP9VqLvbSyc2VOJVTqd3pI
	 FyH4Ur/ihOix2mwCIzmNbpOQ0KBUs0CW4ZDKi+QSy2TOV7YxRM1yMMdyqXwV4iIodF
	 FDeKh/Xq3mmZR+ePmEHSoJfbgW7Nb+pQuwmCb4P86wLVs8B3NskO09jSMjnAEazAgj
	 Nw6e5SM8v8ugA==
Date: Thu, 19 Nov 2026 15:03:33 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: muhammad.nazim.amirul.nazle.asmade@altera.com
Cc: linux-arm-kernel@lists.infradead.org,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Eric Dumazet <edumazet@google.com>,
	"David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
	Dinh Nguyen <dinguyen@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>
Subject: Re: [PATCH net-next v2 1/2] dt-bindings: net: altr,socfpga-stmmac:
 Add altr,socfpga-stmmac-agilex5-tsn compatible
Message-ID: <179512221319.568679.6038463507415818454.robh@kernel.org>
References: <20261104040320.18077-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
 <20261104040320.18077-2-muhammad.nazim.amirul.nazle.asmade@altera.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261104040320.18077-2-muhammad.nazim.amirul.nazle.asmade@altera.com>
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


On Tue, 03 Nov 2026 20:03:19 -0800, muhammad.nazim.amirul.nazle.asmade@altera.com wrote:
> From: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
> 
> The Agilex5 SoCDK TSN Config2 gmac1 path includes an FPGA soft-IP
> GMII-to-RGMII converter between the DWXGMAC and the PHY. The converter
> provides the RGMII TX/RX delays and presents GMII toward the MAC, unlike
> a plain altr,socfpga-stmmac-agilex5 port with no such converter.
> 
> Add altr,socfpga-stmmac-agilex5-tsn for that integration in the same
> compatible items entry as altr,socfpga-stmmac-agilex5 (shared
> snps,dwxgmac-2.10). Do not use altr,socfpga-stmmac-agilex5 as a DT
> fallback for the TSN port; the converter presents GMII to the MAC and
> supplies the RGMII delays, unlike a plain Agilex5 GMAC port.
> 
> The TSN port uses the same DWXGMAC-2.10 core as the plain Agilex5 port,
> so extend the interrupt/interrupt-names/dma-coherent conditional to
> match the new compatible as well; otherwise a TSN node would incorrectly
> fall into the single-interrupt, non-coherent else branch.
> 
> Signed-off-by: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
> ---
> Previously patch 3 of the v6 board series; split out for net-next.
> 
> v2: Extend the interrupt/interrupt-names/dma-coherent allOf conditional to
>     match altr,socfpga-stmmac-agilex5-tsn, per Jakub Kicinski / netdev bot.
> v6: Put altr,socfpga-stmmac-agilex5-tsn in the same enum as
>     altr,socfpga-stmmac-agilex5, per Krzysztof Kozlowski.
> v5: Drop altr,socfpga-stmmac-agilex5 fallback and rewrite commit message
>     to explain hardware incompatibility, per Krzysztof Kozlowski.
> 
>  .../devicetree/bindings/net/altr,socfpga-stmmac.yaml     | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


