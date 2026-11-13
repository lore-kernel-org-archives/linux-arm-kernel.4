Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A053B606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 06:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jEQfSUvG;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=m4kzTeRz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=mdanL4lnjhf1tDXUSVl0wHa7iY+CsmDBpWWdd3/y5b0=; b=jEQfSUvGeXsG6lKBuNP1/DoOPt
	WEYYjnEqIPZF+QK7FMSecs2rOG6ePn+OeL6uR9QjTJGTapXcCPKfTVTEU1vtfQPWUFkJ+O82knmtc
	oX/+0mrv0b8eSJejBxIoAy01fOnIu32kO4pY4XP22a0YtTVzI1T3Z5/IzSCvOQSPBBTpR8U5uKOag
	DzZDxBJSwsqqHlqm7ZdNkWOkxT0aQnjz5iZMB8zXU/Ho8sOc6OBaQbi4QKJwPw5hi83u7FzzDX9WP
	2vnaaLToo5LBeWK8on6xmgQ2ZO0ezUF4wJcxbzixwXaoG6J17FTlQBPyMz3/9Rq+zk7/6gOCvJY43
	DvxTlO+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRkrr-0000000BmnC-1nrv;
	Fri, 13 Nov 2026 06:34:35 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRkro-0000000BmmH-29h8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 06:34:33 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so9506665e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 22:34:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794551670; x=1795156470; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mdanL4lnjhf1tDXUSVl0wHa7iY+CsmDBpWWdd3/y5b0=;
        b=m4kzTeRzVRq5Q4ne48MYyE2BVg8iCIfpge/3fdDqcVfO3lx1wjNo3VDmlrkoqgjwiN
         NH9eW94vwJnaeynQkN8bk3hNAMUo0Xun2rqviZUVmVgfKTR9q7/QfGdLNf4fZI7EklJ3
         gd3hapLDENEnsx5XgB1ba2Ixl8KRJV4DmByEc0ABzREQFbmmqWYdb2qsXCGSLmO3cO8b
         W1PiU2bp7YQHOJUQ5+lRve2ibdsbvCttgi0if6Lz+xwR4gEXy2cb8iSJVuAE3uxpl094
         OnybHcOgA/hYOhjnVz8ZjlqERv2ck/K1GHGKceBrYKnKj59iblZL3rPqk1yitBgm/sXm
         desA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794551670; x=1795156470;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mdanL4lnjhf1tDXUSVl0wHa7iY+CsmDBpWWdd3/y5b0=;
        b=C6/tSIzQnATNetC0S6Knwvspsb5wG8pQY0WM3XuV8E/FR7NUCGVl3rsvkR03qPRo+e
         +rwGeKuRPccTW1yx2cpWLlTKgM/zT545qJSBr8ypjlOgNbRDi8tvuDGlkbtaO9tkzE5W
         UFoGRfgQadjrBB1Wf3k9sij/ssWsIEC2ahzqHxykBLMZ0ZfJ8hpMM3vyAJq4uufVPLPH
         IStQKZ6j/CuC13svPQAksF1kgeQcy7ORRM1teqz0tsdN2EX4ceZby5oMYZxJ3IsS9GA1
         h+Ce/oqv1hjGuGUC7306OF5InD6s2bNdRGSTF7RRwo9WFB7ccJ0rZAAQNgmBm1VfRfRU
         9bqw==
X-Forwarded-Encrypted: i=1; AL+hErHwnR6rdadBjMNJwSWNfBXaHl4+HF9oWSF3njTHB3pn5BUF1UvPCKMdvqcQp6twrYsYgkgIzVnFpcpxVoFR192W@lists.infradead.org
X-Gm-Message-State: APuU4Z86Li4CDaPHjm1ZSSYfbD0TlT+NO7M+NftMg1MphlMzvQviBmw7
	NqQXYIwInm3HhPBzfF0MCF20R86ILvrvr0RXlMPT9/T/tQayZHXbEDLoyTATT/18D5U=
X-Gm-Gg: AYBFou2bBtlf8ALnejYQQ/nAuMaPsdypbNIYi1Y+iYRNMGWiTLaOHCR6yTsbA+CGgcI
	uXMVpB8BQjoPbN8bU9dCoxI9qFh5KteXvKizWvM/h4oc3j8UoktK0uhCt+vm6NYpxWU+kEKtAkx
	wouVj2fxcikqzQ/EqO4bS6zs31qkOT79K+KWl85kMa4rDgQD8rKTZ4Ai5bJ3BV4E2m8dgVSvpPK
	L1Wrm/Xn48GA63NkJgbV2NZgF0uSonjzB4N719K0jd+9IwrZKtLO1VHSioicEULSSfJAwu9KGHM
	Osq3j7UxelSjwf22zOGxbUnu3Nn5djekFe2CkGV4DgccvlVVdpwiCmQlw7tXFZAl8OAUh1dUCb4
	HI5SZFHIHZ/kAwhMKZJRjE+q77zK3LbIUv5EGdvaXS4HqjeKH6XMZoJqg2E763me5yWjtxbzhzH
	eKOek3FvJ77pRZSSiUCpWPgMc8n5e0oPBTruCrfcx6JMtdYtOLJCZi75fCUzg1Ttxi+oLwHJdSg
	2VIgkJ5VR+LR+Rwm+j4tjNU2KEcTloyYsA/p2+rmep2iZUUQuerphXxTm6Wzmld+nQ59rhlB5jl
	Sz4pWnp4b4dqCByB0iKUV1c10uPA3uPOKw==
X-Received: by 2002:a05:600c:3f08:b0:4ad:5e09:ae43 with SMTP id 5b1f17b1804b1-4bb55a8d2d6mr27281365e9.29.1794551670522;
        Thu, 12 Nov 2026 22:34:30 -0800 (PST)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-49c5d22394esm3528090f8f.3.2026.11.12.22.34.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 22:34:29 -0800 (PST)
Date: Fri, 13 Nov 2026 07:34:28 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Gregor Herburger <gregor.herburger@linutronix.de>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Eric Anholt <eric@anholt.net>, Stefan Wahren <wahrenst@gmx.net>, 
	Srinivas Kandagatla <srini@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, Russell King <linux@armlinux.org.uk>, devicetree@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v9 05/12] nvmem: Add the Raspberry Pi OTP driver
Message-ID: <avauNsYkHqIAshCe@monoceros>
References: <20261111-rpi-otp-driver-v9-0-0a7292a7a5b4@linutronix.de>
 <20261111-rpi-otp-driver-v9-5-0a7292a7a5b4@linutronix.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dzmqcqzq6stkx3nh"
Content-Disposition: inline
In-Reply-To: <20261111-rpi-otp-driver-v9-5-0a7292a7a5b4@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_223432_571215_EF60972F 
X-CRM114-Status: GOOD (  14.18  )
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


--dzmqcqzq6stkx3nh
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v9 05/12] nvmem: Add the Raspberry Pi OTP driver
MIME-Version: 1.0

Hello

[dropped Ray Jui and Scott Branden from Cc: as their addresses don't
seem to exist any more]

On Wed, Nov 11, 2026 at 08:23:27AM +0100, Gregor Herburger wrote:
> +#include <linux/mod_devicetable.h>
> [...]
> +#include <linux/platform_device.h>

Don't include <linux/mod_devicetable.h> as that introduces a lot of
unneeded build dependencies. <linux/platform_device.h> is sufficient to
get of_device_id, so you can just drop <linux/mod_devicetable.h>.

> [...]
> +static struct platform_driver raspberrypi_otp_driver = {
> +	.probe	= rpi_otp_probe,
> +	.driver = {
> +		.name	= "raspberrypi-otp",
> +	},
> +	.id_table = raspberrypi_otp_id,
> +};

Inconsistent use of spacing before =. If you ask me everything other than
a single space gets inconsistent over time, so I recommend sticking to
that.

Best regards
Uwe

--dzmqcqzq6stkx3nh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmr2r3EACgkQj4D7WH0S
/k6+Ygf/S3+kTetCLEiK3rGw/ROThFP+vKHVE0yIu2nZcj3dbawf3ySgY4wtvMJa
0PbVsBeV9OgRc4ZEsTQF1kcAR823yZXDtiTzGnr2rvlyz6rrl1wvHyPiphHI+w75
XxDCFxj38njwrnwhcUJTxHeH5bpa43eYpLZHCGQeNs/1CalWV1lxeonWMC5+kbzr
TUgmCnXFg059Zu9KpxeAPpAd5uQ3rihwl+7n11njUahK4aBuIhKibFiC/Mur9HJ6
y6s4h4Rk4A4KiA/z4puB/W/FSQLIej2b75CbvUkvGqBX5jOIbgbqza34HyRALj9L
XBcLUzxAKLY5ZvkPb2DgHx5xPh9+sw==
=ExxM
-----END PGP SIGNATURE-----

--dzmqcqzq6stkx3nh--

