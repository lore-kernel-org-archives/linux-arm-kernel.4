Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9F34606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 06:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Dozx/PJq;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Q3c5JnxY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=eMtI/QvyBu7WYuIQjEeNFc1ytajl1TcdksT1CryvP7Q=; b=Dozx/PJq+CXwP0kdGjAJpzb5Yl
	nKRneuvJ3TVWW7BkiS1zsOxL6VjRm43FgPSuxzkrQvDkLRYDlWtkzBV1L25Knw3BkmzUoMBBvHrVJ
	eQ0QsX9zDWBR+Jh1YqSZjNQ4DDvd1uttG4FUusDBxOpvWCf5XDpy9g8rDrwpBgVLOnqUzMSOwO2D4
	AE/C2o239gt+KZZ8Llt6/H1EXG+mJrQ4ddUj5iGGJ08zc+e5M007U8CUYRA5FPs+hq10YqTn/nbmO
	9/B3ywzd7Dbv8Yktf4vfyM/ZOuxFx+X9bIGrbEQpQ3M+uVFaHMUosISbACtDWtAjFCj9QzJ6Ww00g
	c5sRqSHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRkmX-0000000BmB3-18RM;
	Fri, 13 Nov 2026 06:29:05 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRkmR-0000000BmAB-01Oz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 06:29:04 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-492f0a1b685so525691f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 22:28:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794551337; x=1795156137; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eMtI/QvyBu7WYuIQjEeNFc1ytajl1TcdksT1CryvP7Q=;
        b=Q3c5JnxYFuYcO+dn53YxUmc1GT2cXm5DHsEJhWBPawzivCMkJzYz3IvbkTo94ihC2E
         Z74UGvgPS4Nw7xz5FfR+792MyrRyG2jv3oUN4ZD15txbqUC2Mrg0LogOWJq4pGVH5RWD
         yqE1tE6Gvelr9DdEn545IjnzmOxP6HAZYKlDVNLG7sE3cq5F+RszawrtyK+B5JSwD5mj
         2pY7mpgfCqI7Ow/eTfL8haztXrLOsyIwcSzgPGjHAMGxUfspxYOFAU5rMXZQ8+8+pnPl
         6Xu+5ByzE8ag7qG0lb+O2P1Ioz5pZOaLaSLtAJlAodDnTIFabe7AzwGzKUY+GKbR0vJV
         9ukw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794551337; x=1795156137;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eMtI/QvyBu7WYuIQjEeNFc1ytajl1TcdksT1CryvP7Q=;
        b=ndqeHw6h/ipIF4CPRpR25YFS/5mdJLlrBABEBoZMswJ4EfG7RQGiSxLzjVefov3WRn
         j8B3I8EVDAu4iWLY4ohLr1qwhEvFGohAcUt6AwoB61773OSRmL1yWPCcj9Ym9QRD9EaD
         siRyZ4Kel5xfEbSLoONUqr4R+qCzyIsa4OQpHVjEz+FnalDbJy9k7+Rtibix7RANyt9Z
         X3HcOUoQeTRAEPC9IgmKpvZIyJKLUjd3ScMw1WhoykNY4FV6KNZDAK+URhZFHLdMwQgp
         NT/0gZQppC1AGKbnRC4r7eM2NBTcgx425gatSB+nFUCxLIvLUOwuziRjBqe94BScAenY
         SuOA==
X-Forwarded-Encrypted: i=1; AL+hErEw/26xYLX9QElFXlNjM57y4WgXEmSDpS4Wd8n1gl1ZQZKEWAtGDxLIgUzi2DFYtt6HMP6X2520ATp0rv96f+KZ@lists.infradead.org
X-Gm-Message-State: APuU4Z8J66rUqbyDEteq8OGs5Eifpf604cWUQkXztKrFp2tTYMAUQS78
	Zv+6Imc/2QZeqHuY/cvK9qP+oepeGKPEI8CJE2emvq+RF4EtLxP5tZSu+ppKQispEpM=
X-Gm-Gg: AYBFou0ic7Talv2dYkiiAsd5nnlI6ikN0EGYxn1jS3CYn9SrnLCBWeD9cQ8tGAA7a5r
	Hzvc79JYA+V/CEBc6Bq3OHGi5wjQDiKeH8O66ViGiaP4sQbZDULfqYSi4ASBT8cCIGmulL+HtVn
	2+vjAcBw32XGvft+zNq7rNM3uHR6Mk4DgYNRiK25V8tuPNeJf7VgHdqhfkW8CykUNrPY6yt0lqA
	QwKAIOFFH1VOGCA8JAbPCj16MwOi5TcxI94fO64QbV5MXGFc1rKrasHTzU7qisMlKSVL1q1etdJ
	M6WG2ZAsqA5E8TC3GdoGcmKE11WMX3+w/B/6Qo4Enn5GgLiuXneoJSyqene2F+D0xLoKBVU2FB5
	jBWwR2wO9MX65IzI0/WUWtNY1xCAbCxumhvLSaKtUCgzvX9Nc4YSS9kZeik1mNK/atqyIR5B7Ky
	uPvOxWsV8SWqL1ZDPQx12dxJIROMv8popWlvqgcaf62Z7oEfmcsU7A3zjo0vUtXX2kLGolQS0ZA
	x04srlgbjKlaVsGdAOsn7fdvUfPMLB5MbfrVDzYmBE3pPtwRXI7lTxiH8BtlTtuSRGZw2Cyjij0
	I3tRkhtSFsL3bEavr3st8Adh1V0pHd3kG70nlY80bnHrB0vm9e7oZiLXJ+bFNw6J3WHg6dEehg=
	=
X-Received: by 2002:a05:6000:2586:b0:48e:2f7e:bdbb with SMTP id ffacd0b85a97d-49c72c9c8b4mr3464138f8f.50.1794551337038;
        Thu, 12 Nov 2026 22:28:57 -0800 (PST)
Received: from localhost (ip-091-089-005-024.um28.pools.vodafone-ip.de. [91.89.5.24])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-49c5fe373casm3174771f8f.30.2026.11.12.22.28.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 22:28:56 -0800 (PST)
Date: Fri, 13 Nov 2026 07:28:55 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Feng-Yi Hsueh <fyhsueh4linux@gmail.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	linux-input@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] Input: keyboard: Add Nuvoton MA35D1 keypad driver
Message-ID: <avatz4Q8JbrAJNn_@monoceros>
References: <20261110111419.89535-1-fyhsueh4linux@gmail.com>
 <20261110111419.89535-3-fyhsueh4linux@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="a2ifqpif6owwxnga"
Content-Disposition: inline
In-Reply-To: <20261110111419.89535-3-fyhsueh4linux@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_222859_067472_32CB6BA2 
X-CRM114-Status: GOOD (  10.08  )
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


--a2ifqpif6owwxnga
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v1 2/2] Input: keyboard: Add Nuvoton MA35D1 keypad driver
MIME-Version: 1.0

On Tue, Nov 10, 2026 at 07:14:19PM +0800, Feng-Yi Hsueh wrote:
> +#include <linux/mod_devicetable.h>
> [...]
> +#include <linux/platform_device.h>

Please don't include <linux/mod_devicetable.h> as it introduces a bunch
of unneeded build dependencies. <linux/platform_device.h> is sufficient
to get of_device_id.

Best regards
Uwe

--a2ifqpif6owwxnga
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmr2riMACgkQj4D7WH0S
/k6KPAf9EQ0HGivhdceUuk66CUKDwtvjh/7/jjrthGgkb+pdJryDbkedlXcCKjK9
b+TSwyp0Ij45TIIFMN/ZFfLea+1FM3nTPndVlZsIIDgJctKr0b9642hqhFrvkbPy
57e6YCZlJnH+P0baX7Z7JCgbPo34/RX6nn3dmY96cVDPx9nlO82bZlUKT0+O81nc
6nAdhy73QjVG7hEQYipP7SJUFRNOCOBxqjT4iIelWp8tvmFrMUdux3Yi2kmSL405
R0HXdDse9VWP/awUS/rl6ACGhds1ZJbh03SA5seeuZxX/6xVqbyap9pvvDIndv21
UM+9r6MVkXax2D6HXkYWSiATc2X9cQ==
=FoqO
-----END PGP SIGNATURE-----

--a2ifqpif6owwxnga--

