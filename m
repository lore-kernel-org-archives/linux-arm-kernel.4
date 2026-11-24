Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D20606A321
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 10:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4Yfs4vki;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lf2VEmI1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=6RxDNhcrptkLwm5icpyITA1cARO1T74TvXZeN92Qajg=; b=4Yfs4vkiXExvLi
	YQ6VOdEDbcanZJonU7Cs8WV63KD28tW1r7bg8lmSzrj8axFaCYje3241qFow9/vYFXcoqmegQYQHS
	JnAKXD+fPiUO1DNuvKPBtq3AFRwcfHIlqSlnAtYZaN66plwsVh0yl1Usup0L40IRuRejqrI4hGzKf
	YAmV1MdQ3yT/pmBJtbsS5+jNtGuIZezKPjyKhlRbee34ZfaYujoHv1yEqKzDOGys/jGp7ceYitv22
	q9Q92rRZDfkQhzYahNXK0oE0j9l7Vy4LJrmBT00J1X2PquH3LHxGVLi+XGfP4oEYGagIxbHxX2hUU
	3cuN2yxtmOUJ5CC2umMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVnGf-000000069EQ-0bDF;
	Tue, 24 Nov 2026 09:56:53 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVnGU-000000068wQ-0QhT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 09:56:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 245E4625B3
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 09:56:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9465B1F0093C
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 09:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795514200;
	bh=6RxDNhcrptkLwm5icpyITA1cARO1T74TvXZeN92Qajg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=lf2VEmI12JFLEgUGjVFCTv0QjW3DzCel4nyHoZURtSOyTH4f6ATQ1F9160ju0vvcJ
	 1PxA6UlQXZt13PWLF8DKe4G2fyNtZEfkNquipMkfq4cB4Vyyt9Vb8QLIjeBylBY68V
	 8fkdXxi2Q/3e9CgZNUHA8x8SIhVN3xZ7Go/+IbWqCEQoBiEztDO1QPeqv+6bOeCBfl
	 eGtwiPdREEoZEEaGpzvmpTVcOtD31t91A/v5X3KXjPTtvGx+yrS5sJKsvgO+GX4oTb
	 OlIqX7l7+ISlIVFgCxMWp9ns6b0uSX94naPiT/WMszXh8HjzkH/+81WGhZ75t3GckW
	 FxW2yjPsT6HCA==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3ace304021eso41445191fa.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 01:56:40 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErG7L1u2PUPyLGzhV1UUP+oGSROfF+tC9R6NWSPRbdNT9NoBevz92BBcaKros9DTa7eh9oxjGwmagF9B35IlogcU@lists.infradead.org
X-Gm-Message-State: APuU4Z+iM816ERQPNQb/e+TIGA1RLMqWx8zMAeM2Fugf+k8CCSftzs4V
	w0sAsc5DBhRwpuDH8oLtx+9dxI273OOc972RXAyxslHJHosHB9m/Td2BBQvFvZ3f0seipOTP+X4
	OKTFY8optNEoEM2QjDGoSF6L2LOpSCRo=
X-Received: by 2002:a05:6512:1048:b0:5bf:6c4c:62ce with SMTP id
 2adb3069b0e04-5c1bc81c49bmr3664194e87.55.1795514199208; Tue, 24 Nov 2026
 01:56:39 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261123-cs7542-syscon-v2-0-1cd74b2522f9@gmail.com> <20261123-cs7542-syscon-v2-4-1cd74b2522f9@gmail.com>
In-Reply-To: <20261123-cs7542-syscon-v2-4-1cd74b2522f9@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 24 Nov 2026 10:56:26 +0100
X-Gmail-Original-Message-ID: <CAD++jL=jLDF1mRBp9mai7hFKU21SG8ud-Wf5ebS89BHiUWM9sg@mail.gmail.com>
X-Gm-Features: Aa3M54pJBPNtS8HBHNO_8ov-NITzhFzIUmDM0dw5V6Dl7sMdZPPnTtRSJZShNYc
Message-ID: <CAD++jL=jLDF1mRBp9mai7hFKU21SG8ud-Wf5ebS89BHiUWM9sg@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] pinctrl: Add Cortina Systems CS7542 pin multiplexer
To: filipp.dunsky@gmail.com
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Arnd Bergmann <arnd@arndb.de>, linux-gpio@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
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

On Mon, Nov 23, 2026 at 9:27=E2=80=AFPM Fil Dunsky via B4 Relay
<devnull+filipp.dunsky.gmail.com@kernel.org> wrote:

> From: Fil Dunsky <filipp.dunsky@gmail.com>
>
> Use the global syscon regmap for the five GPIO mux registers. Each
> bit selects GPIO when set and a peripheral signal when clear. Support
> GPIO on all 160 lines and the six UART pins exercised by the OpenWrt
> port. Do not guess mux settings for the other peripherals.
>
> Use masked regmap updates so independent pins and users of the shared
> block retain their settings. No register changes are made merely by
> probing; only a selected state or a GPIO request changes a pin.
> Register and initialize the controller before enabling its own hogs.
>
> AI assistance: Codex prepared this change from the existing OpenWrt port
> and GPL vendor sources.
>
> Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>

This looks good to me:
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

