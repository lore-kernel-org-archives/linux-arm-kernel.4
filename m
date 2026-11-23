Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA297606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 11:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=c9+8heiX;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TaEAGtfb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=vGo5Rr0biOUzRbqTgcdqL0cPEhygXKXc6hTCMqPuRJs=; b=c9+8heiXSYE1rajmdknE+HPywV
	VFtH5WRUDYgp6v1ifsRco3Avqrds4CGKif1tTXcKbmxqwpZytndN4+xJfq5jw8x1t2lBRcXjCVVOw
	Ouz9+qxF6g3SOrD62thpDJJJzrags+2H+1TrAeU+8dQvOhFzwkmc2fasH1Ib/bhSPjaHZLSnha1ng
	nYOjQQhf6kxuv2eYQD5ovBoZrPOLcZLo5QO3iXkMgeQHksXJOouDL3U7l29SCUjpnWZqSEV6km+Pi
	XPB4lCdWKNZi1SC5LfIKpNaeg1v0zZo2td8am674BKv/cFTpx0fIee5WMMOJbTRljpZJX8cGCvYNM
	4gfYUJuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVS7l-000000038p1-3yMj;
	Mon, 23 Nov 2026 11:22:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVS7Z-000000038jS-23rJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 11:22:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 25CE744E09;
	Mon, 23 Nov 2026 11:22:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E6E71F000C0;
	Mon, 23 Nov 2026 11:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795432925;
	bh=vGo5Rr0biOUzRbqTgcdqL0cPEhygXKXc6hTCMqPuRJs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TaEAGtfb1D0eMiLppFjMfL2pfXlRlJ3/3z+jlWljMxV/TbpZTKRwWyknjQLNr/AO3
	 OaUwdmfBmImt98xPKAoI4t0TNxr521PoFDPjzDSWD2tJ70wUgLfaHPqKTalEIFn8oj
	 Ij9uvOUdN8jRITkjCClWXYyAN0qJvIJoIB08KH2pDKDtxrfNcOcpfG7BPwUyESRWng
	 uaK4lGcnsta2D3EWdAFhFsldfHRPT3yMWJ+vNbHFblZcw05AC/c4AyOG50REHz1SOw
	 74nmuw1vWsmy0YL9cl5M7XQmjTPHR4WgsSZfnC28cCEZgl+QvML5PHa6OAaSSXIAdp
	 IjeIy4qCkDygw==
Date: Mon, 23 Nov 2026 12:22:01 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/8] dt-bindings: net: Add Synaptics SL2610 DWMAC
Message-ID: <20261123-aromatic-feathered-whale-bfc874@quoll>
References: <20261116135442.4827-1-jszhang@kernel.org>
 <20261116135442.4827-4-jszhang@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261116135442.4827-4-jszhang@kernel.org>
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

On Mon, Nov 16, 2026 at 09:54:37PM +0800, Jisheng Zhang wrote:
> +  phy-mode:
> +    enum:
> +      - rmii
> +      - rgmii
> +      - rgmii-id
> +      - rgmii-rxid
> +      - rgmii-txid

Missing constraints for interrupts, clocks, resets, domains and so on.

> +
> +required:
> +  - compatible
> +  - syna,syscon
> +  - phy-mode
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    chip: syscon@f7e10000 {
> +        compatible = "syna,sl2610-soc-syscon", "syscon";
> +        reg = <0xf7e10000 0x10000>;
> +        clocks = <&osc>;
> +        #clock-cells = <1>;
> +        #reset-cells = <1>;
> +    };

Not relevant, drop entire node.


Best regards,
Krzysztof


