Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B470606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 13:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mMq6RuD9;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AKKE9f5t
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=eAIs0oUI+YPmPLZo54ZycZGgVU2dXBDMzLaTztAAp7o=; b=mMq6RuD9+5QQTL
	UppEmEmDDwPhvtuPmb1ERgpioiFuRXzDlJcJvRq4SL+X54EwvQIkNvk9oJahgGlcaqhRROiJ46Wxp
	QUViIhpC3als6hk04jM1JoIIyeZ1sHP8NpLa7OOKjuKrt0MRY3JY4rHwk/ga/ObfDhaJGBB02H2SP
	0NDiPFAj6tgCg0rTVKhx5Y/B+94Vh2HZoMj+A5VQ3y8WCG58w80lM+Qn/o3DART26f/NcM2wceFg6
	ruGT9fpoPWgpH0vkNAoH21FL1O1bXy7DPXN6lzEHjQj1bnQ6dzczLAH+++xgE2Xus6MvFq2ZUxDRY
	h0qPGkwiW1O2Fy6Z3XYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWZKw-0000000DJun-1WA3;
	Thu, 26 Nov 2026 13:16:30 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWZKv-0000000DJuW-1Vai
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 13:16:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 31C1F6262A
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 13:16:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4B721F000C4
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 13:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795698987;
	bh=eAIs0oUI+YPmPLZo54ZycZGgVU2dXBDMzLaTztAAp7o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=AKKE9f5tar8k8WvuoypakZvL26D8s0k6EGpd3UqOtdzqxSDYv29gJS4bAfsh9R4W5
	 ErxpPkY7zEBlSd/GLqsPtCqn/dxtk25UEKb+9Af/B7NHye9g/MHeL4M0YHdCjIpiaw
	 eUmOkmo2W8n/1VZCKlbxUR/mjEz0zkvNGSEPcZq3l01ZDA7oMq8s4+bpv9+1cgcald
	 dsSivPuqoQlCXTt9a9VyuCPSyg7Snl6AQhNEpb2HVzOHjCbYScfm7yeUXRRSlZWEsB
	 g8wRDS+RYxz0XsB4nWLuw0LtKeOpLjfTZx6nEviLq+T8SVk2YNJgRTiSuz5MPqzinU
	 mmoJj8s3UJ8kQ==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5c1465bbbdaso5926611e87.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 05:16:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHMqxEeCZo8bzAxgqBdBrbjNKukMw8rqGFXAVzUyCwXWIazSBRfqK6eMDzDWpg4oNMdJRGF2TjUoGNvnz5+7lYA@lists.infradead.org
X-Gm-Message-State: APuU4Z+BpW6WKtYpjNbS2BCqM56ghpJmcTOCVlnx5StOMB8SWS1WRS87
	3zsX7HeS7n2TPNJi/RX8V8DLBoD/A32varaLe/okMuG5J53MHEEaWHsXrQPclYn/cYPS0NZHlVf
	uJpaVEX34MIKmO0D0IA6QW4NEJYXcs8E=
X-Received: by 2002:a05:6512:3d1b:b0:5c1:ac75:6604 with SMTP id
 2adb3069b0e04-5c1bc847d12mr5899749e87.19.1795698986523; Thu, 26 Nov 2026
 05:16:26 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261115224136.818305-1-martin.blumenstingl@googlemail.com>
In-Reply-To: <20261115224136.818305-1-martin.blumenstingl@googlemail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 26 Nov 2026 14:16:14 +0100
X-Gmail-Original-Message-ID: <CAD++jLkzm0qTMJsusBd9m+gidwaBPgBbqMEeJFE1t_0ZDMf6NA@mail.gmail.com>
X-Gm-Features: Aa3M54oPi_3zOy_RBrvdi6FjyccKcrCZDV_Tb3Dpo-BA-Pbh5aQfsxCi44RP1zY
Message-ID: <CAD++jLkzm0qTMJsusBd9m+gidwaBPgBbqMEeJFE1t_0ZDMf6NA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: meson: meson8: fix I2S pin group names
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
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

On Sun, Nov 15, 2026 at 11:41=E2=80=AFPM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:

> The I2S pin groups are registered without the _pins suffix, but the
> i2s_groups array still references them with the _pins suffix.
> Update the group names so that the I2S pin groups can be referenced.
>
> Fixes: 64f6d07ba74c ("pinctrl: meson: meson8: add support for the I2S and=
 SPDIF pins")
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Patch applied for fixes!

Yours,
Linus Walleij

