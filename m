Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA7A606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 17:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dhrwXtwq;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BdsKOFx8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=9oKtJzzwarYUJiv7jlPjh+yzmRSqn2gjanS9mNX4SlA=; b=dhrwXtwqCsyNBhegJYyQ6Gwp/G
	iOyzc1sBi4frxakopSomTVQcHiBii0A714hzf/799rL1IqHmIfyqkSRKEdFAnGfl5UkT+A2Eqbi4t
	9EOhmcC5y7pXY3PktFdYx9ud4br8gQ5db0Csb6Pn28OAmhFPmzpt1hnadgDU8AN/uEvKCGcMznjNF
	1tg3pQyfzh7rG5NVV3sGM6q6ikMD5Un2aBADUsJoHvrRa/lVoXSn14ymdnEAXoRABAer/q10Xoh4F
	RrDyPAa5nhikufvI46LLBP/mwaQaHvENv/0055zh5D6Izeq8JKvRBfTijgQ4bWxWNYENvn3c58jON
	BAERJ6xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPNZ2-0000000DCD8-35Pc;
	Fri, 06 Nov 2026 17:17:20 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPNZ1-0000000DCCu-1YFq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 17:17:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 86A1B601BF;
	Fri,  6 Nov 2026 17:17:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6F8D1F0089F;
	Fri,  6 Nov 2026 17:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793985438;
	bh=9oKtJzzwarYUJiv7jlPjh+yzmRSqn2gjanS9mNX4SlA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BdsKOFx8Fo9DJdwDbgz2wj26tgTqPDVvzevk5w5vP8mQcA8jVXw3UYC/USvw9o44h
	 cdyea92E4IFG01B5luPNipM0sDj8iD7OMpMMQjowEIZMatkgGLO1qq1TOJ5lnWadsz
	 mma+h33PEMEpwd+hBxaJbzYSLYNaFWCcbt0TZig4BThotUQH5QF9+x9XJyZRO+Zd+A
	 x7DRIpClp98U/ceBQg5rSHCPjxOGmqiUttil8hh2YP+DlC9v+kQjlNvHQZ6GpMRr+p
	 7KFB5e9uxQlvk7zwGC1mDpnTlxhSgrcD3KS6Jlt0F0krvhBmweGXrB7SX524xeUrA3
	 34k3GljwueBwg==
Date: Fri, 6 Nov 2026 17:17:12 +0000
From: Conor Dooley <conor@kernel.org>
To: Cunyuan Liu <cunyuan.liu@cixtech.com>
Cc: boris.brezillon@collabora.com, steven.price@arm.com,
	liviu.dudau@arm.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, gary.yang@cixtech.com, fugang.duan@cixtech.com,
	daniel.almeida@collabora.com, aliceryhl@google.com,
	p.zabel@pengutronix.de, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	cix-kernel-upstream@cixtech.com, robin.wang@cixtech.com
Subject: Re: [PATCH 1/3] dt-bindings: gpu: Add CIX Sky1 Mali support
Message-ID: <20261106-overjoyed-uprising-bcda8196d8b1@spud>
References: <20261106104735.1651267-1-cunyuan.liu@cixtech.com>
 <20261106104735.1651267-2-cunyuan.liu@cixtech.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TL3BuhlNyfu8TC1S"
Content-Disposition: inline
In-Reply-To: <20261106104735.1651267-2-cunyuan.liu@cixtech.com>
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

--TL3BuhlNyfu8TC1S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--TL3BuhlNyfu8TC1S
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCau4LmAAKCRB4tDGHoIJi
0qkCAP4lUa8NxvJSR4tsLoNVyXaFW5xl+a+v4xBkMN56edTbEwEAvt6berL7udJW
J6YV6LryD66prWkFjrzJlKzTHuNVkwI=
=bAJc
-----END PGP SIGNATURE-----

--TL3BuhlNyfu8TC1S--

