Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC65606A323
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 14:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NHP+IlLJ;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=FeuXP+eq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=kgDRQFvvfjQZkPMqc9sNVxcY05Fagrbh4c9pSkoSO9I=; b=NHP+IlLJr6NWZXWl1mRplOWlIV
	Gm6yzd3fftTekDNTGkOzKTe/7JU8UD/zJwbdHYhGqWSyLsZKSd4PnBGTqqX79JHnurGZHBXLY1p9n
	nS5Ep/wV4/gj3VkS6xDVXkFwjeNa2DXDHIpK8GMNIsi4LUzvAdosQTxO49EDnHwMSedPVNS0t/n0Z
	E2Uj9P/mqpN1VJi+P7Yf1ufQbiMrxktxciUoMkg43l887SNwGU28JSomSI31YemcREJpSwZ6DXeTD
	AYjOQaJbvvk2AkxoTgJcpldHQsxJv9s4INdwL9jRS3Q09xdz1u2qFO8rymwLj7DyCUP2PXBYBy59z
	IMcJrvnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSF9B-0000000GJH8-19Ol;
	Sat, 14 Nov 2026 14:54:29 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSF97-0000000GJFe-4BUr
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 14:54:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=kgDRQFvvfjQZkPMqc9sNVxcY05Fagrbh4c9pSkoSO9I=; b=FeuXP+eqev/PzBKpj9mW8d8W2x
	eE8bX262SZsAL7oYIZDoFl3Zd/rYunoXDBny8KscRvGel99rtMr9g+dznWsWh/avO7t0kC3CKdfmb
	HZSNMKG1zZuBQ9+/XwGvfcXEqQqWcT7yaZ5FkvGIoRzVLzgkYKeI7w9X4AvB44kwX8Wg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xSF8l-00GVVx-5i; Sat, 14 Nov 2026 15:54:03 +0100
Date: Sat, 14 Nov 2026 15:54:03 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: netdev-bot+sashiko@kernel.org
Cc: s.trumtrar@pengutronix.de, andrew+netdev@lunn.ch, davem@davemloft.net,
	kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, afd@ti.com,
	hkallweit1@gmail.com, linux@armlinux.org.uk, michal.simek@amd.com,
	edumazet@kernel.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next v4 4/4] net: phy: dp83867: support setting
 output-impedance
Message-ID: <f484a5cc-7283-4bf7-88ee-da68ffcc7647@lunn.ch>
References: <20261110-v7-2-topic-dp83867-v4-4-a268f83b1ec1@pengutronix.de>
 <179465553811.2199510.12732274072788992215@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179465553811.2199510.12732274072788992215@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_065426_160022_4BAF3B76 
X-CRM114-Status: UNSURE (   5.82  )
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

> Would a raw register code property work better here?

That goes against DT best practices.

> Another option would
> be to document the ohm value as approximate

This seems more reasonable.

     Andrew

