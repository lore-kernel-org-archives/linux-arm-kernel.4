Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B086606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 17:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UE0snnOS;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uZV/uM4S
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Y9ebx/NeQHDJ2vvkvIEG+xSfxmCUF1LYcJcgNXG5cuE=; b=UE0snnOSgXHMY96glRIo+dYFCt
	9GmBD+0htRkTKwpr7vLlWNbPJDOfMT9A7LZ9Hn6ao+/Xc6bfMd3uoJaVORu1kMlLrAJyubpLF4abL
	IsYazdz+tc8IBMnTLfc7cZrVXmjvwE6VcggMzpnW6hPXc4PrVjYyFTbg2mihHGSbIZmYsAEBc3lso
	CGqWKW16rT1FUT7nZFbnWRrDf1AoigHfnaiEqUl0nb4vYGBJEgbyseDRdVv3b/vwKjM/lBvkAvpnG
	7uCoRYWOOWapUyfs3wkGQiMxovHegAlUcIujGhPX96NZvMDzMeCdSiTR8RXUUj1cBSAvU34otg/yN
	qUbRCADg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSdbp-00000000EaE-2U5C;
	Sun, 15 Nov 2026 17:01:41 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSdbm-00000000EZa-0CNu
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 17:01:39 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-49412eb1474so1239245f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 09:01:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794762096; x=1795366896; darn=lists.infradead.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Y9ebx/NeQHDJ2vvkvIEG+xSfxmCUF1LYcJcgNXG5cuE=;
        b=uZV/uM4S3G8cRxLpPLPN5vCPlYOseHheB+ut+f6H7GBAJFVmmOv9PbVs7+cFoLGLla
         0hOt8ZPgDopsbpJkT5s+sn6usE4vCXpjYacUC4eoSOZ8uku4uHFZ9X6tvs4sPtExaW8c
         PmyJvjjNa9Kcs1CEp+kVQpoXNpiVO4wTkhJXrfrT9qAN14RdHvEUrqrXrubiJEb0K+Eh
         MYRLoln+1nFrNlR/llYgbhXhyuHMIg7FZUn48ipmbygY7IxIam1z5LRb+9vM25NZFZwE
         BzOReQfwDCIB0xYdkrIGQeRSi1039iN+rWxPPZnep7UyhUg+fG6DSZCZkEV/UWEjfwI5
         BjFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794762096; x=1795366896;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y9ebx/NeQHDJ2vvkvIEG+xSfxmCUF1LYcJcgNXG5cuE=;
        b=UkAuh3mHEFN8VHET6kQ0x06dGrLsHqDrSDoLEQpyFZLtyoNJjl1fBvQRc5pcShc+in
         yfQ07UobKX4KHKwIomktp0hGdyBOsBqmwFil71ZJiGlNDuMzfPiqYCwyZ3bdEwqGyDY3
         E85L2Oz+LiclEeDsn4BtMzPhXshx4UzIRn7BgLkWB9fodeqnjicU55aVXc6HQvAIYDrT
         NZdCwtV/JCM/T0FKIZ6HabeZl87Wmseets8EwXK8twv/0as3+Cym7YFsPH/5XExfTxvc
         nGMrWYc+FnA9sNd5WRy44Wj3TlrL/mdqFmFBSzmtmim68i2FXe6kw8a4IE8z5ok++etW
         6nJw==
X-Forwarded-Encrypted: i=1; AL+hErHdtZ8vZVQJlVQYByxduWIkzvQ6n3MhIcgTDaS9frrGQjUbqHTqanwNvKc7hSgAOYCjgzezlHp14EP3UcoceZ+m@lists.infradead.org
X-Gm-Message-State: APuU4Z+AgN4QszKLwjqvpmDpTv67isKoPs5IXpa+od9o3/5nQ+wTa5u4
	T8D7za6+0pJqBlzoC17Roit0Q4G8xjNPE9ZsMABOBclP4VV2CDMjGwWq
X-Gm-Gg: AYBFou1xdBB+OI3HFRgVvPBAl/g41PWLkj0Ezf6HFW9oOFevofm8QFlLmMC+DkK0pyL
	koSDbDc5alRaL/gY0oxIf2qFn6Hwfu04DQr4Z+qOMuF/RJhtrHspsX+x9QZnqiE0Fz5ace+EIx0
	UcQXFNGyHiqM+aCMBvTVcVf2KG2yttYlA2FaGwDogTzxJaA7uujOt3iGEJ8hJYpejTKFrXWklZr
	uV6oFMVq894yqhpd6accRjH7acDDJb276vvFd61PdcE5D0irciovEHyklaEI6Ta7BjbDyXpVZTs
	as3Hv/2VLDo3ZIEkP18oWQG52xLd2HHj0MnAvJD5sFy0ohoWA6QXuVZSR36EQk8hZFwFBrnjsZG
	BnFrx+OElnn7gySueB4lGL2xdcB0il7Mfr12XqVWSfye1jn1zdDIYipYQjbVG5LhWNGCHhcv2nx
	KkmJLex8o8f0z7VzXfIQRsPDDKjgTNulmxxrmBDaGdT2k1skTmWbeLkNi9lduyNJEDjFykv9lNx
	pgg55Ovbe6rL0OANRe4Edr07jSSpSO9xj9WYCn3Y4cMrKJFkAdtpFo3JzuomelrdwFH9vc73uGp
	RHClfUCvrgGkxZ6CiSrk2k3DQrsk+tZN5ib5BVnHBkHecRW7nXzvBGAgbr4cODNoX7f+O7Zx8M4
	LXBCfWm+INXEVE/mebTEPyA9f7tucQPUO9TUT8Y9x49kWqzbekecFzmxngJBeja2pVPK/Z3nlLj
	UVfh+njsBCJGAuuEdi7BiJeCthVUF//iEDp2tpS0muAY6mfHRd9wgLHXfJ+ZOuqahsxlJ6FnFiF
	WmlY1Bka9q95QvceVKigpaH7Q==
X-Received: by 2002:a05:6000:4a1e:b0:48e:61c9:4e32 with SMTP id ffacd0b85a97d-49c72ab0820mr17765285f8f.32.1794762095871;
        Sun, 15 Nov 2026 09:01:35 -0800 (PST)
Received: from jernej-laptop.localnet ([2a00:ee2:6a02:9300:bb69:6bcf:1b11:e85b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49d69c21a17sm12650661f8f.50.2026.11.15.09.01.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 09:01:34 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: wens@kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Samuel Holland <samuel@sholland.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: allwinner: h6: orangepi: Enable CPU frequency
 scaling
Date: Sun, 15 Nov 2026 18:01:33 +0100
Message-ID: <hUUAMPreQkqgr8nLJGKykw@gmail.com>
In-Reply-To: <CAGb2v66acxKq7HR=p+ky7dhT03fTXct1_82dPXu5ebS-fYgpvA@mail.gmail.com>
References: <20261115132215.289236-1-jernej.skrabec@gmail.com>
 <20261115132215.289236-4-jernej.skrabec@gmail.com>
 <CAGb2v66acxKq7HR=p+ky7dhT03fTXct1_82dPXu5ebS-fYgpvA@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_090138_126498_C2CDBCBD 
X-CRM114-Status: GOOD (  19.33  )
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Dne nedelja, 15. november 2026 ob 16:09:23 Srednjeevropski standardni =C4=
=8Das je Chen-Yu Tsai napisal(a):
> On Sun, Nov 15, 2026 at 9:22=E2=80=AFPM Jernej Skrabec <jernej.skrabec@gm=
ail.com> wrote:
> >
> > The Orange Pi One Plus and Lite2 lack the CPU OPP table and CPU supply,
> > so the CPU never scales its frequency. Add both, like on Orange Pi 3.
> > OPPs above the regulator constraints stay unused.
>=20
> My review agent noted that some of the other boards raised the constraints
> when CPU DVFS was enabled. Do you think it's reasonable to do the same
> for the OrangePi? Or do you want to be more conservative?

Yes, I'll prepare patches for raising constraints.

Best regards,
Jernej

>=20
> Note that I already applied this series.
>=20
> > Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> > ---
> >  arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi b/ar=
ch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
> > index 40c5c42b347e..a2a2e4cb0256 100644
> > --- a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
> > @@ -5,6 +5,7 @@
> >  /dts-v1/;
> >
> >  #include "sun50i-h6.dtsi"
> > +#include "sun50i-h6-cpu-opp.dtsi"
> >  #include "sun50i-h6-gpu-opp.dtsi"
> >
> >  #include <dt-bindings/gpio/gpio.h>
> > @@ -65,6 +66,10 @@ reg_vcc5v: vcc5v {
> >         };
> >  };
> >
> > +&cpu0 {
> > +       cpu-supply =3D <&reg_dcdca>;
> > +};
> > +
> >  &de {
> >         status =3D "okay";
> >  };
> > --
> > 2.43.0
> >
>=20





