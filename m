Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FA4E606A8A6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 10:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wXB7lXVW;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gW7UDdEw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=lHtGW/alZjcgKTPZf6fIR74OQ4JRsfsRwol3QZcsyok=; b=wXB7lXVWgJTMyF
	uBy+BLOraIfiYloqsiXG5tMU2UDNcPzQwexe4LFf5ocYn2Z8tO3UeZKOICcmxb3YtpVEj1xX6MwUc
	XZYeESlTQJqHuLpGiWKi3knc8t0oE2HqSxV6Uqa2pVKNJ/DxF3ymb0KXUsHOYUUz4Ucw+Xr3oWO+N
	ON1nHOjsiPd1hp9HbO3j4O7rj1Xgi2rDQnWCmw8aSl2ml68sbuFdMiYEui5zQokYTIzfmXvQwJZs5
	PFBhUqk/4sOjx3bdD8VTXZ+e/WnAYTX02AbSS+5LAdknYcWd9ragnOfF/uwH7cT5zL8B+r6W61F7A
	8gqsXMUcLPuev9erof3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRoDq-0000000CJ4T-0WAo;
	Fri, 13 Nov 2026 10:09:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRoDp-0000000CJ43-0W3Q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 10:09:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8649C439D2
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 10:09:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AC851F000C4
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 10:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794564568;
	bh=lHtGW/alZjcgKTPZf6fIR74OQ4JRsfsRwol3QZcsyok=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=gW7UDdEw6q+5j8PL5LPh1L1vrI7/MIoKJeAjSu2NDHrd1buG3qVpd1qYhNaa9PhEZ
	 0uUEqdklHY9Gbm+Ha9sUVGqC2s/1YeeDkfa483PuNbOwjkxP+CuS1Cq7pixdDBXc0R
	 v8QNxCJfMDXzIkIbjr1I/9MdJDOrw5/S0pgMg9lGdK7+71Aqu3QtTLGZtdE5rfj8sP
	 qBFGJ7jZOhrUemFPQdY3GuTbnZ9Tcy0O948NOaWNp92zja8/3HvsEPDwQXwO5lakfG
	 Lp8avRshrUm2G/L0CF6u+KsL4b/b4JItR3lH9LpYwzqjlbuhIzWXdmkjW/xWIb50Fo
	 jehn/M9xrMB9w==
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-6d68de53053so378364eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 02:09:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErF+2RimIrt5cmIgAvuzSoocThkwPBAfmphYL30QdSjUHEsSsrkv10T+U2+JR7NkCIHEY7s1GbLhY4RfxhN9X7TP@lists.infradead.org
X-Gm-Message-State: APuU4Z8YXepsk7V7yNoZpo4HPsLo24EEHcNRVgJeHN9BX9ARbr40FFDj
	Q0hFUs++tYtf32vECRxdWICQ1rHHJvqjbufqngI/BPwRFlExBWjCkChMmvtqHCcaGYGzpz2zMTf
	0N+njMSCK2aWZwLibFb+0mWkrkGr+XTM=
X-Received: by 2002:a05:6820:a294:20b0:6e0:8fc2:84a3 with SMTP id
 006d021491bc7-71ab510c545mr836854eaf.39.1794564567683; Fri, 13 Nov 2026
 02:09:27 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261030-clegoffic-pinctrl-scmi-gpio-v1-0-52d92843ad97@baylibre.com>
 <20261030-clegoffic-pinctrl-scmi-gpio-v1-3-52d92843ad97@baylibre.com>
In-Reply-To: <20261030-clegoffic-pinctrl-scmi-gpio-v1-3-52d92843ad97@baylibre.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 13 Nov 2026 11:09:12 +0100
X-Gmail-Original-Message-ID: <CAD++jLkcbCEvBYY3cdfM89kj3r6Nz-KSd25yypqom7TpbM1HHA@mail.gmail.com>
X-Gm-Features: AclHuK8B628wWVXl0NuYQCslLhyar4b72cZPwoixzCfMqUSGPYc6JmsCw2evP6o
Message-ID: <CAD++jLkcbCEvBYY3cdfM89kj3r6Nz-KSd25yypqom7TpbM1HHA@mail.gmail.com>
Subject: Re: [PATCH 03/11] pinctrl: scmi: send the settings without argument
 as enabled
To: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	Peng Fan <peng.fan@nxp.com>, Oleksii Moisieiev <oleksii_moisieiev@epam.com>, 
	Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Fri, Oct 30, 2026 at 4:58=E2=80=AFPM Cl=C3=A9ment Le Goffic
<clegoffic@baylibre.com> wrote:

> bias-bus-hold, bias-disable, bias-high-impedance, drive-open-drain,
> drive-open-source and drive-push-pull take no argument in Linux, so
> they were sent with the value 0, which the protocol reads as disabled.
> Send 1.
>
> Fixes: eb524cb651b7 ("pinctrl: Implementation of the generic scmi-pinctrl=
 driver")
> Signed-off-by: Cl=C3=A9ment Le Goffic <clegoffic@baylibre.com>

Patch applied for fixes.

Yours,
Linus Walleij

