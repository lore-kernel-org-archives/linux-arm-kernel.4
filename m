Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 879F1606A336
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 11:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EOzn0Sqf;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FPVQu8El
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=S/PXjXpl1KxRCCiW3qKqRyfY2HAeEsAmwu7iETB2+Lk=; b=EOzn0SqfmSQr9E
	kDBFQnWzXdagH0Wr5k6/dNabnBR9XwgtPycCdy53Kun2k4GuhEKbXHONXGXZhI5FvePIPr+aD3S8m
	PI0yEDf838AGlC9rJdK56NBNisxsIVZu3+1R3m8805+jGmuccfhw/1ogTWqQmmWwULVZYESpisZ5T
	fEaA+aKLAPuPnT6dVm45ibL5S7oWN7ftLtRsyPC/skiLBnlpF1XFvTNDYBbjqu9je4cUBC9bNGcxm
	VIYX0ilzTkz9Ykczp7yoUwP/uXdrYWK5SNJ9di8p+I6TzfdmwdHgsNTExVf+8E6rua7qtmcOVaQZt
	5HTIacwQvYZkkOvTtqlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWsrp-0000000FVc9-3fIT;
	Fri, 27 Nov 2026 10:07:45 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWsrc-0000000FVZ0-47Vp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 10:07:34 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-5c31369ae36so2755073e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 02:07:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795774050; cv=none;
        d=google.com; s=arc-20260327;
        b=d3/Qkk0OvBUpjGo0AcY63aHm3R90tHgaPhaE3Ig9H0fz0U+SjpiN475/kc6bVIkhqM
         3dAFmPT2+PyRjTNehADGbUKpmz7e+KHj2guTZ+VraoDODDmJh5OHlZ7p3AkRzHEMSbgk
         4je4W+unXE0erzrhX5WRDsIOXrbXEnj0uhigrsO5e5VoVcxs5xRcAOhwancbHhQTIY+5
         1H8KicPwcH5ACVJX2CwZxfNe27a8TBNSSzAVwqag+c2tg45LdOAP8Bh5v4RY8eZeelli
         wkpVzf4GIh+GSXYQ3jP4awQqzxGektr7B+x7kWlV7mxQDBCGaHSqaoYJyzq5tLXgk34k
         FM5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=S/PXjXpl1KxRCCiW3qKqRyfY2HAeEsAmwu7iETB2+Lk=;
        fh=GjFKF9czQSVM5PzhDYo1If2MeD3DMjBycvNztLfP9Tk=;
        b=j60VLtrOnW72ooKawAkQtLWZgF1k1H7c+RCwSESBQVPSzq+jGKmF+NkEoPS1UFEWfH
         tNBXbgJvIpunCwmuJvhFZXF+bGOeIOwin7sTwzf7RbMDyqs7SolCghjtXQDNrexiVJ+3
         TyfOkubvyNvRVe9Dw2t7NM+Y88a49FrZVspoNWAymdk8etyX8gLyLHHZXQREfWeMgG6a
         Qnd5XJGf1dQZJ0moW8KTwn+9yvCuIpJKPG/1ifDvfDWItXOyPQlqEr6JJVmJFocST+r6
         iOGFVxmezudKtzZuQtbYsVTfF4Z5Cyg8GTn/zaTI3ZMWehQ+2bKyNk4Uh+e7tHVMTXDu
         ZRVw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795774050; x=1796378850; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S/PXjXpl1KxRCCiW3qKqRyfY2HAeEsAmwu7iETB2+Lk=;
        b=FPVQu8ElqJAhRBRY9aOXdNOblXP0ULmxkD6SVDoK0evzeizWMCBXn7L81SgTvc8P0X
         ChiC+WfGHG1tH6qei0cXW88vUA5uRxsq/yKXErmC3K5vaFZTYmhUEXGcqtpL1SAWlhAE
         C0TuhASHtiw0VJqb5Ft0QSZO1PEMAt4tbM0+BF/h5RgVl4+09RLRwfMAL+gIJVZS1NdA
         ZozwhrSHHV902jcPz1QGWR2F4j/BcHpwEe8t+2DlUMOzZ6M9yVCdoFvHee2i6VLSbNFz
         SHMJjrpea/1ywoWw9T5BO7nvenmgIyAlRVHHvpYJxL6PDK3N+zkpMqumvBPK9qOQqlWx
         Pg+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795774050; x=1796378850;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S/PXjXpl1KxRCCiW3qKqRyfY2HAeEsAmwu7iETB2+Lk=;
        b=Cggft9aaYDgxihMyvBMB/+YPtuGqw5r1+NrhspQOUly0IpNr9MDeg+BYEkp/nKMiky
         0hjPxIbxQsZS8XzbqyPjEja7MKjyuHORCM99QUpkHsnvxzi8DgkJ4J5pdFjN+HbKtWit
         SLJtwkiYWQtva6UpDUEBHK+j0UbRkH+lS5YFm/2YxJUisAbQxPsvanfcqJfVwgP5xggU
         eM4tWGTwp5HXjHnFH03B3KipfKGrdF/QZifYvM8bnzFf+DKcGTKQTcBIdLBa9PbSnsxa
         rzu3hGbNos3X15/pC75Ha7Ns0IBsudsadkE/vlUzLXXr7j17nm7wI713UNL9V1bWdw27
         R/bg==
X-Gm-Message-State: APuU4Z8q0f2kuSOoeM0Ixcttvjh+G92YBHyHW08RkhjelxxX218Lz7cW
	RI8x4su6RujvBCHm1clLnsidbYYhyVrMDtjcM6jV7U20yY09Zn9jDpRjw+3X2Xkt85Gl5dYfXbY
	33REW91bvB0FVdW5KIBsPFn2MSvpGA5Y=
X-Gm-Gg: AZFdTZdyXbUlKM8F2h+Ar5XVoF/kbk2xCpsha5CiNd2/2xk9eZ9iMkBItkOtt0Dj7a6
	+Bo99m7JsKNkCDsWAisZyujJi7RZhTvaXb+m89Rm5Yyv4P7XKPRtf9b2OHOMRmthA0SNITXntmU
	SQvVDrb9h3s52gyTzzNmk8PGgJJ5iTVJOWbEDF46Ka0DeeOfsoUMNf63fIs4KxC2+SvzfAGTr8M
	gk5hLKnlfUZNZqsoYZ6p/XWf+Gr70Tmmdee+Npeb9R+OWGqDZwoaj2FGBNK8t3AxuSensciqLVL
	Gnlgm8nOiMsbeh6hLqjUIj8bZsDfo1jMSowQjkvOseJplosHmbuznUcWuXZToJAbJPpuY2TnyiO
	R8dJBO/0rrKdgeHFimT3F+OFmSXrprc7b3BzAWh1MtDUSFGZSaFUN4XP4TyQzFRAQaJvLr9zHPT
	q3469Zb+Y/fW1jfBj1h2nvje+ByZlPZ7w=
X-Received: by 2002:a05:6512:10cd:b0:5bf:f8fc:7b5e with SMTP id
 2adb3069b0e04-5c1bc89c61fmr6700305e87.55.1795774050347; Fri, 27 Nov 2026
 02:07:30 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261121-at550-rfc-v1-v2-0-b0309d0789b2@gmail.com>
 <20261121-at550-rfc-v1-v2-8-b0309d0789b2@gmail.com> <awQEP9bHA0RPfRUA@monoceros>
In-Reply-To: <awQEP9bHA0RPfRUA@monoceros>
From: =?UTF-8?B?57Gz55Sw5oKg56KB?= <yogo.0917.sabu@gmail.com>
Date: Fri, 27 Nov 2026 19:07:18 +0900
X-Gm-Features: Aa3M54o3XA2vGbw-lT3h-QsKcDE27T0mWx-80FMotXTw-keuMBkBtHCZ9WsWU5c
Message-ID: <CAJGK9zaVJ-42c-AnZuXBW1uskvmRQv1ePHQsx=BMz55RfznomA@mail.gmail.com>
Subject: Re: [PATCH RFC v2 08/13] Input: add polled SiRF AT550 resistive
 touchscreen driver
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Ulf Hansson <ulfh@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Russell King <linux@armlinux.org.uk>, 
	Arnd Bergmann <arnd@arndb.de>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-doc@vger.kernel.org, soc@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_020733_063757_FBDF5D90 
X-CRM114-Status: GOOD (  15.89  )
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
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 23, 2026 at 10:16:56AM +0100, Uwe Kleine-K=C3=B6nig wrote:
> Hello,
>
> On Sat, Nov 21, 2026 at 09:43:18PM +0900, Yuugo Yoneda via B4 Relay wrote=
:
> > diff --git a/drivers/input/touchscreen/at550-ts.c b/drivers/input/touch=
screen/at550-ts.c
> > new file mode 100644
> > index 000000000..89c2d2701
> > --- /dev/null
> > +++ b/drivers/input/touchscreen/at550-ts.c
> > @@ -0,0 +1,124 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/* SiRF AT550 coordinate acquisition. Layout cross-checked with AT551 =
draft. */
> > +#include <linux/bits.h>
> > +#include <linux/input.h>
> > +#include <linux/input/touchscreen.h>
> > +#include <linux/io.h>
> > +#include <linux/mod_devicetable.h>
> > +#include <linux/module.h>
> > +#include <linux/platform_device.h>
>
> <linux/platform_device.h> already provides of_device_id without the
> implied dependencies you get by including <linux/mod_devicetable.h>. So
> please drop the latter.

Hi Uwe,

Thanks for pointing this out. I verified both built-in and modular
builds without <linux/mod_devicetable.h>, and I'll drop it in v3.

Best regards,
Yuugo

