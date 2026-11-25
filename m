Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF690606A323
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 18:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VbCak5iu;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fKzucNgX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=U0l7WVFvXpjEU0OpudERY8yo7FO9CgUbNGWQ7+crlsQ=; b=VbCak5iuMvmUkn
	PQu4g+XmVvs5js3bB5Nve8GynJUNziSOv4g77cZ5KE/aKtTkMLLi5B9W3qUGkK70Mz+J0C991s/0n
	h/sfuWx4taxBggHMLYAKTKhSvzylUqoaHRMkqPlS59DrTMX8W9SwUGKrRhRgvQphNVE/XQTRPOHqA
	LKoeOPyALEyWyFA+WTxKZnF38m2n3Mvgte56qgxP1IiKt8RZ8BIXiCIMp31CQY9W94TXM9+TTLeeW
	whLrcDw8d53PwQHCS9VbNjHgGgtAb0+htxYZ45gcNE6EIB0TMveBvUsHnvku92LJteH4z0itblHa/
	xZIg+TDl6EQD0A+AC1aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWI4a-0000000B4Tp-14HH;
	Wed, 25 Nov 2026 18:50:34 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWI4Z-0000000B4Th-1PH9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 18:50:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A076244869
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 18:50:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 835261F000D8
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 18:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795632626;
	bh=U0l7WVFvXpjEU0OpudERY8yo7FO9CgUbNGWQ7+crlsQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=fKzucNgXaXd8pxmoDRYhybOX+fEH1GF5f16zWQ58OdJkXSw+f0xwRkZGh+h106zTn
	 lsyZdUpz8dqMpKxOiGkEey4VZaFgJARpIWPbueRLHDPMwiCymoeY9B2+ccd6gX0VLH
	 icAZQKiMZtWhtRsNtR1WFh56VfWn71ZHSo8kIwzBxzmY1C/ocC4dPjeHm3EVxLmMhr
	 G6czeuieY9ZIV+q3ms9S+aBWGbsjjs6bz0hgyGnDKUKhDbvg+V22DtOuRL8lLn/uuV
	 vPNjF0gbAxJOMXykbHM2BQUhTOidMTLvDH8SUTZKKaSE+3D9EhYI30WqH/sAwrTX39
	 LzmGbaEDccRWg==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5be3cff0f6cso4041180e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 10:50:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHHlpvhEMfSnA5u+tWM1JGkES/iRZXIF+DtDC5Vrw43tqZgRLt3P73bx9WQWLkHU4Te0HVga5S6mrqnXwkQ/HdF@lists.infradead.org
X-Gm-Message-State: APuU4Z/P3kcbReVzLjqcfnFC3nCmRUH9rNjp1NT8E+TZkfBbU7+hSKWy
	1prCkRm2bYFTIQjSDFoAn/4zrUMQdgAPbSJlxt/zQhWqMeXqcIqxfBJTfi3hqZMKBXquMxAboHM
	1/S/jJOY8KWRyQcY7JRT2Dx1CEywhTrw=
X-Received: by 2002:a05:6512:1322:b0:5c1:4974:c156 with SMTP id
 2adb3069b0e04-5c1bc802cd2mr6359763e87.40.1795632625298; Wed, 25 Nov 2026
 10:50:25 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261123-clegoffic-pinctrl-scmi-gpio-v3-0-d61f039be008@baylibre.com>
 <20261123-clegoffic-pinctrl-scmi-gpio-v3-1-d61f039be008@baylibre.com>
In-Reply-To: <20261123-clegoffic-pinctrl-scmi-gpio-v3-1-d61f039be008@baylibre.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 25 Nov 2026 19:50:12 +0100
X-Gmail-Original-Message-ID: <CAD++jL=V8J8VJ8zYeu5f5zB8mqM1ZoOoodbW-zmP1quNXz=znQ@mail.gmail.com>
X-Gm-Features: Aa3M54pDxjkO5lpUY9qHeq4Q4S0VXapxN7M0DHf5GY2RQ8jSNk-Y0rUOtTnHVUA
Message-ID: <CAD++jL=V8J8VJ8zYeu5f5zB8mqM1ZoOoodbW-zmP1quNXz=znQ@mail.gmail.com>
Subject: Re: [PATCH v3 01/10] pinctrl: scmi: report an off setting as not set
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

On Mon, Nov 23, 2026 at 4:21=E2=80=AFPM Cl=C3=A9ment Le Goffic
<clegoffic@baylibre.com> wrote:

> A get of a setting that is on or off, the flags and the pulls, returned
> 0 as a value, so every one of them showed as set on every pin. Return
> -EINVAL when the platform answers 0, which is how pinconf reports a
> setting that is not active.
> The input, output and schmitt enables keep their value: 0 means disabled
> for them, and the pinctrl based GPIO driver reads the output enable to
> tell the direction of a line.
>
> Fixes: eb524cb651b7 ("pinctrl: Implementation of the generic scmi-pinctrl=
 driver")
> Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
> Signed-off-by: Cl=C3=A9ment Le Goffic <clegoffic@baylibre.com>

Patch applied for fixes.

Yours,
Linus Walleij

