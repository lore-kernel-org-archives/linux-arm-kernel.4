Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA465606A320
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 23:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=G7iJbsP/;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=PKhTy0aL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=PdeUXT5hL0s7mCt96NfWjkzr/Wr8kB4BYllQsiOMp6k=; b=G7iJbsP/130ZjXTYDAfZInPqpK
	tHhlwfahhh7krkEpVlevgr2QMv9lO39Xl6q12OxoA5wxvYiaq8hLCYNHVRkz1vEX/qBQmEhtNNA/M
	RMeEKoT9JsniFNvTAr6LWmCpsmq2v+MROQAKwFuQz0JJQlCPf0qfel9JV/1kPdcTNbDJA1qrVLa00
	YTh6NsMXGrIbkqnbjZt9vkM4gtA1S3s4TOHbNFr3jPZLv2BbgOF9RtVFOpvSBmVT8lWxmkh9D+aMo
	MfdjFERnuLKrcnKY2P2WwnTOCaFj/vrKYaKNKc8Bg7aT5MqUoKBmVBRWje0RCbiRZNTBME6YLGTOt
	q7HM8cIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQuuH-00000005DGx-12rE;
	Tue, 10 Nov 2026 23:05:37 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQuuB-00000005DFq-13QY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 23:05:32 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-cc147d86bebso1494745a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 15:05:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794351929; x=1794956729; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PdeUXT5hL0s7mCt96NfWjkzr/Wr8kB4BYllQsiOMp6k=;
        b=PKhTy0aL/eLJOvpvZ9wQGQu++/e3La1E/1ge75mxmNLYcuWjGR/5HE4PbbrZHZp3xF
         95AHq/UjNn1Mo/atKk6ria5owuDnvkb6+GRQDOrOX61uGug5dZ0h89UwxhiwZVb3pov0
         Ebj2SrT7pisCNkO7zJsmQVHlBeazCRfJsf1CdS1+cwxvijpVjFRyB2HS9kkUjI4hV+MJ
         mtMFQApr+WvlOIPBcCrj3EeQbAT60CwLexYKAWe7Rn6xL8WjcaRO8PHWzXjLfMY7twrl
         ir/mNH2Km5Nsg67KSXWrTEoOKXenX0C/BEBh3F0ndGDcOsEIZk23IP/O0KHBHrOCxvJE
         g/+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794351929; x=1794956729;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PdeUXT5hL0s7mCt96NfWjkzr/Wr8kB4BYllQsiOMp6k=;
        b=tty4WqNxvkrgYkkzNdJj6I/sIi8dztY5RTjq4v0tnq1js3W9H+VK/KjHQ8+ay+5F/i
         7vyDi1LSh0ZYg07KGHJhbs29hrGXKY/j6C526KvrPiUNTLfoZaUO7HRW9TyHlvfCeVWm
         vkB68fo1wp99prW/7q3MbdkmyZXq0v/1T/laHervwqC+21CarhfhXfQk0BxiDLAVqv/4
         0d53Htu0rwKSRDjep26pMg/fUxZmEy1cLs9FXNSNqCRS/fg2J81NE2OwSSdQ+VD+38lG
         BjGJrL06k4RRJmtkIgMeIZJKHN9aXxLRUALWldihU2WdVnqM1WedSfbKzhGameEo29ez
         lrRQ==
X-Forwarded-Encrypted: i=1; AL+hErEMvzR42RX3u3H7X4NBYeQ0hraiqucC3wXx0rJhICD3u/2SRBrLvrkqd97NH8/oW3t09I/2tiUHx+jkDew/Jyz4@lists.infradead.org
X-Gm-Message-State: APuU4Z/+oW0JttPOk+h35MsUgUCoXAEYCAL2PewzaDrZg1WWuDB2TJSA
	W4weEolj7a+lIbrMA4KqahQUl93ByoCYj0JqGT1i55rSQibcYNsQF1ZsEs33bFHk6Q==
X-Gm-Gg: AYBFou3hW30XqZm1NGYaY3ParIvcRXYrnySvhwJCBeKpQ3jIp6nWeDh5kFIh4e+QlHH
	5RfJhHrPCvymDPpXtW3sFiTcX9uc8fG+gO0IeJf7H0LfajsVpXak6myuToVMcG3xs6NycfDG37n
	v8UyHmaPpn53m1NtedhKzydnaj8AOVEv3c1aZpZfxSJBYA0joKbaYwFgX1t6SJIWYt1pxMOFXJk
	LZns69+9HBtP19U6gPcfhYjIttqOkNO8kqb0bpEP0LlDMFog9cE5aWpqD9r/OpiJB/Gt92lj7cd
	ZSh88itf/YvEOCu/UcFJvZZge7eG4hGxMSE3LlRq9bT63llnRj7YqCsCv3kCtB6nUblTQxTwJzx
	01vWWc8Y76OdDySuwd2YMGwrVq+NEGTf/Vkjim2rHwNAzRZXQXYfOW5iYCQfXvJ13Mi4tE8HKeg
	HPy53AcKvPkqhiMASomNeby+UOCoU2jK3IxLhR6aJFAc1PzhRRHfgoBHh5yYMA83ugIJShNNGZf
	5auwWwsUkEt8GvN5eEZFtyxNzyqOK+jtu54R48Klps+RWqV8qtlvEg0DdNrR1uC5eD7lGlNAvep
	eGFjZJ190CCmu3lz8X5HAMEauTd4MePel+fOiIcdlDNu4TAC1XpQC8LJzUYspp+oBBchJ/8+nOd
	6ge3+sT6+t1ZYyey7T+TvSucYFdh8PPBPq8LGoZwrjddPzSvFUkJXQHfPXP+Uv0zCMcbQ5famre
	pyW6TqE9KSzaiB
X-Received: by 2002:a17:90a:d00b:b0:3b0:a7b5:c044 with SMTP id 98e67ed59e1d1-3b182e0c1a7mr350381a91.1.1794351928487;
        Tue, 10 Nov 2026 15:05:28 -0800 (PST)
Received: from google.com (196.126.197.35.bc.googleusercontent.com. [35.197.126.196])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b17db7df7csm1476956a91.11.2026.11.10.15.05.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 15:05:25 -0800 (PST)
Date: Tue, 10 Nov 2026 23:05:22 +0000
From: Benson Leung <bleung@chromium.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Lee Jones <lee@kernel.org>, Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	mfd@lists.linux.dev, chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH v4 09/20] mfd: Drop unused assignment of
 platform_device_id driver data
Message-ID: <avOjMhYL-jo5qWnx@google.com>
References: <cover.1794347059.git.u.kleine-koenig@baylibre.com>
 <9bf8e674ac935547639dc6f89fc0aab5ac826db9.1794347059.git.u.kleine-koenig@baylibre.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QGZX1VfFPgOu+2d7"
Content-Disposition: inline
In-Reply-To: <9bf8e674ac935547639dc6f89fc0aab5ac826db9.1794347059.git.u.kleine-koenig@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_150531_397761_FC4569AA 
X-CRM114-Status: GOOD (  21.31  )
X-Spam-Score: -8.4 (--------)
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--QGZX1VfFPgOu+2d7
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 10:54:34PM +0100, Uwe Kleine-K=F6nig (The Capable H=
ub) wrote:
> The drivers explicitly set the .driver_data member of struct
> platform_device_id to zero without relying on that value. Drop these
> unused assignments
>=20
> This patch doesn't modify the compiled arrays, only their representation
> in source form benefits.
>=20
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Signed-off-by: Uwe Kleine-K=F6nig (The Capable Hub) <u.kleine-koenig@bayl=
ibre.com>

Reviewed-by: Benson Leung <bleung@chromium.org>


> ---
>  drivers/mfd/cros_ec_dev.c | 2 +-
>  drivers/mfd/mt6397-core.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/mfd/cros_ec_dev.c b/drivers/mfd/cros_ec_dev.c
> index 529a23b804f7..96aac158fd8b 100644
> --- a/drivers/mfd/cros_ec_dev.c
> +++ b/drivers/mfd/cros_ec_dev.c
> @@ -379,7 +379,7 @@ static void ec_device_remove(struct platform_device *=
pdev)
>  }
> =20
>  static const struct platform_device_id cros_ec_id[] =3D {
> -	{ DRV_NAME, 0 },
> +	{ DRV_NAME },
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(platform, cros_ec_id);
> diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
> index 5d5f816492aa..e74936ac206f 100644
> --- a/drivers/mfd/mt6397-core.c
> +++ b/drivers/mfd/mt6397-core.c
> @@ -435,7 +435,7 @@ static const struct of_device_id mt6397_of_match[] =
=3D {
>  MODULE_DEVICE_TABLE(of, mt6397_of_match);
> =20
>  static const struct platform_device_id mt6397_id[] =3D {
> -	{ "mt6397", 0 },
> +	{ "mt6397" },
>  	{ },
>  };
>  MODULE_DEVICE_TABLE(platform, mt6397_id);
> --=20
> 2.56.0.rc1
>=20

--QGZX1VfFPgOu+2d7
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCavOjMQAKCRBzbaomhzOw
wggAAP4v7fnaGuBxjdQU0SnWBJUfK3YeW/iId1LRt/eBXC0OmQEAioUu55g6cEtn
WOAUBxWTSFHNLgkeLCTw0+Pu3PdU8As=
=e1Q6
-----END PGP SIGNATURE-----

--QGZX1VfFPgOu+2d7--

