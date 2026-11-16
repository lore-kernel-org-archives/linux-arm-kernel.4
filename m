Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F661606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 15:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mp/Ela1y;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=ZRvd1OQ2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=PcrkZrIiBXHxrgXY/IdmAR4Eo2KV+jR7a2aL3fB5faE=; b=mp/Ela1yQnQ6hytT77Bh/i0HAT
	BWq51n7oad/5KdcampG6HPuQz5FKCSlm32VFQ5oEj5zJjZWMD0ZEV8KcE4Ue9vK60jhZdVgHxxWIH
	XbSJjtjrjt+vUx0UU5AmdDR3Cb0LI7a/ZaJpDbvaVuh+1YbE/63ws2p6reHICSS+RljwCoIII0Ozj
	VcAfVidjtb53MPhNqH7RqkQ8cP+ty66aDzmYE8NiO+53nFN5bs6u4XWax8Zajg9u+MwtVD2KPdZMA
	JoD9JFcvFmuyrD0DIRCM3UhJmNXV0DdClB6lnGU46wG/+wQiYxAl/tA058u14CTVzACDR3ANskNtI
	ANGdg1XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSyI9-00000002zQA-06Yc;
	Mon, 16 Nov 2026 15:06:45 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSyI6-00000002zP9-2Bot
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 15:06:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=PcrkZrIiBXHxrgXY/IdmAR4Eo2KV+jR7a2aL3fB5faE=; b=ZRvd1OQ2dIKEtcE9W7VWS/zCgW
	WEbntPHrnnXHvvbSJHIRA0ymOuIloYJXtRh/JIVWhFT3uA68TKL3rInhRhN3ZfJRz3x9QVF52NsFO
	nTmu4+n67qv+Di4GFsOIHmBQ1XDONzzPHaYT2s6d6mkrCJ32+TLOM27KZnsrFLLkniNY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xSyHp-00GwqG-RY; Mon, 16 Nov 2026 16:06:25 +0100
Date: Mon, 16 Nov 2026 16:06:25 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Jisheng Zhang <jszhang@kernel.org>
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
Message-ID: <16ecb3ac-7876-4db5-9168-5ac9bf31d4b7@lunn.ch>
References: <20261116135442.4827-1-jszhang@kernel.org>
 <20261116135442.4827-2-jszhang@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261116135442.4827-2-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_070642_557862_B4F6A613 
X-CRM114-Status: GOOD (  10.16  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 16, 2026 at 09:54:35PM +0800, Jisheng Zhang wrote:
> Assume we have the following implementation:
>           ----------
>           |mmio reg|
> 	  ----------
>              |
>  --------    |      -------
>  | MAC0 |--MDIO-----| PHY |
>  -------- |     |   -------
>           |     |
>  -------- |     |   -------
>  | MAC1 |--     ----| PHY |
>  --------           -------
> 
> Both MAC0 and MAC1 have MDIO bus masters, and tie together to
> a single set of clock and data lines, which go to some PHYs. While
> there's a mmio reg to control which MAC mdio master can operate
> the single mdio clock and data lines, so only one MAC can operate
> the mdio clock and data lines.

How does this differ from pinmux?

    Andrew

