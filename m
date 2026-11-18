Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61857606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 03:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WP1ETa86;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=MX/qgvCl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=IOskFv7B1qRwSI1xnDutWFbR8KW2ByneEJ1ja9wWCsE=; b=WP1ETa86TxKtqO
	cLY05tb3I7cYvZGE2h3BfWFO35jYdcXYJIzDbeFPbw3j3HxUT6uHME+q0IIAG+dxCIg5e2ZfyORot
	RrbKU+SSr7BbSZgDGYYKaLRCDuzqIBGIMzbiyORQMFomigcax9nevoHb3hWzFuc5KrD6VK32SGFeU
	327TAZWAKcsUux50cyCaADHqZTLk/bU+XfG4kj0F2I+fkqzNar/cjbjhCFYzKhrSFHO88kSkrzNQ+
	NqV86YQU0XRfA+UTrI80Rd4EgYVK5lH1gujDB3C6YagECFMQ7AA+RKZY78UXCBWX0RdvB9JHCf6/7
	BfP26munIq6xqpfdy7Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTWk5-00000007frk-1uyA;
	Wed, 18 Nov 2026 03:53:53 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTWk2-00000007fr9-2eMo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 03:53:52 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-c40e30c26a4so328155666b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 19:53:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794974025; x=1795578825; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IOskFv7B1qRwSI1xnDutWFbR8KW2ByneEJ1ja9wWCsE=;
        b=MX/qgvClRB42Ve3nYKRlwlfTqgiUhj/FESYkp1phKBb4/2ic8hAcJ95husFjZn5gHq
         r1EY0Q64RaNpOG6AbQ9qf53SgAQ8chDjXkoln43RB/l689/QjIF7Wi4Wb/TArbXLV1ek
         Ku8mjv6HqbufGu+4NKxrEaNG9GkD/Be7gkjLM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794974025; x=1795578825;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IOskFv7B1qRwSI1xnDutWFbR8KW2ByneEJ1ja9wWCsE=;
        b=AoOgcIayLFPtFnscprLdvaKMY6RDlXJv/1ejPcasDEPfTVrUY7w8E5AKSo+s/1Gg5h
         1aUmO/rDdKu0gyjiXTO5+1nWJpSNH2/Pkjttl5wUBOJUVZ6cicFDOJJVP5rT1H417ykG
         QiGAywVczrc3jGNO9hZkdHe90NrLXVWW75PcD7uAqir7ECGopCUywIA08BSPaBg3DWdp
         pmCD97n20FVwvd2+ueizygHIBGLLmxQT39Xlum9vmCFgLUIa3Ow8x2bURwrfKIsyP7Lu
         iR0/m3CMvCuMKptjgfsbyri/TgWRVJTt2IKILqpHZT0qD4PuB6nGt9q0axMWJsnxkvGY
         mMxg==
X-Forwarded-Encrypted: i=1; AL+hErEZHO0s7NMuD/y/uLinlQWG1coN+X6h4EvotMmr7hJ3ABmvPBiH7AaQJusd+EDjihqxEKIYte3OKBpfX6lJ2Ydp@lists.infradead.org
X-Gm-Message-State: APuU4Z/kQiAv8CeOGya7QAdYa7tAr6DQCTGSskJkEiAiZPEHUWnPfn2I
	TbvGwM9SShlLmy7zAI7WhVtmIygqn56W84uBsQNJODZhfmEDUBBBOmTEidVlajiAJb+A7q1PHcm
	aEMSvPXv3
X-Gm-Gg: AYBFou2CpfPlZWZ42JZFFPbyYdRMdD7RBOHr7xwTAXA82o0sY2t9LZ9SWoOFUFxx+mw
	cUGncMC2t6Vx+DgqGxU7ZQO69Gg//MA3CkNM0eet2/3d5NzUWoiicLHhVhRqG1vBVpSe9rs6IHQ
	02BCdPU9lndj46RxissjiQKAmffH8d3MGVoGUS8jvrYY8vreCMSrZHKhA1z/W2Q7BKN+2bA5jXd
	ve/JqQ1rmSwBbn8USFY1NNaAM959btUonteohX5tHdTEUZDq8grmE3k8sMT+JiKNXJdUPDdqAHz
	ZEXeLzQCsvawh7V0h014K2HyTO6eSPVyxGVpH+fq+pmB+XLXEhkDNkAvar/KsWDzopF/7m2W+Ur
	fJnQDurBReMsEVSHyYCfqJVqueUcPKCBtCFG1XZmgzl1Dg610U38ijMrqjhLwn0hjFqaJHKsPJr
	9vi1k7+PFaT1jZuJQyFhyJpqZd7vUPDQ2eblG3o0ivBua0DLLnv9/St1PeNO7X6/dnZRyxmb17U
	0BNLcmfPcyVdq8xV5gG8v+BOcJ4DSmyF7dQlHEv+c8Cm3gULhBOqPIc8bu31GEu32aY41QCtjph
	L3PsxQL84oJ95QeepaBsgCHoXEPWlxkVKFhpUTObU5yWAc8hK6CZS4vmkcu1NeGDM/Ft
X-Received: by 2002:a17:907:868d:b0:c4d:288b:5a09 with SMTP id a640c23a62f3a-c50f37e54f5mr419901466b.30.1794974025522;
        Tue, 17 Nov 2026 19:53:45 -0800 (PST)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com. [209.85.221.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c510ca04b78sm51209666b.17.2026.11.17.19.53.43
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 19:53:43 -0800 (PST)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4a5024b3c28so610872f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 19:53:43 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFY2tgniBbMWIC1CwiYkrcD66YioWX7nMA3FKgydQud6C5BOrGD5b2nPytd1ALQ8TOpd3RQDBOHDryXZOIYqBCU@lists.infradead.org
X-Received: by 2002:a05:6000:2893:b0:498:364d:7509 with SMTP id
 ffacd0b85a97d-4a3774cbbbamr10035694f8f.24.1794974022637; Tue, 17 Nov 2026
 19:53:42 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261116-reform2-internal-panel-v1-0-765cf8d5ff4f@igalia.com> <20261116-reform2-internal-panel-v1-1-765cf8d5ff4f@igalia.com>
In-Reply-To: <20261116-reform2-internal-panel-v1-1-765cf8d5ff4f@igalia.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 17 Nov 2026 19:53:31 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XQ0Nw6tuUjr_pC_DQnWQZ0XD=jH+_djvbduQSd3XSrcg@mail.gmail.com>
X-Gm-Features: Aa3M54pcJVKrzVh9hl7PlSfdr6bBBDt4Ls2uHxZOi9oF_y8egwxD6E6UxsIqAlM
Message-ID: <CAD=FV=XQ0Nw6tuUjr_pC_DQnWQZ0XD=jH+_djvbduQSd3XSrcg@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/panel-edp: Fix Innolux N125HCE-GN1 mode
To: Christian Gmeiner <christian.gmeiner@gmail.com>, Lucas Stach <dev@lynxeye.de>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sam Ravnborg <sam@ravnborg.org>, "Lukas F. Hartmann" <lukas@mntre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Christian Gmeiner <cgmeiner@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_195350_724138_7C53830B 
X-CRM114-Status: GOOD (  19.99  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

On Mon, Nov 16, 2026 at 4:11=E2=80=AFAM Christian Gmeiner
<christian.gmeiner@gmail.com> wrote:
>
> From: Christian Gmeiner <cgmeiner@igalia.com>
>
> The mode has a pixel clock of 162 MHz, which is 70 Hz. The EDID of the
> panel only has 60 Hz and 40 Hz. Output of edid-decode:
>
>   DTD 1:  1920x1080   60.001038 Hz  16:9     66.721 kHz    138.780000 MHz
>                Hfront   46 Hsync  30 Hback   84 Hpol P
>                Vfront    2 Vsync   4 Vback   26 Vpol N
>   DTD 2:  1920x1080   40.000692 Hz  16:9     44.481 kHz     92.520000 MHz
>                Hfront   46 Hsync  30 Hback   84 Hpol P
>                Vfront    2 Vsync   4 Vback   26 Vpol N
>
> On the MNT Reform 2 with i.MX8MQ the picture flickers at 70 Hz. Use the
> 60 Hz timing from the EDID.
>
> Fixes: a14c6b0eef77 ("panel-simple: add Innolux N125HCE-GN1")
> Signed-off-by: Christian Gmeiner <cgmeiner@igalia.com>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)

Hmmm, this worries me a little bit. I know that on some boards people
purposely set a clock rate that didn't match the EDID because it was
the only rate achievable with the PLLs available. It kinda seems like
that's the case for at least one user of this board. In commit
eb893e34309c ("arm64: dts: mnt-reform2: add internal display
support"), for instance, I see:

> Clocking
> is derived from a system PLL, which provides quite good rate matching
> for the single supported display mode and keeps the video PLL free for
> usage with the external display, which isn't supported yet.

By picking a different rate here, you might break someone's setup.
...or is that your setup?

FWIW, it would be better to change how the panel is expressed in the
device tree rather than changing this mode. Can you change to using
the generic "edp-panel" under the AUX bus? Then everything just comes
from the EDID anyway.

-Doug

