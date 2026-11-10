Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 352B160A2600
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 18:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jvwJP3oB;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kx2ZaO3z
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=nVBZoi6/3BeA1E/nAUsBY+mM3R71b9Lch9KwKeBie0g=; b=jvwJP3oBNBjdYh/pay+hGjpRY4
	rp5cO/Og5ekuEzmMD3b7FYa1RGHBfJdnLzxxqubhvA8WC7mCQWQVh1agzfeS4HZBwnNIcdww9ATm+
	YcKdJJWDb8w5EL4PBKO9ttXhuCMtX4JFIFFcfjmUaRNu6sh9Lu9urGBTtgUHyHimb3Sd55HOUqc2h
	Quz5LHR6PHHFWx51Il8tGH18PK74LM79nuAt+iFWthMliKjrT1v6iUjl08ZUTfas0DH5vWqHCyqjH
	HDklioDKBSPuL7sJmNH/U0HDSGtC0K/dFRVE7s96+Dr6kaCmXGaIwFX490rqgL9TCwzXeQM3P4DvQ
	fsCOPpkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQqvY-00000004qMr-3zpK;
	Tue, 10 Nov 2026 18:50:40 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQqvW-00000004qM5-1ltO;
	Tue, 10 Nov 2026 18:50:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D2F1363B1C;
	Tue, 10 Nov 2026 18:50:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 566731F008A2;
	Tue, 10 Nov 2026 18:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794336637;
	bh=nVBZoi6/3BeA1E/nAUsBY+mM3R71b9Lch9KwKeBie0g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kx2ZaO3znvu4YvmU84JU+Iyq4xCs5EF+0qqxwsv7Row54evB55RJqH6zZjZ2YTzQ+
	 KH6d3TrAUB73sCg7Q4T8ypXYbrkMJ+f7ztTRCFp7X1Ta5vIntCe6skoAzfj1B/aNst
	 XvaFfDfIz59yeRWjUCmhwHiJa8ugLfELWt6zQuawcKMqTkbJZnBIaDbriM8t/kINrw
	 VNbS+DBr7usofeo/G9oKuoz5YkNWqwUOJ0KUAyTNIZKZIyV8m8Qp7xFy+bHtMetLOC
	 EZjZd1GYO25xuVcTjsbN28QUu2N6kI0ISNCbTTLxHSEa0ajGl9mwxkTRvGZO7e3GM0
	 IWu6/RQKO9MaQ==
Date: Tue, 10 Nov 2026 12:50:34 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: linux-kernel@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-rockchip@lists.infradead.org, Vinod Koul <vkoul@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	linux-phy@lists.infradead.org, Dave Jones <s.dave.jones@gmail.com>
Subject: Re: [PATCH v5 1/3] dt-bindings: phy: Add rockchip,rk3568-edp-phy
Message-ID: <179433663384.1318226.574453120666617957.robh@kernel.org>
References: <20261110074533.4052196-1-damon.ding@rock-chips.com>
 <20261110074533.4052196-2-damon.ding@rock-chips.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261110074533.4052196-2-damon.ding@rock-chips.com>
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


On Tue, 10 Nov 2026 15:45:31 +0800, Damon Ding wrote:
> Document the eDP transmitter PHY with Naneng IP block found on the
> RK3568 SoC. The PHY has its own register window inside the eDP PHY GRF,
> so its node is modeled as a child of the eDP PHY GRF syscon with a reg
> property describing that window.
> 
> Also add the "rockchip,rk3568-edp-phy-grf" compatible with its own
> binding schema, so the shared Rockchip GRF schema is not extended with
> per-device conditionals.
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> 
> ---
> 
> Changes in v4:
> - Add the reg entry for the PHY node and the ranges/#address-cells/
>   #size-cells for the parent syscon node.
> 
> Changes in v5:
> - Move the APB clock (PCLK_EDPPHY_GRF) from the parent syscon node to
>   the PHY node, matching the updated driver.
> - Split the "rockchip,rk3568-edp-phy-grf" syscon node to its own
>   binding schema, instead of extending the shared Rockchip GRF schema.
> - Rename the reference clock to "ref".
> - Drop the example from the PHY binding schema, as complete MFD
>   examples belong in the GRF binding schema.
> ---
>  .../bindings/phy/rockchip,rk3568-edp-phy.yaml | 46 +++++++++++
>  .../rockchip/rockchip,rk3568-edp-phy-grf.yaml | 80 +++++++++++++++++++
>  2 files changed, 126 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/rockchip,rk3568-edp-phy.yaml
>  create mode 100644 Documentation/devicetree/bindings/soc/rockchip/rockchip,rk3568-edp-phy-grf.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


