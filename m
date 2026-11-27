Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3790606A324
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 08:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SOy/G0FH;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=FoZ49Ukh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=/Dn2D8XkSGEfDxJntGFmwA2DusnT2l4fyR3s26i/q2k=; b=SOy/G0FHc6fbvz834S5agyplAe
	NmZp0L34ck1r9ovKLIYMn3fX56bQJnpiooNJSidyhTFrLwhwh32NYobO5Ym4+5+zOK3gohub4tJ2F
	eswxI9EBX4+3luWQ1FvWZU8Gc5AA5RotbScLVt1nt28UfTlfxZ4QJ4RuLM+Cxi7L8ptGbMfda1dmv
	PFMyMnaRLo2NH7DuhOfFXdZ17n5Yxdq9GFgsXMrzrEAc4G/L1IMfi5k4XYIXW7nVbg+IBGLttBz+k
	0S4ifmJPnLxwfbnY3VsjuBcUocEl4PPu0GKd8H57PyLo6YDp/cHTeOtdZlr/waTMY8n0o86PIXjGL
	eOmHETrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWrZy-0000000FI7E-0dtr;
	Fri, 27 Nov 2026 08:45:14 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWrZv-0000000FI6X-3Hz3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 08:45:13 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-c50aaad19fbso848336666b.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 00:45:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795769109; x=1796373909; darn=lists.infradead.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/Dn2D8XkSGEfDxJntGFmwA2DusnT2l4fyR3s26i/q2k=;
        b=FoZ49UkhLXhSqP1CCix2xLkR7lDbFIn88Nxr+x1QcE/PVs62JWJCsKxRif3piH9ufu
         QzIWB60IYVsL2QVO5U3wk0iSvRPDKPxQ3x0UDdE1Q42Pd5sPqy1rcJpKOEa9IMWLfvQi
         Io5y93vKT7U15QtPvsBeS58hDpOE+ecHvBCgFOjN3JN9Wl03hR0druf5GAPoMJMugZnA
         AAm5hFcrFgUaNsxOcEOoOjXFoygxUQmGM+qPibQrCDSw9h2c4/s3GgPUwfMtzfaRS2Od
         0w1ibiFGhQYBrGUk+4TImvz8DbAULDcHx2Ry1ual778tvS0TvLz7EdZwv9keu2z4M/Fg
         15Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795769109; x=1796373909;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/Dn2D8XkSGEfDxJntGFmwA2DusnT2l4fyR3s26i/q2k=;
        b=qFgZAJnHj93ayfDdHcuoUYbM+TAPfPmp3GOz5rYguFxr+MHE9CuI5jZ59hgeSMHxMC
         QXUqIIwWmCNa5zJIL9gOsDapjb0ot4H5g7L2u5xPsnN/Jh/ar+BU5DwTuenxb/WKknnM
         OjcrrlWLgARKfAgZ66G/vfMIqUCm8pUuqjF2dx2qAZjn2fCxadmTTUswtBkoXGxgaIhU
         mHBHVHDryJnc/falxkuP3mBDM3FprfIyNX98UOmGzFJhGpVyaLQI1zzune4hUDG3AXBT
         qKRfxJKg7hqmJXhVH7trqRD3Bp3aiNcbwckudB/+01voF9N1dBDFGNyJxkOCBEaV0hyH
         T0yg==
X-Forwarded-Encrypted: i=1; AL+hErFJbNNp5LOjG8SHbl/XhbMFa5XNuSsJe/erXM3UDBqf1wFraEubEZKA5yaUUlp7xMvhIV8FTwFSleEn2tB+9Zx1@lists.infradead.org
X-Gm-Message-State: APuU4Z/RAQAoztvl18/h4alZrVuJ50v7xiOFCvbheaTH2jzEJbST9sFJ
	YIWmhQY6J/p5qixmYVkR0zD3Z5WHPSlCLEDPMIEhbtqrk8uL4CC4wJLdeEc2MpP0ZUw=
X-Gm-Gg: AZFdTZc852RjCFpODvAKkFGaW1IK69G80gDB3LHlCiYRdOuED4ngG7o8u6csRJ+MPeW
	p0wTfvi63DkuCQcpMFVOgsZcwl9zzlFENqIS32JTmAmXRKJagfObabpXDmClK5VGFD37QTRFh6n
	prcIcpZGkaqe6smAJfnsa68OjxI+TFVrr72Y8n6ZGG+0vo4pWEtkN2EdvzL9Y7qC1942+86Ugpp
	leXCjlctxSbTPRa7FOdjhjRbfedTIqxpcdGDBJRyV/2WZ2BNNmH4pdkTI5DX1HZK+zXylbQH8Dy
	WBMVMhneDIsN7bngEytChQYy/8B4cwR+I5xJqMJRM2LQzBjgI/GsuhsZAD+BolzhwMDi2yF7smg
	vtHOcwSm+pcD9YRHCUiOApwq/7oVXNcK+sxh0q6rY1kRddpgRT6m1qjJxxONm0m9+4ArWdJlZTW
	1TDJU4XvNcSlxF91aSVWn5lD9hxi9rVmw378Go2fMgl0f7UDDkT5EGb0mG8OkKCdTGEytkntdxa
	bb6f7H8KPpme9U7IM2751DLa8ieiS3XHtNKTddwpQOq/oYFZ642sUNdCC9Mc/ARsKg4u7vzz54B
	LKOL3UAO7U92ntf9PyJdOAKpsTMMookfC7tKe0x/moVB8li5
X-Received: by 2002:a17:907:6c17:b0:c51:3cb6:5b11 with SMTP id a640c23a62f3a-c513cb65d73mr1971796666b.49.1795769109636;
        Fri, 27 Nov 2026 00:45:09 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513aea31e4sm851467866b.39.2026.11.27.00.45.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 00:45:08 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jiebing Chen <jiebing.chen@amlogic.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 jian.xu@amlogic.com, shuai.li@amlogic.com, zhe.wang@amlogic.com
Subject: Re: [PATCH v8 5/5] arm64: dts: amlogic: Add Amlogic S4 Audio
In-Reply-To: <832c4090-d6d7-4c3b-85e7-ed7dfb8c85c4@amlogic.com>
References: <20261110-audio_drvier-v8-0-1489241e4c83@amlogic.com>
 <20261110-audio_drvier-v8-5-1489241e4c83@amlogic.com>
 <179536111581.2728475.9919460533427781841.b4-review@b4>
 <832c4090-d6d7-4c3b-85e7-ed7dfb8c85c4@amlogic.com>
Date: Fri, 27 Nov 2026 09:45:08 +0100
Message-ID: <1j5wxi3bor.fsf@starbuckisacylon.baylibre.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_004511_832995_462557CD 
X-CRM114-Status: UNSURE (   9.87  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On lun. 23 nov. 2026 at 10:48, Jiebing Chen <jiebing.chen@amlogic.com> wrote:

>>> +
>>> +&spdifin {
>>> +     status = "okay";
>> ... as sashiko pointed out, you are indeed missing a pinctrl for it.
>>
>> With sashiko remarks handled
> AP222 does not have an SPDIF IN port. I will remove it and update the 
> interrupt number for SPDIF IN.

If you need an immutable branch for the clock changes, I need you to
submit them in a dedicated series. Let me know

>>
>> Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
>>
>> --
>> Jerome
>>

-- 
Jerome

