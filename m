Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7908606A325
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 07:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ao4C0TrY;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=EwLd+eVC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=glNQGelvD/kDLrH/fiSkPVz0Z5oOzNw/2XFScRnp138=; b=Ao4C0TrY+BeLBf
	9JWoQdk9zDTbQl3Z3a8UVZr4nsUxW3KTujmqDuaHfO1GEsJq6vrRaJZHoSh61zkhKhQX2fRjU6OLy
	rGMPFCJVzDOcH7fk6CVAP5Hsf1XXxgqBKcZc0YvHuhrmNxX5wFOiIsh7fa+UdMjFNccHLoslyP25I
	K/ubHrWWHZtVUPsoG6BjZRvLYlYW0HC8JwaviWHlcrO6PJAN0uJ4Z+SITA96qIS9z/pNczKkgaqsL
	hRQOYLEmc59wNKwG6Q6hqgbJDKjnlhAdMrgNvo0N6ZCyYKzyNTYbKYuLONvReNWsI7asuZwNd/RrV
	zrrtgzWCzxS977eB/McQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTwzz-0000000B7ET-0esV;
	Thu, 19 Nov 2026 07:56:03 +0000
Received: from mail-yx1-xb132.google.com ([2607:f8b0:4864:20::b132])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTwzv-0000000B7DO-3jxU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 07:56:01 +0000
Received: by mail-yx1-xb132.google.com with SMTP id 956f58d0204a3-67dc7eb1442so1965401d50.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 23:55:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795074959; cv=none;
        d=google.com; s=arc-20260327;
        b=C8abwePFCP+bUfZHfX62YQcwTLj15d8HQdNac3IYbtPjh4jRWQ6vG5VzfmK8caj0Wr
         d6vMcPF9mVYJRpVqgw7sdVb/Jtb8BKKD3D1x7XzuWdJbg9Zql6oJqWOKVM8tb1ttxjWb
         UYLhRCVgnW52GtmC/4CgG1uIRavLzPNm6fGm4eb04n/I2lcZNVFuRx2a+1mmgUueCfHy
         0mVs0nmVPGwL/qdJmc66R19h/501Zh+vKoafMrrzHx6lsTpVIvgkuowXnyUCu5OgP6oX
         nKlMwnfri57cikTwEjaTRxlCprIdVwFgpBCyxE3JfPV+Ge0bUPOq+xHtlgJN4v1jCiF7
         StTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=glNQGelvD/kDLrH/fiSkPVz0Z5oOzNw/2XFScRnp138=;
        fh=YYy+B5uiWFAFDF+yrSi2MNytJOAgT1GNRkNr6khqVzo=;
        b=fz22te5biuHNK4Maer2Yc7gvqUZVGm/nTiOMHagxUflPn+gNE2kBExEDqjgopsejqR
         cupAbY9KbJW8C04pQQc10ovS3WCfebzEu33bs5kxhgHRTQ/cjpiwE08YqvoeiwfvlTjQ
         xcrKenOcnyB4IPMIERCv4GTzPN29WOlmgF+vPbZWl66+XBG1edHELFXMqIn3T2auKr1r
         omCxYgRraOLzYj6/vfr41ajDcamYqpsIXlhX/Qp78YEdAocjR87QTWGsJWXkHvfghQfh
         wiI1QgQ0m1wfAll8BBSN1cmmJQqJLZRWgCMdxnzCX0qxXHEql/Ls+RUesgr2ZclCyT4O
         /MDg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795074958; x=1795679758; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=glNQGelvD/kDLrH/fiSkPVz0Z5oOzNw/2XFScRnp138=;
        b=EwLd+eVCshNrd4COslojsSfbTYxvOGpg2pmZFihqJiU9evXh/nrsfCWb70CRIUckWJ
         o1c6c+8jIxv/wKLSOrRWdLlX/9Gp7Ditc8FZFQQsmVnhX7F7ZPlQNVAM/gFFb63YVgZE
         NVFG64lM9PMs8MI3JRXc6KxJRhnkN7LQdqQaQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795074959; x=1795679759;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=glNQGelvD/kDLrH/fiSkPVz0Z5oOzNw/2XFScRnp138=;
        b=dIx5lEqwinD/Jw+5VWrDrOrh063klrMgkVWE/VEQIczf03lIoF4v12KWEHE/KLX1ej
         D6psJrH3oocBQ6qWBxJvcYbHdDi6x67h7Ii7HBwg7S37cxIP/qIlatSWEBB+54zvJFIs
         NDfi7gkFei9osRaeH7O979WliobPB9s7k7OetG60WSzyyV5uf3BgSn8I+FfgrmLnIwsn
         3etSsVTayTbEGN1m/m1ST9SsM5UPnPS6bAIEazgY5s5ipR83kLhYMbOz7sMRZ1FYp3q5
         WN/fyEvdGj+P7yoCs6+2TOWUsO34430QNGHH5++I5TJ2ctrinHaejHBzw9iuAmIBmAAA
         qKeA==
X-Forwarded-Encrypted: i=1; AL+hErEdw0TCDm1vZWOXDntGsYdWLBFECebVLgvNWWUWwtre3JqL3ZmolE6DniN0UOTRjrIz+RwH4Kv+Fv5pGjEhzryb@lists.infradead.org
X-Gm-Message-State: APuU4Z9ndRHBmWlN6n9INxqnFqcV1M2t8yOGeN1SyDrm/QyAzBkqzTbp
	vUWQ2ElDb19cWD6pi+866ItEmqCPg/vZcRNQvjwTJAkLmfyEKIeMEbVsKb5oBE9A0ab7TUoQdiN
	elD+Dfp2S687d709fcqj8wiKL5mLBWZrDnEbSDspJllcarWwAWuk7RihI
X-Gm-Gg: AZFdTZfXc+Fqhll7De7M3sCDtzaUt8VFbBqUgYEUMsNO1zeA2USvo5VEUU9qvMZTmB2
	TKTRMwVgy9XwO9w8mwBCtZuKIMqtFz+6Y32tov5bNqJqi1BbJDG2xe4cw+n7vuldn9TT7TNb9ah
	zvgi+xID3PmT00JU4ERJrFAYl7C/C2B66qUnGWiGq9VI75GRrMxXWjOYJ9rGeqNV1kzRfkUnCih
	lIsaY2pQpjGiSvYgETT4ZZmTQddDnSCL9UqFyz9RIJo1iIDcyVWyf4JcSjUeXxVA6WvaFJNb9gK
	msAwb0GVNcuYL9O0PxR3KKI9Say8iGYRXj67A+YKoINNTQoCmN5+PxZimvaY4Fj+0uTHLu4FBnu
	uog7gj11tt9vMHz4bLo2ZvKHCgx5kR9w+NYcQCqT8Q5Abca4qf1X4H8NMtqx/krTeeV0=
X-Received: by 2002:a05:690e:4853:b0:67d:a059:2f39 with SMTP id
 956f58d0204a3-67dd3f1b3efmr1369617d50.21.1795074958750; Wed, 18 Nov 2026
 23:55:58 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261030103418.2355854-1-wenst@chromium.org> <179491350817.164578.3923681659802112857.b4-ty@b4>
In-Reply-To: <179491350817.164578.3923681659802112857.b4-ty@b4>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 19 Nov 2026 15:55:47 +0800
X-Gm-Features: AclHuK_NKKojwe2jAIh6fAUopYilD5lO7S60sKZvTblPy9cW1Wbrg51aFpv1c_s
Message-ID: <CAGXv+5FiRyp6MzTdOo3KygM1w20YPD+eCG=-K+VVbPZUYsQQnA@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm64: dts: mediatek: mt8192-asurada: Add ramp-delay
 for MT6315 regulators
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_235559_979737_B0E25CF9 
X-CRM114-Status: GOOD (  13.86  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 17, 2026 at 7:05=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> On Fri, 30 Oct 2026 18:34:15 +0800, Chen-Yu Tsai wrote:
> > On Asurada, the MT6315 buck regulators (Vbcpu, Vlcpu, and Vgpu) are
> > missing the regulator-ramp-delay property. Without the slew rate
> > specified, voltage increases may not have settled before switching CPU
> > or GPU to higher operating points, risking undervoltage crashes.
> >
> > Add regulator-ramp-delay properties matching the slew rates configured
> > by firmware, with values provided by MediaTek: 8000 uV/us for Vbcpu, an=
d
> > 4500 uV/us for Vlcpu and Vgpu.
> >
> > [...]
>
> Applied to v7.4-next/dts64, thanks!
>
> [1/3] arm64: dts: mediatek: mt8192-asurada: Add ramp-delay for MT6315 reg=
ulators
>       commit: 9c9f83e3368d27d1e0ba55827a171ebf551c3d0c

It looks like commit 9c9f83e3368d27d1e0ba55827a171ebf551c3d0c ("arm64: dts:
mediatek: mt8192-asurada: Add ramp-delay for MT6315 regulators") ended up
with the regulator-ramp-delay values for Vbcpu and Vlcpu swapped:

- mt6315_6_vbuck1 (Vbcpu) got regulator-ramp-delay =3D <4500> (should be 80=
00)
- mt6315_6_vbuck3 (Vlcpu) got regulator-ramp-delay =3D <8000> (should be 45=
00)

Do you want me to send a followup patch to swap them around, or do you
want to handle it and fix it up directly in your tree?


Thanks,
ChenYu

> [2/3] arm64: dts: mediatek: mt8195-cherry: Fix ramp-delay for Vgpu
>       commit: 04560888cde5fd8adc325a6ce47466f80b8c668f
> [3/3] arm64: dts: mediatek: mt8186-corsola-voltorb: Add MT6319 ramp-delay
>       commit: 929638df9f3b36665efd60ac71f1eed4ba36a0a5
>
> Cheers,
> Angelo
>
>

