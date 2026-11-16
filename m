Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDDA7606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 18:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xWVdUIvM;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B3b0gwvG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=EyOoLldgRLmAoMhpZj0u97Q7A7Xp363HqnTUmstKrFM=; b=xWVdUIvMGF2KWQ
	ASamyLbDvdUztl+v5XIUUKuNHszkmNWXnzijp/46wejMlA2YfGlowm9rsNzdj0QvVONWdCrMUeAsC
	Fw8o67MakFMQTEGUbBoVRhHzPOZwyCHcPtuyG7t1db4Ai/+v5pDL8AQJUcHYyCMwAYnC9dNakawv4
	5B70qsiy7OgcbUCfBXHF17kZFiFh71Rir3zE/nbXLm0CiUQ14iFPMp1lrwOoeJVtBb6YDxzuFXooy
	pAyQjjPqTwB2xa1s9DmqWKr/ovIzgp163LhsieDRq/tLZSLdwdmUYay6C2yy9J/LbE5PpxZ6zrk5W
	Y0VnHQXy0xvPn2P6XR/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT1AS-00000003VFQ-3OdB;
	Mon, 16 Nov 2026 18:11:00 +0000
Received: from mail-vk1-xa36.google.com ([2607:f8b0:4864:20::a36])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT1AO-00000003VEn-44pq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 18:10:59 +0000
Received: by mail-vk1-xa36.google.com with SMTP id 71dfb90a1353d-5ec690faf85so1147217e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 10:10:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794852655; cv=none;
        d=google.com; s=arc-20260327;
        b=DKmexov3r2ZfVq4Yqb2OkY1fdqyr72yDiVhF0wR9ggCy/9RFVii2VwIvjAJSIWyD8j
         obZo8wz+ZUr2J9qnEtFGgUVR2zrpqH9ViAGRSehj/MfRkyXvGf8m+iNzdRkqED2nhfnK
         FgDKOxCo7B/iPOvO7N6wweeJpoOx7lzSnbQJma8f7mKjZDVlsyt5UQrbdJEmAR/ZkYaS
         zXEHvO3Fi1kjZUA7qjvgK4vdZ4DvpzIVkoC23+71g08TRhWruuDyxsZoXUV5x0XaZSMR
         gloNqJ+IsWGRuvfzMtBf5sDvvCkVGVxGJme4jDEj6+/FFxTKHPKwhHoZ5gPHG6eiHcwv
         Ic9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EyOoLldgRLmAoMhpZj0u97Q7A7Xp363HqnTUmstKrFM=;
        fh=e+DHiIO0TqDVLykPa8c0g8EVaMhr9KygOZ/dRCVICWw=;
        b=GDvRJl6DvhhOyw11bXmFiWOTaWk/1E5SLpmc7NUxi/7FSif23UZKqz705i+q3n+XOm
         b8GxjUQwkOVvAB0UkB/kJvAbmzDykWUW27HrbNa25xkvArxFzKgGUmGUdPWwleTfcXJv
         DepPqDrL4qfz0ol4sbN/Cnljx7r05iCnDgDXAkiA2kpdgoWY7oa+SAQqp70sgZA/K+He
         nfZLV46Fvk9l+VVFrfl74b2cvTcszH2GwIFxy1PSlnultLaNl4cYXATK3Ppd9hFpL2vN
         tDIbJa3glOfWbfTDNF3jk4CrTRomnzLEzTwd3a7LIKL5q/7wcymk2AuA69F7gzm5J5QJ
         sB2w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794852655; x=1795457455; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EyOoLldgRLmAoMhpZj0u97Q7A7Xp363HqnTUmstKrFM=;
        b=B3b0gwvGc2tgCI8bWMGlGbjVpu7BpKj+CvEyZjG6G6K0zlcx1/eM0AJtbotND4yhOu
         SdV9+JcCVXRW16n7TV4Cx73FUiKoRNcnNQzZ3YbjBwji2pU9y8R5Bumb0/nycl4RF+j9
         MXCqSROARVm7rBOQcHa3H0x+Mwcq3yKjeO4P9DKr8qmVe0ijZhjhfHUOJ9ZtCYl8li/s
         GlvG4sAEd/RAj/jEasxXR0sBY0hUc1lv7MSUSfgklKnlbujB267CzmD5AtQsoTps9OgH
         8pW91O65StDGaHFzVYeMr1+qfCU1X5ozqZD0nFDxizn+8fu68qtdSdXgk8n4RUESe/QZ
         bt4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794852655; x=1795457455;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EyOoLldgRLmAoMhpZj0u97Q7A7Xp363HqnTUmstKrFM=;
        b=P+S4K0rtKKyPiOU2AMo9SrlSun0mOO5X7P842A4Lq878D7214/yJLAXJNe+47LLI3t
         nPxrkz3ff40152F1tXQvGopFMa53VzNBcwhADvCpBfoIJ3fCM21baRlnbTGC5PjVArlZ
         sLr4PgwKFIxWOzhOfYZfGW8mZHnOjKChB20eDiiyc9/p3S5gVyUXUIZn1iFniXn3/Iil
         PhrxlCzIf3F40nHwEc6AQqfmBkVyIL/R4AQm5tMsuQceeqByAEXKlNMRF+z+uR5d+bBU
         YChG91Kbg7RijJPSJZtMlPryqzYGeo07/AjW8Gga0A4bwILma9/+CKszlH307ZQqvA81
         vF6Q==
X-Forwarded-Encrypted: i=1; AL+hErGjZ3jq7atQGntln9/4IBM3WDpahPPQ6nRWjxwtWomzRaVBBinK+teZbTlWVMcjJviLvmqBHFKbvcjTMrl4X/vR@lists.infradead.org
X-Gm-Message-State: APuU4Z/qIPNTIbkjeV9SmjkPOXD/hZqT0U4nFx8goXURUOcSC8be+W8J
	RRuYSW77ymUd/2nIcmqrtHPEDmX5oIKwz7tNxMVO48dC6alU541P09ws7I/rRT7SGo+dqAOyDRf
	D554mBFU97HTO3p2RWZ8YJwzW3T5Cdp4LaJ/JKMc=
X-Gm-Gg: AYBFou11nKKZPNfr+xW4kh9poV8dju0HPx14YM0W/PmaSp1qu1f2XD98QzZuTATaM3w
	/cLHyTmqL0nftwD2TY9gkWCfGeQVje/mJV5h8TG+8wG4ifkK5SU7WU5SaQEf+tzOBaMQPbHsSMh
	tRfEkS0z8k/j7Gm4UjDfHu+bS5IO4hGtpQeWwpLgRfDosTTOkn6/r/cCw5eTh1K+5zmOn4NrMU7
	bDK/XKkirCmdPmHBQBwTFIBg7HlXT/beIFQjOe5ysTJwz8MKVUTfSRfCSvx8Kb7tXR9Sr6UrYRh
	7oiIsqQKmabfcgDcDjzkqGqQjbmhjscnJf4fxA+aHWdrHqwCxS8BrTcBBn/ukZ/si/MDUpctA3G
	74Kf+AeB5h+6Athzm4E3uHvjNuOt5b/PXm37hTDddLvIo2e5umtb4+dSS60K/VQYselMuZw==
X-Received: by 2002:a05:6122:1792:b0:5ec:d5e1:ee27 with SMTP id
 71dfb90a1353d-5ee34aebcd3mr3588477e0c.20.1794852655533; Mon, 16 Nov 2026
 10:10:55 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261116-sunxi-orangepi-3-lts-v5-0-979cf5474913@gmail.com> <179485210124.3689664.6903721866612808429.b4-ty@kernel.org>
In-Reply-To: <179485210124.3689664.6903721866612808429.b4-ty@kernel.org>
From: Cristian Filipescu <filipescu.cristian@gmail.com>
Date: Mon, 16 Nov 2026 11:10:44 -0700
X-Gm-Features: AclHuK8Q7HwxDEIcfyXjUFUI9dASw3q3swCNJxLwvpsAisQFiqmZU_r7ygT_THk
Message-ID: <CAH87RzQpJ3Nu31cDMqWJ_v_2SRm4mhKmf22nWXf4=c9CA75hAQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/2] arm64: dts: allwinner: Support Orange Pi 3 LTS
To: Chen-Yu Tsai <wens@kernel.org>
Cc: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Andre Przywara <andre.przywara@arm.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_101057_015424_30AEBDAD 
X-CRM114-Status: GOOD (  12.24  )
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
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Awesome thanks.

Regards,
Cristian Filipescu
------------------------------------

On Mon, Nov 16, 2026 at 11:01=E2=80=AFAM Chen-Yu Tsai <wens@kernel.org> wro=
te:
>
> On Mon, 16 Nov 2026 16:44:29 +0000, Cristian Filipescu wrote:
> > Continue Jernej Skrabec's April 2025 series, adding the board compatibl=
e
> > and device tree for the Allwinner H6-based Orange Pi 3 LTS.
> >
> > Use the common Orange Pi H6 include and describe the LTS differences.
> > Follow the schematic's LED roles, remove unused USB ID detection, and
> > use generic PHY discovery with bus-level reset. The binding patch is
> > unchanged apart from rebasing.
> >
> > [...]
>
> Applied to sunxi/dt-for-7.5 in sunxi, thanks!
>
> [1/2] dt-bindings: arm: sunxi: Add Orange Pi 3 LTS board
>       https://git.kernel.org/sunxi/linux/c/903a676a19ab
> [2/2] arm64: dts: allwinner: h6: Add Orange Pi 3 LTS
>       https://git.kernel.org/sunxi/linux/c/a203a4bac331
>
> Best regards,
> --
> Chen-Yu Tsai <wens@kernel.org>
>

