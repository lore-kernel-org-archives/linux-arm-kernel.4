Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE2C9606A323
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 10:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ibgo7Lye;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0r8uxVz0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=M1iyI/0Mp18Cb7k2NsVPz111uBIRPwyZKwcAIivI8ro=; b=Ibgo7Lyes2UAF9
	WAr50TQYydfOr2ydGrimJgtTvyp66ksqsje4DGjwoVfW3hy7+2KzUYRIky8BLabVYAnvqvFO507Zd
	Yv+74oI8NKzqkG2gVutbtp0bUyjtOtiRY5SWfskJ4or0ou40D5BWJSyt2EJOyhz280fn2ChxEHJeI
	6pdnekvqs3Fwnv4eW6buchMQhaYvjkjDyIRCRdv2qaAjkuqYJPTALMndWE/vjudaheJCFI5MXOjyC
	+1u0E9OUTgnrkrp/wC7nreoglpc9M5bklDhcpRl/WBlvl5yhsSZWs+Eo//gNO4mv5fkYuHz1+H/cg
	L6aeIKG8C/v3fCbz4jNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWsrW-0000000FVXh-2WmK;
	Fri, 27 Nov 2026 10:07:26 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWsrU-0000000FVXA-24bF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 10:07:25 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-3adfed9a887so71609411fa.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 02:07:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795774042; cv=none;
        d=google.com; s=arc-20260327;
        b=pl32yhVJECiJ8War6C7Y3RJ+D8lWqiaroAtVoC9f8yN12OB4yS9gXM+bMMn+VNV9x7
         /Ex56w8tKVIJlzE3rUqwlo4sjJKsy94+EBrLw6jaKxKjDvoBiTKOCjGFDsewGkSI3kLW
         0Js+LKDBwRkogb1kspRlVK1nLfoLjOVujXrDtPchRyVW4l09UEpZcsWp+YTgsoazmHSa
         ic/fBjjV/k/7aCd7JODYaknGVwUOjIldvBFZng1h0eWhxFv+vU6lwfVNHQafz/uW8vpr
         wW9h7OHTGzh2j+pjp1nJRWX8Ph/p5WM7iVzxxlR0CJpgDPPcB812dEYHIBJw2sirtKJu
         WQ7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=M1iyI/0Mp18Cb7k2NsVPz111uBIRPwyZKwcAIivI8ro=;
        fh=GjFKF9czQSVM5PzhDYo1If2MeD3DMjBycvNztLfP9Tk=;
        b=UAzCqhyYXPw2+/DJ2MKE9qiio9HXb6BWNyIZy2zJMNPSMkNFM09Q8OFvK1/t5T20iM
         W17sV8j91V+v7P7YurRyh4CEXaokHkbksOH2mjH08uvx4NhNWB0ELHhjb6hZWYq5Bzlm
         2gQKxSKqLc5/Dbij0tj4giW0QPRnPyrhRs/FSazAFIl0Fv7UzkY+Q12q7qCgSjpzAbET
         ZT9zeP64fZMmxjHW0XOku66nG5ICIFSFQSVvG1H4Xg72mpZFi0eq6eJ6oIjXYe4PFz3u
         H1Ixs25nbian4oIp7MDFnv0d7Pc9EH95vAIoLsja2WNiWSrUnzc53awN/KfkN2tNX44+
         zLRg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795774042; x=1796378842; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M1iyI/0Mp18Cb7k2NsVPz111uBIRPwyZKwcAIivI8ro=;
        b=0r8uxVz0dK9IWivv9oK/K+suXWpU3kOY7kusDysbxHcXna1zYSB39ghjWLaNV3Foko
         g2MrjiUZwBtQhGZm2oceHrTQkaggM4Pqwk2H6aUa+humtWVTL4MtWm/mOlzFWKCt0bvg
         FR9/MBr88f3TobEWDLOVam8kh7Pnd6Yk59/zPrXDww7gZ9vC46mJICv1J/Y2Em6tT3J8
         VXOl0q0OP/xojJE3Tyey63WLZWad80u9bvUD/iBeni/h+1UBCbiymUxMDeWC8bRF9dM9
         g4KcwgMWU4TDMTcB8in6CnTK1isf0J6+K1+EWYH5D20unec4djzj92fEaWXX1RBHZRtW
         ItcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795774042; x=1796378842;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M1iyI/0Mp18Cb7k2NsVPz111uBIRPwyZKwcAIivI8ro=;
        b=pjZ2a02mCwpknldt8mCo+zuauGMpOyUY5jlr+MfvTLPkmTUhrWrISEgoTfKnozYxcZ
         T8W4zCar6RjbA9cTpXAc3voRgiETqR/XF7yVdJ+BF3T0gft5+dxVjY9pqpCTybFYnsTF
         MfX3A4HzvFlDghzTaSkS6BOT6o5/MJy5YR8/5ivM1RSYJdH3Xek+NbAWJPvwVQH6yMva
         Tqc4EsLE1tCQxRqpUP+67vPayqaQDzcJ9WIPh3anmGDT11pUeWhtVOFaUaodsudAD8yh
         kVaJ4lZkmgK0tPL1cr0sZJGYGDQYrbXWRV/5KJRtkf0mws6qjxLDGGiqiL9o/oN3a/Qd
         GvQA==
X-Gm-Message-State: APuU4Z9JdWq9dwzhOBQglsxpBLqgR70yXJ+z1rvH+0Bxwzb21GsghVFj
	Q4ztCI/7Ds+ckmrfSYO8N1mC0bdM65wyj2zt9TKkdezYIUnLecEGiCQfoRkCyxsLq3fjV/8YJQj
	vaVFQ/VI1A8iIfFv5WXxUCK5SjQnkCC4=
X-Gm-Gg: AZFdTZcp7LiP7Fe1Cy5u3zd7Q+pbvdLwkHDaW5u1bHk9feBYgAS74iYPTW1N0QyBVql
	5EuYIx53Ky9OPfWhFnufT/d7RFzSXGUJ4/90FGGfSnDOmo/0ERHqEw358T/EhsJrh+h/FiGkyNu
	8aR6SVmrkiG/g+qXFgsSHufXMcnU97HuYpRdIlCN4ABqsc0imNpaSBvxGdubrACgxOsjSI9O+5Q
	EVaf6XdjqDJDt+daG/9Uq2PQcEiollw/2+Sj4qg/n0VSba14PNqEGlLpsIRbAlI/sHo07uAPUZs
	k3BF6I8cd46oGvIO6kwr0Pu2ljRRn+s2N/4G3X0gjg4LfPTNAjxu6SKHHy5LhkdBKyCXFR4uMko
	Xl0V7LRH/vAfNwR/HC29GweVPMPFt5OFKlU90cTQSDbEhGfeJ9M4NvnW2Pa8tmtYRNC6lZqhN38
	zlWSiQvDHpJzi0JM57hByhIf61opwxJn0=
X-Received: by 2002:a05:651c:a344:b0:3ac:436e:4084 with SMTP id
 38308e7fff4ca-3ae7f9b2126mr75337521fa.4.1795774041405; Fri, 27 Nov 2026
 02:07:21 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261121-at550-rfc-v1-v2-0-b0309d0789b2@gmail.com>
 <20261121-at550-rfc-v1-v2-10-b0309d0789b2@gmail.com> <awQEjpz2572Y9wsB@monoceros>
In-Reply-To: <awQEjpz2572Y9wsB@monoceros>
From: =?UTF-8?B?57Gz55Sw5oKg56KB?= <yogo.0917.sabu@gmail.com>
Date: Fri, 27 Nov 2026 19:07:09 +0900
X-Gm-Features: Aa3M54qQEDKdWrHJxIfU9kb7QVNH017aRUBBckb6jwRibhb7ERXk9zIWhsR6uho
Message-ID: <CAJGK9zbBc94aMeXLuUZXrPOT+TbcD6HAejS1PgaCU-wO=ysY0Q@mail.gmail.com>
Subject: Re: [PATCH RFC v2 10/13] mmc: sdhci-at550: add SiRF AT550
 programmed-I/O host driver
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
X-CRM114-CacheID: sfid-20261127_020724_559436_B9A0FC06 
X-CRM114-Status: GOOD (  15.34  )
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

On Mon, Nov 23, 2026 at 10:17:35AM +0100, Uwe Kleine-K=C3=B6nig wrote:
> Hello,
>
> On Sat, Nov 21, 2026 at 09:43:20PM +0900, Yuugo Yoneda via B4 Relay wrote=
:
> > diff --git a/drivers/mmc/host/sdhci-at550.c b/drivers/mmc/host/sdhci-at=
550.c
> > new file mode 100644
> > index 000000000..11c9de0c9
> > --- /dev/null
> > +++ b/drivers/mmc/host/sdhci-at550.c
> > @@ -0,0 +1,51 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/* Standard SDHCI PIO only: do not assume CPU/PCI DMA address equivale=
nce. */
> > +#include <linux/mmc/host.h>
> > +#include <linux/mod_devicetable.h>
> > +#include <linux/module.h>
> > +#include <linux/platform_device.h>
>
> <linux/platform_device.h> already provides of_device_id without the
> implied dependencies you get by including <linux/mod_devicetable.h>. So
> please drop the latter.

Hi Uwe,

Thanks, I'll drop <linux/mod_devicetable.h> here as well in v3.

Best regards,
Yuugo

