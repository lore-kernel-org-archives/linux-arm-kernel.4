Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6938E606A33F
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 04:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=D6xKx3qH;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OSNEYP2u
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=bJZ49mA/2fv/eo9vW0sZHgqgFD/tfUpaTmYh5t4KpuM=; b=D6xKx3qHdEv2S5
	zcanapjcKoA6R2awMdIxD+ZzmF6yrr4xadBnch9obhuOUm+sPNVx+1bZcuE1Pdb2rQv4/dv8ilPj8
	stBHT6TwWMpf1itabj7uI55IJtNBlEjqNRjOW2Se+WVx35O9VIuo5kw7XTQudZQ+RAXGldvjtvbdY
	uiyXzD+OK5OfEdjz6Q6ZeXK86iZsK2iCP2pZV8SNcj7lB0fL6KDwZWRUwXWpwI0KiiH1xBv+QJxeY
	QarlTYB3vID2fmEMEiYDazMZJckkev0Uu2ALv3ZMrhVBv1dcSpLvafIHgGdsANqnwgXjbvWeKXuRc
	O5Xrbyhb7PwttHquXoew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS5C6-0000000FMhy-2SdX;
	Sat, 14 Nov 2026 04:16:50 +0000
Received: from mail-dy1-x1335.google.com ([2607:f8b0:4864:20::1335])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS5C3-0000000FMgn-0s9t
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 04:16:49 +0000
Received: by mail-dy1-x1335.google.com with SMTP id 5a478bee46e88-37986eb6fa2so903273eec.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 20:16:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794629806; x=1795234606; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bJZ49mA/2fv/eo9vW0sZHgqgFD/tfUpaTmYh5t4KpuM=;
        b=OSNEYP2uKsUSxLit2fLKYNBlPKGmgWTb5CqvYzT2MGUyU25lJC6d5U6DLPbv9DEIet
         1OHxWWEAqEJfwli6FraDOlNqQT455OmBORetShSLcOrCq3madRNpL8RU4y0w/aGfJWIj
         hpOe9+0cc+SEAuabstU7jhS7hT9X5Il2MlvIJi271oNvz/L3LBpy15Xm/VqwqzA55xIS
         IWL72RrIaWOK7o0H8GdmT5/CIogI9bLNww8D4+8m7CGO6cJ6k2910m5BKhZ98PFk9947
         LgmcHLwSwNsVUYxOl5Otiz4UeD69h5nLF2JKIODZjSAaHXy4pF/3ZDhF+U/WSu2yhP8n
         rdVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794629806; x=1795234606;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bJZ49mA/2fv/eo9vW0sZHgqgFD/tfUpaTmYh5t4KpuM=;
        b=ZODjgHIkRt9qrMUUcnwRO8e2Fs+vckfmQNvi7zWNpzSWvi4EQCkOc6sV+ql8IAMC+V
         sHlPlBhPVHkurEHV5SVz8X47LQQCGiYN9k0fD97zkXyrsaSZh+ybSvNIzIQUzhyGwDDW
         5XI4N7Qa9p7c/ZMtFkysUTAJG2DDZ8/Swq7mOwiBWU0jcgRXXCjvaa3o2Ohw66IHtYF7
         dMxQXCIjbWvI0aoCNs5UNgYoTB0j0zYoFglH1FN43QQVTz69t2+jZAL7vC+X0fNoXUJW
         JnmTRmkm8w2XtRIixTs5k/MVjY/0ZraDSBswFXVC/DG+kRcCVAoxpKxwz79tgMmETuvD
         aEFA==
X-Forwarded-Encrypted: i=1; AL+hErEoiOmEYxTgHp+juHLQYGEQ4woC918cs9tQvExa9mPm0V5Jkwp9JUN1aYtSjYTRAH7Zizn5zoY72TMWoc1H12Hc@lists.infradead.org
X-Gm-Message-State: APuU4Z8NKX9e5NAynwYdtuppO15m6QvlkdcBnNz0l51NHFT/1ahlRhqR
	Ycv6nMjQc247082NA2iRAmLS00QjLQIGzYEGyJki3ZvuH0ZbpRgb0axi
X-Gm-Gg: AYBFou0Nyq+9/AFcUeS7zSdldlHSn4gJnS1bL2UQHg92ybYfHv7Bu0WcTsFWxNCBp5U
	zZmesHGZKCGryrje8+kxPZt71O3dabaYZtNqXwh6HMEbLryZXZiZFZkrFT3gHGS3Ef7O+0aKuXr
	OZJKFUsil8qdob62wvOhnutw31hjpq/6nsf3fyKWXZTgyDb/6k+3+wto6UbgLJS7HhuzbNs9QnW
	w2yvGgNgV/tL3Te2o4UMt2MnlMfOKGVhP2onwkmgTK396I7v+CkQDlaBImb/BnOfCagGONmR4Zr
	Vb0w0WzHAYrCCw5WGVOdn0cbrz7YvHltBCwVjaogS81Oyy102aSKYInLIlOcJa+vIXD29cjhZ7a
	zsxq7RS5n4mFesGDi2zIVtUeRK/8bgzuz1UW1e8AkqCrd+Xxi2CP51yRCtACd3ebqTP36ipYJYR
	173jWXw1QARkAiC8dgZBKIs+3YsOqPDny5fPJERXBCryMZoZ7aZyJPvdysk+bxGa+EwecnziOC7
	Vr23/4pjJTZHSekDU+Y3wqSRnYWHxY9daFj8qYQIRtZnNaYo0A6OptwDzuhDtL4kEBZ9YoBsdTU
	wf7tsWG3XvyTeY6dANtGwcTkpcs1HqYXYdabJeqoci1pyL7cjJKsKmxBPZzMr/dzCkDs+SDD9RR
	v
X-Received: by 2002:a05:693c:6293:b0:378:314:4033 with SMTP id 5a478bee46e88-379679e29f2mr4158766eec.32.1794629805701;
        Fri, 13 Nov 2026 20:16:45 -0800 (PST)
Received: from [192.168.10.3] (ip70-187-214-22.oc.oc.cox.net. [70.187.214.22])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955f01d68sm11849406eec.17.2026.11.13.20.16.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 20:16:43 -0800 (PST)
Message-ID: <34ffee4c-c5f6-4050-b76c-637fc48d1030@gmail.com>
Date: Fri, 13 Nov 2026 20:16:41 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ARM BCM53573 SoC hangs/lockups caused by locks/clock/random
 changes
To: Florian Fainelli <florian.fainelli@broadcom.com>,
 Linus Walleij <linus.walleij@linaro.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <zajec5@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>,
 Boqun Feng <boqun.feng@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, openwrt-devel@lists.openwrt.org,
 bcm-kernel-feedback-list@broadcom.com
References: <a03a6e1d-e99c-40a3-bdac-0075b5339beb@gmail.com>
 <CACRpkdahWm9aP+UasDx=s3th+vyjAfuWrKB5HS9BKEbz90ZmKw@mail.gmail.com>
 <ec17c6c8-e697-4a5a-a705-bff24daae7b2@gmail.com>
 <CACRpkdZp=4sP_1a=u6c7DGbPWA8WRee4J8Wpsw7Y57S2FT5GFw@mail.gmail.com>
 <92190d04-9b43-47ad-9dd0-4b85bb60f8ef@broadcom.com>
Content-Language: en-US
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <92190d04-9b43-47ad-9dd0-4b85bb60f8ef@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_201647_254598_3ADDA77F 
X-CRM114-Status: GOOD (  23.69  )
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
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Rafal!

On 11/29/2023 1:42 PM, Florian Fainelli wrote:
> On 11/29/23 13:33, Linus Walleij wrote:
>> On Wed, Nov 29, 2023 at 10:20 PM Rafał Miłecki <zajec5@gmail.com> wrote:
>>
>>> Here comes more interesting experiment though. Putting there:
>>>
>>> if (!(foo++ % 10000)) {
>>>          pr_info("[%s] arm_pm_idle:%ps\n", __func__, arm_pm_idle);
>>> }
>>>
>>> doesn't seem to help.
>>>
>>>
>>> Putting following however seems to make kernel/device stable:
>>>
>>> if (!(foo++ % 100)) {
>>>          pr_info("[%s] arm_pm_idle:%ps\n", __func__, arm_pm_idle);
>>> }
>>
>> That's just too weird.
> 
> It does seem to indicate that idling for too long wrecks havoc, but it 
> is indeed not making much sense. Not having proper documentation for 
> this SoC, it is hard to figure out what impact does stopping the ARM CPU 
> clock has on the rest of the memory subsystem, especially outside of the 
> CPU. I do not believe that this SoC has any form of PLL clock gating or 
> pulse skipping.
> 
>>
>>> I think I'm just going to assume those chipsets are simply hw broken.
>>
>> If disabling CPU idle on these altogether stabilize them, then maybe that
>> is what we need to do?
> 
> Yes, please try booting with "nohlt" set on the kernel command line and 
> see how that fares.
> 
> Also useful would be to dump the L2 CTLR and L2 ECTLR, this is a 
> complete shot in the dark, though was initially wondering if there could 
> be some retention issues, and would have recommended disabling the L2 
> retention policy completely just for testing.
> 
> MRC p15, 1, <Rt>, c9, c0, 2;
> 
> of particular interest here would be bit at position 0, try to see if 
> changing it to 1 (3 cycles) or 0 (2 cycles) changes anything.
> 
> MRC p15, 1, <Rt>, c9, c0, 3;
> 
> the lower bits are reserved, so I would not necessarily expect them to 
> be mapping to configurable latencies, but if you see non-zero values in 
> bits [28:0], try changing them to 0 and see if that changes anything.
> 
> Thanks for your persistence!

Thankfully now we have MCPs and it did not take look to identify a lead 
that was actually documented into an internal bug tracker! Would you be 
able to test this branch:

https://github.com/ffainelli/linux/pull/new/rfc/bcm53573-counter-wa
-- 
Florian


