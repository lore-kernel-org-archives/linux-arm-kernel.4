Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB89460A260E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 11:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zfJsNWE1;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=laDln03I
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=6pjqL8lgJ5H5rEEpJ/FLBjpoQyXvjDN5uURvtTrdJq0=; b=zfJsNWE1AC6RTq
	WokuSd1crbty/HZjqL5zh4T6pU9j7u5mQnboxxnmYQZwd8u+fNpE/4bE8awN6Yjl2vXkCdQJqW/s2
	rKQEz1UrTypsqGA66msDnbuj4slH5LLRZP6vh0NwCF2WHaQaMhYH3jpg0eqcSzue03L5X0nrmh7Hn
	MZFSIz/8xhcY7FuRqAbqFrqK3+j62jjF8+HJhQ1a7EVa4TTsxSSFbVfNcNMvJi7C16J9FZI6/XBmi
	Gmc+0DDp4bfyODvTCwmJUKfW446t2Nnh+rMCDjWj9wxnQkEtFSx9uGJkBxkvZZEOxqJ7+nBI0i0Bq
	GFBVUC77PSblOwPfKlyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQjo7-00000003b7r-0pMQ;
	Tue, 10 Nov 2026 11:14:31 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQjo4-00000003b74-0NDr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 11:14:30 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso12855995e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 03:14:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794309266; x=1794914066; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6pjqL8lgJ5H5rEEpJ/FLBjpoQyXvjDN5uURvtTrdJq0=;
        b=laDln03IyvtTQyxjeHSMGkz60qbVXiXZsmGVpt01HSBNVUrWMwkK5qDjPJwFNc74CZ
         4NxYtJyhHmh7I9P8Z8NmRsX5LTq+QtG/M/uqrkzU4MWrDxiACj7C77CjnJXoNOB6/1aD
         sLzX+koaZDnq9NOXw3FHrJvEsJbMZqnRO83G/VIHcjCXaBR6V5iq7rgICXc0Mz9S8n/S
         WkHMPy6d2quIxCpJtz/W3tpB12gbqWjBG+VHvjvRAiEe7VyDhZJQmwzPDkSrU+RE2nTZ
         6jtgj8DMPRFSlXcAlK3k9Wvi+CMlwrBkL32wSYW9p8yD4N4K25TH5KkPrGIg343J/qcM
         QTow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794309266; x=1794914066;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6pjqL8lgJ5H5rEEpJ/FLBjpoQyXvjDN5uURvtTrdJq0=;
        b=qBtezPw6E6oufH0JN4h308lTXv6GjFQ+MU95KmnmdXhcLo1LnrCWTQ5NHjAVn6XsBy
         zdOiKMiKZF1wd4wIQsEen6TrAA99io7bnli4r08bhsNQA9GbnVISTTv/Vt9apxd12CGr
         0j/2jFff/vOzhlmO7rxTSC+UXjYfdKNOeBvVdXCBZrc7BEYk42Ldl+fP1jgyVwA6+EBY
         y1zlndh3R3x5fExHqFF845fs/571uMfsUGeC5I0p73mTH+1fWy1xNh3SSJOvt7Bd5Uer
         C5xCS76VzPsZTEEXNphIYU0g8GVkh5Vtpes5wto/AD8z45XXGWTwKl/5oBkPu7TJAwje
         0hqQ==
X-Forwarded-Encrypted: i=1; AL+hErE5uSS173uRrfl7FntRmHBRn8oW1S3jeK8h5RkxXKbJXZgNwmdmfws0DJsSPAt+J8YQbNIYi4qx+jK08/Q8j+Ga@lists.infradead.org
X-Gm-Message-State: APuU4Z9d5WWMBG3Snbyn5BYr2+x3DoPI06OUvYRVt+k0Z8nr0cy+tRxB
	e/VMBhAvevvqqZcoRtEUUfXrY79w6pJ9WUgiI64sROFuJbqhtD2SqVl5duJA06qYurs=
X-Gm-Gg: AYBFou3/Hs81cPd+ApfEza548mKEQAehjV5vl4c/ghtKW5MNLthrCUwLCbQg88wub4v
	XpOBl8On22PvSmOEDSTarrZepaxx6o/iFetfpHECueBPBq0A0JX/jvVPfeySpf/WAUQD4KaQ9zF
	h6nD93RSm0LYuOjmSWTEVgVC2WnBLFtVZ29wgxFkr4yQntbhUJVge6m65REjulXn1hqpMPw7DiU
	vPS3+FgPiY9015EwcUsiAFnbSRS0BEwKujzK7hWkcrqGZelhykN6xb03sYSavKO5BTMo2D1x6Hf
	JoSeD2V7T/Zp4/A9FXqISl4lFxdHsMSmtWOO3mjH2o3HEcIZgSMfEgHM8JqcAw3oWyhRaCtelMn
	cPCDCtOcN0v7HLczjrE4l7f9txM+frYXy8mHlGsovXPMHgJQBmzeThzNmmbMujTf/8VNn9mhQkb
	2bDRFXVHQacqWYWDQxrU1deN+YEaDbkYLuNDsn1UzziwUb8H7vwTqwnLD2j1U1uwey0wCYt2BQg
	Uuj/mgMBVaupU46hlBp+8L8UaOnMoRaNduOQCBsg5FR4C+chZrwLA6IPkLTLTNHcKOU2W4rkeqN
	tJKzEUqiM7N9wa19BiwywHwPqNu0lh+n
X-Received: by 2002:a05:600c:c16f:b0:4b7:6942:39bd with SMTP id 5b1f17b1804b1-4ba0234e2e5mr35596445e9.26.1794309265823;
        Tue, 10 Nov 2026 03:14:25 -0800 (PST)
Received: from [192.168.3.100] ([151.61.248.197])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498365ccbccsm4366683f8f.44.2026.11.10.03.14.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 03:14:25 -0800 (PST)
Message-ID: <ca4c9e4e-80bf-435d-9f55-18f1a38c4472@baylibre.com>
Date: Tue, 10 Nov 2026 12:14:24 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: meson: gx-formatter: change stream lock from mutex
 to spinlock
Content-Language: en-US
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, linux-sound@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261021-gx-formatter-use-spinlock-v1-1-71ebc9224c03@baylibre.com>
 <CAFBinCCV+rBnfSzY6LWfCU_D=BHmWi8CoZE0aza5BhvWXw3-8Q@mail.gmail.com>
From: Valerio Setti <vsetti@baylibre.com>
In-Reply-To: <CAFBinCCV+rBnfSzY6LWfCU_D=BHmWi8CoZE0aza5BhvWXw3-8Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_031428_146888_74E5F943 
X-CRM114-Status: GOOD (  21.72  )
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

On 11/8/26 10:01 PM, Martin Blumenstingl wrote:
> Hi Valerio,
> 
> On Wed, Oct 21, 2026 at 11:52 PM Valerio Setti <vsetti@baylibre.com> wrote:
> [...]
>> @@ -85,9 +85,9 @@ static void gx_formatter_detach(struct gx_formatter *formatter)
>>          if (!ts)
>>                  return;
>>
>> -       mutex_lock(&ts->lock);
>> +       spin_lock_irq(&ts->lock);
>>          list_del(&formatter->list);
>> -       mutex_unlock(&ts->lock);
>> +       spin_unlock_irq(&ts->lock);
>>
>>          gx_formatter_disable(formatter);
> The documentation below states that ->ops->disable is called with the lock held.
> gx_stream_stop() does call it with the locks held but
> gx_formatter_detach here doesn't.
> 
> It doesn't seem to be problematic yet because aiu-formatter-i2s.c
> doesn't register a ->disable callback.
> Can you please still look into whether this is a problem?
> 
> Also for a future patch (not this bugfix anymore) it would be great to
> have lockdep_assert_held validate that the lock has been taken (inside
> ->enable, ->disable and ->prepare).
> 
> [...]
>>   struct gx_formatter_ops {
>>          struct gx_stream *(*get_stream)(struct snd_soc_dapm_widget *w);
>> +       /*
>> +        * Following functions are called with gx_stream->lock held and local
>> +        * IRQs disabled so they must not sleep.
>> +        */
>>          void (*enable)(struct regmap *map);
>>          void (*disable)(struct regmap *map);
>>          int (*prepare)(struct regmap *map,

Hi Martin.

Oh, good catch indeed.

As you correctly pointed out that's not a problem today because the only 
formatter currently present in the tree doesn't implement the 
'disable()' callback. However the upcoming AUDIN support [1] will use 
that callback, so the question might remain.

Technically in 'gx_formatter_detach' the formatter is first removed from 
the formatter list (with spinlock held) before being disabled. This 
means that other start/stop actions cannot be called on that formatter.

So even though this is ideally safe, I think that moving 
'gx_formatter_disable' under the spinlock guard is better: all the 
register access are MMIO (not sleeping) and then the behavior would be 
symmetrical with 'gx_formatter_attach'.

Thanks also for the suggestion about 'lockdep_assert_held'.

I will send an updated version with these problem fixed.

Thanks for the review!

-- 
Valerio


