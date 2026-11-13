Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DEE7606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 12:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=41lyEtCi;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=GDo6HpDX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=dmx7lZXkcixTl+10Zvhm8UM2FpQt4AXP/0UX1bcGrY0=; b=41lyEtCiUefyCO
	SYxbqTKFhjXlD099Y1CtHQcNBfp175UIWTUeLpKZh9eWU4NYd9Jsb/nB4nykille3c2K4bie1CGwR
	Fa0NRfYdmhiLVyGMV7KOWr3P4yr0QENFaCDMmuClCOmwZo6RYzNuRMizlQVHkhVfGvOMvaYVfiMg9
	l0a/LkhWimK9McfyVs7CafSQxN2VMDg/zXL/LyWJSXPM3FYkkvNCbwwZ2A/RQS87wGb9m9DTaT6Yg
	L5zhRWQbowigPfLy8B0HkrpqASQNQWSuu/uaukWOPMREQN+NUYNKpKynsTIDBkdWC2iKWzX3F37ip
	vB2tqpijzGttlw47d2yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRqhB-0000000CmOM-2E2B;
	Fri, 13 Nov 2026 12:47:57 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRqh8-0000000CmN8-2aPr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 12:47:55 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4a214af2076so5566935e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 04:47:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794574072; x=1795178872; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dmx7lZXkcixTl+10Zvhm8UM2FpQt4AXP/0UX1bcGrY0=;
        b=GDo6HpDXB4v5VcO+R013dhhrIUwWIL2YYi16SsOCHDoip0TvkvtKxiXJWNY1/Suuf8
         7Phy/6AdnyhgSAHMYdWYElpgbeZ7JXkuTA3AShC66xgs8SuEi+DG2Lw1wx4xwnSFSXDo
         /igcQy3WdagcrOjXbaWXr+Wg6pK7QGGhkqVzKLqnX2/Cqr28YetO8X+qe+FRnx5fU7a8
         KkM1j22/4qHw50ODRyLakiHWHdc62hWU4vp2NjjXO6V0S7/Gbos9bQ8WNQsNKbaXwOVV
         Wa9KelEfLDURjgav+HajrNVcytHF0K1AzuJIonQoTcGrDFoOwyF2rLP/risMnQ6T5Of7
         kyIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794574072; x=1795178872;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dmx7lZXkcixTl+10Zvhm8UM2FpQt4AXP/0UX1bcGrY0=;
        b=KB1+JpN0rkbVuRYpZxx9aUPNydr+/xVZWKL7aIK/pCG4WRiCCJwGMwiRZDeHjQAQFl
         4+I3B0splxKZwPahkQiiZrx1kcos4e3qY5kkLh3dFCMiTtA3+/FS8fHXHeakbiTYm789
         GYNRfB5bXVqO/ch9sjvfkpImjAihr3ZH3GdTWD22rk+4dLb+kJ5pnLhVHix45d6kT3mE
         Otf6VACXrFHpRGsp7VEu8wgrSi2ms+w0bD/FA6oTL0rXQzCYjsV4SmAG72ByXrKhdOgY
         TS9Q/5+NA/2TlRFE5je7rhqD/FyW9HFRnuWEN5JZ4vvN++qnb1k1CrUym7zSViw3I/pV
         rUEw==
X-Forwarded-Encrypted: i=1; AL+hErEFpnAVbSZpfU98xCqNMWu9xEd9188vB1m6Q3MvII64hb5xp4SX7MBbfHOa7qlyNM4wEw0/ao3RV/DNToPYpY0x@lists.infradead.org
X-Gm-Message-State: APuU4Z8sJcDbd81sr8a3aeLULBzBNfPow+0VYClsUNQcBC52mqGqCt0V
	gTUIOys8OunusjwX+5b7SToDaTRhmOjZm6N46dJxsZb8XaE3nLRdxV+gdcj9Eg6vMxZQBlVyVLw
	Q3udZdxLWUA==
X-Gm-Gg: AYBFou0e703wTn3xTrb3sR+H/oH9Ux7+3QlmLn9fFowTHrvQfZRhfCYljuayLC4nJhJ
	IofAHWVOXPF0bgA7MMO6DFlKLBDgwkOGNR19u5lInKhBpTfqOfK29nUpImtGVxjCKkuqVvD4yl4
	now3uJM6GhfSXER2XQhYOKdcISHDvZwgWbJUHOjEnsKVqh5VUSEHeE+BEsE5q12cSAIwat0q3L6
	EnA1eB8xdew72VBEOiyh8hkxxEC0Q4Dvc328KoJEbqYkwQuEHNagRbdmY4lsZGybYFp337g2bbz
	E9YI7mdzPGleAzCrdWbA2HkNfM84SNAYkJRd6DQp5xM9XqMdE0aSL/veLwQUGAFEs/y9kH4saWs
	WipDoAWneyRmkHCp3ZsKHjFDWvUAN5//3h+CtbyrTwTm8JflQEyq0nQDWPSwxi2vvYJqy6IkTeJ
	Xs6kdakdKoe1a15R9WzFE+UrblF0zRFGeEOz72ra1qRw9GC8s+LDI8nHDzDnSjpZj4brkoyHecG
	crbRnPYb918zTABdaMlY6GhqHYK3iQXpsaugLnGJUGPLBAHO3i+8gJ56hJJEpCWFCTL9HkPNpoE
	FRs3aJPZ4lUpluPXcQGofFovCBT1FfZP
X-Received: by 2002:a05:600c:1c0d:b0:4ba:59f7:9032 with SMTP id 5b1f17b1804b1-4bb55c5f60dmr58910305e9.10.1794574072378;
        Fri, 13 Nov 2026 04:47:52 -0800 (PST)
Received: from [192.168.3.100] ([151.61.248.197])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e252f7fsm161390445e9.2.2026.11.13.04.47.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 04:47:51 -0800 (PST)
Message-ID: <7a268a4a-692b-4aa4-82b3-a13006e9a3e3@baylibre.com>
Date: Fri, 13 Nov 2026 13:47:50 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: meson: aiu-fifo: prevent sleeping when spinlock is
 held
Content-Language: en-US
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Christian Hewitt <christianshewitt@gmail.com>, linux-sound@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261111-aiu-fifo-fix-sleep-on-spinlock-v1-1-dc9ee401a7cf@baylibre.com>
 <CAFBinCBLK3Ok7QpKUVT5XtOqDafVzGP2Tn1oBj3f=PUQ_DgnwQ@mail.gmail.com>
From: Valerio Setti <vsetti@baylibre.com>
In-Reply-To: <CAFBinCBLK3Ok7QpKUVT5XtOqDafVzGP2Tn1oBj3f=PUQ_DgnwQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_044754_676969_EE0103AA 
X-CRM114-Status: GOOD (  15.41  )
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Martin

On 11/13/26 12:05 AM, Martin Blumenstingl wrote:
> On Wed, Nov 11, 2026 at 11:09 AM Valerio Setti <vsetti@baylibre.com> wrote:
> [...]
>> @@ -37,8 +38,11 @@ snd_pcm_uframes_t aiu_fifo_pointer(struct snd_soc_component *component,
>>          struct aiu_fifo *fifo = snd_soc_dai_dma_data_get_playback(dai);
>>          struct snd_pcm_runtime *runtime = substream->runtime;
>>          unsigned int addr;
>> +       int ret;
>>
>> -       addr = snd_soc_component_read(component, fifo->mem_offset + AIU_MEM_RD);
>> +       ret = regmap_read(component->regmap, fifo->mem_offset + AIU_MEM_RD, &addr);
>> +       if (ret < 0)
>> +               return snd_soc_ret(component->dev, ret, "Failed to read FIFO pointer");
> As far as I understand:
> - snd_pcm_uframes_t is "unsigned long"
> - snd_soc_ret() returns a (signed) int
> 
> Doesn't that lead to a signed to unsigned conversion error (highest
> bit set -> large value)?

That's something that made me thinking a bit as well and the reason why 
I implemented it this way is the following.
'snd_soc_component_read' internally goes into 
'soc_component_read_no_lock' and then to 'regmap_read'. If the latter 
fails then 'return soc_component_ret_reg_rw()' is called and that calls 
'return snd_soc_ret()' internally.

So my goal was to keep the same return value in case of errors.

> axg-fifo simply discards regmap_read's return value.
> That seems odd at first, but knowing that its regmap is MMIO backed
> (same as for AIU) means there can't ever be any error.

That's a good point indeed. I will follow this design then.
Thanks for pointing this out.

-- 
Valerio


