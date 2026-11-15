Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2702606A329
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 22:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kR8gVsmI;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=zLSOwd5w
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=V+qix4MwBv7O5yjEyViR1F6mCZNMRdVo4wwBMAHfu4A=; b=kR8gVsmIv2B4qy
	f7dQQzCByH3Mt6vMzG5dc3/EMjAU1aVUOQzYuUg51CPe7sIXg8EFCtkPqUOPvLrmCwdvjcisnXNU+
	9dgbVQSaoxO+jKunbqju+ohJIV1Lcek0S/9npDtDs/H/YfL9NaLRU7BCvcdOpZE/+yOU8OWuYrpaZ
	5Qf7XOPpiBsrg8GkQOzTWV1VwibxJB9pLW+DdSqWffB0oSsK5dJuXkj3qzusqzDNylTb8gHG3dBKh
	UQ+fXNi7J/200c8ygyYEnsnOUc6N/Rohrfz0bsOCJmTkWczvWSwO4HwAcLFsHg9Zwp/7AxZNcWxzE
	l77r+xREe+xhZghnEVvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSiUP-00000000cJS-0piT;
	Sun, 15 Nov 2026 22:14:21 +0000
Received: from mail-yx1-xb132.google.com ([2607:f8b0:4864:20::b132])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSiUM-00000000cIB-1Y6O
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 22:14:19 +0000
Received: by mail-yx1-xb132.google.com with SMTP id 956f58d0204a3-67db8985419so287830d50.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 14:14:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794780857; cv=none;
        d=google.com; s=arc-20260327;
        b=A3Sfx8sLgIGtTOFliCRcQakfqY4G1g5zK4mo59z8ZjkDV/0YrFvSstSH72CYU8uNdt
         /v6vcgrFmJtS8VxrOfWxGDc5N3R9qunvtpC9u3ZtWzvD5AsNnz5Cl3b/EVgnQBMffvtd
         1JtGc6uVEiyjSHGdecgU2CqbPvSZeMO0zLkIQS8TDZxttivZ3iBZ3MQkBTJghxenVr/M
         /q9sPPT2+t1XAV8iQEbopbMCzfM3ague2RkW3O4Z0POMiH3hPi0aJt0ICe4AGB95l8Q1
         FI8b2WE6Pn/SVrCBDYoAHCD6RICpggIekCsSIqK2G5vCWAApLnOgrBsnBTdVcNY7gx7f
         t1hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=V+qix4MwBv7O5yjEyViR1F6mCZNMRdVo4wwBMAHfu4A=;
        fh=x93K9TGcu51qj1HH6vNjTC4OmUTWAfYBY6CkwLnf69w=;
        b=OOVy6pVhRncuEDkmXvEMunWG66yhet51CScwdrtKHa9ZYsU0tMdmY9LZPdp/YuLe0M
         0/ZROSfGZWS0jGNh1AYLfbZHbp5uZHtW7L2c0am/Je3HIjta+Ko2JymWYybaSQXmuRkt
         eoZxqpbxQu4qWw4ojnnuTzV6TkvUbtTg71K4iD9oAGPe0J9e0xKx7hERHWrviuHtVGpR
         Y1B+momeM4Q7CuXc05pvdfISJpc68uZIfbs+9ZKxLgSc2GK2SbRYcLvYZkYlOsZpTK4e
         og4x1uhRL45q2Irn6Ml+Zey62/FWNmu+MYoD2ye4Ias1vpkrA2wq4+FuVgS8PhkiTCJd
         e4cA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794780857; x=1795385657; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=V+qix4MwBv7O5yjEyViR1F6mCZNMRdVo4wwBMAHfu4A=;
        b=zLSOwd5wypJJwGCmm/VB9woQmuuDOCCb5/ySgqLOt5PU6orn8B8fPZfqtG812yvNQh
         jktdLyBhJckqPIWfRiHpO/cI4k8YHGafo5b6y8/hwXRoCIWfI3J9Qu3NY4F6Iw57hlQh
         3BSblOuOxn1KqRaJ9lybD3m59b2NpEEyj1vqjV+JVvZC0ET41lU45aF7MiuOraJPFEQO
         oLQVhvbdZED3A6jNorLo+bqusnM0S/bBws7QrsIvUSmPcHSEzIoQ2Emu5RcCotzWnJbE
         Ftg+pdqiJSjDkRjc3tJCcZeIHHWG6RCgXVpNWb5oImniG2bx2YmY5h7sHdXhURWq81J1
         T4jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794780857; x=1795385657;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V+qix4MwBv7O5yjEyViR1F6mCZNMRdVo4wwBMAHfu4A=;
        b=jTZCvjGEYVON3OIliFs5/BS4Fp+W/L7zCKIs3A/a9b6lehrPD4T/IkO2DeJOJO9Owy
         r3OlRuvfh+/vM4Ymu7gv+rruXyunA/dAooTXHQ4MhHf1rELBoJm/RQydsxU266PGtLBM
         8vJjD46F2XAEr0kJ2+mV2sH7pyjag+CIvWw12P9RgI6It1hbkK39FCjRwzt6dfHwrAHw
         kGKlomZfUfF8+yz1+QXrvejQtCFzxKfyWVipEK85XBWyZaqR/foPO61MCreSYskqCXgW
         wJZlKXNahqRYLGeOXJDpDADNa1fsYzcNzB8Dqkp9jOxh4FV8B5gdZiSrWfZVHg5mRYv7
         A18w==
X-Forwarded-Encrypted: i=1; AL+hErEN3AF4RKxAn3AoaxjzecpNqUrGog52kQ+7svxA1liUxWC7Mk5Sy4Qag0xUQ/uDRFz8pCAaO8j5y/rbtDibHV7D@lists.infradead.org
X-Gm-Message-State: APuU4Z8EA7PUqHyBWB21IPm7178hZ8xj5naNvtlOD002SqNPUf65ghsY
	s+i7OmxhZpOPp3K6LYyRUcjaIDTFd2qebzEcHGxl/XM5vgCUl4k+03WottmE53slKqJtiPxEjgT
	9dPcEn/rf5TbOdKA4z9t0koApYYR+O64=
X-Gm-Gg: AZFdTZe18zzD3tG9RvIhtzLXUPrrTFr/xPxuazzmk3+teEI7fdlODXeGb8u2Vn1MLTz
	HXTrJMpywkrhz4mZHYlmjFtP1cl9uv3ZPMWWqlaqhaocsP/w3SXLezzbSREmL6O0Vmzsy+i3cSb
	wmlD6h+Y8FMmbFtLCICIrAuAiTYhT5Ac+9huY86qPjz9OOg/RTuU/77gXy67EsogMf8YGS5URY9
	N7NKC8qyizKQB9/4N9/FKLCk1rhsk/GwwX19adVOdeYcW7vmOQKeBUIgQmr+IGw3hfqqpV2bAyx
	KjMoHesLyPo+1f87Un0pCKnf4skX3Fk5gqYlVcFmwjglT3xhFAamkUslIsNpKzEVTbL1cGWuMsI
	skpdNYKE+oEwB1tHI4r5f2lxYZzMu8adRnpV5sHpHAGV/Eotr0dIstIELCfbfGzVKp3w0zg==
X-Received: by 2002:a05:690e:4383:b0:679:f97f:fdf6 with SMTP id
 956f58d0204a3-67d896a8f2bmr3982114d50.66.1794780857112; Sun, 15 Nov 2026
 14:14:17 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261001-add-t7-sys-pwm-clk-v4-0-8ed2b1e0cdfe@aliel.fr> <20261001-add-t7-sys-pwm-clk-v4-2-8ed2b1e0cdfe@aliel.fr>
In-Reply-To: <20261001-add-t7-sys-pwm-clk-v4-2-8ed2b1e0cdfe@aliel.fr>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 15 Nov 2026 23:14:06 +0100
X-Gm-Features: AclHuK8Jibqkumh92MwUwV6k9LdMNZ5aOXfzAlbMwGyKMualpiO_cItbFylPmew
Message-ID: <CAFBinCB_Eam76VJWSWSyLRsnzXOTWohrE1NdqyJ8GhPFjWzfHQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] pwm: meson: Add optional bus clock for S4 PWM
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
X-CRM114-CacheID: sfid-20261115_141418_415404_BD1DD3C2 
X-CRM114-Status: GOOD (  12.01  )
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
> On some SoCs (e.g. T7), the PWM controller has a system clock that must
> be enabled to access its registers, in addition to the per-channel
> input clocks.
>
> Get and enable it with devm_clk_get_optional_enabled() using the
> "bus" name. The clock is optional, so existing SoCs and device trees
> that do not provide it keep working unchanged.
>
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

