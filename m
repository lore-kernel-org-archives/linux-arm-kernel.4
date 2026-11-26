Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5157606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 17:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RdVCRTAq;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VE6eyxNB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=qX7hQvpKRLbWPJiO5CVxnjE3ZLRTJ3WKFWSTYSfxc60=; b=RdVCRTAqXcq+pPHtjzS/iqEGcb
	MM3KSp2PsYhZnTrg6Z3msGo5JcPkmQATG3ANcKAeQHhdNJIPqaK4apaC8VDqKqixmen10T8xRXLeW
	mEZFIYN1+sBBM7mtMVGymZ/4lxh8srqDzg1jtCtq9mtSE3MOVwwvjTMhIDabkfWRKhyzzwa0ndiKj
	kw0UGzqL2LJvmuP1JKsISf8IoImsW+d8BxX9V7AmtpAmoQNvyQ7sqdcqiE083LukxngZb/v6YDr+m
	MZJvhrRm0b6ie9lQoP+T6ViZnScTI42O+vrcZxnJxhFwvA2IMsvBMygFg4imAbFl9jLTekg2OrTFo
	JhnTDAEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWdOD-0000000E516-2DhS;
	Thu, 26 Nov 2026 17:36:09 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWdNu-0000000E4wq-3SKr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 17:35:52 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-492f0a1b685so5139616f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 09:35:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795714549; x=1796319349; darn=lists.infradead.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qX7hQvpKRLbWPJiO5CVxnjE3ZLRTJ3WKFWSTYSfxc60=;
        b=VE6eyxNBNd6p9PtyQwQOyQvJ0a8fq9z9uzPazfjEjkUkbETnyWUcHdnarffXE1wZqM
         9L3B2Jar24fl1X2EyQZo9vW0r1Ks9WLFJYxmU2tMb3h8on1Dne8qa8C7B83OmRMcHMko
         LN5KxBl0AlzGQeP+6wbPUO8tQqG/EWJiMubyIrTjseSNHD2IGVTuaZxFDURbTHOWCyDS
         BJcYaYnQwlOVuTjwhD+ekmxcaFE0Q8flBmXYo0/WmaZ7m3ySLls4ZDNo8nPX6mkse5rS
         oEqq3TKfLHnM+/kJnLpQD7a+K5Ojli5qUuWd7xd6f7yp/rjgMNmVK6S4Pq0sbr+Lq7zM
         Z5pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795714549; x=1796319349;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qX7hQvpKRLbWPJiO5CVxnjE3ZLRTJ3WKFWSTYSfxc60=;
        b=2Q0aG5G9gNPYSZ0HH3SPoR0XO5D9HALm/MrfU6Vhbf+ZI7J3mnaCwgDKzdAzNttQYx
         AK65s8JgsQzP2vaw9aAcuCe0KMfD6dIO42A7pvNXLLhrjWpAx5SSGvsiHk2Oz3Fjv9Dx
         Ugt5/4OdRCivo/+dYpKa6IkzvIDWRtsz92ZaDkqtPhWIXz+riKfKNka27GcvMaKnuO9p
         VjC7GjlVQZoPOBd6IHPhYCNrdbuHnXt4muT4x9Y17re8y/UV29E1ekgHA8JoxvsQklCl
         Fop+4E4Pg7W+Lkix09Av0ngmyutcR+U56x3j73IZoBkaEgii83FSHSY8w5rU8qLsBzcG
         DtPA==
X-Forwarded-Encrypted: i=1; AL+hErHFpRhptbO9mHwEgVA43hgdTk+oEICkoqKqz187Rfhq4ZU5Rwz8gZA2/GmsdFn1mRi7Be+4aafLW5AAy8hKdglK@lists.infradead.org
X-Gm-Message-State: APuU4Z8owpJdwwXICW1bke9rj9oWE/H/sf2WkIolmDl3ecKaVlkLBesR
	0Y8OF9C96wDjXHrXF9pX9O9kEcdhPUTGo67MM7uI86k3MUvzmIlFltJz
X-Gm-Gg: AZFdTZdLKDT9buaM/3P2XdLWLg6Uo8v7hfXlqPIAL9ulKUHXRVeam1GrwTwgpA7XiY6
	4BXOKWbWzqA98bQnRVUr6N/bhi74QmDqtCGayaE6xZtCLsCQtsBv2wMyJxb/dm1WPDRdotbKSxT
	Xy8KBYKcHlns+bNYXew8VOAQpHuWnJ13tLO6pcJftjxnPF3qSkTB7GrarluLICbBiMSeV68glGu
	GMObmac5IrbqUNqqXydKoKhvdxI/h7K3RT/5fEQMdIzc1RRxG0sOii+c9E8FWPWQNWJrl0sOROQ
	Iq9NwXykmHQO9aE5q2cZfe9Vh/MlD1SMI0J7DkY58WZP2K0YyfKRd0hvIeaA4OC811j1tj9YtYc
	ZbsDnkm3eYmIGJMhWqmQg0eaJ6nscqjb5QpEYQoAQUezTyvp6ymM+PiWQymSf23RkeYRrvmO2lO
	FGCQ/V0ig1PSsr8w9tT6UnB1/IPfhbKlO306MKAOQk1sdGxwN8UyhZLQeiiuyAn2W06wvXUctyW
	wDRBj2Pk6rUwqn3tsV5Zor2dpJuwEModeqyiUm7esuGw5WCngyEaeupH6OsRSvZQcdtm0tFU1py
	kL/44w8u8XP7PTCL4+P9YB3gghXO0zhp7m/nNWD14qQmCV95FKqppMNBxqTOcXEFsTcMnx2TqKR
	ztrR0ErtuygUm5nUJW7cJ0mLFp3l9O09MxHjfjPtr7xObZmMtnb9ZUsMm4Ba5M2ue48YGBnRGzU
	WqQeUNHtf6NRdxtZ3Kd7umdtl5qS2fF/5Qz4at/Aq4ph85qDB96yg2+S081jooTRUKBQjkmHKEP
	pXq/xOZFAgRqUUQYLVitjg3aRDcgMRU2rnp7ian0jTIEh3FdCHhyRLFBRiq3g8pIaL/1YTAzEci
	FWtYXE3w
X-Received: by 2002:a05:600c:4f84:b0:4bb:8701:a2df with SMTP id 5b1f17b1804b1-4bb88809950mr448141145e9.17.1795714548844;
        Thu, 26 Nov 2026 09:35:48 -0800 (PST)
Received: from jernej-laptop.localnet (77-38-7-250.dynamic.telemach.net. [77.38.7.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb90655f5asm397758825e9.1.2026.11.26.09.35.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 09:35:48 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Alastair D'Silva <alastair@d-silva.org>,
 Linus Walleij <linusw@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>
Cc: linux-gpio@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: sunxi: Drop unused parameter from sunxi_grp_config_reg()
Date: Thu, 26 Nov 2026 18:35:47 +0100
Message-ID: <AalbXD-rTNOJWAc97z7puQ@gmail.com>
In-Reply-To: <0defdc40-a96c-4df3-aadf-3c3db3c48b7d@arm.com>
References: <20261126104954.441427-1-alastair@d-silva.org>
 <0defdc40-a96c-4df3-aadf-3c3db3c48b7d@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_093551_118063_F43EB0B7 
X-CRM114-Status: GOOD (  19.38  )
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

Dne =C4=8Detrtek, 26. november 2026 ob 13:02:59 Srednjeevropski standardni =
=C4=8Das je Andre Przywara napisal(a):
> Hi,
>=20
> On 11/26/26 11:49, Alastair D'Silva wrote:
> > sunxi_grp_config_reg() takes a pctl parameter that is never used.
> > Drop it to match the original signature.
>=20
> Ah yeah, looks like a development artefact. It's indeed not needed, so=20
> changing it back to where it was makes complete sense.
>=20
> > Fixes: 8b367fc08be4 ("pinctrl: sunxi: refactor IRQ register accessors")
> > Assisted-by: LLM

This tag is deprecated and should be dropped in all patches.

Best regards,
Jernej

> > Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
>=20
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>
>=20
> Cheers,
> Andre
>=20
> > ---
> >   drivers/pinctrl/sunxi/pinctrl-sunxi.c | 5 ++---
> >   drivers/pinctrl/sunxi/pinctrl-sunxi.h | 3 +--
> >   2 files changed, 3 insertions(+), 5 deletions(-)
> >=20
> > diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/su=
nxi/pinctrl-sunxi.c
> > index bf4ec4665e2b..d30a562315aa 100644
> > --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> > +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> > @@ -763,10 +763,9 @@ static int sunxi_pinctrl_set_io_bias_cfg(struct su=
nxi_pinctrl *pctl,
> >   		else
> >   			val =3D 0xD; /* 3.3V */
> >  =20
> > -		reg =3D readl(pctl->membase + sunxi_grp_config_reg(pctl, pin));
> > +		reg =3D readl(pctl->membase + sunxi_grp_config_reg(pin));
> >   		reg &=3D ~IO_BIAS_MASK;
> > -		writel(reg | val, pctl->membase +
> > -		       sunxi_grp_config_reg(pctl, pin));
> > +		writel(reg | val, pctl->membase + sunxi_grp_config_reg(pin));
> >   		return 0;
> >   	case BIAS_VOLTAGE_PIO_POW_MODE_CTL_INV:
> >   		inverted =3D true;
> > diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.h b/drivers/pinctrl/su=
nxi/pinctrl-sunxi.h
> > index 7c2f29e75519..3060cef3705d 100644
> > --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.h
> > +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
> > @@ -328,8 +328,7 @@ static inline u32 sunxi_irq_status_offset(u16 irq)
> >   	return irq_num * IRQ_STATUS_IRQ_BITS;
> >   }
> >  =20
> > -static inline u32 sunxi_grp_config_reg(const struct sunxi_pinctrl *pct=
l,
> > -				       u16 pin)
> > +static inline u32 sunxi_grp_config_reg(u16 pin)
> >   {
> >   	u8 bank =3D pin / PINS_PER_BANK;
> >  =20
>=20
>=20





