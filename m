Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC2E6606A680
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 22:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ST/yN7fN;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=iV1OLKUh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Wuez8r9Gu63w2n4PILNMjVIjqJqefCtyrZMp62dMrng=; b=ST/yN7fNMxDd8P
	PMlprp0Bp9btmEm3tJyOcXASejhCiRD3Y9Ap+4XicHdQufQGFVKrzsWGjxAuvIn8dwJ3nN7UwgcO+
	zdl61n4zRKzp2dFeccSCuGq1/D4fMsD+i3/7UDU/D0ruz+hKZlopJmNRCvdjKIiZ0AK2VDn014032
	x6pkElnSDobWW/e6kIA7Hl2gkg+Y+ds8+XUE+szsfz4A4j8/jPPevk6QaaRXEQkZ8+lZiV/i5/hHH
	wEoh8hloPgp8bIXYH01kbNPQI4ZOENqK59immViJP1lrZKH2+XBTlcyPp+r8i8+TiFrRJ+F7BlW4W
	HOTun8mKJJyzQAuvOb3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWLWe-0000000BTrn-1y3g;
	Wed, 25 Nov 2026 22:31:40 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWLRU-0000000BSu4-3akU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 22:26:22 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-4a42b34e930so5509677f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 14:26:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795645579; x=1796250379; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Wuez8r9Gu63w2n4PILNMjVIjqJqefCtyrZMp62dMrng=;
        b=iV1OLKUhpWTRjAw4bTb2Ph7i4CR0PDFolJARy3VTqBNd3CDmOYUmvEHW0yM9cbHd2W
         3RcpYKJrZ6D29+Zshekm7SmZ5IPoA+QI3xcm4isewA/C7JelXzpGHMe8/qOQYE2xyUhS
         mv0HVUgWWD7NMwGhl7MVChztQofHViWZTrZnUgO4k1Z0RZ5fswoe3HlmQkbdqVb+13vr
         tjDU0ArZr54OEar1jw6kIwPyZ9c+8XoczEJpm90O89QftoMNdAn9ce4luiYKQ6/WoFo4
         +M1Fq3KtYIOhvg7sIoG1AGYYhKXl/sitUjttegKdu2jXzG87P0nFzM8fuyRcTiVv8Zsz
         cZSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795645579; x=1796250379;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wuez8r9Gu63w2n4PILNMjVIjqJqefCtyrZMp62dMrng=;
        b=oF0gNj8rzTPja0rGZlZd3iIUpHH9ZOdLVvudD/0CNfpzsjwMi/2eX12BQE2lm/dpDc
         Ih2DZDUqb47dYRs45wMdOBoQ9fIFYeQOL2/40fxmfhBV3OYx+Q7r/Pd1BLvOcF1PcBF6
         ZPqzd7mz0rGp34ulEH3YoOhGR9Mbtaeb4NvX/GUxOdRXZUR3EwQtAk9KrYBMrdsZpi5g
         myBYJJ1WgdxHpuob8bVT8NDNNlBFVX+vJbi6N6yyv9W+t/1KCf4FxOtF8fXlBrzM/HNn
         Wyafu/nZAU2wSiBpY46hWI2ub4xL853HtOUPR1ivd9SM9+CGoo35UWzJcPBOEFaOalSn
         EbKw==
X-Forwarded-Encrypted: i=1; AL+hErElWwRcrXLyN9Z0YYE6B9dQufIQxaVDBTE1VyrBHrjEKPngD+cFr3ttSfEfOZ2okFEQAHptoTHUSmS7B6W6L1Tx@lists.infradead.org
X-Gm-Message-State: APuU4Z/p3rAURK9fVdlpHSwWikdFvkJ7W5oqqE7w8m72JH2xtNJTBHXs
	/ZtMIYom6oVoySUz81/yuY8t3hx4++im7KIOpQsRmBFmdS2zunOe9MEtSnwTOxsUfWc=
X-Gm-Gg: AZFdTZfzUpFRQzWrUUtFmizhyoLHWba+0YRlpQ3hS38ckpmegYpqGSBiduSOluE/jER
	1oJ/y4SXe7HZSuQ28cmYUSdc2ZVjWu+Q5ZiXwboNL6TuC7MXFDkq3rr3LE+nc0WViEvqb6WF14C
	Lhm9nLNkSkHu8rZmUCsNZ+h6YnANU6240ftpNxNkW0uduy3DvH+NnOuA0S2RC87gdVa2JehDfGP
	8osGfcTgVic7us/uAvNJntxQgPDMehG3ppOScK3U0PiEZuaENeyBcUgFw5N7HRM0cLIfDNW/NfA
	paWCGwwHiLCZcMWSuIQq8THI4F5LsBpmWuilZQj5866dAK5le7lonPMSRbtJUkIsRk5Ad4ga8Sm
	1aE8D9MxSuUYAXUtKHTD2Qyi4lDMerfKLXGj3+dDdIsC+c+mChHS3ZCHlyICS3oqOjwwDyuMka0
	fuUDad1R+N3XnzuNd5GEyTB7BokvGXItsLCtXxAVAqCcD/iOCclWfY2N9acfiBxul6ALBDtKJS2
	Wvxy5XinYR351my7RUSQMSjz0hLjkRCqE4gg/j1u3LbiE1edS9HlasuAlcD5BjQX+FeTX5BM8FO
	vcjzNZDTTGEjLXjdrxsvZHXey9ALQig=
X-Received: by 2002:a05:6000:4616:b0:4a8:714:7ae2 with SMTP id ffacd0b85a97d-4abb32a3f61mr37314572f8f.29.1795645578997;
        Wed, 25 Nov 2026 14:26:18 -0800 (PST)
Received: from [192.168.3.100] ([151.42.79.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110d56sm35684687f8f.40.2026.11.25.14.26.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 14:26:18 -0800 (PST)
Message-ID: <baef27e7-93fb-4e6c-8df0-8cd74b9aa533@baylibre.com>
Date: Wed, 25 Nov 2026 23:26:17 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/7] ASoC: meson: gx-card: add support for audin FIFO
Content-Language: en-US
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261018-audin-v5-0-4b8cc13a1b22@baylibre.com>
 <20261018-audin-v5-6-4b8cc13a1b22@baylibre.com>
 <CAFBinCA12FvOi=9gB1xj3MDvNWstx1N4TtyyrrndJ_JT5eLX=Q@mail.gmail.com>
 <0949591a-63cb-4bb3-a7de-cf59ddbaafb7@baylibre.com>
 <CAFBinCAjFb7yS4VQp+BqLw2dG61To+iU4aiBvaVE9B9bWe=oUQ@mail.gmail.com>
From: Valerio Setti <vsetti@baylibre.com>
In-Reply-To: <CAFBinCAjFb7yS4VQp+BqLw2dG61To+iU4aiBvaVE9B9bWe=oUQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_142621_011262_69FBDAD5 
X-CRM114-Status: GOOD (  17.70  )
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/24/26 10:21 PM, Martin Blumenstingl wrote:
> On Tue, Nov 17, 2026 at 12:06 AM Valerio Setti <vsetti@baylibre.com> wrote:
>>
>> On 11/15/26 10:28 PM, Martin Blumenstingl wrote:
>>> On Sun, Oct 18, 2026 at 12:18 PM Valerio Setti <vsetti@baylibre.com> wrote:
>>> [...]
>>>> +       if (gx_card_cpu_identify(dai_link->cpus, DT_PREFIX "gxbb-audin", "FIFO"))
>>>> +               return meson_card_set_fe_link(card, dai_link, np, false);
>>> I suggest using the "audin" prefix. AIU / audin seem close enough on
>>> all supported SoCs that we don't need a SoC generation prefix  in
>>> there to handle this differently.
>>
>> Do you mean using "meson,audin" instead of "meson,gxbb-audin" for the
>> compatible?
>> If so I'm not sure this is allowed nowadays. As far as I understood
>> "meson,aiu" is a sort of legacy naming. 'writing-binidings.rst' says
>>
>>     "DO use a SoC-specific compatible for all SoC devices [...]"
> Let me use an example as I realize that I wasn't very clear:
>    compatible = "amlogic,gxbb-audin", "amlogic,audin";
> Does fulfill the criteria (as far as I understand it).
> What doesn't work is "amlogic,audin" alone.

This is the thing I'm not sure about: "amlogic,audin" does not seem to 
include SoC-specific details (in my opinion).

> 
> The GXL example then would be:
>    compatible = "amlogic,gxl-audin", "amlogic,gxbb-audin", "amlogic,audin";
> 
> And for Meson8/8b (sorry, I didn't get around to testing) I would then use:
>    compatible = "amlogic,meson8-audin", "amlogic,audin";
>    compatible = "amlogic,meson8b-audin", "amlogic,meson8-audin", "amlogic,audin";
> 

Ok, so if I understand correctly you would like "amlogic,audin" to 
become a sort of alternative fallback so that:
- meson8 and meson8b do not need to have an "amlogic,gxbb..." compatible 
as fallback
- the change in 'gx-card.c' is more aligned with what's currently being 
done for AIU.

Is my understanding correct?

Krzysztof, since you already approved the dt-bindings change in this 
series (1st commit), what do you think about Martin proposal?
If you don't have anything against it, I will add it.

Best regards,

-- 
Valerio


