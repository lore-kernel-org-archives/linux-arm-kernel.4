Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE8AF606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 21:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QxotGlwN;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=gAXpA0I2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=+yhNDtVkGsB34hsrY/DrTfudZWn+Znetsqsket55Xcc=; b=QxotGlwNV8R5CM
	gjOu/iX92ayb5p5WAeukTcoKFh+47kFBXSK5rXo+JFikrMQdRV5VRUiyhctE2HY0JrpXksgotiYy6
	CrNUwtbrE8lD3vCNox43oYE5+qyOmWw9ra07p4XUCtLRkJ1Z2ZM7aQ7KSz5OEoTQnzT2EjDWpjlR+
	EiwHJOFNLq94tF/V43bJMtuh0cmGVHz+uM+W2zY6H5VlIgSCUHxYusBCHbVpSgh+HP0BlS80Pqawo
	pKQ37dBzBhuk2suJoLhVHqAfCSB1WsTuGwT3OT+K6y4rDZwVA5v/XUQGC8jDPJ3DlOojg+j3NSB7q
	HQ1fkpDc6vn/SON73s/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVyDz-00000007tKd-1Pyr;
	Tue, 24 Nov 2026 21:38:51 +0000
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVyDv-00000007tIX-3sn5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 21:38:48 +0000
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-8b0ca1ebc8bso44335197b3.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 13:38:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795556327; cv=none;
        d=google.com; s=arc-20260327;
        b=qkahp+PGIk4RgbYDJR1N/fkZ9CN5sTyTwVyw/HdC2kw/MWn4PR10JUyxeaiCsgUkqv
         aSAtwepVBbvfRhrMDIyRyTvWzz8FtAyQYZYr1IUJSos51/aD/kf0rOfVRQW+SWRJsl0D
         1J41nxZtHcVrNwf3OSx0cZBef5JVxSNIMFqFj8szNc6l8XdVmW6vbx5zZNy9a+pQJUCd
         nzjC04p069FYMeiQzbAB9g1mKOW7n0SNXsgdrIxhZNTgl60hXCFX6AWklyAQzXZ88Ipv
         rhYIznlGGdLXDPCf4m5mLZk7QeFSuK6wu5hFwO/2Ci3G1kO6l01z8UOATgXozSn5SeQd
         gj2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+yhNDtVkGsB34hsrY/DrTfudZWn+Znetsqsket55Xcc=;
        fh=G4ttreu1XbDxGp98NhTn52u7jGVfLG0EkzDXFLH5irE=;
        b=V+9+V8Pgeh3dl0mRcJMGCjfkrOzxrUFzvnL3tyt1vjmhAYFigcVaPM+sqR0qSqJ7qr
         DmSH5wRSYzXnM5TYF0WjPNtRBN0OhucnVWDkgwHiL+LVxFNP8QfIBqKG4NBAJW+hfLEw
         PIghG/hOS5gt+rRLmB66buQzw7g6sjvWl6kphCcM4JfEXeghz5eZ8YQPSdmmenbBumeC
         mYmP7iF9ERsq+Nh6ONw6eJpnOppXR2GWYLqvdk6HveW0+gJdH4IInkze1PfHD/Nomzqk
         2KnUYeHUZN9J/9XNLI16lfuXDsYGAYybAeMH5Api2s/4CTFxgWzu1lYqEsqFm/Ygv2rN
         PWPw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1795556327; x=1796161127; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+yhNDtVkGsB34hsrY/DrTfudZWn+Znetsqsket55Xcc=;
        b=gAXpA0I2AaIOFL+9uv8+txjCVC4OfgsECIwIl5xNYB+YjQal0Fdznyh3i/QbGDA0Uv
         79cTAsc28aNHCGX361pGFc9OJZxTi+L545SctYl+PnQlrqHklLaBKlpJEYAIPCxN/0Rp
         49q1brAYT9k8A/NQhWJYaBcc1XcP2KctdQ/1GJcQilPpjZib76UVz+ghojDuMueaNshD
         s4ylws7PGz0Y/AXzkRFFIB++iutTZdvcy1t8ar+q8/XWJOHm1ic2JEuim9zYgzAUlzEi
         JA0lwL6z0kVyTTlG+JK09ZCLAnpscnJSaS6Y53kiVTnpSo0eSst0FNoSTDJd4r/wkVHE
         P6Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795556327; x=1796161127;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+yhNDtVkGsB34hsrY/DrTfudZWn+Znetsqsket55Xcc=;
        b=B/aZcIWj2KRV0irFSt/aoV8aSpOQE5o6ZgeOglcOQigCQErAskexUE12QbFC0fCONo
         vDqFzfWFvfkm3XwxVtcwhCO1wC1PzE9fGvMUz/7Oue35uR7ElKF59Qa6vKl1TjTf7vj1
         iR+EHpw31LpE+lP7WTNYoFahekigrBEz4bX97bru/vhB/7ay1OJzepKTKOzaUTy+cgn8
         MIAI7toUb9dUPesz9Cy7ZwmTkJ+LUItyLV5FBJWrfkIm2N7c4rZIwh5kAkYnMLHCOx3w
         sruidkIzyJ4LbDzvFvSlB6SjV5vpUkH/jMc/pP9qMbv3UP2qytfOkqrpbET6sDQiOaCJ
         +aTw==
X-Forwarded-Encrypted: i=1; AL+hErG91PtklMKwP/R1HC/TDrJjgCpwAAZsphtF0z2s7DEWPinkTPwlGsp4XVSipWygFk3+cXZOOSwgjoihuTykc+AT@lists.infradead.org
X-Gm-Message-State: APuU4Z9coC0avl+x6pZt7kkFo5bhroEjyhdeQDcqpIigfOl79aA3gfwC
	J+ZptWpqMKOhKnKVvIjSiPCUTLqPto4W2k0V7iadFojqFt0GxbOQqJ7NNzYlwpLHA/jTUI2z8hp
	BY4i2CgONXKI/MK4j/kWKJNGtYPHWCBc=
X-Gm-Gg: AZFdTZdh7Bu7Ta/xCyf48P80jBkJKHN0bQmAh4OxVZdf2EFQTF4xPr5Irk7D3UVQrBi
	GhO56OgBL/swI5EeJE3IBNK9TXnHZOWnA0gGKwC4am6i2BIK/pVY7SSm3WuQ7QHRM6xdteaY4Kw
	Ryq/WikMv5wxmeZYe53xrCGSy8VSDdKl+C0+n5BDja9MoZHHZhGNxgupCv07EPkYi4BgEPK0Mrc
	Ombwz27hjcgYejx/+x2luPLBnx4eEBMKWnDM2j4s/HedFfGX0ab9aVxwE4TXgV1o4VE3s2rzjul
	zfPCWXI9szIA71t4PVbE+WU4aonflj21i2txJtgYN7z3TujFPbG54SVa2ztw9JDFvik8nTJdK/y
	TJkx5mrlUdNvIi6K1QQ85OR7mzxypbslGZAbA7sCY2wJ93CqhkqPb830GvSH2j26nc+smww==
X-Received: by 2002:a05:690c:a89:b0:8b4:c1ef:db88 with SMTP id
 00721157ae682-8b5204dc558mr63502567b3.40.1795556326911; Tue, 24 Nov 2026
 13:38:46 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261121213102.143130-1-tanure@linux.com> <20261121213102.143130-4-tanure@linux.com>
 <CAFBinCAzSgCGfXb_Q3FuwEmPAEiHSxzVR_ceyqMNp+LEZ18u1g@mail.gmail.com>
In-Reply-To: <CAFBinCAzSgCGfXb_Q3FuwEmPAEiHSxzVR_ceyqMNp+LEZ18u1g@mail.gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 24 Nov 2026 22:38:36 +0100
X-Gm-Features: Aa3M54pH5ipmAt51OQad9aGPrJTAjEJ236HllU0tqVNlknXoe88HjErnJUF6ArA
Message-ID: <CAFBinCD+JwU4mdgE54r0_XT8K5eMt2rjKQ9+3Pnt9V2nviH-fw@mail.gmail.com>
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
	linux-kernel@vger.kernel.org, iav@iav.lv
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_133847_974642_8E92043C 
X-CRM114-Status: GOOD (  10.13  )
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

On Tue, Nov 24, 2026 at 10:37=E2=80=AFPM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> On Sat, Nov 21, 2026 at 10:31=E2=80=AFPM Lucas Tanure <tanure@linux.com> =
wrote:
> [...]
> > +                               int_mdio: mdio@1 {
> > +                                       reg =3D <1>;
> > +                                       #address-cells =3D <1>;
> > +                                       #size-cells =3D <0>;
> > +                                       status =3D "disabled";
> Lucas, Igor (+Cc) has taken a closer look at the MDIO mux, see [0]
Sorry, I forgot to Cc him :-(
Now he's actually looped in

