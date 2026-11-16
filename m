Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B71606A323
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 14:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FLTqVWry;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NBOeehWC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=QV65o9uD7u2eGHZjHswbF87Yap+wVhgXbFisYF8o+U8=; b=FLTqVWryM3FI1C
	/ZkBhd70uvgkQ0jE9FWfzPs1rzpFOqLiETPsq5Z/IoYzjUWnANnarhYHnxnLZ9TJcV/0SYGDq9I5K
	i/f22uLEHH2Uj45AnOdWAyuMYH/bmVMMtb3/1emxWMCvyzmSZljXHpTEL+C2vXGbQtDBLD2IMPF5C
	UPwgQ1c0Iqj1lKMytTN/4S8ug4YG8UR0EbJ+7BNMozZZYlglmrSJkVYGeGx31MIKLg8lm1tAWmW4g
	tADwUA9HY94X94FsFKF3pf8YjF4kS2ENEKYpIv1ttiYV+D7Wfo+dAHXbAl+3os8EaDFWHHFyqkIqx
	qHBIFTNht3K8fg0x5hFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSxpB-00000002u68-3RnH;
	Mon, 16 Nov 2026 14:36:49 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSxpA-00000002u5z-2Bjr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 14:36:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2FB4B4352C
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 14:36:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13B811F000C4
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 14:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794839808;
	bh=QV65o9uD7u2eGHZjHswbF87Yap+wVhgXbFisYF8o+U8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=NBOeehWCamGW6/BV6GOo76BJXHS4PQXu4cw6N48J4Sj8XNoTo/HBjUT/NMqsq+FrL
	 q74sz1DdtZAMR1NHcpplOJtL1mZFfpy/LcrjOkWSjDjcf7kx7kh6oNbZjqPuEF28+e
	 da2146Vk5BgM6JAyymGES4Sxdh4a6Ph5qlXum+KoSQstAG5u9HSh5chOPeajsXXS9M
	 d56w5BxVD0TPePEe74Q4iJm6LkNDM3+u2WM3ahj1790frakstiNrfujQPyh6qwdxuo
	 W4FTRADVjNZjVqChHhxRrDzGrdOd/S8J1N4370lzFpCKhQby8khrzhZtkuCMskZI4r
	 y03Xy+Z/bZL+w==
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-71ac9e15640so1704899eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 06:36:48 -0800 (PST)
X-Gm-Message-State: APuU4Z+kZYBOVPb7WDLwq77Odipii5Cjm2Gd3Wpt4Fpj7XDhLic371rA
	HcJnUHxSA6l8vli5zlWOrylg/Rz2UPjgfvYP9W9hqnzX3H1oCn+krKprccgiPSwdyJJUnUSzU19
	rHbOuVbKl5Z+q2zzUdO5X5xy6rIM0Nlk=
X-Received: by 2002:a05:6820:1353:b0:719:1ad8:a34a with SMTP id
 006d021491bc7-71ab51ad506mr6626551eaf.67.1794839807496; Mon, 16 Nov 2026
 06:36:47 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261108-ux500-defconfig-update-v2-0-13b701e66cbd@kernel.org>
 <20261108-ux500-defconfig-update-v2-15-13b701e66cbd@kernel.org> <ac3fcfcc-dbb3-4b30-8d15-56c12d456887@postmarketos.org>
In-Reply-To: <ac3fcfcc-dbb3-4b30-8d15-56c12d456887@postmarketos.org>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 16 Nov 2026 15:36:31 +0100
X-Gmail-Original-Message-ID: <CAD++jLkF1kejRSnM-ccmAXAGWbt-jfo=ozzowqcC1QpFchXc-A@mail.gmail.com>
X-Gm-Features: AclHuK9gOK5jvtkS9rkFbabyP52tHHvrif40-Dw5q-IABvlnvUJLlLTf5hThf5M
Message-ID: <CAD++jLkF1kejRSnM-ccmAXAGWbt-jfo=ozzowqcC1QpFchXc-A@mail.gmail.com>
Subject: Re: [PATCH v2 15/15] ARM: configs: u8500: Enable compressed firmware loading
To: Stefan Hansson <newbyte@postmarketos.org>
Cc: linux-arm-kernel@lists.infradead.org
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Stefan,

On Sun, Nov 15, 2026 at 10:25=E2=80=AFPM Stefan Hansson
<newbyte@postmarketos.org> wrote:

> > +CONFIG_FW_LOADER_COMPRESS=3Dy
> > +CONFIG_FW_LOADER_COMPRESS_XZ=3Dy
> > +CONFIG_FW_LOADER_COMPRESS_ZSTD=3Dy
>
> FWIW, Nura (formerly postmarketOS) only uses Zstd-compressed firmware,
> so enabling XZ compression isn't necessary per se.
>
> More broadly, is there any reason to enable this upstream in Linux for
> all OS:es that use the u8500 defconfig given that we have our own means
> of generating configs that match our needs downstream in Nura? While
> it's not likely that our firmware compression format will change in the
> future, in general it is probably easier to have one source of truth
> downstream that we rely on rather than manually keeping the upstream
> defconfig in sync with our downstream kconfig generator.

I think you're right, I have superceded my SoC pull request and will make
a new one dropping this tail patch off the series.

Yours,
Linus Walleij

