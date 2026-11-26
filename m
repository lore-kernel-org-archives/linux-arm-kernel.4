Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB008606A326
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 13:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GwZ+GFS5;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N2OMRWwO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=xxW8JN/Y0KCbuZrpXSaBVqEQmNUxkhkOMH9G0xvrG40=; b=GwZ+GFS5QoOdEZ
	tYEsnhclFRUsZC2xDETCSxxaivk8oockQJZLgAJYPK1IsSnhlViTE0I+T637ZnLY7ve9fQNphWSEX
	tTqUnOZifZFyBywlpu/R5VMHnoC9VzwtMiGEk+3Qd02roe5gzrh4cHgcWkA3NOMm60mJttl5ZwtbN
	YMGD5/W3O7dynWI7wPKMBGeEpxiLWqNre1vjO4P2PHBzxLLLkqTDmGAxm5wccnVhctuYE9JZA2ADY
	ukPAXWhiJLPzICjCGOiIw6C8xApwhE0TiWpJIE2I2ppw1uvV5eqth62PzRP6xmyIdFMvjMiZ69Zhv
	0kvSVUGPB2XCYOEnMOCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWZ3V-0000000DGvd-3BFL;
	Thu, 26 Nov 2026 12:58:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWZ3A-0000000DGrT-3Qra
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 12:58:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 930B5414ED
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 12:58:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12D881F008B2
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 12:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795697888;
	bh=xxW8JN/Y0KCbuZrpXSaBVqEQmNUxkhkOMH9G0xvrG40=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=N2OMRWwOIZIr3SX5v/CoGDRGsPPHjWiRV7OcWqFsHo5iJULUScB+hFmCLPs/lXRRY
	 tfmKM0ZHbrnm9N1JPXOOTDapVE18izEy2rnka6AMgYcOjwgCnZbF6x0TzNfy7m4Q77
	 I6lvEiFVGGCncNny7G7AMIKPs28WaIYRfUpH1FZkphXp3pco58DIvZjjBKMU1Q0AW2
	 g8RN6VGoysZimrdpmmgQRUpHXZgUdyYXAlbuh3EIo9AgR9jQ77/wEXl8vZlTqXkXhZ
	 qQTotmM/QVH6N8FO9vwm8asjgLfL+1gPqfGZ+ps3APN+OuKgfrof0X6CTZxyzRi2M/
	 NrdhLNDajx+qg==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3ae5ab4fcdcso48548321fa.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 04:58:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHb5jd3/W+F5uakCUv9BZcDhm2hOK6mxoqsJi6MDPv9+vH34ONvp7a5NuZTLtfsvUUw1eVIXkKOCUPWxVvcZlGf@lists.infradead.org
X-Gm-Message-State: APuU4Z9XgI/kyOLQ2XAyWIiTFmxvsmKQ5h4p7AdnxPgx2xuoCtBYbsJU
	kVhEkaq9h2cvodmpGVkDOuykIAWPv/d1NSYlH1EQKjj/jZXQG/otLUwmk5ul6xRf6F6NqsmgS1l
	EeIjskBXN6jKQDoXlxCnsbgpctlJcB7w=
X-Received: by 2002:a05:6512:3d14:b0:5bf:d54c:c189 with SMTP id
 2adb3069b0e04-5c1bc660a0dmr6649201e87.5.1795697886865; Thu, 26 Nov 2026
 04:58:06 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261115102401.3520-1-jszhang@kernel.org>
In-Reply-To: <20261115102401.3520-1-jszhang@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 26 Nov 2026 13:57:54 +0100
X-Gmail-Original-Message-ID: <CAD++jL=TE0pF60vR-Y==z2LDfs4n2rvfZ5FMOuEoFsD2PwMXhw@mail.gmail.com>
X-Gm-Features: Aa3M54p6XoJWkVp7q4vqRmQARyVxQsd0uuJbzgC_NhGGCjDNxq9tWPObFVl9RBU
Message-ID: <CAD++jL=TE0pF60vR-Y==z2LDfs4n2rvfZ5FMOuEoFsD2PwMXhw@mail.gmail.com>
Subject: Re: [PATCH v2 00/13] arm64: add Synaptics SL2610 SoCs and RDK boards
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Jisheng,

On Sun, Nov 15, 2026 at 11:44=E2=80=AFAM Jisheng Zhang <jszhang@kernel.org>=
 wrote:

> Add initial support for the Synaptics SL261X SoCs and corresponding
> RDK boards.
(...)
>  drivers/pinctrl/berlin/Kconfig                |  16 +
>  drivers/pinctrl/berlin/Makefile               |   1 +
>  drivers/pinctrl/berlin/berlin.c               | 259 +++++-
>  drivers/pinctrl/berlin/berlin.h               |  17 +-
>  drivers/pinctrl/berlin/pinctrl-sl2610.c       | 759 ++++++++++++++++++
(...)
>  create mode 100644 drivers/pinctrl/berlin/pinctrl-sl2610.c

Can you break out all the pinctrl changes and send separately?
(Also any binding changes.)

It's best to review and apply this in isolation, hopefully there are
no build-time dependecies.

Yours,
Linus Walleij

