Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 629E8606A330
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 19:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Fn53Wfuz;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=UHDE/nC6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=5RUUEU4Zs98a2BCCEhrllG9CzAbnewWKsXy+kzkBWDs=; b=Fn53WfuzovSpjvw31MnG7GoCs1
	yru0v4WZfN1ufPxVuLfL3Y9jJwG7GdhP6vNhWJyeUk6gpZU15a9mjQ7YdS5JVumQ7UxN7x4gsn+GT
	e0aTBwAA7jSjbwcC7zLelGzfaN48w7Us3gvazZ38oX7dD5xQzjwKV5e0VgtE0C2emTFZA1uD/YtB1
	cPMexb4b3QshZ42kAkjOI8v7s7eXZ7dM3Qiz+e+72AluahIzXAA4xnTTeE1ZxeRwGQM/mHjqFZd21
	kZWrQxa6O1KHQSrxUflQ8JYMA0em9J5WmUFNcfyD+zrBurnnepWc/510dU/uVM8Yse/VoOMDArouT
	+R2hFyAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRwyv-0000000EBXZ-1F7x;
	Fri, 13 Nov 2026 19:30:41 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRwys-0000000EBW1-12xl;
	Fri, 13 Nov 2026 19:30:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=5RUUEU4Zs98a2BCCEhrllG9CzAbnewWKsXy+kzkBWDs=; b=UHDE/nC64QzET9Ce0UvDM2RQ6T
	cdqX2AjGf9mjFgYKSyF/IpJrgzvFq7ghx5upx7ykxnyq9Vnbk4tr9LGV2nEvlDglE89JkK+xz7yxs
	LT+GX0Tc+pASWuEmdN2DysSE81m1uNwSGZ26dd/B+peLkUZuZL8/LDNWstvwlTFecdIsan1O+lU+h
	demp951nfGj7dQ0EKBFr0z+GCGf8EcVziv6YERLuguZ1A5PrP2ygFXhNnbAwp7d97lOYmOJYv8Sve
	BatOCE1AUsLmV4Qv47RO7XUBKoyiDRIdmO7WRGLmzj8uCQzAXuRfoAFMb8X5qyXfPVv3X6VUlI4k5
	Q/hscLoA==;
From: Heiko Stuebner <heiko@sntech.de>
To: Lee Jones <lee@kernel.org>, Yaozhong Li <yaozhonguwl@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chris Zhong <zyw@rock-chips.com>,
 Zhang Qing <zhangqing@rock-chips.com>, Joseph Chen <chenjh@rock-chips.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Yaozhong Li <yaozhonguwl@gmail.com>, mfd@lists.linux.dev,
 devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/3] mfd: rk8xx: Release the power hold GPIOs before powering
 off
Date: Fri, 13 Nov 2026 20:30:17 +0100
Message-ID: <R_CRTELbTC-4nNJy2OQEFg@sntech.de>
In-Reply-To: <20261101154053.3874-3-yaozhonguwl@gmail.com>
References: <20261101154053.3874-1-yaozhonguwl@gmail.com>
 <20261101154053.3874-3-yaozhonguwl@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_113038_388691_60A1666C 
X-CRM114-Status: GOOD (  23.23  )
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

Am Sonntag, 1. November 2026, 16:40:51 Mitteleurop=C3=A4ische Normalzeit sc=
hrieb Yaozhong Li:
> rk808_power_off() writes the PMIC's shutdown bit directly. On boards where
> lines driven by the SoC gate the PMIC's power-off path, a shutdown
> performed this way does not stick: the rails drop and immediately come
> back up, so the board restarts instead of staying off. U-Boot reports the
> result as a power-on reset.
>=20
> Take those lines as an optional GPIO array, hold them asserted while the
> system runs and release them - waiting power-hold-delay-ms - before
> writing the shutdown bit. Device trees without the property retain the
> existing behaviour.
>=20
> The array is claimed before any child device is registered, so that a
> -EPROBE_DEFER from the GPIO provider does not tear down the regulators,
> RTC and clocks that devm_mfd_add_devices() has already registered.
>=20
> On a Firefly-RK3399 the shutdown stuck when such a line went from high to
> low before the shutdown bit was written, and did not when the line was
> never driven.
>=20
> Assisted-by: LLM
> Signed-off-by: Yaozhong Li <yaozhonguwl@gmail.com>
> ---
>  drivers/mfd/rk8xx-core.c  | 49 +++++++++++++++++++++++++++++++++++++--
>  include/linux/mfd/rk808.h |  3 +++
>  2 files changed, 50 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/mfd/rk8xx-core.c b/drivers/mfd/rk8xx-core.c
> index 3dcf6ab..137ab20 100644
> --- a/drivers/mfd/rk8xx-core.c
> +++ b/drivers/mfd/rk8xx-core.c
> @@ -11,6 +11,8 @@
>   */
> =20
>  #include <linux/bitfield.h>
> +#include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
>  #include <linux/interrupt.h>
>  #include <linux/mfd/rk808.h>
>  #include <linux/mfd/core.h>
> @@ -703,6 +705,22 @@ static int rk808_power_off(struct sys_off_data *data)
>  	default:
>  		return NOTIFY_DONE;
>  	}
> +
> +	/*
> +	 * Some boards route "power hold" lines from the SoC into the board's
> +	 * power circuitry. They have to be held asserted while the system is
> +	 * running and released before the PMIC shutdown request is written,
> +	 * otherwise the rails can drop and come back up instead of staying
> +	 * off. Releasing them here rather than from a separate handler keeps
> +	 * the ordering against the I2C write explicit.

this will be called from both the I2C and SPI variants of the controller.
Also please shorten that comment block.

> +	 */
> +	if (rk808->power_hold_gpios) {

unsigned int line; here not in for() ... could also just be "i", as it's
simply counting

> +		for (unsigned int line =3D 0; line < rk808->power_hold_gpios->ndescs; =
line++)
> +			gpiod_set_value_cansleep(rk808->power_hold_gpios->desc[line], 0);

This code is (now again and more correctly) running when irqs have
already been turned off, so nothing is allowed to sleep here

When you enable
CONFIG_DEBUG_ATOMIC_SLEEP=3Dy
you should get nice warning splat about that.


Heiko



