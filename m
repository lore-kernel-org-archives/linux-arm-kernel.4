Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D058360A2613
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 06:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=10wtNKRM;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v4do4ea4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=o+5QUw2PCrKwYeqKNjiahZ51YG2l39veBudVRc5XYKw=; b=10wtNKRML/HlKY
	rUSKzXuj+IRCBdN7JVHVFEX8F20nR4cdKInz0OLkvvX9K2OuRTaU4xw2VNQZ9LHtiGAoDtKcthrND
	bUKvfK7zhc2rtxrePjqoA2HwYdtdHkIstxgwdVABOmahi04Z87TDxi66ZTw8qXqyw56ACLEtUzJhT
	cTZTv6a4+hgQNaSxIMQTPq1VU9PMA3ch/7U/P8TV4FoE1FpIqk8AJdc2dT2TtW5lQ0WUUyG3JMn45
	ztqOcgTLsVi7dcAHjxDuQmjDqw+kSJ+gswx6XZBlryydnVsCq5r8xwHuJFkGyfQtwktFggF5e+S36
	kcvXJhVP0YZzw2vvXWOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV0dh-00000000lCa-1bx5;
	Sun, 22 Nov 2026 06:01:25 +0000
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV0de-00000000lBs-14tu
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 06:01:23 +0000
Received: by mail-qk1-x730.google.com with SMTP id af79cd13be357-94965745d92so249603185a.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Nov 2026 22:01:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795327280; cv=none;
        d=google.com; s=arc-20260327;
        b=FQmjKlEIGURz+MFmXhD8FhMxLriDsOvKSFz2wdiGnsfDXYU22HOzJMApPZZLTCrRQa
         b13tbdujEiosgnuCpDOJhCOiciUXdrJRI/iBp7V5MlDwgnJBVo5NtTisYsUWA0RKtBqr
         EiLuMD7d2tLQqPGw7tYrFFWmtKZ1G+hH0hgEApA24KS1U96SMdHAg2c+s4ONnhaB9g9b
         9nALBfRBjVBuf43kGp4/dKTOtEJ/zAlBa5HIi+9ENVypS32vPnQSSRaL31Q+basL5gO2
         BWjLSwrzWwm9wYWJ70ftL0PSoiwZw2o1vey8v9t03Z2R7t9u7JFPRR2Vdp90zIKoTLO0
         IUAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=o+5QUw2PCrKwYeqKNjiahZ51YG2l39veBudVRc5XYKw=;
        fh=cyDL6tYOG4nUUYjZzxIwINnW4jvl5E5ijqP3Yk0envw=;
        b=jeJLnif8suwEb8jGeDRsUNeuGkw/PbiYgbqjgdyjIVtFYMPZPUDvxJX1cfKs6qE6oj
         0aDWRrVZJIotguP0Mig3ekEwfdmuQ2R3utQyobylYjyhRLCBHYt9GOusnft/nvTTkG8c
         1NsECNMqwJ67tOtq/f1Ec6/dgVzGvu8wwbRtu/nfwIYvXotO2F4JfgVZzD9EQSP0kk4W
         hZ9SoyTFUoDZZihbB7lx+iA1lkV/1n9jYHFbAumXu2XrnbmRHck2CRymQUfvfmQbQqiu
         7dvMIuMUuokvHX3OxpndKTQ3gCmAJ2GlNbmWvsjUsz38r4HeP5emQKwSuVVaypQaoTPK
         InNw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795327280; x=1795932080; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=o+5QUw2PCrKwYeqKNjiahZ51YG2l39veBudVRc5XYKw=;
        b=v4do4ea4f71Zf5vGpEhh7syUfsVyS4hOTc4Gv95bp4qIJYgxJWfcSDmVGbbLbdfjzp
         1RjT5lr5QhWRsmYCRws7oRusbeDBd+cjVrXYvJ0LcFzCGVFW/To9kZ31M/V4tR/A1fbQ
         NeRPx7OHDhPw+7GnSEJTubNHvEOUDPdlsLI7UUftWRQdbV1iwGNLJbJWxe/8/xZhnvL+
         JuVsGEQYqZR6rsYagI1qyg55/aMvMs+BphbBo3vJMqLiqPIJWq73T76Wx8iioUlTcYms
         Z0kn2ZD6mnXGC5CG3DDsLTKV4cTaeNoAPQj0gZ7oeKcl52z5tjbod/xWvSYBNJdHMoB+
         tgKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795327280; x=1795932080;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o+5QUw2PCrKwYeqKNjiahZ51YG2l39veBudVRc5XYKw=;
        b=lBD9jVu5Jq4pE/EXzIYgPVIuz9H3be+qU2jQjJf7LwcPVizhZzU5jYehuR+RaG7VBu
         NAxBFUOgz1T8AGLGa5pCjFfjxo7uIHOfAhiIKrgoWJFQOESHca2SSgfcc5A9VD7HIHsv
         Xf2E3z2xuUOjZ8KCwenELTtpgmkYIWxuCFqxbnPoYf53/nlNK1BiO1JUifYXKMc8I8FE
         sOcR4qPMN60AAfiNS1lZtJ/dQCp0tzq9ICA2UFadCPRZSxhQcPU2EhIE27x7JgCuADBX
         /rCFm/9sHW4g3/8fZWsQo73TJpO1W+BKL87R5mA6ITvPXynNkrSDWEQTVj8rfrd0KJXX
         OLbg==
X-Forwarded-Encrypted: i=1; AL+hErFZdoBd1wzkAaOS9ebcFuQ22Q2TVzV5a8T1PaaWMoSRZiheFFr9ZyHKQVgRyrrQz3L0xFzxlGRq5o5IopdZdrVM@lists.infradead.org
X-Gm-Message-State: APuU4Z+hwG4F2zSDNkuTYYULJN8jJqDfm74NuvipPfM/+HhKIMvzsLU2
	aGNMBFBQtiERqjBE4xmyDEnmW4Iyp/pUdwoylwQ3xoMC8cXHg+YFaAo9NY6f3fiZy+f2f3PW3dI
	REVOtD7MwldmNGwj0ujbpYNmQvxImyr1Dag==
X-Gm-Gg: AZFdTZft6QU+aEkPipanobYekDAYSIQNapNAzW/vLgb0uxQjubkJrt7HV7Si3EVem8+
	fZx0Z2VdUrhxOiFwQ0z/s2K9ModpSXbD5hb5R7eHjtE899k5/b4UdPusddvj1lzHomkG3CWS5A6
	n6+NIyWW7BC6/DbzQj5zGeiN2crBj84494SObAm4uxjFjwIgruQmfuPDt0PVsN6ZdVHToP1dd6G
	CIgVWN0ihrRfKfLExVLVPEL5Gg9WtYfPJQkPshcT5SFX+ez7+wFO7FRaW2WXKmnjWGceItZrTmH
	4gKU5RHXX9TWWiAxeQyySQJ39QzwABmMJctmYhmNun6O4p1mXugwxlkgQhueKuFNhfhUHzn8GDi
	U4mQ9349tUP2iORN04iEJ/x933jyBGWrD2r0JdhKrzAq2Hvzm1s55lPtKSD8VX3w+54i/
X-Received: by 2002:a05:620a:6011:b0:949:733e:ddd8 with SMTP id
 af79cd13be357-949ba9ef1c1mr1209539385a.54.1795327280273; Sat, 21 Nov 2026
 22:01:20 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <5e6ebf68.3773.1a201cf3894.Coremail.220110626hanxuechao@alu.hit.edu.cn>
In-Reply-To: <5e6ebf68.3773.1a201cf3894.Coremail.220110626hanxuechao@alu.hit.edu.cn>
From: Alexey Charkov <alchark@gmail.com>
Date: Sun, 22 Nov 2026 10:01:09 +0400
X-Gm-Features: Aa3M54pZ7IdaxPC9CbQNRh_pul0VaAYHm51kF77R__jgCL4fpz9IgdTgLw29bAE
Message-ID: <CABjd4Yxr9NuLwhsUvvryy-Y5fXhSHUdU239vEW1=M60zVaWhMA@mail.gmail.com>
Subject: Re: [RFC] arm64: dts: rockchip: rk3576-lckfb-tspi-3m: sdmmc0_det_l question
To: 220110626hanxuechao@alu.hit.edu.cn
Cc: linux-rockchip@lists.infradead.org, Heiko Stuebner <heiko@sntech.de>, 
	Liu Changjie <liucj1228@outlook.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_220122_311914_3076B531 
X-CRM114-Status: GOOD (  17.20  )
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
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, Nov 22, 2026 at 9:51=E2=80=AFAM <220110626hanxuechao@alu.hit.edu.cn=
> wrote:
>
> Hi Heiko, Liu Changjie,
>
> I have a question about the SD card detect configuration of the LCKFB
> Taishan Pi 3M.
>
> The &sdmmc node uses the board-specific sdmmc0_det_l group:
>
>     sdmmc {
>         sdmmc0_det_l: sdmmc0-det-l {
>             rockchip,pins =3D <0 RK_PA7 RK_FUNC_GPIO &pcfg_pull_up>;
>         };
>     };
>
> which muxes GPIO0_A7 as a GPIO, matching
>
>     cd-gpios =3D <&gpio0 RK_PA7 GPIO_ACTIVE_LOW>;
>
> The SoC dtsi already provides sdmmc0_det for the same pin, using the
> SDMMC0_DETn function instead:
>
>     sdmmc0_det: sdmmc0-det {
>         rockchip,pins =3D <0 RK_PA7 1 &pcfg_pull_up>;
>     };
>
> and other RK3576 boards use it together with cd-gpios, for example
> rk3576-evb1-v10.dts and rk3576-evb2-v10.dts. Both groups configure the
> same pin with the same pull-up; only the pin function differs.
>
> I tested the node below on a Taishan Pi 3M with mainline v7.4-rc2,
> i.e. with sdmmc0_det instead of sdmmc0_det_l and cd-gpios unchanged,
> and card insertion and removal are still detected correctly:
>
>     &sdmmc {
>         bus-width =3D <4>;
>         cap-sd-highspeed;
>         cd-gpios =3D <&gpio0 RK_PA7 GPIO_ACTIVE_LOW>;

Here you've just used your pin in the GPIO function without
configuring its mux into GPIO. This happens to work in Linux due to
how its GPIO and pinctrl subsystems are wired, but it's not a correct
description of the hardware and is likely to break under other OSes.
E.g. U-Boot doesn't implicitly re-mux the pins used as GPIOs and would
be likely to break.

On a more general point, the reason to use GPIO for card detection on
Rockchip boards is to allow the controller to sleep with its clocks
down when no card is inserted. It cannot detect card insertion via its
"native" CD pin mode in such a case, but GPIO can.

Best regards,
Alexey

