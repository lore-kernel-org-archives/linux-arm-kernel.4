Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E1C606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 20:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IiwnnhjD;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HB0BCE7P
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=1+9xKelv6Vo2SNmmJS1JrMhxkgUkTeNOsnaq1Dfc3yQ=; b=IiwnnhjDqDJKHG
	tnfksZK03XVEDhI0dCr+Fl56gXPJhRJ3O5cMnewD6O9eKl01beLUZ+Cm2/6CBYArnfu3b/ykEUtdI
	k9RpOnYdvEXPQVzf4XgkZmjzENwsaeaqIwGyFIdqrhaIHQtBnQuIwPjY11eJeHLfW+YkhH6uOZvdq
	AfISDc11IEapes9w4LEAi+u7uCwAOv5/xt3C+HRExyOdb0D66DLtRHDh7F11njqviFvN66dm1buZE
	lLWiuPOhUGdV9lQmqDdbr+bZjaRshVdEia13GAZpAs6TSWt8KYr6vUSs9O1Mz1LzC0fjrQJwPetv/
	ATfEir9ltYl/0aYCdSRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUrt1-00000000FWF-43Eu;
	Sat, 21 Nov 2026 20:40:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUrt0-00000000FVy-2QjG
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 20:40:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5947F4471F
	for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Nov 2026 20:40:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DC581F000C6
	for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Nov 2026 20:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795293638;
	bh=1+9xKelv6Vo2SNmmJS1JrMhxkgUkTeNOsnaq1Dfc3yQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=HB0BCE7PL7DXjymH0OIW3hYSO36wEfw0nxPwTtX1C7fwWeDCXTXpJ4mjHgm3qP9Mf
	 h7OACroCL9nkJWX4mg/VFrB4pH/GDWsPgHbCl/KeqLT5uXXCOPG7a7nXoNWCw0WJyr
	 WHj0SUmTvySYGKMNwKCLYAcI1HYZpGPn/EkpyXMOzXYt05PQHHaN+UIRlAQT4On8c4
	 QIobyw+ttdEiXz/eYrbAN22UcLERf366GMEJ8MMcWAL2wLX0sB4TaYUG6/8a2dAi28
	 Uog623UuE+HmERallEkMDZy+uoz1jYWJw5C/T1vMPYsD5Bg8W11uLhgwn1U9aV+cyi
	 XhXBdR+LxACKw==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5bcdae234ecso2560549e87.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Nov 2026 12:40:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErG6sshzb+AMF8ymcjneIRM3VqabSujfH2natZe1bv3ABokwPopUtFqTepxlX7rB3R6Fwtdml8x0F7U48DaFegI7@lists.infradead.org
X-Gm-Message-State: APuU4Z//OJhIErUh6nIqoruPLmjQxUjsHMB55uSEgG1fj/iVfu9EwnJR
	q++4VnERmYhoCYC9bb+uqtTFq0Alj+AVN4vDCkoX3QUB1jSc/mEwLgLD/jFhdy6+57kO39QEJ3n
	pf34XQm/a+aqdATxUqSJP1qMZ15Pzob4=
X-Received: by 2002:a05:6512:3d0c:b0:5c1:4dba:f748 with SMTP id
 2adb3069b0e04-5c1bc7bcccemr2269512e87.10.1795293637058; Sat, 21 Nov 2026
 12:40:37 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261112064957.1796975-1-dmitry.torokhov@gmail.com> <20261112064957.1796975-3-dmitry.torokhov@gmail.com>
In-Reply-To: <20261112064957.1796975-3-dmitry.torokhov@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 21 Nov 2026 21:40:25 +0100
X-Gmail-Original-Message-ID: <CAD++jLkheoxgDVW3ZRZMnSe2LMdEDa7Qiny0FUjPxLzSwixAhw@mail.gmail.com>
X-Gm-Features: Aa3M54rpJtp0p4xkcjqFPMBHZAX15U25ZAI_rqHYM6Rkzu0O33avkFiWANRi8Bo
Message-ID: <CAD++jLkheoxgDVW3ZRZMnSe2LMdEDa7Qiny0FUjPxLzSwixAhw@mail.gmail.com>
Subject: Re: [PATCH 2/5] Input: ads7846 - simplify sample filtering
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, Daniel Mack <daniel@zonque.org>, 
	Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>, 
	"H . Nikolaus Schaller" <hns@goldelico.com>, Kris Bahnsen <kris@embeddedts.com>, 
	Mark Featherston <mark@embeddedts.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, linux-input@vger.kernel.org, 
	linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
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

On Thu, Nov 12, 2026 at 7:50=E2=80=AFAM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:

> The filter and filter_data members of struct ads7846, along with the
> generic signature of ads7846_debounce_filter(), are leftovers from
> custom filter callbacks that were removed in commit 937f5d5ec642
> ("Input: ads7846 - remove custom filter handling functions from pdata").
>
> Drop the filter and filter_data function pointers, remove the unused
> ads7846_no_filter() stub, simplify ads7846_debounce_filter() to take
> struct ads7846 and the sample value directly, and call it without
> pointer indirection.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

