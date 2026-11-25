Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C674F606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 00:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FiaKiIbo;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=SUz4Rs9Q
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=8DK3yldnIUojdVzCr2+XwiNL7LP7CGhb9/YkbV+PBQY=; b=FiaKiIbobUxrL8p7Ew+0Vv/U5i
	7haK5CVgisI7a2DDU0H6LviigjeFUNWuUDB/baULHqFlIxWCPOhrR5Q4ms6HfJ0iWfcAwlOI5AdDb
	Yo+q8vHfvojoP1nwVU7cLX8Sxjkj44A69qJgdpoUBDLDBUxwMJ2R+AQPEandxmkXfVWdZqHw+rTpZ
	aM/OjUUZMHbDA4HNuQRh+YBTKegu9kmcj0t2KiWfW3d9DSouaDxaXyS0GEaZ9CvKbFB7USCwCUtVT
	2UZpe4pjHQZwxVendmqjUH4sG1eFk4cMCd7hlQeESp7VTnETzJKaxCn4TEwn2K6PUS5IbVT+K2yds
	aUXaE4MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW0SD-000000086dw-1UNJ;
	Wed, 25 Nov 2026 00:01:41 +0000
Received: from mail-dy1-x132b.google.com ([2607:f8b0:4864:20::132b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW0SA-000000086dV-3LUU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 00:01:40 +0000
Received: by mail-dy1-x132b.google.com with SMTP id 5a478bee46e88-38190551625so10321934eec.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 16:01:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795564898; x=1796169698; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8DK3yldnIUojdVzCr2+XwiNL7LP7CGhb9/YkbV+PBQY=;
        b=SUz4Rs9Q3su0PRKzg+GB/MzU2y6hnb3JTfkoBWDM0+tWry+pzA3tzgzjU/0cD8ZRkK
         4DDRQexIEbIhid/lqn63AOy7uh53pDFPaiG7Qrw0sumVloNqNaU6gbMm/FLgQLjvgRMs
         6F5qWtLAH9GD9M2bh15jfFLrvd/YFopDJvvXo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795564898; x=1796169698;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8DK3yldnIUojdVzCr2+XwiNL7LP7CGhb9/YkbV+PBQY=;
        b=2BR+Bv7NRokl/53xVFYzvAVjws9it14Wp5Bz5GnzjHycbNtDRM6ckhu5xe7i5S5Trw
         9GXmPr1TAzMmYnySQZsxOAqI6Lk/zaFV3BSAVqKzaelIkm5ZXqCM55AxYYGDLphVHG1T
         ghLPmxYe01d9YR9wp7+0MH8tGkufEy1C1Ehetj9o/vX6PGMRxv46s1NLhgD5csPrYAiS
         sx6LTlQG3je5YH5GhRmf+o1nUvtagETy0FwgFG/W0a7E+29+mPajYwD5pEmUmNWvlRS5
         2050KJ3sJDw6Zyc/XBqS850kOPvRi9/1ac1aQ+f4wAKZqJPWtDruzv6KwhtZ9GjbVDph
         AkOg==
X-Forwarded-Encrypted: i=1; AL+hErExoEZijsalVXgi6RyYl8AAFJUUxJk8dVzB3BiiADRwPL/qHbYW3Dmi5mnVpFX/I5shMoH+3mtztsANZk7nv+ze@lists.infradead.org
X-Gm-Message-State: APuU4Z8FhhsoZo1swEVd9W/23NVc9d8yGLA2ZHaGKM+dDJ4C1g948/fp
	NHQnDsA7V6Eo1916a3Z9G3Mj/8dJUbFmXuLaEQhH77n9smLgUpsu9EebK8XNUx4VYg==
X-Gm-Gg: AZFdTZeOEoqBdCuqjkvXPlPJaldznzXfzSL6Eqnvl/uIEQ7Yk16UBvCTt+MpNtwjAQy
	XstFr/lERKQKnKotWHNEi4tkTqcSoHu7wLB2vSE+/8BM6DARnC46jrPQFZwXCewAWT+FhmpOaje
	t/EXPWEErpB1g+XvxPiZpP6JYg0Z3s+V4X2m9+6EaajTmQyyVJVTy59/seJRnybSnqahno3EodL
	hIF69XPS0i/bUFXTeIk2fzSCI/bwuTAMptdZ25NASMpwfMwcFEi4GhKBvkFsU6vJYj7znVNjfWE
	47aDsD40JbVw7vDFrSbrrZafCHFgW1eyw/RWZj0XCfNrHYIn37BCpWnbVBRyOq+uor+lrxZJdoL
	SZ3QJuALZtow+xyQRoY8hoE+DRDEZ0+Ylj6t7XyMNEv+RQG6SeWsRA0d+Bx3KU1NEwLpgvPQ/XH
	HO+wY85gHVkQ0vUrjsCQlqObAOtPn0c3T2ssvIuPW5hzbObrHSmVKBEMTUw9QNwMqknHjpbpEaJ
	/jER5UnJI/he7wF6BMTGcgJpyDSMrupi19jDYllYD/3X8K8Fd0e675IcZ2+XnWiB3/3xE1m9OrX
	NQG/nZ1Xx1QDHOCBiZgTdeIcxh2zBaLJACLfRuOiWiaqadhSqypPRaZYkZbAryXoakWx
X-Received: by 2002:a05:7300:601e:b0:386:1e2e:ce0a with SMTP id 5a478bee46e88-3861e2ed1bcmr15600970eec.27.1795564896357;
        Tue, 24 Nov 2026 16:01:36 -0800 (PST)
Received: from localhost ([2a00:79e0:2e7c:8:ea9b:d8a3:ba44:2d0a])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-385665f21aesm59652400eec.4.2026.11.24.16.01.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 16:01:35 -0800 (PST)
Date: Tue, 24 Nov 2026 16:01:33 -0800
From: Brian Norris <briannorris@chromium.org>
To: Peter Griffin <peter.griffin@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Thomas Gleixner <tglx@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, Radu Rendec <radu@rendec.net>,
	linux-arm-kernel@lists.infradead.org,
	Mariano Marciello <mmarciello@google.com>,
	Douglas Anderson <dianders@chromium.org>, linux-clk@vger.kernel.org,
	Jakub =?utf-8?B?R8WCb3dhY2tp?= <jglow@google.com>
Subject: Re: [PATCH 3/9] soc: google: Add CPM over MailBox Array driver
Message-ID: <awYlXdfJcciCy1Cn@google.com>
References: <20261026214359.3122870-1-briannorris@chromium.org>
 <20261026144346.3.I7bc547c83b7bf677a62670099f481a91ac737073@changeid>
 <CADrjBPqnRrFeYT9J6NGxy+Xzy1PTZEz+BMs1_u2md7Ra6xPPDQ@mail.gmail.com>
 <awXf86suGgKeazZx@google.com>
 <CADrjBPqG_TLwgOTzQ-o5pM7k1DzkeVxNkV2xDHsU4OBAyYOofQ@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADrjBPqG_TLwgOTzQ-o5pM7k1DzkeVxNkV2xDHsU4OBAyYOofQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_160138_875398_2AD775F6 
X-CRM114-Status: GOOD (  18.22  )
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

On Tue, Nov 24, 2026 at 10:31:11PM +0000, Peter Griffin wrote:
> On Tue, 24 Nov 2026 at 19:05, Brian Norris <briannorris@chromium.org> wrote:
> > On Tue, Nov 24, 2026 at 12:28:24PM +0000, Peter Griffin wrote:
> > > Should we also have "depends on OF"?
> >
> > Why, precisely? It's not actually a compilation dependency (I tested),
> > although it's needed at runtime. It doesn't seem like this is
> > consistently done simply for runtime dependencies, and instead work has
> > generally been done to ensure everything builds fine and fails closed
> > without CONFIG_OF.
> >
> > Anyway, it's a bit academic, since ARCH_GOOGLE (ARM64) selects OF.
> 
> I was thinking more if COMPILE_TEST=y && CONFIG_OF=n &&
> CONFIG_WERROR=y is set. I'm not sure if 0-day performs such a build. I
> guess since no 0-day failure has been reported in this thread, perhaps
> it isn't required.

Yeah, I can't tease out any warnings/errors. I had to resort to arm(32)
to get such a config, and I can't even fail with W=1 (I end up hitting
arch/arm/kernel/signal.c -Werror=unused-but-set-variable
warnings->errors first, but...):

  $ grep -e '\<CONFIG_COMPILE_TEST\>' -e '\<CONFIG_OF\>' -e '\<CONFIG_WERROR\>' .config
  CONFIG_COMPILE_TEST=y
  CONFIG_WERROR=y
  # CONFIG_OF is not set

  $ make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- W=1 ./drivers/soc/google/google-cpm-mba.o
  [success]

Brian

