Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85EAD606A891
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 06:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=atGk4ayh;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=QQuvGWIG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=/Y/iVRnV4ObqWfBTvVOJIAncw0xRUL0KHEf+fXRemdw=; b=atGk4ayh3JWLHY1877zPJS0K4N
	78K3N8Ddf0s98Ky6XoTQiEM52qJ3NPow6prEdLSoZlg+0qxT0X9icFWbLHwdgeY8+zcg/J6VGQ7Yl
	kxfuNCCSMYbtPekAwDqgxu+cJYO/7oOiA6ZNjLkj7gG+vzI6HtT3s3eVcBL6jdC1P0djdf5+3+GdU
	H7YEcGWrNmdASXW7qjNhcrF+8Jbjyt0WVAo/dyTpaReddG4o7+xNZXj70gwbzLG89xTPoXgppc+gW
	dsZsjMV9Jsdgmj3y7qQX6P5LGDliuuDalGONez4lytZytJpl1ZmgqGzoTFfaUosVIqmHmlRRXreOr
	JrmeaMeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRkij-0000000BlsZ-2cfv;
	Fri, 13 Nov 2026 06:25:09 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRkif-0000000Blrj-1fSd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 06:25:07 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4bb55cda775so1717095e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 22:25:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794551103; x=1795155903; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/Y/iVRnV4ObqWfBTvVOJIAncw0xRUL0KHEf+fXRemdw=;
        b=QQuvGWIGZ5ttLeFpsjZS5kfmFiuIhihklbPVzpTtpzF3VRP8DmDiX73MM5VmUR3LUF
         OUiMYOi67dvAT0JJdtqxn92tzQFCz2UURlP+9cpvkkIzRWJUdS6qGeVBvxUhiRCzFYNE
         1NsiZtMJ/Cx5U5JAVHBSMwqN/w5Cre4xnhGXtIOkpFs6U202g70hp23FBwE6ttmMwE4m
         XM2k9zS7jOSmhSd8OXDnjkksH1H/MoV4gOjbyBdnQP0agWAhvdlL67LD+1Rt+PxPwZ4b
         o5bSgl/TcgyGE/v1Uada32AVjTo5y1UTlUHrVbvw8E3hUaXVqC5jLakfDT8nji8WM54b
         uFXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794551103; x=1795155903;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/Y/iVRnV4ObqWfBTvVOJIAncw0xRUL0KHEf+fXRemdw=;
        b=vsW6zhI7otcCevhwQGLQVRSWy57AKtYJj5dAG5CG1lQs3JoJdeRafj/VgA6Aenvk1W
         s0Fa8L+AEHB1Q8sbiaLbIyJJ/v9nl1RA7PmJrwK5ZEVeSwx9XCyfYqRDzqFd8eLDmkEk
         YUQLYGQQpBs472zetSu2qzsLQa7NNEraVH6CK2TLvaGw2euNg6IMTcq9Mp9PmdwJQm43
         VcTB2UvpPK2Nc5F+vEUm9XC1Ja6oEr+IKbYaOWBzAUvxhX7apnTyuf2TPo9nbUz4d/1L
         zNGz1IKyFnf/3+lfMG5iXQdT5S7INc2CSJKsP2QwMd4pINJX6XQ7Xo0j4qA5e3Z4JGd9
         qw7Q==
X-Forwarded-Encrypted: i=1; AL+hErErE4q6tw71Jd9hbok8U2wU1KSLm1LmNcCzwJ7kawWaQxJ3H9XqcV5Fvvk+48sKpT/ARvdR0arzQU0xayBRb0/j@lists.infradead.org
X-Gm-Message-State: APuU4Z9m+3Emk1MBTpYmB6ph+5Li9rP9P8R9zhCML5gY4NqZlLLqG0VR
	euDPYhAMa6LTT5fXWRY101il+jbPmWlQSjeYdD8xzUY9tCdXSbJwQjJbSvjnswD6Yfk=
X-Gm-Gg: AYBFou0f700yqjYGrnWdzgQYEehNQP2Gn06jPVXPwHaRfciH/WBVwTm2bkyiQpp+Nrs
	qtUqmnFGVWo8t7z6zah3jsI4QBkF25YdL630BO+GdedoS+wJXElyXaiXZaaCL6IgdcGDF0fbzuq
	0HKRiN+yFDmHjiLm0GhZk4wZmBBzqmyk9jNFFQZG2lEf/ZrCAU8l8943UgLAIoiAoKtcSYRE222
	K0K7worcl88p7xqQ82x1BtnlclLQSBEpFXQGl46GghPDPvxt1/uyekdcOefQm/E8TTVRyFyNKGi
	iUoxovpzPUam1MVp72vyc/rEl9Wg1YawWvi7AEbkGr63toUPeCqX157CaKOvR7BKF6uea4aacXU
	pib/qYRUUl/Fm6Z88LVyahwGGsicrpRWmqNzxyyRbkDjwunP6XNnorOfp7KOwNETKeap0V+M2Oh
	+EsKgigLHIbw1ml9wt0Pmr3p9Mw3WTJ2gQ7VuQ6PHB+ZJTnDIyc6i7kL0sWOIINfqwZ3Ae3DvqP
	AxvLgVZ+pC4UwiSmFK61lRRrkacW1ce4YL7yxrSaBE+A8l3w5XCRzIuMdtyWjYcSDqAl8H505II
	Hvvv4/VjVLbyWliWNVxxTM1LqKssUUryd/sFRmD9XDY7rKyiBsOcQ98pn4JDyX9HvFlysInZ8w=
	=
X-Received: by 2002:a05:600c:4e44:b0:4a2:180a:3417 with SMTP id 5b1f17b1804b1-4bb55c5f5admr25342125e9.1.1794551103537;
        Thu, 12 Nov 2026 22:25:03 -0800 (PST)
Received: from localhost (ip-091-089-005-024.um28.pools.vodafone-ip.de. [91.89.5.24])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb571cfa2esm25586955e9.2.2026.11.12.22.25.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 22:25:02 -0800 (PST)
Date: Fri, 13 Nov 2026 07:25:01 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Christophe Roullier <christophe.roullier@foss.st.com>, Dario Binacchi <dario.binacchi@amarulasolutions.com>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] clk: stm32: Add STM32MP25 SYSCFG clock driver
Message-ID: <avas_9BOcoyn4j0y@monoceros>
References: <20261110-ups_mp25_clk_syscfg-v1-0-667829cd290a@foss.st.com>
 <20261110-ups_mp25_clk_syscfg-v1-3-667829cd290a@foss.st.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ekj7jpy4oarwkme4"
Content-Disposition: inline
In-Reply-To: <20261110-ups_mp25_clk_syscfg-v1-3-667829cd290a@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_222505_461043_D1666C77 
X-CRM114-Status: UNSURE (   9.85  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--ekj7jpy4oarwkme4
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 3/5] clk: stm32: Add STM32MP25 SYSCFG clock driver
MIME-Version: 1.0

On Tue, Nov 10, 2026 at 11:42:18AM +0100, Gabriel Fernandez wrote:
> +#include <linux/mod_devicetable.h>
> [...]
> +#include <linux/platform_device.h>

Please don't add <linux/mod_devicetable.h>. of_device_id is already
provided (with less dependencies) by <linux/platform_device.h>.

Best regards
Uwe

--ekj7jpy4oarwkme4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmr2rToACgkQj4D7WH0S
/k7rcwgAuyIO02PIHScObbQSwpTN1bOxntCQuOefipHur6Tv164hiCD+Ows3bueO
hHN81SuXrTS4hzRGcT5jFlW7zlkz9L2tSHYZ0us3Hep0wntBkIeA0JeCZqBCoASn
RuXE5+uHnhkMUlqy+/xZlblQtRTUnoCZmce9NixemtTaCIMPlL9gIeoouNGk9r2B
2Ov8mhk3tjy1A9K9YCE3vdde8NAm9G0myqV85K2q+/6a8k9IqoogrLX5x/9uNZgI
wH/iThyVCnk4MnvbQGHVc7Q3QXDOZAVGeZPck+t/XfvkrsVkuawozxF0NWZO8LMe
ldXWek5P8iobsActxH4I13gTcjgwBA==
=QOFE
-----END PGP SIGNATURE-----

--ekj7jpy4oarwkme4--

