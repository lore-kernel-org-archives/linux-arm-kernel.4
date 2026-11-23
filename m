Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A2C0606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 12:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TiISx0yF;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GkDlXTrL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=a88ULBFAQx4LAiXbEAQvfvekeJqnITJpUHZuo0L1DZQ=; b=TiISx0yFR/aufr
	9QiO+MVXoayxvQRz16hFjJ1TaK7iEJNDapFJNuI2VJLZphb0vmWNZ1dC+zXWgav0xSt96xezie1NF
	cMvcp+4V2Gd3qzq7sHH7CrSh+MjAR4krpXwSOFuT2fwHROdmVxUZ/T4vZyXcopEyNFZZzr16nEwUR
	C2bFXe4mfn+oNYU0SvrUsBhlbzPPj1xs3FeY0peRKh/rXJ8xRY0Y9opn1Xu7E95gzlqIJwsdQLtsH
	fe/WcYQqLWSzyd8b1QW62TaJs/jTzSMCwUhgw7L5uKLfBmwli9GvfBkwSsQzajUWsGKgkwnjow3rR
	WTj+2UcXtrAfpharMigQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVSzk-00000003Kev-2YhT;
	Mon, 23 Nov 2026 12:18:04 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVSzh-00000003Kdp-3kRd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 12:18:03 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-6b87a1a2babso7884881a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 04:18:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795436280; x=1796041080; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=a88ULBFAQx4LAiXbEAQvfvekeJqnITJpUHZuo0L1DZQ=;
        b=GkDlXTrLtjyVQv3R0OYLm23EfhVib1OWeUNU0iKTWwAvZbeiubJnNCN1MTXAPQ85Af
         Zmd2po7cP7ZyFC+byJdrvN5O0c+UH8oxndFBc06/2NJ+zcJrCNjEgGhc9KCkd8VkDQtH
         XO0pFBV4vQFoIItyPXb1Ux0z22pPdVjMeqPvO9gcNVi7C8cKPIwgfC2uS2IrdmbyrWvx
         BHIP/J5I4ArXcSTmHU5t9DGW7aM2MuGoe36RQuC5JuMiashealpmZoWVmpDjKA3Dg7s/
         OuEB5Ngtv0qjYPA1wMYbt+S2/hnrIkus1X/f02RnTCTCW1njYV7HsFs+i+ldkYb5G59l
         8zNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795436280; x=1796041080;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a88ULBFAQx4LAiXbEAQvfvekeJqnITJpUHZuo0L1DZQ=;
        b=DA1B64V/A8sQotJz6RZV/2Nnr7VFs0LyiEqYX1y1/xkEuJ7VM1eA3Un0Jz14Kp4WYD
         7bIevDhJqJnb3ddzIDi9hYJIewprx+Ysv4MpZDsoXQo0M8ayZ9T1ZvK7e0CCQnnkGjor
         pkS4l+Fj8DbQ5vkFoP8NLp2B8FhU0GeZWa2FJ0qNTrTuGZ5DCbaAaUwwXyva14QChcHc
         tSs+w7yIUi8cO5kIS7Le3ldLZ2KJl1fTloI1489H2BjI1OPN3uA+5M9mooejP5wjuBiU
         OHAkVGX06oMdPme3O2Kw6Pv8Or2BQ4BB//gBPWO+vQtcvGF2lm2OzI1Soxm8mhb9bn2A
         TElA==
X-Forwarded-Encrypted: i=1; AL+hErEaSyOTUv1ylr74lPAreNdKJZIoSeqrpTLtj8OnbUwNW8MVM9PhlDIahjPcvfinoyT+VvLEbNbfJsq1J0ZwNpaX@lists.infradead.org
X-Gm-Message-State: APuU4Z97ng0y1M1TP+ua3Nv1tKMdN3igdHslgdpjWlqEiMur/tsesvj3
	ANDeA2OUfs67Gih8L0f3AhHTOqRgYSj8thSsMJxRqa0NUH0AbUvH8EuR
X-Gm-Gg: AZFdTZe6m9dUUfy6s1l4C1IxGG3YlfLNbKPYiPp+PN5sXYtHA9NIG+vQ/B5i8ai3lJ8
	eB03+8P65vaGuPSmvCGiW6WHl7gXLBiRJ87cAIxGxEjCEO98EvtcBHS/acI7xCpk36j7hTkTCdN
	f8XaYJ/m4xosVxwTAOvGGjgrIj+8DVqz6Lp8wwyMoaqFtUq2KUQDctbO3LWnrUeIHwHvqoujIT/
	T9otchVDPzMHdui+eWWfIb3w93F7nRKUkspomxJDZ5dZa0DmrZbNG00hmtN6NTUCpd7i01eaqPL
	CIPvwCUBoY4LAlX7vpiuNKEP1I9soHmtn2ku6eQY1E/+aAxRpAssALXtxOD0x66vL6VWu5jtA2O
	Ys6gt9LmHUbz4Ypug36ylCYQiw0hpTjE1420oK/VFWfmnWRsoGKv0TVlLrkvXZwXUP5l35o9ONo
	7nXCLV2qRAVD5hmhItXj76Y4/iAHZmX8dImaPW+jzcZ4aQmuQfpLPIwENaYkTVdPz09bMnb5IUE
	GE+F13M36sQrHfrsgxiyBkjphbU5sEmMqQsnI/8c6UU0zAkVm1OBAmdYHsmyVsny9RM98tVXIJ6
	2H5cxkYzthSWRCxowfSQw+ueNbn0cyg/UmwPFoDPC352Hc0evPy5vwem
X-Received: by 2002:a17:907:6d26:b0:c51:50c9:741c with SMTP id a640c23a62f3a-c5150c98208mr692273566b.10.1795436279974;
        Mon, 23 Nov 2026 04:17:59 -0800 (PST)
Received: from localhost ([50.7.123.82])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513aec5115sm397263266b.51.2026.11.23.04.17.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 04:17:59 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Nov 2026 15:17:55 +0300
Message-Id: <DN2L1II131YK.3M3CEKXTOAUDX@gmail.com>
Cc: "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, "AngeloGioacchino Del Regno"
 <angelogioacchino.delregno@collabora.com>, "Sean Wang"
 <sean.wang@mediatek.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Jiri Slaby" <jirislaby@kernel.org>, "Daniel
 Lezcano" <daniel.lezcano@kernel.org>, "Thomas Gleixner" <tglx@kernel.org>,
 "Mattijs Korpershoek" <mkorpershoek@kernel.org>, "Dmitry Torokhov"
 <dmitry.torokhov@gmail.com>, "Kees Cook" <kees@kernel.org>, "Tony Luck"
 <tony.luck@intel.com>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-serial@vger.kernel.org>,
 <linux-input@vger.kernel.org>, <phone-devel@vger.kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>, "Conor Dooley"
 <conor.dooley@microchip.com>
Subject: Re: [PATCH v3 0/7] arm64: mediatek: Add initial MT6895 and Xiaomi
 Poco X4 GT support
From: "Alexander Letuchiy" <asalde.le1@gmail.com>
To: "Roman Vivchar" <rva333@protonmail.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261123-initial-mt6895-v3-0-95c46597e63d@gmail.com>
 <ckJZtdZ4-fPzsa3vkozNyEYYUbG9qd134hYb0hHEuq2nL8WMAR1PS87OpDfXrkU-E-85rsG1I4V99_M41j6-ewkD_41XPguDel3z8z0lmMk=@protonmail.com> <DN2KN6PFHOXG.1EWK1XUHY7IKK@gmail.com> <OZecqgdcxZrbwT7Ps6SDq9u1Q2EeF9jng68KHoWs8vTEetcTU8GAfC5LYcKzDGEZlr5Rlzh4rgzVh36JelFK1zHk3Dgh3TVGqj_a5Y3hv6Y=@protonmail.com>
In-Reply-To: <OZecqgdcxZrbwT7Ps6SDq9u1Q2EeF9jng68KHoWs8vTEetcTU8GAfC5LYcKzDGEZlr5Rlzh4rgzVh36JelFK1zHk3Dgh3TVGqj_a5Y3hv6Y=@protonmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_041802_381774_0D2F4B40 
X-CRM114-Status: GOOD (  18.69  )
X-Spam-Score: -1.9 (-)
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

On Mon Nov 23, 2026 at 3:04 PM MSK, Roman Vivchar wrote:
> On Monday, November 23rd, 2026 at 1:59 PM, Alexander Letuchiy <asalde.le1=
@gmail.com> wrote:
>
>> Hi Roman,
>>=20
>> On Mon Nov 23, 2026 at 2:41 PM MSK, Roman Vivchar wrote:
>> > > Bootloader dependency
>> > > ---------------------
>> > > This was tested with a modified LK bootloader that is not public.
>> >
>> > How are other xaga users supposed to boot the kernel? You might want t=
o
>> > port uniLoader instead, or if you're on an old enough security patch y=
ou
>> > can even replace stock LK with U-Boot. U-Boot chainloading is also
>> > possible.
>>=20
>> Right now I am replacing the stock LK with a modified one that knows
>> how to handle mainline DTs without expecting downstream Android nodes.
>
> LK is known to mess up GPIO and clock state. The earlier you replace LK
> the better.
>
>>=20
>> In an ideal world, I would like to replace LK directly with U-Boot as
>> you suggested, though U-Boot chainloading or uniLoader are also valid
>> options. Luckily, the security patch level isn't really a concern here =
=E2=80=94
>> xaga is already EOL and hasn't received official firmware updates for a
>> while, so LK replacement works across the final stock builds. I
>> definitely plan to look into a proper open bootloader setup for other
>> users in the future.
>
> You can take a look at mt6768. It's not upstream, but we replace U-Boot
> and TF-A with custom forks, as well as provide tooling to prepend
> meditek-specific headers for the latter.
>
> Best regards,
> Roman

Thanks for the pointers and the mt6768 reference, I'll check it out.

Best regards,
Alexander

