Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F341606A327
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 10:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=prtp5iO0;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Bt7ogS5J
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=6UCpMdG17TsBHLaWxB9607jb57trolViWOW8saSDFIk=; b=prtp5iO0uN0jQv
	SDJLXHJUeLXWZfStj3DiijGZQhcmdVTG9u/cgs/NPkPUB71aqO8X77c2SFtGrkwvjXHhHw6Trqn00
	hvUcNqQQGN5o4dM4n6DvBVm5KIThUjlBDRU122lCT3Z6Ba38bYqSobejlZHA8azSi2ECmpicPuKgH
	PO82lhQ5K0mpFFAFCHikBX7My69Slu7aT/DcugpPyc769GK+9pXN8UldFPPXJ7+eNG4GqLbqIayKs
	swLBpkjyLc2BxwJBXGZcwAMpDFRlE6A0xrHMo7eh5cE3fsWzlAXcEIREJijngu4DMlDWKsSGh+ZjH
	Jn+VKVpVr8qiwzVRuznA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRoIy-0000000CK2r-28Yk;
	Fri, 13 Nov 2026 10:14:48 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRoIw-0000000CK2G-2aZs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 10:14:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A609D612E0
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 10:14:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E11B1F000CA
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 10:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794564885;
	bh=6UCpMdG17TsBHLaWxB9607jb57trolViWOW8saSDFIk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Bt7ogS5JyehS4JxScQVm0sHvkUUYe0Eu1k1IZvY+sEkc18DyCkew3RhO3gVzHlzT9
	 WLHSXtT9W5jQvAk5e1xQBvW2LOcWd+Z21NIoRkbz5CvnVNvyz9ILDbjx+5fdhP4vPJ
	 ogU+oWqvmfK5bVZfEDkuMwbrsXeHYZL5Xcj6kGkJSGlCtrQ4lRzOy7p/Mm0VDdqlVN
	 1DBZII00K0HDkdiXme2fW4VM4JdkL1BYS0m8SV2n4n58Yxv72hlxmh0YZ4xQ+2QDRo
	 UTGnYZvhbOmR8ohAermOtiBnC62kDFjE6z4dTvrBnyqTKr/DTD85RsuNlGOJMlKNDN
	 xGsVf+AWLG0FA==
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-70b875f6f1fso1291041eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 02:14:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErF98GK5/jk3mt2e358HpjVw8olW29RLf/PozqdDgfejMJPphntKdkRhZVcZb37jb16fZ0DAwZPfupQ/SwOoPRf6@lists.infradead.org
X-Gm-Message-State: APuU4Z8HRRVUvZVAtmVHrP9DGlv1aeGT+VhdwvPGX1zooiZAHZ29srAD
	PxQIQNGCUzKr/o+Ree67vJmXNVK4TKjyEXqzRXiC/S/0eHGw8STdkPF2sMd/9kvNpkdtAAQs0eV
	MnH9l/2grmHpXPsU6OpVcvtRyKYP10HY=
X-Received: by 2002:a05:6820:6fc8:b0:714:b51d:f512 with SMTP id
 006d021491bc7-71ab4fe25a8mr1039390eaf.17.1794564884552; Fri, 13 Nov 2026
 02:14:44 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261030-clegoffic-pinctrl-scmi-gpio-v1-0-52d92843ad97@baylibre.com>
In-Reply-To: <20261030-clegoffic-pinctrl-scmi-gpio-v1-0-52d92843ad97@baylibre.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 13 Nov 2026 11:14:29 +0100
X-Gmail-Original-Message-ID: <CAD++jL=+WPam=9kJgCcxjTUDh5AD54GCAjQp5uyNt+gqsVxsXg@mail.gmail.com>
X-Gm-Features: AclHuK9TruFFk1ZreyNiLZ_y6WML95I33IY0-K9MfVGzsVGUebv2rlx1RB9oHqc
Message-ID: <CAD++jL=+WPam=9kJgCcxjTUDh5AD54GCAjQp5uyNt+gqsVxsXg@mail.gmail.com>
Subject: Re: [PATCH 00/11] pinctrl: scmi: fixes and GPIO function support
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 30, 2026 at 4:58=E2=80=AFPM Cl=C3=A9ment Le Goffic
<clegoffic@baylibre.com> wrote:

> Five fixes: the drive strength went out in milliamperes, the schmitt
> trigger enable was mapped to the input buffer, the settings Linux
> carries without argument went out as disabled, a setting the platform
> reports off read as set, and the protocol layer read past a
> PINCTRL_LIST_ASSOCIATIONS reply larger than its receive buffer.
>
> Then GPIO function support: report the pin-only and GPIO attributes of
> a function, give pin-only functions no groups, mark the GPIO functions,
> and select the GPIO function of a pin on a GPIO request.
>
> Tested on R-Car X5H with a v6.18 backport that needed adapting, all but
> the schmitt mapping, which the platform does not implement. An LLM was
> used to review the patches and to set up the tests.
>
> ---
> Cl=C3=A9ment Le Goffic (11):
>       pinctrl: scmi: send the drive strength in microamperes
>       pinctrl: scmi: map the schmitt trigger enable to its SCMI type
>       pinctrl: scmi: send the settings without argument as enabled
(...)
>       pinctrl: scmi: give no groups to pin-only functions

As noted:

These four patches applied as fixes and I will also get them to Torvalds
for v7.4 ASAP.

I think we may have one or two more SCMI fixes that need to go into
v7.4 but it's good to start with these.

Yours,
Linus Walleij

