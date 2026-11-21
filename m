Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5399D606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 20:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SPG8OI3F;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a8pXa9Nj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=huxgq6e9wHfksi/drVHaTC3DOif56VffXqVT2Ec+rYg=; b=SPG8OI3FWqMuc8
	/ccZ/dhOndbKhIEdRT1BHxPEASppsKThWZfi9xhmoE7N7BEuoIcjA15mp22Pme/CdRmDqI51pQbCw
	Xrt2SeRkoj/YkLiXEDhU+0sJbnD6lRk7gyssCeknf4PNEQSPhiYY7IOEy9wkd110K5tdxK96p8MeR
	ICjXWCH5slAm/Ohmhtj9YJ2Mgft9gtuIj3Ts7aOYuGBbeNecSuzqZlW1yD96CAqsgtDvlBALhmFRo
	qYnPe5TGoN5PQp4eJ/EPGTYWxkdHvAqHTNZZivT0VtgMgD5jtvT4WwFF4+UunAmeRqlIVZS1ZCYHB
	j4fVOzk3HJ446aFwSqPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUrub-00000000G1E-1vM6;
	Sat, 21 Nov 2026 20:42:17 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUrua-00000000G0r-0EnT
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 20:42:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3857B61CFF
	for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Nov 2026 20:42:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF4D41F000E6
	for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Nov 2026 20:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795293734;
	bh=huxgq6e9wHfksi/drVHaTC3DOif56VffXqVT2Ec+rYg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=a8pXa9NjEx9NQ/UAZAfVgt42LplORXaYyGyB/rJCfB0Lm4Psbmc1pcOUHjwOnRF7d
	 GEg5NlA5BGM/WsTZZdqoyg2a/wPQkspqE8g1fRMtGD9zbabrEHzFAv9Hwnelx1zYsl
	 hoxYWeYg5/x/whFzryOTt86Bz4uIyhJcArYfdaHg/AZuoFQvW5XBRbFdwSEKwG/igb
	 gmY1DjUP9V0DbMtMWS8YkKlOEvxukraKf+/7QxUSJfIWUQK/rYHtJWWe/eAcqGj8Ou
	 hvBcvD8MvGmVBFAA62UuwzZoyO9MBuUFmonrilpHq9DR10KWMn7pQmDId7LIGndM35
	 ryUMk34EJmVMA==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5bcdae234ecso2561654e87.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Nov 2026 12:42:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGj//mazk2FKmMmYd9k2lHa+2iKe6HZTECfyfWbvXLslcLezCRnrXH7X3+Z9RHBGwj3Z3n7tK6v4WCYLVaeUTWn@lists.infradead.org
X-Gm-Message-State: APuU4Z9MEYilg270OqA6b2zZHS5bWk3AoGh5DLoavD4YZYf27lsDTCRQ
	cDRlTXXDJp/v2FcKSqvVEO4Q/ikQfyb0ZxhhIEmbu2ou7c5YKhOnQuLeEmty4cnr+Col2AMCiSo
	wyadMwFyYupfG1NZe7UfTY+EbxKRKK6w=
X-Received: by 2002:a05:6512:31c3:b0:5bf:dc95:3817 with SMTP id
 2adb3069b0e04-5c1bc7bcbe9mr2121267e87.15.1795293733675; Sat, 21 Nov 2026
 12:42:13 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261112064957.1796975-1-dmitry.torokhov@gmail.com> <20261112064957.1796975-6-dmitry.torokhov@gmail.com>
In-Reply-To: <20261112064957.1796975-6-dmitry.torokhov@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 21 Nov 2026 21:42:01 +0100
X-Gmail-Original-Message-ID: <CAD++jL=u2okiCU12RV+nC0NLJEMg49CkhtPKOguapwXBpN9OVA@mail.gmail.com>
X-Gm-Features: Aa3M54q5oFmXwdWSrTxDLECj9BANyp03LDdetIui07Q3S7mayCU0UCP9cIWP9Xk
Message-ID: <CAD++jL=u2okiCU12RV+nC0NLJEMg49CkhtPKOguapwXBpN9OVA@mail.gmail.com>
Subject: Re: [PATCH 5/5] Input: ads7846 - fix minor coding style issues
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, Daniel Mack <daniel@zonque.org>, 
	Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>, 
	"H . Nikolaus Schaller" <hns@goldelico.com>, Kris Bahnsen <kris@embeddedts.com>, 
	Mark Featherston <mark@embeddedts.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, linux-input@vger.kernel.org, 
	linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 12, 2026 at 7:50=E2=80=AFAM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:

> Fix minor checkpatch warnings and checks across the ads7846 driver,
> cleaning up types, spacing, permissions, and macro formatting.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

