Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 112A1606A88F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 18:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dwO+1zOR;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DY/bh9cF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=IfqxjrYK+5b6SwLDSCdGV5c3D1FWDwIXDLxmgwwKJjk=; b=dwO+1zOR6o3MbcjlDIMQGRvups
	iXRl0wLEusspK8V0+Ok7Q2r5E6nZkf2AGbvfWJEdfSy7gpiAQuQ4qpWApN7i8+0DYAyNqPIbIO1Kr
	lR8CDM/rgDJdatgFLMkxCRm5voaDQONNm9hhMSIIH6/0abKF3J5QONllUoiQCmjxYJ/BTQ8ss01hf
	tK5NM/HkEKANKk0M+yyeVhruBtSQxJA1a1rDIs++jT6t0XZVh4L2aS2fTGHPEBFK6pQ4o/yDdH/oP
	SMd30UjgHGHqAmz37Yjv2WZwYKZiXZZ+WGNytubooGWLvyA5wD36KN35e3vhrsWNgGo5pSIHKIxiI
	xjuViBKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRCck-00000007MGd-0FdQ;
	Wed, 11 Nov 2026 18:00:42 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRCci-00000007MGN-2Va1;
	Wed, 11 Nov 2026 18:00:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1019A65515;
	Wed, 11 Nov 2026 18:00:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA9B71F00A05;
	Wed, 11 Nov 2026 18:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794420039;
	bh=IfqxjrYK+5b6SwLDSCdGV5c3D1FWDwIXDLxmgwwKJjk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DY/bh9cF3vhr8ka1oYjorFAP23L5hOTFCFuWyMSBy0jJ7Z3rTfHuQR477/xfLz05k
	 7eGMM4/cO6H71FNh+yjBGPD0oEU6n4v4jVUvbZdD4iRsy7eXCf4wmq5hcapskZbJqy
	 AlvGXeeQ8NT2/0U7lVOuiwQU9RbDs7JobTOmYh37LiXH8QnrPbUIg2Bp2iBdcyG0JE
	 cdbsdXPLqri3hXiQBkNYrSnW5RBDObLSNSlmU7KGQQwpMY+X0joCLlw3OyG7hXMb63
	 dEgTrqgkzVh7048xeWcHoTNaLMI78cJalP4lv3kwnWQX1OmMtp/0Z9NKM4wExOKWJt
	 zoZ1VnC72ntzQ==
Date: Wed, 11 Nov 2026 18:00:33 +0000
From: Conor Dooley <conor@kernel.org>
To: 1579567540@qq.com
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	David Wu <david.wu@rock-chips.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH net-next v2 1/2] dt-bindings: net: rockchip-dwmac: Add
 RK3572
Message-ID: <20261111-sprinkled-kinswoman-9dae5d8040c6@spud>
References: <20261111-add-board-ok3572-c-net-v2-0-304466394970@qq.com>
 <20261111-add-board-ok3572-c-net-v2-1-304466394970@qq.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2kouTlog9XyxYE8J"
Content-Disposition: inline
In-Reply-To: <20261111-add-board-ok3572-c-net-v2-1-304466394970@qq.com>
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--2kouTlog9XyxYE8J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--2kouTlog9XyxYE8J
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCavStQQAKCRB4tDGHoIJi
0sWOAQCtxEQyPEIYrZQIMO9/45cDtSBZcJdG7Pcx0xqdgKv9bQD7Bk7YHrFee3MG
+kKbj7wQGVXcJV+Re8bAYp//6kEvzgI=
=+Ani
-----END PGP SIGNATURE-----

--2kouTlog9XyxYE8J--

