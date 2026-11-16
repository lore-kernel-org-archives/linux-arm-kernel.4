Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A7BC606A880
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 14:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AfB0pLu+;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=Le/+a0St
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=6XgtXKrUb7kPgwKD/f012L0xoO7Sh8iYK023Xn9JSFI=; b=AfB0pLu+wAD2Je7NWKG4N1p6RO
	UWrVdEjnNCW++2wZNrIH3TqR0iPSVq/FTGVKTdqIfoFj2aOKm6pILJeq9GLa/Uzkd5+v56r6JigzS
	UGPZxPNIRmPKQDk+WVgKYbCw3tnSaaRVCgv6FZvRK287+5CwrM/41Rbstd5WQ+YNyffrhXaxiVL/+
	fNRUxU2if3hO/43lqBEFzqX1Sg8CmNSB3q6zn2ukgbwXvEO+L09r2eOLyIe2Cs71GsVoFLenoAMck
	IlWM62OEG1X4LPp2nikdToJ7k6SC/HCepMkEWA+P9wP90zvbsfR0zN9hvogetb3icsh13MHEBEu5l
	cTBvPLbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSxNn-00000002lIG-0oqd;
	Mon, 16 Nov 2026 14:08:31 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSxNj-00000002lGf-43yS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 14:08:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1794838099;
	bh=6XgtXKrUb7kPgwKD/f012L0xoO7Sh8iYK023Xn9JSFI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Le/+a0St5+LbKQh4KvmBcsPiv9Z54ypsyqNjFb/uB43/ZAZK22Q4F9XYCwyRVGMey
	 mphndvunk8dNwplRzbWJKiYV62UWsfDsL9jyF2q/UbEZUZ5QMgh7O95kDICDmjo7eM
	 xqNYO6BwW+WzDPoVMIWG4iRZdYeBmxdW2Ny9bU3zu2HPrDHLeL19cN9csHX68+0kmw
	 akgq6KFBgY4/y0bz+Y5z1T/MN2p9wRuoSfu79lQ/RlasxwzzX6HSxqu9ZzudxYyWkz
	 ya96AtbI4ikjJG+DABEeCu1ywwWLrxZHV9rt9LVtT8fRhrTuVTOIODVvuYExijyBT+
	 6Efj2sLle885w==
Received: from pecola.lan (unknown [159.196.93.152])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id BCEAD6005F;
	Mon, 16 Nov 2026 22:08:16 +0800 (AWST)
Message-ID: <63b0ab24f2ec4f83ac87add03f2aa9517f7f73dd.camel@codeconstruct.com.au>
Subject: Re: [PATCH net-next 0/2] net: mctp: Add MCTP transport for the
 Axiado AX3005 IRoT
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Akhila Kavi <akavi@axiado.com>, Sammai Chakravarthy	
 <schakravarthy@axiado.com>, Prasad Bolisetty <pbolisetty@axiado.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet	 <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni	 <pabeni@redhat.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Tzu-Hao Wei	 <twei@axiado.com>, Karthikeyan Mitran
 <kmitran@axiado.com>, Matt Johnston	 <matt@codeconstruct.com.au>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	openbmc@lists.ozlabs.org, Adam Young <admiyo@amperemail.onmicrosoft.com>
Date: Mon, 16 Nov 2026 22:08:16 +0800
In-Reply-To: <f752d203-8239-4203-aa04-884b4d7e5d80@axiado.com>
References: <20261101-mctp-transport-irot-ax3005-v1-0-36ceb822f01e@axiado.com>
	 <4102c20ece135c4d94e94af4441a01425ad159fc.camel@codeconstruct.com.au>
	 <f752d203-8239-4203-aa04-884b4d7e5d80@axiado.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_060828_206718_5ED75164 
X-CRM114-Status: GOOD (  17.36  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Akhila,

> Thanks for the review. To give some context first: this link is
> entirely internal to the AX3005, and not for host communication. The
> IRoT's MCTP endpoint is only reachable from the application subsystem
> on the same die, through the mailbox and the shared-memory carve-out.

Yep, understood.

> Both ends are fixed on the same die, and no third-party MCTP device
> can ever be on the other end of this link, so carrying it as MMBI
> would add nothing.

It would mean that the driver doesn't need to be entirely custom.

I'm mainly curious as to why you went with a brand-new interface rather
than implement MMBI.

> The IRoT can't bridge anything to this link. As above, nothing outside
> the chip has a hardware path to the IRoT's MCTP endpoint, so the
> application processor is its only MCTP peer.

OK, makes sense. Be aware that you may have the other direction too, in
which case the iRoT may need to fragment (and reassemble) packets that
are bridged through this host, to other peers via links with a smaller
MTU.

I assume that's not in your current designs, but will crop up if those
change.

> If you would prefer, v2 can default mtu to the 68-byte baseline and
> leave max_mtu at the negotiated limit, so the platform config raises
> it explicitly. I'm fine with either option.

Your call really. It's generally safer to start at the BTU and then
increase, but if your platform design means that the max MTU will always
be safe, then may as well set that.

> Please send the implementation comments when you're ready; I'll fold
> them into v2.

OK, shall do.

Cheers,


Jeremy

