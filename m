Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D242D606A41F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 10:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3+H/5DBz;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OEtRIXC/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=jg2+rzX5//wzQlrSA93Hv1wCdPwb/nOi8lpYf6/Rec4=; b=3+H/5DBzvEj5MUHlyEzHAkHJEa
	O/OlqcP7Sm2K98iHc2mtzkFfxpdlxTkgaQ7nmEqYjtxGsItD97iTJpDyduClWYZ2UvRf/rQgLQSgR
	f9jdPkMM67md6HmiXeIH7L4CXlcRNp8H4h1+8WVLE2I7OIZ5LpIZt1uk8hVOrzgut7afLdazW5+95
	MKa4+Z+xN1472+TOUilJtIrsn4ExH9mNX4iRIEEOYOvHpZcwsfYcCu/HjEuRD5gx1QDb5Ri1Y2Em9
	RmeFlZug7WxFg4mf9fllyXyHJ0+C0oZWkfhgKlxWAqw0Foo5Vh97PfeevqFLvBywOMLEQwrWPjkMA
	gChtdRKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQj0z-00000003Rnx-2Jph;
	Tue, 10 Nov 2026 10:23:45 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQj0y-00000003Rnf-13jQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 10:23:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 315CF6190A;
	Tue, 10 Nov 2026 10:23:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA1271F0089F;
	Tue, 10 Nov 2026 10:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794306222;
	bh=jg2+rzX5//wzQlrSA93Hv1wCdPwb/nOi8lpYf6/Rec4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OEtRIXC/aStoOlSbkD+83cEGOo3/ajoFaxcyJycZxC9le+rmWlGUHz0C+EOEwRCCq
	 EDbN82wsI5hCOJjAhLwOc6VB44zF/dfnvMdefumMH2d8XYWheUOukGYRXEe0PQB0gp
	 wbnRFAU8EIcLhBmwwP2OKmd20ILT7BlbBnq78su+eQzgpBvmR3xmkVlWKLhGLxfWw8
	 FTiDBPpcB56ve2QCY7/fS0lto5xCkAkWcXc1QhWBQqP8wTwAnW60MQ93MMCggIXZdw
	 IRMkYGMZd4FtcCYz50N5kQWvJXtxmUsOQMCH18kGzQFw4M4m9ZQpELwgEs3zMjUuaD
	 bBYRjCNKEAWwg==
Date: Tue, 10 Nov 2026 11:23:39 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>, 
	Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Michal Simek <michal.simek@amd.com>, 
	Eric Dumazet <edumazet@kernel.org>, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next v3 2/5] dt-bindings: net: dp83867: add
 compatible and reference ethernet-phy.yaml
Message-ID: <20261110-prophetic-arboreal-locust-8515c7@quoll>
References: <20261106-v7-2-topic-dp83867-v3-0-45e1d3adf1bf@pengutronix.de>
 <20261106-v7-2-topic-dp83867-v3-2-45e1d3adf1bf@pengutronix.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261106-v7-2-topic-dp83867-v3-2-45e1d3adf1bf@pengutronix.de>
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

On Fri, Nov 06, 2026 at 08:47:26AM +0100, Steffen Trumtrar wrote:
> The binding has neither a compatible nor a select, so dtschema never
> applies it to a node: neither the example nor any devicetree is checked
> against it.
> 
> Add the compatible of the PHY ID, optionally followed by the generic
> ethernet-phy-ieee802.3-c22, which several devicetrees use. Select on the
> PHY ID only, as the fallback alone would select every clause 22 PHY.
> Nodes without a compatible stay valid, but are not checked.
> 
> The binding also references ethernet-controller.yaml, which describes
> MACs; its node name pattern does not match a PHY node. Reference
> ethernet-phy.yaml instead, which also describes reset-gpios and the
> other generic PHY properties existing devicetrees use.
> 
> Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> ---
>  Documentation/devicetree/bindings/net/ti,dp83867.yaml | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


