Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3772606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 22:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eTPtMy1m;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=M8OVg4PX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=kJAkRdpNaj0JXIeCqo3bYKeQ45IEZOOmHicMvNGpVtE=; b=eTPtMy1mbG3Ghh
	YPF0YFayFICXwn+jJ3jCqSY81rwg/fQMUzdV10DOJZOiNSuoBjx3V1bEnbJ7wAvtLJAnfRQF4w/UL
	ItIz9W8Ayl7mxsu+Os/JGClE8gS9n+28+PGop4N8n+SopAwvs8w0pPls57hF6KQ8T+DPjim7FsQm8
	l8bKUycSksDTu9BG2CNGrcIfscJItbBwHGn8+DoXNTIviFBSGYmZ1+tbIQ0X4nPSeYegndiJcZdKX
	65xgCqg6Dbji6zcWowTCf4kkuKFM+yn055455DNIugd5yUuPn6ut0yOb8GupMXILeGTIru6yEDny3
	FdxMsEDGXOPAaziftZCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSiTa-00000000c6b-2TIv;
	Sun, 15 Nov 2026 22:13:30 +0000
Received: from mail-yx1-xb134.google.com ([2607:f8b0:4864:20::b134])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSiTY-00000000c5u-1oFW
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 22:13:29 +0000
Received: by mail-yx1-xb134.google.com with SMTP id 956f58d0204a3-67db8985419so287287d50.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 14:13:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794780807; cv=none;
        d=google.com; s=arc-20260327;
        b=EQlgExItdFwDZ8llHEllWJNuNs83nnJXCQOpFAsVNm9FI0FNZR+VYHS2f1v4wNibye
         0m+TgYqXl76Y9bblBxtWWITCDLELUiVwcrjc8rAuWC9AGPto0jCtPDAstJ2Q7ekZBdpq
         JfpUVaUry0/DyyQ9HiCYVrGdstQ9S8mQCDXgCe3akQJHvAGS6Ij6S6aRVMkfIDLT198s
         tRUP5VsK2l+54scdRnDuGtkzMGWN0+knlxIobT3zqczLti3IIlMuSBsvj7b8zJsr9Y6s
         q3EAzDVcrGdq9XA90Doju1FP4XgAyI+KY29z0M7FROkH4+qwV7UptuCBqlW50FYBGZQq
         a4mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kJAkRdpNaj0JXIeCqo3bYKeQ45IEZOOmHicMvNGpVtE=;
        fh=YrPCIQ4A2nvqN+bwpeYMPG8z7Nmq+8NQXqQczXuDxpk=;
        b=QBdehyrcOLtgsuVfTYJg4w9pxIKe3qTnJ5py/fjFEMLGjwu0IuJbOt4afQCbLUL1PZ
         B7T8QdlyoJRj8ruj5u1YIIAzb3x+n+F2srk9oUs8kE1e9Jz8SbI9dfFynsSNGF4G69Z+
         H3mBXBJDYMxJrpACh6XjZKGYjYAljBxYaqM4clXjQ4a5LsSIcKDPnIdRT+uXOyH1j1+7
         OAFcgg8rY/McID7HX2xQqk/PCA/kPk6p/VSwe0d5DSM6XR70A9eavNxghSbNYwNHNd3G
         sU5jgCjR98sebbY3wvsp/i4sK+Ls/4c8qNJNjyBNoFck7UFl0brFydxXckl9iapEBtQD
         GyBw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794780807; x=1795385607; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kJAkRdpNaj0JXIeCqo3bYKeQ45IEZOOmHicMvNGpVtE=;
        b=M8OVg4PXJJSVa9cKdVRVoTIzAflqNEFkPF8Ocv8seCzGIMs66pUS07zVsJvprv30Yu
         SHZ+KKYr+p3QX0+oXdIObMVrBiz+FxHw/o8k8LZeiUzN9iUQrgaAepKKmqfOTGy3jeWM
         TjlLP2uFAbYweNB6i62h+ruxah3Qso22JQdOyeHWZoat1Dx6Z0wYn3GMQ8TcWh6vjm+A
         IDB1sYJ3gMer3o5NPO7zjdc4x4QcEPfMTKfHcltAURtbsmg7VZxeiaWcTb9FfpWoCYDn
         6Fs26UZjpMP48sqZMhX5XXPx4OWEX9RkMWLkJwIPsi5xNUFC527j+l2v3u9KTxp8HaPj
         cFDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794780807; x=1795385607;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kJAkRdpNaj0JXIeCqo3bYKeQ45IEZOOmHicMvNGpVtE=;
        b=yiSIHl+0FrNOqQLZ8e66l7ul+sQnSjOBOzcCELghOJV9Q56Ki4I0Us26rsJyzRBsyr
         O8i02gB5s/UysQcyJARY7Ol72gb+yoJNC5kOWuZSgfsuNI2hQRyLRWglqyo3ByrqJl2M
         yRNQokktIRHjpWoDfWAqHCPVKUhLkArX84q7EmhEg60Bso15B+XPV3qECEZ6jg+PFyso
         X5gI2u/CWc34+UPnJl5bWrNUtWyiYN297AlQRcYE7Ttrg9zP2TOMZsvpHpd0fN4+8KtS
         +2cEujlXI9ZpQOPZzShg7wKQkaTShihOlihdSL3RPwPsBgh631zMyAB8KktBS1opxdnh
         NCww==
X-Forwarded-Encrypted: i=1; AL+hErGOSnOvmzy3awtushqWnWJq5v3AZgVGI3jfmtyeEuvh0LP7li9MmD6EpWLqqh+RnxFdc+z5F6hF0BNQY9lmVQNv@lists.infradead.org
X-Gm-Message-State: APuU4Z/8PZXY4Z7OZP/Je8DRguwTGsx2rRnxICalCRe6ZuEKAvmR6gCJ
	PcHlQVGyc0qrCVdGVYZO9pZqEgIDL0GSU0JizH+B+EZa36A8dq0E3wu/z/C+PRP5Vs8FuzUP7TC
	nTYP4WT/Gy9fzAheLfZgeKFHNeTDxatYhWUIe
X-Gm-Gg: AZFdTZcx5zho4a2wYr9NLd6rWc7Uw7/FyERq0wxpKogE5za5cm8SSrnqDzR+H9Mppjl
	CllYp7IIBDL/S7rhsenenKqug535FQTHdLOTNjNcCocylgbD6whTesmimGXQ7OS3NFyjIFGasjJ
	jy8IhpRTqEQLDEd9WGF5qGGW+ch6Il414qK8IPJR/zwrKMOZlSC4R+y5NFw/OdF3URrBqQWVJUJ
	ixvg8xBHi0o20ul7M9sFACdwjyfatsQDLxibhisEdAHYgl6CjoBPS3t62ixJFcuas8y/IgGVsZG
	XuPKj+slIWjzTs8RpdF8Yf95Pli/M45xqE+o6x+8a1h4u2IiIt4vec58yQ4lsBr1zej0LMKhs6w
	oC+xAQRZ/pDuodmeyXaOHFSmhyXawqWMKmnHn2zAJ+64UOArGScO2wkWascxoPcVAaV10ZA==
X-Received: by 2002:a05:690e:47da:20b0:67c:2ae8:dc7f with SMTP id
 956f58d0204a3-67d895a8de2mr3616052d50.26.1794780807215; Sun, 15 Nov 2026
 14:13:27 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261001-add-t7-sys-pwm-clk-v4-0-8ed2b1e0cdfe@aliel.fr> <20261001-add-t7-sys-pwm-clk-v4-1-8ed2b1e0cdfe@aliel.fr>
In-Reply-To: <20261001-add-t7-sys-pwm-clk-v4-1-8ed2b1e0cdfe@aliel.fr>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 15 Nov 2026 23:13:16 +0100
X-Gm-Features: AclHuK_5guKUt0BBmOKSaBjMvD6Ef4THAVZjtyLJDUGu11vns0QZX0fCV-z62Yc
Message-ID: <CAFBinCCBZTN8m+u+VyR8sijC8ihaQR8woBtG47LJ7tw_ftbO_g@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: pwm: amlogic: Add bus clock for S4 like
To: linux-kernel-dev@aliel.fr
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_141328_479183_915B2CE5 
X-CRM114-Status: GOOD (  12.20  )
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
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 1, 2026 at 6:56=E2=80=AFPM Ronald Claveau via B4 Relay
<devnull+linux-kernel-dev.aliel.fr@kernel.org> wrote:
>
> From: Ronald Claveau <linux-kernel-dev@aliel.fr>
>
> The T7, A1, C3, and S4 PWM controllers have a bus system clock in
> addition to the two input clocks of channels A and B.
>
> The channel clocks are acquired by index in the pwm driver,
> where the bus clock is fetched by name, with optional get
> which is silent when not provided.
>
> Require clock-names and minimum 3 items for S4, and devices
> which fallback to S4, where the PWM devices do not work
> without all 3 clocks.
>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

