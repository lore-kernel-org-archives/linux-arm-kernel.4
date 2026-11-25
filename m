Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7A30606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 23:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=n7BU7AA/;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=l6L5ZLoq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=r+DhYJ93tfesWORfibIV1d9I4czZkNjxK3eLYv410RY=; b=n7BU7AA/B+CftrjH0oGVo5itxW
	qKWQbc9Ah4LO+Pw06IXV1233Xi/xwJiRZ30ENGkI5heBrw24xfb1dAk5XoxRzX9O40KTlIZJyeiEe
	Fqwjx2w5IP9KugMulgrb6ocrH72syti4wnMjZap+4jSoV29ek5bCsBflcBZi7lUDoWiP5OfuVRZjj
	7fBNUaSrqZgL5/vAUyLPZ0RGLbFY8hvMJPrgsXzzPBusGmyMoJwZU3ccgoKEk4za27QHCEbraDVUP
	dQV/GqNrW1vzk8GwNJDhELj0SjpBWAaG3QYsk86WiHXq5G3+AJwYq1XmkihWQ/3/p+WSrGwxgKXNo
	aZuKN4IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWMAC-0000000BXPb-3hhC;
	Wed, 25 Nov 2026 23:12:32 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWMA9-0000000BXOq-2uq1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 23:12:31 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4bba5e17cbeso11977065e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 15:12:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795648347; x=1796253147; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=r+DhYJ93tfesWORfibIV1d9I4czZkNjxK3eLYv410RY=;
        b=l6L5ZLoq1OcpkoitUPFKhL/ZaJb+jBPwrYgwBQk23NmNAiSgfg8aX3HXdBL9ylNfsT
         QhROtLHcSRvwoXjr3c85KQI5+WlHXfCasFNdxdSxoxespn8Zvf7PnkF/fTXGiZWWvHJd
         Rwvi+eDkgIrmWHJg0ebQuF05FTZfc2zHJCnk4rpBxIhXaaQBSscblqzXPh7BOxY8mw70
         ksS7laSKf1oIUGGyZcNjFeocrr0qyIaeusILz32/TiYiy09oB/fJ2XRQm0GiPNcdmB9W
         GpKoJmHHesJFikzoONR1hra+ctpvLK7zfGYDLdPpQVD6VIGMWFBVZOcX7z6cw3yOzlTu
         l5eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795648347; x=1796253147;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r+DhYJ93tfesWORfibIV1d9I4czZkNjxK3eLYv410RY=;
        b=IySJjWd58Qbi9kn1ZEH4W+sL7lvQon52hevxoLViHZCAjLzxX/PxhmCLU0klU0wlXB
         YV+9rpASZ7+886dtIUINQ+vX8NhaWN8q3raS1cU+KcNxRAXxRLILe7OOGeKsArWx7Ga9
         XpvunBXkjT6zzc9yZOevBRXcbhrkxA+lhw1z8EtRLh7R/4t65nvi42f1EQq25WTQl303
         JBPfn6ijD5XvVvPrHeLANDSlteOwqVF0n8JCn88+agcBHbYqS9CwW/5f+K+xBEC9OI7q
         nMo3JLm39ODODQYPusmRszmlt5BYVRa1/fPYk8eEObiXT4XP23tYL7SIvB5wUAV7tX7b
         QqGA==
X-Forwarded-Encrypted: i=1; AL+hErHdMWc7sKF2B83ANPOGAUp3Zzua5itbRBUpHtl/hwjD6yhp6T6sWOvz3V695Ysi5q23PRt6aQLfzyPHegGTO7PP@lists.infradead.org
X-Gm-Message-State: APuU4Z+g/8gmM4zFquCnVnFDAEtdqHKq6TCoj2lX7ErEWu7aSjmparlx
	IteFPDoh1Tj/y7hyT5vdqdxWGrphtbjL4KiYXrwRmSdzd8M1iaXCwCeLZc2YLbhHNnI=
X-Gm-Gg: AZFdTZf6AtkQ7xOx2dddYzdhRipgzxniNz8XtyFwWOWfLYTDEwUdJ7vNZybfCdQBKZT
	odc2wYqpihwFoK+dHQBfZq+9WbyspfiwANV3RkQ/qQhM6beoFLg5ro6cdKrzBxRgvfO6CUIzZOD
	6h8kkjw3HP+21GU9nvWJ0TNuiRjZ0Ub+Um0O1CZZarcJgkioaNmiFg6Lm71Bk0OH47fBI5k3Svi
	14my2YPq8uz/LI66NJxZlYI09VmohqEr9g1NWJp6acMVwD4hfNSRluXsnSN7SmshV1kSiqGHDce
	dhdIS68JHthJVPS5ItmFYloXHFo7gmc9VcMKWsLVa3vZfm5iHaPU/OImKllHFD7BjMnpwpFBain
	2o7zwvrrNIzla3ufdsexJWJNWB86Td5s+Clmobiek9Isk4qDxZSxq+5hAhh+8wCZ0Lp7dUdQsGi
	hloqyQn3FNmXgrOS8szqdhqGkXw+tedfxn9ftQ+mVoM7rpfTbodjzftnNWgP4iyY6+Xbnxe3N1z
	oXvhswDqjQ2P4Kt3DUFIptx5+b+SJ5EmpyJK3zDvo5JLIOZ6FTo1AApbYElSLsclqaogveN7p4U
	aHEbyIvHwGRL4h3wMx6MdWPag4nIZ/VqqrI=
X-Received: by 2002:a05:600c:4f84:b0:4bb:8701:a2df with SMTP id 5b1f17b1804b1-4bb88809950mr395769935e9.17.1795648347566;
        Wed, 25 Nov 2026 15:12:27 -0800 (PST)
Received: from localhost ([2a02:8071:6e30:8500:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb8533579csm480759855e9.2.2026.11.25.15.12.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 15:12:26 -0800 (PST)
Date: Thu, 26 Nov 2026 00:12:25 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Brian Norris <briannorris@chromium.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Thomas Gleixner <tglx@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	=?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Radu Rendec <radu@rendec.net>, 
	Jakub =?utf-8?B?R8WCb3dhY2tp?= <jglow@google.com>, linux-clk@vger.kernel.org, 
	Douglas Anderson <dianders@chromium.org>, devicetree@vger.kernel.org, linux-pm@vger.kernel.org, 
	Mariano Marciello <mmarciello@google.com>, google-soc@lists.linux.dev
Subject: Re: [PATCH v2 5/9] reset: google: Add CPM reset driver
Message-ID: <awdp3W7LWfQ3ZrIy@monoceros>
References: <20261125000349.3385325-1-briannorris@chromium.org>
 <20261124160343.v2.5.I0b1ad34a718a9b5f667d2481041970ea45989dd3@changeid>
 <f89e293688feb3f9bcdce0f1b6fed0ee424e5cd8.camel@pengutronix.de>
 <awbJUwrBQw5TnowW@monoceros>
 <awc0sBl6q6A2Reaq@google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="khx4cneo7r6erf2z"
Content-Disposition: inline
In-Reply-To: <awc0sBl6q6A2Reaq@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_151229_753262_D3A31ED6 
X-CRM114-Status: GOOD (  17.85  )
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


--khx4cneo7r6erf2z
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 5/9] reset: google: Add CPM reset driver
MIME-Version: 1.0

On Wed, Nov 25, 2026 at 11:19:12AM -0800, Brian Norris wrote:
> On Wed, Nov 25, 2026 at 12:43:40PM +0100, Uwe Kleine-K=F6nig wrote:
> > On Wed, Nov 25, 2026 at 09:48:04AM +0100, Philipp Zabel wrote:
> > > > +#include <linux/mod_devicetable.h>
> > >=20
> > > Please include the specific <linux/device-id/*.h> that is needed
> > > instead of all of <linux/mod_devicetable.h>.
> >=20
> > Or better still, rely on the bus headers to provide the needed
> > *_device_id structures. (That is <linux/platform_device.h> provides
> > of_device_id (for patch #2)
>=20
> Only very indirectly:
>=20
>   <linux/platform_device.h>
>   -> <linux/device.h>
>     -> <linux/device/driver.h>
>       -> <linux/device-id/of.h>
>=20
> > and <linux/auxiliary_bus.h> provides
> > auxiliary_device_id and of_device_id (for patches #3 - #6)).
>=20
> Also quite indirectly.

Yes, I already thought about making this more explicit. But this isn't
my primary objective currently. It's safe to assume that the provider of
struct platform_driver also provides of_device_id. While a forward
declaration would be enough technically to define struct
platform_driver, that is not sensible because most users of
platform_driver also need the definition of of_device_id and there are
too many drivers relying on that already.

Well, but having said that, the thing that I consider important is that
no new users of <linux/mod_devicetable.h> pop up. If you want to go for
#including <linux/device-id/of.h> that's fine for me, too. (And similar
for the other busses and *_device_id structs).

Best regards
Uwe

--khx4cneo7r6erf2z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmsHa1YACgkQj4D7WH0S
/k62MQf+OKGka4mPSwopQ0+gI2VWXrdB3QhqgUL8ffjUMb7jkBi86oA6YfcjNC/D
8aZRTb/LZNPgl7ygdsKPEfFKlbKH1yCA+9gfN/aS+x6ykkZUKdn1Ha8m8ImuN87s
ooG++TXgzYfljHdoCVeukZsRth0gqt+QTBWLDPPUCDzC543cmPPqIWNi0LXdgwuf
OFve6MraHVKSLw0TVigzWyx0MYat5C1Y5gWVcsnmShhh1D18CrPfvFcu4dFot6Zj
IsEZRk30Wuu42YCnSD1t+UeGc+VDD5hxC1JhUdvN7txOJr1NHKdNT11aByux9mPD
ityFQTt/321OJci6adJV7NMgTYNlPg==
=MU9a
-----END PGP SIGNATURE-----

--khx4cneo7r6erf2z--

