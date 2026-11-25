Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BABF5606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 18:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AB4CvpjG;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dsUlDe+V
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=AJn2ZDGnyq8BSK3oyCmPQTCcj4ho7zZBJZRdqJLEXy4=; b=AB4CvpjGI/8rs0
	KDFGAvP5vu+J2/36WIgroy2pas8dG+5ayrWOZZMzS3RIXnd9YMaGLx/X/UQcNfQfBdQqKvULSYyBb
	hVeZ8WwpfpUqCBa2bpsk2yD66qk1qcBZUL1XGj+/4UFnWhk5LjUGQB37m+NH86y4d3p1QTpzoR+SY
	05qtgzJnnzTSqanTI6qSSXOXdojWUu3tj5Pj301x3rCGCYSndkH5pis6S8XNspuEitNekH78A10Nu
	MYPmks/o/CM9Thnns+NZthdcYb0+NXkWxoq6YLQFBTy8Lq/gMSUPHzwD+Vg3sN+8qbDP7wcdt4H+/
	O+4tXEtuV5iukacnJy+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWI5a-0000000B4bQ-2QGC;
	Wed, 25 Nov 2026 18:51:30 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWI5Y-0000000B4b7-2k3E
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 18:51:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6A22345DDE
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 18:51:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E62CB1F000CA
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 18:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795632687;
	bh=AJn2ZDGnyq8BSK3oyCmPQTCcj4ho7zZBJZRdqJLEXy4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=dsUlDe+VcnDqHyjZKyOfsjZSPGSF05pMOIE/jef/AOXUPyWLBSllU7ou+03E+DAvg
	 /ct7o+Jnd1VRhb8GIia+uvNT7APQkfP9Eu01Nu+ZWUnpsNTL66y9FtozBlNJ3UzC4P
	 36BVuwZIWflaa22qqsuve9y8aMRvCrrBBu0048RUqzGogtczP+845UtRA8drsN1ms9
	 oHiwPdt14RIuqoSz+7sp1KSYbyxXtc1JGc3qSKf5UWW7J8RKB0JdNQMzrrBB7ChcNn
	 TwlI44xnSQWejWsc5Yv6rIDa4sOlauF/YjlMyDeOTfU8w+Uht/0JsOHcvnKxDBCoZI
	 DR2EvZNMjuf1Q==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5be53e5fce1so5638548e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 10:51:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGa7YZbaXNroMUjHc5kxOD+c12tDDQPcDYmhPqr81RUgerexsbQoJc75rV58maZhXTQtMLZtoK0mIo2A5oZDy1x@lists.infradead.org
X-Gm-Message-State: APuU4Z9Hm4QLJRohIF2IF0wRBBahkYtwZBxY8FZ7ZSzC8UXz1x10i566
	gQnjjpTk6RmL8B8aM1pLjG9CpZhA9bCsWPdVZccSfx2rjHhClwYpLceJ8tOfYt6fO5eoMqceSTk
	K6ZOmmAmZBCvCddtnOeKy2yKi3ryVcPc=
X-Received: by 2002:a05:6512:1244:b0:5bf:d1e4:a034 with SMTP id
 2adb3069b0e04-5c1bc7d025dmr5776024e87.21.1795632686730; Wed, 25 Nov 2026
 10:51:26 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261123-clegoffic-pinctrl-scmi-gpio-v3-0-d61f039be008@baylibre.com>
 <20261123-clegoffic-pinctrl-scmi-gpio-v3-2-d61f039be008@baylibre.com>
In-Reply-To: <20261123-clegoffic-pinctrl-scmi-gpio-v3-2-d61f039be008@baylibre.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 25 Nov 2026 19:51:14 +0100
X-Gmail-Original-Message-ID: <CAD++jL=9CLRwhfKTxXRFLmFD464fXDUpVrSBXs=QSgR2wd0T-Q@mail.gmail.com>
X-Gm-Features: Aa3M54plvKbr5Woflkau8kb77OF24_6CaFs-zUvJOIOFslZLDIg88lWvAqwohnw
Message-ID: <CAD++jL=9CLRwhfKTxXRFLmFD464fXDUpVrSBXs=QSgR2wd0T-Q@mail.gmail.com>
Subject: Re: [PATCH v3 02/10] pinctrl: scmi: refuse an inexact drive strength
 in milliamperes
To: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	Peng Fan <peng.fan@nxp.com>, Oleksii Moisieiev <oleksii_moisieiev@epam.com>, 
	Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 23, 2026 at 4:21=E2=80=AFPM Cl=C3=A9ment Le Goffic
<clegoffic@baylibre.com> wrote:

> A get of PIN_CONFIG_DRIVE_STRENGTH truncated a value that is not a whole
> milliampere, and a set did not check the conversion to microamperes for
> an overflow.
> Return -EINVAL in both cases instead of truncating or wrapping.
> PIN_CONFIG_DRIVE_STRENGTH_UA still reads the exact value.
>
> Fixes: cc2f90768e97 ("pinctrl: scmi: send the drive strength in microampe=
res")
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Closes: https://lore.kernel.org/all/CAMuHMdWwp4RtKnBpFNJPHdigzrQ-wf3yt-pB=
ZGG9QKs9tcd_Ow@mail.gmail.com/
> Signed-off-by: Cl=C3=A9ment Le Goffic <clegoffic@baylibre.com>

Patch applied for fixes. (Unless Cristian says there is some problem
with it!)

Yours,
Linus Walleij

