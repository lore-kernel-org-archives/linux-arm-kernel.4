Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D12A606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 10:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=If8vD5Rx;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lrx50Fuq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=IBXcaC8CSaPOK5lnAix38sTVGCSr2JvQQd/TlL9JIsI=; b=If8vD5RxLR07yg
	/1JjLBa+xonU3kvTyJVl/QnJnd4sJCzVs33DCdf3Faz8fvVTbAl8kh84n7+J9Wkt6N32hAzFM2XS5
	d357qRY+0wfxMKhMGK/AGCUM/SrH8+ZgP4yTLbYd/Qem/RW1NfNiy6ZTTPQwTrIrZ2avHQ600UQnn
	vX/7rLf5PvBeXLHLeXhIuHY3MbCDR1t50KlHN7MbjMocJNF2b0jZD2XUEvdcE2jIBNgCDuA9Be2K2
	DuhhHuI14GDMLBkqfQkiVSUyKbDM9okAkMmVga0FSb5ZNxx1v1UQ4q8x2tOIimmOazj1SF7LUWCI4
	sn9YEO+Ze4wb4stOl6Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTG7c-00000005E8m-0jEj;
	Tue, 17 Nov 2026 10:09:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTG7a-00000005E8g-3itP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 10:09:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5CBE84570F
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 10:09:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C7CC1F000C7
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 10:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794910142;
	bh=IBXcaC8CSaPOK5lnAix38sTVGCSr2JvQQd/TlL9JIsI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=lrx50FuqQGh4txTkICtA6Ioiy/BxsxtmjN64WUmmTlZp8qY3UcAm7Mpajsk0zqCIN
	 TNRZYb01+1QWyWwvxhktijZ39MFFEUpsjlTdKItv7OpwhaRlmvJKTeFKKcAIkWDkjx
	 e39jk8iDzjegeWOI9/rcfNZZthafEbpLb55qPMiZtv4+f6WitZv4AM839i63yGhUWU
	 LRFPWY6/HY68PfQ/1f+6SCRuLmhsYVSIAgAH214ZMy9j9fuGnDF5rwYsDG9NLBeTsb
	 TFJzdMEoTpAqrQATdcpFhHl/qGdcTqxh8ftKv2ke4eX8UPehtjLJMMDnYtozvA73vF
	 EEW6KKVHklhJQ==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3adfcafaabbso45092501fa.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 02:09:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErElWbaFD6SeX1fFTnfC15ZlsYOx1GjmYlCDznGjpCcAHxu3+PhfdDMWguTU22tSuXP9qoympKQNIkF/lrmLXEC5@lists.infradead.org
X-Gm-Message-State: APuU4Z+gGPo4ZXb2jmBJfj3Qzrkughusn3qGFR80SDXKbISzJADaFuu5
	cjYyid66kwk+/l4dzgfzXzOY1kJ+s/rBsQHUnRWnLlw9AFEEVekVhQSaZ4WJ7cQ6B1y8atXQ6PJ
	MFpfNIZzVBXvQUa3v0l4BOGSjJ92RVQk=
X-Received: by 2002:a05:6512:2305:b0:5c1:4e18:39ca with SMTP id
 2adb3069b0e04-5c17079ba12mr4824318e87.21.1794910140837; Tue, 17 Nov 2026
 02:09:00 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261106-apple-m5-initial-devicetrees-v3-0-cee55de54b2f@cyberchaos.dev>
 <20261106-apple-m5-initial-devicetrees-v3-6-cee55de54b2f@cyberchaos.dev>
In-Reply-To: <20261106-apple-m5-initial-devicetrees-v3-6-cee55de54b2f@cyberchaos.dev>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 17 Nov 2026 11:08:47 +0100
X-Gmail-Original-Message-ID: <CAD++jLmXOhfBJGmPa21id+XOafL8+XOJDygxkH6Pu5zxXq9MEA@mail.gmail.com>
X-Gm-Features: Aa3M54oHRchG8imGAtTdXZeU9Swv9RX1BbEKTTONGE2twBx83aIIvKlEdxp-34c
Message-ID: <CAD++jLmXOhfBJGmPa21id+XOafL8+XOJDygxkH6Pu5zxXq9MEA@mail.gmail.com>
Subject: Re: [PATCH v3 6/9] dt-bindings: pinctrl: apple,pinctrl: Add t8142 compatible
To: Yureka Lilian <yureka@cyberchaos.dev>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Hector Martin <marcan@marcan.st>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Sasha Finkelstein <k@chaosmail.tech>, Mark Kettenis <kettenis@openbsd.org>, 
	Andi Shyti <andi.shyti@kernel.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
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

On Fri, Nov 6, 2026 at 10:24=E2=80=AFPM Yureka Lilian <yureka@cyberchaos.de=
v> wrote:

> The pin controller on the Apple Silicon T8142 (M5) SoCs is compatible
> with t8140. Add "apple,t8142-pinctrl" as SoC specific compatible under
> "apple,t8140-pinctrl".
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>

This patch 6/9 applied to the pinctrl tree.

Yours,
Linus Walleij

