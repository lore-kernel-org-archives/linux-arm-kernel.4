Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C2AF606A321
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 22:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YfBMoWGi;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wli+Zo80
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=xhzf2GAdeOLD6c0v2imXIzwLHmXmZhjtZ0JwUowL8Qw=; b=YfBMoWGiMdYvgpqc1hYeoc2F8E
	f+16uq2Ochs/ywG50Pn+IUz/3Rbx/5r5JALbJu+wvLT6ES3UTwXTggvmgeo1p3kjHuvd5yBbSrLpr
	WU8VteD9zxqv18nduq978KCDafCRf1L/rq/t/YvfBN9V8t7cIuhCl01oEhJgm+zfEVm5fRnD2Zz4q
	6BBOHhGfq40goNSE1YQBKCjaAVBBzltUgxnRuSnlQ9vMAhT7RNuXpnjoih+y3RCM2Qt60zJe9YVRN
	/WOOP6Jg65jdJ7R2yXCBn75yAag55O6zypOhdHlKqHp0Y0uPt45wAynKLrkzkDSt662aubFf+D/tf
	FOqYkrJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVc65-000000052Vr-0YDj;
	Mon, 23 Nov 2026 22:01:14 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVc5y-000000052Sj-3EEJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 22:01:10 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4bb70074ab2so40552555e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 14:01:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795471263; x=1796076063; darn=lists.infradead.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xhzf2GAdeOLD6c0v2imXIzwLHmXmZhjtZ0JwUowL8Qw=;
        b=wli+Zo80LqmxlpmPuQUrstTb4OXMBjN6XDwSicDEwS9W8cV1zCm0mpRaMHM1Pp9rZ5
         dpbNtkSs+eiCkShmW3jhcgW1/MW01HlJkoL3y4d8noXyLz1JOkKyiIcEC3z4aRPmELCN
         yHw/GRBJZJonncGl0YidF4PnjjRuG6V1BlGpfgA1Fsegw02ZYvsa3q494m9yqKd3AgpW
         oYaR0ivIE5YyQ1UeMCCxGJDV1Zpg6KPK0aMfhCKuPhlpf4KqhOtiiZvkJMcOgECN/lCq
         cixiALN0iLnxll05jkw5RtSlfZk5smd9KZuIpvx2BaU9TTPtNRJmDHh4/NxuVDZ/HJFa
         QsxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795471263; x=1796076063;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xhzf2GAdeOLD6c0v2imXIzwLHmXmZhjtZ0JwUowL8Qw=;
        b=jvkYjjag4te0GeZoHggON/tqLs3RCyedPdxm9+wxBS4bDhYcVllwB8ZdAX4iL753V3
         OTEZgO8NPBNRDxfTrOhD1ECZ49AnvpqoQWRzP85rJ30jZFT1Ao2TQYg8XPhp1/tCk8hl
         dS+i+4cJJOfv07mjEmfKDza+qPp15y7xIfq3deB1RAN3I3zwU/7b5Rd8Jo0BQyrlxbEu
         aDD1Hhb4WkILYS1MLQNvPk9FfYLghsCck19cW9okWtiVZdKkqxzFaKxYmLm2HxLOMbxB
         VCbVPippelO7uIvtCh1TQma4pB33lN+wF6KHORuYsoshq3GOyvD01aJQvCb0fUiqY22Y
         OoQQ==
X-Forwarded-Encrypted: i=1; AL+hErEOUNgVWnTSBtuYJI8w7vcRH45IaioU5mSctZyLhJiys3+K5S8gF+mVhS0pNaW0ftdwZD0YbMEmlMpC5kA5Ytsf@lists.infradead.org
X-Gm-Message-State: APuU4Z/kAxM2CtRcN1EOB1kknDUh88BXHCkqh9OeeoYLUh3Amq00o9yn
	Lk2BzbrBzDxCHcmaJfe5OtROX1Q1g84umKBn2HGs4xbIGOuHH25MRPDR
X-Gm-Gg: AZFdTZdGZti9bWqViPODrW1QSBdpAq+xri1ecG2OSmeoTHauj+Be8NeiLLPXzH2/g6V
	2pUiS+po0vlDR5Kf67OlV92RN6PFUsnGIjd79PH7nbFGEMvpscTfEYCAjQxY4IyGPl9umGXVyHN
	4uor1oDj/z0FnkIVayk0j5qHJxGN6lpNplpSj0zJ67NUhsCFU9o9KRGVhLjrf6BppuHDrr2JoOy
	TYxtChgUcCNNyrJO7QWpJNCOKX4RhpL/fW4tUv5Z8sR0aL3HAthd4OItRJURPxQcJt/xOY0J1af
	iS+y9CDBL0YgmZr0s7KjMPickpz9OQxbzLX2Y59y1UkdPjjY+If2aQdwuKpdZCkEpTJ1M5ttb2e
	3Dp0f8+gP9C2Xgrc0pMijsVBMkh4EK0evuzjBz24T83MVREjnwRE4Oy0mscpF8YN41IGGyi3TmI
	HWxvmiLW3sQATxuXMWVBm8HzKWcrQEfjpyAS9/AQOpzGq0SoYqArId6/5QZuN/4nMve5G0tJOwh
	RgaXSdwNUX2aKfCunJG4ZY3Yg9o6cGVX3vc04BHotJEGi8MB0DD5tUBwHMIc8OJML6BSJPLSHo3
	TGtDjBA9bymZSMQyauA5GXq/COfHIKrZ08EGcBgIYVeNuwIQ6WDxFwA=
X-Received: by 2002:a05:600c:1384:b0:4a2:1612:6367 with SMTP id 5b1f17b1804b1-4bb88816c44mr270320725e9.15.1795471262627;
        Mon, 23 Nov 2026 14:01:02 -0800 (PST)
Received: from [127.0.1.1] (ip-024-180.users.dtel.ru. [91.210.24.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb85399e2esm434896805e9.7.2026.11.23.14.01.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 14:01:01 -0800 (PST)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-rtc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] rtc: Add Cortina Systems CS7542 RTC driver
Date: Tue, 24 Nov 2026 01:00:59 +0300
Message-ID: <179547125963.75567.6386430167092445665@gmail.com>
In-Reply-To: <202611232056209fabb078@mail.local>
References: <20261123-b4-cs7542-rtc-v2-0-31ab43f2cc8e@gmail.com>
 <20261123-b4-cs7542-rtc-v2-2-31ab43f2cc8e@gmail.com>
 <202611232056209fabb078@mail.local>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_140107_612670_C18DD792 
X-CRM114-Status: GOOD (  11.03  )
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
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Thanks for the review. I have sent v3:

https://lore.kernel.org/all/20261124-b4-cs7542-rtc-v3-0-53902bfbe0ae@gmail.co=
m/

Probe now leaves the enable/reset state alone. read_time returns EINVAL
when RTCEN is clear or CLKRST is set, and only set_time enables the clock
and clears its reset state after programming a known time. I removed
the redundant rtc_valid_tm call, the two probe messages and the ALARM
feature clearing.

I also checked the year field and the calendar on Almond+. The vendor
register definition gives BCDYEAR bits 15:0 to year data, with bits 31:16
reserved. Using a separate RAM-only range fixture, the hardware passed
2099 to 2100, February 28 to March 1 in both 2100 and 2200, and February
28 to February 29 in 2400. Century carries into 2200 and 2400 passed too.
The 1970 and 2038 first-second/boundary checks, year 2000 leap day, and
9999-12-31 23:59:58 to 23:59:59 also passed. I therefore changed the
advertised range to 1970-9999. These are specific boundary tests, not a
hardware sweep of every year.

An exact-driver RAM run separately checked reprobe with RTCEN disabled
and CLKRST set: probe preserved control, reads returned EINVAL, and
setting current UTC enabled the RTC and resumed counting. Each run
restored current UTC before returning to installed OpenWrt, then I
verified restoration again from fresh host UTC. Firmware was not flashed.
Full independent ARM built-in/module builds and source tests passed.

Thanks,
Fil

