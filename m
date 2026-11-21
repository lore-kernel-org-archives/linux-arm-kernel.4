Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3758B606A337
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 20:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qI/H2Pzk;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Tzy8D86J
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=S0KEtbQt8GRBQii0toPIaQocuYt1n+g/sLHZS8pvKLk=; b=qI/H2Pzkoj+7dv
	nUKX+lfflT7C0QSkGGy9Cz3qXMLOFBaojixKqq99f+YmwLEWJXwBIGYtbFiuDTow2AXXZHHOrlUnP
	cwN6Bxwmd+k84eR4zHvaLrMRXbnQUzyNJ1YIipBD4F9v2tJqLlU9Hbl+nv6iE7F/aiJf4TONuig10
	NSphOUcVSSVB5sRFELLkiArSHSbaVkujfL6xqitt8m+K/yr9/+eiYJ/TmWUEMcCunY+T9rfG9f1ML
	61TohPq2i5QJStxk3hz3Z1HCs1XU1FRq4n+qADCoKRQiCFm3iukr//QJ0WRR+Joc1JYYi6XmtwUxJ
	bBY4RLTr8tUyHREL9Y2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUruK-00000000Fug-1TK2;
	Sat, 21 Nov 2026 20:42:00 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUruJ-00000000Ftd-0md7
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 20:41:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id EE4FF45A31
	for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Nov 2026 20:41:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC6991F000EE
	for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Nov 2026 20:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795293718;
	bh=S0KEtbQt8GRBQii0toPIaQocuYt1n+g/sLHZS8pvKLk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Tzy8D86JZar495yRQAG/65mVNGhyCfKZ5L+iBZCJ6QjFgum36aHL55ANEzOtPPdam
	 I27chwcNdefUyX2zCTZS0nPR7luaQk5V/m+NJgvbO0DmYUlGxykZue07+Lfwz5/x/O
	 Lt1coNjQvqDM+FNVRngzpuYv8VFp+uvQDRkZNOuZ8rSaRp29eXMp53mByE9daw0KRe
	 AkhBeKePK67El9rbzIZkcjp/DpqqLU2UqCuO20+W9HCxpTZwrGWRpiVoKjV0J6PWOC
	 +q2K6mauqv6d+Hsm6J/05vKBfV6s0AVUmo8J5djhkQqYaA53Q5zfi0vNkBePylYU45
	 dQKCQqnJkfkcw==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5c158c4c15fso2508312e87.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Nov 2026 12:41:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHSZMBelIXRdcHBSxnnMnNV4MSK3F5ux0XXAVZQfXUDDOq/ELJpNyDc04VdjPzlmR6RvGXQEY0FT6I2/lLXTM0G@lists.infradead.org
X-Gm-Message-State: APuU4Z+XGKXijQq5gjgN4povJJyD4sUE7Ezg26LKDN/pL7P3Nk9VrUPe
	+vCzYhMDvqHxZ9gWdGdXntsgl3QiT2j4V8PB/SXbtVUu/TaBB5apiBXcy24mfjMauVSd8nUwenW
	3EvyTk0fAf+rzH10lkZnnCwiGykmtv/Y=
X-Received: by 2002:a05:6512:2c9b:b0:5c1:ace3:12c1 with SMTP id
 2adb3069b0e04-5c1bc575979mr1899458e87.0.1795293717533; Sat, 21 Nov 2026
 12:41:57 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261112064957.1796975-1-dmitry.torokhov@gmail.com> <20261112064957.1796975-5-dmitry.torokhov@gmail.com>
In-Reply-To: <20261112064957.1796975-5-dmitry.torokhov@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 21 Nov 2026 21:41:45 +0100
X-Gmail-Original-Message-ID: <CAD++jLnRGBk=kQ48AiR8nreGH5qqmgPpG9seh9nRdhsoQAO2XA@mail.gmail.com>
X-Gm-Features: Aa3M54rjP1A51PecTmry92kFaSGq6HbI8P0tn6phUpG9qNi3VmLI5ZCflHpwjkw
Message-ID: <CAD++jLnRGBk=kQ48AiR8nreGH5qqmgPpG9seh9nRdhsoQAO2XA@mail.gmail.com>
Subject: Re: [PATCH 4/5] Input: ads7846 - remove unused code
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

> Remove the pwrdown_cmd member from struct ads7846_packet, unused since
> commit 6965eece2a89 ("Input: ads7846 - convert to one message").
>
> Also remove the unused REF_OFF macro definition and drop the CS_CHANGE()
> macro along with its sole call in ads7846_read12_ser(), since the
> request structure is allocated with kzalloc_obj() and cs_change is
> already zero.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

