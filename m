Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E753E606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 20:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Orh3ok9q;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ejCUbVr6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=mcrqEIFHLvK+/DOQFdnjy8iLkd+vCgdIQ6/JpqUs2/I=; b=Orh3ok9q/s5ED6
	LrVoCIK2K7Xt9EXUlxWzE02m4J0E2OEjaiYVziKyC2qHvmidy7Xp2DnPIaX5nmv2A+c5kLEEq9Etx
	HH2mFuuDbAIYHEIc/iluyH1Rejg4hYfykGXZ/XGPJysTFhYNmdDJ7w3MNehOuslv6tIW8rkYLxxFW
	65S6+fLJtF9N9XHp7F9jNDobOvEZBp7ZPfYpR6CmRgN5986hqvCsSX6UFDh9rcal6VjY3VgTYgWAS
	rsHpOTmtGS+SknjqfpRXCQ9V9gUK2wZ+4BdctDGBsQRIBJEm6ofYw5anLRCL3Kg+4+CmeRJWkwUTC
	T+rN46ELkfz59ATv/bRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWJgK-0000000BI0A-0nEi;
	Wed, 25 Nov 2026 20:33:32 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWJgH-0000000BHzU-16Vh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 20:33:30 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-6b596afb4c5so7362526a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 12:33:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795638807; x=1796243607; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mcrqEIFHLvK+/DOQFdnjy8iLkd+vCgdIQ6/JpqUs2/I=;
        b=ejCUbVr683auuwG67C7MxVgLYh/zW/knVn+tTAM1RL4jStowPgkA0o7J+fYYUzezTC
         NJkF4WTM6ksRhIQlEkCChrUXMd/zb/7MGKXtVqv8z4O546+yVL7csdhhS21uNnYFww3Z
         XvM6yMBvzSDO3lLM69SKO+APaAiF0shKOyV+g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795638807; x=1796243607;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mcrqEIFHLvK+/DOQFdnjy8iLkd+vCgdIQ6/JpqUs2/I=;
        b=MtABItAJ2LZhkNXCtmXPQS4D4JN3C+k+LVU1E+YwCXf/xjty8E3BRf8bgDdH3WxKio
         i0FG2QhNyrSVAEpHy+PWeWfNnRnGg5Y4hXU+GPw/EkxRYMonRV3tihHx0YQ3knd7SURZ
         hH/KWaRZjSIYIaCC4R8RJtb2xvBxrA8DgrsYgs1DekGF4ct9L4uzZLVGmPgRa3gyDg9J
         q1LTfJS20C9ywHNjODkn2xdMSJ/Oj0wOYfeUzkbYWmRTvVsET08VuTrO69Y2C6ezfArQ
         Lb3xhLe9jg+oCoaZbHWC1Fg0ZbgbuLufhEOvOH//dkX6GoWGyutKuP4jZlFla47Sov+U
         SIeQ==
X-Forwarded-Encrypted: i=1; AL+hErF+CV5vG1FYemjST0Xbf2VoKUB1DeouCn+w4BdVpSYqHo8FJnwxn243KDPNsGHP0hp5w43KAZJbhz4qnGcAzYRF@lists.infradead.org
X-Gm-Message-State: APuU4Z87OBJ2Z27dHW9eeUR19Yt00H8sMlvHinESH55eiO67MY6sd8Dz
	doXkW0bbKMlObMtocSG/PTttarnO/aFrXPUUzvtavw119y6354YS+YDtVy24yBg5JKqeA+VmPlX
	JXTO4B8ot
X-Gm-Gg: AZFdTZflOZ9M1cy53mvpwKHCEuFPyCVAxg5VAMSK2NGSCvSUN55WQxirSw743Q6vkIQ
	lfVx+aRuSiKd2R15VteCek5DoOSvBFfIMqKLYF41tYP/O5zfU1A/KFC52RpV3PuNVmjzHv8n5Ie
	g49Bv9udaPDKw8eA3pf122oBTw3lKJuZ6zMjEQU/a+k7Z2k/6EUdeOqwUcQMz+Wa6CmDFia5FN3
	Gv7/lnKMP0Jywxvi304/PGZInHU7kFPE1CMs2DnSWuqHtMnThrjZ36nINskhAo99So/203cPaML
	cJs/V+spzUCMrMfCp7647fLkizSCcLtINkAqbG1L6+ngx9zlNMdANqaNaz1fDs1YM+hxCIxCfAr
	T6N2kb8axubHqxhWg1Lrcw+N6uF3VvOKFkkXh4xt0YwK5zqS9nrma5UVQd0I9zpBDVElSc6bc/+
	WjvomoVjVKpJqetJ/RUtrQm1PkYd1sVcO0q0il4AqAxF+sV0SHI2i8LW17EDW+5lmSiZ4AA9cme
	JOjktgHFd2In056Q7uJNpShy8AY5IcnGYoQSGzpjDgcv0IJLZbRVUX+14tb355BnDfTupLwdAoF
	Kjfta1f2E0DaZeypnibYyuiNvHFPZNiTkn6kq1d2JpDvSMBICeVEx+MiTsVyD9lzfslO
X-Received: by 2002:a05:6402:a592:10b0:6b1:da03:d01d with SMTP id 4fb4d7f45d1cf-6ba37ebfc70mr10160294a12.34.1795638807034;
        Wed, 25 Nov 2026 12:33:27 -0800 (PST)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com. [209.85.221.53])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6bb07844211sm2442634a12.6.2026.11.25.12.33.26
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 12:33:26 -0800 (PST)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4a68190a2a7so5169242f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 12:33:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGohs3bC+xXOnxyuJDv61n4HNjCcNNNZiptgNLp2szySe3kXFrEKVBHFKYSJgbSoI14yZsLfgO/v6BgggLg0b4O@lists.infradead.org
X-Received: by 2002:a05:600c:a4b:b0:4a1:dade:f049 with SMTP id
 5b1f17b1804b1-4bb88806292mr393435495e9.15.1795638373083; Wed, 25 Nov 2026
 12:26:13 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261115180147.1208082-1-vamshigajjela@google.com> <20261115180147.1208082-2-vamshigajjela@google.com>
In-Reply-To: <20261115180147.1208082-2-vamshigajjela@google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 25 Nov 2026 12:26:01 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VLjPe1U_6LOtxZO=Zkc0sRHH+28PgYVqyCGckEJ=nAtQ@mail.gmail.com>
X-Gm-Features: Aa3M54oEC-In_bkVrLr1h65W2jhYWlRAtlpUDztwO3IbOK5jMmWhEITpomu3qyE
Message-ID: <CAD=FV=VLjPe1U_6LOtxZO=Zkc0sRHH+28PgYVqyCGckEJ=nAtQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: spmi: Add Google LGA SPMI controller
To: vamshi gajjela <vamshigajjela@google.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Peter Griffin <peter.griffin@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Jim Wylder <jwylder@google.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, google-soc@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_123329_336955_7074044D 
X-CRM114-Status: GOOD (  16.41  )
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

On Sun, Nov 15, 2026 at 10:02=E2=80=AFAM vamshi gajjela
<vamshigajjela@google.com> wrote:
>
> +allOf:
> +  - $ref: spmi.yaml#
> +
> +properties:
> +  compatible:
> +    const: google,lga-spmi
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - resets
> +
> +unevaluatedProperties: false

Looking at downstream usage, we may also want to add:

power-domains:
  maxItems: 1

Since at least some instances of this IP are power-gated by a domain.

We probably also want to add:

interrupts:
  maxItems: 1:

Even though the driver can work with polling (and I guess that's what
you do now), the interrupt should be wired up and the DT should
describe the hardware.

Neither of the two should be listed in "required".


> +examples:
> +  - |
> +    #include <dt-bindings/spmi/spmi.h>
> +
> +    spmi@14853000 {
> +        compatible =3D "google,lga-spmi";
> +        reg =3D <0x14853000 0x100>;

Should the example address match an actual instance of the SPMI on
lga? From what I see, it could be:

reg =3D <0x3a1b0000 0x200>

...you'd want to update the unit address on the node name too, then.


> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -25243,6 +25243,12 @@ T:     git https://github.com/cschaufler/smack-n=
ext.git
>  F:     Documentation/admin-guide/LSM/Smack.rst
>  F:     security/smack/
>
> +SMARTDV SPMI CONTROLLER DRIVER
> +M:     Vamshi Gajjela <vamshigajjela@google.com>
> +L:     linux-kernel@vger.kernel.org
> +S:     Maintained
> +F:     Documentation/devicetree/bindings/spmi/google,lga-spmi.yaml

Instead of a separate maintainer entry, maybe just add this under
"GOOGLE TENSOR SoC SUPPORT" ?

