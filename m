Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB3BB606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 21:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tBND6Yt0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=vLPdwXc/aJvHEChEYmLlCcJA1K0ap0UNibPU2Yd3+IU=; b=tBND6Yt0AihJe8tCMHlA/T7ndd
	1/sw+JoZ3qp3K2pzaGp+rDzqxIe4w+7LNJUkZWk3NUARXyaXSeraE7xkaMwHupLDNN8VSOMdWJFAo
	01dqItB8otypzqE8gAKT3SJ1oaOSHwU9FGcSFPg2TFTdv2hp45sAefocTzfq+RH/F3y3brRW9VIYU
	PUS8FdcKkGL3eWghmWUuXlRi0dn/fXSm08vQXdbW1YU8qbeE2bEXeJDz83TUNduRzegUfCyAmgw9e
	nMPIcac72qEH05xuUQZMULEAgHzHnR6TiTP8MRBnaRpJOaxJwEr72ldTfb8BpKm951wzmeM+dpec4
	lc7l8xdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUsc5-00000000L3T-3h7S;
	Sat, 21 Nov 2026 21:27:13 +0000
Received: from mail-yw1-f170.google.com ([209.85.128.170])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUsc2-00000000L2d-3f9z
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 21:27:12 +0000
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-8b4c685c751so17888267b3.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Nov 2026 13:27:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795296429; x=1795901229;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vLPdwXc/aJvHEChEYmLlCcJA1K0ap0UNibPU2Yd3+IU=;
        b=e3EoOuL40sxoOHvDn6+X62NMbz29kr/GDdYajNBA4BgLS5wRiNBeaDbKfLdcmj+2Zl
         Wq85WvgEYO+YRo7yCKnCjwyx+/NpRwfy1O5cdUl1VtBmJUX5eZDjkUNmYtmmTHLg2msM
         vb7oO+AparWj3yJBCEfObKwHy9NLQNm+Y6UY4BFHgUNjESTrtq3/zqGrT/+pRaZ7MykM
         o8X6LtKrYP1clIYkYpHroqOokn3XhMK3h1mzOucocmNn9pNNBvoub/BnY9HAmLHNtg2i
         37hgiQV4II0eILGjkHDlDNavLpgRWbNy5SxBk4aXg7NsGTlv3OZQuekZIY4buJm7zI8A
         BBRQ==
X-Forwarded-Encrypted: i=1; AL+hErG6ucbg1J66i4uCa9Kclpq+a3FORrXyKmM+GtBH0YGoL2IeB8zWnG5YVvF0XSUBlFRusSWreOIGQpD65q8A/1Rt@lists.infradead.org
X-Gm-Message-State: APuU4Z8HpTSaAtkYfILYpf9gsG5CW+lIVOKs1qe8hWA9vv9RcVhs909Y
	Yt9wKeGYp0gp4NJbLON13wDl78t6RYXiP+fDXdjm90HNHNQUn13c1icsXKcplnsy
X-Gm-Gg: AZFdTZcPUpL4fWoMLr6/7cPqxCbnWM7JZEmB7krIB7ijBLT52ijDxUpUoQLYJzPFs4c
	ReGlETh53tm1ojX+Wm7Dqt3/zRHKqRxKfdomxv9g2OOODMLRIdJtRN54pfzcFaw6KjJfESsL2Yx
	A2MWVegU/OLlyq7NpJbD/Lz7RSsS6LZa41LvmhU8ouXmDGYnM7STY5MHiOd0c2P/soGNLWQ2+Ue
	U7ng/CgM+4JmNuvNuzrfSBv7qE/FmhxkqI20coCgq1zAUTTWtuH0IzbXnUktDSlpiryuy0L/1VX
	wJ6ripEcmuFB5ngQGyxwyZSVxkq8+/nzt0sqjeI7g+atH6wmK2R82eShSsrONTTWR91PhhMp6Cl
	z5IrDJ9rK3LA6akp/bdNxBVOTsEll5JeVBzeYhXdvUlnHfxyTCwHCQ0xK6OEFCruY0NItS7Uguy
	Yt7Jr79cQoeV5dUH2qa6IeKzUO7eOCaBANOO+hwS1qq5GcJkSUdnou3+lw1JDsAXN9rh4IkRKwc
	4dKQ8qV7xgVN3SVBU7DuiPPvXlgU1lQy95773TuIzv4al4ZpmkUFB8Sv1uPcAAd+rGyUHVJDZej
	8Z2Buuj3nKX5vg4P7lmG40BCP/agl65y4g9T56laJvBLBDcvUPiq5np3yEVWIqOK3g==
X-Received: by 2002:a05:690c:4a09:b0:8b4:b5e4:e774 with SMTP id 00721157ae682-8b52031c62dmr24558147b3.4.1795296429606;
        Sat, 21 Nov 2026 13:27:09 -0800 (PST)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b52030d5c3sm28738277b3.32.2026.11.21.13.27.09
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Nov 2026 13:27:09 -0800 (PST)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-8b4c685c751so17888197b3.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Nov 2026 13:27:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGCTHE6HIsDlEm7b/IRMFgXiIFfO/LOyVy27CTj4F6zuDYxi09Rr2Fu83OB3ek/aaR1dH2wWHP5mCNoohxsv4Xg@lists.infradead.org
X-Received: by 2002:a05:690c:6c92:b0:8b3:7782:675f with SMTP id
 00721157ae682-8b5204bb6b2mr23239647b3.66.1795296429324; Sat, 21 Nov 2026
 13:27:09 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261113121852.334604-1-tanure@linux.com> <20261113121852.334604-7-tanure@linux.com>
 <CAFBinCBFfs85ZgYLq0Hbx-E22twLYMZztk3inRuRLaBB+MXsOg@mail.gmail.com>
In-Reply-To: <CAFBinCBFfs85ZgYLq0Hbx-E22twLYMZztk3inRuRLaBB+MXsOg@mail.gmail.com>
From: Lucas Tanure <tanure@linux.com>
Date: Sat, 21 Nov 2026 21:26:57 +0000
X-Gmail-Original-Message-ID: <CAJX_Q+3eB5K3UjfPHnsD8OrCg6GA8zOLWVdfFONFT_aociTCrw@mail.gmail.com>
X-Gm-Features: Aa3M54q0-4I4quSKRWB1j7w8Nv6x5L8DyHdNe8I0CVnAIjNuxS8ecYBkoD_MhLQ
Message-ID: <CAJX_Q+3eB5K3UjfPHnsD8OrCg6GA8zOLWVdfFONFT_aociTCrw@mail.gmail.com>
Subject: Re: [PATCH v7 6/7] arm64: dts: amlogic: t7: add the ethernet controller
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
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
X-CRM114-CacheID: sfid-20261121_132710_913666_EF5B5EAF 
X-CRM114-Status: GOOD (  11.27  )
X-Spam-Score: -0.8 (/)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: tanure@linux.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, Nov 15, 2026 at 6:02=E2=80=AFPM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> On Fri, Nov 13, 2026 at 1:18=E2=80=AFPM Lucas Tanure <tanure@linux.com> w=
rote:
> [...]
> > +                       eth_phy: mdio-multiplexer@28000 {
> > +                               compatible =3D "amlogic,g12a-mdio-mux";
> I think this has to get a T7 specific compatible string (dt-bindings
> only, no driver change needed):
>   compatible =3D "amlogic,t7-mdio-mux", "amlogic,g12a-mdio-mux";
>
> If we find differences in T7's mdio-mux compared to G12A then we'll be
> able to manage them.

Done in v8: a new first patch adds "amlogic,t7-mdio-mux" to
amlogic,g12a-mdio-mux.yaml with the G12A string as fallback, and the
node uses both. No driver change.

Thanks,
Lucas

