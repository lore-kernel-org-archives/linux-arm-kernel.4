Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3289F606A327
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 17:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=idhW8n55;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=hqyAjYs2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=z6EkiZTsrK4weHp4bp257FUTfMCYoyNr2SVzcxt+tW8=; b=idhW8n55fBMibM
	0hXN9ML6I8TYKaruuAeDanu+IGofO+lMP2NpGPsSRcNpkqQbRI0IjXswUyoq7RBfDV2cuJVSXKL7/
	m8PRbusPlmWjX/GfLjGyboKppdAicEQBzumkPo3zK7aWTxlxM0XvYpPX9iXV+Q905jNqiC3FJR0jU
	JicJRb8KrY78DbIaRWWgQAoNEkFthoz4XrA8npKOz7Wj71GunpNVRONyGGCDoJRH6vQl4Zvk+Jbed
	KLwA2BSICjJ3iiwEBLl9PTUn4kPSNm6Fin6I5v3idcANli60YG37Sx40NT9poWWxd/P2Ua+HwgXn2
	55QtRSQ4gE62gvufC35g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSeUS-00000000I1e-3tLN;
	Sun, 15 Nov 2026 17:58:08 +0000
Received: from mail-yx1-xb12a.google.com ([2607:f8b0:4864:20::b12a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSeUQ-00000000I0u-31hv
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 17:58:07 +0000
Received: by mail-yx1-xb12a.google.com with SMTP id 956f58d0204a3-67db35e7953so344083d50.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 09:58:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794765485; cv=none;
        d=google.com; s=arc-20260327;
        b=c00W78GrjFGyDn+ppd4BVvGctFESEzPu6ZD7ATiNJqKPfggdH4UBZAsjeW/TsHxlPx
         ESj4pJuLb6Uvj8Nc3eUF8CIgx/3UkEgMS1RQ0fkRzMv8n6kFBgtLCFNE19NlYvR66erj
         9ww+eYZ2R3xWj+3mBpg01nt3xb3OzTiy4afyRlPIpsQNhi4ggtrEoMVbtb6EbRlQrK9N
         3S/MfMXUY+V5gzd/y33ySQhwwJxPyEdf6TudZX6aJnTmhLIT/KYKhszAQIWMxmIwh867
         dD6r9ni516Lw/EzSEonJf9NfJRp0Eo2m9JJHFBWB3AeM5JGOahJIYzwjnXAcj0Lf9mbJ
         iAxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=z6EkiZTsrK4weHp4bp257FUTfMCYoyNr2SVzcxt+tW8=;
        fh=U/faAblipGwXyJ9fiRwGydXxyfzFAdvjickpgwf/QwA=;
        b=WExYuDJdOp+IMsRMXD+8xvoqd1JRFgWFYE94v0MiwrP0Ilh7DtohuVPsYAph5Qxojq
         gFCz7Xur3vvpjnArM6+cx3nNScsS5U9F6NqQ4Nyp0k+opPknIDLjIkmtEe207J6Vnm17
         qsiAoZ4h/00G4su/LIjsY+1Zce0rCBRzADk874Jh7AcN+BJVD3Wr5ljCtJ14aDuihjqY
         +zGFo9Z8Dfcs7MKknDfDR+gQVM2RmQqlhLBUSh63o8ddDFXhqwrDucaN9MiKicdMTWhL
         t1TD8MPRbOKy3eYLFMzco8TIEda9L9RIukFntr+Fi0glM35Oi+1oyvEtTdMitsO7dNSq
         f10Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794765485; x=1795370285; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z6EkiZTsrK4weHp4bp257FUTfMCYoyNr2SVzcxt+tW8=;
        b=hqyAjYs2ikFgHxLvIo1XpaV/oumK0VRwoFYy2ZraLwngAsrsr5fVwfcJ+5koGB110L
         IzLNX16m6+rX8TJMIykOi6EefpzZe9do7f9hx/63A5ei4ayMnPiIgBegsi/p8V1h1Kx9
         XY7ZkCokOOXV/SOdLPzwUPB4BbM4P2x4MYgpQUK4DscewrYIRjr0zTBP0uZ9290+PQ/a
         GVe7wFDz9XvuwNN2Tq/FhiuvxRXwSu9ALrLHB7yDgoNS9wFlQP4lJnDAzd1nngO55bt+
         byKjnoztCYoQZEkfWGP4wM0OMshXLawiAvXRas5i0mv23wIpInJeZv59XCsmunrxyIKu
         ML1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794765485; x=1795370285;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z6EkiZTsrK4weHp4bp257FUTfMCYoyNr2SVzcxt+tW8=;
        b=i+dB8DqkDLepz9uDXwYlRsmt7grAmrmblVTzgTcw3LQBWptWSB1O+ICzccRIz4RoAH
         ec/ezFALlYILosZ21qrZrBwFYcvvCKaksdHzbYlXXK9iXglNNWEz+a6+b+3IhybsXF2c
         wjOqapL+WoA2myYVGTwLizJ8Dkb79ui1umRd2dAhp23bLYXUQXR6t6QEorYX7TdkOKLP
         Amhp516uF82vTpKXGeGoxBnnPkm3aMB+EQGkrTwOE49mev6s0sqoI4f3XLSdrcm5L80W
         f6inswFgGVx36BtbhZs2RBHOLFht/yDT9PAUpH4eHZec7PIxFIL7jJ+dWV8BNgmz7uqQ
         3e3Q==
X-Forwarded-Encrypted: i=1; AL+hErGsw0F3y25+8EkocwosYoo188PdM46szix9IIKamvsc1+f1ImX2ztddk+aQjnG4h4EJp3nctA1ddSWaXkSxlYZL@lists.infradead.org
X-Gm-Message-State: APuU4Z/s3kOLVXTGWsIg13kpbOV2yRVTVk8y7wQNZTGXouz8EeMOKs9k
	jNmHhT3ZdIxRgeipOj3fa1eWMhk0XJMgm9PTBZiJgPQK/J+NhDSStmal7rC3AEQcYOWWFweEJxE
	S1g21za+dvANQkmsxcfDVsScENfa4Ba0=
X-Gm-Gg: AYBFou2P+BV57sIQea+t1rTz2Lt+VV9DgxfZN0UtxjlHLw1AvAU7qiZJVzgMdvZRAYM
	Y1+FbNqeZFYaXh1o/GRdmWfDWTUxmKEJI0RaKHFt3QDN5DiYguEtJowzx/mNJbmXS7NsoLZlJn4
	2BTxQPBCsm2/1wnMwrwZ4srlX99WygvzcLKEmhFENS7NAjTo3s9x+tN+hsMKbqAKlCYHgazAgVU
	6XPBZ2lD+jG3whZgYmZYHc78bPJlVD+UhFl18bY/f2cl4Lt7S44iUNzou1X3uOImfvsryKiNk8m
	oDuinyXxC5n1qR7FSt+VxnoTj1IRe0GHlYNxCCtmLuMqu30p1riPUVaPavh6PJHpta7jwqeX1Xv
	lSmHbLv5y8t1wMsBTvzz9de0C8s5SWGg+Y0ojenK2CJe2vppH4lqrvkCJkSZlqhN/Um9pog==
X-Received: by 2002:a05:690e:803:10b0:679:af57:d19e with SMTP id
 956f58d0204a3-67d89661b52mr2605986d50.45.1794765485479; Sun, 15 Nov 2026
 09:58:05 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261113121852.334604-1-tanure@linux.com> <20261113121852.334604-5-tanure@linux.com>
In-Reply-To: <20261113121852.334604-5-tanure@linux.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 15 Nov 2026 18:57:54 +0100
X-Gm-Features: AclHuK9m7YW9F8wMPiMsA7yThjtGjePZoU8lN6bMh8Ee4d6dZkum7e9qCRT0s2I
Message-ID: <CAFBinCA7XhksQaTHoGP3jCCeSCBdwAYgamW2AfPTdK0ncSCzCw@mail.gmail.com>
Subject: Re: [PATCH v7 4/7] net: stmmac: dwmac-meson8b: follow the generic
 RGMII delay rules on the T7
To: Lucas Tanure <tanure@linux.com>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_095806_761237_7E3A0F8A 
X-CRM114-Status: GOOD (  12.79  )
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
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 13, 2026 at 1:18=E2=80=AFPM Lucas Tanure <tanure@linux.com> wro=
te:
>
> The delay code reads phy-mode as the list of delays this glue has to
> add, falls back to a 2ns transmit delay when no property asks for one,
> and takes the vendor delay properties. ethernet-controller.yaml says
> the opposite: the PHY adds the 2ns delays, and the MAC properties only
> hold small fine tuning added on top. Every board in the tree depends on
> the old reading, so it stays as it is.
>
> No T7 board uses this glue yet, so the T7 gets a path of its own that
> follows the generic rules: the receive delay line is fine tuning in
> 200ps steps, and the transmit side, a quarter-period phase step, offers
> none, so the transmit property is refused.
>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> Signed-off-by: Lucas Tanure <tanure@linux.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

