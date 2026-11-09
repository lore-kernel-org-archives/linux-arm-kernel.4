Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9A44606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 05:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MIRvfU0n;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a3WitY9m
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=+JKPXzOXiWeUhRjPCoGmPsKCkrFKLMgj6krvEZ3KGKE=; b=MIRvfU0njZKHx4
	PG5Li44S5XOjCU2qJu4eyJVm03YOZmaUMtYlDHwxlEu8U58IIAsVAaJNaXY/sX3ZhJkkaCQ/MR6yq
	ujUZgtfVVitgQhRCi8VrIJ9Gy4m6f/eZI57fiY+oTofzNrVJMF9awskpiDxraPhB1a8J0RNk/z6jA
	dnQW3I/ahoTADK7z77Fju70PQ2CVl7rso8goYEU/i1afeVFgi/d9Nz10X5u/D3FWXhjIEC+okFrwH
	zBqly1gKztcKN5aRc7uVHq7CnAVvEkSj+CHYxGzHrHQblBP1PFMOk0aeXrqeoi9u3kBt4TRVbda8A
	XK3DzxhZdLb9Z7ur/rWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQIMG-0000000HT1S-0jnP;
	Mon, 09 Nov 2026 05:55:56 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQIMC-0000000HT0p-2qWJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 05:55:53 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so5850655e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Nov 2026 21:55:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794203750; x=1794808550; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+JKPXzOXiWeUhRjPCoGmPsKCkrFKLMgj6krvEZ3KGKE=;
        b=a3WitY9m5C2LjFUIdDo8LU4ox5g47ZdvYwKy22iz+TjoCR44MA0ZWVIjKQKGKyVpSQ
         lne9MPPiJ1jjV6WuahpFF4pcxmnSPY+GWT3sEsMWTS+p5gxuw1RK5bjrQjgoqhbDqBXG
         wuRclCXFlbj8SWDxuAp20bjRnctcEYTXJyf56lpGJsgXEnv1BvkcSutv/b0n4UNhz07R
         UD5SPMj9FqQyOxUYF6fA040MTciYuAz1Ka5OtFx1zkgJqro+RW5lqa6wCW6/v14+qJJc
         kiPHWd6PWcwuiDVaUJl8vyLY95OU0EtLNCVoz4DtNtEOck3M3mGuEZAVMwQtm4wIbTo9
         +C8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794203750; x=1794808550;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+JKPXzOXiWeUhRjPCoGmPsKCkrFKLMgj6krvEZ3KGKE=;
        b=CI1n0O8ZN9CYL9HBvsj73FOIoG/zpwPLbiTFyridS914HyAqZJOO6VDGe4Gdz5Debw
         8hqTO2r2GKV+6qgOmg4KAZhTU1SHzjgT4cJFjy+jf092PHgPICzuEES4BAA13g3gMT9L
         UKoQfpYlWADOGZHncAKHujUEFz7lxjxdYF2ngD4dC64xvzkntZP9aLaiPTZhdwTK569T
         KH8LG3WEBxp6t7ls10ryHOX4Xg7/w11sUcTjVOkFpeDrpq+RsFoLwisixgAzXhC03HTE
         AapsjPmSONGfx6baBMBfyhuCQSvECLeab4yiyeRqeQkQ75PXgOzgJatQYmEI2Nkt1Hgb
         0zHQ==
X-Forwarded-Encrypted: i=1; AL+hErFRuBpW4j0ofJ67yecZIEItQPT8A6hrzllLxHaG37RdReGibg7pF80gQBtEmResyPxJDSNm3+1HA9JexwjEHQ+9@lists.infradead.org
X-Gm-Message-State: APuU4Z8XMJOLktwKYu55QjbxyiuJOlWcqW5Nz6ql5ofkRHk28YazZulo
	GujEswWyoMLJM+VugRnS7LU6duIT9PzYcXDcWFupatgp1mKeIyDBH/4t
X-Gm-Gg: AYBFou0YurIPtNYf5BOHk2v5fHBCNWO86abH6cQEJva8rcsUFzL4vrxTQADcj+58eoS
	w5AGn13GTFmELFRPmB3phTvim8+9iRY8g90kiGnHep0S8mNEwLh1cvln6RExMykVgI+RetncLDm
	7WDfPvw6Swugc/K9HmgI+eFmm+6kNAeVHDRWukm90sA3LFwdvDMwqd40OMwO1lJG+zHv21MiM6v
	uhUGLkzGoYq9xYckMJ4sK55g11CWbS3SHFJVuZBs+s+XRTWwTKOuk/59w2Y6HGQT2VLaMGcz8P2
	AE+kkDUa6COqVBZjIUDIy1vYHZXhkNLTK0lv3s/fhMB7QXKaGTzwfQhBCyePrQI44rAsMSEmJwf
	sfA0/TBcMJOj0XaLyvXKPr5nMgwxQgu8iM8J+PhqgsXCHRjBbRhIXxQ7kY5rRfpIlf47WPMz49A
	GZbUAlm7R3+RV1hbClbpNP3aNgC7upCU6Eqsqugq5VNSkiYAhOPjeR+MMh9efLSubNcFWHcQwF1
	YlDRHpd4aD5EE1nyLBcQvpO8V7crRxed1MEdWNtC/so72CLmaHysPB7L5eIZg0n6w82Y9E3ynU5
	wqGmR/is3V08fJUsVAFvzC7o6D3yrV7yhDFF7kB0g6r4pEq3cn31a9qIDFLLowSDWcSOarXE
X-Received: by 2002:a5d:584c:0:b0:488:7df9:3898 with SMTP id ffacd0b85a97d-4958cb50b2amr5677097f8f.56.1794203750094;
        Sun, 08 Nov 2026 21:55:50 -0800 (PST)
Received: from [192.168.0.40] (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4959783fd04sm7983953f8f.47.2026.11.08.21.55.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Nov 2026 21:55:49 -0800 (PST)
Message-ID: <17b8daee-c5df-4b03-a839-38b5ef3edf3e@gmail.com>
Date: Mon, 9 Nov 2026 06:55:48 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] firmware: raspberrypi: Store child devices in
 struct rpi_firmware
To: Stefan Wahren <wahrenst@gmx.net>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Eric Anholt <eric@anholt.net>,
 Stephen Boyd <sboyd@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261107-fix-raspberrypi-firmware-v2-0-5bfe605a5cc5@gmail.com>
 <20261107-fix-raspberrypi-firmware-v2-6-5bfe605a5cc5@gmail.com>
 <63ecdac3-f8b3-4d44-9b0a-37346568d326@gmx.net>
Content-Language: en-US
From: Sander Speetjens <sander.speetjens@gmail.com>
In-Reply-To: <63ecdac3-f8b3-4d44-9b0a-37346568d326@gmx.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_215552_733957_73044797 
X-CRM114-Status: GOOD (  12.86  )
X-Spam-Score: -1.1 (-)
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
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_GMAIL_RCVD,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Stefan,

On 11/8/26 22:06, Stefan Wahren wrote:
> Hi Sander,
>
> Am 07.11.26 um 19:21 schrieb Sander Speetjens:
>> The hwmon and clock platform devices were kept in global variables.
>> Move them into struct rpi_firmware so each instance owns its own
>> children and their lifetimes are correctly paired with the parent.
>>
>> Also check the return value of platform_device_register_data() so that
>> an error pointer is never stored.  The child devices are optional; do
>> not propagate registration failures so the main firmware interface
>> remains available.
>>
>> Signed-off-by: Sander Speetjens <sander.speetjens@gmail.com>
>
> the first version of this patch contained fixes tags, but they were 
> dropped without mention it in the cover letter. 

I was not 100% sure if the commit needed them. If you say that it is 
needed, I will add it again.

Kind regards
Sander Speetjens


