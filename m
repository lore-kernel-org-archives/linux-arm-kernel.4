Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 531B4606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 17:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iQGd8ipT;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=cfPEEsAV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	Subject:Cc:To:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=bipnXXOP6GEac7VhzrWgQysb5XbdawIYcGpzXVL1ASg=; b=iQGd8ipTewMQ3O
	aaSQL4v+eVfZE1DTVJyz694T9pNTqdffslMFzzhkFGt5Ya/azNsR14pSF54sfZKuyro6NXFMmsdeB
	B9c35HHCplkXNxI+647Hc3cnCOXNUtgWL2pX+GAiSEx6XDKVvxw5xUpfd0Je7WbdB7A1QdlhhGqBl
	l8lhdqTdo4mG8SBhdPL7YAgpoO+V64dZNkKJVxn93R6uYrUtYgmcHjSnP9TueDalMThi7BHk4nJH1
	oma8Siwbc++eDCzOGqlngkXkWoUemPdX0i3zGw+Pq+JR6I4hLRuCfUW7RcZXFUsZaa5K1UwdTyuEJ
	NwjYKdOHSNDwNorwy1WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVXwd-00000004NnH-27nQ;
	Mon, 23 Nov 2026 17:35:12 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVXwa-00000004Nmv-3KIY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 17:35:10 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so33595615e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 09:35:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795455306; x=1796060106; darn=lists.infradead.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bipnXXOP6GEac7VhzrWgQysb5XbdawIYcGpzXVL1ASg=;
        b=cfPEEsAVp/oDeld8AGot7cDq1q/a/hgBJbCUtDUhQd2J281QyubGbPYl2d+c1VocSH
         ZlAhmDMHlmAENMTWi3gygrlbJ6mjBgLlvo0lFW8TCTl+b1cwsE+3Ru9L/Pfuh2RvGFEC
         GkgZSKlZZ7HRTkvC9SmbkEo1qY6hJ+IE6cMwEp9IkGP9dDooyKT151xEiUo3OeGzQV5G
         m2kfu50RED2ay27IB/OxRUGUME94kfRu7UB01njimbUmSTCvC3YIfC0x+273U57lwN4C
         W+NxOokrIJ6OUn9ri1RE8v/0amLnq9bb3ZC88dlMrAoEh5dXhvi90gtpgNlm65N/EsMP
         mX+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795455306; x=1796060106;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bipnXXOP6GEac7VhzrWgQysb5XbdawIYcGpzXVL1ASg=;
        b=1pJT21DdDzWXCxjRUEsq8una+NdbqG+rUQDZcIVGFcliBziTPmCE7B4PPN7lGFjfuO
         w70l3y3EAaM3VeQB+61FwIK9WFyirm53nEDDk8xn0aBJhN3bNwIfDpBuKIA/HOplKe0Q
         /N6po6igb44+8A15H6IUKdoMBDlYcDZkKvEMzQkgI7i/jJSVvjzDu5V6yseFJiyOASol
         jUjrx/KodtpBkHkCcs+vL1juDI613Nwo7CIK6VaPY73XH4g6JnnScj4Qyo+Fhw2GYyIT
         TjS/zK2DjWzn3fPKoyATtvnqFziQlLguXwvEXs+hBn8zTtBWGv0CKxDqjGqI64k0sNrP
         hpew==
X-Forwarded-Encrypted: i=1; AL+hErHQ8c5zrUTmV5GNUX66rV+wLa+xRHaAqLZztdz7e6lNB6eCcHLFWab+yJ5KMQ9EqBJMnggKsMoIuELP2v3wOinT@lists.infradead.org
X-Gm-Message-State: APuU4Z+G51kxMSvfK1kqsZs5b+6TONQMR3LCCkbRVtwO/LGYiuGbBsqj
	NO4KuOuJr2Q1jBtFmVXxQE55Egzf4YNB7NCgCQRaTSRDwlGoDQr9FcMru0DrYyaB6QQ=
X-Gm-Gg: AZFdTZfocuBeoef1TqonxdxzBJe4v0WWHIW93EaJwQDSO8hQ3xaWgSoUb1XQKg+QowE
	GC6BYbzbYKi9BEp5sX62nR/I24UvUQrEkbsV4z6Cmh/m1D5xAGbF3zxFHx9f9l17r0Hxn5lGY5v
	Iz8yd02FT5Yc8uaBXjSTg1jPzeohqfZNKQc+yTswY8hpBXU9DG0Tevq0BczHdSqfVnfA0vI3Ewc
	PvdgGeYZH/0dpw9aODjG8CJ0OvaD9vzbjyLjSYmgndL0/90++8IGKbZmSJojiBaR38XoJ0Y/J/o
	lQ8B9UxgliuQ6Bm4gZvidTnL+THbPZK3GesRxZGQRpoJnfnfBsohpvcRqKnT/8coxvKQSDnEoS6
	UEBX2biAuCpvNmS3p8RD8o0bojO4UqbzO20nT1GiOM+X4FDnsNDZ/YsoeVbEocMuU2vrQ1nWCN+
	hNLcC6v+m1+7w2K1pAXbEZo4S6Tziu0gkyvnDM6I/uMWK9pfpPvaza8IEcJbTnoFkPhM6SDS9jk
	/kosUAaAbTPm1C5Dh6fGBDm4KOJ7/ELnIdhyYREPt1fctljPtFb5/90IpbhFELANlnXyrL72rZh
	8vpX1PdK5t+XTosjgoaCyQEv+PXgjb3aVK0qOneouh9pLIPb4nUaOKmA2LZYgZChv3EGh3LYNH/
	DK4Aai3H3g+/tonyCA/s=
X-Received: by 2002:a05:600c:820c:b0:49c:d019:70c5 with SMTP id 5b1f17b1804b1-4bb887876c0mr279140365e9.0.1795455306378;
        Mon, 23 Nov 2026 09:35:06 -0800 (PST)
Received: from localhost ([2a00:2381:fd67:101:aee4:8c07:a9a3:c706])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88402ce9sm291142275e9.0.2026.11.23.09.35.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 09:35:05 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Nov 2026 17:35:04 +0000
Message-Id: <DN2RSBZYE9CU.1T1IA1OH8S0UC@linaro.org>
To: "Andy Shevchenko" <andriy.shevchenko@intel.com>
Cc: "Sam Protsenko" <semen.protsenko@linaro.org>, "Jonathan Cameron"
 <jic23@kernel.org>, "David Lechner" <dlechner@baylibre.com>,
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, "Andy Shevchenko"
 <andy@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Peter Griffin"
 <peter.griffin@linaro.org>, "Alim Akhtar" <alim.akhtar@samsung.com>,
 "Krzysztof Kozlowski" <krzk@kernel.org>, <linux-iio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-samsung-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/4] iio: adc: exynos_adc: add Exynos850 support
From: "Alexey Klimov" <alexey.klimov@linaro.org>
X-Mailer: aerc 0.20.0
References: <20261001-exynos850_adc-v1-0-791b3516bb9d@linaro.org>
 <20261001-exynos850_adc-v1-2-791b3516bb9d@linaro.org>
 <ar9elr1_tuFhJi1r@ashevche-desk.local>
In-Reply-To: <ar9elr1_tuFhJi1r@ashevche-desk.local>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_093509_024127_F0A378D0 
X-CRM114-Status: UNSURE (   9.22  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri Oct 2, 2026 at 8:34 AM BST, Andy Shevchenko wrote:
> On Thu, Oct 01, 2026 at 04:09:13AM +0100, Alexey Klimov wrote:
>> Abstract the read_value() operation in driver data exynos_adc_data to
>> support SoC-dependent data register read callbacks.
>> Add the exynos850_adc_data struct that describes Exynos850 ADC ops.
>> It also requires its own hardware initialization and exit routines.
>> Add them as well.
>
> Split this to at least two patches:
> - add .read_value() callback and switch existing users
> - add new user

Thanks! Sure, will do.

Best regards,
Alexey


