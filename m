Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4989F606A325
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 11:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cJpsNtBG;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rj3uhHT9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=N0f/oc4w+1288sm9q4rBvBHgWSxv2jCSc3LHHH66Lc0=; b=cJpsNtBGMXwD3c
	RiBL51duOJotirHI0KYSyxD1rZ04Q67bgF/6uooMbjYADogiIeArVYyImxFvZY1eXV2PtxKM/UlHL
	3t8NlYdryTihnID6PLvca/MHwpkgk82tyLY/0dBxex5OdE9dT8v34g8zCp3qw5rzTgxqPljnulwr/
	64AY7jfwcnKn0ixLX5D7vNnfXJ/PgrAuYQwdheShizc2o9ovLSFJ3lOxxn1QsD2i+KWKoEqMDJo/o
	GcmTFmp4wh9dWiaUQnGiMcmNkhfPBd/IBnaLj7MASde0CHZD/0vGRkG+FmTvVZu0KhnhSOg9DoqDC
	o+Qim0kPsY+Jeg0Mv5+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUjeC-0000000H8Ft-28Qq;
	Sat, 21 Nov 2026 11:52:48 +0000
Received: from mail-yx1-xb12a.google.com ([2607:f8b0:4864:20::b12a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUje9-0000000H8FV-3zoU
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 11:52:47 +0000
Received: by mail-yx1-xb12a.google.com with SMTP id 956f58d0204a3-67da7d18f2fso1972008d50.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Nov 2026 03:52:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795261964; cv=none;
        d=google.com; s=arc-20260327;
        b=Zw2WVzJxZqgmBgfK6JzJT+oDZXpOLO7zp0OcBVa6T3v5+nTMDfcEaeuFSNKZiITP2E
         UQrtquPASE2spLegpvrqUjd8J8c5Q4Fvg91no2NadZN5hdaGpSlDGN7rWxmcUNDJvOdH
         qmjsXpqG5tyl2Vd5qsjEpXNJSjX4HiTJHQF8setsaPl8ujrxJHIyyFHuGUt2lOnOupvG
         GrblLrV/TRk5fH2/5ekj394jOyRGKdk0boDMhRqmqPHB8Ezq7BSecDmoo+BO2UcylPL2
         lnoONL6Qzr/cUPbw8+d2lfcQJReomadoYXSZz4zuiO4wIZCgGzHlJPUq1IhVBBppSUQD
         tXow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=N0f/oc4w+1288sm9q4rBvBHgWSxv2jCSc3LHHH66Lc0=;
        fh=sWdnWmcwX5psngKpsa+kxBJ8KfdRIDrw4Ewc6Iu6IWg=;
        b=oonE7Gy6ctTtvkItticrzJewd4+c5KHbLo1nHjFMUTLntAtnQgxiKoNGm6dBxl6yqZ
         kHlH3S5/bSBc/PrH6e4+Q919ubk9vj/kPpYD43BgA53ECCxR93H5c4J8NtOBQBr5VmRr
         mE+/EHzw2okPYFmsQVlnmUtF3s7eXVn+Of4cpg+kUtPgRqnZYn888GBt9On1HZLtaUQj
         axOFgVYiVx1mv9UrJkqJ4rHVHg+lB6aeLNhSmweFhkROaC2ip4ZDtun+mc26n5bDe8Qv
         nBOvmoPMLlUReMRWdr+Y261xlKSAc2F+846N6XwVgmYGELLT6peeaUo1Q55CHT6tnpuc
         Vy1Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795261964; x=1795866764; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N0f/oc4w+1288sm9q4rBvBHgWSxv2jCSc3LHHH66Lc0=;
        b=rj3uhHT9FOOKo2PaIjNbyzSna9/gQ2xVA1zdg/j3tLqGOkib9kgux7OXNsU7/a+AD8
         sTdWNKy2cp8w4ZY+9RUHnAxPbd2TNIhex2KDhKE5K9P+zOUoYyFzalWPVmYKTF4RhPc8
         IHBcAk9ZQf4ppFuv3mnYrFiiJKnWWyFOQ3ykzh+QxpmFxLzi7C4Tqj2u9v3CD56k/s0O
         Lh5g2Vj6lZNyI9463p5dM10Zec9ynfKT5VE1XfqY+SRb+iwd2ACF8Q7Ukrokv58MCr84
         jpWodDR6cMNI/kfLqzNqgGofjwNfjfVeGLSJosQ1lDy7UI6Mbpq4HRWAhWqMbATgCyUt
         Ywhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795261964; x=1795866764;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N0f/oc4w+1288sm9q4rBvBHgWSxv2jCSc3LHHH66Lc0=;
        b=QbLtS9qWNRdOTTGONdNwoQWIm0rU7l9E6yqltZhnwPiV7XmefO07/QfaCXsSsNFOnC
         jqd7Z/Jvg4tW7tdQQKBJorm4EORLx6fR7ATIaAJ4iOEY3SQE6c1zalwi1SBOkKcX2UWN
         DAK6IbEIfFA4seI/HlhOMzJ8gRCH0Gk6v8RqaBb+chD+KikrNeS70D6Upj2kVcbkPEhB
         pDACS/YKxZntIASmda66D0klCumfej/oZj2TiOioTexccfUES8ngHePt5Qr3ibx91brr
         0SuuLv/elQnBXKKS49/o26AQTPXh/XY+5DfEExlzc6kgFn+PMWIph4CsAB3l9+qmxWZ1
         12UQ==
X-Forwarded-Encrypted: i=1; AL+hErGkd5K5FTMa/wt9rfjNSKdXCKQB9OdoJ5LCtIwyDtl87wWzGr7074KgH627DT5+/JBfeU0JApzVKfNhkU3gPrkB@lists.infradead.org
X-Gm-Message-State: APuU4Z+rihfYLwVqDkWqjSaPvPrq6kSQ2E+QdtpJVRnqPHAKWxoYiqRb
	53+wSJBmIYQO6sdecDQL7gkoPY2KrFSUUJXBySglwWYX9i3JEdk26ELwwOfCG08jw6pqB91i0ZQ
	vTh+xv/tqgEQOOte9Oi7+amD9x0BHOLg=
X-Gm-Gg: AZFdTZcvSUUJ6/GNlBdvamxZyCvdfIxXwJQjOAKhy0vYs7J1DYg8bTHaUixGnWqGyX7
	LFGs+nXvtEgO0xTdobq52fUTvULw+qz9Hendn6m98UAZ+GRrKAXX10BKeNM46Qe01RUeqCiCh2G
	lSuefUZF0+m4SYtxwcBY9OU79hqd3kYe3hRkoHmEhcsAmoGiWBsOjJPD8aDHxC5GyiqMjm1I9mq
	mvlMQ8U6a7wsR5Kn9nRq0h/phcRJmyp8ZT45foMb4gFjAEyJsUjOjbaK7V4qZIV9rZ2rJI6bExU
	gNeVXLQEwiwXygsvizKpjeVS68Yhmrrbv/OzR+0oJvaKrik3/V7eOhKNf78J5GAlI43Rcsn/bXu
	vStL87PKqlfqknerUUXviGHG/NT2XZpI2IO+l7qvNV7c2xJfZeRD20Fi5a5NpmPsugCaP7zd19U
	ZAQB0R3JcGeo30/MFa1/hI5gZnbik=
X-Received: by 2002:a05:690e:4850:b0:67d:ab84:3bc9 with SMTP id
 956f58d0204a3-67df42c4011mr1425040d50.5.1795261964144; Sat, 21 Nov 2026
 03:52:44 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261121-m3-cpufreq-opp-v1-0-42a0c07c48a4@gmail.com> <20261121-m3-cpufreq-opp-v1-4-42a0c07c48a4@gmail.com>
In-Reply-To: <20261121-m3-cpufreq-opp-v1-4-42a0c07c48a4@gmail.com>
From: Michael Reeves <michael.reeves077@gmail.com>
Date: Sat, 21 Nov 2026 22:52:33 +1100
X-Gm-Features: Aa3M54rZGK9MVhmV7coDk48If11yJyzjN2A4aBmkg_LQalyda1z1hSvlbjbiJKY
Message-ID: <CANpmGNvd3Bnv58BQX3UcX5eOip5Q0DfmPhvPp_9DGRQQUWOqQg@mail.gmail.com>
Subject: Re: [PATCH 4/4] arm64: dts: apple: t6031: Add CPU frequency scaling
 and OPPs
To: michael.reeves077@gmail.com
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Hector Martin <marcan@marcan.st>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Yureka Lilian <yureka@cyberchaos.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_035245_998613_93B79850 
X-CRM114-Status: UNSURE (   9.11  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
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
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,
On Sat, Nov 21, 2026 at 10:44=E2=80=AFPM Michael Reeves via B4 Relay
<devnull+michael.reeves077.gmail.com@kernel.org> wrote:
>                 cpu_p14: cpu@10204 {
> @@ -272,6 +314,8 @@ cpu_p14: cpu@10204 {
>                         d-cache-size =3D <0x20000>;
>                         i-cache-size =3D <0x30000>;
>                         next-level-cache =3D <&l2_cache_2>;
> +                       operating-points-v2 =3D <&everest_opp>;
> +                       performance-domains =3D <&cpufreq_p1>;
>                 };
>
>                 cpu_p15: cpu@10205 {
> @@ -284,6 +328,8 @@ cpu_p15: cpu@10205 {
>                         d-cache-size =3D <0x20000>;
>                         i-cache-size =3D <0x30000>;
>                         next-level-cache =3D <&l2_cache_2>;
> +                       operating-points-v2 =3D <&everest_opp>;
> +                       performance-domains =3D <&cpufreq_p1>;
>                 };

Oops, I accidentally forgot the capacity-dmips-mhz for these ones.
It's just 1024 like all the others. Can you apply that when picking
this up, or would you prefer I send v2?

Thanks,
Michael

