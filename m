Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7DDD606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 12:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HMxqSIQP;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=1qdLnggx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=uPfpI50tb7D/+LMDNaFZyv1Wo1aup2sr8aIhOr5amnQ=; b=HMxqSIQPgFYxGU/lwL9alQeX97
	ZJkU9O9meu40FIK+qQq3YjrOcp7JH587mUTnwajWAKxQle3mPvyN8AQInjLHz0ZDh8QL680tL0Nyh
	aOTiU9/m2e9JmlOcKdc3z4EOf7Chc8w5DnIqq+M4hIlz6+xJO/aoQvQ+YKP5Miblhr0fP7S9bO7oz
	IX+xiJZONx12Su2SPorrgHrvQ1nkSfA9k9UYDn2uF37cJIk+uTY8gGFDfVQk/0r78X6P1LTSN2on5
	et+BmTWd9dOHdBEzZVujoMTDqkN9mCKwh6SiNyW/cq+sXfEy8/njnJaS0bgaHLwRG0Fvs1NHvlJpI
	AeWJBJsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWvM4-0000000GBLo-1pQH;
	Fri, 27 Nov 2026 12:47:08 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWvM2-0000000GBKq-13mX;
	Fri, 27 Nov 2026 12:47:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=uPfpI50tb7D/+LMDNaFZyv1Wo1aup2sr8aIhOr5amnQ=; b=1qdLnggxochql+Dkqhr5X4AKRD
	ReaGpAvcLsFO9OI3C56HicPRmLbXl3eXd1/sqiVFncFWPwPKnoga/OuBeqYpiib1YBYC0RiFVLSYl
	I5l3hyzgouu29yGPhAYXlZMW/RESMaflKOWkPOjoAW4xYw4DqAxhqEwkNe/kuRgydtL+Ht/DanSSL
	PoGUmkpIrjIIbMR+10d8dEG5+ktRJMrh0xxWm6GS/8GhlvGL5kxni1mueOiU2LX5vbFuWwvXJC9pt
	hMwq0Ea/rxzEdqf5IwxjvofVeZbcgRTTiBULgeJ0zPI90Fs9ynXytIv4AhuvwowlA3rFKyaTRSBnF
	GM2u+dRw==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Andi Shyti <andi.shyti@kernel.org>, Wolfram Sang <wsa@kernel.org>,
 Jensen Huang <jensenhuang@friendlyarm.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-i2c@vger.kernel.org, kernel@collabora.com, stable@vger.kernel.org,
 Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCH] i2c: rk3x: Do not sleep in atomic polling transfers
Date: Fri, 27 Nov 2026 13:46:55 +0100
Message-ID: <7m4BPz_aRRWlgAirQmmfoQ@sntech.de>
In-Reply-To: <20261127-rk3x-atomic-transfer-fix-v1-1-076c94c07241@collabora.com>
References: <20261127-rk3x-atomic-transfer-fix-v1-1-076c94c07241@collabora.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_044706_310203_89A2B9A7 
X-CRM114-Status: GOOD (  19.99  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Am Freitag, 27. November 2026, 13:33:05 Mitteleurop=C3=A4ische Normalzeit s=
chrieb Sebastian Reichel:
> On the RK3576 Sige5 during shutdown the following trace appears on
> kernels with multi-core support and lockdep enabled:
>=20
> [  167.961946] WARNING: kernel/irq_work.c:296 at irq_work_sync
> ...
> [  167.963902] Hardware name: ArmSoM Sige5 (DT)
> ...
> [  167.972228] Call trace:
> [  167.972445]  irq_work_sync+0xe8/0xf8 (P)
> [  167.972796]  disable_irq+0x44/0x60
> [  167.973101]  rk3x_i2c_xfer_common.isra.0+0x254/0x708
> [  167.973544]  rk3x_i2c_xfer_polling+0x20/0xa0
> [  167.973925]  __i2c_transfer+0x180/0x9d8
> [  167.974269]  i2c_transfer+0xc4/0x180
> [  167.974589]  regmap_i2c_read+0x64/0xc0
> [  167.974924]  _regmap_raw_read+0x120/0x468
> [  167.975283]  _regmap_bus_read+0x4c/0xa8
> [  167.975626]  _regmap_read+0x6c/0x260
> [  167.975945]  _regmap_update_bits+0x104/0x160
> [  167.976325]  regmap_update_bits_base+0x5c/0x90
> [  167.976720]  rk808_power_off+0x70/0x110
> ...
>=20
> Avoid waiting for a handler from another CPU to finish to fix the
> problem. At shutdown time this won't happen as the other CPUs are
> already stopped. Apart from that disable_irq_nosync() still prevents new
> invocations of the handler, which is what avoids the spinlock recursion.
> A handler already running on another CPU is serialized against the poll
> loop via i2c->lock.
>=20
> Cc: stable@vger.kernel.org
> Fixes: 19cde9c92b8d ("i2c: rk3x: fix potential spinlock recursion on poll=
")
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>

With CONFIG_DEBUG_ATOMIC_SLEEP activated, this should also already
already warn from the might_sleep() in disable_irq(), I think.



> ---
>  drivers/i2c/busses/i2c-rk3x.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-rk3x.c b/drivers/i2c/busses/i2c-rk3x.c
> index 9ec3beced9f9..a07c60ab07b4 100644
> --- a/drivers/i2c/busses/i2c-rk3x.c
> +++ b/drivers/i2c/busses/i2c-rk3x.c
> @@ -1096,7 +1096,7 @@ static int rk3x_i2c_xfer_common(struct i2c_adapter =
*adap,
>  			time_left =3D wait_event_timeout(i2c->wait, !i2c->busy,
>  						       msecs_to_jiffies(WAIT_TIMEOUT));
>  		} else {
> -			disable_irq(i2c->irq);
> +			disable_irq_nosync(i2c->irq);
>  			rk3x_i2c_start(i2c);
> =20
>  			time_left =3D rk3x_i2c_wait_xfer_poll(i2c);
>=20
> ---
> base-commit: eeb63983deb23d68ddc47e5d1944a7d64acdaf22
> change-id: 20261127-rk3x-atomic-transfer-fix-23f2d43c38b6
>=20
> Best regards,
> -- =20
> Sebastian Reichel <sebastian.reichel@collabora.com>
>=20
>=20





