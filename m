Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 092A060A2639
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 11:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wWEQcz57;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W/JWJ4q0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=D0muWOhoQ0tEZKS30AGh6Dci91ILHagLlBaq3eYFtng=; b=wWEQcz57lPJ2Oy
	7Vu7QiWhG2Fy8jJeIk27afrZ+PYghQm1oMY2ooRYZg28d2bTY1YQfS3sH3UNkpPL4fqaZ5+9TGQDk
	18xzg4/PE2Xagy1ofNgZjxO42mikRkbIgzkJJJp3UD9qsLpkoWzvVAv0sPL1TgZ/FvTPOQEuxrOha
	KCa5cJGRi/LF40egvAN6hDYU7p3wTmB4VGJk6F9kgw7sW6IS5WYacGU19JM3b0gieRKaIvBZrB3fE
	8Tou5GvCWL0t/JPf91EefniCWyN77WxFJhzbaj+gFkbN06ARHJX3RynV7V4oRhaLr+hfQAiFLY9P8
	lbqe0gnuUxafImjkhGHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRSqu-00000009f6u-32zJ;
	Thu, 12 Nov 2026 11:20:24 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRSqt-00000009f5M-08b1;
	Thu, 12 Nov 2026 11:20:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 54B70479E6;
	Thu, 12 Nov 2026 11:20:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E6431F00AD8;
	Thu, 12 Nov 2026 11:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794482422;
	bh=D0muWOhoQ0tEZKS30AGh6Dci91ILHagLlBaq3eYFtng=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=W/JWJ4q0trAwrNUTMwd48kyOdE2oujP6zEW7lypxH+tskkuk6rRNqy4YJh89lu78D
	 Gh5dV03HXI5iRQphl6ZGbAJ6NCrAL41KUSaQ/+G+BW3+Zvzkr8t+McTSt0KeqWAjdW
	 xr+Xo7GyAIS+KcH2f6d5Rv0DqPS/cIAzvrlkHSMeM10o++oMq7xgMT6oOvngoya4aE
	 94WFzO6LV5PAwfglSdn64Xn5CiPBGeQR/ORM6gw1tahivyOIhkVI9Y5V8pgq95g2aK
	 QsMO4WjgcD1KoTTzlvHnVeY9w3eIe0aIemLcC01Pym/FKr+F3LdF3//EQd77bF/eYM
	 DIueSeqbKbvnQ==
From: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Ryan Chen <ryan_chen@aspeedtech.com>, 
 Billy Tsai <billy_tsai@aspeedtech.com>, 
 Jacky Chou <jacky_chou@aspeedtech.com>
Cc: linux-aspeed@lists.ozlabs.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261020-upstream_pcie_rc-v10-0-fba209af8656@aspeedtech.com>
References: <20261020-upstream_pcie_rc-v10-0-fba209af8656@aspeedtech.com>
Subject: Re: [PATCH v10 0/3] Add ASPEED PCIe PHY support
Message-Id: <179448241801.492462.15920568972028232724.b4-ty@kernel.org>
Date: Thu, 12 Nov 2026 16:50:18 +0530
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Tue, 20 Oct 2026 19:59:48 +0800, Jacky Chou wrote:
> This patch series adds support for the ASPEED PCIe PHY, including the
> device tree bindings and the PCIe PHY driver.
> 
> Summary of changes:
> - Add device tree binding documents for ASPEED PCIe PHY
> - Implement ASPEED PCIe PHY driver, including reference clock handling
>   and an AST2700 host bridge reset sequence
> - Update MAINTAINERS for the new bindings and driver
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: phy: aspeed: Add ASPEED PCIe PHY
      commit: 020ee21a7ae584f116183867c41e8f8bddecaae7
[2/3] phy: aspeed: Add ASPEED PCIe PHY driver
      commit: 256cc8295557c134421d0b48ea37f6c9d4f232fe
[3/3] MAINTAINERS: Add ASPEED PCIe PHY driver
      commit: be45a1d5c3fed409d909d031547183144a806718

Best regards,
-- 
~Vinod



