Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEC6D606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 21:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xC7C56mf;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=xlOX/SZg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=2BEKaTve0j9tQYjMUbUV4dUCu3Ld1ARa8Kk+N3aaIok=; b=xC7C56mfjW3FPxVqhm4BeW93NH
	602M8nJ/RKoAPgRFLsiNqPXFIZGAdzQ77w7dCVr8RVI1cQQdrTERF2TzjAFKc3op6pdNovISY3eYX
	2qhOs5l+AnyqnLdEu6CSD6aVBcTH21AyzV99Z0USry4N2NDT0hKXokOTFkzugL9VSWpSy2GD4t/qn
	pWBIZsbBHSzo2XSme3r3NRC2mEbY6d9vKveDzMHbVFuT5GNK6MW+Cz4984yPpeNbDr3QIgS5dHN+h
	wSYYA9BHtMQ2SlPrSqO9G8WL2s/w1LBbXcRDOjix+HtnlPzenZx/ApwHKXLqig5K2awED14UeZq7e
	pNeT88qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWKLg-0000000BMDh-0Pl2;
	Wed, 25 Nov 2026 21:16:17 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWKLQ-0000000BMD3-0Xo6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 21:16:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=2BEKaTve0j9tQYjMUbUV4dUCu3Ld1ARa8Kk+N3aaIok=; b=xlOX/SZgDWek5IKkVtKOCVCqfP
	tZ+D943IqZYWTMtiUO04zSMB4/rp2vZZbpQx8eGpDdWilQmUJfF6xGAOdD6cZ4dikHRhNkUA1nazK
	BJp3w08UjmyPyRrUdugzfHcGEqutw6Cc5BERYyFaARElq4LeUPP2oH/2DIOjhwdRiGRw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xWKLA-001RD5-O1; Wed, 25 Nov 2026 22:15:44 +0100
Date: Wed, 25 Nov 2026 22:15:44 +0100
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
Subject: Re: [PATCH RFC net-next 2/7] net: dsa: add a QCA four-byte CPU tagger
Message-ID: <71917772-9db5-4ed7-8c23-c0ca6574a64d@lunn.ch>
References: <20261125-almondplus-offload-rfc-v1-0-703175c6340c@gmail.com>
 <20261125-almondplus-offload-rfc-v1-2-703175c6340c@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261125-almondplus-offload-rfc-v1-2-703175c6340c@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_131600_205245_6CC52691 
X-CRM114-Status: UNSURE (   8.63  )
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

>  #define dsa_lags_foreach_id(_id, _dst)				\
>  	for ((_id) = 1; (_id) <= (_dst)->lags_len; (_id)++)	\
>  		if ((_dst)->lags[(_id) - 1])
> -
>  #define dsa_lag_foreach_port(_dp, _dst, _lag)			\
>  	list_for_each_entry((_dp), &(_dst)->ports, list)	\
>  		if (dsa_port_offloads_lag((_dp), (_lag)))
> -
>  #define dsa_hsr_foreach_port(_dp, _ds, _hsr)			\
>  	list_for_each_entry((_dp), &(_ds)->dst->ports, list)	\
>  		if ((_dp)->ds == (_ds) && (_dp)->hsr_dev == (_hsr))
> -
>  static inline struct dsa_lag *dsa_lag_by_id(struct dsa_switch_tree *dst,
>  					    unsigned int id)

Did you review your own patches?

	Andrew

