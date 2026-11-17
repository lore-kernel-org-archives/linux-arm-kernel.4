Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13F12606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 05:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qOKj0f0N;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cq1xm6YA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=AGnupoN5tt3PzMV+QW0kCIew7myaCy1fsrhngU5DCdA=; b=qOKj0f0NCCIcEwuFgYB1sZM5E5
	i0V93OORIfJk6vGTLb8zzAUg+6FyKsEFy9iFXEu9dj5AaAvlDDp2BimtKgzPKtpQhvlMcU2SLsGb/
	jJvWxoz/xLKpwo2YvZBMtTX6bnY1F7mrSiw01OCzZbY00kKti+VkRLrlz7cSGHMUxPULip0VZWFad
	CHEgt20Pw/MjsSTpdmR6hmUSZOXelRAvKBfT2pWP913L5BWpyPbF5pFWhgmpnVHiJsFgtd8/PKJQV
	rSJIg99RnMW3xIXeItg+AvYlIambkC8nngVnKCwldnHw/WavhwfzmP2L6QoG6lTJUT5GgWTmm7N+i
	3ZySha1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTBiJ-00000004bH4-2ga4;
	Tue, 17 Nov 2026 05:26:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTBiI-00000004bGw-2XiZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 05:26:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id AD55A6186F;
	Tue, 17 Nov 2026 05:26:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B510F1F000C4;
	Tue, 17 Nov 2026 05:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794893197;
	bh=AGnupoN5tt3PzMV+QW0kCIew7myaCy1fsrhngU5DCdA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cq1xm6YAUOUtiyqhKYC+ZLXtHVVnmzsjNHcLFB5NW8Sgi52PAomCEs2QT8b1Vzrzy
	 ILp60onCIMxm6sBOjjtMhCqKvg4prALlyrfaUv9/D0r7Bf4mFlWGDqKE6WIhnoJu8G
	 owC78w1aCmenEr0ZY09IkzW7ILYvj+36sF3N8EDI/6rLEqPQd/jinIwzEq9IaY1hbi
	 VtlL739fiVVDdRaoSwaIWe3yqBHx70xgQUzCdo0i96YvJIKLf0M3GKsT7Z3i45fph6
	 FTLz3xfgCKuqjXD4VHvQ0THkuY28NrurDs2VDz5wTpk5eOLwtQvhYRZdwH14HINcUK
	 urL+5tovqV9vQ==
Date: Tue, 17 Nov 2026 13:06:19 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/8] dt-bindings: net: Add MDIO demultiplexer
Message-ID: <avvgy_bmRSVApCHA@xhacker>
References: <20261116135442.4827-1-jszhang@kernel.org>
 <20261116135442.4827-2-jszhang@kernel.org>
 <16ecb3ac-7876-4db5-9168-5ac9bf31d4b7@lunn.ch>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <16ecb3ac-7876-4db5-9168-5ac9bf31d4b7@lunn.ch>
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

On Mon, Nov 16, 2026 at 04:06:25PM +0100, Andrew Lunn wrote:
> On Mon, Nov 16, 2026 at 09:54:35PM +0800, Jisheng Zhang wrote:
> > Assume we have the following implementation:
> >           ----------
> >           |mmio reg|
> > 	  ----------
> >              |
> >  --------    |      -------
> >  | MAC0 |--MDIO-----| PHY |
> >  -------- |     |   -------
> >           |     |
> >  -------- |     |   -------
> >  | MAC1 |--     ----| PHY |
> >  --------           -------
> > 
> > Both MAC0 and MAC1 have MDIO bus masters, and tie together to
> > a single set of clock and data lines, which go to some PHYs. While
> > there's a mmio reg to control which MAC mdio master can operate
> > the single mdio clock and data lines, so only one MAC can operate
> > the mdio clock and data lines.
> 
> How does this differ from pinmux?
> 

in my case, the two MAC MDIO bus masters share the same MDC and MDIO
pins.

