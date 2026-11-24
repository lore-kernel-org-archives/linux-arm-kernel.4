Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 401F2606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 08:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZTqo6cx1;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i6kA3afv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=miq8lHAk9j+ldEOiiht4iRcOG6aLFpZt8I9oVYIzhag=; b=ZTqo6cx14cZiBw
	m+22mbwwZPs6Mhe5qnbLLNCxcVlsRAjCmP+YlAlW0RlT9Sw/vGA2iTUBpDe4+AXu4tbM0VKAlL6NA
	MMb8ZPfPnTPy9+z8eV3ozJkPgGs3hB0PUmClPh2Hk9EWcdbrIrhS0KezMz/drDVi2J+KsOAjaaXtM
	Uc/4Rnszhtl0i3sfkHQmREhmFxqS20jC+zu4q8J8j5j+jsfLjNQusr9IoP3I8SSGsrij73eVVvOr4
	rPrMgvjg1Q8SzUOMwt/LkVmEZWDSQJBw3IoFo10acoVSB1YHEUD1yfGJOmF4rgVpUo0wT2SN2NiQ3
	0ZMQ/7zL+gXE7KH35iBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVm6C-00000005wMl-2TqV;
	Tue, 24 Nov 2026 08:42:00 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVm68-00000005wMD-2KGj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 08:41:58 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-3b439e37813so1895015a91.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 00:41:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795509715; x=1796114515; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=miq8lHAk9j+ldEOiiht4iRcOG6aLFpZt8I9oVYIzhag=;
        b=i6kA3afvzmgc5hWz810FGHS4/apn2ChCjRmlODN6/ZZWiwqOvSp6ruosqihTz5xA7I
         D2bi5NlbsszB8A36Il/KaPTuLiDOCuwVihozf0JViEg1Y4C7dgIdJovjBEOx/M90qXdv
         c+gtfWroSLJKGUA5MqXtfqz2kuVc4P+ob0PH1sfECiS+26w2zhVAl1UVAzYgzVE+e26a
         FppZB8uU1AEbB8RrAmDN1YdChx0V19L2GfQ9lxYcI4kq9DtCTMQ+4uNe7HLLDLLGikmn
         l2u6Qms5lJd1A37SuHO+Z96q/+n9pZXB9Lfxtn2DBAZCPQ42GEnjVKjQBECea91PdOIl
         QH8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795509715; x=1796114515;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=miq8lHAk9j+ldEOiiht4iRcOG6aLFpZt8I9oVYIzhag=;
        b=ZnA/6khm/2fMjFJ51uRza43qFE5D7azCIEYIUc0YGXT2rePAZZL2M+vItbsi0MnAI4
         Oex0WoC58wDRRsVBPz+qsJ7gNNrv9l4++Nh31HBleqOAoP96ZgmYwTVI/mR5S5RFqp/l
         Xbi7Q6a2ExXvYoo1g228ClEcXHkQyxy/K1cdWavOemrw4TdWXSZbxJTd+g66N2Ormwif
         6xzjsW2StVTxa06N9NgFT85th9ioUjcOViCHS5rVUaeqaqkhMTVO981RA70DYs3v8nb+
         IRauqAb2k+aMMNDarEGQ+fAvvs73MgNADG6ezNz1lDygl/eNGIL9qXqbIoCEXUnHksL/
         gkoA==
X-Forwarded-Encrypted: i=1; AL+hErGimhOkika5Rxcy9J0YLffXBcEUrfvHgl3ahMFg0YUlCDLUgCnVgEtFFmIIdCcVewi2jt6PiJFVp3MWGmbPyovz@lists.infradead.org
X-Gm-Message-State: APuU4Z+B6zjjDVGR4u7saVBro2Ry1hfzDPDpP6d9yE2czD+Nd3y+myGD
	hOHaHMBaYdN+zzfpuneGlKO9GWsRVwO8TACJS8z3mGluRnaFCO8x4ZcV
X-Gm-Gg: AZFdTZcB418uc3J3Zh0t1ehu7MGxo+E9+twij1YTMEfLbAIWwcZ00VDBir7LuJ3u7mR
	trtXSCn1+0GQSKJKDi/YAKUiRr8bRmyTK04nSswoSgbqKAyesMlLNgvkD5HUBg4Hi1/lhki2/GP
	7ozQY+Pcn9bWlfTY3vEwnwNjmVuF557anGGNSlS2ajqLIjdqn9Nl12ESXQ5j3TIuqsp1bqBHLR8
	fVoRnCdLceFjLeGkozSZReZWX25IOcCh10L+ezz2tUqeQP1l3oa/NxS75ReTPyjrCltYmHoSA7d
	nhAU54cg04tiFKkP2ZirWsY3VuYJ2DXZTky+FmlK+upRoN1nOeoWXIhllqXadulOkUACkTFNuzU
	st3YNBriL0l9/Xwrbh+9KFyL3ZsSlAT096Sny+P2BRnqHjvB/UcBmYCPBGYHMAY/tm3zKloFZho
	rpQE+E25djnYLifCYvI4gkBE+w3H6B6s0LA+tv/vv4mBS3mRljAbs0DM44NWkcz1RSlcJoyLGQu
	Nrap6XkdK4pcCaRJ9A8SoqLPcPJ+r6RQS0fTNX8OGNH/z/5cy1JMtuIT1XSREViUcVhv94sFTav
	fMH3DWZTlIi8K6fCPxdqlUYf5031jXkIHI7jut4P0YMd3kt5CToPE3YhVxsBG4LfmfZD9PJygLm
	xSyCZdQ==
X-Received: by 2002:a17:90b:1644:b0:3ac:c98e:345e with SMTP id 98e67ed59e1d1-3b41caef685mr10503851a91.45.1795509715146;
        Tue, 24 Nov 2026 00:41:55 -0800 (PST)
Received: from [172.19.1.42] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d135e9sm24432973a91.4.2026.11.24.00.41.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 00:41:54 -0800 (PST)
Message-ID: <c88fd429-025a-406d-ad80-ec464db7d1cd@gmail.com>
Date: Tue, 24 Nov 2026 16:41:51 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] iio: adc: Add Nuvoton MA35D1 EADC driver
To: Jonathan Cameron <jic23@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 chernyakin.victor.j@outlook.com, cwweng@nuvoton.com
References: <20261117082832.1551574-1-cwweng.linux@gmail.com>
 <20261117082832.1551574-4-cwweng.linux@gmail.com>
 <20261122030647.70b41b61@jic23-hlaptop>
Content-Language: en-US
From: Chi-Wen Weng <cwweng.linux@gmail.com>
In-Reply-To: <20261122030647.70b41b61@jic23-hlaptop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_004156_599849_D354B038 
X-CRM114-Status: GOOD (  22.75  )
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
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, Nov 22, 2026 at 03:06:47AM +0000, Jonathan Cameron wrote:
 > > +	/*
 > > +	 * pollfunc->irq is not initialized until the pollfunc is first
 > > +	 * attached to a trigger, so only suspend and resume triggering
 > > +	 * while the buffer is enabled.
 > > +	 */
 >
 > True enough but isn't it also guarded by if indio_dev->pollfunc
 > inside the iio_device_suspend_triggering()?
 >
 > I think in the case you are avoiding it is a noop anyway.
 >
 > disable_irq() nests fine so it shouldn't even matter if anyone turned
 > it on yet.

I checked this again on v7.4-rc4 (b6a9fa34ce41).

iio_alloc_pollfunc() uses kmalloc_obj() without initializing pf->irq, 
while iio_triggered_buffer_setup_ext() allocates the pollfunc before the 
buffer is enabled.

The PM helpers check whether pollfunc is non-NULL and pf->irq > 0. If 
the uninitialized IRQ value happens to be positive, disable_irq() could 
be called with an invalid or unrelated IRQ number.

This is why I added the iio_buffer_enabled() check for the 
inactive-buffer case.

 > > +	if (!iio_buffer_enabled(indio_dev))
 > > +		return 0;
 >
 > As above, I'm missing why we need to protect the call
 > to resume_triggering. The pollfunc can't change between
 > suspend and resume so there is either one there or not
 > in both cases and the guards inside that call should take care
 > of the rest. If I'm missing something we should look to
 > fix it in those calls!

Agreed. The same uninitialized IRQ concern applies to the resume helper.

I also noticed that iio_trigger_attach_poll_func() does not clear 
pf->irq on its error paths. If request_threaded_irq() or 
set_trigger_state() fails, pf->irq can retain a stale positive IRQ 
number after the resources have been released. The normal detach path 
explicitly resets it to 0.

The error propagation from iio_trigger_get_irq() was fixed by 
dff701806ab6, but these two IRQ state issues remain in v7.4-rc4.

Would it make sense to initialize pf->irq to 0 in iio_alloc_pollfunc() 
and clear it on the attach error paths?

I agree that fixing this in the IIO core would be preferable to relying 
on driver-specific checks. I haven't reproduced an IRQ failure at 
runtime; these findings are based on source inspection.

Thanks,
Chi-Wen

