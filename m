Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CF17606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 14:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TcMRNKRH;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DHmikIoq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=XWgHxxw6EzmAFNHm6I5mTHp/KXf3zQq3hfRAvmIG95Q=; b=TcMRNKRHj3ITVtrjrel+9SMqag
	lwjz2VCsaQm5e7YzVI2AhMjy2EL3G8Dr+YwcZvxJHN7ZNib5CZREnIMGrL2KXlpZPrgeu7KXlJDMh
	LQwmOjPAsLfLXA0qf4prdTnp0QvrldgX7VnpJCFHEG4Rks5SSbuNvqQEjs580SfiT1MyB1K25o36j
	hfcnaacoyd34gxxcA/4vbbFl/nMc5YRuWBEEEi8BS3z4ZJVuUFCDGXUfQjmBQSF3JcAH4kVfriD51
	9PISPz8WxJn2r9duD2KTV20MY1owznUWr+7MhAykqwRMb4WqijP5VlrDmXtbRJkZYmCY1Q7iOf86u
	FZCw/nWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSaqx-00000000122-1VBQ;
	Sun, 15 Nov 2026 14:05:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSaqv-0000000011e-4BrF
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 14:05:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 86B34623EC
	for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 14:05:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BAB41F000D4
	for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 14:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794751503;
	bh=XWgHxxw6EzmAFNHm6I5mTHp/KXf3zQq3hfRAvmIG95Q=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=DHmikIoqoA22jou79nFPP6iVVKr/WcDGON2aE4C8Axj7L8F3fkMNUoZYTdklMRKXG
	 NK7tyA7Fr3XZD8iHHH08E3nedo/wrttTJTg+tXtgk4OC4oQzo1cS5LJfD8tw8+pxR8
	 Ra7wLraVk3W2vsCxI1CjtIwSptBSqIkSycIMbG3lTTxD9d0ccAovYYlEEqWoGW0h2l
	 p0N6ZDFg2U22SOOx96Gl3h0kWiGDck8cKBw9oriP5k14J5egXlPMnfIgj6pLhk8MuB
	 z3fNnAQZ8ETyO0lwv22D6FIr/ErOsFIpP1NK6ROiHzWWbXelmSxK6A+ucgy/yAH2p/
	 pSX4yQOq885Vg==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5c07c7306e1so2868414e87.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 06:05:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErELjlIu/70I2azJmGqXDQVU2dEOrezB/j/LhtaNyAAY0wiH5sb5/DJPEqsUQK7edsqx0FoiH7pjB51CAtzjXnOa@lists.infradead.org
X-Gm-Message-State: APuU4Z+ZsZyURff2zaNp8fUc8eu9HT+6N5XDx1yaAV3Wma7+UQpT4fTW
	Gd46gd8DxO95tjNEjP1h0Gd7N+STEIi0cH6hBHI+wwdKNZvjZEWOX9wwFS0/WW2Ey4PJQRZY1Q1
	/Rr0nkuIgF/ejhj48YcEBGGMu6PFXaUg=
X-Received: by 2002:a2e:bc90:0:b0:3aa:ee7a:5466 with SMTP id
 38308e7fff4ca-3ae2b4f52f0mr25507651fa.16.1794751501306; Sun, 15 Nov 2026
 06:05:01 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261115061102.229680-1-jernej.skrabec@gmail.com> <20261115061102.229680-5-jernej.skrabec@gmail.com>
In-Reply-To: <20261115061102.229680-5-jernej.skrabec@gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sun, 15 Nov 2026 22:04:47 +0800
X-Gmail-Original-Message-ID: <CAGb2v643JrFOwrLrhUOTenSVbRgOVz+hEDFqXDR+0eF9fNpOfw@mail.gmail.com>
X-Gm-Features: AclHuK8_QfEct_D3A6zPG8V_CU046sWNEFKONymgEnMQSD9bb71yZqe8AOLlRsI
Message-ID: <CAGb2v643JrFOwrLrhUOTenSVbRgOVz+hEDFqXDR+0eF9fNpOfw@mail.gmail.com>
Subject: Re: [PATCH v3 4/8] drm/sun4i: vi_layer: Limit formats for DE33
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Samuel Holland <samuel@sholland.org>, mripard@kernel.org, 
	maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com, 
	simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, sboyd@kernel.org, 
	Andre Przywara <andre.przywara@arm.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, Nov 15, 2026 at 2:11=E2=80=AFPM Jernej Skrabec <jernej.skrabec@gmai=
l.com> wrote:
>
> YUV formats need scaler support due to chroma upscaling, but that's not
> yet supported in the driver. Remove them from supported list until
> DE33 scaler is properly supported.

Somewhat related, but I think you also need a patch to block fractional
coordinates? IIRC that also uses the scaler.

This was flagged by my review agent, but I vaguely remember it being the
case from working on the DRM DMA helpers.


ChenYu

