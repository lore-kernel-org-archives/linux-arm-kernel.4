Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CFC2606A69E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 21:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HQYwIwmV;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=CGmKgua4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Fg3L3deHSkuexlMXiL0IKxngCsihbg1MRnR96egwqJQ=; b=HQYwIwmV6ctkiD
	+ovUPsr/D8Lavsra0SFSjqJ5dMRO/XmWMvaubGaPnkVG4fPXLu4E0GntWenB5uI5T3ByqnGQq0U7m
	DHmqF7sMhTB9jGcRZPV6RzHWFYZLuTmVQjzDnGB1pqHRLH9P6Q12l0NCfCpNef+2MxsluuLRqWaWu
	j6vMzb0p9kZxldeQqy5wNwnOreaKDFd9DrZ9+7HG39a81/0CSlIYC6Pv042/UtHtHSiRQAa+4ZvVw
	XHFv2l621YAV3ZCqJr0ArR0JiPfC2PevAzlcu+k5OVyb1AOg38BIoo5sfiIL00J537vQn8cfbloF5
	QLrytSWCXVkgOPyesTNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVyDc-00000007t8O-1A8W;
	Tue, 24 Nov 2026 21:38:28 +0000
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVyCo-00000007t3k-3Dg8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 21:38:27 +0000
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-8b4d6981c67so32460127b3.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 13:37:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795556257; cv=none;
        d=google.com; s=arc-20260327;
        b=n7F4nYJP/eWNsMY2EI1zFZcVgQT2aQNkx5QiJrvMznnUx+bGm6VDNhsEKp2j3p5r00
         hm/i3zv1DZhPT2gs9b2ZFKJE5INkbhJjV15r6CseRnPmzZlinfdMbZt482fVYB0E+sdb
         RZ5xwz/WJue9KIOpMTl/sR6TcrAwFApidkPbNcVe5bj0sao/BPVRlebscBxzLE+yt74E
         2yU2TETHhGqoBk7kr/hZ1FyzeyKj2VWHo5ovzmnijtktfGphQwtLG1+pX2fxadTDZP5e
         G9r5f3IpE9bIBtxB5bx4kaOh2WmbsGj/B80vUMlpc5Z+zYqaqiESGCx600jYHJ4sjSFi
         Q7+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Fg3L3deHSkuexlMXiL0IKxngCsihbg1MRnR96egwqJQ=;
        fh=at8q51vn9T0kFWh+5cKJ9WbDjWcl1Oc3Ep8inuEtBoE=;
        b=ry03heJaoF69aAxbrrf9uDR8gSyyIovPrh5y8wanPTjrw1Du1q7fDT3DnCUVnJaTIo
         NcdGCVKDP6TgGd4T3ZQTJDXPlFqhkXGkWfehYvJqeF+Kiol3UnB4svl7gATZd0V6Hc/h
         1Ir4NOgZ3UlCEd/dvajw88ew38vexfTmgQGBBLCHc8jrfZbLA0PGRHRAwIt973PSxO33
         yHw2pTTFnmT5NqZvBTU4OE0ww0w4/o89LxSw519utAcVzumeSxG5yiZgXcPxiNf2RHbt
         LT7gtB4BVvKPEFjqR1U5hEBLxPufPBUaG8xu6fY2gD9lg5ouANbU5R3KsjF1Zwrll10f
         a4Lw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1795556257; x=1796161057; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Fg3L3deHSkuexlMXiL0IKxngCsihbg1MRnR96egwqJQ=;
        b=CGmKgua4FbjSBNNRh13wFz0G6q9czD5S2SuRzLHI2o6bZ/IrOsRRzHyRzqSBbbT0/I
         uZchhsx5fPTGmaSb3IFOWBsNSSIw6YmZToEgtWnonMmwNSakzGFHtzrjhvwg9KzwoL9H
         QzMDLM4Ow+PX6jrLG50u7upGFy7TY89HAeS8UK2wTEnxOBAxnmv2Ka3GB3nhipJrf6J2
         +g082BK1vLXsM8p0b2EICZz6ZOK194vU3GefuJ2z8JSm7I67mer0uktM074iTAefalJY
         4B0udoYr9KsusssldfpjwV0faUxqAL2FX618jZTswK0zF9xalpImrUpGSm0C9lMIUIX2
         Ygxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795556257; x=1796161057;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fg3L3deHSkuexlMXiL0IKxngCsihbg1MRnR96egwqJQ=;
        b=grMEMZssqNwO6fl35rilr0dSnGFvEjIOkVfNpxkjWOtM+IWXo3raQO6V1vI5WmXDOj
         XqVEOjFnErxZRnCzBCm77SwWqBGLP/hHtX437v/+64Wn8qeC3Gp0fhF4/si4F+h55BK8
         IJLpFm5nCVU7ETHS72ysUT2iOBLN4Eti5Lvd0XEtMYz1N4lXqRleRiSG3tKKfBJRmUhR
         IEcy9ZZDbg0sLgePLjAF1y7fK9XVPs6vd6CoQSsfNEHXloxlTsNxTRq6mfDiIhTI4xxX
         gfGAQNFyPt2tp/C0pbjUPSjUwIneg4MJZAz8xIE+rEsJyshBDOzOcZwCsaZTgoBN1veY
         cDFA==
X-Forwarded-Encrypted: i=1; AL+hErE4DGaUfZYLZ5RgQHAHKuIXnNDgreBmpTUxXvI5qgOumFscCW8XmmsaUWJOJVg+glxKuzFkh9aFRpyLj+zVPp8t@lists.infradead.org
X-Gm-Message-State: APuU4Z8F7OhuPFhXZNL6jEeewtByW8H83YaJ0i/HFeMYFN3lDPDkwdAn
	0j7/G3adWdFuE/R13mt2tRXGi/BayOD2dOe9+UMBsSzjavdjtitsGKpMkQPlC9Rym1Tg7GnWu1l
	EzarBKQAumTyFndxgX3b3gDViZZa4pYao/zRt
X-Gm-Gg: AZFdTZc+hN4L3nLIX/7+Yd38fSu8iwIt3KAjKUTMFZqYuZ4CobjmgFvKgVOT8gEuUze
	7xWsiWLZA9sMVqDXlszU8O5H+H8PgDs8L+D7GxQL9/Q+q4IxhJgkBRH89KpXD3zZ8hNxNUafbsB
	odWikSjj4ce1sJsVzxOEfYmTmoNa8Q3n7hwYs/E80XHKkBaa3R1mvf/IKqqMcTNsJPyv+yqlfwG
	Z/o5Df9Z1Ye6C36Bzr00cDHCQ+61q9xfnREzqRnxrX9jSrl/jX6u6QrnJUm73qUOip+jIXDPLog
	fJj/gXzXgieQ7PVDqgtTNr43wAaxtKJr4XSQfhRsJtFCAxEXJ8JbAkG0b6RBDU8GXxkJpCyTeMM
	4pjNm0wI+M2RUrOV5wA6LI/2gBUmY7LM5K4zjcesnSb4IVdQ5ajOyExjZNnsQsGgpCNoLig==
X-Received: by 2002:a05:690c:3749:b0:8b4:d6de:975a with SMTP id
 00721157ae682-8b520442f78mr75631547b3.17.1795556257259; Tue, 24 Nov 2026
 13:37:37 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261121213102.143130-1-tanure@linux.com> <20261121213102.143130-4-tanure@linux.com>
In-Reply-To: <20261121213102.143130-4-tanure@linux.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 24 Nov 2026 22:37:26 +0100
X-Gm-Features: Aa3M54raaw5cpHc_7i460xpAtUuQL2U6TjCh0nslZW-bSHKd5TU4q_42SX4Pzaw
Message-ID: <CAFBinCAzSgCGfXb_Q3FuwEmPAEiHSxzVR_ceyqMNp+LEZ18u1g@mail.gmail.com>
Subject: Re: [PATCH v8 3/4] arm64: dts: amlogic: t7: add the ethernet controller
To: Lucas Tanure <tanure@linux.com>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_133738_832033_4439F58B 
X-CRM114-Status: UNSURE (   9.60  )
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
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, Nov 21, 2026 at 10:31=E2=80=AFPM Lucas Tanure <tanure@linux.com> wr=
ote:
[...]
> +                               int_mdio: mdio@1 {
> +                                       reg =3D <1>;
> +                                       #address-cells =3D <1>;
> +                                       #size-cells =3D <0>;
> +                                       status =3D "disabled";
Lucas, Igor (+Cc) has taken a closer look at the MDIO mux, see [0]
What he's saying is that (in my own words):
- status =3D "disabled" is unnecessary
- if you had problems without status =3D "disabled": Igor's patch should
fix it, can you please test it?


[0] https://lore.kernel.org/linux-amlogic/20261124-re-martin-g12a-mux-t7@ia=
v.lv/T/#m240f885979c7c3a84af26ee8b60d38f3092f0c0a

