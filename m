Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EF6F606A323
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 16:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=isXyXV+/;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=x5lVauwi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=PxUCnxdGeaH9jQnUTzXnwWxDtaWf9XkV1Yj+9u92n6M=; b=isXyXV+/ALgdUt8H7oB+nD7i3z
	RNomiaHagNEWVMMA8L0PzLlUqAv/8P8jV6mPArHdoSHRZCM5WTKid3eupiIeyutKC7C0FiZ3y0BhI
	vnBM5fT0fgJTQ+NMU1fJGlRY6Wu+MuAOCzOcT8qdvdta6cvu0USOM4WEsVUlGGAkKPDKNwhaaBCz3
	E+RzWsWFTaczBW5gkcC+T0+0c3+XUK61AJFBoBaDlJl/DG5adWAFUOebb82r3jrKBPYg/icPOi/K7
	rHhiSgvKsvzWgC52nSBQ9drwxAuThB5kEzkLREZgBMEIQg9qThHvTh3RYuqIcVqSVD1IQYwyOIrdN
	T4elCfcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWG4D-0000000Abca-1dcz;
	Wed, 25 Nov 2026 16:41:57 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWG4A-0000000AbbZ-36Uy;
	Wed, 25 Nov 2026 16:41:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=PxUCnxdGeaH9jQnUTzXnwWxDtaWf9XkV1Yj+9u92n6M=; b=x5lVauwi6Nf6hMGyjMbtxkPKfn
	AfVs+MJlDr+Q2wy/UlK78S1woUzFGb1NxjdJd0Jwmuu0JIT06IpZSD631GJlb1VE67MWqIY4DG0mC
	5kUFeCHyMR9d6gEWVlqT6eAFCWViRk4lLKm+DM9T5ntpnkTTeB/+hUocRgHKyHCHsIWA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xWG3r-001N2M-5U; Wed, 25 Nov 2026 17:41:35 +0100
Date: Wed, 25 Nov 2026 17:41:35 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Alexey Charkov <alchark@flipper.net>
Cc: Ryan Leung <untilscour@protonmail.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	Simon Horman <horms@kernel.org>,
	Ricardo Pardini <ricardo@pardini.net>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/5] nvmem: rockchip-otp: Derive MAC addresses from
 the CPU ID
Message-ID: <789d3358-81cf-4276-9f8e-4787df120059@lunn.ch>
References: <20261124-rk3576-otp-cpuid-mac-v4-0-d403b8a25113@flipper.net>
 <20261124-rk3576-otp-cpuid-mac-v4-3-d403b8a25113@flipper.net>
 <0aH4P5VH9HNiTXpCUTaTlvGaoUDQBnvv-0cSXtipSDkLOGjzGy96jDqsVtU0DJTWrocgoMcGFEgd0JUlF5mljVvCzGKVz4yUgDQ0s6HaDLg=@protonmail.com>
 <2f8da604-36af-4944-8168-02b046e97699@lunn.ch>
 <CAKTNdwG1sSBVKcKpHBj24nFCdc6WVKabV5=K4sJFucWpTLqRQQ@mail.gmail.com>
 <1defc5c8-ba61-40d2-99f3-6654f1743af1@lunn.ch>
 <CAKTNdwFktkMtdLW2GzqzLH+LO4kF0uY0jWpnvO5vbWmd-e4iWw@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKTNdwFktkMtdLW2GzqzLH+LO4kF0uY0jWpnvO5vbWmd-e4iWw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_084154_776576_593B4505 
X-CRM114-Status: GOOD (  16.58  )
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

> > That way of_get_mac_address_nvmem() just works, so the MAC driver just
> > needs to call of_get_mac_address() or of_get_ethdev_address().
> 
> They still need to relax the size check as done by patch 2/5 in this
> series, because the CPUID cell is 16 bytes long. Srinivas rejected a
> prior version of this series that attempted to return cell contents of
> different sizes depending on the use case. Currently any cell size !=
> ETH_ALEN gets rejected by the net core, not just < ETH_ALEN.

Ah! I had not looked at the whole series.

Having to change the core like this is an argument for doing it in the
MAC driver. It asked for a MAC address. What it got back is not a MAC
address if it does not have 6 octets.

Please throw this all away and do it in the MAC driver. If there are
multiple RealTek MAC drivers involved, you can put it into a little
library and share it across the drivers.

It is actually an interesting idea. Maybe it should be placed in
of_net.c, so other drivers can use it. How generic is it having a CPU
ID in the OTP? Are there other vendors doing it?

	Andrew




