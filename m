Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01260606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 15:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wQAD8gj0;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=diq5dYJw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=jmWJeixrMEXpie6DAXTK5CBYLs8pa8Ts1AuNfFgx9pw=; b=wQAD8gj0ePz0La5QMZf/Aduwwd
	+9Mu5GAbW5COhH/EUSiSgvVbjms8r0UV2NHfLlc17oG3/91zFT2qA+Oyob11ibH9BVSBymyqpSjjd
	YsPHbaqc/XWWyxKJWBYpeAc1pYS0PNra/fxPVbKvdXAAuSGRSoKvD0tpkrNDgFGMkoG2TDnapAwG5
	JeYikPcdHiK6V1PHGeaA2dlNvwFmH6Udbq1A3ysLRnswza8DwfoVbUMQXuG7xY+ZlsOzHTRV77A7z
	V8CFrxKcV+RTEtJ4agqM4WlvkVWS4XjPFLBeo9brdiRxzUTnon2QJ48RQ7ZDwRawqNPdaLRyw7jBq
	bM+DYH1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUQcy-0000000FRVk-0yec;
	Fri, 20 Nov 2026 15:34:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUQcx-0000000FRVa-0fPf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 15:34:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 77E69627BA
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 15:34:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E9D01F000D3
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 15:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795188854;
	bh=jmWJeixrMEXpie6DAXTK5CBYLs8pa8Ts1AuNfFgx9pw=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=diq5dYJwexIEqTPONPlehD1IJUyXPFrZnvm/bNqWSZmLM2zjA4Y1R2aZtJEFdumPp
	 fTX42Kd4HRTy/GqOdEgojO2vGN50XdQQy/z9i/sBi8HiqRhcvrQz7gazoDYtGZKDzC
	 E0ps70NLaBHMpKo25cu0/+n56C8xwUtFcvviCcVBmh2oVf/gKeAy0BA0yA7MWeJoXk
	 xpZ59LBQaRDzGT4MMO5AOkFfE67L7I+jQDOSLCFu+cWbACiEp2ZMhB9omlMZWG0FyT
	 U9zsnq2WaDClLdcbaRIHTAPdFBWFtt7Hy2ools29GVj7xLS3Vej2JbArQVpJps2FOb
	 qUHVY17bERT4A==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5c126fa1e3aso596850e87.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 07:34:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFPahgb4adwNbrfiLcVSbY0uXoFdoTQBzJzD/EnwI4wZESxHyL/Z+yUkvWcqoWkBmjNBTjFQgDU+MWp59lGfHdi@lists.infradead.org
X-Gm-Message-State: APuU4Z9eY0RtXxyTcPOpqsvfWnWWinRwlv9pAG6Elo7mFZzJeE7FAVir
	VQlfISxVKIivS7InL1uw6ePT455+JdVIcztKyI+QvQZ67gpLkzhGvP4LMWnWtdEnj1tFBJKXMjn
	Wo4tGkxqXfyejB/eocAn6MQpFKh7O6kE=
X-Received: by 2002:a05:6512:3a83:b0:5c1:4bd3:ef75 with SMTP id
 2adb3069b0e04-5c1bc6f6a8fmr1168547e87.1.1795188852628; Fri, 20 Nov 2026
 07:34:12 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261120-orangepi-zero-plus2-fixes-v1-0-ecd792189f27@gmail.com> <20261120-orangepi-zero-plus2-fixes-v1-1-ecd792189f27@gmail.com>
In-Reply-To: <20261120-orangepi-zero-plus2-fixes-v1-1-ecd792189f27@gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Fri, 20 Nov 2026 23:33:59 +0800
X-Gmail-Original-Message-ID: <CAGb2v64homW4cRqrtDVj3N29XDw3f4ZEmAok1btW+XuWd8tBbQ@mail.gmail.com>
X-Gm-Features: Aa3M54rsbUPr3cLC2JjkyHhLV0j0Q1SzwSnaTdHQp00CEqW85K3o6tde4cQxGOw
Message-ID: <CAGb2v64homW4cRqrtDVj3N29XDw3f4ZEmAok1btW+XuWd8tBbQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] arm64: dts: allwinner: h5: orangepi-zero-plus2: Add
 LPO clock for AP6212
To: ipfarher@gmail.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
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
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 20, 2026 at 7:40=E2=80=AFPM Ivan Pfarher via B4 Relay
<devnull+ipfarher.gmail.com@kernel.org> wrote:
>
> From: Ivan Pfarher <ipfarher@gmail.com>
>
> The AP6212 WiFi/BT module needs a 32.768 kHz low power oscillator (LPO)
> clock, which on this board comes from the RTC clock output (osc32k-out).
> Nothing in the device tree references that clock, so it is disabled as
> unused during late boot.
>
> WiFi keeps working without it, but the Bluetooth core does not: with the
> LPO gated, the BCM43430A1 ROM answers HCI_Reset and nothing else (no
> Read Local Version, no firmware download), so the controller can never
> be brought up. Turning the clock output on by hand (RTC LOSC_OUT_GATING)
> makes the controller answer normally.
>
> Reference the clock from the WiFi power sequence, as other boards using
> the same module do (e.g. sun8i-h2-plus-bananapi-m2-zero.dts).
>
> Tested on an Orange Pi Zero Plus2 (H5) running Linux 6.6.160 with this
> change applied: osc32k-out stays enabled and the Bluetooth controller
> answers HCI commands. Build-tested only against current mainline.
>
> This problem was investigated, and the patch drafted, in an interactive
> session with an AI coding assistant (Claude by Anthropic). The submitter
> reviewed the change and ran the tests described above.
>
> Fixes: cf8e19e1ec15 ("arm64: dts: orange-pi-zero-plus2: enable AP6212a Wi=
Fi/BT combo")
> Signed-off-by: Ivan Pfarher <ipfarher@gmail.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>

