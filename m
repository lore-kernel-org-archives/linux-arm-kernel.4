Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D90FB606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 22:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iIa3zNYe;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=vg6HCweu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ZAFY3cUder3qW+PINYFFGIewRXLP/J/NJFjtZaZIdPQ=; b=iIa3zNYe5Zd0PL
	YJRRdUQL5CBgUSBwcDbwPXLGx26Nv9cEx9LSdKIViSqJ/TFuSQWYveJZr2UIUS/5CmP7Rtbwxy9Vm
	3chql7rWO662z5YvMOYoogEuhGIWb76OpKaZ7S62BmEOBZZH+sTBPY4CbUMGHAtagjp0TFiA1rk7r
	PZ9q9wKQjx3sCxqV/t1G4TMttsWRnqcCAVLcmofw0apr62y0uEuqBYBgR+PaOUUHx5nvdgAtEQIMj
	LQcFFDWSwr93nwfZ+a0vw7PJU1ShytpPEJDLrnPrJncWuh7tmOLsWyC1JKpMSQFpa9MOa2T/zsDBb
	t4t3Hsw+abBePD4kJNjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSiax-00000000d1g-2ldK;
	Sun, 15 Nov 2026 22:21:07 +0000
Received: from mail-yx1-xb132.google.com ([2607:f8b0:4864:20::b132])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSiav-00000000d0A-3aPX
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 22:21:06 +0000
Received: by mail-yx1-xb132.google.com with SMTP id 956f58d0204a3-67db5e13b0cso340646d50.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 14:21:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794781264; cv=none;
        d=google.com; s=arc-20260327;
        b=RouQ9Fgo3HgxUWWYb3zWqGH17671HoTJe6t1MDOVHZtI5mqUho9mDFJUiXv+t+/aow
         3AzGUQP5h1togFCYaspHwrSU/aEMh4UZEwlXPPOkonnSg0UMY2YlilXI6Q/T0U7w9N7O
         Mv4ymflFlCoo+9iZTAmVZImFLgay6TO0c691cjP6ZhizHN4RdOnMsQa/+pxftLzK+ax3
         MTnZ9UVQUOdvBqx4cIb1Vt0OuB7bLQHEtkLwwd6Xjet0nk9WwNXy8Ijo56rRkRb3XBZ1
         JW21BuaZgaSg6jJyaXpMraJIuXg5daGD245SkqNDSvgBKDHhiRejMGBpr2PvvesZcNDm
         GmBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZAFY3cUder3qW+PINYFFGIewRXLP/J/NJFjtZaZIdPQ=;
        fh=HASdl5UUeGmsW9ZKIaCiaSXndZ+DgWIAKdm6JPbkbcU=;
        b=e3rAqAtlL78UBp2d9Yrbthe67hinA1LtTk4W5ehcoly7Sr+qthFxUclYZsMQkFkI1Q
         9zuqFUlP0fwJFjPXwqo+Nk30AZYZ1LNLOw/dH6e74LaHieRp4wF0Si56lc1bVvJze1Km
         JbcIhFW7Zff2FScd+9qgPmVg6bm1v3kfd2FW1ixoTtWxRhpbznnVOAWr9qAKiIuesGLE
         VuoWjNyxSiEKswDUCGC1rwKNCHdWMPUzeHi/qtgzWPjG/BFgmWH1jXZ/4Ijeijx9qibj
         dZ2s4+WtfAu6Jj3UUS0e1hIgmmuKPUaB+Ks1r7v+WOjo422ykawljDJwVockA9OXhvXQ
         +kmw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794781264; x=1795386064; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZAFY3cUder3qW+PINYFFGIewRXLP/J/NJFjtZaZIdPQ=;
        b=vg6HCweuP4dJANoh9E9f/1R8JdfT92tZhJLDagKqQOwf7HAyxsUA+T3sbv3Dpp6XGU
         3iE/kfHVL2Uz3ZJDZBaFPFgNw860vesasXxHqfntvh/I6r33HMj7duYuDt+oeSobQ7qt
         WteU3uPo8JC8oXUYu+yKGt3QuHcXLCJaQCMOILWQDB3PPslUOfTZ2KLXXV3+Ndy1B7CC
         cgyxJmpYmOAolH+uUVL6hqR+dVELjgNrGoLAD3G+EQ11v6r/Hjc7rHfTeBW93pZNcPck
         zTrymyc/BNjwqyGbDLGrdwTuWWZpuq7xPwQ3Qou8YNibkLvO/Mp6URpXWb2/4aYTRg+S
         TiZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794781264; x=1795386064;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZAFY3cUder3qW+PINYFFGIewRXLP/J/NJFjtZaZIdPQ=;
        b=YzG/zNdH2PZju7sf9XHZesaCjzBIo/6yJIFdIiWRVE07Y/25V3yQ87Pb0YD4qXP5TX
         cmL6hFFVIxQQi44CPEdDT33bZXxqfn05Fa2WVzGkRLndx30xzdiViJq9CMIWUt6ajUiP
         it/1SOJzfEv+aZAepQxbL7niiwewA3DbFBuA/1HriLxk7RRoO9/slUFt8GjhXDkub5Ny
         LOplmrnECWmkZXgaYPnFU+vO60qst7x1KuHZrx9ihBBcQLSgoIUacPXCbaN5kkauwrAM
         n3je9XqF/CNiDVK0AkxCkYDsym1E5FX47BO7jmFQBnrdzeY7Fl2P+PBeQiCSS+MdYiXB
         VvTw==
X-Forwarded-Encrypted: i=1; AL+hErGqfejT2/Lp2ZkXrg2y0J3DBTaPHZZsDNxBPW/FMM++/7t+C0EefrS+ODImRSvtnJrfE3it+f1dasCg1jKDmiMd@lists.infradead.org
X-Gm-Message-State: APuU4Z9LIadf8nlkscGbdSHcwFy/lSPQ9ATBFCTvGDQrawWgOo2/NPvj
	/h/Z/U59GIkdaIvLxmJXVHAJZ7o3vvVDlMMWJKF1Q2WFMQXvNg9bjOjpLHj9g8eHT2vUXr2MY6C
	SVkMq3giqaynX4eKJ+5Cbdz9J/kvYsyM=
X-Gm-Gg: AZFdTZcAUEXV3niZ8J39sxavOYbyqirxKvOmLNtRqRFM8+cAlIaKllD7jqW4pdqD9zs
	7VYLjwpFvmyPVO2x9LCcCfaOzW6GOtKt/M2ao2TyVHncSV1T8a4HBu2Q/Yhf/MnkCL/fr7PeAue
	8SBSe1pTHyIRq/aScPamdKsm4gsxKr2t75psWqpXpjT3UPW1jMXdWkS6TQc7jNgsYthwxqw3t/C
	icMwdzj25uOaPaOPfzh4FHZ6yL7jBwNO7Lfk1VE3Wydp0Ne9owAWYRgNykm+bKfvf0j65n96zks
	F4hxgn5CWwrBIVPDIyyOilE/6k4b/DZf84oSQPu5DHRJ48B/psonYzehx2GeIGwsSZPyN83F2mX
	IwOAyQCH3JM6mzfdhGANKZhNzYs3abK7Uw1EyCfy5C3i7xun1YTpDlfMCYjLcCDHw97cgaW1ZY6
	LwyRGcUcc9Qret058=
X-Received: by 2002:a05:690e:4086:b0:67d:a3f0:7dac with SMTP id
 956f58d0204a3-67da3f0917amr1936855d50.14.1794781264626; Sun, 15 Nov 2026
 14:21:04 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261001-add-t7-sys-pwm-clk-v4-0-8ed2b1e0cdfe@aliel.fr> <20261001-add-t7-sys-pwm-clk-v4-3-8ed2b1e0cdfe@aliel.fr>
In-Reply-To: <20261001-add-t7-sys-pwm-clk-v4-3-8ed2b1e0cdfe@aliel.fr>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 15 Nov 2026 23:20:53 +0100
X-Gm-Features: AclHuK-51aJAWSj3WTQV4S_5nCaT5gjYIQp2CQlsLrogi8Dpichyl4UfpyRzP20
Message-ID: <CAFBinCCf2x3Ear_iOg9=KYXd5jbvAh2LdQb3uOME=Lry8Wm4HA@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] arm64: dts: amlogic: a1-c3-s4-t7: Add bus clock to
 PWM controller nodes
To: linux-kernel-dev@aliel.fr
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_142105_905848_C39680CD 
X-CRM114-Status: GOOD (  12.12  )
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 1, 2026 at 6:56=E2=80=AFPM Ronald Claveau via B4 Relay
<devnull+linux-kernel-dev.aliel.fr@kernel.org> wrote:
>
> From: Ronald Claveau <linux-kernel-dev@aliel.fr>
>
> Describe the system clock of each PWM controller as a third clock,
> and add the clock-names property expected by the updated binding:
> "channel-a", "channel-b" and "bus".
>
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

> ---
>  arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi | 28 +++++++++++++++++++++--=
-----
>  arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 28 +++++++++++++++++++++--=
-----
>  arch/arm64/boot/dts/amlogic/meson-a1.dtsi   | 12 +++++++++---
>  arch/arm64/boot/dts/amlogic/meson-s4.dtsi   | 20 +++++++++++++++-----
note: a single patch per SoC is easier for me to review but we don't
have a strict rule.

