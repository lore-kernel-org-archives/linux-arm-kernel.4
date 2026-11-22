Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F24606A335
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 18:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZZIaMP7o;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LGc/9FGB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=l9CfgsFXDwrrEwwpmeKXg+KOAvu1yqasIfQl+WG4JYU=; b=ZZIaMP7o7c7JWa
	iDBiT5ochf77kZDPYU/bTJYW2tuusiHrKJHbmcb1xjeN9uIFwH0oAVe1ifkitnb8idNju/kp5kkiw
	n+w0CMDwzXXG0V+SENFEwefoGwXksadDC2NMFO7DlblEZzm0/g0XqMQIqlXzHeHDP7sF8f2AtDIva
	+6dgUvmXN19VZGY4g02Vcjgg/L0vhVZcY63U4fRU3QK6paMJZcoKU9rSxflH7/3IslsdU7yeq2Jfq
	xMNtzuFtCizBbjM23ZgXQuVmdYDrGi3XQJTIVnI6oddwPJUGXsZACbTmw29bi5uwTGRaNeBgERFBi
	tQb8J0r6Afc2z65HPU/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVCGA-00000001Wis-2zJA;
	Sun, 22 Nov 2026 18:25:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVCG8-00000001WiD-3NiG
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 18:25:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 412596185C
	for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 18:25:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 885921F000CF
	for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 18:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795371951;
	bh=l9CfgsFXDwrrEwwpmeKXg+KOAvu1yqasIfQl+WG4JYU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=LGc/9FGBPBQZUvNmnpW9aoAV8DRN4f++L4BqYc5ofUu3imrsycqXZMRcVEBlOftP4
	 vqUSv2ddiGT8RF7fySiPJY4OCXr+N9UBJewMpLaZV5PW/2ggNoZZFKTFBjOTYnyc7D
	 79wisqxD9VZDky1SD0clVI6y5/AKpoUdxmnLf4iXtYiyRraYk8SLRMeqRC1C15AJVs
	 5Z6mvSNeDKCG3CdgJt7EnNrcGIaG5B5PNHiDeR/dULP6ZZ2SypagrvzPfAq0QfmVqy
	 mRjtpd8gKMvNXE4FMqpuahcZlvUqm9DGbYBFVGmqKSasaJSjjMyFMHHe1TGuiDCKU3
	 xZXITtGy+mlxQ==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5c10dc41270so2717499e87.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 10:25:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGvneEHV8Wo+Aay/f4VrWiTE1NZdfxhr9Mh9JdyOpzEB0WBbnsMjnChupka5hs66W/nCP1gkNlmWdiwgHUxqfdn@lists.infradead.org
X-Gm-Message-State: APuU4Z/aGfQDFk/wN3LkrwP1YA/6nHkZ+XthUxpo5WHIX5kp9gT0MSwm
	1mx3mAZRA1uV+G46HumMUJ7zwYuBPtfDP1CjKOz+IkNIm3Pn1k6kaIG4lDSXXw9j5c3JdDJ9rpY
	AxpEUqInHOXg56BMUCt/MWeETcbqfOyo=
X-Received: by 2002:a05:6512:6d2:b0:5c0:d9e2:f66 with SMTP id
 2adb3069b0e04-5c1bc7b4301mr2437293e87.20.1795371950328; Sun, 22 Nov 2026
 10:25:50 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261119-cs75xx-gpio-v6-0-37aeda0aaedd@gmail.com> <20261119-cs75xx-gpio-v6-1-37aeda0aaedd@gmail.com>
In-Reply-To: <20261119-cs75xx-gpio-v6-1-37aeda0aaedd@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 22 Nov 2026 19:25:37 +0100
X-Gmail-Original-Message-ID: <CAD++jLkbKaRW8J-ZRxkrM5SX0-7eZPu=C_5OLCGquYOtWU4TOg@mail.gmail.com>
X-Gm-Features: Aa3M54rbItLFWFNiExC6gKouuAtPmZpVlhpXK-hpWeRjgFU7aqgZIJC1n_xCbCk
Message-ID: <CAD++jLkbKaRW8J-ZRxkrM5SX0-7eZPu=C_5OLCGquYOtWU4TOg@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] dt-bindings: gpio: Add Cortina Systems CS7542 GPIO controller
To: filipp.dunsky@gmail.com
Cc: Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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

On Thu, Nov 19, 2026 at 4:09=E2=80=AFPM Fil Dunsky via B4 Relay
<devnull+filipp.dunsky.gmail.com@kernel.org> wrote:

> From: Fil Dunsky <filipp.dunsky@gmail.com>
>
> The Cortina Systems CS75xx SoCs have five banks of 32 GPIO lines. Each
> pin is shared between a GPIO line and a peripheral function; the pin
> mux lives in the global control block and is not described here.
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

