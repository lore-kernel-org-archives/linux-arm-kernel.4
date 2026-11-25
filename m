Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B6F2606A326
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 19:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=G6p+aAh7;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Crr/wb1S
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=CDQbjZRD5r2LD7/4BjsL2T12qmTPHlWO1n2mr1qyPAs=; b=G6p+aAh7NjtUirWIaY6FfiCW4F
	o34DQkjjYsTvnYN0+oegM4hlSKe7nOR8Vmch1mUGvBUyGUiCgQUgImkPjXS6NPaErpqN+7sT2IKUD
	3xSlgcWZh6O0rZzRh1Aw91cXxZzYUWrTAs3Y4EYPOn6Lpmdk0HqFe5eOY9FQVQ0CXx8uRZbd66Ser
	5mL2Dqs5hOaCSBWQcVVydcHdhTP1ekHcFk4tgRZWwtorM/y5k1BCjD1CzkTiSUHicf7doFcohnXvD
	6iwBEDMDbNB5oLaKXCyymL02a9cat5ZOPlCkSEWTBd/qdhgKxL+NuYkHPQ0Wtdo7bzAyXWm7p2BNN
	HqoQCO2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWIWY-0000000B6yu-3qG2;
	Wed, 25 Nov 2026 19:19:23 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWIWS-0000000B6yA-1myW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 19:19:17 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2f041f88577so34702895ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 11:19:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795634355; x=1796239155; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CDQbjZRD5r2LD7/4BjsL2T12qmTPHlWO1n2mr1qyPAs=;
        b=Crr/wb1S37cwmQuaxU+EVMAUWtlJPi0S5ZPGV7zS1vQHNUlkx46RDZnqYj/HsI5yHI
         zWddExCvnTMv2GnVV5CeQIAOn5MD+xsFn1va+WWlGIMjtxa30qHD40PXiDCWWRHYTz0L
         rc9DUQ+Kb9uFhyi7b5YQbAserkfJrLpavl3OY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795634355; x=1796239155;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=CDQbjZRD5r2LD7/4BjsL2T12qmTPHlWO1n2mr1qyPAs=;
        b=lXkOyRaMEAGQ029a03Vi6TKTqYzuC8QhMUqAMdBAq94+I1H27j6IsrZHzRY7rSb1n1
         WCPQyUI7eaazRT3Yzdqkj9g5TGFDU2pD0QdgpGIN4UvKDkyTE6weT+JjtA0qTLUcVxIi
         FSnTW4W8wxcLfWE6OOXm95pdN8OCZjOCMgKwTxpcsAGI94c/anNdhEav2cDJo23ezGvX
         lqQzbAAbCnIpGVoQ/V196AzKPuVZJwfFAE3ciVM21WU7UEHQwLOGyE9GBuqH6zmMia4z
         fx1lBH7tIwx12L3cPz+S+bA7G7Yc1MOLLyqjkI2iveUtC1mase1rm3a4WqvSbdnUWGJp
         rbQw==
X-Forwarded-Encrypted: i=1; AL+hErEU6bYnWiGhyfzyoguS+3N0gExk+6k6CN1du0mB7r79Pzvbkp3aVBttpWk/zySIgvW06u5a9vdZO/YGR4ro7IVu@lists.infradead.org
X-Gm-Message-State: APuU4Z/gLh0CMRn+2rhX+Qlv9O7RuOFEBAI94ltDwlR5jA2sa0Jb+090
	pIP3pMqv6hXo4mfezIVTWhEJnXp5oddI3IyR3K5pf4+DUm0Jb/QTtTi/QMMM/bOfuA==
X-Gm-Gg: AZFdTZfFdPg/qX8R5Ahudn6ku7BJ5JzH+uDJLSFBhd6k6BQpyAbls0aS0oFt94lR1EM
	tV7biCkDKC/tcsBzNIT0X3xZ1zIYMxxbU7EUGBFWt+HzepnvfDXNRPmyihZEf6sEy1wki3bhotp
	ou6hCUdPp3jBg+pMTtEst7ptkqdbQvSZcEDz66KeBDKTRzPWo5/YKagNkqpMlploYCXrui7OmHJ
	AAJlvcShtPX+PuQ7Bf6ibDN7NQKwVjDP1McKNKbVYcBGaaC/h9qavZ7Fbl8tgusZtpGWgK8MHCI
	4Z8qWk/26baQIZzHS0n3aPEalWnlnvdtAy4zQu2BUWZAxJaV42VnFrbHPDm3FuaBrD/8nGSZ9TC
	dHeuAbLdnqaRSVm5sxnUgtfzh+Uz8AYjcP1vZtX9eQZ/ZghQORFwC0ZU3oDixMS8YFM1ctW+evk
	DEddRzQgceCsmd8n/eqYkRJVVLnXwDfJxAMyrjf49P4lM0mrbCsn2rPQ2/g6dgcIOZ+O93NFlrf
	o+kTf9qGXVbUA4c2XGjR+6JAxHsAcyH3YPwPVVf/rh941oJrMGI8mAGNgrSxbbwRpFxaGNoF0t5
	ikN2rIoTvbqkkTZgZA0qwvX+wrkfkvm8t98x2l33p0Dl/0qCRf40CkzdJLcJRVu9MU4=
X-Received: by 2002:a17:902:d511:b0:2f0:446d:30cd with SMTP id d9443c01a7336-2f0446d33f4mr180619865ad.31.1795634355343;
        Wed, 25 Nov 2026 11:19:15 -0800 (PST)
Received: from localhost ([2a00:79e0:2e7c:8:d0a2:f616:6ba:a1ce])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2f03ee84364sm93389045ad.5.2026.11.25.11.19.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 11:19:14 -0800 (PST)
Date: Wed, 25 Nov 2026 11:19:12 -0800
From: Brian Norris <briannorris@chromium.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Thomas Gleixner <tglx@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Radu Rendec <radu@rendec.net>,
	Jakub =?utf-8?B?R8WCb3dhY2tp?= <jglow@google.com>,
	linux-clk@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
	devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
	Mariano Marciello <mmarciello@google.com>,
	google-soc@lists.linux.dev
Subject: Re: [PATCH v2 5/9] reset: google: Add CPM reset driver
Message-ID: <awc0sBl6q6A2Reaq@google.com>
References: <20261125000349.3385325-1-briannorris@chromium.org>
 <20261124160343.v2.5.I0b1ad34a718a9b5f667d2481041970ea45989dd3@changeid>
 <f89e293688feb3f9bcdce0f1b6fed0ee424e5cd8.camel@pengutronix.de>
 <awbJUwrBQw5TnowW@monoceros>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <awbJUwrBQw5TnowW@monoceros>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_111916_532696_ADD0150D 
X-CRM114-Status: GOOD (  17.41  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 25, 2026 at 12:43:40PM +0100, Uwe Kleine-König wrote:
> On Wed, Nov 25, 2026 at 09:48:04AM +0100, Philipp Zabel wrote:
> > > +#include <linux/mod_devicetable.h>
> > 
> > Please include the specific <linux/device-id/*.h> that is needed
> > instead of all of <linux/mod_devicetable.h>.
> 
> Or better still, rely on the bus headers to provide the needed
> *_device_id structures. (That is <linux/platform_device.h> provides
> of_device_id (for patch #2)

Only very indirectly:

  <linux/platform_device.h>
  -> <linux/device.h>
    -> <linux/device/driver.h>
      -> <linux/device-id/of.h>

> and <linux/auxiliary_bus.h> provides
> auxiliary_device_id and of_device_id (for patches #3 - #6)).

Also quite indirectly.

I'm not sure how to take this advice. I tend to see "include what you
use" feedback (and not rely on implicit includes) elsewhere, which
suggests I should *not* do what you say here. Do I just need to guess at
when an implicit include should be deemed intentional?

At the moment, I plan to simply go with Philipp's advice, as I don't see
the harm in targeted, explicit #include.

Regards,
Brian

