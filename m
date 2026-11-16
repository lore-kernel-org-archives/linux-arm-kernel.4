Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB52D606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 02:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=x4V+INrq;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=00xkITeO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=dz7cTZKRmd5e1YDqmF7k9Y/7wi6YrT3O/phywwy1Iak=; b=x4V+INrqepnGcS
	CxVWXlWSl1n26CAkIPbLlkxdCTLN3xrR6wMKD1o0h60DCbvDpwubxX2IaC8DDjsvja1Hlu/4/gauu
	E76G5sqzUOZ8NhOVEYNp1cyCvLMsfQ2CjRPwvDvdOiQk1t8h12I2bJrPxdHfF8B0iQ2Mt5j4fgOVL
	nJvibjGg8ULdy8gB94S1RUsRjEzw73tqj3L0Hqzn5CG6LgSrN6LcOtvWWSjiddKsm8w6UBgeHLqEF
	M2zmOlJs1JhfiBggaAeAiOC8JHR5Ao3kqxdPWAXwgwoJU4GhQmUqwqW08yru6RlYU7qFtGSUjlqVG
	77aJ3miyqwH8ciOZvvvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSmNm-00000000vm9-2XrB;
	Mon, 16 Nov 2026 02:23:46 +0000
Received: from mail-vs1-xe2b.google.com ([2607:f8b0:4864:20::e2b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSmNj-00000000vlp-48yQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 02:23:45 +0000
Received: by mail-vs1-xe2b.google.com with SMTP id ada2fe7eead31-74ab99038afso2753491137.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 18:23:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794795823; cv=none;
        d=google.com; s=arc-20260327;
        b=cpHzX4257d3fGkjvfrsBKwQfYEnictehQ39LBXPWNgrDPam0aWvpMvkDPcE5LnQtbe
         jsVIt5sD2ess7CXHe6Wv42lsDjlZ+Ip/Gozax200PPC6GoXlzVvI1et5lRGM9mXa0a9B
         OHThsHHUx94rj934jabC2pSduPU277wQ75A8MCfp3jOHT18vaETt/fzP5ZQawS/Bi7ir
         jJBBMrIEs1C3Z6GYO/0+IvQkdOzcNLoipz3VcXCT449EEiiNAdmdm/WWUS8Eh3nzpKgj
         N8QF2z44aSAsYx6Awmg+fgDYjJUglWPOaE0wFzPf9XAEMEBwoOayqfzNzXA8MEPS7zm2
         /udg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dz7cTZKRmd5e1YDqmF7k9Y/7wi6YrT3O/phywwy1Iak=;
        fh=Gap2wqDwyo5MO+0b38csfIY63yu3PtiSLKyIw2cmUfw=;
        b=HjTx/+O5eQlATn5x/mzOXLBTTOC/wB9JLmAEdUomzJ3Q1BfLNeZj+DOtfNbzHIYSTW
         dLCpWLbcARwJtT8EJ0ceeyCNFELjm5kZSNbyD+ScDa7d5UIK4qt1Fxp38JW1LJHX80KE
         WaP/OfjvRneZJf+6Eb+8wi4ixEPlqT1v0/YI9l2WJkXsDtsQPEkdWwgUZ1+s7JoRErHE
         NdWM5oy/H8NHtKDnPMH8TEtuKzqbhn2lwb4qe98JIcma8O9BpWHdBHpP67O8AWdy34jP
         77oD0db8fn35Ys1gYOh/NSmr94fXIct3hQZsXkArgXHYgSQnCPTEAuot1IlVKhK8szHz
         pdiA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794795823; x=1795400623; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dz7cTZKRmd5e1YDqmF7k9Y/7wi6YrT3O/phywwy1Iak=;
        b=00xkITeOsngkUPYITZj6gsVM/BoNM6BMF4Vk6naohtf9MDx98wwckD5yvJYyU6/mWE
         iiJ6t7lk8dGpOx22S59ke+fUTxVBiNNo0CXVWzedy+Cs+8sX1T8c+ovFg785LLgVczP1
         e7Ew2N6Xl9Qvte5A2ykR96y5+cjPU3yvt+FRRGtqIUUX6jeLbSkEAHFmVqlSAzDupfH3
         P18yHbxFfqHI0Kx0BczyQrXRUUifORmtrT6ZK5vEFgHkHIWXT3dEL+gHTdVJJMfSfOIH
         J9T3lON+i1HthF1sR0oKuLANNhMLlYKo0objYhl7b/PKinnOjs8gUqeF5jaQzNODFaIC
         De9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794795823; x=1795400623;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dz7cTZKRmd5e1YDqmF7k9Y/7wi6YrT3O/phywwy1Iak=;
        b=wcbTshI5ytIc5BFJlDVrLl6SpXZ3lPfYzGKWMmxzpg728PF9pC6Gh6tPLkAr6vXyCe
         w+jXwhbmOCR3epuuwePLXHhD8d3t1OZ0Ag9EDu7XQ4DkpZEZQITjOM8zshiBD6OZD9UC
         uxfvn2QpV4USpdRxajRCrDQ2JBk8o3NPp/HwDlkm1ZIZPUgXmfE7fxWRXlLKk4/Z2yFU
         vFlDE+NUl9ZSGMjEj/0zSLfKl02IrGVpkd62P+2LLIiwXXrkYx3+0KAVUu3MvPkvg4nt
         bWUjK27nwE/qvghcvfWK+ZeXkekiHDV5CSLaDUZyn9Xr+2ouF5nUl7Gq3WLH9lf9WVhL
         jO2A==
X-Forwarded-Encrypted: i=1; AL+hErFHTgbIwUsLYtYXNlyMTsaf90edO9/i5kLREJhNK1id/6r+hDFmJTWX2OQKKOtgZLBaABdzn5KP9N35tCWMPm+0@lists.infradead.org
X-Gm-Message-State: APuU4Z8K+c0pittV7Xo8loIkqqaMlCXqUnOYJQy+pdnwX/ND8aaGv66f
	tIyX2OeaQr9N0CK7XkdHfSTeh3r1PlWzBoh4uuiZM8X6YuTRU7zcRYglK3ALvfZO2XdBZ6ooxpW
	itjyaCZChjUGbvCEGHkjuWKkzRsWmew4=
X-Gm-Gg: AYBFou2iOkkkrTScDlk89vlgkZ9X7abWvQm3vUTcndgyS4jPb8wjJJLzCfiFipGfLdq
	A+BUZvMdhAzT7b0zGE4KTHquunVXaSFEoG7Pze/qmuRf9ogQ3OaRMSyylRPHbH7EJnxnJ0ZiIgJ
	Pbj4gVEO4lckrE1Oscxx2JTETps5w9LOPsU9hAfYtGY5kQIyhNB5EA+YPEwFnFh3jey+uvHXjpx
	RmZcoGZ/aJc2VJXmVubTBGa4Mw0JGeTzR9SyZLwNGuTDwvOO3TaL+4LZUyWxHw1YwWXNIACuytO
	J4vdPSls7HJ8W7ioKx2v3lVf3NX98NPTipavj5UlQDGqsr2uoIRUJ67JYEAl0yUdZecMIDRSPdH
	S1YoaQZeIyEpDbHM8h1OO/oCImEzkUkrGzLQa/m6e+G314vhUrAuYp9qSkfKxggq34BuPn2mOIL
	UXhGWB5x9diW1WI/o8UKh4YszWthTFXzDUm5HLKJWh167RVdN4mkU9q3py0Uu4qs7gUmSiUVeX/
	GUkA7ahw648Fo8wM41eqjTQkNIqqg==
X-Received: by 2002:a05:6102:510f:b0:7ad:3ad3:997a with SMTP id
 ada2fe7eead31-7d64d45ce68mr3458686137.5.1794795822798; Sun, 15 Nov 2026
 18:23:42 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261115-submit-stmmac-rx-checksum-capability-v1-v1-1-ea26fa3689be@gmail.com>
 <179479040161.3291.5723238689308327095@kernel.org>
In-Reply-To: <179479040161.3291.5723238689308327095@kernel.org>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 19:23:31 -0700
X-Gm-Features: Aa3M54r7-r68gNu4ymZsCQOh8t93vqxjaKLCKDTADrWnDebXaQvgc4p-YSz5rsA
Message-ID: <CADvTj4orHRWsBCitdUt5rMXisGK-yzjysvGZcgQj=cJ1y1vb=g@mail.gmail.com>
Subject: Re: [PATCH net] net: stmmac: preserve RX checksum capability when
 offload is disabled
To: netdev-bot+sinfo@kernel.org
Cc: netdev@vger.kernel.org, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Giuseppe CAVALLARO <peppe.cavallaro@st.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_182344_035748_5F3B7461 
X-CRM114-Status: GOOD (  23.03  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, Nov 15, 2026 at 5:53=E2=80=AFPM <netdev-bot+sinfo@kernel.org> wrote=
:
>
> Hi!
>
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.

This was found while investigating RX checksum offload behavior on
H616 and reviewing the shared setup and feature-filtering paths.

>
>  - Whether the issue was actually triggered, or is only theoretical
>    (e.g. found by LLM and not proven at runtime). If it was triggered
>    please include the symptoms, like the stack trace or kernel messages.

The capability loss was reproduced in a source-extracted test using the
actual GMAC, GMAC4 and XGMAC checksum callbacks with mocked MMIO and the
relevant setup and feature-filtering logic.

With the original code, disabling offload and following the reopen path
clears plat->rx_coe. The feature filter then prevents offload from being
enabled again. With the patch, the saved capability survives that
sequence. A requested enable that fails hardware readback still clears
the capability.

>
>  - What hardware the change was tested on. For driver fixes please
>    mention the device (and if relevant firmware version) used for
>    testing, or say that the change was not tested on real hardware.

Tested on an Allwinner H616 board with an AC200 PHY.

>
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account.
>
> *IMPORTANT*: If you do repost (for other reasons) - please include
> the relevant info in the cover letter or commit messages.
> --
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.

