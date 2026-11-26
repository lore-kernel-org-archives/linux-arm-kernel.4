Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B042A606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 12:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=J5Jba6Zo;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=r3MuLRzG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=HFgvhPWl12hpkYLquoqeQTH471RDc6o+6JugKxL60ho=; b=J5Jba6ZoH1q6bGJ5mh1NoO+xoV
	xJ3DXOSXXbyRVNK9SILkRhhO83RXOrK7oKArUysIOmJvDqJnwSxcd9Mt2HbRcv/4yYVy7LQFjH97Y
	VrJr3jtfZRtEc3HN0BcNcYn2Ec4kB5UJIHen+FHqfal4rKD0JSKik979JuNK+CQgcDnr4ctEiICTp
	+fPNnYQaH8FBFOODRPf7Q25n9yhy/SZJb/6TIaBdS7vQ3TWSLU0RiZz+MAhMxU1XwMHiMNRBn6+eL
	pZ743ONjoL+w7fc9Ouq+LdickVBjve7ScSDfWu0NL0MZYYMBdBf754S+L1PJsIUGZOrDvx816yn/+
	l/LVp6ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWYuu-0000000DEig-1kxb;
	Thu, 26 Nov 2026 12:49:36 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWYur-0000000DEh7-1QaA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 12:49:34 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-4a2f4ca0dcfso3997523f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 04:49:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795697371; x=1796302171; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=HFgvhPWl12hpkYLquoqeQTH471RDc6o+6JugKxL60ho=;
        b=r3MuLRzGFYWUZrG+38oJDMcpIH56vVjNa9IP99oEo+rjzdjfcx6up0FS03ZwPgLJah
         otetrMgOU9Gxenim0oUtNjPPR5repx2A/T+s0nvnzA7W9Cet6Hoy9s9PYv5RzhCikV0K
         BYtKmBeQtfrzK8OJxUzxljQnUnjbKfpzxWp7VHPr/s64ANb6dmfOgWHFU7R/fptM7IQx
         KNCaSZlCSjTLbowtA7nSc04CKibg0kxpzf2PYglimtJPbQw/HrdTy9pA7DIKwgk3BG+j
         TguiCBwFmG237YR3g8KUCEc4TG+KhAKyBIS51MSAPqkJYElHKcDMAoSfHSbyGdOexPkn
         wFzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795697371; x=1796302171;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HFgvhPWl12hpkYLquoqeQTH471RDc6o+6JugKxL60ho=;
        b=B/JB9dlMa3ijMG8AhfxKu0/QtoUza0sPt5RHxpu+bcMPSzkutCcZ5Mx7LnyaOiDNQd
         65OHSt329zhVWCCojMbRA29FV+awf1IVYXrujDpieD32PoJMnAM/bP0l9khqETZFzjE6
         /YqWhoF73e4VkndsrQvd/pKi1/4ITBwD9PK+KzEhEB9pm2ls68/t+uWeL6ImXDoRh5HD
         ihKiU1/PaaQ7D3lrIKXttyDXkS+lit6+Bytn76/BxNxXdUkExobfovmKEaWsCdAXIxCm
         ti7rGDvLWOAFpMqZG7aQL+lDWdDlyMROCjQgFbxUvyvas0yEQ+Sul/1aK3WiloADaL03
         t9Sg==
X-Forwarded-Encrypted: i=1; AL+hErHhpSvQRH3lh0w6XoAqi9hP07SpEhKDeP6Rg2940Ca08Ntkk7XhsDyCCLKUSAH/A4+wtQMfaCf9leSXOe+Ca8Bi@lists.infradead.org
X-Gm-Message-State: APuU4Z8Bu22saQlsq/+v1yvHiM7KMXUBnzeuDwr8x7C0uHw8fyeDvHbt
	ynbQlkU3/LZT5Wg7dVf4FhDFiVbpJRjd8+cRfJq9nWiVc7oKy9Bp7LrkuAQtI2accv4=
X-Gm-Gg: AZFdTZe4aUgozckt8WkIZWvZ1l+JmRoY1vJa5mzVbPV4jGKie5vnXbh+jBadvpAga8m
	GGyLNm6mKPDPHDXjmERNtiAyk8I24FIKWvc+mKCddpDaTP/sCnI3Mk5Gw7HkeLzXFkFlcM/cVTU
	CG1U9/JxL0/Js3sCWG4qcgAn+uwWA2C5iUfpGQLDklxVyxk9yxWunGmQOOKUIYiQuZe/LaJ1VVs
	ksWIU3ZSMa9o193XiWFxYSyOJCu8ZdwSW1VGSEF8QgDHJdZ7qJ3Xh9MkaBwX7S13LLJ57i/QzxD
	Cavsvb1+A1akNR9viAsVv4mrnRlDc4Qi72NKE+WWGJ0M3oUM85miw/Mph6aAaxMZAh+fFr+5Mmc
	KV6o9IYsbbbq4lqHcwm2CsAc32UXAn8R1dvMoiQCMd2kKisIWX3ryu3KrU1sTblItK5C3OdFuYY
	fW2csS4FtMK3g3OP7Tkk7Dtb0nsTUw2w54jkKeoB7xTrdMWkkzNhu5bJoFyGfT9J4/38VJhoI16
	xqvDhpFZ33HaWWP7AItFiR0CQkYJiI7N62qaSOMsnj+sk+iEln8WcYZMts0fA+A+JyH20as/DGx
	ihArIaB/LmHYep3y2/lHyX+jovaTtkBk6A==
X-Received: by 2002:a5d:4452:0:b0:48e:3767:d885 with SMTP id ffacd0b85a97d-4abb5bcd524mr32707915f8f.53.1795697371481;
        Thu, 26 Nov 2026 04:49:31 -0800 (PST)
Received: from [10.1.1.59] ([109.255.181.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110c3csm38969506f8f.36.2026.11.26.04.49.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 04:49:31 -0800 (PST)
Message-ID: <b1d73b2f842c8827e6a2a0ed6dcb1d0b979265b9.camel@linaro.org>
Subject: Re: [PATCH 3/3] usb: dwc3: Allow glue drivers to override all
 dwc3_properties
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Greg Kroah-Hartman
	 <gregkh@linuxfoundation.org>, Frank Li <Frank.Li@nxp.com>, Sven Peter
	 <sven@kernel.org>, Janne Grunau <j@jannau.net>, Peter Griffin
	 <peter.griffin@linaro.org>, Sascha Hauer <s.hauer@pengutronix.de>
Cc: Tejas Narendra Joglekar <Tejas.Joglekar@synopsys.com>, 
 "linux-usb@vger.kernel.org"	 <linux-usb@vger.kernel.org>,
 "linux-arm-msm@vger.kernel.org"	 <linux-arm-msm@vger.kernel.org>,
 "linux-samsung-soc@vger.kernel.org"	 <linux-samsung-soc@vger.kernel.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 "linux-arm-kernel@lists.infradead.org"	
 <linux-arm-kernel@lists.infradead.org>, Pengutronix Kernel Team	
 <kernel@pengutronix.de>, Neal Gompa <neal@gompa.dev>,
 "asahi@lists.linux.dev"	 <asahi@lists.linux.dev>, "imx@lists.linux.dev"
 <imx@lists.linux.dev>, Fabio Estevam <festevam@gmail.com>
Date: Thu, 26 Nov 2026 12:49:47 +0000
In-Reply-To: <b0b118ce86d1046d73fdbe297117f993df38cf20.1795559405.git.Thinh.Nguyen@synopsys.com>
References: <cover.1795559405.git.Thinh.Nguyen@synopsys.com>
	 <b0b118ce86d1046d73fdbe297117f993df38cf20.1795559405.git.Thinh.Nguyen@synopsys.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9+build1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_044933_405340_0D56201F 
X-CRM114-Status: GOOD (  10.91  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 2026-11-24 at 22:59 +0000, Thinh Nguyen wrote:
> struct dwc3_properties holds all glue-overridable properties, but glue
> drivers can only set needs_full_reinit and gsbuscfg0_reqinfo.
>=20
> Replace the properties value in struct dwc3_probe_data with a
> fixup_properties() hook. The core calls it after reading the DT
> properties, so glue drivers can set properties that DT does not
> provide, or override DT values, including clearing them, to correct
> broken SoC settings. Convert imx and ls1028a to the hook.
>=20
> Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
> ---
> =C2=A0drivers/usb/dwc3/core.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 18 +++++-------------
> =C2=A0drivers/usb/dwc3/dwc3-apple.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 1 -
> =C2=A0drivers/usb/dwc3/dwc3-generic-plat.c | 19 +++++++++++--------
> =C2=A0drivers/usb/dwc3/dwc3-google.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
|=C2=A0 1 -
> =C2=A0drivers/usb/dwc3/dwc3-imx.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 9 +++++++--
> =C2=A0drivers/usb/dwc3/dwc3-qcom.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 1 -
> =C2=A0drivers/usb/dwc3/glue.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 10 ++++------
> =C2=A07 files changed, 27 insertions(+), 32 deletions(-)

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>

