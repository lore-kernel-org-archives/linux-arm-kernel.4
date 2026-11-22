Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2288606A332
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 18:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2EDogcwJ;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EQqwl5KL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=1lgSvXfM1NpguQppsGiqChdK8jo6yWYjCTv/SuCYsSU=; b=2EDogcwJT40gnv
	JbbG4pLv+577Cb65iCIQ2xC/PMF0PPK9Dsn3ENjhpvtjGyFgncT0JLgrsbdDoGoVDX8wkZ23H/6S7
	bwNMgsXo9SLSULZCmyGHIZn+ItYLsTjywqnVxv1kDur39QeTarrWb/8zadbDyy+E6GmbCZTNrfmo5
	2n65G0fXjF1k/BUpR/TTNMyjj1rcQ5arp+h52fnckBdGwS1YRbZ/rBZsAkejVk0KnmFHTIuJL5H/F
	m63PahfDEZw1XmWaAVnLYeifnl8oRmfzL5fhRLPTlpH4kSiL+263mx4wqyiWBXiTCPVHBnLiX6gXe
	mu4WxPn2JRhPORtYuVYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVCFb-00000001Wax-2LqX;
	Sun, 22 Nov 2026 18:25:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVCFa-00000001Wae-1zHC
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 18:25:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 344E16115D
	for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 18:25:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 743EB1F000D0
	for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 18:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795371916;
	bh=1lgSvXfM1NpguQppsGiqChdK8jo6yWYjCTv/SuCYsSU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=EQqwl5KLh9FgRgQqiZx1o9UPuVtiNY8FZnvmw/+tZVSFTK37mS04CnXsS9fAmXWuB
	 7It1be4gsmVswbDkShAfAJV8e2zCcfiiQPP2Tk+bLn0rXeUcv2TJEZcRTHGAGA2nQy
	 ZUnIpzPIzZEIVvwP4gFFE5gntn/gXfy3Vhl9nLOYL/FLzt2QwKmsmugVwVDIp1M5sO
	 Hm5KxLw2E+e6baRWkfcJ3+DQKDZLC3+/RXLXMX5aTRW3jQ9cZrQGQCXSSDLeXHopyw
	 ZIHq8mxHQCPmlk2C2T5Szd4UZUZbGO6jRRAssA2O/ZErO+IgeU3mIQiwDQWl1g5N0Z
	 r9VU2Qe/AHHRA==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5be4a2d94adso2294857e87.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 10:25:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErG9AuIycBp8KnBosjDGSD3Y4jxYsGFaoHzaQgWtitNQ+FY58YEbko00mpl1mi06+Misxn0yocKvyOKcc4j0Flvg@lists.infradead.org
X-Gm-Message-State: APuU4Z8/hZhLVU5I3W8kEZqGoNew0TFRAYCMeY0W/eVDvm35mjZCe2wU
	NOYZjiha8UxN5yU+q+DlQrthFjjP+XPicKQgmKne9D/EaMQ6DLv9/LxIIvTu6KcCu93Orgw8Qvs
	5Hj3+G+nUubvuyGdPry2HY80sKV583w8=
X-Received: by 2002:a05:6512:32d5:b0:5bf:ce24:242d with SMTP id
 2adb3069b0e04-5c1bc806edcmr2509874e87.35.1795371915162; Sun, 22 Nov 2026
 10:25:15 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261119-cs75xx-gpio-v5-0-8d14f2bb614b@gmail.com> <20261119-cs75xx-gpio-v5-1-8d14f2bb614b@gmail.com>
In-Reply-To: <20261119-cs75xx-gpio-v5-1-8d14f2bb614b@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 22 Nov 2026 19:25:00 +0100
X-Gmail-Original-Message-ID: <CAD++jLkLX_d9cFLOvnXs84_9j5JvwU-ab8mpKt98x2CjTBnb=w@mail.gmail.com>
X-Gm-Features: Aa3M54oX6RtYUEXPEftHEAaE8uR74PWqSa96JlgekCMpzJ1oVnJWKeD0gq7KO7I
Message-ID: <CAD++jLkLX_d9cFLOvnXs84_9j5JvwU-ab8mpKt98x2CjTBnb=w@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] dt-bindings: gpio: Add Cortina Systems CS7542 GPIO controller
To: filipp.dunsky@gmail.com
Cc: Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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

On Thu, Nov 19, 2026 at 12:03=E2=80=AFPM Fil Dunsky via B4 Relay
<devnull+filipp.dunsky.gmail.com@kernel.org> wrote:

> From: Fil Dunsky <filipp.dunsky@gmail.com>
>
> The Cortina Systems CS75xx SoCs have five banks of 32 GPIO lines. Each
> pin is shared between a GPIO line and a peripheral function; the pin
> mux lives in the global control block and is not described here.
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

