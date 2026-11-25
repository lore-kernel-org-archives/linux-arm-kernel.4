Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2CE3606A335
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 21:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qVTaDSrB;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=zAKRTYQ6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=iGd5SoNcIdPRf+X5W5xhsxkWslmG4vdZNOWfyt5Bu4A=; b=qVTaDSrBdxbCa0pQnNhF8L64zU
	M8cHp2y0KbBlGV5SVsAm+m52Xq4ioVIsQnGIypKRs+jmtn0cacItyzuRiQribukxd1iLyAZUjFtFA
	bE7Lc8xjkmX4P7jT1CLrYUAoqo3nTiL623Qw1zYrNXxFmFYzkw8GPnWFcnBx8TLYGEzjRXrKJqFyS
	0NpYmm4y2j3w1bunPQTbBs+CgXp3BAfwuCGGCwbb29qNBgoXizdmOS02RtlInz1BqjbiIKAI3ryxP
	S7YIIFmDBMI21WHsJzzrJbsF2QxJoHkOyWTWtp9m4esGGbbGdmMgDiaV3TAv7pxjG8/T9f/VQXIgP
	yXmc4FJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWKIq-0000000BM0b-2AM0;
	Wed, 25 Nov 2026 21:13:20 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWKIm-0000000BLzt-3TEQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 21:13:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=iGd5SoNcIdPRf+X5W5xhsxkWslmG4vdZNOWfyt5Bu4A=; b=zAKRTYQ6dAHp1kq+pIly9jqUl+
	mEfRqkks+O56nq3eMEHQc4ydoYu24dc1XcS/SZPd/jR8qtTbDI6QbV3uZG5uOLwn/s6jT1+L7wL+6
	vp0TrImF9NpiAGtTpQggHoMn0A+hGncgB3/nn/bIcLDyIHQSX4Bkger/UkLN9+zvnAsQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xWKIZ-001RBD-5P; Wed, 25 Nov 2026 22:13:03 +0100
Date: Wed, 25 Nov 2026 22:13:03 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: filipp.dunsky@gmail.com
Cc: Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Simon Horman <horms@kernel.org>,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Florian Westphal <fw@strlen.de>, Phil Sutter <phil@nwl.cc>,
	Hans Ulli Kroll <ulli.kroll@googlemail.com>,
	Linus Walleij <linusw@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Russell King <linux@armlinux.org.uk>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	netfilter-devel@vger.kernel.org, coreteam@netfilter.org,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH RFC net-next 5/7] net: dsa: qca8k: select the four-byte
 format before port activation
Message-ID: <7feee622-0c4f-4c7c-a473-02e0bb5cbf10@lunn.ch>
References: <20261125-almondplus-offload-rfc-v1-0-703175c6340c@gmail.com>
 <20261125-almondplus-offload-rfc-v1-5-703175c6340c@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261125-almondplus-offload-rfc-v1-5-703175c6340c@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_131317_109434_85925EAB 
X-CRM114-Status: UNSURE (   9.85  )
X-CRM114-Notice: Please train this message.
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

On Wed, Nov 25, 2026 at 11:50:33PM +0300, Fil Dunsky via B4 Relay wrote:
> From: Fil Dunsky <filipp.dunsky@gmail.com>
> 
> Select the requested format from the CPU ports before DSA chooses its
> tagger. Stop packet actors and verify the switch header state before
> opening user ports. Use MDIO for management and preserve both conduit
> MTUs.

Confused. What has the QCA driver got to do with this?

I think it is time for a big picture architecture email.

  Andrew

