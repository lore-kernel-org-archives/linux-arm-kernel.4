Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E417C606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 17:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pVUn1uDi;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EdCA8uVX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=f6MAiA1tU1RJJu+ItJqpHXoF/3Y5pGSsfxpH8J2NIlI=; b=pVUn1uDiwLmDX3
	yNgazW+wdrVOXexKyzNLqKyX7rb59Eg5EapTV/NJLPaX0Z7JGnT+Lh9iIPsNAF1A09eJY8GhoRUXe
	pMlt6yz1NWz2SeOr1qYRpDbE9cnVtuWgh8ot04Z3e2TdOu2vIGMMJzOGr9DRyFBdVc/h0LjKlFln+
	+qFNk8ml5QwBEChr8z+PX6aVeBB4F3qdRHQEm7iCVb9AOVACgI+VTRYcTcdH0nX0ckj6juMunSy7D
	ZVaGZ17iQrsnd0MxUljE53h6ELptu/35gjtb1r5PmPqxfriYhDP+ts3KtryuDayATt02QHZq5Mixz
	J5T/DrY2a/VgrtWZrG+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHEU-0000000AtDg-0mU8;
	Wed, 25 Nov 2026 17:56:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHE2-0000000AsuJ-3KR6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 17:56:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4386F62CA1
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 17:56:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E46DC1F000CF
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 17:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795629369;
	bh=f6MAiA1tU1RJJu+ItJqpHXoF/3Y5pGSsfxpH8J2NIlI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=EdCA8uVXpEv9BZg3IARiIxS2TGFdf/0pU6w2bbaZ6J2fa1WOjohRG6rSSL+NbzURY
	 pdrhlQHSTEz3ZFWI9kjxMLLehB0/0j5j1TugO1Uwfu2JGk7OPfbNP4+S3WgHpCluwY
	 LCYODLBLao6LPxMuye8LTlcHxke7A+p6m0l9BZgfnlOzrjZSaa+Bo1dQymqXVi+Itf
	 Q7Ylz5XdKdid0JDfDQFHtSPPdp7JxpCzPEOv3q6MG6VJKIhjZYeWuQBkjkW1UejyHp
	 2gg+2LNbbtazFtb1iZwAR5Rbx+D/cwN94WBt/mW41H9y7fFpAf2X8kXLrpxjo/iVHF
	 j2IelscQh2hww==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3adfcafaabbso55334171fa.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 09:56:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGrUaiC480E17cdOY3FeHhSs7VW8P02OROaRVEaYsWZZWJtcaANNlg605XnnXZLWo98Pbi9exjX6uwieJlxm/kQ@lists.infradead.org
X-Gm-Message-State: APuU4Z8lovZAEBwJIuZV1QrUlshG6mcS5usVdgVuIlbrN0ypXn2m5Fuk
	QitlSPEIvU1QjFvs5YrmMxtjBaU0KXU76ZMYKDvQM3y7NlTnEvotMnKHuSs3m4hRGcflEE204iC
	d8Qq3sW3iANDqtC8C0vQkCECfQOJKbH8=
X-Received: by 2002:a05:6512:31cd:b0:5c0:b5c:4052 with SMTP id
 2adb3069b0e04-5c1bc6819c4mr5241312e87.2.1795629368690; Wed, 25 Nov 2026
 09:56:08 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261111-rk805-pinctrl-alias-v1-1-e0c6cdd5b823@iav.lv>
In-Reply-To: <20261111-rk805-pinctrl-alias-v1-1-e0c6cdd5b823@iav.lv>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 25 Nov 2026 18:55:54 +0100
X-Gmail-Original-Message-ID: <CAD++jLn=+O55bh46owFdqb_TvQ+9KYfpLp6afsrO07v1JNd9Fw@mail.gmail.com>
X-Gm-Features: Aa3M54qcfqetMqqeazuNtJAXHuKFVrLAs7ZwHievoGEVbmIindCmaMEjBUdUnhw
Message-ID: <CAD++jLn=+O55bh46owFdqb_TvQ+9KYfpLp6afsrO07v1JNd9Fw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: rk805: Add the platform module alias
To: iav@iav.lv
Cc: Heiko Stuebner <heiko@sntech.de>, linux-gpio@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
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

On Wed, Nov 11, 2026 at 3:05=E2=80=AFAM Igor Velkov via B4 Relay
<devnull+iav.iav.lv@kernel.org> wrote:

> From: Igor Velkov <iav@iav.lv>
>
> The rk8xx MFD core registers the pin controller of the RK805, RK806 and
> RK816 as a platform device named "rk805-pinctrl", but the driver has
> neither a MODULE_ALIAS nor a platform_device_id table. Built as a module
> it is never loaded on its own, and everything that uses the PMIC GPIOs
> waits for it: on the Pine64 ROCK64 the gpio-leds device with both
> LEDs stays in deferred probe.
>
> The other rk8xx cell drivers (rk805-pwrkey, rk808-regulator, rtc-rk808,
> clk-rk808) carry such an alias. Add one here as well.
>
> Fixes: ea479996c79b ("pinctrl: Add pinctrl driver for the RK805 PMIC")
> Cc: stable@vger.kernel.org
> Signed-off-by: Igor Velkov <iav@iav.lv>
> ---
> Tested on a Pine64 ROCK64 (RK805) with v7.3.4 and CONFIG_PINCTRL_RK805=3D=
m:
> without the alias the module is not loaded and both LEDs stay in
> deferred probe over three boots; with it the module loads at boot, both
> LEDs register and the deferred list is empty.

No reaction from the maintainers so patch applied!

Yours,
Linus Walleij

