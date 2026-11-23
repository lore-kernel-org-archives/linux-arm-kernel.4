Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F4EA606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 09:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CJoR6RHv;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=c7cb/86O;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=aIj2Dmg2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=XivqS2GzXFfLVs4e8GPr3drYgoFDRP+i4GE/VUr/Vsw=; b=CJoR6RHvyTCybuYeF4WeJiUBj7
	ed5oChJxEbjUgLjxDgt4EF6jGLWPB/wWttljhHj47fE0SpqUJYGN17tXzY1QzQytmYIsQOpxAQ8GF
	zlUFoCfkFrUWTbg8o5WqF98xvWTBy8cyiAorUCPzpx4jEMDUirFMwmYNQIZ8PlwuMjjZDCM5nQkvs
	/0TMoAsGPu4/sS+kRBe4xjNethiNEEqY2MmSxy6ylSphtBRlOxLIDSmvcxAxNK2ecn0ngiusY2fDY
	nepgmAjmXe3orWvQNz+279i16g+YvwFZrnFphsmO0a/rvJBsF1zjZLBMN+FVmL6EqtMmgajUwxGSi
	9uVCTu4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQCx-00000002gGK-3mMi;
	Mon, 23 Nov 2026 09:19:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQBH-00000002foq-3ehg
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 23 Nov 2026 09:17:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=XivqS2GzXFfLVs4e8GPr3drYgoFDRP+i4GE/VUr/Vsw=; b=c7cb/86OwmpxAM+4qSblShryBo
	YOeVKfTA8TnPRrRFHxem8CqCx5JvGdmXRfJcBQbWDNyLbUYkBXfc8/cbRqlnW0+QCC/wGTuV6OzVa
	NHUKS9B7TuhHiWEt+uZXa6X6Z+AaM+3f4fh/VsxCk9aSjVWBZa9UoFdt4TMMf0Uo9MvdtccGQMDRG
	IyP8u2q1q+yCJt1GPQcmr9LMM6/bph32HXCw9t1bPqiWX92SnuLCi2EMzFyYUCo0MB7xSedbIFXAo
	wHW1LIonqXmT+7EP47A7hJzTnnrlf+5G+N2eQBVeQ/54ZbyHslMp4bsvdraY4215OSoFvmlBgrACi
	WrH6ItlA==;
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQBA-00000002uMX-1SiH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 09:17:43 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4bb606491faso16519965e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 01:17:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795425458; x=1796030258; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XivqS2GzXFfLVs4e8GPr3drYgoFDRP+i4GE/VUr/Vsw=;
        b=aIj2Dmg2tgAKqJUov8lnd43+1KF5Qwcau0+S17VFn0oVaEj9bGBoLicQAVcBrb/q8H
         aro0aUiy2wzPtA6YRwlkc9tk4t2uJfkzHZbGbHgfcaLQ+f0P5QQwcLFkiU91KRNHBPsz
         5UT2jDKL0FszdLGrnfr4MMDYT6IIY1lrYpI7yHOyyvzoQaWOmo768bwy2ZncQdDa4Kaa
         mQV+YQuTRs/UPkeXVzOs3WinBZ90s8JX1qlmF472nsMVbEORZuLFaDb5W7QR+0JCPmds
         Qxb46FNX9bRs1Vu0iO+kiORxmQ7d55QAkadM0JYSV3Vq1wS9aMOxKwgUWzXkuARb09OF
         S8PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795425458; x=1796030258;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XivqS2GzXFfLVs4e8GPr3drYgoFDRP+i4GE/VUr/Vsw=;
        b=Hlbohe01ZMYGGaIpWlGSp2WUte/BP27LNzB5YsjnISN2LnPguaYwTYKxdjHb0pd8zo
         Y1w1TkNszw1/1VQ5x2mX9b6dSFANUQ8rFY9ziN27/wVFaU+ulgRHM6GMBDJ8ONA0KlKA
         RIQBWCUsq+52CQpuCAR3xn6EBf6yKnu5U3c1+QXIQVEj8G4GZxmv1AA1okoFawqQYZqL
         66/xHB3Z+2mKkcAoeRU0gocpsS6Zm0V67a7xgxdbIVVFfIzV//VISGlOeR059wU128Br
         Zt2b3GcvTCe0we3+2vu4Gz/K1mpjYw5bW9n4ZIYwhf0euCYxO3um1ThURYSOXV2pAyhB
         GHpQ==
X-Gm-Message-State: APuU4Z+A7C4T4gkmAWzRnuP5ETgZ0lnOKV/8qIjvy7ZuIO7EYHeI07/u
	cmA77yOo/e5x0eJHLtKRkyZJ99IFjPxI/2suNY9rbWrTBaohC+B29ySuz1YyeGGcqA8=
X-Gm-Gg: AZFdTZeKo7ZiWnvXFgdTH5s9wKs1HcewCLCY+LdNumuHnSpjdhH2iUxXjw3GB/2SAnr
	Q+bJvwhrB/euGqJe6W7RZxq8I4N7SMsaCSpPvST0toaWBYf1g7Tg6rUckfvB7MO22ZKHwR5phbG
	EPvcdA/KOKRWLjPklA6bSn1UOqIhNyGNI79q6rZd5gTX2jsySmBjrRiMHaLkn6XghJ90dErZpSy
	bQh+Upkgo4HKRMnwtZsrHmsKixm61jjN+zoBhpYh1+D7sJQTmwzUO837oIHTBx9tmRlxRTOCJaZ
	gl/maGtdSQN9riCcbW3MAYMEo0HVsP9Glfrz/RsjG43XLpibUiUBkGMRYhMr4I13tb6rFSpdgE6
	gc0xA69gyyJxgQSuIjNE+gHpiJNflq0oayW4ICzeKB5xpKUPvqd+j3A/LFEPKVbKYdazHXNQ3BG
	MPS9LUcTKbqogI8h6DwWFnEs/C3oYoHE1C5NX0PgiCAp17CNIuvtncgJHPluZNUbnoQiuzgpwx7
	T+7MGBy1xPPhO6tWgCtOvd9P31Gnu9Hgn1Z1eT7AmUvSb46pWqWv7lRc18HwDFzAASfO9fuT4of
	51ylZJJVFH4N+Xz85HQ0oCFhCjV2AGRJrHy4sugO/XqYKIR20veAIEZVBIOdNNwX96I98p1frpX
	yioBEcdQacmYu0FLSCkFUkGwtZs/UbT4mf41tvQ==
X-Received: by 2002:a05:600c:468b:b0:4ab:cc03:7f60 with SMTP id 5b1f17b1804b1-4bb8881b511mr224342725e9.18.1795425457707;
        Mon, 23 Nov 2026 01:17:37 -0800 (PST)
Received: from localhost (p200300f65f19a90438645cebc2ee104e.dip0.t-ipconnect.de. [2003:f6:5f19:a904:3864:5ceb:c2ee:104e])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb906e4ce6sm162891895e9.4.2026.11.23.01.17.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 01:17:36 -0800 (PST)
Date: Mon, 23 Nov 2026 10:17:35 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: yogo.0917.sabu@gmail.com
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Ulf Hansson <ulfh@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Russell King <linux@armlinux.org.uk>, 
	Arnd Bergmann <arnd@arndb.de>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-mmc@vger.kernel.org, linux-doc@vger.kernel.org, 
	soc@lists.linux.dev
Subject: Re: [PATCH RFC v2 10/13] mmc: sdhci-at550: add SiRF AT550
 programmed-I/O host driver
Message-ID: <awQEjpz2572Y9wsB@monoceros>
References: <20261121-at550-rfc-v1-v2-0-b0309d0789b2@gmail.com>
 <20261121-at550-rfc-v1-v2-10-b0309d0789b2@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="53xo6eipu5xw5r7j"
Content-Disposition: inline
In-Reply-To: <20261121-at550-rfc-v1-v2-10-b0309d0789b2@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_091741_898245_9B934817 
X-CRM114-Status: GOOD (  16.15  )
X-Spam-Score: -0.2 (/)
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--53xo6eipu5xw5r7j
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH RFC v2 10/13] mmc: sdhci-at550: add SiRF AT550
 programmed-I/O host driver
MIME-Version: 1.0

Hello,

On Sat, Nov 21, 2026 at 09:43:20PM +0900, Yuugo Yoneda via B4 Relay wrote:
> diff --git a/drivers/mmc/host/sdhci-at550.c b/drivers/mmc/host/sdhci-at550.c
> new file mode 100644
> index 000000000..11c9de0c9
> --- /dev/null
> +++ b/drivers/mmc/host/sdhci-at550.c
> @@ -0,0 +1,51 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/* Standard SDHCI PIO only: do not assume CPU/PCI DMA address equivalence. */
> +#include <linux/mmc/host.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>

<linux/platform_device.h> already provides of_device_id without the
implied dependencies you get by including <linux/mod_devicetable.h>. So
please drop the latter.

Best regards
Uwe

--53xo6eipu5xw5r7j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmsEBK0ACgkQj4D7WH0S
/k7hOgf/csj9IbehNzv7kJ/jSWUzgb6r4/RUEEbwtHDzllOp2mTN98xOQkRXzRr+
kmuM5eb3Prkbs0qQBPQiihfmm0Jo8lnvB2N8uBswWQM42XQ1o5YmtZx2RIs5cp4a
M0FFz9Bz2fH6rmOr5ETS3FRjnZ8CNqQnaFBWD9lGusUfgppfoyqvFwbXBZyQd45Z
KCR1pIqN6sWoDMkalLwcL8/M72VapgfDtPpmNp4qxYjf3m8WbJJZGT7uK2Mk78DG
WWybLbbeuHCv72ICgMdJArlShc5E7A8r/LZSSpXjnNPBCxOU5AeW1Fa/7Ma+TYWI
G0UtaE9KZSsmGdqMVovJUC5O5/MnDA==
=R4EF
-----END PGP SIGNATURE-----

--53xo6eipu5xw5r7j--

