Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D028606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 20:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PG81a0n9;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nsSWF1bB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=b4WlBIeYfXjkCDL5Y8Z597JBZPP1KdP6QejXLz1yHIk=; b=PG81a0n9JwLUm+
	fMBMO0xijTg1A1+OHzGj/VXS7gb5oDEpHPBPVPcsrHGu7reTTUYTCymj4hBR7jCiczGS5D6ljSkd/
	7d2MXnILYbP8NKg9uEd8ZWLe5JMwLRmjLuWQspZksgLUIB/XZFYYeotNq32kHMUn1fimFphGJfDJk
	egb2n0cAVbNo7gB1qeegn9mrnHEPAcqOY+TeMeqnnk+92I0LDK1SGCZzsQ5+HJavWW7q2u8iOysMW
	uJ48ywA+ioskQ8w2oy6rqi4hOvbk88eOWXCUvgXViiIJTgkdeao3C/VhMTprb9stbyCAwaHrSu2ku
	nfy6wt4z9m+HZqnW4QcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUrtn-00000000Fis-2ilq;
	Sat, 21 Nov 2026 20:41:27 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUrtm-00000000Fhe-1OSp
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 20:41:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BD0D5459C8
	for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Nov 2026 20:41:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A28CE1F000D4
	for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Nov 2026 20:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795293685;
	bh=b4WlBIeYfXjkCDL5Y8Z597JBZPP1KdP6QejXLz1yHIk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=nsSWF1bBxDCZWEEGdtVr4N7h5O6aivS2ENs9b5TFOKkjggjAm0nFTYcNnAiY4q/yX
	 4HB08kakqiYHrDG8OSSHT63Bp5iWZ8FR7jrmEaWKHtWPBUkEL2ODkcm9alazU0ptPw
	 DnXeZLLqfh4MnXTiGZzKLerlBI1PoN+Iy5E/1bI26H7H5gxa1XZkCkbltw3xI/eZpm
	 fBffjBrqqHJUXQfcVP95sXFv1Tmrhp933yEGCZf4GxwXRphygMDXbSny5K+NEXFvLL
	 4mwd+1jyYif0toej0j2AyUpb+lKCeLrwpx4gxmt66kO3N2ggttGJ5xskzwmg2KVk78
	 J5K0dAFVvRrgA==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5c15ccd7fb5so1169525e87.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Nov 2026 12:41:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErH+KxjgZUHTWfxVfOfgnMO9DW0SovG8ywTwjhvwSt8nj3b5TKG9scA/EKhRRtM08Nms1PDUmVoeMvLljZgpWy2M@lists.infradead.org
X-Gm-Message-State: APuU4Z/PufrEjHnQD+Z/9JWZTU3C0VD3qRtYjheNP/uaLkYltyXusOJZ
	5egM6qQDPLhu2J3rSzJqa2EJpmJjgGecktUgDAtvZNsDJHKmyJ4RbQFpx9/ZICV9JY9ii7c/WYe
	UrCg2imvkgccJ5qZkHB6hMGLN02fw8xA=
X-Received: by 2002:a05:6512:39d1:b0:5bf:b22f:19af with SMTP id
 2adb3069b0e04-5c1bc7c4514mr2703568e87.18.1795293684444; Sat, 21 Nov 2026
 12:41:24 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261112064957.1796975-1-dmitry.torokhov@gmail.com> <20261112064957.1796975-4-dmitry.torokhov@gmail.com>
In-Reply-To: <20261112064957.1796975-4-dmitry.torokhov@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 21 Nov 2026 21:41:10 +0100
X-Gmail-Original-Message-ID: <CAD++jLn90_bz3=oE+8rV906pOaLykKFqx4Cp1snLufUu0N2X3g@mail.gmail.com>
X-Gm-Features: Aa3M54pJMyi7VeDQdtQwI-ABSXBp_5jI9c4EBusiNB2hkGon3qtq7U4AzS-lEdw
Message-ID: <CAD++jLn90_bz3=oE+8rV906pOaLykKFqx4Cp1snLufUu0N2X3g@mail.gmail.com>
Subject: Re: [PATCH 3/5] Input: ads7846 - remove unneeded memory barriers
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

> The driver invokes mb() after setting the stopped flag in ads7846_stop()
> and ads7846_restart(). These mandatory barriers lack pairing barriers on
> the reader side and are unnecessary.
>
> The wait queue operations wake_up() and wait_event_timeout(), along
> with disable_irq() and enable_irq(), already provide the required
> synchronization and memory ordering when stopping and restarting the
> device polling. Remove the redundant barriers.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Weird, probably cargo-cult code.
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

