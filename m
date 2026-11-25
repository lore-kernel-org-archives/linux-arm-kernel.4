Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8793606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 18:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Mf/929IN;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SNImb11Q
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=5Io0n1UM01FxM2YuoZdeUpAUXrSxW1m5V/EllWFPRYM=; b=Mf/929INUYZCzr
	GnSub+rfEU7Y0I51EnpKNHWt8N0jywaZLrV2IJiezEd0idb7ksrdEiH1nTWFuay1bteDwepvcZaBl
	V2tr+uO//uiQsVgg+w7/d++MD2CasbChLuSSkodv3SnyDAAdOx177gZ4BYSXR0Jc+oFfnAi0QsTQa
	FdqusRaEMRE2Ojwi4mRIvdVfLA6cJImRUASH8gQ94WXz/9HozwPbTmpAltWGzmcJL7n8C3uDT0nOt
	YTk7zuuuLR4LPWQuxHWPEt/DokbKZecRhwpLVPZNonq7/uO7BUhcJlFGV/PXhXOPAzTL8PYKcNUWb
	5J/GyGmRcpWvKGsW8Q/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWI6z-0000000B4mN-3wR4;
	Wed, 25 Nov 2026 18:52:58 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWI6o-0000000B4lA-43zf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 18:52:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id F0399612BD
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 18:52:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 561A51F000EC
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 18:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795632765;
	bh=5Io0n1UM01FxM2YuoZdeUpAUXrSxW1m5V/EllWFPRYM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=SNImb11Qh/3b5Ium5CpmaPgPI2mW9SNS4hZxLcJW/z2GMrUd6mP3pUUEnfAj7GHUd
	 iEKYBQDo+EHJXn6ONIU7H5CYk8GyA93WA3xv6eZaqQcW3ut9KaZcFtERH9b8hZXOzw
	 A1SrKwbevpCWFx2RpXu0NBXb9oPM81Xw/FWdUuWMIovl4jBacH7Lot6mNzFF11nmL2
	 k+XF/A/e5PGs40zB8yCgiwH0l/vBXTrXvy4+TzibyY67iMJ39mn2wdkjbaINNfKhgj
	 RjxvhxhKiZxJjDRJKvpGDkukrpQopYqwZYoZqcw2b2iUn3Q4vThmcNHF3W8W8LdPVQ
	 ryCXAaaa8T7UQ==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3ae2fb3fe2fso55681861fa.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 10:52:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGtwZAKeFN4Wand7I2cJXvTqIDBVTa8GHTkLZCkQAoCFN6NLPgpiEGTPVioWyzHkxRrXhHWZH10L5EGBxHuD8j1@lists.infradead.org
X-Gm-Message-State: APuU4Z/nZKaJx7zWcMIN0/2QTQGU22Mh7XT8X+kiN0gommhgQG1/X9EL
	2S5rM91jkYS8XMdEtAvyriZKsEcN2vPOc+xlt4iJCM1X80pZ8iqTwDzCpehFgUOj3nmMvvdJ4ay
	TpnBbIpDkS9zpyBFVzK2UsyHg00+AuxA=
X-Received: by 2002:a05:6512:1042:b0:5c1:4bd4:9913 with SMTP id
 2adb3069b0e04-5c1bc662a16mr6789010e87.5.1795632764129; Wed, 25 Nov 2026
 10:52:44 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261123-clegoffic-pinctrl-scmi-gpio-v3-0-d61f039be008@baylibre.com>
In-Reply-To: <20261123-clegoffic-pinctrl-scmi-gpio-v3-0-d61f039be008@baylibre.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 25 Nov 2026 19:52:31 +0100
X-Gmail-Original-Message-ID: <CAD++jL=GRrzWy9p43FqK4WXDiTVpP_0n8sxj698csiCaA6mJ+g@mail.gmail.com>
X-Gm-Features: Aa3M54q07dB3zIMCACk22nx6jx_t6LUDnGDJTlh69A3EwVTfFUig6AKIR2eUh48
Message-ID: <CAD++jL=GRrzWy9p43FqK4WXDiTVpP_0n8sxj698csiCaA6mJ+g@mail.gmail.com>
Subject: Re: [PATCH v3 00/10] pinctrl: scmi: fixes and GPIO function support
To: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	Peng Fan <peng.fan@nxp.com>, Oleksii Moisieiev <oleksii_moisieiev@epam.com>, 
	Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Geert Uytterhoeven <geert@linux-m68k.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
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

Hi Cl=C3=A9ment,

On Mon, Nov 23, 2026 at 4:21=E2=80=AFPM Cl=C3=A9ment Le Goffic
<clegoffic@baylibre.com> wrote:


> Cl=C3=A9ment Le Goffic (10):
>       pinctrl: scmi: report an off setting as not set
>       pinctrl: scmi: refuse an inexact drive strength in milliamperes

I applied these two as fixes, waiting for someone else to pick
the firmware patches (or ACK them).

Yours,
Linus Walleij

