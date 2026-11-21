Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A653606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 16:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=y0Lqd/GF;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=vWMuBhEL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=7BfZ4ezOsyJWlaZx8zGrRFH+Xob1HMqX/m78J/0L5dE=; b=y0Lqd/GFQKOxThBGQbQ/MlBmfh
	RbRJFYdkjtpdILrwHH7WCbpaxfKtvLpzz3cl28Tsr3EdaGwTRS8lBz9TSTNMt6NEulzyhHqH01oWS
	ZkFylwKPfbFOjOJayld0J0dvHdYcEzunFwvLMs1IW8Mhqq7Vm5kj1ux9dW7tSWvTZDA+bTAeJU7Ta
	l/6HsYyzl4uVBNds9eUAPgFbMySKQQh113KmZQKwhTKlnY9f2yrZhNiiq/kZvDd+CrXPV5syVkxTh
	zZyFXchmsb1Y3CfqiygyphIOEV+nwPOoA+Oo2qTXTQ1OtiLZ1J16NVedpwG0egk9NRw51bILw5/WI
	9+033g5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUneq-0000000HT6q-0jdZ;
	Sat, 21 Nov 2026 16:09:44 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUnek-0000000HT22-00xS;
	Sat, 21 Nov 2026 16:09:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=7BfZ4ezOsyJWlaZx8zGrRFH+Xob1HMqX/m78J/0L5dE=; b=vWMuBhELKZhkOE50k9naugms6x
	aBRzDyWiCU32WUfxiJ9CmkKxi7DPiXk2TpKQZ1ylTKhksqU2LE1aB0AP1uOW31p/5S1rP1WfPeDCc
	6lQedV8M2Gfrx2hcQJvXhzDLqBjJRMZH/2s9cdDfWagzp7G/3zK6M1AANXQPNtvcR54nIzvTmp2t2
	pMDEHSMc3MCXEXprx7KNgu1CXRENMIGtwqmaryI0beUU6HNGUou+mX10bNYSanKiTzSTZRBq1t7/X
	KC+rjqRr+TtrZu2iNircQNWLAR+j7dXqzFq90eeLaHxSR4lAqMO3bYCV9n3bc6D1V3zmtd3Iz8jFz
	neZ4o/5Q==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Linus Walleij <linusw@kernel.org>, Ye Zhang <ye.zhang@rock-chips.com>,
 Jonas Karlman <jonas@kwiboo.se>
Cc: linux-gpio@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Jonas Karlman <jonas@kwiboo.se>
Subject: Re: [PATCH] pinctrl: rockchip: Fix pull configuration readback on RK3506
Date: Sat, 21 Nov 2026 17:09:29 +0100
Message-ID: <-Gre4owXTw2C51e--4u2UA@sntech.de>
In-Reply-To: <20261121155810.706866-1-jonas@kwiboo.se>
References: <20261121155810.706866-1-jonas@kwiboo.se>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_080938_074561_48C6E8EE 
X-CRM114-Status: UNSURE (   8.04  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Am Samstag, 21. November 2026, 16:58:09 Mitteleurop=C3=A4ische Normalzeit s=
chrieb Jonas Karlman:
> rockchip_get_pull() is missing a RK3506 case and instead returns -EINVAL
> for all pins. As a result, the pinconf-pins debugfs file omits the pull
> configuration for all pins on RK3506:
>=20
>   pin 0 (gpio0-0): ..., pin output (1 level)
>   pin 1 (gpio0-1): ..., pin output (1 level)
>   pin 2 (gpio0-2): ..., pin output (1 level)
>   pin 3 (gpio0-3): ..., pin output (0 level)
>=20
> Add RK3506 to the case that decodes the pull configuration from the
> register value to fix pull configuration readback on RK3506.
>=20
> After this the pinconf-pins debugfs file includes pull configuration:
>=20
>   pin 0 (gpio0-0): input bias pull up (1 ohms), ..., pin output (1 level)
>   pin 1 (gpio0-1): input bias pull down (1 ohms), ..., pin output (1 leve=
l)
>   pin 2 (gpio0-2): input bias pull up (1 ohms), ..., pin output (1 level)
>   pin 3 (gpio0-3): input bias pull down (1 ohms), ..., pin output (0 leve=
l)
>=20
> Fixes: dbd2317d7b9f ("pinctrl: rockchip: Add rk3506 pinctrl support")
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>

rockchip_set_pull has that case statenment, rockchip_get_pull is
missing it.

Reviewed-by: Heiko Stuebner <heiko@sntech.de>




