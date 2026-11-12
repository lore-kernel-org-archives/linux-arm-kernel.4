Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04EBC606A331
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 00:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ro0d99Do;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Rpmtyci8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Q/EartPOy717CuQdv8ANaMlETa+4mCRy7I4dcWtZtrE=; b=Ro0d99DoGnPBPV
	g+DVI14PIa0YFk/RMGvQKST0kuDhZr+98zGPoM4nI98GHWMYr52/b4LBuqtpaJXEPudIVmtSDbokl
	9kmIdUVLsgJAQYlvbyr8pDyC1oSs6TYGKxdoY8NRkBcAX0D2wVcdq3qgBR7T2zW1linUvXkdNNRZH
	lilY5Nwzc9mnq/KHYrVRIvpIUAzNmC3HvdkEUl65kQztHoUh3bfw7B1iAEEFhiyPVCjEitpQsoyDo
	eVgFU7/SaHQxVTJaaWpWhXWEwf0DnmSoCNEO+x6ZXYTvOs49EPnZ7L7dwd+IBZHHn71vYKPytJ95D
	VVqm6wrCyuvvEIG4HioQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRIT1-00000008DMq-19vd;
	Thu, 12 Nov 2026 00:15:03 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRISz-00000008DMf-37qO;
	Thu, 12 Nov 2026 00:15:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 28E2941074;
	Thu, 12 Nov 2026 00:15:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A60B1F00A07;
	Thu, 12 Nov 2026 00:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794442501;
	bh=Q/EartPOy717CuQdv8ANaMlETa+4mCRy7I4dcWtZtrE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Rpmtyci8aux5sP02UwuMM0SFs1Ay4fZueM4bTxiZAvf1FG/XV2+1zNXsE0Ri3aVxE
	 Lz7/V3FoZmXtls4ENNgK9ebqPtTIRCtEU4crfR8jfASyOwESqRTsg7ya9r6PVP7S00
	 SZ8YJs7qh8OYlbn40nmcbXWzrbNOYP09/iyhqD1tmGeYo63rlR/fxHE/Nj9F3WC5Lr
	 OhFR4Uj6c9TYSDpb3YvcNoq7SEjOvTiIHveNLHnyOqa/0m+IJo2jL5QGackjbXUkw/
	 GdC47yH+vK84qfngcuCWhkwqYDju3eVgJ/b5uwF7VHmevhk1sMJX5YPRdOCpaIzQf0
	 m7DsfPn1Thx3A==
Date: Wed, 11 Nov 2026 16:14:59 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: "Cunhao Lu" <1579567540@qq.com>
Cc: "Marc Kleine-Budde" <mkl@pengutronix.de>, "kernel"
 <kernel@pengutronix.de>, "Vincent Mailhol" <mailhol@kernel.org>, "Heiko
 Stuebner" <heiko@sntech.de>, "Oliver Hartkopp" <socketcan@hartkopp.net>,
 "David S. Miller" <davem@davemloft.net>, "Eric Dumazet"
 <edumazet@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>, "Simon Horman"
 <horms@kernel.org>, "Jonathan Corbet" <corbet@lwn.net>, "Shuah Khan"
 <skhan@linuxfoundation.org>, "Randy Dunlap" <rdunlap@infradead.org>,
 "Wolfgang Grandegger" <wg@grandegger.com>, "linux-can"
 <linux-can@vger.kernel.org>, "linux-arm-kernel"
 <linux-arm-kernel@lists.infradead.org>, "linux-rockchip"
 <linux-rockchip@lists.infradead.org>, "linux-kernel"
 <linux-kernel@vger.kernel.org>, "netdev" <netdev@vger.kernel.org>,
 "linux-doc" <linux-doc@vger.kernel.org>, "stable" <stable@vger.kernel.org>
Subject: Re: [PATCH net v8 00/10] can: fix Rockchip TX stalls and bus-off
 restart/close races
Message-ID: <20261111161459.4879a82d@kernel.org>
In-Reply-To: <tencent_F59D327809C523BE014488357EEF4D163408@qq.com>
References: <20261108-rockchip-canfd-restart-close-v8-0-3e7a23fd9eae@qq.com>
	<20261109112402.283c16a3@kernel.org>
	<tencent_F59D327809C523BE014488357EEF4D163408@qq.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

On Tue, 10 Nov 2026 11:05:37 +0800 Cunhao Lu wrote:
> > >=C2=A0Subject:=C2=A0[PATCH=C2=A0net=C2=A0v8=C2=A000/10]=C2=A0can:=C2=
=A0fix=C2=A0Rockchip=C2=A0TX=C2=A0stalls=C2=A0and=C2=A0bus-off=C2=A0restart=
/close=C2=A0races =20
> >
> > please=C2=A0use=C2=A0get_maintainer.pl,=C2=A0do=C2=A0not=C2=A0CC=C2=A0n=
etdev=C2=A0on=C2=A0CAN=C2=A0patches=C2=A0directly. =20
>=20
> I used b4 prep --auto-to-cc, which invokes get_maintainer.pl.
> The series modifies Documentation/networking/can.rst, which matches
> Documentation/networking/ under NETWORKING [GENERAL] and is not
> excluded there, so netdev@vger.kernel.org was added automatically.
>=20
> I will manually remove netdev@vger.kernel.org from Cc for the next
> revision.

Or better still send a patch to exclude it like the rest of CAN

