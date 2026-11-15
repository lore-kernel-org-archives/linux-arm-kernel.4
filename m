Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B4F606A337
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 18:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=behFBFFB;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=jvBkHUmR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=hLexbnWyTvjn94KDBFaQzivLM34q5OtBuqgOMwsa1pM=; b=behFBFFBc67FTT
	Ot9QuSE5jIglK8wotaO1zL7APSQe32r36X+/gCBshJ4d61/r862df+dpCNeZgVk9a7idb+9KC6CzM
	cauuI5DAhcTQxQDiaoO9GluKHP8ZiwtGj6BbGfWgXyFZtNv/Cv+PTcnyOHQ/3yZ4Pw4OtE/wDrYy5
	luIRkeUOmBLexVAal5ooaVATqVKWtY2xRmSct2QIQ4fkIwXn2BScNAsceyaT/3/tMVty5rl/GdxP7
	m7FnjNCCvC6AIS4Z6FSr6mOqPP7TKhjHTAPqXE6lVPKq/cNxrZv7gLV0M7+i7R5hF2Jc/BrIZFJom
	ikXWAwOTcR1Z6Ka/tpWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSeYc-00000000IgH-27fI;
	Sun, 15 Nov 2026 18:02:26 +0000
Received: from mail-yx1-xb12d.google.com ([2607:f8b0:4864:20::b12d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSeYW-00000000Ic9-0sO1
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 18:02:25 +0000
Received: by mail-yx1-xb12d.google.com with SMTP id 956f58d0204a3-67583c777abso2735215d50.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 10:02:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794765739; cv=none;
        d=google.com; s=arc-20260327;
        b=n4C5/a8BpK18OVbkAFCbVazzezAGLfub6tL1XZ80yAXwlEH7amRhOEU4R3qwKooOVW
         6FOiaug3ujfFCA/oYk9ksBok39XF6Vy5/QfOE0srv7laNO00PybPYaZLPC5SOoTx2g3W
         9WOw2Hzlb2eDcPhXkpJhQBBj8rN/gx6kIkrCnhU0t4hNVSHymwSIhplKTCuzS1Ow+586
         F0jewjdQtnS03++yGr7ouAcbE5tWX5edDI8536j4Qz3hdS1QRCxLnY4SkDVzSdGyCfxd
         L8OuZlTb/F+0oxoy5CAaTA1Xwakge0VXxY9wYDVbLtltJPHCnCeUD90XJEfTwXc7LxGV
         clxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hLexbnWyTvjn94KDBFaQzivLM34q5OtBuqgOMwsa1pM=;
        fh=A1slvnnKJW801ozpn1MvaLfniFvJqdXD5k/4FbMY8MU=;
        b=KtfguISfwqowXDlobUJuntu7jDYz3gWtvtOur13Yf3g2q7j3URxCwdtTJB6VIhOVEI
         dPIhrZiPCS8VTQF26M+fHvhipmabpwxA+44KKx2YvGmXkBGty3GNdnkshglFR0pCyVM7
         Bk8ZTIXOWOq5S7ycPSzBXUtwDyvjYf605cS0AaaNCo5zlaN6Jmuc2gt5jqlfoImydlLN
         au1NiUTWG7pm1+MS6H4pS9/qUtvehHTqQVSVKqGDeqU0Cm26lsJLGfb8N9z9w8SeKHx8
         Yk+xvpjzhGm0Yr0HLfUZaAMvLNaCmS549gYF0Za0qKov7zGwRl+racr7CaOSq21BWnDk
         AoyQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794765739; x=1795370539; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hLexbnWyTvjn94KDBFaQzivLM34q5OtBuqgOMwsa1pM=;
        b=jvBkHUmRgDyruGcVIBqaCyLockn+Vemw3MO9UQy/hHG7qhfi9IobNMaLzG2l8o5bGr
         OYtUp5J+zFa4FGAT9Sd2CvsplhKI+lV7LpfYhgnvOvCWiuXIb6LUyO/SOI/nsCt08KWf
         ta9vT0N0/VpxqdL6fLh85gipah1RsGB1euwlrBtwY9jKRf/yRXWxKim4W68MsbXPZUHw
         NV5d3yzXwcN38i7ryrhWMhGSrutuMmTLSvGK7IvLNwMEnL7XsDKj8H2A18jalWSoMwgr
         mA7ts9Yblg5Dmat6zZBnzhX2bBl77W9yA9vVy1GjYrR15cqz9E0ivb+uiYnD8iopLmJw
         umCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794765739; x=1795370539;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hLexbnWyTvjn94KDBFaQzivLM34q5OtBuqgOMwsa1pM=;
        b=llEILw6tOmnqHqm8cpyIYYAYcjw5lu+dM/whM4DAklWomGArRP/vFS0bxg//23yooU
         Z7rKAu+hYDrnucrAFnaiy9qAfz0K74vNbdxF8DnNYDxo16YZPSiKrloAdFvCcExaAwMK
         uPfvieaWACHUiz1CO2qI4w3iOaiSE+BLtWH4jzQx0VZf678aOhxLw8htQXd8s56OB3ci
         Pi8rb/x0hqh4sp062LiyOhPpvsFM3ATnZSxM+4h52n2ko7Q4Od0VQytjKSC1Q3B96WSB
         3FQu8ismmROLpRtZk8XPDynik+H36xQ0H17VuveY7FVxacTY4AI05PUye9HPDEZH4VHZ
         k3bg==
X-Forwarded-Encrypted: i=1; AL+hErG4Tj6KK0nWe0Fud7koq0vdzuu/EL7SwcmRFosk4HWu4AP3wjwAR/6f5SmNWXXRGRyfm+BnE7pe32ujCEafNPIH@lists.infradead.org
X-Gm-Message-State: APuU4Z8jNCoT2QTbd1vij66vWtgnyvKsuZy2CEegxcsnwjbqovenLhnK
	ZpVLBqWcWtvFHe6uSk4kfX7kJcDCa1Hbzyms2iCc7/k4aYWGIppj5TKf92ls/zEqFeero+IhMw+
	+9+0r/KP+beq96m/E98+/X/197/yvtyA=
X-Gm-Gg: AYBFou0DpH4QFKaVCoanw1E0Iuu/gpN5kHKXJRvC+s9XSaUtIP1ynNpOUHwWOKWQYvR
	Hdb3u2OFNfhG6o7UqDuXDbemniO/zEx/JWmEEcELwOtO/6exwMAzxMqrMeeD4q62nLlU7MWHX9t
	bOLAUQO1P/ZIbscNTQ3eOYfEYi3kTxztGbBJoZjeajheleC3jv3leW0CpVd8dOivW3QVLw1zX2X
	4wgCGQ+hGRWuUN+0I0qU8wfek+gfuS2NNN1QqfJBHLOse3X20uyCMKXt6r9nZobTDVImGMPTVPn
	3doZUDOZeFjTNn+73NBBYEtoKFTW6QidCa9MWk6PC4uxDRkneoKlTK4UhP5aFWl+sIHu+UejqwA
	U4awhaHF9YzO+Z23TWQaYmxr1DQKQ0jyigfAKMSGgKWrPYSjKELyI6bWymJtGVEsrzLqDeA==
X-Received: by 2002:a05:690e:c8b:b0:67d:9fef:d62e with SMTP id
 956f58d0204a3-67d9fefe0ebmr2566936d50.6.1794765738737; Sun, 15 Nov 2026
 10:02:18 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261113121852.334604-1-tanure@linux.com> <20261113121852.334604-7-tanure@linux.com>
In-Reply-To: <20261113121852.334604-7-tanure@linux.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 15 Nov 2026 19:02:07 +0100
X-Gm-Features: AclHuK982JSfMQyLz3Nt-omny5MSefKP7dqRCWJKkI82T-Lx69OJ3UT6uTKWWOc
Message-ID: <CAFBinCBFfs85ZgYLq0Hbx-E22twLYMZztk3inRuRLaBB+MXsOg@mail.gmail.com>
Subject: Re: [PATCH v7 6/7] arm64: dts: amlogic: t7: add the ethernet controller
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
X-CRM114-CacheID: sfid-20261115_100220_264616_46A94B3A 
X-CRM114-Status: UNSURE (   8.27  )
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

On Fri, Nov 13, 2026 at 1:18=E2=80=AFPM Lucas Tanure <tanure@linux.com> wro=
te:
[...]
> +                       eth_phy: mdio-multiplexer@28000 {
> +                               compatible =3D "amlogic,g12a-mdio-mux";
I think this has to get a T7 specific compatible string (dt-bindings
only, no driver change needed):
  compatible =3D "amlogic,t7-mdio-mux", "amlogic,g12a-mdio-mux";

If we find differences in T7's mdio-mux compared to G12A then we'll be
able to manage them.

