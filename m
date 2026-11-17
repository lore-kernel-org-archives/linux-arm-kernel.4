Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53453606AF7E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 14:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uMzSIVAI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=p7ojMjj4LC4SS1WElXDJT7WyRei5tH4ru8glaxJTYq4=; b=uMzSIVAItPaf8W
	puDU4H1fHaNz9nl/O0jPSudJV+pAVjGJ5doM/GAl2MIcdvVBfODFGI5fjnVyn/yoaNPBEUdHss62m
	NmIZteI6qZ1s7NNqY+hmP6+q3Jf4cHSxvk1XsdXFli4B+NBKJGtIiqYPyRmTkCPRT2nEV2XqPl141
	51/tMIxbA+OQh1j0sbCTxm37Og/EaqJAnzc1x/vwui7sPV4XHRsIs6p7QA/1w/uH44fOoqAAOam6N
	q2TZgpH4uJOPhrbWCyCH2s55OAJGcIeKm2TwkkcTEPI70fERGmO69SpheYg2zO31FeEWzcs2hQUek
	Zd/tSKAejmhJVmpGffwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTKHT-00000006A8v-2baO;
	Tue, 17 Nov 2026 14:35:31 +0000
Received: from mail-vk1-f171.google.com ([209.85.221.171])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTKHH-00000006A5T-2JqQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 14:35:20 +0000
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5ea969fafeeso1466902e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 06:35:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794926118; x=1795530918;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p7ojMjj4LC4SS1WElXDJT7WyRei5tH4ru8glaxJTYq4=;
        b=tTl1VqnuLc3lJtDJ40YlPTdDds+nSKUqnlkNAfg832g1yI1EEri0Szgyes4EJxjMtB
         jnA4GrHu2wE3nWpuopxCittc+DR+aQT8V+Ejex8naGqJhFrdG6LG7EuRmDcasi9+iyg6
         nUcfH7Gl1KPfvy5mCO15BZ5vJO47u/taFexZO5EdFgYDumhyVJoDJ82R6NlVwTMwpAVf
         CdfhCJxxrSuViwmzcckjCAcgJgnnlTzcMoa7xVZZT0UIagX11t99V8/SbJRRM7sDL9gD
         /kgvU5ISXOeDgtKkhb1SuC3oJChsiTc/fjR5TNj8dVKYRBpkCmTe/iFKp0gIqBp0pmab
         xFNQ==
X-Forwarded-Encrypted: i=1; AL+hErHsZCm/ncK6Oh4sJB/xh8sWNXSIXbLubBGSm1HRB1ip6MGYKS+IxxxcIUsGKwgg122GSt7TM5OT8YtlorcG2hlF@lists.infradead.org
X-Gm-Message-State: APuU4Z8UQ4f9wxGPuxjAdccNQZbtiEjdxRyNY1GeGDlWJXmZDjpX4THa
	LzHL3jI/0yK338DA4i317sBy0R7GubBvs1Jc2KIZgpJqS/9DtRR5iv1MoLGf8XGQ
X-Gm-Gg: AYBFou2KKn3DIWw0B0KD5HPZcjMyJCK7+KHgC2hDUFBp8wNfvISsnc63UjGOgJxQRjQ
	AZgno7//0aMiIKqsDjifttVEyNtjpyBPbjffFYOEBzEJ81XRfTgMsa8Ww0c0N4Ea36qk7IoXb5H
	kZgsQW4VCbLCctEPCt4SJUSfYFNDWggg2OjYzACuj3SahX8QKRdQ8XjikYvmp4lYLtOmULnVdS5
	ytiFzh4uEQXHWo0fNnnFX61Yt3FAPRWPdC8W2Rf3Z9gKN3R3ilP6Cm+nTLu31w/BamoolnQxgvz
	METkdfgAQEsRpHjvbe2fI2+lV4NSc716THo3U6m/JrKQM5hPzt9BcpZ1avVLAy3x2QSHvYwxHPE
	amgobHj/PMBXiUfyTwG8fEC2ixhkv7xxbSjiPw8PYAoNjyznKeJMnpfv1uAPlPqsaYP3Iv5U+l9
	xdF0G9e/H50m8/H90ri3f1u311XbtbY44vQBwRHiljTLll/HbA3vVQ2hobq5+NkpCEVm40vetp+
	wL4SMIHnUiRMDQ1shBKMzWiKabGvPIkDvcY6toGSeF+Denh76eQdEHTS+96o4S0wTtWAmJEUqF/
	8bGvV7gyX3W/MppDwUvfvI4gu1oOF0OiTdo2bws+Lkg+WqlkaE7zMdLtaFJBOfEn/05bX2zTTaC
	iZXz8RAWwobUl
X-Received: by 2002:a05:6122:1c0d:b0:5ea:c51a:37a1 with SMTP id 71dfb90a1353d-5ee34a45534mr4137624e0c.8.1794926117760;
        Tue, 17 Nov 2026 06:35:17 -0800 (PST)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ee34e5e51fsm9149525e0c.9.2026.11.17.06.35.16
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 06:35:17 -0800 (PST)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-77bf892b496so1467266137.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 06:35:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErF0TA8ZGi0VKY6qTYDmVkT/dZzEdTx9Ny7LeW0SoRYx0dPLTBNon8FQISpnFYRFqLifUJ6vp3QijMAlfVwDCRQ6@lists.infradead.org
X-Received: by 2002:a67:e118:0:b0:7c1:bc57:c7f5 with SMTP id
 ada2fe7eead31-7d64d69de8amr3553023137.12.1794926116643; Tue, 17 Nov 2026
 06:35:16 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261113-clegoffic-pinctrl-scmi-gpio-v2-0-faccb4685d88@baylibre.com>
 <20261113-clegoffic-pinctrl-scmi-gpio-v2-1-faccb4685d88@baylibre.com>
In-Reply-To: <20261113-clegoffic-pinctrl-scmi-gpio-v2-1-faccb4685d88@baylibre.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 17 Nov 2026 15:35:05 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWwp4RtKnBpFNJPHdigzrQ-wf3yt-pBZGG9QKs9tcd_Ow@mail.gmail.com>
X-Gm-Features: Aa3M54qy9_Rj7xaMwVGFv3qcI8VRtXgzHIP9TNCjd9LuAgCDDCHrVflQc6VrO_I
Message-ID: <CAMuHMdWwp4RtKnBpFNJPHdigzrQ-wf3yt-pBZGG9QKs9tcd_Ow@mail.gmail.com>
Subject: Re: [PATCH v2 01/11] pinctrl: scmi: send the drive strength in microamperes
To: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	Linus Walleij <linusw@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
	Oleksii Moisieiev <oleksii_moisieiev@epam.com>, Andy Shevchenko <andy@kernel.org>, 
	Dhruva Gole <d-gole@ti.com>, Bartosz Golaszewski <brgl@kernel.org>, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_063519_600548_0C4F05E0 
X-CRM114-Status: GOOD (  24.91  )
X-Spam-Score: -1.6 (-)
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Cl=C3=A9ment,

On Fri, 13 Nov 2026 at 16:02, Cl=C3=A9ment Le Goffic <clegoffic@baylibre.co=
m> wrote:
> SCMI gives the drive strength in microamperes, but
> PIN_CONFIG_DRIVE_STRENGTH is in milliamperes and was sent unchanged.
> Convert it on set and on get. It is the only unit that differs: the
> debounce is in microseconds and the pull resistances in ohms on both
> sides, and every other value is a flag or implementation defined.
>
> Fixes: eb524cb651b7 ("pinctrl: Implementation of the generic scmi-pinctrl=
 driver")
> Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
> Signed-off-by: Cl=C3=A9ment Le Goffic <clegoffic@baylibre.com>

Thanks for your patch, which is now commit cc2f90768e971bcc ("pinctrl:
scmi: send the drive strength in microamperes") in pinctrl/for-next.

> --- a/drivers/pinctrl/pinctrl-scmi.c
> +++ b/drivers/pinctrl/pinctrl-scmi.c
> @@ -14,6 +14,7 @@
>  #include <linux/scmi_protocol.h>
>  #include <linux/slab.h>
>  #include <linux/types.h>
> +#include <linux/units.h>
>
>  #include <linux/pinctrl/machine.h>
>  #include <linux/pinctrl/pinconf.h>
> @@ -155,6 +156,14 @@ static int pinctrl_scmi_map_pinconf_type(enum pin_co=
nfig_param param,
>         return 0;
>  }
>
> +static u32 pinctrl_scmi_map_pinconf_arg_get(enum pin_config_param param,=
 u32 value)
> +{
> +       if (param =3D=3D PIN_CONFIG_DRIVE_STRENGTH)
> +               return value / MILLI;

Does this need rounding?

While MILLI =3D 1000UL is correct from a numerical point of view,
it is not correct from a semantical point of view.

<linux/units.h> has:

    #define MICROWATT_PER_MILLIWATT 1000UL

In the absence of a generic conversion value, "(MICRO / MILLI)" might
be better.

> +
> +       return value;
> +}
> +
>  static int pinctrl_scmi_map_pinconf_type_get(enum pin_config_param param=
,
>                                              enum scmi_pinctrl_conf_type =
*type)
>  {
> @@ -167,13 +176,17 @@ static int pinctrl_scmi_map_pinconf_type_get(enum p=
in_config_param param,
>  }
>
>  static int pinctrl_scmi_map_pinconf_type_set(enum pin_config_param param=
,
> -                                            enum scmi_pinctrl_conf_type =
*type)
> +                                            enum scmi_pinctrl_conf_type =
*type,
> +                                            u32 *arg)
>  {
>         if (param =3D=3D PIN_CONFIG_LEVEL) {
>                 *type =3D SCMI_PIN_OUTPUT_VALUE;
>                 return 0;
>         }
>
> +       if (param =3D=3D PIN_CONFIG_DRIVE_STRENGTH)
> +               *arg *=3D MILLI;

What happens if the result differs from the original value in =C2=B5A,
due to truncation or rounding?

Likewise about the use of MILLI.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

