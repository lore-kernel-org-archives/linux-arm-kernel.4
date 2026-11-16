Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD66606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 22:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JLABTk5y;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=ZkBISZgo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Ln1EVdAGOFluUL+4qX0wySLdavyI3EeHq5qaZG2vFtM=; b=JLABTk5yGLoor5
	syf2r7x9vfGN9veIzEhopmZVHV6TLMFGJ16SNHbTfHq/zavfXgYl7r1VlyGpJzaLfeWhG1zXsb3Lu
	fk8pnMiwa+3iH4TDz7t7GkmknHYNCth30HyOjunitx46E6kL5RvCBPsTYk/WZp3zglr6Aiqx85j3I
	M0OxzbuNBNYMjAFj/0nHWAKFls3XTi1SBsdX3uyYxeDH4etj1UPj9sgae7qcrTA8/AJzsqSvhyXui
	teIzBc7nhxEmvfvzP5Qg7VVuDuxSziQbBc+PyzgCJzYEdms+RmQqMzt2pP6QaRKC/PVqOmcCe0XFG
	4GN7JoVF3CHunqgK9FsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT57g-000000042xi-3DtH;
	Mon, 16 Nov 2026 22:24:24 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT57c-000000042w1-1weD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 22:24:23 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4bb70074ab2so15410305e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 14:24:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794867859; x=1795472659; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ln1EVdAGOFluUL+4qX0wySLdavyI3EeHq5qaZG2vFtM=;
        b=ZkBISZgoMZ1xdbpw2IQa5GAwYHSo7s5Wf3uudXSSbcUkVDBG2U59RdcUq0M5PylNhU
         5z6MEiwzND5XLKCC+mVWk4DGtenRuwDs16+tw2LxSpNidzjZF+I6jurBdr0a1vRwD7YH
         NumWxNpOWQVYpqoNS7VZonVak+CfmbBO+fT6Z71/7JP/XKZw36xOQ2N8s07kHqenslD4
         ll9wuwlcGNwUPQUpaf3xdr+3gDIx/Si4ShJnpQRfqaImdEv7W6flJUfT+EVcvCbMbf0d
         zUem/gog9iP/+62yT1qUT42kWqkfUbdICJFulws9E7eJXKh46L1j2GHOHaz0ECY6nqYC
         I+5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794867859; x=1795472659;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ln1EVdAGOFluUL+4qX0wySLdavyI3EeHq5qaZG2vFtM=;
        b=aUBcKMlqAnxYSpIie2y1T6zhlBfaUkAxiXOCQMrwpV6vbTBvuKV5zL9Kqmxe8RLieF
         zTifNaXDBSjQYM78A2KQJbmFo0WLQDXVtZzFcfzNZle8+yHmwVo11r+pCPhyccSjbqPO
         mcidHlQ5EQBCJXmQbOUTdvNlNTdyjB34GDfa/KGy9Mb/Y8GfekjUHIvZ1QGP+HPux3Ra
         5oE+mBKV8J4phBCOulLTOHTLS6TDZ97Wy1QbkMNmyK/ebyupUjnYuHGQeqH6MYhItVou
         05tkTfN27T5Xq0/cuOh5utcJpl2wlPI7E3ZnFYpDkfwVsR6OLfFXCy8sdIyP88Q7BhnH
         Zz6g==
X-Forwarded-Encrypted: i=1; AL+hErFYnQ4c7ZUZEB/r4/1VFUAeOY/pmWBTAr4IYfffs5PodAlXwS0M0XK8/iq4GwQoynpqaWWOaiDrIKCSTgW0c6Cq@lists.infradead.org
X-Gm-Message-State: APuU4Z80WNVxzYXACeZNlvwq/7w5L0TnEeGuT2mISSJunQhSDEM7wDva
	8Ded4zAS4QZ8xsGWcdrgao2ZUz+ulzkWzilzzuyNsaergIz0yYf1UbSXLF8HnDuMxho=
X-Gm-Gg: AYBFou0ED92qVyNcHnn1uFXJbT/lI7LdsBXvFVrq0Iw3TmEGTMo4dxw+y8B9yDwUy1M
	nBKwfB4w/65N7vNDtXSZDxUqA7GJfZzsat8Bo1hU8G169ASedUkhXYRoMPcvJuU9TOzGamlGjly
	LgvBQhFYa7BinuGMGuoqTt/daEhjg91EWNxiK/J7kJBbOhKC5WD+qL3kxw6VEDO/bP1xCDvjpa/
	uu/JO8Cj9R5Flr4i9+3SSwWdyYJegga/picZSRSWNHgVcSYn7aKjySG071uSQ2o8Kif8OBgcUrG
	T6/AvYivdjH5+6JJRNQstdFz1M6hipJl2GOqaNnd9m7kPm3UOjXREUwmKsrLRWRtJgjwB4acg85
	Qla/RtHyjwGHG3KvqFYiNkDQ9x+2bdzhL42dBbktRk7v2PrTLzb3GwxG8zEFMLeE6vahsn/juMb
	JC6vE9B/jpS8zZC5758bpghit6iAM/kQ1G9KBV8ZAmXWT8dD7CzjFvBueGrPnAjG3/ceG76/8I/
	e5ug7xWjsZrnvIx2lY2XovgC1HgeJrYVHrKfJIK15PaJirpCH/zuVd1OjJLoBjYzHJfj3ggAXOe
	85xW2P4rk+9tEwN2Ki8In08JZn+HO9sTHWE7nvFnoZsyuUylbsBpuw==
X-Received: by 2002:a05:600c:4e43:b0:4a7:c366:d791 with SMTP id 5b1f17b1804b1-4bb559f24ffmr251632055e9.1.1794867858617;
        Mon, 16 Nov 2026 14:24:18 -0800 (PST)
Received: from [192.168.3.100] ([151.61.248.197])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb784231basm18143055e9.11.2026.11.16.14.24.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 14:24:18 -0800 (PST)
Message-ID: <71ede0e6-7f8f-4594-ae56-5be10f9159a3@baylibre.com>
Date: Mon, 16 Nov 2026 23:24:16 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/7] ASoC: dt-bindings: add amlogic,gxbb-audin
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20261018-audin-v5-0-4b8cc13a1b22@baylibre.com>
 <20261018-audin-v5-1-4b8cc13a1b22@baylibre.com>
 <CAFBinCC+-N8LvoXZwMhoxjOzXgoYUfDKCcvmD7Uuph5=hTSg7g@mail.gmail.com>
Content-Language: en-US
From: Valerio Setti <vsetti@baylibre.com>
In-Reply-To: <CAFBinCC+-N8LvoXZwMhoxjOzXgoYUfDKCcvmD7Uuph5=hTSg7g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_142420_535629_185368CD 
X-CRM114-Status: GOOD (  30.00  )
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
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Martin

 >> +properties:
 >> +  compatible:
 >> +    oneOf:
 >> +      - const: amlogic,gxbb-audin
 >> +      - items:
 >> +          - const: amlogic,gxl-audin
 >> +          - const: amlogic,gxbb-audin
 >  From what I can tell it's even amlogic,meson8-audin compatible.
 > Although I didn't have the time to test in on hardware yet.
 >

Thanks for catching it!
Any testing is more than welcome. I don't have that board at home and, 
based on my quick search, it seems not super easy to find one these days.

 > [...]
 >> +    audio-controller@a000 {
 >> +      compatible = "amlogic,gxbb-audin";
 >> +      reg = <0xa000 0x148>;
 > I believe the audin registers are 0x300 wide.
 > Both, GXL datasheet [0] page 43 and GXM datasheet [1] page 48 claim
 > that the register area is 0x100 wide.
 > The last documented register with AUDIN_ prefix is AUDIN_FIFO2_PIO_RDH
 > = 0xb8. The datasheet [0] (page 395) lists register numbers divided by
 > 4, so to get the actual address in the memory map we need to multiply
 > it by 4, which gives 0x2e0.
 > The 32-bit SoC vendor kernel [2] has a header that states: #define
 > AUDIN_ADDR_END 0x28bf (same as in datasheet, we need to multiply this
 > by 4).

I know that the register layout in these SoC is a bit messy, so let me 
explain how I got to the 0x148 that I wrote above.

When working at this driver I used the S095 and S905X manuals that I 
found online, but based on the link you shared for the S912, I would say 
it's the same when it comes to AUDIN.

Using [0] as reference, the highest register being mentioned in the 
AUDIN chapter is AUD_RESAMPLE_STATUS whose offset is 0x304 (i.e. 0xc1 * 
4). However I noticed that before that there are a lot of registers 
whose name doesn't start with AUDIN_, but rather with AUDOUT_, PCMOUT_, 
PCMIN_.
The first contiguous block of AUDIN_ stops at AUDIN_FIFO_INT which is 
0x148 (= 0x52 * 4). The other AUDIN_ block you mentioned is between 
AUDIN_FIFO0_PIO_STS (at 0x2c0) and AUDIN_FIFO2_PIO_RDH (at 0x2e0).

 > I'm bringing this up because dt-bindings are supposed to be complete.
 > So even if the driver doesn't use a resource yet we're supposed to
 > still describe it.

I perfectly agree with this, but at the same time I thought that 
including registers which potentially do not belong to AUDIN was 
dangerous in the other direction, i.e. we cover a too large area that 
will be hard to use in the future if/when we want to use it and we 
realize it's really not part of AUDIN.

 > I don't see any additional resources that we'd need to describe and
 > #sound-dai-cells allows adding the additional SPDIF input later.

That's exactly why I cut the range at 0x148: that seems to be enough to 
implement what we need for I2S/SPDIF audio input.

Honestly I don't understand what the second range 0x2c0-0x2e0 stands for 
as it's not described in the manual. For sake of curiosity I just tried 
looking into the Hardkernel kernel for Odroid C2 [0] but I didn't find 
any usage of AUDIN_FIFO0_PIO_xxx registers.
So my question is: are we sure we really need them?

[0] https://github.com/hardkernel/linux.git - branch 'odroidc2-3.14.y'

 >  From what I saw in the registers there's also the possibility to send
 > the input signal to AUDIN but I couldn't find any additional resources
 > we'd need to describe in the dt-bindings for this.
 >
 >
 >
 > [0] 
https://dl.khadas.com/products/vim1/datasheet/s905x-datasheet-v0.3.pdf
 > [1] https://dl.khadas.com/products/vim2/datasheet/s912-datasheet.pdf
 > [2] 
https://github.com/endlessm/linux-meson/blob/d6e13c220931110fe676ede6da69fc61a7cb04b6/arch/arm/mach-meson8/include/mach/register.h#L2274

Best regards,

-- 
Valerio


