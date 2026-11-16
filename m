Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF7FD606A329
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 16:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kyOp7hnS;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=V/14gUF1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=YA4HSjIeB4gPYXT/wWzHI76b1JmPd/ZJtbNmLZ/Ltrg=; b=kyOp7hnSGE4xcL
	hDbR1aRAM504hiAt/lH69HtuHwPK7qpS4zgm3k9nDxMLBMKnrWB4TGUqc/eG5e7Q7/ycQA1IItatU
	sWCYloG22EFltJTLlG9M8y7GMfh18WQVg4RoduDCO0k1FuPVKtOqJ1VyWpcsRdP3cYvS8HLeS4/e0
	x8A7peeaxu8ByGJczOxm1XCyoo8xH1Us6BybeARvr1XWyR0Gpa7Kli5kMtlK/GXyCKT1DespcWEjx
	budVBZunymyugWGeNbvkleaz4Nt3oj0JMlXYxTvH466YAhH72ELz5QzsUZzBEFNOkVldC7Gm0ksR4
	qg3VyQGNTcFCo83PdNww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSzle-00000003Hmi-2AWY;
	Mon, 16 Nov 2026 16:41:18 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSzlZ-00000003Hle-2K4C
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 16:41:17 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4bb72b44a97so7950305e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 08:41:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794847271; x=1795452071; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YA4HSjIeB4gPYXT/wWzHI76b1JmPd/ZJtbNmLZ/Ltrg=;
        b=V/14gUF1S69qn4p3CWCFBLWzd+mk8OFfsH5eUi7WdEqgeoKzNERAlRrV6GhthV4d7m
         9PNWhapUNZJD0GJjVrFhdjnQqSV/7IQS8L7hseLVTh2Kx15CLLXsBJnoPKgN9l9By/QS
         aQ1fw5eik5iW+FcnBYR81oLW5IJihsBL9fs5Mx15jaTNlPMcTb/Eyy2J64qz17/9le3r
         dQyMJ/z2cFCq9B9M/snrPA2AnJNazLZ2Zpt5MnK8FOP3CzQwrp89Gns4oMz4aZ8Mz64K
         zSQrub8/o6LtSU83D52u9bz+aKk3bGnw4xgocn6OeA8kflImxEWaLRKgJmlQinrma+Z0
         vzfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794847271; x=1795452071;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YA4HSjIeB4gPYXT/wWzHI76b1JmPd/ZJtbNmLZ/Ltrg=;
        b=VUMSJ5lQiWTxISeyHm27zQR3rYroRwdCX1tZRdSGpzgVFd4Ycd94TJUkVEge/o+IQd
         h9RLlrePq2bNyNeRIk8ITt6dhPjxHJWs4Ty3b39u9zwrYR7x0qM8emPMFRrUfb0CCQPA
         9T5P8lS5ZUjS4+wMj/ONJu2ZcvQXRtrJzTyh5e9LoEHAmwANYNsal+hpFoRg2vKMnztc
         d7uqJ7vsfv387Wx1GT7khAepeBqjeebWyj0/rEC4fl8kkRQ+POcKj0M7yRBlq48OAQff
         SULos76fNjOUu2ENlmKScxOHqL1UiajT3H9TAURoD+xNtm6Vuogfx412VLp+kwyg62vT
         r12g==
X-Forwarded-Encrypted: i=1; AL+hErGm/WnUyND2GmzlxByWGJmVFCkXBJeba3+I0zXG6SYlxCe63LqFmimjUKv+Q/Pbs7LA53xRVPJ4C+ssRgL1x7ih@lists.infradead.org
X-Gm-Message-State: APuU4Z+5WnnEKwxQbYSVp9JldreqoXlGipP7YxP8rM+sqhuiWqfy/4id
	3s9Bwgv0vp429gRRwKjDwPSg4fa6zK68QoInm7KFBKxotDNKtIk9+uJ4l9lPEGen1Rk=
X-Gm-Gg: AYBFou1U3V5z1u0iDGoLZSx41MCoUNvN0V9sz7xozU7sJrxWy9llalJz4Eknr71Y/ud
	YFcNX/Oft7GMo5l3BBKisBD62BJXFNykLvFA+uq0EJmHm6CX2XzWaxoOEJ2KqRfDwfGNF8GcEy7
	yqQqmSlGj08pzSG3ugZZsHxjBVA1Bqenqp9IFj3oyfL78jhseLy+ZZtRZki5IdUMZYbjMaEy60q
	yAz3Xa/OS9MnG509CRTtKJYe61hbblE67tiv5Yf74O25kuG1iSueyRrOEIGQ397pzquxO3l3fwv
	fWeh9DmwORio/h2OaaPwW6EDlA0tR5g7MHe3F5kuppqsTUJ/7aevO+bUsrPbOJ3dd10MSZZkbay
	NYD6GGy6KlAeYFVL1B1WXwS1ue+Hr4THTtSF9cAijN9GCOg6c69nGq7roXuGQjUk8EaeJLCFrRf
	ttLXT4f0j514E4HYsAC4QM3mc72uzfTsRRQX1I/8QuQFw6KHVGgtFpypQ3t2+at0E76eXXIvlPS
	e6kAiV02PA65qVSq0SjBZ+tczJ01vVU1++BCo44hn4i0DbYjwm37fNWEn9p6fuBci+aifMhrw6G
	wJBlfhEwdndHwwL9dkyDeO5HCCoCH1MF
X-Received: by 2002:a05:600c:34d2:b0:4a1:fa27:df7c with SMTP id 5b1f17b1804b1-4bb55ac6cabmr228383715e9.34.1794847271206;
        Mon, 16 Nov 2026 08:41:11 -0800 (PST)
Received: from [192.168.3.100] ([151.61.248.197])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb5720f6basm154341245e9.4.2026.11.16.08.41.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 08:41:10 -0800 (PST)
Message-ID: <34e02f23-1ace-4a13-9353-b73a1464a592@baylibre.com>
Date: Mon, 16 Nov 2026 17:41:09 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: meson: aiu-fifo: prevent sleeping when spinlock is
 held
Content-Language: en-US
To: Manuel Ebner <manuelebner@mailbox.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Christian Hewitt <christianshewitt@gmail.com>, linux-sound@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261111-aiu-fifo-fix-sleep-on-spinlock-v1-1-dc9ee401a7cf@baylibre.com>
 <0140bc0b3d1078bf8851340e0cb893b2907e146a.camel@mailbox.org>
From: Valerio Setti <vsetti@baylibre.com>
In-Reply-To: <0140bc0b3d1078bf8851340e0cb893b2907e146a.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_084113_609662_0B31A4F0 
X-CRM114-Status: GOOD (  26.75  )
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

Hi Manuel

> I have read your patch and have a question.
[...]
>> @@ -48,14 +49,22 @@ static int aiu_fifo_i2s_trigger(struct snd_pcm_substream *substream, int cmd,
>>   				struct snd_soc_dai *dai)
>>   {
>>   	struct snd_soc_component *component = dai->component;
>> +	unsigned int val;
> 
> Here is val.
> 
>> +	int ret;
>>   
>>   	switch (cmd) {
>>   	case SNDRV_PCM_TRIGGER_START:
>>   	case SNDRV_PCM_TRIGGER_RESUME:
>>   	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
>> -		snd_soc_component_write(component, AIU_RST_SOFT,
>> -					AIU_RST_SOFT_I2S_FAST);
>> -		snd_soc_component_read(component, AIU_I2S_SYNC);
>> +		ret = regmap_write(component->regmap, AIU_RST_SOFT, AIU_RST_SOFT_I2S_FAST);
>> +		if (ret < 0)
>> +			return snd_soc_ret(component->dev, ret,
>> +					   "Failed to write register on trigger");
>> +
>> +		ret = regmap_read(component->regmap, AIU_I2S_SYNC, &val);
> 
> So as I understand val/&val is just there to listen and forget what gets returned.
> That's kinda weird, but not an issue.

Well, I understand that it might be weird from a software point of view, 
but it makes sense from the hardware one. According to the manual:

     A read from this register indicates that the next sample to be
     sent out of the interface should go into the left channel of
     the dac.
>> @@ -37,8 +38,11 @@ snd_pcm_uframes_t aiu_fifo_pointer(struct snd_soc_component *component,
>>   	struct aiu_fifo *fifo = snd_soc_dai_dma_data_get_playback(dai);
>>   	struct snd_pcm_runtime *runtime = substream->runtime;
>>   	unsigned int addr;
> 
> Here it's addr. It's not yours, you just kept it.
> 
>> +	int ret;
>>   
>> -	addr = snd_soc_component_read(component, fifo->mem_offset + AIU_MEM_RD);
>> +	ret = regmap_read(component->regmap, fifo->mem_offset + AIU_MEM_RD, &addr);
> 
> Similar as above. But why is addr here and val above? I think it's the same role in regmap_read().
> Would it make sense to name both the same? If it does, I'm in favor of val, because that's in the
> kernel-doc of regmap_read().
> 
>> +	if (ret < 0)
>> +		return snd_soc_ret(component->dev, ret, "Failed to read FIFO pointer");
>>   
>>   	return bytes_to_frames(runtime, addr - (unsigned int)runtime->dma_addr);
> Here addr is used, so it's not same as above.
> 
> Looking forward to your POV.

Here I left 'addr' to minimize the number of changes in the patch.
Looking at it again now, I'm more in favor of keeping it as 'addr'. I 
understand that the regmap documentation uses 'val', but in this case we 
know that the returned value is really an address of memory, not just a 
generic value.
Also keeping the name as it is makes the last line of that function 
reading smoothly.

However if you deem this unacceptable I can change as you requested. 
Just let me know.

Best regards,

-- 
Valerio


